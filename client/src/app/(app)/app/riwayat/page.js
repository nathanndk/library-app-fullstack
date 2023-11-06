"use client";

import React, { useState, useEffect } from "react";
import axios from "axios";
import Cookies from "js-cookie";

export default function Page({ status }) {
    const [transactions, setTransactions] = useState([]);
    const [overdue, setOverdue] = useState([]);
    const [ongoing, setOngoing] = useState([]);
    const [completed, setCompleted] = useState([]);
    const [initialBooks, setInitialBooks] = useState([]);
    const [selectedCategory, setSelectedCategory] = useState("all"); // Inisialisasi dengan "all" sebagai kategori default
    const data = Cookies.get("data");
    const parsedData = JSON.parse(data);

    const getTransactionsData = async () => {
        try {
            const res = await axios.get("http://localhost:8000/api/riwayat");

            if (res) {
                setTransactions(res.data.data);
            }
        } catch (error) {
            console.error("Error fetching transactions data:", error);
        }
    };


    const getBooksData = async () => {
        try {
            const res = await axios.get("http://localhost:8000/api/daftar");

            if (res.data.success) {
                setInitialBooks(res.data.data);
            }
        } catch (error) {
            console.error("Error fetching books data:", error);
        }
    };

    const filterHistory = (transactions) => {
        const completedData = transactions?.filter(
            (transaction) =>
                !cekKeterlambatan(
                    new Date(transaction.tgl_pinjam),
                    new Date(transaction.tgl_kembali)
                ) && transaction.tgl_kembali !== null
        );
        const now = new Date();
        const ongoingData = transactions?.filter(
            (transaction) => new Date(transaction.tgl_kembali) >= now 
            || transaction.tgl_kembali === null
        );

        const overdueData = transactions?.filter((transaction) =>
            cekKeterlambatan(
                new Date(transaction.tgl_pinjam),
                new Date(transaction.tgl_kembali)
            )
        );


        setCompleted(completedData)
        setOngoing(ongoingData)
        setOverdue(overdueData)
    };


    const calculateFine = (transaction) => {
        const currentDate = new Date();
        const dueDate = new Date(transaction.tgl_pinjam);
        if (currentDate > dueDate) {
            const timeDiff = Math.abs(currentDate - dueDate);
            const daysOverdue = Math.ceil(timeDiff / (1000 * 60 * 60 * 24));
            const finePerDay = 1000; // Biaya denda per hari (sesuaikan)
            return daysOverdue * finePerDay;
        }
        return 0;
    };

    // Fungsi untuk mengubah kategori yang dipilih
    const handleCategoryChange = (e) => {
        setSelectedCategory(e.target.value);
    };

    const getBookTitle = (bookId) => {
        const book = initialBooks.find((book) => book.idbuku === bookId);
        return book ? book.judul : "Buku Tidak Ditemukan";
    };


    useEffect(() => {
        getTransactionsData();
        getBooksData();
    }, []);

    useEffect(() => {
      filterHistory(transactions);

    }, [transactions])

    function cekKeterlambatan(tanggalDipinjam, tanggalKembali) {
        var tanggalPinjam = new Date(tanggalDipinjam);
        var tanggalKembali = new Date(tanggalKembali);

        var selisihHari =
            (tanggalKembali - tanggalPinjam) / (1000 * 60 * 60 * 24);

        if (selisihHari > 2) {
            return true;
        } else {
            return false;
        }
    }

    function cekOngoing(tanggalKembali) {
        if (tanggalKembali === null) {
            return true;
        } else {
            return false;
        }
    }

    return (
        <div className="container mx-auto p-4">
            <h1 className="text-3xl font-bold">
                Selamat datang di Perpustakaan
            </h1>
            <h2 className="text-2xl font-semibold mt-4 mb-2">
                Riwayat Transaksi
            </h2>

            {/* Dropdown untuk memilih kategori transaksi */}
            <div className="mb-4">
                <label className="text-white font-semibold">
                    Pilih Kategori:
                </label>
                <select
                    value={selectedCategory}
                    onChange={handleCategoryChange}
                    className="border p-2 rounded-md"
                    style={{ color: "black" }}
                >
                    <option value="all">Semua Transaksi</option>
                    <option value="completed">Sudah Selesai</option>
                    <option value="ongoing">Masih Dipinjam</option>
                    <option value="overdue">
                        Belum Dikembalikan (Melebihi Tanggal Kembali)
                    </option>
                </select>
            </div>

            {/* Tabel untuk menampilkan transaksi sesuai kategori */}
            {/* Tabel untuk menampilkan transaksi sesuai kategori */}
            <table className="w-full border border-collapse">
                <thead>
                    <tr className="bg-black text-white">
                        <th className="p-2 border">Judul Buku</th>
                        <th className="p-2 border">Tanggal Peminjaman</th>
                        <th className="p-2 border">Tanggal Pengembalian</th>
                        {selectedCategory === "overdue" && (
                            <th className="p-2 border">Denda</th>
                        )}
                    </tr>
                </thead>
                <tbody>
                    
                          {selectedCategory === 'completed' && completed.map((transaction) => <tr key={transaction.idbuku} className="bg-white">
                                  <td className="p-2 border text-black">
                                      {transaction.judul}
                                  </td>
                                  <td className="p-2 border text-black">
                                      {transaction.tgl_pinjam}
                                  </td>
                                  <td className="p-2 border text-black">
                                      {transaction.tgl_kembali}
                                  </td>
                                  {history === "overdue" && (
                                      <td className="p-2 border text-black">
                                          {calculateFine(transaction)} IDR
                                      </td>
                                  )}
                              </tr>)}
                          {selectedCategory === 'ongoing' && ongoing.map((transaction) => <tr key={transaction.idbuku} className="bg-white">
                                  <td className="p-2 border text-black">
                                      {transaction.judul}
                                  </td>
                                  <td className="p-2 border text-black">
                                      {transaction.tgl_pinjam}
                                  </td>
                                  <td className="p-2 border text-black">
                                      {transaction.tgl_kembali}
                                  </td>
                                  {history === "overdue" && (
                                      <td className="p-2 border text-black">
                                          {calculateFine(transaction)} IDR
                                      </td>
                                  )}
                              </tr>)}
                          {selectedCategory === 'overdue' && overdue.map((transaction) => <tr key={transaction.idbuku} className="bg-white">
                                  <td className="p-2 border text-black">
                                      {transaction.judul}
                                  </td>
                                  <td className="p-2 border text-black">
                                      {transaction.tgl_pinjam}
                                  </td>
                                  <td className="p-2 border text-black">
                                      {transaction.tgl_kembali}
                                  </td>
                                      <td className="p-2 border text-black">
                                          {calculateFine(transaction)} IDR
                                      </td>
                              </tr>)}
                          {selectedCategory === 'all' && transactions.map((transaction) => <tr key={transaction.idbuku} className="bg-white">
                                  <td className="p-2 border text-black">
                                      {transaction.judul}   
                                  </td>
                                  <td className="p-2 border text-black">
                                      {transaction.tgl_pinjam}
                                  </td>
                                  <td className="p-2 border text-black">
                                      {transaction.tgl_kembali}
                                  </td>
                                  {history === "overdue" && (
                                      <td className="p-2 border text-black">
                                          {calculateFine(transaction)} IDR
                                      </td>
                                  )}
                              </tr>)}
                </tbody>
            </table>
        </div>
    );
}
