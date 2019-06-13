Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD6C434BA
	for <lists+openbmc@lfdr.de>; Thu, 13 Jun 2019 11:38:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PdwZ2r0DzDqw8
	for <lists+openbmc@lfdr.de>; Thu, 13 Jun 2019 19:38:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::142; helo=mail-it1-x142.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KH1zbm1s"; 
 dkim-atps=neutral
Received: from mail-it1-x142.google.com (mail-it1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PdTJ11m3zDrM2;
 Thu, 13 Jun 2019 19:18:43 +1000 (AEST)
Received: by mail-it1-x142.google.com with SMTP id e25so15216729itk.3;
 Thu, 13 Jun 2019 02:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c9d7OTitGiivQLY7WhpEaEpcB6typ6WH83G4bOOGuTo=;
 b=KH1zbm1s7bfdDkbnIbY+4wJDhTWu244Zz+kSP5lk7IWViC7goV8GP274X2chxjv7r1
 rR+rpVohLJ8qDv+9zpaMMjkByPcJqdc0ql1uc8Ubqeq+Rq99o8WLpXtTJ/u+uFJ4jDhg
 ++0GiE8lGIOLJ+SnuJYdI9filsUm4z7iRYwN0TL4OPpkbkJK6doEBc4epk/vzU42MBTp
 nbo1pGii08dkzUCBH316xp8y9FfTtQMZi0UwND2aWjAupuHoWauK3hIVXkGEKxpRshGh
 t5g8GCc7lWobTUZt5CewBgjmwVwvc7dUfaqVbv+Cvq4wQOGW7wv5OJ9lbvOz37OdebV7
 8m2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c9d7OTitGiivQLY7WhpEaEpcB6typ6WH83G4bOOGuTo=;
 b=ZiLFumw7bRw+XwPWBR4b4IdVu7/yBPXMPpSE1F/n/wwWsTx9HUKQpoee4K0RoFek0A
 O8wq+/eck9Gl7AskRvXBWVLi8s9YL8NhLNn/BaJV6Q3JtYyZfKtRTeFPtszWghqFzl4Z
 bACo98dGG8vcZJ4TP8HJ88PXpIBDihuwkQPxseT2pS+WL8o9AfYJna48tbzpJP6zoWAo
 W7pbQVzdeFYXfqpoCBcUU2OcEwFCpGPDkbCjADkv2QebPxaBjYTblGgrinzEzvQ4XCwB
 PQBpyPEN8yE9UxmIaV2MVHMkn+xB6f1p8uaBQTYdVNzN+3Dk21dBnT6HVgZd9VLP1bkM
 76xQ==
X-Gm-Message-State: APjAAAXN0f0U8VzrMQu/n2N7z/D6D5f3cGDbjamDBSFPXywanOusY9BL
 fZEMJ7RnXfmIiX23E4C2l08TSjtatv5f86dQdWE=
X-Google-Smtp-Source: APXvYqxd2phN3EqOwU4BNMS2kjtEM4lGdt+/AFVgfrl78vzzbyRtGcghySTr1RWm/9/WcHaDiE609P5oZJAZJHA6N1A=
X-Received: by 2002:a02:7b27:: with SMTP id q39mr56953134jac.0.1560417521369; 
 Thu, 13 Jun 2019 02:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190610133245.306812-1-tmaimon77@gmail.com>
 <20190610133245.306812-3-tmaimon77@gmail.com>
 <CAK8P3a0s1fdt2yHVjOXffeKPKkwUyJ7DKCZHHMKjx+3j300ZAQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0s1fdt2yHVjOXffeKPKkwUyJ7DKCZHHMKjx+3j300ZAQ@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 13 Jun 2019 12:26:42 +0300
Message-ID: <CAP6Zq1jZEUzbB-ZidF2SD24k8iC_uBkXZ9WbtPpOYNCRjRTz3g@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] soc: nuvoton: add NPCM LPC BPC driver
To: Arnd Bergmann <arnd@arndb.de>, Patrick Venture <venture@google.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: multipart/alternative; boundary="000000000000100856058b3104ab"
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>, linux-aspeed@lists.ozlabs.org,
 Avi Fishman <avifishman70@gmail.com>, gregkh <gregkh@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000100856058b3104ab
Content-Type: text/plain; charset="UTF-8"

Adding Patrick and Joel to this discussion,

Thanks for your prompt reply!

On Tue, 11 Jun 2019 at 16:12, Arnd Bergmann <arnd@arndb.de> wrote:

> On Mon, Jun 10, 2019 at 4:19 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
> >
> > Add Nuvoton BMC NPCM BIOS post code (BPC) driver.
> >
> > The NPCM BPC monitoring two I/O address written by
> > the host on the Low Pin Count (LPC) bus, the capure
> > data stored in 128-word FIFO.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>
> We've run into this situation before, but don't have a good solution yet:
>
> The driver seems useful and well implemented, but I keep having a bad
> feeling about adding a chardev driver into drivers/soc for something that
> is clearly specific to a particular implementation on the hardware side
> but generic on the user interface. The same user interface might be
> used on an Aspeed BMC or any other one, so please coordinate at
> least between Novoton and Aspeed developers on creating a common
> user interface, and review each other's patches.
>

Probably the only vendors that will use the snoop will be Nuvoton and
Aspeed.
is it worth to create new snoop common user interface for it,
if we will develop a new snoop user interface who will be the maintainer?


> Maybe we can introduce a drivers/bmc/ (or even drivers/openbmc)
>
that collects all those user interfaces with a thin abstraction layer
> and one or two hardware specific back-ends?
>

Sounds good, Maybe we can move the KCS BMC from driver/char/ipmi to the
drivers/bmc/?


>         Arnd
>

appreciate your opinions, Joel, Andrew and Patrick?

Thanks,

Tomer

--000000000000100856058b3104ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Adding Patrick and Joel to this discussion,</div><div=
><br></div><div>Thanks for your prompt reply!</div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 11 Jun 2019 at 16:12, =
Arnd Bergmann &lt;<a href=3D"mailto:arnd@arndb.de">arnd@arndb.de</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Jun=
 10, 2019 at 4:19 PM Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com=
" target=3D"_blank">tmaimon77@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Add Nuvoton BMC NPCM BIOS post code (BPC) driver.<br>
&gt;<br>
&gt; The NPCM BPC monitoring two I/O address written by<br>
&gt; the host on the Low Pin Count (LPC) bus, the capure<br>
&gt; data stored in 128-word FIFO.<br>
&gt;<br>
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
 target=3D"_blank">tmaimon77@gmail.com</a>&gt;<br>
<br>
We&#39;ve run into this situation before, but don&#39;t have a good solutio=
n yet:<br>
<br>
The driver seems useful and well implemented, but I keep having a bad<br>
feeling about adding a chardev driver into drivers/soc for something that<b=
r>
is clearly specific to a particular implementation on the hardware side<br>
but generic on the user interface. The same user interface might be<br>
used on an Aspeed BMC or any other one, so please coordinate at<br>
least between Novoton and Aspeed developers on creating a common<br>
user interface, and review each other&#39;s patches.<br></blockquote><div>=
=C2=A0</div><div>Probably the only vendors that will use the snoop will be =
Nuvoton and Aspeed.</div><div>is it worth to create new snoop common user i=
nterface for it,=C2=A0</div><div>if we will develop a new snoop user interf=
ace who will be the maintainer?</div><div><br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
Maybe we can introduce a drivers/bmc/ (or even drivers/openbmc)<br></blockq=
uote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">that collects all th=
ose user interfaces with a thin abstraction layer<br>
and one or two hardware specific back-ends?<br></blockquote><div>=C2=A0</di=
v><div>Sounds good, Maybe we can move the KCS BMC from driver/char/ipmi to =
the drivers/bmc/?</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Arnd<br></blockquote><div><br></div>appreciate =
your opinions, Joel, Andrew and Patrick?</div><div class=3D"gmail_quote"><b=
r></div><div class=3D"gmail_quote">Thanks,</div><div class=3D"gmail_quote">=
<br></div><div class=3D"gmail_quote">Tomer<br class=3D"gmail-Apple-intercha=
nge-newline"><div>=C2=A0</div></div></div>

--000000000000100856058b3104ab--
