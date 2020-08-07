Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D653423F51C
	for <lists+openbmc@lfdr.de>; Sat,  8 Aug 2020 01:07:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNgxL6XmFzDqkR
	for <lists+openbmc@lfdr.de>; Sat,  8 Aug 2020 09:07:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::131;
 helo=mail-il1-x131.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=j4aPeJi5; dkim-atps=neutral
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNgwY30QXzDqWY
 for <openbmc@lists.ozlabs.org>; Sat,  8 Aug 2020 09:06:52 +1000 (AEST)
Received: by mail-il1-x131.google.com with SMTP id e16so3074136ilc.12
 for <openbmc@lists.ozlabs.org>; Fri, 07 Aug 2020 16:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc:message-id:references
 :to; bh=yxl7CQFx+6GTHAbNj/JY1i3j9LIX11MGYKPylt9reHI=;
 b=j4aPeJi5CoOu5+WHHXJ1AxDmihi8g9XRF2CuN5IfMyQ+Gmau7MctNBDRjvznL41zGq
 DBFBJwYHtcI9BKznhez7ILJ+YTZmywZWHkHVQl4BSeV5qkhNRK7WACPCX3gDZ/kqlsas
 u71fOnqQd9PpJQfHa4WIkmt5l1VUGOOz6mJPpF2OwwLU6yTtEztxjqxHpuk6hNN4TXxF
 3kqI8W14biF+8rnDO8V4Ea9RrDHB0/loN4fSYE9qlV4QCiFBz7gsPRh0H635F16Ez4Sm
 1PstXlPJw9pBa+KockHIrXSRjFLuu2gvoP2Ojm7NG3h1eVpHE20oB50wCCIqiaFsOD+O
 8CgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :message-id:references:to;
 bh=yxl7CQFx+6GTHAbNj/JY1i3j9LIX11MGYKPylt9reHI=;
 b=baBhL30NPvQPJYQFuGUDoXGLLW9uQv+Fqu5XxOG2KLnwKlbsRVcsLykmC/4KraLItR
 6uOj9zUinURHfdz4y8rCKYQ3o4BqV2Bk4xuqFqAc39+w0QFMPl7JUGY6hCLJaOajSJSw
 uCVfoH7N+4u570E5+FfIRPx4lt7/6WYkqDYMBBw+M4D+YzbYfj7vW9ONWdQIaAu8nIQU
 ajYCbu/cXdoX2WA8ZMmB9HEbGML/d2Y9l/9i7HR/Khg7kyrqj4voR3W7bsLrC7Eh+IFo
 zCKBtaeIaWZWxQ7skScO/3JyO4FAwJHD0/L4qSTV69KRDGgW9NmyrCGtVHECQdhjgfa9
 /gMA==
X-Gm-Message-State: AOAM5337WBsd73X5TelS7VWg2GCL8+CjlkcIwSPlRw0g66nx01mQjTOa
 aHkuYucWRRDlwiK3/Fr1T+8=
X-Google-Smtp-Source: ABdhPJyHunRMVrBzp7y/3Y9v1M/xmarkOA4rBtVoFi8wJu19lIMXCN0nNCUrTEisiWfOsD/Wk5sdaA==
X-Received: by 2002:a92:9989:: with SMTP id t9mr6878688ilk.294.1596841609494; 
 Fri, 07 Aug 2020 16:06:49 -0700 (PDT)
Received: from [10.82.10.10] ([198.148.88.250])
 by smtp.gmail.com with ESMTPSA id x7sm7056225ilq.21.2020.08.07.16.06.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Aug 2020 16:06:49 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_19986644-B985-40D6-AED1-DEC290E19099"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Power Supplies are Turned off after boot
From: Mike Jones <proclivis@gmail.com>
X-Priority: 3 (Normal)
In-Reply-To: <OF66E559B6.C704B66F-ON002585BD.000DF51B-002585BD.000DF524@notes.na.collabserv.com>
Date: Fri, 7 Aug 2020 17:00:43 -0600
Message-Id: <082FD983-0D32-4EAB-9FEB-C57934C6C1E1@gmail.com>
References: <F6868B82-B239-44DE-B90A-BD808FEA4C5B@gmail.com>
 <OF66E559B6.C704B66F-ON002585BD.000DF51B-002585BD.000DF524@notes.na.collabserv.com>
To: Milton Miller II <miltonm@us.ibm.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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


--Apple-Mail=_19986644-B985-40D6-AED1-DEC290E19099
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


I managed to get rid of the watchdog service by removing:

IMAGE_FEATURES_remove =3D =E2=80=9Cobmc-net-ipmi obmc-host-ipmi=E2=80=9D =
where the latter had a dependency on phosphor-watchdog.

But the supplies still shut off. journalctl has no entries with the =
keyword =E2=80=9Cwatchdog=E2=80=9D. grepping for power shows the =
chassis-power* services.

I confirmed that each device receives an OPERATION command via PMBus, so =
clearly something knows the devices are there via devicetree/sysfs.

What are all the services capable of sending PMBus commands related to =
power?

Mike

> On Aug 6, 2020, at 8:32 PM, Milton Miller II <miltonm@us.ibm.com =
<mailto:miltonm@us.ibm.com>> wrote:
>=20
> On August 5, 2020 Mike Jones wrote:
>=20
>> Now that I have webui displaying telemetry for multiple PMBus
>> devices, I want to solve a power supply problem.
>>=20
>> After boot, all PMBus devices have their power turned off via an
>> OPERATION command. This happens about 10-20 seconds after boot
>> completes. There is a message printed saying it is disabling them,
>> and one line per action. Like:
>>=20
>> VOUT 1: disabling
>>=20
>> Where VOUT 1 does not match the name of the rails in the config files
>> with the name and limits. It seems like a more generic term
>> indicating voltage.
>>=20
>> These devices are in the device tree and have hwmon running.
>>=20
>> What service would be capable of shutting off the supplies? It would
>> have to be able to discover them, perhaps by device tree, then issue
>> standard PMBus commands.
>=20
> I'm guessing the host watchdog was not shutdown when your HOST=20
> completed boot and the watchdog requesed the system power off.
> Normally an IPMI message from the host will disable the watchdog.
>=20
> You should be able to see the transition files run in the systemd=20
> journal if this is the case.
>=20
> if not try watching for activity by using journalctl to follow=20
> events live in a shell.
>=20
>>> Note: the Phosphor System Manager service fails at start up. I =
don=E2=80=99t
>> know if this matters, I was going to figure out what it does later.
>>=20
>> Mike


--Apple-Mail=_19986644-B985-40D6-AED1-DEC290E19099
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><meta=
 http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8" =
class=3D""><div style=3D"word-wrap: break-word; -webkit-nbsp-mode: =
space; line-break: after-white-space;" class=3D""><div class=3D""><br =
class=3D""></div><div class=3D"">I managed to get rid of the watchdog =
service by removing:</div><div class=3D""><br class=3D""></div><div =
class=3D"">IMAGE_FEATURES_remove =3D =E2=80=9Cobmc-net-ipmi =
obmc-host-ipmi=E2=80=9D where the latter had a dependency on =
phosphor-watchdog.</div><div class=3D""><br class=3D""></div><div =
class=3D"">But the supplies still shut off. journalctl has no entries =
with the keyword =E2=80=9Cwatchdog=E2=80=9D. grepping for power shows =
the chassis-power* services.</div><div class=3D""><br =
class=3D""></div><div class=3D"">I confirmed that each device receives =
an OPERATION command via PMBus, so clearly something knows the devices =
are there via devicetree/sysfs.</div><div class=3D""><br =
class=3D""></div><div class=3D"">What are all the services capable of =
sending PMBus commands related to power?</div><div class=3D""><br =
class=3D""></div><div class=3D"">Mike<br class=3D""><div class=3D""><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On Aug =
6, 2020, at 8:32 PM, Milton Miller II &lt;<a =
href=3D"mailto:miltonm@us.ibm.com" class=3D"">miltonm@us.ibm.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">On August 5, 2020 Mike Jones =
wrote:</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">Now =
that I have webui displaying telemetry for multiple PMBus<br =
class=3D"">devices, I want to solve a power supply problem.<br =
class=3D""><br class=3D"">After boot, all PMBus devices have their power =
turned off via an<br class=3D"">OPERATION command. This happens about =
10-20 seconds after boot<br class=3D"">completes. There is a message =
printed saying it is disabling them,<br class=3D"">and one line per =
action. Like:<br class=3D""><br class=3D"">VOUT 1: disabling<br =
class=3D""><br class=3D"">Where VOUT 1 does not match the name of the =
rails in the config files<br class=3D"">with the name and limits. It =
seems like a more generic term<br class=3D"">indicating voltage.<br =
class=3D""><br class=3D"">These devices are in the device tree and have =
hwmon running.<br class=3D""><br class=3D"">What service would be =
capable of shutting off the supplies? It would<br class=3D"">have to be =
able to discover them, perhaps by device tree, then issue<br =
class=3D"">standard PMBus commands.<br class=3D""></blockquote><br =
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
display: inline !important;" class=3D"">I'm guessing the host watchdog =
was not shutdown when your HOST<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
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
display: inline !important;" class=3D"">completed boot and the watchdog =
requesed the system power off.</span><br style=3D"caret-color: rgb(0, 0, =
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
class=3D"">Normally an IPMI message from the host will disable the =
watchdog.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">You should be =
able to see the transition files run in the systemd<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
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
display: inline !important;" class=3D"">journal if this is the =
case.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">if not try =
watching for activity by using journalctl to follow<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
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
display: inline !important;" class=3D"">events live in a =
shell.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""><blockquote type=3D"cite" class=3D"">Note: the Phosphor =
System Manager service fails at start up. I don=E2=80=99t<br =
class=3D""></blockquote>know if this matters, I was going to figure out =
what it does later.<br class=3D""><br =
class=3D"">Mike</blockquote></div></blockquote></div><br =
class=3D""></div></div></body></html>=

--Apple-Mail=_19986644-B985-40D6-AED1-DEC290E19099--
