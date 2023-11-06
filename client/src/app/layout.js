import { Inter } from "next/font/google";
import "./globals.css";
import Header from "@/components/header";
import Layout from "@/components/layout";

const inter = Inter({ subsets: ["latin"] });

export const metadata = {
    title: "samawa-library",
    description: "Aplikasi Perpustakaan SAMAWA",
};

export default function RootLayout({ children }) {
    return (
        <html lang="en" data-theme="light">
            <meta name="csrf-token" content="{{ csrf_token() }}"></meta>
            <body className={`gradient-background ${inter.className}`}>
                <Layout>{children}</Layout>
            </body>
        </html>
    );
}
