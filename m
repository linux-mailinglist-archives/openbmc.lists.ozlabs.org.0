Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A4B670FF
	for <lists+openbmc@lfdr.de>; Fri, 12 Jul 2019 16:08:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lZX03ZjZzDqws
	for <lists+openbmc@lfdr.de>; Sat, 13 Jul 2019 00:08:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.250.211; helo=mail1.bemta24.messagelabs.com;
 envelope-from=hsung1@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lZVk1kBtzDqj1
 for <openbmc@lists.ozlabs.org>; Sat, 13 Jul 2019 00:07:01 +1000 (AEST)
Received: from [67.219.251.54] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-c.us-west-2.aws.symcld.net id 16/9E-14738-204982D5;
 Fri, 12 Jul 2019 14:06:58 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAKsWRWlGSWpSXmKPExsWS8eIhjy7TFI1
 Yg76HyhanWl6wODB6nJ+xkDGAMYo1My8pvyKBNWPJ6xXsBb8VKo63H2RuYJwq18XIxSEkMJ9J
 YvueHWwQzmtGiWW7ZjJDOPsYJaZt38bUxcjJwSagKrHl2RMWEFtEwFJiyYN2sA5mgWuMEkdWt
 7F3MXJwCAuoSXT/MIeo0ZboOHKeGcLWk5jxdDvYHBagObd27WAFsXmB5nxqnQoWZxSQlXiy4B
 mYzSwgLnHuYis7iC0hICCxZA/EHAkBUYmXj/+xQtgKEs17XrNA1CdIPJl6hx1ipqDEyZlPWCY
 wCs1CMmoWkrJZSMog4joSC3Z/YoOwtSWWLXzNDGOfOfCYCVl8ASP7KkbzpKLM9IyS3MTMHF1D
 AwNdQ0MjXUNjM11Lc73EKt1kvdJi3fLU4hJdI73E8mK94src5JwUvbzUkk2MwIhKKehI3MF4b
 tYbvUOMkhxMSqK8k/nUY4X4kvJTKjMSizPii0pzUosPMcpwcChJ8PpM0ogVEixKTU+tSMvMAU
 Y3TFqCg0dJhHcrSJq3uCAxtzgzHSJ1ijGQY8LLuYuYOd4unwckDx4Fke9+LgaSx5qWAMmPq0D
 kdxApxJKXn5cqJc67E2SQAMigjNI8uDWwhHWJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDE
 OTyZeSVw17wCOpQJ6FBVPzWQQ0sSEVJSDUwRevJNz+e8eHtr3nyG5Cd30yxP312bOPfElJ//u
 fp3pMoY94n3MX+rKL0ZuV5kf0Juss6iA/wvNsSuELK6cUO4SCFfv6Jze+etw9uCCu/NzG7LMm
 Z8rKDGdPuISdiOnqavJUz3ngiGPXFYrvWkTUlSuLBwxYMsw2R55dplf2XlOR3tskx/Sc9aumX
 tPf3oBQG/8pfopt9hN4vySDglEf/89ddLTnuKFSdc9jHu0Gw9IiKTEi4goCyqfrWjtW+ytlKx
 691iZUWZamUm69jNU64cuLaZ85HbhYNTNYXUzq+RVIla1P9ksg7LRe1D95deuTHVSyP5jlHLo
 veatpYaaZujz+Ry/mt3Cxa/c9fZTYmlOCPRUIu5qDgRAFh2gizTAwAA
X-Env-Sender: hsung1@lenovo.com
X-Msg-Ref: server-22.tower-366.messagelabs.com!1562940417!1250213!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7432 invoked from network); 12 Jul 2019 14:06:58 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.12)
 by server-22.tower-366.messagelabs.com with DHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Jul 2019 14:06:58 -0000
Received: from HKGWPEMAIL03.lenovo.com (unknown [10.128.3.71])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id E7E2BBA82FB4DB83DB80
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jul 2019 10:06:56 -0400 (EDT)
Received: from HKGWPEMAIL03.lenovo.com (10.128.3.71) by
 HKGWPEMAIL03.lenovo.com (10.128.3.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1591.10; Fri, 12 Jul 2019 22:06:55 +0800
Received: from HKGWPEMAIL03.lenovo.com ([fe80::6151:c7db:16ab:b903]) by
 HKGWPEMAIL03.lenovo.com ([fe80::6151:c7db:16ab:b903%6]) with mapi id
 15.01.1591.008; Fri, 12 Jul 2019 22:06:55 +0800
From: Harry Sung1 <hsung1@lenovo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: IPMI Add SEL command question
Thread-Topic: IPMI Add SEL command question
Thread-Index: AdU4uMvMWhIeoVW+TYGoNELS14s8bw==
Date: Fri, 12 Jul 2019 14:06:54 +0000
Message-ID: <626c8a30d1674c71bfb4d4995dde4ca8@lenovo.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.128.115.1]
Content-Type: multipart/alternative;
 boundary="_000_626c8a30d1674c71bfb4d4995dde4ca8lenovocom_"
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
Cc: Derek Lin23 <dlin23@lenovo.com>, Duke KH Du <dukh@lenovo.com>,
 Andrew MS1 Peng <pengms1@lenovo.com>, Payne Yang <pyang4@lenovo.com>,
 Yonghui YH21 Liu <liuyh21@lenovo.com>, Lisa YJ19 Liu <liuyj19@lenovo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_626c8a30d1674c71bfb4d4995dde4ca8lenovocom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Team,

I have a question about Add SEL command.
This standard command seems not be implemented in "phosphor-host-ipmid".
(https://github.com/openbmc/phosphor-host-ipmid/blob/master/storagehandler.=
cpp#L605)

Though I found a patch set about it, but it doesn't be merged in master due=
 to some issues.
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/12951

Is anyone having any plans to implement it? Or other repository we can refe=
r to?

Thanks,
Harry

--_000_626c8a30d1674c71bfb4d4995dde4ca8lenovocom_
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Team,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I have a question about Add SEL=
 command. <o:p>
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">This standard command seems not=
 be implemented in &#8220;phosphor-host-ipmid&#8221;.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(<a href=3D"https://github.com/=
openbmc/phosphor-host-ipmid/blob/master/storagehandler.cpp#L605">https://gi=
thub.com/openbmc/phosphor-host-ipmid/blob/master/storagehandler.cpp#L605</a=
>)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Though I found a patch set abou=
t it, but it doesn&#8217;t be merged in master due to some issues.<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://gerrit.openb=
mc-project.xyz/c/openbmc/phosphor-host-ipmid/&#43;/12951">https://gerrit.op=
enbmc-project.xyz/c/openbmc/phosphor-host-ipmid/&#43;/12951</a><o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Is anyone having any plans to i=
mplement it? Or other repository we can refer to?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Harry<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_626c8a30d1674c71bfb4d4995dde4ca8lenovocom_--
