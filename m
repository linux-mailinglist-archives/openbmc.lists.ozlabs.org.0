Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8E129F20E
	for <lists+openbmc@lfdr.de>; Thu, 29 Oct 2020 17:48:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMWbF2HdqzDqVr
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 03:48:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=lenovo.com (client-ip=67.219.250.2;
 helo=mail1.bemta24.messagelabs.com; envelope-from=rli11@lenovo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=LenovoBeijing.onmicrosoft.com
 header.i=@LenovoBeijing.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-LenovoBeijing-onmicrosoft-com header.b=YR5qg12t; 
 dkim-atps=neutral
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMWHw2HNkzDqM0
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2020 03:34:44 +1100 (AEDT)
Received: from [100.112.128.224] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-a.us-west-2.aws.symcld.net id 76/8B-01844-F1FEA9F5;
 Thu, 29 Oct 2020 16:34:39 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBJsWRWlGSWpSXmKPExsWS8eIht67c+1n
 xBkeadC1OtbxgcWD0OD9jIWMAYxRrZl5SfkUCa8bFG/MYC46KVdzZk9TAuFOki5GLQ0hgPpPE
 tKurmCCcV4wS59fdgnIamST+3djJAuH8ZpR4vq8NLMMosJRZ4svd9ewQzjEWid6p39ggnA2ME
 t2/PjOCOCwCu5kltj/pZYPb0zGrE2r0fUaJif2/mbsYOTnYBJQkWl6tYAexRQQsJZY8aAfq4O
 AQFlCU+NWmCxFWk/h54i8ThK0ncfbONbBWFgFVif9zZ4PZvAIxEhsO7QezGQVkJZ4seAZWzyw
 gLnHuYivYeAkBAYkle84zQ9iiEi8f/2OFqJ/JKLFiHVRcUeLtxl9Q9bISl+Z3M0LYvhL/Vh5j
 hbC1JDYcmwllZ0vMvjsFqldN4vPTK1C2nMSq3ocsELaMxIMb28EBISHwmEni+ZXvUM5TZonlq
 /6zTmDUm4XkWAg7T+LvzwMss8CeE5Q4OfMJC0RcR2LB7k9sELa2xLKFr5lh7DMHHjMhiy9gZF
 /FaJFUlJmeUZKbmJmja2hgoGtoaKRraGSha2hhrpdYpZuoV1qsW55aXKJrpJdYXqxXXJmbnJO
 il5dasokRmLBSChp272B8+fqD3iFGSQ4mJVHe5r2z4oX4kvJTKjMSizPii0pzUosPMcpwcChJ
 8N54A5QTLEpNT61Iy8wBJk+YtAQHj5II74S3QGne4oLE3OLMdIjUKUZLjgkv5y5i5vi4agmQ/
 A4ihVjy8vNSpcR5A94BNQiANGSU5sGNgyX4S4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeZ
 +CrOXJzCuB2wpM50C/iPDm5M4AOagkESEl1cDU8ZxH4NelEM3JwppmOVLFQmGFvPtmdzwyF4q
 M9OxReP4wa2uOw8u+f8vqOKIb5jrNqRCdEvbjzEMly8blNpvZ39yelLvks8LMh2ekdrhxnxdY
 btrcc3LDioWz87/v/XVW+Xp968lLx79VvSjIuVyvVnTgqdz2R5K1S818vp5gWvBPzme1sMx7i
 d0nL+wMPJx66tObt0uSWEtPO2TWNm44eDHj+mZ+jtQH19UWODA/8tctOhg388Ur+YioxelNok
 7fCsMPWWYWSdq+rbWy7N/iavRygkqvyqN1L05bFhWuY2M3XugqKNl9W+5xk0wgnzSjXOOVE8X
 33mzj2MJwlMVeVfLxFJmzN9YtNzI40NmhxFKckWioxVxUnAgAdmTbsGsEAAA=
X-Env-Sender: rli11@lenovo.com
X-Msg-Ref: server-23.tower-336.messagelabs.com!1603989276!97254!1
X-Originating-IP: [104.232.225.11]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22810 invoked from network); 29 Oct 2020 16:34:38 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.11)
 by server-23.tower-336.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Oct 2020 16:34:38 -0000
Received: from HKGWPEMAIL03.lenovo.com (unknown [10.128.3.71])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 0D72622019070B6EF98A
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2020 12:34:35 -0400 (EDT)
Received: from HKGWPEMAIL02.lenovo.com (10.128.3.70) by
 HKGWPEMAIL03.lenovo.com (10.128.3.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2044.4; Fri, 30 Oct 2020 00:35:13 +0800
Received: from HKGWPEXCH01.lenovo.com (10.128.62.30) by
 HKGWPEMAIL02.lenovo.com (10.128.3.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2044.4
 via Frontend Transport; Fri, 30 Oct 2020 00:35:13 +0800
Received: from APC01-PU1-obe.outbound.protection.outlook.com (104.47.126.56)
 by mail.lenovo.com (10.128.62.30) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2044.4; Fri, 30 Oct
 2020 00:35:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nCyaFXTHmyhR9zqZ0uuW+LvC3wFjDW67kKifaxNgfKoNPyh7T5mln+E3pdwxVYO9VeeEFF38ARmrTwx7YfaWLPpCs1EiaIV/T64mRdydCB2nBedXk4E6TiJBqVtEkE+pPWARelwsaPU0BKktESMyHIMEZMe7uAa/nHSDtXnqveqOeIaMdD6NdSMoE9ylZQVbMrjQ6TkuI5M75tfsjaZFUrLOGaCca8St7msEDO6ZLx+e56xwG9RO4LmqXvorGq1B9rWBoA5DpOArZRJ7NYIIF9LbGBR08Zkz/3JjKrtLGgbq/wbo2Xs2bT9oIMRphkHGQqYbprdNXfc3/7kQVk4g7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r64NxE6Rf4ylVam4W9McV80PteBGm6zJ48/T/D93qzk=;
 b=DdLJuPWOZj9aB/RY9420qVkKXa79kLdh7HSN2EnXox7tbgA7fsJke+RR+qLdZhQYHEmUu7T/5RRf1Mfr3xhvJTwC1B276NnTXmmKR+IwtyZpmweyZXoafn8hNURq4PN+297aMBuujCQ3k3fjkz1ByxeRdEDrrRpr6MB2EHiZ7ynQTyOLJJtsc2GyfVD0ittw+gdWgtcogAzUeiDSWJh1Q6toEVvTlPOvKCPOIWW67Zq+u0qfkVFSUJqPPbrVYG/BZcw1j8h2AN62WujuHUih8s9WevxPK0ZBDnaEwatgZAFPT6vMNv44gvDnPWk6l7wP+JsGkSCihUimtjIpMujjBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=LenovoBeijing.onmicrosoft.com; s=selector2-LenovoBeijing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r64NxE6Rf4ylVam4W9McV80PteBGm6zJ48/T/D93qzk=;
 b=YR5qg12tjMEyTlIFgg8BHFtxaLR2hFnkLoFqpQwO/88EsLoU6cPp8aHBN++iEhoh+GeKpEW4eloeOiTIvo3cU7HgfGS4XZnBc5W+ilM72dLhB+ZaUfFwQdEF+XpgIZWFkHcpY0MbhemsoYSYmW29uEseikkmDY+5KLP1pGm/EKs=
Received: from HK2PR03MB4580.apcprd03.prod.outlook.com (2603:1096:202:27::17)
 by HK0PR03MB3089.apcprd03.prod.outlook.com (2603:1096:203:42::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.15; Thu, 29 Oct
 2020 16:34:32 +0000
Received: from HK2PR03MB4580.apcprd03.prod.outlook.com
 ([fe80::b8c3:5dcb:befe:20d3]) by HK2PR03MB4580.apcprd03.prod.outlook.com
 ([fe80::b8c3:5dcb:befe:20d3%5]) with mapi id 15.20.3499.027; Thu, 29 Oct 2020
 16:34:32 +0000
From: Ivan Li11 <rli11@lenovo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: SELinux support question
Thread-Topic: SELinux support question
Thread-Index: Adat9Q0TJiHksjyJQcmUGb2KI+9JLA==
Date: Thu, 29 Oct 2020 16:34:32 +0000
Message-ID: <HK2PR03MB45804A1D770024303FC50FCAD3140@HK2PR03MB4580.apcprd03.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [60.250.179.98]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e0a42739-6881-49e5-523b-08d87c2883be
x-ms-traffictypediagnostic: HK0PR03MB3089:
x-microsoft-antispam-prvs: <HK0PR03MB3089017CD7C1BD5C699CFFE0D3140@HK0PR03MB3089.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u/tKiUC8K9QQo7Yleb0FvVW3B062Zgd5oH/oB2K92aVcp7t46MFXJLu5Ji8BNbaoyfqEnv6bc2q4F+rTBrEieOQIRsRc1AdhY/N8JO7WrI6dpHNsACziG0ChJC7bed8KT9g2Pkjo8MRRXDqKez2+AbU2B7CcT1I3P7NsKhLXC3DoAthL8TT4ZLYh7bTXJ8ruFLWzRoRFyozGq4SS5/NmAKNz0261MrSiWAl3rEGnJm+Fa28TYveZfXMgozNO23gPjnhikNi3CgNGDSl68fVZuZI+1W5PwjklgPV0ekdg9KxZy+YLHvjw9PnSGM3WXMLb
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR03MB4580.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(366004)(39860400002)(346002)(8676002)(2906002)(76116006)(6916009)(5660300002)(558084003)(316002)(7116003)(6506007)(66446008)(3480700007)(478600001)(66946007)(71200400001)(66476007)(66556008)(64756008)(26005)(9686003)(33656002)(86362001)(186003)(7696005)(52536014)(8936002)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Ck0UBycB5euvVf6O2KG85I2BqHqijkQzl0AqcvkGf8Xn+7UIkfdj8mxVylpNESRq4gUq2ETm19m4riNdXj/7qBwtqqx82Wh/RkwQ7RZD5ljJvytXkhjb4WiK5UeDM3nRYtRJlFfwOmnGkFrXIjVQgL7ympuWnNlOW1oE37d2cLat5JASCrYgMj8j6PyPBN4IXZHjjMOdbox263Nn2c9DoJR92Kfki7YoJQCXkOubGq6D7CZCBIsuRuhIGO9tdb8DVN6KnO6Kv7mnTNKY3kAf4vhe1Ud3o4zysfD5PlhUtBJfjaW9IIvKlWvNuMiM/0OQcyeOv6Dq3SZZ2oWZ+LgI4SER3Lb/0OgN9HFV2D8ocD7eMM+I4yKnhVSueF4ZKablIogUl5mz3UaFD0Os43HEEIh64B61bJFNv4My+PlbU0T83CcSOynsQk4zwYaxYCvC0hNjaC9Q5JchILhHExSutyd2Q6H7BkTd7e1XBwOTpfbQ3PO5UMcQL2/44Y5xqM1fnfaWEeXzmzq8Xq9tUpPqoSmgZOd6WovvnFhLt0o/cCnwj3RBE010hOd+fjM/8NHdU58zqwdGM/4bEUzizQUMWtMs6HfwgK3c9s2aVF2w7EZU95Ppv3QOuqKScskCsGNwJFYWc05ldPCml2zQiMoDtw==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK2PR03MB45804A1D770024303FC50FCAD3140HK2PR03MB4580apcp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK2PR03MB4580.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0a42739-6881-49e5-523b-08d87c2883be
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2020 16:34:32.3309 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0dS+IcYLR2XzbVp0uxn3DsETQ4JMDpcr5ysLfSfouJBqTRsIWmbXeTLSbiymw3Cch93pikJ5P5pGEHwbVz8V9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB3089
X-OriginatorOrg: lenovo.com
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

--_000_HK2PR03MB45804A1D770024303FC50FCAD3140HK2PR03MB4580apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Team,

I would like to ask about SELinux support. It's seems that there's no SELin=
ux related package in current OpenBMC.
Therefore, is it not supported for now ?
Please help to advise.

Thanks.

--_000_HK2PR03MB45804A1D770024303FC50FCAD3140HK2PR03MB4580apcp_
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">I would like to ask about SELin=
ux support. It&#8217;s seems that there&#8217;s no SELinux related package =
in current OpenBMC. &nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Therefore, is it not supported =
for now ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Please help to advise.<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks.<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_HK2PR03MB45804A1D770024303FC50FCAD3140HK2PR03MB4580apcp_--
