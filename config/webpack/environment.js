
var webpack = require('webpack');

const { environment } = require('@rails/webpacker')

environment.plugins.prepend('Provide',
	new webpack.ProvidePlugin({
		$: 'jquery',
		jQuery: 'jquery',
		Popper: ['popper.js', 'default']
	}));

module.exports = environment
