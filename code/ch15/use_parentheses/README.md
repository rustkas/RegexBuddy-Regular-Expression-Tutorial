use_parentheses
=====

## Create new project

----	
	
	# all commands in one string
	$ rebar3 new lib use_parentheses && cd use_parentheses
	
## Get dependencies
	$ rebar3 deps	

## Format
	$ rebar3 format
	
## EUnit
-----
	$ rebar3 eunit
	$ rebar3 eunit -m use_parentheses_tests

An OTP library

Build
-----

    $ rebar3 compile
