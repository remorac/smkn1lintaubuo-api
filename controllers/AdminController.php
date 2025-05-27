<?php 

namespace api\controllers;

use yii\rest\ActiveController;

class AdminController extends ActiveController
{
    public $modelClass = 'api\models\Admin';

    public function actions()
    {
        $actions = parent::actions();
        unset($actions['index']);
        return $actions;
    }

    public function actionIndex()
    {
        $fields = ['Id_Admin', 'Nama', 'Email', 'Password'];
        $filter = new \yii\data\ActiveDataFilter([
            'searchModel' => (new \yii\base\DynamicModel($fields))
                ->addRule($fields, 'string')
        ]);

        $filterCondition = null;
        if ($filter->load(\Yii::$app->request->get())) { 
            $filterCondition = $filter->build();
            if ($filterCondition === false) {
                return $filter;
            }
        }

        $query = \api\models\Admin::find();
        if ($filterCondition !== null) {
            $query->andWhere($filterCondition);
        }

        return new \yii\data\ActiveDataProvider([
            'query' => $query,
        ]);
    }

    public function actionLogin()
    {
        $request = \Yii::$app->request;
        $email = $request->post('Email');
        $password = $request->post('Password');

        $model = \api\models\Admin::findOne(['Email' => $email, 'Password' => $password]);

        if ($model) {
            unset($model->Password);
            return $model;
        } else {
            throw new \yii\web\UnauthorizedHttpException('Invalid email or password');
        }
    }
}
