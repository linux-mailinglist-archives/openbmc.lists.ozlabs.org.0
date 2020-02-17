Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA3C170E3B
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 03:10:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SbjZ09VxzDqk9
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 13:10:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=wiwynn.com (client-ip=103.200.3.19; helo=segapp01.wistron.com;
 envelope-from=eli_huang@wiwynn.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Wistron.onmicrosoft.com
 header.i=@Wistron.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-Wistron-onmicrosoft-com header.b=fcKBmoSk; 
 dkim-atps=neutral
X-Greylist: delayed 311 seconds by postgrey-1.36 at bilbo;
 Mon, 17 Feb 2020 21:25:43 AEDT
Received: from segapp01.wistron.com (segapp02.wistron.com [103.200.3.19])
 by lists.ozlabs.org (Postfix) with ESMTP id 48Lg9g56RkzDqlg
 for <openbmc@lists.ozlabs.org>; Mon, 17 Feb 2020 21:25:41 +1100 (AEDT)
Received: from EXCHAPP02.whq.wistron (unverified [10.37.38.25]) by
 TWNHUMSW2.wistron.com (Clearswift SMTPRS 5.6.0) with ESMTP id
 <Tdd60c9ffe6c0a816701d1c@TWNHUMSW2.wistron.com>; 
 Mon, 17 Feb 2020 18:20:23 +0800
Received: from EXCHAPP02.whq.wistron (10.37.38.25) by EXCHAPP02.whq.wistron
 (10.37.38.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 17 Feb
 2020 18:20:22 +0800
Received: from APC01-HK2-obe.outbound.protection.outlook.com (10.37.38.71) by
 mail.wistron.com (10.37.38.25) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 17 Feb 2020 18:20:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CbJoZK1rUDTkVbi7O2Dfi4eOXf9xemxRK70tA7mFmyjmmByFteB07O1kCSP/BS3jbrnCm51gl4ZFqeWxwOe4WaUk5Gve2X+6pjo86/quFSXu2X6xL7Deg3+AQwG2hW+2MzERnCnarUUFa7cVBw6sLvhq27FrntaeIe6R/sjgKG2No0DbOJG94z8NWwt/dunTkR1iPlipaQ7HKAIp/7SLTGGRhCTivYMZ6A/EAJe+9Uqg6xjZZFMwF66zIT1bXbF/1lZVb8oMQuMJn+3VgynPhNtK5ck5DjclLMlApcuSRT70dMDbqXbUERzyDRJbZMlJU5Iqst4oXOu/IsEMcRhrYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RQAL/8nAMwyDvHavZ9ip+uOmF2VaO4uHTSWbP95m+Y=;
 b=WWdxuZ5iAD+1ShYEvyuh4VlwXHTCUo7p7bAgG2jc0SYWcgZx/q7gwtGuLxgUPnMwpubd4JxMaYn2C2m2IXJdKXnPSVWp8byfkAm0ylfHwhkJ5lraxAxWMWC5YrTd7HA0940uWZ7quS3RMAIgxKeS0W0RPXNjbqB6LPkNG+9XUNm9ySsHKOThEcTIgCa8DQcnQJb5O4nKprHd99lL8O7Mb1yexUjSg4IePR8HuaHIo88At7Xsrpgo83o73F0AjR7x+xskryzJMrIl4BRQ63avIIwq/v1h0GCSQQQyclAc4YIvCcvEyRnrfZHXB6n7PdgYtEvfpQxVixa64c5fRVkmTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Wistron.onmicrosoft.com; s=selector2-Wistron-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RQAL/8nAMwyDvHavZ9ip+uOmF2VaO4uHTSWbP95m+Y=;
 b=fcKBmoSkTYpYLZOfH54rlvXjU9ESfkl4tVz/pv4SfDSUY7qUJtAqNE4KY8pMD5rzp79ZSH2Dk7z8Skade6UFsqZhN0QX/ud/lC3zsTsLFBZ4OVHUucdUH0wrQlZLErrWLMPtD8eejET1Jz73Sv9QeGhzKtuGcvr6Llysbfkyi5Y=
Received: from HK0PR02MB3427.apcprd02.prod.outlook.com (20.177.69.143) by
 HK0PR02MB2513.apcprd02.prod.outlook.com (52.133.210.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Mon, 17 Feb 2020 10:20:20 +0000
Received: from HK0PR02MB3427.apcprd02.prod.outlook.com
 ([fe80::ec7f:eae1:69b8:58b8]) by HK0PR02MB3427.apcprd02.prod.outlook.com
 ([fe80::ec7f:eae1:69b8:58b8%6]) with mapi id 15.20.2729.032; Mon, 17 Feb 2020
 10:20:19 +0000
From: Eli Huang/WYHQ/Wiwynn <Eli_Huang@wiwynn.com>
To: "mine260309@gmail.com" <mine260309@gmail.com>
Subject: Question for phosphor bmc code - BMC update
Thread-Topic: Question for phosphor bmc code - BMC update
Thread-Index: AdXleJv2w/5QxgkFTaeRs/B7wzNdaA==
Date: Mon, 17 Feb 2020 10:20:19 +0000
Message-ID: <HK0PR02MB3427B226A660C70F479B427EEF160@HK0PR02MB3427.apcprd02.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Eli_Huang@wiwynn.com; 
x-originating-ip: [125.227.140.245]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd525baa-c107-4298-273e-08d7b392fdb2
x-ms-traffictypediagnostic: HK0PR02MB2513:|HK0PR02MB2513:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR02MB25135E76320EDFC8C16052C8EF160@HK0PR02MB2513.apcprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1051;
x-forefront-prvs: 0316567485
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(199004)(189003)(71200400001)(186003)(66446008)(66946007)(54906003)(52536014)(5660300002)(64756008)(86362001)(316002)(66476007)(76116006)(478600001)(66556008)(81156014)(8676002)(4744005)(4326008)(8936002)(9686003)(55016002)(15650500001)(26005)(2906002)(6506007)(107886003)(6916009)(33656002)(7696005)(81166006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:HK0PR02MB2513;
 H:HK0PR02MB3427.apcprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: wiwynn.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sLck1/ichHpYsWm34SHoFGZ4J2hC0kjnR/TljSsnbbaw3FgMV3oEY7x+hJY1s4HWBS/zbSNUnK0jbzxraF61+L32QgnZjnNspIHksSsOLr5IdjR9i8zzM1wE1+cK/tz1EgGcK5L7bDBY6PqUP8Q9lZ9EGS1uul7aydGDC7Xa2bELMgITZirdnq4OLIv7Gek3PtBUxaFk6Q/tdof4QLgkV6RlkEN2CNGAApMPhecHtox0YusZO/EkKrV1tdiBeHuc06/XRbC1YnI6yYFSnTOM6oAdASnghXoaUzp/v5IwpZK9h6umDcZc7F1RrXry/YHHXj4RsdzamgC6xH/5/JsKKsr5gg4MlppDihxR2qKZxi0TRQfRWavOykMFTYSMQnq0MXoxnvPiECD5kupzYqJ0WjhUoNIZfVPNGZ0DZ6/S8XltyhgqVGUB03BcZrbMsFrD
x-ms-exchange-antispam-messagedata: PdkVmithNbY3pzLx3q0k4w2PEVVMuVfa1grc4Si0PVUQaKe+kbqoAWx++sDuciS9FU4NitUnyxGh2mLdnsp4gtoCTepQDsvwoUJTQxoA7njhw76UONgfVlbAOK5RLid8mOdXBdOh1lsK7f2Vyljo1Q==
Content-Type: multipart/alternative;
 boundary="_000_HK0PR02MB3427B226A660C70F479B427EEF160HK0PR02MB3427apcp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bd525baa-c107-4298-273e-08d7b392fdb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2020 10:20:19.7223 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: de0795e0-d7c0-4eeb-b9bb-bc94d8980d3b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H4wOey5g4VwyEUKC1ZErAesdln6KgepdBUUrzNwOB9yJfwtMoyAt30fnL0CiRhoinAMXxC5vYLSn39+Z7+dTQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR02MB2513
X-OriginatorOrg: wiwynn.com
X-TM-SNTS-SMTP: DB5A7A597C9558174AEF0E382C8ECC8E564B8C97CBC26F5BB296B1C9E1DF1C152000:8
X-Mailman-Approved-At: Thu, 27 Feb 2020 13:08:41 +1100
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
 Delphine Chiu/WYHQ/Wiwynn <DELPHINE_CHIU@wiwynn.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK0PR02MB3427B226A660C70F479B427EEF160HK0PR02MB3427apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Lei Yu,
Confirm a question with you.
When we do the BMC update using phosphor-bmc-code-mgmt,
The code in the image_manager.cpp will get the version in the manifest file=
.
If the version is same as path on d-bus, the BMC will not update and print =
message "Software Object with the same version already exists".
We want to know why upstream code can't update the same version image if th=
e BMC are valid.
(phosphor-bmc-code-mgmt commit number : a013560f96a9ee5c2db4e1778c7dcee199c=
3acf1)
Regards,
Eli


--_000_HK0PR02MB3427B226A660C70F479B427EEF160HK0PR02MB3427apcp_
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
<body lang=3D"ZH-TW" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Lei Yu,<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Confirm a question with you.<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">When we do the BMC update using=
 phosphor-bmc-code-mgmt,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The code in the image_manager.c=
pp will get the version in the manifest file.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">If the version is same as path =
on d-bus, the BMC will not update and print message &#8220;Software Object =
with the same version already exists&#8221;.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">We want to know why upstream co=
de can&#8217;t update the same version image if the BMC are valid.<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">(phosphor-bmc-code-mgmt commit =
number : a013560f96a9ee5c2db4e1778c7dcee199c3acf1)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Regards,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Eli<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_HK0PR02MB3427B226A660C70F479B427EEF160HK0PR02MB3427apcp_--
