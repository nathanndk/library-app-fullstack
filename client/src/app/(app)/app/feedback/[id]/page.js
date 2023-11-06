"use client";

import React, { useState } from "react";
import axios from "axios";
import { useRouter } from "next/navigation";
import Cookies from "js-cookie";

export default function Page({ params }) {
    const [rating, setRating] = useState("");
    const [comment, setComment] = useState("");
    const router = useRouter();
    const data = Cookies.get("data");
    const parsedData = JSON.parse(data);

    console.log(JSON.parse(data), "ini data");

    const ktp = parsedData.noktp;

    const handleRatingChange = (e) => {
        setRating(e.target.value);
    };

    const handleCommentChange = (e) => {
        setComment(e.target.value);
    };

    const handleFeedbackSubmit = async (e) => {
        e.preventDefault();

        const bookId = params.id;

        await axios
            .post(`http://localhost:8000/api/feedback/${bookId}`, {
                noktp: ktp,
                skor_rating: rating,
                komentar: comment,
                book_id: bookId,
            })
            .then((response) => {
                console.log("Feedback submitted successfully", response);
            })
            .catch((error) => {
                console.error("Error submitting feedback:", error);
            });

        router.push(`/app/detail/${params.id}`);
    };

    return (
        <div className="flex justify-center items-center h-screen">
            <div className="card w-96 shadow-xl text-center p-10 bg-white">
                <form onSubmit={handleFeedbackSubmit}>
                    <div className="py-2 text-black mb-3">
                        <h1 className="text-5xl font-bold py-6">Rate me</h1>
                        <label htmlFor="rating">Rating:</label>
                        <div className="ml-2">
                            <select
                                id="rating"
                                value={rating}
                                onChange={handleRatingChange}
                                className="select select-bordered"
                            >
                                <option value="">-- Pilih Rating --</option>
                                <option value="1">⭐</option>
                                <option value="2">⭐⭐</option>
                                <option value="3">⭐⭐⭐</option>
                                <option value="4">⭐⭐⭐⭐</option>
                                <option value="5">⭐⭐⭐⭐⭐</option>
                            </select>
                        </div>
                    </div>
                    <div className="py-2 text-black">
                        <label htmlFor="comment">Comment:</label>
                        <div className="ml-2">
                            <input
                                type="text"
                                id="comment"
                                value={comment}
                                onChange={handleCommentChange}
                                placeholder="Add your comments"
                                className="input input-bordered"
                            />
                        </div>
                    </div>
                    <div className="text-right mt-10">
                        <button type="submit" className="btn btn-primary ml-2">
                            Submit
                        </button>
                    </div>
                </form>
            </div>
        </div>
    );
}
