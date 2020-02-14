Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C3915D0B3
	for <lists+openbmc@lfdr.de>; Fri, 14 Feb 2020 04:41:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48JfLY29NXzDqYB
	for <lists+openbmc@lfdr.de>; Fri, 14 Feb 2020 14:41:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=wistron.com (client-ip=103.200.3.19; helo=segapp02.wistron.com;
 envelope-from=andy_yf_wang@wistron.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=wistron.com
X-Greylist: delayed 313 seconds by postgrey-1.36 at bilbo;
 Fri, 14 Feb 2020 14:40:43 AEDT
Received: from segapp02.wistron.com (segapp02.wistron.com [103.200.3.19])
 by lists.ozlabs.org (Postfix) with ESMTP id 48JfKl3ygqzDqX9
 for <openbmc@lists.ozlabs.org>; Fri, 14 Feb 2020 14:40:40 +1100 (AEDT)
Received: from EXCHAPP01.whq.wistron (unverified [10.37.38.24]) by 
 TWNHUMSW3.wistron.com (Clearswift SMTPRS 5.6.0) with ESMTP id 
 <Tdd4fe4266bc0a816711cd0@TWNHUMSW3.wistron.com>; Fri, 14 Feb 2020 
 11:35:24 +0800
Received: from EXCHAPP01.whq.wistron (10.37.38.24) by EXCHAPP01.whq.wistron 
 (10.37.38.24) with Microsoft SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 
 15.1.1713.5; Fri, 14 Feb 2020 11:35:23 +0800
Received: from EXCHAPP01.whq.wistron ([fe80::35d3:fdd5:f91:cd84]) by 
 EXCHAPP01.whq.wistron ([fe80::35d3:fdd5:f91:cd84%10]) with mapi id 
 15.01.1713.004; Fri, 14 Feb 2020 11:35:23 +0800
From: <Andy_YF_Wang@wistron.com>
To: <openbmc@lists.ozlabs.org>, <bradleyb@fuzziesquirrel.com>
Subject: request of creating a "wistron-ipmi-oem" repository
Thread-Topic: request of creating a "wistron-ipmi-oem" repository
Thread-Index: AdXi58T2DQN2TFhnQICLiVkgft0tQA==
Date: Fri, 14 Feb 2020 03:35:22 +0000
Message-ID: <8cd0d174812a4c1da31ce8f9e8670cae@wistron.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.37.38.230]
x-tm-snts-smtp: B3DABDCC28FE6D06E9002D90E776E2F115FDA3577632A774F7426EBB3A8B7EEE2000:8
Content-Type: multipart/related; 
 boundary="_004_8cd0d174812a4c1da31ce8f9e8670caewistroncom_"; 
 type="multipart/alternative"
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
Cc: Ben_Pai@wistron.com, Claire_Ku@wistron.com, wangat@tw.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_004_8cd0d174812a4c1da31ce8f9e8670caewistroncom_
Content-Type: multipart/alternative; 
    boundary="_000_8cd0d174812a4c1da31ce8f9e8670caewistroncom_"

--_000_8cd0d174812a4c1da31ce8f9e8670caewistroncom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Brad,

We are members of the wistron FW team.
Recently we plan to create a wistron specific ipmi-oem command that we need=
 to create a ""wistron-ipmi-oem" repository on github.
Could you please help us in this part of creating a "wistron-ipmi-oem" repo=
sitory?
Thanks!


Thanks again and best regards,
Andy YF Wang
Wistron Corporation
[cid:image001.png@01D5E328.542AB660]
BMC Software Engineer
Tel: (+886)8501-4278


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

--_000_8cd0d174812a4c1da31ce8f9e8670caewistroncom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
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
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:16.0pt;font-=
family:&quot;Arial&quot;,sans-serif;color:#004080">Hi Brad,<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:16.0pt;font-=
family:&quot;Arial&quot;,sans-serif;color:#004080"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:16.0pt;font-=
family:&quot;Arial&quot;,sans-serif;color:#004080">We are members of the wi=
stron FW team.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:16.0pt;font-=
family:&quot;Arial&quot;,sans-serif;color:#004080">Recently we plan to crea=
te a wistron specific ipmi-oem command that we need to create a &#8220;&#82=
21;wistron-ipmi-oem&#8221; repository on github.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:16.0pt;font-=
family:&quot;Arial&quot;,sans-serif;color:#004080">Could you please help us=
 in this part of creating a &quot;wistron-ipmi-oem&quot; repository?<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:16.0pt;font-=
family:&quot;Arial&quot;,sans-serif;color:#004080">Thanks!<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:16.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:16.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:16.0pt;font-=
family:&quot;Arial&quot;,sans-serif;color:#004080">Thanks again and best re=
gards,</span><span lang=3D"EN-US" style=3D"font-size:13.5pt;font-family:&qu=
ot;Arial&quot;,sans-serif;color:navy"><br>
</span><span lang=3D"EN-US" style=3D"font-size:16.0pt;font-family:&quot;Ari=
al&quot;,sans-serif;color:navy">Andy YF Wang</span><span lang=3D"EN-US" sty=
le=3D"font-size:16.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#0040=
80"><br>
Wistron Corporation</span><span lang=3D"EN-US" style=3D"font-size:16.0pt;fo=
nt-family:&quot;Arial&quot;,sans-serif"><br>
</span><span lang=3D"EN-US" style=3D"font-size:16.0pt"><img width=3D"99" he=
ight=3D"30" style=3D"width:1.0312in;height:.3125in" id=3D"_x0000_i1025" src=
=3D"cid:image001.png@01D5E328.542AB660"></span><span lang=3D"EN-US" style=
=3D"font-size:16.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#004080=
"><br>
BMC Software Engineer<br>
Tel: (&#43;886)8501-4278</span><span lang=3D"EN-US" style=3D"color:#1F497D"=
><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:16.0pt"><o:p=
>&nbsp;</o:p></span></p>
</div>

<p><span style=3D"font-family:'Calibri';font-size:11pt; color:#000000;"><b>=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------</b></span></p>
<p><span style=3D"font-family:'Calibri';font-size:11pt; color:#000000;"><b>=
This email contains confidential or legally privileged information and is f=
or the sole use of its intended recipient. </b></span></p>
<p><span style=3D"font-family:'Calibri';font-size:11pt; color:#000000;"><b>=
Any unauthorized review, use, copying or distribution of this email or the =
content of this email is strictly prohibited.</b></span></p>
<p><span style=3D"font-family:'Calibri';font-size:11pt; color:#000000;"><b>=
If you are not the intended recipient, you may reply to the sender and shou=
ld delete this e-mail immediately.</b></span></p>
<p><span style=3D"font-family:'Calibri';font-size:11pt; color:#000000;"><b>=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------</b></span></p></body>
</html>

--_000_8cd0d174812a4c1da31ce8f9e8670caewistroncom_--

--_004_8cd0d174812a4c1da31ce8f9e8670caewistroncom_
Content-Type: image/png; name="image001.png"
Content-Description: image001.png
Content-Disposition: inline; filename="image001.png"; size=7533; 
    creation-date="Fri, 14 Feb 2020 03:35:22 GMT"; 
    modification-date="Fri, 14 Feb 2020 03:35:22 GMT"
Content-ID: <image001.png@01D5E328.542AB660>
Content-Transfer-Encoding: base64

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
AElFTkSuQmCC

--_004_8cd0d174812a4c1da31ce8f9e8670caewistroncom_--
