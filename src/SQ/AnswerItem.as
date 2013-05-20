/**
 * Created with IntelliJ IDEA.
 * User: david
 * Date: 13-5-18
 * Time: 下午10:26
 * To change this template use File | Settings | File Templates.
 */
package SQ {
import com.david.ui.MBox;
import com.david.ui.MDirection;

import flash.events.MouseEvent;

import flash.media.Sound;
import flash.media.SoundChannel;
import flash.net.URLRequest;

import mx.utils.StringUtil;

public class AnswerItem extends MBox {
    private var _sound:Sound;
    private var _soundChannel:SoundChannel;

    public function AnswerItem(direction:String, sound:String = null) {
        super(false, direction, 10, true);
        this.mouseEnabled = true;
        if (sound == null)
            return;
        _sound = new Sound(new URLRequest(sound));
    }

    protected function playSound():void {
        if (_soundChannel)
            _soundChannel.stop();
        if (_sound)
            _soundChannel = _sound.play();
    }
}
}
