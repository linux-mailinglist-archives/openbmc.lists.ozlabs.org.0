Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AC2202D5D
	for <lists+openbmc@lfdr.de>; Mon, 22 Jun 2020 00:17:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49qn3V5zlTzDqc1
	for <lists+openbmc@lfdr.de>; Mon, 22 Jun 2020 08:17:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=waHXRu5F; dkim-atps=neutral
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49qn2g5dXnzDqVp
 for <openbmc@lists.ozlabs.org>; Mon, 22 Jun 2020 08:16:57 +1000 (AEST)
Received: by mail-yb1-xb2d.google.com with SMTP id r18so8122250ybl.5
 for <openbmc@lists.ozlabs.org>; Sun, 21 Jun 2020 15:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yMctKWFKdAg7qYnJFJpWevBrFyqkR/2vpt7HCsRzyRk=;
 b=waHXRu5Fx2AsDxUevUyvIsAQ9tYGq3cg8zhrL5a0Ujb/El8KfUxc1ytMsagSVTdDzx
 2oAd2DYo1SIZm3KE2lDpWeUrFy1orvAQuLoynTDTiGRj/aKGMEkbvKrlaAoz0qiLDeZ9
 MLiayRE8h8sd3fkUzwjqTg9pmnvYB0SMH8MFfUsTLlJjLUqbxhSdiEKBFQkdgoX8nbUI
 bg6FXULVsf970UfW9wpERyBtFf2fH/3F662sb4esXBpHEy5ZfbRjODT7ZjpwAASub9Xn
 gKfF4iI/3GB+IwMwnIrgzMA64WZxTvrNqMClTl1orJ4UVEtkK81vQVqXU8WYNwN3AE5S
 TpGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yMctKWFKdAg7qYnJFJpWevBrFyqkR/2vpt7HCsRzyRk=;
 b=tTbaBGOXjDqzRLVwEI0ItApM+nkP5wwi/3H+7xYUaKtBbFGb3xk5RAprPk6gVwphgp
 ZZPTFkj3T8rp5Z1zi4GFkfHIKH+I+keHA/Y+vm7sCTs5pEzHQn1LSGx6yh6n2r7DnXbi
 883RBdlnh9PRxeBDgr2LARP7bEZoFZ8TjAqTL3uLj7/fqBR/eU/KmCman7tmkyl8jlaG
 gp5trJq6dA/qZcytR9psOWFVP6a4rsAFB/T3LieOs9AKu13O4fh2XATzPtb2McrDpQRn
 qPwo7ZVEC5jdwedqzsD/Fu3Q4Wr+MuaFpCFpbJNrkqYDtEqer7rZxe8iuX8QtQ46KdGg
 kcvw==
X-Gm-Message-State: AOAM531l2EaXMTVIZxWtAFrEVpVXzGSbfU5TfUWzF0i5N12yz/YeArjG
 /bdrAUAOMpCvlJungpKGz/dRYMFF4ebIZfGHLtuOPQ==
X-Google-Smtp-Source: ABdhPJzeSf6v6tAxndcwz9fWDbid4d97EBTTz0imSuSrOPQIGfWcjHslH9QKaNcbQQavFyhxk02c+SqYnukszVUzYpk=
X-Received: by 2002:a25:384f:: with SMTP id f76mr21906789yba.170.1592777814042; 
 Sun, 21 Jun 2020 15:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAA_a9xKn77KSnwPq2pEq36JGtfWctaBXOA_4vXtP+=JGszaPkg@mail.gmail.com>
In-Reply-To: <CAA_a9xKn77KSnwPq2pEq36JGtfWctaBXOA_4vXtP+=JGszaPkg@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Sun, 21 Jun 2020 15:16:42 -0700
Message-ID: <CACWQX82=MuAavxCqOerxi-Sdywh0xatb-f+1YzGyVSg74oNGqA@mail.gmail.com>
Subject: Re: Feedback on Current OpenBMC and Proposing Some Improvements ----
 "Improvements" Ideas
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

On Thu, Jun 18, 2020 at 2:29 PM Alex Qiu <xqiu@google.com> wrote:
>
> Abstraction on entities
>
> I think we need some abstraction to gather the control flow and data into=
 objects in the code to represent hardware entities. This will greatly impr=
ove debugging, hardware configuration and workaround implementation. The de=
velopers can easily find the code for the hardware or module that they are =
dealing with, and it is also clear on the location to implement a feature f=
or a specific hardware. The control flow can be abstracted into some interf=
ace functions like: onBmcInit(), onHostPowerEvent(), updateSensorReadings()=
, readEepromContent(), etc. For most of the hardware, they can use a common=
 default implementation; for special hardware, they can override the functi=
on to achieve their requirements. For example, reconfiguring a device regis=
ter when host 12V power is up; aggregating lots of temperature sensors to e=
xpose only one temperature sensor with maximum temperature; applying specia=
l handling to the emulated EEPROM described above.

One thing that seems to be implied in your model is that all control
flow for hardware entities are running as a part of a single process,
and possibly single thread.  Most of the complexity you're finding is
in the interfaces between applications, and the threading model.
Dropping to a single threaded model removes a lot of operating system
safeties that we gain by separating applications, complicates some
applications that have operations that might be long, blocking, or
need to keep internal state, and makes less efficient use of the
multicore core BMCs in future generations.  It also makes it harder
for distributions to "compile out" the applications and functions they
don't need (although still solvable), or solve licensing hurdles
between applications.

With that said, most of the functions you listed have multithreaded
counterparts for a given application.  I agree, we could much better
organize these, and I'm interested to see how, given the constraints
of threading, eventing, and timing we could build something that's
simpler to extend.
onBmcInit() - The OpenBMC equivalent would be on application launch.
This adds an assumption that all onBMCInit() methods are idempotent
(as an application crash can cause this to get run again without a
complete BMC reboot).  In general, for the things that aren't
idempotent here, consumers will make them idempotent with some sort of
implementation specific flag.
onHostPowerEvent() - Would be a match expression waiting for
PropertiesChanged events coming from the power subsystem.  Again, you
have to match these with your threading model.  If a power down event
occurs during a sensor read, it's application specific how it should
be handled.  From an performance standpoint, dbus also isn't great to
us here, and there is no sense in pulling down 15 copies of the same
event (although power events don't happen that often).  I agree,
setting this up is non-trivial, but there is a utils function for it.
https://github.com/openbmc/dbus-sensors/blob/63f386691107a67e5fbfeb11fbac4f=
434d7a3ee6/src/Utils.cpp#L140
 Maybe you could suggest an alternative naming in a patch?
Also, Host power is far from the only event that a FRU model needs to
handle.  Off the top of my head, NVMe insert and removal (Both via
presence detection pins and without).  Firmware attestation and
lockdown.  Boot state/driver init state.  Maybe these could all be
encapsulated within some sort of single event, but more research would
need to be done.
updateSensorReadings() - Can't really exist in the current model, as
it implies that all sensors are scanned at a fixed rate, have no
threading model, and block all other sensors.  While this is true in
some BMC proprietary stacks, this is not true on OpenBMC.  There are
many cases (like calculated CFM sensors) where values are only updated
on another event (like a fan speed changing in the case of the CFM
sensor), and there is no scan loop at all; It's entirely event driven.
There are further cases for things like ME Sensors or MCTP sensors,
where the actual "update" logic has a very high latency, but can be
pipelined with multiple requests in flight to make it more efficient.
Having a blocking "updateSensorReadings" call negates that ability,
and negates a lot of the very useful error handling cases where a
failed sensor might block.  In the dbus-sensors model, there is
nothing specifying an individual sensor's refresh rate, which lets us
make optimizations like scanning a single MCTP device at a time,
because we know both operations require the bus.
readEepromContent() - What if it's a FRU device without an EEPROM?
Fru devices can be detected many different ways, with content from the
operating system PCIe tables, or from an out of band interface.  There
are some commercial BMC stacks where all FRU devices can be assumed to
have eeproms, but in OpenBMC there are FRUs that have no eeproms, so
you can't bake that requirement into the FRU interface itself.  You
could bake it in in a more generic, key value type API, but that's
basically what Entity manager has today (for exactly this reason).
One high level idea that I'm struggling with in the ideas above that
there isn't an abstraction of similar devices.  There are many FRU
devices that contain an LM75.  The hope would be that you wouldn't
need to write the code again to access an LM75 for each possible
device, but I don't see any sort of backend on your proposal.  Maybe
mocking up a simple card as an example, with an eeprom, a couple
sensors, and a proprietary device driver, and walking through the code
one might need to create it might help solidify this?

>
> The existing JSON files used in the dynamic software stack can only repre=
sent data, but not any control flow. This led to difficulties where sometim=
es some code is preferred to have for aiding the discovery of hardware topo=
logy, condensing redundant configurations, etc. With a good framework for h=
ardware topology, combining the entity abstraction described above, develop=
ers can easily find the best places to aid the topology discovery, implemen=
t hardware initialization logics, and optimize BMC tasks according to Linux=
 behaviors.

If you need code or control flow to aid in the discovery of hardware
topology, write an application that exposes an interface similar to
FruDevice, or the soon to be submitted peci-pcie.  These can be used
in entity manager configs.  I'm not quite following what "redundant
configurations" means in this context.  In my experience, most
redundant configurations tend to be for things like power supplies, or
drives, where a single device can fit in many different slots.  WIth
that said, we already have an abstraction for that, so I'm not quite
following.
>
> Better open source and proprietary part management
>
> Construct "Improvements" like a proprietary software supporting plugins. =
The philosophy is that the architecture of "Improvements" should be solid e=
nough that the community won't have to modify the upstream code much. The c=
ommunity can look at and reference the code upstream to develop their own c=
ode and configs according to their hardware, while the plugin-able part may=
 be proprietary and can be kept downstream without conflicts. "Improvements=
" should have a reasonable plugin API to support common BMC functionality i=
n the high level, and provide common low-level APIs to support the plugins =
by abstracting things like hwmon sysfs interface. This can be implemented u=
sing a plugin system or a flexible build system, as we are working on an op=
en source project indeed. Whenever we find a potential conflict between ups=
tream and downstream, let us work it out to see if it is appropriate to mak=
e it pluginable or configurable via config files.

I must be misreading this, as I feel like openbmc already has
"plugins" in the form of Dbus applications.  Many applications have
been written that required no modification to upstream code.  Tha API
you're looking for is reasonably well defined in phosphor dbus
interfaces, and is intended to be reasonably stable, even if it's not
guaranteed over time.  I'm also a little confused at what you're
calling low-level APIs.  hwmon sysfs is a low level API.  Are you
wanting to wrap it in yet another API that's OpenBMC specific?
"can be kept downstream without conflicts" - In my experience, you're
going to be hard pressed to find support for supporting closed source
development in an open source project.  That's not to say individuals
aren't out there, but they tend to keep their heads down :)

>
> Flexibility for alternatives
>
> Although hwmon sysfs interface is a good starting point for getting senso=
r reads from devices, they have their own limitations. The interface does n=
ot abstract every register perfectly, especially when device registers are =
not designed to follow some common specs like PMBus, and it does not provid=
e controls to the devices.
>
>
> I propose a Device Abstraction Layer to wrap around devices. The underlyi=
ng can completely map to hwmon sysfs, or allow user-space driver implementa=
tion if necessary, or even hybrid. This will easily provide an additional i=
nterface to bypass the driver and control the devices, while still maintain=
ing the benefit to use an off-the-shelf Linux device driver.

In this context, what are you calling a "device"?  I think everything
you're looking for exists, although it sounds like it's not in the
form you're wanting to see.  Dbus sensors already does a hwmon to Dbus
sensor abstraction conversion, that in some cases maps 1:1, or in some
cases is a "hybrid" as you call it.  Are you looking for something in
the middle, so instead of going hwmon -> Dbus  and libmctp -> Dbus you
would want hwmon -> DAL -> Dbus  and libmctp -> DAL -> Dbus?  There
could be some advantages here, but I have a worry that it'll be
difficult to come up with a reasonable "device" api.  Devices take a
lot of forms, in band, out of band, all with varying requirements
around threading, permissions, and eventing.  While it's possible to
cover everything that's needed, I'd be worried we'd be able to cover a
majority of them.

>
> Quite some existing code is heavily bound to or influenced by the IPMI pr=
otocol layer that we are having right now: We use =E2=80=9Cuint8_t=E2=80=9D=
 type for I2C bus number in entity-manager for example, while Linux kernel =
can extend the logical I2C bus number to more than 512 without any issues.
Can you come up with a better example?  We've tried to be very careful
to not have IPMI-specific things in the interfaces, and to make them
as generic as possible.  In that case, uint8_t is used to represent
the 7 bit addressing (plus read write bit) on the I2C bus itself, not
the uint8_t in the IPMI spec.  The API you listed neglected to handle
the possibility of 11 bit I2C addressing, as it isn't very common in
practice, but the argument could certainly be made that the interface
should be changed to a uint16_t, and I would expect the IPMI layer to
simply filter addresses above 127 that it's not able to support.

> The current dynamic software stack emphasizes individual sensors, but the=
 BMC handles many more tasks than just only sensors. The practicality of Op=
enBMC for hardware engineers is also hindered by the IPMI as described abov=
e in Issue Examples.
Sensors were the first thing tackled, as those are the things that
tend to be the most different platform to platform, and have the most
peculiar settings.  We do also handle topology to some extent, as well
as a lot of other commands that are not IPMI specific.  I agree, IPMI
has its flaws, but OpenBMC also has pretty good support for Redfish,
direct dbus, and upcoming MCTP if that's what you'd rather use as an
outbound interface.

>
>
> We should have a core designed to consider varieties of tasks that BMC ma=
y be asked to handle: GPIO modifications, I2C manipulations,  The core shou=
ld not be hindered by any protocol, but the protocol layer should find its =
own way to map the core APIs to its own protocol. This will help us to tran=
sit from IPMI to Redfish.
Again, I'm having some trouble following here, as I think the "core"
that exists now is very close to what you're asking for, and anywhere
we've deviated has been very explicitly done.
GPIO modifications and inputs are handled by the libgpio abstraction
(or sysfs).   This is well documented, and has a lot of tooling
wrapped around it.  There are lots of examples, as well as
phosphor-gpio, which in some cases, can directly manage the GPIO->Dbus
conversions (disclaimer, I have not used it myself, as I tend to go
directly to libgpio when I need that ability).
I2C is handled by the linux i2c devices, or the linux i2c bus
abstraction.  Again, it's well documented with lots of tooling.  There
are lots of examples of it being used.
Neither of the above have any hindrance on any protocol, and both are
used indirectly through the abstraction in Redfish, IPMI, and the
custom REST implementation. The "core APIs" as you call them are
supported by DBus, although I suspect in your case, core implies
single producer, which dbus is not.

Hopefully the above helped,

-Ed
