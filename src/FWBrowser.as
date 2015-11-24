package {

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.external.ExternalInterface;
import flash.text.TextField;

[SWF(frameRate="60", backgroundColor="#000000")]

public class FWBrowser extends Sprite {

    private var _container:Sprite;

    public function FWBrowser() {
        stage.scaleMode = StageScaleMode.NO_SCALE;
        stage.align = StageAlign.TOP_LEFT;
        //
        createContainer();
    }

    private function createContainer():void {
        ExternalInterface.call("console.log", "FWBrowser.createContainer()");
        //create container
        _container = new Sprite();
        addChild(_container);
        //update container
        _container.graphics.clear();
        _container.graphics.beginFill(0xffffff);
        _container.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
        _container.graphics.endFill();
        createElements();
    }

    private function createElements():void {
        ExternalInterface.call("console.log", "FWBrowser.createElements()");
        //create body
        var html:XML = new XML(<body><div>12345</div></body>);
        var body:HTMLElement = new HTMLElement(html, _container);
        _container.addChild(body);
    }
}
}
