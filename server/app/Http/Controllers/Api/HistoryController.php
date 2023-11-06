<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Transaction;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon;

class HistoryController extends Controller
{
    public function index(Request $request)
    {
        // Mendapatkan nomor KTP (noktp) dari request
        $noktp = $request->input('noktp');

        // Filter berdasarkan status buku (dipinjam, selesai, lewat tanggal kembali)
        $status = $request->input('status'); // Ini harus dikirim sebagai parameter pada request

        echo $status;

        $ldate = date('Y-m-d H:i:s');

        $history = Transaction::leftJoin('details', 'transactions.idtransaksi', '=', 'details.idtransaksi')
            ->leftJoin('books', 'details.idbuku', '=', 'books.idbuku')
            ->get();

        if($status == 'all'){
            $history->all();
        } elseif ($status == 'ongoing') {
            $history->whereNull('details.tgl_kembali')->all();
        } elseif ($status === 'completed') {
            $history->whereNotNull('details.tgl_kembali')
                ->where('details.tgl_kembali', '<',  $ldate)->all();
        } elseif ($status == 'overdue') {
            $history->whereNotNull('details.tgl_kembali', '>', $ldate)
                ->whereNotNull('details.denda')->all();
        }

        // $history = $history->all();

        // return collection of history as a resource
        return response()->json([
            'success' => true,
            'message' => 'data Buku ditemukan',
            'data' => $history
        ]);

    }

}