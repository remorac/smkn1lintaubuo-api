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

    public function getDetailPesanan()
    {
        return $this->hasOne(\api\models\DetailPesanan::class, ['Id_Detail' => 'Id_Detail']);
    }

    public function getDetailPesanans()
    {
        return $this->hasMany(\api\models\DetailPesanan::class, ['Id_Pesanan' => 'Id_Pesanan']);
    }

    public function getDriver()
    {
        return $this->hasOne(\api\models\Driver::class, ['Id_Driver' => 'Id_Driver']);
    }

    public function getKonsumen()
    {
        return $this->hasOne(\api\models\Konsumen::class, ['Id_Konsumen' => 'Id_Konsumen']);
    }

    public function extraFields()
    {
        return ['detailPesanan', 'detailPesanans', 'driver', 'konsumen'];
    }
}
