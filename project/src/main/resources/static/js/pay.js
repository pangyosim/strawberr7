   function requestPay(price,service,name,email,tel,addr,seq,email) {
	  var page = document.querySelector('input[name="pg"]:checked').value;
      var IMP = window.IMP;
      IMP.init("imp40114442");
      IMP.request_pay(
        {
      	  	pg: page, // 반드시 "tosspayments"임을 명시해주세요.
      	    merchant_uid: "",
      	    name: service,
      	    pay_method: "card",
      	    escrow: false,
      	    amount: Math.round(price),
      	    tax_free: 2,
      	    buyer_name: name,
      	    buyer_email: email,
      	    buyer_tel: tel,
      	    buyer_addr: addr,
      	    buyer_postcode: "04783",
      	    notice_url: "https://helloworld.com/api/v1/payments/notice",
      	    confirm_url: "https://helloworld.com/api/v1/payments/confirm",
      	    currency: "KRW",
      	    locale: "ko",
      	    custom_data: { userId: 30930 },
      	    display: { card_quota: [0, 6] },
      	    appCard: false,
      	    useCardPoint: true,
      	    bypass: {
      	      tosspayments: {
      	        useInternationalCardOnly: true, // 영어 결제창 활성화
      	      },
      	    },
        },
        function (rsp) {
          if(rsp.success){
			  jQuery.ajax({
			    url: "https://2019-106-101-131-221.ngrok-free.app/paywork?seq="+ seq + "&price="+Math.round(price)+"&email="+ email, 
			    method: "POST",
			    headers: { "Content-Type": "application/json; charset=utf-8" },
			    data: JSON.stringify ({ 
					imp_uid: rsp.imp_uid, // 결제 고유 번호
					merchant_uid : rsp.merchant_uid, // 주문번호 
					status : rsp.status // 결제방법
			    })
			  });
			  location.href='/';
          } else {
          	console.log(rsp);
          	alert('결제 실패,,,');
          }
        });
  	}
