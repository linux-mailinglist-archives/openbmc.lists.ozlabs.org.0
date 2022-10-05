Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5B65F50CF
	for <lists+openbmc@lfdr.de>; Wed,  5 Oct 2022 10:30:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mj76j4Q34z3bhv
	for <lists+openbmc@lfdr.de>; Wed,  5 Oct 2022 19:30:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=WlpgLWsA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=40.107.117.101; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=WlpgLWsA;
	dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2101.outbound.protection.outlook.com [40.107.117.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mj75s4XmSz2yQg;
	Wed,  5 Oct 2022 19:29:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BtcGD+NLdTh42A4M0a8fl1KRTannJmA7NsWHSByZg++QSpFKqA9lD/LoStk7qV7/vIYCaCgg2fHm7qP7Np/G8zQVk0Nw4CUuiuybtzPcE5pSckPT3EalfrceYUZv57rR1vNjNfo16OGKMTNdjc6P3OLO9K1oheAyXLRSfKnP7Ukx6W6QRbG/xfrhKMr39RRfmBby7BEJCkQwAPzljwtBFHezh4uKxihCF24PduOB9Pr+MnwILEMjNIq8bW/8Z71AiBMSOeZHI7+hFsz29PidQ3lhQrzZeGnhnf4C6gSoSS1QFyN4hv3PgkVHS2zZOimiGRbtCHsL8BuAPhjBDzSY0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMuc0KpusrLoY14RxC0EXGpVK0WXHAaT1bX8Fj1gbwk=;
 b=IzoyRcUoAE0kA1SW5YMQThCPj1ul436zkg3AMBg3bm9lFD85SmHKmHQGoHaXxtqR2606/pFadSYZBlDDqewDVwP65nmzOrc6Xwy3dlladgBJfPm2U2kfft0zkAH+IvB2s7Z4kisiLMmVvghOo51O6qnl7pqh+siNqOmaq0fRFiAJ1xgUH4HhVX6ijt/h6fXajfU9dW8CeuPSFIRelO1xujbKic4avjIO1lYxqDOKZ9FDpVHQJnmUSOf3nO4tVUWJv7ANlj6jxIwXcAIX+AWjbyTXLdpMtzwKdgMSIXK/QocNBkAjhiZDT9sgHWQwZ2WMN6od8/1mHcSeb2DbNA86yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wMuc0KpusrLoY14RxC0EXGpVK0WXHAaT1bX8Fj1gbwk=;
 b=WlpgLWsAkg+s2VtKEDZjby9AMSh5/f5hI5vBNQZ4YknC8Y/HrLjR+Iy55GsR/adedJBnil+fh9KNc5h6qp+YLsGoRIExYC+R1Zvl0i4nBrhvjajRcWxBrwq8JR0Gmb9pqptGkO6IHv/Sdduj/N4ukAXa5LnyszAmCgVBKHDP//J5rj+NC2GcCXff3czytgIATGpPFoMmPw5lbIJ8RafOkbJk4tf3lBmXUN0F0+vsF6uFATBfzgYD7Jz1nGOB9GheWI62FbZYEwkUk0pKcK+ITi3geBeoKzpJn4/WlRyDufIaLQWdcSDQKLD29PHWf8B5CJPscld7T+Fi8eGKgWQ4UQ==
Received: from SG2PR06MB2794.apcprd06.prod.outlook.com (2603:1096:4:24::9) by
 TYZPR06MB4160.apcprd06.prod.outlook.com (2603:1096:400:25::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.31; Wed, 5 Oct 2022 08:28:56 +0000
Received: from SG2PR06MB2794.apcprd06.prod.outlook.com
 ([fe80::3cb2:66d:2326:3f96]) by SG2PR06MB2794.apcprd06.prod.outlook.com
 ([fe80::3cb2:66d:2326:3f96%4]) with mapi id 15.20.5676.030; Wed, 5 Oct 2022
 08:28:56 +0000
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: "clg@kaod.org" <clg@kaod.org>, "broonie@kernel.org" <broonie@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, BMC-SW
	<BMC-SW@aspeedtech.com>, Steven Lee <steven_lee@aspeedtech.com>
Subject: RE: [PATCH] spi: aspeed: Fix typo in mode_bits field for AST2600
 platform
Thread-Topic: [PATCH] spi: aspeed: Fix typo in mode_bits field for AST2600
 platform
Thread-Index: AQHY2JClpiPOsgPiCEe4cPCpJhyAZK3/dyuA
Date: Wed, 5 Oct 2022 08:28:56 +0000
Message-ID:  <SG2PR06MB27941000292C6BF5BE7575F8B25D9@SG2PR06MB2794.apcprd06.prod.outlook.com>
References: <20221005080104.175769-1-chin-ting_kuo@aspeedtech.com>
In-Reply-To: <20221005080104.175769-1-chin-ting_kuo@aspeedtech.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR06MB2794:EE_|TYZPR06MB4160:EE_
x-ms-office365-filtering-correlation-id: 04460681-374c-4fee-3483-08daa6aba51a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  8REn4xkjLqgpV0cIJTUYEhGrWvKFmvVkiw1ICKeSxBGKxff/dfe+OD/L+F9alo7024IEZYJICA+dzbjCXL5FL7TqgoIsETmYuuvVsU7JQtBS9BJAixEztOJdzbSV1CbPc6qW11YCrqkkKYikF6sYT87fBf84JeliZOWlGowJb55e5PPPJMhPDNIGSNPVGWinOzxJJUhuX7dBFlWiVdAauW81Vgh44ILuBnY/OCStiOL6YlIMp84MS1bQRVsjGQb/ftYSQH0j5XRMfTMHme2pR90uyDw7LNk9h7I75ps1NTsaQiJOZ6CM4vi/HsC/d23UaEZLJ5ffZbahdaLUBGL/jzXbUCme1X6IP9L+L40+80qcHgylZ0YdAGfHvYGf9smjVUEiWMlYD97L8doejw+Jca/u2xy8R+/qb4jUi76ohN+v6Ad5u1gUIgsDZl7rZCX0BVowDn1oNLVAggW08Loj4jWH8d3v9JCE4kgbE9/NR5yI//o2kMy//n6yk5s6qSYI77mF21VftA1TyESRGUzZkl7d882J+ux6xfS/PiPfUqTX6v+mHyN2sMfKHUfUouuN0fqfj3d0S+tw23mnoXIdGu7yzdlPsya6oiuAYWU7h9kOf4t1gnCriUuNOdH+QXSBa8hnqZ/Jg50CTaN2f3s4U1qRqSp8rRyLXiW47Ma5ElrgSssmJLwaZyjsqWrOKm0Ehf9F0Q4qlvhpUG3zFlQFsblFfhCfnPCuSglMsnK1QXf7EgaAX9D8eHl7pxbIqKnhV4dICItV0Dg2FUbvG9uSojpYrE9/b+dnpDOOBOMx9Jc=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR06MB2794.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39840400004)(136003)(346002)(396003)(376002)(366004)(451199015)(41300700001)(52536014)(6636002)(8936002)(86362001)(5660300002)(110136005)(8676002)(316002)(66446008)(64756008)(66476007)(66556008)(76116006)(66946007)(33656002)(71200400001)(478600001)(26005)(55016003)(122000001)(38100700002)(9686003)(83380400001)(53546011)(6506007)(38070700005)(921005)(186003)(7696005)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?R4pTgOpKE7QP/9DUCw9kMWaeoi9bM5jYiDzckdefhdxOsuyWv0vVbqKx0yKX?=
 =?us-ascii?Q?Pv1fXW5UfKJWJjNPpr96DJWPH7OeV2LU2/DBKkCU6emS9Lwl/JQN6N9aItE5?=
 =?us-ascii?Q?iaqd6ikyiDfzBHOUtfl3qUuGFcxOcxap47OGh3zYPMuDUQJ5qE0S7eIxW7AE?=
 =?us-ascii?Q?vPlVZ8LWKxx7svnik4SM+AF5F7XG8gqD+LAwojwZT1Fg4FD7pX2ZeVCQB2Fp?=
 =?us-ascii?Q?ATUiffV8149+jCKuvfHYj91ZBI2735MDzUmdlG2jrqmygPscgZZc/juS+Rk5?=
 =?us-ascii?Q?wVuM51qD0cxxOLxYWOHCLPhE2mVzU0A18PVWMfEFBV6ytZ3v8KUa9AkL+WDm?=
 =?us-ascii?Q?SHq6rf+NZ37LcArEoJBvKpn3+kCdqonn9iVuf0uti80Gb204Ji1t+Eli0SWI?=
 =?us-ascii?Q?EaA1/ehSBcxCD3N+xMBVeX74xch6ChqE6oniGSZugOnMRT2P1En+RuPeuiP2?=
 =?us-ascii?Q?agnj/JDWm+vaTAtJmtLF05vePEyjIC/obyvHNBtFJC4RxNvNn0+KhWO+M/6Z?=
 =?us-ascii?Q?pV3ur0qclBzZkfnGDTwa28qwCCqt+WQ9ABeHOo0zZ3Ii+TWHTSRy5hYcp+j3?=
 =?us-ascii?Q?aiLrB6hcoTM0PXNwe+LhcMFzw1HOYcv7q3mXgPIP6VtI2NDitWoPq5mQZRFN?=
 =?us-ascii?Q?8KH2OQA1kI7Xcbc+T1mgfFtCAYxn2XIAYgW4TdIb1sTWpnPH/z8Emsln70zu?=
 =?us-ascii?Q?6OaBlkYti/kArV9EQSRAnAB0/7mljKBZ8atFlkr/3jwBi65FptxTPlbCTwAf?=
 =?us-ascii?Q?Ss4J4gTSHGiC1MfFPHjBrrFVa5ZpctPF5TGAa6REr4hlSHKYEno+bA10R/4Q?=
 =?us-ascii?Q?njAdEtIol6V5rnxYoH3NhCaRytzMZHGDw6q6pqFnnKQ+95fjr+nfzapapjJi?=
 =?us-ascii?Q?VfFleKZmJQy6q8gH/w/qhnfRHBrBRgmbNZASVBYgk9iiEQGuNOJuAangpoS0?=
 =?us-ascii?Q?F3mD7nyqW0wKTHvIvL88kvGPaoXZRQK/pABeTKHslQ7XaKMaS1nBOVw5/HyV?=
 =?us-ascii?Q?rIvZh2iknfECLPKX0k22vJJBGuM5UX6oGXEXNddvZYFqeHIX6v4WO4UREXag?=
 =?us-ascii?Q?9EEHzzYE28D/JAA6yBO6RPirfu2t2JOTt1nlt4CTErqqJEqh8nhVJTeU7IYD?=
 =?us-ascii?Q?GjnvyNirdYF8RUmF+U+Edw/V4fD4eENapBQ14UORo4iaf9/Asq5TQnALxzef?=
 =?us-ascii?Q?q2w4kCIVmxjY91OTjJEce82Zw47d57hiFzkT2XRnmZZmBFY61o9y9Opk0ZDS?=
 =?us-ascii?Q?YC0A9si8geU5vuDa47aSOI3aurnmdX4fIgu0VKQu7+CtpN0kBRwqdug+JiF9?=
 =?us-ascii?Q?b+cwGLuGDgAYr7qyYA52zVgO97JHzuX4H6DEQZmKPfgo5cO7pKUeVkm6Kq9x?=
 =?us-ascii?Q?eoWoiTP1qss83gN1M7ZnVMH/+A4lwcOeYGUosE06v3tXXeEYM+K22n+9FmXz?=
 =?us-ascii?Q?psIGAgJT/XumiNaPgDEGt/sIyPZw6OwOzz08Kithxhm/xOZ0ekcZPcaaU/DP?=
 =?us-ascii?Q?ScYVWwQZDMyfl+MDSMdH/Oh05UZ3wBpXV4k/NIxlBwn41DdATlClKJgFIWpM?=
 =?us-ascii?Q?8HdE37ydt/cre3o1ERSl0o+B9PtwGb9i2DaUiv+Bax0XJOYddwKsbomVOnm8?=
 =?us-ascii?Q?ag=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB2794.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04460681-374c-4fee-3483-08daa6aba51a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2022 08:28:56.5297
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 30dwNc/Zq3ewRwzNU+v1FE3jDwsZuE7BRJF420ZrT2ogKgdy6xD9PUVSe+AoIXYXTu/0FXcjBIJfNsDiXNyX9ElrCsh7D1HBgbCnBuMl2+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB4160
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

Hi All,

> -----Original Message-----
> From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> Sent: Wednesday, October 5, 2022 4:01 PM
> Subject: [PATCH] spi: aspeed: Fix typo in mode_bits field for AST2600 pla=
tform
>=20
> Both quad SPI TX and RX modes can be supported on AST2600.
> Correct typo in mode_bits field in both ast2600_fmc_data ast2600_spi_data
> structs.

A missing "and" in "both ast2600_fmc_data ast2600_spi_data structs" in the =
commit message.
It will be updated in the next version later.


Chin-Ting

>=20
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> ---
>  drivers/spi/spi-aspeed-smc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c =
index
> a334e89add86..33cefcf18392 100644
> --- a/drivers/spi/spi-aspeed-smc.c
> +++ b/drivers/spi/spi-aspeed-smc.c
> @@ -1163,7 +1163,7 @@ static const struct aspeed_spi_data
> ast2500_spi_data =3D {  static const struct aspeed_spi_data ast2600_fmc_d=
ata
> =3D {
>  	.max_cs	       =3D 3,
>  	.hastype       =3D false,
> -	.mode_bits     =3D SPI_RX_QUAD | SPI_RX_QUAD,
> +	.mode_bits     =3D SPI_RX_QUAD | SPI_TX_QUAD,
>  	.we0	       =3D 16,
>  	.ctl0	       =3D CE0_CTRL_REG,
>  	.timing	       =3D CE0_TIMING_COMPENSATION_REG,
> @@ -1178,7 +1178,7 @@ static const struct aspeed_spi_data
> ast2600_fmc_data =3D {  static const struct aspeed_spi_data ast2600_spi_d=
ata
> =3D {
>  	.max_cs	       =3D 2,
>  	.hastype       =3D false,
> -	.mode_bits     =3D SPI_RX_QUAD | SPI_RX_QUAD,
> +	.mode_bits     =3D SPI_RX_QUAD | SPI_TX_QUAD,
>  	.we0	       =3D 16,
>  	.ctl0	       =3D CE0_CTRL_REG,
>  	.timing	       =3D CE0_TIMING_COMPENSATION_REG,
> --
> 2.25.1

