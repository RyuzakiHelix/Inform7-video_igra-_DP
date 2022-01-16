" Igra_interaktivne_fikcije_Inform7" by Ivan_Blazek

When play begins:
say "[italic type]You wake up, you dont know, where you are or why are you here, but you notice you are in a Bedroom.[roman type]".

The display banner rule is listed before the when play begins stage rule in the startup rules.

Release along with an interpreter.
[Variables]
ShadowMove is a truth state that varies. ShadowMove is false.

[Pocetna prostorija]
Bedroom is a room. Bedroom is north of Bedroom Door. "An almost empty room, there is one bed, one desk and one chair, not even windows or anything else, there is no sound you can hear, but there is a Rusty key on the desk. ".

Bedroom Door is a door. Bedroom Door is unlocked. Bedroom Door is north of Hallway and south of Bedroom. The description is "A normal looking door."

Rusty key is in Bedroom. The description is "Weird key with some blood stains on it, what can the key unlock?".
Chest is a kind of container. Chest is openable. Chest can be open. Chest is usually openable and closed.
Box is a Chest. Box is in the Bedroom. The description is "Old looking box is near the bed you woke up from.".
Instead of taking the Box, say "The box is too heavy".

Phone is in Box. The description is "A smartphone.".


The ShadowFigure is a person. "There is something you can feel it, but you cant see it.".
The ShadowFigure can be following or not following. ShadowFigure is not following.

After taking the Rusty key:
	if ShadowMove is false:
		now the ShadowFigure is in the Bedroom;
		now the ShadowFigure is following;
		if ShadowFigure is following:
			say "Feels like somebody is watching me";
		now ShadowMove is true;
		continue the action;
		
After dropping the Rusty key:
	if ShadowMove is true:
		now the ShadowFigure is nowhere;
		now the ShadowFigure is not following;
		if ShadowFigure is not following:
			say "The presence is gone, or is it just my imagination";
		now ShadowMove is false;
		continue the action;
		
Every turn while the ShadowFigure is following:
	if the location of ShadowFigure is not the location of the player:
		let the way be the best route from the location of ShadowFigure to the location of the player, using doors;
		try ShadowFigure going the way;
	otherwise:
		say "Feels like something is here"
		
	
[Prostorija nakon spavace]
Hallway is a room. "Empty boring hallway with 4 different doors. Red door is to the East, Blue door to the West and White door to the South".

Red Door is a door. Red Door is unlocked. Red Door is east of Hallway and west of UnknownRedRoom. The description is "A red door. on the east side ".

Blue Door is a door. Blue Door is unlocked. Blue Door is west of the Hallway and east of UnknownBlueRoom. The description is "A blue door. on the west side".

White Door is a door. White Door is locked. White Door is south of the Hallway and north of UnknownWhiteRoom. The description is "A white door. written on it: DO NOT ENTER".The matching key is Rusty key.


[Prostorija nakon Crvenih vrata]
UnknownRedRoom is a room. "Room painted with red, there are some wierd looking toys around, and someone standing in the middle of the room.".

The RedRoomPerson is a person. RedRoomPerson is in UnknownRedRoom. The description is "Person wearing casual clothes.".
The RedRoomPerson can be following or not following. RedRoomPerson is not following.
understand "the person" as The RedRoomPerson.

Table of RedRoomPerson Responses
Topic	Response	Index
"who are you"	"you are not ready to know that"	"who are you"
"what are you doing here"	"you already know that"	"what are you doing here"
"can you help me"	"I can"	"can you help me"

New Door is a door. New Door is locked. New Door is east of UnknownRedRoom and west of RedEnd. The description is "You noticed somehow a door apeared but you are not sure was it there when you entered the room, the room is east".
After asking RedRoomPerson about something:
	if the topic understood is a topic listed in the Table of RedRoomPerson Responses:
		say "[Response entry]";
		if the "[Response entry]" is "I can" and ShadowFigure is not following:
			now the Red Door is closed;
			now the Red Door is locked;
			now the New Door is unlocked;
			say "[line break] Did the New Door just unlock itself";
			continue the action;
		if the "[Response entry]" is "I can" and ShadowFigure is following:
			say "[line break] This is the end, the feeling you had, turns out someone was following you, the moment you got your answer something killed you from behind";
		end the story saying "You have died!";
	else:
		say "You are asking the wrong questions";

[custom function]
list-asking is an action applying to one thing.
understand "ask [thing]" as list-asking.
understand "ask [thing] about" as list-asking.

instead of list-asking a person:
	say "You can ask the following things: [line break] ";
	[
	if the noun is the RedRoomPerson:
		let T be the  Table of RedRoomPerson Responses;
		list options from T;
		]
	if the noun is the RedRoomPerson:
		 repeat with N running from 1 to the number of rows in the Table of RedRoomPerson Responses:
			choose row N in the Table of RedRoomPerson Responses;
			say "[Index entry].";
	if the noun is the BlueRoomPerson:
		repeat with N running from 1 to the number of rows in the Table of BlueRoomPerson Responses:
			choose row N in the Table of BlueRoomPerson Responses;
			say "[Index entry].";	
	if the noun is the WhiteRoomPerson:
		repeat with N running from 1 to the number of rows in the Table of WhiteRoomPerson Responses:
			choose row N in the Table of WhiteRoomPerson Responses;
			say "[Index entry].";
		

[Prostorija nakon Novih vrata unutar crvene sobe]	
RedEnd is a room. The description is  "This is the end, you face with reality that you are a monster, red is a color of anger.".

After going to the RedEnd:
		say "This is the end, you face with reality that you are a monster, red is a color of anger.";
		end the story saying "You have died!";
[end game]

	
[ tested not working
to list options from(T- a table name):
	let N be the number of rows in T:
		if N=0:
			say "There is nothing to ask me";
		else:
			say "You can ask me: ";
			repeat with X running from 1 to N minus 1:
				say "[index in row X of T][if N is greater then 2][end if]";
			if N is greater then 1:
				say "or";
			say "[index in row X of T]";
]
[Prostorija nakon Plavih vrata]
UnknownBlueRoom is a room.   "Room painted with blue, there are some wierd looking toys around, and someone standing in the middle of the room.".

The BlueRoomPerson is a person. BlueRoomPerson is in UnknownBlueRoom. The description is "Person wearing casual clothes.".
The BlueRoomPerson can be following or not following. BlueRoomPerson is not following.

Table of BlueRoomPerson Responses
Topic	Response	Index
"who are you"	"you are not ready to know that"	"who are you"

After asking BlueRoomPerson about something:
	if the topic understood is a topic listed in the Table of BlueRoomPerson Responses:
		say "[Response entry]";
	else:
		say "You are asking the wrong questions";
		

[Prostorija nakon Bijelih vrata]
UnknownWhiteRoom is a room. "Room painted with white, there is nothing in here.".

The WhiteRoomPerson is a person. WhiteRoomPerson is in UnknownWhiteRoom. "Person wearing casual clothes.".


Table of WhiteRoomPerson Responses
Topic	Response	Index
"who are you"	"you are not ready to know that"	"who are you"

After asking WhiteRoomPerson about something:
	if the topic understood is a topic listed in the Table of WhiteRoomPerson Responses:
		say "[Response entry]";
	else:
		say "You are asking the wrong questions";

[
The Drawbridge is a room. North of the Drawbridge is the Immensely Enormous Entry Hall. West of the Entry Hall is the Vast Dining Area. North of the Vast Dining Area is the Colossal Kitchen. The Spooky Guano-filled Attic is above the Entry Hall.

Count Dracula is a man in the Attic. "I am Dracula".
Every turn:
	if the location of Count Dracula is not the location of the player:
		let the way be the best route from the location of Count Dracula to the location of the player, using doors;
		try Count Dracula going the way;
	otherwise:
		say "'Muhahaha,' says Count Dracula."
]
[
Beach is a room. 

The crab is an animal in Beach. The description of the crab is "A crab, with bright red shell and long pincers."

The crab can be adoring or not adoring. The crab is not adoring. 

There is a fish head in Beach. The description of the fish head is "This fish head smells a bit, but the crab seems to eye it longingly."

Parking Lot is a room. Parking lot is north of Beach.
Sandbar is a room. Sandbar is west of Beach.
Ocean is a room. Ocean is south of Beach.

Instead of giving the fish head to the crab:
	say "The crab takes the fish head in its long pincers and devours it. The little fella looks at you and trundles in your direction.";
	now the crab is adoring;
	remove the fish head from play.

Every turn while the crab is adoring:
	let pth be the best route from the location of the crab to the location of the player;
	if pth is not nothing, try crab going pth.

]
[
When play begins:
say "[italic type]You are once again lost in a jungle far from home. You are ready to give up and go home, disappointed in yet another failed archaeological expedition. Just as you decide to turn back to camp, you suddenly stumble upon something...[roman type]".

The Forest is a room. "You stand in a clearing in the deep jungle. Obscured by centuries of overgrowth and dim sunlight is a ruined temple of some sort. Whatever details there may have been on the stone blocks have long since been worn away. There is a single, solitary entryway leading downward."

A mushroom is here. It is edible. "A polka-dotted [printed name] pokes out of the moist soil. It is possibly scrumptious." The description is "[if we have not examined the mushroom]Upon further examination, you decide that, while possibly scrumptious, it is also possibly a toadstool. You might want to keep examining it[otherwise]Now that you look at it again, you can see clearly that it is a toadstool; a nasty looking one, at that[end if]."

After taking the mushroom:
   say "You deftly snap the [printed name]'s stalk, and pluck the hapless fungus from its natural habitat."
  
After dropping the mushroom:
   say "You discard the abused [printed name] to the ground like a used facial tissue."

Understand "toadstool" as the mushroom;


After examining the mushroom for the second time:
   now the printed name of the mushroom is "toadstool".

After eating the mushroom:
   say "You pop the scrumptulescent mushroom treat into your mouth. It tastes like fungal-flavored candy. The gastronomical delight turns out to be a toadstool, and you succumb to its choking, asphyxiating aftertaste.";
   end the story saying "You have died".

[Bitan je ovaj dio scenery bez njega se odma pri pokretanju igre prikaze informacije ]
The temple is here. It is scenery. The description is "The stone blocks lie tumbled about, as if they were strewn about. Vines cover the upper half, while soil, leaves and grasses cover the bottom half. A set of steep stairs goes straight down into darkness."
]