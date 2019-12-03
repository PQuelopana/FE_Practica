<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Establishment As ObjectModel;

class EstablishmentController extends Controller{
    
    public $object_s;
    public $object_p;
    public $objectName;
    public $objectNameArr;
    
    public function __construct() {
        $this->object_s = 'establishment';
        $this->object_p = 'establishments';
        $this->objectName = trans('objects.'.$this->object_s);
        $this->objectNameArr = ['object' => $this->objectName];
    }
    
    public function index(){
        return $this->indexController(new ObjectModel(), $this->object_p);
    }
    
}
