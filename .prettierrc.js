module.exports = {
  /*  editorconfig: true, */
  arrowParens: 'always',
  bracketSpacing: true,
  endOfLine: 'lf',
  printWidth: 80,
  singleQuote: true,
  tabWidth: 2,
  trailingComma: 'all',
  quoteProps: 'as-needed',
  semi: true,
  overrides: [
    {
      files: '*.md',
      options: {
        parser: 'markdown',
        printWidth: 80,
        proseWrap: 'always',
        tabWidth: 4,
        useTabs: true,
        singleQuote: false,
        bracketSpacing: true,
        quoteProps: 'consistent',
      },
    },
  ],
};
