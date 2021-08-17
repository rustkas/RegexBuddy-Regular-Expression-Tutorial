-module(atomic_tests).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").
% Add commond helper files to the module
-include("helper.util").

research_01_test() ->
    Expected = [["abcc"]],
    Text = "abcc",
    Regex = "a(?>bc|b)c",
	{ok,MP} = re:compile(Regex),
    {match, Result} = re:run(Text, MP, [global,{capture,all,list}]),
    ?assertEqual(Expected, Result).

research_02_test() ->
    Expected = nomatch,
    Text = "integers",
    Regex = "\\b(integer|insert|in)\\b",
	{ok,MP} = re:compile(Regex),
    Result = re:run(Text, MP, [global,{capture,all,list}]),
	
    ?assertEqual(Expected, Result).	
	
research_03_test() ->
    Expected = nomatch,
    Text = "integers",
    Regex = "\\b(?>integer|insert|in)\\b",
	{ok,MP} = re:compile(Regex),
    Result = re:run(Text, MP, [global,{capture,all,list}]),
	
    ?assertEqual(Expected, Result).	

research_04_test() ->
    Expected = nomatch,
    Text = " integers",
    Regex = "\\b(insert|in|integer)\\b",
	{ok,MP} = re:compile(Regex),
    Result = re:run(Text, MP, [global,{capture,all,list}]),
	
    ?assertEqual(Expected, Result).	
	
research_05_01_test() ->
    Expected = [["insert"]],
    Text = "insert",
    Regex = "\\b(?>integer|insert|in)\\b",
	{ok,MP} = re:compile(Regex),
    {match,Result} = re:run(Text, MP, [global,{capture,all,list}]),
	
    ?assertEqual(Expected, Result).		
-endif.
