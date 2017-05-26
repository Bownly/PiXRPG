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
		"frognpcman_vexed"    => 61,
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
		"%pname%"        => "Player",
		"%rnameDefault%" => "Jacob",
		"%rivalname%"    => "Brother",
		"%item%"         => ":O",
		"%level%"        => "2",
		"%xp%"           => "10"
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
		[new DialogLine(faces["p_glad"], "I-I did it! And I just got %xp% XP!")],
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
	];

	public static var itemDescriptions:Map<String, String> = [
		"Pond Scum"     => "Relax, it's the name of a popular sports drink. It's not only tasty, but it also fully restores MP.",
		"Edible Barrel"  => "Heals 20 MP.\nIt's an... edible barrel? Not sure what that means, but it's apparently healthy enough. I just hope I don't get any splinters from eating this.",
	];

	public static var mchomeStrings:Array<Array<DialogLine>> = [
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
		[new DialogLine(faces["dad_normal"], "Oh wait! I almost forgot something important. Take these beginner pens with you. Those are family heirlooms, so be sure to treat them well.")],

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
		 new DialogLine(faces["owlnpc_glad"], "Heh, nothing personal, kids, but I'm going to have to mind blast you both too.")
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
		[new DialogLine(faces["p_hurt"], "He's been mind blasted by that owl guy. Elder Froggo must know how to fix this.")],


		// after returning with Froggo
		// 34
		[new DialogLine(faces["froggo_normal"], "Ah..."),
		 new DialogLine(faces["froggo_normal"], "I see...")
		],
		
		// 35
		[new DialogLine(faces["froggo_normal"], "Hmm..."),
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
		 new DialogLine(faces["p_scared"], "This is all too much. I can't possibly travel all alone! "),
		 new DialogLine(faces["froggo_normal"], "I observed you during your training, %pname%. You are far more capable than you give yourself credit for. Besides, your family is depending on you."),
		 new DialogLine(faces["froggo_normal"], "Now then, I'm going to take these two back to The Pond so I can get started on curing them. Come see me when you're ready to depart.")
		],


		// 38  // this goes inbetween 24 and 25
		[new DialogLine(faces["r_hurt"], "Gah!")],

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
		 new DialogLine(faces["froggo_normal"], "If you use Frog Magic for nefarious or selfish reasons, you risk becoming corrupted and evil. The Owl Clan is living proof of that."),
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


		// after owl guy mind blasts family
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
		[new DialogLine(faces["p_sad"], "Dad. %rivalname%.")],

		// 36
		[new DialogLine(faces["froggo_normal"], "Chin up, lad. The Frog King will certainly cure them both and then you and %rivalname% can argue over whose hood is the coolest."),
		 new DialogLine(faces["froggo_normal"], "And on that note, we should head up North to the docks. Now's the chance to do any final preparations you might have left to do.")
		],

		// npc messages
		// beginning of the game, with rivalkid
		// 37
		[new DialogLine(faces["frognpcman_glad"], "I've collected so many barrels that I can't even get to my bed anymore. Sleeping on the floor isn't so bad once you get used to it.")],

		// 38
		[new DialogLine(faces["frognpcman_normal"], "Y'know, I always thought it was funny how your dad wanted to move away to escape the mage life, but he ended up moving here--to Tadpole Island of all places."),
		 new DialogLine(faces["frognpcman_normal"], "I mean, there's nothing on this island other than The Pond. What was he thinking?"),
		 new DialogLine(faces["frognpcman_shock"], "Oh, sorry! That was rude. I have this habit of saying things that I shouldn't."),
		],

		// 39
		[new DialogLine(faces["frognpcman_normal"], "Greetings, %pname%. Did you know that I’m hosting an exchange student? Her name is, uh... well, I forgot. My memory isn't the best."),
		 new DialogLine(faces["frognpcman_normal"], "She’s from that one tribe of mute folk. I can't remember their name, and she won't tell me. But you've heard of them, haven't you? They wear those funny bear hats."),
		 new DialogLine(faces["frognpcman_normal"], "Like the Frog Clan, they’re a magical people, but their magic is of a different ilk. Whereas Frog Magic is based on the mind, their magic draws is more nature focused."),
		 new DialogLine(faces["frognpcman_normal"], "It’s said that they can channel the powers of Mother Nature herself to do things like heal people and \"save\", whatever that means. ")
		],

		// 40
		[new DialogLine(faces["frognpcman_normal"], "Greetings. It's rare that we get visitors here at The Pond. You must be %pname% and %rivalname%."),
		 new DialogLine(faces["frognpcman_normal"], "In that case, you'll want to head to Elder Froggo's. This bridge here will take you right to his front door. You can't miss it.")
		],


		// after frogponddun = done
		// 41
		[new DialogLine(faces["frognpcman_shock"], "Hold up. So you're saying that you two have already gone to the cave of initiation on your first day of training? And you both completed it?"),
		 new DialogLine(faces["frognpcman_normal"], "You truly are your father's sons. Man, I've always been jealous of his skills. And now I'm jealous of two children too. What am I doing with my life?")
		],

		// 42
		[new DialogLine(faces["frognpcman_normal"], "I had this great idea: I could give a pen and some paper to the mute exchange student I'm hosting and have her communicate with me through writing."),
		 new DialogLine(faces["frognpcman_normal"], "Ingenious, I know. Especially considering that we have pens out the wazoo here in The Pond."),
		 new DialogLine(faces["frognpcman_vexed"], "...\nBut we don't have any paper."),
		 new DialogLine(faces["frognpcman_vexed"], "Not a single sheet in the entire pond.")
		],

		// 43
		[new DialogLine(faces["frognpcman_normal"], "Hey guys, congrats on finishing the Cave of Initiation. Boy, I remember when I went through the cave as a tadpole scount myself. Good times.")],


		// after owl guy mind blasts family
		// 44
		[new DialogLine(faces["frognpcman_sad"], "Why so distraught? Not enough barrels?")],

		// 45
		[new DialogLine(faces["frognpcman_shock"], "Wow, you look awful! Did you lose a fight or something?")],

		// 46
		[new DialogLine(faces["frognpcman_sad"], "%pname%, you look beat up. I'm sure our mute friend will heal you up. And while she's doing that, she could help you \"save\" too.")],

		// 47
		[new DialogLine(faces["frognpcman_normal"], "%pname%, you look all shaken up. Are you okay?")],


		// after meeting froggo at mchome and he tells you about the boat
		// 48
		[new DialogLine(faces["frognpcman_glad"], "If you ever need any barrels, just say the word and I'll help you out, my man.")
		],

		// 49
		[new DialogLine(faces["frognpcman_sad"], "%pname%, I heard the bad news. I'm so sorry."),
		 new DialogLine(faces["frognpcman_glad"], "But at least they couldn't be in more capable hands!"),
		 new DialogLine(faces["frognpcman_vexed"], "Well, technically that's not true--the Frog King is leagues more capable. I mean, Elder Froggo can only do so much..."),
		 new DialogLine(faces["frognpcman_shock"], "Oh no! There I go blurting out my train of thoughts again. When will I learn?")
		],

		// 50
		[new DialogLine(faces["frognpcman_normal"], "While you're gone, Golly has agreed to help in the healing efforts. Your family will be safe here."),
		 new DialogLine(faces["frognpcman_glad"], "Oh right, I guess I didn't tell you, but Golly is what I'm calling my mute exchange student. She seems to like it.")
		],

		// 51
		[new DialogLine(faces["frognpcman_normal"], "Don't worry, %pname%. We'll take good care of your family. Safe travels, and frogspeed.")],


		// dialog for free barrels, independent of story progress
		// 52
		[new DialogLine(faces["frognpcman_shock"], "It looks like you could use an extra barrel. Here, take this one.")
		],

		// sign stuff, independent of story progress
		// 53
		[new DialogLine(faces["p_normal"], "There's a crudely written message. It says \"Elder Froggo's house\".\nDid Elder Froggo write this?")],
		// 54
		[new DialogLine(faces["pfrog_normal"], "There's a crudely written message. It says \"Elder Froggo's house\".\nDid Elder Froggo write this?")],

		// 55
		[new DialogLine(faces["p_normal"], "There's a crudely written message. It says \"Non-mages get off my lawn! REEEEEE!\"\nWhat did he mean by this?")],
		// 56
		[new DialogLine(faces["pfrog_normal"], "There's a crudely written message. It says \"Non-mages get off my lawn! REEEEEE!\"\nWhat did he mean by this?")],

	];

	public static var frogponddocksStrings:Array<Array<DialogLine>> = [
		// 0
		[new DialogLine(faces["p_normal"], "It's locked.")
		],

		// 1
		[new DialogLine(faces["froggo_normal"], "Hold on a moment, I'll have to unlock the door first.")
		],

		// 2
		[new DialogLine(faces["froggo_sad"], "%pname%, I'm terribly sorry that this burden has been thrust upon you."),
		 new DialogLine(faces["froggo_normal"], "However, I know that you're more than capable of seeing this through to the end."),
		 new DialogLine(faces["froggo_normal"], "The trip to the Frog Kingdom is a short one. Just head east past the FireIce Bay, and when you get to the mainland, follow the coast in a counterclockwise direction."),
		 new DialogLine(faces["froggo_normal"], "Frogspeed, %pname%. Though it was brief, remember your training.")
		 ],

		// 3
		[new DialogLine(faces["froggo_normal"], "Frogspeed, %pname%. Though it was brief, remember your training.")
		],

		// 4
		[new DialogLine(faces["pfrog_normal"], "This is it... \nAm I ready?")
		],

		// 5
		[new DialogLine(faces["pfrog_mad"], "Ready or not, I have to do it.")
		],

		// 6
		[new DialogLine(faces["pfrog_sad"], "On second thought, I should go do that one thing first...")
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
		[new DialogLine(faces["kekdoor"], "You’ve reached the end of the first floor. Nice! Just pass my trial and you can proceed to the next floor."),
		 new DialogLine(faces["kekdoor"], "By the way, watch out for wild frogs down there. The lack of sunlight makes them easily agitated, and they might jump out at you."),
		 new DialogLine(faces["kekdoor"], "If a battle gets too hairy for you, there's no shame in ESCaping. Get it? ESC-aping? *wink wink nudge nudge*")
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
		[new DialogLine(faces["p_shock"], "Frog in a box!")
		],

		// 16
		[new DialogLine(faces["frognpcman_normal"], "Sup. Don't mind me. Just watching some tv."),
		],

		// 17
		[new DialogLine(faces["r_shock"], "Oh, hey, %pname%."),
		 new DialogLine(faces["r_smug"], "Once again, I've beaten you to the finish line. You've gotta step your game up, bro."),
		],
		
		// 18
		[new DialogLine(faces["r_normal"], "I'll be waiting back at Elder Froggo's house. See you there.")
		],

		// 19
		[new DialogLine(faces["p_shock"], "What's a sign doing in the middle of the room? I should probably go read it or something.")
		],

		// 20
		[new DialogLine(faces["p_shock"], "There's an inscription carved into the sign."),
		 new DialogLine(faces["p_normal"], "\"By making it this far, thoust've provenst thineselfst to be a capable initiate.\""),
		 new DialogLine(faces["p_normal"], "\"Hereby bestowethd upon thou is the blessing of the Holy Frog.\""),
		 new DialogLine(faces["p_normal"], "\"Thou can observest the mark of thine new blessing by opening thine status screen.\""),
		 new DialogLine(faces["p_normal"], "\"Frogspeed, young one.\""),
		 new DialogLine(faces["p_normal"], "I... think I understood all that. Who's choice was it to use such poorly written old-timey speak?"),
		 new DialogLine(faces["p_glad"], "More importantly, I've completed the trial! I've gotta go hurry up and meet back up with %rivalname% and Elder Froggo!")
		],

		// 21
		[new DialogLine(faces["pfrog_shock"], "Frog in a box!")
		],

		// end of demo secret boss
		// 22
		[new DialogLine(faces["dummy"], "Hi ho! It's %pname%! You're leaving for a trip to the mainland!? The mainland has lots of tough guys! You're gonna need to get tough!"),
		 new DialogLine(faces["dummy"], "I know! Let's do some advanced training! I'll go all out this time!")
		],
		// 23
		[new DialogLine(faces["dummy"], "Yaaay! Let's do it!")
		],
		// 24
		[new DialogLine(faces["dummy"], "No!? But I want to train!")
		],
		// 25
		[new DialogLine(faces["dummy"], "Hey ho! You beat me! Take this secret special pen as a gift! It's a reward for beating the demo exclusive boss: ME! Come back again!")
		],
		// 26
		[new DialogLine(faces["dummy"], "Hey ho! You beat me! I already gave you the PixCalibur! All I have left is a couple Pond Scums! Take one!")
		],
		// 27
		[new DialogLine(faces["dummy"], "Hey ho! You beat me! Still thirsty!? I only have one Pond Scum left! Take it!")
		],
		// 28
		[new DialogLine(faces["dummy"], "Hey ho! You beat me! I have nothing left to give you! But let's train again anyway!")
		],

		// 29  // moving these from indexes 1 and 2 for easier hood variables reasons
		[new DialogLine(faces["p_normal"], "Sure.")
		],
		// 30
		[new DialogLine(faces["pfrog_normal"], "Sure.")
		],
		// 31  // moving these from indexes 1 and 2 for easier hood variables reasons
		[new DialogLine(faces["p_normal"], "I'm good.")
		],
		// 32
		[new DialogLine(faces["pfrog_normal"], "I'm good.")
		],
	];
}





























