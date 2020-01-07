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
    //  Class constants
    //
    //--------------------------------------------------------------------------

    dyfmwk static const EXTENSION_ID: String = "com.github.rozd.bugs.dyfmwk";

    //--------------------------------------------------------------------------
    //
    //  Class properties
    //
    //--------------------------------------------------------------------------

    //-------------------------------------
    //  context
    //-------------------------------------

    private static var _context: ExtensionContext;
    dyfmwk static function get context(): ExtensionContext {
        if (_context == null) {
            _context = ExtensionContext.createExtensionContext(EXTENSION_ID, null);
        }
        return _context;
    }

    //--------------------------------------------------------------------------
    //
    //  Class methods
    //
    //--------------------------------------------------------------------------

    //-------------------------------------
    //  isSupported
    //-------------------------------------

    public static function get isSupported(): Boolean {
        return context != null && context.call("isSupported");
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

    private static var _extensionVersion: String = null;

    /**
     * Returns version of extension
     * @return extension version
     */
    public static function extensionVersion(): String {
        if (_extensionVersion == null) {
            try {
                var extension_xml: File = ExtensionContext.getExtensionDirectory(EXTENSION_ID).resolvePath("META-INF/ANE/extension.xml");
                if (extension_xml.exists) {
                    var stream: FileStream = new FileStream();
                    stream.open(extension_xml, FileMode.READ);

                    var extension: XML = new XML(stream.readUTFBytes(stream.bytesAvailable));
                    stream.close();

                    var ns: Namespace = extension.namespace();

                    _extensionVersion = extension.ns::versionNumber;
                }
            } catch (error: Error) {
                // ignore
            }
        }

        return _extensionVersion;
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
