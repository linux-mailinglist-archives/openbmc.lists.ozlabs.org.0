Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 044BA36019F
	for <lists+openbmc@lfdr.de>; Thu, 15 Apr 2021 07:32:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLSfS4gldz3bV7
	for <lists+openbmc@lfdr.de>; Thu, 15 Apr 2021 15:32:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=wistron.com header.i=@wistron.com header.a=rsa-sha256 header.s=security header.b=XeMHsbU4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=wistron.com (client-ip=103.200.3.19; helo=segapp03.wistron.com;
 envelope-from=bob_king@wistron.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=wistron.com header.i=@wistron.com header.a=rsa-sha256
 header.s=security header.b=XeMHsbU4; dkim-atps=neutral
X-Greylist: delayed 544 seconds by postgrey-1.36 at boromir;
 Thu, 15 Apr 2021 15:32:36 AEST
Received: from segapp03.wistron.com (segapp02.wistron.com [103.200.3.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLSfD3zkYz303q
 for <openbmc@lists.ozlabs.org>; Thu, 15 Apr 2021 15:32:35 +1000 (AEST)
Received: from EXCHAPP03.whq.wistron (unknown [10.37.38.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by segapp03.wistron.com (MTA) with ESMTPS id 4FLSRf55mSz5D9P8;
 Thu, 15 Apr 2021 13:23:26 +0800 (CST)
Received: from EXCHAPP03.whq.wistron (10.37.38.26) by EXCHAPP03.whq.wistron
 (10.37.38.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 15 Apr
 2021 13:23:25 +0800
Received: from EXCHAPP03.whq.wistron ([fe80::14ba:7e23:d591:99a3]) by
 EXCHAPP03.whq.wistron ([fe80::14ba:7e23:d591:99a3%2]) with mapi id
 15.01.2176.009; Thu, 15 Apr 2021 13:23:25 +0800
From: <Bob_King@wistron.com>
To: <bradleyb@fuzziesquirrel.com>, <openbmc@lists.ozlabs.org>
Subject: new meta-wistron repository 
Thread-Topic: new meta-wistron repository 
Thread-Index: Adcxo6t+W8N06qNMTo2kSRZwdG07xw==
Date: Thu, 15 Apr 2021 05:23:25 +0000
Message-ID: <103c91be2e6b46d9bce11da00308c80f@wistron.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.37.38.230]
x-tm-snts-smtp: 1B6161C034DD07D05EE5BFEADDA1817ECE968B09839269A08693605A7A39690A2000:8
Content-Type: multipart/alternative;
 boundary="_000_103c91be2e6b46d9bce11da00308c80fwistroncom_"
MIME-Version: 1.0
x-msw-jemd-newsletter: false
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wistron.com; s=security;
 t=1618464206; bh=wXcqCpCtzSBJIKDN8eXuG4f7xb+nbB5DmBtTOSen4lo=;
 h=From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
 Accept-Language:Content-Language:Content-Type:MIME-Version;
 b=XeMHsbU4fLXL+3E7g7ScYnd3HHzGut/DuZRanNTjkCAuFq1z8hgIgEa8xbiG3QiOj
 72h9DaDa4JM0hIWonhP41kwuqoZ5t45Ak1ExRdJiZZ6IMFYp2nDW/25e6NXciM+jC7
 vzNLqtSgpFGDyovlzgSyBjrMc8Z4GHiWf4PhiT1U=
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
Cc: Ben_Pai@wistron.com, Claire_Ku@wistron.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--_000_103c91be2e6b46d9bce11da00308c80fwistroncom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Brad,

We need you help to create a new repository meta-wistron for Wistron openbm=
c platform.
Could you help for this?

And the maintainers for meta-wistron are:
Timothy_Huang@wistron.com
Claire_Ku@wistron.com
Ben_Pai@wistron.com
Andy_YF_Wang@wistron.com
Ken_Hsu@wistron.com
Jolie_Ku@wistron.com
Bob_King@wistron.com

Thanks!

Best Regards,
Bob


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


--_000_103c91be2e6b46d9bce11da00308c80fwistroncom_
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Brad,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">We need you help to create a ne=
w repository meta-wistron for Wistron openbmc platform.<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Could you help for this?<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">And the maintainers for meta-wi=
stron are:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Timothy_Huang@wistron.com<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Claire_Ku@wistron.com<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Ben_Pai@wistron.com<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Andy_YF_Wang@wistron.com<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Ken_Hsu@wistron.com<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Jolie_Ku@wistron.com<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Bob_King@wistron.com<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks!<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best Regards,<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Bob<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
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

--_000_103c91be2e6b46d9bce11da00308c80fwistroncom_--
