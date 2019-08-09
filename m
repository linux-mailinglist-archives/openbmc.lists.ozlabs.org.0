Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D821787DED
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2019 17:23:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464psw511bzDrJp
	for <lists+openbmc@lfdr.de>; Sat, 10 Aug 2019 01:23:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::344; helo=mail-ot1-x344.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VslAPcqS"; 
 dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464psH02PSzDrBr
 for <openbmc@lists.ozlabs.org>; Sat, 10 Aug 2019 01:22:58 +1000 (AEST)
Received: by mail-ot1-x344.google.com with SMTP id j19so57326803otq.2
 for <openbmc@lists.ozlabs.org>; Fri, 09 Aug 2019 08:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CWWSN41R73JmJLmr5Omp4qhrEHUGaCWZI+3jXv5vv+8=;
 b=VslAPcqSBqWD6Vc0Spz+BvayLUidp2lEgHnLNz/GHOQteRzNVIZ54l+z8STXet5mhZ
 7r7mht2bOW9tZ09u6BwrIt+TOEvqOW0afCIPyiDrhpAOtXS9TwcKP+7826T2YHqnrdMS
 piLhqPvbLMVMZci+GkrE1xxAZYDqeFFaGNJTGINEchcMWzO6G1DS4rXABj6CnUguKL3P
 lZ+fBeXUh6dL2NuqewrmU3YyfDnFA5xOOAP1pHkVVhsQwxBWae80Nu/a+71ibmO1EcTA
 sUYQcULbMinQyhxotc/jtEcbD+aQ8qSLvW6OWXYT3bKgiYIndsx1R8FT0IzpTAbHJ9rb
 QOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CWWSN41R73JmJLmr5Omp4qhrEHUGaCWZI+3jXv5vv+8=;
 b=XTvtMkuf4HgarHIDqpja5wdkXAGGWPRAAuuCQZXRXH58QBNSXUiYn2mwEfYIhMx68H
 LjO/lrZE3FmGioe4qzlqOD3zdRl0TNWY70kjcGyXNiDLRI7pPIzUHdcuzG0U1keX8Imq
 7Tnixkj1LeyoVGrSDrTmwny56ket3aFQeJkrkXT4jwzG93i4hNUVbzCgu0yk5BituJjZ
 MW8lLW1EouVbkCEv1fKZP82W38WUT1SSvukKCOykHuAl1g/94uNqjiwt7VUL7i8kagCI
 GS+iHdOUhDIy5KZpAQNth4prAMKcAms9TI4XagQfCpQ9UkhNd+mxrKKxN71Qo67jy0MD
 IqwQ==
X-Gm-Message-State: APjAAAVNskErr+1jhCppD/EX2FHGSEKXYRr3QuLzIKEqyq+S6fXbbBw/
 n+n42cU8+TeHmwe/WAsy7prCENf6m+vwaz878y8=
X-Google-Smtp-Source: APXvYqzY0Mx/wJLxBSDDpV1dOzPZXd9lzLQSYYXVt/6mLEU0ex1Oie0+UuQNU6YnDaSEG19u8LEsacAck+hKQ1XufAY=
X-Received: by 2002:aca:b788:: with SMTP id h130mr6968291oif.85.1565364175359; 
 Fri, 09 Aug 2019 08:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190808131448.349161-1-tmaimon77@gmail.com>
 <20190808131448.349161-3-tmaimon77@gmail.com>
 <20190808132740.GG3795@sirena.co.uk>
 <CAP6Zq1j7jHejdx9h-nxCJcVjtGx_3rHmay7R8nn11DLaE8Q4gA@mail.gmail.com>
 <20190808185522.GJ3795@sirena.co.uk>
In-Reply-To: <20190808185522.GJ3795@sirena.co.uk>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Fri, 9 Aug 2019 18:31:10 +0300
Message-ID: <CAP6Zq1jzvEPWehT5VVd6+=zTB7c+RsGjPr2XzmQa4n1NDOrSOg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] spi: npcm-fiu: add NPCM FIU controller driver
To: Mark Brown <broonie@kernel.org>
Content-Type: multipart/alternative; boundary="0000000000009de0be058fb0bf5c"
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
 Boris Brezillon <bbrezillon@kernel.org>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-spi@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000009de0be058fb0bf5c
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thanks for your prompt reply.

I will like to send another patch with support for the spi_mem_op->addr
field.

I am going to vacation until 25/08 I will send the new patch (V3) as soon I
will be back.

Thanks for your support,

Tomer

On Thu, 8 Aug 2019 at 21:55, Mark Brown <broonie@kernel.org> wrote:

> On Thu, Aug 08, 2019 at 06:37:06PM +0300, Tomer Maimon wrote:
>
> > for example in our driver we modify the access type (singe, dual or quad)
> > according the op->addr.buswidth
> > for example in the npcm_fiu_set_drd function.
>
> >         regmap_update_bits(fiu->regmap, NPCM_FIU_DRD_CFG,
> >                            NPCM_FIU_DRD_CFG_ACCTYPE,
> >                            ilog2(op->addr.buswidth) <<
> >                            NPCM_FIU_DRD_ACCTYPE_SHIFT);
>
> > we also modify it in the UMA R/W functions.
>
> Ah, it's only for the flash functions - that's fine.
>

--0000000000009de0be058fb0bf5c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Mark,<div><br></div><div>Thanks for your prompt reply.<=
/div><div><br></div><div>I will like to send another patch with support for=
 the spi_mem_op-&gt;addr field.</div><div><br></div><div>I am going to vaca=
tion until 25/08 I will send the new patch (V3) as soon I will be back.</di=
v><div><br></div><div>Thanks for your support,</div><div><br></div><div>Tom=
er</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Thu, 8 Aug 2019 at 21:55, Mark Brown &lt;<a href=3D"mailto:broon=
ie@kernel.org" target=3D"_blank">broonie@kernel.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Aug 08, 2019 at =
06:37:06PM +0300, Tomer Maimon wrote:<br>
<br>
&gt; for example in our driver we modify the access type (singe, dual or qu=
ad)<br>
&gt; according the op-&gt;addr.buswidth<br>
&gt; for example in the npcm_fiu_set_drd function.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_update_bits(fiu-&gt;regmap, NP=
CM_FIU_DRD_CFG,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM_FIU_DRD_CFG_ACCTYPE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ilog2(op-&gt;addr.buswidth) &lt;&lt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM_FIU_DRD_ACCTYPE_SHIFT);<br>
<br>
&gt; we also modify it in the UMA R/W functions.<br>
<br>
Ah, it&#39;s only for the flash functions - that&#39;s fine.<br>
</blockquote></div>

--0000000000009de0be058fb0bf5c--
