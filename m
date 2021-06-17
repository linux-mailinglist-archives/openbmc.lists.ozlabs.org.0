Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D083AA982
	for <lists+openbmc@lfdr.de>; Thu, 17 Jun 2021 05:23:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G56nd2X3yz307Y
	for <lists+openbmc@lfdr.de>; Thu, 17 Jun 2021 13:23:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=InventecCorp.onmicrosoft.com header.i=@InventecCorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-InventecCorp-onmicrosoft-com header.b=IcBY5w0L;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inventec.com (client-ip=40.107.132.109;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=udupa.ashwini@inventec.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=InventecCorp.onmicrosoft.com
 header.i=@InventecCorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-InventecCorp-onmicrosoft-com header.b=IcBY5w0L; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320109.outbound.protection.outlook.com [40.107.132.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G56nL0LDTz3019
 for <openbmc@lists.ozlabs.org>; Thu, 17 Jun 2021 13:22:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FpWpDcGiunAt6YZXY9WCog2sfxRGrtXZmFDNGOug1xYIVykWUcBHElR32rCJJ7t8cOUnbZBpC0xZpNmlybrRVlx4T/9h3rJTzXq2DzgVzHceYS/qnBJwXx3+yC6MtO5PXBJyx7ERleRB7a4yVLO72cNWiXqjMtnLNCHgCLbv2F1cOnCkaQnJF/9BLMS5LZcvxsJVM+pyRyasL2umvI38UYH8OP6/M18s0BevJj0u3H/nGjvmlQ943y3i5DsI0oppYks+SO7AiqEX8sWVtfUZBZxFpEhdXAGD9KDUjLuYpZZsZ08X7Qng3wus8DB28pYb6x7bvOb9xLiOWH/YU6IXpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9DpN5dl/qc6pap7VQ5Ez0luru2Whhy7jwoz1VXMi3w=;
 b=hAaFhoFtLYYsO/wx/V4QE1WPAunln8xJVcpM67Vu3txHl+4r3NJID6ZEftqoQIBn7ZtHO98pC4YueldsQyVYOqEcplAIIWbztG9vB8LJeG7/Hmo6zzi8/nqCVSLgYAEKFtaJmhfqmozJDLVrYeLBHICnO9hH7+J6HyM8QfBeH4eo8wpJoTk/ZDh0umCcdAvcvL654hId1VChph1XzToMwEIrWLBJ6kSM5KRL+n2+SFc1VTPDRIprV6gBi+vhqTkqrROxedpSbvmAM2gH9LKA8/4eZwzchgg9ryuXQ/ghUxf98mWYzoBjHERJEcrek4hbGLFbUQ48H/Rc/7sz6IlTFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inventec.com; dmarc=pass action=none header.from=inventec.com;
 dkim=pass header.d=inventec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=InventecCorp.onmicrosoft.com; s=selector2-InventecCorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9DpN5dl/qc6pap7VQ5Ez0luru2Whhy7jwoz1VXMi3w=;
 b=IcBY5w0LLFyGVa3hHZmHdkTYWpK0UXowYPA3dym/zPapV8WKZdZrZKFIJ9NVsbe1aQyrchFC/klyPJYFvuZ4UThmKXzrWEzyAJRKD+DNmXj/f2441QAoCzwWYHYGvv3WgsQr1u5v4eLSv1Cin1McTursSFdaD7WjehY+5lxlGtU=
Received: from SG2PR02MB2796.apcprd02.prod.outlook.com (2603:1096:4:59::20) by
 SG2PR02MB3449.apcprd02.prod.outlook.com (2603:1096:4:52::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.19; Thu, 17 Jun 2021 03:22:33 +0000
Received: from SG2PR02MB2796.apcprd02.prod.outlook.com
 ([fe80::8911:6ef5:1b0b:898]) by SG2PR02MB2796.apcprd02.prod.outlook.com
 ([fe80::8911:6ef5:1b0b:898%5]) with mapi id 15.20.4219.026; Thu, 17 Jun 2021
 03:22:32 +0000
From: Udupa.Ashwini ISV <udupa.ashwini@inventec.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Are redfish event logs persistent across reboot?
Thread-Topic: Are redfish event logs persistent across reboot?
Thread-Index: AddjKAC7w5gtC84GQTOy71rlRhcHsg==
Date: Thu, 17 Jun 2021 03:22:32 +0000
Message-ID: <SG2PR02MB2796FB3D6D6A8C7E7E478878850E9@SG2PR02MB2796.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=inventec.com;
x-originating-ip: [24.6.83.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe0bb373-02a5-46ea-28dd-08d9313f253a
x-ms-traffictypediagnostic: SG2PR02MB3449:
x-microsoft-antispam-prvs: <SG2PR02MB3449E31BC1096D1A5B0C3B06850E9@SG2PR02MB3449.apcprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xHYtQuIisR98cT/AQ/aW5/pL4Q5dgZDg9rog5kTe5A/kEa0+hi6D0+G4TyE1Dexgbacz6POlbdQ1aVfzczQAWbEn4r/XrtTO0zoV9Q2p22y3UK7siquzXb+ZQn9iZ6+kZ29U414NL5GP6If7Lii1A8aXRCmd3xrYXFVqRUOsIIvLdN0NVenujH+5THXpuSOTeN++g8Tk1/0hriLjf5FFcU5/ku0NkaXRZsNAH9Zp+hevmEU1sgA06DKAyc/mjlhGCi22fP+nHYs/56L08RyUOUbOvOxP0PePHEeiOBfw8WbEyXLZ77FN7wFuwA5nTav0aW0H2nRt4aDn4tbwoXliRQAltiDpJFBG4hFdVICvrTJtryHzmNAexQ7dNFSx2JVCJDMtcq+KgQd5dHRkilwHEPOvNb2tNfcRxdvkhnZMN/nLFetynNhKDLPVQGwQSDR9T6k3yXg/GEwsQyM0VBX7Y0GfrUx8dfEyLhzi7WU+Gn5FFgjCvurKHUE3fkAno1sspTI3P/5E1np9qrKHpuf+jZKIzL43GzxepZ+qvMnlmoqi2IfAh0PXP1iY+ycA44FLIQXfLtepJWtlFR+HaeY+6xFTIamVa5rxjRaF5UKzsh8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR02MB2796.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(8936002)(55016002)(8676002)(9686003)(6506007)(9326002)(86362001)(316002)(6916009)(33656002)(558084003)(52536014)(2906002)(38100700002)(122000001)(478600001)(71200400001)(186003)(5660300002)(64756008)(76116006)(66556008)(66476007)(26005)(66946007)(66446008)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tUFI94Fwe+2PlML93cnQ4EulWQXeP/qTB9FrNNasZJLU9PsZMYed1k7qD/Gi?=
 =?us-ascii?Q?7Qd5ESCY5326+6jAfInpU+8kgrb7mw26r2aJtH41YexUxXoXo5BZ47tvqfqZ?=
 =?us-ascii?Q?GhszoC1OD0/dxRmxJrrfeU57xGPXliLNxGadb6ZylOAHbarVyQlLm10mAbt2?=
 =?us-ascii?Q?H1Rvov4tG0EdLRsO1YiEGyghR7DuKY7V60X5odB3jJo5vK6vJ1btZPmehIe+?=
 =?us-ascii?Q?mMPZfKX2JbtwB9+364dKMixQzZAB0+atY6zixoi0NCQFnkk6s1dMUrUcFobq?=
 =?us-ascii?Q?okqkYXqj8qumD57PHxpYCpIQ2wplQRsWOtvlBICzjnAas4PrDbSirRmLLayg?=
 =?us-ascii?Q?K2+ZWsyxZe29JkGZ8lLTzbkzI0XDVm7mvgJ3ZWQbhdsLJiuoD4oujMMoI2dK?=
 =?us-ascii?Q?3biDYVe8j+tTziUziTtZUuGrFkAHm4R6NdjIGIJMpMrp2IklcM96eLe8tXw+?=
 =?us-ascii?Q?ddm5Rfy9OHlHW2ur83/RBFEEdgI6EHnaQdIdN4CfdHQT1+dJANT159wZp1fZ?=
 =?us-ascii?Q?Oh0s3YZsNQb34ePR5kscDBtOwLN9cT/HbEWJlnZ+CgXIZKz6bEnk5yoAkDNR?=
 =?us-ascii?Q?8zBle9xb/Kbbh78tBK4oRMcY1hY1g8qBvti8eyqSOk4AeXwIXG80vtcUaAG0?=
 =?us-ascii?Q?hwt8EQ2xvOqPhHQYtIdBz2/rXGzU7Ryc6w950oukGq2tJ72l9Vf/K3XOm7j/?=
 =?us-ascii?Q?9oUALg8uxtCIke7uXw62Phx7G7zJhux4M8l5tfQWFrFEv+anD0srtKcgl9wH?=
 =?us-ascii?Q?rXK3Xw3ythkopYAhJgF/Mm/NwyvcmFd8Gk/xnY+oZoaHNuP+rey6d/yQcZ2L?=
 =?us-ascii?Q?3e4g5+dobER0iM49uRTE4H4GL3E3/Zl2MWnbonR7y87swdNxdhp+0T4IsGJK?=
 =?us-ascii?Q?uoQWv5IPKejQixdLBRHZAQGjUZZNlvDQucYPTsWzKsnLGef4RpEFnB2y1aVq?=
 =?us-ascii?Q?ImT5ygh7AOLg+F/9id2d5wQnAL5iWMByzr9fcmmxCYCGqrG0qodLkjDXqoBe?=
 =?us-ascii?Q?Rp4Nu8rbbcueC3teCbcdPazBNRAJI0Q9OQ2KLZjw/9nLtUiiXgcVQicwoYkB?=
 =?us-ascii?Q?3WgD9t6xVWSJ3A99Ysa+i3ZdHS+PcmEjaWR7uD3+4bpWf8DSXFpxP8mfAwSN?=
 =?us-ascii?Q?13Hz8DqQQvfnElBh9btIcMMk7ibgdJjLohbXT2nWComVBY1PwmvzJsWhuMt0?=
 =?us-ascii?Q?6wHKRADjHubSzrDBDhkBUjZAgedCAayHkbj9LrCO78PU4se/mVI4c/5Jyzdj?=
 =?us-ascii?Q?dHkmWiZI00aacmkbRkVawzd1TNT1b+i1gP+35UNlfUFoVN1uExteMQurlw+T?=
 =?us-ascii?Q?cNw=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SG2PR02MB2796FB3D6D6A8C7E7E478878850E9SG2PR02MB2796apcp_"
MIME-Version: 1.0
X-OriginatorOrg: inventec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR02MB2796.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe0bb373-02a5-46ea-28dd-08d9313f253a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2021 03:22:32.3716 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2ae41f0c-acca-40f1-9c63-49475ff38512
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3Gtnvm8DfF+2zckuTt6k2gkybpIBtH5cuRtinEL+lulQfPqTDeFAHvCsKHfmyRDbwwTZhhXqmFB2eyYK6gW6WhDCdFxOcgxR+fTtjHCGgiM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR02MB3449
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

--_000_SG2PR02MB2796FB3D6D6A8C7E7E478878850E9SG2PR02MB2796apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Are redfish event logs(/var/log/redfish) persistent across reboot?
Currently, I see that old logs are lost after reboot and /var/log/redfish i=
s newly written.
Is this the current design?

Regards,
Ashwini


--_000_SG2PR02MB2796FB3D6D6A8C7E7E478878850E9SG2PR02MB2796apcp_
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Are redfish event logs(/var/log/redfish) persistent =
across reboot?<o:p></o:p></p>
<p class=3D"MsoNormal">Currently, I see that old logs are lost after reboot=
 and /var/log/redfish is newly written.<o:p></o:p></p>
<p class=3D"MsoNormal">Is this the current design?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Ashwini<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SG2PR02MB2796FB3D6D6A8C7E7E478878850E9SG2PR02MB2796apcp_--
