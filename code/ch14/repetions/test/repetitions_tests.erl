-module(repetitions_tests).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").
% Add commond helper files to the module
-include("helper.util").

greedy_01_test() ->
    Expected = ["<EM>first</EM>"],
    Text = "This is a <EM>first</EM> test",
    Regex = "<.+>",
    {match, Result} = re:run(Text, get_mp(Regex), [{capture, first, list}]),
    ?assertEqual(Expected, Result).

lazy_01_test()->
    Expected = ["<EM>"],
    Text = "This is a <EM>first</EM> test",
    Regex = "<.+?>",
    {match, Result} = re:run(Text, get_mp(Regex), [{capture, first, list}]),
    ?assertEqual(Expected, Result).
	
better_than_lazy_01_test()->
    Expected = ["<EM>"],
    Text = "This is a <EM>first</EM> test",
    Regex = "<[^>]+>",
    {match, Result} = re:run(Text, get_mp(Regex), [{capture, first, list}]),
    ?assertEqual(Expected, Result).

escape_sequencess_01_test()->
    Expected = ["*\d+**"],
    Text = "*\d+**\d+*",
    Regex = "\\Q*\d+*\\E+",
    {match, Result} = re:run(Text, get_mp(Regex), [{capture, first, list}]),
    ?assertEqual(Expected, Result).

-endif.
