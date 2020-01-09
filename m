Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A3543135423
	for <lists+openbmc@lfdr.de>; Thu,  9 Jan 2020 09:13:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tf4d6SyyzDqDq
	for <lists+openbmc@lfdr.de>; Thu,  9 Jan 2020 19:13:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=lenovo.com (client-ip=67.219.246.116;
 helo=mail1.bemta23.messagelabs.com; envelope-from=pyang4@lenovo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.116])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tf3l1z1MzDqBZ
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jan 2020 19:12:15 +1100 (AEDT)
Received: from [67.219.247.64] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-c.us-east-1.aws.symcld.net id 51/B9-04350-C50E61E5;
 Thu, 09 Jan 2020 08:12:12 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCKsWRWlGSWpSXmKPExsWS8eIhj27MA7E
 4g56LHBanWl6wODB6nJ+xkDGAMYo1My8pvyKBNWPpul1sBVslKtpndzE1MM4R62Lk5BASmM8k
 cftIYRcjF5D9klFi7tePjBCJvYwSf/cJgNhsAioSc5buYAGxRQQsJZY8aGcDsYUF5CV+XO5kh
 YirSLQs2M0GYetJdB5ZAxZnAYp/PQdSz8HBC9TbsFYDJMwoICbx/dQaJhCbWUBc4tzFVnYQW0
 JAQGLJnvPMELaoxMvH/1ghbAWJ5j2vWSDqEyQer34K1ssrIChxcuYTlgmMgrOQjJqFpGwWkjK
 IuI7Egt2f2CBsbYllC18zw9hnDjxmQhZfwMi+itEsqSgzPaMkNzEzR9fQwEDX0NBI11zX0MJE
 L7FKN1mvtFg3NbG4RNdQL7G8WK+4Mjc5J0UvL7VkEyMwYlIK2HfsYPz49a3eIUZJDiYlUd5ZM
 8TihPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwXrkMlBMsSk1PrUjLzAFGL0xagoNHSYT33j2gNG
 9xQWJucWY6ROoUoyvHhJdzFzFzHDw6D0h+XLUESH4Hk5vnLl3ELMSSl5+XKiXOK3YXqFkApDm
 jNA9uNCzxXGKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzFt2H2gKT2ZeCdwFr4COYwI67s4d
 UZDjShIRUlINTEufsonkGfbuXJG8o7R+cWrwL9kOzeQoY3W7rtAv8xUm2XG+nK97Vm76I989x
 ql7pMRPzj8d/ezg2+jKzK4FOWae/w8ImGZs5btsMZ1jfnPUdBEDz6/Tn8SvZVm/YpUo56Ufe4
 25Vxm53DZ0nP46Zu7hh3vyTyluq7Pl8N08N4Ituf7x8t7cne2rHmjvsXEMCYv4WPzilnu92YU
 vd+J4tlWwMW25u9kiYYaFz+3o+Y/2cLla52sv0NWYrPDa3fcQz56MdN+9Aqu7pNic+T+q7fhp
 J3rUtnPH209Hzm7mE3696aeqCevi7cekNh8wjV5axH3V/z1f01buuY87eD/O2r9ax9Jxhqblp
 jNVNj938iixFGckGmoxFxUnAgC0u65jtwMAAA==
X-Env-Sender: pyang4@lenovo.com
X-Msg-Ref: server-4.tower-416.messagelabs.com!1578557531!1582360!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9817 invoked from network); 9 Jan 2020 08:12:12 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.12)
 by server-4.tower-416.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Jan 2020 08:12:12 -0000
Received: from HKGWPEMAIL01.lenovo.com (unknown [10.128.3.69])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 8A17CD4FF26E7D757BD3
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jan 2020 03:12:11 -0500 (EST)
Received: from HKGWPEMAIL04.lenovo.com (10.128.3.72) by
 HKGWPEMAIL01.lenovo.com (10.128.3.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1779.2; Thu, 9 Jan 2020 16:12:08 +0800
Received: from HKGWPEMAIL04.lenovo.com ([fe80::f1ef:1ffe:9927:6613]) by
 HKGWPEMAIL04.lenovo.com ([fe80::f1ef:1ffe:9927:6613%5]) with mapi id
 15.01.1779.002; Thu, 9 Jan 2020 16:12:08 +0800
From: Payne Yang <pyang4@lenovo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Mulit-platform feature
Thread-Topic: Mulit-platform feature
Thread-Index: AdXGxCFbMM9aPJPtSemFhZM9wkpXiA==
Date: Thu, 9 Jan 2020 08:12:08 +0000
Message-ID: <1fb78d4aa9394cf092194b57427251f3@lenovo.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.128.115.1]
Content-Type: multipart/alternative;
 boundary="_000_1fb78d4aa9394cf092194b57427251f3lenovocom_"
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

--_000_1fb78d4aa9394cf092194b57427251f3lenovocom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Team,

Is there a plan to support mulit-platform feature on OpenBMC in future ?
Multi-platform means 1 BMC image could support multiple platform but only s=
ingle platform.

Best Regards,
Payne


--_000_1fb78d4aa9394cf092194b57427251f3lenovocom_
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
	{font-family:\65B0\7D30\660E\9AD4;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@\65B0\7D30\660E\9AD4";
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Is there a plan to support muli=
t-platform feature on OpenBMC in future ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Multi-platform means 1 BMC imag=
e could support multiple platform but only single platform.<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best Regards,<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Payne<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_1fb78d4aa9394cf092194b57427251f3lenovocom_--
