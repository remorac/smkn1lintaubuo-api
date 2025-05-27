<?php 

namespace api\controllers;

use yii\rest\ActiveController;

class PesananController extends ActiveController
{
    public $modelClass = 'api\models\Pesanan';

    public function actions()
    {
        $actions = parent::actions();
        unset($actions['index']);
        return $actions;
    }

    public function actionIndex()
    {
        $fields = ['Id_Pesanan', 'Id_Konsumen', 'Id_Driver', 'Tanggal_Order', 'Status', 'Total_Harga', 'Id_Detail'];
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

        $query = \api\models\Pesanan::find();
        if ($filterCondition !== null) {
            $query->andWhere($filterCondition);
        }

        return new \yii\data\ActiveDataProvider([
            'query' => $query,
        ]);
    }
}
