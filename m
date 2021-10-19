Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C70844331D6
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 11:09:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYScb1w9Tz3bhj
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 20:09:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lvqB0/0V;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52b;
 helo=mail-ed1-x52b.google.com; envelope-from=61a91bc@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lvqB0/0V; dkim-atps=neutral
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYSc91s5Xz2xYK
 for <openbmc@lists.ozlabs.org>; Tue, 19 Oct 2021 20:09:28 +1100 (AEDT)
Received: by mail-ed1-x52b.google.com with SMTP id y12so10622500eda.4
 for <openbmc@lists.ozlabs.org>; Tue, 19 Oct 2021 02:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VQzEW5tl4fgnPqvEfaPdzn1ycDsPr9KxJV+PlWXWgqI=;
 b=lvqB0/0V5SuY1qk79khqh8TD7z/3oFOUDqQsO7tGCHV1uYhhKbtQwdV42gj1M9VsHv
 cPIYIYCdsNEACcRGFlvsulh445c69jarmuaVNdCYeed4pXHdX1Tx0yw1hXnPXxjWKcjX
 bQxjAyfr41KVrb3QKwC2p6yUBDDIVm1Mt8ANlfZUCaA0jmqUMySuVMpVlSJ6vlEsnyU0
 twahlNuzl7WoqYDUYcftnEDKxSWe7Ez7LH/UmX31zRd7YT99h6LKKq53HU/oOt7sv+Aq
 2QLsAReDjm0r2tLwROpCZDEBtkbx7OMDX0o09KKi9EJ513fajt5Fa3uCHBzpo7bmqN8+
 pmIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VQzEW5tl4fgnPqvEfaPdzn1ycDsPr9KxJV+PlWXWgqI=;
 b=0yhksbEzzqwYMh9iZdKqIf708MStm2jlih1g/aMZU/+eAHW/0ye30efuBwIfdEbnDW
 DebThLaTN6a4ndKUph9bR5kslNQoWOepjcp3YuyhO/AJ4mt0X31JRMds5/Ye3O3cvDk8
 3Vbwx97tdskIgxqnWNW4uW72LsUKs3bvDDvraQLU0Nr8VeCmUklLcra4aNYP4jMq0oRR
 yryvUTQHo20JJ9CuO1gsLNsEOUjDqrF+AYMWr85ygb0wsMqor9oHJfDXdwx3rMnczwSb
 kpl5VksMMXSF7qddnaYaSgP3M4mge1dy5uQqhF8rEoWBPPxj8+BgF4s+LY/tMT4+23O/
 bMUQ==
X-Gm-Message-State: AOAM532w5KK1Im98Sv6eDp5E7KoSJmAUIneqWQDTzDk/nPn4NlfLT8a1
 sRjPm6Kg+cxNSmObxL2+bTxCRRR+alJfzNREExG5MH/u7xw=
X-Google-Smtp-Source: ABdhPJzlBtztM3cWdNvU/sDVxLNLHnRi7fiyuNk8X+mSA4i8tEksswqdEW49jPRC4bsevLq35NL6OBGDYDKyMWnh2jw=
X-Received: by 2002:a17:906:e098:: with SMTP id
 gh24mr35821678ejb.79.1634634561322; 
 Tue, 19 Oct 2021 02:09:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAMqwjCA0HFE4O9YHMAG4pxciCGLY5cLPJVdrDiKJMjTtQqrrEA@mail.gmail.com>
 <f06c4b91d9459061e380f860acd89802ab495524.camel@intel.com>
 <CAMqwjCBWB4LT8ZYO6gSY2azR_VoGoFqPj9rrLrR+yK20k7NMKw@mail.gmail.com>
In-Reply-To: <CAMqwjCBWB4LT8ZYO6gSY2azR_VoGoFqPj9rrLrR+yK20k7NMKw@mail.gmail.com>
From: Alexander Raih <61a91bc@gmail.com>
Date: Tue, 19 Oct 2021 12:10:27 +0300
Message-ID: <CAMqwjCB7GaoNy4eSzrBEOeKCO1zj9fJ1=rZh3j3=AvgXhThfVQ@mail.gmail.com>
Subject: Re: kenel module dont enable
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>
Content-Type: multipart/alternative; boundary="0000000000005d836805ceb10465"
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000005d836805ceb10465
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
I try to register peci device in sysfs but I have same problem

[  800.339605] peci peci-0: Failed to register peci client peci-client at
0x30 (-5)





=D0=B2=D1=82, 19 =D0=BE=D0=BA=D1=82. 2021 =D0=B3. =D0=B2 10:44, Alexander R=
aih <61a91bc@gmail.com>:

> Thanks, Iwona
> I will try this.
>
> Best regards,
> Alex
>
> =D0=BF=D0=BD, 18 =D0=BE=D0=BA=D1=82. 2021 =D0=B3. =D0=B2 17:43, Winiarska=
, Iwona <iwona.winiarska@intel.com>:
>
>> Hi Alex,
>>
>>
>> (in the future, please Cc: openbmc mailing list)
>>
>>
>>
>> This may occur when CPU can=E2=80=99t be detected - is your platform in =
S0 power
>> state?
>>
>> BMC usually is booted before the platform goes to S0, so I would
>> recommend registering peci-client manually (using sysfs) rather than usi=
ng
>> DTS.
>>
>>
>>
>> # echo peci-client 0x30 > /sys/bus/peci/devices/peci-0/new_device
>>
>>
>>
>> Or if you=E2=80=99re using dbus-sensors, peci-client devices are exporte=
d there:
>>
>>
>> https://github.com/openbmc/dbus-sensors/blob/master/src/CPUSensorMain.cp=
p#L406
>>
>>
>> --
>>
>> Note that PECI subsystem you=E2=80=99re using is subject to change in th=
e future:
>>
>>
>> https://lore.kernel.org/lkml/20210803113134.2262882-1-iwona.winiarska@in=
tel.com/
>>
>>
>>
>> -Iwona
>>
>>
>>
>> *From:* Alexander Raih <61a91bc@gmail.com>
>> *Sent:* Friday, October 15, 2021 1:46 PM
>> *To:* Yoo, Jae Hyun <jae.hyun.yoo@intel.com>; Winiarska, Iwona <
>> iwona.winiarska@intel.com>
>> *Subject:* kenel module dont enable
>>
>>
>>
>> Hello,
>>
>> I use intel kernel module peci. In dtb I have this describe about peci:
>>
>>
>>
>>
>>
>> bus@1e78b000 {
>> compatible =3D "simple-bus";
>> #address-cells =3D <0x01>;
>> #size-cells =3D <0x01>;
>> ranges =3D <0x00 0x1e78b000 0x60>;
>> peci-bus@0 {
>> compatible =3D "aspeed,ast2500-peci";
>> reg =3D <0x00 0x60>;
>> #address-cells =3D <0x01>;
>> #size-cells =3D <0x00>;
>> interrupts =3D <0x0f>;
>> clocks =3D <0x02 0x06>;
>> resets =3D <0x02 0x06>;
>> clock-frequency =3D <0x16e3600>;
>> msg-timing =3D <0x01>;
>> addr-timing =3D <0x01>;
>> rd-sampling-point =3D <0x08>;
>> cmd-timeout-ms =3D <0x3e8>;
>> status =3D "okay";
>>
>> peci-client@30 {
>> compatible =3D "intel,peci-client";
>> reg =3D <0x30>;
>> };
>>
>> peci-client@31 {
>> compatible =3D "intel,peci-client";
>> reg =3D <0x31>;
>> };
>> };
>> };
>>
>>
>>
>>
>>
>> I have this error in dmesg:
>>
>> [    2.516383] peci peci-0: Failed to register peci client  at 0x30 (-5)
>>
>> [    2.526767] peci peci-0: Failed to create PECI device for
>> /ahb/apb/bus@1e78b000/peci-bus@0/peci-client@30
>>
>>
>>
>> How I can resolve this ?
>>
>>
>>
>> best regards,
>>
>> alex
>>
>

--0000000000005d836805ceb10465
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div>I try to register peci device in sysfs but I have =
same=C2=A0problem</div><div><br></div><div>[ =C2=A0800.339605] peci peci-0:=
 Failed to register peci client peci-client at 0x30 (-5)<br></div><div><br>=
</div><div><br></div><div><br></div><div><br></div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=D0=B2=D1=82, 19 =D0=BE=
=D0=BA=D1=82. 2021 =D0=B3. =D0=B2 10:44, Alexander Raih &lt;<a href=3D"mail=
to:61a91bc@gmail.com">61a91bc@gmail.com</a>&gt;:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr">Thanks, Iwona<div>I will =
try this.</div><div><br></div><div>Best regards,</div><div>Alex</div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=D0=BF=
=D0=BD, 18 =D0=BE=D0=BA=D1=82. 2021 =D0=B3. =D0=B2 17:43, Winiarska, Iwona =
&lt;<a href=3D"mailto:iwona.winiarska@intel.com" target=3D"_blank">iwona.wi=
niarska@intel.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">




<div lang=3D"EN-US">
<div>
<p class=3D"MsoNormal">Hi Alex,<u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt"><br>
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">(in the future, pleas=
e Cc: openbmc mailing list)</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">=C2=A0</span><span st=
yle=3D"font-size:11pt">=C2=A0</span></p>
<p class=3D"MsoNormal">This may occur when CPU can=E2=80=99t be detected - =
is your platform in S0 power state?<u></u><u></u></p>
<p class=3D"MsoNormal">BMC usually is booted before the platform goes to S0=
, so I would recommend registering peci-client manually (using sysfs) rathe=
r than using DTS.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"># echo peci-client 0x30 &gt; /sys/bus/peci/devices/p=
eci-0/new_device<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Or if you=E2=80=99re using dbus-sensors, peci-client=
 devices are exported there:<u></u><u></u></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/openbmc/dbus-sensors/b=
lob/master/src/CPUSensorMain.cpp#L406" target=3D"_blank">https://github.com=
/openbmc/dbus-sensors/blob/master/src/CPUSensorMain.cpp#L406</a><u></u><u><=
/u></p>
<p class=3D"MsoNormal"><br>
</p>
<p class=3D"MsoNormal">--<u></u><u></u></p>
<p class=3D"MsoNormal">Note that PECI subsystem you=E2=80=99re using is sub=
ject to change in the future:<u></u><u></u></p>
<p class=3D"MsoNormal"><a href=3D"https://lore.kernel.org/lkml/202108031131=
34.2262882-1-iwona.winiarska@intel.com/" target=3D"_blank">https://lore.ker=
nel.org/lkml/20210803113134.2262882-1-iwona.winiarska@intel.com/</a><u></u>=
<u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">-Iwona<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border-top:none;border-right:none;border-bottom:none;border-l=
eft:1.5pt solid blue;padding:0in 0in 0in 4pt">
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Alexander Raih &lt;<a href=3D"mailto:61=
a91bc@gmail.com" target=3D"_blank">61a91bc@gmail.com</a>&gt; <br>
<b>Sent:</b> Friday, October 15, 2021 1:46 PM<br>
<b>To:</b> Yoo, Jae Hyun &lt;<a href=3D"mailto:jae.hyun.yoo@intel.com" targ=
et=3D"_blank">jae.hyun.yoo@intel.com</a>&gt;; Winiarska, Iwona &lt;<a href=
=3D"mailto:iwona.winiarska@intel.com" target=3D"_blank">iwona.winiarska@int=
el.com</a>&gt;<br>
<b>Subject:</b> kenel module dont enable<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<div>
<p class=3D"MsoNormal">Hello,<u></u><u></u></p>
<div>
<p class=3D"MsoNormal">I use intel kernel module peci. In dtb I have this d=
escribe about peci:=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">bus@1e78b000 {<br>
compatible =3D &quot;simple-bus&quot;;<br>
#address-cells =3D &lt;0x01&gt;;<br>
#size-cells =3D &lt;0x01&gt;;<br>
ranges =3D &lt;0x00 0x1e78b000 0x60&gt;;<br>
peci-bus@0 {<br>
compatible =3D &quot;aspeed,ast2500-peci&quot;;<br>
reg =3D &lt;0x00 0x60&gt;;<br>
#address-cells =3D &lt;0x01&gt;;<br>
#size-cells =3D &lt;0x00&gt;;<br>
interrupts =3D &lt;0x0f&gt;;<br>
clocks =3D &lt;0x02 0x06&gt;;<br>
resets =3D &lt;0x02 0x06&gt;;<br>
clock-frequency =3D &lt;0x16e3600&gt;;<br>
msg-timing =3D &lt;0x01&gt;;<br>
addr-timing =3D &lt;0x01&gt;;<br>
rd-sampling-point =3D &lt;0x08&gt;;<br>
cmd-timeout-ms =3D &lt;0x3e8&gt;;<br>
status =3D &quot;okay&quot;;<br>
<br>
peci-client@30 {<br>
compatible =3D &quot;intel,peci-client&quot;;<br>
reg =3D &lt;0x30&gt;;<br>
};<br>
<br>
peci-client@31 {<br>
compatible =3D &quot;intel,peci-client&quot;;<br>
reg =3D &lt;0x31&gt;;<br>
};<br>
};<br>
};<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I have this error in dmesg:<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">[ =C2=A0 =C2=A02.516383] peci peci-0: Failed to regi=
ster peci client =C2=A0at 0x30 (-5)<u></u><u></u></p>
</div>
<p class=3D"MsoNormal">[ =C2=A0 =C2=A02.526767] peci peci-0: Failed to crea=
te PECI device for /ahb/apb/bus@1e78b000/peci-bus@0/peci-client@30<u></u><u=
></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">How I can resolve this ?<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">best regards,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">alex<u></u><u></u></p>
</div>
</div>
</div>
</div>
</div>
<div><span></span></div>
</div>

</blockquote></div>
</blockquote></div>

--0000000000005d836805ceb10465--
