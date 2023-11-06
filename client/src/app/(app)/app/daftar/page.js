"use client";

// clientComponent.js
import { useRouter } from "next/navigation";
import Image from "next/image";
import { useEffect, useState } from "react";
import axios from "axios";

export default function Page() {
    const [initialBooks, setInitialBooks] = useState([]);
    const [books, setBooks] = useState([]);
    const [searchTerm, setSearchTerm] = useState("");
    const [searchCategory, setSearchCategory] = useState("judul");
    const router = useRouter();

    const getData = async () => {
        const res = await axios.get(`http://localhost:8000/api/daftar`);

        if (res.data) {
            setBooks(res.data.data);
            setInitialBooks(res.data.data);
        }
    };

    useEffect(() => {
        getData();
    }, []);

    console.log(books);

    const handleSearch = (e) => {
        const term = e.target.value;
        setSearchTerm(term);
        filterBooks(searchCategory, term);
    };

    const handleCategoryChange = (e) => {
        const category = e.target.value;
        setSearchCategory(category);
        filterBooks(category, searchTerm);
    };

    const filterBooks = (category, term) => {
        const filteredBooks = initialBooks?.filter((book) =>
            book[category].toString().toLowerCase().includes(term.toLowerCase())
        );
        setBooks(filteredBooks);
    };

    useEffect(() => {
        filterBooks(searchCategory, searchTerm);
    }, [searchCategory, searchTerm]);

    const categoryOptions = [
        { value: "judul", label: "Title" },
        { value: "pengarang", label: "Author" },
        { value: "penerbit", label: "Publisher" },
        { value: "year", label: "Year" },
        { value: "isbn", label: "ISBN" },
        { value: "nama_kategori", label: "Category" },
    ];

    return (
        <div className="container mx-auto p-4">
            <h1 className="text-3xl font-bold mb-4">Book List</h1>
            <input
                type="text"
                placeholder={`Search by ${searchCategory}`}
                value={searchTerm}
                onChange={handleSearch}
                className="border p-2 rounded-md w-full mb-4 text-black"
            />
            <select
                value={searchCategory}
                onChange={handleCategoryChange}
                className="border p-2 rounded-md mb-4 text-black"
            >
                {categoryOptions.map((category) => (
                    <option key={category.value} value={category.value}>
                        {category.label}
                    </option>
                ))}
            </select>

            <div className="flex flex-wrap justify-center m-2 text-black">
                {books &&
                    books?.map((book) => (
                        <div
                            key={book.id}
                            onClick={() =>
                                router.push("/app/detail/" + book.id)
                            }
                            className="card w-1/2 p-2 mb-10 mt-10 bg-white ml-11 h-[700px] rounded-md shadow-md cursor-pointer"
                            
                            style={{ width: "500px" }}
                        >
                            <h2 className="text-3xl font-bold text-center">
                                {book.judul}
                            </h2>

                            <Image
                                src={`http://localhost:8000/storage/books/${book.file_gambar}`}
                                alt={book.judul}
                                style={{ height: "400px", width: "300px" }}
                                className="mx-auto"
                                width={300}
                                height={400}
                            />

                            <div className="mt-10 ml-5">
                                <p className="mb-2 font-semibold">
                                    Author : {book.pengarang}
                                </p>
                                <p className="mb-2 font-semibold">
                                    Year : {book.year}
                                </p>
                                <p className="mb-2 font-semibold">
                                    Publisher : {book.penerbit}
                                </p>
                                <p className="mb-2 font-semibold">
                                    ISBN : {book.isbn}
                                </p>
                                <p className="mb-2 font-semibold">
                                    Category : {book.nama_kategori}
                                </p>
                            </div>
                        </div>
                    ))}
            </div>
        </div>
    );
}
