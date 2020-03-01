Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4635F174E04
	for <lists+openbmc@lfdr.de>; Sun,  1 Mar 2020 16:27:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48VnFv6tzdzDr8C
	for <lists+openbmc@lfdr.de>; Mon,  2 Mar 2020 02:27:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::243;
 helo=mail-oi1-x243.google.com; envelope-from=tmaimon77@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=U4XyEzc7; dkim-atps=neutral
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48VnF16VJ0zDqv8
 for <openbmc@lists.ozlabs.org>; Mon,  2 Mar 2020 02:26:45 +1100 (AEDT)
Received: by mail-oi1-x243.google.com with SMTP id 5so2257015oiy.4
 for <openbmc@lists.ozlabs.org>; Sun, 01 Mar 2020 07:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=78upyMEnkFywNdaA+itQpGzdbjbpLuyW0IOGmb92wdM=;
 b=U4XyEzc7+j8s4Ccj1Tg/Xr09ej3+mD4GciZN6BoObSq076O442NHRagDVEc1+jDL1G
 4SbmEfZzuPuk/VNRZR66w4X7jQPRQp/Q4ycDPtaQdf323mxURWddzkvZUmbZfChNnpO2
 qsnCeOjKDe3TnQ8vsm5DGs7wWlX1NgqmxGHBRIPJZcZ40zh/+jKuDzSkEtdP0T0JTj4D
 tEggAW2rsdTctRkM+jbvMIL19jEtPMgSbmrMzRTKCC9zLXSJ/S/kbXA5rbrufgcCFPoi
 adKMFtWl2pA/UX3BXHEsOfpM//AH12rUoG38StUJUHF34yI4MMWXVxQnhxO6f39v9p25
 s6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=78upyMEnkFywNdaA+itQpGzdbjbpLuyW0IOGmb92wdM=;
 b=VSJD1g21nIQKS+7qj5iOPXA3gWb2taAYw3naqEFZB7HeJLCzt1JIjxsHk4DrXFMgeu
 pdjJtdBgIs2oVpKKd8bIplFyejO69Xy6g8w70MLiKhbEfiUMm7euvLZDJ6qvLofHv4CA
 FF+D2OaovT1wFxWbUFpc/OGcNlAXfIvjGOGKFWHoBkm1H6FTX/lZ5h+S0Hx9rFKIS3yq
 9qzdMVG9ElJHGC+5aaaJmcrH/oxlm9u7WeTp3QHompse+dGIlppbKQPun0hr/fwViGT8
 W9gWM1zpFpneyMyj8t8H5oIgwjRX2ZDZwB81nxvzu/9+wRRE+UKRhODYknvWcYCknC6T
 v1Jg==
X-Gm-Message-State: APjAAAW7uOG0CVF8CielrYIu93G3p/zz3Nzvp5qYvuAYVsDJGclVQZZK
 Z3zNHXVRTsrdFEcPpk4DJInqZbJ5uWowew2jtEw=
X-Google-Smtp-Source: APXvYqwpnhrdk962laR2FaV1VZI+VFCQLieD5sC8QlvXQJa3a1l1BWDRpOqlnbWfBZ+6f6cbCSm2uheC1bnJjB5BIr0=
X-Received: by 2002:a54:410e:: with SMTP id l14mr8756245oic.42.1583076402105; 
 Sun, 01 Mar 2020 07:26:42 -0800 (PST)
MIME-Version: 1.0
References: <20200301094040.123189-1-tmaimon77@gmail.com>
 <20200301094040.123189-2-tmaimon77@gmail.com>
 <6ecf9a6b-8fca-1e7a-10d0-ee518e6ecf64@roeck-us.net>
In-Reply-To: <6ecf9a6b-8fca-1e7a-10d0-ee518e6ecf64@roeck-us.net>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 1 Mar 2020 17:36:37 +0200
Message-ID: <CAP6Zq1gYvoGwNwr2zCopQ5CcyVUjgdYK6yX1wVMmWh5gapp+zQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] dt-binding: watchdog: add restart priority
 documentation
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: multipart/alternative; boundary="00000000000099935c059fccb2a2"
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000099935c059fccb2a2
Content-Type: text/plain; charset="UTF-8"

On Sun, 1 Mar 2020 at 12:06, Guenter Roeck <linux@roeck-us.net> wrote:

> On 3/1/20 1:40 AM, Tomer Maimon wrote:
> > Add device tree restart priority documentation.
> >
>
> I think this warrants an explanation _why_ this is needed.
> What is the use case ? Not just theory, please.
>

In the NPCM750 there is two initiated restarts:

   - Software reset
   - WD reset

the Software restart found at NPCM reset driver
https://github.com/torvalds/linux/blob/master/drivers/reset/reset-npcm.c

In NPCM WD driver the restart is configure as well, I will like to add the
priority so the user will have maximum flexibility if he using both restarts

Thanks,

Tomer



> Guenter
>
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git
> a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
> b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
> > index 6d593003c933..0a0f86a25eb0 100644
> > --- a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
> > +++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
> > @@ -17,6 +17,7 @@ Required clocking property, have to be one of:
> >
> >  Optional properties:
> >  - timeout-sec : Contains the watchdog timeout in seconds
> > +- nuvoton,restart-priority : Contains the card restart priority.
> >
> >  Example:
> >
> > @@ -25,4 +26,5 @@ timer@f000801c {
> >      interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
> >      reg = <0xf000801c 0x4>;
> >      clocks = <&clk NPCM7XX_CLK_TIMER>;
> > +     nuvoton,restart-priority = <155>;
> >  };
> >
>
>

--00000000000099935c059fccb2a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, 1 Mar 2020 at 12:06, Guenter =
Roeck &lt;<a href=3D"mailto:linux@roeck-us.net">linux@roeck-us.net</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 3/1/20=
 1:40 AM, Tomer Maimon wrote:<br>
&gt; Add device tree restart priority documentation.<br>
&gt; <br>
<br>
I think this warrants an explanation _why_ this is needed.<br>
What is the use case ? Not just theory, please.<br></blockquote><div><br></=
div><div>In the NPCM750 there is two=C2=A0<font face=3D"arial, sans-serif">=
<span style=3D"color:rgb(51,51,51);font-size:14px">initiated</span>=C2=A0</=
font>restarts:</div><div><ul><li>Software reset</li><li>WD reset</li></ul><=
div>the Software restart found at NPCM reset driver</div></div><div><a href=
=3D"https://github.com/torvalds/linux/blob/master/drivers/reset/reset-npcm.=
c">https://github.com/torvalds/linux/blob/master/drivers/reset/reset-npcm.c=
</a><br></div><div><br></div><div>In NPCM WD driver the restart is configur=
e as well, I will like to add the priority so the user will have maximum fl=
exibility=C2=A0if he using both restarts</div><div><br></div><div>Thanks,</=
div><div><br></div><div>Tomer</div><div><br></div><div><br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
<br>
Guenter<br>
<br>
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
 target=3D"_blank">tmaimon77@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt =
| 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt; <br>
&gt; diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-w=
dt.txt b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt<br=
>
&gt; index 6d593003c933..0a0f86a25eb0 100644<br>
&gt; --- a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt<=
br>
&gt; +++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt<=
br>
&gt; @@ -17,6 +17,7 @@ Required clocking property, have to be one of:<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Optional properties:<br>
&gt;=C2=A0 - timeout-sec : Contains the watchdog timeout in seconds<br>
&gt; +- nuvoton,restart-priority : Contains the card restart priority.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Example:<br>
&gt;=C2=A0 <br>
&gt; @@ -25,4 +26,5 @@ timer@f000801c {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 interrupts =3D &lt;GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH&=
gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0xf000801c 0x4&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 clocks =3D &lt;&amp;clk NPCM7XX_CLK_TIMER&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0nuvoton,restart-priority =3D &lt;155&gt;;<br>
&gt;=C2=A0 };<br>
&gt; <br>
<br>
</blockquote></div></div>

--00000000000099935c059fccb2a2--
