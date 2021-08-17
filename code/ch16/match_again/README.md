match_again
=====

## Create new project

----	
	
	# all commands in one string
	$ rebar3 new lib match_again && cd match_again
	
## Get dependencies
	$ rebar3 deps	

## Format
	$ rebar3 format
	
## EUnit
-----
	$ rebar3 eunit
	$ rebar3 eunit -m match_again_tests

An OTP library

Build
-----

    $ rebar3 compile
