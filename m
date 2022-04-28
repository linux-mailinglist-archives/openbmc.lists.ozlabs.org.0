Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18483512A97
	for <lists+openbmc@lfdr.de>; Thu, 28 Apr 2022 06:32:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpjQd6HDzz2yXf
	for <lists+openbmc@lfdr.de>; Thu, 28 Apr 2022 14:32:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=CPuTkzuC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=zhangjian.3032@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=CPuTkzuC; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpjQD5F4Jz2xsW
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2022 14:32:17 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id g3so3032020pgg.3
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 21:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=xKnktYAK9IgbspkTND8ARpITXegKAjlPmwHsnfMB3T4=;
 b=CPuTkzuCWNIT/HLHreTpAGY5TgEJEofgFkVXwkZk4x+WnbEer8RGMP98fRZ+dPwCth
 a7Bet9UmCIhA6LsiKHmHmxiWKyN9PoWR7nEZfY66NcTag/hw8AXI/of5iiMRJq0KeQGy
 q+TOkRFc2CxmmUd8esmEZN/xuPdKRAXszAbqnhTqHK9uraLrlUuoeUA84Z/CczUbgNGw
 Dh3nL0bb+znyaLQMbT0+J0TUgrWwuMYQxITSE+sEarNYCsIMb9ef/fS4Nvib2zcEZLfc
 TfjGuPBpG4npoZ1KyxyKFtH3qf9UgVF4ojUkOq34JLwPmYhYqcptKZAcY2aqdaeZDbmu
 aLdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=xKnktYAK9IgbspkTND8ARpITXegKAjlPmwHsnfMB3T4=;
 b=vkO5fqQyRHDcXECjIkYM/6mg5p+3iAtHFlpnKzhGHjB/xQAytJeGr8GdfFdP5HccBQ
 RTIhnmfRBar37I0aUL6Qo0uqHxzTP06rkxTX6AoE7N3Co9r+9yM0nWXW3rU+0IN4p+RD
 RnCMQSWRrMCikfVtfA1RLaGLGg7zUHeJJSRvhPTpJBbyqZboIokAwM6kLckhdpvWwXdE
 heXnpSV+LABs/oUYgaVsr4RETiG/18UizLWJ8Kj9BvFaZ/rNgXIehuFhL0Z2hXNajZFP
 /zIvvhogX3caOu+7SuyciXB1nbkHfme7BkuCI5+qwmD/zoDAeN1rsapH4yTpRUTNBTj8
 jEpg==
X-Gm-Message-State: AOAM531zDox0X4pXFEzJ5hNkI78F8y8DQL5i/yJ1YdKJu5ZXVuBXfkl+
 uu+wzStMog10hPml1IPbConQow==
X-Google-Smtp-Source: ABdhPJy/aXfze99CEJh0/gBLEvL6P86og/ycXJSrkt6E+5nyvElIQ/+K4DXKC6hGH6RuQhB7x5Pp8A==
X-Received: by 2002:aa7:888c:0:b0:505:7832:98fc with SMTP id
 z12-20020aa7888c000000b00505783298fcmr32751130pfe.0.1651120334382; 
 Wed, 27 Apr 2022 21:32:14 -0700 (PDT)
Received: from smtpclient.apple ([139.177.225.237])
 by smtp.gmail.com with ESMTPSA id
 b20-20020a62a114000000b0050d231e08ffsm16429266pff.37.2022.04.27.21.32.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 Apr 2022 21:32:13 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [External] aspeed: spi driver: fmc wdt2
From: =?utf-8?B?5YGl5byg?= <zhangjian.3032@bytedance.com>
In-Reply-To: <CACPK8Xfz6O-vy2skpR7i=GiL0X83Kq4mgH4UzOWuu31nOsFQCA@mail.gmail.com>
Date: Thu, 28 Apr 2022 12:32:09 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <A532D24A-1754-45E8-A401-1A8B61B42CE8@bytedance.com>
References: <CA+J-oUs6V5HGw9kekOW0YAbpTC-P79WWZti21tJ1n86pMsVKiw@mail.gmail.com>
 <CACPK8Xfz6O-vy2skpR7i=GiL0X83Kq4mgH4UzOWuu31nOsFQCA@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
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
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc <openbmc@lists.ozlabs.org>,
 Lei Yu <yulei.sh@bytedance.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> 2022=E5=B9=B44=E6=9C=8828=E6=97=A5 09:17=EF=BC=8CJoel Stanley =
<joel@jms.id.au> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Tue, 26 Apr 2022 at 14:09, =E5=BC=A0=E5=81=A5 =
<zhangjian.3032@bytedance.com> wrote:
>>=20
>> Hi Guys;
>>=20
>> I would like implement the flash toggle function in ast2600.
>> That function about ast2400/2500 implement at linux/aspeed_wdt.c at =
aspeed-master-v5.15 =C2=B7 AspeedTech-BMC/linux (github.com)
>>=20
>> Here is my design, just an idea. I would like to see your =
suggestions. Thanks.
>>=20
>> There are some differences between ast2600 and ast2500/2400. For the =
ast2600 SoC abr function, there is a set of registers named `FMC_WDT2` =
in FMC(SPI).
>> FMC_WDT2 is not a full function WDT, thus, I can't use aspeed_wdt =
driver to do that.
>=20
> Yes. There is a similar device embedded in the secure boot controller
> for eMMC boot (SECA0..A8). The FMC register is better documented, but
> the layout is the same.
>=20
>> In ast2400/2500 used a sysfs attr `access_cs0`, can make cs0->cs1 and =
cs1->cs0.
>> For cs0->cs1, ast2400/2500 use the wdt2's self timer, cs1->cs0, use =
`access_cs0` to set the `flash indicate` bit.
>> But ast2600 without the FMC_WDT2 timer driver to trigger =
`cs0`->`cs1`, thus, I would like to add 2 sysfs attrs in spi driver.
>> Because ast2600 supports single image abr mode, i'd like to use =
primary/backup instead of cs0/1.
>=20
> Does the ast2400/ast2500 method cs0/cs1 method work on 2600 too? If
> so, should we enable the boot switch sysfs files for 2600 too?
  =20
   Yes, Maybe the sysfs file will be a little different.
>=20
> Regarding the abr mode, could we create a piece of shared code that is
> used by both the FMC and SEC. It would be called by the respective
> drivers to register the sysfs files, with a pointer to the appropriate
> registers
  =20
   Just read SECA0_A8, They are exactly the same, I think it=E2=80=99s =
okay.
>=20
>> attr1 "access_backup": (only appears in primary and compatible is =
"aspeed,ast2600-fmc")
>> store: The parameter is the timeout time for fmc_wdt2, if written, =
timer will be enabled, if timeout, will reboot from backup.
>> show: the time left in fmc_wdt2 timer. 0 means timer is not enabled.
>>=20
>> attr2 "access_primary=E2=80=9D: (only appears in backup, and =
compatible is "aspeed,ast2600-fmc")
>> store: Non-zero values indicate access to primary, 0 indicate access =
to backup
>> show: 0: next reboot will boot from backup, 1 : will boot from =
primary.
>=20
> I think this makes sense. I'd suggest coding it up and putting it on
> the list. As C=C3=A9dric mentioned, adding support to Qemu would be =
useful
> for testing too.

I=E2=80=99ll do that asap.
>=20
> A separate concern is adding support to u-boot, so u-boot can pat the
> watchdog in early boot (and when sitting at the u-boot prompt).
>=20

> Thanks for sending your proposal along.
>=20
> Cheers,
>=20
> Joel

