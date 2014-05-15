/**
 * Created by jheider on 5/11/14.
 */
package org.heiders.apps.artsee.model.vo
{
    [Bindable]
    [RemoteClass(alias="org.heiders.apps.artsee.model.vo.ArtSupply")]
    public class ArtSupply
    {
        public var name:String;
        public var photo:String;
        public var storeName:String;
        public var location:String;
        public var notes:String;


        public function ArtSupply()
        {
        }
    }
}
