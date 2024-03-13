Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2273287A321
	for <lists+openbmc@lfdr.de>; Wed, 13 Mar 2024 07:59:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=xo7Kf9dj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvhFw6qhHz3039
	for <lists+openbmc@lfdr.de>; Wed, 13 Mar 2024 17:59:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=xo7Kf9dj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::615; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20615.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::615])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TvhCz0r1cz3vYv
	for <openbmc@lists.ozlabs.org>; Wed, 13 Mar 2024 17:57:51 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QuEHIZLy5eLWrA/0rp6DzM5WmS4hloQqetTNDo7gaNZt8l2i3Otpv5INQXP5E6pDqCYxzBBcsdaIN6ctgd2JguEfBqPc3gNxEaNPMdtnlcB79X+jPBpjNm1k10MK7m0+eqpnA+IjzBZQgK5q/UvL39sSr0s4D/pOOHHV/ap6h6TAsVqMRpWBbmIDhHMHDq3+KWFa4GZPO/E3TiylroVxzrPp3y9rPchzbjN04H8g8bUB5JqkjGDjqJV+LDzx9/ZJwDlHS1aKQob9xKdPzJ4kpUt18UETDsLU8PcJuCDrNJK/WhUSa7hVvUoFmP+Uzsm/jnW/heGHTvf9YcyCs05fSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0mFGQ01dBiqip0fUSuh9ZYHCUjk/sIAr4jRkLgEo89Y=;
 b=hspIXZfptsjSDSn67b2FTLR/5ftUGB/JrVkt3sds6OJ+ifeiEeLCGTm9I5TL0vX3w80MRzlDrTndK3D2if6biieUe7WvgyI2Wk6lfuNz6K6LfSr3zB2qwSo3FC9eL0IThszf4EerbKUPBM6XnvB7FcRbE5FVQlJvwUtFzEwAhSNjoR8vclHfNlawFhdpSoNIFTVyS8p3QRHB4nOsArnzRMdd5FjB7Xqn+f+ej5P18+2Kg6Nvs/wgKj0pdAx1txJO8kbsnLjI+fycRDeukzuZBHfcLhps+nXoLYdO/xsLhDE62kqyAWSWAfrkp7NdAopJ1CTWaNiTvsimgW8LVhDlNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mFGQ01dBiqip0fUSuh9ZYHCUjk/sIAr4jRkLgEo89Y=;
 b=xo7Kf9djjvOX2hNRbfgbembQTBsOhAJ7N1qpLH7HnXlWVD7soWSLf8VdYiOKuy9K9D6NFQbi2FhZydcs0oX2rPVg/Ajow1TbR5ROCf5L3U+Fs7qnoEaKFjrnko0U5MO2WNr91jf+OxzZNtU7mdw8dQnNbmXbemsXUBUD1PgyKSO0uoFDqwpvz9rSM8yAg4XpkLF3SlWwKYrQ/4KqGY96mij2IG7H/Buc0gsTrsroNTOJJSGYBfsbcTXBrCXqvVtOdIqwgKJaXwmSd7W7MY2LZwp3HKgBj37vH+0HI+mHsJIDCoOBcJJvGv4pk1IIktBISDmWCnma6ag0RKU0xxcYJw==
Received: from TYZPR04MB5853.apcprd04.prod.outlook.com (2603:1096:400:1f3::5)
 by SI6PR04MB7925.apcprd04.prod.outlook.com (2603:1096:4:24f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.33; Wed, 13 Mar
 2024 06:57:26 +0000
Received: from TYZPR04MB5853.apcprd04.prod.outlook.com
 ([fe80::7cab:4c63:26d2:5f1b]) by TYZPR04MB5853.apcprd04.prod.outlook.com
 ([fe80::7cab:4c63:26d2:5f1b%4]) with mapi id 15.20.7362.035; Wed, 13 Mar 2024
 06:57:25 +0000
From: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>,
	"patrick@stwcx.xyz" <patrick@stwcx.xyz>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Linus Walleij <linus.walleij@linaro.org>, Joel
 Stanley <joel@jms.id.au>
Subject: RE: [PATCH v1] pinctrl: pinctrl-aspeed-g6: correct the offset of
 SCU630
Thread-Topic: [PATCH v1] pinctrl: pinctrl-aspeed-g6: correct the offset of
 SCU630
Thread-Index: AQHadPAQCNfRzKU/REGwDwaoATPZ9LE1PK5w
Date: Wed, 13 Mar 2024 06:57:25 +0000
Message-ID:  <TYZPR04MB58539A1D94340F330CAF3CF9D62A2@TYZPR04MB5853.apcprd04.prod.outlook.com>
References: <20240313024210.31452-1-Delphine_CC_Chiu@wiwynn.com>
In-Reply-To: <20240313024210.31452-1-Delphine_CC_Chiu@wiwynn.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiwynn.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR04MB5853:EE_|SI6PR04MB7925:EE_
x-ms-office365-filtering-correlation-id: 1c48da80-071b-427f-a14c-08dc432ad73d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  iRdNo897R8BEFQ6YQNFvGzI9rwTICAwMHNFyCG8PMIaUEK6jDE2eR2kq7CC+JsWea2omBrLdEFe9wwBk4NmLVN5XoSX2Zl2NLXNVzvF9zHcZ751ShIwP2CCpEUcSru+5rL4bHsp5byhyCcj0xZcTuf/uHV16+movE0cd4XFzcx2nTFPibOzQGqoZKElFcT778SXlmoNa4G2XgEg+prwIpfziD0IOlYx+U4x6Of4b5Tc7BmI6xeEZPaLTYmOP2+1FQa6ySElmdFoVwE/Adqj/Rp3syEzcaTViWcm9nD/ihZbf2icXnaT96FCbunzTE0IzOa1M3adLiLH3vHBjQ26Wg60zGWCO8puuBaGDTgq5lF+IWG5EmsM/mkADDLQ6fpOvFMunzxtEx4JSz9pXqljYtJpRTWNUXNfjXz6NcFiR0Me/EK1Vz0U5hfcA9vmxJaSrJH2Vqh80EPXMUbsbPxbs67o38eNH4KzoZpLjdypnguOsJf5/tiSz174XdYwf5+BiGmWLVnHuwXt9vPqUg82f4YcFF5xYck2P6Te/J1/Gih0eYld7ngYJPamZdG0ehucKXOA/qU7mxvzuvgqxt8oBpUQv2dXeFSfyKNZcysYo2dVXWz9aaYVSUsbkrJsnQPf1fRtIIAC/p+WUu8h3XPrpz96IgNfebCRQZ8ac/RnsVAv8fw2JW3MZEB3AcZhOZNe6o1Rs8hTm1Enom3xH+JWM34lyrUBwOjWM49xGZ0c45JA=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR04MB5853.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?XvmiVp5pEvPWb5FdCu6pRUW1hf0LXLbXSAXbpJVnLQ9fNJFWLidYuP5lsrCP?=
 =?us-ascii?Q?jTrMAIvCFFB2EvPDIrxOtvIwuU6ZCaZPUk2XwjVl34ip+uvuMcGMPxet4OHX?=
 =?us-ascii?Q?Lj458dgcEubu7IpMaWsFxgDUW58mkACY99q/4SZgeXTb6vvfJ1l7qWstXBOR?=
 =?us-ascii?Q?4VvblzAaTjE5ie6L32Eea852+vPUE0S0om7DsmBcoqGFruwmCrL6A4Ilce84?=
 =?us-ascii?Q?tn5Tj6yzPxZbpyzKg/DxQnV+tjH+YtDG5sdLOCgrcnQxuqaX7WDQaXNENV6u?=
 =?us-ascii?Q?30eu/RNLxzQoLVH0sIEI7OWcbHHq7fefYTDWRJX88wDDc6wbQwH1r23yNBwZ?=
 =?us-ascii?Q?w9TOXah/3JjZI+pwq7Pnd1gT8haWguLZODEACqr7OAGPaJV2VTBMKuT1ZAIn?=
 =?us-ascii?Q?V2TPib3fBxxioopoKX4TKjSnMgGhm9oYvfZyxYq9BRAMrov3NZfwQOBcCYVJ?=
 =?us-ascii?Q?fgd1TDavL7OlYjgL9ZyxNxNyzlNVIhj4Pk+3o5FEAz94n5LzfuNtqO9pxLpL?=
 =?us-ascii?Q?Zyq4coEFmUVnWYtNgoVDs3uMQd0A8X53phRFlCWRkCW4XJekEh28W1qwBRbh?=
 =?us-ascii?Q?ZF/ncNRDPRy6J0zUUrOWjShQeID6MEBVuQsUD24e+ymZEY/OQCN1ktFUJZQh?=
 =?us-ascii?Q?0je/ts0zfmVgxgO//yaIv5TYBFbVZsP7x3c4kLqE1ZipshUHfGxuB+cHiqnC?=
 =?us-ascii?Q?Po1WOloyYLdvchu08whomvotuO6KvWmuaVdd7wMCRqUeVgt0IJLDxM4QH92U?=
 =?us-ascii?Q?pEGh8sPctw9uExsUGr9Pjb9voXPFqbWT6rqYq3TzD3C2rkdrz385xuGSiWiz?=
 =?us-ascii?Q?718aBVvF3oQSRiBHHsApwkTOcS1JwH+FQpfv2C7UCPepnwVnQ1H9IzwA6V/n?=
 =?us-ascii?Q?4jeAXWmTb4yTbYWjB1z9ypFKNft0b739jCFJAzVK628zvxdG7ZOGrnCYlsAP?=
 =?us-ascii?Q?TkgeFs+HmIDPQXDgkdTof805A0zir4P/m3lGWsfsbMOBez2LylCNaIpOphK0?=
 =?us-ascii?Q?KoD7B7aaoN0l6rCQDOoTERiwsk5SwTXrZfa0qoILREZUWXI20wbvEQueisAm?=
 =?us-ascii?Q?aUqSWSpUcQ3SXHsQfkCyn92ao320wslYlFb878P0hR9pslgkKhI93phgnBoL?=
 =?us-ascii?Q?QDE1KUQnHGTCya1M64Ujwrj3Gjuj88+HSANanH+8OFa7WDwLEiET8LkJ0gOD?=
 =?us-ascii?Q?3LZ4QcMXxEtzDHlbU8FVajmPrl+gn8cDV0vERf5/69kKUIQbMCDIfVmbL0tR?=
 =?us-ascii?Q?z9rOW8XbaZ4S0TmoFXDrEzo/6afpNAhn2u6Z726Sw4o64iK4KcUboJqE5lly?=
 =?us-ascii?Q?FoYrz8uWp1Xfp3dER3hQ1Vp0UMk5p7xBS9NltNVZMAhrv/q5SSUHaNypmIjh?=
 =?us-ascii?Q?vrecS9wk8KPaq3wyFjR/M3iBZ6aoPZRI1uAInc3P3NRslyTUkAgzwCv68Whi?=
 =?us-ascii?Q?v7ADDyTBgi22RxNxY6w3UAhAo3WtlRRFU/FwJ5sBHgex3L+xVdkOVQX6zaaF?=
 =?us-ascii?Q?Nq8fy2oPRx/Uuq6kgZuAshCk8nyNgQ/qXyC69TpnoHtfnA/8u53SFYl01nNt?=
 =?us-ascii?Q?VIuPfcgwBZKHCT98bw0B+TlJW7wiLIeBw8q62xc3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR04MB5853.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c48da80-071b-427f-a14c-08dc432ad73d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 06:57:25.8537
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bxDKNn4jrPk+knTjOR4mZqk7YFrCRAWraEQ9ViIFt4VeFD2Niq0tSkVtzpOzmCCC8NjFFwL8HS3R0ocxwE+UGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI6PR04MB7925
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> -----Original Message-----
> From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> Sent: Wednesday, March 13, 2024 10:42 AM
> To: patrick@stwcx.xyz; Andrew Jeffery <andrew@codeconstruct.com.au>; Linu=
s
> Walleij <linus.walleij@linaro.org>; Joel Stanley <joel@jms.id.au>
> Cc: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>;
> linux-aspeed@lists.ozlabs.org; openbmc@lists.ozlabs.org;
> linux-gpio@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> linux-kernel@vger.kernel.org
> Subject: [PATCH v1] pinctrl: pinctrl-aspeed-g6: correct the offset of SCU=
630
>=20
> Description:
> Correct the offset of "Disable GPIO Internal Pull-Down #4" register that =
should
> be 630h according to the AST2620 datasheet.
>=20
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> ---

Hi,
Please don't review this patch since ASPEED also provided the patch to
fix this issue.
Thanks!
