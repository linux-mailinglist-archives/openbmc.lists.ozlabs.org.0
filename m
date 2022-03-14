Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE934D7A6A
	for <lists+openbmc@lfdr.de>; Mon, 14 Mar 2022 06:34:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KH4wG3WsLz30L1
	for <lists+openbmc@lfdr.de>; Mon, 14 Mar 2022 16:34:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OI+UF+QJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12c;
 helo=mail-lf1-x12c.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=OI+UF+QJ; dkim-atps=neutral
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KH4vv0p1rz2xDY
 for <openbmc@lists.ozlabs.org>; Mon, 14 Mar 2022 16:33:47 +1100 (AEDT)
Received: by mail-lf1-x12c.google.com with SMTP id 3so25085891lfr.7
 for <openbmc@lists.ozlabs.org>; Sun, 13 Mar 2022 22:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eVrhLG6j1/NEw6F+1cYhKxryjr7l/j18/EJtyxq3Sx8=;
 b=OI+UF+QJc04dTD0jnL0AP1YNDkp2Ek6Ae8UAGX8B7itlQ5h/ujK4HYwA7eEeTIPx41
 DO9q9VPiOgOHkaJc6QYA+k1QFZYI7MCnuvd/OxHdqJHEieOwrkgOZARv4uGRQQjYjhVP
 nSh9CrD1p8g4M1MIJ6xgpadhYBXL1ddp/SmpDQLCCt2YTqwQj4QIzeHZP4q0kb4ZIQPN
 +/MHpYGNgo8LhwCE4t2dArZ9FKMmaOVkgeewXOdJGx9VC7WiV+mvioxh6ZdcbGI4YDcL
 WvciOzO1WRDezd2OiK3jnb+ltlnUpGyWxTq2H1yFJmU+BKPgQNoSOPfU84jd1QYIR3y0
 W+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eVrhLG6j1/NEw6F+1cYhKxryjr7l/j18/EJtyxq3Sx8=;
 b=IxOlt9r1nLXkpZ9VgVDp8orYhf9E3H93cBto5B1bhRPZqPaZTETXOu5LksWHggd2pq
 pt1bB69MjryLOc7Vbq40M10T8a0CIRLXKJsQVCmxWkDhNInIpg9ayu/OXrOFhsRzNJSu
 Owl9SSjB27cWVk5rUy/vMbiv1uUoZpl/YZ42v9ZT9/PZvIXGaTGTgdui3ZDRA9gjeCiE
 oO1gIYYf/+ebb8ZHIbs6B48YHWSeYMtJpq/WGS3kMifqZJKY0EuSVxRegPt67o4Y+xUV
 m1ymSHwWItBjKCnpQzlkxdZqbOGQsuEWha3BjKw2F+1xBfVN5cwbbWqa861JsUEK1wkw
 ujqw==
X-Gm-Message-State: AOAM5314v5PDGywMwxZjsHULfB+SleZliPb8uHQ1VzSMy/jaKzPmtOq2
 CrbCOwOd0iuqZTgvgB3okmKR4zAxZVi+fhqZ3Sg=
X-Google-Smtp-Source: ABdhPJziLv83XC63JaseKGLfszaBZYc/9exZbgqcMvLywE2DzYsJ7m4ePKilApX8W8UZkkQRGQIQL9VaVN/xB1LsxBI=
X-Received: by 2002:a05:6512:79a:b0:448:6a57:8b37 with SMTP id
 x26-20020a056512079a00b004486a578b37mr10369861lfr.48.1647236023551; Sun, 13
 Mar 2022 22:33:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220311014245.4612-1-ctcchien@nuvoton.com>
 <20220311014245.4612-3-ctcchien@nuvoton.com>
 <a6e719f2-2ca1-4ae6-680e-46ec0dd96969@canonical.com>
In-Reply-To: <a6e719f2-2ca1-4ae6-680e-46ec0dd96969@canonical.com>
From: Medad Young <medadyoung@gmail.com>
Date: Mon, 14 Mar 2022 13:33:32 +0800
Message-ID: <CAHpyw9c6ConNga0ZK=bBdc0RWMtVmyJV+isjxw7AhQW-LRTgFA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: edac: nuvoton,
 npcm-memory-controller.yaml
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Content-Type: multipart/alternative; boundary="0000000000000b8a5405da2706a2"
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
Cc: KWLIU@nuvoton.com, tony.luck@intel.com, rric@kernel.org,
 Benjamin Fair <benjaminfair@google.com>, linux-edac@vger.kernel.org,
 KFTING <KFTING@nuvoton.com>, avifishman70@gmail.com,
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
 JJLIU0@nuvoton.com, ctcchien@nuvoton.com, tali.perry1@gmail.com,
 devicetree@vger.kernel.org, robh+dt@kernel.org, bp@alien8.de,
 james.morse@arm.com, YSCHU@nuvoton.com, mchehab@kernel.org,
 linux-kernel@vger.kernel.org, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000000b8a5405da2706a2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

OK, I will check it out.
thanks for your comments.

Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> =E6=96=BC 2022=E5=
=B9=B43=E6=9C=8811=E6=97=A5 =E9=80=B1=E4=BA=94
=E4=B8=8B=E5=8D=884:58=E5=AF=AB=E9=81=93=EF=BC=9A

> On 11/03/2022 02:42, Medad CChien wrote:
> > Add device tree bindings for NPCM memory controller.
>
> Use reasonable subject. You missed the verb describing what are you
> doing here. See git history for this and other directories.
>
> >
> > Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
> > ---
> >  .../edac/nuvoton,npcm-memory-controller.yaml  | 62 +++++++++++++++++++
> >  1 file changed, 62 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yam=
l
> >
> > diff --git
> a/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.y=
aml
> b/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.y=
aml
> > new file mode 100644
> > index 000000000000..46f61b0806ee
> > --- /dev/null
> > +++
> b/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.y=
aml
> > @@ -0,0 +1,62 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/edac/npcm-edac.yaml#
>
> Please, test your changes. This won't work.
>
> Best regards,
> Krzysztof
>

--0000000000000b8a5405da2706a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">OK, I will check it out.<div>thanks for your comments.</di=
v><div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">Krzysztof Kozlowski &lt;<a href=3D"mailto:krzysztof.kozlowski@canonic=
al.com" target=3D"_blank">krzysztof.kozlowski@canonical.com</a>&gt; =E6=96=
=BC 2022=E5=B9=B43=E6=9C=8811=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=
=884:58=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 11/03/2022 02:42, Medad CChien wrote:<br>
&gt; Add device tree bindings for NPCM memory controller.<br>
<br>
Use reasonable subject. You missed the verb describing what are you<br>
doing here. See git history for this and other directories.<br>
<br>
&gt; <br>
&gt; Signed-off-by: Medad CChien &lt;<a href=3D"mailto:ctcchien@nuvoton.com=
" target=3D"_blank">ctcchien@nuvoton.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../edac/nuvoton,npcm-memory-controller.yaml=C2=A0 | 62 ++++++++=
+++++++++++<br>
&gt;=C2=A0 1 file changed, 62 insertions(+)<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/bindings/edac/nuvoto=
n,npcm-memory-controller.yaml<br>
&gt; <br>
&gt; diff --git a/Documentation/devicetree/bindings/edac/nuvoton,npcm-memor=
y-controller.yaml b/Documentation/devicetree/bindings/edac/nuvoton,npcm-mem=
ory-controller.yaml<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..46f61b0806ee<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-contr=
oller.yaml<br>
&gt; @@ -0,0 +1,62 @@<br>
&gt; +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause<br>
&gt; +%YAML 1.2<br>
&gt; +---<br>
&gt; +$id: <a href=3D"http://devicetree.org/schemas/edac/npcm-edac.yaml#" r=
el=3D"noreferrer" target=3D"_blank">http://devicetree.org/schemas/edac/npcm=
-edac.yaml#</a><br>
<br>
Please, test your changes. This won&#39;t work.<br>
<br>
Best regards,<br>
Krzysztof<br>
</blockquote></div></div></div></div>

--0000000000000b8a5405da2706a2--
