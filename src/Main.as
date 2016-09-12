package
{
	import flash.automation.MouseAutomationAction;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author Nicholas Hallman
	 */
	public class Main extends Sprite 
	{
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			var hg:MovieClip = new MovieClip()
			var X:int = 0
			var Y:int = 0
			var skip:Boolean = false
			
			var timer:Timer  = new Timer(16)
			
			stage.addChild(hg)
			
			hg.rotation = 180
			hg.scaleX = -1
			
			hg.y = stage.stageHeight
			
			timer.addEventListener(TimerEvent.TIMER, update)
			
			timer.start()
			
			
		function update(event:TimerEvent):void {
			
				
				hg.graphics.clear()
				
				hg.graphics.moveTo(stage.stageWidth / 2, stage.stageHeight / 4)
			
				var day:Date = new Date()
				var hour: Number = day.hours
				var minute: Number = day.minutes
				var second: Number = day.seconds
				var millisecond:Number = day.milliseconds
				var size:int = 930
				var time:Number = 0
				var modulo:Number = 0
				
				const MIDDLEX: int = stage.stageWidth / 2
				const MIDDLEY: int = stage.stageHeight / 2
				
				if (hour > 12) {
					hour = hour - 12
				}
				
				var paraX:int = (mouseX * -1) + MIDDLEX
				var paraY:int =  (mouseY * -1) + MIDDLEY
			
				var i:Number = 0;
			
				hour = hour * (Math.PI * 2) / 12 
				minute = minute * (Math.PI * 2) / 60
				second = second * (Math.PI * 2) / 60
				millisecond = millisecond * (Math.PI * 2) / 1000
			
				for (var j = 1 ; j < 5; j ++) {
					
					if ( j == 1) {
						time = hour
						modulo = 30
						hg.graphics.lineStyle(30, 0xddffff, 1)
					}
					else if (j == 2) {
						time = minute
						modulo = 30
						hg.graphics.lineStyle(15, 0x00ffff, 1)
					}
					else if ( j == 3) {
						time = second
						modulo = 30
						hg.graphics.lineStyle(7, 0x009999, 1)
					}
					else if ( j == 4) {
						time = millisecond
						modulo = 30
						hg.graphics.lineStyle(4, 0x005555, 1)
					}
					
					var b: int = 0;
					var k: int = 0;
					
					for (i = 0; i < time; i += 0.008) {
						X = Math.sin(i) * (size - (150 * j))
						Y = Math.cos(i) * (size - (150 * j))
						if ( i == 0 || b % modulo == 0 || skip == true) {
							hg.graphics.moveTo((X + MIDDLEX) + (paraX/ (10 * j)), (Y + MIDDLEY) - (paraY/ (10 * j)) )
							if (k < 5) {
								skip = true
								k ++
							}
							else {
								k = 0
								skip = false
							}
							
						}
						else{
							hg.graphics.lineTo((X + MIDDLEX) + (paraX/ (10 * j)), (Y + MIDDLEY) - (paraY/ (10 * j)) )
						}
						b = b + 1
					}
			
				}
				
			}
			
		}
		
	}
	
}