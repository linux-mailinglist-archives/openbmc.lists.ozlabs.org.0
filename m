Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4825B242E7E
	for <lists+openbmc@lfdr.de>; Wed, 12 Aug 2020 20:28:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRdW82jGczDqcL
	for <lists+openbmc@lfdr.de>; Thu, 13 Aug 2020 04:28:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=tachyum.com (client-ip=66.160.133.170; helo=mail.tachyum.com;
 envelope-from=molejar@tachyum.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tachyum.com
X-Greylist: delayed 481 seconds by postgrey-1.36 at bilbo;
 Thu, 13 Aug 2020 04:27:39 AEST
Received: from mail.tachyum.com (mx1.tachyum.com [66.160.133.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRdV36XQRzDqYj
 for <openbmc@lists.ozlabs.org>; Thu, 13 Aug 2020 04:27:39 +1000 (AEST)
Received: by mail.tachyum.com (Postfix, from userid 1001)
 id C92A38B4; Wed, 12 Aug 2020 11:19:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on mx1.tachyum.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,HTML_MESSAGE
 autolearn=ham autolearn_force=no version=3.4.0
Received: from THQ-EX2016.tachyum.com (unknown [10.7.1.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.tachyum.com (Postfix) with ESMTPS id 271A6245
 for <openbmc@lists.ozlabs.org>; Wed, 12 Aug 2020 11:19:34 -0700 (PDT)
Received: from THQ-EX3.tachyum.com (10.7.1.26) by THQ-EX2016.tachyum.com
 (10.7.1.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Wed, 12 Aug
 2020 11:19:33 -0700
Received: from THQ-EX2016.tachyum.com (10.7.1.16) by THQ-EX3.tachyum.com
 (10.7.1.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Wed, 12 Aug
 2020 11:19:33 -0700
Received: from THQ-EX2016.tachyum.com ([10.7.1.16]) by THQ-EX2016.tachyum.com
 ([10.7.1.16]) with mapi id 15.01.1913.010;
 Wed, 12 Aug 2020 11:19:33 -0700
From: Martin Olejar <molejar@tachyum.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: How to boot OpenBMC (AST2600) from SD Card?
Thread-Topic: How to boot OpenBMC (AST2600) from SD Card?
Thread-Index: AdZw1R//j80Wud1fSSeqcGptCVs1Wg==
Date: Wed, 12 Aug 2020 18:19:33 +0000
Message-ID: <eeeaaa21f1c34adba9047a3efb8aa66c@tachyum.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.40.108.124]
Content-Type: multipart/alternative;
 boundary="_000_eeeaaa21f1c34adba9047a3efb8aa66ctachyumcom_"
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

--_000_eeeaaa21f1c34adba9047a3efb8aa66ctachyumcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

Is there an option to boot AST2600 only from SD card?
The meta-aspeed has option for generate eMMC image https://github.com/openb=
mc/openbmc/tree/master/meta-aspeed/wic, is it the same as SD card. The eMMC=
 periphery is supporting SD/SDIO protocols and 4bit mode, but is it the def=
ault setting after power on reset? Or the boot is starting with FWSPI, and =
in second stage it switch to eMMC/SD?

Thanks

Martn Olejar

--_000_eeeaaa21f1c34adba9047a3efb8aa66ctachyumcom_
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
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is there an option to boot AST2600 only from SD card=
? <o:p></o:p></p>
<p class=3D"MsoNormal">The meta-aspeed has option for generate eMMC image <=
a href=3D"https://github.com/openbmc/openbmc/tree/master/meta-aspeed/wic">
https://github.com/openbmc/openbmc/tree/master/meta-aspeed/wic</a>, is it t=
he same as SD card. The eMMC periphery is supporting SD/SDIO protocols and =
4bit mode, but is it the default setting after power on reset? Or the boot =
is starting with FWSPI, and in second
 stage it switch to eMMC/SD?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-AU" style=3D"font-size:10.0pt;fo=
nt-family:&quot;Tahoma&quot;,sans-serif;color:black">Martn Olejar</span></b=
><o:p></o:p></p>
</div>
</body>
</html>

--_000_eeeaaa21f1c34adba9047a3efb8aa66ctachyumcom_--
