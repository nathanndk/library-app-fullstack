"use client";
import { useState } from "react";
import { useRouter } from "next/navigation";
import Cookies from "js-cookie";
import axios from "axios";
import Link from "next/link";

function LoginPage() {
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");
    const router = useRouter();
    const token = Cookies.get("access_token");

    const [loginError, setLoginError] = useState("");
    const [isError, setIsError] = useState(false);

    if (token) router.push("/app/daftar");

    const handleLogin = async (e) => {
        e.preventDefault(); // Prevent default form submission

        if (!email || !password) {
            setLoginError("Email dan Password harus diisi");
            setIsError(true);
            return;
        }

        try {
            const res = await axios.post(`http://localhost:8000/api/login`, {
                email,
                password,
            });

            if (res.data.access_token) {
                Cookies.set("token", res.data.access_token);
                Cookies.set("data", JSON.stringify(res.data.data));
                router.push("/app/daftar");
            } else {
                setLoginError("Username atau Password salah");
                setIsError(true);
            }
        } catch (error) {
            console.error("Error fetching data:", error);
            setLoginError("Username atau Password salah");
            setIsError(true);
        }
    };

    return (
        <div className="container mx-auto p-10 h-[calc(100vh-64px)] flex items-center justify-center">
            <div className="flex flex-col">
                <div className="bg-white p-10 rounded-lg">
                    <h2 className="text-2xl font-bold text-black mb-4">
                        Log In
                    </h2>
                    <form>
                        <div className="mb-4">
                            <label className="block text-gray-700">
                                Email:
                            </label>
                            <input
                                type="text"
                                value={email}
                                onChange={(e) => setEmail(e.target.value)}
                                required
                                className="border p-2 rounded-md w-full"
                                style={{ color: "black" }}
                            />
                        </div>

                        <div className="mb-4">
                            <label className="block text-gray-700">
                                Password:
                            </label>
                            <input
                                type="password"
                                value={password}
                                onChange={(e) => setPassword(e.target.value)}
                                required
                                className="border p-2 rounded-md w-full"
                                style={{ color: "black" }}
                            />
                        </div>

                        <div>
                            <p className="text-right mt-4 text-black text-xs">
                                Belum punya akun?{" "}
                                <a href="/registrasi" className="text-blue-500">
                                    Registrasi Akun
                                </a>
                            </p>
                            <div>
                            <p className="text-right mt-4 text-black text-xs">
                                    Bukan member? Silahkan lihat daftar buku{" "}
                                    <a className="text-blue-500">
                                        <Link href="/app/daftar">di sini</Link>
                                    </a>
                                </p>
                            </div>
                            {isError && (
                                <p className="text-red-500 text-sm">
                                    {loginError}
                                </p>
                            )}
                            <div className="text-right">
                                <button
                                    type="submit"
                                    onClick={handleLogin}
                                    className="btn btn-primary mt-4"
                                >
                                    Log In
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    );
}

export default LoginPage;
