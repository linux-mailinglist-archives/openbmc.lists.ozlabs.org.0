Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DD723DA637
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 09:17:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46v0qT2qpnzDr95
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 18:17:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=lenovo.com (client-ip=67.219.250.115;
 helo=mail1.bemta24.messagelabs.com; envelope-from=liuyh21@lenovo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46v0pn0ZszzDqgP
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 18:17:03 +1100 (AEDT)
Received: from [67.219.250.198] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-b.us-west-2.aws.symcld.net id 87/A3-25696-C6518AD5;
 Thu, 17 Oct 2019 07:17:00 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPKsWRWlGSWpSXmKPExsWS8eIhr26O6Ip
 Yg62zuS1m7H3AbLH05hU2i1MtL1gcmD1ub29i91iwqdTj/IyFjAHMUayZeUn5FQmsGfM/b2Ut
 uCZZ8ftcI2MD4ybxLkYuDiGB/4wSBw/OYoVwXjJKvGmbxwTh7GGUuPHiGksXIwcHm4C2xPT9q
 V2MnBwiAroS15pbGEHCzALJEhMXVIKYwgI6Ev+eZEBUGEq8b/rIBGHrSew4Mp8RxGYRUJV4ee
 4oWJxXwFLi3P69YDajgKzEtEf3wWxmAXGJudNAzuHkkBAQkFiy5zwzhC0q8fLxP6i4gsSMt1u
 g6hMkrizcxg4xU1Di5MwnLBMYhWYhGTULSdksJGUQcR2JBbs/sUHY2hLLFr5mhrHPHHjMhCy+
 gJF9FaNFUlFmekZJbmJmjq6hgYGuoaGRrqGxia6hiZFeYpVukl5psW55anGJLpBbXqxXXJmbn
 JOil5dasokRGHMpBW19Oxgvznqjd4hRkoNJSZT387rlsUJ8SfkplRmJxRnxRaU5qcWHGGU4OJ
 QkeB8Ir4gVEixKTU+tSMvMAcY/TFqCg0dJhFdIBCjNW1yQmFucmQ6ROsVozzHh5dxFzBwHj84
 Dkh9XLQGS30GkEEtefl6qlDjvP5CpAiBtGaV5cENh6eoSo6yUMC8jAwODEE9BalFuZgmq/CtG
 cQ5GJWFeU5DlPJl5JXC7XwGdxQR01nvl5SBnlSQipKQamLpSPyqJJk4XdKq+uvyeSolTjkyFi
 vJfhfA1fdGeXIJN8/NZxE6f3xKXYjbD6c39qYtu3K80nub0ubjsRORV98rUnQfLXs7WmqXeIz
 jV0e7v/lMs+74G8Nk/5k2o0GV/yn88/cv/Cf8FNv6c4PvLPIMnx9pLcfmpg6IqbAmd+7cueJR
 mcnPBg/iQAI5g+78OZVsFZN8luMZf2FsqIpYWujHz2Yf1Mg6M5UU8J3aFN2w08U7nXsi7eaOx
 dlZz34c5EVvqk5ffU1W22cL20Y/9vS97+ARJlZLgOta/E0LYc3fdYgvctM3l2Z2JLX7Xr+6R0
 LM2qFm+48fdZTf4Y2S75eY73tgleXrHBImq99NjlFiKMxINtZiLihMBa+l6WtIDAAA=
X-Env-Sender: liuyh21@lenovo.com
X-Msg-Ref: server-2.tower-346.messagelabs.com!1571296619!86611!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31714 invoked from network); 17 Oct 2019 07:17:00 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.13)
 by server-2.tower-346.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Oct 2019 07:17:00 -0000
Received: from pekwpmail06.lenovo.com (unknown [10.96.93.84])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id DD1648F93A1A9538393F;
 Thu, 17 Oct 2019 03:16:57 -0400 (EDT)
Received: from pekwpmail05.lenovo.com (10.96.93.83) by pekwpmail06.lenovo.com
 (10.96.93.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 17 Oct
 2019 15:16:55 +0800
Received: from pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf]) by
 pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf%7]) with mapi id
 15.01.1591.008; Thu, 17 Oct 2019 15:16:55 +0800
From: Yonghui YH21 Liu <liuyh21@lenovo.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Lenvo IPMI OEM in openbmc Community
Thread-Topic: Lenvo IPMI OEM in openbmc Community
Thread-Index: AdWEubyY9TnTQB25RuOFWcAeRb/jlw==
Date: Thu, 17 Oct 2019 07:16:55 +0000
Message-ID: <34e9db59f8064625a90b4021de1e54dd@lenovo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.96.12.251]
Content-Type: multipart/alternative;
 boundary="_000_34e9db59f8064625a90b4021de1e54ddlenovocom_"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_34e9db59f8064625a90b4021de1e54ddlenovocom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

HI Brad,
         Now we are implementing some lenovo OEM commands based on below pr=
ojects, could you help create lenovo-ipmi-oem repository for us?
         https://github.com/openbmc/openbmc/tree/master/meta-lenovo

Thanks


--_000_34e9db59f8064625a90b4021de1e54ddlenovocom_
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
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
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
<body lang=3D"ZH-CN" link=3D"blue" vlink=3D"purple" style=3D"text-justify-t=
rim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">HI Brad,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; Now we are implementing some lenovo OEM commands based on=
 below projects, could you help create lenovo-ipmi-oem repository for us?<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; <a href=3D"https://github.com/openbmc/openbmc/tree/master=
/meta-lenovo">
https://github.com/openbmc/openbmc/tree/master/meta-lenovo</a><o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_34e9db59f8064625a90b4021de1e54ddlenovocom_--
