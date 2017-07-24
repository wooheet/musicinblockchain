package com.blocko.api;

import io.blocko.coinstack.*;
import io.blocko.coinstack.model.*;


public class API {
	
	public static CoinStackClient createNewCoinStackClient(){
		CoinStackClient coinstack = new CoinStackClient(new CredentialsProvider(){
			//CredentialsProvider : ���ν��� API KEY�� ������ ������ ����Ű�� EndPoint ����
			@Override
			public String getSecretKey() {
				return "c93a162e57be6f7e9d31aade0ed79e";//e3133e1a490656597be2c965a2dd6e
			}
			
			@Override
			public String getAccessKey() {
				return "fa9bd1e0daddaaa8c32e8a79c3a320";//6eb8592ed7c7b41bfc0ad13d4a51f1
			}
			
		}, Endpoint.MAINNET);	
		//Endpoint : SDK�� ���� �����ϰ��� �ϴ� ��Ʈ��ũ �ּ� �Է�, ���ν����� �����ϴ� Ŭ���� ���񽺸� ���� ��Ʈ���� ��Ʈ��ũ �� ���� | TESTNET�� ��Ʈ���� �׽�Ʈ ��Ʈ��ũ
		return coinstack;
	}
	
	/*public static KeyManager createNewKeyManager(String privateKey) throws CoinStackException {
		String authAddress = ECKey.deriveAddress(privateKey);
		return createNewKeyManager(privateKey, authAddress);
	}
	public static KeyManager createNewKeyManager(String privateKey, String authAddress) throws CoinStackException {
		KeyManager keyManager = new InMemoryKeyManager();
		keyManager.registerKey(authAddress, privateKey.toCharArray());
		return keyManager;
	}*/
	
	
}


