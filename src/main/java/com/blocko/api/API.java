package com.blocko.api;

import io.blocko.coinstack.*;
import io.blocko.coinstack.model.*;


public class API {
	
	public static CoinStackClient createNewCoinStackClient(){
		CoinStackClient coinstack = new CoinStackClient(new CredentialsProvider(){
			//CredentialsProvider : 코인스택 API KEY와 접속할 서버를 가리키는 EndPoint 관리
			@Override
			public String getSecretKey() {
				return "c93a162e57be6f7e9d31aade0ed79e";//e3133e1a490656597be2c965a2dd6e
			}
			
			@Override
			public String getAccessKey() {
				return "fa9bd1e0daddaaa8c32e8a79c3a320";//6eb8592ed7c7b41bfc0ad13d4a51f1
			}
			
		}, Endpoint.MAINNET);	
		//Endpoint : SDK를 통해 접근하고자 하는 네트워크 주소 입력, 코인스택이 제공하는 클라우드 서비스를 통해 비트코인 네트워크 에 접속 | TESTNET은 비트코인 테스트 네트워크
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


