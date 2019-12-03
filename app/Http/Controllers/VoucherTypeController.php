<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\VoucherType As ObjectModel;

class VoucherTypeController extends Controller{
    
    public $object_s;
    public $object_p;
    public $objectName;
    public $objectNameArr;
    
    public function __construct() {
        $this->object_s = 'vouchertype';
        $this->object_p = 'vouchertypes';
        $this->objectName = trans('objects.'.$this->object_s);
        $this->objectNameArr = ['object' => $this->objectName];
    }
    
    public function index(){
        return $this->indexController(new ObjectModel(), $this->object_p);
    }
    
}
