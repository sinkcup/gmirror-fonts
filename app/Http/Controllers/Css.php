<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;

class Css extends Controller
{
    public function show(Request $request)
    {
        $uri = str_replace($request->root(), 'http://fonts.lug.ustc.edu.cn/', $request->fullUrl());
        if (\Cache::has('css')) {
            $content = \Cache::get('css');
        } else {
            $originalContent = file_get_contents($uri);
            $content = str_replace('https://fonts-gstatic.lug.ustc.edu.cn/', 'http://fonts-gstatic-com.gmirror.org/', $originalContent);
            \Cache::put('css', $content, 1440);
        }
        return response($content)->header('Content-Type', 'text/css')->header('Cache-Control', 'public, max-age=86400');
    }
}
