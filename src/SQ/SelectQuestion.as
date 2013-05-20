package SQ {
import com.david.ui.MButton;
import com.david.ui.MLabelButton;
import com.david.ui.core.MSprite;

import flash.display.Sprite;
import flash.events.MouseEvent;

import selib.ui.AlertUI;
import selib.ui.RecordUI;

public class SelectQuestion extends MSprite {
    private var bord:Bord;
    private var datas:Array = [];
    private var dataIndex:int = 0;
    private var submitBtn:MButton;

    public function SelectQuestion() {
        super();
        bord = new Bord();
        this.addChild(bord);

        var q:Question = new Question("家中发生煤气泄漏后，怎么做是正确的呢？", 1, "SQ/asset/a0.mp3");
        q.addAnswer("打电话报警", false, "SQ/asset/a1.mp3");
        q.addAnswer("打开风扇换气", false, "SQ/asset/a2.mp3");
        q.addAnswer("打开窗户，大声呼救", true, "SQ/asset/a3.mp3");
        q.addAnswer("用湿毛巾捂住口鼻蹲下弯腰逃出", true, "SQ/asset/a4.mp3");
        q.addAnswer("稳定情绪，保持清醒", true, "SQ/asset/a5.mp3");
        datas.push(q);

        q = new Question("食品标签中必须包含哪些项目？",1,"SQ/asset/b0.mp3");
        q.addAnswer("产品名称", true,"SQ/asset/b1.mp3");
        q.addAnswer("配料表", true,"SQ/asset/b2.mp3");
        q.addAnswer("生产日期", true,"SQ/asset/b3.mp3");
        q.addAnswer("保质期", true,"SQ/asset/b4.mp3");
        q.addAnswer("厂名厂址", true,"SQ/asset/b5.mp3");
        q.addAnswer("净含量", true,"SQ/asset/b6.mp3");
        datas.push(q);

        q = new Question("哪类食品不宜长期食用？",1,"SQ/asset/c0.mp3");
        q.addAnswer("薯片", true,"SQ/asset/c1.mp3");
        q.addAnswer("腌制食品", true,"SQ/asset/c2.mp3");
        q.addAnswer("烧烤食品", true,"SQ/asset/c3.mp3");
        q.addAnswer("青菜", false,"SQ/asset/c4.mp3");
        q.addAnswer("水果", false,"SQ/asset/c5.mp3");
        datas.push(q);

        q = new Question("哪些食物不宜同时食用？",1,"SQ/asset/d0.mp3");
        q.addAnswer("牛奶、巧克力", true,"SQ/asset/d1.mp3");
        q.addAnswer("花生、黄瓜", true,"SQ/asset/d2.mp3");
        q.addAnswer("鸡蛋、地瓜", true,"SQ/asset/d3.mp3");
        q.addAnswer("海鲜、水果", true,"SQ/asset/d4.mp3");
        q.addAnswer("土豆、牛肉", false,"SQ/asset/d5.mp3");
        datas.push(q);

        q = new Question("购买食品时，看看必须有哪个标识呢？", 2,"SQ/asset/e0.mp3");
        q.addAnswer("SQ/asset/get1.jpg", true);
        q.addAnswer("SQ/asset/get2.jpg", true);
        q.addAnswer("SQ/asset/get3.jpg", true);
        q.addAnswer("SQ/asset/get4.jpg", true);
        datas.push(q);

        q = new Question("乘坐电梯时，因设备故障导致被困，采取哪些做法是不对的呢？",1,"SQ/asset/f0.mp3");
        q.addAnswer("弯腰屈膝、减轻坠伤", false,"SQ/asset/f1.mp3");
        q.addAnswer("迅速报警、等待营救", false,"SQ/asset/f2.mp3");
        q.addAnswer("情绪稳定、不要惊慌", false,"SQ/asset/f3.mp3");
        q.addAnswer("撞砸电梯、引起他人注意", true,"SQ/asset/f4.mp3");
        datas.push(q);

        q = new Question("身上着了火怎么办？",1,"SQ/asset/g0.mp3");
        q.addAnswer("就地翻滚，压灭火焰", true,"SQ/asset/g1.mp3");
        q.addAnswer("就近取水将身上火浇灭或迅速跳入水中", true,"SQ/asset/g2.mp3");
        q.addAnswer("脱去衣物", true,"SQ/asset/g3.mp3");
        q.addAnswer("跑到人多的地方寻求帮助", false,"SQ/asset/g4.mp3");
        datas.push(q);

        q = new Question("房屋内发生火灾时，下面哪些做法是错误的？",1,"SQ/asset/h0.mp3");
        q.addAnswer("拨打报警电话", false,"SQ/asset/h1.mp3");
        q.addAnswer("不乘坐电梯逃生", false,"SQ/asset/h2.mp3");
        q.addAnswer("回到屋内取回贵重物品", true,"SQ/asset/h3.mp3");
        q.addAnswer("用湿毛巾捂住口鼻", false,"SQ/asset/h4.mp3");
        datas.push(q);

        q = new Question("校车遇到事故起火怎么办？",1,"SQ/asset/i0.mp3");
        q.addAnswer("迅速报警等待救援", false,"SQ/asset/i1.mp3");
        q.addAnswer("如果起火部位在中间，从两头车门有秩序下车", true,"SQ/asset/i2.mp3");
        q.addAnswer("如果火焰小但挡住了车门，用衣服蒙住头部，从车门冲下", true,"SQ/asset/i3.mp3");
        q.addAnswer("如果车门变形，开启不了，应砸开就近车窗翻身下车", true,"SQ/asset/i4.mp3");
        q.addAnswer("如果衣服已经起火，应迅速脱下用脚踩灭", true,"SQ/asset/i5.mp3");
        datas.push(q);

        q = new Question("在公共场所遇到有毒气体泄露怎么办？",1,"SQ/asset/j0.mp3");
        q.addAnswer("不要惊慌、保持镇静", true,"SQ/asset/j1.mp3");
        q.addAnswer("迅速报警、远离毒源", true,"SQ/asset/j2.mp3");
        q.addAnswer("掩住口鼻、遮住皮肤", true,"SQ/asset/j3.mp3");
        q.addAnswer("辨别风向、逆风撤离", true,"SQ/asset/j4.mp3");
        q.addAnswer("大声呼救、找人帮忙", false,"SQ/asset/j5.mp3");
        datas.push(q);

        submitBtn = new MLabelButton("提交", new Asset.submit(), 18);
        this.addChildXY(submitBtn, 500, 600);
        submitBtn.addEventListener(MouseEvent.CLICK, onSubmit);
        playIndex();
    }

    private function playIndex():void {
        if (dataIndex == datas.length) {
//            AlertUI.getInstance("SQ");
//            RecordUI.getInstance("SQ");
        } else {
            bord.SetData(datas[dataIndex]);
            dataIndex++;
        }
    }

    private function onSubmit(e:MouseEvent):void {
        var ok:Boolean = bord.getCurrentQuestionOK();
        trace(ok);
        playIndex();
    }
}
}