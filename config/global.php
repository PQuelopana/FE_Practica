<?php
//use Illuminate\Support\Facades\Lang as LangGlobal;
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//include '../resources/lang/es/validation.php';
//include '../resources/lang/es/auth.php';

$codeSuccess = 200;
$codeError = 400;
$codeNotFound = 404;

$dishValidator = [
    'name'                  => 'required',
    'description'           => 'required',
    'price'                 => 'required|numeric',
    'image'                 => 'required'
];

$orderValidator = [
    'total'                 => 'required|numeric'
];

$orderDetailValidator = [
    'dish_id'               => 'required|numeric',
    'quantity'              => 'required|numeric',
    'price'                 => 'required|numeric',
    'total_price'           => 'required|numeric'
];
        
return [
    'codeSuccess'           => $codeSuccess,
    'codeError'             => $codeError,
    'codeNotFound'          => $codeNotFound,
    'dataSuccessNoMessage'  => [
        'code'                  => $codeSuccess
    ],
    'dataSuccessMessage'    => [
        'code'                  => $codeSuccess,
        'message'               => ''
    ],
    'dataErrorValidate'     => [
        'code'                  => $codeError,
        'errors'                => ''
    ],
    'dataErrorRequest'      => [
        'code'                  => $codeError,
        'message'               => ''//trans('validation.requestFailed')
    ],
    'dataErrorAuth'         => [
        'code'                  => $codeError,
        'message'               => ''//trans['auth.failed']
    ],
    'dataErrorNotFound'     => [
        'code'                  => $codeNotFound,
        'message'               => ''
    ],
    'userstoreValidator'    => [
        'name'                  => 'required|alpha',
        'surname'               => 'required|alpha',
        'email'                 => 'required|email|unique:users',
        'password'              => 'required|is_alpha_num'
    ],
    'userupdateValidator'   => [
        'name'                  => 'required|alpha',
        'surname'               => 'required|alpha',
        'email'                 => 'required|email|unique:users,email,',
    ],
    'userloginValidator'    => [
        'email'                 => 'required|email',
        'password'              => 'required'
    ],
    'userpasswordrestoreValidator'  => [
        'password'                      => 'required|is_alpha_num',
        'restoration_code'              => 'required|numeric'
    ],
    'dishstoreValidator'            => $dishValidator,
    'dishupdateValidator'           => $dishValidator,
    'orderstoreValidator'           => $orderValidator,
    'orderupdateValidator'          => $orderValidator,
    'orderstoreDetailValidator'     => $orderDetailValidator,
    'orderupdateDetailValidator'    => $orderDetailValidator
    
];