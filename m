Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2C12068A1
	for <lists+openbmc@lfdr.de>; Wed, 24 Jun 2020 01:48:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49s2zN21CPzDqSj
	for <lists+openbmc@lfdr.de>; Wed, 24 Jun 2020 09:48:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::32b;
 helo=mail-ot1-x32b.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=GxPvE6K8; dkim-atps=neutral
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49s2yc0cdFzDqCT
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jun 2020 09:47:51 +1000 (AEST)
Received: by mail-ot1-x32b.google.com with SMTP id t6so192840otk.9
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jun 2020 16:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7gGzsSKMZsLbtNmPSTmtaPbDbkSxIdq9UOee5rdO7ZQ=;
 b=GxPvE6K8T5Vorao+H3ouwpca3gDVSXQq+BFhi4fKbfVm8+GwEZICL7t7LbbpAsn5rT
 bKupWsriY4K/Y060tPwb4ABmme54ZUtxjzh/1NeWW7VZw+6pPiCU/eu7tNrBZHBo6BWg
 qmfXzq4BvZDqQNC4MPKp9iZJZea6a569cfk5nFvIDXkNG06f0LL41N4fLx1Sibg7Ycgb
 GhS2Bmtp8WDVpiaL19vWyBdWt6V+JmxK/AafPRI0eHdduSyz5jdAMSQ4aYT5L+N4RKTd
 UE20ItOCAVwQXYMxOQhlHJ6zQaoWkpsno2h/igD0C/23YybhkINiYKm9fVmrMT9dkSy1
 qy/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7gGzsSKMZsLbtNmPSTmtaPbDbkSxIdq9UOee5rdO7ZQ=;
 b=AB/8tV9GxNHp2QALlW1lC3RkGacSDBgu8gTrLOyFZV0YBPtZsIA0bCRTj5hVEKW156
 NXmeO5ZqG7W/doiiyu3Q7QSsjRebwZWnG+/9M8LnU0H184Jer8le318t6EiKy6jojaQ1
 T/FR185slfzOL7oQrX/6DORK/tGoLAg/8G8+/sGLzGppkJwTLRI7ETM6se4JBYUEsQQV
 tF5Mh4P/jiBFrSBuzEgswmBjAk8779LsgSyE29MuI8Pg6vzUQVUdMBaYHdKmOL2xgrIW
 FlZK2X998PitKHOkOam+wAQa8RAFPuO3T8icdF10W02cOJLlhy0vFEVI0a086B+rc/ej
 azkA==
X-Gm-Message-State: AOAM531doKW3Z4+M6V/eH6oGglOrnPXglGbnLVgl+PrISTVeTxhn12oS
 9WpTo34+mlt0/i2NNm9lAeGXRPHl2hjzt8IsJJziUw==
X-Google-Smtp-Source: ABdhPJwmdNPnufswMtIshCLQI/7nUW3AIkwbkCxh0me5dCQyRTrcom8+yMIJzfF1hvYDDI8gvA7ZpkblWaZzxVnGA3A=
X-Received: by 2002:a9d:4542:: with SMTP id p2mr20381118oti.306.1592956066940; 
 Tue, 23 Jun 2020 16:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAA_a9xJJn16M2p-wu7-cMsWK3+CEqMTccCg7uhWo1=MMbdxXpw@mail.gmail.com>
 <CACWQX80gd=eAb6PScrvD74S+6ownFEG9rw8ZfCfmrJSMuk7Cug@mail.gmail.com>
In-Reply-To: <CACWQX80gd=eAb6PScrvD74S+6ownFEG9rw8ZfCfmrJSMuk7Cug@mail.gmail.com>
From: Alex Qiu <xqiu@google.com>
Date: Tue, 23 Jun 2020 16:47:36 -0700
Message-ID: <CAA_a9xJFQiYVoAkPOg_g+DDA+jX9N6VA-mOWusC1YuzYeEennw@mail.gmail.com>
Subject: Re: Feedback on Current OpenBMC and Proposing Some Improvements ----
 Difficulties and Issue Examples
To: Ed Tanous <ed@tanous.net>, Josh Lehan <krellan@google.com>, 
 Peter Lundgren <peterlundgren@google.com>, Jason Ling <jasonling@google.com>
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
Cc: Kais Belgaied <belgaied@google.com>,
 Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ofer Yehielli <ofery@google.com>,
 Richard Hanley <rhanley@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

-Internal email list
+A couple of folks who might be interested in this topic

Hi Ed,

Thank you for your reply! As a note, I'm working on Google's OpenBMC
closely on a hardware product schedule within Google's organization,
so chances are my experience is heavily biased within my area of work,
and maybe there's knowledge that I'm not aware of. Please excuse me if
I'm ignorant in some areas, and hopefully my colleagues can make up
the communication gap if they wish to follow up, and hopefully my demo
can help on the illustration as intended. With that said, please see
my other replies inlined. Thanks!

- Alex Qiu


On Sun, Jun 21, 2020 at 2:59 PM Ed Tanous <ed@tanous.net> wrote:
>
> Love the feedback.  I want to start off by thanking you for taking the
> right path in finding answers.  You tried the code, found some
> problems, and suggested concrete solutions on how it could be made
> better.  There are many that could take your email as an example and
> run with it, both as a template, and as an actionable change to be
> made.
>
> I will be the first to admit, we didn't document a lot of the intent
> behind entity manager, and clearly from your response below the data
> structures alone weren't enough to convey meaning.  Lets see if we can
> get some of your queries answered.
>
> -Ed
>
> On Thu, Jun 18, 2020 at 2:28 PM Alex Qiu <xqiu@google.com> wrote:
> >
> > (Splitted from main email thread "Feedback on Current OpenBMC and Propo=
sing Some Improvements")
> >
> > Difficulties
> >
> > The current architecture allows different JSON configuration files to b=
e loaded to represent varieties of FRUs and boards, however, the architectu=
re still emphasizes individual sensors internally, and there are no solid c=
oncepts of individual FRUs and entities as a whole object in memory. This d=
ata-driven architecture starts to cause difficulties on the implementation =
when some sensors require specialized treatments according to requirement o=
f hardware platforms.
> >
>
> One important thing that is non obvious when you look at it:  Files in
> EM are meant to be 1:1 with a unit.  Each file is intended to
> represent a composable organization of a physical components that may
> or may not be in the system as a unit.  It could be a baseboard, hot
> swap backplane, or in the cases of things like runBMC modules, might
> be the BMC board itself.  This is intentionally not exposed to the
> rest of the system, (except through a couple targeted association
> interfaces for inventory purposes) under the assumption that
> downstream code shouldn't need to know whether a component is on
> another physical board or not, as it's only dealing with them at
> kernel level, and in the end electrically on the board.  In theory,
> the only thing that really needs to know these mappings are things
> like Redfish, which actually present those associations in a way that
> the user can see (and I will note, that code is a mess and could use
> some thought on how to simplify it).  Clearly you've found a use case
> where you actually need the individual component information
> downstream for organization.  Can you elaborate on what you were
> hoping to do with the data, if you had it available to you on dbus?

For example, some of our FRU has way too many temperature sensors from
hardware design, but we only need the maximum temperature among these
sensors on one FRU to feed to the PID control loop or health
reporting. It would be great to aggregate the sensors according to
individual FRUs. You can see this sensor aggregation feature as a
simple example in my demo:
https://github.com/alex310110/bmc-proto-20q2/blob/master/downstream/card_ex=
ample_g.py#L69

We also encounter voltage regulator devices requiring current reading
corrections according to their own properties (duty cycle and
temperature). This correction is not preferred to perform within
kernel drivers, and we are suggested to deal with them in user space.
See "Read Output Current" in
https://www.maximintegrated.com/en/design/technical-documents/app-notes/6/6=
042.html
Example in demo:
https://github.com/alex310110/bmc-proto-20q2/blob/master/device_xam2734.py

>
> >
> > Due to having no place for code as control flow around the sensors or d=
ata purely generated based on configuration files:
>
> I don't really follow this.  There is a lot of code that has quite a
> bit of control flow in the consumers (like dbus-sensors).  In theory,
> the configuration files are intended to be there only to specify the
> things that are different between individual types of "exposes"
> records.  The intention is that if you have a platform that needs a
> different control flow than someone else, you would make that control
> flow configurable through some kind of setting, but there are _tons_
> of cases where we can assume that all platforms can have the same
> control flow, and write it as code with no parameters.

I think you are right, and I didn't illustrate my idea well. I'm
thinking of being able to easily add additional control flow as
needed, and also making related code/config organized to be as
adjacent as possible, so developers can view/add/modify related
code/config fast, without the need to jump among different code
repositories. Please also see the demo parts above.

>
> >
> > When the current configuration format cannot express a hardware topolog=
y or topology discovery logic, a new schema is added case by case. This not=
 only causes burden to the configuration files themselves but also the conf=
iguration file parser. In practice, some code is often preferred to interve=
ne around the hardware topology.
> Can you give some examples of this?  I'm not really following.  See
> above, schemas are added where we make the decision that a platform
> might need one behavior, or another depending on their preference.  If
> every platform can agree on a single handling of a behavior, or the
> correct behavior is detectable at runtime, there's no reason for it to
> be in the configuration files at all.  Your point about the parser is
> well taken;  I had always intended the majority of the files to be
> moved into an optimized compile-time data structure so they didn't
> need to be parsed at startup in most cases.  With that said, the file
> parsing with the current number of supported config files present is
> relatively low overhead.  This trick will stop scaling eventually as
> we support more and more boards, but there should be a no external
> impact hit to move that code to run at compile time.

Please see this email thread on Configuring devices with I2C MUX:
https://lists.ozlabs.org/pipermail/openbmc/2020-January/020144.html

We ended up configuring the device tree to help solving this problem,
but it is still sort of a workaround, and we would be more happy if
entity-manager can handle this dynamic topology by itself.

>
> >
> > It is hard for developers to debug against a certain hardware, as the d=
eveloper has to filter the log for it based on various condition statements=
.
>
> This is a very valid complaint that I've had myself many many times in
> the past.  I'm assuming you're looking at the dbus logs.  Can you come
> up with some concrete suggestions on what could be done to make it
> better?  Better naming of dbus paths?  Better tooling?  If you could
> do up a design doc, I'm sure there'd be many people willing to help
> you.

Unfortunately, I don't have a solution for this for now, but only
demonstrated the possibility in my demo, where you can add debug
statements per FRU type easily once you find the source file for the
FRU. If as you said in your previous replies that the component
organization is intentionally not exposed to the dbus, we would
probably have difficulties finding these information in the dbus for
debugging, right?

>
> >
> > It is hard for new developers to ramp up on debugging, because there is=
 no symbol for developers to quickly look up and find the code related to o=
ne hardware or module to put debug statements.
>
> I'm not quite following this.  Were you hoping to have a "symbol" that
> would represent a FRU?  a specific sensor?  A specific subsystem?  A
> specific instance (drive 1,2,3 ect) of the previous?  This might be
> solvable with documentation.  Coming up with a couple use cases like
> "I want to filter on i2c transactions to a device at address X" and
> documenting how to do it might be a good start?
> Today, the dbus logs give you a way to filter on:
> 1. All messages from a particular daemon.
> 2. Messages only from a particular dbus path, which allows you to
> filter on all events from a specific piece of hardware. (see the
> path_namespace filter)
> 3. A particular event type, which lets you filter on all events of a
> certain class.
> and any combination of the above.  I'm guessing we just need to
> document this a little better

Apologies that I have little experience debugging with dbus, and this
statement came straight out of my mind with the question: If I am a
new developer for this hardware project, how can I quickly locate the
proper place to intercept the control flow and put debug prints?

>
> >
> > Unfortunately, debugging hardware issues occupy the life of BMC develop=
ers quite often, then debug codes are sometimes asked to be turned into wor=
karounds which will stay in the code base. The harder to debug, the even ha=
rder it is to put up an elegant workaround for hardware issues.
> >
> > If the OpenBMC framework does not provide enough flexibility to accommo=
date specialized code for specific requirements, they quickly become downst=
ream patches and technical debts, and they cause cost on maintenance as an =
open source software.
> >
> > Issue Examples
> >
> > In this section, I will describe issues that we=E2=80=99re facing with =
the existing dynamic software stack, and they should all be well handled by=
 "Improvements".
> >
> > Configuring device registers according to needs
> >
> > For the context, related discussions can be found in the mailing list a=
rchive =E2=80=9CConfiguring shunt_resistor in hwmon=E2=80=9D. Although we m=
anaged to properly adjust the IPMI readouts using scales, we later realized=
 that it would still be better to configure it directly in hwmon sysfs. If =
we configure it in hwmon, we can have the correct reading right from the bo=
ttom. On the other hand, an implementation using the device tree is probabl=
y against the idea of having the dynamic software stack to configure hardwa=
re only when discovered.
>
> Contrary to what you said, at one point the dbus-sensors
> implementations used runtime-compiled device tree overlays to
> implement their features, using a patch originally written by the
> raspberry pi team.  For sensors, these worked pretty well, but
> required out of tree patches that were never merged into the mainline
> kernel, and were removed because of exactly the problem you identify
> later with out of tree patches.  If getting this mainlined is
> something you're interested in pursuing, there are several people that
> have been down this path, and can likely give you pointers.  Your
> shunt resistor is a great example of a parameter (or possibly default
> behavior) that could be added to the ADC sensor implementation without
> a schema change.  If the shunt_resistor property exists, use that as
> the primary application of the ScaleFactor instead of doing it in
> userspace integer math.  That seems like a place where an argument
> could be made where that could be the always on behavior, as it would
> give the best result, but we'd have to collect some info on it.

Some folks within my team would be interested in this information, as
they have been wondering why we didn't use device tree overlay. +Jason
Ling

>
> >
> >
> > Also, hardware engineers came up with requests to configure the voltage=
 regulator outputs, and from my understanding, this is not what hwmon sysfs=
 interface intended to do, and we needed that within a very short time peri=
od. I had to use shell script to configure the device registers by issuing =
raw I2C commands using i2ctools.
>
> I've long thought that we need a "set these i2c registers to these
> values", or "run this bash script" type in entity manager for this
> kind of thing for handling things like FPGAs, or configurable hardware
> that you don't necessarily need or want a full kernel driver for
> (especially in the prototyping stage).  Unfortunately, these kinds of
> hacks tended to be easier to do in a custom build with patches against
> the specific driver, rather than in a configurable way, so nobody
> really built it out.  Also, doing it in the kernel guarantees better
> timing, but I still think there's a use case for these.  My initial
> ideas for configuration options for a "register setter daemon", and a
> "run this command" daemon are below:
>
> {
> "Address": "$address",
> "Bus": "$bus",
> "Register": "0x12,
> "Value": "0x42",
> "Name": "Set PCIe Retimer to 42",
> "Type": "EEPROM"
> },
> {
> "Command": "/usr/bin/echo \"This is the greatest thing ever\"",
> "Name": "My \"greatest ever\" command"
> "Type": "Command"
> }

Putting the register initialization into the kernel driver would have
two problems: 1) That would be a kernel patch to maintain downstream
instead; 2) kernel driver may not have the best knowledge on the value
to configure. For example, both FRU share the same VR device, but one
is required to set voltage to X, and the other is required to set
voltage to Y.

Adding the "command" property in configuration files brings an issue
that what if we need some 'if' statements (or any control flow only
expressible by code) around that command.

A daemon on the other side, would have a redundant logic of hardware
discovery. I have been using this trick actually, but I have to face
an ironic fact that the daemon written in shell script does a reliable
job walking through the hardware topology, including distinguishing
the exact FRU that it should act upon. I believe this is some feature
that the OpenBMC software stack should take good care of.

> >
> >
> > All these requirements ended up in shell scripts run as standalone serv=
ices aside from OpenBMC applications, which had their own hardware topology=
 discovery logic inside them. This may be redundant to what we do in the dy=
namic software stack.
> >
> > Handling special requirements and logics
> >
> > As our hardware program progresses, we are maintaining more and more pa=
tches in Yocto to apply upon entity-manager and dbus-sensors.
> Have all of these patches been submitted to
> entity-manager/dbus-sensors?  If they're not making breaking changes,
> and you've tested them heavily, I'm not sure why this would be a
> problem.  If you're fixing issues that were caused by a change, file
> the bugs and we as a community can get the patches reverted until we
> have a patch that works for all.
> With that said, I understand the concern.  Hardware never waits for
> firmware, and sometimes downstream patches are a necessary evil to get
> a platform launched.  The hope is that after you're through crunch
> time, you go back and simplify/cleanup the patches, and submit them
> for review, so others won't have to go through the same pain in the
> future.  I realize I'm being idealistic here, but downstream patches
> and how to handle upstreaming really needs to be handled within your
> organization.  Having done it before, I do have opinions on how to
> make "downstream" easier to handle as a project, but that's a much
> longer discussion.  If you make the patches available, other people
> might even upstream them for you (as has happened to me personally
> many times).

Yep, your concern is exactly the case here. Our team doesn't have the
breath to generate a feature to handle special hardware requirements.
Some of the patches that we are maintaining right now are heavily
vendor-specific and can't be upstreamed, either. Due to these
realities, I'm suggesting to have an infrastructure which can handle
short-term bursts without causing too much overhead to maintain
patches.

+Josh Lehan and +Peter Lundgren may have more information on this.

>
> >
> >
> > We had to replace some code logic due to various reasons, for example, =
we found the existing 8-bit / 16-bit addressable EEPROM detection logic is =
not stable enough, and we were left with 8-bit addressable EEPROMs with the=
ir content corrupted in the first byte.
> (not knowing the details here, I risk making a mistake, but) This
> sounds like a bad case of the above, where someone intended a change
> to apply to everyone, under the assumption that it would have no
> effect on 8 bit eeproms.  Clearly this isn't the case, and we either
> need to find the bug, revert it, or make it configurable per platform.
> Report the bug, point to the commit where it occurred, and the
> maintainer and community can make a call on the best way to proceed.
> Unfortunately, bugs happen.  The best way to prevent them is to be
> proactive, and help in testing the patches on your system before they
> hit mainline.

Point taken. And yes, I think it's another case that we don't have
time to really root cause it. +Peter Lundgren would have more info on
this.

>
> -Ed
