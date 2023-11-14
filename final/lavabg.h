
//{{BLOCK(lavabg)

//======================================================================
//
//	lavabg, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 23 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 736 + 4096 = 5344
//
//	Time-stamp: 2023-05-03, 04:17:41
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LAVABG_H
#define GRIT_LAVABG_H

#define lavabgTilesLen 736
extern const unsigned short lavabgTiles[368];

#define lavabgMapLen 4096
extern const unsigned short lavabgMap[2048];

#define lavabgPalLen 512
extern const unsigned short lavabgPal[256];

#endif // GRIT_LAVABG_H

//}}BLOCK(lavabg)
