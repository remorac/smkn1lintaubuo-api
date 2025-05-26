<?php

namespace api\models;

class Pesanan extends \yii\db\ActiveRecord
{
    public static function tableName()
    {
        return 'Pesanan';
    }

    public static function primaryKey()
    {
        return ['Id_Pesanan'];
    }

    public function rules()
    {
        return [
            [['Id_Pesanan'], 'required'],
            [['Id_Pesanan', 'Id_Konsumen', 'Id_Driver', 'Id_Detail'], 'string', 'max' => 50],
            [['Tanggal_Order'], 'safe'],
            [['Status', 'Total_Harga'], 'integer'],
            [['Id_Pesanan'], 'unique'],
        ];
    }
}
