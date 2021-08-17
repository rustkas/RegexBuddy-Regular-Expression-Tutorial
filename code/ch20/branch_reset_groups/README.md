branch_reset_groups
=====

## Create new project

----	
	
	# all commands in one string
	$ rebar3 new lib branch_reset_groups && cd branch_reset_groups
	
## Get dependencies
	$ rebar3 deps	

## Format
	$ rebar3 format
	
## EUnit
-----
	$ rebar3 eunit
	$ rebar3 eunit -m branch_reset_groups_tests

An OTP library

Build
-----

    $ rebar3 compile
