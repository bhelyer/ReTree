/*!
 * A simple utility to move everything given to it to the Recycle Bin.
 * Released under the MIT License -- see README.md for more details.
 */
module main;

enum VersionString = "1.0.0";
enum CopyString    = "ReTree ${VersionString} Copyright 2018 Bernard Helyer";

import win32 = core.c.windows;
import io    = watt.io;
import conv  = watt.conv;
import path  = watt.path;
import sink  = watt.text.sink;

enum : u32 FO_DELETE          = 3;
enum : u32 FOF_ALLOWUNDO      = 0x0040U;
enum : u32 FOF_SILENT         = 0x0004U;
enum : u32 FOF_NOCONFIRMATION = 0x0010U;
enum : u32 FOF_NOCONFIRMMKDIR = 0x0200U;
enum : u32 FOF_NOERRORUI      = 0x0400U;
enum : u32 FOF_NOUI = FOF_SILENT | FOF_NOCONFIRMATION | FOF_NOCONFIRMMKDIR | FOF_NOERRORUI;

struct SHFILEOPSTRUCTA {
	hwnd:                  win32.HWND;
	wFunc:                 win32.UINT;
	pFrom:                 const(char)*;
	pTo:                   const(char)*;
	fFlags:                u32;
	fAnyOperationsAborted: win32.BOOL;
	hNameMappings:         win32.LPVOID;
	lpszProgressTitle:     void*;
}

extern (Windows) fn SHFileOperationA(SHFILEOPSTRUCTA*) i32;

//! Returns true on success.
fn moveToRecycleBin(paths: string[]) bool {
	sfosa: SHFILEOPSTRUCTA;
	sfosa.wFunc  = FO_DELETE;
	sfosa.fFlags = FOF_ALLOWUNDO | FOF_NOUI;
	sfosa.pFrom  = createPczztstr(paths);
	return SHFileOperationA(&sfosa) == 0;
}

/*!
 * Take a list of paths and return a double null terminated list of strings.
 * Corresponds to the win32 type PCZZTSTR
 * Suggested pronounciation: piz-zit-stir. Pronounce the zit like a toy laser gun firing.
 */
fn createPczztstr(paths: string[]) const(char)* {
	ss: sink.StringSink;
	foreach (p; paths) {
		ss.sink(path.fullPath(p));
		ss.sink("\0");
	}
	ss.sink("\0");
	str := ss.toString();
	return str.ptr;
}

fn main(args: string[]) i32 {
	if (args.length == 1) {
		io.error.writeln(CopyString);
		io.error.writeln(new "usage: ${args[0]} [files and folders to delete]");
		return 1;
	}
	return moveToRecycleBin(args[1 .. $]) ? 0 : 2;
}
