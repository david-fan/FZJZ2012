package EQ {
	import selib.ui.AlertUI;

	import flash.utils.setTimeout;

	import selib.Record;
	import selib.RecordUtil;
	import selib.SoundUtil;
	import selib.ui.RecordUI;

	import util.FinishAlert;

	import com.david.ui.MButton;
	import com.david.ui.MImage;
	import com.david.ui.core.MSprite;
	import com.david.ui.event.MUIEvent;
	import com.david.util.UtilManager;

	import flash.display.DisplayObject;
	import flash.events.MouseEvent;

	/**
	 * @author david
	 */
	public class Earthquake extends MSprite {
		private var _persons : Array;
		private var _menu : Menu;
		//
		private var _shovel : AniMC = new AniMC("EQ/asset/shovel.swf");
		private var _animationing : Boolean;
		//
		private var _recordUI : RecordUI = RecordUI.getInstance("earthquake_record");
		private var _records : XML;

		//
		public function Earthquake() {
			//
			var bg : MImage = new MImage("EQ/asset/SceneBG.swf");
			addChild(bg);
			//
			_persons = new Array();
			var person1 : Person = new Person("EQ/asset/person1.swf", 0, Person.far);
			person1.addStone();
			_persons.push(person1);
			addChildXY(person1, 35, 555);
			var person2 : Person = new Person("EQ/asset/person2.swf", 90, Person.close);
			person2.addStone();
			_persons.push(person2);
			addChildXY(person2, 440, 450);
			var person3 : Person = new Person("EQ/asset/person3.swf", 0, Person.hurt);
			person3.addStone();
			_persons.push(person3);
			addChildXY(person3, 376, 440);
			var doctor : Person = new Person("EQ/asset/doctor_lie.swf", 90, Person.doctor);
			doctor.addStone();
			_persons.push(doctor);
			addChildXY(doctor, 220, 420);
			//
			_menu = new Menu();
			addChildXY(_menu, 0, 638);

			_menu.record.addEventListener(MouseEvent.CLICK, function(e : MouseEvent) : void {
				UtilManager.popUpUtil.addPopUp(_recordUI, true);
			});
			//
			addEventListener("StoneClick", onStoneClick);
			addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			//
			SoundUtil.PlaySound("EQ/asset/jsjy.mp3", int.MAX_VALUE);
			var m : MButton = new MButton(new MImage("EQ/asset/jsjy.jpg"));
			m.addEventListener(MouseEvent.CLICK, function(e : MouseEvent) : void {
				_menu.time.start();
				removeChild(m);
			});
			addChild(m);
			//
			_records = RecordUtil.readRecord("jsjy.xml");
			_recordUI.setSource(_records);
			//
			ToolClick(_shovel);
		}

		public function endGame() : void {
			_menu.time.stop();
			var record : Record = RecordUtil.ReturnTop5Record(_records, _menu.time.time);
			if (record.top5) {
				RecordUtil.saveRecord("jsjy.xml", record.records);
			}
			FinishAlert.show(record.top5, this);
		}

		private function onMouseMove(e : MouseEvent) : void {
			if (_shovel && !_animationing) {
				_shovel.x = this.mouseX;
				_shovel.y = this.mouseY;
			}
		}

		private function checkperson(type : int) : Person {
			for each (var person : Person in _persons) {
				if (person.type == type) {
					return person;
				}
			}
			return null;
		}

		private function removePerson(person : Person) : void {
			_shovel.stopAnimation();
			animationing = false;

			var index : int = _persons.indexOf(person);
			if (index >= 0) {
				_persons.splice(index, 1);
				_menu.perons.text = _persons.length.toString();
			}
			if (contains(person))
				removeChild(person);
			if (_persons.length == 0)
				endGame();
		}

		private function alert(txt : String) : void {
			var alert : AlertUI = AlertUI.getInstance("eq");
			alert.rule.text = txt;
			UtilManager.popUpUtil.addPopUp(alert);
		}

		private function onStoneClick(e : MUIEvent) : void {
			e.stopPropagation();
			if (_animationing)
				return;

			var save : Function = function() : void {
				var time : int = 5;
				animationing = true;
				_shovel.playAnimation();
				setTimeout(removePerson, time * 1000, person);
			};
			var person : Person = e.data.person;
			var hurt : Person = checkperson(Person.hurt);
			if (hurt != null) {
				if (hurt === person)
					save();
				else
					alert("应该优先解救受伤的人");
			} else {
				var doctor : Person = checkperson(Person.doctor);
				if (doctor != null) {
					if (doctor === person)
						save();
					else
						alert("应该先解救医生，增加救治伤员的力量");
				} else {
					var close : Person = checkperson(Person.close);
					if (close != null) {
						if (close === person)
							save();
						else
							alert("先解救近处的被压埋人员吧，可以节省时间啊");
					} else
						save();
				}
			}
		}

		private function set animationing(value : Boolean) : void {
			_animationing = value;
		}

		private function ToolClick(obj : DisplayObject) : void {
			addChild(obj);
			obj.x = this.mouseX;
			obj.y = this.mouseY;
		}
	}
}
