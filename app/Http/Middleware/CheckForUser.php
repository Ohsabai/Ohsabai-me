<?php

namespace App\Http\Middleware;

use Closure;

use Auth;

class CheckForUser
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next,$guard = 'web')
    {

        $user_obj = Auth::guard('web')->user();

        if (!empty($user_obj)){
            if (!$user_obj->hasRole('user')){ 
                return redirect('login');
            }
        }else{
            return redirect('login');
        }
        return $next($request);
    }
}
