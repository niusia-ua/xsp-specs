#pragma magic [10 05 ?? ?? ?? ??] @ 0x00
#pragma endian little

import std.io;

import xsd.pattern_properties;
import xsd.palette;
import xsd.formats;
import xsd.symbols;
import xsd.pattern_settings;
import xsd.grid;
import xsd.fabric;
import xsd.pattern_info;
import xsd.page_setup;
import xsd.stitch_settings;
import xsd.library;
import xsd.machine_export;

struct Pattern {
    xsd::PatternProperties properties;
    xsd::Palette palette;
    xsd::Formats<palette.size> formats;
    xsd::Symbols symbols[palette.size];
    xsd::PatternSettings settings;
    xsd::GridOptions grid;
    xsd::Fabric fabric;
    padding[65];
    xsd::PatternInfo info;
    xsd::PageSetup page_setup;
    padding[188];
    xsd::StitchSettings stitch_settings;
    xsd::SymbolSettings symbol_settings;
    xsd::Library library;
    xsd::MachineExport machine_export;
    padding[154];

    // TODO: implement parsing the stitches data and the design layout.
};

u16 v[4] @ 0x06 [[hidden]];
std::print("Pattern Maker version: {}.{}.{}.{}", v[1], v[0], v[3], v[2]);

Pattern pattern @ 0x02E5;
