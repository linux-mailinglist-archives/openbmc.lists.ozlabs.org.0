Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C25AADA5D9
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 08:58:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46v0Nn0BMfzDqZy
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 17:58:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vertiv.com (client-ip=40.107.77.44;
 helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=troy.lee@vertiv.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=vertiv.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=vertivco.onmicrosoft.com
 header.i=@vertivco.onmicrosoft.com header.b="pjKMLnxh"; 
 dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770044.outbound.protection.outlook.com [40.107.77.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46v0Mz4Q33zDqQ1
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 17:57:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5rYVixA8tPQKSxud0nU+KzIJlROnRBnrdbkZyCyVQOscm2M/xJj+9Rk/kkzQfYuiDcz6CUQ7zwSL+aX2Zst4tI8fC4k4NyIt2fa7WySCcldAZm1s4zsecPZEW0R6agFrR6D3QDnHEbmgX7lN4cj5ZIrIjAmrYLNaP0sQCSK36KhzE4qFIYPc2a5wK8NmHLV7cNNqg+UDXGqhMRW6rcR8Kadk66UDUEI4y+0EGShodF/x7WEBhpAPD/ub4zOkIP0L+0EJS+eycn0NiKG9FMr4eZU/AdmaUSlUmTglJdDY8KlVjyq2G0QKWbM/YPv12yAvRIGaiHrMI6DdH39fs3YaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9Z+bDQDNHPnSWvkhuU/FuyV020NbNLvHEm/ZGAXz5A=;
 b=JKbxA7ccZ6U6nWS9S6hV0I3IvwCcPI55ttBAEIQbsx3Mwn+I6Tebxp6fm3/RAaemNprliGT2bV7GPX4Ig6LBVJzrbubMgEAVS8CLzs+jTQQZNttt3W4IZ7pMJZVz7QeQh3XE1sYaQXziJ/zokekIo5Llhh2jcl5GSOL3WEDDgRv8UotgOY0WkQddpXJJjOOca6bhExEks9OeFWexKhA1aBZB9UFMQOeH0nbywe3g7RQfg0mUvgLW+RrNipWkcv2Ef7GSjhjkWlXd2Il8ZtmfdhEEt+V0+eYgvqrtMgBpKL9C29x/MhRRMJYvxiP8vOY76Y8Hl2nuk1t+/sYQU1kl/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vertiv.com; dmarc=pass action=none header.from=vertiv.com;
 dkim=pass header.d=vertiv.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vertivco.onmicrosoft.com; s=selector2-vertivco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9Z+bDQDNHPnSWvkhuU/FuyV020NbNLvHEm/ZGAXz5A=;
 b=pjKMLnxhdqT+ISkxdTDOB9Ees9bzgRobxfq62Lysb1eCEmu1x23+2Uj1QxmX2y/kiYwoGi0OjXjV/2b/LAYDSoOn9FKcyMs6m6RdLbG+z+08lnCATlujUWooTTbwAk+r9rT6eBtip4867aIqUS1s5qd47wj4aAmytlsux+ZV8eI=
Received: from DM5PR13MB1356.namprd13.prod.outlook.com (10.168.120.144) by
 DM5PR13MB1610.namprd13.prod.outlook.com (10.175.111.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.13; Thu, 17 Oct 2019 06:57:11 +0000
Received: from DM5PR13MB1356.namprd13.prod.outlook.com
 ([fe80::a936:add0:1bcb:9f44]) by DM5PR13MB1356.namprd13.prod.outlook.com
 ([fe80::a936:add0:1bcb:9f44%7]) with mapi id 15.20.2367.014; Thu, 17 Oct 2019
 06:57:11 +0000
From: "Troy.Lee@vertiv.com" <Troy.Lee@vertiv.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Get/Set SoL configuration over IPMI in-band
Thread-Topic: Get/Set SoL configuration over IPMI in-band
Thread-Index: AdWEnlGaSXD5Nv4RQBqTbBMt/5BJrg==
Date: Thu, 17 Oct 2019 06:57:11 +0000
Message-ID: <DM5PR13MB1356131A08A4203854462135ED6D0@DM5PR13MB1356.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Troy.Lee@vertiv.com; 
x-originating-ip: [103.83.160.36]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8207a5d6-064c-492f-80d9-08d752cf3bfc
x-ms-traffictypediagnostic: DM5PR13MB1610:
x-microsoft-antispam-prvs: <DM5PR13MB16106023EA3EB2BA7515C98AED6D0@DM5PR13MB1610.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(189003)(199004)(99286004)(6306002)(102836004)(55016002)(498600001)(81166006)(2351001)(26005)(7736002)(86362001)(6506007)(54896002)(14454004)(9686003)(74316002)(8676002)(81156014)(1730700003)(33656002)(5640700003)(186003)(25786009)(2906002)(8936002)(790700001)(6116002)(3846002)(7696005)(2501003)(66446008)(71190400001)(71200400001)(66476007)(256004)(6436002)(6916009)(66946007)(14444005)(52536014)(76116006)(486006)(66556008)(66066001)(4744005)(476003)(64756008)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR13MB1610;
 H:DM5PR13MB1356.namprd13.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vertiv.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l2+0sW0/YfRESFnCzIl2Xb3Xki8JbuZlgc6xU5RtB3VujKAZaGsq8aOO9q0nWnOwk/zRQMwl0hLMqCDOwS+Phw9mJfvV+Bm6ymUxho1ihP9DpfDwK0DOXay1XAErfdFcrFSjNSS2oFLBe902+dJkbvBYOYd8j8fC4JvHxjecwjYJwdC2895oZL7n6AKFCPJgnY9S/Mq/qCD9LLltBLYnSDmiKZ+hqCwaoFWhFYWDFNMK+KCTTytFxFA5aK3lPNtRbcsCIfByHLdubxeG876fvyIiQp7EhywMRnuojMiGg9ILnKOIx1iuLqUZzbxKjGHcMRbkoSXAso35460XaIspI8cKF92zs13nYRVEpvi37BPisCTup0iMi8xr//iHzndK6MIi8FRriULr4xb+yResyAOenZd35AKri/RNI9VW8Jk=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_DM5PR13MB1356131A08A4203854462135ED6D0DM5PR13MB1356namp_"
MIME-Version: 1.0
X-OriginatorOrg: vertiv.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8207a5d6-064c-492f-80d9-08d752cf3bfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 06:57:11.2187 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 74fe92c5-ef57-4d1a-a0e7-9451117d9272
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MNEROrSCgXiJqhFHDPxm6D32Fgi4tsPLNPPE6XTa6+1tQxLgyyMfGbkrh8bFM1/sf5E0UhE5NO/wp5cPGoTL5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR13MB1610
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

--_000_DM5PR13MB1356131A08A4203854462135ED6D0DM5PR13MB1356namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

The IPMI Serial-over-Lan (SoL) are implemented in phosphor-net-ipmid, and G=
et/Set SoL Configuration are also implemented in there as well.
So getting and setting SoL configuration are limited in lan channel.

Would it be useful if in-band channel (BT/KCS) can also access the SoL conf=
iguration?

Thanks,
Troy Lee
CONFIDENTIALITY NOTICE: This e-mail and any files transmitted with it are i=
ntended solely for the use of the individual or entity to whom they are add=
ressed and may contain confidential and privileged information protected by=
 law. If you received this e-mail in error, any review, use, dissemination,=
 distribution, or copying of the e-mail is strictly prohibited. Please noti=
fy the sender immediately by return e-mail and delete all copies from your =
system.

--_000_DM5PR13MB1356131A08A4203854462135ED6D0DM5PR13MB1356namp_
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
	panose-1:2 2 5 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
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
	font-size:11.0pt;
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
<body lang=3D"ZH-TW" link=3D"blue" vlink=3D"purple" style=3D"text-justify-t=
rim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Hi,<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">The =
IPMI Serial-over-Lan (SoL) are implemented in phosphor-net-ipmid, and Get/S=
et SoL Configuration are also implemented in there as well.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">So g=
etting and setting SoL configuration are limited in lan channel.<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Woul=
d it be useful if in-band channel (BT/KCS) can also access the SoL configur=
ation?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Than=
ks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Troy=
 Lee<o:p></o:p></span></p>
</div>
CONFIDENTIALITY NOTICE: This e-mail and any files transmitted with it are i=
ntended solely for the use of the individual or entity to whom they are add=
ressed and may contain confidential and privileged information protected by=
 law. If you received this e-mail
 in error, any review, use, dissemination, distribution, or copying of the =
e-mail is strictly prohibited. Please notify the sender immediately by retu=
rn e-mail and delete all copies from your system.
</body>
</html>

--_000_DM5PR13MB1356131A08A4203854462135ED6D0DM5PR13MB1356namp_--
