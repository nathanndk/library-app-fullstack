"use client";

import React, { useState } from "react";
import axios from "axios";

// Import ikon panah dari pustaka ikon
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faArrowLeft } from "@fortawesome/free-solid-svg-icons";

export default function RegistrasiPage({ params }) {
  const [userData, setUserData] = useState({
    noktp: "",
    nama: "",
    email: "",
    password: "",
    alamat: "",
    kota: "",
    no_telp: "",
    file_ktp: null,
  });
  const [fileKTP, setFileKTP] = useState(null); // State untuk file KTP
  const [isRegistered, setIsRegistered] = useState(false);
  const [fileKTPUploaded, setFileKTPUploaded] = useState(false);

  const handleRegistration = async () => {
    try {

        
      const formData = new FormData();
      formData.append("noktp", userData.noktp);
      formData.append("nama", userData.nama);
      formData.append("email", userData.email);
      formData.append("password", userData.password);
      formData.append("alamat", userData.alamat);
      formData.append("kota", userData.kota);
      formData.append("no_telp", userData.no_telp);
      formData.append("file_ktp", fileKTP);

      const response = await axios.post("http://localhost:8000/api/register", formData, {
        headers: {
          "Content-Type": "multipart/form-data",
        },
      });

      if (response.data.success) {
        setIsRegistered(true);
        console.success("Akun telah terdaftar, selanjutnya akan diverifikasi oleh petugas");
      } else {
        console.error("Registrasi gagal");
      }
    //   if (response.status === 201) {
    //     setIsRegistered(true);
    //   } else {
    //     console.error("Registrasi gagal.");
    //   }
    } catch (error) {
      console.error("Kesalahan saat mengirim data pendaftaran:", error);
    }
  };

  const handleFileKTPChange = (e) => {
    const selectedFile = e.target.files[0];
    setFileKTP(selectedFile);
    setFileKTPUploaded(true);
  };

  return (
    <div className="container mx-auto p-10 h-[calc(100vh-64px)] flex items-center justify-center">
      <div className="bg-white p-10 rounded-lg flex flex-col">
        {/* <button onClick={() => window.history.back()} className="mt-4 text-left text-black">
          <FontAwesomeIcon icon={faArrowLeft} />
        </button> */}
        <div className="mt-4">
          <h2 className="text-2xl font-bold text-black mb-4">
            Registrasi Anggota
          </h2>
        </div>
        {isRegistered ? (
          <div className="bg-green-200 text-green-800 p-2 rounded-md">
            Akun telah terdaftar, selanjutnya akan diverifikasi oleh petugas
            <button onClick={() => window.history.back()} className="mt-4 text-left text-black">
              Kembali
            </button>
          </div>
        ) : (
          <form className="mt-2">
            <div className="mb-2">
              <label className="block text-gray-700">Nomor KTP:</label>
              <input
                type="number"
                style={{ color: "black" }}
                value={userData.noktp}
                onChange={(e) =>
                  setUserData({
                    ...userData,
                    noktp: e.target.value,
                  })
                }
                className="border p-2 rounded-md w-full"
              />
            </div>
            <div className="mb-4">
              <label className="block text-gray-700">Nama:</label>
              <input
                type="text"
                style={{ color: "black" }}
                value={userData.nama}
                onChange={(e) =>
                  setUserData({
                    ...userData,
                    nama: e.target.value,
                  })
                }
                className="border p-2 rounded-md w-full"
              />
            </div>
            <div className="mb-4">
              <label className="block text-gray-700">Email:</label>
              <input
                type="text"
                style={{ color: "black" }}
                value={userData.email}
                onChange={(e) =>
                  setUserData({
                    ...userData,
                    email: e.target.value,
                  })
                }
                className="border p-2 rounded-md w-full"
              />
            </div>
            <div className="mb-1">
              <label className="block text-gray-700">Password:</label>
              <input
                type="password"
                value={userData.password}
                style={{ color: "black" }}
                onChange={(e) =>
                  setUserData({
                    ...userData,
                    password: e.target.value,
                  })
                }
                className="border p-2 rounded-md w-full"
              />
            </div>
            <div className="mb-1">
              <label className="block text-gray-700">Alamat:</label>
              <input
                type="text"
                style={{ color: "black" }}
                value={userData.alamat}
                onChange={(e) =>
                  setUserData({
                    ...userData,
                    alamat: e.target.value,
                  })
                }
                className="border p-2 rounded-md w-full"
              />
            </div>
            <div className="mb-1">
              <label className="block text-gray-700">Kota:</label>
              <input
                type="text"
                style={{ color: "black" }}
                value={userData.kota}
                onChange={(e) =>
                  setUserData({
                    ...userData,
                    kota: e.target.value,
                  })
                }
                className="border p-2 rounded-md w-full"
              />
            </div>
            <div className="mb-1">
              <label className="block text-gray-700">Nomor HP:</label>
              <input
                type="text"
                style={{ color: "black" }}
                value={userData.no_telp}
                onChange={(e) =>
                  setUserData({
                    ...userData,
                    no_telp: e.target.value,
                  })
                }
                className="border p-2 rounded-md w-full"
              />
            </div>
            <div className="form-control w-full max-w-xs">
              <label className="label">
                <span className="label-text">Unggah KTP</span>
                <span className="label-text-alt"></span>
              </label>
              <input
                type="file"
                className="file-input file-input-bordered w-full max-w-xs"
                onChange={handleFileKTPChange}
              />
              <label className="label"></label>
            </div>
            {fileKTPUploaded && (
            <div className="text-green-500 mt-2">
                File KTP berhasil diunggah
            </div>
            )}
            <div>
            <p className="text-right mt-4 text-black text-xs">
                                Sudah punya akun?{" "}
                                <a href="/login" className="text-blue-500">
                                    Login
                                </a>
            </p>
            </div>
            <div className="text-right mt-1">
              <button onClick={handleRegistration} className="btn btn-primary">
                Submit
              </button>
            </div>
          </form>
        )}
      </div>
    </div>
  );
}
