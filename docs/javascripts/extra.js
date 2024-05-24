// Configure MathJax for rendering LaTeX math expressions
window.MathJax = {
  // LaTeX delimiters for inline and display math
  tex: {
    inlineMath: [['\\(', '\\)']],
    displayMath: [['\\[', '\\]']],

    // Allow LaTeX escapes and environments
    processEscapes: true,
    processEnvironments: true,
  },

  // Options to ignore non-math HTML classes and
  // only process elements with class="arithmatex"
  options: {
    ignoreHtmlClass: '.*|',
    processHtmlClass: 'arithmatex',
  },
};

// When the document changes:
// - Clear MathJax caches and queued typesetting
// - Reset TeX input jax
// - Process math typesetting
document$.subscribe(() => {
  MathJax.startup.output.clearCache();
  MathJax.typesetClear();
  MathJax.texReset();
  MathJax.typesetPromise();
});

/* global $ */
$(document).ready(function () {
  displayLatestWarning();
});

$(window).on('hashchange', function () {
  displayLatestWarning();
});

function displayLatestWarning() {
  const latestWarningTrigger = '/latest-warning'; // Declare and initialize latestWarningTrigger
  $('.latest-warning').css(
    'display',
    $(location).attr('href').includes(latestWarningTrigger) ? 'block' : 'none',
  );
}
