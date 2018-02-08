<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Home</title>
	
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

<!-- 1. 아임포트에 회원가입 -->
<!-- 2. 아임포트 홈페이지에서 사용할 PG사를 선택 및 저장 -->
<!-- 3. 아임포트 라이브러리 추가 -->
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>

// window.IMP 변수 초기화
$(document).ready(function(){
	console.log("ready!")
	var IMP = window.IMP; 	  //생략 가능
	IMP.init('imp36232821');  //가맹점 식별코드 (아임포트 관리자 페이지의 '시스템 설정' > '내 정보'에서 확인 가능) 
	
	$(".payTest").on("click", function(){
		alert("click");
		// 결제 요청
		IMP.request_pay({
		    pg : 'nice', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트',
		    amount : 1000,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		    //m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
	});
});

</script>

</head>
<body>
<h1>
	Import Pay Module Test Page!
</h1>

<button type="button" class="payTest">PayTest</button>

</body>
</html>
