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
import flash.net.URLRequest;

import mx.utils.StringUtil;

public class AnswerItem extends MBox {
    private var playSound:Sound;

    public function AnswerItem(sound:String) {
        super(false, MDirection.Vertical, 10, true);
        if (StringUtil.isWhitespace(sound))
            return;
        playSound = new Sound(new URLRequest(sound));
        addEventListener(MouseEvent.ROLL_OVER, function (e:MouseEvent):void {
            playSound.play();
        });
    }
}
}
