package;

import DialogClasses.DialogBox;
import DialogClasses.DialogLine;

/**
 * ...
 * @author Bownly
 */

 /**
 * All strings are stored here. This will make it easier for translating
 * ...although that might be getting way ahead of myself, haha.
 * It's more of a best practicies, habit forming kinda thing.
 */
class Strings
{
	public static var faces:Map<String, Int> = [
		"p_normal"            => 0,
		"p_shock"             => 1,
		"p_glad"              => 2,
		"p_sad"               => 3,
		"p_mad"               => 4,
		"p_vexed"             => 5,
		"p_hurt"              => 6,
		"p_smug"              => 7,

		"ptad_normal"         => 8,
		"ptad_shock"          => 9,
		"ptad_glad"           => 10,
		"ptad_sad"            => 11,
		"ptad_mad"            => 12,
		"ptad_vexed"          => 13,
		"ptad_hurt"           => 14,
		"ptad_smug"           => 15,

		"pfrog_normal"        => 16,
		"pfrog_shock"         => 17,
		"pfrog_glad"          => 18,
		"pfrog_sad"           => 19,
		"pfrog_mad"           => 20,
		"pfrog_vexed"         => 21,
		"pfrog_hurt"          => 22,
		"pfrog_smug"          => 23,

		"dad_normal"          => 24,
		"dad_shock"           => 25,
		"dad_glad"            => 26,
		"dad_sad"             => 27,
		"dad_mad"             => 28,
		"dad_scared"          => 29,
		"dad_hurt"            => 30,
		"dad_smug"            => 31,

		"r_normal"            => 32,
		"r_shock"             => 33,
		"r_glad"              => 34,
		"r_sad"               => 35,
		"r_mad"               => 36,
		"r_scared"            => 37,
		"r_hurt"              => 38,
		"r_smug"              => 39,

		"rfrog_normal"        => 40,
		"rfrog_shock"         => 41,
		"rfrog_glad"          => 42,
		"rfrog_sad"           => 43,
		"rfrog_mad"           => 44,
		"rfrog_scared"        => 45,
		"rfrog_hurt"          => 46,
		"rfrog_smug"          => 47,

		"froggo_normal"       => 48,
		"froggo_shock"        => 49,
		"froggo_glad"         => 50,
		"froggo_sad"          => 51,
		"froggo_mad"          => 52,
		"froggo_scared"       => 53,
		"froggo_hurt"         => 54,
		"froggo_smug"         => 55,

		"dummy"               => 56,
		"kekdoor"             => 57,
		"gondolagirl"         => 58,
		"null1"               => 59,
		"null2"               => 60,
		"null3"               => 61,
		"null4"               => 62,
		"null5"               => 63,

		"frogman_normal"      => 64,
		"frogman_shock"       => 65,
		"frogman_glad"        => 66,
		"frogman_sad"         => 67,
		"frogman_mad"         => 68,
		"frogman_vexed"       => 69,
		"frogman_hurt"        => 70,
		"frogman_smug"        => 71,

		"frogwoman_normal"    => 72,
		"frogwoman_shock"     => 73,
		"frogwoman_glad"      => 74,
		"frogwoman_sad"       => 75,
		"frogwoman_mad"       => 76,
		"frogwoman_vexed"     => 77,
		"frogwoman_hurt"      => 78,
		"frogwoman_smug"      => 79,

		"frogboy_normal"      => 80,
		"frogboy_shock"       => 81,
		"frogboy_glad"        => 82,
		"frogboy_sad"         => 83,
		"frogboy_mad"         => 84,
		"frogboy_vexed"       => 85,
		"frogboy_hurt"        => 86,
		"frogboy_smug"        => 87,

		"froggirl_normal"     => 88,
		"froggirl_shock"      => 89,
		"froggirl_glad"       => 90,
		"froggirl_sad"        => 91,
		"froggirl_mad"        => 92,
		"froggirl_vexed"      => 93,
		"froggirl_hurt"       => 94,
		"froggirl_smug"       => 95,

		"owlnpc_normal"       => 96,
		"owlnpc_shock"        => 97,
		"owlnpc_glad"         => 98,
		"owlnpc_sad"          => 99,
		"owlnpc_mad"          => 100,
		"owlnpc_scared"       => 101,
		"owlnpc_hurt"         => 102,
		"owlnpc_smug"         => 103,

		// chapter 1
		"waterkid_normal"     => 104,
		"waterkid_shock"      => 105,
		"waterkid_glad"       => 106,
		"waterkid_sad"        => 107,
		"waterkid_mad"        => 108,
		"waterkid_vexed"      => 109,
		"waterkid_blush"      => 110,
		"waterkid_worry"      => 111,
	
		"frostking_normal"    => 112,
		"frostking_shock"     => 113,
		"frostking_glad"      => 114,
		"frostking_caring"    => 115,
		"frostking_mad"       => 116,
		"frostking_vexed"     => 117,
		"frostking_hurt"      => 118,
		"frostking_crazy"     => 119,
	
		"frostman_normal"     => 120,
		"frostman_shock"      => 121,
		"frostman_glad"       => 122,
		"frostman_sad"        => 123,
		"frostman_mad"        => 124,
		"frostman_vexed"      => 125,
		"frostman_hurt"       => 126,
		"frostman_smug"       => 127,
	
		"frostwoman_normal"   => 128,
		"frostwoman_shock"    => 129,
		"frostwoman_glad"     => 130,
		"frostwoman_sad"      => 131,
		"frostwoman_mad"      => 132,
		"frostwoman_vexed"    => 133,
		"frostwoman_hurt"     => 134,
		"frostwoman_smug"     => 135,
	
		"frostboy_normal"     => 136,
		"frostboy_shock"      => 137,
		"frostboy_glad"       => 138,
		"frostboy_sad"        => 139,
		"frostboy_mad"        => 140,
		"frostboy_vexed"      => 141,
		"frostboy_hurt"       => 142,
		"frostboy_smug"       => 143,
	
		"frostgirl_normal"    => 144,
		"frostgirl_shock"     => 145,
		"frostgirl_glad"      => 146,
		"frostgirl_sad"       => 147,
		"frostgirl_mad"       => 148,
		"frostgirl_vexed"     => 149,
		"frostgirl_hurt"      => 150,
		"frostgirl_smug"      => 151,
	
		"frostguard_normal"   => 152,
		"frostguard_shock"    => 153,
		"frostguard_glad"     => 154,
		"frostguard_sad"      => 155,
		"frostguard_mad"      => 156,
		"frostguard_vexed"    => 157,
		"frostguard_hurt"     => 158,
		"frostguard_smug"     => 159,

		"fireking_normal"     => 160,
		"fireking_shock"      => 161,
		"fireking_glad"       => 162,
		"fireking_caring"     => 163,
		"fireking_mad"        => 164,
		"fireking_vexed"      => 165,
		"fireking_hurt"       => 166,
		"fireking_crazy"      => 167,
	
		"fireman_normal"      => 168,
		"fireman_shock"       => 169,
		"fireman_glad"        => 170,
		"fireman_sad"         => 171,
		"fireman_mad"         => 172,
		"fireman_vexed"       => 173,
		"fireman_hurt"        => 174,
		"fireman_smug"        => 175,
	
		"firewoman_normal"    => 176,
		"firewoman_shock"     => 177,
		"firewoman_glad"      => 178,
		"firewoman_sad"       => 179,
		"firewoman_mad"       => 180,
		"firewoman_vexed"     => 181,
		"firewoman_hurt"      => 182,
		"firewoman_smug"      => 183,

		"fireboy_normal"      => 184,
		"fireboy_shock"       => 185,
		"fireboy_glad"        => 186,
		"fireboy_sad"         => 187,
		"fireboy_mad"         => 188,
		"fireboy_vexed"       => 189,
		"fireboy_hurt"        => 190,
		"fireboy_smug"        => 191,
	
		"firegirl_normal"     => 192,
		"firegirl_shock"      => 193,
		"firegirl_glad"       => 194,
		"firegirl_sad"        => 195,
		"firegirl_mad"        => 196,
		"firegirl_vexed"      => 197,
		"firegirl_hurt"       => 198,
		"firegirl_smug"       => 199,
	
		"fireguard_normal"    => 200,
		"fireguard_shock"     => 201,
		"fireguard_glad"      => 202,
		"fireguard_sad"       => 203,
		"fireguard_mad"       => 204,
		"fireguard_vexed"     => 205,
		"fireguard_hurt"      => 206,
		"fireguard_smug"      => 207,
	];

	public static var stringVars:Map<String, String> = [
		"%title%"        => "Frogicross",
		"%pname%"        => "Player",
		"%jason%"        => "Jason",       // The name Bill Toads refers to you by
		"%pnameDefault%" => "Tad",
		"%rnameDefault%" => "Seth",
		"%rivalname%"    => "Brother",
		"%item%"         => ":O",
		"%level%"        => "2",
		"%xp%"           => "10",
		"%number%"       => "0",
	];

	public static var stringArray:Array<Array<DialogLine>> = [

		// 0
		[new DialogLine(faces["p_normal"], "Save game")],		
		// 1
		[new DialogLine(faces["p_normal"], "Not now")],
		// 2
		[new DialogLine(faces["pfrog_normal"], "Save game")],		
		// 3
		[new DialogLine(faces["pfrog_normal"], "Not now")],
		// 4
		[new DialogLine(faces["gondolagirl"], "...")
		],

		// 5
		[new DialogLine(faces["p_glad"], "Wow! %xp% XP! Nice.")],
		// 6
		[new DialogLine(faces["p_glad"], "I-I did it! And I just got %xp% XP to boot!")],
		// 7
		[new DialogLine(faces["p_glad"], "And that's another %xp% XP. I'm bound to level up soon, right?")],
		// 8
		[new DialogLine(faces["p_glad"], "What? %xp% XP? I think I'm getting better at this.")],

		// 9
		[new DialogLine(faces["pfrog_glad"], "Another day, another %xp% XP.")],
		// 10
		[new DialogLine(faces["pfrog_glad"], "How much XP was that worth? Maybe %xp% XP? Yeah, that seems about right.")],
		// 11
		[new DialogLine(faces["pfrog_glad"], "Hope I sorted you out. I'd say so, given the %xp% XP I just got.")],
		// 12
		[new DialogLine(faces["pfrog_glad"], "Another %xp% XP. I'm bound to become quite the expert Frog Mage at this rate.")],


		// 13
		[new DialogLine(faces["p_glad"], "Sweet! Another Level Point! I now have %level% LP!")],
		// 14
		[new DialogLine(faces["pfrog_glad"], "Sweet! Another Level Point! I now have %level% LP!")],	


		// 15
		[new DialogLine(faces["froggo_normal"], "blah blah blah blah blah"),
		],
		// 16
		[new DialogLine(faces["froggo_normal"], "blah blah blah blah blah blah"),
		],
	];

	public static var inventoryStrings:Array<Array<DialogLine>> = [
		// 0
		[new DialogLine(faces["p_glad"], "%item% get!")],
		// 1
		[new DialogLine(faces["pfrog_glad"], "%item% get!")],
		// 2 
		[new DialogLine(faces["p_normal"], "Nothing left to do in this menu.")],
	];

	public static var itemDescriptions:Map<String, String> = [
		"Pond Scum"      => "Fully heals MP.\nRelax, it's the name of a popular sports drink. They're not only delicious, but they're also nutritious!",
		"Edible Barrel"  => "Heals 20 MP.\nIt's an... edible barrel? Not sure what that means, but it's apparently healthy enough. I just hope I don't get any splinters from eating this.",
		"Soggy Ration"   => "Heals 15 MP.\nIt's a prepackaged food item soaked by WATERKID's natural ooze. The instructions on these say \"just add water\", but not this much!",
		"Escape Rope"    => "Instantly warps the user out of a dungeon.\nFiller description for the item.",
	];

	public static var mchouseStrings:Array<Array<DialogLine>> = [
		//	item descriptions
		// 0
		[new DialogLine(faces["p_sad"], "As much as I'd rather leave and escape Dad's scolding, the door is locked.")],
		// 1
		[new DialogLine(faces["p_normal"], "Dad's pen collection. We aren't supposed to touch them, but playing with them has always been %rivalname%\'s number one hobby.")],
		// 2
		[new DialogLine(faces["p_normal"], "Half of Dad's books are about esoteric Frog Magic. The other half are black and white picture books written in some weird, possibly ancient, language.")],
		// 3
		[new DialogLine(faces["p_normal"], "Just some normal food storage. Nothing to see here.")],
		// 4
		[new DialogLine(faces["p_normal"], "")],
		// 5
		[new DialogLine(faces["p_normal"], "")],


		// go downstairs
		// 6
		[new DialogLine(faces["r_shock"], "He's one unhappy camper.")],
	
		// 7
		[new DialogLine(faces["dad_normal"], "%pname%! This is the fifth time this month that I've noticed my pen collection has been mysteriously shrinking."),
		 new DialogLine(faces["dad_normal"], "You wouldn't happen to know anything about that, would you?")
		],
	
		// 8
		[new DialogLine(faces["p_normal"], "%rivalname% took them! I didn't do anything!")],

		// 9
		[new DialogLine(faces["dad_mad"], "Funny, %rivalname% said the exact opposite. One of you is lying, but you're both guilty either way so it doesn't matter!"),
		 new DialogLine(faces["dad_mad"], "I've warned you both countless times that my pens become dangerous weapons in the wrong hands."),
		 new DialogLine(faces["dad_mad"], "Doubly so for untrained kids like you two."),
		 new DialogLine(faces["dad_mad"], "I can't risk you two running around recklessly, potentially endangering anything--or anyone--in your path.")
		],
	
		// 10
		[new DialogLine(faces["p_sad"], "Does that mean we're grounded again?")],

		// 11
		[new DialogLine(faces["dad_normal"], "No, not this time. It's become clear that the only way to stop you two from misusing my pens is to have you learn how to use them correctly."),
		 new DialogLine(faces["dad_normal"], "I've already spoken with Elder Froggo who lives up North. He's agreed to instruct you both... Starting today.")
		],

		// 12
		[new DialogLine(faces["r_glad"], "Wow, really!? Finally! %pname%, do you know what that means?")],

		// 13
		[new DialogLine(faces["p_glad"], "It means we get to be mages, just like Dad!")],

		// 14
		[new DialogLine(faces["dad_normal"], "And just like my father and his father before him. I thought that moving away from the pond would allow me to put my magic days behind me."),
		 new DialogLine(faces["dad_normal"], "Or rather, that was the comforting lie I told myself. Magic is a family tradition, after all. It was only a matter of time until the magic would begin to awaken in you two."),
		 new DialogLine(faces["dad_glad"], "Now, hurry up and get going! You don't want to keep Elder Froggo waiting.")
		],

		// 15
		[new DialogLine(faces["r_glad"], "Of course! Let's go, %pname%!")],

		// 16
		[new DialogLine(faces["dad_normal"], "Oh wait! I almost forgot something important. Take these beginner pens with you. Those are family heirlooms, so be sure to treat them well."),
		 new DialogLine(faces["dad_normal"], "You can manage your pens by pressing \"L\".")
		 ],

		// 17
		[new DialogLine(faces["p_glad"], "Wow, thank you, Dad!")],

		// 18
		[new DialogLine(faces["r_normal"], "Yeah, thanks. These don't feel as magical as the ones in your collection, but they'll do.")],

		// 19
		[new DialogLine(faces["r_normal"], "Let's hurry up and go, %pname%!")],


		// talk before leaving for frogpond for the first time
		// 20
		[new DialogLine(faces["dad_normal"], "Don't dally! Elder Froggo is a man of infinite patience, but it's still rude to keep him waiting for too long."),],


		// return from Frogpond for the first time
		// 21
		[new DialogLine(faces["owlnpc_glad"], "Hahaha! I thought you would have put up more of a fight. To think that the former \"great hero\" could have fallen this far from grace..."),
 		 new DialogLine(faces["owlnpc_glad"], "Not that you can understand me anyway. Your mind is far too gone by now. Hahaha!")
		],
	
		// 22
		[new DialogLine(faces["r_mad"], "Who are you and what are you doing here!?"),
		 new DialogLine(faces["p_shock"], "Dad, are you okay!?")
		],
	
		// 23
		[new DialogLine(faces["owlnpc_glad"], "\"Dad\"? So he great hero had a couple brats, huh? No wonder he's become so weak."),
		 new DialogLine(faces["owlnpc_glad"], "Heh, nothing personal, kids, but I'm going to have to mindblast you both too.")
		],
	
		// 24
		[new DialogLine(faces["r_mad"], "%pname%, I'll handle this chump. You go help out Dad."),
		 new DialogLine(faces["r_mad"], "Bring it on, bird brain!")
		],
	
		// 25
		[new DialogLine(faces["p_shock"], "%rivalname%!")],
	
		// 26
		[new DialogLine(faces["p_shock"], "Dad? Are you alright?"),
		 new DialogLine(faces["p_sad"], "He's not responding. It's like he's in a coma."),
		 new DialogLine(faces["p_sad"], "...Dad...")
		],
	
		// 27
		[new DialogLine(faces["owlnpc_glad"], "Heh. Like father like son!"),
		 new DialogLine(faces["owlnpc_hurt"], "(Although, all this fighting has tired me out. I should leave soon.)")
		],
	
		// 28
		[new DialogLine(faces["owlnpc_glad"], "Hey, brat! My job here is done, and you don't look worth the effort required to deal with, so I'm going to make my leave now.")],
	
		// 29
		[new DialogLine(faces["p_sad"], "(I can't just sit here and let him get away, but I don't stand a chance against him. What should I do?)"),
		 new DialogLine(faces["p_sad"], "(...)"),
		 new DialogLine(faces["p_mad"], "(...)"),
		 new DialogLine(faces["p_mad"], "(Welp, here goes something.)"),
		 new DialogLine(faces["p_mad"], "Not so fast!")
		],
	
		// 30
		[new DialogLine(faces["owlnpc_hurt"], "(So the wimp has some guts, huh? No matter, I should have enough left in me to deal with a kid this weak.)")],
	
		// 31
		[new DialogLine(faces["owlnpc_hurt"], "(Those previous fights took too much out of me. I need to get out of here quickly.)"),
		 new DialogLine(faces["owlnpc_glad"], "I'd love to stay and play some more, but I really must go.")
		],
	
		// 32  // owl leaves
		[new DialogLine(faces["p_hurt"], "Phew. Another moment and I would have been a goner. I've got to go back to The Pond. Surely Elder Froggo would know how to cure Dad and %rivalname%.")],

		// after the fight
		// 33
		[new DialogLine(faces["p_hurt"], "He's been mindblasted by that owl guy. Elder Froggo must know how to fix this.")],


		// after returning with Froggo
		// 34
		[new DialogLine(faces["froggo_normal"], "Ah...\n...\nHmm..."),
		 new DialogLine(faces["froggo_normal"], "I see...")
		],
		
		// 35
		[new DialogLine(faces["froggo_normal"], "... ... ..."),
		 new DialogLine(faces["froggo_normal"], "Oh dear...")
		],
		
		// 36
		[new DialogLine(faces["p_sad"], "Can you cure them?")],
		
		// 37
		[new DialogLine(faces["froggo_normal"], "Hmm... "),
		 new DialogLine(faces["froggo_normal"], "The damage done to %rivalname% is minimal, likely thanks to your father having already weakened that Owl Clan thug."),
		 new DialogLine(faces["froggo_normal"], "I should be able to fix him right up, but it will take some time."),
		 new DialogLine(faces["p_glad"], "Great! What about Dad?"),
		 new DialogLine(faces["froggo_normal"], "Hmm. Sadly, the damage done onto your father is too severe for me to handle."),
		 new DialogLine(faces["p_sad"], "Then, does that mean... he'll be stuck like this forever?"),
		 new DialogLine(faces["froggo_normal"], "This may be beyond my abilities, but the Frog King should be able to help."),
		 new DialogLine(faces["p_shock"], "Who's the Frog King?"),
		 new DialogLine(faces["froggo_normal"], "He's the central leader of all the Frog Clans, and also the most powerful Frog Mage. He lives on the main continent in the Frog Kingdom."),
		 new DialogLine(faces["froggo_normal"], "I can lend you a boat and give you directions on how to get there. If you tell him that I sent you, he'll agree to help immediately."),
		 new DialogLine(faces["p_sad"], "This is all too much. I can't possibly travel all alone! "),
		 new DialogLine(faces["froggo_normal"], "I observed you during your training, %pname%. You are far more capable than you give yourself credit for. Besides, your family is depending on you."),
		 new DialogLine(faces["froggo_normal"], "Now then, I'm going to take these two back to The Pond so I can get started on curing them. Come see me when you're ready to depart.")
		],


		// 38  // this goes inbetween 24 and 25
		[new DialogLine(faces["r_hurt"], "Gah!!")],
	];

	public static var mchouse1Strings:Array<Array<DialogLine>> = [
		//	start of the game
		// 0
		[new DialogLine(faces["r_glad"], "%pname%, check it out! I snagged a couple pens from Dad's collection again. C'mon, let's go try them out!")],
	
		// 1
		[new DialogLine(faces["p_glad"], "Yeah, okay!")],
	
		// 2
		[new DialogLine(faces["p_shock"], "But Dad said we aren't allowed to use his pens.")],
	
		// 3
		[new DialogLine(faces["r_glad"], "Hehe. What Dad doesn't know, won't hurt him.")],
	
		// 4
		[new DialogLine(faces["dad_normal"], "Boys, wake up and come downstairs! It's family meeting time!")],
	
		// 5
		[new DialogLine(faces["r_shock"], "Aw, busted already? Don't worry, I'll go on ahead and sort this out.")],
	
		// environment dialog
		// 6
		[new DialogLine(faces["p_normal"], "It's a picture of the superhero, Captain Croak. He's a popular character amongst youths such as myself.")],
		// 7
		[new DialogLine(faces["p_normal"], "I'll never understand %rivalname%'s art tastes. Too modern for me.")],
		// 8
		[new DialogLine(faces["p_glad"], "Ah, my impressive collection of \"The Adventures of Captain Croak\"."),
		 new DialogLine(faces["p_vexed"], "But impressive as it is, I'm still missing volume 14...")
		],
		// 9
		[new DialogLine(faces["p_normal"], "Nothing but books on various styles of magic and pranks. Not my cup of tea.")],
	];

	public static var frogpondStrings:Array<Array<DialogLine>> = [
		// 0
		[new DialogLine(faces["froggo_normal"], "Well met, %pname% and %rivalname%! Welcome to The Pond, the place where all young boys of the Frog Clan come to become mages. We've been expecting you two."),
		 new DialogLine(faces["froggo_normal"], "Your father might not have mentioned it, but did you know that I also trained him back when he was around your age?"),
		 new DialogLine(faces["froggo_normal"], "He was quite the skilled mage--and I can sense a similar power in the both of you. The apple doesn't fall far from the tree. Hohoho."),
		 new DialogLine(faces["froggo_normal"], "As you may or may not know, there are many types of magic in this world. We of the Frog Clan call our magic \"Frog Magic\", for obvious reasons."),
		 new DialogLine(faces["froggo_normal"], "While some magic schools can shoot fire or heal wounds, Frog Magic is limited to the world of the mind."),
		 new DialogLine(faces["froggo_normal"], "The average Frog Mage uses his magic to help people suffering from problems like phobias, traumas, or writer's block."),
		 new DialogLine(faces["froggo_normal"], "At their most powerful, Frog Mages can control the very thoughts of any living creature. But most mages never make it to that level."),
		 new DialogLine(faces["froggo_normal"], "I do not exaggerate when I say that Frog Magic is potentially the most powerful school of magic. And because of that, it is also requires the most discipline to use."),
		 new DialogLine(faces["froggo_normal"], "In order to prevent abuse, all Frog Mages must swear an oath to never use their powers for evil. Frog Magic is exclusively meant for helping people."),
		 new DialogLine(faces["froggo_normal"], "Well, at any rate, I think you've heard enough of this old man's ramblings. After all, we'll have plenty more opportunities for me to teach you all that you need to know."),
		 new DialogLine(faces["froggo_normal"], "I can tell that you're both itching to start your training. As is tradition, all aspiring new Frog Mages have to go through the cave of initiation to start their training."),
		 new DialogLine(faces["froggo_normal"], "You can reach the cave through the back door of my house. Here, follow me.")
		],

		// 1
		[new DialogLine(faces["froggo_normal"], "The cave's entrance is just through the back door over there to the left. Good luck, and frogspeed."), 
		 new DialogLine(faces["froggo_normal"], "Oh, and be sure to talk to my training dummy friend down there if you want to review the fundamentals of how to use Frog Magic!")
		],

		// 2  // this belongs between 18 and 19
		[new DialogLine(faces["froggo_normal"], "You boys should go head back home now and go brag to you father.")],

		// 3  // this and the next one belong after Froggo brings your mindblasted family to his house
		[new DialogLine(faces["p_sad"], "Just wait a bit longer. I'll go see the Frog King and he'll come cure you.")],

		// 4
		[new DialogLine(faces["pfrog_sad"], "Just wait a bit longer. I'll go see the Frog King and he'll come cure you.")],

		// 5  // this belongs inbetween 28 and 29. Oops
		[new DialogLine(faces["p_normal"], "Helloooo?")],

		// 6
		[new DialogLine(faces["r_normal"], "Hurry up, %pname%, let's go!")],

		// 7
		[new DialogLine(faces["p_normal"], "There's a crudely written message. It says \"Elder Froggo's house\".")],

		// 8
		[new DialogLine(faces["froggo_normal"], "Ah, %pname%. Right on time. Come here for a moment.")],
		
		// 9
		[new DialogLine(faces["p_glad"], "%rivalname%, we did it! We finished our first Frog Mage trial!")],
		
		// 10
		[new DialogLine(faces["r_smug"], "And it only took you forever and a half, slowpoke.")],
		
		// 11
		[new DialogLine(faces["p_shock"], "Not cool, you only finished a couple minutes before I did!")],
		
		// 12
		[new DialogLine(faces["froggo_normal"], "Ahem. Boys. Listen up, because this'll be another long one.")],

		// 13
		[new DialogLine(faces["froggo_normal"], "As you may or may not know, all magic works through channelling the energy of pure holy essences. "),
		 new DialogLine(faces["froggo_normal"], "Each school of magic has its own patron essence from which it draws power and inspiration. As you probably guessed, us Frog Mages draw from the holy Frog Essence."),
		 new DialogLine(faces["froggo_normal"], "A person can become blessed by a holy essence if they visit the shrine of said essence. When this occurs, that person obtains a seal."),
		 new DialogLine(faces["froggo_normal"], "Seals have an amplifying effect for mages, but only if the mage is of a suitable lineage. For example, an Ice Seal won't have an effect on your magic abilities."),
		 new DialogLine(faces["froggo_normal"], "However, Seals serve a dual role as status symbols. Believe it or not, their exclusivity is their main appeal in this day and age."),
		 new DialogLine(faces["froggo_normal"], "Most people don't even realize the magical value of the Seals. In fact, I probably shouldn't have divulged such sensitive information to two new initiates. Hohoho."),
		 new DialogLine(faces["froggo_normal"], "Well, I'm sure you would have found out soon enough, considering the man your father is. Speaking of which, I've kept you here for long enough."),
		 new DialogLine(faces["froggo_normal"], "You should go head back home now and go brag to him.")
		],

		// 14
		[new DialogLine(faces["p_glad"], "Good idea! I can't wait to go tell Dad!")],
		
		// 15
		[new DialogLine(faces["p_glad"], "Elder Froggo, thank you so much for training us.")],
	
		// 16
		[new DialogLine(faces["r_glad"], "Yeah, thanks.")],

		// 17
		[new DialogLine(faces["froggo_glad"], "Hohoho, it's truly my pleasure."),
		 new DialogLine(faces["froggo_normal"], "Oh, and one more thing about your new Frog Seals: it's not just people who will acknowledge your new status. Indeed, monsters will begin to take an interest in you."),
		 new DialogLine(faces["froggo_normal"], "Be aware that they might accost you in the wild in an attempt to have you fix them up with some Frog Magic. Of course, some will be more hostile than others.")
		],
		
		// 18
		[new DialogLine(faces["r_normal"], "No big deal. We can handle them, right %pname%? Let's go.")],


		// after owl guy mindblasts family
		// 19
		[new DialogLine(faces["p_hurt"], "Elder Froggo!")],

		// 20
		[new DialogLine(faces["froggo_shock"], "%pname%, what happened? You look like you just got beat half to death by a giant wildfrog!")],

		// 21
		[new DialogLine(faces["p_hurt"], "A guy... With an owl hood... Dad and %rivalname%... mindblasted.")],

		// 22
		[new DialogLine(faces["froggo_shock"], "Mindblasted!?"),
		 new DialogLine(faces["froggo_normal"], "%pname%, slow down and tell me everything that happened.")
		],

		// 23
		[new DialogLine(faces["p_hurt"], "When we got back home...\n... ...\n... ... ...\n... ... ... ...")],

		// 24
		[new DialogLine(faces["froggo_mad"], "An Owl Mage? Here? This is grave news... \nI wonder if--\nNo, there's no time to speculate.")],

		// 25
		[new DialogLine(faces["froggo_normal"], "%pname%, let's head over to your house immediately.")],

	
		// mc gets hood before departing
		// 26
		[new DialogLine(faces["froggo_normal"], "Where is it?")],

		// 27
		[new DialogLine(faces["p_normal"], "Elder Froggo, I think I'm ready.")],

		// 28
		[new DialogLine(faces["p_normal"], "Hello? Elder Froggo?")
		],

		// 29
		[new DialogLine(faces["froggo_normal"], "Eureka! Here it is!")
		],

		// 30
		[new DialogLine(faces["p_normal"], "(Oh, there he is.)\nElder Fro--")],

		// 31
		[new DialogLine(faces["froggo_shock"], "%pname%, great timing!")],

		// 32
		[new DialogLine(faces["froggo_normal"], "I presume that since you're here, that you're ready to depart. Well before you do, I have a present for you. It's a hood."),
		 new DialogLine(faces["froggo_normal"], "But not just any old hood. Indeed, it's a bona fide Frog Mage hood. Ordinarilly a trainee has to complete his training to earn his robe, but these are no ordinary circumstances."),
		 new DialogLine(faces["froggo_normal"], "With this robe, you'll have no problem seeking an audience with the Frog King.")
		],
		
		// 33
		[new DialogLine(faces["p_shock"], "Wow, it fits perfectly. And it even has a cape!")],

		// 34
		[new DialogLine(faces["froggo_normal"], "Of course. Your father had special ordered it for you when he decided to let you two train under me. He had one made for %rivalname% too, but...")],
		
		// 35
		[new DialogLine(faces["p_sad"], "Dad... %rivalname%...")],

		// 36
		[new DialogLine(faces["froggo_normal"], "Chin up, lad. The Frog King will certainly cure them both and then you and %rivalname% can argue over whose hood is the coolest."),
		 new DialogLine(faces["froggo_normal"], "And on that note, we should head up North to the docks. Now's the chance to do any final preparations you might have left to do.")
		],

		// npc messages
		// beginning of the game, with rivalkid
		// 37
		[new DialogLine(faces["frogman_glad"], "I've collected so many barrels that I can't even get to my bed anymore. Sleeping on the floor isn't so bad once you get used to it.")],

		// 38
		[new DialogLine(faces["frogman_normal"], "Y'know, I always thought it was funny how your dad wanted to move away to escape the mage life, but he ended up moving here--to Tadpole Island of all places."),
		 new DialogLine(faces["frogman_normal"], "I mean, there's nothing on this island other than The Pond. What was he thinking?"),
		 new DialogLine(faces["frogman_shock"], "Oh, sorry! That was rude. I have this habit of saying things that I shouldn't."),
		],

		// 39
		[new DialogLine(faces["frogman_normal"], "Greetings, %pname%. Did you know that I’m hosting an exchange student? Her name is, uh... well, I forgot. My memory isn't the best."),
		 new DialogLine(faces["frogman_normal"], "She’s from that one tribe of mute folk. I can't remember their name, and she won't tell me. But you've heard of them, haven't you? They wear those funny bear hats."),
		 new DialogLine(faces["frogman_normal"], "Like the Frog Clan, they’re a magical people, but their magic is of a different ilk. Whereas Frog Magic is based on the mind, their magic draws is more nature focused."),
		 new DialogLine(faces["frogman_normal"], "It’s said that they can channel the powers of Mother Nature herself to do things like heal people and \"save\", whatever that means. ")
		],

		// 40
		[new DialogLine(faces["frogman_normal"], "Greetings. It's rare that we get visitors here at The Pond. You must be %pname% and %rivalname%."),
		 new DialogLine(faces["frogman_normal"], "In that case, you'll want to head to Elder Froggo's. The lilypath to the northeast will take you right to his front door. You can't miss it.")
		],


		// after frogponddun = done
		// 41
		[new DialogLine(faces["frogman_shock"], "Hold up. So you're saying that you two have already gone to the cave of initiation on your first day of training? And you both completed it?"),
		 new DialogLine(faces["frogman_normal"], "You truly are your father's sons. Man, I've always been jealous of his skills. And now I'm jealous of two children too. What am I doing with my life?")
		],

		// 42
		[new DialogLine(faces["frogman_normal"], "I had this great idea: I could give a pen and some paper to the mute exchange student I'm hosting and have her communicate with me through writing."),
		 new DialogLine(faces["frogman_normal"], "Ingenious, I know. Especially considering that we have pens out the wazoo here in The Pond."),
		 new DialogLine(faces["frogman_vexed"], "...\nBut we don't have any paper."),
		 new DialogLine(faces["frogman_vexed"], "Not a single sheet in the entire pond.")
		],

		// 43
		[new DialogLine(faces["frogman_normal"], "Hey guys, congrats on finishing the Cave of Initiation. Boy, I remember when I went through the cave back when I was a wee tadpole scout. Good times.")],


		// after owl guy mindblasts family
		// 44
		[new DialogLine(faces["frogman_sad"], "Why so distraught? Not enough barrels?")],

		// 45
		[new DialogLine(faces["frogman_shock"], "Wow, you look awful! Did you lose a fight or something?")],

		// 46
		[new DialogLine(faces["frogman_sad"], "%pname%, you look beat up. I'm sure our mute friend will heal you up. And while she's doing that, she could help you \"save\" too.")],

		// 47
		[new DialogLine(faces["frogman_normal"], "%pname%, you look all shaken up. Are you okay?")],


		// after meeting froggo at mchome and he tells you about the boat
		// 48
		[new DialogLine(faces["frogman_glad"], "If you ever need any barrels, just say the word and I'll help you out, my man.")
		],

		// 49
		[new DialogLine(faces["frogman_sad"], "%pname%, I heard the bad news. I'm so sorry."),
		 new DialogLine(faces["frogman_glad"], "But at least they couldn't be in more capable hands!"),
		 new DialogLine(faces["frogman_vexed"], "Well, technically that's not true--the Frog King is leagues more capable. I mean, Elder Froggo can only do so much..."),
		 new DialogLine(faces["frogman_shock"], "Oh no! There I go blurting out my train of thoughts again. When will I learn?")
		],

		// 50
		[new DialogLine(faces["frogman_normal"], "While you're gone, Golly has agreed to help in the healing efforts. Your family will be safe here."),
		 new DialogLine(faces["frogman_glad"], "Oh right, I guess I didn't tell you, but Golly is what I'm calling my mute exchange student. She seems to like it.")
		],

		// 51
		[new DialogLine(faces["frogman_normal"], "Don't worry, %pname%. We'll take good care of your family. Safe travels, and frogspeed.")],


		// dialog for free barrels, independent of story progress
		// 52
		[new DialogLine(faces["frogman_shock"], "It looks like you could use an extra barrel. Here, take this one.")
		],

		// sign stuff, independent of story progress
		// 53
		[new DialogLine(faces["p_normal"], "There's a crudely written message. It says \"Elder Froggo's house\".\nDid Elder Froggo write this?")],
		// 54
		[new DialogLine(faces["p_normal"], "There's a crudely written message. It says \"Non-mages get off my lawn! REEEEEE!\"\nWhat did he mean by this?")],
		// 55
		[new DialogLine(faces["p_normal"], "It says \"SAVE\". Whatever that means, those capital letters imply that it must be important.\n")],
	];

	public static var frogpondhouse1Strings:Array<Array<DialogLine>> = [
		// 0
		[new DialogLine(faces["frogman_glad"], "I've collected so many barrels that I can't even get to my bed anymore. Sleeping on the floor isn't so bad once you get used to it.")],

		// after owl guy mindblasts family
		// 1
		[new DialogLine(faces["frogman_sad"], "Why so distraught? Not enough barrels?")],

		// after meeting froggo at mchome and he tells you about the boat
		// 2
		[new DialogLine(faces["frogman_glad"], "If you ever need any barrels, just say the word and I'll help you out, my dude.")
		],

		// dialog for free barrels, independent of story progress
		// 3
		[new DialogLine(faces["frogman_shock"], "It looks like you could use an extra barrel. Here, take this one.")
		],

		// object lines
		// 4
		[new DialogLine(faces["p_normal"], "Barrels, barrels, barrels! Nothing but barrels as far as the eye can see.")],
		// 5
		[new DialogLine(faces["p_normal"], "Where does this guy even get all of these barrels from?")],
		// 6
		[new DialogLine(faces["p_normal"], "I can understand the desire to collect things, but empty barrels? I don't get it.")],
		// 7
		[new DialogLine(faces["p_shock"], "I don't think a single one of these barrels is even filled with anything. They're all empty!")],
		// 5
		[new DialogLine(faces["p_normal"], "I wonder if he bought these barrels, or if he made them. He might be a cooper for all I know.")],
	];

	public static var frogpondhouse2Strings:Array<Array<DialogLine>> = [
		// 0
		[new DialogLine(faces["frogman_normal"], "Greetings, %pname% and %rivalname%. Did you know that I’m hosting an exchange student? Her name is, uh... well, I forgot. My memory isn't the best."),
		 new DialogLine(faces["frogman_normal"], "She’s from that one tribe of mute folk. I can't remember their name, and she won't tell me. But you've heard of them, haven't you? They wear those funny bear hats."),
		 new DialogLine(faces["frogman_normal"], "Like the Frog Clan, they’re a magical people, but their magic is of a different ilk. Whereas Frog Magic is based on the mind, their magic revolves around nature."),
		 new DialogLine(faces["frogman_normal"], "It’s said that they can channel the powers of Mother Nature herself to do things like heal people and \"save\", whatever that means. ")
		],

		// 1
		[new DialogLine(faces["p_normal"], "\"Save\", huh? Sounds like something worth doing.")],

		// after frogponddun = done
		// 2
		[new DialogLine(faces["frogman_normal"], "I had this great idea: I could give a pen and some paper to the mute exchange student I'm hosting and have her communicate with me through writing."),
		 new DialogLine(faces["frogman_normal"], "Ingenious, I know. Especially considering that we have pens out the wazoo here in The Pond."),
		 new DialogLine(faces["frogman_vexed"], "...\nBut we don't have any paper."),
		 new DialogLine(faces["frogman_vexed"], "Not a single sheet in the entire pond.")
		],

		// 3
		[new DialogLine(faces["r_normal"], "Not such a great idea after all, is it?")],

		// after owl guy mindblasts family
		// 4
		[new DialogLine(faces["frogman_sad"], "%pname%, you look beat up. I'm sure our mute friend will heal you up. And while she's doing that, she could help you \"save\" too.")],

		// after meeting froggo at mchome and he tells you about the boat
		// 5
		[new DialogLine(faces["frogman_normal"], "While you're gone, Golly has agreed to help in the healing efforts. Your family will be safe here."),
		 new DialogLine(faces["frogman_glad"], "Oh right, I guess I didn't tell you, but Golly is what I'm calling my mute exchange student. She seems to like it.")
		],

		// 6
		[new DialogLine(faces["p_shock"], "I've never seen a pen collection this large! Its vastness spans four whole shelves!"),
		 new DialogLine(faces["p_normal"], "I am humbled by its majesty. Truly, the world is a much larger place than I thought.")
		],
	];

	public static var frogpondhouse3Strings:Array<Array<DialogLine>> = [
		// 0
		[new DialogLine(faces["frogman_normal"], "Y'know, I always thought it was funny how your dad wanted to move away to escape the mage life, but he ended up moving here--to Tadpole Island of all places."),
		 new DialogLine(faces["frogman_normal"], "I mean, there's nothing on this island other than The Pond. What was he thinking?"),
		],

		// 1
		[new DialogLine(faces["r_mad"], "Big talk coming from someone who lives in an empty house.")],

		// 2
		[
		 new DialogLine(faces["frogman_shock"], "Oh, sorry! Did I say something rude? I have this habit of saying things that I shouldn't. It's a result of me being under-socialized."),
		 new DialogLine(faces["frogman_normal"], "And for the record, my minimalism is part of my Frog Mage training."),
		],

		// after frogponddun = done
		// 3
		[new DialogLine(faces["frogman_shock"], "Hold up. So you're saying that you two have already gone to the cave of initiation on your first day of training? And you both completed it?"),
		 new DialogLine(faces["frogman_normal"], "You truly are your father's sons. Man, I've always been jealous of his skills. And now I'm jealous of two children too. What am I doing with my life?")
		],

		// after owl guy mindblasts family
		// 4
		[new DialogLine(faces["frogman_shock"], "Wow, you look awful! Did you lose a fight or something?")],

		// after meeting froggo at mchome and he tells you about the boat
		// 5
		[new DialogLine(faces["frogman_sad"], "%pname%, I heard the bad news. I'm so sorry."),
		 new DialogLine(faces["frogman_glad"], "But at least they couldn't be in more capable hands!"),
		 new DialogLine(faces["frogman_vexed"], "Well, technically that's not true--the Frog King is leagues more capable. I mean, Elder Froggo can only do so much..."),
		 new DialogLine(faces["frogman_shock"], "Oh no! There I go blurting out my train of thoughts again. When will I learn?")
		],
	];

	public static var frogpondhouse4Strings:Array<Array<DialogLine>> = [
		// 0
		[new DialogLine(faces["froggo_normal"], "The cave's entrance is just through the back door over there to the left. Good luck, and frogspeed."), 
		 new DialogLine(faces["froggo_normal"], "Oh, and be sure to talk to my training dummy friend down there if you want to review the fundamentals of how to use Frog Magic!")
		],

		// after clearing the dungeon
		// 1
		[new DialogLine(faces["froggo_normal"], "Ah, %pname%. Right on time. Come here for a moment.")],
		
		// 2
		[new DialogLine(faces["p_glad"], "%rivalname%, we did it! We finished our first Frog Mage trial!")],
		
		// 3
		[new DialogLine(faces["r_smug"], "And it only took you forever and a half, slowpoke.")],
		
		// 4
		[new DialogLine(faces["p_shock"], "Not cool, you only finished a couple minutes before I did!")],
		
		// 5
		[new DialogLine(faces["froggo_normal"], "Ahem. Boys. Listen up, because this'll be another long one.")],

		// 6
		[new DialogLine(faces["froggo_normal"], "As you may or may not know, all magic works through channelling the energy of pure holy essences. "),
		 new DialogLine(faces["froggo_normal"], "Each school of magic has its own patron essence from which it draws power and inspiration. As you probably guessed, us Frog Mages draw from the holy Frog Essence."),
		 new DialogLine(faces["froggo_normal"], "A person can become blessed by a holy essence if they visit the shrine of said essence. When this occurs, that person obtains a seal."),
		 new DialogLine(faces["froggo_normal"], "Seals have an amplifying effect for mages, but only if the mage is of a suitable lineage. For example, an Ice Seal won't have an effect on your magic abilities."),
		 new DialogLine(faces["froggo_normal"], "However, Seals serve a dual role as status symbols. Believe it or not, their exclusivity is their main appeal in this day and age."),
		 new DialogLine(faces["froggo_normal"], "Most people don't even realize the magical value of the Seals. In fact, I probably shouldn't have divulged such sensitive information to two new initiates. Hohoho."),
		 new DialogLine(faces["froggo_normal"], "Well, I'm sure you would have found out soon enough, considering the man your father is. Speaking of which, I've kept you here for long enough."),
		 new DialogLine(faces["froggo_normal"], "You should go head back home now and go brag to him.")
		],

		// 7
		[new DialogLine(faces["p_glad"], "Good idea! I can't wait to go tell Dad!")],
		
		// 8
		[new DialogLine(faces["p_glad"], "Elder Froggo, thank you so much for training us.")],
	
		// 9
		[new DialogLine(faces["r_glad"], "Yeah, thanks.")],

		// 10
		[new DialogLine(faces["froggo_glad"], "Hohoho, it's truly my pleasure."),
		 new DialogLine(faces["froggo_normal"], "Oh, and one more thing about your new Frog Seals: it's not just people who will acknowledge your new status. Indeed, monsters will begin to take an interest in you."),
		 new DialogLine(faces["froggo_normal"], "Be aware that they might accost you in the wild in an attempt to have you fix them up with some Frog Magic. Of course, some will be more hostile than others.")
		],
		
		// 11
		[new DialogLine(faces["r_normal"], "No big deal. We can handle them, right %pname%? Let's go.")],

		// 12
		[new DialogLine(faces["froggo_normal"], "You boys should go head back home now and go brag to you father.")],


		// after owl guy mindblasts family
		// 13
		[new DialogLine(faces["p_hurt"], "Elder Froggo!")],

		// 14
		[new DialogLine(faces["froggo_shock"], "%pname%, what happened? You look like you just got beat half to death by a giant wildfrog!")],

		// 15
		[new DialogLine(faces["p_hurt"], "A guy... With an owl hood... Dad and %rivalname%... mindblasted.")],

		// 16
		[new DialogLine(faces["froggo_shock"], "Mindblasted!?"),
		 new DialogLine(faces["froggo_normal"], "%pname%, slow down and tell me everything that happened.")
		],

		// 17
		[new DialogLine(faces["p_hurt"], "When we got back home...\n... ...\n... ... ...\n... ... ... ...")],

		// 18
		[new DialogLine(faces["froggo_mad"], "An Owl Mage? Here? This is grave news... \nI wonder if--\nNo, there's no time to speculate.")],

		// 19
		[new DialogLine(faces["froggo_normal"], "%pname%, let's head over to your house immediately.")],

	
		// mc gets hood before departing		
		// 20 
		[new DialogLine(faces["p_sad"], "Just wait a bit longer. I'll go see the Frog King and he'll come cure you.")],

		// 21
		[new DialogLine(faces["froggo_normal"], "Where is it?")],

		// 22
		[new DialogLine(faces["p_normal"], "Elder Froggo, I think I'm ready.")],

		// 23
		[new DialogLine(faces["p_normal"], "Hello? Elder Froggo?")
		],

		// 24
		[new DialogLine(faces["p_normal"], "Helloooo?")],

		// 25
		[new DialogLine(faces["froggo_normal"], "Eureka! Here it is!")
		],

		// 26
		[new DialogLine(faces["p_normal"], "(Oh, there he is.)\nElder Fro--")],

		// 27
		[new DialogLine(faces["froggo_shock"], "%pname%, great timing!")],

		// 28
		[new DialogLine(faces["froggo_normal"], "I presume that since you're here, that you're ready to depart. Well before you do, I have a present for you. It's a hood."),
		 new DialogLine(faces["froggo_normal"], "But not just any old hood. Indeed, it's a bona fide Frog Mage hood. Ordinarilly a trainee has to complete his training to earn his robe, but these are no ordinary circumstances."),
		 new DialogLine(faces["froggo_normal"], "With this robe, you'll have no problem seeking an audience with the Frog King. Here, try it on.")
		],
		
		// 29
		[new DialogLine(faces["p_shock"], "Wow, it fits perfectly. And it even has a cape!")],

		// 30
		[new DialogLine(faces["froggo_normal"], "Of course. Your father had special ordered it for you when he decided to let you two train under me. He had one made for %rivalname% too, but...")],
		
		// 31
		[new DialogLine(faces["p_sad"], "Dad... %rivalname%...")],

		// 32
		[new DialogLine(faces["froggo_normal"], "Chin up, lad. The Frog King will certainly cure them both and then you and %rivalname% can argue over whose hood is the coolest."),
		 new DialogLine(faces["froggo_normal"], "And on that note, we should head up North to the docks. Now's the chance to do any final preparations you might have left to do.")
		],

		// object dialogs
		// 33
		[new DialogLine(faces["p_shock"], "Wow look at all of these exotic looking pens. Elder Froggo's collection is top notch.")],
		// 34
		[new DialogLine(faces["p_shock"], "Look at all those crazy pens! Woah, is that a telescopic pen? I don't even what someone would use one of those for, but I want one!")],
		// 35
		[new DialogLine(faces["p_normal"], "Here's a funny sounding book: \"On the merits and superiority of the second dimension in comparison to the third.\" Wonder what that's about.")],
		// 36
		[new DialogLine(faces["p_normal"], "This shelf is briming with lots of light green clothing. Is this his where Elder Froggo keeps his spare robes?")],
		// 37
		[new DialogLine(faces["p_glad"], "This whole shelf is full of tiny statues of different people that I don't recognize. Hey that girl one is kinda cute. Actually, there are lots of cute girl ones. Oh, and there's one of a frog.")],
		// 38
		[new DialogLine(faces["p_normal"], "This shelf is overflowing with books about the various schools of magic.")],
		// 39
		[new DialogLine(faces["p_normal"], "How odd that Elder Froggo would have children's books in his library. This one is an old classic, \"The Frog Knight\"."),
		 new DialogLine(faces["p_glad"], "This is my favorite scene. The bad guy has the main guy captured on a boat and is interrogating him:"),
		 new DialogLine(faces["p_normal"], "\"If I take that hood off, will you die?\"\n\"It would be extrememly painful...\"\n\"You're a big mage.\"\n\"...For you.\""),
		 new DialogLine(faces["p_glad"], "The writing has a surprising amount of depth for a children's book."),
		],
		// 40
		[new DialogLine(faces["p_normal"], "Most of the books on this shelf are beyond me. Even the titles sound intimidating: \"Critiquing Culture\", \"Meaningful Maps\", \"How to Draw Anime\", \"High school yearbook class of '11\".")],
		// 41
		[new DialogLine(faces["p_normal"], "\"Mastering the Secrets of Italian Disco: Part 1 of 5000\"? Not sure what a disco is. Or what Italian means. Or how a book can have five thousand parts. Is this even a real book?")],
		// 42
		[new DialogLine(faces["p_glad"], "Oh hey, these black and white picture books are just like the ones Dad has. I wonder if Dad got his from Elder Froggo.")],
	];

	public static var frogponddocksStrings:Array<Array<DialogLine>> = [
		// 0
		[new DialogLine(faces["p_normal"], "It's locked.")],

		// 1
		[new DialogLine(faces["froggo_normal"], "Hold on a moment, I'll have to unlock the door.")
		],

		// 2
		[new DialogLine(faces["froggo_sad"], "%pname%, I'm terribly sorry that this burden has been thrust upon you. Especially given your youth and inexperience."),
		 new DialogLine(faces["froggo_normal"], "Capable though you are, I still have some reservations about having you go on this trip alone. So your final test will be assuaging my concerns"),
		 new DialogLine(faces["froggo_mad"], "%pname%! Show me what you've got!")
		],

		// 3
		[new DialogLine(faces["froggo_shock"], "Well done, %pname%! You've cleared up all of my doubts--both figuratively and magically! Hohoho!"),
		 new DialogLine(faces["froggo_normal"], "With the skills you just demonstrated to me, you should have no problem making it to the Frog Kingdom."),
		 new DialogLine(faces["froggo_normal"], "The trip to the Frog Kingdom is a short one. Just head east past the Frostfire Bay, and when you get to the mainland, follow the coast in a counterclockwise direction."),
		 new DialogLine(faces["froggo_normal"], "Frogspeed, %pname%. Though it was brief, remember your training.")
		],


		// 4
		[new DialogLine(faces["froggo_normal"], "Frogspeed, %pname%. Though it was brief, remember your training.")],

		// 5
		[new DialogLine(faces["pfrog_normal"], "This is it... \nAm I ready?")],

		// 6
		[new DialogLine(faces["pfrog_mad"], "Ready or not, I have to do it.")],

		// 7
		[new DialogLine(faces["pfrog_sad"], "On second thought, maybe I should go train up a bit. Maybe go see the training dummy...")],
	];

	public static var frogponddunStrings:Array<Array<DialogLine>> = [
		// 0
		[new DialogLine(faces["dummy"], "Hi ho! I'm the practice dummy! I can teach you how to use magic! Wanna give it a shot!? C'mon, it'll be fun!")],

		// 1
		[new DialogLine(faces["p_normal"], "Sure.")],

		// 2
		[new DialogLine(faces["p_normal"], "I'm good.")],	

		// 3
		[new DialogLine(faces["dummy"], "Sweet! Let's go!")],

		// 4
		[new DialogLine(faces["dummy"], "Oh well! Maybe later!")],

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
		[new DialogLine(faces["kekdoor"], "You’ve reached the end of the first floor. Nice! Just pass my trial and you can proceed to the next floor."),
		 new DialogLine(faces["kekdoor"], "By the way, watch out for wild frogs down there. The lack of sunlight messes with their minds, so they tend to hide in chests and jump out at people."),
		 new DialogLine(faces["kekdoor"], "If a battle gets too hairy for you, you can always resort to ESCaping. Get it? ESC-aping?\n*wink wink nudge nudge*"),
		 new DialogLine(faces["kekdoor"], "But if you do run from a battle, be warned that the shame of fleeing may cause you to take some MP damage.")
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
		[new DialogLine(faces["p_shock"], "It’s empty, but I think it caused that splashy sound. Maybe it triggered something.")],

		// 15
		[new DialogLine(faces["p_shock"], "Frog in a box!")],

		// 16
		[new DialogLine(faces["frogman_normal"], "Sup. Don't mind me. Just watching some tv."),],

		// 17
		[new DialogLine(faces["r_shock"], "Oh, hey, %pname%."),
		 new DialogLine(faces["r_smug"], "Once again, I've beaten you to the finish line. You've gotta step your game up, bro."),
		],
		
		// 18
		[new DialogLine(faces["r_normal"], "I'll be waiting back at Elder Froggo's house. See you there.")],

		// 19
		[new DialogLine(faces["p_shock"], "That pedestal and floating frog head look pretty important. I should probably go check it out.")],

		// 20
		[new DialogLine(faces["p_shock"], "There's an inscription carved into the base of the pedestal. This bad handwriting looks familiar somehow."),
		 new DialogLine(faces["p_normal"], "\"By making it this far, thoust've provenst thineselfst to be a capable initiate.\""),
		 new DialogLine(faces["p_normal"], "\"Hereby bestowethd upon thou is the blessing of the Holy Frog.\""),
		 new DialogLine(faces["p_normal"], "\"Thou can observest the mark of thine new blessing by opening thine status screen.\""),
		 new DialogLine(faces["p_normal"], "\"Frogspeed, young one.\""),
		 new DialogLine(faces["p_normal"], "I... think I understood all that. Who's choice was it to use such poorly written old-timey speak?"),
		],

		// 21  // object line
		[new DialogLine(faces["p_shock"], "Wait a second! This TV is off! \nCould this be a high-level training technique?")],

		// end of demo secret boss
		// 22
		[new DialogLine(faces["dummy"], "Hi ho! It's %pname%! You're leaving for a trip to the mainland!? The mainland has lots of tough guys! You're gonna need to get tough!"),
		 new DialogLine(faces["dummy"], "I know! Let's do some advanced training! I'll go all out this time!")
		],
		// 23
		[new DialogLine(faces["dummy"], "Yaaay! Let's do it!")],
		// 24
		[new DialogLine(faces["dummy"], "No!? But I want to train!")],
		// 25
		[new DialogLine(faces["dummy"], "Hey ho! You beat me! Take this secret special pen as a gift! It's a reward for beating the demo exclusive boss: ME! Come back again!")],
		// 26
		[new DialogLine(faces["dummy"], "Hey ho! You beat me! I already gave you the PixCalibur! All I have left is a couple Pond Scums! Take one!")],
		// 27
		[new DialogLine(faces["dummy"], "Hey ho! You beat me! Still thirsty!? I only have one Pond Scum left! Take it!")],
		// 28
		[new DialogLine(faces["dummy"], "Hey ho! You beat me! I have nothing left to give you! But let's train again anyway!")],

		// 29 
		[new DialogLine(faces["p_normal"], "Sure.")],
		// 30
		[new DialogLine(faces["pfrog_normal"], "Sure.")],
		// 31
		[new DialogLine(faces["p_normal"], "I'm good.")],
		// 32
		[new DialogLine(faces["pfrog_normal"], "I'm good.")],

		// 33
		[new DialogLine(faces["p_shock"], "Woah! Did I just absorb that frog head thing?"),
		 new DialogLine(faces["p_shock"], "That must be the blessing that that inscription mentioned. So then, that must mean that I completed the trial."),
		 new DialogLine(faces["p_glad"], "Woohoo! I did it! I've gotta go hurry up and meet back up with %rivalname% and Elder Froggo!")
		],

		// 34  // rival says this when you enter the dungeon the first time
		[new DialogLine(faces["r_glad"], "I've used Dad's pens enough to where I don't need a dummy to lecture me. I'm going straight to the end of the cave.")],
	];

	public static var waterkidhutStrings:Array<Array<DialogLine>> = [
		// waterkid_in_hut = 0
		// 0
		[new DialogLine(faces["p_hurt"], "Ow ow ow... My head.")],
		// 1
		[new DialogLine(faces["p_hurt"], "Ouch. And my legs too.")],
		// 2
		[new DialogLine(faces["p_hurt"], "Urgh. And my entire body for that matter.")],
		// 3
		[new DialogLine(faces["waterkid_shock"], "Oh, you're up!"),
		 new DialogLine(faces["waterkid_glad"], "Thank goodness! I was starting to lose hope!")
		],
		// 4
		[new DialogLine(faces["p_hurt"], "Who are you?")],
		// 5
		[new DialogLine(faces["p_hurt"], "Where am I?")],
		// 6
		[new DialogLine(faces["waterkid_vexed"], "I'm, uh... ... ..."),
		 new DialogLine(faces["waterkid_normal"], "...%waterkid%."),
		 new DialogLine(faces["waterkid_glad"], "Yeah, that's right! %waterkid%!"),
		 new DialogLine(faces["waterkid_glad"], "And this is my hut. A cozy waterfront property located right in the heart of the bay area!"),
		 new DialogLine(faces["waterkid_normal"], "I found you washed up on the shore a couple of weeks ago, and I've been nursing you back to health ever since.")
		],
		// 7
		[new DialogLine(faces["waterkid_glad"], "This is my hut. A cozy waterfront property located right in the heart of the bay area! By the way, I'm..."),
		 new DialogLine(faces["waterkid_vexed"], "...I'm... uh... ... ..."),
		 new DialogLine(faces["waterkid_normal"], "...%waterkid%."),
		 new DialogLine(faces["waterkid_glad"], "Yeah, that's right! %waterkid%!"),
		 new DialogLine(faces["waterkid_normal"], "I found you washed up on the shore a couple of weeks ago, and I've been nursing you back to health ever since.")
		],
		// 8
		[new DialogLine(faces["p_shock"], "Wait, \"bay area\"? As in, the Frostfire Bay area?")],
		// 9
		[new DialogLine(faces["waterkid_glad"], "Yeah, that's the one!")],
		// 10
		[new DialogLine(faces["p_hurt"], "I was sailing past Frostfire Bay, en route to the Frog Kingdom when I ran into a storm. And then..."),
		 new DialogLine(faces["p_sad"], "...That's the last thing I remember.")
		],
		// 11
		[new DialogLine(faces["waterkid_normal"], "Oh, the Frog Kingdom? That's on the other side of the bay. You can get there through the Frost Kingdom checkpoint to the Northwest.")],
		// 12
		[new DialogLine(faces["p_normal"], "%waterkid%, you've done so much for me, but I don't have the time to properly thank you. I have to get to the Frog Kingdom as quickly as possible in order to save my family."),
		 new DialogLine(faces["p_normal"], "After they're healed up, I promise that we'll come back to repay your kindness.")
		],
		// 13
		[new DialogLine(faces["waterkid_shock"], "Oh no! Your family is in trouble!?"),
		 new DialogLine(faces["waterkid_mad"], "I completely understand. Family should always come first."),
		 new DialogLine(faces["waterkid_normal"], "Here, take a couple rations with you. You need to get some nutrients back into your system.")
		],
		// 14
		[new DialogLine(faces["p_glad"], "Thanks, I feel better already. I'll see you later!")],
		// 15
		[new DialogLine(faces["waterkid_normal"], "Wait! I never caught your name.")],
		// 16
		[new DialogLine(faces["p_glad"], "Oh. Right. I'm %pname%. Pleasure to meet you.")],
		// 17
		[new DialogLine(faces["waterkid_blush"], "%pname%, huh..."),
		 new DialogLine(faces["waterkid_glad"], "Nice to meet you too!"),
		],
		// 18
		[new DialogLine(faces["p_glad"], "See ya!")],

		// waterkid_in_hut = 1
		// 19
		[new DialogLine(faces["waterkid_normal"], "Need directions? You can get to the Frog Kingdom through the Frost Kingdom checkpoint to the Northwest.")],
		// 20
		[new DialogLine(faces["waterkid_normal"], "Low on rations? Here, take this one.")],

		// // waterkid_in_hut = 2
		// // 21
		// [new DialogLine(faces["p_shock"], "%waterkid%! %waterkid%!")],
		// // 22 
		// [new DialogLine(faces["waterkid_shock"], "%pname%! What's wrong?")],
		// // 23
		// [new DialogLine(faces["p_shock"], "They wouldn't let me through at the checkpoint! The guy said I'd have to get the King's permission if I wanted to pass through!"),
		//  new DialogLine(faces["p_shock"], "So I went to the castle to see the King, but the guards wouldn't let me in! He said that the King was upset and wouldn't take any visitors!"),
		//  new DialogLine(faces["p_sad"], "Now I'll never make it to the Frog Kingdom and I'll never get help from the Frog King!")
		// ],
		// // 24
		// [new DialogLine(faces["waterkid_normal"], "Well actually, I can--")],
		// // 25
		// [new DialogLine(faces["p_shock"], "And that means that Dad and %rivalname% will never get cured....")],
		// // 26
		// [new DialogLine(faces["waterkid_normal"], "Listen, I'm--")],
		// // 27
		// [new DialogLine(faces["p_sad"], "And then I'll be all alone forever..."),
		//  new DialogLine(faces["p_mad"], "All because of some stupid king!")
		// ],
		// // 28
		// [new DialogLine(faces["waterkid_mad"], "%pname%!")],
		// // 29
		// [new DialogLine(faces["p_shock"], "What!?")],
		// // 30
		// [new DialogLine(faces["waterkid_normal"], "I know a way that you can meet with the King. I know the King personally and I can take you to him.")],
		// // 31
		// [new DialogLine(faces["p_glad"], "Really? Let's go then!")],
		// // 32
		// [new DialogLine(faces["waterkid_normal"], "Okay, but no detours. Let's head straight to the castle."),
		//  new DialogLine(faces["waterkid_vexed"], "I, uh, don't get along with most Frost Elementals.")
		// ],
		// // 33
		// [new DialogLine(faces["p_glad"], "Sure thing! I didn't plan on dilly-dallying anyway!")],







		// [new DialogLine(faces["p_shock"], "%waterkid%! They wouldn't let me through at the checkpoint! The entire Frost Kingdom is in lockdown mode until they find some missing Princess %waterprincess%."),
		//  new DialogLine(faces["p_shock"], "I'll never be able to make it to see the Frog King now! All because of some stupid lost princess!")
		// ],
		// 21
		[new DialogLine(faces["p_shock"], "They wouldn't let me through at the checkpoint! The guy said I'd have to get the King's permission if I wanted to pass through!"),
		 new DialogLine(faces["p_shock"], "So I went to go see the king, but the guard said the entire Frost Kingdom is in lockdown mode until they find some missing Princess %waterprincess%"),
		 new DialogLine(faces["p_sad"], "Now I'll never make it to the Frog Kingdom and I'll never get help from the Frog King!")
		],
		// 22
		[new DialogLine(faces["waterkid_normal"], "Well actually, I--")],
		// 22
		[new DialogLine(faces["p_shock"], "And that means that Dad and %rivalname% will never get cured....")],
		// 23
		[new DialogLine(faces["waterkid_normal"], "Listen, I can--")],
		// 24
		[new DialogLine(faces["p_sad"], "And then I'll be all alone forever...")],
		// 25
		[new DialogLine(faces["waterkid_mad"], "%pname%!")],
		// 26
		[new DialogLine(faces["p_normal"], "What?")],
		// 27
		[new DialogLine(faces["waterkid_normal"], "I know where the princess is.")],
		// 28
		[new DialogLine(faces["p_shock"], "Really? Let's go get her and resolve this whole mess! Where is she?")],
		// 29
		[new DialogLine(faces["waterkid_vexed"], "She's... right here.")],
		// 30
		[new DialogLine(faces["p_shock"], "What!?"),
		 new DialogLine(faces["p_normal"], "Actually, that would explain your circlet. And you do look like a %waterprincess%, what with you seemingly being made of water and all."),
		 new DialogLine(faces["p_normal"], "But why would a Frost Kingdom princess be so, er, aqueous? Shouldn't you be frostier?"),
		],
		// 31
		[new DialogLine(faces["waterkid_normal"], "It's simple math: 1 Frost Elemental plus 1 Fire Elemental equals 1 Water Elemental. As for the princess title, that's a longer story."),
		 new DialogLine(faces["waterkid_normal"], "My father was the son of the Frost King and the sole heir to the throne. And my mother was one of the Fire King's daughters."),
		 new DialogLine(faces["waterkid_normal"], "In Elemental societies, mixing is highly forbidden. The resulting offspring end up with zero magical potential and are seen as genetic dead ends."),
		 new DialogLine(faces["waterkid_normal"], "Because of that, my parents kept their relationship a secret, and lived apart from each other in their own respective kingdoms."),
		 new DialogLine(faces["waterkid_normal"], "When I was born, the Fire King ordered that my mother be executed for treason. When my father heard the news, he arranged for a Frost soldier to smuggle me to the Frost Kingdom."),
		 new DialogLine(faces["waterkid_normal"], "Meanwhile, he tried to stop the execution himself."),
		 new DialogLine(faces["waterkid_sad"], "He failed, and the Fire King saw to it that both my parents shared the same fate."),
		 new DialogLine(faces["waterkid_normal"], "Distraught over the loss of his only child, the Frost King decided to ignore the natural laws and spare my life. But he did so with one caveat:"),
		 new DialogLine(faces["waterkid_normal"], "He would raise me until I was old enough to survive on my own, at which point I would be exiled from the kingdom."),
		],
		// 32
		[new DialogLine(faces["p_shock"], "So then if you've been exiled out here, why is the whole kingdom searching for you?")],
		// 33
		[new DialogLine(faces["waterkid_normal"], "I haven't been exiled yet--I ran away on my own volition."),
		 new DialogLine(faces["waterkid_normal"], "The Frost King has been acting strangely recently. He somehow got the idea that he and the Fire King should merge their two kingdoms together."),
		 new DialogLine(faces["waterkid_normal"], "He said that he was going to start allowing Fire Elementals to come live in the Frost Kingdom, with the hope that they start mixing on a large scale."),
		 new DialogLine(faces["waterkid_normal"], "He's convinced that's the only way for his lineage to continue--through me and more Water Elementals."),
		 new DialogLine(faces["waterkid_mad"], "But that's suicidal thinking! He's willing to bring about the death of both Frost and Fire Elementals just to preserve his diluted bloodline!"),
		 new DialogLine(faces["waterkid_normal"], "I couldn't talk him out of it, so I got scared and I ran away here to..."),
		 new DialogLine(faces["waterkid_vexed"], "...Well, I didn't plan that far ahead."),
		 new DialogLine(faces["waterkid_vexed"], "I just hoped that having to look for me would force him to pause his plans."),
		],
		// 34
		[new DialogLine(faces["p_shock"], "Wow. That's a lot to take in."),
		 new DialogLine(faces["p_happy"], "But I think I might have an idea that would solve both of our problems at the same time.")
		],
		// 35
		[new DialogLine(faces["waterkid_glad"], "Really? What? How?")],
		// 36
		[new DialogLine(faces["p_normal"], "You said that the this change in the Frost King was sudden, right?"), 
		 new DialogLine(faces["p_glad"], "I might be able to fix him with Frog Magic.")
		],
		// 37
		[new DialogLine(faces["waterkid_shock"], "Frog Magic? How can that help?")],
		// 38
		[new DialogLine(faces["p_normal"], "Frog Magic has the power to heal mental wounds. And it sounds to me like the Frost King is afflicted with lot of mental anguish and baggage."),
		 new DialogLine(faces["p_normal"], "We could both go to the Frost Kingdom and meet with the Frost King."),
		 new DialogLine(faces["p_glad"], "He'll be so happy to see you that he'll be willing to let me help him if you ask."),
		],
		// 39
		[new DialogLine(faces["waterkid_glad"], "Yeah, I... I think that would work! Let's go!")],

		// interactable objects
		// 40
		[new DialogLine(faces["p_normal"], "This barrel is stuffed full of rations."),
		 new DialogLine(faces["p_shock"], "And it's also filled to the brim with water!"),
		 new DialogLine(faces["p_normal"], "No wonder all of the rations %waterkid% has given me have been soggy.")
		],
		// 41
		[new DialogLine(faces["p_normal"], "With all of these barrels around, I'm getting flashbacks to that barrel guy who lives in The Pond."),
		 new DialogLine(faces["p_normal"], "It makes me wonder if I'm not the weird one. Do normal people usually own lots of barrels?")
		],
	];

	public static var frostcaveStrings:Array<Array<DialogLine>> = [
		// 0
		[new DialogLine(faces["frostguard_normal"], "%pname%, I presume? As per the Frost King's orders, we have made arrangements to accomodate you."),
		 new DialogLine(faces["frostguard_normal"], "This cave is designed to test a Frost Elemental's mastery over Frost Magic. Water is no barrier when it's frozen into traversible ice, after all."),
		 new DialogLine(faces["frostguard_normal"], "However, for your case, we threw in some rafts that you can use to get around without the need of Frost Magic."),
		 new DialogLine(faces["frostguard_normal"], "If you ever get stuck, come back here and talk to me. I can reset the positions of all the rafts.")
		],
		// 1
		[new DialogLine(faces["frostguard_normal"], "Want me to reset the positions of all the rafts?")],
		// 2
		[new DialogLine(faces["p_normal"], "Yes, please do.")],
		// 3
		[new DialogLine(faces["p_normal"], "Nope. Just stopping by to say hi.")],
		// 4
		[new DialogLine(faces["frostguard_normal"], "Consider it done. Don't blink or you'll miss it.")],

		// 5
		[new DialogLine(faces["frostguard_shock"], "Oh. How rare. Most people treat me like a nameless guard who is only good for doing his job and nothing else."),
		 new DialogLine(faces["frostguard_mad"], "Well I have a name, world, and it's Frawst Garde! And I'm more than just a Frost kingdom guard--I'm an individual!"),
		 new DialogLine(faces["frostguard_glad"], "Thank you for being caring, %pname%. You're a true friend.")
		],

		// 6
		[new DialogLine(faces["p_shock"], "There's an inscription carved into the base of the pedestal. Just like with the Frog Seal."),
		 new DialogLine(faces["p_normal"], "\"O, Frost Elemental, you who have made it this far, have proven yourself worthy of the Frost Seal.\""),
		 new DialogLine(faces["p_normal"], "\"Now, accept the blessing of the Holy Frost Spirit, and may you forever stay frosty in the face of adversity.\""),
		 new DialogLine(faces["p_normal"], "Huh. Even though I'm not a Frost Elemental, it looks like this can still work. Pretty sweet."),
		],
		// 7
		[new DialogLine(faces["p_shock"], "Brr, that's cold! But I suddenly feel a lot..."),
		 new DialogLine(faces["p_smug"], "...Cooler. Hehehe."),
		],
	];

	public static var frostcheckpointStrings:Array<Array<DialogLine>> = [
		// ch1_progress < done # 
		// 0
		[new DialogLine(faces["frostman_normal"], "Nobody's permitted through here without the Frost King's permission.")],

		// ch1_progress == done #
		// 1
		[new DialogLine(faces["frostman_normal"], "Ah, you must be %pname%. The King informed me that you would be coming through this way. Enjoy your time abroad.")],

		// 2
		[new DialogLine(faces["frostman_normal"], "Y'know, being an ICE agent can be kinda boring sometimes, but it's a duty that I'm proud to serve.")],

		// interactable objects
		// 3
		[new DialogLine(faces["p_normal"], "The shelves are full of travel brochures for the Frost Kingdom. \"Home of the coolest people in the world!\"")],
		// 4
		[new DialogLine(faces["p_normal"], "The shelves are full of travel brochures for the Frog Kingdom. \"Hop on over for a ribbeting vacation that you'll never froget!\"")],
	];

	public static var frostkingdomStrings:Array<Array<DialogLine>> = [
		// waterkid_in_hut < 3
		// 0
		[new DialogLine(faces["frostguard_normal"], "We are in lockdown mode right now. Sorry, but no one's allowed in or out until we can locate Princess %waterprincess%.")],

		// waterkid_in_hut == 3
		// 1
		[new DialogLine(faces["fireguard_normal"], "Which screen am I supposed to look at. Both at the same time???")],
		// 2
		[new DialogLine(faces["waterkid_shock"], "A Fire Elemental!? Why are you dressed as a guard? Why are you manning the main gate?")],
		// 3
		[new DialogLine(faces["fireguard_glad"], "A lot has changed since you went missing, Princess. The Frost Kingdom is now a land of love and tolerance.")],
		
		// 4
		[new DialogLine(faces["waterkid_sad"], "(Impossible! How could Grandpa's plans have advanced to quickly? I've only been gone for a couple of weeks...)"),
		 new DialogLine(faces["waterkid_mad"], "Let me through! My friend and I need to talk to the King!")
		],
		// 5
		[new DialogLine(faces["fireguard_glad"], "Not so fast! His Majesty has ordered that you are to be escorted to the castle if you're found.")],
		// 6
		[new DialogLine(faces["waterkid_mad"], "I can walk there myself!")],
		// 7
		[new DialogLine(faces["fireguard_glad"], "I can't let you do that. King's orders."),
		 new DialogLine(faces["fireguard_glad"], "Come with me.")
		],
		// 8
		[new DialogLine(faces["waterkid_worry"], "%pname%! The Kingdom is straight ahead, just beyond the Great Ice Sculpture. Let's meet back up there!")],





		// girl npc building a snowman or something
		[new DialogLine(faces["frostgirl_glad"], "%waterprincess%! Come build snowmans with me! Your friend can join too!")],
		//
		[new DialogLine(faces["waterkid_normal"], "Sorry, I can't right now. But I'll play with you later for sure.")],
		//
		[new DialogLine(faces["frostgirl_glad"], "Daddy says some Fire Elementals are going to come here soon. Maybe they'll want to play too!")],
		//
		[new DialogLine(faces["waterkid_vexed"], "Yeah...")],


		// priestess npc outside of the church
		// 
		[new DialogLine(faces["frostwoman_shock"], "Princess %waterprincess%! Where have you been? The King has been worried sick over you!"),
		 new DialogLine(faces["frostman_normal"], "You should go see him quickly. But then again, you could always stop by and say a quick prayer or two first."),
		 new DialogLine(faces["frostman_glad"], "I'm sure the King wouldn't mind the slight delay.")
		],

		// farmer guy
		// 
		[new DialogLine(faces["frostman_normal"], "Hello, young man! You look like you're a capable fellow. I've been fighting off an infestation of hungry rabbits lately."),
		 new DialogLine(faces["frostman_normal"], "Tell ya what: for each rabbit that you can \"deal with\", I'll pay you one Frost Coin. Sound like a deal?")
		],
		//
		[new DialogLine(faces["frostman_normal"], "You know the deal: one rabbit equals one Frost Coin.")],
		//
		[new DialogLine(faces["frostman_normal"], "Good work, young man. Here's your reward, as promised.")],

		// item shop
		//
		[new DialogLine(faces["frostman_normal"], "Want to buy something? I only accept Frost Coins, of which you seem to have %number%.")],
		// 
		[new DialogLine(faces["frostman_glad"], "An excellent purchase! Please come again.")],
		//
		[new DialogLine(faces["frostman_glad"], "Nice try, guy. You don't have enough Frost Coins for that.")],

		// signs
		//
		[new DialogLine(faces["p_normal"], "A save booth out here, huh? Unexpected, but I'm not going to question it.")],
		//
		[new DialogLine(faces["p_normal"], "\"St. Lowdegry's Holy Academy\nA house of spirituality and learning.\"")],

		// PENCICLE? :
		// LIBRARY

		//
		[new DialogLine(faces[""], "")],

		//
		[new DialogLine(faces[""], "")],

		//
		[new DialogLine(faces[""], "")],

		//
		[new DialogLine(faces[""], "")],


		// farmer outside
		// stall owner
		// gondola girl
		// kid

		// come hail or high water :^)

		// nuclear family house
		//	
	];

	public static var frostcastleStrings:Array<Array<DialogLine>> = [
		// inside castle, upon first entry
		// 0
		[new DialogLine(faces["waterkid_normal"], "Psst! %pname%! Over here!")],
		// 1
		[new DialogLine(faces["p_shock"], "%waterkid%? Why are you hiding behind that pillar?")],
		// 2
		[new DialogLine(faces["waterkid_normal"], "I snuck away from that guard and hid here, waiting for you to get here.")],
		// 3
		[new DialogLine(faces["p_normal"], "Ah, okay. Now that I'm here, what's the plan? Go straight to the King?")],
		// 4
		[new DialogLine(faces["waterkid_normal"], "Yeah pretty much. I still can't believe how quickly all these Fire Elementals have been brought here. And for one to even be a guard! It's beyond belief!"),
		 new DialogLine(faces["waterkid_normal"], "The Frost Kingdom is on a collision course with destruction. Even the Great Ice Sculpture has been destroyed for goodness' sake!"),
		 new DialogLine(faces["waterkid_sad"], "That was a monument that has lasted for generations--a physical chronology of the Frost Kingdom's history. Melted in an instant!"),
		 new DialogLine(faces["waterkid_mad"], "We need to end this as soon as possible to prevent any further damages.")
		],
		// 5
		[new DialogLine(faces["p_normal"], "Yeah, let's go.")],

		// go see king
		// 25
		[new DialogLine(faces["frostking_shock"], "%waterprincess%! Where have you been!?")],
		// 26
		[new DialogLine(faces["waterkid_sad"], "You've been acting weird recently and that scared me. So I ran away.")],
		// 27
		[new DialogLine(faces["frostking_shock"], "I scared you?"),
		 new DialogLine(faces["frostking_crazy"], "But all I want is what's best for you, sweetie. I want to combine the Frost and Fire kingdoms to create one giant Water Kingdom, full of Water Elementals like you!"),
		 new DialogLine(faces["frostking_crazy"], "And there you'll rule as queen over your faithful servants. My legacy--your legacy will reign supreme! It's the perfect plan!")
		],
		// 28
		[new DialogLine(faces["waterkid_worry"], "But what about the Frost Elementals or the Fire Elementals? What will happen to their cultures, their magic? What about the ancient laws against mixing?")],
		// 29
		[new DialogLine(faces["frostking_crazy"], "Those are all products of an older era. We will usher in a new utopia where everyone gets along together!"),
		 new DialogLine(faces["frostking_crazy"], "The Fire King has already agreed to send some of his people over to live amongst us here. The first steps are already underway!")
		],
		// 30
		[new DialogLine(faces["waterkid_mad"], "Grandpa, that's suicidal! I never asked for this! You can't eliminate two entire peoples just for my sake! This is why I ran away: to get you to stop this!")],
		// 31
		[new DialogLine(faces["waterkid_worry"], "See, %pname%? He's gone mad! Can't you do your magic thing and cure him?")],
		// 32
		[new DialogLine(faces["frostking_shock"], "\"Cure\" me? I don't need curing, I'm perfectly fine! %waterprincess%, just who is this kid anyway?")],
		
		// rt 1
		// 33
		[new DialogLine(faces["p_normal"], "A Frog Mage here to help out.")],
		// 34
		[new DialogLine(faces["frostking_mad"], "A Frog Mage, huh? There is nothing you can do to help. My mind is perfectly clear and devoid of issue.")],
		// 35
		[new DialogLine(faces["waterkid_mad"], "Then you wouldn't mind %pname% trying some Frog Magic on you, would you?")],
		// 36
		[new DialogLine(faces["frostking_caring"], "It would be a complete waste of time, but I will allow him to try if it will calm you down. This will prove that I am of sound mind.")],
	
		// rt 2
		// 37
		[new DialogLine(faces["p_normal"], "Just a passerby, trying to get to the Frog Kingdom.")],
		// 38
		[new DialogLine(faces["frostking_normal"], "Oh, is that so? Well I can grant you passage in a moment, once I'm done talking with %waterprincess%.")],
		// 39
		[new DialogLine(faces["waterkid_mad"], "%pname%! You're forgetting that you were going to use your Frog Magic on Grandpa!")],
		// 40
		[new DialogLine(faces["frostking_crazy"], "Haha! A futile effort, but I will allow it if it will calm you down, %waterprincess%. Give it your best, boy!")],


		// battle
		// 41
		[new DialogLine(faces["frostking_hurt"], "Urgh, my head.")],
		// 42
		[new DialogLine(faces["waterkid_worry"], "Grandpa, are you alright!?")],
		// 43
		[new DialogLine(faces["frostking_hurt"], "Yes, I just need to catch my breath.")],
		// 44
		[new DialogLine(faces["waterkid_worry"], "%pname%, did it work?")],
		// 45
		[new DialogLine(faces["p_normal"], "I think so, yeah. His mind was a jumbled mess. But something about it seemed off, as though it had been intentionally scrambled."),
		 new DialogLine(faces["p_normal"], "But I'm still new to this whole Frog Magic thing, so it might have just been my imagination.")
		],
		// 46
		[new DialogLine(faces["waterkid_worry"], "That doesn't matter right now, so long as he's cured.")],
		// 47
		[new DialogLine(faces["frostking_shock"], "Wow, my mind feels so clear all of a sudden."),
		 new DialogLine(faces["frostking_normal"], "I hate to admit it, but my mind truly was jumbled up. %pname% was it? I am in your debt. And yet, regretfully, I must ask a favor of you."),
		 new DialogLine(faces["frostking_normal"], "I need you to go to the Fire Kingdom as an envoy of the Frost Kingdom and convince the Fire King to cancel our arrangements.")
		],
		// 48
		[new DialogLine(faces["p_normal"], "With all due respect, your Highness, I really need to get to the Frog Kingdom. Don't you have any vassals or someone else who can do that?")],
		// 49
		[new DialogLine(faces["frostking_normal"], "Sadly, the Fire King is a very stubborn person. None of my men has the persuasive abilities enough to convince him to agree to cancelling our agreement."),
		 new DialogLine(faces["frostking_glad"], "However, a Frog Mage like you can surely manage to convince him--by force if needed! And of course, I'll reward your compliance by allowing your passage through the border checkpoint.")
		],
		// 50
		[new DialogLine(faces["waterkid_mad"], "Grandpa, just let him go already! He's already done enough for us, and we can deal with our own problems ourselves.")],
		// 51
		[new DialogLine(faces["frostking_normal"], "I wish that were true. %pname% cleared up my mind and helped me realize that I have to prioritize my kingdom and my people, even if that means I have to be a bad guy."),
		 new DialogLine(faces["frostking_normal"], "Such is my duty as a king.")
		],
		// 52
		[new DialogLine(faces["p_vexed"], "Sigh. Okay, I'll do it.")],
		// 53
		[new DialogLine(faces["frostking_glad"], "Excellent! In order to be recognized as an official enovy of the Frost Kingdom, you will have to obtain the Frost Seal.")],
		// 54
		[new DialogLine(faces["p_normal"], "That wouldn't happen to require passing a trial or a dungeon, would it?")],
		// 55
		[new DialogLine(faces["frostking_normal"], "Yes it would. The Frost Seal rests deep in the Frost Cave to the Northeast, and it's guarded by a trial meant to test the limits of the trialgoer's Frost Magic.")],
		// 56
		[new DialogLine(faces["p_normal"], "Slight problem there: I can't use any Frost Magic.")],
		// 57
		[new DialogLine(faces["frostking_glad"], "Not a problem! I can see to it that one of my men goes on ahead and solves all the puzzles for you. You will be able to waltz on through to the end.")],
		// 58
		[new DialogLine(faces["p_glad"], "That sounds great! I'll head out right away then and get this settled as soon as possible.")],
		// 59
		[new DialogLine(faces["waterkid_blush"], "Ah, wait, %pname%!")],
		// 60
		[new DialogLine(faces["p_normal"], "Yeah?")],
		// 61
		[new DialogLine(faces["waterkid_glad"], "Good luck!")],
		// 62
		[new DialogLine(faces["p_glad"], "Thanks.")],
		// fking says like good luck mayne or wahetaever
		[new DialogLine(faces["waterkid_glad"], "Good luck!")],

		// returning with the frost seal
		// wk says something like good jorb
		[new DialogLine(faces["waterkid_glad"], "Good luck!")],

		// [new DialogLine(faces["p_normal"], "Frost Seal: acquired. So now can I pass as a Frost Kingdom envoy?")],
		// "Yes, that should be sufficient. With that seal, the Fire King should treat you as one of my representatives."
		// "All that is left for you to do now is to go meet with the Fire King and inform him that our integration plans are officially cancelled."
		// "Okay. Then I'm off!"
		// "good luck t. wk"
		// "good luck t. frost king"

		// // after dealing with fire kingdom
		// "Everything is all settled now. And I only had to climb through a volcano and fight an aggressive Fire King."
		// "You what!?"
		// "Perhaps I expected too much from the Fire King. Though he is a king, he is still a Fire Elemental, after all. I am sorry, %pname%. I should have had you bring along some of my men for protection."
		// "Yeah, well, what's done is done. At this point, I just want to get to the Frog Kingdom."
		// "Ah yes, of course. You have done a tremendous service to not just the Frost Kingdom, but also to me and %waterprincess% personally. On behalf of every Frost Elemental, I thank you."
		// "You will from this day forth be a national hero and be granted the privilege to freely come and go anywhere you please within the Frost Kingdom borders."
		// "Thank you, your Highness."
		// "Even though this was a completely unexpected detour for me, I'm happy that I was able to help out both the Frost Kingdom and the Fire Kingdom."
		// "But even more important than that, I'm just relieved that I can finally go to the Frog Kingdom and save my family."
		// "I apologize for being brief, but I really must go."
		// "I understand. Thank you again for your service, and know that you are always welcome here in the Frost Kingdom."
		// "Frosta la vista, %pname%. Or better yet, how does the Frog Clan goodbye go? I think it's \"Good luck and Frogspeed\"."
		// "bye t. wk"
		// "bye t. frost king"
	];	

	public static var firekingdomStrings:Array<Array<DialogLine>> = [
		// any time before end of frost arc
		// 0
		[new DialogLine(faces["p_normal"], "I have no business here, and I don't have time for detours right now.")],
	];


	public static var wellStrings:Array<Array<DialogLine>> = [
		// 
		// 0
		[new DialogLine(faces[""], "Who are you and why are you in my house!?")],
		[new DialogLine(faces[""], "I'm from The Pond and I'm looking for somebody normal. What's happened to everyone around here? They're all so lethargic.")],
		[new DialogLine(faces[""], "It's the Owls! They're putting chemicals into the water that make the friggin' Frog Kingdom laze!")],
		[new DialogLine(faces[""], "Uh, what?")],
		[new DialogLine(faces[""], "They've got a machine down in the well that pumps out Owl Magic-enfused gunk that poisons the well water! Then people drink the water and lose their fighting spirit!")],
		[new DialogLine(faces[""], "It fits the Owl MO to a T. Inflitrate vital systems and corrupt the populace from within!")],
		[new DialogLine(faces[""], "Assuming you're telling the truth, why are you the only one unaffected? In fact, you seem to have way more energy than any normal person.")],
		[new DialogLine(faces[""], "I use a proprietary, patented, 14-layer water filtration system! I tried to sell them to everyone else, but all they did was me endlessly!")],
		[new DialogLine(faces[""], "Well who's mocking whom now!? They're all whacked out of their minds and I'm here having to save them all!")],
		[new DialogLine(faces[""], "And you're going to help me! We're going to go to the bottom of the well and rout out the Owl menace!")],
		[new DialogLine(faces[""], "We will form the human counterstrike taking place to shut this up before it gets fully into place and to block these systems, and to try and have an actual debate about where humanity goes, and cut off the Owls and psychic vampires that are controlling this A.I system before humanity is destroyed.")],
		[new DialogLine(faces[""], "I couldn't follow any of that. Where are you even getting this from?")],
		[new DialogLine(faces[""], "From--That's what it is. I know. From looking at all the data, researching it, studying it, watching the enemy.")],
		[new DialogLine(faces[""], "I'll explain it all later, kid. All you need to know is that there is this big war trying to basically destroy humanity, because humanity has free will, and there is a decision to which level we want to go to.")],
		[new DialogLine(faces[""], "And most importantly: you and I are going to go defeat some Owls! We'll defeat the evil forces! We are the tip of the spear!")],
		[new DialogLine(faces[""], "So are you ready to fight the good fight, buddy?")],

		// 16
		[new DialogLine(faces[""], "I can't say that I understand what you're talking about, but you sound more convincing than the lifeless husks lazing around the Kingdom.")],
		[new DialogLine(faces[""], "So yeah, I'm in! Let's go put an end to these Owl pollutants!")],
		[new DialogLine(faces[""], "I like your spirit, %jason%! The name's Bill Toads!")],
		[new DialogLine(faces[""], "Actually, my name is %pname%.")],

		// 20
		[new DialogLine(faces["frogman_mad"], "%jason%, don't move! I smell an Owl! Wait here while I go scout out the room!")],
		[new DialogLine(faces["frogman_shock"], "There's two of them! Two filthy Owl cretins! And he's operating that poison machine!")],
		[new DialogLine(faces["p_shock"], "Wow, so you were right the whole time?")],
		[new DialogLine(faces["frogman_mad"], "Of course! My sources are infallible!")],
		[new DialogLine(faces["p_normal"], "So shall we go take him out?")],
		[new DialogLine(faces["frogman_mad"], "Naturally! Here's the plan: \nI'm going to run in and distract that fiend! And when I give you the signal, you'll run in from the opposite side and use your magic on him!"),
		 new DialogLine(faces["frogman_mad"], "Ready!?")],
		[new DialogLine(faces["p_normal"], "No, what's the sig--")],
		[new DialogLine(faces["frogman_mad"], "Let's go!")],



		[new DialogLine(faces["frogman_mad"], "Hey you, Owl! You archetypal scum-sucker! You think you can take on the Frog Clan!? You think you can take on me!? I'm a pioneer! I'm an explorer! I'm a human! And I'm comin'!"),
		 new DialogLine(faces["frogman_mad"], "I'm animated! I'm alive! My heart's big! It's got hot blood goin' through it fast! I like to fight too! I like to eat! I like to have children! I'm here! I've got a life force!"),
		 new DialogLine(faces["frogman_mad"], "This is a human! This is what we look like! This is what we act like! This is what everybody was like before us! This is what I am: I'm a throwback! I'm here!"),
		 new DialogLine(faces["frogman_mad"], "You'll never, NEVER defeat the Frog Clan spirit! You'll NEVER defeat Frogs! You'll NEVER win! NEVER!! NEVER EVER!!! NEVER!!!!"),
		 new DialogLine(faces["frogman_mad"], "And this is where we get tested! So rejoice to Frog Almighty for this animated contest of liberty!"),
		 new DialogLine(faces["frogman_mad"], "AAAAAAAAAAGGGHHHHHH!!!!! AAAAAAAAHHHHHYYYYYYAAAAA!!!! AAAAAAAAAAAGGGGGGGGHHHHHHHHHAAAAA!!!!!!!")],

		[new DialogLine(faces["p_normal"], "Is that the signal? I think he's gotten too absorbed into his monologue."),
		 new DialogLine(faces["p_normal"], "Well, now seems as good a time as any."),
		 new DialogLine(faces["p_mad"], "AAAAHHHH!!")],


	];



	public static var hivekingdomStrings:Array<Array<DialogLine>> = [
		// any time before end of frost arc
		// 0
		[new DialogLine(faces["p_normal"], "Is this some kind of reception area?")],

		// 1
		[new DialogLine(faces["p_shock"], "Hellooo! Anyone home?")],

		[new DialogLine(faces["frostking_normal"], "State your name and business.")],

		[new DialogLine(faces["p_normal"], "I'm %pname% and I'm hear to learn the location of the Black Cube.")],

		[new DialogLine(faces["frostking_mad"], "The Black Cube!? Go away! You Owl Mages have harmed us enough!")],

		[new DialogLine(faces["p_shock"], "No, wait! I'm not an Owl Mage--I'm a Frog Mage! I'm trying to track down an Owl Mage who's looking for the Black Cube.")],

		[new DialogLine(faces["frostking_shock"], "A Frog Mage!? Then you might be able to help us.")],

		// bee man walks out to reveal himself
		[new DialogLine(faces["p_normal"], "Sure, I can do that. That kind of thing has become a specialty of mine recently. But if I help you, will you tell me where I can find the Black Cube?")],

		[new DialogLine(faces["frostking_normal"], "If you help, you'll have access to all of the Hive's knowledgebase.")],

		[new DialogLine(faces["p_glad"], "Sounds promising enough to me. Tell me what you need from me.")],

		[new DialogLine(faces["frostking_normal"], "Well you see, the Hive Kingdom is a giant repository of all sorts of information. Like a library, but alive in a sense, thanks to Hive Magic."),
		 new DialogLine(faces["frostking_normal"], "Hive Magic is at its core, a weak form of magic. Because of that, everyone born in the Hive Clan is a born with a perfect mastery of Hive Magic."),
		 new DialogLine(faces["frostking_normal"], "However, Hive Magic's true value is its multiplicative quality, wherein its power increases exponentially when multiple Mages combine their efforts."),
		 new DialogLine(faces["frostking_normal"], "Which brings me to us members of the Hive Clan ourselves. We're all identical copies of each other who sacrifice our individuality for our Kingdom."),
		 new DialogLine(faces["frostking_normal"], "We give up ourselves to create the greater whole that is the living library known as the Hive Kingdom.")],
		
		[new DialogLine(faces["p_normal"], "Okay, so what's the problem?")],

		[new DialogLine(faces["frostking_mad"], "I'm getting to that part!"),
		 new DialogLine(faces["frostking_normal"], "A short time ago, an Owl Mage came here looking for information on the Black Cube, not unlike yourself right now."),
		 new DialogLine(faces["frostking_normal"], "In accordance to Hive Kingdom policy, we shared with him all of the information we possessed."),
		 new DialogLine(faces["frostking_mad"], "In lieu of saying his thanks, he used his twisted magic on us and left!"),
		 new DialogLine(faces["frostking_mad"], "It's because of him that I've taken this unslightly form!")],
		
		[new DialogLine(faces["p_normal"], "You seem pretty normal to me. A bit verbose, but who isn't?")],

		[new DialogLine(faces["frostking_mad"], "Normal!? NORMAL!? Maybe to a human such as yourself! My current state is so far beyond the very antithesis of normal!")],
		[new DialogLine(faces["frostking_normal"], "Did you miss the part where I said Hive Mages are all carbon copies of one another? In our default state, we are devoid of personalities, egos, emotions.")],
		[new DialogLine(faces["frostking_normal"], "We all perform equal roles of maintaining and operating the super computer that is the Hive Kingdom. I would say that it makes us happy, but we ordinarilly haven't the concept of happy.")],
		
		[new DialogLine(faces["p_normal"], "Where's the fun in that? Sounds like a terrible way to live.")],

		[new DialogLine(faces["frostking_mad"], "We are a hivemind race--it's what we do! For us, being an individual is as painful as being part of a hivemind would be to you!"),
		 new DialogLine(faces["frostking_hurt"], "And now! Now I'm cursed with an ego and burdened by emotions! I've been rendered unable to perform even the most basic of my daily functions!"),
		 new DialogLine(faces["frostking_glad"], "Until now that is! You can use your Frog Magic to undo the damages done unto me and my people.")],

		[new DialogLine(faces[""], "")],
	];



	public static var worldmapStrings:Array<Array<DialogLine>> = [
		// 0  
		[new DialogLine(faces["r_normal"], "Let's go!")],

		// 1  
		[new DialogLine(faces["p_shock"], "Uh oh! Elder Froggo didn't mention anything about storms! I've got to steer around them!")],

		// 2  
		[new DialogLine(faces["p_shock"], "Oh no! The winds are too strong! I'm being pulled into the storm!")],

		// 3 
		[new DialogLine(faces["p_shock"], "Aaaaaagghhh!")],
	];
}





		// [new DialogLine(faces[""], "Who are you and why are you in my house!?")],
		// [new DialogLine(faces[""], "I'm from The Pond and I'm looking for somebody normal. What's happened to everyone around here? They're all so lethargic.")],
		// [new DialogLine(faces[""], "It's the Owls! They're putting chemicals into the water that make the friggin' Frog Kingdom laze!")],
		// [new DialogLine(faces[""], "Uh, what?")],
		// [new DialogLine(faces[""], "They've got a machine down in the well that pumps out Owl Magic-enfused gunk that poisons the well water! Then people drink the water and lose their fighting spirit!")],
		// [new DialogLine(faces[""], "It fits the Owl MO to a T. Inflitrate vital systems and corrupt the populace from within!")],
		// [new DialogLine(faces[""], "Assuming you're telling the truth, why are you the only one unaffected? In fact, you seem to have way more energy than any normal person.")],
		// [new DialogLine(faces[""], "I use a proprietary, patented, 14-layer water filtration system! I tried to sell them to everyone else, but all they did was me endlessly!")],
		// [new DialogLine(faces[""], "Well who's mocking whom now!? They're all whacked out of their minds and I'm here having to save them all!")],
		// [new DialogLine(faces[""], "And you're going to help me! We're going to go to the bottom of the well and rout out the Owl menace!")],
		// [new DialogLine(faces[""], "We will form the human counterstrike taking place to shut this up before it gets fully into place and to block these systems, and to try and have an actual debate about where humanity goes, and cut off the Owls and psychic vampires that are controlling this A.I system before humanity is destroyed.")],
		// [new DialogLine(faces[""], "I couldn't follow any of that. Where are you even getting this from?")],
		// [new DialogLine(faces[""], "From--That's what it is. I know. From looking at all the data, researching it, studying it, watching the enemy.")],
		// [new DialogLine(faces[""], "I'll explain it all later, kid. All you need to know is that there is this big war trying to basically destroy humanity, because humanity has free will, and there is a decision to which level we want to go to.")],
		// [new DialogLine(faces[""], "And most importantly: you and I are going to go defeat some Owls! We'll defeat the evil forces! We are the tip of the spear!")],
		// [new DialogLine(faces[""], "So are you ready to fight the good fight, buddy?")],

		// [new DialogLine(faces[""], "I can't say that I understand what you're talking about, but you sound more convincing than the lifeless husks lazing around the Kingdom.")],
		// [new DialogLine(faces[""], "So yeah, I'm in! Let's go put an end to these Owl pollutants!")],
		// [new DialogLine(faces[""], "I like your spirit, %jason%! The name's Bill Toads!")],
		// [new DialogLine(faces[""], "Actually, my name is %pname%.")],
		// [new DialogLine(faces[""], "")],



		// [new DialogLine(faces["frogman_mad"], "Hey you, Owl! You archetypal scum-sucker! You think you can take on the Frog Clan!? You think you can take on me!? I'm a pioneer! I'm an explorer! I'm a human! And I'm comin'!"),
		//  new DialogLine(faces["frogman_mad"], "I'm animated! I'm alive! My heart's big! It's got hot blood goin' through it fast! I like to fight too! I like to eat! I like to have children! I'm here! I've got a life force!"),
		//  new DialogLine(faces["frogman_mad"], "This is a human! This is what we look like! This is what we act like! This is what everybody was like before us! This is what I am: I'm a throwback! I'm here!"),
		//  new DialogLine(faces["frogman_mad"], "You'll never, NEVER defeat the Frog Clan spirit! You'll NEVER defeat Frogs! You'll NEVER win! NEVER!! NEVER EVER!!! NEVER!!!!"),
		//  new DialogLine(faces["frogman_mad"], "And this is where we get tested! So rejoice to Frog Almighty for this animated contest of liberty!"),
		//  new DialogLine(faces["frogman_mad"], "AAAAAAAAAAGGGHHHHHH!!!!! AAAAAAAAHHHHHYYYYYYAAAAA!!!! AAAAAAAAAAAGGGGGGGGHHHHHHHHHAAAAA!!!!!!!")],

		// [new DialogLine(faces[""], "I think he got too wrapped up in his monologue to give me the signal. Now seems as good a time as any.")],




















