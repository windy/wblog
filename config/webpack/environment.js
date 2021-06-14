const { environment } = require('@rails/webpacker')
const erb = require('./loaders/erb')

const webpack = require('webpack')

environment.plugins.append('Provide', new webpack.ProvidePlugin({
  $: 'jquery',
  jQuery: 'jquery',
  'window.jQuery': 'jquery',
  Popper: ['popper.js', 'default']
}))

environment.loaders.append('expose', {
  test: require.resolve('jquery'),
  use: [
    {
      loader: "expose-loader",
      options: {
        exposes: ["$", "jQuery"]
      }
    }
  ]
})


environment.loaders.prepend('erb', erb)
module.exports = environment
