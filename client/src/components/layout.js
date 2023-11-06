"use client";

import React from "react";
import Header from "./header";
import { usePathname } from "next/navigation";

export default function Layout({ children }) {
  const pathname = usePathname();

  const checkLoginPathname = () => {
    if (pathname === "/login" || pathname === "/registrasi") return false;
    else return true;
  };

  return (
    <div className="min-h-screen">
      {checkLoginPathname() && <Header />}
      {children}
    </div>
  );
}
