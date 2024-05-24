keyboard$.subscribe(function (key) {
  //  if (key.mode === "global" && key.type === "x") {
  /* Add custom keyboard handler here */
  if (key.mode === 'global' && key.key === 'k' && key.ctrl && key.meta) {
    // Handle Command + K
    console.log('Command + K was pressed');
    key.claim();
  }
});
