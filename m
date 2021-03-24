Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFAE348B57
	for <lists+openbmc@lfdr.de>; Thu, 25 Mar 2021 09:16:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5dGp4vDyz309g
	for <lists+openbmc@lfdr.de>; Thu, 25 Mar 2021 19:16:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gapps-ntust-edu-tw.20150623.gappssmtp.com header.i=@gapps-ntust-edu-tw.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=qNXOXbJo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=gapps.ntust.edu.tw (client-ip=2607:f8b0:4864:20::430;
 helo=mail-pf1-x430.google.com; envelope-from=m10902803@gapps.ntust.edu.tw;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gapps-ntust-edu-tw.20150623.gappssmtp.com
 header.i=@gapps-ntust-edu-tw.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=qNXOXbJo; dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4yc03dhWz302S
 for <openbmc@lists.ozlabs.org>; Wed, 24 Mar 2021 17:13:49 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id y5so16587297pfn.1
 for <openbmc@lists.ozlabs.org>; Tue, 23 Mar 2021 23:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gapps-ntust-edu-tw.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:mime-version:thread-index
 :content-language;
 bh=OpWykrh6ZtF5Et7Ou5ymYHLtJerNqsyRebunwbY9odk=;
 b=qNXOXbJoOFvpXJqvbmVzKEbv0DLSGdSSIOGhL2hlIvDRhaKC24e2O7+lBZi79ZV5jx
 MvwFPNEi6y0gZ4aDY4rlLHyC18WGU04tN9x5VYawWTTAWZVSRbotGHQguJy3FKvZ+DWU
 UV24LCyFJGHkscRI7L2OquET7lwsFZj8WhdiiL8l5NNykwclhQjusc73Wv55v2OwODiE
 KjScun49nFkzK0WJa5jOr6Cmo7OoH8XM9bZExKw5gDtqfq5KLqDTSkK3IucwPI+tOxKV
 hIpNH4ZVn+MUBVSSvVhYHDShF5RQWt55GzuJMVHKFgF7sK2Jp3NVSp5WcFbGcpNy/FoV
 wPBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :thread-index:content-language;
 bh=OpWykrh6ZtF5Et7Ou5ymYHLtJerNqsyRebunwbY9odk=;
 b=OG5sIMl9QAA82u0qsl8aKEvCxafWAwc3OGJFcm+3z9FgKJqOk1x4tXjVTbu4iCvuP1
 QsGwCCbMXX9+oQEQlMxzWWoHPJEQaeyjKID8w71x9QsnOEhR+pBDnHtZrxZenEV5Jh8s
 azmWOHohHOxx30nvKlwrRDK3NYZgVGolWptQeA5g6ndVmMVq5Ug1xKkKlOYvIpZZRpcv
 1b8DvebOvTXN21vaFW3aWNRuO/TS5/vrlgMnNzOo8dlItQNbVSH0bIjwRleEWWkdX1ra
 K4TUorPhWediW1VHnV+cH7GrIdNc6y7vkULGN9FBoQBEB8vQ+HkU9treZhjkpHNIhjrd
 m4zw==
X-Gm-Message-State: AOAM533RH/3Ka00l0ZeK1yBHgsOvIiZm0lwubGU3fYMHpYNfw/fPOB18
 he8Q4AdodJbnnwUAChvcyysNCi77nFthMg==
X-Google-Smtp-Source: ABdhPJyn9/qdjJIs4TVLSc74poIpwgaGXXfb89P94cfDrJFzHVpFzHlT1HfvxsMEVUNNWlxvguyIOA==
X-Received: by 2002:aa7:9ae7:0:b029:20a:d94d:dd61 with SMTP id
 y7-20020aa79ae70000b029020ad94ddd61mr1895803pfp.0.1616566425926; 
 Tue, 23 Mar 2021 23:13:45 -0700 (PDT)
Received: from LuthfiMufadelLaptop (220-128-110-82.HINET-IP.hinet.net.
 [220.128.110.82])
 by smtp.gmail.com with ESMTPSA id m7sm1014791pjc.54.2021.03.23.23.13.44
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Mar 2021 23:13:45 -0700 (PDT)
From: <m10902803@gapps.ntust.edu.tw>
To: <openbmc@lists.ozlabs.org>
Subject: Web Server Code Location
Date: Wed, 24 Mar 2021 14:13:43 +0800
Message-ID: <000a01d72074$d86f0a90$894d1fb0$@gapps.ntust.edu.tw>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_000_000B_01D720B7.E692E6D0"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdcgdNcyVHBl9/E8TTmtDVmDhaQv6Q==
Content-Language: en-id
X-Mailman-Approved-At: Thu, 25 Mar 2021 19:16:05 +1100
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

This is a multipart message in MIME format.

------=_NextPart_000_000B_01D720B7.E692E6D0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

 

 

Hello, I'm Luthfi, a master student in NTUST, Taiwan. Currently I'm working
on openBMC and need to fix these problem:

1.	Network settings
2.	Firmware update

I already finished install the Romulus image and QEMU to run it with GUI. I
run the GUI by use these commands

 

qemu-system-arm -m 256 -M romulus-bmc -nographic -drive
file=./tmp/deploy/images/romulus/obmc-phosphor-image-romulus.static.mtd,form
at=raw,if=mtd -net nic -net
user,hostfwd=:127.0.0.1:2222-:22,hostfwd=:127.0.0.1:2443-:443,hostname=qemu

 

How can I check the source code of the web server that running in it?

 

Sincerely,

Muhamad Luthfi Mufadel

National Taiwan University of Science and Technology


------=_NextPart_000_000B_01D720B7.E692E6D0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1576553980;
	mso-list-type:hybrid;
	mso-list-template-ids:903265404 940113935 940113945 940113947 940113935 =
940113945 940113947 940113935 940113945 940113947;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-ID =
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Hello, =
I&#8217;m Luthfi, a master student in NTUST, Taiwan. Currently I&#8217;m =
working on openBMC and need to fix these problem:<o:p></o:p></p><ol =
style=3D'margin-top:0cm' start=3D1 type=3D1><li class=3DMsoListParagraph =
style=3D'margin-left:0cm;mso-list:l0 level1 lfo1'>Network =
settings<o:p></o:p></li><li class=3DMsoListParagraph =
style=3D'margin-left:0cm;mso-list:l0 level1 lfo1'>Firmware =
update<o:p></o:p></li></ol><p class=3DMsoNormal>I already finished =
install the Romulus image and QEMU to run it with GUI. I run the GUI by =
use these commands<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>qemu-system-arm -m 256 -M romulus-bmc -nographic =
-drive =
file=3D./tmp/deploy/images/romulus/obmc-phosphor-image-romulus.static.mtd=
,format=3Draw,if=3Dmtd -net nic -net =
user,hostfwd=3D:127.0.0.1:2222-:22,hostfwd=3D:127.0.0.1:2443-:443,hostnam=
e=3Dqemu<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>How can I check the source code of the web server that =
running in it?<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Sincerely,<o:p></o:p></p><p class=3DMsoNormal>Muhamad =
Luthfi Mufadel<o:p></o:p></p><p class=3DMsoNormal>National Taiwan =
University of Science and Technology<o:p></o:p></p></div></body></html>
------=_NextPart_000_000B_01D720B7.E692E6D0--

