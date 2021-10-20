Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B639D43471B
	for <lists+openbmc@lfdr.de>; Wed, 20 Oct 2021 10:40:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZ3wL2x97z2ywt
	for <lists+openbmc@lfdr.de>; Wed, 20 Oct 2021 19:40:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nuvoton.onmicrosoft.com header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-nuvoton-onmicrosoft-com header.b=tnP9s1zo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nuvoton.com (client-ip=40.107.130.42;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=chma0@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-nuvoton-onmicrosoft-com header.b=tnP9s1zo; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300042.outbound.protection.outlook.com [40.107.130.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZ3vs4Bglz2xtZ
 for <openbmc@lists.ozlabs.org>; Wed, 20 Oct 2021 19:40:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rwncj6nkxlg/GD+ix3z7j+Q+EEogvgR4twd0/G70Oue4jKOWopHiWv4OFLPgcSOw5rstzZZtFOB3fSrfLIb6XIkabpTc2xUnmsXWbOXRUTC2gIMFWiUJ2GqL4NUrsdojNcE/ezY2mtOXzppvxj/96Tloqb2zhOlPewdvLywTSxCPlVKGtA6f/Wamr2mg3vHl1h4VtkZOXJcIloDay/G6UfhZRnmFD2+HWK0w0Y9H5AACnHY7vx8qumaA2/h8/YPQVR31uiQcMEb8RW39wXRkZldwahw9vpRr1JPZi9fyFPWwv55/FKygnEi73IaJtvQPCGR+puCgYSeiyMos4121fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xalJYi4Q2ttKNz35USi1hN+lMFTflOL3sLS5+lWd1s=;
 b=RSzayebDTxjbeKcUsyb0C70lUChuoE9Zha/7+zpJCJ6BhfZZLw+yM+RvBDfyqVvxd6hb+C164qMUMqXZDJI/p65EUdF5AXHkBVw1nswreMoDT82MPXkIB7i3hm55LcWipz9itypAgyHrsvk9rVnsBwJDv/1br5c/7puQOM5+Vfb94huSVuH21jmPqQ/GMYCplizrAJ/v58BMI2QOoivOmvRkLuA2Ra+YpoFBltdCHCvqf7qfWsZ52Ano2wlWJ9/v6zxkr8f9ZbISyWb+GjYx4PIdhiBuVLswToROqzXebnCFvid/i+NVvWzxUsRrbJcjQvhtx9TRXfq1WVkGHYRDjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xalJYi4Q2ttKNz35USi1hN+lMFTflOL3sLS5+lWd1s=;
 b=tnP9s1zo1iLxeGKMiRZRlXsmWMNIyJdqb6JfeD6o1kfUxFde7vzf7LIDlCaZONGs9lbnPawtjnkZ//HoHFnB4Xof3gHNJjSasdtXJWwheZ10xA54NNWPkFlN11oTC974cBlGlvbmhWFd7liQ+UL0b+YsN47gxDdXKi1T4IqQPMg=
Received: from HK0PR03MB3089.apcprd03.prod.outlook.com (2603:1096:203:42::22)
 by HK0PR03MB2996.apcprd03.prod.outlook.com (2603:1096:203:4e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.11; Wed, 20 Oct
 2021 08:39:47 +0000
Received: from HK0PR03MB3089.apcprd03.prod.outlook.com
 ([fe80::286b:ebae:e833:16ae]) by HK0PR03MB3089.apcprd03.prod.outlook.com
 ([fe80::286b:ebae:e833:16ae%5]) with mapi id 15.20.4628.016; Wed, 20 Oct 2021
 08:39:47 +0000
From: CS20 CHMa0 <CHMA0@nuvoton.com>
To: "spinler@us.ibm.com" <spinler@us.ibm.com>
Subject: [phosphor-logging] About the "Stop emitting Entry propChanged before
 ifacesAdded" change reason
Thread-Topic: [phosphor-logging] About the "Stop emitting Entry propChanged
 before ifacesAdded" change reason
Thread-Index: AdfFhjh669KnwuGoRpm4ZK5IylzMDA==
Date: Wed, 20 Oct 2021 08:39:47 +0000
Message-ID: <HK0PR03MB3089CFCA31102DE7BB551413F5BE9@HK0PR03MB3089.apcprd03.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: us.ibm.com; dkim=none (message not signed)
 header.d=none;us.ibm.com; dmarc=none action=none header.from=nuvoton.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc4acac0-b264-4eac-fc6e-08d993a52c87
x-ms-traffictypediagnostic: HK0PR03MB2996:
x-microsoft-antispam-prvs: <HK0PR03MB2996DB3A5A2E01ED7FE7AFE1F5BE9@HK0PR03MB2996.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oe5dHVtVGTdqfnW8bUG5kVT7b5RdOw9laI65m4Tuh9ity39UwIDbh7uPWvGvBmipg6IJ6U0OZ35PjXLw7zN4UMeoPiwFxg1bparg8CDFJLeYQBY4Z7iHX1NOJXrqTutPX8298Z33q7i/4kaarhodHSFVMBz0o6iXr+pRE9gXsDVv74b2eKlGwzJ/QYlqoa02fmX8ByHF8b6xw93JJn+FV2Jx3BfqLSRN4UjP+QrfD1oZxG7SDg8c1ew30D/CE7OIla1hvtMePJomh6bdrugZg+Sc+pgtWlnnZlSDbe0ntesyjXmZEoRarCyYLTcP2JNstM8KbUfRvwqx4eFjwePyD2R5oHw65rTVrZxzPWlXGIwA6byPaPNMCqCmPzeQZKPR1ZqpRKONnNF4BXwlXZPGpIL3sc/+vImTebgQL9ddXPE0IzcUggzAM6DaBe+eQ+f+p1E1jEe3hwy0rTnGDAkiiNmXlAKSpPUmja6HRGyd4qwQg8UZVkZZY75VktGog6b/y/WaTvxyRWH+j895alBx8WecnwAhZxK7S4WaNfGBJEtTtsm4FEOdsl9O2A1+XeREzHfsAB+90pIvYUDuoRkHfrY4Zsa++vcnpb9fO0Jjjs5nb/2wEUeAw2PvhakqajHvIykN+3sC/exNq/mFKsgz2LY8Oxri37kFl3CME4Ym4yHcFhbxQrEO5pQF3FDT/jVNsHuI1HuDdAOiV5okjqKsKoWlp/henfBUvW9am8FPJIptrIOA/NsZ5xY3lnFUG6L6cTv9rX3H+Q5xq/Akz5aBt+Q71jObW+PLa2xgBfNEJcU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR03MB3089.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6916009)(166002)(4326008)(52536014)(55016002)(122000001)(38100700002)(186003)(83380400001)(966005)(508600001)(316002)(33656002)(76116006)(66446008)(66476007)(26005)(64756008)(38070700005)(66556008)(2906002)(9326002)(86362001)(8676002)(66946007)(8936002)(6506007)(71200400001)(7696005)(5660300002)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kFHkpSM9b6ny0IKYoFtp/6HbvDnRmjodKaHIygGKCzDceJUSfltJH19DDIKh?=
 =?us-ascii?Q?zdSQWOxl4gKSBNXMSgeVc19DQ+JekLHEA/E7jnGS64vnj0i5funq46k1BCCy?=
 =?us-ascii?Q?B4P8UqzmCt1sC1f3rdgnmBR5i34XuFXSX63Qe/Pz0YW0DRDMFFhV8ovV0g9Y?=
 =?us-ascii?Q?El96sI0owrynfT7dfJW3c2aR4NZlxHMXDZvW57eLGMQttXTy5bYU8LQ77pru?=
 =?us-ascii?Q?B93n66VG0miM8b4g/8Wk6UEim0m1OSGvnqUvubJzd6R1NiCqkPiE87gNZEDV?=
 =?us-ascii?Q?pf4/qSIiJPYytBP8nItRMio3KnWvlG7SSuhKUwZHOCaweUzDAIxONL/wTs3P?=
 =?us-ascii?Q?lbvBY/lksHXHHEA6waVXhfLqhqHoVVoVIYdWdCrEYMZo0Qm2F5qhUB+bI8Tt?=
 =?us-ascii?Q?+v8yngXGicZU0stM/NW4fJfIpUPIy8dlGqFgmXESNsBpruOFdlDmccszY2XO?=
 =?us-ascii?Q?viwiRVKm94SeIAJK9pTgtmf8zFRCfkVDIQPGc9z/k0D3oa1Lj9IeaBGKkeE8?=
 =?us-ascii?Q?zRRUxYNjF0fB/ScdxA4Ad/RB0z7na+Ffbgx/z13tfEfaxqt7rqSvjVo9yHFY?=
 =?us-ascii?Q?DZAE3iJnEGMWh5B8RWrUadJVLoQGGKZjgQ9PiUT3udILwb6rMzQJU8RIMRnc?=
 =?us-ascii?Q?9BrMwwPVFkBeX3PdXJVJREFPHXTVADrQwEAoW4SSP3QTgyW4HWD6kDHlWA75?=
 =?us-ascii?Q?Z7pV0NF+yBqhvVIEZCXqY60U5Y3wDn6UhQTMuQUFNXtkLyE6WZhdDZOHz0TV?=
 =?us-ascii?Q?7ezEZ3vQtnIaGbXl13FCBDyn2BovWzacgQDeU7vaelKOewNBMjW25ja5+Lc5?=
 =?us-ascii?Q?NTO/VGT+UiZKaA3hRr0xOULkcrg8NHr1SQ6slUeUI87xBZQw5V2R3tGu/3QC?=
 =?us-ascii?Q?p857MTcmkg3eBkEnTkQZhEIM08yQGjOXuHW5pFaiba+fEIFcKowm/GKgYLyC?=
 =?us-ascii?Q?4TCaVZSjeGYo9+Ncal5ONDrziHkWnkRVv0ifSIX2x8YdQYYFpwl+t81BMHWV?=
 =?us-ascii?Q?xj1wmaFdn/PUGcW1pwGX+GPI/8s2BfS25AmIo88d18xaXDeg0NBw7Yx+YIge?=
 =?us-ascii?Q?9ef9CuJLiOluP+a0VleeCq5ouIyd1r+oArRCsRmiVcNi8hKukfeWkZfK5isL?=
 =?us-ascii?Q?DfezfsyC2HTN6GU+Wdv52YoFe3tWIyQ9atu46GKKWt18uzSjL7CAW/2EBwFK?=
 =?us-ascii?Q?ayT1MxyoQucO5HS9zeQKR2MIJssWpzpbqAe1OAttEI41iNKQXqUQAq18MT4I?=
 =?us-ascii?Q?T0qWfsQrL4NK2hC0VCpA+spoxERFRf1rqdWWLEfv067VqtREQu51wKGqT7w3?=
 =?us-ascii?Q?WEjnzfXBiRdVTbW4yEX2rcUmygBzaDswYyKyptXeUX8tyamWwmcKxwiLbVYD?=
 =?us-ascii?Q?D51SU/DaONzCvAAPwTHkvjaijDMJ2/AV46zvB4XteaG7OR3Fy0+5PSZ5B27O?=
 =?us-ascii?Q?sDm47Bdl2vSjZXGuPncYmvS8aZNShvvCvLdegDnIt035F/OsSC0uoZyE3fIc?=
 =?us-ascii?Q?HC9xAbBJvWLTCmza1P/JEVniNhV6fOonyxstOdnVs2N/agb2fowW5FrOUs4/?=
 =?us-ascii?Q?FK/ALYiowlvlOtE7DhFkxQWCQJlTkuAdS+YIKGJIaMNzEORROXFWcrq+WclC?=
 =?us-ascii?Q?Hw=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_HK0PR03MB3089CFCA31102DE7BB551413F5BE9HK0PR03MB3089apcp_"
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB3089.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc4acac0-b264-4eac-fc6e-08d993a52c87
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2021 08:39:47.4862 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RLjXAxWFCdCYK110LDp3fQiG2v/8c7ak+mymVg657FYVyqikwAEH/pIAYbzL1ox8gReUTFdmAT5GcoBwJ13PdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB2996
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK0PR03MB3089CFCA31102DE7BB551413F5BE9HK0PR03MB3089apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Matt,
I meet an issue in bmcweb while update service handle firmware update error
https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/update_servi=
ce.hpp#L321

After I  revert the change or try to change the match rule from 'Properties=
Changed' to 'InterfacesAdded',
the error handler work well in update service.
     fwUpdateErrorMatcher =3D std::make_unique<sdbusplus::bus::match::match=
>(
         *crow::connections::systemBus,
-        "type=3D'signal',member=3D'PropertiesChanged',path_namespace=3D'/x=
yz/"
-        "openbmc_project/logging/entry',"
-        "arg0=3D'xyz.openbmc_project.Logging.Entry'",
+        "interface=3D'org.freedesktop.DBus.ObjectManager',type=3D'signal',=
"
+        "member=3D'InterfacesAdded',"
+        "path=3D'/xyz/openbmc_project/logging'",

May I ask the reason why you update the change?  https://gerrit.openbmc-pro=
ject.xyz/c/openbmc/phosphor-logging/+/46055


Thanks
Brian
________________________________
The privileged confidential information contained in this email is intended=
 for use only by the addressees as indicated by the original sender of this=
 email. If you are not the addressee indicated in this email or are not res=
ponsible for delivery of the email to such a person, please kindly reply to=
 the sender indicating this fact and delete all copies of it from your comp=
uter and network server immediately. Your cooperation is highly appreciated=
. It is advised that any unauthorized use of confidential information of Nu=
voton is strictly prohibited; and any information in this email irrelevant =
to the official business of Nuvoton shall be deemed as neither given nor en=
dorsed by Nuvoton.

--_000_HK0PR03MB3089CFCA31102DE7BB551413F5BE9HK0PR03MB3089apcp_
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
	font-size:11.0pt;
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Matt,<o:p></o:p></p>
<p class=3D"MsoNormal">I meet an issue in bmcweb while update service handl=
e firmware update error<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/openbmc/bmcweb/blob/ma=
ster/redfish-core/lib/update_service.hpp#L321">https://github.com/openbmc/b=
mcweb/blob/master/redfish-core/lib/update_service.hpp#L321</a>
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">After I &nbsp;revert the change or try to change the=
 match rule from 'PropertiesChanged' to 'InterfacesAdded',
<o:p></o:p></p>
<p class=3D"MsoNormal">the error handler work well in update service.<o:p><=
/o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; fwUpdateErrorMatcher =3D st=
d::make_unique&lt;sdbusplus::bus::match::match&gt;(<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *cr=
ow::connections::systemBus,<o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;ty=
pe=3D'signal',member=3D'PropertiesChanged',path_namespace=3D'/xyz/&quot;<o:=
p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;op=
enbmc_project/logging/entry',&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;ar=
g0=3D'xyz.openbmc_project.Logging.Entry'&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;in=
terface=3D'org.freedesktop.DBus.ObjectManager',type=3D'signal',&quot;<o:p><=
/o:p></p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;me=
mber=3D'InterfacesAdded',&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;pa=
th=3D'/xyz/openbmc_project/logging'&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">May I ask the reason why you update the change? &nbs=
p;<a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-logging/=
+/46055">https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-logging/+/46=
055</a>
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks<o:p></o:p></p>
<p class=3D"MsoNormal">Brian<o:p></o:p></p>
</div>
<hr align=3D"center" width=3D"100%">
<span style=3D"font-size:12pt;line-height:0.7;font-family: 'Arial'; color:#=
808080">The privileged confidential information contained in this email is =
intended for use only by the addressees as indicated by the original sender=
 of this email. If you are not the
 addressee indicated in this email or are not responsible for delivery of t=
he email to such a person, please kindly reply to the sender indicating thi=
s fact and delete all copies of it from your computer and network server im=
mediately. Your cooperation is highly
 appreciated. It is advised that any unauthorized use of confidential infor=
mation of Nuvoton is strictly prohibited; and any information in this email=
 irrelevant to the official business of Nuvoton shall be deemed as neither =
given nor endorsed by Nuvoton.
</span>
</body>
</html>

--_000_HK0PR03MB3089CFCA31102DE7BB551413F5BE9HK0PR03MB3089apcp_--
