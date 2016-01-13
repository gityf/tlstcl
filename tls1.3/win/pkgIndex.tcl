# Tcl package index file, version 1.0
#
proc tls_ifneeded {pkg version dir} {
    global tcl_platform
    if {[info exists tcl_platform(debug)]} {
	set dbgx d
    } else {
	set dbgx ""
    }
    rename tls_ifneeded {}
    regsub {\.} $version {} vshort
    package ifneeded $pkg $version [format {
	load %s
	source %s
    } [list [file join $dir $pkg$vshort$dbgx.dll]] [list $dir/$pkg.tcl]]
}
tls_ifneeded tls 1.3 $dir

