Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9A1476D54
	for <lists+openbmc@lfdr.de>; Thu, 16 Dec 2021 10:24:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JF6BV18zXz305L
	for <lists+openbmc@lfdr.de>; Thu, 16 Dec 2021 20:24:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=nj4mIQxa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.215.131;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=jamin_lin@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=nj4mIQxa; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2131.outbound.protection.outlook.com [40.107.215.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JF69w2ctMz2yNY
 for <openbmc@lists.ozlabs.org>; Thu, 16 Dec 2021 20:23:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VgiZH4ZlY1LEBRuTEe/88w2eOjnZyUc9j/a5yyvv0SM0LqDH8az/hXC8ZaPvj/0iIWs70JBCfxSffZPIuElgpVgrumFyhGXtmwRAVyjpcQwEs0UgoAE8Lh+1N5zswfIYXN5LZ+aWZItoHcNjsRgFho2/FqxkgzsMyJCjZkN9yEHzjQooGJQWNazZk7TzwrAqAmU30n5jtGMAAYK9ZjP7tRJmKLLdfjo1S/tu36ovH9Z/81NzSNypSoB2lhhVojM9PM4B0Od5dGCq7IVUiX0WFqzBFSr95oNKdo26iJx/1BmJ+6irHtkt4kVZwlqsFA0Aftot/OSYAkuPhQszfqiL0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONZSqfZm08S/iN78Ft+p15wppyh1szlVrlP/snaKQT4=;
 b=DfJR8qksSjw0/hRj6Yf5Rt6Pvxq4z1owr6KKzQYON9MG0aLQMN0YDfs700260TCq8WS3cATft8VrFsNqpQInF31T+tMHU1YRLSTx2ejKyCwh/lSdsQibR/XkQpV8ZlYHxxxNgp3rzf8moStH3DwJElbi/DEU+HLF77kO4LC1G8fNZcA+bokLY76NYrZ7Rh5vysrDDCkld8v/eMwc4HoNnoHLhOCg6clf0IDvaIYuXMQ02O9HukXHA2WLttQo0OcR92CW/jwK+ibZW5jwV9qsqaGbeV/RXAvGl24CaqY5uGfQ3NqtUyy5ULt2Zf06t3fvyYcvxfwCw2gQUEVMYOX+UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONZSqfZm08S/iN78Ft+p15wppyh1szlVrlP/snaKQT4=;
 b=nj4mIQxaFz9WHng/xJwIQ+YIP54+he/g4tQDHDipVj8ZRaCuKfvGEHjsHpi+FNNivBE+vX2A3eweNbaKuJytRyUcEDTEUVqQVcYgMxZrVDXCY/O7F5Y6EueN1PD5RPFt1hMSBXs15vuOn2Zo+IdlLTdufccpFmHvNTVY4BGUf87+7wZcOhi7fzun69UGwAuyL1KZt3D5x/f3da3pTSj1uagp5Y82Vqztj/+uQnsG6R5+rwQ7+pOpDOBSTbSbp2mtpyf5i21PbFAnoiQITUcDp07W3eD7O0xXsMoWfCOVGnHkIVnTlL6HFqgt5zFNYrK0ndzujyXE9adkVKQwcKOtNA==
Received: from TYZPR06MB4015.apcprd06.prod.outlook.com (2603:1096:400:28::9)
 by TY2PR06MB2589.apcprd06.prod.outlook.com (2603:1096:404:43::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Thu, 16 Dec
 2021 09:23:25 +0000
Received: from TYZPR06MB4015.apcprd06.prod.outlook.com
 ([fe80::2d92:8751:482a:707f]) by TYZPR06MB4015.apcprd06.prod.outlook.com
 ([fe80::2d92:8751:482a:707f%3]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 09:23:25 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "andrew@aj.id.au"
 <andrew@aj.id.au>, "patrick@stwcx.xyz" <patrick@stwcx.xyz>, Troy Lee
 <troy_lee@aspeedtech.com>, Steven Lee <steven_lee@aspeedtech.com>
Subject: RE: Create AST2600 OTP image
Thread-Topic: Create AST2600 OTP image
Thread-Index: AdfyQLbr0fqFqVnsR1ui4uNr5fRJWAAHaU8w
Date: Thu, 16 Dec 2021 09:23:25 +0000
Message-ID: <TYZPR06MB401558B1B60BFCF97BB5E9E6FC779@TYZPR06MB4015.apcprd06.prod.outlook.com>
References: <TYZPR06MB4015221527D36DC4780C1F23FC779@TYZPR06MB4015.apcprd06.prod.outlook.com>
In-Reply-To: <TYZPR06MB4015221527D36DC4780C1F23FC779@TYZPR06MB4015.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c9c858d-46b4-4a60-0f9e-08d9c075b659
x-ms-traffictypediagnostic: TY2PR06MB2589:EE_
x-microsoft-antispam-prvs: <TY2PR06MB25892C5E2637E81519A240B8FC779@TY2PR06MB2589.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iYBN+i4ElQT7DklJQnEmaSUT68tzWNrdE2YvBxZ4OzSGcVo5aQsBrfGFMTotayJtx9PsYfZmtAVdzHFNWlVNvNc5RS1L3vXYFXaqKMhoY38NxhJ1kMGaOy6bKyB4bfwqlr0VTtUtr0bOV9pUnEXKGndfQvKJSl/cOvcxCWtSOQzfzTD5BL3W19GXCILNBJp0yRnhVmTaaeFh9YbJPqjbbe+Jj9RhodOchw5zHzQxsRmt3zWGLQECnL+aQpdukC43n2Z2bQLu+oTapk7AKc+CctmWeWY+OGjNbr4v7EJR8PfTzd9riwMiFCejBVv3OLvqZ2pVMvc+UnMAIDEVqwn2vjprZN/pI5huHzY4eoyFxmBbA1JYy7C+BlCS/cNPaSu1xgCezR22qyBPeOZKw7ol6ZAmBQQGpxwrgMZHjbJBVWPrgiEaYuQDCe2oo0/QMgglkZitrwW5eszq7kqZ99bxjzsa2Nw9i7MvPB0ABAkTIDNlFlQ1hvS+bozjfoakOanOqnl1f5CNVlv1XlHH2ue4v1aWTUGRPI82h3cTkbt20JEce1BPN6d6GZivjM6ElmYHgBN1Nw4Vfb085jOqC1B0VAn93m1VPD6BbNc6R3axlLy/X6eGJZ1pvGKQTH+OqdDZ5eL/Sd8L/2KSrYPpVj6epGwfXH5Z2S/jVdjAxQ7gE6FIAonQmqaSXD5srw1pkx7VdbQG86d/D1Znn71UsfUsPUHTig+axdXkMTfPXz8SAMGUGGdSqOpEjQcTl76t7MSZam4AoBreZQab/K/FQyBef1NeCxIf9bl1upvcQJBJEwZPf6rMh7gHQtx/++iIuCmX6mfBChudbrIeBT0RTUobMA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4015.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(346002)(376002)(396003)(39850400004)(76116006)(166002)(66476007)(64756008)(66446008)(33656002)(66556008)(2906002)(9686003)(2940100002)(66946007)(83380400001)(5660300002)(8676002)(71200400001)(38100700002)(316002)(966005)(110136005)(26005)(52536014)(508600001)(8936002)(55016003)(7696005)(6636002)(38070700005)(86362001)(122000001)(186003)(53546011)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JxJU90Tatjos3tozndVEynfiNcGWTRVX0WEVI53uq7We8glM2i5c5+OhZ4Hc?=
 =?us-ascii?Q?cSw1I13yCvAhVcRjlXxxttbZoBI5axyIlARJxSOLQ87tnOBuiw/y6bT//Q/L?=
 =?us-ascii?Q?qNII3jTtUc/Xl9354hE560UZ98a982PrkbXra6ZUij8MvT+ppwNhpz1nmvYN?=
 =?us-ascii?Q?DlGOJVyu5D+aQW6ix8b++tQebkxtg6J31NAYHDloDkcx0j0zuluSAbzEZhPk?=
 =?us-ascii?Q?YyosAMoovfyh3cGjhYchPbfgsFL1mqnUhfeLnrNJqIqsyWhWqYoWfg8ooHvX?=
 =?us-ascii?Q?VRbuYwzdB/+G54p3pR2UCNyy6P7IH5AwhdH/PBh+kpXQ5lbGWuPCWlPGgK/i?=
 =?us-ascii?Q?BE8v1MHTE4pUpOxrLzso5QYqyNpAd9dQRIzmPnUr8QjeKrb/FfghsNE38VBC?=
 =?us-ascii?Q?ro3cS0bMw4D8FYk+7uphgo9La3NgF92k57x5TK+vMa5qwik0HyLO82BTEisn?=
 =?us-ascii?Q?HBMUVmDu7HGOXLKuNmUlbPBcTmE0iL18eUlOW2ia6Z1Wh6CzJPCg3oioFr3l?=
 =?us-ascii?Q?lUOdyL49LEBCdHVFOpbQwuOXD+PA14j4AB9K3yAWWdkHrROAp1Pgd48Z6FVy?=
 =?us-ascii?Q?gDMI+iqj8sPamNYcMO/OZ+c1gzNhR9q3CNCnV7YLtKgsN9KhEZENhWKtdCqk?=
 =?us-ascii?Q?s3V8IXPWXtlO9/bjTkmpnOSZaekYb9KWRr0YloIxKykoNMVib/sZcziWwe7M?=
 =?us-ascii?Q?t0so4lsSMEOawAOWV4BdwGUvFyYKZem3EzHSQDJKrpIX6aPuAw2iF7yGagXM?=
 =?us-ascii?Q?I8Une3S4sYrVbnjOmN+nSCqEIZfJqeOMyzKx1rpN3g3AMF8iZ09ISZoCy0+a?=
 =?us-ascii?Q?M56nd28G6q9szA5liIXoWgR13QEb7/Hv7AwYEFb52h1X1pG/IGJmUEEY5zSM?=
 =?us-ascii?Q?kqaXnQc0ewK/tOram1RRAg4TZJxWM9Sae+Bovqh0TyUPSBAbF/r1vh4pxkaA?=
 =?us-ascii?Q?7ZEhVcTIIwGodlW8cSEByam8+pkZ23BwghfzUpOvbshCnt6xgU0d4u7RvgbX?=
 =?us-ascii?Q?Qu9o+kvrViNjom8tlUaekpfUGoIQdqKfpRXkxUi4P90QYZQitPVsjCC9LwGU?=
 =?us-ascii?Q?v+ilxLypwe4SjD6lCLsUqCS3eMSJPkj3qn+HEztRhuCun5LyjtqAMfJYV42X?=
 =?us-ascii?Q?GmAvPWKlzCypDRPXeCGbsc7XbWCxwCsnGkiIFrFhaieKkMXUlqyo8GPhgs+K?=
 =?us-ascii?Q?mFTWxJF0CG1WQdK1nMMl9YL/y/p78dI0Wj0b6RbbrGrs6Hqp2NH6pDCsDeME?=
 =?us-ascii?Q?WVAHSmMuS0dgBvRauj7Q4PY4msUbdoX7X9jH87plowFkfBq4vGu6vGOsbrg/?=
 =?us-ascii?Q?NixNjuJuFLU9PZnSj28Fk47L9yNFNrRrjsoTqFqNPYSSfCR5ME0+3QHWVyw3?=
 =?us-ascii?Q?jSX2a3kqz6wUQO3zfs6jGR6p/dZ71I8h70MYkopYgH0TyeMx3MMF4srJt9Mt?=
 =?us-ascii?Q?AqTw5r+JvwSZps5vaLSqKBJci07o4Z13GPrOKm0GXZQuYgJBOCN3UxsSlRGh?=
 =?us-ascii?Q?SvJ6nnShWAvu+HCEY1HyNKSsgT0s1sq4KSGBVhbT3HmcSDd35ifcF1cLLHze?=
 =?us-ascii?Q?X3DFzh2g9FaP17C18bNWE7VOT0dZiAUhM9AS+82tVt1dLi9T498Zv8bVkall?=
 =?us-ascii?Q?hSUs56jAhRzHVKwYugfWV8RGVo07fUA36UvrP2WheK44zGtRF04QwSCCs6Uu?=
 =?us-ascii?Q?Yea7hQ=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_TYZPR06MB401558B1B60BFCF97BB5E9E6FC779TYZPR06MB4015apcp_"
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4015.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c9c858d-46b4-4a60-0f9e-08d9c075b659
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 09:23:25.1370 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lhrB3D+mkVRdhWgYciA5RPNhnpi1UHFJXDIIg1aHzo78UeUU0k7SkitlId9ky6W1+4N4V0m8Y1W8FPaLgQd0odbV6GFlMF2hjLvIH3bhlpo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR06MB2589
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

--_000_TYZPR06MB401558B1B60BFCF97BB5E9E6FC779TYZPR06MB4015apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi OpenBMC team,
I created a patch set 1 and waiting for review.
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/49754
Thanks-Jamin

************* Email Confidentiality Notice ********************
DISCLAIMER:
This message (and any attachments) may contain legally privileged and/or ot=
her confidential information. If you have received it in error, please noti=
fy the sender by reply e-mail and immediately delete the e-mail and any att=
achments without copying or disclosing the contents. Thank you.

From: Jamin Lin <jamin_lin@aspeedtech.com>
Sent: Thursday, December 16, 2021 2:42 PM
To: openbmc@lists.ozlabs.org; andrew@aj.id.au; patrick@stwcx.xyz; Troy Lee =
<troy_lee@aspeedtech.com>; Steven Lee <steven_lee@aspeedtech.com>
Cc: Jamin Lin <jamin_lin@aspeedtech.com>
Subject: Create AST2600 OTP image

Hi OpenBMC team

I have some questions about OTP image creation in OpenBMC. To support AST26=
00 RoT(Root of Trust, AST2600 ROM code verified SPL), users should program =
"A public key" in OTP and uses "A private key" with SPL image to create sig=
nature and place it in SPL.
The SOCESEC tool help user to create OTP and SPL images for AST2600 secure =
boot support.
The following are my questions and solutions

  1.  There was a socsec-sign.bbclass in OpenBMC and it is used for SPL ima=
ge generation with SOCSEC tool. Do you agree if I modify socsec-sign.bbclas=
s to create OTP image?

If no, I will try to use solution 2.



  1.  I will create a new recipe to create OTP image and this recipe will b=
e placed in meta-aspeed/recipes-aspeed/otp/otp.bb

To successfully build the OTP and SPL images, we should create the key-pair=
 one for OTP(public key) and another for SPL(private key).

Do you have any suggestion to place these keys in where?

  1.  So far, we placed both private key and public keys here, https://gith=
ub.com/openbmc/openbmc/tree/master/meta-aspeed/recipes-bsp/u-boot/files

How to get the public key in OTP recipe? It seems I need to place public ke=
y, https://github.com/openbmc/openbmc/blob/master/meta-aspeed/recipes-bsp/u=
-boot/files/rsa_pub_oem_dss_key.pem

in meta-aspeed/recipes-aspeed/otp/files and private key in u-boot, https://=
github.com/openbmc/openbmc/blob/master/meta-aspeed/recipes-bsp/u-boot/files=
/rsa_oem_dss_key.pem

  1.  The socsec tool settings should be consistent. For example: If user s=
et the algorithm "RSA4096_SHA512" in SPL, it is required to use the corresp=
onding *.json config in OTP.

https://github.com/openbmc/openbmc/blob/master/meta-aspeed/classes/socsec-s=
ign.bbclass#L8

By default, it set SOCSEC_SIGN_ALGO ?=3D "RSA4096_SHA512" to create SPL, it=
 is required to use https://github.com/AspeedTech-BMC/openbmc/blob/aspeed-m=
aster/meta-aspeed-sdk/recipes-aspeed/security/aspeed-secure-config/configs/=
ast2600/security/otp/evbA3_RSA4096_SHA512.json for OTP image generation.

  How to share the environment variable between u-boot and otp recipes?

  Do you prefer to add "SOCSEC_SIGN_ALGO" in machine configuration file, so=
 this variable can be recognized between otp and u-boot recipes.

  Do you have any suggestion?

  1.  How to trigger the build process to build create OTP image if user on=
ly issues "bitbake obmc-phosphor-image"?

https://github.com/AspeedTech-BMC/openbmc/blob/aspeed-master/meta-aspeed-sd=
k/classes/image_types_phosphor_aspeed.bbclass#L84

Our solution set the do_generate_static_tar task dependencies. So, build pr=
ocess create the otp image first, then run do_generate_static_tar task.

Do you have any suggestion? Do I need to modify this bbclass, https://githu=
b.com/openbmc/openbmc/blob/master/meta-phosphor/classes/image_types_phospho=
r.bbclass ?
Thanks-Jamin

************* Email Confidentiality Notice ********************
DISCLAIMER:
This message (and any attachments) may contain legally privileged and/or ot=
her confidential information. If you have received it in error, please noti=
fy the sender by reply e-mail and immediately delete the e-mail and any att=
achments without copying or disclosing the contents. Thank you.


--_000_TYZPR06MB401558B1B60BFCF97BB5E9E6FC779TYZPR06MB4015apcp_
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
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:24.0pt;
	mso-para-margin-top:0cm;
	mso-para-margin-right:0cm;
	mso-para-margin-bottom:0cm;
	mso-para-margin-left:2.0gd;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:88429001;
	mso-list-type:hybrid;
	mso-list-template-ids:247338540 796664276 67698713 67698715 67698703 67698=
713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:18.0pt;
	text-indent:-18.0pt;}
@list l0:level2
	{mso-level-number-format:ideograph-traditional;
	mso-level-text:%2\3001;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:48.0pt;
	text-indent:-24.0pt;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:72.0pt;
	text-indent:-24.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:96.0pt;
	text-indent:-24.0pt;}
@list l0:level5
	{mso-level-number-format:ideograph-traditional;
	mso-level-text:%5\3001;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:120.0pt;
	text-indent:-24.0pt;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:144.0pt;
	text-indent:-24.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:168.0pt;
	text-indent:-24.0pt;}
@list l0:level8
	{mso-level-number-format:ideograph-traditional;
	mso-level-text:%8\3001;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:192.0pt;
	text-indent:-24.0pt;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:216.0pt;
	text-indent:-24.0pt;}
@list l1
	{mso-list-id:156847120;
	mso-list-template-ids:-1885543804;}
@list l2
	{mso-list-id:540634622;
	mso-list-template-ids:-403513558;}
@list l2:level1
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l2:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l2:level3
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l2:level4
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l2:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l2:level6
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l2:level7
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l2:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l2:level9
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l3
	{mso-list-id:942147320;
	mso-list-type:hybrid;
	mso-list-template-ids:246174188 1921308258 67698713 67698715 67698703 6769=
8713 67698715 67698703 67698713 67698715;}
@list l3:level1
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l3:level2
	{mso-level-number-format:ideograph-traditional;
	mso-level-text:%2\3001;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:66.0pt;
	text-indent:-24.0pt;}
@list l3:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:90.0pt;
	text-indent:-24.0pt;}
@list l3:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:114.0pt;
	text-indent:-24.0pt;}
@list l3:level5
	{mso-level-number-format:ideograph-traditional;
	mso-level-text:%5\3001;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:138.0pt;
	text-indent:-24.0pt;}
@list l3:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:162.0pt;
	text-indent:-24.0pt;}
@list l3:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:186.0pt;
	text-indent:-24.0pt;}
@list l3:level8
	{mso-level-number-format:ideograph-traditional;
	mso-level-text:%8\3001;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:210.0pt;
	text-indent:-24.0pt;}
@list l3:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:234.0pt;
	text-indent:-24.0pt;}
@list l4
	{mso-list-id:1382897664;
	mso-list-template-ids:-2075095078;}
@list l4:level1
	{mso-level-start-at:2;
	mso-level-number-format:alpha-lower;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l4:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l4:level3
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l4:level4
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l4:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l4:level6
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l4:level7
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l4:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l4:level9
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l5
	{mso-list-id:1761608002;
	mso-list-template-ids:-696993992;}
@list l5:level1
	{mso-level-start-at:2;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l6
	{mso-list-id:2043706767;
	mso-list-template-ids:1042340554;}
@list l6:level1
	{mso-level-start-at:3;
	mso-level-number-format:alpha-lower;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l6:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l6:level3
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l6:level4
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l6:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l6:level6
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l6:level7
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l6:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l6:level9
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi OpenBMC team, <o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I created a patch set 1 and wai=
ting for review.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://gerrit.openb=
mc-project.xyz/c/openbmc/openbmc/+/49754">https://gerrit.openbmc-project.xy=
z/c/openbmc/openbmc/+/49754</a>
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks-Jamin<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<div>
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
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt">F=
rom:</span></b><span lang=3D"EN-US" style=3D"font-size:11.0pt"> Jamin Lin &=
lt;jamin_lin@aspeedtech.com&gt;
<br>
<b>Sent:</b> Thursday, December 16, 2021 2:42 PM<br>
<b>To:</b> openbmc@lists.ozlabs.org; andrew@aj.id.au; patrick@stwcx.xyz; Tr=
oy Lee &lt;troy_lee@aspeedtech.com&gt;; Steven Lee &lt;steven_lee@aspeedtec=
h.com&gt;<br>
<b>Cc:</b> Jamin Lin &lt;jamin_lin@aspeedtech.com&gt;<br>
<b>Subject:</b> Create AST2600 OTP image<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi OpenBMC team<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I have some questions about OTP=
 image creation in OpenBMC. To support AST2600 RoT(Root of Trust, AST2600 R=
OM code verified SPL), users should program &#8220;A public key&#8221; in O=
TP and uses &#8220;A private key&#8221; with SPL image to create
 signature and place it in SPL.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The SOCESEC tool help user to c=
reate OTP and SPL images for AST2600 secure boot support.<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The following are my questions =
and solutions<o:p></o:p></span></p>
<ol style=3D"margin-top:0cm" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:-18.0pt;mso-para-margin=
-left:0gd;mso-list:l0 level1 lfo3">
<span lang=3D"EN-US">There was a socsec-sign.bbclass in OpenBMC and it is u=
sed for SPL image generation with SOCSEC tool. Do you agree if I modify soc=
sec-sign.bbclass to create OTP image?<o:p></o:p></span></li></ol>
<p class=3D"MsoListParagraph" style=3D"margin-left:18.0pt;mso-para-margin-l=
eft:0gd"><span lang=3D"EN-US">If no, I will try to use solution 2.<o:p></o:=
p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:18.0pt;mso-para-margin-l=
eft:0gd"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<ol style=3D"margin-top:0cm" start=3D"2" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:-18.0pt;mso-para-margin=
-left:0gd;mso-list:l0 level1 lfo3">
<span lang=3D"EN-US">I will create a new recipe to create OTP image and thi=
s recipe will be placed in meta-aspeed/recipes-aspeed/otp/otp.bb<o:p></o:p>=
</span></li></ol>
<p class=3D"MsoListParagraph" style=3D"margin-left:18.0pt;mso-para-margin-l=
eft:0gd"><span lang=3D"EN-US">To successfully build the OTP and SPL images,=
 we should create the
<b>key-pair </b>one for OTP(public key) and another for SPL(private key).<o=
:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:18.0pt;mso-para-margin-l=
eft:0gd"><span lang=3D"EN-US">Do you have any suggestion to place these key=
s in where?<o:p></o:p></span></p>
<ol style=3D"margin-top:0cm" start=3D"1" type=3D"a">
<li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-para-margin-lef=
t:0gd;mso-list:l3 level1 lfo7">
<span lang=3D"EN-US">So far, we placed both private key and public keys her=
e, <a href=3D"https://github.com/openbmc/openbmc/tree/master/meta-aspeed/re=
cipes-bsp/u-boot/files">
https://github.com/openbmc/openbmc/tree/master/meta-aspeed/recipes-bsp/u-bo=
ot/files</a><o:p></o:p></span></li></ol>
<p class=3D"MsoListParagraph" style=3D"margin-left:36.0pt;mso-para-margin-l=
eft:0gd"><span lang=3D"EN-US">How to get the public key in OTP recipe?<b> I=
t seems I need to place public key,
<a href=3D"https://github.com/openbmc/openbmc/blob/master/meta-aspeed/recip=
es-bsp/u-boot/files/rsa_pub_oem_dss_key.pem">
https://github.com/openbmc/openbmc/blob/master/meta-aspeed/recipes-bsp/u-bo=
ot/files/rsa_pub_oem_dss_key.pem</a><o:p></o:p></b></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:36.0pt;mso-para-margin-l=
eft:0gd"><b><span lang=3D"EN-US">in meta-aspeed/recipes-aspeed/otp/files an=
d private key in u-boot,
<a href=3D"https://github.com/openbmc/openbmc/blob/master/meta-aspeed/recip=
es-bsp/u-boot/files/rsa_oem_dss_key.pem">
https://github.com/openbmc/openbmc/blob/master/meta-aspeed/recipes-bsp/u-bo=
ot/files/rsa_oem_dss_key.pem</a>
<o:p></o:p></span></b></p>
<ol style=3D"margin-top:0cm" start=3D"2" type=3D"a">
<li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-para-margin-lef=
t:0gd;mso-list:l3 level1 lfo7">
<span lang=3D"EN-US">The socsec tool settings should be consistent. For exa=
mple: If user set the algorithm &#8220;RSA4096_SHA512&#8221; in SPL, it is =
required to use the corresponding *.json config in OTP.<o:p></o:p></span></=
li></ol>
<p class=3D"MsoListParagraph" style=3D"margin-left:36.0pt;mso-para-margin-l=
eft:0gd"><span lang=3D"EN-US"><a href=3D"https://github.com/openbmc/openbmc=
/blob/master/meta-aspeed/classes/socsec-sign.bbclass#L8">https://github.com=
/openbmc/openbmc/blob/master/meta-aspeed/classes/socsec-sign.bbclass#L8</a>=
<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:36.0pt;mso-para-margin-l=
eft:0gd"><span lang=3D"EN-US">By default, it set SOCSEC_SIGN_ALGO ?=3D &quo=
t;RSA4096_SHA512&quot; to create SPL, it is required to use
<a href=3D"https://github.com/AspeedTech-BMC/openbmc/blob/aspeed-master/met=
a-aspeed-sdk/recipes-aspeed/security/aspeed-secure-config/configs/ast2600/s=
ecurity/otp/evbA3_RSA4096_SHA512.json">
<span style=3D"color:windowtext">https://github.com/AspeedTech-BMC/openbmc/=
blob/aspeed-master/meta-aspeed-sdk/recipes-aspeed/security/aspeed-secure-co=
nfig/configs/ast2600/security/otp/evbA3_RSA4096_SHA512.json</span></a> for =
OTP image generation.<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:18.0pt;mso-para-margin-l=
eft:0gd"><span lang=3D"EN-US">&nbsp;&nbsp;How to share the environment vari=
able between u-boot and otp recipes?<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:18.0pt;mso-para-margin-l=
eft:0gd"><span lang=3D"EN-US">&nbsp;&nbsp;Do you prefer to add &#8220;SOCSE=
C_SIGN_ALGO&#8221; in machine configuration file, so this variable can be r=
ecognized between otp and u-boot recipes.<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:18.0pt;mso-para-margin-l=
eft:0gd"><span lang=3D"EN-US">&nbsp;&nbsp;Do you have any suggestion?<o:p><=
/o:p></span></p>
<ol style=3D"margin-top:0cm" start=3D"3" type=3D"a">
<li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-para-margin-lef=
t:0gd;mso-list:l3 level1 lfo7">
<span lang=3D"EN-US">How to trigger the build process to build create OTP i=
mage if user only issues &#8220;bitbake obmc-phosphor-image&#8221;?<o:p></o=
:p></span></li></ol>
<p class=3D"MsoListParagraph" style=3D"margin-left:36.0pt;mso-para-margin-l=
eft:0gd"><span lang=3D"EN-US"><a href=3D"https://github.com/AspeedTech-BMC/=
openbmc/blob/aspeed-master/meta-aspeed-sdk/classes/image_types_phosphor_asp=
eed.bbclass#L84">https://github.com/AspeedTech-BMC/openbmc/blob/aspeed-mast=
er/meta-aspeed-sdk/classes/image_types_phosphor_aspeed.bbclass#L84</a><o:p>=
</o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:36.0pt;mso-para-margin-l=
eft:0gd"><span lang=3D"EN-US">Our solution set the do_generate_static_tar t=
ask dependencies. So, build process create the otp image first, then run do=
_generate_static_tar task.<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:36.0pt;mso-para-margin-l=
eft:0gd"><span lang=3D"EN-US">Do you have any suggestion? Do I need to modi=
fy this bbclass,
<a href=3D"https://github.com/openbmc/openbmc/blob/master/meta-phosphor/cla=
sses/image_types_phosphor.bbclass">
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/classes/image_=
types_phosphor.bbclass</a> ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks-Jamin<o:p></o:p></span><=
/p>
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

--_000_TYZPR06MB401558B1B60BFCF97BB5E9E6FC779TYZPR06MB4015apcp_--
