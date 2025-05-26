<?php

namespace api\models;

class Driver extends \yii\db\ActiveRecord
{
    public static function tableName()
    {
        return 'Driver';
    }

    public static function primaryKey()
    {
        return ['Id_Driver'];
    }

    public function rules()
    {
        return [
            [['Id_Driver'], 'required'],
            [['Id_Driver', 'Nama', 'Kendaraan'], 'string', 'max' => 50],
            [['No_HP'], 'string', 'max' => 13],
            [['Id_Driver'], 'unique'],
        ];
    }
}
