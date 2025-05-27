<?php 

namespace api\controllers;

use yii\rest\ActiveController;

class MenuController extends ActiveController
{
    public $modelClass = 'api\models\Menu';

    public function actions()
    {
        $actions = parent::actions();
        unset($actions['index']);
        return $actions;
    }

    public function actionIndex()
    {
        $fields = ['Id_Menu', 'Id_Penjual', 'Nama_Menu', 'Harga', 'Deskripsi'];
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

        $query = \api\models\Menu::find();
        if ($filterCondition !== null) {
            $query->andWhere($filterCondition);
        }

        return new \yii\data\ActiveDataProvider([
            'query' => $query,
        ]);
    }
}
