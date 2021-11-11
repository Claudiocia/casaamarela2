<?php

namespace App\Providers;

use App\Models\User;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        // 'App\Models\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        Gate::define('unico', function ($user){
           return $user->role == User::ROLE_ADMIN;
        });

        Gate::define('admin', function ($user){
            return $user->role == User::ROLE_ADMIN || $user->role == User::ROLE_STAFF;
        });

        Gate::define('redat', function ($user){
            return $user->role == User::ROLE_REDAT || $user->role == User::ROLE_ADMIN || $user->role == User::ROLE_STAFF;
        });

        Gate::define('client', function ($user){
            return $user->role == User::ROLE_CLIENTE || $user->role == User::ROLE_REDAT || $user->role == User::ROLE_ADMIN || $user->role == User::ROLE_STAFF;
        });
    }
}
