Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC79E2E0408
	for <lists+openbmc@lfdr.de>; Tue, 22 Dec 2020 02:47:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0K3M1m9xzDqQx
	for <lists+openbmc@lfdr.de>; Tue, 22 Dec 2020 12:47:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inventec.com (client-ip=40.107.129.113;
 helo=kor01-sl2-obe.outbound.protection.outlook.com;
 envelope-from=mohammed.habeeb@inventec.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inventec.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=InventecCorp.onmicrosoft.com
 header.i=@InventecCorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-InventecCorp-onmicrosoft-com header.b=urHMwc8r; 
 dkim-atps=neutral
Received: from KOR01-SL2-obe.outbound.protection.outlook.com
 (mail-eopbgr1290113.outbound.protection.outlook.com [40.107.129.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CzgYN2BRbzDqLG
 for <openbmc@lists.ozlabs.org>; Mon, 21 Dec 2020 11:37:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUNZr9f4gXCqLt1PoaF31FyFKRUjx9rKlTxbKkbkDwSpC8n9+V4EsOVFaSQPK8PAhO3xRLe8H85qn1Smxu8LB8XxnvuTpjUIJNjziFAaEKtPlsVXX8d1wxe5wajZquiD/5zNao1Oz32J/+amxqI4wKkfiB1Wjhm2CdcybEnOrR7Nl6DADWekHriI2JaySKZmgzwndiDmmyMDEOF1gFzUVr7PuSwGL0Eoz4bDGpxzydKBLno7fzjUUtKS6QntDm3wMlM93CTr/gNeZ/YW5lDzfG1GVQU8yNb9w6IwFPcZhNEy1o9gLL3QSZ2BAjxXhXVSz4qFEoVzyCPrOMeOGieCaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51qpm5m0yyTCoqgwWrd9Xm6oEB+YOqOq7sl70rSro2Q=;
 b=BO8pTYkOWSK+q89sTIoVDw5D3MkLnTJIQo898RDukEABS/VHcmF+pdLXyKaXoRw2kDAfbkje/jpj3u1V2PolnJrBXF2eB7tnGd1jJvBkunutaAmTaoUtlCjZnEYrsUDepugnhSrFOG8HLaZdQ8atkdl5icdVqHC8ep26q1QcJeIqkH1cpqc34k2uEAVwUMPFdTGasEyvZsKLgyXIbGqgS7TwbukTPVeGwtQWdY40EO+Frp0DK6guPm0Ie2qggREasA1YsPhCcTiLQQ65AI0Wv3+sN61l1sejM/He/+3j54mAI78Z3hz5XWzbZbfwE/0EQbe3OAJD9UyjNDqvf/z4zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inventec.com; dmarc=pass action=none header.from=inventec.com;
 dkim=pass header.d=inventec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=InventecCorp.onmicrosoft.com; s=selector2-InventecCorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51qpm5m0yyTCoqgwWrd9Xm6oEB+YOqOq7sl70rSro2Q=;
 b=urHMwc8r1Fqrl60ec7KSqCNY1id+1NyuO44Z+8nSxAUqkHgg4tmEdpY5TvFYN7vg8wr9kOFLwi9rjL7/hKrRp47sYREdfs4E5ppE2W68CG+qp/ABHWDUgb1WJt86X2rPBMA59xkPtGnZBNbAtSs21+4z1pB6Be4XEAfGo05Nv6E=
Received: from PS2PR02MB3541.apcprd02.prod.outlook.com (2603:1096:300:48::10)
 by PS2PR02MB3301.apcprd02.prod.outlook.com (2603:1096:300:31::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.33; Mon, 21 Dec
 2020 00:37:45 +0000
Received: from PS2PR02MB3541.apcprd02.prod.outlook.com
 ([fe80::4cc2:cac1:a003:53f4]) by PS2PR02MB3541.apcprd02.prod.outlook.com
 ([fe80::4cc2:cac1:a003:53f4%6]) with mapi id 15.20.3676.033; Mon, 21 Dec 2020
 00:37:44 +0000
From: Mohammed.Habeeb ISV <mohammed.habeeb@inventec.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: No event logs in webUI
Thread-Topic: No event logs in webUI
Thread-Index: AdbXMBX7HAfhxRP8Tcm3nL6Rx0B5gA==
Date: Mon, 21 Dec 2020 00:37:44 +0000
Message-ID: <PS2PR02MB35413947737B5E6DB0501CD390C00@PS2PR02MB3541.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=inventec.com;
x-originating-ip: [2601:647:5b80:8dd0:541e:1e51:8dbe:c364]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 98069f95-b2a6-49c9-c806-08d8a548a210
x-ms-traffictypediagnostic: PS2PR02MB3301:
x-microsoft-antispam-prvs: <PS2PR02MB33014C639AB525ECBAA0EC5B90C00@PS2PR02MB3301.apcprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZsOxDrXcGQeKHShB14vm6U3Eha4FTrpuwSEHusVL/wguZ4KZN59aF2IdIgTG4xBj7+sAj30/z8iVtT+Ntrwf28Pt+L6ClvbQmM4z/tJMpHSeqSMWB2g4K2C6qdMMQ9DDz5CnZWjQyQWkzGaxnZ9LTIAJ4gBCULTuWfKiIdSyezQ3q6fI6i3Zkh08uHDXrhAEwCO8KKyRO7D17v/4M/4ozK1C8acnUXzfJo9ZvnmWQEAjNxmQmzWzKV+gGRvOiKKQg3CtuMWthI8Q7Khas2zqDp7zezLYzXeyoddXeTFJ5BdJOdlD4qUx8iLgwwpGUmip63/W4Y/1UZkLKb+eaKQ8bYMEl2Z38kzlrBht7WrcEQzGHJhl8x5pQUQLuBI2+Cx2Azy4tyI7947rB/wrSBhk9Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PS2PR02MB3541.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(346002)(396003)(39860400002)(33656002)(66446008)(55016002)(52536014)(9326002)(186003)(9686003)(478600001)(6506007)(316002)(86362001)(6916009)(7696005)(2906002)(64756008)(71200400001)(5660300002)(8676002)(66476007)(66556008)(76116006)(66946007)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?onb5Z2D6tOwZvZxci6HQHxLbt6vpzo19SvxNZFPrYbqc94hfBLdB4voJfzNK?=
 =?us-ascii?Q?Ryd209/lpueqDnDP04nCiCrm2aPlYzETkzptxuoUFb2ryE8jhs1Wp3VQfcGR?=
 =?us-ascii?Q?mbJzdZPo/2hUqIEEpa0FXmRzS5i3db3k4bgmrGvL6JwzBntgyx99LtKMxmV4?=
 =?us-ascii?Q?9mNYuaNLXJMzczXjWkZLg1U/Mr1j9QTYB/sRrUNGLkxYW9KCP34IaY9qEmc8?=
 =?us-ascii?Q?f9rdW0rLTryktpjV0+dpWPKTY+Tr5kRUTMqY1bwplvFVgo9dIEBo1acXRiWc?=
 =?us-ascii?Q?4X51jhRvfzZ3NkaExaZRwXVjts0FTWRTycvvrebWRLXyGyfff1/artRNeJmF?=
 =?us-ascii?Q?29yBSZ2vYb0YO6y9FW+M0NW3rwMEU6q2FD7f7FZga0dgDAJoCw3GGFRjHjoG?=
 =?us-ascii?Q?vIMjtFZrKlnNTyIOYUbXC2+vJfmdUxTmEWRMi9DmF5bZGew+QlAsDO/Te1iH?=
 =?us-ascii?Q?X9v+fLyOvOUsRd47OEyjw8+pVahMgC98ISqdLMKj1edJmGbvdWFVXFlXdlgj?=
 =?us-ascii?Q?Q4ntO1S26fvnOBhYDUKp9ymXSlqw3D6o56U0NcMRzM799DJu8WNVru8Lw3gd?=
 =?us-ascii?Q?iKD4imc1YYdV4YjM4UkVbpCxB+ijRyvPOga27jL5kydms1k/HkoCsQ5g2x1N?=
 =?us-ascii?Q?90/St3RWHtF+2IPVYY+B6ZmiWlcZkF9IozK44k1JtDZOHA26MoRvya6CZoYi?=
 =?us-ascii?Q?MousxzfiF8AgvztXrZ6FgYQ99jqf8c3IteKmYblaX2eWvyMXAUP1SohlqaNC?=
 =?us-ascii?Q?PcYghKiSu3Cb7C7mOv9tiQkRDU0Mdh3FZ62bBrePnf6YaJSb2glhkas2xIx4?=
 =?us-ascii?Q?CsSS7x8AP9A729uIKA5f/XE4s2mcyaxuf3jtkUEaiviboq0DJ7ydPL8lREtA?=
 =?us-ascii?Q?XSW5P28ckRF4ZucIXnaZO1AKRrgRdI9w9ogL2ZsiU/06l7K6SCyu4c+K9lxa?=
 =?us-ascii?Q?3Bz11RQwZmCjwOVMWj5Q/I/UCfA6UGGziBcPWWKqNvHlL683tcvw/TDchl74?=
 =?us-ascii?Q?h/1wGd7gBxmoazzUg20J/wWdkathC9GgNmSRDrsrLYhDFP0=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_PS2PR02MB35413947737B5E6DB0501CD390C00PS2PR02MB3541apcp_"
MIME-Version: 1.0
X-OriginatorOrg: inventec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS2PR02MB3541.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98069f95-b2a6-49c9-c806-08d8a548a210
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2020 00:37:44.6303 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2ae41f0c-acca-40f1-9c63-49475ff38512
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G1UeLu9FoetzEjqDyZYtD9FCs6p2qoBzH2XLjN6oAdOtuKGS8ZdU6OA8hRM4IntxJ0fVPIXXgOPIDa7jcUYMzWNL+vXk66ebruZl5LTwyKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2PR02MB3301
X-Mailman-Approved-At: Tue, 22 Dec 2020 12:47:06 +1100
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

--_000_PS2PR02MB35413947737B5E6DB0501CD390C00PS2PR02MB3541apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

I am new to openBmc . Currently, I don't see any events logged in webUI
Server health > Event log page.  I see "No events have been logged yet."
When I see the sel elist using ipmitool there are lot of logs shown. I am n=
ot sure if it is a bug in webUI or there are no events to be shown.
What kind of events are shown in Server health > Event log page.  Any examp=
le would be helpful. Currently using openbmc 2.7 version.

ipmitool -I lanplus -U root -P 0penBmc -H 10.6.141.197 sel elist

16bd | 12/18/20 | 12:04:41 UTC | Temperature SCM_TEMP | Lower Non-critical =
going low  | Deasserted | Reading 34 < Threshold 5 degrees C
16be | 12/18/20 | 12:04:41 UTC | Temperature SCM_TEMP | Lower Critical goin=
g low  | Deasserted | Reading 34 < Threshold 0 degrees C
16bf | 12/18/20 | 12:04:57 UTC | Temperature SCM_TEMP | Lower Non-critical =
going low  | Asserted | Reading 252 < Threshold 5 degrees C
16c0 | 12/18/20 | 12:04:57 UTC | Temperature SCM_TEMP | Lower Critical goin=
g low  | Asserted | Reading 252 < Threshold 0 degrees C

Thanks & regards
Habeeb

--_000_PS2PR02MB35413947737B5E6DB0501CD390C00PS2PR02MB3541apcp_
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
<p class=3D"MsoNormal">Hi All, <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am new to openBmc . Currently, I don&#8217;t see a=
ny events logged in webUI &nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">Server health &gt; Event log page. &nbsp;I see &#822=
0;No events have been logged yet.&#8221;
<o:p></o:p></p>
<p class=3D"MsoNormal">When I see the sel elist using ipmitool there are lo=
t of logs shown. I am not sure if it is a bug in webUI or there are no even=
ts to be shown.<o:p></o:p></p>
<p class=3D"MsoNormal">What kind of events are shown in Server health &gt; =
Event log page. &nbsp;Any example would be helpful. Currently using openbmc=
 2.7 version.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">ipmitool -I lanplus -U root -P 0penBmc -H 10.6.141.1=
97 sel elist<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">16bd | 12/18/20 | 12:04:41 UTC | Temperature SCM_TEM=
P | Lower Non-critical going low&nbsp; | Deasserted | Reading 34 &lt; Thres=
hold 5 degrees C<o:p></o:p></p>
<p class=3D"MsoNormal">16be | 12/18/20 | 12:04:41 UTC | Temperature SCM_TEM=
P | Lower Critical going low&nbsp; | Deasserted | Reading 34 &lt; Threshold=
 0 degrees C<o:p></o:p></p>
<p class=3D"MsoNormal">16bf | 12/18/20 | 12:04:57 UTC | Temperature SCM_TEM=
P | Lower Non-critical going low&nbsp; | Asserted | Reading 252 &lt; Thresh=
old 5 degrees C<o:p></o:p></p>
<p class=3D"MsoNormal">16c0 | 12/18/20 | 12:04:57 UTC | Temperature SCM_TEM=
P | Lower Critical going low&nbsp; | Asserted | Reading 252 &lt; Threshold =
0 degrees C<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks &amp; regards<o:p></o:p></p>
<p class=3D"MsoNormal">Habeeb<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
</div>
</body>
</html>

--_000_PS2PR02MB35413947737B5E6DB0501CD390C00PS2PR02MB3541apcp_--
