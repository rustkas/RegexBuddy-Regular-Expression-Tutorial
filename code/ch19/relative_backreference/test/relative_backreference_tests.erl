-module(relative_backreference_tests).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").
% Add commond helper files to the module
-include("helper.util").

research_01_test() ->
    Expected = ["abcc"],
    Text = "abcc",
    Regex = "(a)(b)(c)\\g<-1>",
	{ok,MP}=re:compile(Regex),
    {match, Result} = re:run(Text, MP, [{capture,first,list}]),
    ?assertEqual(Expected, Result).

research_02_test() ->
    Expected = ["abcb"],
    Text = "abcb",
    Regex = "(a)(b)(c)\\g<-2>",
	{ok,MP}=re:compile(Regex),
    {match, Result} = re:run(Text, MP, [{capture,first,list}]),
    ?assertEqual(Expected, Result).

research_03_test() ->
    Expected = ["abca"],
    Text = "abca",
    Regex = "(a)(b)(c)\\g<-3>",
	{ok,MP}=re:compile(Regex),
    {match, Result} = re:run(Text, MP, [{capture,first,list}]),
    ?assertEqual(Expected, Result).

research_04_test() ->
    Expected = ["abcb"],
    Text = "abcb",
    Regex = "(a)(b)(c\\g<-2>)",
	{ok,MP}=re:compile(Regex),
    {match, Result} = re:run(Text, MP, [{capture,first,list}]),
    ?assertEqual(Expected, Result).	
	
research_05_test() ->
    Expected = nomatch,
    Text = "abcc",
    Regex = "(a)(b)(c\\g<-1>)",
	{ok,MP}=re:compile(Regex),
    Result = re:run(Text, MP, [{capture,first,list}]),
    ?assertEqual(Expected, Result).	
	
	
-endif.
