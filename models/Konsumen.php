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

    public function getPesanans()
    {
        return $this->hasMany(\api\models\Pesanan::class, ['Id_Konsumen' => 'Id_Konsumen']);
    }

    public function extraFields()
    {
        return ['pesanans'];
    }
}
