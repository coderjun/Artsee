/**
 * Created by jheider on 5/11/14.
 */
package org.heiders.apps.artsee.view.skins
{
    import spark.skins.mobile.TextInputSkin;

    public class FlatFormFieldSkin extends TextInputSkin
    {
        public function FlatFormFieldSkin()
        {
            super();
            layoutCornerEllipseSize = 0;
        }

        override protected function drawBackground( unscaledWidth:Number, unscaledHeight:Number ):void
        {
            graphics.beginFill( getStyle( "backgroundColor" ) );
            graphics.drawRect( this.x, this.y, unscaledWidth, unscaledHeight );
            graphics.endFill();
        }
    }
}
