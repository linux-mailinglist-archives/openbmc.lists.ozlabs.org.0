Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 310AD36983A
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 19:23:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRh3C0s1lz2yxv
	for <lists+openbmc@lfdr.de>; Sat, 24 Apr 2021 03:23:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=qSV65gLh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=qSV65gLh; dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRh2z2KXnz2xZP
 for <openbmc@lists.ozlabs.org>; Sat, 24 Apr 2021 03:23:38 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id p202so12822523ybg.8
 for <openbmc@lists.ozlabs.org>; Fri, 23 Apr 2021 10:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=o9NTOGM+3CUDNeCsPZY0fOQdNwm/WkYiWL5sE494USc=;
 b=qSV65gLht6qvhzmLtM+KKOAM9njt7CPTdAhHkPmD/9XiEjU6Ful1L7o46LKcs6NdZX
 wMSxDopnY/GYdUcacFQtdvAmpSa+2EHitMhHHRQCscbepEa3w5Wov8xG1LlbgMzeeD6Q
 H2NFxLFKRWRSKx0bg/4j5BSolMtoDeCX3PI570Lse+J7/XbCvQyJNrx0ChZW7K1+3YrC
 cgThCxzWq2U9l78eY2ms4mnd8H/CwySEHDiPzOZl04o5lJRreN4Ol6hvNqEUlKVr6JhA
 VVkN4ahCfjMc5v7Y5YZQ3jG7pXaqXHxKodcY1HA5tPE3ZHeeiqQ4eljQL7Kl7e3HwfP2
 rciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=o9NTOGM+3CUDNeCsPZY0fOQdNwm/WkYiWL5sE494USc=;
 b=erUT9WQaohRPnnymUDegf9f8ZQZdXTbfA5Q3n2s1Tc90DfDwoVve4IS6NZnJSlsk3a
 9XD0sjJ0G6pxEsEzX0yoPsb4teuLi237O0UbVlraBK5cp6LoWWj48qB9/hviHH+3hPUk
 YWkHtCpsYQRmjo9z5A/EwkdcY3cEN+I9ZCczg8IWTZxgoqGkYv1moRhS2iHtRN0JU2uJ
 jzohNUffwfbetlTfi+iPNg9kQsjXwAlxby3MNSJ2PMAjK+FKq25bP9LE4EyFQFH8YPPV
 73X/UyV7X342FngjbC7gfsnl/7xOPoaZTQBM2EU6aiFfNZj2coPs4PtfmqJr+4G++9as
 i9Lg==
X-Gm-Message-State: AOAM530H/u/2fYWJzAkddBCsWQkdS9u8eTQHuqEoGlH9ZG79iABF/yaw
 w/cvwMVuCCnAFnXPTBGYy/TuxIHHwdtM65wQdKs7cWRExE96RzLO
X-Google-Smtp-Source: ABdhPJzU0iDNW42R6WPvhFt3wQXwqp3HJ5Fu/43LjTmT1v2TrVlIuDS+/B0NCH6uvgL/7zYQayGH3hCWZ9fI4EnBu7E=
X-Received: by 2002:a05:6902:1108:: with SMTP id
 o8mr7319620ybu.131.1619198614617; 
 Fri, 23 Apr 2021 10:23:34 -0700 (PDT)
MIME-Version: 1.0
References: <1381833945.17566380.1619166988825.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <1381833945.17566380.1619166988825.JavaMail.zimbra@raptorengineeringinc.com>
From: Ed Tanous <ed@tanous.net>
Date: Fri, 23 Apr 2021 10:23:23 -0700
Message-ID: <CACWQX80mH2kBB3pCWPFxaYtDCMbMnfmXQWKh91Q+MsQSczpWcQ@mail.gmail.com>
Subject: Re: OpenBMC on RCS platforms
To: Timothy Pearson <tpearson@raptorengineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Apr 23, 2021 at 7:36 AM Timothy Pearson
<tpearson@raptorengineering.com> wrote:
>

First off, this is great feedback, and despite some of my comments
below, I do really appreciate you putting it out there.

> All,
>
> I'm reaching out after some internal discussion on how we can better inte=
grate our platforms with the OpenBMC project.  As many of you may know, we =
have been using OpenBMC in our lineup of OpenPOWER-based server and desktop=
 products, with a number of custom patches on top to better serve our targe=
t markets.
>
> While we have had fairly good success with OpenBMC in the server / datace=
nter space, reception has been lukewarm at best in the desktop space.  This=
 is not too surprising, given OpenBMC's historical focus on datacenter appl=
ications, but it is also becoming an expensive technical and PR pain point =
for us as the years go by.  To make matters worse, we're still shielding ou=
r desktop / workstation customer base to some degree from certain design de=
cisions that persist in upstream OpenBMC, and we'd like to open discussion =
on all of these topics to see if a resolution can be found with minimal was=
ted effort from all sides.
>
> Roughly speaking, we see issues in OpenBMC in 5 main areas:
>
>
> =3D=3D Fan control =3D=3D
>
> Out of all of the various pain points we've dealt with over the years, th=
is has proven the most costly and is responsible on its own for the lack of=
 RCS platforms upstream in OpenBMC.
>
> To be perfectly frank, OpenBMC's current fan control subsystem is a techn=
ical embarrassment, and not up to the high quality seen elsewhere in the pr=
oject.

Which fan control subsystem are you referring to?  Phosphor-fans or
phosphor-pid-control?

>  Worse, this multi-daemon DBUS-interconnected Rube Goldberg contraption h=
as somehow managed to persist over the past 4+ years, likely because it rea=
ched a complexity level where it is both tightly integrated with the rest o=
f the OpenBMC system and extremely difficult to understand, therefore it is=
 equally difficult to replace.  Furthering the lack of progress is the fact=
 that it is mostly "working" for datacenter applications, so there may be a=
 "don't touch what isn't broken" mentality in play.

I'm not really sure I agree with that.  If someone came with a design
for "We should replace dbus with X", had good technical foundations
for why X was better, and was putting forward the monumental effort to
do the work, I know that I personally wouldn't be opposed.  For the
record, I agree with you about the complexity here, but most of the
ideas I've heard to make it better were "Throw everything out and
start over", which, if that's what you want to do, by all means do,
but I don't think the community is willing to redo all of the untold
hours of engineering effort spent over the years the project has
existed.

FWIW, u-bmc was a project that took the existing kernel, threw out all
the userspace and started over.  From my view outside the project,
they seem to have failed to gain traction, and only support a couple
of platforms.

>  From a technical perspective, it is indirected to a sufficient level as =
to be nearly incomprehensible to most people, with the source spread across=
 multiple different projects and repositories, yet somehow it remains rigid=
 / fragile enough to not support basic features like runtime (or even post-=
compile) fan configuration for a given server.

With respect, this statement is incorrect.  On an entity-manager
enabled system + phosphor-pid-control, all of the fan control
parameters are fully modifiable at runtime either from within the
system (through dbus) or through Redfish out of band through the
OEMManager API.  If you haven't ported your systems to entity-manager
yet, there's quite a bit of people doing it at the moment and are
discussing this stuff on discord basically every day that I'm sure
would be able to give you some direction on where to start getting
your systems moved over.

>
> What we need is a much simpler, more robust fan control daemon.  Ideally =
this would be one self-contained process, not multiple interconnected proce=
sses where a single failure causes the entire system to go into safe mode.

in phosphor-pid-control, the failure modes are configurable per zone,
and includes things like N failures to failsafe, or adjusted fan floor
on failsafe.  If what's there doesn't meet your needs, I'm sure we can
discuss adding something else (I know there's at least one feature in
review in this area that you might check out on gerrit.)

>
> Our requirements:
> 1.) True PID control with tunable constants.  Trying to do things with PW=
M/temp maps alone may have made sense in the resource-constrained environme=
nts common in the 1970s, but it makes no sense on modern, powerful BMC sili=
con with hard floating point instructions.  Even the stock fan daemon imple=
ments a sort of bespoke integrator-by-another-name, but without the P and D=
 components it does a terrible job outside of a constant-temperature datace=
nter environment.

phosphor-pid-control implements PI based fan control.  If you really
wanted to add D, it would be an easy addition, but in practice, most
server control loops have enough noise, and a low enough loop
bandwidth that a D component isn't useful, so it was omitted from the
initial version.

> 2.) Tunable PID constants, tunable temperature thresholds, tunable min/ma=
x fan speeds, and arbitrary linkage between temp inputs (zones) and fan out=
puts (also zoned).

All of this exists in phosphor-pid-control.  Example:
https://github.com/openbmc/entity-manager/blob/a5a716dadfbf97b601577276cc69=
9af8f662beeb/configurations/WFT%20Baseboard.json#L1100

> 3.) Configurable zones -- both temperature and PWMs, as well as installed=
 / not installed fans and temperature sensors.

Also exists in phosphor-pid-control.  Example:
https://github.com/openbmc/entity-manager/blob/ec98491a00c5dcffae6be362e483=
380c807f234c/configurations/R2000%20Chassis.json#L411

> 4.) Configurable failure behavior.  A single failed or uninstalled chassi=
s fan should NOT cause the entire platform to go into failsafe mode!

Also exists in phosphor-pid-control.  Example of allowing single rotor
failures to not cause the system to hit failsafe:
https://github.com/openbmc/entity-manager/blob/ec98491a00c5dcffae6be362e483=
380c807f234c/configurations/R1000%20Chassis.json#L303

> 5.) A decent GUI to configure all of this, and the ability to export / im=
port the settings.

Doesn't exist, but considering we already have the Redfish API for
this, it should be relatively easy to execute within webui-vue.  With
that said, I've had this on my "Great idea for an intern project" list
for some time now.  If you have engineers to spare (or you're
interested in implementing this yourself) feel free to hop on discord
and I can help get you ramped on getting this started and how those
interfaces work.

>
> To be fair, we've only been able to implement 1, 2, 3, and 4 above at com=
pile time -- we don't have the runtime configuration options due to the way=
 the fan systems work in OpenBMC right now, and the sheer amount of work ne=
eded to overhaul the GUI in the out-of-tree situation we remain stuck in.  =
With all that said, however, we point out that our competition, especially =
on x86 platforms, has all of these features and more, all neatly contained =
in a nice user-friendly point+click GUI.  OpenBMC should be able to easily =
match or exceed that functionality, but for some reason it seems stuck in d=
atacenter-only mode with archaic hardcoded tables and constants.
>
> =3D=3D Local firmware updates =3D=3D
>
> This is right behind fan control in terms of cost and PR damage for us vs=
. competing platforms.  While OpenBMC's firmware update support is very wel=
l tuned for datacenter operations (we use a simple SSH + pflash method on o=
ur large clusters, for example) it's absolutely terrible for desktop and wo=
rkstation applications where a second PC is not guaranteed to be available,=
 and where wired Ethernet even exists DHCP is either non-existent or provid=
ed by a consumer cable box.  Some method of flashing -- and recovering -- t=
he BMC and host firmware right from the local machine is badly needed, espe=
cially for the WiFi-only environments we're starting to see more of in the =
wild.  Ideally this would be a command line tool / library such that we can=
 integrate it with our bootloader or a GUI as desired.

You might check Intels openbmc fork;  I believe they had u-boot
patches to do this that you might consider upstreaming, or working
with them to upstream them.

>
> =3D=3D BMC boot time =3D=3D
>
> This is self explanatory.  Other vendors' solutions allow the host to be =
powered on within seconds of power application from the wall, and even our =
own Kestrel soft BMC allows the host to begin booting less than 10 seconds =
after power is applied.  Several *minutes* for OpenBMC to reach a point whe=
re it can even start to boot the host is a major issue outside of datacente=
r applications.

While this is great information to have, it's a little disingenuous to
the fact that we've significantly reduced the boot time in the last
few years with things like dropping python, and porting the mapper to
a compiled language.  We can always do better, but unless you have
concrete ideas on how we can continue reducing this, there's very
little OpenBMC can do.

>
> =3D=3D Host boot status indications =3D=3D
>
> Any ODM that makes server products has had to deal with the psychological=
 "dead server effect", where lack of visible progress during boot causes sp=
urious callouts / RMAs.  It's even worse on desktop, especially if server-t=
ype hardware is used inside the machine.  We've worked around this a few ti=
mes with our "IPL observer" services, and really do need this functionality=
 in OpenBMC.  The current version we have is both front panel lights and a =
progress bar on the BMC boot monitor (VGA/HDMI), and this is something we'r=
e willing to contribute upstream.

For some reason I thought we already had code to allow the BMC to post
a splash screen ahead of processor boot, but I'm not recalling what it
was called, as I've never had this requirement myself.

>
> =3D=3D IPMI / BMC permissions =3D=3D
>
> An item that's come up recently is that, at least on our older OpenBMC ve=
rsions, there's a complete disconnect between the BMC's shell user database=
 and the IPMI user database.  Resetting the BMC root password isn't possibl=
e from IPMI on the host, and setting up IPMI doesn't seem possible from the=
 BMC shell.  If IPMI support is something OpenBMC provides alongside Redfis=
h, it needs to be better integrated -- we're dealing with multiple locked-o=
ut BMC issues at the moment at various customer sites, and the recovery met=
hod is painful at best when it should be as simple as an ipmitool command f=
rom the host terminal.

I thought this was fixed long ago.  User passwords and user accounts
are common between redfish, ipmi, and ssh.  Do you think you could try
a more recent build and see if this is still an issue for you?

>
>
> If there is interest, I'd suggest we all work on getting some semblance o=
f a modern fan control system and the boot status indication framework into=
 upstream OpenBMC.  This would allow Raptor to start upstreaming base suppo=
rt for RCS product lines without risking severe regressions in user pain po=
ints like noisy fans -- perceived high noise levels are always a great way =
to kill sales of office products, and as a result the fan control functiona=
lity is something we're quite sensitive about.  The main problem is that wi=
th the existing fan control system's tentacles snaking everywhere including=
 the UI, this will need to be a concerted effort by multiple organizations =
including the maintainers of the UI and the other ODMs currently using the =
existing fan control functionality.  We're willing to make yet another atte=
mpt *if* there's enough buy-in from the various stakeholders to ensure a pr=
ompt merge and update of the other components.

I'd really prefer you look at what already exists.  I think most of
your concerns are covered in phosphor-pid-control today, and if they
aren't, I suspect we can add new parts to the control loop where
needed.

>
> Finally, some of you may also be aware of our Kestrel project [1], which =
eschews the typical BMC ASICs, Linux, and OpenBMC itself.  I'd like to poin=
t out that this is not a direct competitor to OpenBMC, it is designed speci=
fically for certain target applications with unique requirements surroundin=
g overall size, functionality, speed, auditability, transparency, etc.  Why=
 we have gone to those lengths will become apparent later this year, but su=
ffice it to say we're considering Kestrel to be used in spaces where OpenBM=
C is not practical and vice versa.  In fact, we'd like to see OpenBMC run o=
n the Kestrel SoCs (or a derivative thereof) at some point in the future, o=
nce the performance concerns above are sufficiently mitigated to make that =
practical.
>
> [1] https://gitlab.raptorengineering.com/kestrel-collaboration/kestrel-li=
tex/litex-boards/-/blob/master/README.md
