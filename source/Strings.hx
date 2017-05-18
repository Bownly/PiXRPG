package;

import DialogClasses.DialogBox;
import DialogClasses.DialogLine;

/**
 * ...
 * @author ...
 */

 /**
 * All strings are stored here. This will make it easier for translating
 * ...although that might be getting way ahead of myself, haha.
 * It's more of a best practicies, habit forming kinda thing.
 */
class Strings
{
	public static var faces:Map<String, Int> = 
	[
		"p_normal"            => 0,
		"p_shock"             => 1,
		"p_glad"              => 2,
		"p_sad"               => 3,
		"p_mad"               => 4,
		"p_scared"            => 5,
		"p_hurt"              => 6,
		"p_smug"              => 7,

		"pfrog_normal"        => 8,
		"pfrog_shock"         => 9,
		"pfrog_glad"          => 10,
		"pfrog_sad"           => 11,
		"pfrog_mad"           => 12,
		"pfrog_scared"        => 13,
		"pfrog_hurt"          => 14,
		"pfrog_smug"          => 15,

		"r_normal"            => 16,
		"r_shock"             => 17,
		"r_glad"              => 18,
		"r_sad"               => 19,
		"r_mad"               => 20,
		"r_scared"            => 21,
		"r_hurt"              => 22,
		"r_smug"              => 23,

		"rfrog_normal"        => 24,
		"rfrog_shock"         => 25,
		"rfrog_glad"          => 26,
		"rfrog_sad"           => 27,
		"rfrog_mad"           => 28,
		"rfrog_scared"        => 29,
		"rfrog_hurt"          => 30,
		"rfrog_smug"          => 31,

		"rowlnpc_normal"      => 32,
		"rowlnpc_shock"       => 33,
		"rowlnpc_glad"        => 34,
		"rowlnpc_sad"         => 35,
		"rowlnpc_mad"         => 36,
		"rowlnpc_scared"      => 37,
		"rowlnpc_hurt"        => 38,
		"rowlnpc_smug"        => 39,

		"froggo_normal"       => 40,
		"froggo_shock"        => 41,
		"froggo_glad"         => 42,
		"froggo_sad"          => 43,
		"froggo_mad"          => 44,
		"froggo_scared"       => 45,
		"froggo_hurt"         => 46,
		"froggo_smug"         => 47,

		"dad_normal"          => 48,
		"dad_shock"           => 49,
		"dad_glad"            => 50,
		"dad_sad"             => 51,
		"dad_mad"             => 52,
		"dad_scared"          => 53,
		"dad_hurt"            => 54,
		"dad_smug"            => 55,

		"frognpcman_normal"   => 56,
		"frognpcman_shock"    => 57,
		"frognpcman_glad"     => 58,
		"frognpcman_sad"      => 59,
		"frognpcman_mad"      => 60,
		"frognpcman_scared"   => 61,
		"frognpcman_hurt"     => 62,
		"frognpcman_smug"     => 63,

		"frognpcwoman_normal" => 64,
		"frognpcwoman_shock"  => 65,
		"frognpcwoman_glad"   => 66,
		"frognpcwoman_sad"    => 67,
		"frognpcwoman_mad"    => 68,
		"frognpcwoman_scared" => 69,
		"frognpcwoman_hurt"   => 70,
		"frognpcwoman_smug"   => 71,

		"frognpckid_normal"   => 72,
		"frognpckid_shock"    => 73,
		"frognpckid_glad"     => 74,
		"frognpckid_sad"      => 75,
		"frognpckid_mad"      => 76,
		"frognpckid_scared"   => 77,
		"frognpckid_hurt"     => 78,
		"frognpckid_smug"     => 79,

		"owlnpc_normal"       => 80,
		"owlnpc_shock"        => 81,
		"owlnpc_glad"         => 82,
		"owlnpc_sad"          => 83,
		"owlnpc_mad"          => 84,
		"owlnpc_scared"       => 85,
		"owlnpc_hurt"         => 86,
		"owlnpc_smug"         => 87,

		"dummy"               => 88,
		"kekdoor"             => 89,
		"gondolagirl"         => 90
	];

	public static var stringVars:Map<String, String> =
	[
		"%pname%" => "Player",
		"%rivalname%" => "Brother",
		"%item%" => ":O",
	];

	public static var stringArray:Array<Array<DialogLine>> = [

		// 0
		[new DialogLine(faces["froggo_normal"], "blah blah blah blah blah blah"),
		],
		// 1
		[new DialogLine(faces["froggo_normal"], "blah blah blah blah blah blah"),
		],
		// 2
		[new DialogLine(faces["froggo_normal"], "blah blah blah blah blah blah"),
		],
		// 3
		[new DialogLine(faces["froggo_normal"], "blah blah blah blah blah blah"),
		],
		// 4
		[new DialogLine(faces["dummy"], "Hi ho! This is the battle screen! Up in the corner is a display of your MP (Mental Points) and your opponent's MP!"),
		 new DialogLine(faces["dummy"], "The goal of a battle is to reduce your opponent's MP to zero! The opponent's mental state is represented by the puzzle in the center!"),
		 new DialogLine(faces["dummy"], "In order to reduce your opponent's MP, you must solve that puzzle!"),
		 new DialogLine(faces["dummy"], "Each square in the grid can either be ON or OFF! The numbers indicate how many consecutive squares in each column or row should turned be ON!"),
		 new DialogLine(faces["dummy"], "When you fully solve a row or column, the corresponding numbers will turn grey!"),
		 new DialogLine(faces["dummy"], "Fill in squares with the \"J\" button and mark ones you suspect should remain OFF with the \"K\" button!"),
		 new DialogLine(faces["dummy"], "But be careful! If you incorrectly turn ON a square, the stress will cause you to lose some MP!"),
		 new DialogLine(faces["dummy"], "Also, note that some opponents may struggle in an attempt to thwart your puzzle solving efforts! They won't all be pushovers like I am!"),
		 new DialogLine(faces["dummy"], "Wew! That's a lot of info! Just give it a shot and you'll figure it out!"),
		],

		// 5
		[new DialogLine(faces["r_normal"], "Hey dude, A or B?")
		],
		// 6
		[new DialogLine(faces["r_normal"], "A? A+ Sketchless!")
		],
		// 7 
		[new DialogLine(faces["r_normal"], "B? Like Jerry Seinfeld's Bee Movie!")
		],
		// 8
		[new DialogLine(faces["frognpc_normal"], "Hey kid... wanna save?")
		],
		// 9
		[new DialogLine(faces["frognpc_normal"], "Game saved.")
		],

		// 10
		[new DialogLine(faces["dummy"], "Hi ho! I'm the practice dummy! Wanna practice!? C'mon, it'll be fun!")
		],

		// 11
		[new DialogLine(faces["frognpckid_shock"], "Oh! You're awake."),
		 new DialogLine(faces["frognpc_normal"], "I was wondering how long you were going to be out."),

		// Dialog branch:
		// Who are you?
		 new DialogLine(faces["frognpc_normal"], "I'm %Water Kid%, Prince of..."),
		 new DialogLine(faces["frognpckid_sad"], "Er..."),
		 new DialogLine(faces["frognpckid_glad"], "This base!"),

		// Where am I?
		 new DialogLine(faces["frognpc_normal"], "This is my secret base, located right in the middle of the Ice and Fire Kingdoms."),
 		 new DialogLine(faces["frognpc_normal"], "I found you washed up by the shore and carried you here. You've been out for two whole days."),

		 new DialogLine(faces["frognpc_normal"], "*You ask him about %rivalname%.*"),
 
		 new DialogLine(faces["frognpckid_sad"], "Sorry, %pname%, but you were the only person that I saw in the wreckage."),
		 new DialogLine(faces["frognpc_normal"], "But I'm sure your friend is okay! In fact, I bet he went to go find help for you!"),
		 new DialogLine(faces["frognpc_normal"], "Which means that he would have probably headed towards one of the nearby kingdoms."),
		 new DialogLine(faces["frognpc_normal"], "Either the Ice Kingdom to the North, or the Fire Kingdom to the South."),
		// note for below line: if IK is healers or whatever, mention that instead. Then, have flag for dialog after IK visit, telling MC to go try FK instead.
		 new DialogLine(faces["frognpc_normal"], "They're both equidistant from here, so your guess is as good as mine as to which one he went to."),
		 new DialogLine(faces["frognpckid_sad"], "No matter which one you go investigate, do me a favor: Please don't mention me or my secret base to anyone."),
		 new DialogLine(faces["frognpckid_glad"], "Well, good luck finding %rivalname%! And let me know if you manage to find him!"),
		 new DialogLine(faces["frognpc_normal"], "Oh, and if you need a place to rest in the meantime, you can crash here. You were out for a while and might still be weak."),

		 new DialogLine(faces["frognpc_normal"], "Hey, bud, how goes it?"),

		// Ice Kingdom
		 new DialogLine(faces["frognpc_normal"], "Halt! The entire Ice Kingdom is in lockdown right now. No one gets in and no one gets out until we locate Prince Water Kid."),

		// Fire Kingdom
		 new DialogLine(faces["frognpc_normal"], "Hello, traveller. Welcome to the Fire Kingdom."),

		 new DialogLine(faces["frognpc_normal"], "I've heard that the Ice Kingdom is in lockdown. Apparently Prince Water Kid ran away. I hope he's safe.")
		],

		// 12
		[new DialogLine(faces["gondolagirl"], "...")
		],
		// 13
		[new DialogLine(faces["p_normal"], "Save game")
		],		
		// 14
		[new DialogLine(faces["p_normal"], "Not now")
		],
		// 15
		[new DialogLine(faces["frognpc_normal"], "Sure")
		],
		// 16
		[new DialogLine(faces["frognpc_normal"], "No")
		],	
	];

	public static var inventoryStrings:Array<Array<DialogLine>> = [
		//	start of the game

		// 0
		[new DialogLine(faces["p_glad"], "%item% get!")
		],
		// 1
		[new DialogLine(faces["pfrog_glad"], "%item% get!")
		],
	];

	public static var mchomeStrings:Array<Array<DialogLine>> = [
		//	start of the game
		// 0
		[new DialogLine(faces["r_glad"], "%pname%, check it out! I snagged a couple pens from Dad's collection again. C'mon, let's go try them out!")
		],
		// 1
		[new DialogLine(faces["p_glad"], "Yeah, okay!")
		],
		// 2
		[new DialogLine(faces["p_shock"], "But Dad said we aren't allowed to use his pens.")
		],
		// 3
		[new DialogLine(faces["r_glad"], "Hehe. What Dad doesn't know, won't hurt him.")
		],
		// 4
		[new DialogLine(faces["dad_normal"], "Boys, wake up and come downstairs! It's family meeting time!")
		],
		// 5
		[new DialogLine(faces["r_shock"], "Aw, busted already? Don't worry, I'll go on ahead and sort this out.")
		],
		
		// go downstairs
		// 6
		[new DialogLine(faces["r_shock"], "He's one unhappy camper.")
		],
		// 7
		[new DialogLine(faces["dad_normal"], "%pname%! This is the fifth time this month that I've noticed my pen collection has been mysteriously shrinking."),
		 new DialogLine(faces["dad_normal"], "You wouldn't happen to know anything about that, would you?")
		],
		// 8
		[new DialogLine(faces["p_normal"], "%rivalname% took them! I didn't do anything!")
		],
		// 9
		[new DialogLine(faces["dad_mad"], "Funny, %rivalname% said the exact opposite. One of you is lying, but you're both guilty either way so it doesn't matter!"),
		 new DialogLine(faces["dad_mad"], "I've warned you both countless times that my pens become dangerous weapons in the wrong hands."),
		 new DialogLine(faces["dad_mad"], "Doubly so for untrained kids like you two."),
		 new DialogLine(faces["dad_mad"], "I can't risk you two running around recklessly, potentially endangering anything--or anyone--in your path."),
		 new DialogLine(faces["p_sad"], "Does that mean we're grounded again?"),
		 new DialogLine(faces["dad_normal"], "No, not this time. It's become clear that the only way to stop you two from misusing my pens is to have you learn how to use them correctly."),
		 new DialogLine(faces["dad_normal"], "I've already spoken with Elder Froggo who lives up North. He's agreed to instruct you both... Starting today."),
		 new DialogLine(faces["r_glad"], "Wow, really!? Finally! %pname%, do you know what that means?"),
		 new DialogLine(faces["p_glad"], "It means we get to be mages, just like Dad!"),
		 new DialogLine(faces["dad_normal"], "And just like my father and his father before him. I thought that moving away from the pond would allow me to put my magician days behind me."),
		 new DialogLine(faces["dad_normal"], "Or rather, that was the comforting lie I told myself. Magic is a family tradition, after all. It was only a matter of time until the magic would begin to awaken in you two."),
		 new DialogLine(faces["dad_glad"], "Now, hurry up and get going! You don't want to keep Elder Froggo waiting."),
		 new DialogLine(faces["r_glad"], "Of course! Let's go, %pname%!"),
		 new DialogLine(faces["dad_normal"], "Oh wait! I almost forgot something important. Take these beginner pens with you. Those are family heirlooms, so be sure to treat them well."),
		 new DialogLine(faces["p_glad"], "Wow, thank you, Dad!"),
		 new DialogLine(faces["r_normal"], "Yeah, thanks. These don't feel as magical as the ones in your collection, but they'll do. Let's go, %pname%!"),
		],

		// talk before leaving for frogpond for the first time
		// 10
		[new DialogLine(faces["dad_normal"], "Don't dally! Elder Froggo is a man of infinite patience, but it's still rude to keep him waiting for too long."),
		],

		// return from Frogpond for the first time
		// 11
		[new DialogLine(faces["owlnpc_glad"], "Hahaha! I thought you would have put up more of a fight. To think that the former \"great hero\" could have fallen this far from grace..."),
 		 new DialogLine(faces["owlnpc_glad"], "Not that you can understand me anyway. Your mind is far too gone by now. Hahaha!")
		],
		// 12
		[new DialogLine(faces["r_mad"], "Who are you and what are you doing here!?"),
		 new DialogLine(faces["p_shock"], "Dad, are you okay!?")
		],
		// 13
		[new DialogLine(faces["owlnpc_glad"], "\"Dad\"? So he great hero had a couple brats, huh? No wonder he's become so weak."),
		 new DialogLine(faces["owlnpc_glad"], "Nothing personal, but I'm going to have to mind blast you both too.")
		],
		// 14
		[new DialogLine(faces["r_mad"], "%pname%, I'll handle this chump. You go help out Dad."),
		 new DialogLine(faces["r_mad"], "Bring it on, bird brain!")
		],
		// 15  // when you talk to either combatant
		[new DialogLine(faces["p_shock"], "%rivalname%!")
		],
		// 16
		[new DialogLine(faces["p_shock"], "Dad? Are you alright?"),
		 new DialogLine(faces["p_sad"], "He's not responding. It's like he's in a coma."),
		 new DialogLine(faces["p_sad"], "...Dad...")
		],
		// 17
		[new DialogLine(faces["r_hurt"], "Gah!"),
		 new DialogLine(faces["owlnpc_glad"], "Heh. Like father like son!"),
		 new DialogLine(faces["owlnpc_hurt"], "(Although, all this fighting has tired me out. I should leave soon.)")
		],
		// 18
		[new DialogLine(faces["owlnpc_glad"], "Hey, brat! My job here is done, and you don't look worth the effort required to deal with, so I'm going to make my leave now.")
		],
		// 19
		[new DialogLine(faces["p_sad"], "(I can't just sit here and let him get away, but I don't stand a chance against him. What should I do?)"),
		 new DialogLine(faces["p_sad"], "(...)"),
		 new DialogLine(faces["p_mad"], "(...)"),
		 new DialogLine(faces["p_mad"], "(Welp, here goes something.)"),
		 new DialogLine(faces["p_mad"], "Not so fast!")
		],
		
		// 20
		[new DialogLine(faces["owlnpc_hurt"], "(So the wimp has some guts, huh? No matter, I should have enough left in me to deal with a kid this weak.)")
		],

		// after battle with owl
		// 21
		[new DialogLine(faces["owlnpc_hurt"], "(Those previous fights took too much out of me. I need to get out of here quickly.)"),
		 new DialogLine(faces["owlnpc_glad"], "I'd love to stay and play some more, but I really must go.")
		],
		// 22  // owl leaves
		[new DialogLine(faces["p_hurt"], "Phew. Another moment and I would have been a goner. I've got to go back to The Pond. Surely Elder Froggo would know how to cure Dad and %rivalname%.")
		],

		// 23
		[new DialogLine(faces["p_sad"], "He's been mind blasted by that owl guy. Elder Froggo must know how to fix this.")
		],

		// after returning with Froggo
		// 24
		[new DialogLine(faces["froggo_normal"], "Hmm...")
		],
		// walk to other victim
		// 24
		[new DialogLine(faces["froggo_normal"], "I see...")
		],
		// walk back to mc
		// 25
		[new DialogLine(faces["p_sad"], "Well? Can you fix them?"),
		 new DialogLine(faces["froggo_normal"], "The damage done to %rivalname% is minimal, likely thanks to your father having already weakened that owl clan thug."),
		 new DialogLine(faces["froggo_normal"], "I should be able to fix him right up, but it will take some time."),
		 new DialogLine(faces["p_glad"], "Great! What about Dad?"),
		 new DialogLine(faces["froggo_normal"], "Hmm. Sadly, the damage done onto your father is too severe for me to handle."),
		 new DialogLine(faces["p_sad"], "Then, does that mean... he'll be stuck like this forever?"),
		 new DialogLine(faces["froggo_normal"], "This may be beyond my abilities, but the Frog King should be able to help."),
		 new DialogLine(faces["p_shock"], "Who's the Frog King?"),
		 new DialogLine(faces["froggo_normal"], "He's the central leader of all the Frog Clans, and also the most powerful frog magician. He lives on the main continent in the Frog Kingdom."),
		 new DialogLine(faces["froggo_normal"], "I can lend you a boat and give you directions on how to get there. If you tell him that I sent you, he'll agree to help immediately."),
		 new DialogLine(faces["p_scared"], "This is all too much. I can't possibly travel all alone! "),
		 new DialogLine(faces["froggo_normal"], "I observed you during your training, %pname%. You are far more capable than you give yourself credit for. Besides, your family is depending on you."),
		 new DialogLine(faces["froggo_normal"], "Now then, I'm going to take these two back to The Pond so I can get started on curing them. Come see me when you're ready to depart.")
		]

	];

	public static var frogpondStrings:Array<Array<DialogLine>> = [
		// 0
		[new DialogLine(faces["froggo_normal"], "Well met, %pname% and %rivalname%! Welcome to The Pond, the place where all young boys of the frog clan come to become mages. We've been expecting you two."),
		 new DialogLine(faces["froggo_normal"], "Your father might not have mentioned it, but did you know that I also trained him back when he was around your age?"),
		 new DialogLine(faces["froggo_normal"], "He was quite the skilled mage--and I can sense a similar power in the both of you. Must be your good genes, hohoho."),
		 new DialogLine(faces["froggo_normal"], "As you may or may not know, there are many types of magic in this world. We of the frog clan call our magic \"frog magic\", for obvious reasons."),
		 new DialogLine(faces["froggo_normal"], "While some magic schools can shoot fire or heal wounds, frog magic is limited to the world of the mind."),
		 new DialogLine(faces["froggo_normal"], "The average frog mage uses his magic to help people suffering from problems like phobias, traumas, or writer's block."),
		 new DialogLine(faces["froggo_normal"], "At their most powerful, frog mages can control the very thoughts of any living creature. But most mages never make it to that level."),
		 new DialogLine(faces["froggo_normal"], "I do not exaggerate when I say that frog magic is potentially the most powerful school of magic. And because of that, it is also requires the most discipline to use."),
		 new DialogLine(faces["froggo_normal"], "In order to prevent abuse, all frog mages must swear an oath to never use their powers for evil. Frog magic is exclusively meant for helping people."),
		 new DialogLine(faces["froggo_normal"], "If you use frog magic for nefarious or selfish reasons, you risk becoming corrupted and evil. The owl clan is living proof of that."),
		 new DialogLine(faces["froggo_normal"], "Well, at any rate, I think you've heard enough of this old man's ramblings. After all, we'll have plenty more opportunities for me to teach you all that you need to know."),
		 new DialogLine(faces["froggo_normal"], "I can tell that you're both itching to start your training. As is tradition, all aspiring new frog mages have to go through the cave of initiation to start their training."),
		 new DialogLine(faces["froggo_normal"], "You can reach the cave through the back door of my house. Here, follow me.")
		],

		// 1
		[new DialogLine(faces["froggo_normal"], "The cave's entrance is just through the back door over there to the left. Good luck, and frogspeed."), 
		 new DialogLine(faces["froggo_normal"], "Oh, and be sure to talk to my training dummy friend down there if you want to review the fundamentals of how to use frog magic!")
		],

		// 2
		[new DialogLine(faces["frognpcman_glad"], "I've collected so many barrels that I can't even get to my bed anymore."), 
		 new DialogLine(faces["frognpcman_glad"], "Sleeping on the floor isn't so bad once you get used to it.")
		],

		// 3
		[new DialogLine(faces["frognpcman_normal"], "Y'know, I always thought it was funny how your dad wanted to move away to escape the mage life, but he ended up moving to tadpole island of all places."),
		 new DialogLine(faces["frognpcman_normal"], "I mean, there's nothing on this island other than The Pond. What was he thinking?"),
		 new DialogLine(faces["frognpcman_shock"], "Oh, sorry! That was rude. I have this habit of saying things that I shouldn't."),
		],

		// 4
		[new DialogLine(faces["frognpcman_normal"], "Greetings, %pname%. Did you know that I’m hosting an exchange student? Her name is, uh... well, I forgot. My memory isn't the best."),
		 new DialogLine(faces["frognpcman_normal"], "She’s from that one tribe of mute folk. I can't remember their name, and she won't tell me. But you've heard of them, haven't you? They wear those funny bear hats."),
		 new DialogLine(faces["frognpcman_normal"], "Like the frog clan, they’re a magical people, but their magic is of a different ilk. Whereas frog magic is based on the mind, their magic draws power from nature."),
		 new DialogLine(faces["frognpcman_normal"], "It’s said that they can channel nature spirits to do things like heal people and \"save\", whatever that means. ")
		],

		// 5
		[new DialogLine(faces["frognpcman_normal"], "Greetings. It's rare that we get visitors here at The Pond. You must be %pname% and %rivalname%."),
		 new DialogLine(faces["frognpcman_normal"], "In that case, you'll want to head to Elder Froggo's. This bridge here will take you right to his front door. You can't miss it.")
		],

		// 6
		[new DialogLine(faces["r_normal"], "Hurry up, %pname%, let's go!")
		],

		// 7
		[new DialogLine(faces["p_normal"], "It says \"Elder Froggo's house\".")
		],
		
		// inserted in, below entries are misnumbered
		

		// after owl guy mind blasts family
		[new DialogLine(faces["frognpcman_sad"], "Why so sad? Not enough barrels?")
		],
		[new DialogLine(faces["frognpcman_normal"], "%pname%, you look all shaken up. Are you okay?")
		],
		[new DialogLine(faces["null"], "reserved 8")
		],
		[new DialogLine(faces["null"], "reserved")
		],

		// new DialogLine(faces[""], "")

		// go to froggo -> Tell him -> "that's bad news" + "Let's head over right away"
		[new DialogLine(faces["froggo_normal"], "temp 10")
		],

		// after meeting froggo at mchome and he tells you about the boat
		// "here's boat, here's hood, we'll take care of your family"
		[new DialogLine(faces["froggo_normal"], "temp 11")
		],
		// gossipy npc
		[new DialogLine(faces["frognpcman_sad"], "%pname%, I heard the bad news. I'm so sorry."),
		 new DialogLine(faces["frognpcman_glad"], "But at least they couldn't be in more capable hands!"),
		 new DialogLine(faces["frognpcman_normal"], "Well, technically that's not true--the Frog King is much more capable. I mean, Elder Froggo can only do so much..."),
		 new DialogLine(faces["frognpcman_shock"], "Oh no! There I go blurting out my train of thoughts again. When will I learn?")
		],
		[new DialogLine(faces["frognpcman_normal"], "Don't worry, %pname%. We'll take good care of your family. Safe travels, and frogspeed.")
		],
		[new DialogLine(faces["frognpcman_glad"], "If you ever need any barrels, just say the word and I'll help you out, man.")
		],



	];

	public static var frogponddunStrings:Array<Array<DialogLine>> = [
		// 0
		[new DialogLine(faces["dummy"], "Hi ho! I'm the practice dummy! I can teach you how to use magic! Wanna give it a shot!? C'mon, it'll be fun!")
		],
		// 1
		[new DialogLine(faces["p_normal"], "Sure.")
		],
		// 2
		[new DialogLine(faces["p_normal"], "I'm good.")
		],	
		// 3
		[new DialogLine(faces["dummy"], "Sweet! Let's go!")
		],
		// 4
		[new DialogLine(faces["dummy"], "Oh well! Maybe later!")
		],
		// 5
		[new DialogLine(faces["dummy"], "Hi ho! This is the battle screen! Up in the corner is a display of your MP (Mental Points) and your opponent's MP!"),
		 new DialogLine(faces["dummy"], "The goal of a battle is to reduce your opponent's MP to zero! The opponent's mental state is represented by the puzzle in the center!"),
		 new DialogLine(faces["dummy"], "In order to reduce your opponent's MP, you must solve that puzzle!"),
		 new DialogLine(faces["dummy"], "Each square in the grid can either be ON or OFF! The numbers indicate how many consecutive squares in each column or row should turned be ON!"),
		 new DialogLine(faces["dummy"], "When you fully solve a row or column, the corresponding numbers will turn grey!"),
		 new DialogLine(faces["dummy"], "Fill in squares with the \"J\" button and mark ones you suspect should remain OFF with the \"K\" button!"),
		 new DialogLine(faces["dummy"], "But be careful! If you incorrectly turn ON a square, the stress will cause you to lose some MP!"),
		 new DialogLine(faces["dummy"], "Also, note that some opponents may struggle in an attempt to thwart your puzzle solving efforts! They won't all be pushovers like I am!"),
		 new DialogLine(faces["dummy"], "Wew! That's a lot of info! Just give it a shot and you'll figure it out!"),
		],

		// 6
		[new DialogLine(faces["kekdoor"], "Hello. I’m Doory, the door. You have to prove your skills to me if you want to pass through here. That’s how things work down here in the cave of initiation.")
		],

		// 7
		[new DialogLine(faces["kekdoor"], "You’ve reached the end of the first floor. Nice! Just pass through me and you can proceed to the next floor."),
		 new DialogLine(faces["kekdoor"], "By the way, watch out for wild frogs down there. The lack of sunlight makes them easily agitated, and they might jump out at you.")
		],

		// 8
		[new DialogLine(faces["kekdoor"], "Here’s a hint: you should use some healing items if your MP starts to get low."),
		 new DialogLine(faces["kekdoor"], "If you can complete my trial, there may or may not be a nice healing item waiting for you in that chest right behind me.")
		],

		// 9
		[new DialogLine(faces["kekdoor"], "These basement frogs aren’t as passive as we doors are. They’ll try to obstruct your magic as you battle them."),
		 new DialogLine(faces["kekdoor"], "They can’t actually lower your MP, but it’s still a bother.")
		],

		// 10
		[new DialogLine(faces["kekdoor"], "Don’t tell Elder Froggo, but I’m feeling under the weather right now and can’t offer you a trial. How about we settle for a joke instead? Okay, ready?"),
		 new DialogLine(faces["kekdoor"], "When is a door not a door? When it’s a jar! Hehehe. That one’s a real knee-slapper, even though I don’t have any knees!")
		],

		// 11
		[new DialogLine(faces["kekdoor"], "Don’t you think that it’s weird how there can be basements floors in a lake dungeon? Or how said lake dungeon is under another lake?"),
		 new DialogLine(faces["kekdoor"], "That’s the kind of stuff I think about whenever I have any spare time in between trials. Speaking of which...")
		], 
		// 12
		[new DialogLine(faces["kekdoor"], "Did you know? The doors in this dungeon are highly unprofessional. We mostly just want to shoot the breeze, not serve as a makeshift tutorial to some scrubs."),
		 new DialogLine(faces["kekdoor"], "That’s supposed to be that tutorial dummy’s job! Between you and me, I’d much rather spend my time chatting up Doory. She's one fine dame."),
		 new DialogLine(faces["kekdoor"], "..."),
		 new DialogLine(faces["kekdoor"], "Hey, what are you still doing here? Oh right, you're here for a trial. Okay, let's go!")
		],

		// 13
		[new DialogLine(faces["kekdoor"], "The name’s Doorbert and I’m the final door in the dungeon. I’m not like the other doors. Well, I mean, I’m functionally the same in most objective measures..."),
		 new DialogLine(faces["kekdoor"], "...But I’m not as big a pushover as they are!")
		],

		// 14
		[new DialogLine(faces["p_shock"], "It’s empty, but I think it caused that splashy sound. Maybe it triggered something.")
		],

		// 15
		[new DialogLine(faces["p_shock"], "It’s a mimic!")
		],

		// 16
		[new DialogLine(faces["dad_normal"], "Sup. Don't mind me. Just watching some tv."),
		],
	];


}





























