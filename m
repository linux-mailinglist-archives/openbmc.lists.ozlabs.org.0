Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A09C554554
	for <lists+openbmc@lfdr.de>; Wed, 22 Jun 2022 12:41:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSg0b6sDvz3bqR
	for <lists+openbmc@lfdr.de>; Wed, 22 Jun 2022 20:41:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Hh7Vgz1q;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com; envelope-from=srid.11486@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Hh7Vgz1q;
	dkim-atps=neutral
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSg076v11z304J
	for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2022 20:40:54 +1000 (AEST)
Received: by mail-yb1-xb31.google.com with SMTP id r3so29470738ybr.6
        for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2022 03:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b1EqEs2sM3+Vlkb4D5J81Nz3czFXft/24y39D8MHCFo=;
        b=Hh7Vgz1qzViEbOjegJUdE9+vdDn2795gfIErth4l/mzntVr8lWtR1nhBtPMIBo1eJe
         6Je6jA4az+NxRAa58fiLDjyp4WY+y65xlmVrkZtgLmdqvT0gTU51C6Ajumq8YB1OMrKW
         7cuOtB33hBeLBvX+MeoBa7c8M9nXuHrFqPnrIlZvc0g/3tGx/3xf+1eaAzJBFi2TM97K
         9a/mdcFHWkAhDjfKyc7DxP9JmJekUfPLKeWemUKzGB7sZciKYnK696tlx57CIIEzvl7u
         SQhVYRNGXBCLW5+ZxZCPAiso3mRPqr37cq5INwHNqRdA05QlI2a/d7NBDrDLv8bePWZd
         alNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b1EqEs2sM3+Vlkb4D5J81Nz3czFXft/24y39D8MHCFo=;
        b=yKzZrp03XQ9BV7oEzHw7b7/zJIUvIfyE9syw1ELxCGKi65vazAW12vKcV9Tc0PdrHB
         lnqjBj95IWAZIk2jT04Zrb47dztk+lxtq+7yrYIUt9MrRMp6GyjsFjGA5nBg3uQtikkp
         0GpAodDv93piieyYG2WnAKSJ3yrm2acBWYeFuO106I2Jod/sWpAlpqR4Ledo0NL+B6/G
         6S+GBtc0V0DW4RJBAb6qBtd2pYLcaqb3fMykk+BO1I4FChjYVSmbPJn/9uWAsYqQmRmf
         ItLaMGf6mk4ZHAMqgjGv8XIZwpq8YBFaMlnw9YkTHCcW1UKu2hqUSzengU9m8IsUUu6L
         I1cw==
X-Gm-Message-State: AJIora/96QY2FNqao1G0pTIB+H4ebbJ7JEpo3yZrUJTy98125pWWNZVZ
	9KoonPkRle7a0OTwv+x6EnazSzWer2YMplaQl+VMFtAeeH8=
X-Google-Smtp-Source: AGRyM1uYE+vFhP14AQCP2BW3dFZcoTD7xHU/Qy3QjPnuLRyTfotBUa1hUf5ZDkRgKFvnQTcqDgkIvDzpuCyzBa+f8ag=
X-Received: by 2002:a25:45c5:0:b0:668:69c6:6ff9 with SMTP id
 s188-20020a2545c5000000b0066869c66ff9mr3133336yba.174.1655894451209; Wed, 22
 Jun 2022 03:40:51 -0700 (PDT)
MIME-Version: 1.0
References: <CALXuKJetn8x+z0xrn_9WJEtt0NyZQa2-Br8irggi7Djk-U8Xmg@mail.gmail.com>
 <CALXuKJetkkPPCWZT8T24LFkfkYhqJzOi7oPdtLDOTH2VROHf8Q@mail.gmail.com>
 <CAH2-KxCViS3py6bZ4EX1_V9HU2i8t3o47DG5dhUeE48s8VApAg@mail.gmail.com> <CALXuKJdau-XHxs5AEG+s+Ffd8JjuBkBfsO=ticLjqKAkjgkYQg@mail.gmail.com>
In-Reply-To: <CALXuKJdau-XHxs5AEG+s+Ffd8JjuBkBfsO=ticLjqKAkjgkYQg@mail.gmail.com>
From: Jayashree D <srid.11486@gmail.com>
Date: Wed, 22 Jun 2022 16:10:38 +0530
Message-ID: <CALXuKJe=kTOSBVBWw6J-PDcAE=8QsqgbAGJYHDfY_3Z+d-6EXg@mail.gmail.com>
Subject: Re: Physical LED Design Proposal
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000008cc9f005e206f85d"
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
Cc: spinler@us.ibm.com, andrew@aj.id.au, jayashree-d@hcl.com, Ed Tanous <edtanous@google.com>, bradleyb@fuzziesquirrel.com, velumanit@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000008cc9f005e206f85d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 Hi Team,

 Could you please provide your suggestions on the design for LED.

 Thanks,
 Jayashree

On Wed, Jun 8, 2022 at 7:42 PM Jayashree D <srid.11486@gmail.com> wrote:

>
>
> On Tue, Jun 7, 2022 at 9:41 PM Ed Tanous <edtanous@google.com> wrote:
>
>> On Tue, Jun 7, 2022 at 12:07 AM Jayashree D <srid.11486@gmail.com> wrote=
:
>> >
>> > Hi Team,
>> >
>> > Could you please provide your suggestions on the above design for LED.
>> >
>> > Thanks,
>> > Jayashree
>> >
>> >
>> > On Fri, May 27, 2022 at 12:42 PM Jayashree D <srid.11486@gmail.com>
>> wrote:
>> >>
>> >> Hi Team,
>> >>
>> >> Problem Description :
>> >>
>> >> In the existing phosphor-led-sysfs design, it exposes one service per
>> LED. Therefore, multiple services will be created for multiple GPIO pins
>> configured for LED. To abstract this method and also to create LEDs unde=
r a
>> single service, a new implementation is proposed.
>>
>> You've kind of jumped directly to a solution without spending any
>> details on why this design is necessary.  What are you trying to
>> achieve?  Why does the existing solution not work?  You allude to
>> multiple services being bad, but you don't really state why, or what's
>> preventing that from working.  This is a section labeled problem
>> description, it needs to describe the problem, ideally in much more
>> length than your solution itself.
>>
>>  The Yosemite V2 Platform combines a Power LED and a System
> Identification LED into a single bicolor blue-yellow LED per host.
> A total of 4 =C3=97 LEDs will be placed along the front edge of the board=
 in a
> grid.
> The grid will be 2=C3=97rows of 2 =C3=97 LEDs to match the layout of the =
card slots.
>
> Based on each host status, blue or yellow led needs to be blink, OFF or
> ON. Therefore, bi-color led needs to be paired as a group and exposed in
> the userspace.
>
> Based on the existing implementation in phopshor-led-sysfs, pairing group=
s
> will be difficult, since it exposes one service per LED.
>
> Therefore, refactoring the phosphor-led-sysfs repo to run under a single
> service and pair a group of LED which represents each host.
>
> >>
>> >> Existing Implementation :
>> >>
>> >> 1. Physical Leds are defined in the device tree under "leds" section.
>> >> 2. Corresponding GPIO pin are defined for the physical LEDs.
>> >> 3. "udev rules" are used to monitor the physical LEDs.
>> >> 4. Once the LED in initialized in device tree, udev event will be
>> created and it will trigger a systemd service for that LED.
>> >> 5. Therefore, if multiple GPIO pins are configured for LEDs, then it
>> will create a multiple systemd services (xyz.openbmc_project.led.control=
ler@.service)
>> for phosphor-led-sysfs based on the LED name.
>> >>
>> >> Example :
>> >>
>> >> busctl tree xyz.openbmc_project.LED.Controller.led1
>> >> `-/xyz
>> >>   `-/xyz/openbmc_project
>> >>     `-/xyz/openbmc_project/led
>> >>       `-/xyz/openbmc_project/led/physical
>> >>         `-/xyz/openbmc_project/led/physical/led1
>> >>
>> >> busctl tree xyz.openbmc_project.LED.Controller.led2
>> >> `-/xyz
>> >>   `-/xyz/openbmc_project
>> >>     `-/xyz/openbmc_project/led
>> >>       `-/xyz/openbmc_project/led/physical
>> >>         `-/xyz/openbmc_project/led/physical/led2
>> >>
>> >>
>> >>
>> >> New Implementation :
>> >>
>> >> 1. Physical Leds are defined in the device tree under "leds" section.
>> >> 2. Corresponding GPIO pin are defined for the physical LEDs.
>> >> 3. "udev rules" are used to monitor the physical LEDs.
>> >> 4. Once the udev event is initialized for the LED, it will store thos=
e
>> LED name using the script in udev instead of triggering systemd   servic=
e.
>> >> 5. Phosphor-led-sysfs will have a single systemd service
>> (xyz.openbmc_project.led.controller.service) running by default at syste=
m
>> startup.
>> >> 6. A dbus method call will be exposed from the service. udev will
>> notify the LEDs detected in the driver.
>> >>
>> >> Example :
>> >>
>> >> busctl tree xyz.openbmc_project.LED.Controller
>> >> `-/xyz
>> >>   `-/xyz/openbmc_project
>> >>     `-/xyz/openbmc_project/led
>> >>       `-/xyz/openbmc_project/led/physical
>> >>         `-/xyz/openbmc_project/led/physical/led1
>> >>         `-/xyz/openbmc_project/led/physical/led2
>> >>
>> >>
>> >> This was already discussed in the previous mail thread. Please refer
>> to the below link.
>> >> https://lists.ozlabs.org/pipermail/openbmc/2022-April/030272.html
>> >>
>> >> Please provide your suggestions on this new proposal.
>> >>
>> >>
>> >> Thanks
>> >> Jayashree
>>
>

--0000000000008cc9f005e206f85d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">=C2=A0Hi Team,<br><br>=C2=A0Could you ple=
ase provide your suggestions on the design for LED.<br><br>=C2=A0Thanks,<br=
>=C2=A0Jayashree</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Jun 8, 2022 at 7:42 PM Jayashree D &lt;<a href=3D"m=
ailto:srid.11486@gmail.com">srid.11486@gmail.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=
=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Tue, Jun 7, 2022 at 9:41 PM Ed Tanous &lt;<a href=3D"mailto=
:edtanous@google.com" target=3D"_blank">edtanous@google.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Jun 7, 2=
022 at 12:07 AM Jayashree D &lt;<a href=3D"mailto:srid.11486@gmail.com" tar=
get=3D"_blank">srid.11486@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Team,<br>
&gt;<br>
&gt; Could you please provide your suggestions on the above design for LED.=
<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Jayashree<br>
&gt;<br>
&gt;<br>
&gt; On Fri, May 27, 2022 at 12:42 PM Jayashree D &lt;<a href=3D"mailto:sri=
d.11486@gmail.com" target=3D"_blank">srid.11486@gmail.com</a>&gt; wrote:<br=
>
&gt;&gt;<br>
&gt;&gt; Hi Team,<br>
&gt;&gt;<br>
&gt;&gt; Problem Description :<br>
&gt;&gt;<br>
&gt;&gt; In the existing phosphor-led-sysfs design, it exposes one service =
per LED. Therefore, multiple services will be created for multiple GPIO pin=
s configured for LED. To abstract this method and also to create LEDs under=
 a single service, a new implementation is proposed.<br>
<br>
You&#39;ve kind of jumped directly to a solution without spending any<br>
details on why this design is necessary.=C2=A0 What are you trying to<br>
achieve?=C2=A0 Why does the existing solution not work?=C2=A0 You allude to=
<br>
multiple services being bad, but you don&#39;t really state why, or what&#3=
9;s<br>
preventing that from working.=C2=A0 This is a section labeled problem<br>
description, it needs to describe the problem, ideally in much more<br>
length than your solution itself.<br>
<br></blockquote><div>=C2=A0The Yosemite V2 Platform combines a Power LED a=
nd a System Identification LED into a single bicolor blue-yellow LED per ho=
st. <br>A total of 4 =C3=97 LEDs will be placed along the front edge of the=
 board in a grid. <br>The grid will be 2=C3=97rows of 2 =C3=97 LEDs to matc=
h the layout of the card slots.<br><br>Based on each host status, blue or y=
ellow led needs to be blink, OFF or ON. Therefore, bi-color led needs to be=
 paired as a group and exposed in the userspace. <br></div><div><br></div><=
div>Based on the existing implementation in phopshor-led-sysfs, pairing gro=
ups will be difficult, since it exposes one service per LED. <br><br>Theref=
ore, refactoring the phosphor-led-sysfs repo to run under a single service =
and pair a group of LED which represents each host.</div><div><br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
&gt;&gt;<br>
&gt;&gt; Existing Implementation :<br>
&gt;&gt;<br>
&gt;&gt; 1. Physical Leds are defined in the device tree under &quot;leds&q=
uot; section.<br>
&gt;&gt; 2. Corresponding GPIO pin are defined for the physical LEDs.<br>
&gt;&gt; 3. &quot;udev rules&quot; are used to monitor the physical LEDs.<b=
r>
&gt;&gt; 4. Once the LED in initialized in device tree, udev event will be =
created and it will trigger a systemd service for that LED.<br>
&gt;&gt; 5. Therefore, if multiple GPIO pins are configured for LEDs, then =
it will create a multiple systemd services (xyz.openbmc_project.led.control=
ler@.service) for phosphor-led-sysfs based on the LED name.<br>
&gt;&gt;<br>
&gt;&gt; Example :<br>
&gt;&gt;<br>
&gt;&gt; busctl tree xyz.openbmc_project.LED.Controller.led1<br>
&gt;&gt; `-/xyz<br>
&gt;&gt;=C2=A0 =C2=A0`-/xyz/openbmc_project<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0`-/xyz/openbmc_project/led<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0`-/xyz/openbmc_project/led/physical<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`-/xyz/openbmc_project/led/physic=
al/led1<br>
&gt;&gt;<br>
&gt;&gt; busctl tree xyz.openbmc_project.LED.Controller.led2<br>
&gt;&gt; `-/xyz<br>
&gt;&gt;=C2=A0 =C2=A0`-/xyz/openbmc_project<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0`-/xyz/openbmc_project/led<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0`-/xyz/openbmc_project/led/physical<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`-/xyz/openbmc_project/led/physic=
al/led2<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; New Implementation :<br>
&gt;&gt;<br>
&gt;&gt; 1. Physical Leds are defined in the device tree under &quot;leds&q=
uot; section.<br>
&gt;&gt; 2. Corresponding GPIO pin are defined for the physical LEDs.<br>
&gt;&gt; 3. &quot;udev rules&quot; are used to monitor the physical LEDs.<b=
r>
&gt;&gt; 4. Once the udev event is initialized for the LED, it will store t=
hose LED name using the script in udev instead of triggering systemd=C2=A0 =
=C2=A0service.<br>
&gt;&gt; 5. Phosphor-led-sysfs will have a single systemd service (xyz.open=
bmc_project.led.controller.service) running by default at system startup.<b=
r>
&gt;&gt; 6. A dbus method call will be exposed from the service. udev will =
notify the LEDs detected in the driver.<br>
&gt;&gt;<br>
&gt;&gt; Example :<br>
&gt;&gt;<br>
&gt;&gt; busctl tree xyz.openbmc_project.LED.Controller<br>
&gt;&gt; `-/xyz<br>
&gt;&gt;=C2=A0 =C2=A0`-/xyz/openbmc_project<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0`-/xyz/openbmc_project/led<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0`-/xyz/openbmc_project/led/physical<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`-/xyz/openbmc_project/led/physic=
al/led1<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0`-/xyz/openbmc_project/led/physic=
al/led2<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; This was already discussed in the previous mail thread. Please ref=
er to the below link.<br>
&gt;&gt; <a href=3D"https://lists.ozlabs.org/pipermail/openbmc/2022-April/0=
30272.html" rel=3D"noreferrer" target=3D"_blank">https://lists.ozlabs.org/p=
ipermail/openbmc/2022-April/030272.html</a><br>
&gt;&gt;<br>
&gt;&gt; Please provide your suggestions on this new proposal.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Thanks<br>
&gt;&gt; Jayashree<br>
</blockquote></div></div>
</blockquote></div></div>

--0000000000008cc9f005e206f85d--
