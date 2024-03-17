/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./site/templates/**/*.html",
    "./site/content/**/*.md",
    "./site/static/**/*.html",
    "./site/data/**/*.json",
    // Add any other paths that might contain Tailwind classes
  ],
  theme: {
    extend: {
      colors: {
        'brand-blue': '#007bff',
        // Other custom colors
      },
      fontFamily: {
        sans: ['Inter', 'sans-serif'],
        // Other custom fonts
      },
    },
  },
}
