<?php

include 'chromephp/ChromePhp.php';


abstract class Perakende {

	abstract public function KDV($urunKodu);
	public function FiyatHesapla($fiyat, $urunKodu) {
		return $fiyat + ($fiyat * $this->KDV($urunKodu));
	}
}

class KuruUzum extends Perakende {
	public $oran;

	public function KDV($urunKodu){

		switch($urunKodu){
			case 1:
				$this->oran = 0.08;
				break;
			case 2:
				$this->oran = 0.18; //Şeker, Soya vb. maddelerle kaplananlarda oran %18
				break;
			default:
				$this->oran=0; //Tanımsız urun
		}
		return $this->oran;
	}

}

class KuruIncir extends Perakende {
	public $oran;

	public function KDV($urunKodu){

		switch($urunKodu){
			case 1:
				$this->oran = 0.08;
				break;
			case 2:
				$this->oran = 0.18; 
				break;
			default:
				$this->oran=0; 
		}
		return $this->oran;
	}

}

$uzum  = new KuruUzum;
$incir = new KuruIncir;

echo "Kuru Üzüm, Ürün Kodu: 1 Fiyat: ".$uzum->FiyatHesapla(200,1)." TL <br/>";
echo "Kuru Üzüm, Ürün Kodu: 2 Fiyat: ".$uzum->FiyatHesapla(200,2)." TL <br/>";

echo "Kuru İncir, Ürün Kodu: 1 Fiyat: ".$incir->FiyatHesapla(200,1)." TL <br/>";
echo "Kuru İncir, Ürün Kodu: 2 Fiyat: ".$incir->FiyatHesapla(200,2)." TL <br/>";



//ChromePhp::log('deneme  '.$uzum->FiyatHesapla(200,1));

/*
// using labels
foreach ($_SERVER as $key => $value) {
	ChromePhp::log($key,';'. $value);
}
*/

// warnings and errors
//ChromePhp::warn('this is a warning');
//ChromePhp::error('this is an error');
?>