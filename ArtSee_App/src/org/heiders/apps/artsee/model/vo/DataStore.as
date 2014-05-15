/**
 * Created by jheider on 5/14/14.
 */
package org.heiders.apps.artsee.model.vo {

    [Bindable]
    [RemoteClass(alias="org.heiders.apps.artsee.model.vo.DataStore")]
    public class DataStore {

        public var items:Array;
        public var user:User;

        public function DataStore() {
        }
    }
}
