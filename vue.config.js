// vue.config.js
module.exports = {
  devServer: {
    // STS Api Server
    proxy: 'http://localhost:8085',
    // Vue Port No
    port: 3000
}
}