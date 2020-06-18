Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB03D1FFD62
	for <lists+openbmc@lfdr.de>; Thu, 18 Jun 2020 23:29:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nw6q659PzDqB9
	for <lists+openbmc@lfdr.de>; Fri, 19 Jun 2020 07:29:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::32f;
 helo=mail-ot1-x32f.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=uWpWy94p; dkim-atps=neutral
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nw3Y3QpjzDrL9
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jun 2020 07:26:17 +1000 (AEST)
Received: by mail-ot1-x32f.google.com with SMTP id 97so5738920otg.3
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jun 2020 14:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=QCFCQl0tSEASSz3EB6TlJMMdXU1Lb9Ex9JHQD4fWld8=;
 b=uWpWy94plxX4/DUveur2DHcQXc4fOd+pRmM6vMl1h+ZAAFSCNK795G23XVwht2iRVI
 ld3swrLcInxO654Kx0YtwXZ5JkYu8eAyMXPR2ARfHfZYjDow9/zTR0sbvTkQWQHIycKF
 BY/Qrze0jGK4MKI/O8wYzZml7P1C4bl6PYo7tYFHXfhYIn50rF3DpwvZQAhygJERMB65
 0OyG8g35V0zcM3eGFKSQZ/COeYOgb6LJaQOukzp879n7jLA3A6Y61UObniPqaecvitxn
 1Q35mSJWrVNpk7yTRzS24ZGgcgMj3Cp4Q5aHDxbIBWAcV6Cp51OwEunLvSqmWOKRj0Oj
 i+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=QCFCQl0tSEASSz3EB6TlJMMdXU1Lb9Ex9JHQD4fWld8=;
 b=pwRyZ66dpwBLyhnQJiUeqVq2d6mJJTda1m7f3JJbwc9j8eTvzqv35Rfalg1vOpE4ZJ
 lgwv9TeYaJwxZDbaI8gy6y0KJMZnOMqMTL+dN8GmvIbz9TLYBt3YXO4fepqyhtlcPIMr
 TzMRJM8qQceXDhiKrXm1tQhFcuPtEr/FX4xCvY/UM9Rw6g/kKnmUQkf+a/M/5uUvIyCk
 F6hIScTlhw/E386Z4QUtos79r7HIY/WEZrU9FnuQat5rIl9KOqIWsMrCAcK8lzZX3SXF
 bnXk1uuemmfBI9cReSKJIQgXuAkP27NwU37mi0d/KUafI9gcK5t50YQN5p/gIS4n8pHD
 /Crw==
X-Gm-Message-State: AOAM531LSxycrzMwt1gBTj293maRtLv/UbslVmrvfmyz07d2egHmNvsQ
 pf031htSG4l7bHA6jUAO874OQg3OGVeYc03ANwm3egR39rE=
X-Google-Smtp-Source: ABdhPJxRABW6FRNcpCM2w+z8CL8SV5PvFc3/I0IntwIntARifW3hC4YuHzn+jEFyrPuRBnUFmYpLqmVnaZvV8ZhNpyg=
X-Received: by 2002:a05:6830:3149:: with SMTP id
 c9mr609698ots.302.1592515574278; 
 Thu, 18 Jun 2020 14:26:14 -0700 (PDT)
MIME-Version: 1.0
From: Alex Qiu <xqiu@google.com>
Date: Thu, 18 Jun 2020 14:26:03 -0700
Message-ID: <CAA_a9xKn77KSnwPq2pEq36JGtfWctaBXOA_4vXtP+=JGszaPkg@mail.gmail.com>
Subject: Feedback on Current OpenBMC and Proposing Some Improvements ----
 "Improvements" Ideas
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000001b19f905a8626d53"
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
Cc: gBMC Discussions <gbmc-discuss@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000001b19f905a8626d53
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(Splitted from main email thread "Feedback on Current OpenBMC and Proposing
Some Improvements")

"Improvements" Ideas

With the issue examples described above, I came up with some general ideas
on how "Improvements" should look like, which I concluded them into some
high-level design ideas.
Abstraction on entities

I think we need some abstraction to gather the control flow and data into
objects in the code to represent hardware entities. This will greatly
improve debugging, hardware configuration and workaround implementation.
The developers can easily find the code for the hardware or module that
they are dealing with, and it is also clear on the location to implement a
feature for a specific hardware. The control flow can be abstracted into
some interface functions like: onBmcInit(), onHostPowerEvent(),
updateSensorReadings(), readEepromContent(), etc. For most of the hardware,
they can use a common default implementation; for special hardware, they
can override the function to achieve their requirements. For example,
reconfiguring a device register when host 12V power is up; aggregating lots
of temperature sensors to expose only one temperature sensor with maximum
temperature; applying special handling to the emulated EEPROM described
above.
Having a top-down framework of hardware topology

The existing JSON files used in the dynamic software stack can only
represent data, but not any control flow. This led to difficulties where
sometimes some code is preferred to have for aiding the discovery of
hardware topology, condensing redundant configurations, etc. With a good
framework for hardware topology, combining the entity abstraction described
above, developers can easily find the best places to aid the topology
discovery, implement hardware initialization logics, and optimize BMC tasks
according to Linux behaviors.
Better open source and proprietary part management

Construct "Improvements" like a proprietary software supporting plugins.
The philosophy is that the architecture of "Improvements" should be solid
enough that the community won't have to modify the upstream code much. The
community can look at and reference the code upstream to develop their own
code and configs according to their hardware, while the plugin-able part
may be proprietary and can be kept downstream without conflicts.
"Improvements" should have a reasonable plugin API to support common BMC
functionality in the high level, and provide common low-level APIs to
support the plugins by abstracting things like hwmon sysfs interface. This
can be implemented using a plugin system or a flexible build system, as we
are working on an open source project indeed. Whenever we find a potential
conflict between upstream and downstream, let us work it out to see if it
is appropriate to make it pluginable or configurable via config files.
Flexibility for alternatives

Although hwmon sysfs interface is a good starting point for getting sensor
reads from devices, they have their own limitations. The interface does not
abstract every register perfectly, especially when device registers are not
designed to follow some common specs like PMBus, and it does not provide
controls to the devices.

I propose a Device Abstraction Layer to wrap around devices. The underlying
can completely map to hwmon sysfs, or allow user-space driver
implementation if necessary, or even hybrid. This will easily provide an
additional interface to bypass the driver and control the devices, while
still maintaining the benefit to use an off-the-shelf Linux device driver.
Decouple protocol layers more

Quite some existing code is heavily bound to or influenced by the IPMI
protocol layer that we are having right now: We use =E2=80=9Cuint8_t=E2=80=
=9D type for I2C
bus number in entity-manager for example, while Linux kernel can extend the
logical I2C bus number to more than 512 without any issues. The current
dynamic software stack emphasizes individual sensors, but the BMC handles
many more tasks than just only sensors. The practicality of OpenBMC for
hardware engineers is also hindered by the IPMI as described above in Issue
Examples.

We should have a core designed to consider varieties of tasks that BMC may
be asked to handle: GPIO modifications, I2C manipulations,  The core should
not be hindered by any protocol, but the protocol layer should find its own
way to map the core APIs to its own protocol. This will help us to transit
from IPMI to Redfish.
Backward Compatibility

Although the current dynamic software stack configuration file naming
schema has already taken in some bad label naming like =E2=80=9CName1=E2=80=
=9D, I
understand that the community has also put in a lot of effort to the
current dynamic software stack, and would like to maintain some backward
compatibility somehow to mitigate the transition. I do not have too much
understanding of the compatibility burden that we are dealing with right
now, but just to give a couple of examples: The current JSON configuration
files can be addressed by a common topology discovery module provided as a
basis. For Device Abstraction Layer, we can start with a common module to
still use hwmon sysfs interface for sensors as a basis.

(Back to main thread)

- Alex Qiu

--0000000000001b19f905a8626d53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">(Splitted=C2=A0from main email thread &quot;Feedback on Cu=
rrent OpenBMC and Proposing Some Improvements&quot;)=C2=A0<div><br><div><sp=
an style=3D"background-color:transparent;color:rgb(0,0,0);font-family:Arial=
;font-size:20pt;white-space:pre-wrap">&quot;Improvements&quot; Ideas</span>=
<br></div><div><span id=3D"gmail-docs-internal-guid-a4273400-7fff-33bb-8fc2=
-6a4c4ddc9314"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,=
0,0);background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;vertical-align:baseline;white-space:pre-wrap">With the is=
sue examples described above, I came up with some general ideas on how &quo=
t;Improvements&quot; should look like, which I concluded them into some hig=
h-level design ideas.</span></p><h2 dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:18pt;margin-bottom:6pt"><span style=3D"font-size:16pt;font-family=
:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;vertical-align:baselin=
e;white-space:pre-wrap">Abstraction on entities</span></h2><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"f=
ont-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transpare=
nt;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-alig=
n:baseline;white-space:pre-wrap">I think we need some abstraction to gather=
 the control flow and data into objects in the code to represent hardware e=
ntities. This will greatly improve debugging, hardware configuration and wo=
rkaround implementation. The developers can easily find the code for the ha=
rdware or module that they are dealing with, and it is also clear on the lo=
cation to implement a feature for a specific hardware. The control flow can=
 be abstracted into some interface functions like: onBmcInit(), onHostPower=
Event(), updateSensorReadings(), readEepromContent(), etc. For most of the =
hardware, they can use a common default implementation; for special hardwar=
e, they can override the function to achieve their requirements. For exampl=
e, reconfiguring a device register when host 12V power is up; aggregating l=
ots of temperature sensors to expose only one temperature sensor with maxim=
um temperature; applying special handling to the emulated EEPROM described =
above.</span></p><h2 dir=3D"ltr" style=3D"line-height:1.38;margin-top:18pt;=
margin-bottom:6pt"><span style=3D"font-size:16pt;font-family:Arial;color:rg=
b(0,0,0);background-color:transparent;font-weight:400;font-variant-numeric:=
normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:p=
re-wrap">Having a top-down framework of hardware topology</span></h2><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ver=
tical-align:baseline;white-space:pre-wrap">The existing JSON files used in =
the dynamic software stack can only represent data, but not any control flo=
w. This led to difficulties where sometimes some code is preferred to have =
for aiding the discovery of hardware topology, condensing redundant configu=
rations, etc. With a good framework for hardware topology, combining the en=
tity abstraction described above, developers can easily find the best place=
s to aid the topology discovery, implement hardware initialization logics, =
and optimize BMC tasks according to Linux behaviors.</span></p><h2 dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:18pt;margin-bottom:6pt"><span styl=
e=3D"font-size:16pt;font-family:Arial;color:rgb(0,0,0);background-color:tra=
nsparent;font-weight:400;font-variant-numeric:normal;font-variant-east-asia=
n:normal;vertical-align:baseline;white-space:pre-wrap">Better open source a=
nd proprietary part management</span></h2><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;fon=
t-family:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-=
space:pre-wrap">Construct &quot;Improvements&quot; like a proprietary softw=
are supporting plugins. The philosophy is that the architecture of &quot;Im=
provements&quot; should be solid enough that the community won&#39;t have t=
o modify the upstream code much. The community can look at and reference th=
e code upstream to develop their own code and configs according to their ha=
rdware, while the plugin-able part may be proprietary and can be kept downs=
tream without conflicts. &quot;Improvements&quot; should have a reasonable =
plugin API to support common BMC functionality in the high level, and provi=
de common low-level APIs to support the plugins by abstracting things like =
hwmon sysfs interface. This can be implemented using a plugin system or a f=
lexible build system, as we are working on an open source project indeed. W=
henever we find a potential conflict between upstream and downstream, let u=
s work it out to see if it is appropriate to make it pluginable or configur=
able via config files.</span></p><h2 dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:18pt;margin-bottom:6pt"><span style=3D"font-size:16pt;font-famil=
y:Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-=
variant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseli=
ne;white-space:pre-wrap">Flexibility for alternatives</span></h2><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span styl=
e=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertica=
l-align:baseline;white-space:pre-wrap">Although hwmon sysfs interface is a =
good starting point for getting sensor reads from devices, they have their =
own limitations. The interface does not abstract every register perfectly, =
especially when device registers are not designed to follow some common spe=
cs like PMBus, and it does not provide controls to the devices.</span></p><=
br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgro=
und-color:transparent;font-variant-numeric:normal;font-variant-east-asian:n=
ormal;vertical-align:baseline;white-space:pre-wrap">I propose a Device Abst=
raction Layer to wrap around devices. The underlying can completely map to =
hwmon sysfs, or allow user-space driver implementation if necessary, or eve=
n hybrid. This will easily provide an additional interface to bypass the dr=
iver and control the devices, while still maintaining the benefit to use an=
 off-the-shelf Linux device driver.</span></p><h2 dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:18pt;margin-bottom:6pt"><span style=3D"font-size:16=
pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-wei=
ght:400;font-variant-numeric:normal;font-variant-east-asian:normal;vertical=
-align:baseline;white-space:pre-wrap">Decouple protocol layers more</span><=
/h2><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgr=
ound-color:transparent;font-variant-numeric:normal;font-variant-east-asian:=
normal;vertical-align:baseline;white-space:pre-wrap">Quite some existing co=
de is heavily bound to or influenced by the IPMI protocol layer that we are=
 having right now: We use =E2=80=9Cuint8_t=E2=80=9D type for I2C bus number=
 in entity-manager for example, while Linux kernel can extend the logical I=
2C bus number to more than 512 without any issues. The current dynamic soft=
ware stack emphasizes individual sensors, but the BMC handles many more tas=
ks than just only sensors. The practicality of OpenBMC for hardware enginee=
rs is also hindered by the IPMI as described above in Issue Examples.</span=
></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);b=
ackground-color:transparent;font-variant-numeric:normal;font-variant-east-a=
sian:normal;vertical-align:baseline;white-space:pre-wrap">We should have a =
core designed to consider varieties of tasks that BMC may be asked to handl=
e: GPIO modifications, I2C manipulations,=C2=A0 The core should not be hind=
ered by any protocol, but the protocol layer should find its own way to map=
 the core APIs to its own protocol. This will help us to transit from IPMI =
to Redfish.</span></p><h2 dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
18pt;margin-bottom:6pt"><span style=3D"font-size:16pt;font-family:Arial;col=
or:rgb(0,0,0);background-color:transparent;font-weight:400;font-variant-num=
eric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-sp=
ace:pre-wrap">Backward Compatibility</span></h2><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11=
pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-var=
iant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;=
white-space:pre-wrap">Although the current dynamic software stack configura=
tion file naming schema has already taken in some bad label naming like =E2=
=80=9CName1=E2=80=9D, I understand that the community has also put in a lot=
 of effort to the current dynamic software stack, and would like to maintai=
n some backward compatibility somehow to mitigate the transition. I do not =
have too much understanding of the compatibility burden that we are dealing=
 with right now, but just to give a couple of examples: The current JSON co=
nfiguration files can be addressed by a common topology discovery module pr=
ovided as a basis. For Device Abstraction Layer, we can start with a common=
 module to still use hwmon sysfs interface for sensors as a basis.</span></=
p></span></div><div>=C2=A0</div><div>(Back to main thread)</div><div><br cl=
ear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr">- Alex Qiu</div></div></div></div></d=
iv></div>

--0000000000001b19f905a8626d53--
