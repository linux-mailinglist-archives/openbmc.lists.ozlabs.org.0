Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28171A2E559
	for <lists+openbmc@lfdr.de>; Mon, 10 Feb 2025 08:27:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yrx3h4bWHz3055
	for <lists+openbmc@lfdr.de>; Mon, 10 Feb 2025 18:27:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=43.251.62.78
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739172429;
	cv=none; b=ML1AgdFbq8aL+Rhf4tianURcdZiR5sVb1xEgw75vz8eO4UR4ddB5KbnnfiXoS266RVlQljoJf8osKSB8y4gN3p+dSl24jWrdEkg3zBAUi7j0kmy+s2kqJJymM2i67d/Mha7M76omdlodMKRFMTyLbnS9gV21N+zP8417rM24elUi0W9J/hX/IJH3vRTTvn91xOG7ac4t9+GmaDgI/s8DLfXSr9jXRjMLvsadqSPROpEVAMfIrJ5fJVEG7PMaSc7RAuuK4QRvPM0aMJ0eshGZyS0DOQ3SOfbhak12ta84EFDSp5BMfoh+s+Q9fcDalANUZnYbUKfZ+7UnKcTPvvQfQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739172429; c=relaxed/relaxed;
	bh=SX6mszOe0oOOchxN9OgohO62qqxrvmaKZYEtePneYLg=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=OgsEJmgXmL5dZSuxVok+Bgahn92OoIoy5gbCB9eoFUbVrVXxyiBjEgHOTbPDXAlYs0xHH+KMnHPBP6wSOaqWGBgF/NfRz99VqJAxi1AK9KJT7dpr2qWC58pRcnkANJgBpPdxRDi1BM4Fdp04j6ls7mmXbcKm61kpic8LeTm2m7KAHYu0rWmJ1M4S02eBJS2xRgA9GP0EmMaIh31CwH3k1je4ncQyQQIDJDDaK1NNx4l5+bI0CFF6tU7qLsc33MW4QhvmiIQXa3UZq2jx6sag1CB18BKD5SRdHmHleRRZn6gRMmb+S5phLTidlX5kEFwvq4HZpMstWTuLHAMXvj9YIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=asrockrack.com; dkim=pass (2048-bit key; unprotected) header.d=asrockrack.com header.i=@asrockrack.com header.a=rsa-sha256 header.s=asrockrack header.b=UJ25JHZr; dkim-atps=neutral; spf=pass (client-ip=43.251.62.78; helo=ms.pegatroncorp.com; envelope-from=prvs=12935334a=jeff9_chan@asrockrack.com; receiver=lists.ozlabs.org) smtp.mailfrom=asrockrack.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=asrockrack.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=asrockrack.com header.i=@asrockrack.com header.a=rsa-sha256 header.s=asrockrack header.b=UJ25JHZr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=asrockrack.com (client-ip=43.251.62.78; helo=ms.pegatroncorp.com; envelope-from=prvs=12935334a=jeff9_chan@asrockrack.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Mon, 10 Feb 2025 18:27:07 AEDT
Received: from ms.pegatroncorp.com (ms8.pegatroncorp.com [43.251.62.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yrx3b55lnz2yGF
	for <openbmc@lists.ozlabs.org>; Mon, 10 Feb 2025 18:27:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=asrockrack.com; i=@asrockrack.com; q=dns/txt;
  s=asrockrack; t=1739172429; x=1770708429;
  h=from:to:subject:date:message-id:mime-version;
  bh=9LKmdHRWn95Cbqxkw546ipO2o3tgxxCsUn0J2p3aOSg=;
  b=UJ25JHZrbwH6LVQNLZ7Rc8EaNnMeRpecWlzgUCj4WqOyI4BILRKfK0Xu
   1m39fUM685pmOJIbDtORGxtJ+8SU9mcuXBXHI5AmBnLb7Zlu6Po8VhLUW
   +6YaMtQYgzrqpmjfRvRvyf1yRyoEJlTN5lIj+4YuxDaMPZ5QqoDKFLqg0
   63hzCrJ0winslGQqk3D3O/SdDNHv4NfEvLVO5KnTNb04wCj3bAhoketUS
   s7f3dMkEZUnmmFmHlxR2fiG36Vu8WkPbecDBwsTaQGBjlHcdrkfu90vzr
   hE0ny0wGuOVLZX0pYQxaeyw0xS2kYFCLIygdJhcXikHHojHnvRZWM0lz2
   g==;
Authentication-Results: ms.pegatroncorp.com; spf=SoftFail smtp.mailfrom=Jeff9_Chan@asrockrack.com; spf=None smtp.helo=postmaster@PTW-MSE-AP02.pegatroncorp.com
Received-SPF: SoftFail (ms.pegatroncorp.com: domain of
  Jeff9_Chan@asrockrack.com is inclined to not designate
  172.18.192.78 as permitted sender) identity=mailfrom;
  client-ip=172.18.192.78; receiver=ms.pegatroncorp.com;
  envelope-from="Jeff9_Chan@asrockrack.com";
  x-sender="Jeff9_Chan@asrockrack.com"; x-conformance=spf_only;
  x-record-type="v=spf1"; x-record-text="v=spf1
  include:sendersrv.com ip4:58.240.231.120/30 ip4:124.9.5.0/26
  ip4:43.251.60.0/22 ip4:192.72.126.0/24 ip4:58.211.157.0/30
  ip4:221.224.25.136/30 ip4:210.80.80.195 ~all"
Received-SPF: None (ms.pegatroncorp.com: no sender authenticity
  information available from domain of
  postmaster@PTW-MSE-AP02.pegatroncorp.com) identity=helo;
  client-ip=172.18.192.78; receiver=ms.pegatroncorp.com;
  envelope-from="Jeff9_Chan@asrockrack.com";
  x-sender="postmaster@PTW-MSE-AP02.pegatroncorp.com";
  x-conformance=spf_only
Received: from unknown (HELO PTW-MSE-AP02.pegatroncorp.com) ([172.18.192.78])
  by ms.pegatroncorp.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 15:25:59 +0800
Received: from ASR-EX-MBSC02.asrock.corpnet (ASR-EX-MBSC02.asrock.corpnet [172.18.50.39])
	by PTW-MSE-AP02.pegatroncorp.com with ESMTP id 51A7PstW092707
	for <openbmc@lists.ozlabs.org>; Mon, 10 Feb 2025 15:25:54 +0800 (+08)
	(envelope-from Jeff9_Chan@asrockrack.com)
Received: from ASR-EX-MBS02.asrock.corpnet (172.18.50.35) by
 ASR-EX-MBSC02.asrock.corpnet (172.18.50.39) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 10 Feb 2025 15:25:54 +0800
Received: from ASR-EX-MBS02.asrock.corpnet (172.18.50.35) by
 ASR-EX-MBS02.asrock.corpnet (172.18.50.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Feb 2025 15:25:53 +0800
Received: from ASR-EX-MBS02.asrock.corpnet ([fe80::c978:ac77:f37f:d797]) by
 ASR-EX-MBS02.asrock.corpnet ([fe80::c978:ac77:f37f:d797%5]) with mapi id
 15.01.2507.039; Mon, 10 Feb 2025 15:25:53 +0800
From: =?big5?B?SmVmZjkgQ2hhbiizr6pRu/xfQVNSb2NrUmFjayk=?=
	<Jeff9_Chan@asrockrack.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: sensor reaction
Thread-Topic: sensor reaction
Thread-Index: Adt7i6Z8eeGxWlcbSF2ZL6eUaaB5Ig==
Date: Mon, 10 Feb 2025 07:25:53 +0000
Message-ID: <63724d62d1584a278148cda09ae5001e@asrockrack.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.194.46.159]
Content-Type: multipart/alternative;
	boundary="_000_63724d62d1584a278148cda09ae5001easrockrackcom_"
MIME-Version: 1.0
X-MAIL: PTW-MSE-AP02.pegatroncorp.com 51A7PstW092707
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_63724d62d1584a278148cda09ae5001easrockrackcom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgYWxsLA0KICAgICAgICBXaXRoIGVudGl0eSBtYW5hZ2VyLCBkYnVzLXNlbnNvcnMsIHdlIGNh
biBoYXZlIGV2ZW50IGxvZyBmb3Igc2Vuc29yIHRocmVzaG9sZCwgaG93IHRvIGFkZCBtb3JlIGFj
dGlvbiBmb3IgaXQ/IEZvciBleGFtcGxlIHdlIHNob3VsZCBzaHV0ZG93biBob3N0IGlmIGEgbGVh
ayBzZW5zb3IgcmVhY2hlZCBjcml0aWNhbCBzdGF0ZSwgY2FuIHdlIHN0YXJ0IGFub3RoZXIgc2Vy
dmljZSBhY2NvcmRpbmcgdG8gc2Vuc29yIHN0YXR1cz8gcGhvc3Bob3ItZGJ1cy1tb25pdG9yPyBB
bnkgYmV0dGVyIHNvbHV0aW9uPw0KDQpiZXN0IHJlZ2FyZHMNCg0KSmVmZiBDaGFuDQpBU1JvY2sg
SW5jLg0KVGVsOiArODg2LTItNTU1OTk2MDAgZXh0LjM4NjcwDQoNCg==

--_000_63724d62d1584a278148cda09ae5001easrockrackcom_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:=B7s=B2=D3=A9=FA=C5=E9;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@=B7s=B2=D3=A9=FA=C5=E9";
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-TW" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi all,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; With entity manager, dbus-sensors, we can have event log for se=
nsor threshold, how to add more action for it? For example we should shutdo=
wn host if a leak sensor reached critical state, can we start another servi=
ce
 according to sensor status? phosphor-dbus-monitor? Any better solution?<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-=
family:&quot;Arial&quot;,sans-serif;color:black">best regards<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:10.0pt;fo=
nt-family:&quot;Arial&quot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span=
></b></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:10.0pt;fo=
nt-family:&quot;Arial&quot;,sans-serif;color:black">Jeff Chan<o:p></o:p></s=
pan></b></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:10.0pt;fo=
nt-family:&quot;Arial&quot;,sans-serif;color:black">ASRock Inc.
<o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:10.0pt;fo=
nt-family:&quot;Arial&quot;,sans-serif;color:black">Tel: &#43;886-2-5559960=
0 ext.38670<o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_63724d62d1584a278148cda09ae5001easrockrackcom_--
