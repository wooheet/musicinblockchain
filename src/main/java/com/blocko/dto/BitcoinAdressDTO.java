package com.blocko.dto;

public class BitcoinAdressDTO {
	
	String audio_code;
	String bitcoinAdress;
	String privatekey;
	String righterName;
	double righterVal;
	/*String bitcoinAdress1;
	String privatekey1;
	String bitcoinAdress2;
	String privatekey2;
	String bitcoinAdress3;
	String privatekey3;
	String righterName1;
	long righterVal1;
	String righterName2;
	long righterVal2;
	String righterName3;
	long righterVal3;*/

	public BitcoinAdressDTO(){}

	@Override
	public String toString() {
		return "BitcoinAdressDTO [audio_code=" + audio_code
				+ ", bitcoinAdress=" + bitcoinAdress + ", privatekey="
				+ privatekey + ", righterName=" + righterName + ", righterVal="
				+ righterVal + "]";
	}

	public BitcoinAdressDTO(String audio_code, String bitcoinAdress,
			String privatekey, double righterVal) {
		super();
		this.audio_code = audio_code;
		this.bitcoinAdress = bitcoinAdress;
		this.privatekey = privatekey;
		this.righterVal = righterVal;
	}

	public BitcoinAdressDTO(String audio_code, String bitcoinAdress,
			String privatekey, String righterName, double righterVal) {
		super();
		this.audio_code = audio_code;
		this.bitcoinAdress = bitcoinAdress;
		this.privatekey = privatekey;
		this.righterName = righterName;
		this.righterVal = righterVal;
	}

	public String getAudio_code() {
		return audio_code;
	}

	public void setAudio_code(String audio_code) {
		this.audio_code = audio_code;
	}

	public String getBitcoinAdress() {
		return bitcoinAdress;
	}

	public void setBitcoinAdress(String bitcoinAdress) {
		this.bitcoinAdress = bitcoinAdress;
	}

	public String getPrivatekey() {
		return privatekey;
	}

	public void setPrivatekey(String privatekey) {
		this.privatekey = privatekey;
	}

	public String getRighterName() {
		return righterName;
	}

	public void setRighterName(String righterName) {
		this.righterName = righterName;
	}

	public double getRighterVal() {
		return righterVal;
	}

	public void setRighterVal(double righterVal) {
		this.righterVal = righterVal;
	}

	
}
