<?php

namespace App\Models\Langs;

use Illuminate\Database\Eloquent\Model;

class HotelesIdioma extends Model
{
    //
    protected $table = 'hoteles_idioma';
    protected $primaryKey = 'idHoteleIdioma';
    protected $fillable = ['nombre', 'text', 'idHotel' , 'idioma', 'created_at' , 'updated_at' ];
}
