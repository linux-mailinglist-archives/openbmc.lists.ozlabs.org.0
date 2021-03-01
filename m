Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A70327F5C
	for <lists+openbmc@lfdr.de>; Mon,  1 Mar 2021 14:23:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dq1Dh19PJz3cWl
	for <lists+openbmc@lfdr.de>; Tue,  2 Mar 2021 00:23:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=VdnymNys;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::236;
 helo=mail-oi1-x236.google.com; envelope-from=tmaimon77@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VdnymNys; dkim-atps=neutral
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dq1DS02f2z30QF
 for <openbmc@lists.ozlabs.org>; Tue,  2 Mar 2021 00:23:34 +1100 (AEDT)
Received: by mail-oi1-x236.google.com with SMTP id x20so17945949oie.11
 for <openbmc@lists.ozlabs.org>; Mon, 01 Mar 2021 05:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lkwa763hxSjrHkFW9hYdgwfUDb1UMb5DhaGlyQ4KLVs=;
 b=VdnymNyshjjQ682vUMA9WWBeIzSbN4jfetXtB09SRIUNcssx+CgBNXnTMSuCsKYyvv
 OscU2UjpgaiVCxxLpSTP6x3tFv+ooJSAQzxsUSmF1gAAMuXDX620ySJAt/abS/LnjHwQ
 7r8Wlu2S5s5eyGg8NoeBZ5VRn9s49zyg7BSTI+ESGdHcVQswjITkpFJm2gPqsshSb36L
 dy4RVK7YLPywPl317UnAfECcm9vqEPHtQjKQYC4jd9WkYktHiD9Giqo1iaMh3uSdvttW
 licYq1I2C0X6ZTzlU9mq39eSM+nZImOlVXx+vgQjYodL6U8kUL16aPzNUI74Aer8FGuH
 MCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lkwa763hxSjrHkFW9hYdgwfUDb1UMb5DhaGlyQ4KLVs=;
 b=AtlJMVnJmPfO5Nf/u9yNZ0OraOlDqO0xVoZHUTpRR2nVGcIiBOnrcN/G7OMU48lSLL
 T+anKzZgAVK8xMET160muJUCypVxYfXEuQ8bytGE3Z6rsrM+xbQ6lGf7V1s1UQPirszG
 vlv/0oaqNeZVo9P0WflaHfOjx8rMT43vDl9FQbID4AGL3bxuH6nLaxvJb6JJvNxS5K9M
 4GQlxAQ/dIWi4ONXaVjUsMCVXWFP3kjp6BsZ4lRtGg32fEEIj0zehkXiTO1fgg+I/Uhq
 fzpuLz6iZ7y6vn8GSjZVfOlaCDDZqVAYbr0S+jU3mRIfaFbJIJRvCquV/8Yq0bWjCxvn
 w2qw==
X-Gm-Message-State: AOAM5312Aefpuuy/vITwQXzWdlo+Esc+9ohtxgV4Pa45U+H93XhwgkiF
 jIl6snCz1rwPbTDzqWIvD/29cjWn8cYTchb3uIs=
X-Google-Smtp-Source: ABdhPJwnOoppPdZcyzyLZoJNQ297/GIJDao2FxOrXYhRbPsHvCdzQi1hL3lXUdMbGnc2l9lNWG2PrDOEtv+v4BZVsBM=
X-Received: by 2002:a05:6808:130d:: with SMTP id
 y13mr11391569oiv.167.1614605010037; 
 Mon, 01 Mar 2021 05:23:30 -0800 (PST)
MIME-Version: 1.0
References: <20210218122546.3546582-1-gmouse@google.com>
 <CADKL2t6P4gaSUZEFgk7y+TNBRw0Lhf8mXTxzLdbe3FhGs0WH+w@mail.gmail.com>
 <CAP6Zq1jf4-XAhLQxqNx3LM7-YzDr8zaVPb-jznn8o=frxTotdQ@mail.gmail.com>
 <CADVsX8-4gJYs1P7y4VazyXPNC2TxgmUi1MgOpLgx3iAV9n62Hg@mail.gmail.com>
In-Reply-To: <CADVsX8-4gJYs1P7y4VazyXPNC2TxgmUi1MgOpLgx3iAV9n62Hg@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 1 Mar 2021 15:36:58 +0200
Message-ID: <CAP6Zq1hd56Su6YjqyOJP2fDHuYYkShEGsFaYou6fGzhZhu-HKQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: nuvoton: Fix flash layout
To: Anton Kachalov <gmouse@google.com>
Content-Type: multipart/alternative; boundary="00000000000013750205bc798691"
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

--00000000000013750205bc798691
Content-Type: text/plain; charset="UTF-8"

Hi Anton,

The reason the u-boot Env is at 0x100000 address is that some
costumers have:
one copy of Bootblock and U-boot at 0x0 - 0x80000
second copy of Bootblock and U-boot at 0x80000 - 0x100000.

we have two options;
1. Modify the OpenBMC device tree flash layout u-boot Env address to
0x100000.
2. Add a patch to OpnBMC platform that using openbmc flash layout to
modify CONFIG_ENV_OFFSET
in the u-boot.

Thanks,

Tomer


On Fri, 26 Feb 2021 at 22:10, Anton Kachalov <gmouse@google.com> wrote:

> Hello, Tomer.
>
> Seems like Nuvoton's u-boot expects the uboot-env at different address
> comparing to openbmc-flash-layout.dtsi:
>
>
> https://github.com/Nuvoton-Israel/u-boot/blob/npcm7xx-v2019.01/include/configs/poleg.h#L30
>
> Vs.
>
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/openbmc-flash-layout.dtsi#n13
>
> The change is more about making partitions naming the same as expected by
> OpenBMC.
>
> On Sun, 21 Feb 2021 at 17:40, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
>> Hi Benjamin and Anton,
>>
>> Sorry for the late reply,
>>
>> The EVB FIU0-CS0 partitioning is used for testing the EVB and this is why
>> it is different than the OpenBMC flash layout.
>>
>>
>>
>> Are you using the NPCM7XX EVB for OpenBMC? if yes we can consider to
>> modify the flash partition to OpenBMC use.
>>
>> On Thu, 18 Feb 2021 at 19:11, Benjamin Fair <benjaminfair@google.com>
>> wrote:
>>
>>> On Thu, 18 Feb 2021 at 04:42, <gmouse@google.com> wrote:
>>> >
>>> > From: "Anton D. Kachalov" <gmouse@google.com>
>>> >
>>> > This change satisfy OpenBMC requirements for flash layout.
>>> >
>>> > Signed-off-by: Anton D. Kachalov <gmouse@google.com>
>>> > ---
>>> >  arch/arm/boot/dts/nuvoton-npcm750-evb.dts | 28 +++++++----------------
>>> >  1 file changed, 8 insertions(+), 20 deletions(-)
>>> >
>>> > diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
>>> b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
>>> > index bd1eb6ee380f..741c1fee8552 100644
>>> > --- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
>>> > +++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
>>> > @@ -182,8 +182,8 @@ bbuboot2@80000 {
>>> >                                 reg = <0x0080000 0x80000>;
>>> >                                 read-only;
>>> >                                 };
>>> > -                       envparam@100000 {
>>> > -                               label = "env-param";
>>> > +                       ubootenv@100000 {
>>> > +                               label = "u-boot-env";
>>> >                                 reg = <0x0100000 0x40000>;
>>> >                                 read-only;
>>> >                                 };
>>> > @@ -195,25 +195,13 @@ kernel@200000 {
>>> >                                 label = "kernel";
>>> >                                 reg = <0x0200000 0x400000>;
>>> >                                 };
>>> > -                       rootfs@600000 {
>>> > -                               label = "rootfs";
>>> > -                               reg = <0x0600000 0x700000>;
>>> > +                       rofs@780000 {
>>> > +                               label = "rofs";
>>> > +                               reg = <0x0780000 0x1680000>;
>>> >                                 };
>>> > -                       spare1@D00000 {
>>> > -                               label = "spare1";
>>> > -                               reg = <0x0D00000 0x200000>;
>>> > -                               };
>>> > -                       spare2@0F00000 {
>>> > -                               label = "spare2";
>>> > -                               reg = <0x0F00000 0x200000>;
>>> > -                               };
>>> > -                       spare3@1100000 {
>>> > -                               label = "spare3";
>>> > -                               reg = <0x1100000 0x200000>;
>>> > -                               };
>>> > -                       spare4@1300000 {
>>> > -                               label = "spare4";
>>> > -                               reg = <0x1300000 0x0>;
>>> > +                       rwfs@1e00000 {
>>> > +                               label = "rwfs";
>>> > +                               reg = <0x1e00000 0x200000>;
>>> >                         };
>>>
>>> I recommend just including the openbmc-flash-layout.dtsi file here
>>> instead since that contains the common flash layout for most OpenBMC
>>> systems.
>>>
>>> Good solution,
>> Do you mean nuvoton-openbmc-flash-layout?
>>
>>> >                 };
>>> >         };
>>> > --
>>> > 2.30.0.478.g8a0d178c01-goog
>>> >
>>>
>>
>> Thanks,
>>
>> Tomer
>>
>

--00000000000013750205bc798691
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Anton,<div><br></div><div>The reason the u-boot Env is =
at 0x100000 address is that some costumers=C2=A0have:</div><div>one copy of=
 Bootblock and U-boot at 0x0 - 0x80000</div><div>second copy of Bootblock a=
nd U-boot at 0x80000 - 0x100000.</div><div><br></div><div>we have two optio=
ns;</div><div>1. Modify the OpenBMC device tree flash layout u-boot Env add=
ress to 0x100000.<br></div><div>2. Add a patch to OpnBMC platform that usin=
g openbmc flash layout to modify=C2=A0<span class=3D"gmail-pl-en" style=3D"=
box-sizing:border-box;font-family:SFMono-Regular,Consolas,&quot;Liberation =
Mono&quot;,Menlo,monospace;font-size:12px;white-space:pre">CONFIG_ENV_OFFSE=
T </span><span class=3D"gmail-pl-en" style=3D"box-sizing:border-box;white-s=
pace:pre"><font face=3D"arial, sans-serif" style=3D"">in the u-boot.</font>=
</span></div><div><span class=3D"gmail-pl-en" style=3D"box-sizing:border-bo=
x;white-space:pre"><font face=3D"arial, sans-serif" style=3D""><br></font><=
/span></div><div><span class=3D"gmail-pl-en" style=3D"box-sizing:border-box=
;white-space:pre"><font face=3D"arial, sans-serif" style=3D"">Thanks,</font=
></span></div><div><span class=3D"gmail-pl-en" style=3D"box-sizing:border-b=
ox;white-space:pre"><font face=3D"arial, sans-serif" style=3D""><br></font>=
</span></div><div><span class=3D"gmail-pl-en" style=3D"box-sizing:border-bo=
x;white-space:pre"><font face=3D"arial, sans-serif" style=3D"">Tomer</font>=
</span></div><div><span class=3D"gmail-pl-en" style=3D"box-sizing:border-bo=
x;white-space:pre"><font face=3D"arial, sans-serif" style=3D""><br></font><=
/span></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Fri, 26 Feb 2021 at 22:10, Anton Kachalov &lt;<a href=3D"mai=
lto:gmouse@google.com">gmouse@google.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">H=
ello, Tomer.<br></div><div dir=3D"ltr"><div><br></div><div>Seems like Nuvot=
on&#39;s=C2=A0u-boot expects the uboot-env at different address comparing t=
o openbmc-flash-layout.dtsi:</div><div><br></div><div><a href=3D"https://gi=
thub.com/Nuvoton-Israel/u-boot/blob/npcm7xx-v2019.01/include/configs/poleg.=
h#L30" target=3D"_blank">https://github.com/Nuvoton-Israel/u-boot/blob/npcm=
7xx-v2019.01/include/configs/poleg.h#L30</a><br></div><div><br></div><div>V=
s.</div><div><br></div><div><a href=3D"https://git.kernel.org/pub/scm/linux=
/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/openbmc-flash-layout.=
dtsi#n13" target=3D"_blank">https://git.kernel.org/pub/scm/linux/kernel/git=
/torvalds/linux.git/tree/arch/arm/boot/dts/openbmc-flash-layout.dtsi#n13</a=
><br></div><div><br></div><div>The change is more about making partitions n=
aming the same as expected by OpenBMC.</div><div><br></div></div><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 21 Feb 2021 =
at 17:40, Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com" target=3D=
"_blank">tmaimon77@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Benja=
min and Anton,<div><br></div><div>Sorry for the late reply,</div><div><br><=
/div><div><p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt"><font fa=
ce=3D"arial, sans-serif">The EVB FIU0-CS0
partitioning=C2=A0is used for testing=C2=A0the EVB and this is why it is
different=C2=A0than the OpenBMC flash layout.</font></p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt"><font face=3D"aria=
l, sans-serif">=C2=A0</font></p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt"><font face=3D"aria=
l, sans-serif">Are you using the NPCM7XX EVB for
OpenBMC? if yes we can consider to modify the flash partition to OpenBMC us=
e.</font></p></div><div><br></div></div><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, 18 Feb 2021 at 19:11, Benjamin Fair &=
lt;<a href=3D"mailto:benjaminfair@google.com" target=3D"_blank">benjaminfai=
r@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Thu, 18 Feb 2021 at 04:42, &lt;<a href=3D"mailto:gmouse@goog=
le.com" target=3D"_blank">gmouse@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: &quot;Anton D. Kachalov&quot; &lt;<a href=3D"mailto:gmouse@googl=
e.com" target=3D"_blank">gmouse@google.com</a>&gt;<br>
&gt;<br>
&gt; This change satisfy OpenBMC requirements for flash layout.<br>
&gt;<br>
&gt; Signed-off-by: Anton D. Kachalov &lt;<a href=3D"mailto:gmouse@google.c=
om" target=3D"_blank">gmouse@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 arch/arm/boot/dts/nuvoton-npcm750-evb.dts | 28 +++++++----------=
------<br>
&gt;=C2=A0 1 file changed, 8 insertions(+), 20 deletions(-)<br>
&gt;<br>
&gt; diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot=
/dts/nuvoton-npcm750-evb.dts<br>
&gt; index bd1eb6ee380f..741c1fee8552 100644<br>
&gt; --- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts<br>
&gt; +++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts<br>
&gt; @@ -182,8 +182,8 @@ bbuboot2@80000 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x0080000 0x800=
00&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0read-only;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0envparam@100000 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;env-param&quot;;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ubootenv@100000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;u-boot-env&quot;;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x0100000 0x400=
00&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0read-only;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; @@ -195,25 +195,13 @@ kernel@200000 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;kernel&quot=
;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x0200000 0x400=
000&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0rootfs@600000 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;rootfs&quot;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x0600000 0x700000&gt=
;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0rofs@780000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;rofs&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x0780000 0x1680000&g=
t;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0spare1@D00000 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;spare1&quot;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x0D00000 0x200000&gt=
;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0spare2@0F00000 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;spare2&quot;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x0F00000 0x200000&gt=
;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0spare3@1100000 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;spare3&quot;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x1100000 0x200000&gt=
;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0spare4@1300000 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;spare4&quot;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x1300000 0x0&gt;;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0rwfs@1e00000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D &quot;rwfs&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x1e00000 0x200000&gt=
;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0};<br>
<br>
I recommend just including the openbmc-flash-layout.dtsi file here<br>
instead since that contains the common flash layout for most OpenBMC<br>
systems.<br>
<br></blockquote><div>Good=C2=A0<font face=3D"arial, sans-serif">solution</=
font>,=C2=A0</div><div>Do you mean nuvoton-openbmc-flash-layout?</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; --<br>
&gt; 2.30.0.478.g8a0d178c01-goog<br>
&gt;<br></blockquote><div><br></div><div>Thanks,</div><div><br></div><div>T=
omer=C2=A0</div></div></div>
</blockquote></div></div>
</blockquote></div>

--00000000000013750205bc798691--
