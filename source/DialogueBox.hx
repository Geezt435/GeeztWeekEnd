package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.input.FlxKeyManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

using StringTools;

class DialogueBox extends FlxSpriteGroup
{
	var box:FlxSprite;

	var curCharacter:String = '';

	var dialogue:Alphabet;
	var dialogueList:Array<String> = [];

	// SECOND DIALOGUE FOR THE PIXEL SHIT INSTEAD???
	var swagDialogue:FlxTypeText;

	var dropText:FlxText;

	public var finishThing:Void->Void;

	var portraitLeft:FlxSprite;
	var portraitRight:FlxSprite;

	var handSelect:FlxSprite;
	var bgFade:FlxSprite;

	public function new(talkingRight:Bool = true, ?dialogueList:Array<String>)
	{
		super();

		switch (PlayState.SONG.song.toLowerCase())
		{
			// case 'senpai':
			// 	FlxG.sound.playMusic(Paths.music('Lunchbox'), 0);
			// 	FlxG.sound.music.fadeIn(1, 0, 0.8);
			// case 'thorns':
			// 	FlxG.sound.playMusic(Paths.music('LunchboxScary'), 0);
			// 	FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'echo-enzyme':
				FlxG.sound.playMusic(Paths.music('chiptune'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'bioluminescent':
				FlxG.sound.playMusic(Paths.music('chiptune'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'overgrown':
				FlxG.sound.playMusic(Paths.music('chiptune'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'jeez':
				FlxG.sound.playMusic(Paths.music('distorted'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
		}

		bgFade = new FlxSprite(-200, -200).makeGraphic(Std.int(FlxG.width * 1.3), Std.int(FlxG.height * 1.3), 0xFFB3DFd8);
		bgFade.scrollFactor.set();
		bgFade.alpha = 0;
		add(bgFade);

		new FlxTimer().start(0.83, function(tmr:FlxTimer)
		{
			bgFade.alpha += (1 / 5) * 0.7;
			if (bgFade.alpha > 0.7)
				bgFade.alpha = 0.7;
		}, 5);

		box = new FlxSprite(-20, 45);
		
		var hasDialog = false;
		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'echo enzyme' | 'bioluminescent' | 'overgrown':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('Dialogue/geezDBOX');
				box.animation.addByPrefix('normalOpen', 'Geez Textbox Spawn instance 1', 24, false);
				box.animation.addByIndices('normal', 'Geez Textbox Spawn instance 1', [11], "", 24);
				box.width = 200;
				box.height = 200;
				box.x = -120;
				box.y = 140;
			case 'jeez':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [11], "", 24);
				box.width = 200;
				box.height = 200;
				box.x = -120;
				box.y = 420;
		}

		this.dialogueList = dialogueList;
		
		if (!hasDialog)
			return;
		
		if (PlayState.SONG.song.toLowerCase() == 'echo enzyme' || PlayState.SONG.song.toLowerCase() == 'bioluminescent') {
			portraitLeft = new FlxSprite(40, 103);
			portraitLeft.frames = Paths.getSparrowAtlas('Dialogue/GeezFACTS');
			portraitLeft.animation.addByPrefix('enter', 'GeezFACTS Enter instance 1', 24, false);
			portraitLeft.setGraphicSize(Std.int(portraitLeft.width * PlayState.daPixelZoom * 0.12));
			portraitLeft.updateHitbox();
			portraitLeft.scrollFactor.set();
			portraitLeft.antialiasing = true;
			add(portraitLeft);
			portraitLeft.visible = false;
		}
		else if (PlayState.SONG.song.toLowerCase() == 'overgrown') {
			portraitLeft = new FlxSprite(40, 103);
			portraitLeft.frames = Paths.getSparrowAtlas('Dialogue/GeezTired');
			portraitLeft.animation.addByPrefix('enter', 'GeezTired Enter instance 1', 24, false);
			portraitLeft.setGraphicSize(Std.int(portraitLeft.width * PlayState.daPixelZoom * 0.12 ));
			portraitLeft.updateHitbox();
			portraitLeft.scrollFactor.set();
			add(portraitLeft);
			portraitLeft.visible = false;
		}
		else if (PlayState.SONG.song.toLowerCase() == 'jeez') {
			portraitLeft = new FlxSprite(40, 103);
			portraitLeft.frames = Paths.getSparrowAtlas('Dialogue/deadGeezFACTS');
			portraitLeft.animation.addByPrefix('enter', 'deadGeezFACTS Enter instance 1', 24, false);
			portraitLeft.setGraphicSize(Std.int(portraitLeft.width * PlayState.daPixelZoom * 0.12 ));
			portraitLeft.updateHitbox();
			portraitLeft.scrollFactor.set();
			add(portraitLeft);
			portraitLeft.visible = false;
		}
	
		if (PlayState.SONG.song.toLowerCase() == 'echo enzyme' || PlayState.SONG.song.toLowerCase() == 'bioluminescent' || PlayState.SONG.song.toLowerCase() == 'overgrown' ) {
			portraitRight = new FlxSprite(770, 250);
			portraitRight.frames = Paths.getSparrowAtlas('Dialogue/boyfriendPort');
			portraitRight.animation.addByPrefix('enter', 'BF portrait enter instance 1', 24, false);
			portraitRight.setGraphicSize(Std.int(portraitRight.width * PlayState.daPixelZoom * 0.14));
			portraitRight.updateHitbox();
			portraitRight.scrollFactor.set();
			portraitRight.antialiasing = true;
			add(portraitRight);
			portraitRight.visible = false;
		}
		else if (PlayState.SONG.song.toLowerCase() == 'jeez') {
			portraitRight = new FlxSprite(770, 290);
			portraitRight.frames = Paths.getSparrowAtlas('Dialogue/deadboyfriendPort');
			portraitRight.animation.addByPrefix('enter', 'deadBF portrait enter instance 1', 24, false);
			portraitRight.setGraphicSize(Std.int(portraitRight.width * PlayState.daPixelZoom * 0.14));
			portraitRight.updateHitbox();
			portraitRight.scrollFactor.set();
			portraitRight.antialiasing = true;
			add(portraitRight);
			portraitRight.visible = false;
		}
		
		box.animation.play('normalOpen');
		box.setGraphicSize(Std.int(box.width * PlayState.daPixelZoom * 0.9));
		box.updateHitbox();
		add(box);

		box.screenCenter(X);

		if (PlayState.SONG.song.toLowerCase() == 'echo enzyme' || PlayState.SONG.song.toLowerCase() == 'bioluminescent' || PlayState.SONG.song.toLowerCase() == 'overgrown' ) {
			dropText = new FlxText(246, 506, Std.int(FlxG.width * 0.6), "", 48);
			dropText.font = 'Minecraft';
			dropText.color = 0xBF000000;
			add(dropText);

			swagDialogue = new FlxTypeText(240, 500, Std.int(FlxG.width * 0.6), "", 48);
			swagDialogue.font = 'Minecraft';
			swagDialogue.color = 0xFF50997E;
			swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
			add(swagDialogue);
		} else if (PlayState.SONG.song.toLowerCase() == 'jeez') {
			dropText = new FlxText(246, 506, Std.int(FlxG.width * 0.6), "", 48);
			dropText.font = 'Feral-Regular';
			dropText.color = 0xBF000000;
			dropText.alpha = 0.1;
			add(dropText);

			swagDialogue = new FlxTypeText(240, 500, Std.int(FlxG.width * 0.6), "", 48);
			swagDialogue.font = 'Feral-Regular';
			swagDialogue.color = 0xFF000000;
			swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
			add(swagDialogue);
		}

		dialogue = new Alphabet(0, 80, "", false, true);
		// dialogue.x = 90;
		// add(dialogue);
	}

	var dialogueOpened:Bool = false;
	var dialogueStarted:Bool = false;

	override function update(elapsed:Float)
	{
		dropText.text = swagDialogue.text;

		if (box.animation.curAnim != null)
		{
			if (box.animation.curAnim.name == 'normalOpen' && box.animation.curAnim.finished)
			{
				box.animation.play('normal');
				dialogueOpened = true;
			}
		}

		if (dialogueOpened && !dialogueStarted)
		{
			startDialogue();
			dialogueStarted = true;
		}

		if (PlayerSettings.player1.controls.ACCEPT && dialogueStarted == true)
		{
			remove(dialogue);
				
			FlxG.sound.play(Paths.sound('clickText'), 0.8);

			if (dialogueList[1] == null && dialogueList[0] != null)
			{
				if (!isEnding)
				{
					isEnding = true;

					if (PlayState.SONG.song.toLowerCase() == 'echo enzyme' || PlayState.SONG.song.toLowerCase() == 'bioluminescent' || PlayState.SONG.song.toLowerCase() == 'overgrown') {
						FlxG.sound.music.fadeOut(2.2, 0);
					} else if (PlayState.SONG.song.toLowerCase() == 'jeez') {
						FlxG.sound.music.fadeOut(1.6, 0);
					} else {
						FlxG.sound.music.fadeOut(2, 0);
					}

					new FlxTimer().start(0.2, function(tmr:FlxTimer)
					{
						box.alpha -= 1 / 5;
						bgFade.alpha -= 1 / 5 * 0.7;
						portraitLeft.visible = false;
						portraitRight.visible = false;
						swagDialogue.alpha -= 1 / 5;
						dropText.alpha = swagDialogue.alpha;
					}, 5);

					new FlxTimer().start(1.2, function(tmr:FlxTimer)
					{
						finishThing();
						kill();
					});
				}
			}
			else
			{
				dialogueList.remove(dialogueList[0]);
				startDialogue();
			}
		}
		
		super.update(elapsed);
	}

	var isEnding:Bool = false;

	function startDialogue():Void
	{
		cleanDialog();
		// var theDialog:Alphabet = new Alphabet(0, 70, dialogueList[0], false, true);
		// dialogue = theDialog;
		// add(theDialog);

		// swagDialogue.text = ;
		swagDialogue.resetText(dialogueList[0]);
		swagDialogue.start(0.04, true);

		switch (curCharacter)
		{
			case 'dad':
				portraitRight.visible = false;
				if (!portraitLeft.visible)
				{
					portraitLeft.visible = true;
					portraitLeft.animation.play('enter');
				}
			case 'bf':
				portraitLeft.visible = false;
				if (!portraitRight.visible)
				{
					portraitRight.visible = true;
					portraitRight.animation.play('enter');
				}
		}
	}

	function cleanDialog():Void
	{
		var splitName:Array<String> = dialogueList[0].split(":");
		curCharacter = splitName[1];
		dialogueList[0] = dialogueList[0].substr(splitName[1].length + 2).trim();
	}
}
