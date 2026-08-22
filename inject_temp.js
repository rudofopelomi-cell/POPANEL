const fs = require('fs');
const f = 'c:/Users/SUPER USUARIO/Pictures/popular/home.html';
let c = fs.readFileSync(f, 'utf8');
const marker = '<body style="">';
const idx = c.indexOf(marker);
if (idx >= 0) {
  const script = fs.readFileSync('c:/Users/SUPER USUARIO/Pictures/popular/inject_modal.js', 'utf8');
  c = c.substring(0, idx + marker.length) + script + c.substring(idx + marker.length);
  fs.writeFileSync(f, c);
  console.log('Modal injected successfully');
} else {
  console.log('Body marker not found');
}