Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E962E7C51
	for <lists+openbmc@lfdr.de>; Wed, 30 Dec 2020 21:49:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D5k0S5lfpzDqKT
	for <lists+openbmc@lfdr.de>; Thu, 31 Dec 2020 07:48:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a;
 helo=mail-lf1-x12a.google.com; envelope-from=vijaykhemkalinux@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MqTXEQGV; dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D5jzY54nSzDqKH
 for <openbmc@lists.ozlabs.org>; Thu, 31 Dec 2020 07:48:07 +1100 (AEDT)
Received: by mail-lf1-x12a.google.com with SMTP id s26so40142397lfc.8
 for <openbmc@lists.ozlabs.org>; Wed, 30 Dec 2020 12:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9cCSzFbkfz8m5CER8DawVW0OhNGNZzeo7RNHy4++9Jw=;
 b=MqTXEQGVXFF89qdq38lkA8FWz/upLiHecJsIf/9bBYSbQ/DTwVVxwnFOpdAxYDNxye
 ySKMwsZIx4O1TIyjmpb81dSH8sB2R70Ab/YqD6ERdmvUrvIXXbY1mGyPBhnCZjA5WaV3
 fte7XqczBiTisYw+P7tI/gD1aFmcLoKoSuDDQjSZ49srA1RsasHlSGFV5jKNH4hztyAk
 JSF4t4WxUBgCYz9/lyJLRCx1TyX2dgQHz9ck8h6HZlCMergwsac6EeCRcLKZLQtLsbJu
 sCo4+pE2zeopaa2kRzWAfz69pAirZgDDKkWO9bsZfo/z43UKkqbnM3J7bg1jWqXq/CK/
 3uQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9cCSzFbkfz8m5CER8DawVW0OhNGNZzeo7RNHy4++9Jw=;
 b=F2iv2ghgMJ+8L8r1pkd3IpmT4J2JbwuMLAgGle4SJFEaYXYa1NI0+T5fQ48QZJ2rSK
 tTqI9c1IX3QJoD7sXsxipwjC/XEDGrEjLs3HduaApYKtYbI/EeTkyY5ov/drYnaKHVBg
 eUsMsV0V1vYI6iBxLZZfylM/osUDnH+EdVXaqsOymZTALy6eouK0k/+lt+W8LnAemWzq
 mV8YYNl7LRSZPkP1gDmZrAwf2U/1wqoLvcBlvZhaGm6y33DwKWTDEe5vbZJzLgMv8Fs8
 61G/mUPdVzTnwXBYnB6mZmsxblACaDw76H1U98AF7ERqCAX0e9zsKkXCbDb0MReWIyz7
 i22Q==
X-Gm-Message-State: AOAM532EpHdJbS4A8fgcYDbEK3xJo3roQaOuhFicgEImjZp76VvkVEr8
 NdsT9OTtiakTwAFI65Gp1gXvB2pYdj/tEXe37Qo=
X-Google-Smtp-Source: ABdhPJzvInRhzcRCApBj6yRtMF7iDdySTdLflR+ag8mn6AQ6GRcAEJ1bPBzgcwbXxa8XHjgPOIoy8ZCPVNgtji/1fsY=
X-Received: by 2002:a2e:92d6:: with SMTP id k22mr26030268ljh.219.1609361284213; 
 Wed, 30 Dec 2020 12:48:04 -0800 (PST)
MIME-Version: 1.0
References: <TY2PR04MB39331267ECA5147A09FF691495D70@TY2PR04MB3933.apcprd04.prod.outlook.com>
 <CAGm54UH0kgwdmvSe7ZgmE6HV1fHzeJY7KOaFHcfYgNOAnPV-EQ@mail.gmail.com>
 <TY2PR04MB39337E262BA43CA7378F2B6C95D70@TY2PR04MB3933.apcprd04.prod.outlook.com>
 <CAJTGxZHhbRs7pedZ+Ag8v7WACzXYyg43ZKYNWB75VywzoaSbpA@mail.gmail.com>
 <TY2PR04MB3933D20377D54FB7D1A3067695D70@TY2PR04MB3933.apcprd04.prod.outlook.com>
In-Reply-To: <TY2PR04MB3933D20377D54FB7D1A3067695D70@TY2PR04MB3933.apcprd04.prod.outlook.com>
From: Vijay Khemka <vijaykhemkalinux@gmail.com>
Date: Wed, 30 Dec 2020 12:47:53 -0800
Message-ID: <CAJTGxZEL5Ae4VcTkVzZrxoSV75Wni=e0W-dGtB5qNc5OrV5Org@mail.gmail.com>
Subject: Re: [phosphor-virtual-sensor] Add new feature to get Warning or
 Critical property
To: =?UTF-8?B?SGFydmV5IFd1ICjlkLPltIfntq0p?= <Harvey.Wu@quantatw.com>
Content-Type: multipart/alternative; boundary="000000000000a92eff05b7b49f8e"
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

--000000000000a92eff05b7b49f8e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 29, 2020 at 10:13 PM Harvey Wu (=E5=90=B3=E5=B4=87=E7=B6=AD) <H=
arvey.Wu@quantatw.com>
wrote:

> Hi Vijay,
>
>         Because I want to calculate the different value between
> CriticalHigh and current sensor value in CPU sensor, and then there are
> weighting and some const value to multiply or plus the different value.
> But the CPU sensor critical high threshold temp is set as TjMax, and the
> TjMax value will be different according the different CPU process type, n=
ot
> a Const. That's why I want to add this feature.
>

Yes I understand that critical values for cpus are received from CPUs and
not a constant values.  But just for this specific sensor we should not add
a new complex feature in a virtual sensor. Because every other sensor has
constant threshold values defined by user so it won't be used anywhere else
other than psu cpu sensor only.

I would rather expose TjMax on dbus if you really want to use this.further.
So exposing tjmax would be easy and straightforward rather than adding this
complex logic for only this sensor in a generic virtual sensor.

>
> For example, according the Document below, if the processor is i7-3770K,
> the TjMax is 105, and if the processor is U7500, the TjMax is 100.
> https://www.kernel.org/doc/Documentation/hwmon/coretemp.rst
>
> If the Expression is "(TjMax - currentTemp) * scalar - Const", then it
> will calculate different results between these two CPU processor.
>
>
> Harvey Wu
>
> From: Vijay Khemka <vijaykhemkalinux@gmail.com>
> Sent: Wednesday, December 30, 2020 1:02 PM
> To: Harvey Wu (=E5=90=B3=E5=B4=87=E7=B6=AD) <Harvey.Wu@quantatw.com>
> Cc: Lei Yu <yulei.sh@bytedance.com>; openbmc@lists.ozlabs.org
> Subject: Re: [phosphor-virtual-sensor] Add new feature to get Warning or
> Critical property
>
> I am not understanding why you want to use threshold values to calculate
> new sensor values. We can certainly add this feature but it can not be
> based on name rather we have to think differently to get. It would really
> help to decide on design once we know it's actual usage. I can't think of
> any situation here.
>
> Regards
> -Vijay
>
> On Tue, Dec 29, 2020 at 6:49 PM Harvey Wu (=E5=90=B3=E5=B4=87=E7=B6=AD) <=
mailto:
> Harvey.Wu@quantatw.com> wrote:
> > On Wed, Dec 30, 2020 at 10:19 AM Harvey Wu (=E5=90=B3=E5=B4=87=E7=B6=AD=
)
> > <mailto:Harvey.Wu@quantatw.com> wrote:
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
> >
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fw.com%=
2F&data=3D04%7C01%7CHarvey.Wu%40quantatw.com%7Cf75707a7431e4dca712e08d8ac80=
182b%7C179b032707fc4973ac738de7313561b2%7C1%7C0%7C637449013448979318%7CUnkn=
own%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXV=
CI6Mn0%3D%7C1000&sdata=3DkxT3i6moVPggqbY1zJiag18Cp9wGmyk1ctqrO8XlTUc%3D&res=
erved=3D0%7C1479ebd5aedd4b8a7c3308d8ac6a4393%7C179b032707fc4973ac73
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

--000000000000a92eff05b7b49f8e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 29, 2020=
 at 10:13 PM Harvey Wu (=E5=90=B3=E5=B4=87=E7=B6=AD) &lt;<a href=3D"mailto:=
Harvey.Wu@quantatw.com">Harvey.Wu@quantatw.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">Hi Vijay,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Because I want to calculate the different value=
 between CriticalHigh and current sensor value in CPU sensor, and then ther=
e are weighting and some const value to multiply or plus the different valu=
e.<br>
But the CPU sensor critical high threshold temp is set as TjMax, and the Tj=
Max value will be different according the different CPU process type, not a=
 Const. That&#39;s why I want to add this feature.<br></blockquote><div><br=
></div><div>Yes I understand that critical values for cpus are received fro=
m CPUs and not a constant values.=C2=A0 But just for this specific sensor w=
e should not add a new complex feature in a virtual sensor. Because every o=
ther sensor has constant threshold values defined by user so it won&#39;t b=
e used anywhere else other than psu cpu sensor only.</div><div><br></div><d=
iv>I would rather expose TjMax=C2=A0on dbus if you really want to use this.=
further. So exposing tjmax=C2=A0would be easy and straightforward rather th=
an adding this complex logic for only this sensor in a generic virtual sens=
or.=C2=A0=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
For example, according the Document below, if the processor is i7-3770K, th=
e TjMax is 105, and if the processor is U7500, the TjMax is 100.<br>
<a href=3D"https://www.kernel.org/doc/Documentation/hwmon/coretemp.rst" rel=
=3D"noreferrer" target=3D"_blank">https://www.kernel.org/doc/Documentation/=
hwmon/coretemp.rst</a> <br>
<br>
If the Expression is &quot;(TjMax - currentTemp) * scalar - Const&quot;, th=
en it will calculate different results between these two CPU processor.<br>
<br>
<br>
Harvey Wu<br>
<br>
From: Vijay Khemka &lt;<a href=3D"mailto:vijaykhemkalinux@gmail.com" target=
=3D"_blank">vijaykhemkalinux@gmail.com</a>&gt; <br>
Sent: Wednesday, December 30, 2020 1:02 PM<br>
To: Harvey Wu (=E5=90=B3=E5=B4=87=E7=B6=AD) &lt;<a href=3D"mailto:Harvey.Wu=
@quantatw.com" target=3D"_blank">Harvey.Wu@quantatw.com</a>&gt;<br>
Cc: Lei Yu &lt;<a href=3D"mailto:yulei.sh@bytedance.com" target=3D"_blank">=
yulei.sh@bytedance.com</a>&gt;; <a href=3D"mailto:openbmc@lists.ozlabs.org"=
 target=3D"_blank">openbmc@lists.ozlabs.org</a><br>
Subject: Re: [phosphor-virtual-sensor] Add new feature to get Warning or Cr=
itical property<br>
<br>
I am not understanding why you want to use threshold=C2=A0values to calcula=
te new sensor values. We can certainly add this feature but it can not be b=
ased on name rather we have to think differently to get. It would really he=
lp to decide on design once we know it&#39;s actual usage. I can&#39;t thin=
k of any situation here.<br>
<br>
Regards<br>
-Vijay<br>
<br>
On Tue, Dec 29, 2020 at 6:49 PM Harvey Wu (=E5=90=B3=E5=B4=87=E7=B6=AD) &lt=
;mailto:<a href=3D"mailto:Harvey.Wu@quantatw.com" target=3D"_blank">Harvey.=
Wu@quantatw.com</a>&gt; wrote:<br>
&gt; On Wed, Dec 30, 2020 at 10:19 AM Harvey Wu (=E5=90=B3=E5=B4=87=E7=B6=
=AD)<br>
&gt; &lt;mailto:<a href=3D"mailto:Harvey.Wu@quantatw.com" target=3D"_blank"=
>Harvey.Wu@quantatw.com</a>&gt; wrote:<br>
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
&gt; <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%=
3A%2F%2Fw.com%2F&amp;data=3D04%7C01%7CHarvey.Wu%40quantatw.com%7Cf75707a743=
1e4dca712e08d8ac80182b%7C179b032707fc4973ac738de7313561b2%7C1%7C0%7C6374490=
13448979318%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DkxT3i6moVPggqbY1zJiag18Cp9wG=
myk1ctqrO8XlTUc%3D&amp;reserved=3D0%7C1479ebd5aedd4b8a7c3308d8ac6a4393%7C17=
9b032707fc4973ac73" rel=3D"noreferrer" target=3D"_blank">https://apc01.safe=
links.protection.outlook.com/?url=3Dhttp%3A%2F%2Fw.com%2F&amp;data=3D04%7C0=
1%7CHarvey.Wu%40quantatw.com%7Cf75707a7431e4dca712e08d8ac80182b%7C179b03270=
7fc4973ac738de7313561b2%7C1%7C0%7C637449013448979318%7CUnknown%7CTWFpbGZsb3=
d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000=
&amp;sdata=3DkxT3i6moVPggqbY1zJiag18Cp9wGmyk1ctqrO8XlTUc%3D&amp;reserved=3D=
0%7C1479ebd5aedd4b8a7c3308d8ac6a4393%7C179b032707fc4973ac73</a><br>
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
</blockquote></div></div></div>

--000000000000a92eff05b7b49f8e--
