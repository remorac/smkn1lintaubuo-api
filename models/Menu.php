<?php

namespace api\models;

class Menu extends \yii\db\ActiveRecord
{
    public static function tableName()
    {
        return 'Menu';
    }

    public static function primaryKey()
    {
        return ['Id_Menu'];
    }

    public function rules()
    {
        return [
            [['Id_Menu'], 'required'],
            [['Id_Menu', 'Id_Penjual', 'Nama_Menu'], 'string', 'max' => 50],
            [['Harga'], 'integer'],
            [['Deskripsi'], 'string'],
            [['Id_Menu'], 'unique'],
        ];
    }

    public function getPenjual()
    {
        return $this->hasOne(\api\models\Penjual::class, ['Id_Penjual' => 'Id_Penjual']);
    }

    public function getDetailPesanans()
    {
        return $this->hasMany(\api\models\DetailPesanan::class, ['Id_Menu' => 'Id_Menu']);
    }

    public function extraFields()
    {
        return ['penjual', 'detailPesanans'];
    }
}
