Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8600B32D5FB
	for <lists+openbmc@lfdr.de>; Thu,  4 Mar 2021 16:08:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrvQ03bXyz3cxQ
	for <lists+openbmc@lfdr.de>; Fri,  5 Mar 2021 02:08:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=UaN+JcSp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22c;
 helo=mail-oi1-x22c.google.com; envelope-from=tmaimon77@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UaN+JcSp; dkim-atps=neutral
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrvPm1yNCz3cXZ
 for <openbmc@lists.ozlabs.org>; Fri,  5 Mar 2021 02:08:11 +1100 (AEDT)
Received: by mail-oi1-x22c.google.com with SMTP id w65so6850494oie.7
 for <openbmc@lists.ozlabs.org>; Thu, 04 Mar 2021 07:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iKzGMZeZ/cn332/Ak9ubbjiv8/gkfczJadoNqHFM5Xo=;
 b=UaN+JcSpgNAmAlkemnZ4DQ/N3RknzgrSOhnkCeoW6ngtSVGyDaYA0O9MWICAmPiJ8p
 /SCbDI97ndrVvYQLmT4YtojhH7v3mlinH+QEq4r2eUPX/aQoqwSVMg41H0f6YtA/dyIM
 qcVVTq919O1XdfmElb4cvTIswXzkHZmFD+llGlY1/n1lmGBl5fAYjrw32sQUiD5L+E7X
 mNWmPybh9G6qIrS1mpQlbY01sHYFoLWvFXzsg7nsGKEbM8HXEffkmFZQOcFZd0oVtGLk
 2oXrBfKyIzqma2zaz3mPmgNgq1iRlLZ1e5jxd2n24pt1chk2oIRYlATWF8M2rhCt4jIM
 CwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iKzGMZeZ/cn332/Ak9ubbjiv8/gkfczJadoNqHFM5Xo=;
 b=ZtFvljcUO9sHmc8Ebcqn9daqNjElWfMHgTpiBA30nwC7/9IZcf9lxFih8yaA/IF9fG
 AHLznnsLrQwa91K7fbw/ml9xkb0Ar0iBMWEK5s8zp1lK4WRu4bibZPytHLG15CaNBw88
 OLVeh0IfbAr9PyzPwdcymjKrjjLs5Etcry7cMs3e23pViWEcLALVX2jdnHPMkBNz12f7
 jzwe3WChHbVchL9fzxiK8Tv40rBYWW+htr6ZWzW9hIMuFzKNmM9dHhQMfnTEwquCGXzt
 FBHmpi4ex7eaws5tWOjsTHfqt1BV9UiVU51JMeAOmdHiV9anOx7NDQAj6iz0eUJnbKRr
 qQgA==
X-Gm-Message-State: AOAM530Iu2joVDXtAxmOeb4G+lDYjR6n3K1V6UkdrOz01+8S/w3TAgWU
 fTDOcnkaH8QJ4iJiEAP7GVf0E+hzpfxSeMacjE4=
X-Google-Smtp-Source: ABdhPJya+fpV0clbsZyOiWZmUznVFBRNOLRY02gUr9osM+d5q6XYqmC1tMpppHppR4qTQNPvH5y+fNONzK2VaB3L+pE=
X-Received: by 2002:aca:3946:: with SMTP id g67mr3205812oia.42.1614870487923; 
 Thu, 04 Mar 2021 07:08:07 -0800 (PST)
MIME-Version: 1.0
References: <20210303154622.3018839-1-j.neuschaefer@gmx.net>
 <20210303154622.3018839-2-j.neuschaefer@gmx.net>
In-Reply-To: <20210303154622.3018839-2-j.neuschaefer@gmx.net>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 4 Mar 2021 17:21:36 +0200
Message-ID: <CAP6Zq1hwp+wJpbN496096q8izRRoU2Jg+OKugcSk+BcXWfME9A@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND 2/2] ARM: dts: Add board-specific compatible
 string to npcm750-evb devicetree
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: multipart/alternative; boundary="000000000000ca817405bcb7555e"
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000ca817405bcb7555e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonathan,

Thanks a lot for sending the patch,

I think that when it related to the SoC EVB it can stay with the
genral compatible name nuvoton,npcm750

you can see it also in,
https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/aspeed-ast2=
500-evb.dts#L8

Thanks again,

Tomer

On Wed, 3 Mar 2021 at 17:47, Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.ne=
t>
wrote:

> According to the revised binding, the devicetree needs a board-specific
> compatible string.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> ---
>
> v2:
> - no changes
> ---
>  arch/arm/boot/dts/nuvoton-npcm750-evb.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> index 9f13d08f5804e..dea3dbc4a6a52 100644
> --- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> +++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> @@ -9,7 +9,7 @@
>
>  / {
>         model =3D "Nuvoton npcm750 Development Board (Device Tree)";
> -       compatible =3D "nuvoton,npcm750";
> +       compatible =3D "nuvoton,npcm750-evb", "nuvoton,npcm750";
>
>         aliases {
>                 ethernet2 =3D &gmac0;
> --
> 2.29.2
>
>

--000000000000ca817405bcb7555e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Jonathan,<div><br></div><div>Thanks a lot for send=
ing the patch,</div><div><br></div><div>I think that when it related to the=
 SoC EVB it can stay with the genral=C2=A0compatible name nuvoton,npcm750</=
div><div><br></div><div>you can see it also in,</div><div><a href=3D"https:=
//github.com/torvalds/linux/blob/master/arch/arm/boot/dts/aspeed-ast2500-ev=
b.dts#L8" target=3D"_blank">https://github.com/torvalds/linux/blob/master/a=
rch/arm/boot/dts/aspeed-ast2500-evb.dts#L8</a><br></div><div><br></div><div=
>Thanks again,</div><div><br></div><div>Tomer</div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 3 Mar 2021 at 17=
:47, Jonathan Neusch=C3=A4fer &lt;<a href=3D"mailto:j.neuschaefer@gmx.net" =
target=3D"_blank">j.neuschaefer@gmx.net</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">According to the revised binding, th=
e devicetree needs a board-specific<br>
compatible string.<br>
<br>
Signed-off-by: Jonathan Neusch=C3=A4fer &lt;<a href=3D"mailto:j.neuschaefer=
@gmx.net" target=3D"_blank">j.neuschaefer@gmx.net</a>&gt;<br>
---<br>
<br>
v2:<br>
- no changes<br>
---<br>
=C2=A0arch/arm/boot/dts/nuvoton-npcm750-evb.dts | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/=
nuvoton-npcm750-evb.dts<br>
index 9f13d08f5804e..dea3dbc4a6a52 100644<br>
--- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts<br>
+++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts<br>
@@ -9,7 +9,7 @@<br>
<br>
=C2=A0/ {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 model =3D &quot;Nuvoton npcm750 Development Boa=
rd (Device Tree)&quot;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;nuvoton,npcm750&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;nuvoton,npcm750-evb&quot;,=
 &quot;nuvoton,npcm750&quot;;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 aliases {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ethernet2 =3D &amp;=
gmac0;<br>
--<br>
2.29.2<br>
<br>
</blockquote></div>

--000000000000ca817405bcb7555e--
