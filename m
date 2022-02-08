Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 405FE4AD7AF
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 12:40:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtLfZ6Q7Wz3bV1
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 22:40:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fgAAC+E1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a29;
 helo=mail-vk1-xa29.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=fgAAC+E1; dkim-atps=neutral
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com
 [IPv6:2607:f8b0:4864:20::a29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtGm96LHmz2xKK
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 19:44:56 +1100 (AEDT)
Received: by mail-vk1-xa29.google.com with SMTP id o15so9368638vki.2
 for <openbmc@lists.ozlabs.org>; Tue, 08 Feb 2022 00:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VCpqB7SVuJD+HWFJT2gH4WW74tie7Ii8QJx6NCNFaO8=;
 b=fgAAC+E1Ip1nUrRGwvzSt59zfTBZH4enV42e5UO9xGGplZb44rKGI8a47TxYYcwU9V
 BJWn0nx/sW2lY2Kv4OpP1x4L0BXwhANoDCmMtVZ1Ku85Has6NSWw6aD6UsMkONqEhQT6
 satFM0meKtVu5uWHB6nS3ZIighxftToha2uBKcOYP6K0G7RaiuE/hJQmDzqwAmS/wfhB
 i8C/G3HD4CVpXeqbFFs3rKP8RpnssCTqRmrQgjkkS2UEo93yY7OS0kcSzvsGnNezNBo+
 dX9Y5ML5xqFnAAMliQJQ3gQOVAXG0355NKrr8Jrnt1PpADTvrLPCYRYAm8aUCvhuh9W2
 LfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VCpqB7SVuJD+HWFJT2gH4WW74tie7Ii8QJx6NCNFaO8=;
 b=CJ3UA2qhgvcvMnYplD5/X0UjirG2fuIQ4ur01HBKONASEB77ovOvvZeEwXmMcYpmi3
 5uYrcMgJFbNoPEkDvpbEjrMWz+CpSzJYklSYKG/1AbkA1yW3kQF/HAhc0+7o0+7yCRNA
 4jxCFy+le66m3xpE3kX4INYzoM1jB3GBaC7Jh4tOhtMDMeRm+No4Nk6aRTK9KKcvkeZN
 /RZi4FjEboHxx5gz3EFRynXKHJXfpe3czQkVUFh51DjlreUv7bTsQCF0tOXaCmcfbiwl
 kHaHm6r+DNdGUHoe0tWS00Up/OxgQBdTYRQN7rDGy+LnYETWkMJ825Is3dStcnDSSJRM
 Xu7A==
X-Gm-Message-State: AOAM532JUQ3bVcXfSXO7nZqfv3kdQ9yBxUEDbpz2ApvC/YESLcJss+pK
 0CV+IRJRuU/PYpICJTVUkklLI1aDYz6I0o/OWg==
X-Google-Smtp-Source: ABdhPJxJpaGJmIAwmQjG5ngPUDGBeXgBdNgvGKYP/IWZsA5r4OQ8QSuKwMZexS46QqXrksfPHzrdzZDB7P/KC6sFC3E=
X-Received: by 2002:a1f:640e:: with SMTP id y14mr1349288vkb.11.1644309894270; 
 Tue, 08 Feb 2022 00:44:54 -0800 (PST)
MIME-Version: 1.0
References: <20220207063338.6570-1-warp5tw@gmail.com>
 <20220207063338.6570-2-warp5tw@gmail.com>
 <1644243760.823059.320509.nullmailer@robh.at.kernel.org>
In-Reply-To: <1644243760.823059.320509.nullmailer@robh.at.kernel.org>
From: warp5tw <warp5tw@gmail.com>
Date: Tue, 8 Feb 2022 16:44:42 +0800
Message-ID: <CACD3sJb1dZYPHdboAUa-5vfSwe8M0CxACPN=E2fWgK7Fy4803w@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] dt-bindings: i2c: npcm: support NPCM845
To: Rob Herring <robh@kernel.org>
Content-Type: multipart/alternative; boundary="0000000000002614f105d77dbb57"
X-Mailman-Approved-At: Tue, 08 Feb 2022 22:39:24 +1100
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
Cc: tmaimon77@gmail.com, KWLIU@nuvoton.com, tali.perry1@gmail.com,
 linux-i2c@vger.kernel.org, andriy.shevchenko@linux.intel.com,
 benjaminfair@google.com, krzysztof.kozlowski@canonical.com,
 openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com, lukas.bulwahn@gmail.com,
 tomer.maimon@nuvoton.com, devicetree@vger.kernel.org, bence98@sch.bme.hu,
 arnd@arndb.de, sven@svenpeter.dev, robh+dt@kernel.org, Avi.Fishman@nuvoton.com,
 yangyicong@hisilicon.com, semen.protsenko@linaro.org, avifishman70@gmail.com,
 venture@google.com, linux-kernel@vger.kernel.org, wsa@kernel.org,
 kfting@nuvoton.com, tali.perry@nuvoton.com, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000002614f105d77dbb57
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all:

Thank you for your comments and they will be addressed.

Regards,
Tyrone

Rob Herring <robh@kernel.org> =E6=96=BC 2022=E5=B9=B42=E6=9C=887=E6=97=A5 =
=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8810:22=E5=AF=AB=E9=81=93=EF=BC=9A

> On Mon, 07 Feb 2022 14:33:33 +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > This commit adds compatible and syscon description for NPCM845 i2c
> module.
> >
> > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller
> driver")
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > ---
> >  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 21 ++++++++++++++-----
> >  1 file changed, 16 insertions(+), 5 deletions(-)
> >
>
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
>
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
>
> Full log is available here: https://patchwork.ozlabs.org/patch/1589171
>
>
> i2c@80000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
>
> i2c@81000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@82000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@83000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@84000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@85000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@86000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@87000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@88000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@89000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@8a000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@8b000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@8c000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@8d000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml
>
> i2c@8e000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
>
> i2c@8f000: 'syscon' is a required property
>         arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
>         arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
>
>

--0000000000002614f105d77dbb57
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all:</div><div><br></div><div>Thank you for your c=
omments and they will be addressed.</div><div><br></div><div>Regards,</div>=
<div>Tyrone<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Rob Herring &lt;<a href=3D"mailto:robh@kernel.org">rob=
h@kernel.org</a>&gt; =E6=96=BC 2022=E5=B9=B42=E6=9C=887=E6=97=A5 =E9=80=B1=
=E4=B8=80 =E4=B8=8B=E5=8D=8810:22=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">On Mon, 07 Feb 2022 14:33:33 +=
0800, Tyrone Ting wrote:<br>
&gt; From: Tyrone Ting &lt;<a href=3D"mailto:kfting@nuvoton.com" target=3D"=
_blank">kfting@nuvoton.com</a>&gt;<br>
&gt; <br>
&gt; This commit adds compatible and syscon description for NPCM845 i2c mod=
ule.<br>
&gt; <br>
&gt; Fixes: 56a1485b102e (&quot;i2c: npcm7xx: Add Nuvoton NPCM I2C controll=
er driver&quot;)<br>
&gt; Signed-off-by: Tyrone Ting &lt;<a href=3D"mailto:kfting@nuvoton.com" t=
arget=3D"_blank">kfting@nuvoton.com</a>&gt;<br>
&gt; Signed-off-by: Tali Perry &lt;<a href=3D"mailto:tali.perry1@gmail.com"=
 target=3D"_blank">tali.perry1@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml=C2=A0 =C2=A0 =C2=A0| 2=
1 ++++++++++++++-----<br>
&gt;=C2=A0 1 file changed, 16 insertions(+), 5 deletions(-)<br>
&gt; <br>
<br>
Running &#39;make dtbs_check&#39; with the schema in this patch gives the<b=
r>
following warnings. Consider if they are expected or the schema is<br>
incorrect. These may not be new warnings.<br>
<br>
Note that it is not yet a requirement to have 0 warnings for dtbs_check.<br=
>
This will change in the future.<br>
<br>
Full log is available here: <a href=3D"https://patchwork.ozlabs.org/patch/1=
589171" rel=3D"noreferrer" target=3D"_blank">https://patchwork.ozlabs.org/p=
atch/1589171</a><br>
<br>
<br>
i2c@80000: &#39;syscon&#39; is a required property<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml<b=
r>
<br>
i2c@81000: &#39;syscon&#39; is a required property<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympu=
s.dt.yaml<br>
<br>
i2c@82000: &#39;syscon&#39; is a required property<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympu=
s.dt.yaml<br>
<br>
i2c@83000: &#39;syscon&#39; is a required property<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympu=
s.dt.yaml<br>
<br>
i2c@84000: &#39;syscon&#39; is a required property<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympu=
s.dt.yaml<br>
<br>
i2c@85000: &#39;syscon&#39; is a required property<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympu=
s.dt.yaml<br>
<br>
i2c@86000: &#39;syscon&#39; is a required property<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympu=
s.dt.yaml<br>
<br>
i2c@87000: &#39;syscon&#39; is a required property<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympu=
s.dt.yaml<br>
<br>
i2c@88000: &#39;syscon&#39; is a required property<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympu=
s.dt.yaml<br>
<br>
i2c@89000: &#39;syscon&#39; is a required property<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympu=
s.dt.yaml<br>
<br>
i2c@8a000: &#39;syscon&#39; is a required property<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympu=
s.dt.yaml<br>
<br>
i2c@8b000: &#39;syscon&#39; is a required property<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympu=
s.dt.yaml<br>
<br>
i2c@8c000: &#39;syscon&#39; is a required property<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympu=
s.dt.yaml<br>
<br>
i2c@8d000: &#39;syscon&#39; is a required property<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympu=
s.dt.yaml<br>
<br>
i2c@8e000: &#39;syscon&#39; is a required property<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml<b=
r>
<br>
i2c@8f000: &#39;syscon&#39; is a required property<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml<=
br>
<br>
</blockquote></div>

--0000000000002614f105d77dbb57--
