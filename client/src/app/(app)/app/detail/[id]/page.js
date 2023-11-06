"use client";

import { useEffect, useState } from "react";
import Image from "next/image"; 
import { useRouter } from "next/navigation";
import axios from "axios";

export default function DetailBooks({ params }) {
    const [initialBooks, setInitialBooks] = useState([]);
    const [book, setBook] = useState([]);
    const router = useRouter();

    const filteredBooks = initialBooks.filter(
        (book) => book.id === Number(params.id)
    );

    useEffect(() => {
        const fetchData = async () => {
            try {
                const response = await axios.get(
                    `http://localhost:8000/api/detail/${params.id}`
                );

                if (response.data.success) {
                    setBook(response.data.data);
                } else {
                    console.error("Data not found");
                }
            } catch (error) {
                console.error("Error fetching data:", error);
            }
        };

        fetchData();
    }, [params.id]);

    const handleRatingChange = (e) => {
        setRating(parseInt(e.target.value, 10));
    };

    const handleCommentChange = (e) => {
        setComment(e.target.value);
    };

    const [rating, setRating] = useState(1);
    const [comment, setComment] = useState("");

    function convertRatingToEmoji(rating) {
        switch (rating) {
            case 1:
                return "⭐";
            case 2:
                return "⭐⭐";
            case 3:
                return "⭐⭐⭐";
            case 4:
                return "⭐⭐⭐⭐";
            case 5:
                return "⭐⭐⭐⭐⭐";
            default:
                return "Belum Ada Review";
        }
    }

    return (
        <div className="hero min-h-screen bg-base-200">
            <div className="hero-content flex-col lg:flex-row text-black">
                {/* <img
                    src={`http://localhost:8000/storage/books/${book.file_gambar}`}
                    className="max-w-sm rounded-lg shadow-2xl ml-4"
                /> */}
                <Image
                    src={`http://localhost:8000/storage/books/${book.file_gambar}`}
                    alt={book.judul}
                    style={{ height: "400px", width: "300px" }}
                    className="mx-auto"
                    width={300}
                    height={400}
                />
                {/* <img
                    src={`http://localhost:8000/storage/app/public/books/${book.file_gambar}`}
                    alt={book.judul}
                    style={{ height: "400px", width: "300px" }}
                    className="mx-auto"
                    width={300}
                    height={400}
                /> */}
                <div />
                <div>
                    <h1 className="text-5xl font-bold py-6">{book.judul}</h1>
                    <p className="py-2">
                        Rating:{" "}
                        {convertRatingToEmoji(book?.ratings?.[0]?.skor_rating)}
                    </p>
                    <hr />
                    <br />
                    <p className="py-2">Written by {book.pengarang}</p>
                    <p className="py-2">Made in {book.year}</p>
                    <p className="py-2">Published by {book.penerbit}</p>
                    <p className="py-2">ISBN {book.isbn}</p>
                    <p className="py-2">category {book.nama_kategori}</p>
                    <br />
                    <h2 className="font-bold">Reviews</h2>
                    {book?.comments?.map((comment) => (
                        <p key={comment.id} className="py-2">
                            {comment.komentar}
                        </p>
                    ))}
                    <div className="text-right">
                        <button
                            onClick={() =>
                                router.push(`/app/feedback/${book.id}`)
                            }
                            className="btn btn-primary"
                        >
                            Leave a review?
                        </button>
                    </div>
                </div>
            </div>
        </div>
    );
}
