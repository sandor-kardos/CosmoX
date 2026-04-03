import type { Config } from "tailwindcss"

const config: Config = {
  content: [
    "./client/index.html",
    "./client/src/**/*.{js,ts,jsx,tsx}",
    "./shared/**/*.{ts,tsx}"
  ],
  theme: {
    extend: {
      colors: {
        background: "#0f172a",
        foreground: "#ffffff",
        primary: {
          DEFAULT: "#8b5cf6",
          foreground: "#ffffff",
        },
        secondary: {
          DEFAULT: "#6366f1",
          foreground: "#ffffff",
        },
      },
    },
  },
  plugins: [],
}
export default config
