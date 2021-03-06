Copyright (C) 1997-1999 Matt Newman <matt@novadigm.com>

$Header: /cvs/tcl/tls/README.txt,v 1.3 1999/09/26 22:24:10 matt Exp $

TLS (aka SSL) Channel - can be layered on any bi-directional
Tcl_Channel (Note: Requires Trf Core Patch)

Both client and server-side sockets are possible, and this code
should work on any platform as it uses a generic mechanism for
layering on SSL and Tcl.

Full filevent sematics should also be intact - see tests directory for
blocking and non-blocking examples.

This was built (almost) from scratch based upon observation of OpenSSL 0.9.2B

Addition credit is due for Andreas Kupries (a.kupries@westend.com), for
providing the Tcl_ReplaceChannel mechanism and working closely with me
to enhance it to support full fileevent semantics.

Also work done by the follow people provided the impetus to do this "right":-
tclSSL (Colin McCormack, Shared Technology)
SSLtcl (Peter Antman)

This code is licensed until the same terms as the Tcl Core.

I would also like to acknowledge the input of Marshall Rose, who convinced 
me that people need to be able to switch-to-encrypted mode part way
through a conversation.

Also I would like to acknowledge the kind support of Novadigm Inc, my
current employer, which made this possible.


Matt Newman
