Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A332C1539AD
	for <lists+openbmc@lfdr.de>; Wed,  5 Feb 2020 21:42:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48CYQt6D9HzDqTM
	for <lists+openbmc@lfdr.de>; Thu,  6 Feb 2020 07:42:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::243;
 helo=mail-oi1-x243.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=c1d3gMjB; dkim-atps=neutral
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48CYLl5ngfzDqTb
 for <openbmc@lists.ozlabs.org>; Thu,  6 Feb 2020 07:38:55 +1100 (AEDT)
Received: by mail-oi1-x243.google.com with SMTP id j132so2169897oih.9
 for <openbmc@lists.ozlabs.org>; Wed, 05 Feb 2020 12:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=4iUZKNfllzATQVgo8kbicVZNuJ0ZcxhNH41lqi3AQmQ=;
 b=c1d3gMjBa0uGWvPP4GtTpiqCrcQtRrhlZ7H1jTWESv43y31xI2L5uzA1zLhd98KkwE
 BMt7GZst6fFRo+h71wCI5A7cUY5Lc+Jkqp6Ou+pWlRo3+5+wx0kpVizmLiQCcF2EEPoX
 LhFdbGDpcWveFvwX7MYdpFYK4WPZz1fLOXw8HJx4yx2XRPBNTp9+G+++qcDVv06Dn5Xc
 d96e7Gh/aGx6S9Rt0bvjT3I8mS+WxdGFd+t1h5aWeI4toz+bbmBD1giQFNv3jrAY7eHl
 scW+Rad0NxFd4eG5ufxLorpM0AJzBo/a8RNtplQKlYLOcF/R0R7p15NjPUp7hOO9jEWQ
 mZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=4iUZKNfllzATQVgo8kbicVZNuJ0ZcxhNH41lqi3AQmQ=;
 b=WRsTWfhSsKHpTXOSObmYm6/v/GMcIr1PpxfHqVsEuO3GaxelQQ8DxkVAlILBVntq/n
 QDBlwOleiITUPVcf9OF0e5GEiSTAwmHmriWRp1wgDQCBII/l1UqTVP6UrxovGuIgKwQ4
 uKZZfZ3iv43gr1NMBRj5qx3rel8bVjrx09G7/fE5gF7OZ3vmc7e9md0mBuaUUlfGQeaY
 Lgj1RBSKyPwZRFrGfV374laV7gVvA/sHOyKTLRg2gbrH7Mz6MfNn/E+cgEa/CHr6WLvi
 NLPZvElJlFkaCgiEc/+RR524ogLXuE9yDbwDuUjthIavjEpJQfBVx8lpVgXy32yD9wgy
 AAPA==
X-Gm-Message-State: APjAAAXPsc39Afk1kce9zxALhiDrVuy4ONzcpB5pHOr5n+DIuG+E7F35
 kIRw7pDc+mXyONOpQ+m2BB9qGOSdBQw=
X-Google-Smtp-Source: APXvYqyRBrwMaEz8NfCrQ7uFXSoxlavzCAFpXnYSQcaMp3NOLChnGAsLZH4R5H4np8PQ8KMRdnW0Gw==
X-Received: by 2002:aca:c383:: with SMTP id t125mr4112576oif.122.1580935132179; 
 Wed, 05 Feb 2020 12:38:52 -0800 (PST)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:d966:ea63:aa5b:7786])
 by smtp.gmail.com with ESMTPSA id v202sm189525oie.10.2020.02.05.12.38.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Feb 2020 12:38:51 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Message-Id: <FFBFEB1F-0D02-4588-9A11-B626CC3B73A3@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_1F73A319-AE36-4735-99EA-9DA40B664AF9"
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: [PATCH linux dev-5.4] ARM: dts: aspeed: witherspoon: Add gpio
 line names
Date: Wed, 5 Feb 2020 14:38:50 -0600
In-Reply-To: <CACPK8Xce5oOHEkCYLnmEr2qXAJUtwyw9wOT3Krgz5mm=7y91pQ@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
References: <20200204213037.42100-1-geissonator@gmail.com>
 <CACPK8Xce5oOHEkCYLnmEr2qXAJUtwyw9wOT3Krgz5mm=7y91pQ@mail.gmail.com>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_1F73A319-AE36-4735-99EA-9DA40B664AF9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Feb 4, 2020, at 4:14 PM, Joel Stanley <joel@jms.id.au> wrote:
>=20
> On Tue, 4 Feb 2020 at 21:30, Andrew Geissler <geissonator@gmail.com =
<mailto:geissonator@gmail.com>> wrote:
>>=20
>> From: Andrew Geissler <geissonator@yahoo.com =
<mailto:geissonator@yahoo.com>>
>>=20
>> Name the gpios so libgiod will work with them
>>=20
>> Signed-off-by: Andrew Geissler <geissonator@yahoo.com =
<mailto:geissonator@yahoo.com>>
>=20
> Please send to the upstream lists for review. CC the GPIO maintainers
> too, so we can get their feedback.

ack

>=20
>> ---
>> .../boot/dts/aspeed-bmc-opp-witherspoon.dts   | 41 =
+++++++++++++++++++
>> 1 file changed, 41 insertions(+)
>>=20
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts =
b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> index 515f0f208ee6..d3bbd4fc2539 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> @@ -193,6 +193,47 @@
>>=20
>> };
>>=20
>> +&gpio {
>> +    status =3D "okay";
>> +       gpio-line-names =3D
>> +       /*A0-A7*/       "","cfam-reset","","","","","mux","",
>=20
> fsi-mux

ack

I=E2=80=99m wondering if I should also change the labels to match
the names? For example gpioinfo will show this now:
  line   6:    "fsi-mux"        "mux"  output  active-high [used]

>=20
>> +       /*B0-B7*/       "","","","","","air-water","","",
>> +       /*C0-C7*/       "","","","","","","","",
>> +       /*D0-D7*/       "enable","","","","","","","",
>> +       /*E0-E7*/       "data","","","","","","","",
>=20
> fsi-enable, fsi-data.

ack

>> +       /*F0-F7*/       "","","","","","","","",
>> +       /*G0-G7*/       "","","","","","","","",
>> +       /*H0-H7*/       "","","","","","","","",
>> +       /*I0-I7*/       "","","","","","","","",
>> +       /*J0-J7*/       "","","checkstop","","","","","",
>> +       /*K0-K7*/       "","","","","","","","",
>> +       /*L0-L7*/       "","","","","","","","",
>> +       /*M0-M7*/       "","","","","","","","",
>> +       /*N0-N7*/       =
"ps1-presence","","rear-fault","rear-power","rear-id","","","",
>=20
> These last three are LEDs? perhaps we could adopt a convention where
> we call them led-<name>.

makes sense to me

along those same lines, I=E2=80=99m going to put =E2=80=9Cpresence=E2=80=9D=
 first for
those gpios


>=20
>> +       /*O0-O7*/       "","","","","","","","",
>> +       /*P0-P7*/       "","","","","","","","ps0-presence",
>> +       /*Q0-Q7*/       "","","","","","","","",
>> +       /*R0-R7*/       "","","trans","","","power-button","","",
>=20
> fsi-trans

ack

>=20
>> +       /*S0-S7*/       "","","","","","","","",
>> +       /*T0-T7*/       "","","","","","","","",
>> +       /*U0-U7*/       "","","","","","","","",
>> +       /*V0-V7*/       "","","","","","","","",
>> +       /*W0-W7*/       "","","","","","","","",
>> +       /*X0-X7*/       "","","","","","","","",
>> +       /*Y0-Y7*/       "","","","","","","","",
>> +       /*Z0-Z7*/       "","","","","","","","",
>> +       /*AA0-AA7*/     "clock","","","","","","","",
>=20
> fsi-clock

ack

>=20
>> +       /*AB0-AB7*/     "","","","","","","","",
>> +       /*AC0-AC7*/     "","","","","","","","";
>> +
>> +       pin_gpio_a1 {
>> +               gpios =3D <ASPEED_GPIO(A, 1) GPIO_ACTIVE_HIGH>;
>> +               output-high;
>> +               line-name =3D "cfam-reset";
>> +       };
>=20
> It think you want to drop this part.

ok, my lack of understanding of what config is required for
gpio=E2=80=99s in dts def shows here.

>=20
>> +
>> +};
>> +
>> &fmc {
>>        status =3D "okay";
>>=20
>> --
>> 2.21.0 (Apple Git-122)
>=20
> You're building kernels on your mac? :D

Hah, yeah, writing the code on it at least



--Apple-Mail=_1F73A319-AE36-4735-99EA-9DA40B664AF9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Feb 4, 2020, at 4:14 PM, Joel Stanley &lt;<a =
href=3D"mailto:joel@jms.id.au" class=3D"">joel@jms.id.au</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">On Tue, 4 Feb 2020 at 21:30, =
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
 the gpios so libgiod will work with them<br class=3D""><br =
class=3D"">Signed-off-by: Andrew Geissler &lt;<a =
href=3D"mailto:geissonator@yahoo.com" =
class=3D"">geissonator@yahoo.com</a>&gt;<br class=3D""></blockquote><br =
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
display: inline !important;" class=3D"">Please send to the upstream =
lists for review. CC the GPIO maintainers</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">too, so we can get their feedback.</span><br =
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
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">---<br =
class=3D"">.../boot/dts/aspeed-bmc-opp-witherspoon.dts &nbsp;&nbsp;| 41 =
+++++++++++++++++++<br class=3D"">1 file changed, 41 insertions(+)<br =
class=3D""><br class=3D"">diff --git =
a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts =
b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts<br class=3D"">index =
515f0f208ee6..d3bbd4fc2539 100644<br class=3D"">--- =
a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts<br class=3D"">+++ =
b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts<br class=3D"">@@ =
-193,6 +193,47 @@<br class=3D""><br class=3D"">};<br class=3D""><br =
class=3D"">+&amp;gpio {<br class=3D"">+ &nbsp;&nbsp;&nbsp;status =3D =
"okay";<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gpio-line-names =3D<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*A0-A7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"","cfam-reset","","","","","mux","",<=
br class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
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
class=3D"">fsi-mux</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div><div>ack</div><div><br class=3D""></div><div><div =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);">I=E2=80=99m =
wondering if I should also change the labels to match</div><div =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);">the names? For =
example gpioinfo will show this now:</div><div style=3D"caret-color: =
rgb(0, 0, 0); color: rgb(0, 0, 0);"><div>&nbsp; line &nbsp; 6: &nbsp; =
&nbsp;"fsi-mux" &nbsp; &nbsp; &nbsp; &nbsp;"mux" &nbsp;output =
&nbsp;active-high [used]</div></div></div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*B0-B7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"","","","","","air-water","","",<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*C0-C7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"","","","","","","","",<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*D0-D7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"enable","","","","","","","",<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*E0-E7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"data","","","","","","","",<br =
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
class=3D"">fsi-enable, fsi-data.</span><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div><div>ack</div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><blockquote type=3D"cite" style=3D"font-family:=
 Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*F0-F7*/ =
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
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"ps1-presence","","rear-fault","rear-p=
ower","rear-id","","","",<br class=3D""></blockquote><br =
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
display: inline !important;" class=3D"">These last three are LEDs? =
perhaps we could adopt a convention where</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">we call them led-&lt;name&gt;.</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div><div>makes sense to me</div><div><br =
class=3D""></div><div>along those same lines, I=E2=80=99m going to put =
=E2=80=9Cpresence=E2=80=9D first for</div><div>those =
gpios</div><div><div class=3D""><br class=3D""></div></div><br =
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
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*O0-O7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"","","","","","","","",<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*P0-P7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"","","","","","","","ps0-presence",<b=
r class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*Q0-Q7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"","","","","","","","",<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*R0-R7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"","","trans","","","power-button","",=
"",<br class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
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
class=3D"">fsi-trans</span><br style=3D"caret-color: rgb(0, 0, 0); =
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
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*S0-S7*/ =
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
&nbsp;&nbsp;&nbsp;&nbsp;"clock","","","","","","","",<br =
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
class=3D"">fsi-clock</span><br style=3D"caret-color: rgb(0, 0, 0); =
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
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*AB0-AB7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;"","","","","","","","",<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*AC0-AC7*/ =
&nbsp;&nbsp;&nbsp;&nbsp;"","","","","","","","";<br class=3D"">+<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pin_gpio_a1 {<br =
class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;gpios =3D &lt;ASPEED_GPIO(A, 1) GPIO_ACTIVE_HIGH&gt;;<br =
class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;output-high;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;line-name =3D "cfam-reset";<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};<br class=3D""></blockquote><br =
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
display: inline !important;" class=3D"">It think you want to drop this =
part.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""></div></blockquote><div><br class=3D""></div><div>ok, =
my lack of understanding of what config is required =
for</div><div>gpio=E2=80=99s in dts def shows here.</div><br =
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
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">+<br =
class=3D"">+};<br class=3D"">+<br class=3D"">&amp;fmc {<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;status =3D =
"okay";<br class=3D""><br class=3D"">--<br class=3D"">2.21.0 (Apple =
Git-122)<br class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, =
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
class=3D"">You're building kernels on your mac? =
:D</span></div></blockquote><br class=3D""></div><div>Hah, yeah, writing =
the code on it at least</div><div><br class=3D""></div><br =
class=3D""></body></html>=

--Apple-Mail=_1F73A319-AE36-4735-99EA-9DA40B664AF9--
