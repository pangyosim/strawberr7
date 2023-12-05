   function requestPay(price,service,name,email,tel,addr) {
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
      	    tax_free: 200,
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
          	console.log(rsp);
          	location.href='/';
          } else {
          	console.log(rsp);
          	alert('결제 실패,,,');
          	location.href='payinfo?seq=2&session=2';
          }
        }
      );
  	}
