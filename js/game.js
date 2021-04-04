import Interpreter from './interpreter.js';
const prompt = '> '

document.addEventListener('DOMContentLoaded', () => {
  console.log('game.js: DOMContentLoaded');
  const outputEl = document.getElementById('output');
  const inputEl = document.getElementById('prompt');

  if (!outputEl || !inputEl) {
    throw new Error('couldn\'t find required elements')
  };

  const sh = new Interpreter();

  inputEl.addEventListener('change', (e) => {
    e.preventDefault();
    const queryEl = document.createElement('pre');
    const resultEl = document.createElement('pre');

    queryEl.innerText = prompt + e.target.value

    outputEl.appendChild(queryEl)

    let result;

    try {
      result = sh.exec(e.target.value);
    } catch (err) {
      result = err.message
    }

    resultEl.innerText = result

    outputEl.appendChild(resultEl)

    e.target.value = '';
  });
})
