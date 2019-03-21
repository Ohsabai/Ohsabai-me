<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class RedirectIfAuthenticated
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @param  string|null  $guard
     * @return mixed
     */

    public function handle($request, Closure $next, $guard = null)
    {
        switch ($guard) {
            case 'admin':
                if(Auth::guard($guard)->check()){
                    return redirect()->route('admin.dashboard');
                }
                break;
                
            default:
                if (Auth::guard($guard)->check()) {
                    
                    $user_obj = Auth::guard($guard)->user();

                    if($user_obj->hasRole('therapist')){
                        return redirect('therapist/dashboard');    
                    }elseif($user_obj->hasRole('user')){
                        return redirect('user/dashboard');
                    }else{
                        return redirect('/');
                    }
                }
                break;
        }
        return $next($request);
    }

}
