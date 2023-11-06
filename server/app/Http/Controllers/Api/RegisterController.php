<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Member;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash;

class RegisterController extends Controller
{

    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request)
    {
        //define validation rules
        $validator = Validator::make($request->all(), [
            'noktp'=> 'required',
            'nama' => 'required',
            'email' => 'required|email|unique:members',
            'password' => 'required|min:6',
            'alamat' => 'required',
            'kota' => 'required',
            'no_telp' => 'required',
            'file_ktp' => 'required|file|mimes:jpeg,png,jpg,gif,svg,pdf|max:2048'
        ]);
        //check if validation fails
        if ($validator->fails()){
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
            'remember_token' => Str::random(60),
            'alamat' => $request->alamat,
            'kota' => $request->kota,
            'no_telp' => $request->no_telp,
            'file_ktp' => $file_ktp->hashName(),
        ]);

        //return response JSON user is created
        if($member) {
            return response()->json([
                'success' => true,
                'member'    => $member,  
            ], 201);
        }

        //return JSON process insert failed 
        return response()->json([
            'success' => false,
        ], 409);

    }
}
