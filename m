Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E116A5359EB
	for <lists+openbmc@lfdr.de>; Fri, 27 May 2022 09:13:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8bcg3WCtz3blp
	for <lists+openbmc@lfdr.de>; Fri, 27 May 2022 17:13:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lKuGZs5i;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1129; helo=mail-yw1-x1129.google.com; envelope-from=srid.11486@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lKuGZs5i;
	dkim-atps=neutral
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L8bcD6C3jz2ypD
	for <openbmc@lists.ozlabs.org>; Fri, 27 May 2022 17:12:59 +1000 (AEST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-2ff90e0937aso38345757b3.4
        for <openbmc@lists.ozlabs.org>; Fri, 27 May 2022 00:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=TIT3y3AHhHZBiMG+uMBWG0u27Uk2750cog5r1svBEnU=;
        b=lKuGZs5iLORNakvh7k8iW8fXNEOi27g2RQQ+Pu4KRa0vU4zvav9lVYef8KHG/L4Ltn
         HNfcI/eFHFOfCBS6gsuTS9daAjE8v2eQe5OF60V1sfb6MO7gVSYO872ZOuieHRYd7HqC
         B9lAhD7bjGGLvL1UdQO4yerbr/kgADWB1+dJkxB2cul7Vno+yzFm036yi2PBq6t4vMGC
         oqYXuoLDsR0ewrNj3BIg+Osii7uW7CMZqc+Z7wlUXwwwNTuW+TJZ1cFj10Whe3wVxM6Z
         3buxq3AsVm2s1TSW2cS9w9t77cj9ZOxQk8cSb4Yop7YbRngNqaSkeiTUTT9BzxW6vnM/
         vMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=TIT3y3AHhHZBiMG+uMBWG0u27Uk2750cog5r1svBEnU=;
        b=iJXWHsr9sOQZ7uLvm2Jh6pjMOuGL1e0PFhzdIVvgb+KhPtQelavyA9QHWg1BvnDspv
         HyY3yVFiD4W1LmcxSqWXUieNbYhvxBw00SLg1NYsTt0X1ffCkC3Kf96KeyB8TxX1vM3f
         Scu+WPGvUCaE4bJMK33ir9+d2M6Z0dgRVe4yx6cpSUTXi953S1A8PkiV/CS7AT+vP1eq
         HC2BqVPrTV+lAk5Jws0gPP2zRInm6st/Yf2cHOqfphI54nqd4OUjkowBmHau+MgOhAuL
         GP09FJqDgpXDBIQLAQQv8qzXmj3SEztfShtz7QjXCgvpo5bGCFLnssRmAEXd91c9ooYb
         5NBQ==
X-Gm-Message-State: AOAM532T1aTSxOXSoILnz/ts7yCiYMPfGKApWq2g5oJVK5IVbsBz2gUK
	QBwhqgvsYjleH/yM6r3ink6tU68A63kxsR7F8k446YmV5Ss=
X-Google-Smtp-Source: ABdhPJyOnJPm/TdL8GpdYeQKn28Fdo8X91NSbPj1pnaKe/poizyQ8LPbibiUbs2fPS76i5Ku3j7+Rp7RZr+pYH6EAIc=
X-Received: by 2002:a0d:cd04:0:b0:300:4784:caa3 with SMTP id
 p4-20020a0dcd04000000b003004784caa3mr13930641ywd.231.1653635576150; Fri, 27
 May 2022 00:12:56 -0700 (PDT)
MIME-Version: 1.0
From: Jayashree D <srid.11486@gmail.com>
Date: Fri, 27 May 2022 12:42:45 +0530
Message-ID: <CALXuKJetn8x+z0xrn_9WJEtt0NyZQa2-Br8irggi7Djk-U8Xmg@mail.gmail.com>
Subject: Physical LED Design Proposal
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000001abfab05dff9099d"
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

--0000000000001abfab05dff9099d
Content-Type: text/plain; charset="UTF-8"

Hi Team,

Problem Description :

In the existing phosphor-led-sysfs design, it exposes one service per LED.
Therefore, multiple services will be created for multiple GPIO pins
configured for LED. To abstract this method and also to create LEDs under a
single service, a new implementation is proposed.

Existing Implementation :

1. Physical Leds are defined in the device tree under "leds" section.
2. Corresponding GPIO pin are defined for the physical LEDs.
3. "udev rules" are used to monitor the physical LEDs.
4. Once the LED in initialized in device tree, udev event will be created
and it will trigger a systemd service for that LED.
5. Therefore, if multiple GPIO pins are configured for LEDs, then it will
create a multiple systemd services
(xyz.openbmc_project.led.controller@.service)
for phosphor-led-sysfs based on the LED name.

Example :

busctl tree xyz.openbmc_project.LED.Controller.led1
`-/xyz
  `-/xyz/openbmc_project
    `-/xyz/openbmc_project/led
      `-/xyz/openbmc_project/led/physical
        `-/xyz/openbmc_project/led/physical/led1

busctl tree xyz.openbmc_project.LED.Controller.led2
`-/xyz
  `-/xyz/openbmc_project
    `-/xyz/openbmc_project/led
      `-/xyz/openbmc_project/led/physical
        `-/xyz/openbmc_project/led/physical/led2



New Implementation :

1. Physical Leds are defined in the device tree under "leds" section.
2. Corresponding GPIO pin are defined for the physical LEDs.
3. "udev rules" are used to monitor the physical LEDs.
4. Once the udev event is initialized for the LED, it will store those LED
name using the script in udev instead of triggering systemd   service.
5. Phosphor-led-sysfs will have a single systemd service
(xyz.openbmc_project.led.controller.service) running by default at system
startup.
6. A dbus method call will be exposed from the service. udev will notify
the LEDs detected in the driver.

Example :

busctl tree xyz.openbmc_project.LED.Controller
`-/xyz
  `-/xyz/openbmc_project
    `-/xyz/openbmc_project/led
      `-/xyz/openbmc_project/led/physical
        `-/xyz/openbmc_project/led/physical/led1
        `-/xyz/openbmc_project/led/physical/led2


This was already discussed in the previous mail thread. Please refer to the
below link.
https://lists.ozlabs.org/pipermail/openbmc/2022-April/030272.html

Please provide your suggestions on this new proposal.


Thanks
Jayashree

--0000000000001abfab05dff9099d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Team,</div><div><br></div><div>Problem Description=
 :<br><br>In the existing phosphor-led-sysfs design, it exposes one service=
 per LED. Therefore, multiple services will be created for multiple GPIO pi=
ns configured for LED. To abstract this method and also to create LEDs unde=
r a single service, a new implementation is proposed.</div><div><br></div><=
div>Existing Implementation :<br>=C2=A0<br>1. Physical Leds are defined in =
the device tree under &quot;leds&quot; section.<br>2. Corresponding GPIO pi=
n are defined for the physical LEDs.<br>3. &quot;udev rules&quot; are used =
to monitor the physical LEDs.<br>4. Once the LED in initialized in device t=
ree, udev event will be created and it will trigger a systemd service for t=
hat LED.<br>5. Therefore, if multiple GPIO pins are configured for LEDs, th=
en it will create a multiple systemd services (xyz.openbmc_project.led.cont=
roller@.service) for phosphor-led-sysfs based on the LED name.<br><br>Examp=
le :<br><br>busctl tree xyz.openbmc_project.LED.Controller.led1<br>`-/xyz<b=
r>=C2=A0 `-/xyz/openbmc_project<br>=C2=A0 =C2=A0 `-/xyz/openbmc_project/led=
<br>=C2=A0 =C2=A0 =C2=A0 `-/xyz/openbmc_project/led/physical<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 `-/xyz/openbmc_project/led/physical/led1<br><br>busctl tr=
ee xyz.openbmc_project.LED.Controller.led2<br>`-/xyz<br>=C2=A0 `-/xyz/openb=
mc_project<br>=C2=A0 =C2=A0 `-/xyz/openbmc_project/led<br>=C2=A0 =C2=A0 =C2=
=A0 `-/xyz/openbmc_project/led/physical<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 `-/x=
yz/openbmc_project/led/physical/led2 =C2=A0 =C2=A0 =C2=A0=C2=A0 <br><br><br=
><br>New Implementation :<br><br>1. Physical Leds are defined in the device=
 tree under &quot;leds&quot; section.<br>2. Corresponding GPIO pin are defi=
ned for the physical LEDs.<br>3. &quot;udev rules&quot; are used to monitor=
 the physical LEDs.<br>4. Once the udev event is initialized for the LED, i=
t will store those LED name using the script in udev instead of triggering =
systemd =C2=A0 service.<br>5. Phosphor-led-sysfs will have a single systemd=
 service (xyz.openbmc_project.led.controller.service) running by default at=
 system startup.<br>6. A dbus method call will be exposed from the service.=
 udev will notify the LEDs detected in the driver.<br><br>Example :<br><br>=
busctl tree xyz.openbmc_project.LED.Controller<br>`-/xyz<br>=C2=A0 `-/xyz/o=
penbmc_project<br>=C2=A0 =C2=A0 `-/xyz/openbmc_project/led<br>=C2=A0 =C2=A0=
 =C2=A0 `-/xyz/openbmc_project/led/physical<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
`-/xyz/openbmc_project/led/physical/led1<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 `-/=
xyz/openbmc_project/led/physical/led2<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>This was already discussed in the previous =
mail thread. Please refer to the below link.<br><a href=3D"https://lists.oz=
labs.org/pipermail/openbmc/2022-April/030272.html">https://lists.ozlabs.org=
/pipermail/openbmc/2022-April/030272.html</a><br><br>Please provide your su=
ggestions on this new proposal.<br><br><br></div><div>Thanks</div><div>Jaya=
shree<br></div></div>

--0000000000001abfab05dff9099d--
