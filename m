Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E642B34BC
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2019 08:38:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46WxQN1N1szDqrX
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2019 16:38:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::22b; helo=mail-oi1-x22b.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bdT3iZdP"; 
 dkim-atps=neutral
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46WxPr1kJTzF4T7
 for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2019 16:37:51 +1000 (AEST)
Received: by mail-oi1-x22b.google.com with SMTP id 7so7384176oip.5
 for <openbmc@lists.ozlabs.org>; Sun, 15 Sep 2019 23:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=2Fbt5ctqPOZ7fjdbpHn6IGnUuAUjTK2yLvP81msdh0A=;
 b=bdT3iZdPWX8xHFB7raPShr1R+Q9Gr4zukhog360iOq7JMOUZHLV+CtIB7moGmj6yRN
 aACvIaOjaGZpeGzSXAi+w6plkc5YaPg3np9a+WWxCq0cBstO7oNNN9HPJKtcEiGby2AI
 yX6husfngQIZSplqvybdA7BPGMdTnRR5oOhAADvofyruI+GN5FkMSt1/VbFNgIx7k75L
 T8/UCYXfRUTer0oY7c50LRnwljZ/+ZYcoMJSkrFl8ltjUhRrPzZ0haLP+5tgxPYScaLs
 boINhfddIhLlWsbvS2hOYhWdgzXIOxtdX028ptlYLEH/S9Q3TYycotDTU2m3SjcZlkFv
 ZHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=2Fbt5ctqPOZ7fjdbpHn6IGnUuAUjTK2yLvP81msdh0A=;
 b=FN8fx5oLW3YMg4JrbTcQRSs86WRAD+Nyu6r2+GpEPpGtF8jyjHb7usD/9CyRangy+x
 3PCMnHCkN7D1YfaXEkujzGpDSaDFtxgJL9DMYCncDtPh54TFDkai8lzOGpIzs3Kn8abK
 +D1nAs7KjEalnvDpvlZbYT/ngfUmLX/2sZJVJvC/Lt1cPJGogS8wL28A5v3xAsHttPje
 JmiXL7Lz1Ioyz3aTba0gzZ7ueGYX2oBSubQs0uRhrBTg1P/pNPtp2mtO6llBFL0fbGvm
 Z/KmG0K75UhNCI8zNgs6Xy8yM/MA6XlBO6pwOxVPo4znBGv774kc4No1GVaQG9nV3V8q
 B6iw==
X-Gm-Message-State: APjAAAWjDxLGdE/LMVy3Vbjma1Fse+Suz/uylR05uaOrz1AVXDt0xacU
 +UjgfbfKLerN9rrbgrRPoJahQT0gH3NJVWPG5QfLtIAorRU=
X-Google-Smtp-Source: APXvYqwSToutL3qYg5W4x5+E4Hg21u8AWXRLAgpji5oYltL/MTxthYuWDQybaRMMOZf0tmA7P4B4GgxPqE4qKAYfL+g=
X-Received: by 2002:aca:4406:: with SMTP id r6mr12826769oia.175.1568615867947; 
 Sun, 15 Sep 2019 23:37:47 -0700 (PDT)
MIME-Version: 1.0
From: AKASH G J <akashgj91@gmail.com>
Date: Mon, 16 Sep 2019 17:37:33 +0530
Message-ID: <CAE33tLGtWJ-aJKRPt812zc1yj8TVBVxcSR1KX5_NznoVxJg7Fg@mail.gmail.com>
Subject: CurrentBMCState: BMCState.NotReady
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000991e990592a5d724"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000991e990592a5d724
Content-Type: text/plain; charset="UTF-8"

Hi all,

root@s2600wf:~# cat /etc/os-release
ID="openbmc-phosphor"
NAME="Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)"
VERSION="2.8.0-dev"
VERSION_ID="2.8.0-dev-309-g2e155a0-dirty"
PRETTY_NAME="Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)
2.8.0"
BUILD_ID="2.8.0-dev"
OPENBMC_TARGET_MACHINE="s2600wf"

The BMC console shows that the BMC state is '*Not Ready*'.

root@s2600wf:~# obmcutil state
CurrentBMCState     : xyz.openbmc_project.State.BMC.BMCState.NotReady
CurrentPowerState   : xyz.openbmc_project.State.Chassis.PowerState.Off
Error finding '/xyz/openbmc_project/state/host0' service: No such file or
directory


Regards,
Akash

--000000000000991e990592a5d724
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div><br></div><div>root@s2600wf:~# cat =
/etc/os-release <br>ID=3D&quot;openbmc-phosphor&quot;<br>NAME=3D&quot;Phosp=
hor OpenBMC (Phosphor OpenBMC Project Reference Distro)&quot;<br>VERSION=3D=
&quot;2.8.0-dev&quot;<br>VERSION_ID=3D&quot;2.8.0-dev-309-g2e155a0-dirty&qu=
ot;<br>PRETTY_NAME=3D&quot;Phosphor OpenBMC (Phosphor OpenBMC Project Refer=
ence Distro) 2.8.0&quot;<br>BUILD_ID=3D&quot;2.8.0-dev&quot;<br>OPENBMC_TAR=
GET_MACHINE=3D&quot;s2600wf&quot;</div><div><br></div><div>The BMC console =
shows that the BMC state is &#39;<b>Not Ready</b>&#39;.</div><div><br></div=
><div>root@s2600wf:~# obmcutil state<br>CurrentBMCState =C2=A0 =C2=A0 : xyz=
.openbmc_project.State.BMC.BMCState.NotReady<br>CurrentPowerState =C2=A0 : =
xyz.openbmc_project.State.Chassis.PowerState.Off<br>Error finding &#39;/xyz=
/openbmc_project/state/host0&#39; service: No such file or directory</div><=
div><br></div><div><br></div><div>Regards,</div><div>Akash<br></div></div>

--000000000000991e990592a5d724--
