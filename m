Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF21620A107
	for <lists+openbmc@lfdr.de>; Thu, 25 Jun 2020 16:45:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49t2qb0Wh9zDqwM
	for <lists+openbmc@lfdr.de>; Fri, 26 Jun 2020 00:45:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=YBOS0qdP; dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49t2pJ5lvPzDqJW
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jun 2020 00:44:07 +1000 (AEST)
Received: by mail-yb1-xb30.google.com with SMTP id y13so2857865ybj.10
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jun 2020 07:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QELNpzs80albbxQ4dHwHXEDKXiz5Ob0IrAX5NKWq76o=;
 b=YBOS0qdP7aP7kKobl8VuUleTMccWOGjDCVTV97cULHWZB/VK3gf2fxxF8U4728419g
 pHjvTCykAPfVDeiGzd5xJTR9WkpyPx1O+QVHAby20J42+M/zDmWHhAJgDEuHJUqk9646
 8VqeJCDR3HOkxfFEOWdqYI/3K/IYZMyApxNSH+0G/ZRrEW/28f8COj2aQbDZYwyRKcr8
 J8kE7xo7Za5i9MzQMZ7+pOpZxrPpr/hy9tOuzuZMKz85D1juImvqLUdfW4Hf7TFqnXrz
 grOIZ43DS48caXe6NOiptolXFxvj6FeNWAuUb1URUI/YUa4UnkxXHO/b0ZsuqmyDRUn8
 eeaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QELNpzs80albbxQ4dHwHXEDKXiz5Ob0IrAX5NKWq76o=;
 b=cmmTfq3QZCI9ICEJeUmUP1VuduSFGwIHJNE8T8NBsevHxzH3RrAzYrAH9P/ucTnjMI
 owQTffSSzQNERw/PmXEHQgX7S3ZPzTh/IVZihPTIQPUfSy80NcvfWD5lrdqMMNgUI4Dl
 QPHvHMMA21FcDCD2mYkns9zPs1IKWK92yX4OumM9cq+As0yl60y9t6YErngAFKundx63
 MlgnBLMTA56rnuLXBPxq0tZxyFz0xrWp75mjtlTR5PuybTpVdcT0KPNZBXoSlauh1J1a
 bXTBOrKkRHAZtufBPaU3PKLKK7vqKaVqJkvv6Zhf3NHbhjzvSqR6QSF0kWAarSVyVUWC
 RpNQ==
X-Gm-Message-State: AOAM5321iSipBCn0aY1JrOKpJWDr4611+t8Dy639HdTqs5y2gxMR3pjc
 0yCI3i3Rq8fg6phJ89bZ+pWGiC9a+lZMf7t52iUcgA==
X-Google-Smtp-Source: ABdhPJzniES+h/6GHsquVpYyk1yHcfrVnMx9Lm6bUviV9hzj+/5Y3J9pu8YZe8t2aeVdtvASyig/S2X57UIx7bJQnyg=
X-Received: by 2002:a25:aa44:: with SMTP id s62mr48385298ybi.480.1593096243103; 
 Thu, 25 Jun 2020 07:44:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAA_a9xKn77KSnwPq2pEq36JGtfWctaBXOA_4vXtP+=JGszaPkg@mail.gmail.com>
 <CACWQX82=MuAavxCqOerxi-Sdywh0xatb-f+1YzGyVSg74oNGqA@mail.gmail.com>
 <CAA_a9xLUkr5rR5Q8YATphtmWUBEE6V=6N4=k74v8hr8PePMMAQ@mail.gmail.com>
In-Reply-To: <CAA_a9xLUkr5rR5Q8YATphtmWUBEE6V=6N4=k74v8hr8PePMMAQ@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 25 Jun 2020 07:43:52 -0700
Message-ID: <CACWQX80fbSwvmyNX1d=kfZEcsS30k1ziN8JtA9LtwFfkNC9ciw@mail.gmail.com>
Subject: Re: Feedback on Current OpenBMC and Proposing Some Improvements ----
 "Improvements" Ideas
To: Alex Qiu <xqiu@google.com>
Content-Type: multipart/alternative; boundary="000000000000a9df2f05a8e99f86"
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

--000000000000a9df2f05a8e99f86
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2020 at 6:31 PM Alex Qiu <xqiu@google.com> wrote:
>
> Hi Ed,
>
> -Internal email list
> +A couple of folks who might be interested in this topic
>
> I don't know if you saw the updated reply in the main thread, but I
> foresaw some possible communication gap, so I created a simple demo to
> illustrate my ideas: https://github.com/alex310110/bmc-proto-20q2
> Please note that I'm not trying to code a BMC with Python, but it's
> just for the ease to set up a demo fast. Other replies inlined.

I did see it, and it shows a lot of my problems with that approach.  Out of
curiosity, why did you start with python, instead of something we could try
on a BMC?  Even if it doesn't compile, it might be a starting point for
someone else?

I see a few anti-patterns there that I'd like to see you address, you've
hardcoded lots of data that's not specific to the card.  At first glance in
board_example_a.py

1. Line 22-23.  You've initialized 2 Muxes.  Both of these buses are
present on your (guessing a little here) baseboard, and not the card
itself.  This means that every single card will need to duplicate the
initialization of these muxes.  So first step, you need to break apart your
baseboard into a separate entity, so the "board" does not own the card.
Also, you haven't provided any mapping of a PCIe mux lane to a physical
user-facing name "Slot 1, Slot 2, ect".  Entity-manager configs do both of
these things.
2. You've only expressed the slot topology here.  CardExampleG, and
CardExampleV need to know what bus they're on, what muxes they need to go
through to get to that bus, and the organization of those things, as in
your example, none of the busses have been created in the kernel, and some
of the mux busses are shared.
3. You've hardcoded to only search for 2 different cards (card_g, and
card_v), at 1 address (0x52).  While it would be great if systems in
practice had that kind of consistency in addressing, PCIe add in cards have
many different eeprom addresses.  So you'd have to update your loops to
search for all possible.  Also, that loop scales great if you only support
2 cards.  What happens when OpenBMC supports 100 cards?  1000?  You've
hardcoded the list of supported cards in the entity above it, which means
every baseboard needs to explicitly add support for every possible card.
This stops scaling really fast.
4. You're looping over the PCIe slots as part of the board control flow.
What if slots are based on a riser plugged into said slot?
5. You've abstracted an eeprom to a simple device.  In practice, you need
to parse the FRU data, which might be in several formats.  Sure, you could
have a library function, but you still need a global structure to keep
that, in case some other control flow needs it downstream.
6. You've hardcoded a mux address, and a physical channel again later on.
7. Line 71-72.  Both of those are blocking calls.  For devices with a large
number of sensors, those blocking calls will cause performance bottlenecks.
also, see my previous comments about non-cyclic timing of some sensors.
8. You're missing a lot of features that entity manager does today.  Fan
control configs being the most important, which have a relation to how the
chassis looks.  Can you add an example of a chassis with some fans and
thermal configs in it?

If you made all the changes I'm suggesting your code starts to look a LOT
like entity manager, FRUDevice, and dbus-sensors combined into a single
app.  The biggest difference is you've replaced config files and exposes
records for library functions.  There's nothing inherently wrong with
combining them like that, but we wanted to isolate the topology scanning
logic from the config logic, so people would feel free to swap them out
with their own.  In the case of some systems, there's a complete database
of the hardware inventory in a proprietary format.  In the case of
infrastructure managed systems, we wanted developers to have the ability to
swap out the topology scanning logic for some fixed "Here are the list of
the hardware devices that should be present" type daemons that support the
various formats, without necessarily having to care about the
implementations.  Said another way, it separates "How do I determine if
this device is present" from "Here's how to interact with this device".  We
could combine those again, but we lose out on the static case.  If nobody
cares about the full config case, we could certainly consider it.
 One other big thing I wanted to be able to support in the future with this
was adding previously unknown devices at runtime, with zero need to compile
code.  Imagine being able to support a temp sensor on a new card by simply
uploading an entity manager config file to the webserver, having it rerun
the detect, and suddenly that card is "supported" by that image.  When you
mix the code in with the metadata or config, you lose that ability, as we
can't easily upload unsigned code.  It's a tradeoff for sure, but being
able to hand tweak a config at runtime can be invaluable for quick
turnaround during debugging and platform bringup.


>
> On Sun, Jun 21, 2020 at 3:16 PM Ed Tanous <ed@tanous.net> wrote:
> >
> > On Thu, Jun 18, 2020 at 2:29 PM Alex Qiu <xqiu@google.com> wrote:
>
> I didn't start with multi-threading too much in mind, but It's not
> necessarily a single-threaded model. As you can see in the demo, each
> entity instance has its own function of update_sensors(), and the
> entities are collected in the main class, which may be implemented as
> a higher-level inter-process communication API for entities to adapt
> to instead of merely a single main function or thread. So this model
> can potentially be threaded on an entity basis, or even fork each
> entity into individual processes. The model can be further threaded
> within each entity into service threads: separating sensor polling
> loop and event handling loop for example. But I do wonder about the
> performance overhead of making every function call into IPC.
I'm not really following.  Could you give an example of calling 4 commands,
in parallel, to a MCTP/IPMB device and posting them as they are received?
This is something that the existing sensor daemons do today.  Yeah, IPC is
expensive, but moving away from dbus, and onto something else is a much
bigger discussion.


>
> The base class for entities may have a default implementation that
> doesn't hurt, for example, throwing an exception or returning an error
> code to say that it doesn't have an EEPROM, so that inherited class
> doesn't need to necessarily implement functions around EEPROM. Devices
> are abstracted into the hwmon interface as the kernel does today, and
> we need to config the names of each input attribute to make them
> meaningful anyway.
>
> I do see your concerns, and I do believe this requires further
> research into if this model can handle all the concerns or
> requirements we have today.

Looking forward to seeing it.

>
> >
> > >
> > > The existing JSON files used in the dynamic software stack can only
represent data, but not any control flow. This led to difficulties where
sometimes some code is preferred to have for aiding the discovery of
hardware topology, condensing redundant configurations, etc. With a good
framework for hardware topology, combining the entity abstraction described
above, developers can easily find the best places to aid the topology
discovery, implement hardware initialization logics, and optimize BMC tasks
according to Linux behaviors.
> >
> > If you need code or control flow to aid in the discovery of hardware
> > topology, write an application that exposes an interface similar to
> > FruDevice, or the soon to be submitted peci-pcie.  These can be used
> > in entity manager configs.  I'm not quite following what "redundant
> > configurations" means in this context.  In my experience, most
> > redundant configurations tend to be for things like power supplies, or
> > drives, where a single device can fit in many different slots.  WIth
> > that said, we already have an abstraction for that, so I'm not quite
> > following.
>
> Please see this for a complicated discovery logic:
>
https://github.com/alex310110/bmc-proto-20q2/blob/master/downstream/board_e=
xample_a.py
>
> Based on your reply, I have a concern that, if we have a hardware
> topology complicated enough, does that mean we should probably opt out
> of FruDevice and use downstream daemon to replace it?

FruDevice is poorly named these days (sorry James).  It should really be
called I2cFruEepromLocator.  In theory, it can handle any I2C topology we
were able to throw at it, including one that I tested that was 4 levels
deep.  If you're trying to manage an automatically detected i2c eeprom/mux
topology, that is the tool I would expect to use.  With that said, you're
welcome to write others, if you need to handle other things on I2C, or the
static config case from above.
If you're managing a different source of data (like a host driven map,
MCTP, or out of band PCIe registers) I would expect you'd likely want to
write another daemon that's capable of posting that topology data to dbus,
but I would expect you can still use entity manager to consume it, and
apply the correct settings to sensors/busses/kernel/Fans.

>
> > >
> > > Better open source and proprietary part management
> > >
> > > Construct "Improvements" like a proprietary software supporting
plugins. The philosophy is that the architecture of "Improvements" should
be solid enough that the community won't have to modify the upstream code
much. The community can look at and reference the code upstream to develop
their own code and configs according to their hardware, while the
plugin-able part may be proprietary and can be kept downstream without
conflicts. "Improvements" should have a reasonable plugin API to support
common BMC functionality in the high level, and provide common low-level
APIs to support the plugins by abstracting things like hwmon sysfs
interface. This can be implemented using a plugin system or a flexible
build system, as we are working on an open source project indeed. Whenever
we find a potential conflict between upstream and downstream, let us work
it out to see if it is appropriate to make it pluginable or configurable
via config files.
> >
> > I must be misreading this, as I feel like openbmc already has
> > "plugins" in the form of Dbus applications.  Many applications have
> > been written that required no modification to upstream code.  Tha API
> > you're looking for is reasonably well defined in phosphor dbus
> > interfaces, and is intended to be reasonably stable, even if it's not
> > guaranteed over time.  I'm also a little confused at what you're
> > calling low-level APIs.  hwmon sysfs is a low level API.  Are you
> > wanting to wrap it in yet another API that's OpenBMC specific?
> > "can be kept downstream without conflicts" - In my experience, you're
> > going to be hard pressed to find support for supporting closed source
> > development in an open source project.  That's not to say individuals
> > aren't out there, but they tend to keep their heads down :)
>
> Apologies for my wording; the low-level API may be probably called
> lower level libraries offered by OpenBMC. See I2CHwmonDevice in
> https://github.com/alex310110/bmc-proto-20q2/blob/master/i2c.py
I2CDevices, i2CMuxes, HWMonDevices, and i2ceeproms exist in the kernel
already, behind a well defined interface.  Your file feels a little bit
like it's reinventing some things.  I'm not sure whether or not I'd be
against inventing libopenbmc, but that's likely where those types of
interfaces would need to go.
It should also be noted, all of those devices are addable with only EM
configuration file changes today.


>
> Although we make a lot of efforts to upstream software to the open
> source community as much as possible, BMC is heavily involved with
> hardware, and we're also restricted to hardware's restrictions. We are
> having difficulties to upstream drivers or code containing
> confidential hardware code names, or containing part numbers under NDA
> with vendors. Personally I was also involved with a lengthy and
> exhausting internal legal review to publicize a part number which is
> under NDA with our vendor, involving email exchanges between attorneys
> in Google and our vendor's support engineer. I hope this explains my
> point. For today, these part numbers are required to pass onto dbus
> from entity-manager in order for dbus-sensors to determine the correct
> sensor daemon for them.

Understood, and I've felt your pain before.  I'm not going to claim this is
easily solved, but the best way IMO, is to create a downstream application
for each hardware device you need to manage, and patch your entity manager
configs to add the configuration data for those components to your boards
(or keep the board configs totally private).  Any changes to the detection
logic, or entity manager itself can be easily upstreamed.  The application
boundary also means that there's a well defined dbus interface, and any
licencing conflicts between GPL and proprietary code are resolved.


>
> >
> > >
> > > Flexibility for alternatives
> > >
> > > Although hwmon sysfs interface is a good starting point for getting
sensor reads from devices, they have their own limitations. The interface
does not abstract every register perfectly, especially when device
registers are not designed to follow some common specs like PMBus, and it
does not provide controls to the devices.
> > >
> > >
> > > I propose a Device Abstraction Layer to wrap around devices. The
underlying can completely map to hwmon sysfs, or allow user-space driver
implementation if necessary, or even hybrid. This will easily provide an
additional interface to bypass the driver and control the devices, while
still maintaining the benefit to use an off-the-shelf Linux device driver.
> >
> > In this context, what are you calling a "device"?  I think everything
> > you're looking for exists, although it sounds like it's not in the
> > form you're wanting to see.  Dbus sensors already does a hwmon to Dbus
> > sensor abstraction conversion, that in some cases maps 1:1, or in some
> > cases is a "hybrid" as you call it.  Are you looking for something in
> > the middle, so instead of going hwmon -> Dbus  and libmctp -> Dbus you
> > would want hwmon -> DAL -> Dbus  and libmctp -> DAL -> Dbus?  There
> > could be some advantages here, but I have a worry that it'll be
> > difficult to come up with a reasonable "device" api.  Devices take a
> > lot of forms, in band, out of band, all with varying requirements
> > around threading, permissions, and eventing.  While it's possible to
> > cover everything that's needed, I'd be worried we'd be able to cover a
> > majority of them.
>
> Yep, that requires some research or others' experience; I'm mostly
> familiar with I2C devices in my area of work.
>
> >
> > >
> > > Quite some existing code is heavily bound to or influenced by the
IPMI protocol layer that we are having right now: We use =E2=80=9Cuint8_t=
=E2=80=9D type for
I2C bus number in entity-manager for example, while Linux kernel can extend
the logical I2C bus number to more than 512 without any issues.
> > Can you come up with a better example?  We've tried to be very careful
> > to not have IPMI-specific things in the interfaces, and to make them
> > as generic as possible.  In that case, uint8_t is used to represent
> > the 7 bit addressing (plus read write bit) on the I2C bus itself, not
> > the uint8_t in the IPMI spec.  The API you listed neglected to handle
> > the possibility of 11 bit I2C addressing, as it isn't very common in
> > practice, but the argument could certainly be made that the interface
> > should be changed to a uint16_t, and I would expect the IPMI layer to
> > simply filter addresses above 127 that it's not able to support.
>
> Please see getFruInfo() calls in FruDevice.cpp:
>
https://github.com/openbmc/entity-manager/blob/master/src/FruDevice.cpp#L11=
08
>
> The uint8_t bus of getFruInfo() restricted the number of logical I2C
> buses that we could implement in the sysfs interface, and it was
> unfortunately static_cast'ed to uint_8 which created a bug hard to
> debug. I don't have much experience to find you more examples,
> however... I believe some of these can be fixed within the current
> architecture, nevertheless I'm still trying to emphasize this concept.
OH, you mean you hit a uint8_t limit on busses!  I don't know of anyone
that has crossed the 256 bus limit, so you've clearly found a bug/missing
feature.  Now it's your time to shine.  You've found an issue, you know
what the fix is, exactly where the code needs to go and you have the
ability to test it.  Write a patch to fix it, test that it does what you
want, write up a commit message explaining exactly what you detailed above,
how you tested it, and submit it to gerrit with the maintainer as a
reviewer.  The maintainer is very responsive, and you'll have fixed
something hard to debug for the next person that runs into this.


>
> >
> > > The current dynamic software stack emphasizes individual sensors, but
the BMC handles many more tasks than just only sensors. The practicality of
OpenBMC for hardware engineers is also hindered by the IPMI as described
above in Issue Examples.
> > Sensors were the first thing tackled, as those are the things that
> > tend to be the most different platform to platform, and have the most
> > peculiar settings.  We do also handle topology to some extent, as well
> > as a lot of other commands that are not IPMI specific.  I agree, IPMI
> > has its flaws, but OpenBMC also has pretty good support for Redfish,
> > direct dbus, and upcoming MCTP if that's what you'd rather use as an
> > outbound interface.
>
> On that, I'm also looking forward to the ability to read sensors
> within the BMC console in a human-friendly way for hardware engineers,
> so that we don't have to rely on the host or network to read them
> during bring-up, or simply because we don't have RedFish ready yet,
> and hardware engineers just want to see tons of sensor readings for
> bring-up.

I'm not following this as anything actionable.  OpenBMC has IPMItool, dbus
tools, i2c-tools, the Redfish GUI, the rest-dbus GUI and the Webui to pick
from for "human friendly way for hardware engineers".  Heck, if you're
feeling really enterprising, you can install the HWmon devices in the bash
console, and CAT out the values in another.  In this comment, are you
wanting something else?  Surely one of those meets your prototyping needs?


>
> Sorry for any confusion. I think I'm trying to repeat myself by
> emphasizing on interleaving protocol layer in this paragraph. Today's
> OpenBMC does build with this in mind, but there are still some flaws
> left to improve, the uint8_t bus variable described above for example.
>
See above.  Let's get that uint8_t thing fixed on master so we're not all
talking about it here again in 6 months when the next poor person hits the
same issue and spends a week debugging it.
--=20
-Ed

--000000000000a9df2f05a8e99f86
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br>
On Tue, Jun 23, 2020 at 6:31 PM Alex Qiu &lt;<a href=3D"mailto:xqiu@google.=
com" target=3D"_blank">xqiu@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Ed,<br>
&gt;<br>
&gt; -Internal email list<br>
&gt; +A couple of folks who might be interested in this topic<br>
&gt;<br>
&gt; I don&#39;t know if you saw the updated reply in the main thread, but =
I<br>
&gt; foresaw some possible communication gap, so I created a simple demo to=
<br>
&gt; illustrate my ideas: <a href=3D"https://github.com/alex310110/bmc-prot=
o-20q2" rel=3D"noreferrer" target=3D"_blank">https://github.com/alex310110/=
bmc-proto-20q2</a><br>
&gt; Please note that I&#39;m not trying to code a BMC with Python, but it&=
#39;s<br>
&gt; just for the ease to set up a demo fast. Other replies inlined.<br>
<br></div><div>
I did see it, and it shows a lot of my problems with that approach.=C2=A0 O=
ut of curiosity, why did you start with python, instead of something we cou=
ld try on a BMC?=C2=A0 Even if it doesn&#39;t compile, it might be a starti=
ng point for someone else?<br>
<br>
I see a few anti-patterns there that I&#39;d like to see you address, you&#=
39;ve hardcoded lots of data that&#39;s not specific to the card.=C2=A0 At =
first glance in board_example_a.py<br>
<br>
1. Line 22-23.=C2=A0 You&#39;ve initialized 2 Muxes.=C2=A0 Both of these bu=
ses are present on your (guessing a little here) baseboard, and not the car=
d itself.=C2=A0 This means that every single card will need to duplicate th=
e initialization of these muxes.=C2=A0 So first step, you need to break apa=
rt your baseboard into a separate entity, so the &quot;board&quot; does not=
 own the card.=C2=A0 Also, you haven&#39;t provided any mapping of a PCIe m=
ux lane to a physical user-facing name &quot;Slot 1, Slot 2, ect&quot;.=C2=
=A0 Entity-manager configs do both of these things.<br>
2. You&#39;ve only expressed the slot topology here.=C2=A0 CardExampleG, an=
d CardExampleV need to know what bus they&#39;re on, what muxes they need t=
o go through to get to that bus, and the organization of those things, as i=
n your example, none of the busses have been created in the kernel, and som=
e of the mux busses are shared.<br>
3. You&#39;ve hardcoded to only search for 2 different cards (card_g, and c=
ard_v), at 1 address (0x52).=C2=A0 While it would be great if systems in pr=
actice had that kind of consistency in addressing, PCIe add in cards have m=
any different eeprom addresses.=C2=A0 So you&#39;d have to update your loop=
s to search for all possible.=C2=A0 Also, that loop scales great if you onl=
y support 2 cards.=C2=A0 What happens when OpenBMC supports 100 cards?=C2=
=A0 1000?=C2=A0 You&#39;ve hardcoded the list of supported cards in the ent=
ity above it, which means every baseboard needs to explicitly add support f=
or every possible card.=C2=A0 This stops scaling really fast.<br>
4. You&#39;re looping over the PCIe slots as part of the board control flow=
.=C2=A0 What if slots are based on a riser plugged into said slot?<br>
5. You&#39;ve abstracted an eeprom to a simple device.=C2=A0 In practice, y=
ou need to parse the FRU data, which might be in several formats.=C2=A0 Sur=
e, you could have a library function, but you still need a global structure=
 to keep that, in case some other control flow needs it downstream.<br>
6. You&#39;ve hardcoded a mux address, and a physical channel again later o=
n.<br>
7. Line 71-72.=C2=A0 Both of those are blocking calls.=C2=A0 For devices wi=
th a large number of sensors, those blocking calls will cause performance b=
ottlenecks. also, see my previous comments about non-cyclic timing of some =
sensors.<br>
8. You&#39;re missing a lot of features that entity manager does today.=C2=
=A0 Fan control configs being the most important, which have a relation to =
how the chassis looks.=C2=A0 Can you add an example of a chassis with some =
fans and thermal configs in it?<br>
<br>
If you made all the changes I&#39;m suggesting your code starts to look a L=
OT like entity manager, FRUDevice, and dbus-sensors combined into a single =
app.=C2=A0 The biggest difference is you&#39;ve replaced config files and e=
xposes records for library functions.=C2=A0 There&#39;s nothing inherently =
wrong with combining them like that, but we wanted to isolate the topology =
scanning logic from the config logic, so people would feel free to swap the=
m out with their own.=C2=A0 In the case of some systems, there&#39;s a comp=
lete database of the hardware inventory in a proprietary format.=C2=A0 In t=
he case of infrastructure managed systems, we wanted developers to have the=
 ability to swap out the topology scanning logic for some fixed &quot;Here =
are the list of the hardware devices that should be present&quot; type daem=
ons that support the various formats, without necessarily having to care ab=
out the implementations.=C2=A0 Said another way, it separates &quot;How do =
I determine if this device is present&quot; from &quot;Here&#39;s how to in=
teract with this device&quot;.=C2=A0 We could combine those again, but we l=
ose out on the static case.=C2=A0 If nobody cares about the full config cas=
e, we could certainly consider it.<br>
=C2=A0One other big thing I wanted to be able to support in the future with=
 this was adding previously unknown devices at runtime, with zero need to c=
ompile code.=C2=A0 Imagine being able to support a temp sensor on a new car=
d by simply uploading an entity manager config file to the webserver, havin=
g it rerun the detect, and suddenly that card is &quot;supported&quot; by t=
hat image.=C2=A0 When you mix the code in with the metadata or config, you =
lose that ability, as we can&#39;t easily upload unsigned code.=C2=A0 It&#3=
9;s a tradeoff for sure, but being able to hand tweak a config at runtime c=
an be invaluable for quick turnaround during debugging and platform bringup=
.</div><div><br>
<br>
&gt;<br>
&gt; On Sun, Jun 21, 2020 at 3:16 PM Ed Tanous &lt;<a href=3D"mailto:ed@tan=
ous.net" target=3D"_blank">ed@tanous.net</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Thu, Jun 18, 2020 at 2:29 PM Alex Qiu &lt;<a href=3D"mailto:xq=
iu@google.com" target=3D"_blank">xqiu@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; I didn&#39;t start with multi-threading too much in mind, but It&#39;s=
 not<br>
&gt; necessarily a single-threaded model. As you can see in the demo, each<=
br>
&gt; entity instance has its own function of update_sensors(), and the<br>
&gt; entities are collected in the main class, which may be implemented as<=
br>
&gt; a higher-level inter-process communication API for entities to adapt<b=
r>
&gt; to instead of merely a single main function or thread. So this model<b=
r>
&gt; can potentially be threaded on an entity basis, or even fork each<br>
&gt; entity into individual processes. The model can be further threaded<br=
>
&gt; within each entity into service threads: separating sensor polling<br>
&gt; loop and event handling loop for example. But I do wonder about the<br=
>
&gt; performance overhead of making every function call into IPC.<br></div>=
<div>
I&#39;m not really following.=C2=A0 Could you give an example of calling 4 =
commands, in parallel, to a MCTP/IPMB device and posting them as they are r=
eceived?=C2=A0 This is something that the existing sensor daemons do today.=
=C2=A0 Yeah, IPC is expensive, but moving away from dbus, and onto somethin=
g else is a much bigger discussion.</div><div><br>
<br>
&gt;<br>
&gt; The base class for entities may have a default implementation that<br>
&gt; doesn&#39;t hurt, for example, throwing an exception or returning an e=
rror<br>
&gt; code to say that it doesn&#39;t have an EEPROM, so that inherited clas=
s<br>
&gt; doesn&#39;t need to necessarily implement functions around EEPROM. Dev=
ices<br>
&gt; are abstracted into the hwmon interface as the kernel does today, and<=
br>
&gt; we need to config the names of each input attribute to make them<br>
&gt; meaningful anyway.<br>
&gt;<br>
&gt; I do see your concerns, and I do believe this requires further<br>
&gt; research into if this model can handle all the concerns or<br>
&gt; requirements we have today.<br>
<br></div><div>
Looking forward to seeing it.</div><div><br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The existing JSON files used in the dynamic software stack c=
an only represent data, but not any control flow. This led to difficulties =
where sometimes some code is preferred to have for aiding the discovery of =
hardware topology, condensing redundant configurations, etc. With a good fr=
amework for hardware topology, combining the entity abstraction described a=
bove, developers can easily find the best places to aid the topology discov=
ery, implement hardware initialization logics, and optimize BMC tasks accor=
ding to Linux behaviors.<br>
&gt; &gt;<br>
&gt; &gt; If you need code or control flow to aid in the discovery of hardw=
are<br>
&gt; &gt; topology, write an application that exposes an interface similar =
to<br>
&gt; &gt; FruDevice, or the soon to be submitted peci-pcie.=C2=A0 These can=
 be used<br>
&gt; &gt; in entity manager configs.=C2=A0 I&#39;m not quite following what=
 &quot;redundant<br>
&gt; &gt; configurations&quot; means in this context.=C2=A0 In my experienc=
e, most<br>
&gt; &gt; redundant configurations tend to be for things like power supplie=
s, or<br>
&gt; &gt; drives, where a single device can fit in many different slots.=C2=
=A0 WIth<br>
&gt; &gt; that said, we already have an abstraction for that, so I&#39;m no=
t quite<br>
&gt; &gt; following.<br>
&gt;<br>
&gt; Please see this for a complicated discovery logic:<br>
&gt; <a href=3D"https://github.com/alex310110/bmc-proto-20q2/blob/master/do=
wnstream/board_example_a.py" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/alex310110/bmc-proto-20q2/blob/master/downstream/board_example_a.=
py</a><br>
&gt;<br>
&gt; Based on your reply, I have a concern that, if we have a hardware<br>
&gt; topology complicated enough, does that mean we should probably opt out=
<br>
&gt; of FruDevice and use downstream daemon to replace it?<br>
<br></div><div>
FruDevice is poorly named these days (sorry James).=C2=A0 It should really =
be called I2cFruEepromLocator.=C2=A0 In theory, it can handle any I2C topol=
ogy we were able to throw at it, including one that I tested that was 4 lev=
els deep.=C2=A0 If you&#39;re trying to manage an automatically detected i2=
c eeprom/mux topology, that is the tool I would expect to use.=C2=A0 With t=
hat said, you&#39;re welcome to write others, if you need to handle other t=
hings on I2C, or the static config case from above.<br>
If you&#39;re managing a different source of data (like a host driven map, =
MCTP, or out of band PCIe registers) I would expect you&#39;d likely want t=
o write another daemon that&#39;s capable of posting that topology data to =
dbus, but I would expect you can still use entity manager to consume it, an=
d apply the correct settings to sensors/busses/kernel/Fans.</div><div><br>
&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Better open source and proprietary part management<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Construct &quot;Improvements&quot; like a proprietary softwa=
re supporting plugins. The philosophy is that the architecture of &quot;Imp=
rovements&quot; should be solid enough that the community won&#39;t have to=
 modify the upstream code much. The community can look at and reference the=
 code upstream to develop their own code and configs according to their har=
dware, while the plugin-able part may be proprietary and can be kept downst=
ream without conflicts. &quot;Improvements&quot; should have a reasonable p=
lugin API to support common BMC functionality in the high level, and provid=
e common low-level APIs to support the plugins by abstracting things like h=
wmon sysfs interface. This can be implemented using a plugin system or a fl=
exible build system, as we are working on an open source project indeed. Wh=
enever we find a potential conflict between upstream and downstream, let us=
 work it out to see if it is appropriate to make it pluginable or configura=
ble via config files.<br>
&gt; &gt;<br>
&gt; &gt; I must be misreading this, as I feel like openbmc already has<br>
&gt; &gt; &quot;plugins&quot; in the form of Dbus applications.=C2=A0 Many =
applications have<br>
&gt; &gt; been written that required no modification to upstream code.=C2=
=A0 Tha API<br>
&gt; &gt; you&#39;re looking for is reasonably well defined in phosphor dbu=
s<br>
&gt; &gt; interfaces, and is intended to be reasonably stable, even if it&#=
39;s not<br>
&gt; &gt; guaranteed over time.=C2=A0 I&#39;m also a little confused at wha=
t you&#39;re<br>
&gt; &gt; calling low-level APIs.=C2=A0 hwmon sysfs is a low level API.=C2=
=A0 Are you<br>
&gt; &gt; wanting to wrap it in yet another API that&#39;s OpenBMC specific=
?<br>
&gt; &gt; &quot;can be kept downstream without conflicts&quot; - In my expe=
rience, you&#39;re<br>
&gt; &gt; going to be hard pressed to find support for supporting closed so=
urce<br>
&gt; &gt; development in an open source project.=C2=A0 That&#39;s not to sa=
y individuals<br>
&gt; &gt; aren&#39;t out there, but they tend to keep their heads down :)<b=
r>
&gt;<br>
&gt; Apologies for my wording; the low-level API may be probably called<br>
&gt; lower level libraries offered by OpenBMC. See I2CHwmonDevice in<br>
&gt; <a href=3D"https://github.com/alex310110/bmc-proto-20q2/blob/master/i2=
c.py" rel=3D"noreferrer" target=3D"_blank">https://github.com/alex310110/bm=
c-proto-20q2/blob/master/i2c.py</a><br></div><div>
I2CDevices, i2CMuxes, HWMonDevices, and i2ceeproms exist in the kernel alre=
ady, behind a well defined interface.=C2=A0 Your file feels a little bit li=
ke it&#39;s reinventing some things.=C2=A0 I&#39;m not sure whether or not =
I&#39;d be against inventing libopenbmc, but that&#39;s likely where those =
types of interfaces would need to go.<br>
It should also be noted, all of those devices are addable with only EM conf=
iguration file changes today.</div><div><br>
<br>
&gt;<br>
&gt; Although we make a lot of efforts to upstream software to the open<br>
&gt; source community as much as possible, BMC is heavily involved with<br>
&gt; hardware, and we&#39;re also restricted to hardware&#39;s restrictions=
. We are<br>
&gt; having difficulties to upstream drivers or code containing<br>
&gt; confidential hardware code names, or containing part numbers under NDA=
<br>
&gt; with vendors. Personally I was also involved with a lengthy and<br>
&gt; exhausting internal legal review to publicize a part number which is<b=
r>
&gt; under NDA with our vendor, involving email exchanges between attorneys=
<br>
&gt; in Google and our vendor&#39;s support engineer. I hope this explains =
my<br>
&gt; point. For today, these part numbers are required to pass onto dbus<br=
>
&gt; from entity-manager in order for dbus-sensors to determine the correct=
<br>
&gt; sensor daemon for them.<br>
<br></div><div>
Understood, and I&#39;ve felt your pain before.=C2=A0 I&#39;m not going to =
claim this is easily solved, but the best way IMO, is to create a downstrea=
m application for each hardware device you need to manage, and patch your e=
ntity manager configs to add the configuration data for those components to=
 your boards (or keep the board configs totally private).=C2=A0 Any changes=
 to the detection logic, or entity manager itself can be easily upstreamed.=
=C2=A0 The application boundary also means that there&#39;s a well defined =
dbus interface, and any licencing conflicts between GPL and proprietary cod=
e are resolved.</div><div><br>
<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Flexibility for alternatives<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Although hwmon sysfs interface is a good starting point for =
getting sensor reads from devices, they have their own limitations. The int=
erface does not abstract every register perfectly, especially when device r=
egisters are not designed to follow some common specs like PMBus, and it do=
es not provide controls to the devices.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I propose a Device Abstraction Layer to wrap around devices.=
 The underlying can completely map to hwmon sysfs, or allow user-space driv=
er implementation if necessary, or even hybrid. This will easily provide an=
 additional interface to bypass the driver and control the devices, while s=
till maintaining the benefit to use an off-the-shelf Linux device driver.<b=
r>
&gt; &gt;<br>
&gt; &gt; In this context, what are you calling a &quot;device&quot;?=C2=A0=
 I think everything<br>
&gt; &gt; you&#39;re looking for exists, although it sounds like it&#39;s n=
ot in the<br>
&gt; &gt; form you&#39;re wanting to see.=C2=A0 Dbus sensors already does a=
 hwmon to Dbus<br>
&gt; &gt; sensor abstraction conversion, that in some cases maps 1:1, or in=
 some<br>
&gt; &gt; cases is a &quot;hybrid&quot; as you call it.=C2=A0 Are you looki=
ng for something in<br>
&gt; &gt; the middle, so instead of going hwmon -&gt; Dbus=C2=A0 and libmct=
p -&gt; Dbus you<br>
&gt; &gt; would want hwmon -&gt; DAL -&gt; Dbus=C2=A0 and libmctp -&gt; DAL=
 -&gt; Dbus?=C2=A0 There<br>
&gt; &gt; could be some advantages here, but I have a worry that it&#39;ll =
be<br>
&gt; &gt; difficult to come up with a reasonable &quot;device&quot; api.=C2=
=A0 Devices take a<br>
&gt; &gt; lot of forms, in band, out of band, all with varying requirements=
<br>
&gt; &gt; around threading, permissions, and eventing.=C2=A0 While it&#39;s=
 possible to<br>
&gt; &gt; cover everything that&#39;s needed, I&#39;d be worried we&#39;d b=
e able to cover a<br>
&gt; &gt; majority of them.<br>
&gt;<br>
&gt; Yep, that requires some research or others&#39; experience; I&#39;m mo=
stly<br>
&gt; familiar with I2C devices in my area of work.<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Quite some existing code is heavily bound to or influenced b=
y the IPMI protocol layer that we are having right now: We use =E2=80=9Cuin=
t8_t=E2=80=9D type for I2C bus number in entity-manager for example, while =
Linux kernel can extend the logical I2C bus number to more than 512 without=
 any issues.<br>
&gt; &gt; Can you come up with a better example?=C2=A0 We&#39;ve tried to b=
e very careful<br>
&gt; &gt; to not have IPMI-specific things in the interfaces, and to make t=
hem<br>
&gt; &gt; as generic as possible.=C2=A0 In that case, uint8_t is used to re=
present<br>
&gt; &gt; the 7 bit addressing (plus read write bit) on the I2C bus itself,=
 not<br>
&gt; &gt; the uint8_t in the IPMI spec.=C2=A0 The API you listed neglected =
to handle<br>
&gt; &gt; the possibility of 11 bit I2C addressing, as it isn&#39;t very co=
mmon in<br>
&gt; &gt; practice, but the argument could certainly be made that the inter=
face<br>
&gt; &gt; should be changed to a uint16_t, and I would expect the IPMI laye=
r to<br>
&gt; &gt; simply filter addresses above 127 that it&#39;s not able to suppo=
rt.<br>
&gt;<br>
&gt; Please see getFruInfo() calls in FruDevice.cpp:<br>
&gt; <a href=3D"https://github.com/openbmc/entity-manager/blob/master/src/F=
ruDevice.cpp#L1108" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/openbmc/entity-manager/blob/master/src/FruDevice.cpp#L1108</a><br>
&gt;<br>
&gt; The uint8_t bus of getFruInfo() restricted the number of logical I2C<b=
r>
&gt; buses that we could implement in the sysfs interface, and it was<br>
&gt; unfortunately static_cast&#39;ed to uint_8 which created a bug hard to=
<br>
&gt; debug. I don&#39;t have much experience to find you more examples,<br>
&gt; however... I believe some of these can be fixed within the current<br>
&gt; architecture, nevertheless I&#39;m still trying to emphasize this conc=
ept.<br></div><div>
OH, you mean you hit a uint8_t limit on busses!=C2=A0 I don&#39;t know of a=
nyone that has crossed the 256 bus limit, so you&#39;ve clearly found a bug=
/missing feature.=C2=A0 Now it&#39;s your time to shine.=C2=A0 You&#39;ve f=
ound an issue, you know what the fix is, exactly where the code needs to go=
 and you have the ability to test it.=C2=A0 Write a patch to fix it, test t=
hat it does what you want, write up a commit message explaining exactly wha=
t you detailed above, how you tested it, and submit it to gerrit with the m=
aintainer as a reviewer.=C2=A0 The maintainer is very responsive, and you&#=
39;ll have fixed something hard to debug for the next person that runs into=
 this.</div><div><br>
<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; The current dynamic software stack emphasizes individual sen=
sors, but the BMC handles many more tasks than just only sensors. The pract=
icality of OpenBMC for hardware engineers is also hindered by the IPMI as d=
escribed above in Issue Examples.<br>
&gt; &gt; Sensors were the first thing tackled, as those are the things tha=
t<br>
&gt; &gt; tend to be the most different platform to platform, and have the =
most<br>
&gt; &gt; peculiar settings.=C2=A0 We do also handle topology to some exten=
t, as well<br>
&gt; &gt; as a lot of other commands that are not IPMI specific.=C2=A0 I ag=
ree, IPMI<br>
&gt; &gt; has its flaws, but OpenBMC also has pretty good support for Redfi=
sh,<br>
&gt; &gt; direct dbus, and upcoming MCTP if that&#39;s what you&#39;d rathe=
r use as an<br>
&gt; &gt; outbound interface.<br>
&gt;<br>
&gt; On that, I&#39;m also looking forward to the ability to read sensors<b=
r>
&gt; within the BMC console in a human-friendly way for hardware engineers,=
<br>
&gt; so that we don&#39;t have to rely on the host or network to read them<=
br>
&gt; during bring-up, or simply because we don&#39;t have RedFish ready yet=
,<br>
&gt; and hardware engineers just want to see tons of sensor readings for<br=
>
&gt; bring-up.<br>
<br></div><div>
I&#39;m not following this as anything actionable.=C2=A0 OpenBMC has IPMIto=
ol, dbus tools, i2c-tools, the Redfish GUI, the rest-dbus GUI and the Webui=
 to pick from for &quot;human friendly way for hardware engineers&quot;.=C2=
=A0 Heck, if you&#39;re feeling really enterprising, you can install the HW=
mon devices in the bash console, and CAT out the values in another.=C2=A0 I=
n this comment, are you wanting something else?=C2=A0 Surely one of those m=
eets your prototyping needs?</div><div><br>
<br>
&gt;<br>
&gt; Sorry for any confusion. I think I&#39;m trying to repeat myself by<br=
>
&gt; emphasizing on interleaving protocol layer in this paragraph. Today&#3=
9;s<br>
&gt; OpenBMC does build with this in mind, but there are still some flaws<b=
r>
&gt; left to improve, the uint8_t bus variable described above for example.=
<br>
&gt;<br></div><div>
See above.=C2=A0 Let&#39;s get that uint8_t thing fixed on master so we&#39=
;re not all talking about it here again in 6 months when the next poor pers=
on hits the same issue and spends a week debugging it.<br>
</div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"g=
mail_signature"><div dir=3D"ltr">-Ed</div></div>

--000000000000a9df2f05a8e99f86--
