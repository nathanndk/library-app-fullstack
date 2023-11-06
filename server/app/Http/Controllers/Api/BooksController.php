<?php

namespace App\Http\Controllers\Api;

use App\Models\Book;
use App\Http\Resources\BookResource;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class BooksController extends Controller
{
    /**
     * index
     * 
     * @return void
     */
    public function index()
    {
        // Mendapatkan daftar buku
        $books = Book::join('categories', 'books.idkategori', '=', 'categories.idkategori')
            ->select('books.*', 'categories.nama as nama_kategori')
            ->get();


        // Mengembalikan respons JSON
        return response()->json([
            'success' => true,
            'message' => 'List data Buku',
            'data' => $books,
        ]);
    }



    /**
     * show
     *
     * @param  mixed $idbuku
     * @return void
     */
    public function show($idbuku)
    {
        // Mengambil buku berserta rating dan komentar terkait
        $booksrating = Book::join('categories', 'books.idkategori', '=', 'categories.idkategori')
            ->select('books.*', 'categories.nama as nama_kategori')
            ->with('ratings', 'comments')
            ->find($idbuku);
        //$booksrating = Book::with('ratings', 'comments')->find($idbuku);

        if (!$booksrating) {
            return response()->json(['message' => 'Data Buku tidak ditemukan'], 404);
        }

        // Mengembalikan respons JSON
        return response()->json([
            'success' => true,
            'message' => 'data Buku ditemukan',
            'data' => $booksrating
        ]);
    }


    /**
     * store
     * 
     * @param mixed $request
     * @return void
     */
    public function store(Request $request)
    {
        //define validation rules
        $validator = Validator::make($request->all(), [
            'idbuku' => 'required',
            'isbn' => 'required',
            'judul' => 'required',
            'idkategori' => 'required',
            'pengarang' => 'required',
            'penerbit' => 'required',
            'kota_terbit' => 'required',
            'editor' => 'required',
            'file_gambar' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'stok' => 'required',
            'stok_tersedia' => 'required'
        ]);
        //check if validation fails
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        //upload image
        $file_gambar = $request->file('file_gambar');
        $file_gambar->storeAs('public/books', $file_gambar->hashName());

        //create book
        $book = Book::create([
            'idbuku' => $request->idbuku,
            'isbn' => $request->isbn,
            'judul' => $request->judul,
            'year' => $request->year,
            'idkategori' => $request->idkategori,
            'pengarang' => $request->pengarang,
            'penerbit' => $request->penerbit,
            'kota_terbit' => $request->kota_terbit,
            'editor' => $request->editor,
            'file_gambar' => $file_gambar->hashName(),
            'stok' => $request->stok,
            'stok_tersedia' => $request->stok_tersedia
        ]);

        //return response
        return response()->json([
            'success' => true,
            'message' => 'Data buku berhasil ditambahkan',
            'data' => $book
        ]);
    }
}
