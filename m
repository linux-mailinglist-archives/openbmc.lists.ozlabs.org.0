Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D3810865BF
	for <lists+openbmc@lfdr.de>; Thu,  8 Aug 2019 17:29:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464C3M04wszDqZb
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2019 01:29:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::342; helo=mail-ot1-x342.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jSpi25ui"; 
 dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464C2g4BtZzDqZR
 for <openbmc@lists.ozlabs.org>; Fri,  9 Aug 2019 01:28:54 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id b7so69944126otl.11
 for <openbmc@lists.ozlabs.org>; Thu, 08 Aug 2019 08:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eOj2Rv+FhDDbysqg2BboNfCSaS3vXM7Dzfn1m36lEU8=;
 b=jSpi25uimilOELaFSQoW5amOW6tSO47ZpZSDZ2HjqWeEh2TdBG6Djk4zAgNnMkZnCJ
 5c/DI8L6ykpThj4uFMInlSoY21J3jbUAsCirrG27vVJv6PNHIcGLHM+u8rvVYrnc8j4J
 qBwzqrKjOroogd9NSQm+rtuIrSfb8fr27bfsa/f4m/yKnSPol58+N1fbxM0ZBpfmyBtF
 UVc8sLhWvDBSKICpPFBwpoFN+Vsug54RWUfVocZuRK5q6P9Df5CzYAlzXv7zeNNGim/m
 jRsdiEV90SsnAmcTY96BXn02kWXwpxw9Tl3+zEeKuEr9YqN9Ig4fpedaUE5S86HQPAWO
 nLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eOj2Rv+FhDDbysqg2BboNfCSaS3vXM7Dzfn1m36lEU8=;
 b=Yav84rMm7WuiYmZ1DXqwEqERb9wHvEn9/qnmqGI5iv/aNa2aE7TDXIvm1e5Y+Ungra
 TKt+g1o36zP1lTvIUkXBIv3nkiLobS1hQzF1e0hSl2Zg/HSlK8Pp7h7YV9kFETh2JO5G
 juGVWxk/86YGdjwkPm9mEq72w5/ZksoyHXfPFojERNxLqkwPW0Ijx4M7utz1jip5Cy0I
 kDVqZuBNvXpGR2Ko/wE45qP3lr6rOmCHBUEKSz26dcTDsfqw2/xdw99b0z2XJc4zEn3T
 Fdt6Wr5Dqs8YOH9yR//xuuHNULzm55QokOrZ9xTVq/SJA7kfDQ8sqR+LJ5l6Mqj3GsEn
 ODDw==
X-Gm-Message-State: APjAAAVSZZtD/s4ev3e/UZQ2CLxCJD6nQMDPkXA/vMqo5Z0BTPfmOkEG
 hhcbCp8sHIrEOsl2sBiHZv3/DiZyMvl0EPjuE0s=
X-Google-Smtp-Source: APXvYqw1lwpLXImsrU3To1h3tMt2O5fpWd21G3R2eBTYuHnTiM7bkYUTw+Kj3E2/SeA2qpTHPvjPp6oGQ4XkqfnBkLE=
X-Received: by 2002:a9d:7352:: with SMTP id l18mr14046718otk.292.1565278130689; 
 Thu, 08 Aug 2019 08:28:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190808131448.349161-1-tmaimon77@gmail.com>
 <20190808131448.349161-3-tmaimon77@gmail.com>
 <20190808132740.GG3795@sirena.co.uk>
In-Reply-To: <20190808132740.GG3795@sirena.co.uk>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 8 Aug 2019 18:37:06 +0300
Message-ID: <CAP6Zq1j7jHejdx9h-nxCJcVjtGx_3rHmay7R8nn11DLaE8Q4gA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] spi: npcm-fiu: add NPCM FIU controller driver
To: Mark Brown <broonie@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000f45bbc058f9cb6ba"
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
 devicetree <devicetree@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 bbrezillon@kernel.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-spi@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000f45bbc058f9cb6ba
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thanks for the prompt reply.

On Thu, 8 Aug 2019 at 16:27, Mark Brown <broonie@kernel.org> wrote:

> On Thu, Aug 08, 2019 at 04:14:48PM +0300, Tomer Maimon wrote:
>
> > +     ctrl->mode_bits = SPI_RX_DUAL | SPI_RX_QUAD
> > +             | SPI_TX_DUAL | SPI_TX_QUAD;
> > +     ctrl->setup = npcm_fiu_setup;
>
> I'm not seeing where we implement dual or quad modes in the driver?
> There's some
>
>
Do you mean you do not see where it is implemented in the NPCM FIU driver?

for example in our driver we modify the access type (singe, dual or quad)
according the op->addr.buswidth
for example in the npcm_fiu_set_drd function.

        regmap_update_bits(fiu->regmap, NPCM_FIU_DRD_CFG,
                           NPCM_FIU_DRD_CFG_ACCTYPE,
                           ilog2(op->addr.buswidth) <<
                           NPCM_FIU_DRD_ACCTYPE_SHIFT);

we also modify it in the UMA R/W functions.

> +     dev_info(dev, "NPCM %s probe succeed\n", fiu->info->name);
>
> Just remove this, it makes the log more verbose but doesn't really add
> any information.
>

I will remove it.

Thanks,

Tomer

--000000000000f45bbc058f9cb6ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Mark,<div><br></div><div>Thanks for th=
e prompt reply.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, 8 Aug 2019 at 16:27, Mark Brown &lt;<a href=3D=
"mailto:broonie@kernel.org">broonie@kernel.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Aug 08, 2019 at 04:14=
:48PM +0300, Tomer Maimon wrote:<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctrl-&gt;mode_bits =3D SPI_RX_DUAL | SPI_RX_QUAD<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| SPI_TX_DUAL | SPI_T=
X_QUAD;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctrl-&gt;setup =3D npcm_fiu_setup;<br>
<br>
I&#39;m not seeing where we implement dual or quad modes in the driver?<br>
There&#39;s some <br>
<br></blockquote><div>=C2=A0</div><div>Do you mean you do not see where it =
is implemented in the NPCM FIU driver?</div><div><br></div><div>for example=
 in our driver we modify the access type (singe, dual or quad) according th=
e=C2=A0<span style=3D"color:rgb(0,0,0);font-family:&quot;Courier New&quot;;=
font-size:11pt">op-&gt;addr.buswidth</span></div><div>for example in the=C2=
=A0<span style=3D"font-weight:bolder;color:rgb(0,0,0);font-family:&quot;Cou=
rier New&quot;;font-size:11pt">npcm_fiu_set_drd function.</span></div><div>=
<div style=3D"font-family:&quot;Courier New&quot;;font-size:11pt;color:rgb(=
0,0,0)">
<pre>        <span style=3D"font-weight:bolder">regmap_update_bits</span>(f=
iu-&gt;regmap, NPCM_FIU_DRD_CFG,
                           NPCM_FIU_DRD_CFG_ACCTYPE,
                           <span style=3D"font-weight:bolder">ilog2</span>(=
op-&gt;addr.buswidth) &lt;&lt;
                           NPCM_FIU_DRD_ACCTYPE_SHIFT);
</pre></div></div><div>we also modify it in the UMA R/W functions.</div><di=
v><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0dev_info(dev, &quot;NPCM %s probe succeed\n&quot;=
, fiu-&gt;info-&gt;name);<br>
<br>
Just remove this, it makes the log more verbose but doesn&#39;t really add<=
br>
any information.<br></blockquote><div><br></div><div>I will remove it.</div=
><div><br></div><div>Thanks,</div><div><br></div><div>Tomer=C2=A0</div></di=
v></div>

--000000000000f45bbc058f9cb6ba--
