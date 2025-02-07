Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B29F0A2C1C6
	for <lists+openbmc@lfdr.de>; Fri,  7 Feb 2025 12:42:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YqBrx1Kt1z3bsL
	for <lists+openbmc@lfdr.de>; Fri,  7 Feb 2025 22:41:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=43.251.60.7
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738928511;
	cv=none; b=RniB8skYSBQ3bpgYWZNN7R1CJz/ZTj9BmIBpmoIAlnkiI3hS13NwLNWNBZAH2Nse6q6qPLDEiv+hFFyOUm+Yc1GjS0VUkNQNsPlAs0C31DFSvG2+uMmnOP/GagKxvKsZeNwCDs/+iU1OIsPFlg5Y01DxGMJAigyaXHD0O10zRsE6fUqdAMvolDh6Z3BXhNMQ3adWIK/2jViYjCaWbsz5U9Vn4n6vvWFMAgbcFLmpHaGEMHWYA+XAC6rt5R5PycxR7IfWbVj/YW8zU1IYi0PbjL1R54UJFRWRGYNlZ53hYcRvnmlVLGSyywUXg+Sr9VZQrW9pJwyhIlIOo8IORBkUUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738928511; c=relaxed/relaxed;
	bh=xQYfxBdThp7CbSHFl7xOM5kCU8uNRK1s4vgAp8FY9Q0=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=CWv0T0eRnHxw7KzBNzT0jugZ7GBZO17U5wnWZ0PMMOhW7AO+1xn1ZQJwdsWsve8hIDrEnzQNZq4XdsmO8ySOBSCeXqYhF0l+QIGvL9zvzUPzJrfGox0YMxTrD3Y7FowXHy9WsdzGpKUOiHMdp/xccwQmTN4eCsVCWWhvKjoSiw9FYvm+3KZ5+Hsk9JVCA+cpXYPlcF5nKzqN0dq5ng1bSsZZs064S8jOOwSGfTksxGqirDBZpdYlKhijbLHUylWohELjXCC5Y4Y5n8N8VoZ2U2Jt+JAgU1fKLBFL/fmsGjVDyLmNm7bU71pZwkwIjyM/vCNCp85q8vISuSmGUa6COQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=asrockrack.com; dkim=pass (2048-bit key; unprotected) header.d=asrockrack.com header.i=@asrockrack.com header.a=rsa-sha256 header.s=asrockrack header.b=W0GQMsDv; dkim-atps=neutral; spf=pass (client-ip=43.251.60.7; helo=ms.pegatroncorp.com; envelope-from=prvs=126ef4400=jeff9_chan@asrockrack.com; receiver=lists.ozlabs.org) smtp.mailfrom=asrockrack.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=asrockrack.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=asrockrack.com header.i=@asrockrack.com header.a=rsa-sha256 header.s=asrockrack header.b=W0GQMsDv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=asrockrack.com (client-ip=43.251.60.7; helo=ms.pegatroncorp.com; envelope-from=prvs=126ef4400=jeff9_chan@asrockrack.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Fri, 07 Feb 2025 22:41:49 AEDT
Received: from ms.pegatroncorp.com (ms5.pegatroncorp.com [43.251.60.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YqBrs3g6yz30T9
	for <openbmc@lists.ozlabs.org>; Fri,  7 Feb 2025 22:41:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=asrockrack.com; i=@asrockrack.com; q=dns/txt;
  s=asrockrack; t=1738928510; x=1770464510;
  h=from:to:subject:date:message-id:mime-version;
  bh=gS0zY58+dPxvDDutD7aMTV5B73NcTX4ODWiq/b0hjRY=;
  b=W0GQMsDvXPT4L1cIvyX7T0c/pH+izKWUm7XQLHqrzcI+SMgUovRzAQGM
   TaTHth6n6KhGyi493Jh2/cAqIkMX5CYnmJYJfMbCGvMUNtOHfdpz+nQPd
   HqSMxrpFmMcJbQhdDB/+3OIrcHvqhvDLaZjQyjTzVW4jTxr61fCa2S4vH
   rxwAofXNJDkKWQwrkxFKARCMP3TkEZl8wYolpT4Ln8+C19FilwOvsG7UE
   SFWqRLJzJ06bnhBE+vkdFKm1fbhICW7sMmbVbrMeR7S2xuXHoxGMkA41+
   skClgSBRd8NQFVQqNsqYLYy2EJByiHLAmm72c/5m1Ca2n18SR5eZu5vaC
   w==;
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
  by ms.pegatroncorp.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 19:40:42 +0800
Received: from ASR-EX-MBSC01.asrock.corpnet (ASR-EX-MBSC01.asrock.corpnet [172.18.50.37])
	by PTW-MSE-DB02.pegatroncorp.com with ESMTP id 517BeeRb066989
	for <openbmc@lists.ozlabs.org>; Fri, 7 Feb 2025 19:40:40 +0800 (+08)
	(envelope-from Jeff9_Chan@asrockrack.com)
Received: from ASR-EX-MBS01.asrock.corpnet (172.18.50.33) by
 ASR-EX-MBSC01.asrock.corpnet (172.18.50.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Feb 2025 19:40:40 +0800
Received: from ASR-EX-MBS02.asrock.corpnet (172.18.50.35) by
 ASR-EX-MBS01.asrock.corpnet (172.18.50.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Feb 2025 19:40:39 +0800
Received: from ASR-EX-MBS02.asrock.corpnet ([fe80::c978:ac77:f37f:d797]) by
 ASR-EX-MBS02.asrock.corpnet ([fe80::c978:ac77:f37f:d797%5]) with mapi id
 15.01.2507.039; Fri, 7 Feb 2025 19:40:39 +0800
From: =?big5?B?SmVmZjkgQ2hhbiizr6pRu/xfQVNSb2NrUmFjayk=?=
	<Jeff9_Chan@asrockrack.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: dbus-sensors issue
Thread-Topic: dbus-sensors issue
Thread-Index: Adt5VBwWzy8o0Jc4R0iQgqnjFEvZaA==
Date: Fri, 7 Feb 2025 11:40:39 +0000
Message-ID: <3e85a9834ada4944a629c50cd6389630@asrockrack.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.194.46.159]
Content-Type: multipart/alternative;
	boundary="_000_3e85a9834ada4944a629c50cd6389630asrockrackcom_"
MIME-Version: 1.0
X-MAIL: PTW-MSE-DB02.pegatroncorp.com 517BeeRb066989
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

--_000_3e85a9834ada4944a629c50cd6389630asrockrackcom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgYWxsLA0KSXQgYXBwZWFycyB0aGF0IElPIHdhaXQgaXMgdmVyeSBoaWdoIGFsbCB0aGUgdGlt
ZS4gVGhpcyBjYW4gYmUgdmlld2VkIGJ5IHJ1bm5pbmcgYHRvcGAuIEl0IHdhcyB0cmFjZWQgZG93
biB0byBkYnVzLXNlbnNvcnMgc3lzdGVtZCB1bml0cy4gV2hlbiB0aGUgdW5pdHMgYXJlIHJ1bm5p
bmcsIElPIHdhaXQgaXMgPjkwJS4gVGhpcyBjYW4gaW1wYWN0IHN5c3RlbSBwZXJmb3JtYW5jZSBh
bmQgYWxzbyBpbXBhY3RzIENQVSB1dGlsaXphdGlvbiB0ZWxlbWV0cnksIHNpbmNlIHRoZSBpZGxl
IHRhc2sgbmV2ZXIgcnVucywgd2hpY2ggbm9ybWFsbHkgbWVhbnMgQ1BVIGlzIGJlaW5nIGNvbXBs
ZXRlbHkgdXRpbGl6ZWQuDQoNCk15IHBsYXRmb3JtIHVzZXMgYmVsb3cgc2VydmljZXMsIHN0b3Ag
dGhlbSB3aWxsIGZyZWUgdGhlIElPIHVzYWdlLCBhbnkgaWRlYT8NCg0KeHl6Lm9wZW5ibWNfcHJv
amVjdC5od21vbnRlbXBzZW5zb3Iuc2VydmljZQ0KeHl6Lm9wZW5ibWNfcHJvamVjdC5mYW5zZW5z
b3Iuc2VydmljZQ0KeHl6Lm9wZW5ibWNfcHJvamVjdC5hZGNzZW5zb3Iuc2VydmljZQ0KeHl6Lm9w
ZW5ibWNfcHJvamVjdC5wc3VzZW5zb3Iuc2VydmljZQ0KDQoNCmJlc3QgcmVnYXJkcw0KDQpKZWZm
IENoYW4NCg==

--_000_3e85a9834ada4944a629c50cd6389630asrockrackcom_
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
<p class=3D"MsoNormal" style=3D"text-indent:24.0pt"><span lang=3D"EN-US" st=
yle=3D"color:#1F497D">It appears that IO wait is very high all the time. Th=
is can be viewed by running `top`. It was traced down to dbus-sensors syste=
md units. When the units are running, IO
 wait is &gt;90%. This can impact system performance and also impacts CPU u=
tilization telemetry, since the idle task never runs, which normally means =
CPU is being completely utilized.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:24.0pt"><span lang=3D"EN-US" st=
yle=3D"color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:24.0pt"><span lang=3D"EN-US" st=
yle=3D"color:#1F497D">My platform uses below services, stop them will free =
the IO usage, any idea?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">&nbsp;<=
/span><span lang=3D"EN-US" style=3D"color:#1F497D"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">xyz.ope=
nbmc_project.hwmontempsensor.service<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">xyz.ope=
nbmc_project.fansensor.service<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">xyz.ope=
nbmc_project.adcsensor.service<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">xyz.ope=
nbmc_project.psusensor.service<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
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
</div>
</body>
</html>

--_000_3e85a9834ada4944a629c50cd6389630asrockrackcom_--
