<?php

namespace App\Models\auth;

use Illuminate\Database\Eloquent\Model;
use Zizaco\Entrust\EntrustRole;

class Role extends EntrustRole
{
    protected $table = 'roles';
    protected $primaryKey = 'id';
    protected $fillable = ['name','display_name','description'];

    public function usersrole(){
        return $this->hasMany('App\Models\auth\role_user','role_id');
    }

}
