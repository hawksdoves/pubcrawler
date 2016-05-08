exports.config = {
        capabilities: {
            'browserName': 'chrome',
            'chromeOptions': {
                args: ['--disable-web-security']
            }
        },
        baseUrl: 'http://localhost:8080',
        specs: [
            'e2e/**/*Feature.js'
        ],
        jasmineNodeOpts: {
            isVerbose: true,
        }
};
