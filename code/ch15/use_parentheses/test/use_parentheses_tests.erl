-module(use_parentheses_tests).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").
% Add commond helper files to the module
-include("helper.util").

research_01_test() ->
    Expected = [["Set"],["SetValue","Value"]],
    Text = "Set or SetValue",
    Regex = "Set(Value)?",
    {match, Result} = re:run(Text, get_mp(Regex), [global,{capture,all,list}]),
    ?assertEqual(Expected, Result).

research_02_test() ->
    Expected = [["Set"],["SetValue"]],
    Text = "Set or SetValue",
    Regex = "Set(?:Value)?",
    {match, Result} = re:run(Text, get_mp(Regex), [global,{capture,all,list}]),
    ?assertEqual(Expected, Result).

research_03_test() ->
    Expected = [["color=red"],["color=green"],["color=blue"]],
    Text = "color=red\\r\\ncolor=green\\r\\ncolor=blue\\r\\n",
    Regex = "color=(?:red|green|blue)",
    {match, Result} = re:run(Text, get_mp(Regex), [global,{capture,all,list}]),
    ?assertEqual(Expected, Result).

-endif.
