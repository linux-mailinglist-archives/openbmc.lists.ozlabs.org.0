Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 772E1369807
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 19:11:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRgnK1lrfz302S
	for <lists+openbmc@lfdr.de>; Sat, 24 Apr 2021 03:11:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=SKZf/PCs;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Ofn1GNhn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=SKZf/PCs; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Ofn1GNhn; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRgn12c4Bz2xfd
 for <openbmc@lists.ozlabs.org>; Sat, 24 Apr 2021 03:11:32 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 226261528;
 Fri, 23 Apr 2021 13:11:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 23 Apr 2021 13:11:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=JCwUf4fj2Npnf7k4V05h3yWwOta
 pokExKAAN+U+KZgk=; b=SKZf/PCsCV44vPt14cxGOB621TeapZEH2OuR4Bx4+ZV
 ep55hKUYxnbvIBLIwwKc0wvO0ecHKC/MZ49PJZcO/D8oQ/D7d6OhNlFed2h5tS8O
 QdHVScCVLmqMzI5m2kbld3AdgK2DiU/62YO3Tpr7gnpUB5+KSsbSF8osHEeob50Y
 ucWsurkM97VHb5pp3I/fjerJXk+8hd9SszAvZK+81xG0qGiqOOgtCTQXbVk12IYc
 f0j5zk6rEHjPrubSFTJlXBpJTmfpaHqXo0mJUBxaNF3yLTBIL/34Tc5B0JmmIGtm
 wMWqNL4XJi4tj1bym9DEkrj8I9WzliE30HxctTSSXzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=JCwUf4
 fj2Npnf7k4V05h3yWwOtapokExKAAN+U+KZgk=; b=Ofn1GNhnODp79EwFUZR7Pf
 Bi3JRaw/6aRsae6sQfxtOhjKJiVTStOpVRNqsWH+fXvVC5pB+YRl5rTNtqxr7Ia0
 3WGV8kuVoAA7wnpY7uubti2axcuyDzAIwQ1CiZgYUxQcsoyxTaaqixKcY2jI5WIZ
 dTQP6KKsWomEK+VX7XR6N647r6EghDxXULZwBZ10UFzvQsI/9kia/MTJVe6g7CKc
 lpgmM4YRu82jwmY8xTsrX0tN1HQq4+DfznbBO6CtNG55VR1prJSJSRsVCxuQltr1
 E2XS6QMauN4EJW5n/SdP01rWQL3fpEDesRSRzv+6xRS2CuoXOCQN8C5pIjW6vevA
 ==
X-ME-Sender: <xms:v_-CYFT9VYNNPYMWBnAAdeNZc2z3pM5iUkFcpr3vc0q7FsxZJacR3g>
 <xme:v_-CYOvVG_cOzaFrUyxwkx63vIHt7TqriTdwgNYMudi1sVhG3qUQ1GBWhVJ3ZoBps
 -Kn-juc22R-3kQQ2s8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdduvddguddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeeludefgfejveffheehhedtfeel
 vedufeeufeetleehkeevtdelveeljefhheefieenucffohhmrghinhepohhpvghntghomh
 hpuhhtvgdrohhrghdpkhgvrhhnvghlrdhorhhgnecukfhppeejiedrvdehtddrkeegrddv
 feeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepph
 grthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:v_-CYHss1Ngb_toaFCJkII_7_MMXveRdav3KI0Ov_pYwJDxoIM2l3A>
 <xmx:v_-CYExfXF9rfV39zvB8EvrC8IpQgHGmcSvbvyGLTKsfjlf9fwCQuQ>
 <xmx:v_-CYNjkAWmNY1qTTI29aL-e1Dhmf-PKj5eq64qNX9dJUiv7GHqFaQ>
 <xmx:wP-CYB6mD-YQwLdh_EAYLlssJuOMJbn43pxXR4e-SXTjt6huMtqYeQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5ED0C1080066;
 Fri, 23 Apr 2021 13:11:27 -0400 (EDT)
Date: Fri, 23 Apr 2021 12:11:26 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Timothy Pearson <tpearson@raptorengineering.com>
Subject: Re: OpenBMC on RCS platforms
Message-ID: <YIL/vssl4BAocl4M@heinlein>
References: <1381833945.17566380.1619166988825.JavaMail.zimbra@raptorengineeringinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="X5mWJf0ha6jyVRDZ"
Content-Disposition: inline
In-Reply-To: <1381833945.17566380.1619166988825.JavaMail.zimbra@raptorengineeringinc.com>
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


--X5mWJf0ha6jyVRDZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 23, 2021 at 09:30:00AM -0500, Timothy Pearson wrote:
> All,
>=20
> I'm reaching out after some internal discussion on how we can better inte=
grate our platforms with the OpenBMC project.  As many of you may know, we =
have been using OpenBMC in our lineup of OpenPOWER-based server and desktop=
 products, with a number of custom patches on top to better serve our targe=
t markets.

Hi Timothy,

Good to hear from your team again and hope there is some ways we can
work together on solving some of these issues.

> Roughly speaking, we see issues in OpenBMC in 5 main areas:

We might want to fork this into 5 different discussion threads and/or
design documents, but let's see how this goes...

> =3D=3D Fan control =3D=3D
>=20
> To be perfectly frank, OpenBMC's current fan control subsystem is a techn=
ical=20
> embarrassment, and not up to the high quality seen elsewhere in the proje=
ct. =20
> Worse, this multi-daemon DBUS-interconnected Rube Goldberg contraption ha=
s=20
> somehow managed to persist over the past 4+ years, likely because it reac=
hed
> a complexity level where it is both tightly integrated with the rest of t=
he=20
> OpenBMC system and extremely difficult to understand, therefore it is=20
> equally difficult to replace.

This is, to me, a pretty unfair assessment of the situation, but I hear
you that the code is likely not very usable outside of datacenter use-cases.
Certainly there is some work that can be done to improve that and I
think we'd be receptive to have partners on it.  The vast majority of
developers on the project *are* working on datacenter use-cases though,
so I don't know if there is anyone actively taking up the mantle on
this.  This could be a good area of expertise and contribution from your
team (I personally don't really know enough of where to start at making
a desktop-friendly fan control algorithm).

I'm not sure what you mean by "this multi-daemon DBUS-interconnected Rube
Goldberg contraption" though.  There are really 3 dbus interfaces around
Fan control:
    - xyz.openbmc_project.Sensor.Value
    - xyz.openbmc_project.Control.FanPwm
    - xyz.openbmc_project.Control.FanSpeed

I don't like that we ended up with FanPwm and FanSpeed, but the fact is
that there are two different hardware models for controlling fans and
the people working with PWM-based fans didn't want to put in the effort
to control them with target speeds.  (I think there was an argument that
*their* fan control algorithm experts liked %-of-PWM as a calibration,
and weren't able to come to consensus otherwise)

I don't know what you mean by Rube Goldberg here or how to make the
sitation any better.  All sensors are read by sensor daemons using
common APIs like Linux HWMon and there is a similar "set the fan speed in
hardware" daemon.  Perhaps you could eliminate the Control.Fan*
interfaces (and merge them into a fan control daemon directly) but there
were some people who wanted to be able to manually control fan speeds in
some scenarios anyhow.  Anyhow, I'm not really seeing a lot of
simplification that could even be done, but certainly not undue
excessive mechanisations that would classify as "Rube Goldberg".

There is a xyz.openbmc_project.Control.FanRedundancy interface, but I
suspect that is used outside the use cases you intend anyhow and really
it is optional to fan control.  Similarly, anything under Inventory is
just that... Inventory; it is not critical to fan control.

> Furthering the lack of progress is the fact that it is mostly "working" f=
or
> datacenter applications, so there may be a "don't touch what isn't broken"
> mentality in play. =20

As I hinted at above, I think it is a lack of necessity and not a fear
of breaking.  In general, as a community we should not be afraid of
change.  We have plenty of test cases to qualify code that is changing
and if there isn't test cases for a functional area then it is fair game
to change without worry, in my opinion.

> From a technical perspective, it is indirected to a sufficient level as to
> be nearly incomprehensible to most people, with the source spread across
> multiple different projects and repositories, yet somehow it remains=20
> rigid / fragile enough to not support basic features like runtime (or even
> post-compile) fan configuration for a given server.

There are two different fan control implementations presently:
    - phosphor-pid-control (swampd)
    - phosphor-fan-presence (phosphor-fan-control)

Which of these are you having issue with?  They are intended to serve
drastically different purposes.

I don't think anyone outside of IBM uses phosphor-fan-control.  It seems
to be explicitly designed for their systems with their own requirements.
Unless they speak up, I don't know how we intend anyone else to use this
code and it probably should be renamed 'ibm-fan-control'.

> What we need is a much simpler, more robust fan control daemon.  Ideally =
this would be one self-contained process, not multiple interconnected proce=
sses where a single failure causes the entire system to go into safe mode.
>=20
> Our requirements:
> 1.) True PID control with tunable constants.  Trying to do things with PW=
M/temp maps alone may have made sense in the resource-constrained environme=
nts common in the 1970s, but it makes no sense on modern, powerful BMC sili=
con with hard floating point instructions.  Even the stock fan daemon imple=
ments a sort of bespoke integrator-by-another-name, but without the P and D=
 components it does a terrible job outside of a constant-temperature datace=
nter environment.

Isn't phosphor-pid-control this already?

> 2.) Tunable PID constants, tunable temperature thresholds, tunable min/ma=
x fan speeds, and arbitrary linkage between temp inputs (zones) and fan out=
puts (also zoned).
> 3.) Configurable zones -- both temperature and PWMs, as well as installed=
 / not installed fans and temperature sensors.

I think these two features are the part that are more interesting to
non-datacenter use cases and so nobody has put effort into it.  As much
as you seem to dislike dbus mechanization, this sounds like we would
need a few interfaces defined for these so that Redfish has something to
poke at. =20

I do know some BIOS vendors provide this for desktops already.  Is there
anything at an IPMI level that could facilitate the hand-off of this?

> 4.) Configurable failure behavior.  A single failed or uninstalled chassi=
s fan should NOT cause the entire platform to go into failsafe mode!

phosphor-fan-presence does provide some of this, but again, I feel like
it is tuned to IBM's needs.  It appears that phosphor-pid-control has
some amount of implementation of Control.FanRedundancy that I mentioned
earlier.  Are you sure that phosphor-pid-control causes the system to go
into fail-safe mode from a single fan failure though?  I've not heard
this.

> 5.) A decent GUI to configure all of this, and the ability to export / im=
port the settings.

Sure...

> To be fair, we've only been able to implement 1, 2, 3, and 4 above at
> compile time -- we don't have the runtime configuration options due to the
> way the fan systems work in OpenBMC right now, and the sheer amount of=20
> work needed to overhaul the GUI in the out-of-tree situation we remain
> stuck in.  With all that said, however, we point out that our competition,
> especially on x86 platforms, has all of these features and more, all neat=
ly
> contained in a nice user-friendly point+click GUI.  OpenBMC should be abl=
e=20
> to easily match or exceed that functionality, but for some reason it seems
> stuck in datacenter-only mode with archaic hardcoded tables and constants.

So, if you've done 1-4, are there any commits in Gerrit?  Which fan
control daemon were they done against?

There is a certain air to what you wrote that rubs me the wrong way.
We're not a product that you've paid for here to do what you, the
customer, is asking of us.  This is an open source community and one
that most of us are paid to work on by our employer.  We don't do work
to make you happy, but do work because our bosses are asking for certain
features out of us.  As I said above, almost everyone here is working on
"datacenter-only systems", so why would anyone else invest in this use
case?

This is *your* business model.  We'd certainly love to have contributions
=66rom your team and most of us would even spend some of our time to help=
=20
you in your efforts.  But, if you want this, as they often say:
                    "Patches Welcome!"

I do see some code from early 2020 from you against phosphor-hwmon and
phosphor-fan-presence.  All of the phosphor-hwmon commits failed CI test
so nobody every looked at them.  All of the phosphor-fan-presence commits
received timely feedback, to which you never responded, and seemed to be
missing an updated CCLA from Raptor?  Is there something we should have
done as a community to keep this work going?

> =3D=3D Local firmware updates =3D=3D
>=20
> This is right behind fan control in terms of cost and PR damage for us vs=
=2E competing platforms.  While OpenBMC's firmware update support is very w=
ell tuned for datacenter operations (we use a simple SSH + pflash method on=
 our large clusters, for example) it's absolutely terrible for desktop and =
workstation applications where a second PC is not guaranteed to be availabl=
e, and where wired Ethernet even exists DHCP is either non-existent or prov=
ided by a consumer cable box.  Some method of flashing -- and recovering --=
 the BMC and host firmware right from the local machine is badly needed, es=
pecially for the WiFi-only environments we're starting to see more of in th=
e wild.  Ideally this would be a command line tool / library such that we c=
an integrate it with our bootloader or a GUI as desired.

This sounds to me pretty easily obtainable and what I have in mind is
actually a valid data center use case for many of us.  When all else
fails, you should be able to use a USB key to update the system
(assuming the image you're updating with is trusted for whatever your
system determines is trust-worthy).  I'm pretty sure our OCP systems can
be updated with a magic combination of a USB-key and an OCP debug
card(*).  I don't think that is currently implemented on openbmc/openbmc,
but it is on our list of pending features.

For your specific users, the OCP debug card is probably not a good
requirement, but you could likely automate the update whenever a USB-key
plus text file is added?  (I'm just brainstorming how you'd know to kick
it off).  The current software update code probably isn't too far off
=66rom being able to facilitate this for you.

https://www.opencompute.org/documents/facebook-ocp-debug-card-with-lcd-spec=
_v1p0

> =3D=3D BMC boot time =3D=3D
>=20
> This is self explanatory.  Other vendors' solutions allow the host to be =
powered on within seconds of power application from the wall, and even our =
own Kestrel soft BMC allows the host to begin booting less than 10 seconds =
after power is applied.  Several *minutes* for OpenBMC to reach a point whe=
re it can even start to boot the host is a major issue outside of datacente=
r applications.

Some of this is, to me, an artifact of the Power architecture and not an
artifact of OpenBMC explicitly.  On x86 systems we have a little code in
u-boot that wiggles a GPIO and gets the Host power sequence going while
the BMC is booting up.  This overlaps quite a bit of the memory testing
of the Host with the BMC boot time.  The "well-known proprietary BMC"
also does this same trick.

Power requires the BMC to be up in order to serve out the virtual PNOR,
=66rom my recollection.  It seems like this could be solved in other ways,
such as a SPI-mux on a physical SPI-NOR so that the BMC can take the NOR
at specific times during update but otherwise it is given to the host
CPUs.  This is exactly what we do on x86 systems.

Having said all of that, there is certainly some performance
improvements that can be done, but nobody has taken up the torch on it.
A big low-hanging fruit in my mind is the file system compression being
xz or gzip is very computationally intensive.  I did some work, with
Nick Terrell, to switch to zstd on our systems for both the kernel
initramfs and UBI and saw significant boot time improvements.  The
upstream enablement for this appears to have landed as of v5.9 so we
could certainly start enabling it here now.

https://lore.kernel.org/linux-kbuild/20200730190841.2071656-7-nickrterrell@=
gmail.com/

> =3D=3D Host boot status indications =3D=3D
>=20
> Any ODM that makes server products has had to deal with the psychological=
 "dead server effect", where lack of visible progress during boot causes sp=
urious callouts / RMAs.  It's even worse on desktop, especially if server-t=
ype hardware is used inside the machine.  We've worked around this a few ti=
mes with our "IPL observer" services, and really do need this functionality=
 in OpenBMC.  The current version we have is both front panel lights and a =
progress bar on the BMC boot monitor (VGA/HDMI), and this is something we'r=
e willing to contribute upstream.

Great!  Let's get that merged!

I do think some others have support for a 7-seg display with the
postcodes going to it already.  I think this is along those same lines.
It might just be another back-end for our existing post code daemon to
replicate them to the VGA and/or blink morse code on an LED.

> =3D=3D IPMI / BMC permissions =3D=3D
>=20
> An item that's come up recently is that, at least on our older OpenBMC ve=
rsions, there's a complete disconnect between the BMC's shell user database=
 and the IPMI user database.  Resetting the BMC root password isn't possibl=
e from IPMI on the host, and setting up IPMI doesn't seem possible from the=
 BMC shell.  If IPMI support is something OpenBMC provides alongside Redfis=
h, it needs to be better integrated -- we're dealing with multiple locked-o=
ut BMC issues at the moment at various customer sites, and the recovery met=
hod is painful at best when it should be as simple as an ipmitool command f=
rom the host terminal.

I suspect most of this is a matter of IPMI command support and/or enabling
those commands to the host IPMI path.  Most of us are fairly untrusting
of IPMI (and the Host itself), so there hasn't been work to do anything
here.  As long as whatever you're proposing can be disabled for models
where we distrust the Host, it seems like these would be accepted as
well.

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

This would be great.  Hopefully nothing I wrote here was too harsh or
turned you off.  One piece of advice though...

Even if you find that some of the changes you propose are met with some
resistance, it would be good to get your base system support upstreamed
and continue to hold your extra sauce off on the side.  I know there
has been complaints by some owners of Raptor hardware that they cannot
use upstream code improvements on their own hardware because of the
forked nature of your code base.  The way forward, to me, is to get
your hardware configuration upstreamed first and work on these extra
features separately.  If one of your customers wants to use upstream,
with the caveat that they lose out on a few super awesome features, they
can make that decision, but the important thing is that your machine
doesn't get "left behind".

--=20
Patrick Williams

--X5mWJf0ha6jyVRDZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmCC/7wACgkQqwNHzC0A
wRm6hQ/8CBTllAUaBYE4s32FdVBNpXI2DHxX5NxdolqgzDu70NBn06292HPr+8Jk
E5oCgjLpM+tCr/I2F+q1oO9zIO7Iv5HJdfOoS/+diZMFx+JhM6QVufTYAT8tZSjj
oXgxvPDPQx9XmgRwYT4ci2YJkJRbtfZzrXzoItX4cEgutUovfaxV0QtEp2jqS/JK
S5IhMXtakd3sntmPvU3XFumj3LtaZ/j1fZ+buwiRYCY3KGs3AET7dU8V1wISgf0B
EGZ0WYtWcCUC/17zWNhxbU5W1ZdcJTeSMcxu/GRREhq/gHrCKHOisB0J2rjptVIt
PBd9vxgYrxlWqRUt37VmtHKZ3EHl2+FtTBrup66EJu2D6YTViqkFebBY6tkiwbXd
86zm3eDUfIgvSfGnyQBr5M+7HduqmCG4Z2zIa6w50vxfZ6JVmcPUHSBrDUW2cW17
qDld0+Z6Ou21Kk0gq1wOVO6q2idEO4/1kVN/cfeeEF7es3+hdSRmv6XzIDrcyz9f
QSvsa5RrTK0xi9V6buYKKGBiqT2/EPlTS+YlUUX28hU7tDqJSMSJLMGEBN53vjFr
zocWOmAahgPNSgT1PLpLOl3tiBSh4tC5MGXQr1js4NgL1rqDux7zxig60Y2HyQaG
3J2gKWJpQRzynAxTHqsy1+NQStNonsqhrjiB1fS2t+tSDFseBvU=
=v8wG
-----END PGP SIGNATURE-----

--X5mWJf0ha6jyVRDZ--
