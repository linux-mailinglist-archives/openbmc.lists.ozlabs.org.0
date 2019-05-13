Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D594C1B10D
	for <lists+openbmc@lfdr.de>; Mon, 13 May 2019 09:16:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452XDk22wxzDqFD
	for <lists+openbmc@lfdr.de>; Mon, 13 May 2019 17:16:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="S8a/VrRu"; 
 dkim-atps=neutral
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452XCv2MBgzDq9M
 for <openbmc@lists.ozlabs.org>; Mon, 13 May 2019 17:15:52 +1000 (AEST)
Received: by mail-io1-xd2d.google.com with SMTP id u2so8073378ioc.4
 for <openbmc@lists.ozlabs.org>; Mon, 13 May 2019 00:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SwM1OAeYfH/gclxHPIWvg+dGEevb03cNECLqpHlo6wU=;
 b=S8a/VrRuITXaFxTcvcLGsWVjqvzut6B3ZadQZXIPwSviJvJYjZ6MqxSS9vVyAxny2s
 cVErTlrlmN34EY/+Ql9FseB7UF8TSupiO5TOue7liwWZLUaEwrU+lubtwSqOdvLoufCc
 3Q7bHSCVuZHKQ+0GDDEAKd1Bcc16/Z+4a9WK2+Pkc7Z7mT+oVQd/zzrckM9YXmYQQmQ6
 5YwZ2FC9V4enkY9iveKJAOILvlr5uGy/wrt5Is7V3ESB9n7OFpIxIsi5GO0e+j1Ar5TI
 wYRdXo3C4bDKwyBRiGrL1Kfx9PnGyFMYkLDfzdr6KvyYA8Xurw+OM+aEi2NTPDeWp+o/
 /+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SwM1OAeYfH/gclxHPIWvg+dGEevb03cNECLqpHlo6wU=;
 b=RJeQ17lHEr9d7nHy/ENlqhCV0IKcjtxD94NpzjHj+5nqVTZYzsXt7an22ljXKeOpH7
 eu+0x2jCRBxjb9Q1CVJS9x4Fms2DrvB1+F66uXKHYlowi+LcHkZr41mQAKdXquU0W4Ti
 036d+rZxmEf+oQRYjAwuIqrz+1d6wY92+vUkodCFqGVgtzBVMSYRF3guohMsyCS9YYjt
 NjbTB8iH0hw3CuFVH5AFgqNc2ns8OvN186zP9j7Pj02AOM/1eZVr62L7EK/0UJau5/1t
 q56kL3lHNcpX22A0MNZ6a6bKiYTPMQdvJzzcIg/Jd3wYuMT8i06ReczRK1+jap3UDCT9
 6zIQ==
X-Gm-Message-State: APjAAAWaK31x+Rmb516fWvBF8l22qypBkYAgRhajd3toxm09madB8+E7
 DXnkoBu5g3nSmEiueN5797RhFPX+0DKehTYF2JVz4Xzf
X-Google-Smtp-Source: APXvYqxKWfPWgBTBq5kIdcWn9KbChhb3JXvMcNi29Vk6JCGH8nsws1BE2rFU6dQG2dK0nZj4NcdySq84ugLvr5/pII4=
X-Received: by 2002:a05:6602:146:: with SMTP id
 v6mr13906130iot.275.1557731749542; 
 Mon, 13 May 2019 00:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XeSFx7LUKch3Vy+OVKaV=3P4UVWOXBkUF0WO3iKx47NVw@mail.gmail.com>
 <9a1adf03-ee54-0674-54bc-d5c37a9ae516@linux.intel.com>
 <CACPK8XfQVySsmzUGLenPA5cM2AdCfgTzf1hO2cbqg1_D62tK8w@mail.gmail.com>
 <b211f8797d984e45bc50f65547863a39@NTILML02.nuvoton.com>
 <CACPK8XcxAYs8e_kq6XHBVYm69U6Hh4Qy6CEaLsKK7yxu63MvHQ@mail.gmail.com>
In-Reply-To: <CACPK8XcxAYs8e_kq6XHBVYm69U6Hh4Qy6CEaLsKK7yxu63MvHQ@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 13 May 2019 10:22:54 +0300
Message-ID: <CAP6Zq1iuoVRM57a8n4obppUVKm=HwZKHKmfw+SzLdeXmYzDgzA@mail.gmail.com>
Subject: Re: Moving kernel to 5.1
To: Joel Stanley <joel@jms.id.au>
Content-Type: multipart/alternative; boundary="0000000000009643d00588bfafdb"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Tomer Maimon <tomer.maimon@nuvoton.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000009643d00588bfafdb
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 May 2019 at 05:27, Joel Stanley <joel@jms.id.au> wrote:

> On Sun, 12 May 2019 at 17:19, <tomer.maimon@nuvoton.com> wrote:
> >
> > Hi Joel,
> >
> > Sorry for the late reply, we were on holiday.
> >
> > We had checked dev-5.1 on Nuvoton NPCM750 EVB and it looks fine.
> > There is a minor change that need to done in the spi node in the dts
> file.
>
> Thanks for testing!
>
> > About Nuvoton drivers:
> > 1. Ethernet mac (EMC) - on work, hopefully first upstream version will
> sent soon.
> > 2. I2C - on upstream process, the maintainer have not send feedback yet.
> > 3. PCI mailbox - cannot upstream, it the same reason as Aspeed.
> > 4. BIOS post code - on upstream process, the maintainer have not send
> feedback yet.
> > 5. SPI-NOR - hopefully first upstream version to SPI will sent soon.
>
> Thanks, it's great to have an update.
>
> We should decide what to do about the mailbox drivers. Did you get
> told that it needs to use the in-kernel mailbox API?
>

I haven't tried, I saw the answer from Greg to Aspeed mailbox upstream
https://lkml.org/lkml/2017/9/5/39

Do you know if OpenBMC mailbox API support mailbox functionality or IOCTL
mailbox?

--0000000000009643d00588bfafdb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, 13 May 2019 at 05:27, Joel St=
anley &lt;<a href=3D"mailto:joel@jms.id.au">joel@jms.id.au</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sun, 12 May 20=
19 at 17:19, &lt;<a href=3D"mailto:tomer.maimon@nuvoton.com" target=3D"_bla=
nk">tomer.maimon@nuvoton.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Joel,<br>
&gt;<br>
&gt; Sorry for the late reply, we were on holiday.<br>
&gt;<br>
&gt; We had checked dev-5.1 on Nuvoton NPCM750 EVB and it looks fine.<br>
&gt; There is a minor change that need to done in the spi node in the dts f=
ile.<br>
<br>
Thanks for testing!<br>
<br>
&gt; About Nuvoton drivers:<br>
&gt; 1. Ethernet mac (EMC) - on work, hopefully first upstream version will=
 sent soon.<br>
&gt; 2. I2C - on upstream process, the maintainer have not send feedback ye=
t.<br>
&gt; 3. PCI mailbox - cannot upstream, it the same reason as Aspeed.<br>
&gt; 4. BIOS post code - on upstream process, the maintainer have not send =
feedback yet.<br>
&gt; 5. SPI-NOR - hopefully first upstream version to SPI will sent soon.<b=
r>
<br>
Thanks, it&#39;s great to have an update.<br>
<br>
We should decide what to do about the mailbox drivers. Did you get<br>
told that it needs to use the in-kernel mailbox API?<br></blockquote><div><=
br></div><div>I haven&#39;t tried, I saw the answer from Greg to Aspeed mai=
lbox upstream</div><div><a href=3D"https://lkml.org/lkml/2017/9/5/39">https=
://lkml.org/lkml/2017/9/5/39</a></div><div>=C2=A0</div><div>Do you know if =
OpenBMC mailbox API support mailbox functionality or IOCTL mailbox?</div><d=
iv>=C2=A0<br></div></div></div>

--0000000000009643d00588bfafdb--
