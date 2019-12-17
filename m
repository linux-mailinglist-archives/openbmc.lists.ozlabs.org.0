Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0DB12381E
	for <lists+openbmc@lfdr.de>; Tue, 17 Dec 2019 21:58:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cr8S5K1SzDqWH
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 07:58:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::52a;
 helo=mail-ed1-x52a.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="qX0FipCB"; 
 dkim-atps=neutral
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47cr7l1P8czDqC0
 for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2019 07:57:52 +1100 (AEDT)
Received: by mail-ed1-x52a.google.com with SMTP id f8so9202221edv.2
 for <openbmc@lists.ozlabs.org>; Tue, 17 Dec 2019 12:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3J+HyixJPCIK8wyZEdwrjsD61+fp11p9thartFVgfdc=;
 b=qX0FipCBvZHHp/tleEKqM9PeAsoQBx9s75j8+S8sj9+/SNXWbFuHo/RT4P6tlAswsm
 gqcusDJlcfpfb8ryBYu3jTrOXi4Wvn5rqt1JTOuIITYAyNoVK9hez1scW3PL8qEz6RF8
 YYWZFyygltkXmEqwvRZGTedZW1SaD3Sx8j/uxp/0ThQynBmKc/8pB/e/RRldjq8s2kAi
 WymlR6Pwb6fosfZ0EUdkq7tLzwOBGL4VLbZffH6+YTR/9RUFz3TeeOqO/h6PVJ5+8h9c
 dI+2j0LIUReeNdlqYX+5J1/9+iK+Zr+1MXYKIhHBXJQtO88srFrHWNJug+/f57pYtAD5
 0aJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3J+HyixJPCIK8wyZEdwrjsD61+fp11p9thartFVgfdc=;
 b=JYGeXXEFwVsa5TWE8L7jWwuD/nkjzs3nllhYgwE5R4+OgFapmY/GhetlbLwWct0p11
 ZzaudhYt2qVvK30erc/6wT5Asft1uuLTlgsj9rC+jSfBwUOXYwKXgibpTmJV6NcT9Q6a
 u5da7GtkTSSr6X36uSu1kTjtc8TlRU9oRgStOBJh25aevtEI5wnZ0xNzdUT1bbt/xcNE
 nif2ebG10EoNiT4jmAoOtGy+OHm84AYP5vF4Sx3X+Ol7/P7sIR4KF9hROvWdJckINpyY
 6sci27ul8zCEDUv08duurI+zrei3SOhfxq336BVE876JCxbl+B9flM8Z2t1uqGRSY6xm
 hRxA==
X-Gm-Message-State: APjAAAVuHox2EkwXQIpBVd8e8bAgBc9tB+0u1W9kSp0S1yxO10gGVz/I
 zjrFZnN7akUvVyUafc0TEgvGKQ/HR+zEzzKEfos2xQ==
X-Google-Smtp-Source: APXvYqw+Jx08aME5kvWrIzXsp8SjJPntUxGKLM3UC5frpfVDTb9DjfNSKR016AME8kikxJmfDWuRzZefaRF40jrhfNw=
X-Received: by 2002:a17:906:f90e:: with SMTP id
 lc14mr7359012ejb.217.1576616265023; 
 Tue, 17 Dec 2019 12:57:45 -0800 (PST)
MIME-Version: 1.0
References: <95F85EE0-7D7A-41CD-A9B3-69ACC271087C@fb.com>
 <HK0PR03MB51235FC8F1103D763D9A3F2EDF500@HK0PR03MB5123.apcprd03.prod.outlook.com>
In-Reply-To: <HK0PR03MB51235FC8F1103D763D9A3F2EDF500@HK0PR03MB5123.apcprd03.prod.outlook.com>
From: Oskar Senft <osk@google.com>
Date: Tue, 17 Dec 2019 15:57:29 -0500
Message-ID: <CABoTLcR0GDjvb36-QPdxuShtnn81zUDA=CddiweXD4q_PoBjvg@mail.gmail.com>
Subject: Re: Bios upgrade
To: CS20 CTCchien <CTCCHIEN@nuvoton.com>
Content-Type: multipart/alternative; boundary="0000000000006cfa770599ec94ab"
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
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000006cfa770599ec94ab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

How did you configure the BIOS flash device? I assume via the device tree?
I haven't tested this in a while, but I seem to remember that if the BIOS
SPI flash is not accessible Linux doesn't "detect" the device and doesn't
create the MTD, i.e. it's not accessible from the BMC. This can be the case
if the mux between BMC, PCH and BIOS SPI flash) is configured to connect
the SPI flash to the BMC at the time the BMC boots. Or is there a way to
make BMC's Linux "rescan" for SPI flash chips at runtime?

Thanks
Oskar.

On Tue, Dec 17, 2019 at 12:38 AM CS20 CTCchien <CTCCHIEN@nuvoton.com> wrote=
:

> Hi Vijay,
>
>
>
> You could build a host daemon and a ipmi library on BMC from
> phosphor-ipmi-flash
>
> Here is the link I implement BIOS upgrade on my system
>
>
> https://github.com/Nuvoton-Israel/openbmc/tree/runbmc/meta-phosphor/nuvot=
on-layer/recipes-phosphor/ipmi
> .
>
>
>
> You need to prepare a BIOS image and a signature file for this BIOS
>
> After you execute the command on host, ipmid in BMC will launch a script
> to upgrade BIOS.
>
>
>
> For example,
>
> sudo  ./burn_my_bmc --command update --interface ipmipci --image BIOS.img
> --sig BIOS.img.sig --type static
>
>
>
>
>
> B.R.
>
> Medad
>
> *From:* Vijay Khemka <vijaykhemka@fb.com>
> *Sent:* Tuesday, December 17, 2019 8:16 AM
> *To:* OpenBMC Maillist <openbmc@lists.ozlabs.org>
> *Subject:* Bios upgrade
>
>
>
> Hi,
>
> I am looking for bios upgrade from BMC. I looked at phosphor-ipmi-flash
> but
>
> couldn=E2=80=99t figure out how to use this for bios upgrade. I checked f=
ew old
> mails
>
> where oskar was asking about using user space application instead of
> kernel.
>
> Can anyone please give steps to use any existing kernel driver or user
> space
>
> Application for upgrading host firmware.
>
>
>
> Regards
>
> -Vijay
> ------------------------------
> The privileged confidential information contained in this email is
> intended for use only by the addressees as indicated by the original send=
er
> of this email. If you are not the addressee indicated in this email or ar=
e
> not responsible for delivery of the email to such a person, please kindly
> reply to the sender indicating this fact and delete all copies of it from
> your computer and network server immediately. Your cooperation is highly
> appreciated. It is advised that any unauthorized use of confidential
> information of Nuvoton is strictly prohibited; and any information in thi=
s
> email irrelevant to the official business of Nuvoton shall be deemed as
> neither given nor endorsed by Nuvoton.
>

--0000000000006cfa770599ec94ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi<div><br></div><div>How did you configure the BIOS flash=
 device? I assume via the device tree? I haven&#39;t tested this in a while=
, but I seem to remember that if the BIOS SPI flash is not accessible Linux=
 doesn&#39;t &quot;detect&quot; the device and doesn&#39;t create the MTD, =
i.e. it&#39;s not accessible from the BMC. This can be the case if the mux =
between BMC, PCH and BIOS SPI flash) is configured to connect the SPI flash=
 to the BMC at the time the BMC boots. Or is there a way to make BMC&#39;s =
Linux &quot;rescan&quot; for SPI flash chips at runtime?</div><div><br></di=
v><div>Thanks</div><div>Oskar.</div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 17, 2019 at 12:38 AM CS20 C=
TCchien &lt;<a href=3D"mailto:CTCCHIEN@nuvoton.com">CTCCHIEN@nuvoton.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"ZH-TW">
<div class=3D"gmail-m_-7843079666900005158WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
Hi Vijay,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
You could build a host daemon and a ipmi library on BMC from phosphor-ipmi-=
flash<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
Here is the link I implement BIOS upgrade on my system<u></u><u></u></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;color:r=
gb(0,32,96)"><a href=3D"https://github.com/Nuvoton-Israel/openbmc/tree/runb=
mc/meta-phosphor/nuvoton-layer/recipes-phosphor/ipmi" target=3D"_blank"><sp=
an style=3D"color:rgb(0,32,96)">https://github.com/Nuvoton-Israel/openbmc/t=
ree/runbmc/meta-phosphor/nuvoton-layer/recipes-phosphor/ipmi</span></a>.<u>=
</u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
You need to prepare a BIOS image and a signature file for this BIOS<u></u><=
u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
After you execute the command on host, ipmid in BMC will launch a script to=
 upgrade BIOS.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
For example,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
sudo=C2=A0 ./burn_my_bmc --command update --interface ipmipci --image BIOS.=
img --sig BIOS.img.sig --type static<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
<u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
B.R.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
Medad<u></u><u></u></span></p>
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11pt">Fro=
m:</span></b><span lang=3D"EN-US" style=3D"font-size:11pt"> Vijay Khemka &l=
t;<a href=3D"mailto:vijaykhemka@fb.com" target=3D"_blank">vijaykhemka@fb.co=
m</a>&gt;
<br>
<b>Sent:</b> Tuesday, December 17, 2019 8:16 AM<br>
<b>To:</b> OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org"=
 target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>
<b>Subject:</b> Bios upgrade<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt">Hi,<u>=
</u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt">I am l=
ooking for bios upgrade from BMC. I looked at phosphor-ipmi-flash but
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt">couldn=
=E2=80=99t figure out how to use this for bios upgrade. I checked few old m=
ails
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt">where =
oskar was asking about using user space application instead of kernel.<u></=
u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt">Can an=
yone please give steps to use any existing kernel driver or user space
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt">Applic=
ation for upgrading host firmware.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt"><u></u=
>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt">Regard=
s<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt">-Vijay=
<u></u><u></u></span></p>
</div>
<hr align=3D"center" width=3D"100%">
<span style=3D"font-size:12pt;line-height:0.7;font-family:Arial;color:rgb(1=
28,128,128)">The privileged confidential information contained in this emai=
l is intended for use only by the addressees as indicated by the original s=
ender of this email. If you are not the
 addressee indicated in this email or are not responsible for delivery of t=
he email to such a person, please kindly reply to the sender indicating thi=
s fact and delete all copies of it from your computer and network server im=
mediately. Your cooperation is highly
 appreciated. It is advised that any unauthorized use of confidential infor=
mation of Nuvoton is strictly prohibited; and any information in this email=
 irrelevant to the official business of Nuvoton shall be deemed as neither =
given nor endorsed by Nuvoton.
</span>
</div>

</blockquote></div>

--0000000000006cfa770599ec94ab--
