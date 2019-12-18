Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC84123E1D
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 04:49:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47d1H35dxszDqVk
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 14:49:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::536;
 helo=mail-ed1-x536.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="AVJRnqcA"; 
 dkim-atps=neutral
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47d1G833zYzDqRf
 for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2019 14:49:03 +1100 (AEDT)
Received: by mail-ed1-x536.google.com with SMTP id r21so486502edq.0
 for <openbmc@lists.ozlabs.org>; Tue, 17 Dec 2019 19:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kZvdw5e2BR6apN4ts1vn3He2wcJtPFRdqgCbJUDtMgY=;
 b=AVJRnqcAo/4H6Bp7OT44772xqKg5Mji8wNMM9MUt8eyNuK2kUEx/RJwEYIGWYBoRVI
 nE/X59jJadfzmEqp88wtZ3AVUWJ1qpV2ImszyjBRxseg6dhM4yKzqEy9RpKcT0RsyDKb
 hN6ombfXAFoLUnYRRemontEaaUu8BNy1Tu4t0tC0MyEBf2c40y9hYLU6JbaVIZ8oXLey
 XBfOGVaP013zvmS6kIZZ9v2rDvsOM44R0xnrxaCdN2e0mQTcf1x5tjZ/StVosGgUmdks
 pVZt0wZz2XPr/ygRKR8DwxMBfICL3UEfwEaisq6lLDrSxfA2RRd7gfcCkXgONHfXSbwa
 LY2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kZvdw5e2BR6apN4ts1vn3He2wcJtPFRdqgCbJUDtMgY=;
 b=gG901mf3PRvQlKaY70LG+6+xKtfxhprA9ydvEOC+zXU4HOU4VhDGeLqKR+DveWl0Z2
 7DsPk3/WorYPBy1LbzWhv74Wz9xaKvmh7EMsCoxEfU9U/uGhplWylZfycJZyWw4pXKP+
 7kmoQHNlTc50iWuSxhJYTbPFvNg1kxK5R9/w0KxPDXbTpO1LWcsN9hgJuKUrH2n+m7YS
 mSC5sHwsY3iNFogu8rt6GtyQ8mXmf5N6po7rfKh6A2dlIO5R/DIWVC8hAVrzZyu5huE4
 MZrJCpny6Z9sRcgU70t8/bydpn5O8qTKi+BdlCIy/aHHIhgXkzHAcFOHVu0WWcSpKSro
 Bugg==
X-Gm-Message-State: APjAAAVKrUMNXUF5BJvkyrfxUk8klltuz/XVe25PMOBF7oc8PMmxbtEL
 wYeFxL+MMd3Ek6W0Jh23iNLb7yy8LEqgvyqCkFqPfg==
X-Google-Smtp-Source: APXvYqwMJ0ihj48xA5rDUgj6/5Tb2rwVQwkHbcfn2MaKETrcjfqmCrzjf6PHe7TdT+n0Gar/U+eKiiDoKNtIHuWv5KQ=
X-Received: by 2002:a05:6402:1d9a:: with SMTP id
 dk26mr1227453edb.37.1576640936857; 
 Tue, 17 Dec 2019 19:48:56 -0800 (PST)
MIME-Version: 1.0
References: <95F85EE0-7D7A-41CD-A9B3-69ACC271087C@fb.com>
 <HK0PR03MB51235FC8F1103D763D9A3F2EDF500@HK0PR03MB5123.apcprd03.prod.outlook.com>
 <CABoTLcR0GDjvb36-QPdxuShtnn81zUDA=CddiweXD4q_PoBjvg@mail.gmail.com>
 <HK0PR03MB5123C395B1C50986732C555ADF530@HK0PR03MB5123.apcprd03.prod.outlook.com>
 <CABoTLcRKA5-cn1jeCzXLrb0dZ56v6NK8tpekaPrWSRs12VUh6w@mail.gmail.com>
 <HK0PR03MB5123032569E01A166259D099DF530@HK0PR03MB5123.apcprd03.prod.outlook.com>
In-Reply-To: <HK0PR03MB5123032569E01A166259D099DF530@HK0PR03MB5123.apcprd03.prod.outlook.com>
From: Oskar Senft <osk@google.com>
Date: Tue, 17 Dec 2019 22:48:40 -0500
Message-ID: <CABoTLcQS-UWfOBxr51sTsvh4EEeJB5sJ+ZeGU1ce_CnGqaud=Q@mail.gmail.com>
Subject: Re: Bios upgrade
To: CS20 CTCchien <CTCCHIEN@nuvoton.com>
Content-Type: multipart/alternative; boundary="000000000000fb5d900599f252c4"
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

--000000000000fb5d900599f252c4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Cool, thanks!

Do you have the device tree snippet (or a reference to the DTS) handy by
any chance?

Oskar.

On Tue, Dec 17, 2019 at 9:29 PM CS20 CTCchien <CTCCHIEN@nuvoton.com> wrote:

> Hi,
>
>
>
> Yes, I just echo string to device node to bind and unbind.
>
> c0000000 is the FIU address in my system
>
>
>
> B.R.
>
> Medad
>
> *From:* Oskar Senft <osk@google.com>
> *Sent:* Wednesday, December 18, 2019 10:23 AM
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
> How do you do the rescan? That was the part I was curious about :-D
>
>
>
> Is it this (
> https://github.com/Nuvoton-Israel/openbmc/blob/runbmc/meta-phosphor/nuvot=
on-layer/recipes-phosphor/ipmi/phosphor-ipmi-flash/bios-update.sh#L38
> <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_Nuvoto=
n-2DIsrael_openbmc_blob_runbmc_meta-2Dphosphor_nuvoton-2Dlayer_recipes-2Dph=
osphor_ipmi_phosphor-2Dipmi-2Dflash_bios-2Dupdate.sh-23L38&d=3DDwMFaQ&c=3Du=
e8mO8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&r=3DHqT4ScbSY2YNT4sFBmDErzNgMDeK=
fQmTiR08x2qtobg&m=3DrBMF3_WgxazCzUL0KImvXonYWbvIzXQpgJ_fT_LzeZo&s=3Dr-jq946=
pPc2VWylk0-RM7JPxqMZuH_0sSy5NH1cF3AE&e=3D>
> )?
>
> cd /sys/bus/platform/devices/c0000000.fiu/driver
>
> echo -n "c0000000.fiu" > unbind
>
> echo -n "c0000000.fiu" > bind
>
>
>
> If so, what's the magic "c0000000.fiu"?
>
>
>
> Thanks
>
> Oskar
>
>
>
> On Tue, Dec 17, 2019 at 7:33 PM CS20 CTCchien <CTCCHIEN@nuvoton.com>
> wrote:
>
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

--000000000000fb5d900599f252c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Cool, thanks!<div><br></div><div>Do you have the device tr=
ee snippet (or a reference to the DTS)  handy by any chance?</div><div><br>=
</div><div>Oskar.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Tue, Dec 17, 2019 at 9:29 PM CS20 CTCchien &lt;<a=
 href=3D"mailto:CTCCHIEN@nuvoton.com">CTCCHIEN@nuvoton.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"ZH-TW">
<div class=3D"gmail-m_-7815620866985804697WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">Hi,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">Yes, I just echo string to device node to bi=
nd and unbind.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">c0000000 is the FIU address in my system<u><=
/u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">B.R.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">Medad<u></u><u></u></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11pt;font=
-family:Calibri,sans-serif">From:</span></b><span lang=3D"EN-US" style=3D"f=
ont-size:11pt;font-family:Calibri,sans-serif"> Oskar Senft &lt;<a href=3D"m=
ailto:osk@google.com" target=3D"_blank">osk@google.com</a>&gt;
<br>
<b>Sent:</b> Wednesday, December 18, 2019 10:23 AM<br>
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">How do you do the rescan? That =
was the part I was curious about :-D<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Is it this (<a href=3D"https://=
urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_Nuvoton-2DIsrael_=
openbmc_blob_runbmc_meta-2Dphosphor_nuvoton-2Dlayer_recipes-2Dphosphor_ipmi=
_phosphor-2Dipmi-2Dflash_bios-2Dupdate.sh-23L38&amp;d=3DDwMFaQ&amp;c=3Due8m=
O8zgC4VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&amp;r=3DHqT4ScbSY2YNT4sFBmDErzNgMDe=
KfQmTiR08x2qtobg&amp;m=3DrBMF3_WgxazCzUL0KImvXonYWbvIzXQpgJ_fT_LzeZo&amp;s=
=3Dr-jq946pPc2VWylk0-RM7JPxqMZuH_0sSy5NH1cF3AE&amp;e=3D" target=3D"_blank">=
https://github.com/Nuvoton-Israel/openbmc/blob/runbmc/meta-phosphor/nuvoton=
-layer/recipes-phosphor/ipmi/phosphor-ipmi-flash/bios-update.sh#L38</a>)?<u=
></u><u></u></span></p>
</div>
<blockquote style=3D"margin-left:30pt;margin-right:0cm">
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">cd /sys/bus/platform/devices/c0=
000000.fiu/driver<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">echo -n &quot;c0000000.fiu&quot=
; &gt; unbind<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">echo -n &quot;c0000000.fiu&quot=
; &gt; bind<u></u><u></u></span></p>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">If so, what&#39;s the magic &qu=
ot;c0000000.fiu&quot;?<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Oskar<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On Tue, Dec 17, 2019 at 7:33 PM=
 CS20 CTCchien &lt;<a href=3D"mailto:CTCCHIEN@nuvoton.com" target=3D"_blank=
">CTCCHIEN@nuvoton.com</a>&gt; wrote:<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">Hi,</span><span lang=3D"EN-US"><u></u><u></u=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">=C2=A0</span><span lang=3D"EN-US"><u></u><u>=
</u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">We have a gpio which could control the MUX</=
span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">When I want to do BIOS upgrade, I will shut =
down the host and operate the gpio, and rescan, then BIOS flash
 will be accessible from BMC now.</span><span lang=3D"EN-US"><u></u><u></u>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">=C2=A0</span><span lang=3D"EN-US"><u></u><u>=
</u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">B.R.</span><span lang=3D"EN-US"><u></u><u></=
u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">Medad</span><span lang=3D"EN-US"><u></u><u><=
/u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">=C2=A0</span><span lang=3D"EN-US"><u></u><u>=
</u></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11pt;font=
-family:Calibri,sans-serif">From:</span></b><span lang=3D"EN-US" style=3D"f=
ont-size:11pt;font-family:Calibri,sans-serif"> Oskar
 Senft &lt;<a href=3D"mailto:osk@google.com" target=3D"_blank">osk@google.c=
om</a>&gt; <br>
<b>Sent:</b> Wednesday, December 18, 2019 4:57 AM<br>
<b>To:</b> CS20 CTCchien &lt;<a href=3D"mailto:CTCCHIEN@nuvoton.com" target=
=3D"_blank">CTCCHIEN@nuvoton.com</a>&gt;<br>
<b>Cc:</b> Vijay Khemka &lt;<a href=3D"mailto:vijaykhemka@fb.com" target=3D=
"_blank">vijaykhemka@fb.com</a>&gt;; OpenBMC Maillist &lt;<a href=3D"mailto=
:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a>&g=
t;<br>
<b>Subject:</b> Re: Bios upgrade</span><span lang=3D"EN-US"><u></u><u></u><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi<u></u><u></u></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">How did you configure the BIOS =
flash device? I assume via the device tree? I haven&#39;t tested this in a =
while, but I seem to remember that if the BIOS SPI flash
 is not accessible Linux doesn&#39;t &quot;detect&quot; the device and does=
n&#39;t create the MTD, i.e. it&#39;s not accessible from the BMC. This can=
 be the case if the mux between BMC, PCH and BIOS SPI flash) is configured =
to connect the SPI flash to the BMC at the time the BMC
 boots. Or is there a way to make BMC&#39;s Linux &quot;rescan&quot; for SP=
I flash chips at runtime?<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Oskar.<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On Tue, Dec 17, 2019 at 12:38 A=
M CS20 CTCchien &lt;<a href=3D"mailto:CTCCHIEN@nuvoton.com" target=3D"_blan=
k">CTCCHIEN@nuvoton.com</a>&gt; wrote:<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
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
s email is intended for use only by the addressees as
 indicated by the original sender of this email. If you are not the address=
ee indicated in this email or are not responsible for delivery of the email=
 to such a person, please kindly reply to the sender indicating this fact a=
nd delete all copies of it from
 your computer and network server immediately. Your cooperation is highly a=
ppreciated. It is advised that any unauthorized use of confidential informa=
tion of Nuvoton is strictly prohibited; and any information in this email i=
rrelevant to the official business
 of Nuvoton shall be deemed as neither given nor endorsed by Nuvoton. </spa=
n><span lang=3D"EN-US"><u></u><u></u></span></p>
</div>
</blockquote>
</div>
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

--000000000000fb5d900599f252c4--
