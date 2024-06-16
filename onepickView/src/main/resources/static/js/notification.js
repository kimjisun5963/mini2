


 // Import the functions you need from the SDKs you need
    import { initializeApp } from 'https://www.gstatic.com/firebasejs/9.0.0/firebase-app.js';
    import { getMessaging, getToken, onMessage } from 'https://www.gstatic.com/firebasejs/9.0.0/firebase-messaging.js';

    // Your web app's Firebase configuration
    const firebaseConfig = {
          apiKey: "AIzaSyDke7gQNq9KzXpYrrl7zwMzJI1iYjgylAo",
		  authDomain: "onepick-2a02e.firebaseapp.com",
		  databaseURL: "https://onepick-2a02e-default-rtdb.asia-southeast1.firebasedatabase.app",
		  projectId: "onepick-2a02e",
		  storageBucket: "onepick-2a02e.appspot.com",
		  messagingSenderId: "1000997640667",
		  appId: "1:1000997640667:web:71eb0c5f76d972d5652ffe",
		  measurementId: "G-F1F2D8M1Y4"
    };

     // Initialize Firebase
    const app = initializeApp(firebaseConfig);

    // Initialize Firebase Cloud Messaging and get a reference to the service
    const messaging = getMessaging(app);
    
    // 서비스 워커 등록 및 FCM 토큰 가져오기
	let currentToken = null;

// 서비스 워커 등록
if ('serviceWorker' in navigator) {
  navigator.serviceWorker.register('/firebase-messaging-sw.js')
   .then(async (registration) => {
      console.log('Service Worker registered with scope:', registration.scope);
      try {
        currentToken = await getToken(messaging, { vapidKey: 'BLcSeRWoHAyawxByQ1N__CdtF49_9xrIDS4sW0Zu5VuS3zXZvM9xyym054TN276SxN_za2eeV7mBak77Zetgf2Q', serviceWorkerRegistration: registration });
        if (currentToken) {
          console.log('FCM Token:', currentToken);
        } else {
          console.log('No registration token available. Request permission to generate one.');
        }
      } catch (err) {
        console.error('An error occurred while retrieving token. ', err);
      }
    })
    .catch((err) => {
      console.error('Service Worker registration failed:', err);
    });
}

// setNotification 함수를 정의하고 window 객체에 등록
window.setNotification = async function() {


  try {
    const permission = await Notification.requestPermission();
    const modalBody = document.querySelector("#exampleModal1 .modal-body");
    const notificationBtn = document.querySelector("#exampleModal1 .modal-footer");

    if (permission === 'granted') {
     if (!currentToken) {
        console.log('No FCM Token found, requesting a new one...');
        currentToken = await getToken(messaging, { vapidKey: 'BLcSeRWoHAyawxByQ1N__CdtF49_9xrIDS4sW0Zu5VuS3zXZvM9xyym054TN276SxN_za2eeV7mBak77Zetgf2Q' });
        console.log('New FCM Token:', currentToken);
      }

      // 서버에 토큰 전송
      await fetch('http://localhost:9001/api/v1/notification/register', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          "jwtToken": localStorage.getItem("jwtToken"),
          "username": localStorage.getItem("username"),
          "role": localStorage.getItem("role")
        },
        body: JSON.stringify({ token: currentToken })
      });

      // 모달 안내메시지 변경
      modalBody.innerHTML = "이미 푸쉬 알림에 대한 설정을 '허용'으로 설정하였습니다. <br> 알림을 그만 받길 원한다면, 브라우저 설정에서 푸쉬 알림 설정을 '차단'으로 변경해 주세요.";
      notificationBtn.style.display = 'none';
    } else if (permission === 'denied') {
      // 모달 안내메시지 변경
      modalBody.innerHTML = "이미 푸쉬 알림에 대한 설정을 '차단'으로 설정하였습니다. <br> 알림을 받고 싶다면, 브라우저 설정에서 푸쉬 알림 설정을 '허용'으로 변경해 주세요.";
      notificationBtn.style.display = 'none';
    }
  } catch (err) {
    console.log('Unable to get permission to notify.', err);
  }
};
// Handle incoming messages
onMessage(messaging, (payload) => {
  console.log('Message received. ', payload);
  // Customize notification here
});
