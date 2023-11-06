import { NextResponse } from "next/server";

const PUBLIC_FILE = /\.(.*)$/;

export async function middleware(request) {
    let token = request.cookies.get("token")?.value;

    console.log(token, "ini token");

    const { pathname } = request.nextUrl;

    if (
        pathname.startsWith("/_next") ||
        pathname.startsWith("/api") ||
        pathname.startsWith("/static") ||
        PUBLIC_FILE.test(pathname)
    )
        return NextResponse.next();

    // if (!token) {
    //     const url = new URL(`/login`, request.url);
    //     return NextResponse.redirect(url);
    // }

    // if (!token &&
    //     pathname.startsWith("/app/feedback/[id]") ||
    //     pathname.startsWith("/app/riwayat")
    // ) {
    //     const url = new URL(`/login`, request.url);
    //     return NextResponse.redirect(url);
    // }

    if (!token &&
        pathname.startsWith("/app/feedback/[id]") || !token &&
        pathname.startsWith("/app/riwayat")
    ) {
        const url = new URL(`/login`, request.url);
        return NextResponse.redirect(url);
    }

    return NextResponse.next();
}

export const config = {
    matcher: ["/app/:path*"],
};
