Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6265826BF
	for <lists+openbmc@lfdr.de>; Wed, 27 Jul 2022 14:36:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LtCvW5Qc4z3c5D
	for <lists+openbmc@lfdr.de>; Wed, 27 Jul 2022 22:36:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=YcAvq7E0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com; envelope-from=g.matyukhin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=YcAvq7E0;
	dkim-atps=neutral
X-Greylist: delayed 430 seconds by postgrey-1.36 at boromir; Wed, 27 Jul 2022 22:36:14 AEST
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LtCv258p4z3bbQ
	for <openbmc@lists.ozlabs.org>; Wed, 27 Jul 2022 22:36:14 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
	by mta-01.yadro.com (Postfix) with ESMTP id CBC4D411FD;
	Wed, 27 Jul 2022 12:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
	mime-version:content-type:content-type:content-language
	:accept-language:message-id:date:date:subject:subject:from:from
	:received:received:received:received:received; s=mta-01; t=
	1658924939; x=1660739340; bh=F2dzcLU8+CdJbNvALzQ3ul3FB2axwt4DqXp
	3mDwJ7W0=; b=YcAvq7E0fY+KHeyhF9SK3o/8r/bUHPws6bfx25ayNnnXY5RtPb3
	LOwsYsVOnaEfTk5TMBcyL+LFurGEgWklVjjFuV7FgfIgJLHxddlEEuFQFuAB+hOb
	cKsasOb9pC9sXrntNBFOWO9t1S8jnsgoKHiMXEsfqL4vGSIfVDo+thwM=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
	by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jYk2NGHyTHCI; Wed, 27 Jul 2022 15:28:59 +0300 (MSK)
Received: from T-EXCH-01.corp.yadro.com (t-exch-01.corp.yadro.com [172.17.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Postfix) with ESMTPS id E1AAE4124D;
	Wed, 27 Jul 2022 15:28:55 +0300 (MSK)
Received: from T-Exch-05.corp.yadro.com (172.17.10.109) by
 T-EXCH-01.corp.yadro.com (172.17.10.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Wed, 27 Jul 2022 15:28:55 +0300
Received: from T-EXCH-08.corp.yadro.com (172.17.11.58) by
 T-Exch-05.corp.yadro.com (172.17.10.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.9; Wed, 27 Jul 2022 15:28:55 +0300
Received: from T-EXCH-08.corp.yadro.com ([172.17.11.58]) by
 T-EXCH-08.corp.yadro.com ([172.17.11.58]) with mapi id 15.02.1118.009; Wed,
 27 Jul 2022 15:28:55 +0300
From: Georgiy Matyukhin <g.matyukhin@yadro.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Intrusion sensor problem on Lewisburg C621
Thread-Topic: Intrusion sensor problem on Lewisburg C621
Thread-Index: AQHYobRdsUYXjnAHUEWz3Y7l1TQHvw==
Date: Wed, 27 Jul 2022 12:28:55 +0000
Message-ID: <0b5a3942e3a24fa6ab5daafeea23a0c4@yadro.com>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.199.21.65]
Content-Type: multipart/alternative;
	boundary="_000_0b5a3942e3a24fa6ab5daafeea23a0c4yadrocom_"
MIME-Version: 1.0
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
Cc: "qiang.xu@linux.intel.com" <qiang.xu@linux.intel.com>, "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_0b5a3942e3a24fa6ab5daafeea23a0c4yadrocom_
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

Hi guys.
I faced a problem with intrusion sensor on a Lewisburg C621 PCH.

In dbus-sensors there is intrusion sensor daemon which intended to work
with Lewisburg PCH, but there is only code to read intruder state (INTRD_DE=
T) and
no any mention about intrusion sensor reset (ChassisIntrusionSensor.cpp).
We are looking for a way to reset INTRD_DET from BMC.

According to the C621 datasheet, this bit must be cleared by writing 1 to i=
t.
But reading the documentation led to the conclusion that one set of registe=
rs is
available for reading via SMBUS (table 26-8 of the C621 datasheet),
and for writing - another (table 26-5). Probably the idea of the C621 devel=
opers
is that the INTRD_DET bit can both be read and cleared via PCIe, but only r=
ead via SMBUS?

If it isn't possibly to reset intruder from intrusion sensor, how it suppos=
ed to work in Intel BMC?
Or is there some way to clear this bit over SMBUS?




--_000_0b5a3942e3a24fa6ab5daafeea23a0c4yadrocom_
Content-Type: text/html; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dkoi8-r">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size: 12pt; colo=
r: rgb(0, 0, 0); font-family: Calibri, Helvetica, sans-serif, EmojiFont, &q=
uot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &q=
uot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols;">
<p></p>
<div style=3D"font-family: Calibri, Helvetica, sans-serif, serif, EmojiFont=
; font-size: 16px;">
Hi guys.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif, serif, EmojiFont=
; font-size: 16px;">
I faced a problem with intrusion sensor&nbsp;on a Lewisburg C621 PCH.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif, serif, EmojiFont=
; font-size: 16px;">
&nbsp;</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif, serif, EmojiFont=
; font-size: 16px;">
In dbus-sensors there is intrusion sensor daemon which intended to work</di=
v>
<div style=3D"font-family: Calibri, Helvetica, sans-serif, serif, EmojiFont=
; font-size: 16px;">
with Lewisburg PCH, but there is only code to read intruder state (INTRD_DE=
T) and</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif, serif, EmojiFont=
; font-size: 16px;">
no any mention about intrusion sensor reset (ChassisIntrusionSensor.cpp).&n=
bsp;</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif, serif, EmojiFont=
; font-size: 16px;">
We are looking for a way&nbsp;<font size=3D"3"><span style=3D"font-size: 12=
pt;">to reset&nbsp;</span></font><font size=3D"3"><span style=3D"font-size:=
 12pt;">INTRD_DET</span></font><font size=3D"3"><span style=3D"font-size: 1=
2pt;">&nbsp;from BMC.</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif, serif, EmojiFont=
; font-size: 16px;">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif, serif, EmojiFont=
; font-size: 16px;">
According to the C621 datasheet, this bit must be cleared by writing 1 to i=
t.&nbsp;</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif, serif, EmojiFont=
; font-size: 16px;">
But reading the documentation led to the conclusion that one set of registe=
rs is&nbsp;</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif, serif, EmojiFont=
; font-size: 16px;">
available for reading via SMBUS (table 26-8 of the C621 datasheet),&nbsp;</=
div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif, serif, EmojiFont=
; font-size: 16px;">
and for writing - another (table 26-5). Probably the idea of the C621 devel=
opers&nbsp;</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif, serif, EmojiFont=
; font-size: 16px;">
is that the INTRD_DET bit can both be read and cleared via PCIe, but only r=
ead via SMBUS?</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif, serif, EmojiFont=
; font-size: 16px;">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif, serif, EmojiFont=
; font-size: 16px;">
If it isn't possibly to&nbsp;<font size=3D"3"><span style=3D"font-size: 12p=
t;">reset intruder from intrusion sensor, how it supposed to work in Intel&=
nbsp;</span></font><font size=3D"3"><span style=3D"font-size: 12pt;">BMC?</=
span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif, serif, EmojiFont=
; font-size: 16px;">
Or is there some way to clear this bit over SMBUS?</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif, serif, EmojiFont=
; font-size: 16px;">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif, serif, EmojiFont=
; font-size: 16px;">
<br>
</div>
<br>
<p></p>
</div>
</body>
</html>

--_000_0b5a3942e3a24fa6ab5daafeea23a0c4yadrocom_--
