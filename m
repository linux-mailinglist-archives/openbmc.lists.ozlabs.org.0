Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0AA206985
	for <lists+openbmc@lfdr.de>; Wed, 24 Jun 2020 03:31:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49s5Gg52KQzDqdc
	for <lists+openbmc@lfdr.de>; Wed, 24 Jun 2020 11:31:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::335;
 helo=mail-ot1-x335.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=eBxNEoTs; dkim-atps=neutral
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49s5Fq0tpHzDqTL
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jun 2020 11:31:09 +1000 (AEST)
Received: by mail-ot1-x335.google.com with SMTP id u23so375988otq.10
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jun 2020 18:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MKaY5c5WJ+jo64uXP1Lkm9MVyTY5RdrwU50UVJ14OjI=;
 b=eBxNEoTs5eRVA0u4uk4vp0TsOt0pqr4mKLXxhQSTecBEMDTAR9OzNyp1Z/TIwRX2hN
 EDTpVUZQg7i62NVaCLTRHZg6MMEwkmzr0hGPHLaGOvKRAcrS16jTYoWYUqQAa0ZTsU7z
 gPx2+sAEwvt5AfLOZ98ENHUR6UBvy1X55GiRJHPUWTZ53L8UpQgTEmxU7se41D21RVUh
 WdnGtG23hMpT9Pk4/FIK59ZYwZOMNmAlbRaXp7DMQJW3PSq6ozjxzWthTdXq5ywgl+gz
 WQm3o134nTGBeGdyAwuvCPa4sgUgW8UHtVIr7iMq9vgfiQJkrevF5nJgpQ0inRfoSV4d
 eZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MKaY5c5WJ+jo64uXP1Lkm9MVyTY5RdrwU50UVJ14OjI=;
 b=MP1ChbFAeheGCueAhn4pPYThrUtgDT9h769I5l88awJcHZnsw6nqC/5coVvpskfrnl
 ldfBqZU7IHanlWTL6RgXkadw1DJxBal61qUOZfiXDxzb1NDKd1eMCtVoWihrfohDPrdE
 Yd7UMPxkSDfVNnC02lSI5vQgy3ROARzikELDcIIUQ+KlsXVYw25c3LIbHYmUMhC55UI6
 pvhwUHdsAsHr8r/i9c6S433Om1cjyIB8XmeWtguYf0AJHzunamjhtrgWDJRUELr5D3m9
 nu8OgrpV83pUVAtsSBRM8opwZJ34Dxno9vwfuD4KnoPPEXfGUY/8ZWhZiCt4Jtkd4kuG
 NRfA==
X-Gm-Message-State: AOAM533oDlcor7YLM2+onElbScyKyl05+uFsGrPMUDyJWIz9d5ozPgPr
 genYigCwzCvQM+lPVMOWn2NEnedKkoUKBWir0NOstA==
X-Google-Smtp-Source: ABdhPJx6jw2dVBMdG6+lzFvLA7YlMf8rjhp1zqf8XFYkZMDz+8wd7WLEnZLxQDioMjbw/S0GPOefBMpRkx1uJmXr1d8=
X-Received: by 2002:a05:6830:3149:: with SMTP id
 c9mr20357733ots.302.1592962264065; 
 Tue, 23 Jun 2020 18:31:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAA_a9xKn77KSnwPq2pEq36JGtfWctaBXOA_4vXtP+=JGszaPkg@mail.gmail.com>
 <CACWQX82=MuAavxCqOerxi-Sdywh0xatb-f+1YzGyVSg74oNGqA@mail.gmail.com>
In-Reply-To: <CACWQX82=MuAavxCqOerxi-Sdywh0xatb-f+1YzGyVSg74oNGqA@mail.gmail.com>
From: Alex Qiu <xqiu@google.com>
Date: Tue, 23 Jun 2020 18:30:53 -0700
Message-ID: <CAA_a9xLUkr5rR5Q8YATphtmWUBEE6V=6N4=k74v8hr8PePMMAQ@mail.gmail.com>
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
 Kais Belgaied <belgaied@google.com>, Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ofer Yehielli <ofery@google.com>,
 Josh Lehan <krellan@google.com>, Richard Hanley <rhanley@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Ed,

-Internal email list
+A couple of folks who might be interested in this topic

I don't know if you saw the updated reply in the main thread, but I
foresaw some possible communication gap, so I created a simple demo to
illustrate my ideas: https://github.com/alex310110/bmc-proto-20q2
Please note that I'm not trying to code a BMC with Python, but it's
just for the ease to set up a demo fast. Other replies inlined.
Thanks!

- Alex Qiu

On Sun, Jun 21, 2020 at 3:16 PM Ed Tanous <ed@tanous.net> wrote:
>
> On Thu, Jun 18, 2020 at 2:29 PM Alex Qiu <xqiu@google.com> wrote:
> >
> > Abstraction on entities
> >
> > I think we need some abstraction to gather the control flow and data in=
to objects in the code to represent hardware entities. This will greatly im=
prove debugging, hardware configuration and workaround implementation. The =
developers can easily find the code for the hardware or module that they ar=
e dealing with, and it is also clear on the location to implement a feature=
 for a specific hardware. The control flow can be abstracted into some inte=
rface functions like: onBmcInit(), onHostPowerEvent(), updateSensorReadings=
(), readEepromContent(), etc. For most of the hardware, they can use a comm=
on default implementation; for special hardware, they can override the func=
tion to achieve their requirements. For example, reconfiguring a device reg=
ister when host 12V power is up; aggregating lots of temperature sensors to=
 expose only one temperature sensor with maximum temperature; applying spec=
ial handling to the emulated EEPROM described above.
>
> One thing that seems to be implied in your model is that all control
> flow for hardware entities are running as a part of a single process,
> and possibly single thread.  Most of the complexity you're finding is
> in the interfaces between applications, and the threading model.
> Dropping to a single threaded model removes a lot of operating system
> safeties that we gain by separating applications, complicates some
> applications that have operations that might be long, blocking, or
> need to keep internal state, and makes less efficient use of the
> multicore core BMCs in future generations.  It also makes it harder
> for distributions to "compile out" the applications and functions they
> don't need (although still solvable), or solve licensing hurdles
> between applications.
>
> With that said, most of the functions you listed have multithreaded
> counterparts for a given application.  I agree, we could much better
> organize these, and I'm interested to see how, given the constraints
> of threading, eventing, and timing we could build something that's
> simpler to extend.
> onBmcInit() - The OpenBMC equivalent would be on application launch.
> This adds an assumption that all onBMCInit() methods are idempotent
> (as an application crash can cause this to get run again without a
> complete BMC reboot).  In general, for the things that aren't
> idempotent here, consumers will make them idempotent with some sort of
> implementation specific flag.
> onHostPowerEvent() - Would be a match expression waiting for
> PropertiesChanged events coming from the power subsystem.  Again, you
> have to match these with your threading model.  If a power down event
> occurs during a sensor read, it's application specific how it should
> be handled.  From an performance standpoint, dbus also isn't great to
> us here, and there is no sense in pulling down 15 copies of the same
> event (although power events don't happen that often).  I agree,
> setting this up is non-trivial, but there is a utils function for it.
> https://github.com/openbmc/dbus-sensors/blob/63f386691107a67e5fbfeb11fbac=
4f434d7a3ee6/src/Utils.cpp#L140
>  Maybe you could suggest an alternative naming in a patch?
> Also, Host power is far from the only event that a FRU model needs to
> handle.  Off the top of my head, NVMe insert and removal (Both via
> presence detection pins and without).  Firmware attestation and
> lockdown.  Boot state/driver init state.  Maybe these could all be
> encapsulated within some sort of single event, but more research would
> need to be done.
> updateSensorReadings() - Can't really exist in the current model, as
> it implies that all sensors are scanned at a fixed rate, have no
> threading model, and block all other sensors.  While this is true in
> some BMC proprietary stacks, this is not true on OpenBMC.  There are
> many cases (like calculated CFM sensors) where values are only updated
> on another event (like a fan speed changing in the case of the CFM
> sensor), and there is no scan loop at all; It's entirely event driven.
> There are further cases for things like ME Sensors or MCTP sensors,
> where the actual "update" logic has a very high latency, but can be
> pipelined with multiple requests in flight to make it more efficient.
> Having a blocking "updateSensorReadings" call negates that ability,
> and negates a lot of the very useful error handling cases where a
> failed sensor might block.  In the dbus-sensors model, there is
> nothing specifying an individual sensor's refresh rate, which lets us
> make optimizations like scanning a single MCTP device at a time,
> because we know both operations require the bus.
> readEepromContent() - What if it's a FRU device without an EEPROM?
> Fru devices can be detected many different ways, with content from the
> operating system PCIe tables, or from an out of band interface.  There
> are some commercial BMC stacks where all FRU devices can be assumed to
> have eeproms, but in OpenBMC there are FRUs that have no eeproms, so
> you can't bake that requirement into the FRU interface itself.  You
> could bake it in in a more generic, key value type API, but that's
> basically what Entity manager has today (for exactly this reason).
> One high level idea that I'm struggling with in the ideas above that
> there isn't an abstraction of similar devices.  There are many FRU
> devices that contain an LM75.  The hope would be that you wouldn't
> need to write the code again to access an LM75 for each possible
> device, but I don't see any sort of backend on your proposal.  Maybe
> mocking up a simple card as an example, with an eeprom, a couple
> sensors, and a proprietary device driver, and walking through the code
> one might need to create it might help solidify this?

I didn't start with multi-threading too much in mind, but It's not
necessarily a single-threaded model. As you can see in the demo, each
entity instance has its own function of update_sensors(), and the
entities are collected in the main class, which may be implemented as
a higher-level inter-process communication API for entities to adapt
to instead of merely a single main function or thread. So this model
can potentially be threaded on an entity basis, or even fork each
entity into individual processes. The model can be further threaded
within each entity into service threads: separating sensor polling
loop and event handling loop for example. But I do wonder about the
performance overhead of making every function call into IPC.

The base class for entities may have a default implementation that
doesn't hurt, for example, throwing an exception or returning an error
code to say that it doesn't have an EEPROM, so that inherited class
doesn't need to necessarily implement functions around EEPROM. Devices
are abstracted into the hwmon interface as the kernel does today, and
we need to config the names of each input attribute to make them
meaningful anyway.

I do see your concerns, and I do believe this requires further
research into if this model can handle all the concerns or
requirements we have today.

>
> >
> > The existing JSON files used in the dynamic software stack can only rep=
resent data, but not any control flow. This led to difficulties where somet=
imes some code is preferred to have for aiding the discovery of hardware to=
pology, condensing redundant configurations, etc. With a good framework for=
 hardware topology, combining the entity abstraction described above, devel=
opers can easily find the best places to aid the topology discovery, implem=
ent hardware initialization logics, and optimize BMC tasks according to Lin=
ux behaviors.
>
> If you need code or control flow to aid in the discovery of hardware
> topology, write an application that exposes an interface similar to
> FruDevice, or the soon to be submitted peci-pcie.  These can be used
> in entity manager configs.  I'm not quite following what "redundant
> configurations" means in this context.  In my experience, most
> redundant configurations tend to be for things like power supplies, or
> drives, where a single device can fit in many different slots.  WIth
> that said, we already have an abstraction for that, so I'm not quite
> following.

Please see this for a complicated discovery logic:
https://github.com/alex310110/bmc-proto-20q2/blob/master/downstream/board_e=
xample_a.py

Based on your reply, I have a concern that, if we have a hardware
topology complicated enough, does that mean we should probably opt out
of FruDevice and use downstream daemon to replace it?

> >
> > Better open source and proprietary part management
> >
> > Construct "Improvements" like a proprietary software supporting plugins=
. The philosophy is that the architecture of "Improvements" should be solid=
 enough that the community won't have to modify the upstream code much. The=
 community can look at and reference the code upstream to develop their own=
 code and configs according to their hardware, while the plugin-able part m=
ay be proprietary and can be kept downstream without conflicts. "Improvemen=
ts" should have a reasonable plugin API to support common BMC functionality=
 in the high level, and provide common low-level APIs to support the plugin=
s by abstracting things like hwmon sysfs interface. This can be implemented=
 using a plugin system or a flexible build system, as we are working on an =
open source project indeed. Whenever we find a potential conflict between u=
pstream and downstream, let us work it out to see if it is appropriate to m=
ake it pluginable or configurable via config files.
>
> I must be misreading this, as I feel like openbmc already has
> "plugins" in the form of Dbus applications.  Many applications have
> been written that required no modification to upstream code.  Tha API
> you're looking for is reasonably well defined in phosphor dbus
> interfaces, and is intended to be reasonably stable, even if it's not
> guaranteed over time.  I'm also a little confused at what you're
> calling low-level APIs.  hwmon sysfs is a low level API.  Are you
> wanting to wrap it in yet another API that's OpenBMC specific?
> "can be kept downstream without conflicts" - In my experience, you're
> going to be hard pressed to find support for supporting closed source
> development in an open source project.  That's not to say individuals
> aren't out there, but they tend to keep their heads down :)

Apologies for my wording; the low-level API may be probably called
lower level libraries offered by OpenBMC. See I2CHwmonDevice in
https://github.com/alex310110/bmc-proto-20q2/blob/master/i2c.py

Although we make a lot of efforts to upstream software to the open
source community as much as possible, BMC is heavily involved with
hardware, and we're also restricted to hardware's restrictions. We are
having difficulties to upstream drivers or code containing
confidential hardware code names, or containing part numbers under NDA
with vendors. Personally I was also involved with a lengthy and
exhausting internal legal review to publicize a part number which is
under NDA with our vendor, involving email exchanges between attorneys
in Google and our vendor's support engineer. I hope this explains my
point. For today, these part numbers are required to pass onto dbus
from entity-manager in order for dbus-sensors to determine the correct
sensor daemon for them.

>
> >
> > Flexibility for alternatives
> >
> > Although hwmon sysfs interface is a good starting point for getting sen=
sor reads from devices, they have their own limitations. The interface does=
 not abstract every register perfectly, especially when device registers ar=
e not designed to follow some common specs like PMBus, and it does not prov=
ide controls to the devices.
> >
> >
> > I propose a Device Abstraction Layer to wrap around devices. The underl=
ying can completely map to hwmon sysfs, or allow user-space driver implemen=
tation if necessary, or even hybrid. This will easily provide an additional=
 interface to bypass the driver and control the devices, while still mainta=
ining the benefit to use an off-the-shelf Linux device driver.
>
> In this context, what are you calling a "device"?  I think everything
> you're looking for exists, although it sounds like it's not in the
> form you're wanting to see.  Dbus sensors already does a hwmon to Dbus
> sensor abstraction conversion, that in some cases maps 1:1, or in some
> cases is a "hybrid" as you call it.  Are you looking for something in
> the middle, so instead of going hwmon -> Dbus  and libmctp -> Dbus you
> would want hwmon -> DAL -> Dbus  and libmctp -> DAL -> Dbus?  There
> could be some advantages here, but I have a worry that it'll be
> difficult to come up with a reasonable "device" api.  Devices take a
> lot of forms, in band, out of band, all with varying requirements
> around threading, permissions, and eventing.  While it's possible to
> cover everything that's needed, I'd be worried we'd be able to cover a
> majority of them.

Yep, that requires some research or others' experience; I'm mostly
familiar with I2C devices in my area of work.

>
> >
> > Quite some existing code is heavily bound to or influenced by the IPMI =
protocol layer that we are having right now: We use =E2=80=9Cuint8_t=E2=80=
=9D type for I2C bus number in entity-manager for example, while Linux kern=
el can extend the logical I2C bus number to more than 512 without any issue=
s.
> Can you come up with a better example?  We've tried to be very careful
> to not have IPMI-specific things in the interfaces, and to make them
> as generic as possible.  In that case, uint8_t is used to represent
> the 7 bit addressing (plus read write bit) on the I2C bus itself, not
> the uint8_t in the IPMI spec.  The API you listed neglected to handle
> the possibility of 11 bit I2C addressing, as it isn't very common in
> practice, but the argument could certainly be made that the interface
> should be changed to a uint16_t, and I would expect the IPMI layer to
> simply filter addresses above 127 that it's not able to support.

Please see getFruInfo() calls in FruDevice.cpp:
https://github.com/openbmc/entity-manager/blob/master/src/FruDevice.cpp#L11=
08

The uint8_t bus of getFruInfo() restricted the number of logical I2C
buses that we could implement in the sysfs interface, and it was
unfortunately static_cast'ed to uint_8 which created a bug hard to
debug. I don't have much experience to find you more examples,
however... I believe some of these can be fixed within the current
architecture, nevertheless I'm still trying to emphasize this concept.

>
> > The current dynamic software stack emphasizes individual sensors, but t=
he BMC handles many more tasks than just only sensors. The practicality of =
OpenBMC for hardware engineers is also hindered by the IPMI as described ab=
ove in Issue Examples.
> Sensors were the first thing tackled, as those are the things that
> tend to be the most different platform to platform, and have the most
> peculiar settings.  We do also handle topology to some extent, as well
> as a lot of other commands that are not IPMI specific.  I agree, IPMI
> has its flaws, but OpenBMC also has pretty good support for Redfish,
> direct dbus, and upcoming MCTP if that's what you'd rather use as an
> outbound interface.

On that, I'm also looking forward to the ability to read sensors
within the BMC console in a human-friendly way for hardware engineers,
so that we don't have to rely on the host or network to read them
during bring-up, or simply because we don't have RedFish ready yet,
and hardware engineers just want to see tons of sensor readings for
bring-up.

>
> >
> >
> > We should have a core designed to consider varieties of tasks that BMC =
may be asked to handle: GPIO modifications, I2C manipulations,  The core sh=
ould not be hindered by any protocol, but the protocol layer should find it=
s own way to map the core APIs to its own protocol. This will help us to tr=
ansit from IPMI to Redfish.
> Again, I'm having some trouble following here, as I think the "core"
> that exists now is very close to what you're asking for, and anywhere
> we've deviated has been very explicitly done.
> GPIO modifications and inputs are handled by the libgpio abstraction
> (or sysfs).   This is well documented, and has a lot of tooling
> wrapped around it.  There are lots of examples, as well as
> phosphor-gpio, which in some cases, can directly manage the GPIO->Dbus
> conversions (disclaimer, I have not used it myself, as I tend to go
> directly to libgpio when I need that ability).
> I2C is handled by the linux i2c devices, or the linux i2c bus
> abstraction.  Again, it's well documented with lots of tooling.  There
> are lots of examples of it being used.
> Neither of the above have any hindrance on any protocol, and both are
> used indirectly through the abstraction in Redfish, IPMI, and the
> custom REST implementation. The "core APIs" as you call them are
> supported by DBus, although I suspect in your case, core implies
> single producer, which dbus is not.

Sorry for any confusion. I think I'm trying to repeat myself by
emphasizing on interleaving protocol layer in this paragraph. Today's
OpenBMC does build with this in mind, but there are still some flaws
left to improve, the uint8_t bus variable described above for example.

>
> Hopefully the above helped,
>
> -Ed
