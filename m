Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A50C34457
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 12:26:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45J7PK5cRqzDqPk
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 20:26:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::142; helo=mail-it1-x142.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hJSJxKCs"; 
 dkim-atps=neutral
Received: from mail-it1-x142.google.com (mail-it1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45J7Nl5LpwzDqPk
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jun 2019 20:25:43 +1000 (AEST)
Received: by mail-it1-x142.google.com with SMTP id r135so355726ith.1
 for <openbmc@lists.ozlabs.org>; Tue, 04 Jun 2019 03:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JdALdydidwPZETNLc7IM5RiZLU2Rcx6EGP20Kln4vng=;
 b=hJSJxKCsJjvk6NrHzHORFynu1swmwMofdKrwECvL58qRJhkPClYFS4M+ZQYgEl9xPj
 rLdTofm/p4n8P1C9HSCXyYAnZaowbFyxn6mWhgB5Qx3o+MiCq4vU16LorGipDrx4XP2X
 0OIuajlFhv+VIBTYOCjFqLiHb5nKCybsHcl487XVOWLQC42A8nISGxfxRwyCFiD2lX2/
 auStT7fgYou0//dE0r+iCa4ypjj7aEESq6wvXcY6bOsLk2mhUXfeRIEI+tw4XIwTFk5j
 PmBrTML+0b/20G8hVqjkcpdtEGtrnl/ndULBv3b1QYL0AVuy2PEF8Ng8U140Nco3n5Gm
 52jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JdALdydidwPZETNLc7IM5RiZLU2Rcx6EGP20Kln4vng=;
 b=ixvxeVMy3qIoCuX0fJlmWERumnZed1nByzwAekr9pE+F5vO6zTJvzML60ywH6DBS1c
 5GS03n3UYO+7iPbdrL5Y/ZiAor8RkcfxF2ldtW7V3HB/el9/SVXmUReaEfDwOABK4sQs
 ADLn/MrJ2JmwGf4KuSCPZjeZAxe9anoXn4LmzC7jOS6R4NYicg6n1hkEuyfb+/fNI9QF
 01g8gFjzm6/DXsdcH4dAbd2Cs9alZdE873PrLxd/OWosen3jBWWjM2USYRKub/oTkvVI
 Y5dh0B6zaD9FwX8nxb02dQ5X1ce9Iaydml96p2nwMedCxse8r7dy7/FM6m6BHPeFB8ys
 Wq1w==
X-Gm-Message-State: APjAAAVZR0ezAhBQrb1EzShQ54ZuCipmt9ByK0nTXO//I8EjnR4aT8yS
 nAN2Gnx4OAjIm/ajRq4mFyLA4LF5UJSAeRqjOzY=
X-Google-Smtp-Source: APXvYqwBAJncZzxzrY58jkvcASL3tPoV0vqVYomjWb9yyPObQ92etNLEa33RQ9ykTRucc+eXc9UHMkVvdQNb79skrgg=
X-Received: by 2002:a24:7b41:: with SMTP id q62mr21977984itc.7.1559643940210; 
 Tue, 04 Jun 2019 03:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190531132440.37572-1-Fran.Hsu@quantatw.com>
 <CADKL2t6K1Vu-DyuH_MYt5jGoFyCWe+X3fWETLNiPbZYO8Xrcpw@mail.gmail.com>
 <CACPK8XetcxfY1uWfiv9pLsX9a+X+66d2pD5-A68ZHrOUZhAd0Q@mail.gmail.com>
 <CACPK8Xe9rAEi8e5FDsbc89CQ_+iDhD5YW6+aqnZ0N5GxpZCR0Q@mail.gmail.com>
 <00d401d51aaf$c318d080$494a7180$@gmail.com>
In-Reply-To: <00d401d51aaf$c318d080$494a7180$@gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 4 Jun 2019 13:32:42 +0300
Message-ID: <CAP6Zq1j8df3P5sMfMM8NFj4XbugSg23mf4eT3=0Gc_i6PvW6cw@mail.gmail.com>
Subject: Re: [PATCH dev-5.1 v5 1/4] ARM: dts: nuvoton: Add NPCM730 common
 device tree include file.
To: franhsutw@gmail.com
Content-Type: multipart/alternative; boundary="000000000000084f97058a7ce72a"
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
 Fran Hsu <Fran.Hsu@quantatw.com>, Tomer Maimon <tomer.maimon@nuvoton.com>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000084f97058a7ce72a
Content-Type: text/plain; charset="UTF-8"

Hi Fran,

I will do my best to test it tomorrow.

Thanks,

Tomer

On Tue, 4 Jun 2019 at 11:31, <franhsutw@gmail.com> wrote:

> Hi Joel,
>     Let me check it and I will update a new patch soon.
> BTW, I had tried to merge these device tree patches into mainline
> (dev-5.2) but built fail.
> I will talk with Tomer to ask for help.
>
> Thanks,
> Fran
>
> > -----Original Message-----
> > From: Joel Stanley <joel@jms.id.au>
> > Sent: Tuesday, June 4, 2019 1:29 PM
> > To: Benjamin Fair <benjaminfair@google.com>
> > Cc: Fran Hsu <franhsutw@gmail.com>; OpenBMC Maillist
> > <openbmc@lists.ozlabs.org>; Fran Hsu <Fran.Hsu@quantatw.com>
> > Subject: Re: [PATCH dev-5.1 v5 1/4] ARM: dts: nuvoton: Add NPCM730 common
> > device tree include file.
> >
> > On Tue, 4 Jun 2019 at 05:23, Joel Stanley <joel@jms.id.au> wrote:
> > >
> > > On Fri, 31 May 2019 at 15:28, Benjamin Fair <benjaminfair@google.com>
> > wrote:
> > > > This looks great! I think it's ready to merge.
> > > >
> > > > On Fri, May 31, 2019 at 6:26 AM Fran Hsu <franhsutw@gmail.com>
> wrote:
> > > > >
> > > > > Quanta GSJ BMC uses the Nuvoton NPCM730 BMC soc.
> > > > > This file describes the common setting of NPCM730 soc.
> > > > >
> > > > > Signed-off-by: Fran Hsu <Fran.Hsu@quantatw.com>
> > > >
> > > > Reviewed-by: Benjamin Fair <benjaminfair@google.com>
> > >
> > > Thanks Benjamin for reviewing, and Fran for working to get these
> > > patches in a state that we can merge them. I've put them in the
> > > dev-5.1 tree with some small tweaks to the commit messages.
> >
> > I spoke too soon. I see these warnings when building:
> >
> > ../arch/arm/boot/dts/nuvoton-npcm730-gsj.dts:307.6-25: Warning
> > (i2c_bus_reg): /ahb/apb/i2c@8d000/ipmb@40000010:reg: I2C address must
> > be less than 10-bits, got "0x40000010"
> > ../arch/arm/boot/dts/nuvoton-npcm730-gsj.dts:320.6-25: Warning
> > (i2c_bus_reg): /ahb/apb/i2c@8e000/ipmb@40000012:reg: I2C address must
> > be less than 10-bits, got "0x40000012"
> >
> > Please send follow up patches to fix these warnings.
> >
> > The following warnings also exist when building the npcm kernel. If you
> could
> > also fix those it would be appreciated:
> >
> > ../arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi:222.22-231.5: Warning
> > (spi_bus_bridge): /ahb/fiu@fb000000: node name for SPI buses should be
> 'spi'
> >   also defined at
> ../arch/arm/boot/dts/nuvoton-npcm730-gsj.dts:81.22-126.5
> > arch/arm/boot/dts/nuvoton-npcm730-gsj.dtb: Warning (spi_bus_reg):
> > Failed prerequisite 'spi_bus_bridge'
> > ../arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi:222.22-231.5: Warning
> > (spi_bus_bridge): /ahb/fiu@fb000000: node name for SPI buses should be
> 'spi'
> >   also defined
> > at ../arch/arm/boot/dts/nuvoton-npcm750-evb.dts:164.22-221.5
> > ../arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi:233.22-244.5: Warning
> > (spi_bus_bridge): /ahb/fiu@c0000000: node name for SPI buses should be
> 'spi'
> >   also defined
> > at ../arch/arm/boot/dts/nuvoton-npcm750-evb.dts:223.22-242.5
> >
> > Cheers,
> >
> > Joel
>
>

--000000000000084f97058a7ce72a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Fran,<div><br></div><div>I will do my best to test it t=
omorrow.</div><div><br></div><div>Thanks,</div><div><br></div><div>Tomer</d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Tue, 4 Jun 2019 at 11:31, &lt;<a href=3D"mailto:franhsutw@gmail.com">=
franhsutw@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Hi Joel,<br>
=C2=A0 =C2=A0 Let me check it and I will update a new patch soon. <br>
BTW, I had tried to merge these device tree patches into mainline (dev-5.2)=
 but built fail.<br>
I will talk with Tomer to ask for help.<br>
<br>
Thanks,<br>
Fran<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Joel Stanley &lt;<a href=3D"mailto:joel@jms.id.au" target=3D"_bl=
ank">joel@jms.id.au</a>&gt;<br>
&gt; Sent: Tuesday, June 4, 2019 1:29 PM<br>
&gt; To: Benjamin Fair &lt;<a href=3D"mailto:benjaminfair@google.com" targe=
t=3D"_blank">benjaminfair@google.com</a>&gt;<br>
&gt; Cc: Fran Hsu &lt;<a href=3D"mailto:franhsutw@gmail.com" target=3D"_bla=
nk">franhsutw@gmail.com</a>&gt;; OpenBMC Maillist<br>
&gt; &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">open=
bmc@lists.ozlabs.org</a>&gt;; Fran Hsu &lt;<a href=3D"mailto:Fran.Hsu@quant=
atw.com" target=3D"_blank">Fran.Hsu@quantatw.com</a>&gt;<br>
&gt; Subject: Re: [PATCH dev-5.1 v5 1/4] ARM: dts: nuvoton: Add NPCM730 com=
mon<br>
&gt; device tree include file.<br>
&gt; <br>
&gt; On Tue, 4 Jun 2019 at 05:23, Joel Stanley &lt;<a href=3D"mailto:joel@j=
ms.id.au" target=3D"_blank">joel@jms.id.au</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Fri, 31 May 2019 at 15:28, Benjamin Fair &lt;<a href=3D"mailto=
:benjaminfair@google.com" target=3D"_blank">benjaminfair@google.com</a>&gt;=
<br>
&gt; wrote:<br>
&gt; &gt; &gt; This looks great! I think it&#39;s ready to merge.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Fri, May 31, 2019 at 6:26 AM Fran Hsu &lt;<a href=3D"mail=
to:franhsutw@gmail.com" target=3D"_blank">franhsutw@gmail.com</a>&gt; wrote=
:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Quanta GSJ BMC uses the Nuvoton NPCM730 BMC soc.<br>
&gt; &gt; &gt; &gt; This file describes the common setting of NPCM730 soc.<=
br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Signed-off-by: Fran Hsu &lt;<a href=3D"mailto:Fran.Hsu@=
quantatw.com" target=3D"_blank">Fran.Hsu@quantatw.com</a>&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Reviewed-by: Benjamin Fair &lt;<a href=3D"mailto:benjaminfai=
r@google.com" target=3D"_blank">benjaminfair@google.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Thanks Benjamin for reviewing, and Fran for working to get these<=
br>
&gt; &gt; patches in a state that we can merge them. I&#39;ve put them in t=
he<br>
&gt; &gt; dev-5.1 tree with some small tweaks to the commit messages.<br>
&gt; <br>
&gt; I spoke too soon. I see these warnings when building:<br>
&gt; <br>
&gt; ../arch/arm/boot/dts/nuvoton-npcm730-gsj.dts:307.6-25: Warning<br>
&gt; (i2c_bus_reg): /ahb/apb/i2c@8d000/ipmb@40000010:reg: I2C address must<=
br>
&gt; be less than 10-bits, got &quot;0x40000010&quot;<br>
&gt; ../arch/arm/boot/dts/nuvoton-npcm730-gsj.dts:320.6-25: Warning<br>
&gt; (i2c_bus_reg): /ahb/apb/i2c@8e000/ipmb@40000012:reg: I2C address must<=
br>
&gt; be less than 10-bits, got &quot;0x40000012&quot;<br>
&gt; <br>
&gt; Please send follow up patches to fix these warnings.<br>
&gt; <br>
&gt; The following warnings also exist when building the npcm kernel. If yo=
u could<br>
&gt; also fix those it would be appreciated:<br>
&gt; <br>
&gt; ../arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi:222.22-231.5: Warning=
<br>
&gt; (spi_bus_bridge): /ahb/fiu@fb000000: node name for SPI buses should be=
 &#39;spi&#39;<br>
&gt;=C2=A0 =C2=A0also defined at ../arch/arm/boot/dts/nuvoton-npcm730-gsj.d=
ts:81.22-126.5<br>
&gt; arch/arm/boot/dts/nuvoton-npcm730-gsj.dtb: Warning (spi_bus_reg):<br>
&gt; Failed prerequisite &#39;spi_bus_bridge&#39;<br>
&gt; ../arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi:222.22-231.5: Warning=
<br>
&gt; (spi_bus_bridge): /ahb/fiu@fb000000: node name for SPI buses should be=
 &#39;spi&#39;<br>
&gt;=C2=A0 =C2=A0also defined<br>
&gt; at ../arch/arm/boot/dts/nuvoton-npcm750-evb.dts:164.22-221.5<br>
&gt; ../arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi:233.22-244.5: Warning=
<br>
&gt; (spi_bus_bridge): /ahb/fiu@c0000000: node name for SPI buses should be=
 &#39;spi&#39;<br>
&gt;=C2=A0 =C2=A0also defined<br>
&gt; at ../arch/arm/boot/dts/nuvoton-npcm750-evb.dts:223.22-242.5<br>
&gt; <br>
&gt; Cheers,<br>
&gt; <br>
&gt; Joel<br>
<br>
</blockquote></div>

--000000000000084f97058a7ce72a--
