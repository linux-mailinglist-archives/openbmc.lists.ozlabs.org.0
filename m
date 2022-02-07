Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD6E4AB358
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 03:27:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JsVQY5ljTz2xvV
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 13:27:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=aF3W8md5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::726;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=jamin_lin@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=aF3W8md5; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20726.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::726])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JsVQ25Wj2z2xrd
 for <openbmc@lists.ozlabs.org>; Mon,  7 Feb 2022 13:26:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K3lb2Beq38IN9ZEZTai6vb/G1KWgmWfHYHLuD2/hNfBoPp888gX1p8TIMqrVKqUgDrk12rsQUnCl+2PtCa+HM7nIV8NJHLSvAdnDr9R/mH10KecOlogvwULFAs6TBihhFLmXPvJD9QlANSKNqFRAHcpjC+z50BHWQPgTNRXy4uJM62eUVXWHpDFdI+s6/CvYEc5VJzF3jGhkDUcQCoRUp9gEYnZX6ue74OciFNh5UAKsVLbBn2ch+nYPCFKw04ozTe5RaXL37c6YQ7Kvwidm6Dz/9eSyKEa+11Pt+HfAE9GZltA6Av+mwEfzgJPdehGYp33c40bO/vsjAKS1IQITnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KtcCRkXNqwLTOPnut+N8fWuJ6Zw/ErHFswcIfoYYhj4=;
 b=f19KS10Kyg4SzmOIPipv3i8sRStxCexHuD3bh9Q8/XBJvXql1zG15nfYmshw1nSTdKJFyOSB6ZGYEUi8mzx6kkGkwGzN9FbVNMdgRwkm3Nq8MGbJmNWn+bEtESVuPZT+DToAXykecBv0Ri76FqdOhaDf08n2//Xy4Yj3a5Wk0zeNWYTru3bkaT3Yrz40QWBZeP6kWkLRvRjJaNzQmq1xwvpRTYAbn3f54sfCvVBZkUuJ7JZsVW5ZeGY43AHr+BmCbO7KVtJ1nX9drkufX2jU8X/xSSqIb7/66bgad7h+ToGisAxSx553wjVWuB/MXdKQuvRbpRgWr++aLrFnB9GnrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtcCRkXNqwLTOPnut+N8fWuJ6Zw/ErHFswcIfoYYhj4=;
 b=aF3W8md5IYsb5rTMOWj44vg4LjaIDCs4f/QbQEFK2K5jX0NgF0WS2oxdip1sHY8vue+pOY+ZvEUemj+Mw5M0HlpdcgVrKmD1gdK87rBMEjscH0fkNhb/Ayux06/F9gVz4RFCDcBg86xPlmglPr8z16TgvpcLk+8k1TGSQMGE2KQCMb3EGRTfDNPAVqozWv4MHmkVc1l31TurZX9/VwCnrcaosvTqWRFznRxmGCoLsMmcyxChH3NNvmAebi134r2amEEeyD6SwsypWEk4BsZHMcQiHWjHK5VI+ZmJIb2Os655wv/jjLVCVSFwTiYRyCiRpj7b08iHavXCY5XyRyXuTg==
Received: from TYZPR06MB4015.apcprd06.prod.outlook.com (2603:1096:400:28::9)
 by PS2PR06MB3446.apcprd06.prod.outlook.com (2603:1096:300:6e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Mon, 7 Feb
 2022 02:26:08 +0000
Received: from TYZPR06MB4015.apcprd06.prod.outlook.com
 ([fe80::d0f0:11b4:e1f4:8310]) by TYZPR06MB4015.apcprd06.prod.outlook.com
 ([fe80::d0f0:11b4:e1f4:8310%7]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 02:26:08 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: "joel@jms.id.au" <joel@jms.id.au>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: u-boot:rsa adds rsa3072 algorithm
Thread-Topic: u-boot:rsa adds rsa3072 algorithm
Thread-Index: AdgbyfSrmnvkAjNpRnC0Yj3kfohl+Q==
Date: Mon, 7 Feb 2022 02:26:08 +0000
Message-ID: <TYZPR06MB4015DC4BD5CA2FFAB595C69AFC2C9@TYZPR06MB4015.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39be8600-4ae7-4846-4166-08d9e9e13343
x-ms-traffictypediagnostic: PS2PR06MB3446:EE_
x-microsoft-antispam-prvs: <PS2PR06MB34460FF1FD54217449C9DB30FC2C9@PS2PR06MB3446.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CImYdXjjns7CXktcws7ldV8weBMs4gDC6M6yh2magaiS9MAJy1BD1RRbVLfvVXqL4KPoZnhSEHNAgGCMJHgesQQhu4NFVIP4Bc2VCeTlTLPNHIpqwT5vBHVEQrz7UJsUXHqYtBHPDUY9FCFwfJPEUbYn7ROSJwAN9k/3/LMi9Rjwm/d9tY2VjssxNfEabec+4YH6vzYCiD+YY1gYq4MhY+d2OpCqdS3nESsqrUBWTvEg9MsCHW3jWDqXXYjfr71Qn8Z99qreJQ0XoPzCeco4DU2L2GKoRoFINtChaRxmtGhZoW3d+6e0KrscbCIMHoto2kG5aWzfe0yfXsrenotWBioox1do+eOQ0ubgNvppDiwl4TpibDtPktzVSAERR9WRDKdgYTZ+TmISEJ1L20ooBBLlOS6iRfqrfopRIWtQetbMKFD336nUr7ABWCVx7TFWRUZunPO44djEmBjSMLWLROi1ncP2XJZP4HmrE9X5SsG8xr6Dp2raUrCxPudvJ1wtUT6C68inX/xNvYlRfQKCL3YxQYdYRTArrk7aWo2/rIzhdISPGJNtXkTo/xqBOoNoGh/oa1r7a+6jr/We0HgNh3UZNKeoW7yroOzVtZ2nmYy4HvM/1qpAwRI75KE8unYg5+hRsqtXwJpaU0EnQ9gwFSH2HlQITdI76yJFTy7pG3mzDRz+Wo+9V6y4DsY+itujNTF9AUM9i4QVhPxO5iKK0Knigxo8GGcwYTFie2x1qjYQ07Xf/sk49+vUlrzFVpgR9USBpPbgCabAN4LSr8c5HSk0DPjLCwrUkEvktf6gRyU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4015.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(136003)(396003)(376002)(346002)(366004)(39840400004)(55016003)(38100700002)(966005)(9686003)(76116006)(66556008)(6506007)(64756008)(66446008)(66476007)(8676002)(508600001)(66946007)(4326008)(110136005)(8936002)(54906003)(86362001)(33656002)(38070700005)(166002)(7696005)(316002)(71200400001)(83380400001)(26005)(5660300002)(52536014)(4744005)(122000001)(2906002)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9dLnnLKXbGGnMofxqCb65E58TcZ5RGX/etZBupjF8t76IcN86Kpariuheh26?=
 =?us-ascii?Q?yQM8ktUGwFxBMlcM6j9m8fApVpnjqWcipmRioBSVJnOUnrCrWH5x1/0HWLXn?=
 =?us-ascii?Q?jaKzBKiUSJPLmTGLEPdl0UxzSfP7kgsfEqK3hPXmLBa5SXgaoGNlULO38bkX?=
 =?us-ascii?Q?Ao84Uz1agzSjHvV3sg7zm+gEFU8jP+MlScQPoxKv1JABMOnhyu1g6NeuUHzn?=
 =?us-ascii?Q?yBEAEgoIBAljb0SWK19CXr+jmnuNM6mVWVItaLJZ61VBgzx/kS9RfRBrJr6b?=
 =?us-ascii?Q?W4ljwN4CDGFU2LZNgP1JwSICau+kpPRXWKw87yLx94z8TCoFzeE1KnHlhUyG?=
 =?us-ascii?Q?0BJXXa5kPGrZPGTezkQX4up+b6WGm/+3K9HclceDTr6dilwm+Ok1se/Soloi?=
 =?us-ascii?Q?6+Gk9J1vbMtcSswCBdNWqsd9dmitC+l87/y58o4L+H5a8T8tnGmSLz+Qwuh2?=
 =?us-ascii?Q?m2mqCPmjO/0zcZqA69ifEv9eYMh6VZdkgK1763faLCN8RUyIp22iHIbvs+Zj?=
 =?us-ascii?Q?94sAZo8jUlOjXmFATG6zi5TqrSI2u5xCwkL6bq5+4fnBChKtug/BZhukzfoq?=
 =?us-ascii?Q?Jfecrefj8im5iy2j6Is6jBf9rOtdUvbZDicKf9cTn776DtdhN+n+b3mk+aKM?=
 =?us-ascii?Q?Jx5Qz5zsjoq1wnpWd0Fqivm3oDeJrWOqsXGbAvbOE5CkU2DwqvZ827WgCmeG?=
 =?us-ascii?Q?Gg2uOtOAlvan8yc9V3A0aVzgKClW4WaMbZXNfVtEPzhtQQauxD6zo28BAmnu?=
 =?us-ascii?Q?ZII34EMKTCiy7CX7ZpkASNEo3WHCEeIW4++Rj8Fx3i3oKhrnLVWbvlbd7cH8?=
 =?us-ascii?Q?+yaKkbti0eOFdBu0GcXpV34NuI9ogrAg7D4sUnsNkP3kR0/HUb97aauiHe1D?=
 =?us-ascii?Q?Z9vOmQ00ub+aFPkU+gvqSJORwdmUeVH4KUYoldePImQ612qm/OyCzVGM4b5l?=
 =?us-ascii?Q?pFoJAarhxAPOINBLk2fnkScMUCtOFspBreIV++QV4BUNEr1NiqFOXjD52Lxe?=
 =?us-ascii?Q?dxwfFDvSg/tcwqOCaEdc6RtN8RuFQVSvIg6KtZGCg00/5b5D/MJd0ce3gfSj?=
 =?us-ascii?Q?3ihh+MYRbiT3cmm86VauR1teoG0TQQocBekaLeZHiO/LeXO7Y/cwTMh/7T4e?=
 =?us-ascii?Q?KQ8Ses7f1Bmw9hPvrZb7yucT0QOPyyGU2FCa1RbE9G4fugrQZY6NE4B2fvB3?=
 =?us-ascii?Q?Mr950hmSeA5+2dbsiN18Ko7KXrzovWT9FGE44U1QX4bmpszpKUdDYGtBCtHf?=
 =?us-ascii?Q?HEcBj9NBGFy92v3VUS7Bm3g/6LQanSUmmZtyLjMdMDLWjq7iBgJRMETzuTE+?=
 =?us-ascii?Q?0UMEzYIdQUwwLYpvNin4ZGCGhvJQqFChwbyoK1CpFwMFnSLmH/zC6UksU8FG?=
 =?us-ascii?Q?TuD3ES5OYoUGK5QbjX3GRsaoDa+4gXn6aayUllIsnM2vcrDoP4C4ezWpFT3k?=
 =?us-ascii?Q?veDjSD4NIi1usNHqv5Wyp+10u/LkFWhhYHLqu3ff9m/ZHdbozrhlHBm+gyEl?=
 =?us-ascii?Q?+7wH4zkD+DqhAhhSOxU3zPC96HESvU1dIzjWvxsMf62G7IqhkOdpOrMs/ckY?=
 =?us-ascii?Q?RSMRGN28U1AsQ696U+SQ0R0yN6vPuS157CCy3s6r2im5QAdPJRSZ5rrwSjKB?=
 =?us-ascii?Q?CHKoFp+jmMcskVbsRciAlTePyKdheAkpAGiAeyBrIxGT4jiz/EPstKn6qq/h?=
 =?us-ascii?Q?5Yc/hQ=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_TYZPR06MB4015DC4BD5CA2FFAB595C69AFC2C9TYZPR06MB4015apcp_"
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4015.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39be8600-4ae7-4846-4166-08d9e9e13343
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 02:26:08.4095 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 50QPIS1jaEWnNbDRgticOu5z+uZ9Q+iVPrlLthY9slcItjg0SSEC8svLkQ7xdQ9r3qXiDs4V9ZO+L+KZSR5I1D+vqbC9cIfwG1iK3O/1XR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2PR06MB3446
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Steven Lee <steven_lee@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_TYZPR06MB4015DC4BD5CA2FFAB595C69AFC2C9TYZPR06MB4015apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Joel and OpenBMC team,

This patch was applied to u-boot/master, http://patchwork.ozlabs.org/projec=
t/uboot/patch/20220119082323.4567-2-jamin_lin@aspeedtech.com/
Commit   2a4b0d5890deb0c973f8db7bb03adad96aff1050
https://github.com/u-boot/u-boot/commit/2a4b0d5890deb0c973f8db7bb03adad96af=
f1050
Could you please help to backport the patch to the openbmc/u-boot tree?
Thanks-Jamin


************* Email Confidentiality Notice ********************
DISCLAIMER:
This message (and any attachments) may contain legally privileged and/or ot=
her confidential information. If you have received it in error, please noti=
fy the sender by reply e-mail and immediately delete the e-mail and any att=
achments without copying or disclosing the contents. Thank you.


--_000_TYZPR06MB4015DC4BD5CA2FFAB595C69AFC2C9TYZPR06MB4015apcp_
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
	font-size:12.0pt;
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
<body lang=3D"ZH-TW" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word;text-justify-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Joel and OpenBMC team, <o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">This patch was applied to u-boo=
t/master, <a href=3D"http://patchwork.ozlabs.org/project/uboot/patch/202201=
19082323.4567-2-jamin_lin@aspeedtech.com/">
http://patchwork.ozlabs.org/project/uboot/patch/20220119082323.4567-2-jamin=
_lin@aspeedtech.com/</a>
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Commit&nbsp;&nbsp; 2a4b0d5890de=
b0c973f8db7bb03adad96aff1050<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://github.com/u=
-boot/u-boot/commit/2a4b0d5890deb0c973f8db7bb03adad96aff1050">https://githu=
b.com/u-boot/u-boot/commit/2a4b0d5890deb0c973f8db7bb03adad96aff1050</a> &nb=
sp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Could you please help to backpo=
rt the patch to the openbmc/u-boot tree?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks-Jamin<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">************* Email Confidentia=
lity Notice ********************<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">DISCLAIMER:<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">This message (and any attachmen=
ts) may contain legally privileged and/or other confidential information. I=
f you have received it in error, please notify the sender by reply e-mail a=
nd immediately delete the e-mail and
 any attachments without copying or disclosing the contents. Thank you.<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_TYZPR06MB4015DC4BD5CA2FFAB595C69AFC2C9TYZPR06MB4015apcp_--
