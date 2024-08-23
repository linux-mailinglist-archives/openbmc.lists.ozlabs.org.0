Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF9695C567
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2024 08:24:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wqqmf4LHsz30V1
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2024 16:24:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2011::721" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724394277;
	cv=pass; b=iuBHysv26BXsZpVhFGZPdBE/QXMWkdvzIAZm2xImwy2aY0AhAQ+chPT5mpuLylCp5J8VR1TBfymcjTZjgobZ22uAkszTUOXHiJ00+3HmlVuAeWda/3iAEFxkAmDCVjAC29nCGB00epoY/G1dRlDCzPn/LDK41CpWzPrpYuFVS+GpDgyn3udf/w5LzSKdT8tDllzI8Wx9QSYAFBn7+h1jFAFpJNu409vPqugyVN9WfW7Twk/SMr6XzNKYdXeLPLrbaXliFM5ihqiKl1R8hD7cdOTeKmYHefKUKT2gaKACp8jltee675bO5IgHJo0PMQRZlWrdXNuFmLoO7cIleBcatg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724394277; c=relaxed/relaxed;
	bh=PX4Abp43m/babbT5xL4hZJEVo3xCGLWRyiio7u1Wkgk=;
	h=ARC-Message-Signature:ARC-Authentication-Results:DKIM-Signature:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:
	 Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-C
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=2a01:111:f403:2011::721; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:2011::721; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20721.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::721])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wqqm02nMGz2yhM;
	Fri, 23 Aug 2024 16:24:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kOx10aedKa4mTF2UwxV1OPVV5gf7CVrJZJnOaFmnXVG/dCqvGJv7W0mnO4ZMcdVINFJEv3AnPtwSB+R9HEithowkGLkywvlChK9z91YKYoZOn04FNQt/2XQI4/jEPRSwAygRgPoCGxNwMp3GgMsFRzjvScO/lt4QMAuQnkOhoLihRdsC1A2usbFqjtLpm0tzoqOExONWh9bYKm9irwEGP6Tu/sE9kpRQ4bISeNmKjZK8BBnGSZ5zJT6rh83IfQcBcBqMqwSuDD1vSDj6IkPJbEznpP8jrFhd84lERZZuIYpxoUwgZzobChwtDjL0eb6x3R/I9v395+L2YRSWY4Au1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PX4Abp43m/babbT5xL4hZJEVo3xCGLWRyiio7u1Wkgk=;
 b=VT5aoZy4YpYqGwtVWRLAFRDDmUp0+Bu2hIk52L8CADgy3AezCjwZOERFaHqWlzt1hf6tzMM3jt0GzZVuqSiyvp/3yazoYhdf8BbP33kbmwBDbKCUD9b6YP94KPjSIxP/MIGEgwxeDO9DkxR3boyAJOE+8tQjXtg3RTmC3Rl8wlAKh/uUWqwth8H3kunS4kWnU1NRUo6cKyHdN+wUvKvs1DIVFtxQ0SFpuG6leKHT3BpZrJhd4OI6iMcHNdIx2uW/B736BHusRWWc/Vni2vWcC0vVh331vjzCOXhORZZnulYsEsEJK73K/Fnbf4st0FAp2xDsPZC6jqxHkrmBctI2hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PX4Abp43m/babbT5xL4hZJEVo3xCGLWRyiio7u1Wkgk=;
 b=KtXsF0Qs+Mz3jO7EpeQT/elt8GZ7AfmlAGO9BDhTE9GLr9GOjX+brWFj6tOY4QHzsDUdG8I25t8mqk/41bEMIhxhTAhNBXlUIcqeqnnEjJvMuJwLLZBv9jfD6XCb3wKykSDEa9nVI9El8LpqFT3CXOtZ1Jyj7VQI/md3n63VKKBtetcFXG5Ps6qdhnoqtpA/o5jPSVzhZE/Jd2RBA0IYlB2iAgbm8mydAZrxYfp/MGTXPq0OIdlpq9X2K3a+xarIWxpFas3zW4UTipKu1NjQqva9IHaGVW3kk1iOGsOhK+D9AwHSIr8fTI4h7vKSc6eYoQdeSNTO8juR+37Qz0JxDw==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by KL1PR06MB5942.apcprd06.prod.outlook.com (2603:1096:820:de::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Fri, 23 Aug
 2024 06:23:54 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%5]) with mapi id 15.20.7875.019; Fri, 23 Aug 2024
 06:23:54 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v13 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Thread-Topic: [PATCH v13 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Thread-Index:  AQHa8ho4oLFWUX2yC0qHT9Kfp3UIaLIuoMcAgAJo7hCAAJOvgIAA5YcAgADIa4CAARTpgA==
Date: Fri, 23 Aug 2024 06:23:54 +0000
Message-ID:  <OS8PR06MB75419F3E3A222AE941DE3007F2882@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20240819092850.1590758-1-ryan_chen@aspeedtech.com>
 <20240819092850.1590758-3-ryan_chen@aspeedtech.com>
 <ZsNT7LPZ7-szrgBJ@smile.fi.intel.com>
 <OS8PR06MB7541EE5BA5B400445FE0295EF28E2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <ZsXVU2qy0GIANFrc@smile.fi.intel.com>
 <OS8PR06MB7541945591A62B956DA28AD9F28F2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <Zsc9_UddBybdnM1Z@smile.fi.intel.com>
In-Reply-To: <Zsc9_UddBybdnM1Z@smile.fi.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|KL1PR06MB5942:EE_
x-ms-office365-filtering-correlation-id: 1df2a51c-254a-4f81-7633-08dcc33c299d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|366016|376014|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info:  =?us-ascii?Q?NYkqazPXtW/WZgpCQJJQDI/pyfsxz6GYDPSu0aqGRZC2bhKIvRttd90cfLO9?=
 =?us-ascii?Q?PBuj0bnCj60aKT13j7bqDyPzXow/JcCTX8eB4JXsOnffMagkvc7T8Qv5Im7a?=
 =?us-ascii?Q?qw0H5XraJxigeJSh9keNq2DiX0+vp9NPFr6kh+xS8yUJa85i9B6HbzlLwplT?=
 =?us-ascii?Q?cI4focibGMYttwFe486F+Ty39YNGPi2NTKfMf2Djg947MwjcxJZloCUvFtbL?=
 =?us-ascii?Q?FY2O0F/FjCh+4fwLDfJ8jlru1+y44TDZ+k1hnW9IU8ooTFffOTpX1ykml/xx?=
 =?us-ascii?Q?Hxszws0DARVHBzmnQvAKg4++aKy5jbHsrbXC0hCPJ8RfdOjqpy/EvPZ+IbzT?=
 =?us-ascii?Q?pxvERm3uXC+XVbceXg6em0kMyUkZv5/PxthesbAurGtlWmZB/gbSlq3GBEWC?=
 =?us-ascii?Q?esv4aeJvC+ZyZnfuq6jxHStJW6aTT/QxZLmZk/MmqekkRL3ghKhJtUa5coTi?=
 =?us-ascii?Q?BEj3XaSYCGuSP33bKyjCCbWIqOI7Jr31A9UEUnAtFPVtjQSlWC3wwxZ0UAH9?=
 =?us-ascii?Q?130QIiX+r1sMuB0iJnBmIiUmdfirNJkFwwAGWPFhxZ6gCjnRnOmZ0N4HQQ9y?=
 =?us-ascii?Q?F7qiir5pXLKlF0qzIkiH8LYfRMkkllGNVIQm6HJ2B3D7FvHnSjSFqeRAEkUg?=
 =?us-ascii?Q?++wBuOEC0Fog/45Wa88BCPekTbcdBjT8Vcus//w3Uoux/e/NEwl3xDku7AS1?=
 =?us-ascii?Q?qPO8zKs7spE/rcKvshZ3PDhCUFhJzzUcv4wkqUeoq5xtXQtx/drIrNLeqNSN?=
 =?us-ascii?Q?76ZDRXMDqOd7aEZHyMismG1GWrd5d+eSkQKOh/sG0H/vYF3AdS98ClGCybkE?=
 =?us-ascii?Q?bMhSxB2/i6v3N6P5k/Dx3mL1nIuDW1XaWHhf03dHdreAA9jKPwPmiDpdkf9r?=
 =?us-ascii?Q?KXs/2RZ6TI4NJZzb64RhvP+NDks+RGU7pF2m6zUAqWBvB9GNi9u8SWxOHai5?=
 =?us-ascii?Q?OmiHZeG2HDtWF0VBgZ/pPIacXJDzQeiLH1svwpZG0sz+wVTrHNG8ogfWgDc1?=
 =?us-ascii?Q?o9/nijlqu9C0qDx/9FTazqIevCflSrmOHsH0XS+3zZmn9q9T0+ae6ipMVGDL?=
 =?us-ascii?Q?F9/10B7NdXXwmNzcQolNx/hCkkPp3/iycwB+EKhRpLshen2MzLi1VNrFI3CG?=
 =?us-ascii?Q?KVwvBdXAmu1RRXmJvXscSXA0sE6VcMOp/1tyXHwsPZAPlmlnAjT03S1hHx72?=
 =?us-ascii?Q?BMRMwj6k/3hRAwIPjSev0bGua3Xfs67ubUEooZQBjuBvg3hYSRbFsMWA/9Ui?=
 =?us-ascii?Q?sZjjXLdL/H5ajqw2tTh7gGDWJy/dmTAniw3071OQO+d7yG8jh6cZED74Smls?=
 =?us-ascii?Q?ItuIr4eiDGoLypBPhEtSJDTa/N9hV3I3X06TlYKpQWzTpV/BLPBi+JVtOw0k?=
 =?us-ascii?Q?fvHaHt3fRSBEwmNTtHhTMu4MBGc/XG4KSEHdyFk6fpSm5VXswA=3D=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?C6EtPt3a6xYhkTNQYvgCwh+3yL6t2F+y4bMpfiwUoe9DGw+n4fjDGuJLrp6j?=
 =?us-ascii?Q?O/dkV3yM8Ptgm0xqBeZ6IbaQzyNgpGVNOKhFT01GEXPBKBiCDsUKkbFSuXFb?=
 =?us-ascii?Q?uG8gZZAq1s8TS79H9MbSxqJ+H0HwWQTwUbBEb7PpMC1Jkc+8cCwnGrNK6ipM?=
 =?us-ascii?Q?fr646SiVMAIq2+Uj6ukB63U2L7g6YQBjQyK5NJ78lhpZm2SgBMaZDs7pyB4s?=
 =?us-ascii?Q?U+H77ar/NZ8som/wU3kUVyXtJPQLcHVLXcB8FLvvnMG/MjTSU7voSWp1SUCQ?=
 =?us-ascii?Q?0uQ8V1XSxmaSubmFCwZ+cF7UjM8l6/H0NCrxB3qy6e7SWT+eksiAAiarkCpp?=
 =?us-ascii?Q?8vo7FwhjNDMkxyhFFLsurBwHtLO/eW9d5aPHGhhtiW1ygKnNZKcj69Sz6IhN?=
 =?us-ascii?Q?rwr7VM10TsSAJ7zEKT2F77fI64F1tqkzQVCm6dD3dtYgmaXWND+WeNP00UWx?=
 =?us-ascii?Q?decH/i7qBOUNdiiwvbZ5LtBK6oALFpYYfGnRcPX8UUB/o5EtfUF+fbyXuTMU?=
 =?us-ascii?Q?OjuF+QIVlBssyfSxpg5wMPTiaqCi7GaTGLEb0S0dhMkK4TxWH2HnTkiIx8wz?=
 =?us-ascii?Q?kS9YVvL3jF8M9HRPRzduDMRwUoFPTv90uPFyUGETEfwuPSCh6dA7K8gHXGOw?=
 =?us-ascii?Q?K7lugD+T1n0VYmrZSQGD+9nnlE+Hg8+PNYknaKG17qsmrQ5Do75cLc+SB8Dg?=
 =?us-ascii?Q?BE36pqCRW64MxfHZHe9lb3jaUrCDJBhQ5gC35zGuhi34oqP1TnnIG+wCRSds?=
 =?us-ascii?Q?JMC+Ui8EamL2hbUmSJZDw5HvkK6ScZc+pZqelaiBPdvPnJkadxYd2fJZYb8/?=
 =?us-ascii?Q?xBOIWpC+rgAmUZEsByhilASdu8PvGqeXra6Bau+k+ma4zBd+uhOyI0AIzKh4?=
 =?us-ascii?Q?GDAXKgpSrQssJuOimzn6wQbYfAEe8f2WxMUluYibIlg1A9H6pSEx/jj2FpbO?=
 =?us-ascii?Q?Tw0+TexIaL2FAuWEsrfKO4cbpFCHG9RZRS36a18RaZsQ3xHxKczemK3AZPJV?=
 =?us-ascii?Q?6cGhWKkAJMDYcMUorTz6KVCEg28ccRXfNGIGPQGjE/8jE2GN6WTqeCMctedj?=
 =?us-ascii?Q?MMNUOD8k9AXKm6Tu6YHEq56TvQv7bcsKbwirZdGPaKwuVPRYG6PbJnWp75Wk?=
 =?us-ascii?Q?xBtr+K0foKuTCGALUcCZ1VASaYGUcVhJfqoy0m8Bz1ruchqLhzwGP40nxER1?=
 =?us-ascii?Q?gZMYAA2fU/8RIKorzZL7lxef/+F9LSIvwBwDibw7+jU00uI1XWUa1Cspgz+8?=
 =?us-ascii?Q?kOmXAGoPahBhZADdDgnaw15DAVMdruNko0tXk+pFioqiWkdPC1UFVXGo9gVK?=
 =?us-ascii?Q?TH/HoI8i9Y1/Hh4dimPGLmNVag5ztOxFug4OtBJhMiWa8KTTdDdweQjnfIa4?=
 =?us-ascii?Q?Gmc/T4eyn/CHKYS8tAcezkEVGX1lAGujf1uieY+3k+dI1PRpRTgeBEtTeVub?=
 =?us-ascii?Q?qgq5bXPTtHdsmwF9ZGQ8ZeGD2KlksVzgULqbVRd5nQayBOBu//nY8tlm9BUR?=
 =?us-ascii?Q?JudFmUOKCVkDIFJcP4fhoPyQeCSGcvq+V5045drfL+1pBJkddoMZeeILf46k?=
 =?us-ascii?Q?B0rEHRHTrkHAlYOwHpKGYusLMYs7FHjMY+9ls9Ag?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7541.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1df2a51c-254a-4f81-7633-08dcc33c299d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2024 06:23:54.2888
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2tWtjMwbUzCIrNOE67uG7Rg9M+KLRfzjeakPPz7M8FJszDKUvx9jcNPMJa8cLERp+Rj+WwSDiHV5jW59UfxKNaLrp2IQpOyMpGe3nW1oLi4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB5942
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
Cc: "robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "brendan.higgins@linux.dev" <brendan.higgins@linux.dev>, "joel@jms.id.au" <joel@jms.id.au>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> Subject: Re: [PATCH v13 2/3] i2c: aspeed: support AST2600 i2c new registe=
r
> mode driver
>=20
> On Thu, Aug 22, 2024 at 02:24:26AM +0000, Ryan Chen wrote:
> > > On Wed, Aug 21, 2024 at 06:43:01AM +0000, Ryan Chen wrote:
> > > > > On Mon, Aug 19, 2024 at 05:28:49PM +0800, Ryan Chen wrote:
>=20
> ...
>=20
> > > > > > +	/* Check 0x14's SDA and SCL status */
> > > > > > +	state =3D readl(i2c_bus->reg_base +
> AST2600_I2CC_STS_AND_BUFF);
> > > > > > +	if (!(state & AST2600_I2CC_SDA_LINE_STS) && (state &
> > > > > AST2600_I2CC_SCL_LINE_STS)) {
> > > > > > +		writel(AST2600_I2CM_RECOVER_CMD_EN,
> i2c_bus->reg_base
> > > +
> > > > > AST2600_I2CM_CMD_STS);
> > > > > > +		r =3D
> wait_for_completion_timeout(&i2c_bus->cmd_complete,
> > > > > i2c_bus->adap.timeout);
> > > > > > +		if (r =3D=3D 0) {
> > > > > > +			dev_dbg(i2c_bus->dev, "recovery timed out\n");
> > > > > > +			ret =3D -ETIMEDOUT;
> > > > > > +		} else {
> > > > > > +			if (i2c_bus->cmd_err) {
> > > > > > +				dev_dbg(i2c_bus->dev, "recovery error\n");
> > > > > > +				ret =3D -EPROTO;
> > > > > > +			}
> > > > > > +		}
> > > > > > +	}
> > > > >
> > > > > ret is set but maybe overridden.
> > > >
> > > > If will modify by following.
> > > > 		if (r =3D=3D 0) {
> > > > 			dev_dbg(i2c_bus->dev, "recovery timed out\n");
> > > > 			ret =3D -ETIMEDOUT;
> > > > 		} else if (i2c_bus->cmd_err) {
> > > > 			dev_dbg(i2c_bus->dev, "recovery error\n");
> > > > 			ret =3D -EPROTO;
> > > > 		}
> > > > If no error keep ret =3D 0;
> > >
> > > It doesn't change the behaviour. Still ret can be overridden below...
> >
> > Yes, it is expectable, previous is issue recovery command out then the
> > following is double confirm the bus status.
> > If bus still busy, the function still return recovery fail.
> >
> > Or should I modify by following?
> > 	/* Check 0x14's SDA and SCL status */
> > 	state =3D readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
> > 	if (!(state & AST2600_I2CC_SDA_LINE_STS) && (state &
> AST2600_I2CC_SCL_LINE_STS)) {
> > 		writel(AST2600_I2CM_RECOVER_CMD_EN, i2c_bus->reg_base +
> AST2600_I2CM_CMD_STS);
> > 		r =3D wait_for_completion_timeout(&i2c_bus->cmd_complete,
> i2c_bus->adap.timeout);
> > 		if (r =3D=3D 0) {
> > 			dev_dbg(i2c_bus->dev, "recovery timed out\n");
>=20
> > 			ret =3D -ETIMEDOUT;
>=20
> This assignment doesn't make sense.

>=20
> > 		} else if (i2c_bus->cmd_err) {
> > 				dev_dbg(i2c_bus->dev, "recovery error\n");
> > 				ret =3D -EPROTO;
> > 		}
> > 		/* check bus status */
> > 		state =3D readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
> > 		if (state & AST2600_I2CC_BUS_BUSY_STS) {
> > 			dev_dbg(i2c_bus->dev, "Can't recover bus [%x]\n", state);
> > 			ret =3D -EPROTO;
> > 		}
> > 	}
>=20
> > > > > > +	/* Recovery done */
> > > > >
> > > > > Even if it fails above?
> > > >
> > > > This will keep check the bus status, if bus busy, will give ret =3D
> > > > -EPROTO;
> > > >
> > > > > > +	state =3D readl(i2c_bus->reg_base +
> AST2600_I2CC_STS_AND_BUFF);
> > > > > > +	if (state & AST2600_I2CC_BUS_BUSY_STS) {
> > > > > > +		dev_dbg(i2c_bus->dev, "Can't recover bus [%x]\n", state);
> > > > > > +		ret =3D -EPROTO;
> > >
> > > ...here.
>=20
> See above.
OH, I understand now.
I will modify following

	if (!(state & AST2600_I2CC_SDA_LINE_STS) && (state & AST2600_I2CC_SCL_LINE=
_STS)) {
		writel(AST2600_I2CM_RECOVER_CMD_EN, i2c_bus->reg_base + AST2600_I2CM_CMD_=
STS);
		r =3D wait_for_completion_timeout(&i2c_bus->cmd_complete, i2c_bus->adap.t=
imeout);
		if (r =3D=3D 0) {
			dev_dbg(i2c_bus->dev, "recovery timed out\n");
++			writel(ctrl, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
++			return -ETIMEDOUT;
		} else {
			if (i2c_bus->cmd_err) {
				dev_dbg(i2c_bus->dev, "recovery error\n");
				ret =3D -EPROTO;
			}
		}

> > > > > > +	}
> > > > > > +
> > > > > > +	/* restore original master/slave setting */
> > > > > > +	writel(ctrl, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> > > > > > +	return ret;
>=20
> ...
>=20
> > > > > > +		i2c_bus->master_dma_addr =3D
> > > > > > +			dma_map_single(i2c_bus->dev,
> i2c_bus->master_safe_buf,
> > > > > > +				       msg->len, DMA_TO_DEVICE);
> > > > >
> > > > > > +		if (dma_mapping_error(i2c_bus->dev,
> > > i2c_bus->master_dma_addr))
> > > > > {
> > > > > > +
> 	i2c_put_dma_safe_msg_buf(i2c_bus->master_safe_buf,
> > > msg,
> > > > > false);
> > > > > > +			i2c_bus->master_safe_buf =3D NULL;
> > > > >
> > > > > > +			return -ENOMEM;
> > > > >
> > > > > Why is the dma_mapping_error() returned error code shadowed?
> > > >
> > > > Sorry, please point me why you are think it is shadowed?
> > > > As I know dma_mapping_error() will return 0 or -ENOMEM. So I check
> > > > if it
> > > is !=3D0.
> > > > Than return -ENOMEM.
> > >
> > > First of all, it is a bad style to rely on the implementation
> > > details where it's not crucial. Second, today it may return only
> > > ENOMEM, tomorrow it can return a different code or codes. And in
> > > general, one should not shadow an error code without justification.
> > >
> > Understood, The following is better, am I right? (if yest, those will
> > update in driver)
>=20
> Yes.
Thanks.
>=20
> > 		Int ret;
> > 		.....
> > 		ret =3D dma_mapping_error(i2c_bus->dev,
> i2c_bus->master_dma_addr)
> > 		if (ret) {
> > 			i2c_put_dma_safe_msg_buf(i2c_bus->master_safe_buf, msg,
> false);
> > 			i2c_bus->master_safe_buf =3D NULL;
> > 			return ret;
> > 		}
> >
> > > > > > +		}
>=20
> ...
>=20
> > > > > > +	if (i2c_bus->mode =3D=3D BUFF_MODE) {
> > > > > > +		i2c_bus->buf_base =3D
> > > > > devm_platform_get_and_ioremap_resource(pdev, 1, &res);
> > > > > > +		if (!IS_ERR_OR_NULL(i2c_bus->buf_base))
> > > > > > +			i2c_bus->buf_size =3D resource_size(res) / 2;
> > > > > > +		else
> > > > > > +			i2c_bus->mode =3D BYTE_MODE;
> > > > >
> > > > > What's wrong with positive conditional? And is it even possible
> > > > > to have NULL here?
> > > > >
> > > > Yes, if dtsi fill not following yaml example have reg 1, that will
> > > > failure at buffer
> > > mode.
> > > > And I can swith to byte mode.
> > > >
> > > > reg =3D <0x80 0x80>, <0xc00 0x20>;
> > >
> > > I was asking about if (!IS_ERR_OR_NULL(...)) line:
> > > 1) Why 'if (!foo) {} else {}' instead of 'if (foo) {} else {}'?
> > I will update to following.
> > 		if (IS_ERR(i2c_bus->buf_base))
> > 			i2c_bus->mode =3D BYTE_MODE;
> > 		else
> > 			i2c_bus->buf_size =3D resource_size(res) / 2;
> >
> > > 2) Why _NULL?
> > 	If dtsi file is claim only 1 reg offset. reg =3D <0x80 0x80>; that wil=
l goto byte
> mode.
> > 	reg =3D <0x80 0x80>, <0xc00 0x20>; can support buffer mode.
> > 	due to 2nd is buffer register offset.
>=20
> I have asked why IS_ERR_OR_NULL() and not IS_ERR().
>=20
OH, I will doing by this.
		if (IS_ERR_OR_NULL(i2c_bus->buf_base))
			i2c_bus->mode =3D BYTE_MODE;
		else
			i2c_bus->buf_size =3D resource_size(res) / 2;

>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

