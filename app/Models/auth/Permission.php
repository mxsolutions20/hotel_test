<?php

namespace App\Models\auth;

use Illuminate\Database\Eloquent\Model;
use Zizaco\Entrust\EntrustPermission;

class Permission extends EntrustPermission
{
    protected $table = 'permissions';
    protected $primaryKey = 'id';
    protected $fillable = ['name','display_name','description','heredado'];
}
