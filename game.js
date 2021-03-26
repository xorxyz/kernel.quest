document.addEventListener('DOMContentLoaded', () => {
  const el = document.getElementById('prompt');

  if (!el) return;

  el.addEventListener('change', e => {
    e.preventDefault();
    
    document.location.search += '&' + el.value;
  });
})
