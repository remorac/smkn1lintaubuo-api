<?php

namespace api\models;

class Konsumen extends \yii\db\ActiveRecord
{
    public static function tableName()
    {
        return 'Konsumen';
    }

    public static function primaryKey()
    {
        return ['Id_Konsumen'];
    }

    public function rules()
    {
        return [
            [['Id_Konsumen', 'Nama', 'Email', 'Password', 'Alamat'], 'required'],
            [['Id_Konsumen', 'Nama', 'Email', 'Password', 'Alamat'], 'string', 'max' => 50],
            [['Id_Konsumen'], 'unique'],
            [['Email'], 'email'],
            [['Email'], 'unique'],
            [['Password'], 'string', 'min' => 8],
        ];
    }
}
