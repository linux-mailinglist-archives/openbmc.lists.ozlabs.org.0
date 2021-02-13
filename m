Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F15831AD81
	for <lists+openbmc@lfdr.de>; Sat, 13 Feb 2021 19:11:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DdJMc3RQzzDqZV
	for <lists+openbmc@lfdr.de>; Sun, 14 Feb 2021 05:11:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inventec.com (client-ip=40.107.131.114;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=udupa.ashwini@inventec.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=InventecCorp.onmicrosoft.com
 header.i=@InventecCorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-InventecCorp-onmicrosoft-com header.b=SRX8lBgf; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310114.outbound.protection.outlook.com [40.107.131.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DdJLl115jzDq9Z
 for <openbmc@lists.ozlabs.org>; Sun, 14 Feb 2021 05:10:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V99r6N99H/SyhJemsiBFvHqwHwBBY7k6gjGEezwDWoAgLJS7Qnwek/Pf3yvGrQE5P8uqQIwpQnxPGtMSO92drrEshXV6tCiRFCRxP8Zvdn9WkHLbBDpTOShNKM/OVi9lv4BViS/a6auZzVcgbL1mZjcmalamasTjprmVhLDNr9r/KlpnPvmyiUxYHeIoEy49Hj3TvnZllJER1PiJasn+r5H5hA+GFc5iRhx+ZtRGFKYal52Q2ms3ihtOqFIr3Ox0yROYiK5iPx8ZSqdlPFCT/KjrxpXLDG9higMfrA27Mo1IS1hihcVrAa0Fq2E6vDaT1adNsXgNjg72y8ZyMkgggg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FeMmSRLtgWhOzpA2ieU8UVjSkA5T2u0z97DdG7iH5Ik=;
 b=PEjyKmxgdWtz5IsROTm26dhKVj2fWI/0KJGKbbbeLxSl/jv0vsoCCPpzB9SrnwHR3e8gi4uiGIJiDnHavAdPOgixq0UOzvPONHRiJz1f/abnfisltRmeXGxzivRisAmVzKHCrPVZtaaGtvyUcmd3sQ9rIcLY7P5sqywmCJ5vuFppNlx0XIiPVFoo8nbHb9bL7wrXb4OL36WQhFin7XwVxC0nYuNYqP4mltW2LdEOOoXYfPD1WEBhZM1Tx8eTNB2ivhmc2cYoXfvVjLFAgnXyL1wrlhjVHkbOFGjXu3rhgyaUpkJToybrDGYZW6CkhUS+UsdxydsCjWpm4oVuDl3acg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inventec.com; dmarc=pass action=none header.from=inventec.com;
 dkim=pass header.d=inventec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=InventecCorp.onmicrosoft.com; s=selector2-InventecCorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FeMmSRLtgWhOzpA2ieU8UVjSkA5T2u0z97DdG7iH5Ik=;
 b=SRX8lBgfLnHQjRmWBpM/QWuudAFjSVz2knduzcONlrFn2FC0om3ijdPXFOwObSvJz5x1sjpURe1zSF4igbQJdT2c/HpEx5RM9dJ5ytq8WQbeYVd9fh4nwlC1Oqe0HVsiZprEwRiYo7Q5OTFKztK+qj2gthwPmOesl+bsUp3HAq0=
Received: from SG2PR02MB2796.apcprd02.prod.outlook.com (2603:1096:4:59::20) by
 SG2PR02MB3178.apcprd02.prod.outlook.com (2603:1096:4:62::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.38; Sat, 13 Feb 2021 18:08:37 +0000
Received: from SG2PR02MB2796.apcprd02.prod.outlook.com
 ([fe80::740c:c7c0:872f:1ccc]) by SG2PR02MB2796.apcprd02.prod.outlook.com
 ([fe80::740c:c7c0:872f:1ccc%7]) with mapi id 15.20.3825.034; Sat, 13 Feb 2021
 18:08:36 +0000
From: Udupa.Ashwini ISV <udupa.ashwini@inventec.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Redfish v1/Systems/system/EthernetInterfaces
Thread-Topic: Redfish v1/Systems/system/EthernetInterfaces
Thread-Index: AdcA6cGzNFkuOxBET+q6tGgjuo9o4ABSXQ1w
Date: Sat, 13 Feb 2021 18:08:36 +0000
Message-ID: <SG2PR02MB27961D3A938C94341747757C858A9@SG2PR02MB2796.apcprd02.prod.outlook.com>
References: <SG2PR02MB2796B5FB2DB9AAAE2594BA1E858B9@SG2PR02MB2796.apcprd02.prod.outlook.com>
In-Reply-To: <SG2PR02MB2796B5FB2DB9AAAE2594BA1E858B9@SG2PR02MB2796.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=inventec.com;
x-originating-ip: [2601:641:8000:1920:9d45:6b81:180f:f642]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9e1d3258-b616-4c38-09b4-08d8d04a6272
x-ms-traffictypediagnostic: SG2PR02MB3178:
x-microsoft-antispam-prvs: <SG2PR02MB31787D1A83DA3CD5AD1E70E3858A9@SG2PR02MB3178.apcprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z3Egz55xJohDoMTzxqvQxybA3MxQJNrjrNea/gy5d1xgx2URRmFAKE9k9wPKIlTbpDxoZDV1gBZwaB+im9kvzZMLKPGlPvqM1syH2CPQgZv+hIY8jwmAAsFuy7jEfxZDGJPp1owpOpewArcJdpOvuw82obUhZahskqrbNgCRALN8Tj84CrMflVBRtrvpWkXV9PVGftDsO+T6fmxS/rTUkzaiDSZ3m1f9kChTsh1PdDsUWFhahq6ZWEFAdO/iMeSSviVmFl93xAAtmvJBGv8YcHVc27qerHSXzmZlyCpbohFfPjSBPSj07R8htPSCl027PD/aZ54OF0aEYt9Pv+DjCTdO5LdPS3JXhshA7v2a4RV4AHCnTKrVsaG3AJN0eKw7gnEsAzxR1xCKYmTMZ2dKaTUmWOU5uYAYRsuoWeSkxBgx+3WsXNJyCC+uUkNKUq6pL6g2CMY00Ie75VjJytHn60Su2eUAoYtCuGSooAtqpjRtXAi3wVNetjOpwArB7Dj12BjRtvFHbo4uVdsvoheWBw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR02MB2796.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(366004)(39830400003)(346002)(9326002)(52536014)(8676002)(6916009)(8936002)(71200400001)(5660300002)(4744005)(186003)(55016002)(6506007)(478600001)(86362001)(33656002)(9686003)(76116006)(7696005)(316002)(2906002)(66946007)(66476007)(64756008)(66446008)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?1lOP4fJEZ8UoLxWSSIb+rquU3x3BV1dcUy0c01ktAiiQWm39hTJVTp0bi3Vm?=
 =?us-ascii?Q?OvcgeoLv9VxHoSuyEHVkzNdVQYq9Dt7asdwuVaqZuJve4BRyQHvnGbTj6tyj?=
 =?us-ascii?Q?KbGsMvatta6j6Y4VgAehyrOge9kIk/1j79Fw22Sf2c+Hk8Yk+BiTbgB6eXx8?=
 =?us-ascii?Q?vCMgvFEfkCQqBTH/+4Tz86XMWWF9pBvB/4/npr7Qgaw2wpl+AvhndkB9Dn+2?=
 =?us-ascii?Q?HuKoCz1Z+OvJ3KoJkIYPZuApKMrAFEqj98K3hjnk+mzgrVpdIeLV5uNxjrUb?=
 =?us-ascii?Q?6ejrDeJCnuSD2y2GRCNTaIQWCNCo3jW2wYB5g3QTEAU8/FvbvNh6ucKO2q9o?=
 =?us-ascii?Q?8MUA5/F1/ppaQt9uqd7IlfqwP8e1j5viSxf/7WnjOUqjWWf30Dq3TCQJAOGR?=
 =?us-ascii?Q?m0hWdKGn21JmyS4rNk5o9KkOIsto9VbyxiADYl2GpA2KcRJStPaxiljxQjRe?=
 =?us-ascii?Q?4U6n7k0HvyhnjToZMJ317N2gK685FO72SiFF9iEIB4pSzmK43sBH75Pb7ZY9?=
 =?us-ascii?Q?Hkyj0FXpzEJp7fU9kq+lgPVq/bWHumPFgxhvUJMPMzXrNzXBf/XJJ++pYBLm?=
 =?us-ascii?Q?Mw7/vEaxK6JQ8bkPVEgthOdFk2Ygiqlp/lm+154JSGNcYezcdwKgqrFFaBlF?=
 =?us-ascii?Q?qvf/hSyOCMZTN3/+NcZ+VQEP+rNUFDLCP1mNla27wEOcktm8fd7oGkeWcf7j?=
 =?us-ascii?Q?AWtyCJnE7ULZ66h9lqFF4yGzO5MxfAE3SNwcBo8+vUgkl68ijBgcJ5U4Af+J?=
 =?us-ascii?Q?UXhZhwak7K4XkqpF5/yKczw+kb+FQG0whXTJ6CMgVMySUTA5GL1PJA3ucnui?=
 =?us-ascii?Q?fFqBz8LfpTjOCDKl6zXxYzuhRrNM+AkxG4sJL4lA3X5c4iVunJS6wNFxptex?=
 =?us-ascii?Q?EtAD3CHULJURhzSBsw8JXhqnsyWAexSeaPA5Bz5oMG9SlYzpbnx6QNPkccw3?=
 =?us-ascii?Q?WSVwLeavONJu8cb0PgFN7klJpL48O5A+465vRkcEotYkycXCJO1cV53tFlqs?=
 =?us-ascii?Q?4KG+T5oOdBOD2Vkuu0na3ApQpI+8/7NE3qr0lxd3WQV43wY1bu2XehyWBilD?=
 =?us-ascii?Q?QZsgHkxHlgMGxby2u84F+/v5tEGw7V6zfLLMiUOCse0pgi5knu0UUKOaL51A?=
 =?us-ascii?Q?kMkbJQTairr/yzyknDAz1OjDVMF+MAUQ/pIuw1i9V0ybwRCCKolQ3qTVO+Rs?=
 =?us-ascii?Q?R4eSEPHzKbTFwpAZgJsSp+Yllm5ABBddH2wYTd9jTdaDKp00pRtwIhOZVK5F?=
 =?us-ascii?Q?9F/ctt2g21g6vA+Z8XcmlayH0JjbH9d0P4/17qM+ASM41J8p1Uaw1BJq/1SI?=
 =?us-ascii?Q?y1ha2egcmadXwBWgDr+FfK6q67pQ6B/7IzpNeVZxKiRzLNDl6DagS7jPF4f/?=
 =?us-ascii?Q?z39AWmzCsu6F4rnq11qkpekeePnQ?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SG2PR02MB27961D3A938C94341747757C858A9SG2PR02MB2796apcp_"
MIME-Version: 1.0
X-OriginatorOrg: inventec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR02MB2796.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e1d3258-b616-4c38-09b4-08d8d04a6272
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2021 18:08:36.7994 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2ae41f0c-acca-40f1-9c63-49475ff38512
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wc4sxgcFbHe4C2p1qlkCz/ERCjXPbU8SD+7M2Xb8NkGn8D5GTjJorB6tWSK5vTjnMzOSGT7+xzLvn5mU736rJ+e4ZJ/vwRGF0YeEQtzskVM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR02MB3178
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

--_000_SG2PR02MB27961D3A938C94341747757C858A9SG2PR02MB2796apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Hi,

I am new to OpenBmc and Redfish.
I saw in bmcweb/Redfish.md, that below Redfish is targeted for OpenBmc:
/redfish/v1/Systems/system/EthernetInterfaces

But, in redfish-core/lib/systems.hpp, I don't see EthernetInterfaces and I =
don't see it on my server Redfish too.
Its only present in Managers/bmc/EthernetInterfaces.

How do I add Systems/system/EthernetInterfaces Redfish support? What change=
s do I need to make?

Regards,
Ashwini


--_000_SG2PR02MB27961D3A938C94341747757C858A9SG2PR02MB2796apcp_
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
	{font-family:"Calibri Light";
	panose-1:2 15 3 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
h2
	{mso-style-priority:9;
	mso-style-link:"Heading 2 Char";
	margin-top:2.0pt;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:0in;
	page-break-after:avoid;
	font-size:13.0pt;
	font-family:"Calibri Light",sans-serif;
	color:#2F5496;
	font-weight:normal;}
span.Heading2Char
	{mso-style-name:"Heading 2 Char";
	mso-style-priority:9;
	mso-style-link:"Heading 2";
	font-family:"Calibri Light",sans-serif;
	color:#2F5496;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am new to OpenBmc and Redfish.<o:p></o:p></p>
<h2 style=3D"background:white"><span style=3D"font-size:11.0pt;font-family:=
&quot;Calibri&quot;,sans-serif;color:black">I saw in bmcweb/Redfish.md, tha=
t below Redfish is targeted for OpenBmc:
</span><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans=
-serif;color:windowtext"><o:p></o:p></span></h2>
<h2 style=3D"background:white"><span style=3D"font-size:11.0pt;font-family:=
&quot;Calibri&quot;,sans-serif;color:black">/redfish/v1/Systems/system/Ethe=
rnetInterfaces</span><span style=3D"font-size:11.0pt;font-family:&quot;Cali=
bri&quot;,sans-serif;color:windowtext"><o:p></o:p></span></h2>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">But, in redfish-core/lib/systems.hpp, I don&#8217;t =
see EthernetInterfaces and I don&#8217;t see it on my server Redfish too.<o=
:p></o:p></p>
<p class=3D"MsoNormal">Its only present in Managers/bmc/EthernetInterfaces.=
 <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">How do I add Systems/system/EthernetInterfaces Redfi=
sh support? What changes do I need to make?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Ashwini<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SG2PR02MB27961D3A938C94341747757C858A9SG2PR02MB2796apcp_--
