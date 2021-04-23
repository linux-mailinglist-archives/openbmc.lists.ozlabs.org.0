Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 622E2369A60
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 20:47:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRjvV2JgDz301p
	for <lists+openbmc@lfdr.de>; Sat, 24 Apr 2021 04:47:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=U0BNUtwL;
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
 header.b=U0BNUtwL; dkim-atps=neutral
Received: from mail.rptsys.com (mail.rptsys.com [23.155.224.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRjvD5DwXz2yhm
 for <openbmc@lists.ozlabs.org>; Sat, 24 Apr 2021 04:47:04 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 3747A37AB45884;
 Fri, 23 Apr 2021 13:47:02 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 6grA5pxF_J6n; Fri, 23 Apr 2021 13:46:59 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 17E5F37AB45879;
 Fri, 23 Apr 2021 13:46:59 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 17E5F37AB45879
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1619203619; bh=n+m85LSdKHq9vZGPODpOHOWlml/cCueuKTo0yq55LVM=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=U0BNUtwLQoE7DtLHaRQ3IJWVb1/p3hwyCCRBU5+p8QOfsY4ffw/UPaH6we1AtPqoT
 i7vHTwFAlW19SVy1740hY5i7EqPafguH3ng2bpj25tNWdKg4rRC9jmaBeiOhh4M9iI
 s/zb+rjC3VkJYaOfW5iJpChVtM+YflF2UsmQEhHg=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id IegKF9rA7PDs; Fri, 23 Apr 2021 13:46:58 -0500 (CDT)
Received: from vali.starlink.edu (unknown [192.168.3.2])
 by mail.rptsys.com (Postfix) with ESMTP id E15F037AB45875;
 Fri, 23 Apr 2021 13:46:58 -0500 (CDT)
Date: Fri, 23 Apr 2021 13:46:57 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Patrick Williams <patrick@stwcx.xyz>
Message-ID: <1330863731.17653022.1619203617920.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <YIL/vssl4BAocl4M@heinlein>
References: <1381833945.17566380.1619166988825.JavaMail.zimbra@raptorengineeringinc.com>
 <YIL/vssl4BAocl4M@heinlein>
Subject: Re: OpenBMC on RCS platforms
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC65 (Linux)/8.5.0_GA_3042)
Thread-Topic: OpenBMC on RCS platforms
Thread-Index: Q+N5VQFiw2qk7jRuEjU3iQ84+dHHfw==
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



----- Original Message -----
> From: "Patrick Williams" <patrick@stwcx.xyz>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "openbmc" <openbmc@lists.ozlabs.org>
> Sent: Friday, April 23, 2021 12:11:26 PM
> Subject: Re: OpenBMC on RCS platforms

> On Fri, Apr 23, 2021 at 09:30:00AM -0500, Timothy Pearson wrote:
>> All,
>>=20
>> I'm reaching out after some internal discussion on how we can better int=
egrate
>> our platforms with the OpenBMC project.  As many of you may know, we hav=
e been
>> using OpenBMC in our lineup of OpenPOWER-based server and desktop produc=
ts,
>> with a number of custom patches on top to better serve our target market=
s.
>=20
> Hi Timothy,
>=20
> Good to hear from your team again and hope there is some ways we can
> work together on solving some of these issues.
>=20
>> Roughly speaking, we see issues in OpenBMC in 5 main areas:
>=20
> We might want to fork this into 5 different discussion threads and/or
> design documents, but let's see how this goes...
>=20
>> =3D=3D Fan control =3D=3D
>>=20
>> To be perfectly frank, OpenBMC's current fan control subsystem is a tech=
nical
>> embarrassment, and not up to the high quality seen elsewhere in the proj=
ect.
>> Worse, this multi-daemon DBUS-interconnected Rube Goldberg contraption h=
as
>> somehow managed to persist over the past 4+ years, likely because it rea=
ched
>> a complexity level where it is both tightly integrated with the rest of =
the
>> OpenBMC system and extremely difficult to understand, therefore it is
>> equally difficult to replace.
>=20
> This is, to me, a pretty unfair assessment of the situation, but I hear
> you that the code is likely not very usable outside of datacenter use-cas=
es.
> Certainly there is some work that can be done to improve that and I
> think we'd be receptive to have partners on it.  The vast majority of
> developers on the project *are* working on datacenter use-cases though,
> so I don't know if there is anyone actively taking up the mantle on
> this.  This could be a good area of expertise and contribution from your
> team (I personally don't really know enough of where to start at making
> a desktop-friendly fan control algorithm).
>=20
> I'm not sure what you mean by "this multi-daemon DBUS-interconnected Rube
> Goldberg contraption" though.  There are really 3 dbus interfaces around
> Fan control:
>    - xyz.openbmc_project.Sensor.Value
>    - xyz.openbmc_project.Control.FanPwm
>    - xyz.openbmc_project.Control.FanSpeed
>=20
> I don't like that we ended up with FanPwm and FanSpeed, but the fact is
> that there are two different hardware models for controlling fans and
> the people working with PWM-based fans didn't want to put in the effort
> to control them with target speeds.  (I think there was an argument that
> *their* fan control algorithm experts liked %-of-PWM as a calibration,
> and weren't able to come to consensus otherwise)
>=20
> I don't know what you mean by Rube Goldberg here or how to make the
> sitation any better.  All sensors are read by sensor daemons using
> common APIs like Linux HWMon and there is a similar "set the fan speed in
> hardware" daemon.  Perhaps you could eliminate the Control.Fan*
> interfaces (and merge them into a fan control daemon directly) but there
> were some people who wanted to be able to manually control fan speeds in
> some scenarios anyhow.  Anyhow, I'm not really seeing a lot of
> simplification that could even be done, but certainly not undue
> excessive mechanisations that would classify as "Rube Goldberg".
>=20
> There is a xyz.openbmc_project.Control.FanRedundancy interface, but I
> suspect that is used outside the use cases you intend anyhow and really
> it is optional to fan control.  Similarly, anything under Inventory is
> just that... Inventory; it is not critical to fan control.

I admit I was a bit harsh here, but in this particular case I think I may b=
e justified.  Hear me out.. :)

Looking at one of our systems, the following daemons and scripts all have t=
o run just to provide basic fan control:

fan_control.exe
phosphor-fan-presence-tach
phosphor-fan-monitor
phosphor-fan-control
phosphor-hwmon-readd (multiple instances)
openpower-occ-control
occ-active.sh

We don't have anything against DBUS per se, but what I do see here is that =
DBUS has been used as a crutch to easily glue together four (!) different s=
ervices that are so closely linked that they really should be all integrate=
d into one dedicated service.  Also on display here is a bit of the haphaza=
rd design that afflicts the fan control system -- the separate daemons to p=
rovide raw sensor values may well make sense as a sort of HAL, but there's =
no equivalent to interface with the raw PWM settings.

When I next look at how these seven services are configured, I see an overl=
y complex configuration scheme involving both build and run time files.  Th=
e run time files are generated at compile time from yet other input files, =
most of them YAML, some of them conf files and a few straight up shell snip=
pets:

fans/phosphor-fan-control-events-config-native/events.yaml
fans/phosphor-fan-control-fan-config-native/fans.yaml
fans/phosphor-fan-control-zone-conditions-config-native/zone_conditions.yam=
l
fans/phosphor-fan-control-zone-config-native/zones.yaml
fans/phosphor-fan-monitor-config-native/monitor.yaml
fans/phosphor-fan-presence-config-native/config.yaml
fans/talos-thermal-policy/thermal-policy.yaml
fans/talos-fan-policy/air-cooled.yaml
fans/talos-fan-policy/fan-errors.yaml
fans/talos-fan-policy/water-cooled.yaml
fans/phosphor-fan/obmc/phosphor-fan/phosphor-cooling-type-0.conf
fans/talos-fan-watchdog/obmc/talos-fan-watchdog/fan-watchdog.conf
fans/talos-fan-watchdog/obmc/talos-fan-watchdog/reset-fan-watchdog.conf
sensors/phosphor-hwmon/obmc/hwmon/ahb/apb/bus@1e78a000/i2c-bus@440/max31785=
@52.conf
sensors/phosphor-hwmon/obmc/hwmon/ahb/apb/bus@1e78a000/i2c-bus@440/w83773g@=
4c.conf
sensors/phosphor-hwmon/obmc/hwmon/devices/platform/gpio-fsi/fsi0/slave@00--=
00/00--00--00--06/sbefifo1-dev0/occ-hwmon.1.conf
sensors/phosphor-hwmon/obmc/hwmon/devices/platform/gpio-fsi/fsi0/slave@00--=
00/00--00--00--0a/fsi1/slave@01--00/01--01--00--06/sbefifo2-dev0/occ-hwmon.=
2.conf

I'm sure there are more, but I'm not motivated to find them at the moment. =
 All of that configuration mess is required for a single platform with the =
simple design of six fans, six tachs, and five temperature sources, grouped=
 into three zones.  None of it is runtime configurable, all of those YAML f=
iles go through a bunch of preprocessing and eventually end up as source co=
de that is hard compiled into the fan daemons.  If the user wants to alter =
so much as a single PID constant, the entire stack has to be recompiled wit=
h the new settings and reflashed.

>> Furthering the lack of progress is the fact that it is mostly "working" =
for
>> datacenter applications, so there may be a "don't touch what isn't broke=
n"
>> mentality in play.
>=20
> As I hinted at above, I think it is a lack of necessity and not a fear
> of breaking.  In general, as a community we should not be afraid of
> change.  We have plenty of test cases to qualify code that is changing
> and if there isn't test cases for a functional area then it is fair game
> to change without worry, in my opinion.
>=20
>> From a technical perspective, it is indirected to a sufficient level as =
to
>> be nearly incomprehensible to most people, with the source spread across
>> multiple different projects and repositories, yet somehow it remains
>> rigid / fragile enough to not support basic features like runtime (or ev=
en
>> post-compile) fan configuration for a given server.
>=20
> There are two different fan control implementations presently:
>    - phosphor-pid-control (swampd)
>    - phosphor-fan-presence (phosphor-fan-control)
>=20
> Which of these are you having issue with?  They are intended to serve
> drastically different purposes.
>=20
> I don't think anyone outside of IBM uses phosphor-fan-control.  It seems
> to be explicitly designed for their systems with their own requirements.
> Unless they speak up, I don't know how we intend anyone else to use this
> code and it probably should be renamed 'ibm-fan-control'.
>=20
>> What we need is a much simpler, more robust fan control daemon.  Ideally=
 this
>> would be one self-contained process, not multiple interconnected process=
es
>> where a single failure causes the entire system to go into safe mode.
>>=20
>> Our requirements:
>> 1.) True PID control with tunable constants.  Trying to do things with P=
WM/temp
>> maps alone may have made sense in the resource-constrained environments =
common
>> in the 1970s, but it makes no sense on modern, powerful BMC silicon with=
 hard
>> floating point instructions.  Even the stock fan daemon implements a sor=
t of
>> bespoke integrator-by-another-name, but without the P and D components i=
t does
>> a terrible job outside of a constant-temperature datacenter environment.
>=20
> Isn't phosphor-pid-control this already?

No.  It suffers from the exact same hardcoded YAML mess as above, with no t=
unability at runtime.

>> 2.) Tunable PID constants, tunable temperature thresholds, tunable min/m=
ax fan
>> speeds, and arbitrary linkage between temp inputs (zones) and fan output=
s (also
>> zoned).
>> 3.) Configurable zones -- both temperature and PWMs, as well as installe=
d / not
>> installed fans and temperature sensors.
>=20
> I think these two features are the part that are more interesting to
> non-datacenter use cases and so nobody has put effort into it.  As much
> as you seem to dislike dbus mechanization, this sounds like we would
> need a few interfaces defined for these so that Redfish has something to
> poke at.
>=20
> I do know some BIOS vendors provide this for desktops already.  Is there
> anything at an IPMI level that could facilitate the hand-off of this?
>=20
>> 4.) Configurable failure behavior.  A single failed or uninstalled chass=
is fan
>> should NOT cause the entire platform to go into failsafe mode!
>=20
> phosphor-fan-presence does provide some of this, but again, I feel like
> it is tuned to IBM's needs.  It appears that phosphor-pid-control has
> some amount of implementation of Control.FanRedundancy that I mentioned
> earlier.  Are you sure that phosphor-pid-control causes the system to go
> into fail-safe mode from a single fan failure though?  I've not heard
> this.

It's not pid-control, it's a separate monitor daemon and some shell scripts=
.  The "control" part of the fan control daemon stack is put into a failure=
 mode IIRC if a problem is found, and that's a pretty coarse switch that ha=
s no ability to take into account the location of the problem or whether th=
e other fans are able to take over with just a moderate speed increase.

>> 5.) A decent GUI to configure all of this, and the ability to export / i=
mport
>> the settings.
>=20
> Sure...
>=20
>> To be fair, we've only been able to implement 1, 2, 3, and 4 above at
>> compile time -- we don't have the runtime configuration options due to t=
he
>> way the fan systems work in OpenBMC right now, and the sheer amount of
>> work needed to overhaul the GUI in the out-of-tree situation we remain
>> stuck in.  With all that said, however, we point out that our competitio=
n,
>> especially on x86 platforms, has all of these features and more, all nea=
tly
>> contained in a nice user-friendly point+click GUI.  OpenBMC should be ab=
le
>> to easily match or exceed that functionality, but for some reason it see=
ms
>> stuck in datacenter-only mode with archaic hardcoded tables and constant=
s.
>=20
> So, if you've done 1-4, are there any commits in Gerrit?  Which fan
> control daemon were they done against?

This is where the history of the projects starts to come into play.  We've =
re-implemented the same functionality several times as OpenBMC continues to=
 churn, I think the last version required less work than before but phospho=
r-fan-presence and phosphor-hwmon still needed our patches to enable the ra=
w-mode PID loops.

> There is a certain air to what you wrote that rubs me the wrong way.
> We're not a product that you've paid for here to do what you, the
> customer, is asking of us.  This is an open source community and one
> that most of us are paid to work on by our employer.  We don't do work
> to make you happy, but do work because our bosses are asking for certain
> features out of us.  As I said above, almost everyone here is working on
> "datacenter-only systems", so why would anyone else invest in this use
> case?
>=20
> This is *your* business model.  We'd certainly love to have contributions
> from your team and most of us would even spend some of our time to help
> you in your efforts.  But, if you want this, as they often say:
>                    "Patches Welcome!"

Don't mean to rub anyone here the wrong way.  The main reason I'm here now =
is that Raptor was recently called out for creating a more limited, contain=
ed system that better matches what we need in a BMC, and chastised for not =
fixing the problems in OpenBMC instead.  We have not yet decided how we are=
 officially going to proceed with our future product lines, and are evaluat=
ion options.  Part of that evaluation involves me seeing what degree of acc=
eptance or resistance there would be in OpenBMC to merging and maintaining =
patches that have no real use for other ODMs in the server-only solution sp=
ace.  I think the OpenBMC stack is impressive in many areas, and would pref=
er to use it where practical, but at the same time when I see low level des=
ign decisions like running 14 different processes all linked over DBUS just=
 to read sensors and set corresponding fan speeds, I also realize it's simp=
ly not going to be practical to use it as-is on low end BMC silicon.

At the end of the day, we're backed into a bit of a corner here for exactly=
 the reasons you mention above.  I have to justify development costs in ord=
er for any large-scale (non-hobby / "gratis") development project to be app=
roved, and that means cost in vs. results out is the primary factor.  If, f=
or the same investment, we can create a smaller BMC solution for our deskto=
p products that actually does what our customers need, while not providing =
90% of the server features said desktop users won't use in the first place,=
 that's the direction I'll be told to go vs. attempting to extend OpenBMC i=
n a way that no one else needs or wants.

> I do see some code from early 2020 from you against phosphor-hwmon and
> phosphor-fan-presence.  All of the phosphor-hwmon commits failed CI test
> so nobody every looked at them.  All of the phosphor-fan-presence commits
> received timely feedback, to which you never responded, and seemed to be
> missing an updated CCLA from Raptor?  Is there something we should have
> done as a community to keep this work going?

Good question!  As always, there's a bit of backstory on that as well, but =
really it came down to a bad combination of OpenBMC churn and reviewer dela=
y causing a need for significant refactoring, and the needed developer reso=
urces being reassigned to more pressing projects on Raptor's side.  If the =
OpenBMC churn is anywhere near where it was at that point today, then the b=
est advice I'd have is to merge as fast as possible and clean up any small =
issues in later commits -- this is where the fact that changing one functio=
nal item (fan control) requires coincident changes in multiple different re=
positories really hurts vs. a single source tree / single daemon that provi=
des that specific function.

>> =3D=3D Local firmware updates =3D=3D
>>=20
>> This is right behind fan control in terms of cost and PR damage for us v=
s.
>> competing platforms.  While OpenBMC's firmware update support is very we=
ll
>> tuned for datacenter operations (we use a simple SSH + pflash method on =
our
>> large clusters, for example) it's absolutely terrible for desktop and
>> workstation applications where a second PC is not guaranteed to be avail=
able,
>> and where wired Ethernet even exists DHCP is either non-existent or prov=
ided by
>> a consumer cable box.  Some method of flashing -- and recovering -- the =
BMC and
>> host firmware right from the local machine is badly needed, especially f=
or the
>> WiFi-only environments we're starting to see more of in the wild.  Ideal=
ly this
>> would be a command line tool / library such that we can integrate it wit=
h our
>> bootloader or a GUI as desired.
>=20
> This sounds to me pretty easily obtainable and what I have in mind is
> actually a valid data center use case for many of us.  When all else
> fails, you should be able to use a USB key to update the system
> (assuming the image you're updating with is trusted for whatever your
> system determines is trust-worthy).  I'm pretty sure our OCP systems can
> be updated with a magic combination of a USB-key and an OCP debug
> card(*).  I don't think that is currently implemented on openbmc/openbmc,
> but it is on our list of pending features.
>=20
> For your specific users, the OCP debug card is probably not a good
> requirement, but you could likely automate the update whenever a USB-key
> plus text file is added?  (I'm just brainstorming how you'd know to kick
> it off).  The current software update code probably isn't too far off
> from being able to facilitate this for you.
>=20
> https://www.opencompute.org/documents/facebook-ocp-debug-card-with-lcd-sp=
ec_v1p0

At first glance, that's another overly complex solution for a simple proble=
m that would cause a degraded user experience vs. other platforms.

We have an 800Mhz Linux-based computer with 512MB of RAM, serial and video =
out support already integrated into every one of our products.  It can rece=
ive data via PCIe and via USB from an active host.  Why isn't there a mecha=
nism to send a signed container to it over one of these existing channels f=
or self-update?

A potential user story looks like this:

=3D=3D=3D=3D=3D

I want to update the firmware on my Blackbird desktop to fix a problem I'm =
having with a new control widget I've plugged in.  To make things more inte=
resting, I'm on an oil rig in the Gulf, and the desktop only connects via i=
ntermittent WiFi.  Spare parts are weeks away, and I have next to no electr=
onic diagnostic equipment available to me.  There's one or two USB ports I =
can normally use because I have administrative privileges, but I was able t=
o grab the upgrade file over WiFi instead, saving myself some time cleaning=
 accumulated gunk out of the ports.

I can update my <large vendor> standard PC firmware just by running a tool =
on Windows, but the Blackbird was selected because it controls a critical p=
rocess that needed to be malware-resistant.

Fortunately, OpenBMC implemented a quality firmware update process.  I just=
 need to launch a GUI tool with host administrative privileges, select the =
upgrade file, and queue an upgrade to happen when I reboot the machine.  I =
queue the update, start the reboot, and stick around to see the upgrade pro=
gress on the screen while it's booting back up.  Because I can see the stat=
us on the screen, I know what is happening and don't pull the power plug du=
e to only seeing a black screen and power LED for 10 minutes.  Finally, the=
 machine loads the OS and I verify the new control widget is working proper=
ly.

=3D=3D=3D=3D=3D

Is there a technical / architectural reason this can't be done, or some oth=
er reason it's a bad idea?

>> =3D=3D BMC boot time =3D=3D
>>=20
>> This is self explanatory.  Other vendors' solutions allow the host to be=
 powered
>> on within seconds of power application from the wall, and even our own K=
estrel
>> soft BMC allows the host to begin booting less than 10 seconds after pow=
er is
>> applied.  Several *minutes* for OpenBMC to reach a point where it can ev=
en
>> start to boot the host is a major issue outside of datacenter applicatio=
ns.
>=20
> Some of this is, to me, an artifact of the Power architecture and not an
> artifact of OpenBMC explicitly.  On x86 systems we have a little code in
> u-boot that wiggles a GPIO and gets the Host power sequence going while
> the BMC is booting up.  This overlaps quite a bit of the memory testing
> of the Host with the BMC boot time.  The "well-known proprietary BMC"
> also does this same trick.

I think we're talking about two different well know proprietary BMCs, but t=
hat's not important for this discussion other than no, the one I have in mi=
nd doesn't resort to such tricks.  What it does do is start up its core ser=
vices rapidly enough where this isn't a problem, and lets the rest of the B=
MC stack start up at its own pace later on.
=20
> Power requires the BMC to be up in order to serve out the virtual PNOR,
> from my recollection.  It seems like this could be solved in other ways,
> such as a SPI-mux on a physical SPI-NOR so that the BMC can take the NOR
> at specific times during update but otherwise it is given to the host
> CPUs.  This is exactly what we do on x86 systems.

Ouch.  So on x86 boxen you might actually have two "BMCs" -- the proprietar=
y one inside the CPU that starts in seconds and provides base services like=
 SPI Flash mapping to CPU address space, and the external OpenBMC one that =
can run in parallel without interfering with host start.  Adding a mux is t=
hen a hack needed on top, since you can't really communicate with the propr=
ietary stack in the required manner.

For systems like POWER that lack the proprietary internal "BMC", I guess th=
ere are a few ways we could address the problem:

1.) Speed up OpenBMC load -- this sounds like it would end up being complet=
ely supported by one or two vendors alone, and subject to breakage from the=
 other vendors that simply don't have any concerns around OpenBMC start tim=
e since their platforms aren't visibly affected by it.  It's also unlikely =
to come into the desired sub-10s range.

2.) Split the BMC into "essential" and "nice to have" services, much like t=
he other platforms.  Painful, as it now requires even more parts on the mai=
nboard.

3.) Keep the single BMC device, but split it into two software stacks, one =
that can load nearly instantly and start providing essential services, and =
another than can load more slowly.  This would effectively require two sepa=
rate CPUs inside the BMC, which we actually do have in the AST2500.  I have=
n't done any digging though to see if the second CPU is powerful enough to =
implement the HIOMAP protocol at speed.

> Having said all of that, there is certainly some performance
> improvements that can be done, but nobody has taken up the torch on it.
> A big low-hanging fruit in my mind is the file system compression being
> xz or gzip is very computationally intensive.  I did some work, with
> Nick Terrell, to switch to zstd on our systems for both the kernel
> initramfs and UBI and saw significant boot time improvements.  The
> upstream enablement for this appears to have landed as of v5.9 so we
> could certainly start enabling it here now.
>=20
> https://lore.kernel.org/linux-kbuild/20200730190841.2071656-7-nickrterrel=
l@gmail.com/
>=20
>> =3D=3D Host boot status indications =3D=3D
>>=20
>> Any ODM that makes server products has had to deal with the psychologica=
l "dead
>> server effect", where lack of visible progress during boot causes spurio=
us
>> callouts / RMAs.  It's even worse on desktop, especially if server-type
>> hardware is used inside the machine.  We've worked around this a few tim=
es with
>> our "IPL observer" services, and really do need this functionality in Op=
enBMC.
>> The current version we have is both front panel lights and a progress ba=
r on
>> the BMC boot monitor (VGA/HDMI), and this is something we're willing to
>> contribute upstream.
>=20
> Great!  Let's get that merged!

Sounds good!  The files aren't too complex:

https://git.raptorcs.com/git/blackbird-skeleton/tree/pyiplobserver
https://git.raptorcs.com/git/blackbird-skeleton/tree/pyiplledmonitor

Is the skeleton repository the best place for a merge request?

> I do think some others have support for a 7-seg display with the
> postcodes going to it already.  I think this is along those same lines.
> It might just be another back-end for our existing post code daemon to
> replicate them to the VGA and/or blink morse code on an LED.

OK, so this is what we ran into before.  Where is this support in-tree, and=
 do we need to reimplement our system to match what already exists (by exte=
nsion, extending the other vendor code since our observer is more detailed =
in terms of status etc.), or would we be allowed to provide a competing sol=
ution to this other support, letting ODMs pick which one they wanted?

>> =3D=3D IPMI / BMC permissions =3D=3D
>>=20
>> An item that's come up recently is that, at least on our older OpenBMC v=
ersions,
>> there's a complete disconnect between the BMC's shell user database and =
the
>> IPMI user database.  Resetting the BMC root password isn't possible from=
 IPMI
>> on the host, and setting up IPMI doesn't seem possible from the BMC shel=
l.  If
>> IPMI support is something OpenBMC provides alongside Redfish, it needs t=
o be
>> better integrated -- we're dealing with multiple locked-out BMC issues a=
t the
>> moment at various customer sites, and the recovery method is painful at =
best
>> when it should be as simple as an ipmitool command from the host termina=
l.
>=20
> I suspect most of this is a matter of IPMI command support and/or enablin=
g
> those commands to the host IPMI path.  Most of us are fairly untrusting
> of IPMI (and the Host itself), so there hasn't been work to do anything
> here.  As long as whatever you're proposing can be disabled for models
> where we distrust the Host, it seems like these would be accepted as
> well.
>=20
>> If there is interest, I'd suggest we all work on getting some semblance =
of a
>> modern fan control system and the boot status indication framework into
>> upstream OpenBMC.  This would allow Raptor to start upstreaming base sup=
port
>> for RCS product lines without risking severe regressions in user pain po=
ints
>> like noisy fans -- perceived high noise levels are always a great way to=
 kill
>> sales of office products, and as a result the fan control functionality =
is
>> something we're quite sensitive about.  The main problem is that with th=
e
>> existing fan control system's tentacles snaking everywhere including the=
 UI,
>> this will need to be a concerted effort by multiple organizations includ=
ing the
>> maintainers of the UI and the other ODMs currently using the existing fa=
n
>> control functionality.  We're willing to make yet another attempt *if* t=
here's
>> enough buy-in from the various stakeholders to ensure a prompt merge and=
 update
>> of the other components.
>=20
> This would be great.  Hopefully nothing I wrote here was too harsh or
> turned you off.  One piece of advice though...
>=20
> Even if you find that some of the changes you propose are met with some
> resistance, it would be good to get your base system support upstreamed
> and continue to hold your extra sauce off on the side.  I know there
> has been complaints by some owners of Raptor hardware that they cannot
> use upstream code improvements on their own hardware because of the
> forked nature of your code base.  The way forward, to me, is to get
> your hardware configuration upstreamed first and work on these extra
> features separately.  If one of your customers wants to use upstream,
> with the caveat that they lose out on a few super awesome features, they
> can make that decision, but the important thing is that your machine
> doesn't get "left behind".

So this is where we run into an interesting intersection of perceptual issu=
es surrounding POWER, marketing, and resistance to fixing the fan controls =
in particular.

At the end of the day, we *need* reliable fan control in-tree before we'll =
upstream the platform support.  POWER is still, rightly or wrongly, perceiv=
ed as power hungry, inefficient, hot, and noisy.  Even a small percentage o=
f users that load upstream for various fixes, only to have the system fans =
scream at them all the time, will severely damage our brand image.  I'm awa=
re that an older OpenBMC tree is also causing some issues, but the percepti=
on is the fan control issue is more important given the specific headwinds =
surrounding POWER.  I simply don't have access to the resources required to=
 break the deadlock; I've tried to make the case to the key decision makers=
 but so far I've been met with stiff resistance.  This is in no small part =
due to the lack of results from previous attempts to get a workable fan con=
trol solution merged; the cost/benefit just keeps coming up as not somethin=
g we want to throw funding at right now.

I hope this makes some sense, and thank you for the response!
