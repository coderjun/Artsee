/**
 * Created by jheider on 5/14/14.
 */
package org.heiders.apps.artsee.model.vo {

    [Bindable]
    [RemoteClass(alias="org.heiders.apps.artsee.model.vo.User")]
    public class User {

        public var email:String;
        public var firstName:String;
        public var lastName:String;
        public var password:String;
        public var keepLoggedIn:Boolean;
        public var isLoggedIn:Boolean;

        public function User() {
        }
    }
}
