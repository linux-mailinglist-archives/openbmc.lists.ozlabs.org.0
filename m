Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1071549A1
	for <lists+openbmc@lfdr.de>; Thu,  6 Feb 2020 17:49:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48D4C44QWszDqTF
	for <lists+openbmc@lfdr.de>; Fri,  7 Feb 2020 03:49:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::343;
 helo=mail-ot1-x343.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lY/ZBt3S; dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48D4BR0vKczDqTF;
 Fri,  7 Feb 2020 03:48:28 +1100 (AEDT)
Received: by mail-ot1-x343.google.com with SMTP id z9so6119569oth.5;
 Thu, 06 Feb 2020 08:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=gGmz+a38l6sGP1Hy20E77NwbQs/y1Wjt4qa/v7yN3Zc=;
 b=lY/ZBt3SarIVkc8ZKhK8g26QR3CGTUG69BY6o9eT3igsieegbVgiJjPx3DO9q7A/VQ
 LWB6O/ZxuJXhQTzMQWDJeEgc3RkySnNYpM5DP9VffHyWMuAS+P+x9St9Ppz1cx87rTW0
 6rKhkXWwT+ezYVkz707QN4sU7pnn+Naqxk8pl0dleRB+Fa8yEZydHCPhdyH7OAkp5zXw
 t6wHaIGMmAsN00vst/dndcmEPKW9RVdnoQmaWxA6qPaULV9g12FaD3v6BeDF+WhPTbCG
 Wzg3sP+SWm+MAfhKa33gSX0B3A6yqgtjxs//wtgnYo+lH16Y2cxctuIN89/RyLr1UvQH
 5esw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=gGmz+a38l6sGP1Hy20E77NwbQs/y1Wjt4qa/v7yN3Zc=;
 b=TlZzpFCIalCCFPxq3YBPYzCjdIQOgDpmvbPVvYD07m89s3SxrYut7MIzlDin/FWWnG
 17KAtqermAlf1WOTBepjjQqvGmpftamsgGaPcxKBjbVJeQ7npfoaaeIo8XisCEDzGF1h
 B/Y4kZpV63TMcuPZhCAxgCObN2Cmuipr0AHEvgJjMR6g7BR/QbXk/BYaqLafz5CDNGRG
 itzyyq9NaSwbmN3Sa3BrPukoY6N4o7sdmjQ9amIAanu0opBqE0Bl9KPAGa+jDFaxLUho
 QAbdyd/SnO5WvMGdcOVlaOl5ZE1WF71LdnPal2aA419iEKjVJp+T/k/CosvOukKvHSKN
 tVMw==
X-Gm-Message-State: APjAAAXDAgCFD30fCGvdTC3irpPMu9dPLvq8tx02ARtmB843cDjn+z6+
 Pn846UuC8yIJIfz3X/k/gh0=
X-Google-Smtp-Source: APXvYqyB3yg8nVdizsuR2J02PNJiYu/cZwT7t36Akkyh5VbU/3NLZGbu4kgYcW+0ulEFC43VAa/pGA==
X-Received: by 2002:a9d:4706:: with SMTP id a6mr29024572otf.331.1581007705206; 
 Thu, 06 Feb 2020 08:48:25 -0800 (PST)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:e4f7:ce54:d2b2:68f4])
 by smtp.gmail.com with ESMTPSA id 22sm26246otf.53.2020.02.06.08.48.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Feb 2020 08:48:24 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Message-Id: <73471F41-EB8B-4B8B-9BF1-BB56FA666F50@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_4F9F5361-9644-4CBD-A602-AD540758D21B"
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [PATCH linux dev-5.4 v2] ARM: dts: aspeed: witherspoon: Add gpio
 line names
Date: Thu, 6 Feb 2020 10:48:23 -0600
In-Reply-To: <CACPK8XcGJ61mgCL+vZQEzTmcwu+jZ0hpKrnOz7B7K14y79cvFQ@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
References: <20200205215511.80333-1-geissonator@gmail.com>
 <CACPK8XcGJ61mgCL+vZQEzTmcwu+jZ0hpKrnOz7B7K14y79cvFQ@mail.gmail.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_4F9F5361-9644-4CBD-A602-AD540758D21B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On Feb 6, 2020, at 12:45 AM, Joel Stanley <joel@jms.id.au> wrote:
>=20
> On Wed, 5 Feb 2020 at 21:55, Andrew Geissler <geissonator@gmail.com =
<mailto:geissonator@gmail.com>> wrote:
>>=20
>> From: Andrew Geissler <geissonator@yahoo.com =
<mailto:geissonator@yahoo.com>>
>>=20
>> Name the gpios so libgiod will work with them
>=20
> Perhaps: "Name the GPIOs to help userspace work with them."

ack

>=20
> You could also mention that the names are describe the functionality
> that the lines provide, and not a net or ball name.

ack

>=20
> A heads up: when you send patches upstream to the kernel mailing list,
> we don't include the "linux dev-X.y" stuff in the subject.

thanks, will fix in next patch

>=20
>> Signed-off-by: Andrew Geissler <geissonator@yahoo.com>
>> ---
>> v2: added upstream to patch
>>    prepended fsi- on fsi related gpios
>>    prepended led- on led related gpios
>>    prepended presence on presence related gpios
>>    dropped pin_gpio_a1 definition
>> ---
>> .../boot/dts/aspeed-bmc-opp-witherspoon.dts   | 36 =
+++++++++++++++++++
>> 1 file changed, 36 insertions(+)
>>=20
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts =
b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> index 515f0f208ee6..2519722928a4 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> @@ -193,6 +193,42 @@
>>=20
>> };
>>=20
>> +&gpio {
>> +    status =3D "okay";
>=20
> The status=3Dokay is harmless but redundant, as this node is already =
enabled.

ack

>=20
>> +       gpio-line-names =3D
>> +       /*A0-A7*/       "","cfam-reset","","","","","fsi-mux","",
>> +       /*B0-B7*/       "","","","","","air-water","","",
>> +       /*C0-C7*/       "","","","","","","","",
>> +       /*D0-D7*/       "fsi-enable","","","","","","","",
>> +       /*E0-E7*/       "fsi-data","","","","","","","",
>> +       /*F0-F7*/       "","","","","","","","",
>> +       /*G0-G7*/       "","","","","","","","",
>> +       /*H0-H7*/       "","","","","","","","",
>> +       /*I0-I7*/       "","","","","","","","",
>> +       /*J0-J7*/       "","","checkstop","","","","","",
>> +       /*K0-K7*/       "","","","","","","","",
>> +       /*L0-L7*/       "","","","","","","","",
>> +       /*M0-M7*/       "","","","","","","","",
>> +       /*N0-N7*/       =
"presence-ps1","","led-rear-fault","led-rear-power",
>> +                       "led-rear-id","","","",
>> +       /*O0-O7*/       "","","","","","","","",
>> +       /*P0-P7*/       "","","","","","","","presence-ps0",
>> +       /*Q0-Q7*/       "","","","","","","","",
>> +       /*R0-R7*/       "","","fsi-trans","","","power-button","","",
>> +       /*S0-S7*/       "","","","","","","","",
>> +       /*T0-T7*/       "","","","","","","","",
>> +       /*U0-U7*/       "","","","","","","","",
>> +       /*V0-V7*/       "","","","","","","","",
>> +       /*W0-W7*/       "","","","","","","","",
>> +       /*X0-X7*/       "","","","","","","","",
>> +       /*Y0-Y7*/       "","","","","","","","",
>> +       /*Z0-Z7*/       "","","","","","","","",
>> +       /*AA0-AA7*/     "fsi-clock","","","","","","","",
>> +       /*AB0-AB7*/     "","","","","","","","",
>> +       /*AC0-AC7*/     "","","","","","","","";
>> +
>=20
> Cean up the line of whitespace here.

ack

>=20
>> +};
>> +
>> &fmc {
>>        status =3D "okay";
>>=20
>> --
>> 2.21.0 (Apple Git-122)


--Apple-Mail=_4F9F5361-9644-4CBD-A602-AD540758D21B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Feb 6, 2020, at 12:45 AM, Joel Stanley &lt;<a =
href=3D"mailto:joel@jms.id.au" class=3D"">joel@jms.id.au</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">On Wed, 5 Feb 2020 at 21:55, =
Andrew Geissler &lt;</span><a href=3D"mailto:geissonator@gmail.com" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" =
class=3D"">geissonator@gmail.com</a><span style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&gt; wrote:</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br class=3D"">From: Andrew Geissler =
&lt;<a href=3D"mailto:geissonator@yahoo.com" =
class=3D"">geissonator@yahoo.com</a>&gt;<br class=3D""><br class=3D"">Name=
 the gpios so libgiod will work with them<br class=3D""></blockquote><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">Perhaps: "Name the GPIOs to help =
userspace work with them."</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div><div>ack</div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">You could also mention that the names are describe the =
functionality</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">that the =
lines provide, and not a net or ball name.</span><br style=3D"caret-color:=
 rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div><div>ack</div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">A heads up: when you send patches upstream to the kernel =
mailing list,</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">we don't =
include the "linux dev-X.y" stuff in the subject.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""></div></blockquote><div><br class=3D""></div><div>thanks, =
will fix in next patch</div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">Signed-off-by: Andrew Geissler &lt;<a =
href=3D"mailto:geissonator@yahoo.com" =
class=3D"">geissonator@yahoo.com</a>&gt;<br class=3D"">---<br =
class=3D"">v2: added upstream to patch<br =
class=3D"">&nbsp;&nbsp;&nbsp;prepended fsi- on fsi related gpios<br =
class=3D"">&nbsp;&nbsp;&nbsp;prepended led- on led related gpios<br =
class=3D"">&nbsp;&nbsp;&nbsp;prepended presence on presence related =
gpios<br class=3D"">&nbsp;&nbsp;&nbsp;dropped pin_gpio_a1 definition<br =
class=3D"">---<br class=3D"">.../boot/dts/aspeed-bmc-opp-witherspoon.dts =
&nbsp;&nbsp;| 36 +++++++++++++++++++<br class=3D"">1 file changed, 36 =
insertions(+)<br class=3D""><br class=3D"">diff --git =
a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts =
b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts<br class=3D"">index =
515f0f208ee6..2519722928a4 100644<br class=3D"">--- =
a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts<br class=3D"">+++ =
b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts<br class=3D"">@@ =
-193,6 +193,42 @@<br class=3D""><br class=3D"">};<br class=3D""><br =
class=3D"">+&amp;gpio {<br class=3D"">+ &nbsp;&nbsp;&nbsp;status =3D =
"okay";<br class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">The status=3Dokay is harmless but redundant, as this node is =
already enabled.</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div><div>ack</div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gpio-line-names =3D<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*A0-A7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"","cfam-reset","","","","","fsi-mux",=
"",<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*B0-B7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"","","","","","air-water","","",<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*C0-C7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"","","","","","","","",<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*D0-D7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"fsi-enable","","","","","","","",<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*E0-E7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"fsi-data","","","","","","","",<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*F0-F7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"","","","","","","","",<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*G0-G7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"","","","","","","","",<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*H0-H7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"","","","","","","","",<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*I0-I7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"","","","","","","","",<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*J0-J7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"","","checkstop","","","","","",<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*K0-K7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"","","","","","","","",<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*L0-L7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"","","","","","","","",<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*M0-M7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"","","","","","","","",<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*N0-N7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"presence-ps1","","led-rear-fault","le=
d-rear-power",<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"led-rear-id",""=
,"","",<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*O0-O7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"","","","","","","","",<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*P0-P7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"","","","","","","","presence-ps0",<b=
r class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*Q0-Q7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"","","","","","","","",<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*R0-R7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"","","fsi-trans","","","power-button"=
,"","",<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*S0-S7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"","","","","","","","",<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*T0-T7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"","","","","","","","",<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*U0-U7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"","","","","","","","",<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*V0-V7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"","","","","","","","",<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*W0-W7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"","","","","","","","",<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*X0-X7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"","","","","","","","",<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*Y0-Y7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"","","","","","","","",<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*Z0-Z7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"","","","","","","","",<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*AA0-AA7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;"fsi-clock","","","","","","","",<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*AB0-AB7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;"","","","","","","","",<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*AC0-AC7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;"","","","","","","","";<br class=3D"">+<br =
class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Cean up the line of whitespace here.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""></div></blockquote><div><br class=3D""></div><div>ack</div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">+};<br =
class=3D"">+<br class=3D"">&amp;fmc {<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;status =3D =
"okay";<br class=3D""><br class=3D"">--<br class=3D"">2.21.0 (Apple =
Git-122)</blockquote></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_4F9F5361-9644-4CBD-A602-AD540758D21B--
