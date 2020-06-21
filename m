Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4250B202D4C
	for <lists+openbmc@lfdr.de>; Mon, 22 Jun 2020 00:00:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49qmgQ6kvDzDqVW
	for <lists+openbmc@lfdr.de>; Mon, 22 Jun 2020 08:00:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b41; helo=mail-yb1-xb41.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=UE8L+Hmh; dkim-atps=neutral
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49qmfd27x0zDqVL
 for <openbmc@lists.ozlabs.org>; Mon, 22 Jun 2020 07:59:34 +1000 (AEST)
Received: by mail-yb1-xb41.google.com with SMTP id n123so8091053ybf.11
 for <openbmc@lists.ozlabs.org>; Sun, 21 Jun 2020 14:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BW8VdjY3y/i6Yx1InETYp7siDJP1FyPdv9DHZ0rK6K4=;
 b=UE8L+Hmh2gNsqnrwCy+aELZTQMJx2qu+/QUZatC5n57sgEskUNw9EYYffQ9+q2F64P
 +lOPKefrymWyEE61Di27/evyPfNQVn/K94TMN13cjqJ7lNrhDUhr3isIf9dBcmQCsdSG
 B0s0N5tKjikdcZ5JxtDHwp5HDymJfuSe75GwoDPp0FumwNIFmgaen6Fa2jnKMjb8c91s
 x+KduDbkCVMjeugf4DF+dDGDLYhvw4cnLLmRhNbNJSvGU390qbZ35TcJotmNNh53y0sW
 l+i+2sV4XhyMixOd7nePaWOWxlRC+4xJWG7NWlCFgCNr6HLH+rBER0ElfH2jLYNOcftu
 mnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BW8VdjY3y/i6Yx1InETYp7siDJP1FyPdv9DHZ0rK6K4=;
 b=iXrBLk05eFe+cVJulppPHwoCcwiL6oianjioZ50reCFSDjM//9ese3kumAIvOJLKi4
 3iU/OLbZfWOgasmuWUl5tqU0nYUycjXHqVOCk+AL0WYV5ZyRwKVmp47BnFw+TM/au2Gr
 kV1gMdibrdcEJIa4vuZesFDxr9N/oDPrQ0krt2UrtgznGIdhwS+9gHI5AVVTN4dBrowd
 /ngHZ5YaOOcIYmR/t/qr6jKdEDHSVLK6fnZrSmU+oBDSpK4kynkV7/sV1iwyngkCMiYC
 YAmrHQdlyl0rm9AUk1A+b3v8X8FKV5PDAF678P+7MfK9OKWrbKHt+/hlf7Zple5d7rZE
 CwZg==
X-Gm-Message-State: AOAM533Fjz/P/oZf2X8VOlo7Bki1Ks0+DE+TtFX5vfP2fTcIkEm0FsIf
 ja/imSQE0ClwmdQQyV4OSMQt2vTw8AH015OdEQWcdw==
X-Google-Smtp-Source: ABdhPJyjAEEg8FVjsR0JsuF4Jw5Xh2U/hYlG+WiJsbMCXfTTGtyZnPvQT9HwM3N39NI+ra1mWqQWZSTE5zbkZXj2bIY=
X-Received: by 2002:a25:aa44:: with SMTP id s62mr21144259ybi.480.1592776770714; 
 Sun, 21 Jun 2020 14:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAA_a9xJJn16M2p-wu7-cMsWK3+CEqMTccCg7uhWo1=MMbdxXpw@mail.gmail.com>
In-Reply-To: <CAA_a9xJJn16M2p-wu7-cMsWK3+CEqMTccCg7uhWo1=MMbdxXpw@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Sun, 21 Jun 2020 14:59:18 -0700
Message-ID: <CACWQX80gd=eAb6PScrvD74S+6ownFEG9rw8ZfCfmrJSMuk7Cug@mail.gmail.com>
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
Cc: gBMC Discussions <gbmc-discuss@google.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Love the feedback.  I want to start off by thanking you for taking the
right path in finding answers.  You tried the code, found some
problems, and suggested concrete solutions on how it could be made
better.  There are many that could take your email as an example and
run with it, both as a template, and as an actionable change to be
made.

I will be the first to admit, we didn't document a lot of the intent
behind entity manager, and clearly from your response below the data
structures alone weren't enough to convey meaning.  Lets see if we can
get some of your queries answered.

-Ed

On Thu, Jun 18, 2020 at 2:28 PM Alex Qiu <xqiu@google.com> wrote:
>
> (Splitted from main email thread "Feedback on Current OpenBMC and Proposi=
ng Some Improvements")
>
> Difficulties
>
> The current architecture allows different JSON configuration files to be =
loaded to represent varieties of FRUs and boards, however, the architecture=
 still emphasizes individual sensors internally, and there are no solid con=
cepts of individual FRUs and entities as a whole object in memory. This dat=
a-driven architecture starts to cause difficulties on the implementation wh=
en some sensors require specialized treatments according to requirement of =
hardware platforms.
>

One important thing that is non obvious when you look at it:  Files in
EM are meant to be 1:1 with a unit.  Each file is intended to
represent a composable organization of a physical components that may
or may not be in the system as a unit.  It could be a baseboard, hot
swap backplane, or in the cases of things like runBMC modules, might
be the BMC board itself.  This is intentionally not exposed to the
rest of the system, (except through a couple targeted association
interfaces for inventory purposes) under the assumption that
downstream code shouldn't need to know whether a component is on
another physical board or not, as it's only dealing with them at
kernel level, and in the end electrically on the board.  In theory,
the only thing that really needs to know these mappings are things
like Redfish, which actually present those associations in a way that
the user can see (and I will note, that code is a mess and could use
some thought on how to simplify it).  Clearly you've found a use case
where you actually need the individual component information
downstream for organization.  Can you elaborate on what you were
hoping to do with the data, if you had it available to you on dbus?

>
> Due to having no place for code as control flow around the sensors or dat=
a purely generated based on configuration files:

I don't really follow this.  There is a lot of code that has quite a
bit of control flow in the consumers (like dbus-sensors).  In theory,
the configuration files are intended to be there only to specify the
things that are different between individual types of "exposes"
records.  The intention is that if you have a platform that needs a
different control flow than someone else, you would make that control
flow configurable through some kind of setting, but there are _tons_
of cases where we can assume that all platforms can have the same
control flow, and write it as code with no parameters.

>
> When the current configuration format cannot express a hardware topology =
or topology discovery logic, a new schema is added case by case. This not o=
nly causes burden to the configuration files themselves but also the config=
uration file parser. In practice, some code is often preferred to intervene=
 around the hardware topology.
Can you give some examples of this?  I'm not really following.  See
above, schemas are added where we make the decision that a platform
might need one behavior, or another depending on their preference.  If
every platform can agree on a single handling of a behavior, or the
correct behavior is detectable at runtime, there's no reason for it to
be in the configuration files at all.  Your point about the parser is
well taken;  I had always intended the majority of the files to be
moved into an optimized compile-time data structure so they didn't
need to be parsed at startup in most cases.  With that said, the file
parsing with the current number of supported config files present is
relatively low overhead.  This trick will stop scaling eventually as
we support more and more boards, but there should be a no external
impact hit to move that code to run at compile time.

>
> It is hard for developers to debug against a certain hardware, as the dev=
eloper has to filter the log for it based on various condition statements.

This is a very valid complaint that I've had myself many many times in
the past.  I'm assuming you're looking at the dbus logs.  Can you come
up with some concrete suggestions on what could be done to make it
better?  Better naming of dbus paths?  Better tooling?  If you could
do up a design doc, I'm sure there'd be many people willing to help
you.

>
> It is hard for new developers to ramp up on debugging, because there is n=
o symbol for developers to quickly look up and find the code related to one=
 hardware or module to put debug statements.

I'm not quite following this.  Were you hoping to have a "symbol" that
would represent a FRU?  a specific sensor?  A specific subsystem?  A
specific instance (drive 1,2,3 ect) of the previous?  This might be
solvable with documentation.  Coming up with a couple use cases like
"I want to filter on i2c transactions to a device at address X" and
documenting how to do it might be a good start?
Today, the dbus logs give you a way to filter on:
1. All messages from a particular daemon.
2. Messages only from a particular dbus path, which allows you to
filter on all events from a specific piece of hardware. (see the
path_namespace filter)
3. A particular event type, which lets you filter on all events of a
certain class.
and any combination of the above.  I'm guessing we just need to
document this a little better

>
> Unfortunately, debugging hardware issues occupy the life of BMC developer=
s quite often, then debug codes are sometimes asked to be turned into worka=
rounds which will stay in the code base. The harder to debug, the even hard=
er it is to put up an elegant workaround for hardware issues.
>
> If the OpenBMC framework does not provide enough flexibility to accommoda=
te specialized code for specific requirements, they quickly become downstre=
am patches and technical debts, and they cause cost on maintenance as an op=
en source software.
>
> Issue Examples
>
> In this section, I will describe issues that we=E2=80=99re facing with th=
e existing dynamic software stack, and they should all be well handled by "=
Improvements".
>
> Configuring device registers according to needs
>
> For the context, related discussions can be found in the mailing list arc=
hive =E2=80=9CConfiguring shunt_resistor in hwmon=E2=80=9D. Although we man=
aged to properly adjust the IPMI readouts using scales, we later realized t=
hat it would still be better to configure it directly in hwmon sysfs. If we=
 configure it in hwmon, we can have the correct reading right from the bott=
om. On the other hand, an implementation using the device tree is probably =
against the idea of having the dynamic software stack to configure hardware=
 only when discovered.

Contrary to what you said, at one point the dbus-sensors
implementations used runtime-compiled device tree overlays to
implement their features, using a patch originally written by the
raspberry pi team.  For sensors, these worked pretty well, but
required out of tree patches that were never merged into the mainline
kernel, and were removed because of exactly the problem you identify
later with out of tree patches.  If getting this mainlined is
something you're interested in pursuing, there are several people that
have been down this path, and can likely give you pointers.  Your
shunt resistor is a great example of a parameter (or possibly default
behavior) that could be added to the ADC sensor implementation without
a schema change.  If the shunt_resistor property exists, use that as
the primary application of the ScaleFactor instead of doing it in
userspace integer math.  That seems like a place where an argument
could be made where that could be the always on behavior, as it would
give the best result, but we'd have to collect some info on it.

>
>
> Also, hardware engineers came up with requests to configure the voltage r=
egulator outputs, and from my understanding, this is not what hwmon sysfs i=
nterface intended to do, and we needed that within a very short time period=
. I had to use shell script to configure the device registers by issuing ra=
w I2C commands using i2ctools.

I've long thought that we need a "set these i2c registers to these
values", or "run this bash script" type in entity manager for this
kind of thing for handling things like FPGAs, or configurable hardware
that you don't necessarily need or want a full kernel driver for
(especially in the prototyping stage).  Unfortunately, these kinds of
hacks tended to be easier to do in a custom build with patches against
the specific driver, rather than in a configurable way, so nobody
really built it out.  Also, doing it in the kernel guarantees better
timing, but I still think there's a use case for these.  My initial
ideas for configuration options for a "register setter daemon", and a
"run this command" daemon are below:

{
"Address": "$address",
"Bus": "$bus",
"Register": "0x12,
"Value": "0x42",
"Name": "Set PCIe Retimer to 42",
"Type": "EEPROM"
},
{
"Command": "/usr/bin/echo \"This is the greatest thing ever\"",
"Name": "My \"greatest ever\" command"
"Type": "Command"
}
>
>
> All these requirements ended up in shell scripts run as standalone servic=
es aside from OpenBMC applications, which had their own hardware topology d=
iscovery logic inside them. This may be redundant to what we do in the dyna=
mic software stack.
>
> Handling special requirements and logics
>
> As our hardware program progresses, we are maintaining more and more patc=
hes in Yocto to apply upon entity-manager and dbus-sensors.
Have all of these patches been submitted to
entity-manager/dbus-sensors?  If they're not making breaking changes,
and you've tested them heavily, I'm not sure why this would be a
problem.  If you're fixing issues that were caused by a change, file
the bugs and we as a community can get the patches reverted until we
have a patch that works for all.
With that said, I understand the concern.  Hardware never waits for
firmware, and sometimes downstream patches are a necessary evil to get
a platform launched.  The hope is that after you're through crunch
time, you go back and simplify/cleanup the patches, and submit them
for review, so others won't have to go through the same pain in the
future.  I realize I'm being idealistic here, but downstream patches
and how to handle upstreaming really needs to be handled within your
organization.  Having done it before, I do have opinions on how to
make "downstream" easier to handle as a project, but that's a much
longer discussion.  If you make the patches available, other people
might even upstream them for you (as has happened to me personally
many times).

>
>
> We had to replace some code logic due to various reasons, for example, we=
 found the existing 8-bit / 16-bit addressable EEPROM detection logic is no=
t stable enough, and we were left with 8-bit addressable EEPROMs with their=
 content corrupted in the first byte.
(not knowing the details here, I risk making a mistake, but) This
sounds like a bad case of the above, where someone intended a change
to apply to everyone, under the assumption that it would have no
effect on 8 bit eeproms.  Clearly this isn't the case, and we either
need to find the bug, revert it, or make it configurable per platform.
Report the bug, point to the commit where it occurred, and the
maintainer and community can make a call on the best way to proceed.
Unfortunately, bugs happen.  The best way to prevent them is to be
proactive, and help in testing the patches on your system before they
hit mainline.

-Ed
