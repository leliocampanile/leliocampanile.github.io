(function () {
  function getBib(key) {
    const pre = document.getElementById(`bib-${key}`);
    return pre ? pre.textContent.trim() : '';
  }
  function copyText(text) { return navigator.clipboard.writeText(text); }
  function download(text, filename) {
    const blob = new Blob([text], { type: 'text/plain;charset=utf-8' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.setAttribute('download', filename);
    a.href = url; document.body.appendChild(a); a.click(); a.remove();
    URL.revokeObjectURL(url);
  }
  document.addEventListener('click', (e) => {
    if (e.target.matches('.copy-bib')) {
      const key = e.target.getAttribute('data-key');
      const bib = getBib(key); if (!bib) return;
      copyText(bib).then(() => { const t=e.target.textContent; e.target.textContent='Copied!'; setTimeout(()=>e.target.textContent=t,1200); });
    }
    if (e.target.matches('.download-bib')) {
      const key = e.target.getAttribute('data-key');
      const bib = getBib(key); if (!bib) return;
      download(bib + '\n', `${key}.bib`);
    }
  });
})();
