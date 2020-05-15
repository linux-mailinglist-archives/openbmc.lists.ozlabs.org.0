Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E59DE1D4903
	for <lists+openbmc@lfdr.de>; Fri, 15 May 2020 11:04:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NjCC0P3fzDqfk
	for <lists+openbmc@lfdr.de>; Fri, 15 May 2020 19:04:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NjBK69N7zDqMr
 for <openbmc@lists.ozlabs.org>; Fri, 15 May 2020 19:03:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=iFh/m5z/; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49NjBK3LFcz9sTM
 for <openbmc@lists.ozlabs.org>; Fri, 15 May 2020 19:03:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1589533417; bh=cCOKGrB0lly2afJVE/TZ4uo+HI7sp8Ab6pFtHtp2qwE=;
 h=Subject:From:To:Date:From;
 b=iFh/m5z/ru9gYHiKcGUmdedahT9sjwTDj7yfbI3L2VNipjFj+6YirHILTFErzXc6s
 d7k2Zv1AqXGuFh21nRL/RfwDIPHkvDAK/vst/47YnaXlNMg1VfV6eh4Qvy9kvNezCK
 4audzOCTu1BCfkP4c9dzEXHASZ2N2tNTNhFCwAo7U9dt040+bZKnwOD6um+69RioBQ
 2qzY0c3c5ixJi9SsyE+q3xB0SoSL+Nj94iv+E5H2HJX/I4L4xWX4TAzI9mpZ/XVM9H
 gCXvIyNhznctfvLZNLERYqofdNXLo7pmUQ0I2/0z3yBXE7g9PiNbCeIRXihiMo76wv
 v3BLD/FJRcqMw==
Message-ID: <d7da4861c449609d2cf1b1b1434c653e9a27a805.camel@ozlabs.org>
Subject: Reducing fragmentation in OpenBMC
From: Jeremy Kerr <jk@ozlabs.org>
To: openbmc@lists.ozlabs.org
Date: Fri, 15 May 2020 17:03:33 +0800
Content-Type: multipart/alternative; boundary="=-qWeAvYSMsMGZJvQBDbZk"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--=-qWeAvYSMsMGZJvQBDbZk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi OpenBMCers,

I've been working on some different areas of OpenBMC recently, and have
noticed that there seems to be increasing fragmentation between various
platform and infrastructure code.

One of the main impacts I've seen as a consequence is that it's
becoming incredibly difficult for new adopters and contributors to do a
platform port.

I definitely understand that contributing companies have their own
product timelines and priorities, which doesn't always correlate with
OpenBMC development directions. We need to allow that for the project
as a whole to be viable. But I still think there's scope to both
improve the coherence of the OpenBMC work, while also allowing variance
where justified, in a way that makes sense.

To pick a couple of examples and consequences:

 - there are a lot of out-of-tree patches around. While this isn't
necessarily a problem in its own right, some of these are fundamental
to make the upstream platforms work. For anyone adopting those
platforms as a reference, it means that they have a non-functional
platform, or have to use the non-upstream repos.

 - there's increasing amounts of code that require or implement non-
standard behaviour; For example, dbus-sensors exposes and consumes dbus
interfaces that are not described by phosphor-dbus-interfaces. This
means that the divergence is then needed in other projects too. If
those standards don't suit actual requirements, then we should look at
updating them.

Just to be 100% clear though, I am definitely not singling-out the
meta-intel platform support; it's just what I've been experimenting
with recently. Intel have done great upstream work on OpenBMC, and
these issues are only apparent because of the work already done. It
just feels like we're 90% there, and the rest would make the world of
difference for new users.

So, a few things that I think may help the situation:

 - Adherence to standards. Being a little more strict about what
comprises an OpenBMC implementation will go a long way to prevent
future incompatibilities, and means that all of our interface
implementations automatically document their expected behaviour
(because that's in the standard).

 - Identification of a set of reference platforms. If we can point
adopters to a platform that provides a recommended (and somewhat
"supported") way of doing things, that would prevent a lot of confusion
around different implementations, and how to best work with the options
available

 - Documentation of interactions between components. There's some great
documentation on how our components work, but not a whole lot on how
they fit together. Without this, it means a lot of jumping around
between repos, trying to find the "other side" of each interface.

 - Keep pushing on upstream. Sometimes this can delay things, but I
really think that's almost always false economy; the out-of-tree
patches will have to be addressed at some point, and that job just gets
more involved as time passes. Even engaging other community members to
help out would be great.

Finally, I don't mean this to sound like a bunch of complaints - I'm
keen to put in a bunch of time to address things. I'd just like to
start some discussion on how best to do that, before I do so.

So - any thoughts on how we can improve this? Comments / disagreements
/ questions always welcome.

Cheers,


Jeremy

--=-qWeAvYSMsMGZJvQBDbZk
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><span style=3D"font-family: monospace;">Hi OpenBMCers,</span><br style=
=3D"font-family: monospace;"><br style=3D"font-family: monospace;"><span st=
yle=3D"font-family: monospace;">I've been working on some different areas o=
f OpenBMC recently, and have</span><br style=3D"font-family: monospace;"><s=
pan style=3D"font-family: monospace;">noticed that there seems to be increa=
sing fragmentation between various</span><br style=3D"font-family: monospac=
e;"><span style=3D"font-family: monospace;">platform and infrastructure cod=
e.</span><br style=3D"font-family: monospace;"><br style=3D"font-family: mo=
nospace;"><span style=3D"font-family: monospace;">One of the main impacts I=
've seen as a consequence is that it's</span><br style=3D"font-family: mono=
space;"><span style=3D"font-family: monospace;">becoming incredibly difficu=
lt for new adopters and contributors to do a</span><br style=3D"font-family=
: monospace;"><span style=3D"font-family: monospace;">platform port.</span>=
<br style=3D"font-family: monospace;"><br style=3D"font-family: monospace;"=
><span style=3D"font-family: monospace;">I definitely understand that contr=
ibuting companies have their own</span><br style=3D"font-family: monospace;=
"><span style=3D"font-family: monospace;">product timelines and priorities,=
 which doesn't always correlate with</span><br style=3D"font-family: monosp=
ace;"><span style=3D"font-family: monospace;">OpenBMC development direction=
s. We need to allow that for the project</span><br style=3D"font-family: mo=
nospace;"><span style=3D"font-family: monospace;">as a whole to be viable. =
But I still think there's scope to both</span><br style=3D"font-family: mon=
ospace;"><span style=3D"font-family: monospace;">improve the coherence of t=
he OpenBMC work, while also allowing variance</span><br style=3D"font-famil=
y: monospace;"><span style=3D"font-family: monospace;">where justified, in =
a way that makes sense.</span><br style=3D"font-family: monospace;"><br sty=
le=3D"font-family: monospace;"><span style=3D"font-family: monospace;">To p=
ick a couple of examples and consequences:</span><br style=3D"font-family: =
monospace;"><br style=3D"font-family: monospace;"><span style=3D"font-famil=
y: monospace;">&nbsp;- there are a lot of out-of-tree patches around. While=
 this isn't</span><br style=3D"font-family: monospace;"><span style=3D"font=
-family: monospace;">necessarily a problem in its own right, some of these =
are fundamental</span><br style=3D"font-family: monospace;"><span style=3D"=
font-family: monospace;">to make the upstream platforms work. For anyone ad=
opting those</span><br style=3D"font-family: monospace;"><span style=3D"fon=
t-family: monospace;">platforms as a reference, it means that they have a n=
on-functional</span><br style=3D"font-family: monospace;"><span style=3D"fo=
nt-family: monospace;">platform, or have to use the non-upstream repos.</sp=
an><br style=3D"font-family: monospace;"><br style=3D"font-family: monospac=
e;"><span style=3D"font-family: monospace;">&nbsp;- there's increasing amou=
nts of code that require or implement non-</span><br style=3D"font-family: =
monospace;"><span style=3D"font-family: monospace;">standard behaviour; For=
 example, dbus-sensors exposes and consumes dbus</span><br style=3D"font-fa=
mily: monospace;"><span style=3D"font-family: monospace;">interfaces that a=
re not described by phosphor-dbus-interfaces. This</span><br style=3D"font-=
family: monospace;"><span style=3D"font-family: monospace;">means that the =
divergence is then needed in other projects too. If</span><br style=3D"font=
-family: monospace;"><span style=3D"font-family: monospace;">those standard=
s don't suit actual requirements, then we should look at</span><br style=3D=
"font-family: monospace;"><span style=3D"font-family: monospace;">updating =
them.</span><br style=3D"font-family: monospace;"><br style=3D"font-family:=
 monospace;"><span style=3D"font-family: monospace;">Just to be 100% clear =
though, I am definitely not singling-out the</span><br style=3D"font-family=
: monospace;"><span style=3D"font-family: monospace;">meta-intel platform s=
upport; it's just what I've been experimenting</span><br style=3D"font-fami=
ly: monospace;"><span style=3D"font-family: monospace;">with recently. Inte=
l have done great upstream work on OpenBMC, and</span><br style=3D"font-fam=
ily: monospace;"><span style=3D"font-family: monospace;">these issues are o=
nly apparent because of the work already done. It</span><br style=3D"font-f=
amily: monospace;"><span style=3D"font-family: monospace;">just feels like =
we're 90% there, and the rest would make the world of</span><br style=3D"fo=
nt-family: monospace;"><span style=3D"font-family: monospace;">difference f=
or new users.</span><br style=3D"font-family: monospace;"><br style=3D"font=
-family: monospace;"><span style=3D"font-family: monospace;">So, a few thin=
gs that I think may help the situation:</span><br style=3D"font-family: mon=
ospace;"><br style=3D"font-family: monospace;"><span style=3D"font-family: =
monospace;">&nbsp;- Adherence to standards. Being a little more strict abou=
t what</span><br style=3D"font-family: monospace;"><span style=3D"font-fami=
ly: monospace;">comprises an OpenBMC implementation will go a long way to p=
revent</span><br style=3D"font-family: monospace;"><span style=3D"font-fami=
ly: monospace;">future incompatibilities, and means that all of our interfa=
ce</span><br style=3D"font-family: monospace;"><span style=3D"font-family: =
monospace;">implementations automatically document their expected behaviour=
</span><br style=3D"font-family: monospace;"><span style=3D"font-family: mo=
nospace;">(because that's in the standard).</span><br style=3D"font-family:=
 monospace;"><br style=3D"font-family: monospace;"><span style=3D"font-fami=
ly: monospace;">&nbsp;- Identification of a set of reference platforms. If =
we can point</span><br style=3D"font-family: monospace;"><span style=3D"fon=
t-family: monospace;">adopters to a platform that provides a recommended (a=
nd somewhat</span><br style=3D"font-family: monospace;"><span style=3D"font=
-family: monospace;">"supported") way of doing things, that would prevent a=
 lot of confusion</span><br style=3D"font-family: monospace;"><span style=
=3D"font-family: monospace;">around different implementations, and how to b=
est work with the options</span><br style=3D"font-family: monospace;"><span=
 style=3D"font-family: monospace;">available</span><br style=3D"font-family=
: monospace;"><br style=3D"font-family: monospace;"><span style=3D"font-fam=
ily: monospace;">&nbsp;- Documentation of interactions between components. =
There's some great</span><br style=3D"font-family: monospace;"><span style=
=3D"font-family: monospace;">documentation on how our components work, but =
not a whole lot on how</span><br style=3D"font-family: monospace;"><span st=
yle=3D"font-family: monospace;">they fit together. Without this, it means a=
 lot of jumping around</span><br style=3D"font-family: monospace;"><span st=
yle=3D"font-family: monospace;">between repos, trying to find the "other si=
de" of each interface.</span><br style=3D"font-family: monospace;"><br styl=
e=3D"font-family: monospace;"><span style=3D"font-family: monospace;">&nbsp=
;- Keep pushing on upstream. Sometimes this can delay things, but I</span><=
br style=3D"font-family: monospace;"><span style=3D"font-family: monospace;=
">really think that's almost always false economy; the out-of-tree</span><b=
r style=3D"font-family: monospace;"><span style=3D"font-family: monospace;"=
>patches will have to be addressed at some point, and that job just gets</s=
pan><br style=3D"font-family: monospace;"><span style=3D"font-family: monos=
pace;">more involved as time passes. Even engaging other community members =
to</span><br style=3D"font-family: monospace;"><span style=3D"font-family: =
monospace;">help out would be great.</span><br style=3D"font-family: monosp=
ace;"><br style=3D"font-family: monospace;"><span style=3D"font-family: mon=
ospace;">Finally, I don't mean this to sound like a bunch of complaints - I=
'm</span><br style=3D"font-family: monospace;"><span style=3D"font-family: =
monospace;">keen to put in a bunch of time to address things. I'd just like=
 to</span><br style=3D"font-family: monospace;"><span style=3D"font-family:=
 monospace;">start some discussion on how best to do that, before I do so.<=
/span><br style=3D"font-family: monospace;"><br style=3D"font-family: monos=
pace;"><span style=3D"font-family: monospace;">So - any thoughts on how we =
can improve this? Comments / disagreements</span><br style=3D"font-family: =
monospace;"><span style=3D"font-family: monospace;">/ questions always welc=
ome.</span><br style=3D"font-family: monospace;"><br style=3D"font-family: =
monospace;"><span style=3D"font-family: monospace;">Cheers,</span><br style=
=3D"font-family: monospace;"><br style=3D"font-family: monospace;"><br styl=
e=3D"font-family: monospace;"><span style=3D"font-family: monospace;">Jerem=
y</span></body></html>

--=-qWeAvYSMsMGZJvQBDbZk--

