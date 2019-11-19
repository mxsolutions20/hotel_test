<?php

/*
 * This file is part of jwt-auth.
 *
 * (c) Sean Tymon <tymon148@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace App\Http\Middleware;

use Tymon\JWTAuth\Exceptions\JWTException;
use Tymon\JWTAuth\Exceptions\TokenExpiredException;
use JWTAuth;
use Tymon\JWTAuth\Middleware\BaseMiddleware;

class ValidateToken extends BaseMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, \Closure $next)
    {
        if (! $token = $this->auth->setRequest($request)->getToken()) {
            return $this->respond('tymon.jwt.absent', 'token_not_provided', 400);
        }

        try {
            $parsed  = JWTAuth::getToken($token);
            $decoded = JWTAuth::decode($parsed); //JWT::decode($parsed, '5KME8RGDKLx77XOSqe9mofLVsbCtL7BF');
            //dd(json_decode( $decoded, true  ));

            //$expireDate = gmdate("Y-m-d\TH:i:s\Z", $decoded);
        } catch (TokenExpiredException $e) {
            $newToken = JWTAuth::refresh(JWTAuth::getToken($token));
            $response = array([ "response"=>false, "err"=>"token_expired", "new_token" => $newToken ]);
            return $this->respond('tymon.jwt.expired', $response, $e->getStatusCode(), [$e]);
            //return json_encode($response = array([ "response"=>true, "token" => $newToken ]));
        } catch (JWTException $e) {
            return $this->respond('tymon.jwt.invalid', 'token_invalid', $e->getStatusCode(), [$e]);
        }

        /*if (! $parsed) {
            return $this->respond('tymon.jwt.user_not_found', 'user_not_found___', 404, $parsed);
        }*/

        $this->events->fire('tymon.jwt.valid', $parsed);

        return $next($request);
    }
}