Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3317C510010
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 16:10:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnkLB0ZQ2z3bbk
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 00:10:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=yieAtd3Z;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::133;
 helo=mail-lf1-x133.google.com; envelope-from=zhangjian.3032@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=yieAtd3Z; dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnkKk0KV3z2xX6
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 00:09:59 +1000 (AEST)
Received: by mail-lf1-x133.google.com with SMTP id p10so32159792lfa.12
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022 07:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:mime-version:date:message-id:subject:to:cc;
 bh=WVkSaZOcYyGapoXA2Vwfg6dyVQmhLXPg3VP5NcWt3aE=;
 b=yieAtd3Z24tEKT5jReb/rWA+ov3Zd/3UUg5Y2zP3epMc551pOUCiSejD6LhIrbdIXu
 DvE9mUaQsEbGu2y+a9mZlvS7IRovl/FKW/uAV8R4ZEpUQvRC4eUSXovPD0NK5ZJkPx6Y
 KKb/Zifrp9xdF+wE3qe4f1MF22/2DF3JzI3uNOV5rjtlTDPuRCnnqtubmO3GJSIbQq/t
 Mid3gG0aFljMP6/QyZsbNBZKn79iyL/NRJoLL+yS2/a75hozIuVMvzEcctCOO2/0FsXg
 HTIRj9cQ+8lMy6YyiMgBaS0ytx5ApRWUM5fPGhT2E3Fpm586dhct1cvjdHDz//CllLl/
 4hyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:mime-version:date:message-id:subject:to:cc;
 bh=WVkSaZOcYyGapoXA2Vwfg6dyVQmhLXPg3VP5NcWt3aE=;
 b=oYr8KYgsgw0fRuWtuJvmMTnehRoq4WsDvOrlPanA1ujOduqrvtFy1AF+nRIzbzxlfm
 7FxJQfTVHxlziyKUZ4Pgtih4CTJr95+f2UWiYmGi0LfrmaMVa94wuqdZWyK2mLfS3bMC
 jpJICHiCeiirJwCiFNa+i4EDa2swbv4S5CHkKFrtTW0LITKssV5ZFabZeB8RaQDaSVn3
 0IEM4VwQCve5Iu4tnqhGXggVKy8ZzjyGJXCyM3saFuA7B50Y6g/zuG9K3ntEnH3PAebq
 ghdcrI+seFOvvKJH/R0RDrPIA/jwik1fNiCfm6BXmVF2LMbnUBRjHo3BQIuGJcyJfelu
 Hq8A==
X-Gm-Message-State: AOAM533QsMf/BYb1JC4hvQeJ/wmlL/2gH/CZQt81tT6E+/VBi+EvEtPm
 6mEu55W07WIBQ3ev5Qjs5yVpVNfgM1ubi2UwlDXaLLX0dig=
X-Google-Smtp-Source: ABdhPJzr82T8B5YmUW6ZAmbw4kqqHwnB8WzCOGA1O6wFiUTaifBtPa2ddT8bhYNFjpnq4sw3TRYeImKFXPn3lJyKFug=
X-Received: by 2002:ac2:4207:0:b0:442:bf8b:eee with SMTP id
 y7-20020ac24207000000b00442bf8b0eeemr16802004lfh.536.1650982194584; Tue, 26
 Apr 2022 07:09:54 -0700 (PDT)
Received: from 349319672217 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 Apr 2022 07:09:53 -0700
From: =?UTF-8?B?5byg5YGl?= <zhangjian.3032@bytedance.com>
Mime-Version: 1.0
Date: Tue, 26 Apr 2022 07:09:53 -0700
Message-ID: <CA+J-oUs6V5HGw9kekOW0YAbpTC-P79WWZti21tJ1n86pMsVKiw@mail.gmail.com>
Subject: aspeed: spi driver: fmc wdt2
To: openbmc <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000003d419d05dd8f3f73"
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
Cc: "joel@jms.id.au" <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000003d419d05dd8f3f73
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guys;

I would like implement the flash toggle function in ast2600.
That function about ast2400/2500 implement at linux/aspeed_wdt.c at
aspeed-master-v5.15 =C2=B7 AspeedTech-BMC/linux (
<https://github.com/AspeedTech-BMC/linux/blob/aspeed-master-v5.15/drivers/w=
atchdog/aspeed_wdt.c#L172>
github.com
<https://github.com/AspeedTech-BMC/linux/blob/aspeed-master-v5.15/drivers/w=
atchdog/aspeed_wdt.c#L172>
)
<https://github.com/AspeedTech-BMC/linux/blob/aspeed-master-v5.15/drivers/w=
atchdog/aspeed_wdt.c#L172>

Here is my design, just an idea. I would like to see your suggestions.
Thanks.

There are some differences between ast2600 and ast2500/2400. For the
ast2600 SoC abr function, there is a set of registers named `FMC_WDT2` in
FMC(SPI).
FMC_WDT2 is not a full function WDT, thus, I can't use aspeed_wdt driver to
do that.

In ast2400/2500 used a sysfs attr `access_cs0`, can make cs0->cs1 and
cs1->cs0.
For cs0->cs1, ast2400/2500 use the wdt2's self timer, cs1->cs0, use
`access_cs0` to set the `flash indicate` bit.
But ast2600 without the FMC_WDT2 timer driver to trigger `cs0`->`cs1`,
thus, I would like to add 2 sysfs attrs in spi driver.
Because ast2600 supports single image abr mode, i'd like to use
primary/backup instead of cs0/1.

attr1 "access_backup": (only appears in primary and compatible is
"aspeed,ast2600-fmc")
store: The parameter is the timeout time for fmc_wdt2, if written, timer
will be enabled, if timeout, will reboot from backup.
show: the time left in fmc_wdt2 timer. 0 means timer is not enabled.

attr2 "access_primary=E2=80=9D: (only appears in backup, and compatible is
"aspeed,ast2600-fmc")
store: Non-zero values indicate access to primary, 0 indicate access to
backup
show: 0: next reboot will boot from backup, 1 : will boot from primary.

--0000000000003d419d05dd8f3f73
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div id=3D"editor_version_1.8.2_0Geb3zgM"><div style=3D"white-space:pre;whi=
te-space:pre-wrap;margin-top:4px;margin-bottom:4px;line-height:1.6">Hi Guys=
;
</div><div style=3D"white-space:pre;white-space:pre-wrap;margin-top:4px;mar=
gin-bottom:4px;line-height:1.6"><br></div><div style=3D"white-space:pre;whi=
te-space:pre-wrap;margin-top:4px;margin-bottom:4px;line-height:1.6">I would=
 like implement the flash  toggle function in ast2600.
</div><div style=3D"white-space:pre;white-space:pre-wrap;margin-top:4px;mar=
gin-bottom:4px;line-height:1.6">That function about ast2400/2500 implement =
at  <a href=3D"https://github.com/AspeedTech-BMC/linux/blob/aspeed-master-v=
5.15/drivers/watchdog/aspeed_wdt.c#L172" target=3D"_blank" rel=3D"noopener =
noreferrer" style=3D"margin-right:2px;text-decoration:none;color:rgb(51,112=
,255)">linux/aspeed_wdt.c at aspeed-master-v5.15 =C2=B7 AspeedTech-BMC/linu=
x (</a><a href=3D"https://github.com/AspeedTech-BMC/linux/blob/aspeed-maste=
r-v5.15/drivers/watchdog/aspeed_wdt.c#L172" target=3D"_blank" rel=3D"noopen=
er noreferrer" style=3D"margin-right:2px;text-decoration:none;color:rgb(51,=
112,255)">github.com</a><a href=3D"https://github.com/AspeedTech-BMC/linux/=
blob/aspeed-master-v5.15/drivers/watchdog/aspeed_wdt.c#L172" target=3D"_bla=
nk" rel=3D"noopener noreferrer" style=3D"margin-right:2px;text-decoration:n=
one;color:rgb(51,112,255)">)</a>
</div><div style=3D"white-space:pre;white-space:pre-wrap;margin-top:4px;mar=
gin-bottom:4px;line-height:1.6"><br></div><div style=3D"white-space:pre;whi=
te-space:pre-wrap;margin-top:4px;margin-bottom:4px;line-height:1.6">Here is=
 my design, just an idea. I would like to see your suggestions. Thanks.
</div><div style=3D"white-space:pre;white-space:pre-wrap;margin-top:4px;mar=
gin-bottom:4px;line-height:1.6"><br></div><div style=3D"white-space:pre;whi=
te-space:pre-wrap;margin-top:4px;margin-bottom:4px;line-height:1.6">There a=
re some differences between ast2600 and ast2500/2400. For the ast2600 SoC a=
br function, there is a set of registers named `FMC_WDT2` in FMC(SPI).
</div><div style=3D"white-space:pre;white-space:pre-wrap;margin-top:4px;mar=
gin-bottom:4px;line-height:1.6">FMC_WDT2 is not a full function WDT, thus, =
I can&#39;t use aspeed_wdt driver to do that.
</div><div style=3D"white-space:pre;white-space:pre-wrap;margin-top:4px;mar=
gin-bottom:4px;line-height:1.6"><br></div><div style=3D"white-space:pre;whi=
te-space:pre-wrap;margin-top:4px;margin-bottom:4px;line-height:1.6">In ast2=
400/2500 used a sysfs attr `access_cs0`, can make cs0-&gt;cs1 and cs1-&gt;c=
s0.
</div><div style=3D"white-space:pre;white-space:pre-wrap;margin-top:4px;mar=
gin-bottom:4px;line-height:1.6">For cs0-&gt;cs1, ast2400/2500 use the wdt2&=
#39;s self timer, cs1-&gt;cs0, use `access_cs0` to set the `flash indicate`=
 bit.
</div><div style=3D"white-space:pre;white-space:pre-wrap;margin-top:4px;mar=
gin-bottom:4px;line-height:1.6">But ast2600 without the FMC_WDT2 timer driv=
er to trigger `cs0`-&gt;`cs1`, thus, I would like to add 2 sysfs attrs in s=
pi driver.
</div><div style=3D"white-space:pre;white-space:pre-wrap;margin-top:4px;mar=
gin-bottom:4px;line-height:1.6">Because ast2600 supports single image abr m=
ode, i&#39;d like to use primary/backup instead of cs0/1.
</div><div style=3D"white-space:pre;white-space:pre-wrap;margin-top:4px;mar=
gin-bottom:4px;line-height:1.6"><br></div><div style=3D"white-space:pre;whi=
te-space:pre-wrap;margin-top:4px;margin-bottom:4px;line-height:1.6">attr1 &=
quot;access_backup&quot;: (only appears in primary and compatible is &quot;=
aspeed,ast2600-fmc&quot;)
</div><div style=3D"white-space:pre;white-space:pre-wrap;margin-top:4px;mar=
gin-bottom:4px;line-height:1.6">    store: The parameter is the timeout tim=
e for fmc_wdt2, if written, timer will be enabled, if timeout, will reboot =
from backup.
</div><div style=3D"white-space:pre;white-space:pre-wrap;margin-top:4px;mar=
gin-bottom:4px;line-height:1.6">    show: the time left  in fmc_wdt2 timer.=
 0 means timer is not enabled.
</div><div style=3D"white-space:pre;white-space:pre-wrap;margin-top:4px;mar=
gin-bottom:4px;line-height:1.6"><br></div><div style=3D"white-space:pre;whi=
te-space:pre-wrap;margin-top:4px;margin-bottom:4px;line-height:1.6">attr2 &=
quot;access_primary=E2=80=9D: (only appears in backup, and compatible is &q=
uot;aspeed,ast2600-fmc&quot;)
</div><div style=3D"white-space:pre;white-space:pre-wrap;margin-top:4px;mar=
gin-bottom:4px;line-height:1.6">    store: Non-zero values indicate access =
to primary, 0 indicate access to backup
</div><div style=3D"white-space:pre;white-space:pre-wrap;margin-top:4px;mar=
gin-bottom:4px;line-height:1.6">    show: 0: next reboot will boot from bac=
kup, 1 : will boot from primary.
</div><div style=3D"white-space:pre;white-space:pre-wrap;margin-top:4px;mar=
gin-bottom:4px;line-height:1.6"><br></div><div style=3D"white-space:pre;whi=
te-space:pre-wrap;margin-top:4px;margin-bottom:4px;line-height:1.6"><br></d=
iv><div style=3D"white-space:pre;white-space:pre-wrap;margin-top:4px;margin=
-bottom:4px;line-height:1.6"><br></div><div style=3D"white-space:pre;white-=
space:pre-wrap;margin-top:4px;margin-bottom:4px;line-height:1.6"><br></div>=
</div>

--0000000000003d419d05dd8f3f73--
