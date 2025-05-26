<?php

namespace api\models;

class Admin extends \yii\db\ActiveRecord
{
    public static function tableName()
    {
        return 'Admin';
    }

    public static function primaryKey()
    {
        return ['Id_Admin'];
    }

    public function rules()
    {
        return [
            [['Id_Admin'], 'required'],
            [['Id_Admin', 'Nama', 'Email', 'Password'], 'string', 'max' => 50],
            [['Id_Admin'], 'unique'],
            [['Email'], 'email'],
            [['Email'], 'unique'],
            [['Password'], 'string', 'min' => 8],
        ];
    }
}
