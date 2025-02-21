Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F9DA3EEA4
	for <lists+openbmc@lfdr.de>; Fri, 21 Feb 2025 09:27:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yzjsg5ZwCz3cG5
	for <lists+openbmc@lfdr.de>; Fri, 21 Feb 2025 19:27:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:200f::724" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740126414;
	cv=pass; b=Xv9uvOJCJNDIEVIbEgpIKDSTMq3IORJavw41Fj7IAhtUSoONtMbDqfOXvNsbVWISaTKyrbWmuE/D1DQrUtNbKTLAf+1z+ILg4wA126GKh+JthGV13SMeogkDewe29aKu1pIe674RvYvJ/BdtKxxUPsaEZhNmWLFaJp1Ic4WQpI+GSs7XOWqsLXkcwdlApRuL/h5a4sk+yo85XsmyT+NKPug4MXoYociir1q/Zsqp2Yi+pvI2hdlK+VuCXHeUZLYK2NKSqKKdKkybfBtT3YlgREaWHG+iKCD4xXAk9UuFEykDSwWrIj7eetX5sIXrjhY/0E4UWTAMxqq+L05TAoKKuA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740126414; c=relaxed/relaxed;
	bh=jj3BFtIdCXh8sF/NFp9G4sqf9ccFvga3/sZLML2tnU0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=i/uEyljFv3ReiF9ZVumQIF6kzVXJrU2X0m8TZLocMeWlwzqq8pVMeP4NNepPOsUJjT07SkD4dW/iijyDeIyL4hBrBEWPMrm5TjMOGwT/H4cuN8PAsyJk4Zfjbs9iun3A6Kf48AEFr+GDFXQypgg8zMWWSNYC2RAd2tEq88txvs6uqN9aJmvHtecVTaiESueyjC5IOo/kiCep5QcrJosX4LisnsT6B1npEV7I9ItLkFPGmLpt54U6714rgNLgHyXa4fixxFqEzUrsT/G2zkjyLgzyfCKijzfGtDtQ7qieJLMC6GWjSbkzkNr3UAPefw9FaAEs4tvbA7ZJ3IxiCZ3nfA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=aspeedtech.com; spf=temperror (client-ip=2a01:111:f403:200f::724; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=temperror (SPF Temporary Error: DNS Timeout) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:200f::724; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on20724.outbound.protection.outlook.com [IPv6:2a01:111:f403:200f::724])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yzjs85d0Vz2xFm;
	Fri, 21 Feb 2025 19:26:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DWgpS0csmm2m4lcb5a6wbE9rTtnUSwH3iFs0/3/NWgSpiKK8aMwEo5LjLTUAoZDyJ+Pn+A8DEr3nHbGsA1sRLBJylj0AJ9jM9gy8YY8N7QYyPJREJg4Q3e1TvX/lXOLbIGoE+xKpefiTxtOCGZzI+8sY+pcJUc77cVTSU0jYrrQ0m+Ivj6alsrQmOoiycpMTtzI143glL0RLZGg1+T0fu0GdDIBTse1d1s7SgbThsiINy0hwIACUhvdbOfeD6Kf8GANPSIilIv7aZcJPGa56NHyIScGh0yvUQLB6hGyIFvqIaMnwa4zDkixcbFpBi4uxTXgyimOzb2EI4+hzbb+qUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jj3BFtIdCXh8sF/NFp9G4sqf9ccFvga3/sZLML2tnU0=;
 b=lC2ZiOew6QyrmCo5LgVJNNnnh8XFwp5ntq8E3VT04o0j0V2+Z1twGRSYkLvkJFh+ywOELqQMI6WgqT2YxdwSkJWXaO+T1ACwHXN2bKisriSevYyxvX6OmEi1cAx1XXEEY4lWwe+rXg4RPFiU/Rx/lThiTzcOR2mkOXsDVcIgrCmhcSlhERiZlnU/iWYz0qB6XmEjhf8ai/DsoAHwBZOGLtMG8BQdyoutwSbGPIR39RindAQsdnif/jUXgj8+w1NKNEZQ+ZB0CrSFelIWQ/eC9SMRWC7ifyohrJqfqz5wUMBVWJmOEBTFigpzW6Lxbzlq8Fn6OGbEgVmr2S8o/8AkCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jj3BFtIdCXh8sF/NFp9G4sqf9ccFvga3/sZLML2tnU0=;
 b=aSBpS+B3FJLIHfOXjfS4qgSv8NZsNl5EXJK3v0ela3wggSTzPbwSr3xwIY3ni34S2XQMGKF8EcyaXhkOpBfkJ3kYTAyxrER8i5MtL48/h3tpfNvPZ35mKUijlRG8rAqM8lv68QuswMZSAbyXUCx0wDEqeJOf174YnhGod7KIhAGjlRutHZoYVvHS+HZ0ulZhFpGHuVgbizux4KyZVTat20aHIC4Ivpjy82LvS6kO4wiy13Qp0v6F0eEBtbGS1rfWZlF4if52TX6NbGuL6beYMmVSiTrR0m5FV/IBdnKlprwCziEoXRuLfYcOMbiMSPmE4JQQu0bzrNCTC4U331OZNw==
Received: from SI6PR06MB7535.apcprd06.prod.outlook.com (2603:1096:4:235::12)
 by TYZPR06MB5227.apcprd06.prod.outlook.com (2603:1096:400:1fc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 08:25:53 +0000
Received: from SI6PR06MB7535.apcprd06.prod.outlook.com
 ([fe80::8af2:b731:a5e5:169f]) by SI6PR06MB7535.apcprd06.prod.outlook.com
 ([fe80::8af2:b731:a5e5:169f%5]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 08:25:53 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>, "brendan.higgins@linux.dev"
	<brendan.higgins@linux.dev>, "benh@kernel.crashing.org"
	<benh@kernel.crashing.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v15 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Topic: [PATCH v15 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Index: AQHbGGxcg35U+p0xVUGbHH/SlZw4qLNSJngg
Date: Fri, 21 Feb 2025 08:25:53 +0000
Message-ID:  <SI6PR06MB7535BFD3377505F5191AED7FF2C72@SI6PR06MB7535.apcprd06.prod.outlook.com>
References: <20241007035235.2254138-1-ryan_chen@aspeedtech.com>
 <20241007035235.2254138-2-ryan_chen@aspeedtech.com>
In-Reply-To: <20241007035235.2254138-2-ryan_chen@aspeedtech.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI6PR06MB7535:EE_|TYZPR06MB5227:EE_
x-ms-office365-filtering-correlation-id: fbf73d1a-e819-48fa-df17-08dd52515b45
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018|7053199007|921020;
x-microsoft-antispam-message-info:  =?us-ascii?Q?8HXg+QfjUAoNKEQknxhR5oxXAhbAKGQCdPWjN6xO+LIYbmVwYyWyy29ElmPV?=
 =?us-ascii?Q?w34fj88zrWUh1y33T5VlQjpnAk/lorsk21m/uoyHwC698RQvhKiKZXl2hHF2?=
 =?us-ascii?Q?8ipKTxtnOoOuWC07Mxh0tXAkqy11TondyFcO2xb6QUgC5QJ8+DcQYNcPNF1d?=
 =?us-ascii?Q?lxjDhZAaE5WPwFbhmDRmRUhK475tuyx09FDon30L5KqhhbB1eRuz/GQrRulp?=
 =?us-ascii?Q?/u5vAJvdnCe6vlW0VV5SdyLyKQRCG2U0K7NIwbcymyn3Rfn2tjC5YJ355grj?=
 =?us-ascii?Q?9OI4IVGjIjKu4NEI33+WweXHMM1GIZD3qXQfj8oS1D6AWQxwuUGoeoh+eEYS?=
 =?us-ascii?Q?WGOZij4r7JBqr+FeXohV1p8njkGyylvoQ9/X4SAojj1kP2Yz2lPZPtQLiM5l?=
 =?us-ascii?Q?Y+ekHDtWsqv+FBnFOr0MV559z8mpE8lhu/191VUJCcmvbERZ3PMUniX07W2h?=
 =?us-ascii?Q?HjIMuH+1Ohkm5/JwxCNqzBWbrYvjYAi7p198lGie2StozD5sIumjDfPcEUTu?=
 =?us-ascii?Q?Vu+goSVSDuGAJVtLVfjTo72qc3kFTRuzWi3V/jH2Z2CU+dyewfo4sZ/9OrYA?=
 =?us-ascii?Q?zhVgJIQT8sQD8sIaseyCANXSpeXQ/tG01FBZeqOP/FYPexmY/GhU1FAjDxFd?=
 =?us-ascii?Q?ASj6tc3xdcAM+saATXLyuwFfzgM3WaqC15O9MY0DAsECo6ZEiDe6xRao1gWd?=
 =?us-ascii?Q?jkAOOKr3iYakSGOktRRwad81/suCJw5c+mBzsdYAVT5MBkjxk4+0/dn11ejO?=
 =?us-ascii?Q?yH3YlSb8DDMel13HVcrx5G96y6HRhDke/l2n8lf8KZSpQ48kgFX9nXwPIqcD?=
 =?us-ascii?Q?05nWrAM5oiNZDs0+4ToJPFdWgRr7QpG3c7WWKBEmLkFdECmPT7fjRzckYOgL?=
 =?us-ascii?Q?n28OzC0iBlcPq1BiFFo/yRgD02Y4hdzIyxOBqMp/ld+NcJGGKGgMxF7waRKK?=
 =?us-ascii?Q?7M64cr6FZs5TC/3PTZgUn5i/tPzL/qMaaQkdweiGLg5nLtgUtJmi3vpwtZNy?=
 =?us-ascii?Q?7GCvntQWV75bvok0rK5ybUbQ59FwnVTNcJ73xxp9qcwMm/IThTXiDd0F8bMk?=
 =?us-ascii?Q?IPflGyF4S5bDXo1dRpqErGS4sCJBOPx/MOdF03MZPkKeAq/qIDwpsbHrltnI?=
 =?us-ascii?Q?GXf1gARLN0yLX8hGIwfZckzDX+sX8388uE1+gUNh2wJIxe+KAWOqXq7AZpOD?=
 =?us-ascii?Q?DzaxQ/kbVV3Dsdt/iAxgK3/nhihQLa8mWC3ShFhYO3Ia36G9SjTHDx46Cdhj?=
 =?us-ascii?Q?BAtZ1cnDJgSL/kC1NUZD0yP+ICtPFaqqM3YJzgoaDWOrtVcZ43PBFQ7xgQiT?=
 =?us-ascii?Q?dr6WgGbAUTGryK8U/t3G3hH1b4Gq5j8Nrj/eq/NLNtZQElOI23KK9XHTYsGz?=
 =?us-ascii?Q?pKvxJbtsmClcuOnf0fRM35vqEywuR3VUnTd1wJwF2TFxelLb3EBujJ8U+Z/U?=
 =?us-ascii?Q?aZMYT2j8nIC6NGMZe0mUPK7T8Pa8G5faLQSGgRjsWomGARqF1/GLAQ=3D=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI6PR06MB7535.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018)(7053199007)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?0T7k6XRbGxxRghJVO9krtBBTOKx4EKdJqPf2hmCIx8IS70zaTkqPiUMXEDhj?=
 =?us-ascii?Q?JtLe4j9JZ1SEAkXGoMcmlAR3CNJ7SMml+cJnTh1X7dzFfVCJjil4PSGeJsNt?=
 =?us-ascii?Q?fTPk8YSa/G4/YUri+/4PCVWMAzxMr9jfE7Z5mqlBmy5dbtwqp6f3JeAq8C0m?=
 =?us-ascii?Q?btw3jj6pkh/JGThcLmARb/JXuRhpTgagGkwjuczv4201MOKHQFN+sIjAmgaY?=
 =?us-ascii?Q?ox36Y5oc6fKpTNa3Ay+FBEKqGis8UodpibL+8eAbpJpNJug21gZVQpSvUNeh?=
 =?us-ascii?Q?p7SWu+xM1fjNVdpsuKJOXi0Mvch+q3oFcN+9P8/TEeqE0iQXR3ikG3MFrOgq?=
 =?us-ascii?Q?QQKF6dFWbYLKqXL8TQ5YlKDlA3LtBAYd8g1/0zXfcUz6Xh4tkXhV2/KLW1Rp?=
 =?us-ascii?Q?8N7i9r+RKjXFlTRzMucGUHjyVaWw9ZZsA4SMKw4QMxCXtI/u/NpxL3OWNXN+?=
 =?us-ascii?Q?2ye2eVLFd3xUhJbt2GEXvano9P/Enj/fKyuA48Ac32hxVlDYGj8bOxHfdLD6?=
 =?us-ascii?Q?xhp6zBy3jW+8lnE1slmIfrn5sBRpZ/v+ytZG78xoWLW9qK+FKsE0VoygxRK9?=
 =?us-ascii?Q?RsaYh7OqFqlmAPK5fxoXlg403rJeydlNHaQIfKku8nalhWDc5t39FhBX5kRt?=
 =?us-ascii?Q?RofrVkb9PkAxeG+FJtQlefl/r1buQklQR7P30b/6pj8mP8PFJ+rO3IOTpz+n?=
 =?us-ascii?Q?0g/FE07kEqxCTdTSugJ3OZaHkGz2np0XP52JpX8HgqbKkrVReQld8Y1fISHD?=
 =?us-ascii?Q?jDJBKffTrzzQV5NyWii0h0qPtwGq2b/POPZ9CfIOSOvAA9ANlHNMRLpOMGxi?=
 =?us-ascii?Q?sm94thQwZ7YsKguB4oy16bpsuSjhrtuE5d/PIzlN1UT6doagxl4q52Bd47WA?=
 =?us-ascii?Q?LOczYNFeDEdYZRnjIO73sqkWy4E7i49rwuV1xIQM5kdIDoNsVXsXjNl87BnL?=
 =?us-ascii?Q?nQe2aF4NeGCxpIpKZ8Z8qmTvco5x5r+uCGtPVqmsC80SUDdsHuTxoMN3RvkI?=
 =?us-ascii?Q?oqOWM6MkYlzzbXE0AFUDCKs9w4xIzFaNfmFDEddvZu7WtVwFkLknuXVDscPq?=
 =?us-ascii?Q?iV477H0ZSlhgwfuiNqL1mA2LMh/TZxam9bJLEmEab7rViTU/nIYT2dYehszF?=
 =?us-ascii?Q?UTFHY+raAHtAWL16ZQUNK7/+A4VcrO2qud/F2E8AYx0TV7BbTwSOF5WpFXpK?=
 =?us-ascii?Q?mCG+ToBTBtIMVilEHE/mwwK0L/gOgWEh/FFwAdxWRgarHBuMaU7x0PqnA464?=
 =?us-ascii?Q?rWy9uY/3EDi9DrNdt3vB9vz44ts0lzkbbi+9JTMyRJcDVXTkM6ksMOJIVplT?=
 =?us-ascii?Q?Daa4w7JzVrAgrND38BUvcgU+lOJ5IiVxAd2VkwBtGIakdt9io/2ZAgpFJVcB?=
 =?us-ascii?Q?7SalwqPwAOhpVfdW2sXSHmDJWWhRL3Gto+TQykYzKloxB+tI/o+vDpBGrv0p?=
 =?us-ascii?Q?S+o3xfK1H5qbtXRg/pyaz3cKqCItWim8b8GPABj6hVZuiYm4Mp+7JSvhmVwJ?=
 =?us-ascii?Q?a9ycO/yBBmfGnnpglVRlyGmCtD3VYa22njB7LKkuB/OLej7EvNAAJAXvPES+?=
 =?us-ascii?Q?cwu8N0cEgyLOpxL/76yXYqkUBwmi7L7ggxkrC9Xt?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI6PR06MB7535.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf73d1a-e819-48fa-df17-08dd52515b45
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2025 08:25:53.3121
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qeex+Lm5yoIlgARvi2uBl8ymH1k+9LRvDKe0EEt8L+8y5ZfxETTZOv7z61dl0pzsskOsoyCXZVjuvAKQgsyeDJI3noS0OamDEY2/Phgp0bA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5227
X-Spam-Status: No, score=0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Krzysztof,
	I am going to submit v16, and will update the yaml file, in my this versio=
n will add aspeed,enable-byte.
	So, we should I do about this patch about " Reviewed-by: Krzysztof Kozlows=
ki <krzysztof.kozlowski@linaro.org>"=20
	Should I remove it ? or I should keep this Reviewed-by?


> -----Original Message-----
> From: Ryan Chen <ryan_chen@aspeedtech.com>
> Sent: Monday, October 7, 2024 11:53 AM
> To: brendan.higgins@linux.dev; benh@kernel.crashing.org; joel@jms.id.au;
> andi.shyti@kernel.org; robh@kernel.org; krzk+dt@kernel.org;
> conor+dt@kernel.org; andrew@codeconstruct.com.au;
> p.zabel@pengutronix.de; andriy.shevchenko@linux.intel.com;
> linux-i2c@vger.kernel.org; openbmc@lists.ozlabs.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org; Ryan Chen
> <ryan_chen@aspeedtech.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Subject: [PATCH v15 1/3] dt-bindings: i2c: aspeed: support for AST2600-i2=
cv2
>=20
> Add ast2600-i2cv2 compatible and aspeed,global-regs, aspeed,enable-dma
> and description for ast2600-i2cv2.
>=20
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 51 +++++++++++++++++--
>  1 file changed, 48 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> index 6df27b47b922..6c16fc76c978 100644
> --- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> @@ -9,9 +9,6 @@ title: ASPEED I2C on the AST24XX, AST25XX, and AST26XX
> SoCs
>  maintainers:
>    - Rayn Chen <rayn_chen@aspeedtech.com>
>=20
> -allOf:
> -  - $ref: /schemas/i2c/i2c-controller.yaml#
> -
>  properties:
>    compatible:
>      enum:
> @@ -49,12 +46,50 @@ properties:
>      description:
>        states that there is another master active on this bus
>=20
> +  aspeed,enable-dma:
> +    type: boolean
> +    description: |
> +      I2C bus enable dma mode transfer.
> +
> +      ASPEED ast2600 platform equipped with 16 I2C controllers that shar=
e
> a
> +      single DMA engine. DTS files can specify the data transfer mode
> to/from
> +      the device, either DMA or programmed I/O. However, hardware
> limitations
> +      may require a DTS to manually allocate which controller can use DM=
A
> mode.
> +      The "aspeed,enable-dma" property allows control of this.
> +
> +      In cases where one the hardware design results in a specific
> +      controller handling a larger amount of data, a DTS would likely
> +      enable DMA mode for that one controller.
> +
> +  aspeed,global-regs:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of i2c global register node.
> +
>  required:
>    - reg
>    - compatible
>    - clocks
>    - resets
>=20
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: aspeed,ast2600-i2cv2
> +
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +      required:
> +        - aspeed,global-regs
> +    else:
> +      properties:
> +        aspeed,global-regs: false
> +        aspeed,enable-dma: false
> +
>  unevaluatedProperties: false
>=20
>  examples:
> @@ -71,3 +106,13 @@ examples:
>        interrupts =3D <0>;
>        interrupt-parent =3D <&i2c_ic>;
>      };
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    i2c1: i2c@80 {
> +      compatible =3D "aspeed,ast2600-i2cv2";
> +      reg =3D <0x80 0x80>, <0xc00 0x20>;
> +      aspeed,global-regs =3D <&i2c_global>;
> +      clocks =3D <&syscon ASPEED_CLK_APB>;
> +      resets =3D <&syscon ASPEED_RESET_I2C>;
> +      interrupts =3D <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> --
> 2.34.1

