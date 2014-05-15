/**
 * Created by jheider on 5/10/14.
 */
package org.heiders.apps.artsee.control.events
{
    import flash.events.Event;

    public class AppViewEvent extends Event
    {

        public static const GO_TO_VIEW:String = "goToView";

        public var view:String;

        public function AppViewEvent( type:String, view:String, bubbles:Boolean=true )
        {
            this.view = view;

            super( type, bubbles );
        }

        override public function clone():Event
        {
            return new AppViewEvent( type, view, bubbles );
        }

    }
}
