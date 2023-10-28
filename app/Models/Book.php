<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Book extends Model
{
    use HasFactory;

    /**
     * fillable
     *
     * @var array
     */
    protected $fillable = [
        'idbuku',
        'isbn',
        'judul',
        'year',
        'idkategori',
        'pengarang',
        'penerbit',
        'kota_terbit',
        'editor',
        'file_gambar',
        'tgl_insert',
        'tgl_update',
        'stok',
        'stok_tersedia'
    ];

    // protected $appends = ['file_gambar'];

    public function ratings()
    {
        return $this->hasMany(Rating::class);
    }

    public function comments()
    {
        return $this->hasMany(Comment::class);
    }

    // public function getImageUrlAttribute()
    // {
    //     return asset('storage/books/' . $this->file_gambar);
    // }
}

