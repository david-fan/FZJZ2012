package SQ {
import com.david.ui.MBox;
import com.david.ui.MCheckBox;
import com.david.ui.MDirection;
import com.david.ui.MMachineTextBlock;
import com.david.ui.core.MSprite;

import flash.events.MouseEvent;

public class TxtItem extends AnswerItem implements IAnswer {
    private var cb:MCheckBox;
    private var r:Boolean;
    private var txtblock:MMachineTextBlock;

    public function TxtItem(txt:String, r:Boolean, sound:String = null) {
        super(MDirection.Horizon, sound);
        cb = new MCheckBox(new Asset.cbbg(), new Asset.cbc());
        txtblock = new MMachineTextBlock(txt);
        this.addChild(cb);
        this.addChild(txtblock);
        txtblock.mouseEnabled=true;
        txtblock.addEventListener(MouseEvent.ROLL_OVER, function(e:MouseEvent):void{
            playSound();
        });
        this.r = r;
    }

    public function get ok():Boolean {
        return cb.checked == r;
    }
}
}