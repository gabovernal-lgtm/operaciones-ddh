const CACHE='operaciones-ddh-oficial-20261111-pdf-materiales';
const ASSETS=['./','./index.html','./manifest.webmanifest','./icon-ddh-realista-192.png','./icon-ddh-realista-512.png','./config.js'];
self.addEventListener('install',e=>{
 self.skipWaiting();
 e.waitUntil(caches.open(CACHE).then(async cache=>{
  const responses=await Promise.all(ASSETS.map(path=>fetch(new Request(path,{cache:'reload'}))));
  if(responses.some(r=>!r.ok))throw new Error('No se pudo descargar la actualización');
  await Promise.all(responses.map((r,i)=>cache.put(ASSETS[i],r)));
 }));
});
self.addEventListener('activate',e=>{
 e.waitUntil(caches.keys().then(keys=>Promise.all(keys.filter(k=>k.startsWith('operaciones-ddh-')&&k!==CACHE).map(k=>caches.delete(k)))).then(()=>self.clients.claim()));
});
self.addEventListener('fetch',e=>{
 if(e.request.method!=='GET')return;
 const url=new URL(e.request.url);
 const fresh=url.origin===self.location.origin&&(e.request.mode==='navigate'||url.pathname.endsWith('.html')||url.pathname.endsWith('/config.js'));
 e.respondWith(fetch(e.request,fresh?{cache:'no-store'}:undefined).then(r=>{
  if(r.ok){const copy=r.clone();e.waitUntil(caches.open(CACHE).then(cache=>cache.put(e.request,copy)));}
  return r;
 }).catch(()=>caches.match(e.request).then(r=>r||caches.match('./index.html'))));
});
