Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0D44D129B
	for <lists+openbmc@lfdr.de>; Tue,  8 Mar 2022 09:47:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCTTd13Hdz3bTH
	for <lists+openbmc@lfdr.de>; Tue,  8 Mar 2022 19:47:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=wistron.com header.i=@wistron.com header.a=rsa-sha256 header.s=security header.b=RVSQ0DJ3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=wistron.com (client-ip=103.200.3.18; helo=segapp01.wistron.com;
 envelope-from=bob_king@wistron.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=wistron.com header.i=@wistron.com header.a=rsa-sha256
 header.s=security header.b=RVSQ0DJ3; dkim-atps=neutral
X-Greylist: delayed 351 seconds by postgrey-1.36 at boromir;
 Tue, 08 Mar 2022 19:46:39 AEDT
Received: from segapp01.wistron.com (segapp01.wistron.com [103.200.3.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCTTC4vbJz30FC
 for <openbmc@lists.ozlabs.org>; Tue,  8 Mar 2022 19:46:38 +1100 (AEDT)
Received: from EXCHAPP04.whq.wistron (unknown [10.37.38.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by segapp01.wistron.com (MTA) with ESMTPS id 4KCTL74sXnzMqYRM;
 Tue,  8 Mar 2022 16:40:31 +0800 (CST)
Received: from EXCHAPP03.whq.wistron (10.37.38.26) by EXCHAPP04.whq.wistron
 (10.37.38.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 8 Mar
 2022 16:40:31 +0800
Received: from EXCHAPP03.whq.wistron ([fe80::ec42:e9a3:109d:b7bd]) by
 EXCHAPP03.whq.wistron ([fe80::ec42:e9a3:109d:b7bd%2]) with mapi id
 15.01.2375.018; Tue, 8 Mar 2022 16:40:31 +0800
From: <Bob_King@wistron.com>
To: <openbmc@lists.ozlabs.org>, <bradleyb@fuzziesquirrel.com>
Subject: Openbmc commit question.
Thread-Topic: Openbmc commit question.
Thread-Index: AdgOZulKkJHbvTf1Reukph+5Ln+twgeqBOKwAWyUB1A=
Date: Tue, 8 Mar 2022 08:40:31 +0000
Message-ID: <77316d044b8c415fb07e751662869f30@wistron.com>
References: <916794d657af450baccf0122cca5ea73@wistron.com>
 <9f9e145363cd4022ab7e5f72d12d77d1@wistron.com>
In-Reply-To: <9f9e145363cd4022ab7e5f72d12d77d1@wistron.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.37.38.237]
x-tm-snts-smtp: 2B042BEF21E46041A5F86370D1B6CAE4110C616968799DA8D1C6059DBF6CAB3A2000:8
Content-Type: multipart/alternative;
 boundary="_000_77316d044b8c415fb07e751662869f30wistroncom_"
MIME-Version: 1.0
x-msw-jemd-newsletter: false
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wistron.com; s=security;
 t=1646728840; bh=OgLYl3P6RVlZBl9t/CKzis8BVxl0xmKrlTtTF19Gwfs=;
 h=From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
 References:In-Reply-To:Accept-Language:Content-Language:
 Content-Type:MIME-Version;
 b=RVSQ0DJ3J01PUlw0ZvNvHqxnzmFT23cfdWXJ0BGMNJmlCetYDGj2R0cp2tdPx8KTk
 dwFMT3FMpAWWJ4mWD9oTfF+s271c1yKFgYtTBKewzvedb5534U93smj/gbswox9yAm
 fySzfzoxt4q6aj7mMG2O+1Ik6ED8z8jQMFlDvvx4=
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
Cc: Jet_JC_Lee@wistron.com, geissonator@yahoo.com, Claire_Ku@wistron.com,
 Lulu_Su@wistron.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--_000_77316d044b8c415fb07e751662869f30wistroncom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Brad,

We have a problem that the members in OWNERS list can not +2 and merge.
Could you help for this?
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/49786

Thanks a lot!

Best Regards,
Bob.

---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------
This email contains confidential or legally privileged information and is f=
or the sole use of its intended recipient.=20
Any unauthorized review, use, copying or distribution of this email or the =
content of this email is strictly prohibited.
If you are not the intended recipient, you may reply to the sender and shou=
ld delete this e-mail immediately.
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------


--_000_77316d044b8c415fb07e751662869f30wistroncom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:PMingLiU;
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
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle21
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle22
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Brad,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">We have a problem that the memb=
ers in OWNERS list can not &#43;2 and merge.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Could you help for this?<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://gerrit.openb=
mc-project.xyz/c/openbmc/openbmc/&#43;/49786">https://gerrit.openbmc-projec=
t.xyz/c/openbmc/openbmc/&#43;/49786</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks a lot!<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best Regards,<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Bob.<o:p></o:p></span></p>
</div>
=0A=0A---------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------<br />This email contains confidential or legally privileged=
 information and is for the sole use of its intended recipient. <br />Any u=
nauthorized review, use, copying or distribution of this email or the conte=
nt of this email is strictly prohibited.<br />If you are not the intended r=
ecipient, you may reply to the sender and should delete this e-mail immedia=
tely.<br />----------------------------------------------------------------=
---------------------------------------------------------------------------=
--------------------<br />=0A</body>
</html>

--_000_77316d044b8c415fb07e751662869f30wistroncom_--
