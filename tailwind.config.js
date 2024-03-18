/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./site/templates/**/*.html",
    "./site/content/**/*.md",
    "./site/static/**/*.html",
    "./site/etc/**/*.json",
  ],
  theme: {
    extend: {
     fontFamily: {
        sans: ['Inter', 'sans-serif'],
      },
    },
  },
}
