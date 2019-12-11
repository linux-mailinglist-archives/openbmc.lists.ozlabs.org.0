Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AAB11A49D
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2019 07:41:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47XnPp2kSWzDqlQ
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2019 17:41:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=tyler.sabdon@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rhzeH/en"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XnP819rXzDqkG
 for <openbmc@lists.ozlabs.org>; Wed, 11 Dec 2019 17:40:27 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id a17so636048pls.5
 for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2019 22:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zox39QrrMfIMw+PZLFYGb1INdJe0tpPuY+wRndwuQlI=;
 b=rhzeH/enHoiq1zVzSbZKtM9fTETEqSV/1/jOajoJI7VQNQWf0LaSgqSTgkUnGSvVms
 pgMU/mX6+bRsambgKdPPRclAdfENvkIq/fv2wj51FtCJN3RRDAwnKat7ocWv6PyvdaVH
 wahU/fARtjysEps9iJQQQo7wEq8u8wtGetfEcrnrdXKw1nK6QNj80twbUCPL670tzca1
 X6rD2YiFCUyWfrLYJFC8hWFBtXm1eFqbPC0NEvoWXDhmiOCVqIqvU/0G/s1ZQ3pohJ5v
 CMjd1R+4Kt5VlGjGtrao412nUcj+rnL7ZzAQHxKBzVGkVehK0C453z343SxPEMIXydcK
 2Jgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zox39QrrMfIMw+PZLFYGb1INdJe0tpPuY+wRndwuQlI=;
 b=nKgkLRyhvwzUD6tqXFwcnf4EjF+KvKN12O2i+pyi0TX/gIKLBb/PlcxFbYGhpgP8By
 NWZnIg7IoR/ROEgiOe2mLWIcpAYT03zl5cJsudRUjn0Vr7QkfIHAYk2q3HH7S6pV9f2E
 4pj77QQ/jz410PZtiQyVPiAO7X6VRR9cNTzPnRZvxB2PVA7Q8SWktu2UD+VAZaQVUvu9
 nej/OGPwyQu8qFeg7SGXEmYrw2VlEL5ZrmfDxspvLQZ8bjJj0GZUvpWx0oi2xFSwnCqN
 u2erz6UIR2LOykGiovWJD8X+mhtHDy4g1rkYe7/v8PVNyif3ud7h3Jl2U1CZt6by/xPP
 IwRA==
X-Gm-Message-State: APjAAAUur+pAVPByRyaovznBRXx99ULDUhqa1Ft7MBD90e3jIFMyLulO
 1ES8H+nNvpgGLEclaYj+UOIwegWkjWDBnOornrAPIA==
X-Google-Smtp-Source: APXvYqzdKs3y47LAVOhw+D7dIvjmwxh02qArVClZrK0AO6idV84qkk7TA+PC/cd46JKZy8uWIY4H3v/3HSBU2Wd7itg=
X-Received: by 2002:a17:902:6802:: with SMTP id
 h2mr1530653plk.135.1576046423836; 
 Tue, 10 Dec 2019 22:40:23 -0800 (PST)
MIME-Version: 1.0
References: <CAO9PYRLd5KJHiuvDxzGcw7E5CVapk3Fonm_mPDaov1zaVHZm2g@mail.gmail.com>
 <4ffc887c-9160-a5a6-2bf9-0a86c872cd60@linux.ibm.com>
 <CAO9PYRL=OHexpzjazShywXxg1w5FeUA4=dkupNXCY-85+CckJQ@mail.gmail.com>
 <1a21e764-151b-a3b5-ad4b-0d79f336d48d@linux.ibm.com>
In-Reply-To: <1a21e764-151b-a3b5-ad4b-0d79f336d48d@linux.ibm.com>
From: Deng Tyler <tyler.sabdon@gmail.com>
Date: Wed, 11 Dec 2019 14:40:00 +0800
Message-ID: <CAO9PYRJGne+VxENsY6r_mGzdAxf-sUgzLu71tnRQipO9hPLV=Q@mail.gmail.com>
Subject: Re: pinctrl in phosphor-hwmon
To: Matt Spinler <mspinler@linux.ibm.com>
Content-Type: multipart/alternative; boundary="0000000000003e0bee059967e785"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000003e0bee059967e785
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I added gpio control in my fan driver but I still met some problem. While
phosphor-hwmon reading fan0_input, the fan tach driver change 2 gpio pin
and sleep 2 seconds to return rpm value for stable. There are 12 fan
sensors in my platform so the phosphor-hwmon need wait 24 senconds at least
to get rpm. The waiting time cause dbus hang while issuing ipmi sensor
command. Do you have any suggestions?

Tyler

Matt Spinler <mspinler@linux.ibm.com> =E6=96=BC 2019=E5=B9=B412=E6=9C=8811=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8812:29=E5=AF=AB=E9=81=93=EF=
=BC=9A

>
>
> On 12/9/2019 11:08 PM, Deng Tyler wrote:
> > Hi Matt:
> >     Thank for your response that's really helpful. I check the link
> > and it seems allow a gpio set to high before/after reading a
> > correspond sensor. Is it possible change 2 gpio to high/low for
> > reading a correspond sensor?
>
> That isn't possible in the current code, but I don't see why someone
> couldn't add that feature.
>
> >
> > Regards,
> > Tyler
> >
> > Matt Spinler <mspinler@linux.ibm.com <mailto:mspinler@linux.ibm.com>>
> > =E6=96=BC 2019=E5=B9=B412=E6=9C=889=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=
=8B=E5=8D=8810:58=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> >
> >
> >     On 12/9/2019 6:15 AM, Deng Tyler wrote:
> >     > Hi all:
> >     >     Does phosphor-hwmon support changing gpio pin before read
> >     > /sys/class/hwmon/hwmon0/fan*_input while monitoring fan sensor?
> >     In my
> >     > platform, fans gpio are connect to pin-mux and I need control gpi=
o
> >     > before get fan tach rpm.
> >
> >     It does have the ability to modify a GPIO before/after a reading:
> >
> https://github.com/openbmc/phosphor-hwmon/blob/master/mainloop.cpp#L447
> >
> >     configured by some lines in the conf file, like:
> >
> https://github.com/openbmc/meta-ibm/blob/master/meta-romulus/recipes-phos=
phor/sensors/phosphor-hwmon/obmc/hwmon/iio-hwmon-battery.conf#L4
> >
> >     >
> >     > Regards,
> >     > Tyler
> >
>
>

--0000000000003e0bee059967e785
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I added gpio control in my fan driver but I still met some=
 problem. While phosphor-hwmon reading fan0_input, the fan tach driver chan=
ge 2 gpio pin and sleep 2 seconds=C2=A0to return rpm value for stable. Ther=
e are 12 fan sensors in my platform so the phosphor-hwmon need wait 24 senc=
onds at least to get rpm. The waiting time cause dbus hang while issuing ip=
mi sensor command. Do you have any suggestions?<div><br></div><div>Tyler</d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">Matt Spinler &lt;<a href=3D"mailto:mspinler@linux.ibm.com">mspinler@linu=
x.ibm.com</a>&gt; =E6=96=BC 2019=E5=B9=B412=E6=9C=8811=E6=97=A5 =E9=80=B1=
=E4=B8=89 =E4=B8=8A=E5=8D=8812:29=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 12/9/2019 11:08 PM, Deng Tyler wrote:<br>
&gt; Hi Matt:<br>
&gt; =C2=A0 =C2=A0 Thank for your response that&#39;s really helpful. I che=
ck the link <br>
&gt; and it seems allow a gpio set to high before/after reading a <br>
&gt; correspond=C2=A0sensor. Is it possible change 2 gpio to high/low for <=
br>
&gt; reading a correspond sensor?<br>
<br>
That isn&#39;t possible in the current code, but I don&#39;t see why someon=
e <br>
couldn&#39;t add that feature.<br>
<br>
&gt;<br>
&gt; Regards,<br>
&gt; Tyler<br>
&gt;<br>
&gt; Matt Spinler &lt;<a href=3D"mailto:mspinler@linux.ibm.com" target=3D"_=
blank">mspinler@linux.ibm.com</a> &lt;mailto:<a href=3D"mailto:mspinler@lin=
ux.ibm.com" target=3D"_blank">mspinler@linux.ibm.com</a>&gt;&gt; <br>
&gt; =E6=96=BC 2019=E5=B9=B412=E6=9C=889=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=
=8B=E5=8D=8810:58=E5=AF=AB=E9=81=93=EF=BC=9A<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On 12/9/2019 6:15 AM, Deng Tyler wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hi all:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 Does phosphor-hwmon support=C2=
=A0changing gpio pin before read<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; /sys/class/hwmon/hwmon0/fan*_input while=C2=A0=
monitoring=C2=A0fan sensor?<br>
&gt;=C2=A0 =C2=A0 =C2=A0In my<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; platform, fans gpio are connect to pin-mux and=
 I need control gpio<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; before get fan tach rpm.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0It does have the ability to modify a GPIO before/af=
ter a reading:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/openbmc/phosphor-hwmo=
n/blob/master/mainloop.cpp#L447" rel=3D"noreferrer" target=3D"_blank">https=
://github.com/openbmc/phosphor-hwmon/blob/master/mainloop.cpp#L447</a><br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0configured by some lines in the conf file, like:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/openbmc/meta-ibm/blob=
/master/meta-romulus/recipes-phosphor/sensors/phosphor-hwmon/obmc/hwmon/iio=
-hwmon-battery.conf#L4" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/openbmc/meta-ibm/blob/master/meta-romulus/recipes-phosphor/sensors/pho=
sphor-hwmon/obmc/hwmon/iio-hwmon-battery.conf#L4</a><br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Tyler<br>
&gt;<br>
<br>
</blockquote></div>

--0000000000003e0bee059967e785--
