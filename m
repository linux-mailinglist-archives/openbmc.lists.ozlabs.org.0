Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E86064696E
	for <lists+openbmc@lfdr.de>; Thu,  8 Dec 2022 07:50:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSPsp5tlPz2xl5
	for <lists+openbmc@lfdr.de>; Thu,  8 Dec 2022 17:50:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=inventron.com.tr header.i=@inventron.com.tr header.a=rsa-sha256 header.s=default header.b=bAq9bgNz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=inventron.com.tr (client-ip=185.216.113.70; helo=ns1.ihsdnsx51.com; envelope-from=zehra.ozdemir@inventron.com.tr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=inventron.com.tr header.i=@inventron.com.tr header.a=rsa-sha256 header.s=default header.b=bAq9bgNz;
	dkim-atps=neutral
Received: from ns1.ihsdnsx51.com (ns1.ihsdnsx51.com [185.216.113.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSPs96xkVz2xl5
	for <openbmc@lists.ozlabs.org>; Thu,  8 Dec 2022 17:49:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inventron.com.tr;
	s=default; t=1670482165;
	bh=dz+IY55ELhh4adVun/rMh1fkxI/0+k4iI/+fxBtWSBM=;
	h=Received:Received:From:To:Subject;
	b=bAq9bgNz2fLivIf0NGFjKd0fYE5Ox0+qOvtZk1R3m9/QgqFZoPHwM7HXVsa0kT2DI
	 BUE+lMz9v+AG6g65JkXETQQztHPeQACAFOgU73gYfShI9mEZm7pYrUFwoQXtzo7v6y
	 57u6G2LLVTxY2auZa9LKPTPfvZbCnFfyH02NYSaE=
Received: (qmail 575067 invoked from network); 8 Dec 2022 09:49:25 +0300
Received: from 78.189.148.199.static.ttnet.com.tr (HELO INVLT5250ZO)
 (78.189.148.199)
  by ns1.ihsdnsx51.com with ESMTPSA (DHE-RSA-AES256-GCM-SHA384 encrypted,
 authenticated); 8 Dec 2022 09:49:25 +0300
From: <zehra.ozdemir@inventron.com.tr>
To: <openbmc@lists.ozlabs.org>
Subject: Phosphor-ipmi-ipmb
Date: Thu, 8 Dec 2022 09:49:23 +0300
Message-ID: <000901d90ad1$35f93f30$a1ebbd90$@inventron.com.tr>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000A_01D90AEA.5B467730"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AdkKy4baG/3KSq1GQcSAHktitBiQ0g==
X-PPP-Message-ID: <167048216572.575062.15357035212519602406@ns1.ihsdnsx51.com>
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

------=_NextPart_000_000A_01D90AEA.5B467730
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

 

We are trying to create communication between BMC and the Host. We defined
an ipmb device from an i2c in dts and can barely see that /dev/ipmb-x is
created and ipmb.service is running. But we do not understand how is data
transfer provided Host to BMC yet.  Is remote address in ipmb-channels.json
used for that reason? Also, do we need to add any driver to the host for
this? 

 

Thanks.


------=_NextPart_000_000A_01D90AEA.5B467730
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
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>We are =
trying to create communication between BMC and the Host. We defined an =
ipmb device from an i2c in dts and can barely see that /dev/ipmb-x is =
created and ipmb.service is running. But we do not understand how is =
data transfer provided Host to BMC yet. &nbsp;Is remote address in =
ipmb-channels.json used for that reason? Also, do we need to add any =
driver to the host for this? <o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Thanks.<o:p></o:p></p></div></body></html>
------=_NextPart_000_000A_01D90AEA.5B467730--

