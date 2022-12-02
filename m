Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3AB640122
	for <lists+openbmc@lfdr.de>; Fri,  2 Dec 2022 08:40:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNlGT2LGyz3bfK
	for <lists+openbmc@lfdr.de>; Fri,  2 Dec 2022 18:40:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=inventron.com.tr header.i=@inventron.com.tr header.a=rsa-sha256 header.s=default header.b=ThfEPPSz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=inventron.com.tr (client-ip=185.216.113.70; helo=ns1.ihsdnsx51.com; envelope-from=zehra.ozdemir@inventron.com.tr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=inventron.com.tr header.i=@inventron.com.tr header.a=rsa-sha256 header.s=default header.b=ThfEPPSz;
	dkim-atps=neutral
Received: from ns1.ihsdnsx51.com (ns1.ihsdnsx51.com [185.216.113.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNlFp0JCqz3bTq
	for <openbmc@lists.ozlabs.org>; Fri,  2 Dec 2022 18:39:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inventron.com.tr;
	s=default; t=1669966773;
	bh=8SjwXEy5Tzv8Dz3cvndwcS4o42piT/nvnBBRFGEgtHM=;
	h=Received:Received:From:To:Subject;
	b=ThfEPPSzcz254mBZajSqRCbqShg/hBK1Of0crCyA3meqNN8ubEo/Od0q+b4s1Asrq
	 OVylvB1bZvoxeZln2SPNr1AC6k7ZYauq5v0X56e6fhS71XthQZlPFhiJ5CU2x/URx3
	 WsJpbRZ3tSLQJukjm+fYAGaO+fgkSJjs8kGEAIwM=
Received: (qmail 22476 invoked from network); 2 Dec 2022 10:39:33 +0300
Received: from 78.189.148.199.static.ttnet.com.tr (HELO INVLT5250ZO)
 (78.189.148.199)
  by ns1.ihsdnsx51.com with ESMTPSA (DHE-RSA-AES256-GCM-SHA384 encrypted,
 authenticated); 2 Dec 2022 10:39:32 +0300
From: <zehra.ozdemir@inventron.com.tr>
To: <openbmc@lists.ozlabs.org>
Subject: Switching backup image  to running from bmcweb gui
Date: Fri, 2 Dec 2022 10:39:32 +0300
Message-ID: <000a01d90621$38458d70$a8d0a850$@inventron.com.tr>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000B_01D9063A.5D92C570"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AdkGH36nB8fleCDOS/KTFEBxp64Qzg==
X-PPP-Message-ID: <166996677298.22471.5172950319920164340@ns1.ihsdnsx51.com>
X-PPP-Vhost: inventron.com.tr
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
Cc: "'M. Erhan Yigitbasi'" <erhan.yigitbasi@inventron.com.tr>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multipart message in MIME format.

------=_NextPart_000_000B_01D9063A.5D92C570
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

 

When I try to use the 'switch to running' property, I see that managers.hpp
triggered to change backup image priority 0 and then reboot bmc. But I do
not actually understand how this property makes my backup image running in
the background because when I check my backup image's priority with its id
from dbus, it is already 0 and my running image's priority is 1. Could you
please give me some information on how the switching operation works and how
to implement it properly? 

 

Thanks.


------=_NextPart_000_000B_01D9063A.5D92C570
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
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
span.E-postaStili17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DTR =
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoNormal>Hello,<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>When I try =
to use the &#8216;switch to running&#8217; property, I see that =
managers.hpp triggered to change backup image priority 0 and then reboot =
bmc. But I do not actually understand how this property makes my backup =
image running in the background because when I check my backup =
image&#8217;s priority with its id from dbus, it is already 0 and my =
running image&#8217;s priority is 1. Could you please give me some =
information on how the switching operation works and how to implement it =
properly? <o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Thanks.<o:p></o:p></p></div></body></html>
------=_NextPart_000_000B_01D9063A.5D92C570--

