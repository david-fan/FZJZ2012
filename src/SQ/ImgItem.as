package SQ {
import com.david.ui.MBox;
import com.david.ui.MCheckBox;
import com.david.ui.MDirection;
import com.david.ui.MImage;

import flash.events.MouseEvent;

public class ImgItem extends AnswerItem implements IAnswer {
    private var cb:MCheckBox;
    private var r:Boolean;
    public var img:MImage;

    public function ImgItem(url:String, r:Boolean, sound:String = null) {
        super(MDirection.Vertical, sound);
        cb = new MCheckBox(new Asset.cbbg(), new Asset.cbc());
        img = new MImage(url);
        this.addChild(img);
        this.addChild(cb);
        img.mouseEnabled=true;
        img.addEventListener(MouseEvent.ROLL_OVER, function(e:MouseEvent):void{
            playSound();
        });
        this.r = r;
    }

    public function get ok():Boolean {
        return cb.checked == r;
    }
}
}