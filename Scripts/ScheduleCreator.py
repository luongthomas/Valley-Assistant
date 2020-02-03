print("hello world")

"""
Format
Each schedule entry value has an arbitrary number of slash-delimited schedule commands in this form:

<time> <map> <coord x y> <position> <animation> <Strings>
<time> is the time at which the schedule event begins, in military time (24 hour format, no colon)
[map] is the map on which the target location is
[coord x y] is the x and y coordinates of the target location, without a comma
[position] The direction the NPC actor shall face once reaching the target location.
[animation] (optional): is the animation the NPC actor will execute at reaching the target location.
[Strings] (optional): This is managed from strings/schedule/<NPC Name>. A specific format must be followed!
At <time> the NPC begins to travel to the target location. Once there, [animation] is executed until the next schedule event begins. There is possibly no limit to how many schedule events one schedule entry may contain
"""

