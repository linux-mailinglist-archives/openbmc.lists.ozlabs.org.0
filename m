Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD4353F6DB
	for <lists+openbmc@lfdr.de>; Tue,  7 Jun 2022 09:07:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHLyQ3JKpz3bkv
	for <lists+openbmc@lfdr.de>; Tue,  7 Jun 2022 17:07:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HRFwjniT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com; envelope-from=srid.11486@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HRFwjniT;
	dkim-atps=neutral
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHLy06JrCz2yRK
	for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2022 17:06:47 +1000 (AEST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-30c2f288f13so165361037b3.7
        for <openbmc@lists.ozlabs.org>; Tue, 07 Jun 2022 00:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nYvY4FSgGyPJkEOz3erAyc4FH1veKBHmK5cSnkHYsa0=;
        b=HRFwjniTZrJ49DQBaiK5DZGvw32uAWxbSEmrLChoMWlm1oqvpnvwlssP12i9JdTekN
         /0504B2k6pSPZPsWAFk2zrRzhmCBiC2HQNfQ8zWVgKu4TnjY/7JU3cYIQ5OSN0R89hw8
         cX5ILoAxbRO7UFBj9ehnaZQWomk5zadRmy0RCLoJTe+JeVlXK30U2kqDDkL4WbdZ454A
         OM10e0a2dnjneJJqfy4S2NkSYpE0uVvZob+dQddL8I9upE8LBwVouOcx5Lb3aJWJBBh/
         AiDzsmKbqZJMTt8dUL6I0lg3is2/ynqCPc5nPj1XZpFgOFAbLXFl5cTB1EC2I6oAzRn7
         eMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nYvY4FSgGyPJkEOz3erAyc4FH1veKBHmK5cSnkHYsa0=;
        b=PyjDX0LuyW9ajGjSZk6epZZAREwAaJz/D8msb/Ao8tTAMs+DsUpLumOFb6TEp9S09M
         NrZ0a4rl39LT+ircds0LWJhYQtcGFLUtI65XkvX0AyXQTbOY1oInwkCHxy20msZqs7V1
         Q9V/9AQp4wuw7YpTCeXwZoxh3UXl3OKF8IDpVYIA34i+8t4NClLPtFos1APwS8siC7Ea
         uSKEyQPI+8olzazzp7yT9N0GYQIO4kRCdMp90Qze4RTruRG5c7WkGpHqerv/iSTrVjic
         pg7FlLzcMcTN9jwseh3LTbPJ9IjqFpOIfdob5tokX+UmT2rMos6m+FEiSefK7hAFhlPj
         oSNQ==
X-Gm-Message-State: AOAM530tGO7Ptczr5RnN/ry89KXGzgbrg80BVut/jMIoIvARtcU1BTuC
	VXOSHyImlU7LyvBgGJfn8Dq5mU5ASy7dDAiEVDvddy1y
X-Google-Smtp-Source: ABdhPJxR50KLGxb48jZl8iXnfF9KN350Zw7XDtkeYTe55ESniN8eR44/LLQjPKsNUhhmtRBHvxSL40buHL7WMm5tvQA=
X-Received: by 2002:a0d:cd04:0:b0:300:4784:caa3 with SMTP id
 p4-20020a0dcd04000000b003004784caa3mr29880081ywd.231.1654585603337; Tue, 07
 Jun 2022 00:06:43 -0700 (PDT)
MIME-Version: 1.0
References: <CALXuKJetn8x+z0xrn_9WJEtt0NyZQa2-Br8irggi7Djk-U8Xmg@mail.gmail.com>
In-Reply-To: <CALXuKJetn8x+z0xrn_9WJEtt0NyZQa2-Br8irggi7Djk-U8Xmg@mail.gmail.com>
From: Jayashree D <srid.11486@gmail.com>
Date: Tue, 7 Jun 2022 12:36:30 +0530
Message-ID: <CALXuKJetkkPPCWZT8T24LFkfkYhqJzOi7oPdtLDOTH2VROHf8Q@mail.gmail.com>
Subject: Re: Physical LED Design Proposal
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000233f9705e0d63b6c"
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
Cc: spinler@us.ibm.com, andrew@aj.id.au, jayashree-d@hcl.com, bradleyb@fuzziesquirrel.com, velumanit@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000233f9705e0d63b6c
Content-Type: text/plain; charset="UTF-8"

Hi Team,

Could you please provide your suggestions on the above design for LED.

Thanks,
Jayashree


On Fri, May 27, 2022 at 12:42 PM Jayashree D <srid.11486@gmail.com> wrote:

> Hi Team,
>
> Problem Description :
>
> In the existing phosphor-led-sysfs design, it exposes one service per LED.
> Therefore, multiple services will be created for multiple GPIO pins
> configured for LED. To abstract this method and also to create LEDs under a
> single service, a new implementation is proposed.
>
> Existing Implementation :
>
> 1. Physical Leds are defined in the device tree under "leds" section.
> 2. Corresponding GPIO pin are defined for the physical LEDs.
> 3. "udev rules" are used to monitor the physical LEDs.
> 4. Once the LED in initialized in device tree, udev event will be created
> and it will trigger a systemd service for that LED.
> 5. Therefore, if multiple GPIO pins are configured for LEDs, then it will
> create a multiple systemd services (xyz.openbmc_project.led.controller@.service)
> for phosphor-led-sysfs based on the LED name.
>
> Example :
>
> busctl tree xyz.openbmc_project.LED.Controller.led1
> `-/xyz
>   `-/xyz/openbmc_project
>     `-/xyz/openbmc_project/led
>       `-/xyz/openbmc_project/led/physical
>         `-/xyz/openbmc_project/led/physical/led1
>
> busctl tree xyz.openbmc_project.LED.Controller.led2
> `-/xyz
>   `-/xyz/openbmc_project
>     `-/xyz/openbmc_project/led
>       `-/xyz/openbmc_project/led/physical
>         `-/xyz/openbmc_project/led/physical/led2
>
>
>
> New Implementation :
>
> 1. Physical Leds are defined in the device tree under "leds" section.
> 2. Corresponding GPIO pin are defined for the physical LEDs.
> 3. "udev rules" are used to monitor the physical LEDs.
> 4. Once the udev event is initialized for the LED, it will store those LED
> name using the script in udev instead of triggering systemd   service.
> 5. Phosphor-led-sysfs will have a single systemd service
> (xyz.openbmc_project.led.controller.service) running by default at system
> startup.
> 6. A dbus method call will be exposed from the service. udev will notify
> the LEDs detected in the driver.
>
> Example :
>
> busctl tree xyz.openbmc_project.LED.Controller
> `-/xyz
>   `-/xyz/openbmc_project
>     `-/xyz/openbmc_project/led
>       `-/xyz/openbmc_project/led/physical
>         `-/xyz/openbmc_project/led/physical/led1
>         `-/xyz/openbmc_project/led/physical/led2
>
>
> This was already discussed in the previous mail thread. Please refer to
> the below link.
> https://lists.ozlabs.org/pipermail/openbmc/2022-April/030272.html
>
> Please provide your suggestions on this new proposal.
>
>
> Thanks
> Jayashree
>

--000000000000233f9705e0d63b6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Team,</div><div><br></div><div>Could you please pr=
ovide your suggestions on the above design for LED.</div><div><br></div><di=
v>Thanks,</div><div>Jayashree<br></div><div><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 27, 2022=
 at 12:42 PM Jayashree D &lt;<a href=3D"mailto:srid.11486@gmail.com">srid.1=
1486@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div dir=3D"ltr"><div>Hi Team,</div><div><br></div><div>Probl=
em Description :<br><br>In the existing phosphor-led-sysfs design, it expos=
es one service per LED. Therefore, multiple services will be created for mu=
ltiple GPIO pins configured for LED. To abstract this method and also to cr=
eate LEDs under a single service, a new implementation is proposed.</div><d=
iv><br></div><div>Existing Implementation :<br>=C2=A0<br>1. Physical Leds a=
re defined in the device tree under &quot;leds&quot; section.<br>2. Corresp=
onding GPIO pin are defined for the physical LEDs.<br>3. &quot;udev rules&q=
uot; are used to monitor the physical LEDs.<br>4. Once the LED in initializ=
ed in device tree, udev event will be created and it will trigger a systemd=
 service for that LED.<br>5. Therefore, if multiple GPIO pins are configure=
d for LEDs, then it will create a multiple systemd services (xyz.openbmc_pr=
oject.led.controller@.service) for phosphor-led-sysfs based on the LED name=
.<br><br>Example :<br><br>busctl tree xyz.openbmc_project.LED.Controller.le=
d1<br>`-/xyz<br>=C2=A0 `-/xyz/openbmc_project<br>=C2=A0 =C2=A0 `-/xyz/openb=
mc_project/led<br>=C2=A0 =C2=A0 =C2=A0 `-/xyz/openbmc_project/led/physical<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 `-/xyz/openbmc_project/led/physical/led1<br>=
<br>busctl tree xyz.openbmc_project.LED.Controller.led2<br>`-/xyz<br>=C2=A0=
 `-/xyz/openbmc_project<br>=C2=A0 =C2=A0 `-/xyz/openbmc_project/led<br>=C2=
=A0 =C2=A0 =C2=A0 `-/xyz/openbmc_project/led/physical<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 `-/xyz/openbmc_project/led/physical/led2 =C2=A0 =C2=A0 =C2=A0=C2=
=A0 <br><br><br><br>New Implementation :<br><br>1. Physical Leds are define=
d in the device tree under &quot;leds&quot; section.<br>2. Corresponding GP=
IO pin are defined for the physical LEDs.<br>3. &quot;udev rules&quot; are =
used to monitor the physical LEDs.<br>4. Once the udev event is initialized=
 for the LED, it will store those LED name using the script in udev instead=
 of triggering systemd =C2=A0 service.<br>5. Phosphor-led-sysfs will have a=
 single systemd service (xyz.openbmc_project.led.controller.service) runnin=
g by default at system startup.<br>6. A dbus method call will be exposed fr=
om the service. udev will notify the LEDs detected in the driver.<br><br>Ex=
ample :<br><br>busctl tree xyz.openbmc_project.LED.Controller<br>`-/xyz<br>=
=C2=A0 `-/xyz/openbmc_project<br>=C2=A0 =C2=A0 `-/xyz/openbmc_project/led<b=
r>=C2=A0 =C2=A0 =C2=A0 `-/xyz/openbmc_project/led/physical<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 `-/xyz/openbmc_project/led/physical/led1<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 `-/xyz/openbmc_project/led/physical/led2<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 <br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>This was already discussed i=
n the previous mail thread. Please refer to the below link.<br><a href=3D"h=
ttps://lists.ozlabs.org/pipermail/openbmc/2022-April/030272.html" target=3D=
"_blank">https://lists.ozlabs.org/pipermail/openbmc/2022-April/030272.html<=
/a><br><br>Please provide your suggestions on this new proposal.<br><br><br=
></div><div>Thanks</div><div>Jayashree<br></div></div>
</blockquote></div>

--000000000000233f9705e0d63b6c--
