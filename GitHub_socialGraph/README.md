This is my Github social graph project.
It displays the follower or following graph of the entered Github user.

To create a graph, you need to run the python code and enter your github information to be able to call the API,
then enter the name of the user you which to see the social graph of, and can choose if you want to see the followers or
following users.

The D3JS template I used comes from: http://bl.ocks.org/jose187/4733747

Now here is an example of what it looks like:
![Alt text](./example_graph.png?raw=true "Title")

The Red circle is the usered we are focused on,
the orange circles are the direct followers / following of the user
and the smaller blue circles are the indirect ones, that is those who follow / are followed by one of the orange circle user.