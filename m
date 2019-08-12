Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF69A4CD6
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 02:36:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MB3Y0bM0zDqQr
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 10:36:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.246.209; helo=mail1.bemta23.messagelabs.com;
 envelope-from=liuyh21@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466cWZ2D7TzDqVd
 for <openbmc@lists.ozlabs.org>; Mon, 12 Aug 2019 23:43:49 +1000 (AEST)
Received: from [67.219.247.54] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-d.us-east-1.aws.symcld.net id 44/03-22799-11D615D5;
 Mon, 12 Aug 2019 13:43:45 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFKsWRWlGSWpSXmKPExsWS8eIhj65gbmC
 swcXpchanWl6wODB6nJ+xkDGAMYo1My8pvyKBNePc8TssBdvVK66/6GZrYPyo3MXIxSEksIRJ
 4lr3bhYIZw2jxNeL3ewQzmtGicmvnkFl9jBKtD1bA5Th4GAT0JaYvj+1i5GTQ0RAX2LXpN1sI
 LawgIZE4952Roi4rsTjw5eYQMpFBPQkWvaClbMIqEq8OHiSGSTMK2ApMWl+CEiYUUBWYtqj+0
 wgNrOAuMTcabNYQWwJAQGJJXvOM0PYohIvH/+DiitItF9qZoWoT5BYOWUDO4jNKyAocXLmE5Y
 JjEKzkIyahaRsFpIyiLiOxILdn9ggbG2JZQtfM8PYZw48ZkIWX8DIvorRNKkoMz2jJDcxM0fX
 0MBA19DQSNdS19hIL7FKN0WvtFg3NbG4RNdQL7G8WK+4Mjc5J0UvL7VkEyMwklIKOBV2MPYdf
 a13iFGSg0lJlLcoNjBWiC8pP6UyI7E4I76oNCe1+BCjDAeHkgQvfxZQTrAoNT21Ii0zBxjVMG
 kJDh4lEd49IGne4oLE3OLMdIjUKUZ7jgkv5y5i5jh4dB6Q/LhqCZD8DiKFWPLy81KlxHl/gbQ
 JgLRllObBDYUloUuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHnfZQJN4cnMK4Hb/QroLCag
 s7if+IKcVZKIkJJqYApu3aPidXYad8OLq9nLmn1O8Tv/WZPQKhDEc2nOf95gN7+amIpd3tNd6
 spf2rb+EL00o9pWeKJi6TuerL4Y55s3gup/brySczu/5Yynm299xj6mzan7ljT5hkz7PJ3tyc
 3nYrMkZs7j//SXWXeOMfO82IDV9lXtT9nYF3HEm/il6H49LfSyOFPONVvSY63mfefaR5+Ezr1
 S0qk815Wz6FvDt/Iz7UmuP+o0fHjD+Te+zwi/2ntJgjfp9u/HuwJCP/3bECTRZxY/9c2UXnbb
 uwJ+53IDPF+3/1onH9Qruaf29eNV7z/vczOuVTu/ZF7N4yyeRz8XiVySmTL/UeICNi+Rx90n3
 W/YvvYPb87Zo8RSnJFoqMVcVJwIADaS8dS9AwAA
X-Env-Sender: liuyh21@lenovo.com
X-Msg-Ref: server-7.tower-426.messagelabs.com!1565617425!846336!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18605 invoked from network); 12 Aug 2019 13:43:45 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.12)
 by server-7.tower-426.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Aug 2019 13:43:45 -0000
Received: from CNMAILEX02.lenovo.com (unknown [10.96.80.2])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 85084FC58EA5FA84178D
 for <openbmc@lists.ozlabs.org>; Mon, 12 Aug 2019 09:43:44 -0400 (EDT)
Received: from pekwpmail08.lenovo.com (10.96.81.160) by CNMAILEX02.lenovo.com
 (10.96.80.2) with Microsoft SMTP Server (TLS) id 14.3.408.0;
 Mon, 12 Aug 2019 21:43:42 +0800
Received: from pekwpmail05.lenovo.com (10.96.81.230) by pekwpmail08.lenovo.com
 (10.96.81.160) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 12 Aug
 2019 21:43:41 +0800
Received: from pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf]) by
 pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf%7]) with mapi id
 15.01.1591.008; Mon, 12 Aug 2019 21:43:41 +0800
From: Yonghui YH21 Liu <liuyh21@lenovo.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: OpenBMC Solution To CVE Issues 
Thread-Topic: OpenBMC Solution To CVE Issues 
Thread-Index: AdVRE/KzcTyajXJdTUq73lo1GoCtCQ==
Date: Mon, 12 Aug 2019 13:43:41 +0000
Message-ID: <599ab89a2cad4cd4bb8e80cf43db38d1@lenovo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.96.12.253]
Content-Type: multipart/alternative;
 boundary="_000_599ab89a2cad4cd4bb8e80cf43db38d1lenovocom_"
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Sep 2019 10:34:52 +1000
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

--_000_599ab89a2cad4cd4bb8e80cf43db38d1lenovocom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

HI All,
         I saw there are some solutions to public CVE issues, some solution=
 are not enable by default setting.
         As we know, there are some new coming CVE issues. Could you help c=
onfirm whether below issues will be fixed? Is yes, when will be ready?

         CVE-2019-12900
CVE-2018-20843
CVE-2019-9169
CVE-2018-20750
CVE-2019-13404


Thank your great support in advance!

Thanks



--_000_599ab89a2cad4cd4bb8e80cf43db38d1lenovocom_
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
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
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
<body lang=3D"ZH-CN" link=3D"blue" vlink=3D"purple" style=3D"text-justify-t=
rim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">HI All,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; I saw there are some solutions to public CVE issues, some=
 solution are not enable by default setting.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; As we know, there are some new coming CVE issues. Could y=
ou help confirm whether below issues will be fixed? Is yes, when will be re=
ady?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; CVE-2019-12900<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US">CV=
E-2018-20843<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US">CV=
E-2019-9169<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US">CV=
E-2018-20750<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US">CV=
E-2019-13404<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US" st=
yle=3D"font-size:11.0pt;font-family:DengXian;color:black"><o:p>&nbsp;</o:p>=
</span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US" st=
yle=3D"font-size:11.0pt;font-family:DengXian;color:black"><o:p>&nbsp;</o:p>=
</span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US" st=
yle=3D"font-size:11.0pt;font-family:DengXian;color:black">Thank your great =
support in advance!<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US" st=
yle=3D"font-size:11.0pt;font-family:DengXian;color:black"><o:p>&nbsp;</o:p>=
</span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US" st=
yle=3D"font-size:11.0pt;font-family:DengXian;color:black">Thanks<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US" st=
yle=3D"font-size:11.0pt;font-family:DengXian;color:black"><o:p>&nbsp;</o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_599ab89a2cad4cd4bb8e80cf43db38d1lenovocom_--
