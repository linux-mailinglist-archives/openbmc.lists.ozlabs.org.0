Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D979727E792
	for <lists+openbmc@lfdr.de>; Wed, 30 Sep 2020 13:23:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C1Yls4VpLzDqTw
	for <lists+openbmc@lfdr.de>; Wed, 30 Sep 2020 21:23:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=hyvedesignsolutions.com (client-ip=24.159.132.13;
 helo=smtp4.synnex.com; envelope-from=bradc@hyvedesignsolutions.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=hyvedesignsolutions.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=synnexcorp.onmicrosoft.com
 header.i=@synnexcorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-synnexcorp-onmicrosoft-com header.b=YTUxaGtN; 
 dkim-atps=neutral
X-Greylist: delayed 906 seconds by postgrey-1.36 at bilbo;
 Wed, 30 Sep 2020 21:22:36 AEST
Received: from smtp4.synnex.com (smtp4.synnex.com [24.159.132.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C1Yl04Ks2zDqTX
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2020 21:22:36 +1000 (AEST)
Received: from GSC-EXCH6.synnex.org ([10.84.32.34])
 by smtp4.synnex.com  with ESMTP id 08UB7PjL032672-08UB7PjN032672
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=CAFAIL)
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2020 07:07:25 -0400
Received: from GSC-EXCH6.synnex.org (10.84.32.34) by GSC-EXCH6.synnex.org
 (10.84.32.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Wed, 30 Sep
 2020 07:07:53 -0400
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 gsc-exch6.synnex.org (10.84.32.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Wed, 30 Sep 2020 07:07:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVEbIPf5TJ3rF1px5npLDnlapCHvbEeBROjYLWSVOAlQKaKpkVCIEkqapq0bI5lxtbfnUxMHyfShUcCdCPDP0u37ZXi+7c4KdECNAOr9Lq8tlO+FcAvirxsedM6F/2Fkw8urXRvAm7OqfAdfT0Bq8V0DRDfA/68pNCOI2rmWFTCmWl7mZbkFdHqL0ZInV2vQNoh1+oaRZCF8AuvLDA8rnXM9/OrsjM5WR44xs7hNPoMdKqQBIGsz+6F5Qk/7QxTmX26J+fsr6ky2Zv3242eCtBWs95xIIdHj+yLj/h2mA+cLSGjg7AF8/Mux0HFk6aVComQF9KWn2+Pc9SRs1EWCWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1P3ObWbZmZlLZSios9DjfrHdSgldPukQVVN/J/agZk=;
 b=gTGyyeVtVCjKLRN3Z1kYQYEGpOPNetLDHKFW09gDn3ZGCm9jofm3VcedA0LGZ6SO7cD9LEuRthjXKt5eRtKl17L18YA0vnnzToHFuNwhOXMCzSguUfZA2byV56KI5A06BxXeTOCDOYhvcysND93oyQjuL7M6CjlYVvsJtK+ZBNwdlCggtjpXjFcapx3Ze2YeHMJvyJZaj1cbj7Fp2nEL2Vjk94cakiWrYXgDqtzhKHCrVOsSNlv6OvNw+6IhK+wwNKEl+H5EEBI3PDTWI9qtIdLt6NwR0MGrnSqFE/Q+IE/iWVDvqVrNFqhu8TP55upa4tod46wtTBB2yZTu/1A0ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hyvedesignsolutions.com; dmarc=pass action=none
 header.from=hyvedesignsolutions.com; dkim=pass
 header.d=hyvedesignsolutions.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synnexcorp.onmicrosoft.com; s=selector1-synnexcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1P3ObWbZmZlLZSios9DjfrHdSgldPukQVVN/J/agZk=;
 b=YTUxaGtNuCfqTZtEmBl09lg/IOcmQRqCueOCp23PBSUbqDSR2k+7YL1HvXo3hqUajvaH+xzEdOwan6yxnndytt7ktiuSznPqiNlLj5obqr6AgsP6KCsZEHzDjwqiuhGrRvCrSeSrpu663QTYZXIZc70O9rV6QiNfM+GVkW00deI=
Received: from CY4PR04MB1033.namprd04.prod.outlook.com (2603:10b6:910:54::14)
 by CY1PR04MB2345.namprd04.prod.outlook.com (2a01:111:e400:c60e::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Wed, 30 Sep
 2020 11:07:24 +0000
Received: from CY4PR04MB1033.namprd04.prod.outlook.com
 ([fe80::e5de:5693:5146:f150]) by CY4PR04MB1033.namprd04.prod.outlook.com
 ([fe80::e5de:5693:5146:f150%6]) with mapi id 15.20.3412.029; Wed, 30 Sep 2020
 11:07:24 +0000
From: Brad Chou <bradc@hyvedesignsolutions.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Human readable POST code messages
Thread-Topic: Human readable POST code messages
Thread-Index: AdaXGcQypT7gWCfURAWI4VojoAei0g==
Date: Wed, 30 Sep 2020 11:07:24 +0000
Message-ID: <CY4PR04MB1033438E15ECB1EBE2E1D02CB9330@CY4PR04MB1033.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hyvedesignsolutions.com;
x-originating-ip: [61.222.103.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 48a40c30-c14e-4e39-c5cf-08d865310287
x-ms-traffictypediagnostic: CY1PR04MB2345:
x-microsoft-antispam-prvs: <CY1PR04MB234545CEDEEE6C4A24ACD81CB9330@CY1PR04MB2345.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qKQJRLHZ2u3lT2wTDm8lAL6blUwRqEZl8GNer3J9jxcBc4LN3sumtxK5TPzu3yFGTBeEFpQUzHdZCLuuJliE0mME0mTKzeEEKHgGk3c9VDvyod03fRPpsYbAd/1MIvz4BZTcnH3kTHkJiBdFRBBj9BlCWAb/2ZvjtnZjoATvKnMHB8mVoeKrLmOli32Yppyeut+lWS2nddxYJ50vlfOfVRYatYJ2brrFBulndC76d/h447gpbCMvXzQ7ciT2EHyq9YFOD6mqsnZvDwdfPLK1XFWOEJRh2rlzbGCTKV8/SL3fxd1aenztH4Vf7jt/cWkDGzifmnT9Fwo/rwyDo9DVsw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB1033.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(15650500001)(2906002)(316002)(6916009)(83380400001)(9326002)(55016002)(9686003)(86362001)(7696005)(8676002)(186003)(6506007)(26005)(8936002)(4744005)(71200400001)(5660300002)(52536014)(64756008)(66946007)(33656002)(478600001)(66446008)(66556008)(66476007)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: DmBzNd04wvEVdMKXD1zgOoikrWC5hqfaz17daJ8q1Kg9y2Tx22GY0zT00oXSrqcgx6sAxPprLgpOkbucBLpeNgNkhz9rFxZrYW35EzwuDRn1cssjjtL2c3Zujrh+m32whFFDCcewoGTnchY+Z9tNq420QU1WW0qYts0EkSo42LTDVGUnwmBKhl0NGyc3FRv2aLPlDDdnxNas7NFDmJNF8Hk0QqINUasbptUBCTca9Aq3p1FtXvS1TOfxDn2osr7XlnjaPvBr28Nhy4i3EGwIOWy2lQKKHjhxRhWn/KIHyE2SJHA+uHun7uCN2JRztNyb+LNF3DM5q4OohBy/MTl2cvR5nxXY9oSfv8+Gyo0IBDZRsyuMOd4N3BkviC2FmB6b3N0K9P63/jCf1RE+Yf0tUZQ7fbslu83XQ/hZKy4TfPLq6iv7AIo4qmahEggLICDehpV4fxw3PWDqzrQbagr9G1Wrio4bQimTxVqtFFEefomG43bcnIr50h3jXlXrDx46nZcfz/22r+iQT9nlIexJXPPXwrKA5LyniVjnfdY4WPqh/wpCP4etodZu4+pXRiv5aFVOYvf6j+RQmtJxs8OjEGZ5ygkbimIoo9VbQFgXuC/Bdo5SqALYRP9FNIQOzrqGq8GIhr4EhyZ5Zumh6W031Q==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_CY4PR04MB1033438E15ECB1EBE2E1D02CB9330CY4PR04MB1033namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB1033.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48a40c30-c14e-4e39-c5cf-08d865310287
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2020 11:07:24.2690 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 972a0e27-c355-4fd7-9225-9266c8f332ac
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vUUmU2QslbYEBpJQWqnfuUoTK0ehtXOULUlEuNDKNd0EwMrXOICyCIpJd7lbuL2jt8j28a0Y7cPRxVYPD3qKEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2345
X-OriginatorOrg: hyvedesignsolutions.com
X-FE-Policy-ID: 6:1:1:SYSTEM
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

--_000_CY4PR04MB1033438E15ECB1EBE2E1D02CB9330CY4PR04MB1033namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
Is it possible to implement an interface that decode each post code into a =
manful string ?
For example, if code 0x10 is mapped to "Power-on initialization of the host=
 processor".
Then, in the  phosphor-dbus-interfaces/xyz/openbmc_project/State/Boot/PostC=
ode.interface.yaml,
We have the GetPostCodes method, that can return the post codes "0x10".
Can we add another method GetPostCodesWithMessage to return the post code 0=
x10 and its human readable message "Power-on initialization of the host pro=
cessor" ?

Thanks.

--_000_CY4PR04MB1033438E15ECB1EBE2E1D02CB9330CY4PR04MB1033namp_
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
	{font-family:"\@PMingLiU";
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle18
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
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
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal">Is it possible to implement an interface that decode=
 each post code into a manful string ?<o:p></o:p></p>
<p class=3D"MsoNormal">For example, if code 0x10 is mapped to &#8220;Power-=
on initialization of the host processor&#8221;.<o:p></o:p></p>
<p class=3D"MsoNormal">Then, in the&nbsp; phosphor-dbus-interfaces/xyz/open=
bmc_project/State/Boot/PostCode.interface.yaml,<o:p></o:p></p>
<p class=3D"MsoNormal">We have the GetPostCodes method, that can return the=
 post codes &#8220;0x10&#8221;.<o:p></o:p></p>
<p class=3D"MsoNormal">Can we add another method GetPostCodesWithMessage to=
 return the post code 0x10 and its human readable message &#8220;Power-on i=
nitialization of the host processor&#8221; ?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks.<o:p></o:p></p>
</div>
</body>
</html>

--_000_CY4PR04MB1033438E15ECB1EBE2E1D02CB9330CY4PR04MB1033namp_--
