Return-Path: <openbmc+bounces-4-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA94A9501B
	for <lists+openbmc@lfdr.de>; Mon, 21 Apr 2025 13:21:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zh2xX0g3Yz3c86;
	Mon, 21 Apr 2025 21:21:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=43.251.62.79
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745234480;
	cv=none; b=IZNql5tVbJC7GnfpuUvQdqdbwwjvvcoCfZlOEllQnWus/rC2w3o2wp62gFrrGXf70iblpbihfAqMAIHLRFloENtjHl4vteYCvD9+7byKvWlGu2H2rpMxbhZRj4ciEwy3bhntVBgnKK+1ST7nf8R1JAjZb/+qAZgVUXBAh9VJz0zXqqXD0oompYU0ljlBFjQwG/NoDNafsEPst+EY1aFuJSm+yWAoYCocsps+7m9ClWVhOfWqCYfCYTE6uKJaQ3j6htL6YnmrZ+rtKm2NJtjcMaLFwOhWRLDMVXxPF5qRngHsnMHcuFKwYthGDwuAOzZJHHLfyf2nNBIkZFsf4C+fBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745234480; c=relaxed/relaxed;
	bh=KjvQ+Smg4Cy6/51S0tGqTbpDUCZ0q8n72zIHccMBomw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Bms3/ptF3Soezo4b36E6K2rSrNApOoFfTWzLq4ZjgHu29aE8lF9saevcst9z12Hse/bnGwVUokMDCevph/lYR+sg3G6+fQ0Lt691aq8FyV7uvNV2rPb1fpUj+9LzD5yJX7IRyoWntYnjBB4j9AxPGA/ChhzteYPvjE1V452UPFLwxEHMBCWBwgOeF9lmP8PD0o0ACKEqaJ8Ojh4JC9XfWlriNvqGqgryYQe5Ylfd/anrbgjcHWD7ZeOBRwEs+PUtLw197m9U5to/KNRCOWhFKYPqOuQLF+dfbP2rG9ctwSylAa/FaJq5s2MJLU5HzODngYOMS5bxotsP6YErTg0YbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=asrockrack.com; dkim=pass (2048-bit key; unprotected) header.d=asrockrack.com header.i=@asrockrack.com header.a=rsa-sha256 header.s=asrockrack header.b=hWpNwhtH; dkim-atps=neutral; spf=pass (client-ip=43.251.62.79; helo=ms.pegatroncorp.com; envelope-from=prvs=199a3d6cf=jeff9_chan@asrockrack.com; receiver=lists.ozlabs.org) smtp.mailfrom=asrockrack.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=asrockrack.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=asrockrack.com header.i=@asrockrack.com header.a=rsa-sha256 header.s=asrockrack header.b=hWpNwhtH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=asrockrack.com (client-ip=43.251.62.79; helo=ms.pegatroncorp.com; envelope-from=prvs=199a3d6cf=jeff9_chan@asrockrack.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Mon, 21 Apr 2025 21:21:18 AEST
Received: from ms.pegatroncorp.com (ms9.pegatroncorp.com [43.251.62.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zh2xV15hkz3c85
	for <openbmc@lists.ozlabs.org>; Mon, 21 Apr 2025 21:21:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=asrockrack.com; i=@asrockrack.com; q=dns/txt;
  s=asrockrack; t=1745234479; x=1776770479;
  h=from:to:subject:date:message-id:mime-version;
  bh=jSfSWvXkH/njWqlUGLHA/YTZHpRpAfcboNbdS7ZzXZE=;
  b=hWpNwhtH3lh9WORO3FyGrtdIIXiRqPUwM6e7MqwdmFt22gwtf/4X1iI8
   06aMhaUEfe4zQzo758pUXjU9EE+vFsRTCqlV6hzYgx/0td/xNe3lrAtVs
   /VVrwsvd+IVVP9vgpNmoa6FLwDmkEA+LwXW6Tnua1SA+diPIPXHPWpIKs
   pGCdTA1cQa4kNAYaC1KxYzlT6l9q+M8yQuMREItWPih8pO6UwmXIZv1Yv
   yZr9ZgOJWKDxvN2YpnTLxuuvlpGLoBqEqCInKn1qpJxRN30YZcCqVe56z
   rWEnEib8YAhp1QRC8t6IW7GbETg3D0ZOBBL5SpdrJeffCH+OY3dDSaapq
   g==;
Authentication-Results: ms.pegatroncorp.com; spf=SoftFail smtp.mailfrom=Jeff9_Chan@asrockrack.com; spf=None smtp.helo=postmaster@PTW-MSE-DB02.pegatroncorp.com
Received-SPF: SoftFail (ms.pegatroncorp.com: domain of
  Jeff9_Chan@asrockrack.com is inclined to not designate
  172.18.192.77 as permitted sender) identity=mailfrom;
  client-ip=172.18.192.77; receiver=ms.pegatroncorp.com;
  envelope-from="Jeff9_Chan@asrockrack.com";
  x-sender="Jeff9_Chan@asrockrack.com"; x-conformance=spf_only;
  x-record-type="v=spf1"; x-record-text="v=spf1
  include:sendersrv.com ip4:58.240.231.120/30 ip4:124.9.5.0/26
  ip4:43.251.60.0/22 ip4:192.72.126.0/24 ip4:58.211.157.0/30
  ip4:221.224.25.136/30 ip4:210.80.80.195 ~all"
Received-SPF: None (ms.pegatroncorp.com: no sender authenticity
  information available from domain of
  postmaster@PTW-MSE-DB02.pegatroncorp.com) identity=helo;
  client-ip=172.18.192.77; receiver=ms.pegatroncorp.com;
  envelope-from="Jeff9_Chan@asrockrack.com";
  x-sender="postmaster@PTW-MSE-DB02.pegatroncorp.com";
  x-conformance=spf_only
Received: from unknown (HELO PTW-MSE-DB02.pegatroncorp.com) ([172.18.192.77])
  by ms.pegatroncorp.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 19:20:10 +0800
Received: from ASR-EX-MBSC02.asrock.corpnet ([172.18.50.39])
	by PTW-MSE-DB02.pegatroncorp.com with ESMTP id 53LBK4rJ036149
	for <openbmc@lists.ozlabs.org>; Mon, 21 Apr 2025 19:20:04 +0800 (+08)
	(envelope-from Jeff9_Chan@asrockrack.com)
Received: from ASR-EX-MBS02.asrock.corpnet (172.18.50.35) by
 ASR-EX-MBSC02.asrock.corpnet (172.18.50.39) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 21 Apr 2025 19:20:04 +0800
Received: from ASR-EX-MBS02.asrock.corpnet (172.18.50.35) by
 ASR-EX-MBS02.asrock.corpnet (172.18.50.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Apr 2025 19:20:04 +0800
Received: from ASR-EX-MBS02.asrock.corpnet ([fe80::c978:ac77:f37f:d797]) by
 ASR-EX-MBS02.asrock.corpnet ([fe80::c978:ac77:f37f:d797%5]) with mapi id
 15.01.2507.039; Mon, 21 Apr 2025 19:20:04 +0800
From: =?big5?B?SmVmZjkgQ2hhbiizr6pRu/xfQVNSb2NrUmFjayk=?=
	<Jeff9_Chan@asrockrack.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: firmware update from webui
Thread-Topic: firmware update from webui
Thread-Index: Aduyriod5KZi7No4Qtmt2F5qRi2Pdg==
Date: Mon, 21 Apr 2025 11:20:04 +0000
Message-ID: <eade5f77d869481f9a2992f593f92e94@asrockrack.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.194.46.159]
Content-Type: multipart/alternative;
	boundary="_000_eade5f77d869481f9a2992f593f92e94asrockrackcom_"
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MAIL:PTW-MSE-DB02.pegatroncorp.com 53LBK4rJ036149
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--_000_eade5f77d869481f9a2992f593f92e94asrockrackcom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGksDQogICAgICAgIFdpdGggbGF0ZXN0IG9wZW5ibWMgZnJvbSByZXBvLCB0aGUgZmlybXdhcmUg
dXBkYXRlIGZ1bmN0aW9uIGluIHdlYnVpIGZhaWxlZCB3aXRoIKGnRXJyb3Igc3RhcnRpbmcgZmly
bXdhcmUgdXBkYXRloagsIGJ1dCB3aXRoIGN1cmwgdG8gL3JlZGZpc2gvdjEvVXBkYXRlU2Vydmlj
ZSBhY3R1YWxseSB3b3JrcywgaXMgaXQgYSBrbm93biBpc3N1ZT8NCg0KYmVzdCByZWdhcmRzDQoN
CkplZmYgQ2hhbg0KQVNSb2NrIEluYy4NClRlbDogKzg4Ni0yLTU1NTk5NjAwIGV4dC4zODY3MA0K
DQo=

--_000_eade5f77d869481f9a2992f593f92e94asrockrackcom_
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; With latest openbmc from repo, the firmware update function in =
webui failed with =A1=A7Error starting firmware update=A1=A8, but with curl=
 to /redfish/v1/UpdateService actually works, is it a known issue?<o:p></o:=
p></span></p>
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

--_000_eade5f77d869481f9a2992f593f92e94asrockrackcom_--

