-module(branch_reset_groups_tests).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").
% Add commond helper files to the module
-include("helper.util").

research_01_test() ->
    Expected = [["a"],["b"],["c"]],
    Text = "abc",
    Regex = "(?|(a)|(b)|(c))",
	{ok,MP} = re:compile(Regex),
    {match, Result} = re:run(Text, MP, [global,{capture,first,list}]),
    ?assertEqual(Expected, Result).

research_02_test() ->
    Expected = [["abc"],["def"],["ghi"]],
    Text = "abc def ghi",
    Regex = "(?|abc|(d)(e)(f)|g(h)i)",
	{ok,MP} = re:compile(Regex),
    {match, Result} = re:run(Text, MP, [global,{capture,first,list}]),
    ?assertEqual(Expected, Result).

research_03_01_test() ->
    Expected = ["04/23"],
    Regex = "
^(?:(0?[13578]|1[02])/(3[01]|[12][0-9]|0?[1-9]) # 31 days
| (0?[469]|11)/(30|[12][0-9]|0?[1-9]) # 30 days
| (0?2)/([12][0-9]|0?[1-9]) # 29 days
)$	
	",
    Text = "04/23",
	{ok,MP} = re:compile(Regex,[extended]),
    {match, Result} = re:run(Text, MP, [{capture,first,list}]),
    ?assertEqual(Expected, Result).	
	
research_03_02_test() ->
    Expected = ["04/23"],
    Regex = "(?x) # free spacing
^(?|(0?[13578]|1[02])/(3[01]|[12][0-9]|0?[1-9]) # 31 days
| (0?[469]|11)/(30|[12][0-9]|0?[1-9]) # 30 days
| (0?2)/([12][0-9]|0?[1-9]) # 29 days
)$	
	",
    Text = "04/23",    
	{ok,MP} = re:compile(Regex),
    {match, Result} = re:run(Text, MP, [{capture,first,list}]),
    ?assertEqual(Expected, Result).	
	
	
	
	
-endif.
