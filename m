Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F5D58DC9B
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 18:58:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2K592DXHz308B
	for <lists+openbmc@lfdr.de>; Wed, 10 Aug 2022 02:58:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=oJIsfvbF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ti.com (client-ip=198.47.19.142; helo=fllv0016.ext.ti.com; envelope-from=spatton@ti.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=oJIsfvbF;
	dkim-atps=neutral
X-Greylist: delayed 1212 seconds by postgrey-1.36 at boromir; Wed, 10 Aug 2022 02:57:39 AEST
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2K4g5knXz2ywN
	for <openbmc@lists.ozlabs.org>; Wed, 10 Aug 2022 02:57:37 +1000 (AEST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 279Gb5Gl076522
	for <openbmc@lists.ozlabs.org>; Tue, 9 Aug 2022 11:37:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1660063025;
	bh=fv+Ap/9xgX5ozieKhSWiSjC3SuNhAwdFmWqZo6ATHmE=;
	h=From:To:Subject:Date;
	b=oJIsfvbF169CNBkWoMXFtbE5cURjb2dVdsBGd7zPmq2hWd17vxhw6dLgp/pS11dYr
	 KxT45CZjYcciTWm4uoXaYWoHruDcfpvoCGyIEQowmt4dYrzvS3BPo926Wt/KNeI/IO
	 kTsNjqs3vpS42ykdxiGH00X8Vj7WhArLgL+oe/q8=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 279Gb5at059942
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openbmc@lists.ozlabs.org>; Tue, 9 Aug 2022 11:37:05 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 9
 Aug 2022 11:37:04 -0500
Received: from DLEE102.ent.ti.com ([fe80::2cde:e57d:8075:c010]) by
 DLEE102.ent.ti.com ([fe80::2cde:e57d:8075:c010%17]) with mapi id
 15.01.2308.014; Tue, 9 Aug 2022 11:37:04 -0500
From: "Patton, Schuyler" <spatton@ti.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Question on build initial release and getting a root file system for
 initial testing
Thread-Topic: Question on build initial release and getting a root file system
 for initial testing
Thread-Index: AdisDEjBuiT1TN+xS2udAv4ylv383A==
Date: Tue, 9 Aug 2022 16:37:04 +0000
Message-ID: <e30ac7a9b1dd40788f52cb36ed5e0a7f@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.249.36.176]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: multipart/alternative;
	boundary="_000_e30ac7a9b1dd40788f52cb36ed5e0a7fticom_"
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

--_000_e30ac7a9b1dd40788f52cb36ed5e0a7fticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I am looking for any recommendations someone might have on how to just buil=
d an initial root file system of openbmc on a platform new to openbmc. We h=
ave added machine name and our build is failing at trying to build fit imag=
es but believe everything has been built

Is there a recipe that will assemble just a tar file or ext4 image that has=
 all the bmc applications installed? I can add the kernel and modules indep=
endently if necessary.

Regards,
Schuyler Patton
Sitara MPU System Applications
Texas Instruments


--_000_e30ac7a9b1dd40788f52cb36ed5e0a7fticom_
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
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am looking for any recommendations someone might h=
ave on how to just build an initial root file system of openbmc on a platfo=
rm new to openbmc. We have added machine name and our build is failing at t=
rying to build fit images but believe
 everything has been built <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is there a recipe that will assemble just a tar file=
 or ext4 image that has all the bmc applications installed? I can add the k=
ernel and modules independently if necessary.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:black">Regards,<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:black">Schuyler Patton<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">Sitara MPU System Applic=
ations<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black">Texas Instruments<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_e30ac7a9b1dd40788f52cb36ed5e0a7fticom_--
