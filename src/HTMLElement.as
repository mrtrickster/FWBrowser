/**
 * Created with IntelliJ IDEA.
 * User: MrTrickster
 * Date: 24.11.15
 * Time: 18:50
 * To change this template use File | Settings | File Templates.
 */
package {
import flash.display.Sprite;
import flash.external.ExternalInterface;
import flash.text.TextField;

public class HTMLElement extends Sprite {

    public var data:XML;
    public var parentElement:Sprite;

    public function HTMLElement(html:XML, parent:Sprite) {
        ExternalInterface.call("console.log", "HTMLElement()");
        if (html) {
            data = html;
        }
        if (parent) {
            parentElement = parent;
        }
        if (data.name()) {
            ExternalInterface.call("console.log", data.name().localName);
            switch (data.name().localName) {
                case "body":
                    ExternalInterface.call("console.log", "creating body");
                    graphics.clear();
                    graphics.lineStyle(1, 0x000000, .1);
                    graphics.beginFill(0xffffff);
                    graphics.drawRect(0, 0, parentElement.width, parentElement.height);
                    graphics.endFill();
                    break;
                case "div":
                    ExternalInterface.call("console.log", "creating div");
                    graphics.clear();
                    graphics.lineStyle(1, 0x000000, .1);
                    graphics.beginFill(0xffffff);
                    graphics.drawRect(0, 0, parentElement.width, 0);
                    graphics.endFill();
                    break;
            }
            if (data.children().length() > 0) {
                for (var i:int = 0; i < data.children().length(); i ++) {
                    var element:HTMLElement = new HTMLElement(data.children()[i], this);
                    addChild(element);
                }
            }
        } else {
            ExternalInterface.call("console.log", data);
            var textField:TextField = new TextField();
            textField.text = data;
            addChild(textField);
        }
        update();
    }

    private function update():void {
        if (data.name()) {
            switch (data.name().localName) {
                case "body":
                    ExternalInterface.call("console.log", "updating body");
                    graphics.clear();
                    graphics.lineStyle(1, 0x000000, .1);
                    graphics.beginFill(0xffffff);
                    graphics.drawRect(0, 0, parentElement.width, parentElement.height);
                    graphics.endFill();
                    break;
                case "div":
                    ExternalInterface.call("console.log", "updating div");
                    graphics.clear();
                    graphics.lineStyle(1, 0x000000, .1);
                    graphics.beginFill(0xffffff);
                    graphics.drawRect(0, 0, parentElement.width, this.height);
                    graphics.endFill();
                    break;
            }
            if (data.children().length() > 0) {
                for (var i:int = 0; i < data.children().length(); i ++) {
                    //var element:HTMLElement = new HTMLElement(data.children()[i], this);
                    //addChild(element);
                }
            }
        } else {
            //ExternalInterface.call("console.log", data);
            //var textField:TextField = new TextField();
            //textField.text = data;
            //addChild(textField);
        }
    }
}
}
