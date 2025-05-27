<?php 

namespace api\controllers;

use yii\rest\ActiveController;

class DriverController extends ActiveController
{
    public $modelClass = 'api\models\Driver';

    public function actions()
    {
        $actions = parent::actions();
        unset($actions['index']);
        return $actions;
    }

    public function actionIndex()
    {
        $fields = ['Id_Driver', 'Nama', 'Kendaraan', 'No_HP'];
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

        $query = \api\models\Driver::find();
        if ($filterCondition !== null) {
            $query->andWhere($filterCondition);
        }

        return new \yii\data\ActiveDataProvider([
            'query' => $query,
        ]);
    }
}
