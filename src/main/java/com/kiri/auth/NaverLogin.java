package com.kiri.auth;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

@Component
public class NaverLogin {
    //client_id: 애플리케이션 등록 후 발급받은 클라이언트 아이디
    //response_type: 인증 과정에 대한 구분값. code로 값이 고정돼 있습니다.
    //redirect_uri: 네이버 로그인 인증의 결과를 전달받을 콜백 URL(URL 인코딩). 애플리케이션을 등록할 때 Callback URL에 설정한 정보입니다.
    private final static String CLIENT_ID = "JGrWhif19UZuK2reaDTs";
    private final static String CLIENT_SECRET = "BYZrSRGyuQ";
    private final static String REDIRECT_URI = "http://localhost:8090/login/naverCallback";
    private final static String SESSION_STATE = "oauth_state";
    
    private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";
    
    public String getAuthorizationUrl(HttpSession session) {
        String state = generateRandomString();
        setSession(session, state);
        OAuth20Service oauthService = new ServiceBuilder().apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET)
                .callback(REDIRECT_URI).state(state)
                .build(NaverLoginApi.instance());
        return oauthService.getAuthorizationUrl();
    }
    
    /* 네이버아이디로 Callback 처리 및 AccessToken 획득 Method */
    public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException {
        /* Callback으로 전달받은 세선검증용 난수값과 세션에 저장되어있는 값이 일치하는지 확인 */
        String sessionState = getSession(session);
        if (StringUtils.pathEquals(sessionState, state)) {
            OAuth20Service oauthService = new ServiceBuilder().apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET)
                    .callback(REDIRECT_URI).state(state).build(NaverLoginApi.instance());
            /* Scribe에서 제공하는 AccessToken 획득 기능으로 네아로 Access Token을 획득 */
            OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
            return accessToken;
        }
        return null;
    }
    
    /* 세션 유효성 검증을 위한 난수 생성기 */
    private String generateRandomString() {
        return UUID.randomUUID().toString();
    }
    
    /* http session에 데이터 저장 */
    private void setSession(HttpSession session, String state) {
        session.setAttribute(SESSION_STATE, state);
    }
    
    /* http session에서 데이터 가져오기 */
    private String getSession(HttpSession session) {
        return (String) session.getAttribute(SESSION_STATE);
    }
    
    /* Access Token을 이용하여 네이버 사용자 프로필 API를 호출 */
    public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException {
        OAuth20Service oauthService = new ServiceBuilder().apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET)
                .callback(REDIRECT_URI).build(NaverLoginApi.instance());
        OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
        oauthService.signRequest(oauthToken, request);
        Response response = request.send();
        return response.getBody();
    }
}
