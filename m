Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9AB20AA16
	for <lists+openbmc@lfdr.de>; Fri, 26 Jun 2020 03:09:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tJgN4Qm3zDqmY
	for <lists+openbmc@lfdr.de>; Fri, 26 Jun 2020 11:09:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::333;
 helo=mail-ot1-x333.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=QR/qPdzM; dkim-atps=neutral
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tJfV5nNjzDqd7
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jun 2020 11:08:17 +1000 (AEST)
Received: by mail-ot1-x333.google.com with SMTP id m2so7101227otr.12
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jun 2020 18:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WylzRE56AcXBeNZpZMR5XVPxjJlRebvmCLciK+lGE/A=;
 b=QR/qPdzMjsw5F8I0GmqyBimRtIFxGCFf452jqCQX1aAh1SZCMzPvHpKlPgcVvvgCip
 DVLpvlh2W4BJ/SRRny6KMK0lCScxbm0vJ5pZ9PUYdeWoGTL6cdtphXRi8Kwppdm61tQd
 bl5NCQYBf3Yvib8yGy0O4aUBniNm6Oa6viCShub7dE5/GK/FJgu/GBTriW31uVK7ZBSD
 CyOVJ7tC+Ofbr0U2xmU8CLOJxOSL8Wjj2tVBGvjTUDp4C1dM8+6Z8oM1BQKwWqyPpmtY
 HdN8U/qVejmXP4Qi33HrlvcRwyZiKxcXDoubLx2V+w5LWNoIsRfyh51qOgDeHLE2j1Aa
 5PPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WylzRE56AcXBeNZpZMR5XVPxjJlRebvmCLciK+lGE/A=;
 b=Wd0Sq0h8YJFn7xTd1FIbLQn1V82yNsM5OJ9HMBn0VBZc43XE+ahq0N1TL0GuUse2f5
 9pzQdPrnMFwW0gdxEAqEbEDg1NgNtIYh4RQzqYp4hAJa/1wGvBRcslTgQXcIMNndDEym
 JmlSBnd97Z0kEEYB9lPoichRBS/xh1UiwmMUeqrmw5xkBd6vWLfl/51mEQypvkdBymsf
 ZIYGt7ef0pAGPVgxsyN5wWLiArMy8mpc3anAjB9L277y6PBZMoBHNAM0RoOvW9Fnvm8g
 D4SErZZV57X+w574sxGvKDOjV6MLD9gOy1whv7IrA73UigDuNxGEEUSODeV1osoSxaK8
 jvZg==
X-Gm-Message-State: AOAM531N3HEO7ns/s25ePX+rIk9FAW/8CHbvb8mKOb8fCjZ9zcqZ/1h+
 jj4wG/ROj5matpEp0kASFKWnxhW+vVdOntwt8JJ7Nw==
X-Google-Smtp-Source: ABdhPJzYSdPRtzQxuGCN+/1jlX13UJ+LREl+RMw/xagNQL6OdUf8w9deP9XMGdkuLHdWt1XbzjymSieP+/bgnNefmtI=
X-Received: by 2002:a4a:c806:: with SMTP id s6mr310224ooq.19.1593133694369;
 Thu, 25 Jun 2020 18:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAA_a9xKn77KSnwPq2pEq36JGtfWctaBXOA_4vXtP+=JGszaPkg@mail.gmail.com>
 <CACWQX82=MuAavxCqOerxi-Sdywh0xatb-f+1YzGyVSg74oNGqA@mail.gmail.com>
 <CAA_a9xLUkr5rR5Q8YATphtmWUBEE6V=6N4=k74v8hr8PePMMAQ@mail.gmail.com>
 <CACWQX80fbSwvmyNX1d=kfZEcsS30k1ziN8JtA9LtwFfkNC9ciw@mail.gmail.com>
In-Reply-To: <CACWQX80fbSwvmyNX1d=kfZEcsS30k1ziN8JtA9LtwFfkNC9ciw@mail.gmail.com>
From: Alex Qiu <xqiu@google.com>
Date: Thu, 25 Jun 2020 18:08:03 -0700
Message-ID: <CAA_a9x+7DLrwoN9YmjZneghnGaZHAqM9kzzPo2RThH=GgSFw6w@mail.gmail.com>
Subject: Re: Feedback on Current OpenBMC and Proposing Some Improvements ----
 "Improvements" Ideas
To: Ed Tanous <ed@tanous.net>
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
 Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ofer Yehielli <ofery@google.com>,
 Josh Lehan <krellan@google.com>, Richard Hanley <rhanley@google.com>,
 Kais Belgaied <belgaied@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Ed,

I used Python because I wanted to create a demo fast, and get back to
the issues that I need to work on. The thing I'm doing here is kinda
out of my direct work area based on the organization.

Yes, there are some restrictions in my current demo, and I'm afraid
that I may not have the bandwidth to cover it further alone. My point
is that, sometimes hardwares is designed with some unexpected
complexity on topology (EEPROM behind MUX for example). Having the
ability to aid the topology discovery with code, and having the
topology info available to other functionalities can help a lot. JSON
config files are having a hard time bearing these logics, and any
extra logic implemented in JSON config files requires some kind of
script parser in daemons processing them. Based on your replies, the
concept for functionally extensions that I was asking for should be
implemented as daemons either standalone or plugged onto dbus?

On "reading sensors within the BMC console", I'm actually using a
script to directly read from hwmon right now, because we are having
sensor number limit on IPMI and performance issues with IPMI and dbus.
We are still actively investigating these performance issues now to
unblock the project, but based on the current findings, I think it's
better to have this tool before the protocol layers.

On issues like uint8_t, yes, we've noted them down, but they are still
tech debts on our backlog, and dealing with the performance issue
described above remains as our priority right now.

Thank you!

- Alex Qiu


On Thu, Jun 25, 2020 at 7:44 AM Ed Tanous <ed@tanous.net> wrote:
>
>
> On Tue, Jun 23, 2020 at 6:31 PM Alex Qiu <xqiu@google.com> wrote:
> >
> > Hi Ed,
> >
> > -Internal email list
> > +A couple of folks who might be interested in this topic
> >
> > I don't know if you saw the updated reply in the main thread, but I
> > foresaw some possible communication gap, so I created a simple demo to
> > illustrate my ideas: https://github.com/alex310110/bmc-proto-20q2
> > Please note that I'm not trying to code a BMC with Python, but it's
> > just for the ease to set up a demo fast. Other replies inlined.
>
> I did see it, and it shows a lot of my problems with that approach.  Out =
of curiosity, why did you start with python, instead of something we could =
try on a BMC?  Even if it doesn't compile, it might be a starting point for=
 someone else?
>
> I see a few anti-patterns there that I'd like to see you address, you've =
hardcoded lots of data that's not specific to the card.  At first glance in=
 board_example_a.py
>
> 1. Line 22-23.  You've initialized 2 Muxes.  Both of these buses are pres=
ent on your (guessing a little here) baseboard, and not the card itself.  T=
his means that every single card will need to duplicate the initialization =
of these muxes.  So first step, you need to break apart your baseboard into=
 a separate entity, so the "board" does not own the card.  Also, you haven'=
t provided any mapping of a PCIe mux lane to a physical user-facing name "S=
lot 1, Slot 2, ect".  Entity-manager configs do both of these things.
> 2. You've only expressed the slot topology here.  CardExampleG, and CardE=
xampleV need to know what bus they're on, what muxes they need to go throug=
h to get to that bus, and the organization of those things, as in your exam=
ple, none of the busses have been created in the kernel, and some of the mu=
x busses are shared.
> 3. You've hardcoded to only search for 2 different cards (card_g, and car=
d_v), at 1 address (0x52).  While it would be great if systems in practice =
had that kind of consistency in addressing, PCIe add in cards have many dif=
ferent eeprom addresses.  So you'd have to update your loops to search for =
all possible.  Also, that loop scales great if you only support 2 cards.  W=
hat happens when OpenBMC supports 100 cards?  1000?  You've hardcoded the l=
ist of supported cards in the entity above it, which means every baseboard =
needs to explicitly add support for every possible card.  This stops scalin=
g really fast.
> 4. You're looping over the PCIe slots as part of the board control flow. =
 What if slots are based on a riser plugged into said slot?
> 5. You've abstracted an eeprom to a simple device.  In practice, you need=
 to parse the FRU data, which might be in several formats.  Sure, you could=
 have a library function, but you still need a global structure to keep tha=
t, in case some other control flow needs it downstream.
> 6. You've hardcoded a mux address, and a physical channel again later on.
> 7. Line 71-72.  Both of those are blocking calls.  For devices with a lar=
ge number of sensors, those blocking calls will cause performance bottlenec=
ks. also, see my previous comments about non-cyclic timing of some sensors.
> 8. You're missing a lot of features that entity manager does today.  Fan =
control configs being the most important, which have a relation to how the =
chassis looks.  Can you add an example of a chassis with some fans and ther=
mal configs in it?
>
> If you made all the changes I'm suggesting your code starts to look a LOT=
 like entity manager, FRUDevice, and dbus-sensors combined into a single ap=
p.  The biggest difference is you've replaced config files and exposes reco=
rds for library functions.  There's nothing inherently wrong with combining=
 them like that, but we wanted to isolate the topology scanning logic from =
the config logic, so people would feel free to swap them out with their own=
.  In the case of some systems, there's a complete database of the hardware=
 inventory in a proprietary format.  In the case of infrastructure managed =
systems, we wanted developers to have the ability to swap out the topology =
scanning logic for some fixed "Here are the list of the hardware devices th=
at should be present" type daemons that support the various formats, withou=
t necessarily having to care about the implementations.  Said another way, =
it separates "How do I determine if this device is present" from "Here's ho=
w to interact with this device".  We could combine those again, but we lose=
 out on the static case.  If nobody cares about the full config case, we co=
uld certainly consider it.
>  One other big thing I wanted to be able to support in the future with th=
is was adding previously unknown devices at runtime, with zero need to comp=
ile code.  Imagine being able to support a temp sensor on a new card by sim=
ply uploading an entity manager config file to the webserver, having it rer=
un the detect, and suddenly that card is "supported" by that image.  When y=
ou mix the code in with the metadata or config, you lose that ability, as w=
e can't easily upload unsigned code.  It's a tradeoff for sure, but being a=
ble to hand tweak a config at runtime can be invaluable for quick turnaroun=
d during debugging and platform bringup.
>
>
> >
> > On Sun, Jun 21, 2020 at 3:16 PM Ed Tanous <ed@tanous.net> wrote:
> > >
> > > On Thu, Jun 18, 2020 at 2:29 PM Alex Qiu <xqiu@google.com> wrote:
> >
> > I didn't start with multi-threading too much in mind, but It's not
> > necessarily a single-threaded model. As you can see in the demo, each
> > entity instance has its own function of update_sensors(), and the
> > entities are collected in the main class, which may be implemented as
> > a higher-level inter-process communication API for entities to adapt
> > to instead of merely a single main function or thread. So this model
> > can potentially be threaded on an entity basis, or even fork each
> > entity into individual processes. The model can be further threaded
> > within each entity into service threads: separating sensor polling
> > loop and event handling loop for example. But I do wonder about the
> > performance overhead of making every function call into IPC.
> I'm not really following.  Could you give an example of calling 4 command=
s, in parallel, to a MCTP/IPMB device and posting them as they are received=
?  This is something that the existing sensor daemons do today.  Yeah, IPC =
is expensive, but moving away from dbus, and onto something else is a much =
bigger discussion.
>
>
> >
> > The base class for entities may have a default implementation that
> > doesn't hurt, for example, throwing an exception or returning an error
> > code to say that it doesn't have an EEPROM, so that inherited class
> > doesn't need to necessarily implement functions around EEPROM. Devices
> > are abstracted into the hwmon interface as the kernel does today, and
> > we need to config the names of each input attribute to make them
> > meaningful anyway.
> >
> > I do see your concerns, and I do believe this requires further
> > research into if this model can handle all the concerns or
> > requirements we have today.
>
> Looking forward to seeing it.
>
> >
> > >
> > > >
> > > > The existing JSON files used in the dynamic software stack can only=
 represent data, but not any control flow. This led to difficulties where s=
ometimes some code is preferred to have for aiding the discovery of hardwar=
e topology, condensing redundant configurations, etc. With a good framework=
 for hardware topology, combining the entity abstraction described above, d=
evelopers can easily find the best places to aid the topology discovery, im=
plement hardware initialization logics, and optimize BMC tasks according to=
 Linux behaviors.
> > >
> > > If you need code or control flow to aid in the discovery of hardware
> > > topology, write an application that exposes an interface similar to
> > > FruDevice, or the soon to be submitted peci-pcie.  These can be used
> > > in entity manager configs.  I'm not quite following what "redundant
> > > configurations" means in this context.  In my experience, most
> > > redundant configurations tend to be for things like power supplies, o=
r
> > > drives, where a single device can fit in many different slots.  WIth
> > > that said, we already have an abstraction for that, so I'm not quite
> > > following.
> >
> > Please see this for a complicated discovery logic:
> > https://github.com/alex310110/bmc-proto-20q2/blob/master/downstream/boa=
rd_example_a.py
> >
> > Based on your reply, I have a concern that, if we have a hardware
> > topology complicated enough, does that mean we should probably opt out
> > of FruDevice and use downstream daemon to replace it?
>
> FruDevice is poorly named these days (sorry James).  It should really be =
called I2cFruEepromLocator.  In theory, it can handle any I2C topology we w=
ere able to throw at it, including one that I tested that was 4 levels deep=
.  If you're trying to manage an automatically detected i2c eeprom/mux topo=
logy, that is the tool I would expect to use.  With that said, you're welco=
me to write others, if you need to handle other things on I2C, or the stati=
c config case from above.
> If you're managing a different source of data (like a host driven map, MC=
TP, or out of band PCIe registers) I would expect you'd likely want to writ=
e another daemon that's capable of posting that topology data to dbus, but =
I would expect you can still use entity manager to consume it, and apply th=
e correct settings to sensors/busses/kernel/Fans.
>
> >
> > > >
> > > > Better open source and proprietary part management
> > > >
> > > > Construct "Improvements" like a proprietary software supporting plu=
gins. The philosophy is that the architecture of "Improvements" should be s=
olid enough that the community won't have to modify the upstream code much.=
 The community can look at and reference the code upstream to develop their=
 own code and configs according to their hardware, while the plugin-able pa=
rt may be proprietary and can be kept downstream without conflicts. "Improv=
ements" should have a reasonable plugin API to support common BMC functiona=
lity in the high level, and provide common low-level APIs to support the pl=
ugins by abstracting things like hwmon sysfs interface. This can be impleme=
nted using a plugin system or a flexible build system, as we are working on=
 an open source project indeed. Whenever we find a potential conflict betwe=
en upstream and downstream, let us work it out to see if it is appropriate =
to make it pluginable or configurable via config files.
> > >
> > > I must be misreading this, as I feel like openbmc already has
> > > "plugins" in the form of Dbus applications.  Many applications have
> > > been written that required no modification to upstream code.  Tha API
> > > you're looking for is reasonably well defined in phosphor dbus
> > > interfaces, and is intended to be reasonably stable, even if it's not
> > > guaranteed over time.  I'm also a little confused at what you're
> > > calling low-level APIs.  hwmon sysfs is a low level API.  Are you
> > > wanting to wrap it in yet another API that's OpenBMC specific?
> > > "can be kept downstream without conflicts" - In my experience, you're
> > > going to be hard pressed to find support for supporting closed source
> > > development in an open source project.  That's not to say individuals
> > > aren't out there, but they tend to keep their heads down :)
> >
> > Apologies for my wording; the low-level API may be probably called
> > lower level libraries offered by OpenBMC. See I2CHwmonDevice in
> > https://github.com/alex310110/bmc-proto-20q2/blob/master/i2c.py
> I2CDevices, i2CMuxes, HWMonDevices, and i2ceeproms exist in the kernel al=
ready, behind a well defined interface.  Your file feels a little bit like =
it's reinventing some things.  I'm not sure whether or not I'd be against i=
nventing libopenbmc, but that's likely where those types of interfaces woul=
d need to go.
> It should also be noted, all of those devices are addable with only EM co=
nfiguration file changes today.
>
>
> >
> > Although we make a lot of efforts to upstream software to the open
> > source community as much as possible, BMC is heavily involved with
> > hardware, and we're also restricted to hardware's restrictions. We are
> > having difficulties to upstream drivers or code containing
> > confidential hardware code names, or containing part numbers under NDA
> > with vendors. Personally I was also involved with a lengthy and
> > exhausting internal legal review to publicize a part number which is
> > under NDA with our vendor, involving email exchanges between attorneys
> > in Google and our vendor's support engineer. I hope this explains my
> > point. For today, these part numbers are required to pass onto dbus
> > from entity-manager in order for dbus-sensors to determine the correct
> > sensor daemon for them.
>
> Understood, and I've felt your pain before.  I'm not going to claim this =
is easily solved, but the best way IMO, is to create a downstream applicati=
on for each hardware device you need to manage, and patch your entity manag=
er configs to add the configuration data for those components to your board=
s (or keep the board configs totally private).  Any changes to the detectio=
n logic, or entity manager itself can be easily upstreamed.  The applicatio=
n boundary also means that there's a well defined dbus interface, and any l=
icencing conflicts between GPL and proprietary code are resolved.
>
>
> >
> > >
> > > >
> > > > Flexibility for alternatives
> > > >
> > > > Although hwmon sysfs interface is a good starting point for getting=
 sensor reads from devices, they have their own limitations. The interface =
does not abstract every register perfectly, especially when device register=
s are not designed to follow some common specs like PMBus, and it does not =
provide controls to the devices.
> > > >
> > > >
> > > > I propose a Device Abstraction Layer to wrap around devices. The un=
derlying can completely map to hwmon sysfs, or allow user-space driver impl=
ementation if necessary, or even hybrid. This will easily provide an additi=
onal interface to bypass the driver and control the devices, while still ma=
intaining the benefit to use an off-the-shelf Linux device driver.
> > >
> > > In this context, what are you calling a "device"?  I think everything
> > > you're looking for exists, although it sounds like it's not in the
> > > form you're wanting to see.  Dbus sensors already does a hwmon to Dbu=
s
> > > sensor abstraction conversion, that in some cases maps 1:1, or in som=
e
> > > cases is a "hybrid" as you call it.  Are you looking for something in
> > > the middle, so instead of going hwmon -> Dbus  and libmctp -> Dbus yo=
u
> > > would want hwmon -> DAL -> Dbus  and libmctp -> DAL -> Dbus?  There
> > > could be some advantages here, but I have a worry that it'll be
> > > difficult to come up with a reasonable "device" api.  Devices take a
> > > lot of forms, in band, out of band, all with varying requirements
> > > around threading, permissions, and eventing.  While it's possible to
> > > cover everything that's needed, I'd be worried we'd be able to cover =
a
> > > majority of them.
> >
> > Yep, that requires some research or others' experience; I'm mostly
> > familiar with I2C devices in my area of work.
> >
> > >
> > > >
> > > > Quite some existing code is heavily bound to or influenced by the I=
PMI protocol layer that we are having right now: We use =E2=80=9Cuint8_t=E2=
=80=9D type for I2C bus number in entity-manager for example, while Linux k=
ernel can extend the logical I2C bus number to more than 512 without any is=
sues.
> > > Can you come up with a better example?  We've tried to be very carefu=
l
> > > to not have IPMI-specific things in the interfaces, and to make them
> > > as generic as possible.  In that case, uint8_t is used to represent
> > > the 7 bit addressing (plus read write bit) on the I2C bus itself, not
> > > the uint8_t in the IPMI spec.  The API you listed neglected to handle
> > > the possibility of 11 bit I2C addressing, as it isn't very common in
> > > practice, but the argument could certainly be made that the interface
> > > should be changed to a uint16_t, and I would expect the IPMI layer to
> > > simply filter addresses above 127 that it's not able to support.
> >
> > Please see getFruInfo() calls in FruDevice.cpp:
> > https://github.com/openbmc/entity-manager/blob/master/src/FruDevice.cpp=
#L1108
> >
> > The uint8_t bus of getFruInfo() restricted the number of logical I2C
> > buses that we could implement in the sysfs interface, and it was
> > unfortunately static_cast'ed to uint_8 which created a bug hard to
> > debug. I don't have much experience to find you more examples,
> > however... I believe some of these can be fixed within the current
> > architecture, nevertheless I'm still trying to emphasize this concept.
> OH, you mean you hit a uint8_t limit on busses!  I don't know of anyone t=
hat has crossed the 256 bus limit, so you've clearly found a bug/missing fe=
ature.  Now it's your time to shine.  You've found an issue, you know what =
the fix is, exactly where the code needs to go and you have the ability to =
test it.  Write a patch to fix it, test that it does what you want, write u=
p a commit message explaining exactly what you detailed above, how you test=
ed it, and submit it to gerrit with the maintainer as a reviewer.  The main=
tainer is very responsive, and you'll have fixed something hard to debug fo=
r the next person that runs into this.
>
>
> >
> > >
> > > > The current dynamic software stack emphasizes individual sensors, b=
ut the BMC handles many more tasks than just only sensors. The practicality=
 of OpenBMC for hardware engineers is also hindered by the IPMI as describe=
d above in Issue Examples.
> > > Sensors were the first thing tackled, as those are the things that
> > > tend to be the most different platform to platform, and have the most
> > > peculiar settings.  We do also handle topology to some extent, as wel=
l
> > > as a lot of other commands that are not IPMI specific.  I agree, IPMI
> > > has its flaws, but OpenBMC also has pretty good support for Redfish,
> > > direct dbus, and upcoming MCTP if that's what you'd rather use as an
> > > outbound interface.
> >
> > On that, I'm also looking forward to the ability to read sensors
> > within the BMC console in a human-friendly way for hardware engineers,
> > so that we don't have to rely on the host or network to read them
> > during bring-up, or simply because we don't have RedFish ready yet,
> > and hardware engineers just want to see tons of sensor readings for
> > bring-up.
>
> I'm not following this as anything actionable.  OpenBMC has IPMItool, dbu=
s tools, i2c-tools, the Redfish GUI, the rest-dbus GUI and the Webui to pic=
k from for "human friendly way for hardware engineers".  Heck, if you're fe=
eling really enterprising, you can install the HWmon devices in the bash co=
nsole, and CAT out the values in another.  In this comment, are you wanting=
 something else?  Surely one of those meets your prototyping needs?
>
>
> >
> > Sorry for any confusion. I think I'm trying to repeat myself by
> > emphasizing on interleaving protocol layer in this paragraph. Today's
> > OpenBMC does build with this in mind, but there are still some flaws
> > left to improve, the uint8_t bus variable described above for example.
> >
> See above.  Let's get that uint8_t thing fixed on master so we're not all=
 talking about it here again in 6 months when the next poor person hits the=
 same issue and spends a week debugging it.
> --
> -Ed
