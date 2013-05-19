package SQ {
import com.david.ui.core.MSprite;

import flash.events.MouseEvent;
import flash.media.Sound;
import flash.net.URLRequest;

public class Question {
    public var title:String;
    public var answers:Array = [];
    public var type:int;
    private var _sound:Sound;

    public function Question(title:String, type:int = 1, sound:String = null) {
        this.title = title;
        this.type = type;
        if (sound != null) {
            _sound = new Sound(new URLRequest(sound));
        }
    }

    public function playSound():void {
        if (_sound)
            _sound.play();
    }

    public function addAnswer(answer:String, right:Boolean, sound:String = ""):void {
        this.answers.push({a: answer, r: right, s: sound});
    }
}
}