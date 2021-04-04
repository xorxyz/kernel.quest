import Interpreter from './interpreter.js';

document.addEventListener('DOMContentLoaded', () => {
  console.log('game.js: DOMContentLoaded');
  const el = document.getElementById('prompt');
  const sh = new Interpreter();

  if (!el) return;

  el.addEventListener('change', e => {
    e.preventDefault();
    
    console.log(e.target.value)

    try {
      const result = sh.exec(e.target.value);
      console.log(result)
    } catch (err) {
      console.error(err)
    }

    e.target.value = ''
  });
})
