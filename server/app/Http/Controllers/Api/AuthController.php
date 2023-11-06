<?php
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Member;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'noktp' => 'required',
            'nama' => 'required',
            'email' => 'required|email|unique:members',
            'password' => 'required|min:6',
            'alamat' => 'required',
            'kota' => 'required',
            'no_telp' => 'required',
            'file_ktp' => 'required|file|mimes:jpeg,png,jpg,gif,svg,pdf|max:2048'
        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }
        //upload ktp
        $file_ktp = $request->file('file_ktp');
        $file_ktp->storeAs('public/members', $file_ktp->hashName());

        //Buat anggota baru
        $member = Member::create([
            'noktp' => $request->noktp,
            'nama' => $request->nama,
            'email' => $request->email,
            'password' => Hash::make($request['password']),
            'alamat' => $request->alamat,
            'kota' => $request->kota,
            'no_telp' => $request->no_telp,
            'file_ktp' => $file_ktp->hashName(),
        ]);
        $token = $member->createToken('auth_token')->plainTextToken;
        return response()->json([
            'data' => $member,
            'access_token' => $token,
            'token_type' => 'Bearer'
        ]);
    }
    public function login(Request $request)
    {
        if (!Auth::attempt($request->only('email', 'password'))) {
            return response()->json([
                'message' => 'Invalid login details'
            ], 401);
        }

        $member = Member::where('email', $request->email)->firstOrFail();
        $token = $member->createToken('auth_token')->plainTextToken;

        return response()->json([
            'message' => 'Login success',
            'access_token' => $token,
            'token_type' => 'Bearer',
            'data' => $member
        ]);
    }
    public function logout()
    {
        Auth::member()->tokens()->delete();
        return response()->json([
            'message' => 'logout success'
        ]);
    }

    // public function userinfo()
    // {
    //     $member = Member::all();
    //     return response()->json([
    //         'success' => true,
    //         'message' => 'List Semua Data Anggota',
    //         'data' => $member
    //     ], 200);
    // }
    // /**
    //  * show
    //  *
    //  * @param  mixed $token
    //  * @return void
    //  */
    // public function showuser(Member $token)
    // {
    //     $member = Member::find($id);
    //     return response()->json([
    //         'success' => true,
    //         'message' => 'Detail Data Anggota',
    //         'data' => $member
    //     ], 200);
    // }
    // {
    //     // Mengambil buku berserta rating dan komentar terkait
    //     $ = $book->with('ratings', 'comments')->first();

    //     if (!$booksrating) {
    //         return response()->json(['message' => 'Data Buku tidak ditemukan'], 404);
    //     }

    //     // Mengembalikan respons JSON
    //     return response()->json([
    //         'success' => true,
    //         'message' => 'data Buku ditemukan',
    //         'data' => $booksrating
    //     ]);
    // }
}