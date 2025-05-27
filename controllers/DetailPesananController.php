<?php 

namespace api\controllers;

use yii\rest\ActiveController;

class DetailPesananController extends ActiveController
{
    public $modelClass = 'api\models\DetailPesanan';

    public function actions()
    {
        $actions = parent::actions();
        unset($actions['index']);
        return $actions;
    }

    public function actionIndex()
    {
        $fields = ['Id_Detail', 'Id_Pesanan', 'Id_Menu', 'Jumlah', 'Harga_sub'];
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

        $query = \api\models\DetailPesanan::find();
        if ($filterCondition !== null) {
            $query->andWhere($filterCondition);
        }

        return new \yii\data\ActiveDataProvider([
            'query' => $query,
        ]);
    }
}
