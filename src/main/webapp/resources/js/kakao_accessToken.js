
$(document).ready(function(){
    var params = new URLSearchParams(window.location.search);
    var accessToken = params.get('access_token');

    sendAccessToken(accessToken);
    

});

function sendAccessToken(accessToken){
    window.opener.checkKakaoUser(accessToken);

}

