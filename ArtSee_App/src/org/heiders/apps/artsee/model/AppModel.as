/**
 * Created by jheider on 5/14/14.
 */
package org.heiders.apps.artsee.model {

    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.filesystem.File;
    import flash.filesystem.FileMode;
    import flash.filesystem.FileStream;

    import mx.collections.ArrayCollection;

    import org.heiders.apps.artsee.model.vo.ArtSupply;
    import org.heiders.apps.artsee.model.vo.DataStore;
    import org.heiders.apps.artsee.model.vo.User;

    public class AppModel extends EventDispatcher {
        public static const SELECTEDITEM_CHANGED_EVENT:String = "selectedItemChanged";
        public static const ITEMS_CHANGED_EVENT:String = "itemsChanged";
        public static const USER_CHANGED_EVENT:String = "userChanged";

        public const dataStore:File = File.applicationStorageDirectory.resolvePath( "dataStore" );


        // Single Instance of Our ModelLocator
        private static var _instance:AppModel;

        public var editingItem:Boolean;

        // Storage Vars
        private var _selectedItem:ArtSupply;
        private var _items:ArrayCollection;
        private var _user:User;

        public function AppModel(enforcer:SingletonEnforcer) {
            if (enforcer == null) {
                throw new Error("You Can Only Have One AppData Instance");
            }
            else
            {
                _items = new ArrayCollection();
            }
        }

        // This is how external classes access this one.
        public static function getInstance():AppModel {
            if (!_instance) {
                _instance = new AppModel(new SingletonEnforcer());
            }

            return _instance;
        }


        public function saveData():void
        {
            var contentsToSave:DataStore = new DataStore();
                contentsToSave.items = items.source;
                contentsToSave.user = user;

            var stream:FileStream = new FileStream();
                stream.open( dataStore, FileMode.WRITE );
                stream.writeObject( contentsToSave );
                stream.close();
        }

        [Bindable(event="selectedItemChanged")]
        public function get selectedItem():ArtSupply {
            return _selectedItem;
        }

        public function set selectedItem(value:ArtSupply):void {
            if (_selectedItem == value) return;
            _selectedItem = value;
            dispatchEvent(new Event(SELECTEDITEM_CHANGED_EVENT));
        }

        [Bindable(event="itemsChanged")]
        public function get items():ArrayCollection {
            return _items;
        }

        public function set items(value:ArrayCollection):void {
            if (_items == value) return;
            _items = value;
            saveData();
            dispatchEvent(new Event(ITEMS_CHANGED_EVENT));
        }


        [Bindable(event="userChanged")]
        public function get user():User {
            return _user;
        }

        public function set user(value:User):void {
            if (_user == value) return;
            _user = value;
            saveData();
            dispatchEvent(new Event(USER_CHANGED_EVENT));
        }
    }
}
// Used to Deny Other Classes from Instantiating the AppData Class
class SingletonEnforcer {}