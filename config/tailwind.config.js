const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
        colors: {
            'primary': "#009DFF",
            'lighterPrimary': "#8AD2FF",
            'darkerPrimary': "#0085D9",
            'fadedWhite': "#F8FAFC",
            'darkWhite': "#F1F5F9",
            'darkerWhite': "#E2E8F0",
            'black': "#0F172A",
            'lightBlack': "#334155",
            'lighterBlack': "#576C8A",
        },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
