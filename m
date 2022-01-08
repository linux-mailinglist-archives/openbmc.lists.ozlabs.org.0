Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AC0488000
	for <lists+openbmc@lfdr.de>; Sat,  8 Jan 2022 01:45:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JW1Zt0NWpz3bTT
	for <lists+openbmc@lfdr.de>; Sat,  8 Jan 2022 11:45:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=microsoft.com header.i=@microsoft.com header.a=rsa-sha256 header.s=selector2 header.b=X7vU5S2L;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=52.101.62.17;
 helo=na01-obe.outbound.protection.outlook.com;
 envelope-from=derekma@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.a=rsa-sha256 header.s=selector2 header.b=X7vU5S2L; 
 dkim-atps=neutral
Received: from na01-obe.outbound.protection.outlook.com
 (mail-centralusazon11021017.outbound.protection.outlook.com [52.101.62.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JW1ZK6wrdz30L4
 for <openbmc@lists.ozlabs.org>; Sat,  8 Jan 2022 11:44:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C3bjbftgfrm3DsTL33EP4H5OuPb+bdgVdUE2qccfFaVgH/SRVL5cnv/91gEoD76UOcX+Ef/gJ6DoLkD4rOzSN2N+pErn9X02OVTJXPStFLhtv1pXvS+WwqEjHN+sm+piJgsoBFHhil7AYzqUTq84oFSY0W/QjdgFS/8GAxmGdINk06nZTOYXqOkeTRbmLL+jz3PFRyt1Sqx2+ETi58OV4isQsh7tUcB80TAov5Ze8d33gXfBysPm2FQo4ziQhpIIZj7D4S8RUsGZtKYUNx9zl+nxNQsOGxrxw4hn2Gb2qWfOBoB6E+9UhNDiCp9eyRD/AmbKtSNRdmpO0Xu7E/VCug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jGsNnv0P275w1r8wLq5M+EXnRuyOHgprf6nxGIALQk=;
 b=dVisUCgdb3Rb6FBkCjMu2PqZZHxrqYDqUL3Ywo0ugc2wCte/Wn/feRlVFTrZeDwzMZzU6W3pjZjcFOf8spDEkThoOtix7zRqdQmATA1FZ8GkN7yTCBjahGQuNZw5BNyTqQ7dOZ+a8PMd4JR0xWoXqhogSAMD/7mB2JwAsm6AV4q4NNKF8CUI4UVfaQezyyug6xeqphf43BDHPrJCT1fYgqx7MczoQQaeesoRoz0/l1wtmuUKOjXQQ0tZb7nJ6BI89XHooOdsIRxIeFzkwtYWNDnJKPV7x7yDGTwB0xkdSiqurILWPNOZDL9a2yr4jn7kz2YPpQk1fFyx2ktyWsC4AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jGsNnv0P275w1r8wLq5M+EXnRuyOHgprf6nxGIALQk=;
 b=X7vU5S2L4WOfR4oHrZrx6B7BHJfPv73ZYboL/Et+x+YWNg8MFR229aSxZ7MB/TgczANgXtKdqQA8vassleBBszMlndTS9LqCU+Fo3NpnSPaVLssiFygEIzFfD8kETtHjr2nTXcppx4zNzacjQtxdOrcPmKQ0Ra1mhjImDVZS5Bg=
Received: from MW4PR21MB1922.namprd21.prod.outlook.com (2603:10b6:303:73::23)
 by MW4PR21MB2025.namprd21.prod.outlook.com (2603:10b6:303:11c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.1; Sat, 8 Jan
 2022 00:44:17 +0000
Received: from MW4PR21MB1922.namprd21.prod.outlook.com
 ([fe80::b469:3549:b830:4e7b]) by MW4PR21MB1922.namprd21.prod.outlook.com
 ([fe80::b469:3549:b830:4e7b%6]) with mapi id 15.20.4888.005; Sat, 8 Jan 2022
 00:44:17 +0000
From: Derek Mantey <derekma@microsoft.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Firmware update for auxiliary components
Thread-Topic: Firmware update for auxiliary components
Thread-Index: AdgEJ8KW45gmSOIOQIic9AsGBzr/zA==
Date: Sat, 8 Jan 2022 00:44:17 +0000
Message-ID: <MW4PR21MB1922F2806870EBC2A7BDBAE9B04E9@MW4PR21MB1922.namprd21.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=51aa15c1-277a-4576-8fcb-684cf73e5316;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-01-08T00:16:51Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44bc958f-4ce6-483a-c1df-08d9d2400062
x-ms-traffictypediagnostic: MW4PR21MB2025:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs: <MW4PR21MB2025993A2B5EBAA88CFB9DCAB04E9@MW4PR21MB2025.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3kzTvtpgyvZSnOjJukHgQgQTJeCpp2UT3tPQcA7OM2rZcj8obPd79whiep3yXaKYo6b3zo8ooemSSjFOFT5Oeq/R2R/8gd+kI9mJaYhIAk6yUL8t/fSveADLhdZuuugJT99uzTlvK9yJuZX1MRnjzgJ0W8IeS8vLC65I6y5a8j62SiRbEi/TUur4G/bDEeB+Uv8THI2quqwfCkxNl/4xm8yEBei2/kfncbX4B8cdxYPwZP9+QIBSH0XXBIMXe/KWph/DrSDC+EkbppgKHTaF/4g9e2XDPrOKd7hAvZt/rTJy3/AdpQpMWSBZSOoKRB9u9w+4e0rZfv82f+Bk5XxQnxPZG6fFk8xgLdnz7wp+9j59v1R5KQwPxAiA8Il7mN6EzjzsToyqRfeBSBWR+M57EPjEy3gWXpBBVz2CqHF/KRY8kkLgJ+H2IyuTBq8dMQAAwLYPqHZTFpV3iSsTD3TyZ8tXnG6MwdYXb8uRHAeKDw/8Zn+5S+NMMiwhEepnzH32y8RdBTgSASXkCkGghXZ+LaUZFrpAVRZgPy3zH3I/C7dpLTCTSGHVHO+/bscEhHfXskhfkxoRIGDu7mM+hTticMY94jUl0Q3lpwF0YX7I12uR1aM5f8zVIL4ROHEohei4aqPwZIRzlW7SNNmFJCbBCj9n5u1eXN/Q1dxuJe+qZKyXGmOK98dgF9McxfJiIEuwb5S+fDVITyutg3qyDMQelFUa+FiJGM7M0CknlPT+K1WCSsoJEcRsPei9tO3zVyy8EVKr0WNqS4h9WtQS6Su2mvOTHTph3X7XCFf7Kje/L6qdEA2PHQgMMuL9H3qMOfob5oPQ/3Pply0H4uemOONRGg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR21MB1922.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(66946007)(86362001)(55016003)(64756008)(66446008)(8676002)(66476007)(66556008)(15650500001)(82950400001)(122000001)(5660300002)(8990500004)(83380400001)(38100700002)(82960400001)(38070700005)(2906002)(166002)(52536014)(71200400001)(10290500003)(508600001)(33656002)(76116006)(9686003)(6916009)(316002)(7696005)(6506007)(26005)(186003)(20210929001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WHj+ZbEXTXvFf6Bxq9dWrbTAdSQlD0L6ui36X9dhuGjQHB+odRUmb1U+4bRZ?=
 =?us-ascii?Q?SOhbdBRPN/1LWoq0OXLhZgcd6T3KBwzlvME5+m1ve5oh3eNemCdyTBiONJs8?=
 =?us-ascii?Q?nr/WAvK768d44fwcRJOfnejS4+mWrcQTd1xzIqfvHIwz2bzXu8rOYrJNGbiG?=
 =?us-ascii?Q?U45I9dLgOrdry3ZmBYkHGUQBuXVNd3dMYYBJ+E2doe1M42v9PrjGDOSKjMbP?=
 =?us-ascii?Q?heGywRm7NQS06rRROAGxq8CwuKhYrvtlSNjDcGnKe1zzGmbTrrmnEoASpWRq?=
 =?us-ascii?Q?4VCB/Lg2j+dXzJ4rXiCheYFrD8JbuZMSCRRwMott93DuC60VKKf6r3MM+JwS?=
 =?us-ascii?Q?HwFK3dnUz6Se4olVd74vbzqqBcg/mbjpOGJtMlLCb532GSKEUgYH1MTcvY2N?=
 =?us-ascii?Q?QK3p2qAdruyLKx2TOQGGsb5QR+SRKDrl73f+DX6I0iOhWYwMiZWuUB0iDEKc?=
 =?us-ascii?Q?FV3pes7lkyGMipp5NuC+7GNdtxJwaRwRMKqW+S04UTNJYm+e5QfxCuuTX4LJ?=
 =?us-ascii?Q?jdfQhAKUgxfiobZCal6ciYzsB+VMSd27WgeiS27mbNmm03wSdZXDiPuFGNr1?=
 =?us-ascii?Q?Ir/R6tm3aaTKq3hEq907h2yOzb2LFm/q9S+QDYAComdPx62lTQ0QnLg50oe/?=
 =?us-ascii?Q?d4b2a+m7acu/aZsJkjHGW3LE6aN8pF2ASlpzoKeQURbkjYzRUX4A3y/y/si+?=
 =?us-ascii?Q?qCX5kK7ysp6AjJtKBczfEAP/JwLZfFI5LjRe3xyqSYkMWR7toYW3W3kvOAJC?=
 =?us-ascii?Q?SyYGTGUPXlAbTHtAHTlWMsC+SEpuvUjf0obv5xy8pKGDgta4qK7dt0kKEagP?=
 =?us-ascii?Q?u6CHUGbXmsq9AjzZqXR4C1DIwXSV8tLsXRQsFqDq+yzEBWfhKnAw3uwrO4sq?=
 =?us-ascii?Q?6P4z/wp3MfZBlgNLv8XdONJ+a5R/p8dN5HF/ULZPIFMgB5YpPkp/ajjNYOfG?=
 =?us-ascii?Q?sGAiQ9+u/1v8/DYxlkD3R52Ry4EYUvyfEoSc9xPQOiWryPfPJIood/HoP3cZ?=
 =?us-ascii?Q?A0Dhf8w7DQBAYWX37SPvsLZOFciCauR0B7Xow1g8M95ydKFwqS12xn3TDG89?=
 =?us-ascii?Q?ULl495LhDQZAtZOFYj+SifWCB1N3Xg56SVdwEZhO9Bbs0dRoIRWUvhmZoBe6?=
 =?us-ascii?Q?kAFPvwFwREcY6bZIE1bOdIuHO5zbwdKwK5FgliZcdCflZg5Bb4wD1lkjtlH2?=
 =?us-ascii?Q?9SV+zYeg3TFDsj4gYtDmLFNU431mIS2m0e6+eHUumI7gP1Nm8TecB3sizlcP?=
 =?us-ascii?Q?FTnT0ah91e4TPPo3Pj2XzspIxmRZhN+0Wci8PeuydGVMK1p9R8uT6tefzQ5v?=
 =?us-ascii?Q?DsOis4wWS8Jy1B5zDQoDM4b/iqD2CPkOsa00XUf4GJpYd7Y7rC+N7JiBTGId?=
 =?us-ascii?Q?6xne243u0h5TT+Ir3m2dl7w+38RTM6/KEKMBonw86W+tbPIZ5vglWiXsc/vb?=
 =?us-ascii?Q?P32pLTdxdb8ovcp5KQ0KT+yi/T1aSoiu+HCXYcCrl05jt1/c0Wpljk+f+HW8?=
 =?us-ascii?Q?yW4b4W1XqMZd+kbLsuvwLprq/dAPbzVNXLYiK32esKOmRzNTmLvrsf6D5//x?=
 =?us-ascii?Q?Ays2egezB1aZit0c01c1eBXlOsWNxFWvP2ugdtJEYh1luuHMJNEMW0HLrqc5?=
 =?us-ascii?Q?Dg=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_MW4PR21MB1922F2806870EBC2A7BDBAE9B04E9MW4PR21MB1922namp_"
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR21MB1922.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44bc958f-4ce6-483a-c1df-08d9d2400062
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2022 00:44:17.5098 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aVzaPrva8xP6d5YANxrHOEw9SduYHSbU231U4DBGQje/CUhKIe8jj1K+uCEQMHmQVz3wblQ0Q/QImTONAV9RNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR21MB2025
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

--_000_MW4PR21MB1922F2806870EBC2A7BDBAE9B04E9MW4PR21MB1922namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am looking at enabling firmware updates for some auxiliary components in =
our servers that don't fall into the "BMC", "Host" or "PSU" bucket.  I'm tr=
ying to understand if there is a pattern I am missing, what other people ar=
e doing, and the possibility of changing the design.

Right now it looks like the path forward would be to extend the "Version.in=
terface.yaml" in the "phosphor-dbus-interfaces" repo (https://github.com/op=
enbmc/phosphor-dbus-interfaces/blob/6f69ae5b33ee224358cb4c2061f4ad44c6b36d7=
0/xyz/openbmc_project/Software/Version.interface.yaml) and add new VersionP=
urpose for each component.  Then update the Image Manager, Item Updater, BM=
CWeb, etc to handle the new component types.  This seems like this would be=
 touching components up and down the stack just to extend.  Is there some o=
ther pattern or way of extending the software manager to handle new compone=
nts?

What are people doing for components like this?  Are they just updating the=
m offline, e.g. you have command line tools to update the firmware for a co=
mponent that are executed from a terminal/ssh session?  Are all of these co=
mponents just included in the BMC image tar and then either based on the fi=
les in there update sub-components (similar to the image-bmc vs image-kerne=
l + image-rofs)?  Are the components just included in the BMC image itself =
so it updates all components to the current on boot?  Something else?

When I look at the design, it seems like using an enum for the "VersionPurp=
ose" is a little too restrictive.  It doesn't allow for other components to=
 be added, other than the "Other" enum entry.  But there isn't an extended =
purpose string to allow specifying what that "Other" value actually means. =
 I couldn't find an easy way to search through the archive for design discu=
ssions around the phosphor software management, are there any reasons why t=
his isn't a generic string?  Or important discussions around the current de=
sign that I can look through?

Thanks,
               Derek

--_000_MW4PR21MB1922F2806870EBC2A7BDBAE9B04E9MW4PR21MB1922namp_
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
	{mso-style-type:export-only;}
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
<p class=3D"MsoNormal">I am looking at enabling firmware updates for some a=
uxiliary components in our servers that don&#8217;t fall into the &#8220;BM=
C&#8221;, &#8220;Host&#8221; or &#8220;PSU&#8221; bucket.&nbsp; I&#8217;m t=
rying to understand if there is a pattern I am missing, what other people a=
re doing, and
 the possibility of changing the design.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Right now it looks like the path forward would be to=
 extend the &#8220;Version.interface.yaml&#8221; in the &#8220;phosphor-dbu=
s-interfaces&#8221; repo (<a href=3D"https://github.com/openbmc/phosphor-db=
us-interfaces/blob/6f69ae5b33ee224358cb4c2061f4ad44c6b36d70/xyz/openbmc_pro=
ject/Software/Version.interface.yaml">https://github.com/openbmc/phosphor-d=
bus-interfaces/blob/6f69ae5b33ee224358cb4c2061f4ad44c6b36d70/xyz/openbmc_pr=
oject/Software/Version.interface.yaml</a>)
 and add new VersionPurpose for each component.&nbsp; Then update the Image=
 Manager, Item Updater, BMCWeb, etc to handle the new component types.&nbsp=
; This seems like this would be touching components up and down the stack j=
ust to extend.&nbsp; Is there some other pattern
 or way of extending the software manager to handle new components?<o:p></o=
:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">What are people doing for components like this?&nbsp=
; Are they just updating them offline, e.g. you have command line tools to =
update the firmware for a component that are executed from a terminal/ssh s=
ession?&nbsp; Are all of these components just
 included in the BMC image tar and then either based on the files in there =
update sub-components (similar to the image-bmc vs image-kernel + image-rof=
s)?&nbsp; Are the components just included in the BMC image itself so it up=
dates all components to the current on
 boot?&nbsp; Something else?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">When I look at the design, it seems like using an en=
um for the &#8220;VersionPurpose&#8221; is a little too restrictive.&nbsp; =
It doesn&#8217;t allow for other components to be added, other than the &#8=
220;Other&#8221; enum entry.&nbsp; But there isn&#8217;t an extended purpos=
e string
 to allow specifying what that &#8220;Other&#8221; value actually means.&nb=
sp; I couldn&#8217;t find an easy way to search through the archive for des=
ign discussions around the phosphor software management, are there any reas=
ons why this isn&#8217;t a generic string?&nbsp; Or important discussions
 around the current design that I can look through?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Derek<o:p></o:p></p>
</div>
</body>
</html>

--_000_MW4PR21MB1922F2806870EBC2A7BDBAE9B04E9MW4PR21MB1922namp_--
