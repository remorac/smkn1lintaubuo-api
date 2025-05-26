<?php 

namespace api\controllers;

use yii\rest\ActiveController;

class KonsumenController extends ActiveController
{
    public $modelClass = 'api\models\Konsumen';

    public function actionLogin()
    {
        $request = \Yii::$app->request;
        $email = $request->post('Email');
        $password = $request->post('Password');

        $model = \api\models\Konsumen::findOne(['Email' => $email, 'Password' => $password]);

        if ($model) {
            unset($model->Password);
            return $model;
        } else {
            throw new \yii\web\UnauthorizedHttpException('Invalid email or password');
        }
    }
}
