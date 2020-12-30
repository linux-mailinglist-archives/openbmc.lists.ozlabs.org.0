Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F582E7623
	for <lists+openbmc@lfdr.de>; Wed, 30 Dec 2020 06:03:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D5K1J47xTzDqGn
	for <lists+openbmc@lfdr.de>; Wed, 30 Dec 2020 16:03:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::133;
 helo=mail-lf1-x133.google.com; envelope-from=vijaykhemkalinux@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ui/FGybI; dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D5K0J0kXhzDqGg
 for <openbmc@lists.ozlabs.org>; Wed, 30 Dec 2020 16:02:20 +1100 (AEDT)
Received: by mail-lf1-x133.google.com with SMTP id x20so35224762lfe.12
 for <openbmc@lists.ozlabs.org>; Tue, 29 Dec 2020 21:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qNxCYrNYDGhtCLQVzvo1zq0sb4JbgCTBSzF6rCrgDNA=;
 b=ui/FGybISRgrdu3h+WW1cdXVNR+4XL8PXdLT2roMKAoZEyoYCR4BmMnW9fO998bSk6
 5PwCYGoIj7QMfoqE4CXbLG8FRB5112L+Sl8VC31dlw2b55+oAtT3YGemoz7RlTM0yaKX
 sBHNXTEiTAjtSE2QTGg0n6BCTIglz1vewtCtvfstwH2CQeE9lNG+yzonbJzqJQz0WlnM
 ySghb0Ev9x5eU7oO4DGjujGj8StrJ6C7witNrn/WAO4O1hbGav1cVfUGwOQl1zmiMmjk
 /J4An7mui1yxRObgkhNWe67UI90Z75Vc7JuSCBTu/8h3xkQxT6pwHzm9M3ssGaHfNj6+
 wvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qNxCYrNYDGhtCLQVzvo1zq0sb4JbgCTBSzF6rCrgDNA=;
 b=aFIfggOgx+F7t5ZPZrgopmDzAwmn9zrUckVQTUIUaPDAORPyUXFV+XZR2dI/6mVOil
 z9ua7cpb0YNxNLgZzwQG/9Ki4OgPLPRyImLS/MeDEL8+xtkYRkm1X7lQHsmB1G4JZcou
 lWn5D1A+a8QK74WVH7E0HuQdmnr0qSRDi0TyqNd5ca/w0fwj+60p2c3S5ySdCqwSuGaQ
 12wwZYIR+eH0b2oA9hjQBAViDwZpSkQf9ji1DQ2gGa00wJZNKnpSFy5MAdTxwOtwAmoD
 dIXj877gTHKzSnyE1dUfMOw71pv2IUrPlKbO1YCH6t4vewGmuRKE3DV41ww4YAI0QDQ8
 AXqA==
X-Gm-Message-State: AOAM5302m0eYPT03PeBSBT1faSsSPk0+KqZLc97p42VaERxvDrl8slb5
 IQ0fXOXhXqNxeUpfp8PIWZ5Qpk4g6xrZuq+HUx0=
X-Google-Smtp-Source: ABdhPJzT0RJYM8v9cjJMrZhMG6KT5Fo6pJjZyQfGQRA8OWEkYF7xN9gVcw35WdTGd3kLV9Vtq6Nly++TG1CG/K0ttjM=
X-Received: by 2002:a19:316:: with SMTP id 22mr20474040lfd.650.1609304535192; 
 Tue, 29 Dec 2020 21:02:15 -0800 (PST)
MIME-Version: 1.0
References: <TY2PR04MB39331267ECA5147A09FF691495D70@TY2PR04MB3933.apcprd04.prod.outlook.com>
 <CAGm54UH0kgwdmvSe7ZgmE6HV1fHzeJY7KOaFHcfYgNOAnPV-EQ@mail.gmail.com>
 <TY2PR04MB39337E262BA43CA7378F2B6C95D70@TY2PR04MB3933.apcprd04.prod.outlook.com>
In-Reply-To: <TY2PR04MB39337E262BA43CA7378F2B6C95D70@TY2PR04MB3933.apcprd04.prod.outlook.com>
From: Vijay Khemka <vijaykhemkalinux@gmail.com>
Date: Tue, 29 Dec 2020 21:02:03 -0800
Message-ID: <CAJTGxZHhbRs7pedZ+Ag8v7WACzXYyg43ZKYNWB75VywzoaSbpA@mail.gmail.com>
Subject: Re: [phosphor-virtual-sensor] Add new feature to get Warning or
 Critical property
To: =?UTF-8?B?SGFydmV5IFd1ICjlkLPltIfntq0p?= <Harvey.Wu@quantatw.com>
Content-Type: multipart/alternative; boundary="00000000000027d77c05b7a769ea"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Lei Yu <yulei.sh@bytedance.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000027d77c05b7a769ea
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am not understanding why you want to use threshold values to calculate
new sensor values. We can certainly add this feature but it can not be
based on name rather we have to think differently to get. It would really
help to decide on design once we know it's actual usage. I can't think of
any situation here.

Regards
-Vijay

On Tue, Dec 29, 2020 at 6:49 PM Harvey Wu (=E5=90=B3=E5=B4=87=E7=B6=AD) <Ha=
rvey.Wu@quantatw.com>
wrote:

> > On Wed, Dec 30, 2020 at 10:19 AM Harvey Wu (=E5=90=B3=E5=B4=87=E7=B6=AD=
)
> > <Harvey.Wu@quantatw.com> wrote:
> > >
> > > Hi All,
> > >
> > >
> > >
> > >         The current phosphor-virtual-sensor DbusParam value is from
> > DBus =E2=80=9CValue=E2=80=9D property which interface is
> > =E2=80=9Cxyz.openbmc_project.Sensor.Value=E2=80=9D.
> > >
> > > Because I want to get the property =E2=80=9CCriticalHigh=E2=80=9D val=
ue on DBus, could
> I
> > add a new feature =E2=80=9CInterface=E2=80=9D property in json file? Th=
e property can be
> > =E2=80=9CCriticalHigh=E2=80=9D , =E2=80=9CCriticalLow=E2=80=9D , =E2=80=
=9CWarningHigh=E2=80=9D or =E2=80=9CWarningLow=E2=80=9D.
> >
> >
> > According to
> > https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
hub
> .
> > com%2Fopenbmc%2Fphosphor-virtual-sensor%2Fblob%2Fmaster%2Fvirtual_
> > sensor_config.json%23L8-L14&amp;data=3D04%7C01%7CHarvey.Wu%40quantat
> > w.com%7C1479ebd5aedd4b8a7c3308d8ac6a4393%7C179b032707fc4973ac73
> > 8de7313561b2%7C1%7C0%7C637448919693850853%7CUnknown%7CTWFpb
> > GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6
> > Mn0%3D%7C1000&amp;sdata=3D0KyrnRkZKr9M59DEg%2BnyUruiege%2B3EDXb
> > mxzR%2B6xeng%3D&amp;reserved=3D0,
> > the threshold properties are already supported.
>
> The "Threshold" in json seems only can set the sensor critical or warning
> value, but I want to use the critical or warning value in "Expression".
> After check the newest commit, this function seems doesn't implement in
> current source code.
>
> >
> > --
> > BRs,
> > Lei YU
>
>
> Harvey Wu
>

--00000000000027d77c05b7a769ea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am not understanding why you want to use threshold=C2=A0=
values to calculate new sensor values. We can certainly add this feature bu=
t it can not be based on name rather we have to think differently to get. I=
t would really help to decide on design once we know it&#39;s actual usage.=
 I can&#39;t think of any situation here.<div><br></div><div>Regards</div><=
div>-Vijay</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Dec 29, 2020 at 6:49 PM Harvey Wu (=E5=90=B3=E5=B4=
=87=E7=B6=AD) &lt;<a href=3D"mailto:Harvey.Wu@quantatw.com">Harvey.Wu@quant=
atw.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">&gt; On Wed, Dec 30, 2020 at 10:19 AM Harvey Wu (=E5=90=B3=E5=B4=87=
=E7=B6=AD)<br>
&gt; &lt;<a href=3D"mailto:Harvey.Wu@quantatw.com" target=3D"_blank">Harvey=
.Wu@quantatw.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hi All,<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The current phosphor-virtual-sen=
sor DbusParam value is from<br>
&gt; DBus =E2=80=9CValue=E2=80=9D property which interface is<br>
&gt; =E2=80=9Cxyz.openbmc_project.Sensor.Value=E2=80=9D.<br>
&gt; &gt;<br>
&gt; &gt; Because I want to get the property =E2=80=9CCriticalHigh=E2=80=9D=
 value on DBus, could I<br>
&gt; add a new feature =E2=80=9CInterface=E2=80=9D property in json file? T=
he property can be<br>
&gt; =E2=80=9CCriticalHigh=E2=80=9D , =E2=80=9CCriticalLow=E2=80=9D , =E2=
=80=9CWarningHigh=E2=80=9D or =E2=80=9CWarningLow=E2=80=9D.<br>
&gt; <br>
&gt; <br>
&gt; According to<br>
&gt; <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fgithub" rel=3D"noreferrer" target=3D"_blank">https://apc01.safelin=
ks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub</a>.<br>
&gt; com%2Fopenbmc%2Fphosphor-virtual-sensor%2Fblob%2Fmaster%2Fvirtual_<br>
&gt; sensor_config.json%23L8-L14&amp;amp;data=3D04%7C01%7CHarvey.Wu%40quant=
at<br>
&gt; <a href=3D"http://w.com" rel=3D"noreferrer" target=3D"_blank">w.com</a=
>%7C1479ebd5aedd4b8a7c3308d8ac6a4393%7C179b032707fc4973ac73<br>
&gt; 8de7313561b2%7C1%7C0%7C637448919693850853%7CUnknown%7CTWFpb<br>
&gt; GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6<br=
>
&gt; Mn0%3D%7C1000&amp;amp;sdata=3D0KyrnRkZKr9M59DEg%2BnyUruiege%2B3EDXb<br=
>
&gt; mxzR%2B6xeng%3D&amp;amp;reserved=3D0,<br>
&gt; the threshold properties are already supported.<br>
<br>
The &quot;Threshold&quot; in json seems only can set the sensor critical or=
 warning value, but I want to use the critical or warning value in &quot;Ex=
pression&quot;.<br>
After check the newest commit, this function seems doesn&#39;t implement in=
 current source code.<br>
<br>
&gt; <br>
&gt; --<br>
&gt; BRs,<br>
&gt; Lei YU<br>
<br>
<br>
Harvey Wu<br>
</blockquote></div>

--00000000000027d77c05b7a769ea--
