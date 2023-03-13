module.exports = {
  root: true,
  extends: ["next", "turbo", "prettier"],
  rules: {
    "@next/next/no-html-link-for-pages": "off",
    "indent": ["warn", 2, {
      "SwitchCase": 1
    }],
    "react/jsx-key": "warn",
    "react/display-name": "off",
    "no-unused-vars": "off", // or "@typescript-eslint/no-unused-vars": "off",
    "unused-imports/no-unused-imports": "error",
    "unused-imports/no-unused-vars": [
      "warn",
      { "vars": "all", "varsIgnorePattern": "^_", "args": "after-used", "argsIgnorePattern": "^_" }
    ]
  },
  ignorePatterns: ["index.js", "**/dist/*", "**/migrations/*", "**/*.typegen.ts"],
  plugins: ["unused-imports"],
};
