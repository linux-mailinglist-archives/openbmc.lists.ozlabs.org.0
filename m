Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8381391C5A
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 17:48:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqwN95YbHz2ymN
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 01:48:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=HzpVzJXK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=wltu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=HzpVzJXK; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqwMv1Srxz2xvZ
 for <openbmc@lists.ozlabs.org>; Thu, 27 May 2021 01:48:24 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id u7so824137plq.4
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 08:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZazJpJH3xiKnJgyo0hGkzIKpVPBDoo29lxxHxMR7heY=;
 b=HzpVzJXK5n2fqxVrBqoZqJRQMNbev+J/vghwkDX/3vJ4biMwtPLd1EgZ1ktcasYsAI
 I6fO/nqnnsCzpTrYybCYLTwU0jGMZ6GgwH2zy6m1n0ZZQNV95n/nkZya0OUv5vx9lqOJ
 SLYfD8QWQGit9KFv9pOGDtQcDtVVDcRcnSX2SKPKinkj4o5EvTux5RfBYNeChQsfFlMw
 udcAJ8PxMPmitqR+rEjZtmVlzaf+XI+MyhJ/fkhzqc1NbUhRWwztR1Cn3AqrNuGcbpi5
 2xqc7HDhBuYdNDl291ybZZwUfvTSk/MIdbXrxpEAA5pOjxSyENp1s5vY58VpvwHv4Ebq
 +z/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZazJpJH3xiKnJgyo0hGkzIKpVPBDoo29lxxHxMR7heY=;
 b=Vlfhd3EJrqNltGWAp586hfMrNtHejj4DOUYCIt92Jik7gpZh0uC9rAk2YiqJWLPn60
 r5vAP+sgrg3CN63CBDk4eCxTyJvVz+VG4mzRf5X7W8x58ZBLGkYLxXm71oxjCYIlOOS1
 5739C+UiRc6lIAe+aqhKviwYU83JG+bhVtoOIKq93Irn6GNxZs2cPC3aQarmsYX/PEzF
 NtMt6MqRIwodr+AzZQqvjl3vVC2TIu//mJ1/jiDiumNTWv6A2t4eupXgbTuNmoH56DQh
 aSpqhDjHZS9Gbi9ZkKsWktLKzobxRt+wKR0PnOBaQagDodD3iOPTpvxl/hNkr6qNi3YR
 rHUw==
X-Gm-Message-State: AOAM533D43LtZOr9+/nMyGOoQS022G93WxD8bY4lq8g/8QXIz0YY018S
 p0K4sHJcMbTxLUkb/mNipLPDsk9H912+q5hCzbbZCZAP/9s=
X-Google-Smtp-Source: ABdhPJwG219Afhf1trP9fygi81Km14iRIc+tZklVEALfz+yk9a4Fiaf9C6NVZyStTc749SNfSzb8BYI938EGI9EIVe0=
X-Received: by 2002:a17:90a:ee88:: with SMTP id
 i8mr35848597pjz.131.1622044101241; 
 Wed, 26 May 2021 08:48:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210424003821.3697200-1-wltu@google.com>
In-Reply-To: <20210424003821.3697200-1-wltu@google.com>
From: Willy Tu <wltu@google.com>
Date: Wed, 26 May 2021 08:48:10 -0700
Message-ID: <CAHwn2Xm+BnwbU-hHrKT-oazomh+V42t3Dm=xXhVJozNEdiDd8g@mail.gmail.com>
Subject: Re: [PATCH dev-5.10] arm: dts: nuvoton: gsj: Enable Nuvoton fan filter
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000077550d05c33d92f0"
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
Cc: William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000077550d05c33d92f0
Content-Type: text/plain; charset="UTF-8"

ping

On Fri, Apr 23, 2021 at 5:38 PM Willy Tu <wltu@google.com> wrote:

> gsj platform sometimes also see low fan speed issue that can be partly
> prevented with this fan filter.
>
> Signed-off-by: Willy Tu <wltu@google.com>
> ---
>  arch/arm/boot/dts/nuvoton-npcm730-gsj.dts | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> index 3ff116aaacb3..86facfc08c6e 100644
> --- a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> +++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> @@ -408,18 +408,21 @@ fan@0 {
>                 reg = <0x00>;
>                 fan-tach-ch = /bits/ 8 <0x00 0x01>;
>                 cooling-levels = <127 255>;
> +               fan_filter_en;
>         };
>
>         fan@1 {
>                 reg = <0x01>;
>                 fan-tach-ch = /bits/ 8 <0x02 0x03>;
>                 cooling-levels = /bits/ 8 <127 255>;
> +               fan_filter_en;
>         };
>
>         fan@2 {
>                 reg = <0x02>;
>                 fan-tach-ch = /bits/ 8 <0x04 0x05>;
>                 cooling-levels = /bits/ 8 <127 255>;
> +               fan_filter_en;
>         };
>  };
>
> --
> 2.31.1.498.g6c1eba8ee3d-goog
>
>

--00000000000077550d05c33d92f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Apr 23, 2021 at 5:38 PM Willy Tu &lt;<a href=
=3D"mailto:wltu@google.com">wltu@google.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">gsj platform sometimes also see =
low fan speed issue that can be partly<br>
prevented with this fan filter.<br>
<br>
Signed-off-by: Willy Tu &lt;<a href=3D"mailto:wltu@google.com" target=3D"_b=
lank">wltu@google.com</a>&gt;<br>
---<br>
=C2=A0arch/arm/boot/dts/nuvoton-npcm730-gsj.dts | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts b/arch/arm/boot/dts/=
nuvoton-npcm730-gsj.dts<br>
index 3ff116aaacb3..86facfc08c6e 100644<br>
--- a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts<br>
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts<br>
@@ -408,18 +408,21 @@ fan@0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x00&gt=
;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fan-tach-ch =3D /bi=
ts/ 8 &lt;0x00 0x01&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cooling-levels =3D =
&lt;127 255&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fan_filter_en;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fan@1 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x01&gt=
;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fan-tach-ch =3D /bi=
ts/ 8 &lt;0x02 0x03&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cooling-levels =3D =
/bits/ 8 &lt;127 255&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fan_filter_en;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fan@2 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x02&gt=
;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fan-tach-ch =3D /bi=
ts/ 8 &lt;0x04 0x05&gt;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cooling-levels =3D =
/bits/ 8 &lt;127 255&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fan_filter_en;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
=C2=A0};<br>
<br>
--<br>
2.31.1.498.g6c1eba8ee3d-goog<br>
<br>
</blockquote></div>

--00000000000077550d05c33d92f0--
