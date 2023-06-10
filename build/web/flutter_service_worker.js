'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.json": "87565792a4c28e9050a9cc9751417cda",
"assets/AssetManifest.smcbin": "b7c55470e09c1290954bfbeaf7e51f9c",
"assets/assets/add.svg": "e5c0f20830b8c87d1d18220bc6ba07db",
"assets/assets/ashaworker.jpg": "bf5b0619b5ffee03d022500d6de5b92a",
"assets/assets/auto.png": "1270e80e76a7637be8019686a009600e",
"assets/assets/banana.jpg": "8423d93f5c31a1054c58656e4095cc4c",
"assets/assets/BitterGourd.jpg": "ef5cd1c07e76c0ddd68bafeb06d0fe4d",
"assets/assets/cakes.jpg": "348a9baba4013f53a262a127e8e4d9f7",
"assets/assets/car.png": "29f75bc423ecfa61b95e9ea110cb2239",
"assets/assets/catla.jpg": "2586e0db38d4ef28ea9483cf0311774b",
"assets/assets/chicken.jpg": "15af59d358e661622b90ceb0a2e3aec2",
"assets/assets/chilli.jpg": "957f647e78fd08da4ddc91adc0912388",
"assets/assets/chilli.png": "98f12289523a6673d09bf7c28b5f453f",
"assets/assets/climbers.jpg": "82a5b9310fc8b53c60228efe6511062b",
"assets/assets/coconut.png": "304195939a3ccedb6a62318569e8942c",
"assets/assets/constructionworker.jpg": "ea447b16bc630be1494d8f1e7419b62f",
"assets/assets/customer.png": "b9f604cf833c347f598e93b4f5ae5d0a",
"assets/assets/dentist.jpg": "5addbd7e9ae7a270a7d66ba5a49133bc",
"assets/assets/doctor.jpg": "125690ddb9d3f9af0bf5203d2810de2a",
"assets/assets/drycleaner.png": "be7ba3ac3850904ad5db54da7e9db8aa",
"assets/assets/egg.jpg": "c3e076f0ca07cf212e9abdcea7b660e3",
"assets/assets/electrician.png": "e9b25ed04cbdfb227380063fbc7cfa40",
"assets/assets/f1.png": "748aecea7bbd375ac55f4493471ed3ae",
"assets/assets/f2.png": "74926289d4f10c47e0cb12e302410523",
"assets/assets/f3.png": "1fcf06ee43963016896a23d34556de9e",
"assets/assets/f4.png": "cba25f0b1694c5b4ac4e65e2cf959755",
"assets/assets/f5.png": "313b1b390fafef56b9aa7ff2f7c87a60",
"assets/assets/f6.png": "7ba5aa4260b48831f749c1d721bd8b54",
"assets/assets/fdlogo.png": "b63e922ac92773e4e0db27ace1313a7b",
"assets/assets/fieldworker.png": "c173f9ea5741c9fb10e0de0b5487ec5c",
"assets/assets/fish.jpg": "54d40b54fb76b373bac851ffa0447a2d",
"assets/assets/ginger.jpg": "2951abc03f3c1a534d8beb05efbcb4d6",
"assets/assets/gmail.png": "30705f21858e9395ff25fda3217d35a0",
"assets/assets/google.svg": "1651d8b87f0961b52b759a8169341659",
"assets/assets/gooseberry.jpg": "5bde9c3c0b26dbb503696a5169363c1c",
"assets/assets/grant.png": "7b87816b024aa174ba819eff8023e4f4",
"assets/assets/grant1.png": "4eb0bd3cddd6a4289b62b896f613c41b",
"assets/assets/grants.jpg": "7756b5cf6383d828c6c0c92e7812b8d5",
"assets/assets/health.png": "1143de77a14b960304c59a6dbd2470ef",
"assets/assets/help.png": "9cd76dc8c0c2b0eaa8d0ed5ee5e380fd",
"assets/assets/homenurse.jpg": "c4ec0e8469a0c8fbeba6586a6017cf94",
"assets/assets/housekeepers.jpg": "5cc9edbe3d41c53f333e19ac49af060b",
"assets/assets/insta.png": "916424cf33b837def864f587049624ee",
"assets/assets/IvyGourd.jpg": "98c36811c31e033661af14c3e1fa7373",
"assets/assets/ladiesfinger.jpg": "b10f30eb0882a5043c02671055e6b006",
"assets/assets/lawn.png": "7c521dd005ff6fd57fe6d28ecb41ac43",
"assets/assets/limepickle.jpg": "5a544b35ae7ca1102e9491732c78bb4d",
"assets/assets/limepickle.png": "4a674b7907e4303b1d1863295c675cd9",
"assets/assets/localworkers.png": "f18e3b900b4a719655df1fb947bbd1b2",
"assets/assets/login.png": "0fd12f4389db755e1b95c4cae2dcb3fc",
"assets/assets/logo.png": "c6631b0ecb6d54446978ba809a38679b",
"assets/assets/logo1.svg": "d8076ebb0cdd63960f2d583e0f0df1d4",
"assets/assets/mangopickle.jpg": "3cc5c93cb3323b78c34f7c453e3b2470",
"assets/assets/mason.jpg": "6a2a357a48cd4c7cf776619f1f6d8394",
"assets/assets/mechanic.jpg": "db03c8e84d30165fe8e80afb917eed47",
"assets/assets/menu.svg": "b4939b4615c0ecfbbbdc0ab9815639eb",
"assets/assets/milk.jpg": "e8604fa383798017ee31db3d05fa9a53",
"assets/assets/mushi.jpg": "9aaf26dfd38abaf7ae7055aecbce1ba3",
"assets/assets/notify.svg": "1473bf76702add91296b15993cf46b37",
"assets/assets/nurse.jpg": "e1eb221d869ea7ed877cc1d09a934ff5",
"assets/assets/painter.jpg": "92571cc64d63ab121edd340731595a09",
"assets/assets/pepper.jpg": "c3b811fc3bfc7b46aeb483f7c63d93b0",
"assets/assets/pickle.png": "251ab460f1c6a869d8cd03af4b7a07a6",
"assets/assets/plumber.png": "1e669b3c3531eac8082319ac4388e651",
"assets/assets/products.svg": "5e66370c9b655f9c94d67cebcd8f2e38",
"assets/assets/rohu.jpg": "4344703817f8333f5f271f4dbf8f1d99",
"assets/assets/s1.png": "d962c4caafeb3c06f29631d0d6e1385c",
"assets/assets/s2.png": "f8a2a130301fe101d4c54b73352570c6",
"assets/assets/s3.png": "499d773a4bb9e27a51eff461af7a442f",
"assets/assets/services.svg": "63ff4926b979d34f2ce79f773981ec3a",
"assets/assets/spices.jpg": "d1805ed0b0e7fe89755a50011dece30f",
"assets/assets/tailer.png": "b7a0a95c3834061b08811c722c1a6017",
"assets/assets/thilopia.jpg": "c873e0655692cb91d227f9b78165ad9c",
"assets/assets/Tomato.jpg": "2b8b6b30b532ef423a4507cd5a9561be",
"assets/assets/turmeric.jpg": "6a6a8d0323046372bae601a3483f1c29",
"assets/assets/tutor.jpg": "b1df44957f8b7ba20bb06f6fadba49ff",
"assets/assets/twitter.png": "52989b09ee4a0c5a2c9195ddaee5f03c",
"assets/assets/veg.jpg": "501bfb547b1baaaa9d91696aa41edce0",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "4962e39c477dbd12b0d778e97aaa196f",
"assets/NOTICES": "0c78af5dbd958ef0bf8368a51efc416c",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "fe7ae6bbc98352061b394b4e64e3e3ed",
"/": "fe7ae6bbc98352061b394b4e64e3e3ed",
"main.dart.js": "6a158ee8bb765a3aa15700c696d6f9e0",
"manifest.json": "b20e0c6e9fb3c95cb7041c8211b06a85",
"version.json": "e3726fbf62e515e6fde2357ec28f44fc"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
