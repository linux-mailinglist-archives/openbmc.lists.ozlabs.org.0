Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9572E4FC3B1
	for <lists+openbmc@lfdr.de>; Mon, 11 Apr 2022 19:52:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kcbz33J2Qz3bY5
	for <lists+openbmc@lfdr.de>; Tue, 12 Apr 2022 03:52:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lETGyJu+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::609;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=ropai@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=lETGyJu+; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::609])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KcbyZ5cDxz2xBf
 for <openbmc@lists.ozlabs.org>; Tue, 12 Apr 2022 03:51:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WXWUg736/Fo2+SNHCZrWyHsLm+dL9l8sgBXRvScdIX3mf4ibgz7copIek/OPc57qF43K+vO5psCtkO5ovk7zS6XXcM+NUSeW+aP1b4Wb0qJ0c8HpE4LomAIIFii29qY00EmB1Ysni/SRrF2cvKofuTpBflxFtkOqQhHP1tEvrxQdxnk4eTBo38aL1+1dKkiFhR4RFK+tjmJgV98YgE1oJhrvXO9crKDUMzIWV86OAqY2RSElFdgvCAgqqsVfPUT6EDCEEYJhV4LFRzUBMX7+q/vAyR26q0imKtO0RdgdsNcgqMAmq7UTWCenklgnar8lwz91zXYv/XIikwoxHJHZ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmZvzKTTuCB6xf3YxVwKogunCedwBUGBbcGVXm5bNO4=;
 b=oWUnsPh1aKV9w8GY7IgZ+Rj1Y0ujyBYDit5Ahx5xL336WYMLo4109NW01D65bXW7xvzQdkyPPZHHt8wBX8VG0FRoYHpC25oeReeEyzc+EXsFDhIzPzqJIMof83cJMT1FXnHK7rB7cLYT4odfoM/7GIL9N5Ws8KfpvXugg92rBWv4mWO5NTJYlX88JAzgNI3xE+Kr87g7EavxZQenufuujGHXuxFCurDtDxShae0e7s4Qb3PAE5rNY52ADovTFcKhekNNKdwpSqf4WGTR4k/OPQVWhvqoI5vjq1tbGg4R0wycHSiAT8qe7eg4nBuRDSe9oaNXL39Ar6ZsH4NG9lR/xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmZvzKTTuCB6xf3YxVwKogunCedwBUGBbcGVXm5bNO4=;
 b=lETGyJu+dSK/TcVqjwd3b78ebP+sO2eNRTBs6DQ3HsKJkbjsmSmzo/f4q3LoNnlU6asw+I6b8CmN3YdHnHtp8pt2Rh15/9gtg93isd2j2lGS2GbEsXOROce1LioTecGPYLoQdpsOT2pNnr9C3IajTEJWSi4xU7CPII5VLZeM4t7AnjVHR84jQksoDu1cx/zvkse0Rysl8sJqUxhCWXpaJnpP71m9JOl1nXmEU+h9bs5QY++1kwloToLDlnSKPQlI4LosJxVay5VSIJ0VoUqrNJtW2S4NjM17AenSpwSfsfBhL+Zo75NtnE152YoeDzggJxeiaO3AHXGcCk2wPwV7kA==
Received: from LV2PR12MB6014.namprd12.prod.outlook.com (2603:10b6:408:170::18)
 by LV2PR12MB5917.namprd12.prod.outlook.com (2603:10b6:408:175::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 17:51:26 +0000
Received: from LV2PR12MB6014.namprd12.prod.outlook.com
 ([fe80::4800:28b6:3906:90cb]) by LV2PR12MB6014.namprd12.prod.outlook.com
 ([fe80::4800:28b6:3906:90cb%3]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 17:51:25 +0000
From: Rohit Pai <ropai@nvidia.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: boot failure when read-write fs is full
Thread-Topic: boot failure when read-write fs is full
Thread-Index: AdhNypo0iOOFejVOTB64/ur9498qAQ==
Date: Mon, 11 Apr 2022 17:51:25 +0000
Message-ID: <LV2PR12MB6014F744D07F3385DC934A38CDEA9@LV2PR12MB6014.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 395a9c80-a4b7-4f7d-5f65-08da1be3e631
x-ms-traffictypediagnostic: LV2PR12MB5917:EE_
x-microsoft-antispam-prvs: <LV2PR12MB59172A3A27C368CC67566558CDEA9@LV2PR12MB5917.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3KuqntnojLKe5O399LonvdzmVG/Eci+aOvqSx3B05PJ0Kmi7/Bf2Kf9KhmswdTUmzHWJUORNRfVRj4ff8vOwpn2EogRqLUqlxmp+sblSbOFCnZpPcBg5WK86jQFV90H/iAEYjh9HubdK7ZtNVsaUa4BOlzMtx2VTwTfUD1N66PBIylMLRhtHOGwcso51dnCiMROfllcxULIzW7Tnshnw2Rqk6EP0aV+vSYyXct97fOK1CH1LeKxF6RiIMDs1duPi5KmEWYb74uOS2REXGNqSzKjyLUIMJaYIA0mJsNjkI9oMscXkF8142Jq9Qa4E0o6jgf5pxk5A7bhd34Jx1Tm8Usfx/j++HTMFUSZpS/qqxTobI3VyH7apdja5lcWN7uZnS9OcKnJ+ZEDHRlo8ks8FxjW/KuleNRvylK3JonfXRcNALNN1mAYu1rzmhngxnR4DeuvUDPmbC2IFAeQZJmQ9fDS0gKfT2H7upPTlhgiYutLwj3XhaSN0MgnNY9Xl66JZSxZ5HRtXaLPRIfxSEOo4vXj8rYjUWqOtsTWUnkfcG9B1dw94E2vx09QWKBgDgdUi4HijJYJLgntAsoiXFpYLWxjVh5MPf+wXO9KASwfOHlEVLF50OQPG9j2b+/O2NRhEB82NOb5661OeRCvWp/7opoMjG8g3CPaknKR3wTOM+hOeFjXJ+XGYIndt7tYmNetaw8nfFPTi4yIfY7K43cT/18kWdKBo/TB9ovWg9qbJWL4kaXRq2AgStTruIUBZlTrw2he8rHme9rTc0OGZibJilw9xlCsa8wEB/2nMpBY8pq8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB6014.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(122000001)(166002)(66946007)(76116006)(5660300002)(55016003)(52536014)(9326002)(86362001)(8936002)(66446008)(2906002)(38070700005)(7696005)(38100700002)(26005)(186003)(83380400001)(66556008)(64756008)(55236004)(66476007)(9686003)(6506007)(8676002)(316002)(508600001)(6916009)(71200400001)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hPgUHYloLx6VUO/UKU3GB0k6MXCfpARrkb2Xu3pNQ6Q2qlP/6CQL6fxV9KuR?=
 =?us-ascii?Q?WEmawahhRriWHoV4V1AYSj3rYgBfRaJ9xV/r+Z1ihSEfi7+rz8hYgaXQHGhV?=
 =?us-ascii?Q?FEfW0xTrmmBs5g5978WeYeNefSP51zeQU7ZrLjPHBzZ8YUmWWPR+P+BPK52c?=
 =?us-ascii?Q?9Z+oklvShTfwyi/ZavkUcgftaYTwL9yTVVVBqUevqUGXvRYBDLsf6C3cVE3n?=
 =?us-ascii?Q?BdAan4l6nkHRxMQiqVrvnocKd3VdPIm0QmEL+j6B2TLv12d2QyOz1p8IsMl7?=
 =?us-ascii?Q?NlmGI9qy9V0V4AtOMd8ZGlsAqLSZ2NLwiCJK2DRKWbZmbT2d5Jbj2NTkVMp+?=
 =?us-ascii?Q?YMWl1vivUWpgQvKRzo0lgbfoHQGcwbcwaJCvq9Y2RXHTQsv2rVnXeAC4b+sy?=
 =?us-ascii?Q?STPeLvQ+1UK36w685S9ujVngfmjU9q/kT3DFJJPNUv67EUfHIAm79CksEzWe?=
 =?us-ascii?Q?ZSBjYva3Hz2YbaJhIiB3YjLubdx5DjmSUxerp5b5aUNiePLTUImtLEQgrr+8?=
 =?us-ascii?Q?duWvYZxDlrv77FHsocV3WZAB0VevXiAUT8OtOK+4qpmnDB8fOMvoKrxdZhEX?=
 =?us-ascii?Q?8P5NnKGp9o4lN/8xrhe/+ED6TH+Nq7shtOEyJoBle5o4a+wQMhEkZ2TW365v?=
 =?us-ascii?Q?eWcv9YTqqEMqgVBB1Cp88WwYYg1G9AQQZegi6VhhdloMynf8/0gPwWqatHEC?=
 =?us-ascii?Q?7pjbE70w3XGz+xQHNrsfZZRPcgSQo/z5gZjMP0opZR4AzeTjxDEX634CKNF4?=
 =?us-ascii?Q?EwAkYKjqsUjGJwZeViBizAuzlNENj+upHHJ5gzHcMZkAeNlr0SgvsYi3VnBv?=
 =?us-ascii?Q?NrjT4xPpIuGxrzlEvRxdiJHjAmQOrxVnK7QJqssa01gZJZ511lPKB8nJuUOu?=
 =?us-ascii?Q?giycC95XwqaAxgozkR3amPx4h/7+nDfcA2PAmN6k6wN/K/eGYMAVQBTLEDoO?=
 =?us-ascii?Q?1ro0Xo9Mmxhzuoz5H5yhQm7+kBecHKdGWHKb9Ur1HaZjL4xEHeiGbmjKSrqB?=
 =?us-ascii?Q?CDQ6aVoSakwbOCyZOkSGhbPb8K/Y4mzx2WYa9KJ4m8mAs5tYSkAdC/EKNRaO?=
 =?us-ascii?Q?16jQo2FW+GtTYZpgjkYx1exVl8Ahk8kaKlnXoY4atHsZmdhrV/tnyqctNh3T?=
 =?us-ascii?Q?9B1BEOGU3SJ2rUEoHpXhR9IXi5841Lc0Ha9Mqf9C4Cwydv//6Wd74wxUP1hn?=
 =?us-ascii?Q?2k044HEQxw/EgAe3ejLY5on+P2Cjv+WmVcOSY8cNLbCb3pq3PQyPpudJT0AG?=
 =?us-ascii?Q?nlIjTyRDWRIuaHglsjmj0MzM4PTWslFjGgq4RRLckYvjAJAr6rKbLJTpAiGE?=
 =?us-ascii?Q?3NkMduAbW2SKQhuuyBuWANDLLLL+fChIVi/v+TDM92CruHSGw1L6ADTquqaB?=
 =?us-ascii?Q?scNTMyaZg/P0apbFMHUHNuEfE5e0oXiuqSFHFO9MaQChzuFFsj7UN7m9uNzi?=
 =?us-ascii?Q?B0E3PEEe3tnVi+NQP6m9beXfVGoW1Y+CTWBgSlRxWs8Dub02OkYtDF/A/4vK?=
 =?us-ascii?Q?YSexTGQQ+3bYksyK6fqR2+18LgLKYvxDHaqbmaREgzNAXs2d5HZoIzDeKsDP?=
 =?us-ascii?Q?5phuwBgZ/v6rv3NcR5zkrExIbdSgOmGrb5WmGP6LYk7geZzlanskaoh/14cc?=
 =?us-ascii?Q?hGu/wnnVD8JEWcpkRUrhaskFcbg4I4q4doL4GT4/07maulSfQzXtRwWdDJzC?=
 =?us-ascii?Q?9p5kX4W1QAdq0rvMOEf0D+GgAeNUfW+iLOD5U7x8MUwionkb?=
Content-Type: multipart/alternative;
 boundary="_000_LV2PR12MB6014F744D07F3385DC934A38CDEA9LV2PR12MB6014namp_"
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB6014.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 395a9c80-a4b7-4f7d-5f65-08da1be3e631
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2022 17:51:25.9086 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oVDCsiU0BGiiuzXECykdHBxkQDYHpc5eANfosW816HD+2x1ZzSf0gG0TQf3pUj14kfpDJzFM0p3fWaN3exfQeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5917
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

--_000_LV2PR12MB6014F744D07F3385DC934A38CDEA9LV2PR12MB6014namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello All,

Currently I am investigating the bootup failures which I see on our 0penBmc=
 based boards when the rw-fs is full.
The rw-fs can become full because of many reasons. One example being too fr=
equent bmc dump creation which are stored in rw-fs.

I have allocated 16MB for the read-write fs and part of the init sequence t=
here is overlay file system which is being mounted as the root-fs which com=
bines the ro-fs and the rw-fs.


mount<https://grok.openbmc.org/s?defs=3Dmount&project=3Dopenbmc> -t overlay=
<https://grok.openbmc.org/s?defs=3Doverlay&project=3Dopenbmc> -o lowerdir<h=
ttps://grok.openbmc.org/s?defs=3Dlowerdir&project=3Dopenbmc>=3D$rodir<https=
://grok.openbmc.org/s?defs=3D%24rodir&project=3Dopenbmc>,upperdir<https://g=
rok.openbmc.org/s?defs=3Dupperdir&project=3Dopenbmc>=3D$upper<https://grok.=
openbmc.org/s?defs=3D%24upper&project=3Dopenbmc>,workdir<https://grok.openb=
mc.org/s?defs=3Dworkdir&project=3Dopenbmc>=3D$work<https://grok.openbmc.org=
/s?defs=3D%24work&project=3Dopenbmc> cow<https://grok.openbmc.org/s?defs=3D=
cow&project=3Dopenbmc> /root<https://grok.openbmc.org/s?defs=3Droot&project=
=3Dopenbmc>

Above 'mount overlay' command fails with the below error when the upperdir =
which the rw-fs is full.


chroot: can't execute '/bin/sh': No such file or directory

Unable to confirm /sbin/init is an executable non-empty file

in merged file system mounted at /root.

Change Root test failed!

Fatal error, triggering kernel panic!

Basically, when the 'overlayfs' fails there is no rootfs mounted on the /. =
So, I am thinking the subsequent init sequence fails.

I am very much interested in knowing if anyone has any thoughts on solving =
this issue or has encountered and already found some existing solutions.
One solution which is in my mind is to capture the failure of mount overlay=
 command and do a self-clean-up procedure on the rw-fs with a white-list po=
licy.
Thanks for any kind input.

Regards,
Rohit PAI




--_000_LV2PR12MB6014F744D07F3385DC934A38CDEA9LV2PR12MB6014namp_
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
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:"Courier New";}
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
<p class=3D"MsoNormal">Hello All, <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Currently I am investigating the bootup failures whi=
ch I see on our 0penBmc based boards when the rw-fs is full.
<o:p></o:p></p>
<p class=3D"MsoNormal">The rw-fs can become full because of many reasons. O=
ne example being too frequent bmc dump creation which are stored in rw-fs.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have allocated 16MB for the read-write fs and part=
 of the init sequence there is overlay file system which is being mounted a=
s the root-fs which combines the ro-fs and the rw-fs.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<pre style=3D"text-indent:.5in;background:white"><span style=3D"color:black=
"><a href=3D"https://grok.openbmc.org/s?defs=3Dmount&amp;project=3Dopenbmc"=
><span style=3D"color:#2030A2;text-decoration:none">mount</span></a> -t <a =
href=3D"https://grok.openbmc.org/s?defs=3Doverlay&amp;project=3Dopenbmc"><s=
pan style=3D"color:#2030A2;text-decoration:none">overlay</span></a> -o <a h=
ref=3D"https://grok.openbmc.org/s?defs=3Dlowerdir&amp;project=3Dopenbmc"><s=
pan style=3D"color:#2030A2;text-decoration:none">lowerdir</span></a>=3D<a h=
ref=3D"https://grok.openbmc.org/s?defs=3D%24rodir&amp;project=3Dopenbmc"><s=
pan style=3D"color:#2030A2;text-decoration:none">$rodir</span></a>,<a href=
=3D"https://grok.openbmc.org/s?defs=3Dupperdir&amp;project=3Dopenbmc"><span=
 style=3D"color:#2030A2;text-decoration:none">upperdir</span></a>=3D<a href=
=3D"https://grok.openbmc.org/s?defs=3D%24upper&amp;project=3Dopenbmc"><span=
 style=3D"color:#2030A2;text-decoration:none">$upper</span></a>,<a href=3D"=
https://grok.openbmc.org/s?defs=3Dworkdir&amp;project=3Dopenbmc"><span styl=
e=3D"color:#2030A2;text-decoration:none">workdir</span></a>=3D<a href=3D"ht=
tps://grok.openbmc.org/s?defs=3D%24work&amp;project=3Dopenbmc"><span style=
=3D"color:#2030A2;text-decoration:none">$work</span></a> <a href=3D"https:/=
/grok.openbmc.org/s?defs=3Dcow&amp;project=3Dopenbmc"><span style=3D"color:=
#2030A2;text-decoration:none">cow</span></a> /<a href=3D"https://grok.openb=
mc.org/s?defs=3Droot&amp;project=3Dopenbmc"><span style=3D"color:#2030A2;te=
xt-decoration:none">root</span></a><o:p></o:p></span></pre>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Above &#8216;mount overlay&#8217; command fails with=
 the below error when the upperdir which the rw-fs is full.
<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><o:p>&nbsp;</o:p></p>
<pre style=3D"text-indent:.5in;background:white"><span class=3D"MsoHyperlin=
k"><span style=3D"color:#2030A2;text-decoration:none">chroot: can't execute=
 '/bin/sh': No such file or directory<o:p></o:p></span></span></pre>
<pre style=3D"text-indent:.5in;background:white"><span class=3D"MsoHyperlin=
k"><span style=3D"color:#2030A2;text-decoration:none">Unable to confirm /sb=
in/init is an executable non-empty file<o:p></o:p></span></span></pre>
<pre style=3D"text-indent:.5in;background:white"><span class=3D"MsoHyperlin=
k"><span style=3D"color:#2030A2;text-decoration:none">in merged file system=
 mounted at /root.<o:p></o:p></span></span></pre>
<pre style=3D"text-indent:.5in;background:white"><span class=3D"MsoHyperlin=
k"><span style=3D"color:#2030A2;text-decoration:none">Change Root test fail=
ed!<o:p></o:p></span></span></pre>
<pre style=3D"text-indent:.5in;background:white"><span class=3D"MsoHyperlin=
k"><span style=3D"color:#2030A2;text-decoration:none">Fatal error, triggeri=
ng kernel panic!<o:p></o:p></span></span></pre>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Basically, when the &#8216;overlayfs&#8217; fails th=
ere is no rootfs mounted on the /. So, I am thinking the subsequent init se=
quence fails.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am very much interested in knowing if anyone has a=
ny thoughts on solving this issue or has encountered and already found some=
 existing solutions.
<o:p></o:p></p>
<p class=3D"MsoNormal">One solution which is in my mind is to capture the f=
ailure of mount overlay command and do a self-clean-up procedure on the rw-=
fs with a white-list policy.
<o:p></o:p></p>
<p class=3D"MsoNormal">Thanks for any kind input. <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Rohit PAI <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_LV2PR12MB6014F744D07F3385DC934A38CDEA9LV2PR12MB6014namp_--
