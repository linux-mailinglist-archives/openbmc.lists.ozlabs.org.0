Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EC06BB49
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2019 13:21:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pZbQ0hyczDqLn
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2019 21:21:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.246.210; helo=mail1.bemta23.messagelabs.com;
 envelope-from=pengms1@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pZZl67XVzDqKD
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2019 21:21:01 +1000 (AEST)
Received: from [67.219.247.54] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-3.bemta.az-d.us-east-1.aws.symcld.net id DC/7C-10900-A940F2D5;
 Wed, 17 Jul 2019 11:20:58 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMKsWRWlGSWpSXmKPExsWSLveKTXcWi36
 sQWcLj8WplhcsDowe52csZAxgjGLNzEvKr0hgzehYmV1wQbHixjeHBsarcl2MXBxCAvOYJHZf
 /8QM4bxklLjztZcNwtnDKPHnzRGgDCcHm4CWxML/e5hAbBEBS4klD9rZQGxhAVOJf2ceM0LEr
 SQOtW5ig7D1JLZvuwFmswioSuy79I4FxOYF6r3Z9xusnlFAVmLao/tgM5kFxCXmTpvFCmJLCA
 hILNlznhnCFpV4+fgfVFxBYsbbLVD1CRI3zlxmhpgpKHFy5hOWCYyCs5CMmoWkbBaSMoi4jsS
 C3Z/YIGxtiWULXzPD2GcOPGZCFl/AyL6K0SSpKDM9oyQ3MTNH19DAQNfQ0EjXQtdSL7FKN0Wv
 tFg3NbG4RNdQL7G8WK+4Mjc5J0UvL7VkEyMwXlIKODh3MB6b9UbvEKMkB5OSKC8/MJKE+JLyU
 yozEosz4otKc1KLDzHKcHAoSfAaMAPlBItS01Mr0jJzgLELk5bg4FES4b3CBJTmLS5IzC3OTI
 dInWJ05Zjwcu4iZo6DR+cByY+rlgDJ72Dy9gYgKcSSl5+XKiXO+xFktgBIc0ZpHtxoWNq5xCg
 rJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYlwdkCk9mXgncBa+AjmMCOm6KpR7IcSWJCCmpBiaJ
 JW5v7IL4rCP+367uCOGNP7PlaKiz8vRK+w6bcNUF9vW+TWcq7PQ03GSiC4ou7dnUcyyL68uGW
 fwFXB4HNhjudDsZeCpFsrqEafbUAv918xoj/39m397yeNU3RfYNr2XOtQV+3yJ0c10Rj+22uN
 +vna7dU7bgv7FuWkfhu/55f+Z/N1ixbequ7Ycv7r2f8+RZ894FW5SldwnevH5nw3WJDXvUH5q
 sfFs8rfZ7f5mAVOp149bAmuCr++p6BV35s9WcuPSlfFMeVlmuP+4tVuP7ZFK91PZ9kzf/ZAxh
 bI333Ls775G33PrUArdda6XNUpI5oy7sZyzrlV5b+nICz7ow5piwZJEIlq19QvLeIUosxRmJh
 lrMRcWJAE34XFi2AwAA
X-Env-Sender: pengms1@lenovo.com
X-Msg-Ref: server-3.tower-426.messagelabs.com!1563362448!676835!1
X-Originating-IP: [103.30.234.6]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20439 invoked from network); 17 Jul 2019 11:20:57 -0000
Received: from unknown (HELO apsmtp.lenovo.com) (103.30.234.6)
 by server-3.tower-426.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Jul 2019 11:20:57 -0000
Received: from pekwpmail02.lenovo.com (unknown [10.96.93.80])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id C66B2DDC00546A3DA473
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2019 19:20:44 +0800 (CST)
Received: from pekwpmail05.lenovo.com (10.96.93.83) by pekwpmail02.lenovo.com
 (10.96.93.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 17 Jul
 2019 19:20:43 +0800
Received: from pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf]) by
 pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf%7]) with mapi id
 15.01.1591.008; Wed, 17 Jul 2019 19:20:43 +0800
From: Andrew MS1 Peng <pengms1@lenovo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: How can I do to remove some default package?
Thread-Topic: How can I do to remove some default package?
Thread-Index: AdU8kapw9FD1ZsBQT6OtCOdwoCqn7w==
Date: Wed, 17 Jul 2019 11:20:43 +0000
Message-ID: <06d5b8e1fac3401b9f8c0dd2bbdd56fb@lenovo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.96.12.251]
Content-Type: multipart/alternative;
 boundary="_000_06d5b8e1fac3401b9f8c0dd2bbdd56fblenovocom_"
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

--_000_06d5b8e1fac3401b9f8c0dd2bbdd56fblenovocom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Team,

How can I do to remove some default packages such as bmcweb and obmc-ikvm?
I try to use RDEPENDS_${PN}_remove to remove packages but the executable bi=
nary and service still exist in rootfs.
Could someone give me advice?

Thanks,
Andrew

--_000_06d5b8e1fac3401b9f8c0dd2bbdd56fblenovocom_
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
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@PMingLiU";
	panose-1:2 1 6 1 0 1 1 1 1 1;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
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
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:DengXian;
	color:#1F497D;}
span.EmailStyle20
	{mso-style-type:personal-compose;
	font-family:DengXian;
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
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black;mso-fareas=
t-language:ZH-TW">Hi Team,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black;mso-fareas=
t-language:ZH-TW"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"mso-fareast-language:Z=
H-TW">How can I do to remove some default packages such as bmcweb and obmc-=
ikvm?
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"mso-fareast-language:Z=
H-TW">I try to use
</span><em><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sa=
ns-serif;font-style:normal">RDEPENDS_${PN}_remove to remove packages but th=
e executable binary and service still exist in rootfs.<o:p></o:p></span></e=
m></p>
<p class=3D"MsoNormal"><em><span lang=3D"EN-US" style=3D"font-family:&quot;=
Calibri&quot;,sans-serif;font-style:normal">Could someone give me advice?</=
span></em><span lang=3D"EN-US" style=3D"mso-fareast-language:ZH-TW"><o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:DengXian;mso-fareast-language:ZH-TW"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black;mso-fareas=
t-language:ZH-TW">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black;mso-fareas=
t-language:ZH-TW">Andrew<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_06d5b8e1fac3401b9f8c0dd2bbdd56fblenovocom_--
