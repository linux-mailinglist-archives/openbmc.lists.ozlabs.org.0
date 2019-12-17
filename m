Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C40122B81
	for <lists+openbmc@lfdr.de>; Tue, 17 Dec 2019 13:30:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ccsj1HCszDqW7
	for <lists+openbmc@lfdr.de>; Tue, 17 Dec 2019 23:30:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=tyler.sabdon@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ojT6AsVo"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ccqR59sqzDqM3
 for <openbmc@lists.ozlabs.org>; Tue, 17 Dec 2019 23:27:59 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id g6so6034322plp.7
 for <openbmc@lists.ozlabs.org>; Tue, 17 Dec 2019 04:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KKw+tbxqsMsDiwyXrVpXtguL5cvz2hKh+m0XjkohH/o=;
 b=ojT6AsVoblQ3KwgMsfBIuvMhDjeptpgKjp1hZ9mRV9N3w+NM5RgliWlEw53GpyxyHQ
 usJiPyZ7ofq0xoWo1a4XYugtiWYcJK6E3533p7EjxEl2+LM9XVbifl7dTbzFVCjbcjcm
 DsR6RopQLIoHO3UAtDISgp0eye4lBFBi7aoiwOHFS+nuES2ADXcI3cy5KlCILle1RBJE
 LbBorfYD56xUaVmIWeoHmoA0olzoGq4sBwhdwgJmPaXDnTXOQobRp7zlggNVsX3/2rua
 Y2WEtbnj4VPP0GxxRHlPjX9+lkZvn/WeuYBmy7R7ySJ/pGBYFp66nvMQ6eivzqFSBUb9
 7NRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KKw+tbxqsMsDiwyXrVpXtguL5cvz2hKh+m0XjkohH/o=;
 b=otSit805xFe7+vobqx4p8lNpipWoe2wfqqd+KItnehxEpeA84+Za3aJCtixHDNcJyY
 gPGStZhcJsi8/JYXoiZ6Si0p+lRuXEpcroFYQbbJV3UeVlMLIvOucjcFtab69WFrJ8+z
 vJXlm3Y8kcWChuACGF+T2itOL+J9zObdIHfpAiwXNWjnH0JB91nhnGfKRV9dwmeg6Bv4
 Jmu8Z+aSyB1nCAYBYMZ2xcZTGbSn5frMVkzcryOb6vyc1u2MhvVKEVJMp53racEQNuD8
 jxoLicTFZed4I8kpSf/FnFkI+XFQGiXPp0vfv3dQ+qbSFhrKQRzvIuzyJdPwl3QFwjbh
 F2jQ==
X-Gm-Message-State: APjAAAUeCMBOTmv2hvbe51DIk1ronMpmmZKbzg31SjVPcHsg3TOJdUcJ
 uENIRLKBMEOPqRPu0Q/WI2CBKzmpgu+bG4KZsTw=
X-Google-Smtp-Source: APXvYqwqTX8rozmhb12n0wFoL50qukUXXlehtxhyM9/S1RWw/gMcSApOOUjVHmDlZ/ZtO6WwqPdi4iR5lSNZtDSKPSU=
X-Received: by 2002:a17:902:9889:: with SMTP id
 s9mr21939833plp.135.1576585673715; 
 Tue, 17 Dec 2019 04:27:53 -0800 (PST)
MIME-Version: 1.0
References: <CAO9PYRLd5KJHiuvDxzGcw7E5CVapk3Fonm_mPDaov1zaVHZm2g@mail.gmail.com>
 <4ffc887c-9160-a5a6-2bf9-0a86c872cd60@linux.ibm.com>
 <CAO9PYRL=OHexpzjazShywXxg1w5FeUA4=dkupNXCY-85+CckJQ@mail.gmail.com>
 <1a21e764-151b-a3b5-ad4b-0d79f336d48d@linux.ibm.com>
 <CAO9PYRJGne+VxENsY6r_mGzdAxf-sUgzLu71tnRQipO9hPLV=Q@mail.gmail.com>
 <edbcee28-8f02-77c6-c9e2-8914ee7b25fd@linux.ibm.com>
 <CAGMNF6U18c1H_JONFBLrCCyZtf_10F=nmUyqGYeVt_diec6VcQ@mail.gmail.com>
In-Reply-To: <CAGMNF6U18c1H_JONFBLrCCyZtf_10F=nmUyqGYeVt_diec6VcQ@mail.gmail.com>
From: Deng Tyler <tyler.sabdon@gmail.com>
Date: Tue, 17 Dec 2019 20:27:32 +0800
Message-ID: <CAO9PYRLQOHLs8UTt=V2tD+H5NhpaTHDhd=fLVd10rh44SDqExw@mail.gmail.com>
Subject: Re: pinctrl in phosphor-hwmon
To: Kun Yi <kunyi@google.com>
Content-Type: multipart/alternative; boundary="0000000000000a34ee0599e5751c"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000000a34ee0599e5751c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kun
    Thank for your response and that's highly appreciated.
I patch the async read support but it still not working, following is my
configuration. Anything I missing?
LABEL_fan0=3Dfan1A
LABEL_fan1=3Dfan1B
LABEL_fan2=3Dfan2A
LABEL_fan3=3Dfan2B
LABEL_fan4=3Dfan3A
LABEL_fan5=3Dfan3B
LABEL_fan6=3Dfan4A
LABEL_fan7=3Dfan4B
LABEL_fan8=3Dfan5A
LABEL_fan9=3Dfan5B
LABEL_fan10=3Dfan6A
LABEL_fan11=3Dfan6B
ASYNC_READ_TIMEOUT_fan0 =3D "3000"
ASYNC_READ_TIMEOUT_fan1 =3D "3000"
ASYNC_READ_TIMEOUT_fan2 =3D "3000"
ASYNC_READ_TIMEOUT_fan3 =3D "3000"
ASYNC_READ_TIMEOUT_fan4 =3D "3000"
ASYNC_READ_TIMEOUT_fan5 =3D "3000"
ASYNC_READ_TIMEOUT_fan6 =3D "3000"
ASYNC_READ_TIMEOUT_fan7 =3D "3000"
ASYNC_READ_TIMEOUT_fan8 =3D "3000"
ASYNC_READ_TIMEOUT_fan9 =3D "3000"
ASYNC_READ_TIMEOUT_fan10 =3D "3000"
ASYNC_READ_TIMEOUT_fan11 =3D "3000"
INTERVAL=3D10000000

Tyler

Kun Yi <kunyi@google.com> =E6=96=BC 2019=E5=B9=B412=E6=9C=8813=E6=97=A5 =E9=
=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=885:15=E5=AF=AB=E9=81=93=EF=BC=9A

>
>
> On Thu, Dec 12, 2019 at 12:34 PM Matt Spinler <mspinler@linux.ibm.com>
> wrote:
>
>>
>>
>> On 12/11/2019 12:40 AM, Deng Tyler wrote:
>> > I added gpio control in my fan driver but I still met some problem.
>> > While phosphor-hwmon reading fan0_input, the fan tach driver change 2
>> > gpio pin and sleep 2 seconds to return rpm value for stable. There are
>> > 12 fan sensors in my platform so the phosphor-hwmon need wait 24
>> > senconds at least to get rpm. The waiting time cause dbus hang while
>> > issuing ipmi sensor command. Do you have any suggestions?
>>
>> I vaguely remember someone else had this problem before, and it turned
>> out to be a device driver
>> problem as the reason it was so slow.
>>
>
> Yea the best test is to read from the kernel sysfs interface and post how
> long it takes. If the device is misbehaving or the physical bus
> (i2c/fantach) is not working properly, the delay could easily be O(second=
s)
>
>
>>
>> Otherwise, the reads could probably be changed to be asynchronous, but
>> that could be a pretty big
>> change to the application.
>
>
> There is some work-in-progress patch to add async read support. The patch
> works, although the code change is not clean enough.
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-hwmon/+/24337
>
>
>>
>
>
>> >
>> > Tyler
>> >
>> > Matt Spinler <mspinler@linux.ibm.com <mailto:mspinler@linux.ibm.com>>
>> > =E6=96=BC 2019=E5=B9=B412=E6=9C=8811=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=
=B8=8A=E5=8D=8812:29=E5=AF=AB=E9=81=93=EF=BC=9A
>> >
>> >
>> >
>> >     On 12/9/2019 11:08 PM, Deng Tyler wrote:
>> >     > Hi Matt:
>> >     >     Thank for your response that's really helpful. I check the
>> link
>> >     > and it seems allow a gpio set to high before/after reading a
>> >     > correspond sensor. Is it possible change 2 gpio to high/low for
>> >     > reading a correspond sensor?
>> >
>> >     That isn't possible in the current code, but I don't see why someo=
ne
>> >     couldn't add that feature.
>> >
>> >     >
>> >     > Regards,
>> >     > Tyler
>> >     >
>> >     > Matt Spinler <mspinler@linux.ibm.com
>> >     <mailto:mspinler@linux.ibm.com> <mailto:mspinler@linux.ibm.com
>> >     <mailto:mspinler@linux.ibm.com>>>
>> >     > =E6=96=BC 2019=E5=B9=B412=E6=9C=889=E6=97=A5 =E9=80=B1=E4=B8=80 =
=E4=B8=8B=E5=8D=8810:58=E5=AF=AB=E9=81=93=EF=BC=9A
>> >     >
>> >     >
>> >     >
>> >     >     On 12/9/2019 6:15 AM, Deng Tyler wrote:
>> >     >     > Hi all:
>> >     >     >     Does phosphor-hwmon support changing gpio pin before
>> read
>> >     >     > /sys/class/hwmon/hwmon0/fan*_input while monitoring fan
>> >     sensor?
>> >     >     In my
>> >     >     > platform, fans gpio are connect to pin-mux and I need
>> >     control gpio
>> >     >     > before get fan tach rpm.
>> >     >
>> >     >     It does have the ability to modify a GPIO before/after a
>> >     reading:
>> >     >
>> >
>> https://github.com/openbmc/phosphor-hwmon/blob/master/mainloop.cpp#L447
>> >     >
>> >     >     configured by some lines in the conf file, like:
>> >     >
>> >
>> https://github.com/openbmc/meta-ibm/blob/master/meta-romulus/recipes-pho=
sphor/sensors/phosphor-hwmon/obmc/hwmon/iio-hwmon-battery.conf#L4
>> >     >
>> >     >     >
>> >     >     > Regards,
>> >     >     > Tyler
>> >     >
>> >
>>
>>
>
> --
> Regards,
> Kun
>

--0000000000000a34ee0599e5751c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Kun<div>=C2=A0 =C2=A0 Thank for your response and that&=
#39;s highly appreciated.</div><div>I patch=C2=A0the async read support but=
 it still not working, following is my configuration. Anything I missing?</=
div><div>LABEL_fan0=3Dfan1A<br>LABEL_fan1=3Dfan1B<br>LABEL_fan2=3Dfan2A<br>=
LABEL_fan3=3Dfan2B<br>LABEL_fan4=3Dfan3A<br>LABEL_fan5=3Dfan3B<br>LABEL_fan=
6=3Dfan4A<br>LABEL_fan7=3Dfan4B<br>LABEL_fan8=3Dfan5A<br>LABEL_fan9=3Dfan5B=
<br>LABEL_fan10=3Dfan6A<br>LABEL_fan11=3Dfan6B<br>ASYNC_READ_TIMEOUT_fan0 =
=3D &quot;3000&quot;<br>ASYNC_READ_TIMEOUT_fan1 =3D &quot;3000&quot;<br>ASY=
NC_READ_TIMEOUT_fan2 =3D &quot;3000&quot;<br>ASYNC_READ_TIMEOUT_fan3 =3D &q=
uot;3000&quot;<br>ASYNC_READ_TIMEOUT_fan4 =3D &quot;3000&quot;<br>ASYNC_REA=
D_TIMEOUT_fan5 =3D &quot;3000&quot;<br>ASYNC_READ_TIMEOUT_fan6 =3D &quot;30=
00&quot;<br>ASYNC_READ_TIMEOUT_fan7 =3D &quot;3000&quot;<br>ASYNC_READ_TIME=
OUT_fan8 =3D &quot;3000&quot;<br>ASYNC_READ_TIMEOUT_fan9 =3D &quot;3000&quo=
t;<br>ASYNC_READ_TIMEOUT_fan10 =3D &quot;3000&quot;<br>ASYNC_READ_TIMEOUT_f=
an11 =3D &quot;3000&quot;<br></div><div>INTERVAL=3D10000000<br></div><div><=
br></div><div>Tyler</div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">Kun Yi &lt;<a href=3D"mailto:kunyi@google.com">kun=
yi@google.com</a>&gt; =E6=96=BC 2019=E5=B9=B412=E6=9C=8813=E6=97=A5 =E9=80=
=B1=E4=BA=94 =E4=B8=8A=E5=8D=885:15=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D=
"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Thu, Dec 12, 2019 at 12:34 PM Matt Spinler &lt;<a href=3D"mail=
to:mspinler@linux.ibm.com" target=3D"_blank">mspinler@linux.ibm.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 12/11/2019 12:40 AM, Deng Tyler wrote:<br>
&gt; I added gpio control in my fan driver but I still met some problem. <b=
r>
&gt; While phosphor-hwmon reading fan0_input, the fan tach driver change 2 =
<br>
&gt; gpio pin and sleep 2 seconds=C2=A0to return rpm value for stable. Ther=
e are <br>
&gt; 12 fan sensors in my platform so the phosphor-hwmon need wait 24 <br>
&gt; senconds at least to get rpm. The waiting time cause dbus hang while <=
br>
&gt; issuing ipmi sensor command. Do you have any suggestions?<br>
<br>
I vaguely remember someone else had this problem before, and it turned <br>
out to be a device driver<br>
problem as the reason it was so slow.<br></blockquote><div><br></div><div>Y=
ea the best test is to read from the kernel sysfs interface and post how lo=
ng it takes. If the device is misbehaving or the physical=C2=A0bus (i2c/fan=
tach) is not working properly, the delay could easily be O(seconds)</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Otherwise, the reads could probably be changed to be asynchronous, but <br>
that could be a pretty big<br>
change to the application.</blockquote><div><br></div><div>There is some wo=
rk-in-progress patch to add async read support. The patch works, although t=
he code change is not clean enough.</div><div><a href=3D"https://gerrit.ope=
nbmc-project.xyz/c/openbmc/phosphor-hwmon/+/24337" target=3D"_blank">https:=
//gerrit.openbmc-project.xyz/c/openbmc/phosphor-hwmon/+/24337</a></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0</bloc=
kquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt; Tyler<br>
&gt;<br>
&gt; Matt Spinler &lt;<a href=3D"mailto:mspinler@linux.ibm.com" target=3D"_=
blank">mspinler@linux.ibm.com</a> &lt;mailto:<a href=3D"mailto:mspinler@lin=
ux.ibm.com" target=3D"_blank">mspinler@linux.ibm.com</a>&gt;&gt; <br>
&gt; =E6=96=BC 2019=E5=B9=B412=E6=9C=8811=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=
=B8=8A=E5=8D=8812:29=E5=AF=AB=E9=81=93=EF=BC=9A<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On 12/9/2019 11:08 PM, Deng Tyler wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hi Matt:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 Thank for your response that&#39=
;s really helpful. I check the link<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; and it seems allow a gpio set to high before/a=
fter reading a<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; correspond=C2=A0sensor. Is it possible change =
2 gpio to high/low for<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; reading a correspond sensor?<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0That isn&#39;t possible in the current code, but I =
don&#39;t see why someone<br>
&gt;=C2=A0 =C2=A0 =C2=A0couldn&#39;t add that feature.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Tyler<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Matt Spinler &lt;<a href=3D"mailto:mspinler@li=
nux.ibm.com" target=3D"_blank">mspinler@linux.ibm.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:mspinler@linux.ibm.com=
" target=3D"_blank">mspinler@linux.ibm.com</a>&gt; &lt;mailto:<a href=3D"ma=
ilto:mspinler@linux.ibm.com" target=3D"_blank">mspinler@linux.ibm.com</a><b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:mspinler@linux.ibm.com=
" target=3D"_blank">mspinler@linux.ibm.com</a>&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =E6=96=BC 2019=E5=B9=B412=E6=9C=889=E6=97=A5 =
=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8810:58=E5=AF=AB=E9=81=93=EF=BC=9A<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0On 12/9/2019 6:15 AM, Deng =
Tyler wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hi all:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0 =C2=A0 Does pho=
sphor-hwmon support=C2=A0changing gpio pin before read<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; /sys/class/hwmon/hwmon=
0/fan*_input while=C2=A0monitoring=C2=A0fan<br>
&gt;=C2=A0 =C2=A0 =C2=A0sensor?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0In my<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; platform, fans gpio ar=
e connect to pin-mux and I need<br>
&gt;=C2=A0 =C2=A0 =C2=A0control gpio<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; before get fan tach rp=
m.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0It does have the ability to=
 modify a GPIO before/after a<br>
&gt;=C2=A0 =C2=A0 =C2=A0reading:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/openbmc/phosphor-hwmo=
n/blob/master/mainloop.cpp#L447" rel=3D"noreferrer" target=3D"_blank">https=
://github.com/openbmc/phosphor-hwmon/blob/master/mainloop.cpp#L447</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0configured by some lines in=
 the conf file, like:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/openbmc/meta-ibm/blob=
/master/meta-romulus/recipes-phosphor/sensors/phosphor-hwmon/obmc/hwmon/iio=
-hwmon-battery.conf#L4" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/openbmc/meta-ibm/blob/master/meta-romulus/recipes-phosphor/sensors/pho=
sphor-hwmon/obmc/hwmon/iio-hwmon-battery.conf#L4</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; Tyler<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Regards,<div>Kun</div></div></div></div>
</blockquote></div>

--0000000000000a34ee0599e5751c--
