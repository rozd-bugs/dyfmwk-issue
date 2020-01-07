/**
 * Created by max.rozdobudko@gmail.com on 05.01.2020.
 */
package com.github.rozd.bugs.dyfmwk {
import com.github.rozd.bugs.dyfmwk.core.dyfmwk;

import flash.external.ExtensionContext;
import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;

use namespace dyfmwk;

public class DYFMWK {

    //--------------------------------------------------------------------------
    //
    //  Class methods
    //
    //--------------------------------------------------------------------------

    //-------------------------------------
    //  isSupported
    //-------------------------------------

    public static function get isSupported(): Boolean {
        return false;
    }

    //-------------------------------------
    //  sharedInstance
    //-------------------------------------

    private static var instance: DYFMWK;

    public static function get shared(): DYFMWK {
        if (instance == null) {
            new DYFMWK();
        }
        return instance;
    }

    //-------------------------------------
    //  extensionVersion
    //-------------------------------------

    /**
     * Returns version of extension
     * @return extension version
     */
    public static function extensionVersion(): String {
        return null;
    }

    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    public function DYFMWK() {
        super();
        instance = this;
    }

}
}
