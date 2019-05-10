Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 148EE19C66
	for <lists+openbmc@lfdr.de>; Fri, 10 May 2019 13:19:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450nm52yH3zDqSt
	for <lists+openbmc@lfdr.de>; Fri, 10 May 2019 21:19:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com;
 envelope-from=chou.brad@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SjHFOkp2"; 
 dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450nlG4CWyzDqCp
 for <openbmc@lists.ozlabs.org>; Fri, 10 May 2019 21:18:34 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id a3so2883438pgb.3
 for <openbmc@lists.ozlabs.org>; Fri, 10 May 2019 04:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=V8Da22dHxxjDC/OzG01m4xrc24LYKNTTxvLcbypymBk=;
 b=SjHFOkp2rmX39IuDU3tmk2ekYdJjDyAdEd4PM6YE2fC55XUiLwmBFogwUCLTkqYgFb
 b8WCfOly+FOcK5aTHshkxOrZAmm7YIYgxIg63tGSbewQMl7IIuzqe3j1wNh4B1cl+T+l
 dnbnM+GrQ6YSggsvR0BAQb4TbMtKPcUEXKjAVUB2H1q47dXV0qWBgiEfwiGJaVewvoUU
 cG4C6nug81gTU1V0IBUMB2bG8UdUIcivMr2CwC7yZr517Ika5CPh869hjr0vzEs9/r2y
 EwVlG25Jy5SHlUqibO54IzD/3vTPe/qOCdttAemVcdbAFfXM9KkbuRhr492c/9e0TtJ2
 rWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=V8Da22dHxxjDC/OzG01m4xrc24LYKNTTxvLcbypymBk=;
 b=tXRiVKS/9btJL++sP6/E+1n1kowrkfsJ/oBUMSeB6I3nIY2u19PYhJRlQ/c7LpM/nJ
 yRefZZWqbNKjBEDrLxTJII5wB7BdMzxEOjIaNg/58/04znRVzQbf76L5s+vqADqtIONi
 V62hhnbIeUcFp39e+vd0n8RHXZkkt3nGZSYRedrXjpGDavzZdMrpdZw90q7TFeUmqPSQ
 D4GyAq2Wh607h/0hLOONk3CXm7fugXgjS8ZQc/0Zt5qluu9K/W66zxMI5rBSJtcwXWnY
 VafdeKxFZzhemO0okc1AbWUbBk9ZeiYhVJyBpnLSGJK3yDo8sdPgF4vDfFCaDY+mpUkW
 EHfg==
X-Gm-Message-State: APjAAAVHaMLCtS5HvuSlTeXWecAa9P1SCD33+uOAp6pe+2E34bSzESuB
 nv7V0XTJo1eeg3zhz0Io+qM=
X-Google-Smtp-Source: APXvYqxuWwYqtD3riW6BiJe0JuBliin64emv8mK2KWrqKONCTlQ/JV9BQ7L4z23XXhkMSTaiugSB9g==
X-Received: by 2002:a63:930d:: with SMTP id b13mr1484679pge.18.1557487110514; 
 Fri, 10 May 2019 04:18:30 -0700 (PDT)
Received: from [192.168.1.2] (220-128-238-121.HINET-IP.hinet.net.
 [220.128.238.121])
 by smtp.gmail.com with ESMTPSA id b14sm6203692pfi.92.2019.05.10.04.18.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 May 2019 04:18:29 -0700 (PDT)
From: Brad Chou <chou.brad@gmail.com>
Message-Id: <2CF17805-2A06-4E6A-ADCE-FB2EA655EB0B@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_8351E6AB-781C-4E38-8E1A-E8978FCE8F00"
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: How to set GPIOs to pre-defined value
Date: Fri, 10 May 2019 19:18:23 +0800
In-Reply-To: <5caee736-4e80-4522-b30d-0eee3c6ff363@www.fastmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
References: <365A980B-9730-411A-A91B-EB0A97026D95@gmail.com>
 <acf57f4c-08bd-40db-a77a-bb7f4f9f5938@Spark>
 <A2B0CA36-50FC-4A4D-A1EE-C87B3A55223C@gmail.com>
 <18ccd5d6-0bce-4990-9d0a-62f97fae5b3b@www.fastmail.com>
 <88066601-2367-45ce-98f5-8193a02534fb@Spark>
 <D8F913E3-6078-4C81-A26C-FB2A45052C62@gmail.com>
 <5caee736-4e80-4522-b30d-0eee3c6ff363@www.fastmail.com>
X-Mailer: Apple Mail (2.3445.9.1)
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
Cc: openbmc@lists.ozlabs.org, Samuel Jiang <chyishian.jiang@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_8351E6AB-781C-4E38-8E1A-E8978FCE8F00
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On May 10, 2019, at 11:34 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>=20
>=20
>=20
> On Thu, 9 May 2019, at 17:12, Brad Chou wrote:
>>=20
>>> On May 8, 2019, at 9:53 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>>>=20
>>>=20
>>>=20
>>> On Tue, 7 May 2019, at 18:23, Brad Chou wrote:
>>>> Hi Samuel,
>>>> Thanks for your reply, I am using AST2500.
>>>> I tried add gpio-hog settings into my device tree, and yes, the =
GPIO=20
>>>> works as it defined.
>>>> But all GPIOs defined by gpio-hog can not be modified in user space =
by=20
>>>> gpioset / gpioget utility.
>>>> I need to set all GPIOs to pre-defined state and can change it at =
run=20
>>>> time.
>>>> Set GPIOs in Device tree is trying to lock it by a fixed direction =
and=20
>>>> value.
>>>>=20
>>>=20
>>> This problem is probably best taken up with upstream. Currently GPIO
>>> nodes in the devicetree are ignored if they do not have the =
`gpio-hog`
>>> property:
>>>=20
>>> =
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dr=
ivers/gpio/gpiolib-of.c?h=3Dv5.1#n454
>>>=20
>>> Changing that might be a hard argument - it may impact existing
>>> devicetrees that expect the current behaviour.
>>>=20
>>> However, I'm interested in what you see wrong with doing this from
>>> userspace? What requirements do you have that would need this to
>>> be done in the kernel?
>>>=20
>>> Cheers,
>>>=20
>>> Andrew
>>=20
>> I don=E2=80=99t really need it to be set in the kernel.
>> Just curious about how openBMC initial all GPIOs, especially for=20
>> AST2500 that has over 200+ GPIOs.
>=20
> Well, the GPIOs are muxed with other functionality (LPC, I2C, SPI =
etc),
> and generally your platform design is going to only use a subset of =
the
> pins that are left for GPIO functionality, so you don't tend to need =
to
> initialise the state of 200+ pins. Some take fixed values, in which =
case
> you can use the kernel's gpio-hog mechanism to configure them.
> Accessing GPIOs at run-time generally means you want to change their
> state, in which case we usually have dedicated applications that =
handle
> the state transitions based on other events (e.g. "Power-on the host")
> and as such there's no need for a general "GPIO initialisation" =
script.
> These applications should apply the right state as part of their
> initialisation.

You are right, I should write several applications to control my GPIO =
state,
Instead of a general GPIO initial script to initial all of it.
Thanks for the advice.=20

>=20
> Does that help?
>=20
> If you have requirements outside of what's outlined above then I can't
> see a problem with using a shell script to drive the libgpiod tools to
> configure the necessary GPIOs, it just depends on your requirements
> and how you feel like doing the system integration.
>=20
> Cheers,
>=20
> Andrew


--Apple-Mail=_8351E6AB-781C-4E38-8E1A-E8978FCE8F00
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On May 10, 2019, at 11:34 AM, Andrew Jeffery &lt;<a =
href=3D"mailto:andrew@aj.id.au" class=3D"">andrew@aj.id.au</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
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
display: inline !important;" class=3D"">On Thu, 9 May 2019, at 17:12, =
Brad Chou wrote:</span><br style=3D"caret-color: rgb(0, 0, 0); =
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
text-decoration: none;" class=3D""><br class=3D""><blockquote =
type=3D"cite" class=3D"">On May 8, 2019, at 9:53 AM, Andrew Jeffery =
&lt;<a href=3D"mailto:andrew@aj.id.au" class=3D"">andrew@aj.id.au</a>&gt; =
wrote:<br class=3D""><br class=3D""><br class=3D""><br class=3D"">On =
Tue, 7 May 2019, at 18:23, Brad Chou wrote:<br class=3D""><blockquote =
type=3D"cite" class=3D"">Hi Samuel,<br class=3D"">Thanks for your reply, =
I am using AST2500.<br class=3D"">I tried add gpio-hog settings into my =
device tree, and yes, the GPIO<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">works as it =
defined.<br class=3D"">But all GPIOs defined by gpio-hog can not be =
modified in user space by<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">gpioset / =
gpioget utility.<br class=3D"">I need to set all GPIOs to pre-defined =
state and can change it at run<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">time.<br =
class=3D"">Set GPIOs in Device tree is trying to lock it by a fixed =
direction and<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">value.<br class=3D""><br class=3D""></blockquote><br =
class=3D"">This problem is probably best taken up with upstream. =
Currently GPIO<br class=3D"">nodes in the devicetree are ignored if they =
do not have the `gpio-hog`<br class=3D"">property:<br class=3D""><br =
class=3D""><a =
href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
/tree/drivers/gpio/gpiolib-of.c?h=3Dv5.1#n454" =
class=3D"">https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/tree/drivers/gpio/gpiolib-of.c?h=3Dv5.1#n454</a><br class=3D""><br =
class=3D"">Changing that might be a hard argument - it may impact =
existing<br class=3D"">devicetrees that expect the current behaviour.<br =
class=3D""><br class=3D"">However, I'm interested in what you see wrong =
with doing this from<br class=3D"">userspace? What requirements do you =
have that would need this to<br class=3D"">be done in the kernel?<br =
class=3D""><br class=3D"">Cheers,<br class=3D""><br class=3D"">Andrew<br =
class=3D""></blockquote><br class=3D"">I don=E2=80=99t really need it to =
be set in the kernel.<br class=3D"">Just curious about how openBMC =
initial all GPIOs, especially for<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">AST2500 that =
has over 200+ GPIOs.<br class=3D""></blockquote><br style=3D"caret-color: =
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
class=3D"">Well, the GPIOs are muxed with other functionality (LPC, I2C, =
SPI etc),</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">and generally =
your platform design is going to only use a subset of the</span><br =
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
display: inline !important;" class=3D"">pins that are left for GPIO =
functionality, so you don't tend to need to</span><br =
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
display: inline !important;" class=3D"">initialise the state of 200+ =
pins. Some take fixed values, in which case</span><br =
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
display: inline !important;" class=3D"">you can use the kernel's =
gpio-hog mechanism to configure them.</span><br style=3D"caret-color: =
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
class=3D"">Accessing GPIOs at run-time generally means you want to =
change their</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">state, in =
which case we usually have dedicated applications that handle</span><br =
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
display: inline !important;" class=3D"">the state transitions based on =
other events (e.g. "Power-on the host")</span><br style=3D"caret-color: =
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
class=3D"">and as such there's no need for a general "GPIO =
initialisation" script.</span><br style=3D"caret-color: rgb(0, 0, 0); =
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
class=3D"">These applications should apply the right state as part of =
their</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">initialisation.</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><br class=3D"">You =
are right, I should write several applications to control my GPIO =
state,</div><div>Instead of a general GPIO initial script to initial all =
of it.</div><div>Thanks for the advice.&nbsp;</div><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><br =
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
display: inline !important;" class=3D"">Does that help?</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
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
display: inline !important;" class=3D"">If you have requirements outside =
of what's outlined above then I can't</span><br style=3D"caret-color: =
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
class=3D"">see a problem with using a shell script to drive the libgpiod =
tools to</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">configure the =
necessary GPIOs, it just depends on your requirements</span><br =
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
display: inline !important;" class=3D"">and how you feel like doing the =
system integration.</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
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
class=3D"">Cheers,</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
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
class=3D"">Andrew</span></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_8351E6AB-781C-4E38-8E1A-E8978FCE8F00--
