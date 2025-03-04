Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66504A4D75F
	for <lists+openbmc@lfdr.de>; Tue,  4 Mar 2025 10:06:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6VDG4klXz3cfB
	for <lists+openbmc@lfdr.de>; Tue,  4 Mar 2025 20:06:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=61.152.208.219
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741079195;
	cv=none; b=cqnqAGH2Ca2WUadEfT8I5JvZvEWVDCPBbr9gNRhXXH0AoCAyEaRf2e6iQQyJzlFwx8xx0ukkztryjz6AfmLgWGusIUBpz7TF7OUfD1Uw9hlbU0K9IwywBXf8CkEueo6ljj0JjYLhl0HDM/aVs+iG8SAqsQgKBOANSqsKjUnj2rcP24QWiSdOt1Koja4Ynqs79M1lO9A/Jizsb+HzvZjWeXXkTDd7BPtc0W0YshslZH65nPC58Vb76MbjxcfTsXGX9EAdNPNdjOz/RfbJnQlI2/2Mq5Q/vC347bPZj10AIqgWlJrBzCcOtHR/PoG4ZbxFDfCCAVY1XGmILftkSAeRCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741079195; c=relaxed/relaxed;
	bh=VMxMIHNMLgm6f6MTWGtoAwT1qU4i0WGEy7LYOl6wJhY=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hRioF2qZQ+ZxX/ZJkbqQFjrIJd+PMfYTgt2MkmGtoDUOPz4AoGu2t9+6QkXzEYV/bhH1Q52HptkO6lOh4/35L2iSbgSYPJbLjBvhQIo0l4exbVPLrL9gHJAb1nuRzCvTZyvhfgjP+3hVJJfCxUOv2DGE4wgFmboMXkC5GHSboyup/jFIGWQWKIqVT+ZgEwV7kS9MrgaAnvXQEUbQmbEkjTOihNtZn25jFkXumOtSvDgWcRVE5Xq7qv7LH7PLVhUNG7aM/Kj2kglWpwxCSQKW8G9JFjlEVziPBOnYCQd+pDtuXIHC7PMnfmy5e5/oe8Dd0YFQbuFzGSROU2QJNASdNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com; spf=pass (client-ip=61.152.208.219; helo=mx2.zhaoxin.com; envelope-from=andrewzhang@zhaoxin.com; receiver=lists.ozlabs.org) smtp.mailfrom=zhaoxin.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zhaoxin.com (client-ip=61.152.208.219; helo=mx2.zhaoxin.com; envelope-from=andrewzhang@zhaoxin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 860 seconds by postgrey-1.37 at boromir; Tue, 04 Mar 2025 20:06:34 AEDT
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [61.152.208.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z6VDB0rWKz2yjV
	for <openbmc@lists.ozlabs.org>; Tue,  4 Mar 2025 20:06:32 +1100 (AEDT)
X-ASG-Debug-ID: 1741078316-1eb14e79ff3b090001-mgJK9t
Received: from ZXSHMBX2.zhaoxin.com (ZXSHMBX2.zhaoxin.com [10.28.252.164]) by mx2.zhaoxin.com with ESMTP id Zphz5MLX3p6Kerbe (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO) for <openbmc@lists.ozlabs.org>; Tue, 04 Mar 2025 16:51:56 +0800 (CST)
X-Barracuda-Envelope-From: AndrewZhang@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Received: from ZXSHMBX1.zhaoxin.com (10.28.252.163) by ZXSHMBX2.zhaoxin.com
 (10.28.252.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.44; Tue, 4 Mar
 2025 16:51:55 +0800
Received: from ZXSHMBX1.zhaoxin.com ([fe80::894:121d:32eb:3cce]) by
 ZXSHMBX1.zhaoxin.com ([fe80::894:121d:32eb:3cce%7]) with mapi id
 15.01.2507.044; Tue, 4 Mar 2025 16:51:55 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
From: "Andrew Zhang(XA-RD)" <AndrewZhang@zhaoxin.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Question for espi oob channel and mctp over smbus
Thread-Topic: Question for espi oob channel and mctp over smbus
X-ASG-Orig-Subj: Question for espi oob channel and mctp over smbus
Thread-Index: AduM4WE0sMqqcLtQTVuFoNQ93Wz17g==
Date: Tue, 4 Mar 2025 08:51:55 +0000
Message-ID: <d5904cc7374d4aa2a63afafc04873e58@zhaoxin.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.32.124.29]
Content-Type: multipart/alternative;
	boundary="_000_d5904cc7374d4aa2a63afafc04873e58zhaoxincom_"
MIME-Version: 1.0
X-Barracuda-Connect: ZXSHMBX2.zhaoxin.com[10.28.252.164]
X-Barracuda-Start-Time: 1741078316
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 5737
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.00
X-Barracuda-Spam-Status: No, SCORE=-2.00 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=HTML_MESSAGE, THREAD_INDEX, THREAD_TOPIC
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.138001
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------
	0.01 THREAD_INDEX           thread-index: AcO7Y8iR61tzADqsRmmc5wNiFHEOig==
	0.01 THREAD_TOPIC           Thread-Topic: ...(Japanese Subject)...
	0.00 HTML_MESSAGE           BODY: HTML included in message
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
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

--_000_d5904cc7374d4aa2a63afafc04873e58zhaoxincom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Dear guys,

Currently, we have some confusion regarding the eSPI OOB channel. We can en=
capsulate MCTP SMBus packets on this channel to enable OOB communication be=
tween the BMC and our Processor.
However, neither the eSPI Specification, the MCTP over SMBus specification,=
 nor the AST2600-related datasheets and materials explicitly state whether =
additional software-level handshaking based
on the MCTP over SMBus protocol is required between the BMC and the Process=
or's eSPI Master before communication.

I'd like to ask for your advice, is it necessary to implement software-leve=
l handshaking for eSPI OOB based MCTP transmission?
(ie. build EID routing table, set/get EID and etc)


BR,
Andrew(Andy) Zhang



?????
?????????????????????????????????????????????????????
CONFIDENTIAL NOTE:
This email contains confidential or legally privileged information and is f=
or the sole use of its intended recipient. Any unauthorized review, use, co=
pying or forwarding of this email or the content of this email is strictly =
prohibited.

--_000_d5904cc7374d4aa2a63afafc04873e58zhaoxincom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:m=3D"http://schema=
s.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html=
40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:DengXian;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:DengXian;
	color:windowtext;
	font-weight:normal;
	font-style:normal;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:DengXian;}
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
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word;text-justify-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Dear=
 guys,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Curr=
ently, we have some confusion regarding the eSPI OOB channel. We can encaps=
ulate MCTP SMBus packets on this channel to enable OOB communication betwee=
n the BMC and our Processor.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Howe=
ver, neither the eSPI Specification, the MCTP over SMBus specification, nor=
 the AST2600-related datasheets and materials explicitly state whether addi=
tional software-level handshaking based
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">on t=
he MCTP over SMBus protocol is required between the BMC and the Processor's=
 eSPI Master before communication.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">I&#8=
217;d like to ask for your advice, is it necessary to implement software-le=
vel handshaking for eSPI OOB based MCTP transmission?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(ie. build EID routing table, s=
et/get EID and etc)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">BR,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Andrew(Andy) Zhang<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<p></p>
<br>
<br>
<div style=3D"font-size:10pt; line-height:10pt; font-family: '&#23435;&#203=
07;';color:#595959;">&#20445;&#23494;&#22768;&#26126;&#65306;</div>
<div style=3D"font-size:10pt; line-height:10pt; font-family: '&#23435;&#203=
07;';color:#595959;">&#26412;&#37038;&#20214;&#21547;&#26377;&#20445;&#2349=
4;&#25110;&#19987;&#26377;&#20449;&#24687;&#65292;&#20165;&#20379;&#25351;&=
#23450;&#25910;&#20214;&#20154;&#20351;&#29992;&#12290;&#20005;&#31105;&#23=
545;&#26412;&#37038;&#20214;&#25110;&#20854;&#20869;&#23481;&#20570;&#20219=
;&#20309;&#26410;&#32463;&#25480;&#26435;&#30340;&#26597;&#38405;&#12289;&#=
20351;&#29992;&#12289;&#22797;&#21046;&#25110;&#36716;&#21457;&#12290;</div=
>
<div style=3D"font-size:10pt; line-height:10pt; font-family: 'Times New Rom=
an';color:#595959;">
<i>CONFIDENTIAL NOTE: </i></div>
<div style=3D"font-size:10pt; line-height:10pt; font-family: 'Times New Rom=
an';color:#595959;">
<i>This email contains confidential or legally privileged information and i=
s for the sole use of its intended recipient. Any unauthorized review, use,=
 copying or forwarding of this email or the content of this email is strict=
ly prohibited.</i></div>
</body>
</html>

--_000_d5904cc7374d4aa2a63afafc04873e58zhaoxincom_--
