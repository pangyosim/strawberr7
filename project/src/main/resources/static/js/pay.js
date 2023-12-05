   const page= document.querySelector('input[name="page"]:checked').value;
   var IMP = window.IMP;
   IMP.init("imp40114442");

   function requestPay() {
      IMP.request_pay(
        {
      	  pg: page, // 반드시 "tosspayments"임을 명시해주세요.
      	    merchant_uid: "order_id_1667634130112",
      	    name: "${vo.service}",
      	    pay_method: "card",
      	    escrow: false,
      	    amount: "${vo.price*1.1}",
      	    tax_free: 3000,
      	    buyer_name: "홍길동",
      	    buyer_email: "buyer@example.com",
      	    buyer_tel: "02-1670-5176",
      	    buyer_addr: "성수이로 20길 16",
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
          	alert('결제 실패~');
          	location.href='/';
          }
        }
      );
  		}
