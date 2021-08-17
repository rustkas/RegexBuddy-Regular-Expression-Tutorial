-module(matched_tests).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").
% Add commond helper files to the module
-include("helper.util").

research_01_test() ->
    Expected = ["d"],
    Text = "adhd",
    Regex = "h\\Kd",
	{ok,MP} = re:compile(Regex),
    {match, Result} = re:run(Text, MP, [{capture,all,list}]),
    ?assertEqual(Expected, Result).


-endif.
