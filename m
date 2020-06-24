Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE97E2069F0
	for <lists+openbmc@lfdr.de>; Wed, 24 Jun 2020 04:08:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49s64z34PMzDqCT
	for <lists+openbmc@lfdr.de>; Wed, 24 Jun 2020 12:08:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=1Favu4Gm; dkim-atps=neutral
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49s64D6RY5zDqbD
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jun 2020 12:07:54 +1000 (AEST)
Received: by mail-yb1-xb31.google.com with SMTP id k18so226559ybm.13
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jun 2020 19:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nocxEPkjN9OitS3i3+KYjHQihBHMFoTnf+j50SS2lM0=;
 b=1Favu4Gm1gndYGJ3dxvu7lecjtFJK13RWBCDGJYeiMdAk4dWYYJfgVvSHK36GNiQRo
 BVG65KNzzKZs8CPMjxgpJS2WM1wI/zHB+fNODGA/NX6bL0D52XY5bnq0zkxRtF1ghrjd
 EAAsMoU6fJdYPnRa7BviIZRQaSsL9aYBBG1IdPRknV+lgZBguiCvT+x3Glr+SxChHKAU
 jICNUlkzEQurs21w18v4mkC0dUTr67slll/l3xd9CdwJTUwBPPfwGP3U/HniAud81Yn8
 aZi1FOCxX2GRkTLlwWfyf0R/UNQJvPt6EIlrpPyFGklK4PFHpip4qNraBqsaRj97pWpe
 WoLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nocxEPkjN9OitS3i3+KYjHQihBHMFoTnf+j50SS2lM0=;
 b=bSX4ZEqCxtW1ZLFZES1Tkq9+v+fkMgUIuCmpF5wov5zlNaT7wQNLhZ1GruE1/KveCS
 E2UGZ4s5Zngw6M3NCLYG/7niKUASJdcGJedRolj6+mDi+FXMC1dcVyh9kcqw9Jr6SJwn
 TNchig2WSPjuwRbrNr+c9Cc61ycT3jXdcG5mBhRphNi9arQN62tpbev/9LL1TsSBZEVm
 ur+bJU2Gbw2Fy/MWN6KyVm1wR5Lh2p16U0HJl5yS/HW1EiEs4NO7MWSS2CO4YeqjUpbF
 EWvkut17KwkF60IOwQjBA/8C60vXs/V4HLW2rHCuGXQeRAfOKSYy6NUlhpY5wm/Z8Do0
 CptA==
X-Gm-Message-State: AOAM531mOC3Yrcf+y0t2YIWipKmeJd+0H5sK6WDddW3UpXtbVJViB9nR
 GU9iNMPNibxAPceDxy5ylZefHQ3afpBxE33/0P+D5w==
X-Google-Smtp-Source: ABdhPJyt9Sn2lYnOnwEIaKUteL7zv70AMaApGq9oksiq1OvYG5jQ9i7gFsLV8N7ifJKNUFFXatsl8I8QKPq32CctiQw=
X-Received: by 2002:a25:18d5:: with SMTP id 204mr33079344yby.209.1592964470709; 
 Tue, 23 Jun 2020 19:07:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAA_a9xJJn16M2p-wu7-cMsWK3+CEqMTccCg7uhWo1=MMbdxXpw@mail.gmail.com>
 <CACWQX80gd=eAb6PScrvD74S+6ownFEG9rw8ZfCfmrJSMuk7Cug@mail.gmail.com>
 <CAA_a9xJFQiYVoAkPOg_g+DDA+jX9N6VA-mOWusC1YuzYeEennw@mail.gmail.com>
In-Reply-To: <CAA_a9xJFQiYVoAkPOg_g+DDA+jX9N6VA-mOWusC1YuzYeEennw@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 23 Jun 2020 19:07:37 -0700
Message-ID: <CACWQX83s4y27CwpgxORbJ95Nhm=+z+S+-TQdXwSjuFagstzyhA@mail.gmail.com>
Subject: Re: Feedback on Current OpenBMC and Proposing Some Improvements ----
 Difficulties and Issue Examples
To: Alex Qiu <xqiu@google.com>
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 Kais Belgaied <belgaied@google.com>, Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ofer Yehielli <ofery@google.com>,
 Josh Lehan <krellan@google.com>, Richard Hanley <rhanley@google.com>,
 Jason Ling <jasonling@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jun 23, 2020 at 4:47 PM Alex Qiu <xqiu@google.com> wrote:
>
> For example, some of our FRU has way too many temperature sensors from
> hardware design, but we only need the maximum temperature among these
> sensors on one FRU to feed to the PID control loop or health
> reporting. It would be great to aggregate the sensors according to
> individual FRUs. You can see this sensor aggregation feature as a
> simple example in my demo:
> https://github.com/alex310110/bmc-proto-20q2/blob/master/downstream/card_=
example_g.py#L69
>
Too many sensors for what?  Are you overloading dbus?

Margin sensors were something we (note, I say we here, but James did
vastly more work than I did) explicitly did not add, and the argument
I used at the time was threefold.
1. PID control loops can (and in phosphor-pid-control do) use multiple
sensors, and wildcards as inputs to a single PID.  This reduces the
configuration and computation overhead for many-sensored systems down
to what an equivalent "aggregate" sensor would be.
2. If the aggregated data is not put onto dbus (or somewhere else) you
lose all the information.  As an engineer/operator, many users would
ask "which sensor is causing the margins to be so low?" and "Why is
this sensor in the error state?" which would require someone to break
them down again, debug the issue, then reaggregate them.  You could
probably solve this with an interface, but we decided that we'd rather
spend time optimizing the sensor subsystem in other ways (like only
sending temp changes, and batching updates).  Keep in mind, if you're
clever about batching the PropertiesChanged signal on dbus, the
per-sensor cost of unpacking the value is minimized quite a bit, as
the O(1) in the dbus message significantly outweighs the O(N) for the
sensor values.  With that said, I could see if you needed to add this
feature for systems with many, many sensors on a slow processor, but
if it were me, I would focus my efforts on further increasing the
sensor subsystem performance for these cases.  There's a lot of
performance wins that could be had depending on your configuration.
3. If your sensors have different thresholds, that means that they
need to be represented as an integer that is negative when the system
is within margin.  Small negative numbers cause confusion at first
glance, and require a lot more documentation than if all the sensor
values are available, and the end unit (be it webui or control system)
aggregates them by type.  It should be noted, phosphor-pid-control has
a mode where it can treat sensors as a margin against their threshold,
so you can still have this behavior in the PID loops, it's just
aggregated in a less confusing place.

With all of that said, if you still feel like you need aggregated
sensor types, they could certainly be added.

> We also encounter voltage regulator devices requiring current reading
> corrections according to their own properties (duty cycle and
> temperature). This correction is not preferred to perform within
> kernel drivers, and we are suggested to deal with them in user space.
> See "Read Output Current" in
> https://www.maximintegrated.com/en/design/technical-documents/app-notes/6=
/6042.html
> Example in demo:
> https://github.com/alex310110/bmc-proto-20q2/blob/master/device_xam2734.p=
y
>

Openbmc doesn't do this today anywhere that I'm aware of, so this
would be a feature you need to add.  There's a couple of ways you
could slice this.
A. You say that you don't want to do this in a kernel module, but you
don't say why.   Considering this part is a self-contained unit, and
it's in the appnote for the part, getting the kernel driver to do the
calculation for you seems straightforward, and would help many others
outside of openbmc if you did it in the kernel code.  Can you
elaborate on why you're thinking it would be better to do it in
userspace?
B. If you must do it in userspace, I'd expect you'd want to start by
writing a MAX20743 userspace daemon that pulls in both of those
values, and does the calculation, manages thresholds, then posts to
the sensor interface on dbus .  What I'm not following is what about
this you're finding difficult that we can make better.  There are some
simple <200 line examples that you can grab and extend.  How can we
make this easier for those in the future?  Ideally we would have
supported that maxim chip out of the box, but in this case, let's make
it generic enough so that the next person that gets here doesn't have
to edit code, and can simply add it to their configuration.

> >
> > >
> > > Due to having no place for code as control flow around the sensors or=
 data purely generated based on configuration files:
> >
> > I don't really follow this.  There is a lot of code that has quite a
> > bit of control flow in the consumers (like dbus-sensors).  In theory,
> > the configuration files are intended to be there only to specify the
> > things that are different between individual types of "exposes"
> > records.  The intention is that if you have a platform that needs a
> > different control flow than someone else, you would make that control
> > flow configurable through some kind of setting, but there are _tons_
> > of cases where we can assume that all platforms can have the same
> > control flow, and write it as code with no parameters.
>
> I think you are right, and I didn't illustrate my idea well. I'm
> thinking of being able to easily add additional control flow as
> needed, and also making related code/config organized to be as
> adjacent as possible, so developers can view/add/modify related
> code/config fast, without the need to jump among different code
> repositories. Please also see the demo parts above.

Gotcha.  If I can summarize, you didn't like that the code was in 2
separate repos.  I completely agree with you, and at a couple of
conferences, I spitballed the idea of merging all of the
OpenBMC-specific code into a single repo.  This needs more thought,
and a real design doc, but it's something I long intended on trying to
propose, just never had the time.  Maybe you could start with those
two modules, and come up with a way we could organize it better?

>
> >
> > >
> > > When the current configuration format cannot express a hardware topol=
ogy or topology discovery logic, a new schema is added case by case. This n=
ot only causes burden to the configuration files themselves but also the co=
nfiguration file parser. In practice, some code is often preferred to inter=
vene around the hardware topology.
> > Can you give some examples of this?  I'm not really following.  See
> > above, schemas are added where we make the decision that a platform
> > might need one behavior, or another depending on their preference.  If
> > every platform can agree on a single handling of a behavior, or the
> > correct behavior is detectable at runtime, there's no reason for it to
> > be in the configuration files at all.  Your point about the parser is
> > well taken;  I had always intended the majority of the files to be
> > moved into an optimized compile-time data structure so they didn't
> > need to be parsed at startup in most cases.  With that said, the file
> > parsing with the current number of supported config files present is
> > relatively low overhead.  This trick will stop scaling eventually as
> > we support more and more boards, but there should be a no external
> > impact hit to move that code to run at compile time.
>
> Please see this email thread on Configuring devices with I2C MUX:
> https://lists.ozlabs.org/pipermail/openbmc/2020-January/020144.html
>
> We ended up configuring the device tree to help solving this problem,
> but it is still sort of a workaround, and we would be more happy if
> entity-manager can handle this dynamic topology by itself.

Without knowing the details of the system you're working on, I'm not
sure how to help more.  This is certainly a place where the i2c
topology is hard to grok, but to my understanding most of the topology
should've been automatically handled by the code James pointed you to.
Clearly you weren't able to make that work, so there's either a bug,
missing feature, or a configuration error present in that scenario.
In your case, it sounds like you opted for a compile-time config
option, which should work just fine if you don't need the dynamic
behavior of adding/removing components at runtime.  If you'd like to
triage a little, I'm sure there are people that could help you.

>
> >
> > >
> > > It is hard for developers to debug against a certain hardware, as the=
 developer has to filter the log for it based on various condition statemen=
ts.
> >
> > This is a very valid complaint that I've had myself many many times in
> > the past.  I'm assuming you're looking at the dbus logs.  Can you come
> > up with some concrete suggestions on what could be done to make it
> > better?  Better naming of dbus paths?  Better tooling?  If you could
> > do up a design doc, I'm sure there'd be many people willing to help
> > you.
>
> Unfortunately, I don't have a solution for this for now, but only
> demonstrated the possibility in my demo, where you can add debug
> statements per FRU type easily once you find the source file for the
> FRU. If as you said in your previous replies that the component
> organization is intentionally not exposed to the dbus, we would
> probably have difficulties finding these information in the dbus for
> debugging, right?
Yes.  Rarely in working on OpenBMC have I actually needed to know FRU
level logging.  In general, the cases that are more common are "I need
to debug X thing on this card" or "I need to debug all things of class
X".  Very rarely do I need "X, Y, and Z on this card" in a single log
filter.  With that said, that's just how I think.  If you come up with
some concrete solutions, I'm sure many would be able to help you flesh
them out.  Yes, with the current data available, going from log -> FRU
(in that direction) is very difficult.  Go look at the logging code,
what interfaces would you need to be able to build what you want?

>
> >
> > >
> > > It is hard for new developers to ramp up on debugging, because there =
is no symbol for developers to quickly look up and find the code related to=
 one hardware or module to put debug statements.
> >
> > I'm not quite following this.  Were you hoping to have a "symbol" that
> > would represent a FRU?  a specific sensor?  A specific subsystem?  A
> > specific instance (drive 1,2,3 ect) of the previous?  This might be
> > solvable with documentation.  Coming up with a couple use cases like
> > "I want to filter on i2c transactions to a device at address X" and
> > documenting how to do it might be a good start?
> > Today, the dbus logs give you a way to filter on:
> > 1. All messages from a particular daemon.
> > 2. Messages only from a particular dbus path, which allows you to
> > filter on all events from a specific piece of hardware. (see the
> > path_namespace filter)
> > 3. A particular event type, which lets you filter on all events of a
> > certain class.
> > and any combination of the above.  I'm guessing we just need to
> > document this a little better
>
> Apologies that I have little experience debugging with dbus, and this
> statement came straight out of my mind with the question: If I am a
> new developer for this hardware project, how can I quickly locate the
> proper place to intercept the control flow and put debug prints?
>

Slight correction, openbmc is a software project, not a hardware
project.  Because of that, and how configurable it is, it's really
hard to give generic "put your control flow here".  In the case of
sensors, find the sensor you care about, find the control loop you
care about (most of them are relatively small) and add printing code,
then use the Journal to grab the information.  If you're looking to
debug low level kernel info, enable kernel tracing as you would any
other kernel module.  Have you tried reading about the various logging
capabilities dbus and journald have?  Is there a tool you could add to
phosphor-webui that would capture the logs you want over the websocket
dbus connection?  Because that code is running on the users browser,
there's a lot of freedom to do what you want there.

> >
> > >
> > > Unfortunately, debugging hardware issues occupy the life of BMC devel=
opers quite often, then debug codes are sometimes asked to be turned into w=
orkarounds which will stay in the code base. The harder to debug, the even =
harder it is to put up an elegant workaround for hardware issues.
> > >
> > > If the OpenBMC framework does not provide enough flexibility to accom=
modate specialized code for specific requirements, they quickly become down=
stream patches and technical debts, and they cause cost on maintenance as a=
n open source software.
> > >
> > > Issue Examples
> > >
> > > In this section, I will describe issues that we=E2=80=99re facing wit=
h the existing dynamic software stack, and they should all be well handled =
by "Improvements".
> > >
> > > Configuring device registers according to needs
> > >
> > > For the context, related discussions can be found in the mailing list=
 archive =E2=80=9CConfiguring shunt_resistor in hwmon=E2=80=9D. Although we=
 managed to properly adjust the IPMI readouts using scales, we later realiz=
ed that it would still be better to configure it directly in hwmon sysfs. I=
f we configure it in hwmon, we can have the correct reading right from the =
bottom. On the other hand, an implementation using the device tree is proba=
bly against the idea of having the dynamic software stack to configure hard=
ware only when discovered.
> >
> > Contrary to what you said, at one point the dbus-sensors
> > implementations used runtime-compiled device tree overlays to
> > implement their features, using a patch originally written by the
> > raspberry pi team.  For sensors, these worked pretty well, but
> > required out of tree patches that were never merged into the mainline
> > kernel, and were removed because of exactly the problem you identify
> > later with out of tree patches.  If getting this mainlined is
> > something you're interested in pursuing, there are several people that
> > have been down this path, and can likely give you pointers.  Your
> > shunt resistor is a great example of a parameter (or possibly default
> > behavior) that could be added to the ADC sensor implementation without
> > a schema change.  If the shunt_resistor property exists, use that as
> > the primary application of the ScaleFactor instead of doing it in
> > userspace integer math.  That seems like a place where an argument
> > could be made where that could be the always on behavior, as it would
> > give the best result, but we'd have to collect some info on it.
>
> Some folks within my team would be interested in this information, as
> they have been wondering why we didn't use device tree overlay. +Jason
> Ling

Short version of a long answer: To detect a full topology, you need
userspace up to run a lot of code that shouldn't be in the kernel.
Device tree overlays have to be added from inside the kernel (unless
you have the aforementioned patch and can trigger an overlay from
userspace).  Having to reboot the BMC every time the topology changes
is a non-starter.

>
> >
> > >
> > >
> > > Also, hardware engineers came up with requests to configure the volta=
ge regulator outputs, and from my understanding, this is not what hwmon sys=
fs interface intended to do, and we needed that within a very short time pe=
riod. I had to use shell script to configure the device registers by issuin=
g raw I2C commands using i2ctools.
> >
> > I've long thought that we need a "set these i2c registers to these
> > values", or "run this bash script" type in entity manager for this
> > kind of thing for handling things like FPGAs, or configurable hardware
> > that you don't necessarily need or want a full kernel driver for
> > (especially in the prototyping stage).  Unfortunately, these kinds of
> > hacks tended to be easier to do in a custom build with patches against
> > the specific driver, rather than in a configurable way, so nobody
> > really built it out.  Also, doing it in the kernel guarantees better
> > timing, but I still think there's a use case for these.  My initial
> > ideas for configuration options for a "register setter daemon", and a
> > "run this command" daemon are below:
> >
> > {
> > "Address": "$address",
> > "Bus": "$bus",
> > "Register": "0x12,
> > "Value": "0x42",
> > "Name": "Set PCIe Retimer to 42",
> > "Type": "EEPROM"
> > },
> > {
> > "Command": "/usr/bin/echo \"This is the greatest thing ever\"",
> > "Name": "My \"greatest ever\" command"
> > "Type": "Command"
> > }
>
> Putting the register initialization into the kernel driver would have
> two problems: 1) That would be a kernel patch to maintain downstream
> instead; 2) kernel driver may not have the best knowledge on the value
> to configure. For example, both FRU share the same VR device, but one
> is required to set voltage to X, and the other is required to set
> voltage to Y.
1. I don't follow why you go directly downstream.  Why not upstream
the patch to the kernel?  Yeah, sometimes it's difficult, but you get
a lot of great eyes on it, and the next person outside openbmc to hit
this problem has a solution already baked in.
2. The kernel doesn't "need" to know what value to set for a given
set.  It can take that direction from userspace and/or devicetree.
All you have to do is expose the appropriate interface to userspace.

>
> Adding the "command" property in configuration files brings an issue
> that what if we need some 'if' statements (or any control flow only
> expressible by code) around that command.
>
> A daemon on the other side, would have a redundant logic of hardware
> discovery. I have been using this trick actually, but I have to face
> an ironic fact that the daemon written in shell script does a reliable
> job walking through the hardware topology, including distinguishing
> the exact FRU that it should act upon. I believe this is some feature
> that the OpenBMC software stack should take good care of.

Again, the above is not for control flow.  Write your control flow in
code (ideally compiled code, to avoid runtime/boot performance
issues).  The above is intended for temporary, band-aid solutions.
Bash is great... for certain things.  Walking a topology that might be
large, complex, and have complexes that could have hardware errors
present is not one of the things bash excels at.  Also keep in mind
that your bash script walking all topologies is affecting the overall
boot time of OpenBMC.
What you've described is essentially what FruDevice/Entity Manager/
dbus-sensors (and others) does.  FruDevice walks the i2c topology, and
identifies all things, but doesn't take an opinion on whether or not
they're interesting.  Entity manager takes those things, and tries to
match them with runtime configurations.  These might be sensors,
daemons that need launched, or settings that need conveyed to the
kernel.  Then the individual pieces take off with their role.  There
are other examples of other topology walkers, but that one is the most
simple.

>
> Yep, your concern is exactly the case here. Our team doesn't have the
> breath to generate a feature to handle special hardware requirements.
> Some of the patches that we are maintaining right now are heavily
> vendor-specific and can't be upstreamed, either. Due to these
> realities, I'm suggesting to have an infrastructure which can handle
> short-term bursts without causing too much overhead to maintain
> patches.

Personal opinion time: This is outside of OpenBMCs scope to make
downstream management easier for you and your team.  Without knowledge
of what patches you have, and what problems you're facing, it's nearly
impossible to build a solution that would work for you.  With that
said, if you have some ideas and they're actionable, happy to hear
them.

>
> Point taken. And yes, I think it's another case that we don't have
> time to really root cause it. +Peter Lundgren would have more info on
> this.
>
I feel the "not enough time" problem.  Getting a real root cause is
less important than creating a bug publically, and saying "this commit
X caused this bad behavior Y, and if I remove it it goes away".  That
puts the onus on the submitter to find the root cause, and gives the
maintainer good reason to revert it.
