-module(match_again_tests).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").
% Add commond helper files to the module
-include("helper.util").

research_01_test() ->
    Expected = [["<b><i>bold italic</i></b>","b"]],
    Text = "Testing <b><i>bold italic</i></b> text",
    Regex = "(?i)<([A-Z][A-Z0-9]*)\\b[^>]*>.*?</\\1>",
    {match, Result} = re:run(Text, get_mp(Regex), [global,{capture,all,list}]),
    ?assertEqual(Expected, Result).

research_02_test() ->
    Expected = [["axaxa","a"],["bxbxb","b"],["cxcxc","c"]],
    Text = "axaxa, bxbxb and cxcxc",
    Regex = "([a-c])x\\1x\\1",
    {match, Result} = re:run(Text, get_mp(Regex), [global,{capture,all,list}]),
    ?assertEqual(Expected, Result).

research_03_test() ->
    Expected = [["<b><i>bold italic</i></b>","b"]],
    Text = "Testing <b><i>bold italic</i></b> text",
    Regex = "(?i)<([A-Z][A-Z0-9]*)[^>]*>.*?</\\1>",
    {match, Result} = re:run(Text, get_mp(Regex), [global,{capture,all,list}]),
    ?assertEqual(Expected, Result).

research_04_test() ->
    Expected = ["cab=cab"],
    Text = "cab=cab",
    Regex = "([abc]+)=\\1",
    {match, Result} = re:run(Text, get_mp(Regex), [{capture,first,list}]),
    ?assertEqual(Expected, Result).

research_05_test() ->
    Expected = ["the the"],
    Text = "the the",
    Regex = "\\b(\\w+)\\s+\\1\\b",
    {match, Result} = re:run(Text, get_mp(Regex), [{capture,first,list}]),
    ?assertEqual(Expected, Result).	
	
research_06_test() ->
    Expected = ["b"],
    Text = "b",
    Regex = "(q?)b\\1",
    {match, Result} = re:run(Text, get_mp(Regex), [{capture,first,list}]),
    ?assertEqual(Expected, Result).		

research_07_test() ->
    Expected = nomatch,
    Text = "b",
    Regex = "(q)?b\\1",
    Result = re:run(Text, get_mp(Regex), [{capture,first,list}]),
    ?assertEqual(Expected, Result).		

research_08_test() ->
    Regex = "(one)\\7",
	{error,_} = re:compile(Regex).
	
research_09_test() ->
    Expected = ["oneonetwo"],
    Text = "oneonetwo",
    Regex = "(\\2two|(one))+",
    {match, Result} = re:run(Text, get_mp(Regex), [{capture,first,list}]),
    ?assertEqual(Expected, Result).		

research_10_test() ->
    Expected = ["oneonetwo"],
    Text = "oneonetwo",
    Regex = "(\\1two|(one))+",
    {match, Result} = re:run(Text, get_mp(Regex), [{capture,first,list}]),
    ?assertEqual(Expected, Result).

research_11_test() ->
    Expected = ["oneonetwo"],
    Text = "oneonetwo",
    Regex = "(?>(\\1two|(one)))+",
    {match, Result} = re:run(Text, get_mp(Regex), [{capture,first,list}]),
    ?assertEqual(Expected, Result).
	
	
-endif.
