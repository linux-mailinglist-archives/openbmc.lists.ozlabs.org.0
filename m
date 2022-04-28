Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8E55128AC
	for <lists+openbmc@lfdr.de>; Thu, 28 Apr 2022 03:17:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kpd5v2B6Xz3bmR
	for <lists+openbmc@lfdr.de>; Thu, 28 Apr 2022 11:17:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Tgyuccl8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2e;
 helo=mail-qv1-xf2e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Tgyuccl8; dkim-atps=neutral
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kpd5V61Nlz3bd7
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2022 11:17:32 +1000 (AEST)
Received: by mail-qv1-xf2e.google.com with SMTP id iy15so2262810qvb.9
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 18:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=keGEYUAj84Yn+jAzevz2b05N0w9IWqyJSScNK7lxDsU=;
 b=Tgyuccl8mNHkosbZJ5MtKyjPLLPnwTrRbrHys4d9Fg5tYI3EcR42z0Ux7PerOE4RVe
 /Z6JaRvqPg+3tBBnQ+dGDiJBZ/6omNjdwas2BhAX2fxuR4Os4nRcVJtffBPizlJgXSqA
 VAIXf8btp6SiQ54ytVk0WzT6mYMZc7QxwKAYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=keGEYUAj84Yn+jAzevz2b05N0w9IWqyJSScNK7lxDsU=;
 b=GCm3KH6f2WkP5k6Khbl+t9nAw+pYldhK2GLfHwFI/goODHwg9zLpL0fUy2YgOfj1ja
 OqjrovOX6b7C0/jZIkIGXem9NTJwETrVAWJ4M6yvurYpe3HzmHQNpZZZ+8q+vf4h2X8J
 DHIjoBpuyPvDbh2YDuNfO5gVZMD0PZ41AYzyOQecYV0eg2dgI9X7k2VeAGmXFRMxQSRA
 caI5+rGe+jfMDVveWtRXKEqC+lqtUei1BWKFiRPrSYec9fedcpFaYcHTgR5ks0gbfpiS
 +zWpW4BtRWyK8I8LAI4xF2vl3mRWXgYnuhgPFf3nQZZIu9Y36ErJPlqXY1I5f9FCKZoH
 LNDw==
X-Gm-Message-State: AOAM533Sp0iwV4/wfJuUUB8vKfyQHby23V5CI8V7GOOT8fTdDH/BHKs2
 GZLZ5Dx0V7MyJD0NAn+jsUKbwz6jZD5JxpNeQUw=
X-Google-Smtp-Source: ABdhPJwq05tJ7BgD+IzABZ6LCMD9gqbQxWPlE/l4ecA2cvW94nBj9JKSSVrgIkjrTtK2NzjBiwVIWnXyZetGEu+gsZA=
X-Received: by 2002:a05:6214:624:b0:441:84f3:24e3 with SMTP id
 a4-20020a056214062400b0044184f324e3mr22337118qvx.27.1651108648063; Wed, 27
 Apr 2022 18:17:28 -0700 (PDT)
MIME-Version: 1.0
References: <CA+J-oUs6V5HGw9kekOW0YAbpTC-P79WWZti21tJ1n86pMsVKiw@mail.gmail.com>
In-Reply-To: <CA+J-oUs6V5HGw9kekOW0YAbpTC-P79WWZti21tJ1n86pMsVKiw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 28 Apr 2022 01:17:15 +0000
Message-ID: <CACPK8Xfz6O-vy2skpR7i=GiL0X83Kq4mgH4UzOWuu31nOsFQCA@mail.gmail.com>
Subject: Re: aspeed: spi driver: fmc wdt2
To: =?UTF-8?B?5byg5YGl?= <zhangjian.3032@bytedance.com>, 
 Lei Yu <yulei.sh@bytedance.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 26 Apr 2022 at 14:09, =E5=BC=A0=E5=81=A5 <zhangjian.3032@bytedance.=
com> wrote:
>
> Hi Guys;
>
> I would like implement the flash toggle function in ast2600.
> That function about ast2400/2500 implement at linux/aspeed_wdt.c at aspee=
d-master-v5.15 =C2=B7 AspeedTech-BMC/linux (github.com)
>
> Here is my design, just an idea. I would like to see your suggestions. Th=
anks.
>
> There are some differences between ast2600 and ast2500/2400. For the ast2=
600 SoC abr function, there is a set of registers named `FMC_WDT2` in FMC(S=
PI).
> FMC_WDT2 is not a full function WDT, thus, I can't use aspeed_wdt driver =
to do that.

Yes. There is a similar device embedded in the secure boot controller
for eMMC boot (SECA0..A8). The FMC register is better documented, but
the layout is the same.

> In ast2400/2500 used a sysfs attr `access_cs0`, can make cs0->cs1 and cs1=
->cs0.
> For cs0->cs1, ast2400/2500 use the wdt2's self timer, cs1->cs0, use `acce=
ss_cs0` to set the `flash indicate` bit.
> But ast2600 without the FMC_WDT2 timer driver to trigger `cs0`->`cs1`, th=
us, I would like to add 2 sysfs attrs in spi driver.
> Because ast2600 supports single image abr mode, i'd like to use primary/b=
ackup instead of cs0/1.

Does the ast2400/ast2500 method cs0/cs1 method work on 2600 too? If
so, should we enable the boot switch sysfs files for 2600 too?

Regarding the abr mode, could we create a piece of shared code that is
used by both the FMC and SEC. It would be called by the respective
drivers to register the sysfs files, with a pointer to the appropriate
registers.

> attr1 "access_backup": (only appears in primary and compatible is "aspeed=
,ast2600-fmc")
> store: The parameter is the timeout time for fmc_wdt2, if written, timer =
will be enabled, if timeout, will reboot from backup.
> show: the time left in fmc_wdt2 timer. 0 means timer is not enabled.
>
> attr2 "access_primary=E2=80=9D: (only appears in backup, and compatible i=
s "aspeed,ast2600-fmc")
> store: Non-zero values indicate access to primary, 0 indicate access to b=
ackup
> show: 0: next reboot will boot from backup, 1 : will boot from primary.

I think this makes sense. I'd suggest coding it up and putting it on
the list. As C=C3=A9dric mentioned, adding support to Qemu would be useful
for testing too.

A separate concern is adding support to u-boot, so u-boot can pat the
watchdog in early boot (and when sitting at the u-boot prompt).

Thanks for sending your proposal along.

Cheers,

Joel
