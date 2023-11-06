<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Transaction extends Model
{
    use HasFactory;
    /**
     * fillable
     *
     * @var array
     */
    protected $fillable = [
        'idtransaksi',
        'idbuku',
        'noktp',
        'tgl_pinjam',
        'idpetugas',
    ];
    public function noktp()
    {
        return $this->belongsTo(Member::class, 'noktp');
    }
    public function idpetugas()
    {
        return $this->belongsTo(Librarian::class, 'idpetugas');
    }
    public function details()
    {
        return $this->hasMany(Detail::class, 'idtransaksi');
    }
}