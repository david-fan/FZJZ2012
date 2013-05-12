package selib {
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;

	public class RecordUtil {
		public function RecordUtil() {
		}

		private static function getRecordFile(fileName : String) : File {
			var f : File = File.applicationStorageDirectory.resolvePath(fileName);
			return f;
		}

		public static function saveRecord(fileName : String, record : XML) : void {
			var f : File = getRecordFile(fileName);
			var fs : FileStream = new FileStream();
			fs.open(f, FileMode.WRITE);
			fs.writeMultiByte(record.toXMLString(), "gb2312");
			fs.close();
		}

		public static function readRecord(fileName : String) : XML {
			var f : File = getRecordFile(fileName);
			if (f.exists) {
				var fs : FileStream = new FileStream();
				fs.open(f, FileMode.READ);

				var fileBytes : ByteArray = new ByteArray();
				fs.readBytes(fileBytes);
				fs.close();

				var str : String = fileBytes.readMultiByte(fileBytes.length, "gb2312");
				var _records : XML = new XML(str);
				return _records;
			}
			else{
				return <Records/>;
			}
		}

		public static function ReturnTop5Record(records : XML, spendtime : int) : Record {
			var obj : Record = new Record();
			obj.top5 = false;

			if (records == null) {
				records = <Records></Records>;
				records.appendChild(new XML("<record value=\"" + spendtime + "\"/>"));
				obj.top5 = true;
				obj.records = records;
				return obj;
			}
			var rs : Array = new Array();
			for each (var item:XML in records.record)
				rs.push(int(item.value));
			rs.push(spendtime);
			rs.sort(Array.NUMERIC);
			for (var i : int = 0; i < rs.length; i++) {
				if (i < 5 && rs[i] >= spendtime) {
					obj.top5 = true;
					break;
				}
			}
			var rs2 : Array;
			if (rs.length > 5)
				rs2 = rs.splice(0, 5);
			else
				rs2 = rs;
			for each (var r:int in rs2)
				records.appendChild(new XML("<record value=\"" + r + "\"/>"));
			obj.records = records;
			return obj;
		}
	}
}