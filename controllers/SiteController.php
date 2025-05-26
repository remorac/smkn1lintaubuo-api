<?php

namespace api\controllers;

use Yii;
use yii\web\Controller;

class SiteController extends Controller
{
    public function actionIndex()
    {
        return '';
    }

    public function actionInfo()
    {
        Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        return [
            'status'  => 200,
            'message' => '',
            'data'    => [
                'name'          => 'api',
                'version'       => '0.1',
            ],
        ];
    }
}

