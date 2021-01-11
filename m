Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7662F1EC7
	for <lists+openbmc@lfdr.de>; Mon, 11 Jan 2021 20:17:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DF3P560WxzDqVF
	for <lists+openbmc@lfdr.de>; Tue, 12 Jan 2021 06:17:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::233;
 helo=mail-oi1-x233.google.com; envelope-from=tmaimon77@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DVqYkNLv; dkim-atps=neutral
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DF3NF5hxZzDqBY
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2021 06:16:26 +1100 (AEDT)
Received: by mail-oi1-x233.google.com with SMTP id q205so421372oig.13
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2021 11:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hiXoCS0FhOUQ5pzj0QNoVACzOPXssJAY3qOw2iwbjpI=;
 b=DVqYkNLveqUG+E5L/EFO879TIpFxfXDrZeMME0gNEUAtAc6ET/wCI6aYh0Md+wQC79
 7uN6jl8yszabD0Zvf60teVEHZpy284/9rjKfqgLzGEa3c2IP9aNqZe3hW4n4uy5YxhVT
 FRAnE2hPhYfQ2yJST628do04opLGO2JLK9kKvdKP0Yib7k7fyKf5WJJNCZi4BmL8eOBJ
 MHwwz0prVEaB1Dil5gUndlkLptyGzlO+Ff2BbiljbDOfz4db4i6qpYig2VydZJxbiQO1
 1vdn8+muX2Y1K5bjjrcGchk8gQDdwTL3TaYcJQloarHP+5yfUYRIbvuC1wuOL2yK7wia
 Oeag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hiXoCS0FhOUQ5pzj0QNoVACzOPXssJAY3qOw2iwbjpI=;
 b=OFQmFFNAL/vd+pJIjhY7Jj+sIIArlvSYn9xq0rfaFDb/zC8eT4JVHFsjDYOcUAnL5c
 dxjxMmHi7Di7h7g3r2OdFF40zg0rQK+tmte+wjas2goWV/bGfe/qmRQRlgnW4/nYdazd
 nBLudemJcNxbomHUY846YaVPe1gTvURSJYF6TWcOeLo1Vb/O31JtQNwOijOennCOGa5t
 oN2mqvfVEqIOnaTtmXc3PtILCey8JfhtijMIcns/E02rbFEMdTd87fWhnf8+acoYu2Ik
 fFKQHq8jOMr+zCEZByeF4f9rOXQ320svaA+Pfgj1jtD8YnG0o6XSL0ZYX970sqmmj9bm
 ZNlw==
X-Gm-Message-State: AOAM530mR8kZP8MDXD+Df40Q3m/IA03HT6jimEzE/TVZVUUuNW2ZZRTn
 CiLnSIqf/zbjO0+oQaC2ahyNE0DQzbFJJGlpESA=
X-Google-Smtp-Source: ABdhPJw4jnkVEzhsTioLCScZeOano+G0QZUR7HU2PznrH8jr1qIV/VhkkaVErJ9VVZGevPWshMD/LsR0k2Ov4iKdG+w=
X-Received: by 2002:aca:1716:: with SMTP id j22mr224655oii.42.1610392582984;
 Mon, 11 Jan 2021 11:16:22 -0800 (PST)
MIME-Version: 1.0
References: <20210105134508.225702-1-tmaimon77@gmail.com>
 <CACPK8Xd9ryK=LpoT56+xE8wSp1frd3QbkoRuQukO4go5=NYkkA@mail.gmail.com>
In-Reply-To: <CACPK8Xd9ryK=LpoT56+xE8wSp1frd3QbkoRuQukO4go5=NYkkA@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 11 Jan 2021 21:30:01 +0200
Message-ID: <CAP6Zq1jeEEf=Gjs5GG=gMfOf16s5Jyg3iT4Lpm+_WYBZ7_1K4Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8 v2 00/11] Add NPCM7xx patches to dev-5.8
To: Joel Stanley <joel@jms.id.au>
Content-Type: multipart/alternative; boundary="000000000000db982a05b8a4bda6"
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000db982a05b8a4bda6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Joel,

First tahnks a lot for reviewing the patches.

On Mon, 11 Jan 2021 at 02:37, Joel Stanley <joel@jms.id.au> wrote:

> Hi Tomer,
>
> On Tue, 5 Jan 2021 at 13:45, Tomer Maimon <tmaimon77@gmail.com> wrote:
> >
> > In this patch set we will like to align with relevant modifications
> > in Nuvoton OpenBMC Linux kernel 5.4.
>
> Thanks for sending the patches. I can merge them into 5.8, however I
> have a v5.10 branch that I plan on moving to imminently.
>
> >
> > Linux upstream current status:
> >         1. npcm7xx clock driver - adding read only
> >                 flag to divider clocks, Will be sent to Linux community=
.
> >         2. Adding NPCM ADC calibration - Will be sent to Linux vanilla,
> >                 but I am not sure it will be approved.
> >         3. Add DT restart priority and reset type support - sent to Lin=
ux
> >                 community la but havent approved yet.
> >         4. persist configuration to the pin control driver - asked by a
> costumer,
> >                 didnt sent to Linux community.
>
> Do you plan on sending it?
>
I need you advise on this one, I pretty sure that the pin
cntroller maintainer will refuse to add it
what do you think?

>
> >         5. Add HGPIO pin support to NPCM7xx pinctrl driver - will be se=
nt
> >                 to Linux community
> >         6. JTAG master driver - will be sent to Linux community once we
> will
> >                 have BMC folder.
>
What about the JTAG driver? can you add it please? do I need to move it to
soc folder or to leave it in
misc?

>
> As you've noted, I recommend you submit them to mainline ASAP to avoid
> extra handling of patches in the openbmc tree.
>
you right, I will do my best...

>
> Cheers,
>
> Joel
>
> >
> > Changes since version 1:
> > - Address comments from Jonathan Neusch=C3=A4fer: removing trailing whi=
tespace
> >         in NPCM watchdog documentation.
> > - Adding Stanley Chu to NPCM JTAG master driver
> >
> > Tomer Maimon (11):
> >   clk: npcm7xx: add read only flag to divider clocks
> >   iio: adc: add calibration support to npcm ADC
> >   dts: npcm750: add fuse regmap support node
> >   watchdog: npcm: Add DT restart priority and reset type support
> >   dt-binding: watchdog: Add DT restart priority and reset type
> >   pinctrl: npcm7xx: Add HGPIO pin support to NPCM7xx pinctrl driver
> >   pinctrl: pinconf: add pin persist configuration
> >   pinctrl: npcm7xx: Add pin persist configuration support
> >   spi: npcm-pspi: Add full duplex support
> >   dt-binding: bmc: add NPCM7XX JTAG master documentation
> >   misc: npcm7xx-jtag-master: add NPCM7xx JTAG master driver
> >
> >  .../bindings/bmc/npcm7xx-jtag-master.txt      |  38 +
> >  .../bindings/watchdog/nuvoton,npcm-wdt.txt    |  32 +
> >  arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |   6 +
> >  drivers/clk/clk-npcm7xx.c                     |  70 +-
> >  drivers/iio/adc/npcm_adc.c                    | 191 ++++
> >  drivers/misc/Kconfig                          |   6 +
> >  drivers/misc/Makefile                         |   1 +
> >  drivers/misc/npcm7xx-jtag-master.c            | 840 ++++++++++++++++++
> >  drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c     | 130 ++-
> >  drivers/pinctrl/pinconf-generic.c             |   3 +
> >  drivers/spi/spi-npcm-pspi.c                   |  75 +-
> >  drivers/watchdog/npcm_wdt.c                   | 121 ++-
> >  12 files changed, 1418 insertions(+), 95 deletions(-)
> >  create mode 100644
> Documentation/devicetree/bindings/bmc/npcm7xx-jtag-master.txt
> >  create mode 100644 drivers/misc/npcm7xx-jtag-master.c
> >
> > --
> > 2.22.0
> >
>

cheers,

Tomer

--000000000000db982a05b8a4bda6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Joel,<div><br></div><div>First tahnks =
a lot for reviewing the patches.</div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, 11 Jan 2021 at 02:37, Joel St=
anley &lt;<a href=3D"mailto:joel@jms.id.au">joel@jms.id.au</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Tomer,<br>
<br>
On Tue, 5 Jan 2021 at 13:45, Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@g=
mail.com" target=3D"_blank">tmaimon77@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; In this patch set we will like to align with relevant modifications<br=
>
&gt; in Nuvoton OpenBMC Linux kernel 5.4.<br>
<br>
Thanks for sending the patches. I can merge them into 5.8, however I<br>
have a v5.10 branch that I plan on moving to imminently.<br>
<br>
&gt;<br>
&gt; Linux upstream current status:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01. npcm7xx clock driver - adding read=
 only<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flag to d=
ivider clocks, Will be sent to Linux community.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02. Adding NPCM ADC calibration - Will=
 be sent to Linux vanilla,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0but I am =
not sure it will be approved.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A03. Add DT restart priority and reset =
type support - sent to Linux<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0community=
 la but havent approved yet.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04. persist configuration to the pin c=
ontrol driver - asked by a costumer,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0didnt sen=
t to Linux community.<br>
<br>
Do you plan on sending it?<br></blockquote><div>I need you advise on this o=
ne, I pretty sure that the pin cntroller=C2=A0maintainer will refuse to add=
 it=C2=A0</div><div>what do you think?</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A05. Add HGPIO pin support to NPCM7xx p=
inctrl driver - will be sent<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to Linux =
community<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A06. JTAG master driver - will be sent =
to Linux community once we will<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0have BMC =
folder.<br></blockquote><div>What about the JTAG driver? can you add it ple=
ase? do I need to move it to soc folder or to leave it in=C2=A0</div><div>m=
isc?=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
As you&#39;ve noted, I recommend you submit them to mainline ASAP to avoid<=
br>
extra handling of patches in the openbmc tree.<br></blockquote><div>you rig=
ht, I will do my best...=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
Cheers,<br>
<br>
Joel<br>
<br>
&gt;<br>
&gt; Changes since version 1:<br>
&gt; - Address comments from Jonathan Neusch=C3=A4fer: removing trailing wh=
itespace<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in NPCM watchdog documentation.<br>
&gt; - Adding Stanley Chu to NPCM JTAG master driver<br>
&gt;<br>
&gt; Tomer Maimon (11):<br>
&gt;=C2=A0 =C2=A0clk: npcm7xx: add read only flag to divider clocks<br>
&gt;=C2=A0 =C2=A0iio: adc: add calibration support to npcm ADC<br>
&gt;=C2=A0 =C2=A0dts: npcm750: add fuse regmap support node<br>
&gt;=C2=A0 =C2=A0watchdog: npcm: Add DT restart priority and reset type sup=
port<br>
&gt;=C2=A0 =C2=A0dt-binding: watchdog: Add DT restart priority and reset ty=
pe<br>
&gt;=C2=A0 =C2=A0pinctrl: npcm7xx: Add HGPIO pin support to NPCM7xx pinctrl=
 driver<br>
&gt;=C2=A0 =C2=A0pinctrl: pinconf: add pin persist configuration<br>
&gt;=C2=A0 =C2=A0pinctrl: npcm7xx: Add pin persist configuration support<br=
>
&gt;=C2=A0 =C2=A0spi: npcm-pspi: Add full duplex support<br>
&gt;=C2=A0 =C2=A0dt-binding: bmc: add NPCM7XX JTAG master documentation<br>
&gt;=C2=A0 =C2=A0misc: npcm7xx-jtag-master: add NPCM7xx JTAG master driver<=
br>
&gt;<br>
&gt;=C2=A0 .../bindings/bmc/npcm7xx-jtag-master.txt=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 38 +<br>
&gt;=C2=A0 .../bindings/watchdog/nuvoton,npcm-wdt.txt=C2=A0 =C2=A0 |=C2=A0 =
32 +<br>
&gt;=C2=A0 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |=C2=A0 =C2=A06 +<=
br>
&gt;=C2=A0 drivers/clk/clk-npcm7xx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 70 +-<br>
&gt;=C2=A0 drivers/iio/adc/npcm_adc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 191 ++++<br>
&gt;=C2=A0 drivers/misc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +<br>
&gt;=C2=A0 drivers/misc/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 drivers/misc/npcm7xx-jtag-master.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 840 ++++++++++++++++++<br>
&gt;=C2=A0 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c=C2=A0 =C2=A0 =C2=A0| 1=
30 ++-<br>
&gt;=C2=A0 drivers/pinctrl/pinconf-generic.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 drivers/spi/spi-npcm-pspi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 75 +-<br>
&gt;=C2=A0 drivers/watchdog/npcm_wdt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 121 ++-<br>
&gt;=C2=A0 12 files changed, 1418 insertions(+), 95 deletions(-)<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/bindings/bmc/npcm7xx=
-jtag-master.txt<br>
&gt;=C2=A0 create mode 100644 drivers/misc/npcm7xx-jtag-master.c<br>
&gt;<br>
&gt; --<br>
&gt; 2.22.0<br>
&gt;<br></blockquote><div><br></div><div>cheers,</div><div><br></div><div>T=
omer=C2=A0</div></div></div>

--000000000000db982a05b8a4bda6--
