<?php

namespace App\Models\auth;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Zizaco\Entrust\Traits\EntrustUserTrait;

class User extends Authenticatable
{
    use Notifiable;
    use EntrustUserTrait; // add this trait to your user model

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'user', 'password', 'estatus', 'img', 'linkVerifica', 'verificado', 'linkRecupera', 'solRecupera', 'fechaRecupera', 'usr_baja',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public function role(){
        //return $this->hasOne('App\role_user','user_id','idUsuario');
        return $this->hasMany('App\Models\auth\role_user','user_id','id');
    }

    public function fcm(){
        return $this->hasMany('App\Models\auth\UserFcm','idUser','id');
    }

    public function scopeIsRole($query, $role) {
        return $query->whereHas(
            'roles', function($query) use ($role){
            $query->where('name', $role);
        }
        );
    }

    public static function hasRoleUser($user_id, $role){
        $resp = false;
        $user = User::with(['role','role.role_rel'])->where('id', $user_id)->first();
        if($user==null){
            return $resp;
        }else{
            foreach ($user->role as $roles){
                if(trim($roles->role_rel->display_name) == trim($role) ){
                    return true;
                }
            }
        }
        return $resp;

    }

}
