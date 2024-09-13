const { defineConfig } = require('cypress');

module.exports = defineConfig({
  viewportWidth: 1280,
  defaultCommandTimeout: 15000,
  chromeWebSecurity: false,
  reporter: 'junit',
  video: true,
  retries: {
    runMode: 8,
    openMode: 0,
  },
  reporterOptions: {
    mochaFile: 'cypress/reports/cypress-[hash].xml',
    jenkinsMode: true,
    toConsole: true,
  },
  e2e: {
    setupNodeEvents(on, config) {
      // e2e testing node events setup code
      config.env.CYPRESS_PREFIX_PATH = "/marine";

      return config;
    },
    baseUrl: 'http://localhost:3000',
  },
  "env": {
    "CYPRESS_PREFIX_PATH": "/marine",
  },
});
