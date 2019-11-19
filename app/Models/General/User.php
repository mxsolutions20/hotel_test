<?php

namespace App\Models\General;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;


class User extends Authenticatable
{
    use Notifiable;

    protected $table = 'usuarios';
    protected $primaryKey = 'idUsuario';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'usuario', 'clave', 'nombre', 'apellidoP', 'apellidoM', 'telefono', 'idRol', 'idArea', 'fcm', 'socket', 'token', 'estatus'
        , 'linkVerifica' , 'verificado' , 'linkRecupera' , 'solRecupera' , 'fechaRecupera' , 'usr_baja'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public function rol(){
        return $this->belongsTo('App\Models\General\Rol_usuario','idRol');
    }

    public function role(){
        //return $this->hasOne('App\Models\General\role_user','user_id','idUsuario');
        return $this->hasMany('App\Models\General\role_user','user_id','idUsuario');
    }
}
