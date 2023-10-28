<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Transaction;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


class HistoryController extends Controller
{
    public function index(Request $request)
    {
        // Mendapatkan nomor KTP (noktp) dari request
        $noktp = $request->input('noktp');

        // Lakukan join antara tabel transactions dan transaction_details
        $history = DB::table('transactions')
            ->join('details', 'transactions.idtransaksi', '=', 'details.idtransaksi')
            ->join('books', 'details.idbuku', '=', 'books.idbuku')
            ->select('books.judul', 'transactions.tgl_pinjam', 'details.tgl_kembali')
            ->where('transactions.noktp', $noktp);

        // Filter berdasarkan status buku (dipinjam, selesai, lewat tanggal kembali)
        $status = $request->input('status'); // Ini harus dikirim sebagai parameter pada request

        if ($status === 'dipinjam') {
            $history->whereNull('details.tgl_kembali');
        } elseif ($status === 'selesai') {
            $history->whereNotNull('details.tgl_kembali');
        } elseif ($status === 'lewat_tgl_kembali') {
            $history->where('details.tgl_kembali', '<', now());
        }

        $history = $history->paginate(5);

        // return collection of history as a resource
        return response()->json([
            'success' => true,
            'message' => 'data Buku ditemukan',
            'data' => $history
        ]);
    }
}