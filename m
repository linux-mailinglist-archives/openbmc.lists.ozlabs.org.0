Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B20A1A30AF
	for <lists+openbmc@lfdr.de>; Thu,  9 Apr 2020 10:12:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yYll5SntzDrCN
	for <lists+openbmc@lfdr.de>; Thu,  9 Apr 2020 18:12:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=zhaoxin.com (client-ip=203.148.12.82; helo=zxshcas2.zhaoxin.com;
 envelope-from=tigerliu@zhaoxin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=zhaoxin.com
X-Greylist: delayed 921 seconds by postgrey-1.36 at bilbo;
 Thu, 09 Apr 2020 18:11:43 AEST
Received: from ZXSHCAS2.zhaoxin.com (unknown [203.148.12.82])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yYl30mnBzDrB4
 for <openbmc@lists.ozlabs.org>; Thu,  9 Apr 2020 18:11:32 +1000 (AEST)
Received: from zxbjmbx1.zhaoxin.com (10.29.252.163) by ZXSHCAS2.zhaoxin.com
 (10.28.252.162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1261.35; Thu, 9 Apr
 2020 15:56:09 +0800
Received: from zxbjmbx2.zhaoxin.com (10.29.252.164) by zxbjmbx1.zhaoxin.com
 (10.29.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1261.35; Thu, 9 Apr
 2020 15:56:08 +0800
Received: from zxbjmbx2.zhaoxin.com ([fe80::4d77:9dba:64a8:8ec3]) by
 zxbjmbx2.zhaoxin.com ([fe80::4d77:9dba:64a8:8ec3%4]) with mapi id
 15.01.1261.035; Thu, 9 Apr 2020 15:56:08 +0800
From: "Tiger Liu(BJ-RD)" <TigerLiu@zhaoxin.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: OpenBMC : KVM over IP and media redirection function
Thread-Topic: OpenBMC : KVM over IP and media redirection function
Thread-Index: AdYOQ9GAmQuksx5zT0mO9/AFvvAtXQ==
Date: Thu, 9 Apr 2020 07:56:08 +0000
Message-ID: <b75bce785fbc4bad8c053ed2261102c2@zhaoxin.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [210.12.195.129]
Content-Type: multipart/alternative;
 boundary="_000_b75bce785fbc4bad8c053ed2261102c2zhaoxincom_"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_b75bce785fbc4bad8c053ed2261102c2zhaoxincom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, experts:
I have a question about KVM over IP and media redirection function.
Intel provided a RMM lite component, which provided KVM/Media redirection c=
apability.

So my question is:

1.      OpenBMC + AST2500 Chip, could not implement KVM/Media redirection c=
apability?

2.      If wanting to use KVM/Media redirection ,must buy a RMM component?

I found OpenBMC had implemented KVM over IP capability.

Thanks


?????
?????????????????????????????????????????????????????
CONFIDENTIAL NOTE:
This email contains confidential or legally privileged information and is f=
or the sole use of its intended recipient. Any unauthorized review, use, co=
pying or forwarding of this email or the content of this email is strictly =
prohibited.

--_000_b75bce785fbc4bad8c053ed2261102c2zhaoxincom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:\7B49\7EBF;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@\7B49\7EBF";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:\7B49\7EBF;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	text-indent:21.0pt;
	font-size:10.5pt;
	font-family:\7B49\7EBF;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:\7B49\7EBF;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:\7B49\7EBF;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:842476273;
	mso-list-type:hybrid;
	mso-list-template-ids:-776993466 -575797284 67698713 67698715 67698703 676=
98713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:18.0pt;
	text-indent:-18.0pt;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-text:"%2\)";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:42.0pt;
	text-indent:-21.0pt;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:63.0pt;
	text-indent:-21.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:84.0pt;
	text-indent:-21.0pt;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-text:"%5\)";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:105.0pt;
	text-indent:-21.0pt;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:126.0pt;
	text-indent:-21.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:147.0pt;
	text-indent:-21.0pt;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-text:"%8\)";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:168.0pt;
	text-indent:-21.0pt;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:189.0pt;
	text-indent:-21.0pt;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi, experts:<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I have a question about KVM ove=
r IP and media redirection function.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Intel provided a RMM lite compo=
nent, which provided KVM/Media redirection capability.<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">So my question is:<o:p></o:p></=
span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:18.0pt;text-indent:-18.0=
pt;mso-list:l0 level1 lfo1">
<![if !supportLists]><span lang=3D"EN-US"><span style=3D"mso-list:Ignore">1=
.<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US">OpenBMC &#43; AST2500 C=
hip, could not implement KVM/Media redirection capability?<o:p></o:p></span=
></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:18.0pt;text-indent:-18.0=
pt;mso-list:l0 level1 lfo1">
<![if !supportLists]><span lang=3D"EN-US"><span style=3D"mso-list:Ignore">2=
.<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US">If wanting to use KVM/M=
edia redirection ,must buy a RMM component?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I found OpenBMC had implemented=
 KVM over IP capability.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks<o:p></o:p></span></p>
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

--_000_b75bce785fbc4bad8c053ed2261102c2zhaoxincom_--
