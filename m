Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F515EEDD4
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 08:22:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdNZC4Fgxz3c7t
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 16:22:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=zIY6F9C6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ti.com (client-ip=198.47.23.248; helo=lelv0143.ext.ti.com; envelope-from=spatton@ti.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=zIY6F9C6;
	dkim-atps=neutral
X-Greylist: delayed 874 seconds by postgrey-1.36 at boromir; Thu, 29 Sep 2022 16:21:37 AEST
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdNYF25c2z3c6q
	for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2022 16:21:35 +1000 (AEST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 28T66uFW107034
	for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2022 01:06:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1664431616;
	bh=7VylOBmIAGfOgM9/9SjuVdwubf3Xa9DpxAOWFTUrU04=;
	h=From:To:Subject:Date;
	b=zIY6F9C6WZ+XYtBbLnlvJYaZVa2T/cQzBt6D4eG9yOkvsEk3WXVf2ixGjVx3PlGOz
	 Fm1LrK8eTqQl8W8WVe355Clp+tzbchhYd3iEkcdgaJq6ACdT113m13xQHNmzV+kwIx
	 GpjzagFj14Klz/oP8td0y5DXcbpfTF7IoNEGJ+Eg=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 28T66uOs065057
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2022 01:06:56 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 29
 Sep 2022 01:06:56 -0500
Received: from DLEE102.ent.ti.com ([fe80::2cde:e57d:8075:c010]) by
 DLEE102.ent.ti.com ([fe80::2cde:e57d:8075:c010%17]) with mapi id
 15.01.2507.006; Thu, 29 Sep 2022 01:06:56 -0500
From: "Patton, Schuyler" <spatton@ti.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: ipmitool reading i2c devices
Thread-Topic: ipmitool reading i2c devices
Thread-Index: AdjTyIvw5AQl0I/+RQy/GsbYbFlRZQ==
Date: Thu, 29 Sep 2022 06:06:55 +0000
Message-ID: <ddf0d5f853c443e285b986581b01bd75@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.249.36.49]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: multipart/alternative;
	boundary="_000_ddf0d5f853c443e285b986581b01bd75ticom_"
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

--_000_ddf0d5f853c443e285b986581b01bd75ticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,
I am trying to use an ipmitool running on a Linux PC and trying to read the=
 i2c bus on a board running openbmc. This is the command I am using:
Ipmitool -v -I lanplus -H <ip address> -C 17 -U root -P 0penBmc i2c bus=3D1=
 0x40 2

Looking at the apphandler.cpp code I see that a white list is required. I a=
dded one based on the format described in the cpp source file. This is the =
error I am seeing:

I2C Master Write-Read command failed: Invalid command.

Othe ipmitool commands work such as bmc info.  Is there additional config t=
hat I need to do to be able to read a device on an I2C bus?

Thanks and Regards,
Schuyler Patton


--_000_ddf0d5f853c443e285b986581b01bd75ticom_
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
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
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
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal">I am trying to use an ipmitool running on a Linux PC=
 and trying to read the i2c bus on a board running openbmc. This is the com=
mand I am using:<o:p></o:p></p>
<p class=3D"MsoNormal">Ipmitool -v -I lanplus -H &lt;ip address&gt; -C 17 -=
U root -P 0penBmc i2c bus=3D1 0x40 2<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Looking at the apphandler.cpp code I see that a whit=
e list is required. I added one based on the format described in the cpp so=
urce file. This is the error I am seeing:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I2C Master Write-Read command failed: Invalid comman=
d.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Othe ipmitool commands work such as bmc info. &nbsp;=
Is there additional config that I need to do to be able to read a device on=
 an I2C bus?
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:black">Thanks and Regards,<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">Schuyler Patton<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_ddf0d5f853c443e285b986581b01bd75ticom_--
