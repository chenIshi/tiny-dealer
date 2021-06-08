module tiny.dealer/main

go 1.13

replace tiny.dealer/guard => ../guard

require (
	tiny.dealer/dealer v0.0.0-00010101000000-000000000000
	tiny.dealer/doorman v0.0.0-00010101000000-000000000000
	tiny.dealer/guard v0.0.0-00010101000000-000000000000
	tiny.dealer/keeper v0.0.0-00010101000000-000000000000
)

replace tiny.dealer/keeper => ../keeper

replace tiny.dealer/doorman => ../doorman

replace tiny.dealer/dealer => ../dealer
