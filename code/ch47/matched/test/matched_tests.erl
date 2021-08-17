-module(matched_tests).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").
% Add commond helper files to the module
-include("helper.util").

research_01_test() ->
    %Expected = ["d"],
    Text = "adhd",
    Regex = "\\U.*",
	Replacement="&",
	?assertException(error, {badgarg,_},re:replace(Text, Regex, Replacement)).
	%Result = re:replace(Text, Regex, Replacement),
    %?debugFmt("~p~n",[Result]).
    %?assertEqual(Expected, Result).


-endif.
