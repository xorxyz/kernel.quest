const swap = ([a, b]) => [b, a];
const LOOP_SECONDS = 0.1;
const LOOP_MS = LOOP_SECONDS * 1000;

let snail = ['🐌__', '__🐌'];
let sheep = ['🌿🐑', '🐑🌿'];
let grass = ['`', `'`];
let seconds = 0;
let timer = 0;

document.addEventListener('DOMContentLoaded', e => {
  const room = document.getElementById('room');
  const player = document.getElementById('player');
  const draw = (pair) => {
    room.innerText = room.innerText.replace(new RegExp(pair[0], 'g'), pair[1]);
    return pair;
  }

  const cycle = () => {
    seconds += LOOP_SECONDS;

    if (seconds % 0.4 === 0) {
      grass = swap(grass);
      draw(grass);
    }

    if (seconds % 0.8 === 0) {
      sheep = swap(sheep);
      draw(sheep);

      snail = swap(snail);
      draw(snail);
    }
  }

  player.addEventListener('play', () => {
    timer = setInterval(cycle, LOOP_MS);
  });

  player.addEventListener('pause', () => {
    clearInterval(timer);
  });
});
