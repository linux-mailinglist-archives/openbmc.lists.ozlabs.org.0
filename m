Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C0365123D09
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 03:24:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47czNR23R2zDqVl
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 13:24:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::529;
 helo=mail-ed1-x529.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Kj0R1oTV"; 
 dkim-atps=neutral
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47czMj3FCtzDqRR
 for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2019 13:23:45 +1100 (AEDT)
Received: by mail-ed1-x529.google.com with SMTP id dc19so330471edb.10
 for <openbmc@lists.ozlabs.org>; Tue, 17 Dec 2019 18:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7uVP61/G8mYiOprO8HrxqKhklCcJs/0orfFJpp2pVbc=;
 b=Kj0R1oTV+RYlKxa9MYriwO3JJZYvNCAU0OKy9jhneDFQ8J7R5xDz7hT8wi1s+93e0x
 boZYCrL7Mw05nBucY82dRYdvNc9mdwp3otrLNibcTHsRv3L/B5TXqdM6NdBMf2IWAHyX
 FY78jn9QudPccKP2SoayVn3uX9WPyAOXZwLHibkvEpwwRA4llT+RgwcT20/a3wGFxrq3
 s+p404VeSJzTXiC9wUNrfOmwVE4kXIeIfYPTZXaRkjeUe1lyf/34k12I0P+Ufju78DHr
 aBBM06cG9QL1VnqcuSsmq8+WLdT3EF0od2TniQ7c0kLKukINK4Edb5Bp67ggY9AFXDE6
 xlDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7uVP61/G8mYiOprO8HrxqKhklCcJs/0orfFJpp2pVbc=;
 b=MmovfvtGzDMADYNyC0+t4Nid8jYEJAtklMADT4ar9djedSTxZ43dBmpeZvxqjD0pw9
 tVdyp+FaaI+EQOwdJm3L5E4lioCB3AWg3kYjGYnpf/cnBdokN5cN8u9fzilFEZ9iLt/5
 sGwwWzOpvEdsOyd1SYDN7kU1H9xI9klzQAQTiqDt3b2LZBvoo/KjjapmfdKe57PU6zx4
 JkdXfSASiyla9uXrGqdZHKGymRARFZgDJsQ/SQuJ97zkmwZWZG/QOPxs4OR+w2zoyRgZ
 P/gucw3S2afOUPYFsmAHWKWvA+yLVAC+3wJR3a4IbEmj/9nO0rWYuvo0XSYs1hkrtKjH
 D5CA==
X-Gm-Message-State: APjAAAX+FvMNZggnMY4K/t6OPRRNTMozBtzotDJh0wYt9AAM6NxQnvZC
 bAMNW+HkXNkJm9DtN/cW2ztET2mXgjx7cTVKXBFhpQ==
X-Google-Smtp-Source: APXvYqz0uOim7ZOEG0RU7dybXxCaRJMBAA8XzJnFYc3SnXFXY1bhh0u61RFJ2o4+k6xTmKNn3UuMSrmxx+wlgN2Ck8c=
X-Received: by 2002:a17:906:eda9:: with SMTP id
 sa9mr1547027ejb.297.1576635819087; 
 Tue, 17 Dec 2019 18:23:39 -0800 (PST)
MIME-Version: 1.0
References: <95F85EE0-7D7A-41CD-A9B3-69ACC271087C@fb.com>
 <HK0PR03MB51235FC8F1103D763D9A3F2EDF500@HK0PR03MB5123.apcprd03.prod.outlook.com>
 <CABoTLcR0GDjvb36-QPdxuShtnn81zUDA=CddiweXD4q_PoBjvg@mail.gmail.com>
 <HK0PR03MB5123C395B1C50986732C555ADF530@HK0PR03MB5123.apcprd03.prod.outlook.com>
In-Reply-To: <HK0PR03MB5123C395B1C50986732C555ADF530@HK0PR03MB5123.apcprd03.prod.outlook.com>
From: Oskar Senft <osk@google.com>
Date: Tue, 17 Dec 2019 21:23:23 -0500
Message-ID: <CABoTLcRKA5-cn1jeCzXLrb0dZ56v6NK8tpekaPrWSRs12VUh6w@mail.gmail.com>
Subject: Re: Bios upgrade
To: CS20 CTCchien <CTCCHIEN@nuvoton.com>
Content-Type: multipart/alternative; boundary="000000000000f034770599f1218b"
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

--000000000000f034770599f1218b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

How do you do the rescan? That was the part I was curious about :-D

Is it this (
https://github.com/Nuvoton-Israel/openbmc/blob/runbmc/meta-phosphor/nuvoton=
-layer/recipes-phosphor/ipmi/phosphor-ipmi-flash/bios-update.sh#L38
)?

cd /sys/bus/platform/devices/c0000000.fiu/driver
echo -n "c0000000.fiu" > unbind
echo -n "c0000000.fiu" > bind


If so, what's the magic "c0000000.fiu"?

Thanks
Oskar

On Tue, Dec 17, 2019 at 7:33 PM CS20 CTCchien <CTCCHIEN@nuvoton.com> wrote:

> Hi,
>
>
>
> We have a gpio which could control the MUX
>
> When I want to do BIOS upgrade, I will shut down the host and operate the
> gpio, and rescan, then BIOS flash will be accessible from BMC now.
>
>
>
> B.R.
>
> Medad
>
>
>
> *From:* Oskar Senft <osk@google.com>
> *Sent:* Wednesday, December 18, 2019 4:57 AM
> *To:* CS20 CTCchien <CTCCHIEN@nuvoton.com>
> *Cc:* Vijay Khemka <vijaykhemka@fb.com>; OpenBMC Maillist <
> openbmc@lists.ozlabs.org>
> *Subject:* Re: Bios upgrade
>
>
>
> Hi
>
>
>
> How did you configure the BIOS flash device? I assume via the device tree=
?
> I haven't tested this in a while, but I seem to remember that if the BIOS
> SPI flash is not accessible Linux doesn't "detect" the device and doesn't
> create the MTD, i.e. it's not accessible from the BMC. This can be the ca=
se
> if the mux between BMC, PCH and BIOS SPI flash) is configured to connect
> the SPI flash to the BMC at the time the BMC boots. Or is there a way to
> make BMC's Linux "rescan" for SPI flash chips at runtime?
>
>
>
> Thanks
>
> Oskar.
>
>
>
> On Tue, Dec 17, 2019 at 12:38 AM CS20 CTCchien <CTCCHIEN@nuvoton.com>
> wrote:
>
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
> <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_Nuvoto=
n-2DIsrael_openbmc_tree_runbmc_meta-2Dphosphor_nuvoton-2Dlayer_recipes-2Dph=
osphor_ipmi&d=3DDwMFaQ&c=3Due8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&r=3D=
HqT4ScbSY2YNT4sFBmDErzNgMDeKfQmTiR08x2qtobg&m=3D7mxCYr2Rn71qEomdvLXWG3GkbwR=
mfjiYt-8PEs6Vr4M&s=3DVQpRXaKHfEykzUskGOobziNpXXSFdsD5KBmZLYGys-U&e=3D>
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
>
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

--000000000000f034770599f1218b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi<div><br></div><div>How do you do the rescan? That was t=
he part I was curious about :-D</div><div><br></div><div>Is it this (<a hre=
f=3D"https://github.com/Nuvoton-Israel/openbmc/blob/runbmc/meta-phosphor/nu=
voton-layer/recipes-phosphor/ipmi/phosphor-ipmi-flash/bios-update.sh#L38">h=
ttps://github.com/Nuvoton-Israel/openbmc/blob/runbmc/meta-phosphor/nuvoton-=
layer/recipes-phosphor/ipmi/phosphor-ipmi-flash/bios-update.sh#L38</a>)?</d=
iv><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><div>cd =
/sys/bus/platform/devices/c0000000.fiu/driver</div><div>	echo -n &quot;c000=
0000.fiu&quot; &gt; unbind</div><div>	echo -n &quot;c0000000.fiu&quot; &gt;=
 bind</div></blockquote><div><br></div><div>If so, what&#39;s the magic &qu=
ot;c0000000.fiu&quot;?</div><div><br></div><div>Thanks</div><div>Oskar</div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Tue, Dec 17, 2019 at 7:33 PM CS20 CTCchien &lt;<a href=3D"mailto:CTCCHI=
EN@nuvoton.com">CTCCHIEN@nuvoton.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">





<div lang=3D"ZH-TW">
<div class=3D"gmail-m_5312416673954572738WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">Hi,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">We have a gpio which could control the MUX<u=
></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">When I want to do BIOS upgrade, I will shut =
down the host and operate the gpio, and rescan, then BIOS flash will be acc=
essible from BMC now.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">B.R.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">Medad<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11pt;font=
-family:Calibri,sans-serif">From:</span></b><span lang=3D"EN-US" style=3D"f=
ont-size:11pt;font-family:Calibri,sans-serif"> Oskar Senft &lt;<a href=3D"m=
ailto:osk@google.com" target=3D"_blank">osk@google.com</a>&gt;
<br>
<b>Sent:</b> Wednesday, December 18, 2019 4:57 AM<br>
<b>To:</b> CS20 CTCchien &lt;<a href=3D"mailto:CTCCHIEN@nuvoton.com" target=
=3D"_blank">CTCCHIEN@nuvoton.com</a>&gt;<br>
<b>Cc:</b> Vijay Khemka &lt;<a href=3D"mailto:vijaykhemka@fb.com" target=3D=
"_blank">vijaykhemka@fb.com</a>&gt;; OpenBMC Maillist &lt;<a href=3D"mailto=
:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a>&g=
t;<br>
<b>Subject:</b> Re: Bios upgrade<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi<u></u><u></u></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">How did you configure the BIOS =
flash device? I assume via the device tree? I haven&#39;t tested this in a =
while, but I seem to remember that if the BIOS SPI flash is not accessible =
Linux doesn&#39;t &quot;detect&quot; the device and doesn&#39;t
 create the MTD, i.e. it&#39;s not accessible from the BMC. This can be the=
 case if the mux between BMC, PCH and BIOS SPI flash) is configured to conn=
ect the SPI flash to the BMC at the time the BMC boots. Or is there a way t=
o make BMC&#39;s Linux &quot;rescan&quot; for SPI
 flash chips at runtime?<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Oskar.<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On Tue, Dec 17, 2019 at 12:38 A=
M CS20 CTCchien &lt;<a href=3D"mailto:CTCCHIEN@nuvoton.com" target=3D"_blan=
k">CTCCHIEN@nuvoton.com</a>&gt; wrote:<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
Hi Vijay,</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
=C2=A0</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
You could build a host daemon and a ipmi library on BMC from phosphor-ipmi-=
flash</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
Here is the link I implement BIOS upgrade on my system</span><span lang=3D"=
EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt;color:r=
gb(0,32,96)"><a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__github.com_Nuvoton-2DIsrael_openbmc_tree_runbmc_meta-2Dphosphor_nuvoton=
-2Dlayer_recipes-2Dphosphor_ipmi&amp;d=3DDwMFaQ&amp;c=3Due8mO8zgC4VZ4q_aNVK=
t8G9MC01UFDmisvMR1k-EoDM&amp;r=3DHqT4ScbSY2YNT4sFBmDErzNgMDeKfQmTiR08x2qtob=
g&amp;m=3D7mxCYr2Rn71qEomdvLXWG3GkbwRmfjiYt-8PEs6Vr4M&amp;s=3DVQpRXaKHfEykz=
UskGOobziNpXXSFdsD5KBmZLYGys-U&amp;e=3D" target=3D"_blank"><span style=3D"c=
olor:rgb(0,32,96)">https://github.com/Nuvoton-Israel/openbmc/tree/runbmc/me=
ta-phosphor/nuvoton-layer/recipes-phosphor/ipmi</span></a>.</span><span lan=
g=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
=C2=A0</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
You need to prepare a BIOS image and a signature file for this BIOS</span><=
span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
After you execute the command on host, ipmid in BMC will launch a script to=
 upgrade BIOS.</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
=C2=A0</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
For example,</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
sudo=C2=A0 ./burn_my_bmc --command update --interface ipmipci --image BIOS.=
img --sig BIOS.img.sig --type static</span><span lang=3D"EN-US"><u></u><u><=
/u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
=C2=A0</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
=C2=A0</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
B.R.</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:rgb(31,73,125)">=
Medad</span><span lang=3D"EN-US"><u></u><u></u></span></p>
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
<b>Subject:</b> Bios upgrade</span><span lang=3D"EN-US"><u></u><u></u></spa=
n></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt">Hi,</s=
pan><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt">I am l=
ooking for bios upgrade from BMC. I looked at phosphor-ipmi-flash but
</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt">couldn=
</span><span style=3D"font-size:11pt">=E2=80=99<span lang=3D"EN-US">t figur=
e out how to use this for bios upgrade. I checked few old mails
</span></span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt">where =
oskar was asking about using user space application instead of kernel.</spa=
n><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt">Can an=
yone please give steps to use any existing kernel driver or user space
</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt">Applic=
ation for upgrading host firmware.</span><span lang=3D"EN-US"><u></u><u></u=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt">=C2=A0=
</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt">Regard=
s</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11pt">-Vijay=
</span><span lang=3D"EN-US"><u></u><u></u></span></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center"><span=
 lang=3D"EN-US">
<hr size=3D"2" width=3D"100%" align=3D"center">
</span></div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Arial,sans=
-serif;color:gray">The privileged confidential information contained in thi=
s email is intended for use only by the addressees as indicated by the orig=
inal sender of this email. If you are
 not the addressee indicated in this email or are not responsible for deliv=
ery of the email to such a person, please kindly reply to the sender indica=
ting this fact and delete all copies of it from your computer and network s=
erver immediately. Your cooperation
 is highly appreciated. It is advised that any unauthorized use of confiden=
tial information of Nuvoton is strictly prohibited; and any information in =
this email irrelevant to the official business of Nuvoton shall be deemed a=
s neither given nor endorsed by
 Nuvoton. </span><span lang=3D"EN-US"><u></u><u></u></span></p>
</div>
</blockquote>
</div>
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

--000000000000f034770599f1218b--
