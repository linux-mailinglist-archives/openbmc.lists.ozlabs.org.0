Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D8760AE95F
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 13:47:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SNYn1PRkzDsNP
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 21:47:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::342; helo=mail-ot1-x342.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JYWVdRe5"; 
 dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SNY24pzYzDqjx
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 21:46:43 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id s28so18057399otd.4
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 04:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S0O7D2s7VDjrEpmmMV3/ubzBk8Kasc1VuRf/+yWrcPk=;
 b=JYWVdRe5yRUCdAG9V0zAVY+ppsRcKek/vH4gy4s4RX61JktgPxl3cwlsCZJGRMImOE
 iDZUbNdN/p7+je54GkseBAzumFopfGC0IaTAkG70x6c24sYdB1BcXp6/Pn3MTi+XhH5k
 yJdm/WGmhobxzq/iMjkXglhB/k0CO+DnslfFSZv6ofepp4/Epx3bKeWGZQiKLTqEyP2z
 aZ9zcuYtrMkXYgHp/XDQhEyDAlx9hCIkmeRh1VwLTSPFRAxjWC4+uC2cXsvGIKYd6V1y
 ZvtFC/iJfYCgVSgR0DkKS2ohrsH3skfqFwaqMdHOD2na8EOOcUZfSbFIF4VamBnWiYWE
 1Jeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S0O7D2s7VDjrEpmmMV3/ubzBk8Kasc1VuRf/+yWrcPk=;
 b=Kj8JJ2WTFfhk1PKq8mo2vuwrXzoauBm5JTFHoAdtFuLiJ6kaW3xoLErKQ39BJXzKnn
 TttpuZLiY2OWt+etJDP+FjlcyYkamvKvgdGJLoxRu9bTT97qlgzi0IyN23QTp1D74Pcr
 zUl9etZQLoZdqUG07KDKEbnjVa5WGwaU+kAJ+EQm1WoqzzXVRsxHrMp3OF9/ZNOrL+Lq
 1+fKpf1bAdYbyCsPqUv7ZSNBAta95uqUUZDzAgg9xPT7fVKFf6Dt7+vokDjQIP43QkwG
 3UpEKSjXKsJHAGyqA3Zx7e8ms7uU49bJ7mCBjA/EzdPmQzLmg3DTMKNmREdX3p/v6YQu
 GdTw==
X-Gm-Message-State: APjAAAVM0MlgN4obtFEyK+ik0VHf1DPLXfpKyfLHVDN56VYjpHED+Qmj
 KrJnPJJ9Xdl73U5ReuF4iYyIBJ/rbJ78Mp48CnM=
X-Google-Smtp-Source: APXvYqz9sP5be0HOA6PEFseQqn8VSBOwoJ9+fZTU3FATxjE/8nEe/4Q/OOudhrYN48DX8sCfsmKAmLqmAg3X9tuYsTw=
X-Received: by 2002:a9d:7389:: with SMTP id j9mr1135452otk.269.1568116000322; 
 Tue, 10 Sep 2019 04:46:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190909123840.154745-1-tmaimon77@gmail.com>
 <20190909123840.154745-2-tmaimon77@gmail.com>
 <20190910102505.vgyomi575ldrk2lq@holly.lan>
In-Reply-To: <20190910102505.vgyomi575ldrk2lq@holly.lan>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 10 Sep 2019 14:55:44 +0300
Message-ID: <CAP6Zq1igPJ5PvaA2YaC-=ngQOnatt4PFJj-QzaJCueDf6KA19A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-binding: hwrng: add NPCM RNG documentation
To: Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000002a7a3805923175cd"
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
Cc: Mark Rutland <mark.rutland@arm.com>, sumit.garg@linaro.org,
 linux-crypto@vger.kernel.org, herbert@gondor.apana.org.au,
 Arnd Bergmann <arnd@arndb.de>, devicetree <devicetree@vger.kernel.org>,
 Avi Fishman <avifishman70@gmail.com>, Greg KH <gregkh@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, vkoul@kernel.org,
 Rob Herring <robh+dt@kernel.org>, mpm@selenic.com,
 Patrick Venture <venture@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 jens.wiklander@linaro.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000002a7a3805923175cd
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

Sorry but I have probably miss it, thanks a lot for your comment

On Tue, 10 Sep 2019 at 13:25, Daniel Thompson <daniel.thompson@linaro.org>
wrote:

> On Mon, Sep 09, 2019 at 03:38:39PM +0300, Tomer Maimon wrote:
> > Added device tree binding documentation for Nuvoton BMC
> > NPCM Random Number Generator (RNG).
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  .../bindings/rng/nuvoton,npcm-rng.txt           | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt
> >
> > diff --git a/Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt
> b/Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt
> > new file mode 100644
> > index 000000000000..a697b4425fb3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt
> > @@ -0,0 +1,17 @@
> > +NPCM SoC Random Number Generator
> > +
> > +Required properties:
> > +- compatible  : "nuvoton,npcm750-rng" for the NPCM7XX BMC.
> > +- reg         : Specifies physical base address and size of the
> registers.
> > +
> > +Optional property:
> > +- quality : estimated number of bits of true entropy per 1024 bits
> > +                     read from the rng.
> > +                     If this property is not defined, it defaults to
> 1000.
>
> There are pending unreplied review comments about this property (my own
> as it happens):
> https://patchwork.kernel.org/patch/11119371/
>
> No, there isn't different SoCs.
we had checked the quality of the hwrng and the results we got are set as
default.
we been asked from one of our client to have a dynamic quality, they will
like to be more strict when using the hwrng.
is it problematic to add it?

Having a controllable quality implies that the numeric quality of the
peripheral changes when it is stamped out on different SoCs (otherwise
the driver can confidently set the quality without needing any hint
from the DT). Is that really true here?


> Daniel.
>
> > +
> > +Example:
> > +
> > +rng: rng@f000b000 {
> > +     compatible = "nuvoton,npcm750-rng";
> > +     reg = <0xf000b000 0x8>;
> > +};
> > --
> > 2.18.0
> >
>

--0000000000002a7a3805923175cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Daniel,<div><br></div><div>Sorry but I=
 have probably miss it, thanks a lot for your comment</div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 10 Sep 2=
019 at 13:25, Daniel Thompson &lt;<a href=3D"mailto:daniel.thompson@linaro.=
org">daniel.thompson@linaro.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Mon, Sep 09, 2019 at 03:38:39PM +0300, =
Tomer Maimon wrote:<br>
&gt; Added device tree binding documentation for Nuvoton BMC<br>
&gt; NPCM Random Number Generator (RNG).<br>
&gt; <br>
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
 target=3D"_blank">tmaimon77@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../bindings/rng/nuvoton,npcm-rng.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 17 +++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 17 insertions(+)<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/bindings/rng/nuvoton=
,npcm-rng.txt<br>
&gt; <br>
&gt; diff --git a/Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.tx=
t b/Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..a697b4425fb3<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt<br>
&gt; @@ -0,0 +1,17 @@<br>
&gt; +NPCM SoC Random Number Generator<br>
&gt; +<br>
&gt; +Required properties:<br>
&gt; +- compatible=C2=A0 : &quot;nuvoton,npcm750-rng&quot; for the NPCM7XX =
BMC.<br>
&gt; +- reg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: Specifies physical base addr=
ess and size of the registers.<br>
&gt; +<br>
&gt; +Optional property:<br>
&gt; +- quality : estimated number of bits of true entropy per 1024 bits<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0read from the rng.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0If this property is not defined, it defaults to 1000.<br>
<br>
There are pending unreplied review comments about this property (my own<br>
as it happens):<br>
<a href=3D"https://patchwork.kernel.org/patch/11119371/" rel=3D"noreferrer"=
 target=3D"_blank">https://patchwork.kernel.org/patch/11119371/</a><br>
<br></blockquote><div>No, there isn&#39;t different SoCs.</div><div>we had =
checked the quality of the hwrng and the results we got are set as default.=
</div><div>we been asked from one of our client to have a dynamic quality, =
they will like to be more strict when using the hwrng.</div><div>is it prob=
lematic to add it?</div><pre class=3D"gmail-content" style=3D"box-sizing:bo=
rder-box;overflow:auto;font-family:Menlo,Monaco,Consolas,&quot;Courier New&=
quot;,monospace;font-size:13px;padding:9.5px;margin-top:0px;margin-bottom:1=
0px;line-height:14.3px;color:rgb(51,51,51);word-break:break-all;border:0px;=
border-radius:0px">Having a controllable quality implies that the numeric q=
uality of the
peripheral changes when it is stamped out on different SoCs (otherwise
the driver can confidently set the quality without needing any hint
from the DT). Is that really true here?=C2=A0</pre><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
Daniel.<br>
<br>
&gt; +<br>
&gt; +Example:<br>
&gt; +<br>
&gt; +rng: rng@f000b000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0compatible =3D &quot;nuvoton,npcm750-rng&quot;;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0reg =3D &lt;0xf000b000 0x8&gt;;<br>
&gt; +};<br>
&gt; -- <br>
&gt; 2.18.0<br>
&gt; <br>
</blockquote></div></div>

--0000000000002a7a3805923175cd--
