Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C873694D7
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 16:36:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRcKz0FjLz300Q
	for <lists+openbmc@lfdr.de>; Sat, 24 Apr 2021 00:36:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=IeaL4bC3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.45;
 helo=mail.rptsys.com; envelope-from=tpearson@raptorengineering.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD
 header.b=IeaL4bC3; dkim-atps=neutral
X-Greylist: delayed 362 seconds by postgrey-1.36 at boromir;
 Sat, 24 Apr 2021 00:36:09 AEST
Received: from mail.rptsys.com (mail.rptsys.com [23.155.224.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRcKj4Myyz2yR6
 for <openbmc@lists.ozlabs.org>; Sat, 24 Apr 2021 00:36:09 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 678BC37AB412BF
 for <openbmc@lists.ozlabs.org>; Fri, 23 Apr 2021 09:30:02 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 7c7lp9T9s-Eg for <openbmc@lists.ozlabs.org>;
 Fri, 23 Apr 2021 09:30:01 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 36D2537AB412AD
 for <openbmc@lists.ozlabs.org>; Fri, 23 Apr 2021 09:30:01 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 36D2537AB412AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1619188201; bh=iTrMpQ8IzcQyMagHWU5ptw9/1bmCZzW90477RN3jQVM=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=IeaL4bC37YG2A8e6P9350on15rjml0z2fb6j1OAflUH4pANezOZAWUrziu9mi37AD
 VZMzHH3BaPwjb2aW2PGr6/V62o33pLPkO0Ys3Us7/eSJuIZFF+iMUO++vG9hJPwxCu
 +/PrNLmMIR0+U/QNW26BcLgUrfZJj7zauVtj8ChM=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id a0vyrFPxmU-e for <openbmc@lists.ozlabs.org>;
 Fri, 23 Apr 2021 09:30:01 -0500 (CDT)
Received: from vali.starlink.edu (unknown [192.168.3.2])
 by mail.rptsys.com (Postfix) with ESMTP id 0E04637AB412A9
 for <openbmc@lists.ozlabs.org>; Fri, 23 Apr 2021 09:30:01 -0500 (CDT)
Date: Fri, 23 Apr 2021 09:30:00 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc <openbmc@lists.ozlabs.org>
Message-ID: <1381833945.17566380.1619166988825.JavaMail.zimbra@raptorengineeringinc.com>
Subject: OpenBMC on RCS platforms
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.5.0_GA_3042
Thread-Index: +yNMZLcMW2EjHxtAlb2tjTvOqIygsQ==
Thread-Topic: OpenBMC on RCS platforms
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

All,

I'm reaching out after some internal discussion on how we can better integr=
ate our platforms with the OpenBMC project.  As many of you may know, we ha=
ve been using OpenBMC in our lineup of OpenPOWER-based server and desktop p=
roducts, with a number of custom patches on top to better serve our target =
markets.

While we have had fairly good success with OpenBMC in the server / datacent=
er space, reception has been lukewarm at best in the desktop space.  This i=
s not too surprising, given OpenBMC's historical focus on datacenter applic=
ations, but it is also becoming an expensive technical and PR pain point fo=
r us as the years go by.  To make matters worse, we're still shielding our =
desktop / workstation customer base to some degree from certain design deci=
sions that persist in upstream OpenBMC, and we'd like to open discussion on=
 all of these topics to see if a resolution can be found with minimal waste=
d effort from all sides.

Roughly speaking, we see issues in OpenBMC in 5 main areas:


=3D=3D Fan control =3D=3D

Out of all of the various pain points we've dealt with over the years, this=
 has proven the most costly and is responsible on its own for the lack of R=
CS platforms upstream in OpenBMC.

To be perfectly frank, OpenBMC's current fan control subsystem is a technic=
al embarrassment, and not up to the high quality seen elsewhere in the proj=
ect.  Worse, this multi-daemon DBUS-interconnected Rube Goldberg contraptio=
n has somehow managed to persist over the past 4+ years, likely because it =
reached a complexity level where it is both tightly integrated with the res=
t of the OpenBMC system and extremely difficult to understand, therefore it=
 is equally difficult to replace.  Furthering the lack of progress is the f=
act that it is mostly "working" for datacenter applications, so there may b=
e a "don't touch what isn't broken" mentality in play.  From a technical pe=
rspective, it is indirected to a sufficient level as to be nearly incompreh=
ensible to most people, with the source spread across multiple different pr=
ojects and repositories, yet somehow it remains rigid / fragile enough to n=
ot support basic features like runtime (or even post-compile) fan configura=
tion for a given server.

What we need is a much simpler, more robust fan control daemon.  Ideally th=
is would be one self-contained process, not multiple interconnected process=
es where a single failure causes the entire system to go into safe mode.

Our requirements:
1.) True PID control with tunable constants.  Trying to do things with PWM/=
temp maps alone may have made sense in the resource-constrained environment=
s common in the 1970s, but it makes no sense on modern, powerful BMC silico=
n with hard floating point instructions.  Even the stock fan daemon impleme=
nts a sort of bespoke integrator-by-another-name, but without the P and D c=
omponents it does a terrible job outside of a constant-temperature datacent=
er environment.
2.) Tunable PID constants, tunable temperature thresholds, tunable min/max =
fan speeds, and arbitrary linkage between temp inputs (zones) and fan outpu=
ts (also zoned).
3.) Configurable zones -- both temperature and PWMs, as well as installed /=
 not installed fans and temperature sensors.
4.) Configurable failure behavior.  A single failed or uninstalled chassis =
fan should NOT cause the entire platform to go into failsafe mode!
5.) A decent GUI to configure all of this, and the ability to export / impo=
rt the settings.

To be fair, we've only been able to implement 1, 2, 3, and 4 above at compi=
le time -- we don't have the runtime configuration options due to the way t=
he fan systems work in OpenBMC right now, and the sheer amount of work need=
ed to overhaul the GUI in the out-of-tree situation we remain stuck in.  Wi=
th all that said, however, we point out that our competition, especially on=
 x86 platforms, has all of these features and more, all neatly contained in=
 a nice user-friendly point+click GUI.  OpenBMC should be able to easily ma=
tch or exceed that functionality, but for some reason it seems stuck in dat=
acenter-only mode with archaic hardcoded tables and constants.

=3D=3D Local firmware updates =3D=3D

This is right behind fan control in terms of cost and PR damage for us vs. =
competing platforms.  While OpenBMC's firmware update support is very well =
tuned for datacenter operations (we use a simple SSH + pflash method on our=
 large clusters, for example) it's absolutely terrible for desktop and work=
station applications where a second PC is not guaranteed to be available, a=
nd where wired Ethernet even exists DHCP is either non-existent or provided=
 by a consumer cable box.  Some method of flashing -- and recovering -- the=
 BMC and host firmware right from the local machine is badly needed, especi=
ally for the WiFi-only environments we're starting to see more of in the wi=
ld.  Ideally this would be a command line tool / library such that we can i=
ntegrate it with our bootloader or a GUI as desired.

=3D=3D BMC boot time =3D=3D

This is self explanatory.  Other vendors' solutions allow the host to be po=
wered on within seconds of power application from the wall, and even our ow=
n Kestrel soft BMC allows the host to begin booting less than 10 seconds af=
ter power is applied.  Several *minutes* for OpenBMC to reach a point where=
 it can even start to boot the host is a major issue outside of datacenter =
applications.

=3D=3D Host boot status indications =3D=3D

Any ODM that makes server products has had to deal with the psychological "=
dead server effect", where lack of visible progress during boot causes spur=
ious callouts / RMAs.  It's even worse on desktop, especially if server-typ=
e hardware is used inside the machine.  We've worked around this a few time=
s with our "IPL observer" services, and really do need this functionality i=
n OpenBMC.  The current version we have is both front panel lights and a pr=
ogress bar on the BMC boot monitor (VGA/HDMI), and this is something we're =
willing to contribute upstream.

=3D=3D IPMI / BMC permissions =3D=3D

An item that's come up recently is that, at least on our older OpenBMC vers=
ions, there's a complete disconnect between the BMC's shell user database a=
nd the IPMI user database.  Resetting the BMC root password isn't possible =
from IPMI on the host, and setting up IPMI doesn't seem possible from the B=
MC shell.  If IPMI support is something OpenBMC provides alongside Redfish,=
 it needs to be better integrated -- we're dealing with multiple locked-out=
 BMC issues at the moment at various customer sites, and the recovery metho=
d is painful at best when it should be as simple as an ipmitool command fro=
m the host terminal.


If there is interest, I'd suggest we all work on getting some semblance of =
a modern fan control system and the boot status indication framework into u=
pstream OpenBMC.  This would allow Raptor to start upstreaming base support=
 for RCS product lines without risking severe regressions in user pain poin=
ts like noisy fans -- perceived high noise levels are always a great way to=
 kill sales of office products, and as a result the fan control functionali=
ty is something we're quite sensitive about.  The main problem is that with=
 the existing fan control system's tentacles snaking everywhere including t=
he UI, this will need to be a concerted effort by multiple organizations in=
cluding the maintainers of the UI and the other ODMs currently using the ex=
isting fan control functionality.  We're willing to make yet another attemp=
t *if* there's enough buy-in from the various stakeholders to ensure a prom=
pt merge and update of the other components.

Finally, some of you may also be aware of our Kestrel project [1], which es=
chews the typical BMC ASICs, Linux, and OpenBMC itself.  I'd like to point =
out that this is not a direct competitor to OpenBMC, it is designed specifi=
cally for certain target applications with unique requirements surrounding =
overall size, functionality, speed, auditability, transparency, etc.  Why w=
e have gone to those lengths will become apparent later this year, but suff=
ice it to say we're considering Kestrel to be used in spaces where OpenBMC =
is not practical and vice versa.  In fact, we'd like to see OpenBMC run on =
the Kestrel SoCs (or a derivative thereof) at some point in the future, onc=
e the performance concerns above are sufficiently mitigated to make that pr=
actical.

[1] https://gitlab.raptorengineering.com/kestrel-collaboration/kestrel-lite=
x/litex-boards/-/blob/master/README.md
