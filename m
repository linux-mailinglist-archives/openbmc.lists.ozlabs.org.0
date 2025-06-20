Return-Path: <openbmc+bounces-278-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E66AE2708
	for <lists+openbmc@lfdr.de>; Sat, 21 Jun 2025 04:11:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bPHrg0Vldz30Vf;
	Sat, 21 Jun 2025 12:11:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750397104;
	cv=pass; b=WZSlYUbAK11Avp5m81edTsAqPb8YJADiKWcHXLDnDnTscdWHc8eUSWf/Xhyeygy4ctuyn199jqNuCSIFrD8umhOx60p+OPyO3qq+l/zQoUX77dkoMObthl5ultsYOnjYt6/Je/xuUKvZ+Y5jBaoy3PObDhSw+d++r1JUV+X1KN3ptxKI4jYFGnbg8nM+xPFenND7BkIVfFGq5AH08zzqrAj80eHA6V9kPlnhEq7kd+yVVwWLYIRsU/bm213rW3P46dE51LGbm9dWi2ysDwOnipB4s11r5Ck9oQJYvLuW9oXsB0BvstgitDuUow2/N5LZ6VfNkuCs+OE47Ko+ULmzIA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750397104; c=relaxed/relaxed;
	bh=xno+TyT2NxIdXrRHhTmwJPGQVXGTV+FavXmfgywjO9I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MxVURvlRKPUUEM6X/TOL9GHyobQZUiTY16uytqI3/bjrhDgYqMtyXCrIU1AxrhbN9qoyq6OpXcX7DvGV26g3GoCTBWD0L0vxqU4FDcIH9+ePvDoFkTEiqVH/DYau9Zlq5jWmx5vL80wzal0ywijidFVfQhYnPYAp4Ck+eh/TBEctYMcvlq0FWEDkaE38COQmw8E0MlYZQ2idW5eBHdb+SudvSje70quuxhYfb4Qc3ZOtOWM+qxFohAV81AXXLIQPQHPmFIUybAJQ3ldWfGzVZkiKTOdIk3/MjSpiUsODFcv5ZcI0Ci91jMye0uN9U6mq5t8MOrFqy7qCauyrL180kA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=FNkl1oY1; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=FNkl1oY1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNmBm1dQGz2xHT;
	Fri, 20 Jun 2025 15:25:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pCjp7GgjXLjcJkVY/4kBaVRN5CIv7wB2v99zhyOfo039vMPt3wuMkHCTmkrUht2/AMxE+xaLclgLsm6yQYEFfcbE2Kz28AaEKrE9ksq0zZ5Wz9D50jbAGuMdvTOGhGMV60YpEaSqS1/3/LldQAHqwNo7uFs5qr4xF8/5YfyhrRJdZrSX95Sn13C2XBy2hXDxLhb/1Hlt/Ru3kjULPTYeszC5bIGgA8rPfWjBld4h8bTZ5yGy1DUpZwOU/FR/pyJJ9UOKGf0vfByOvKip2CbkoInnzoB35SbvUvimPd5EAKaC2k3C29IeeBwmDxqwD5nZA3TEbqDtkwsNDBKCUl+rkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xno+TyT2NxIdXrRHhTmwJPGQVXGTV+FavXmfgywjO9I=;
 b=C89KmZtd7DTAUYn0xiL+R/uchCeGlOpmVSP5NK59BlRcVG6wWZX78v+xr8ciKn2cc2vnpv5hAdEOotYTRSP+8qla+eR5qI7bq4q8jBbGZJtI1xNd6jBxuK2LyEjkhZW8UVVKG0nPjRRqMagDk5SwcYGaBeW9W4O8V95BInoxBnTkbgrxjJKOA1PuX88rPaL9uYcglTWNYxQB2Ityus6cAz7IkuB3E2JFZ8rw5ajHdQFxoVD5tQDONVJXkj6t623wlAL48uKbOkh2N2TpMhdns1sqWi+FL2Ku0vtsjxFL9U46EsXG+pGnC3TwzhnuAflk/565rnvduzhqhT1XWSbqsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xno+TyT2NxIdXrRHhTmwJPGQVXGTV+FavXmfgywjO9I=;
 b=FNkl1oY1wIgGWjpc1KJRVPE+U4eqGDqCG/sfdgwuFyU0UunPL/pzY+GYI4w1GZ1RVZEhxfViYvQJ3t60puqWdU63NGSE+DGiBPFqWjUQYO8ON7M9JaT21vsSg7dw/g3NCT3L29YVFb7SJjSZPvw1qpQoJfCmr5fJecxHvFnxpbeu214GX1RLDywsG8SM7h2rJhP9YwCkF/tbdLGbykHOf5IcAKq5t7/C+FLytHyYlPRjnhCDTRDL62tFgEzJPJvEF54aVql7s/gdJ8eVD9liHvAxRHq+NE33zu8HkLep91RF2bW2EnQDFGKQe/gX+eoLEz2yG2kU+jqsnA6ptj+HvQ==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by KL1PR06MB5881.apcprd06.prod.outlook.com (2603:1096:820:da::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Fri, 20 Jun
 2025 05:24:39 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%5]) with mapi id 15.20.8835.027; Fri, 20 Jun 2025
 05:24:39 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: "bhelgaas@google.com" <bhelgaas@google.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"vkoul@kernel.org" <vkoul@kernel.org>, "kishon@kernel.org"
	<kishon@kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "elbadrym@google.com" <elbadrym@google.com>,
	"romlem@google.com" <romlem@google.com>, "anhphan@google.com"
	<anhphan@google.com>, "wak@google.com" <wak@google.com>,
	"yuxiaozhang@google.com" <yuxiaozhang@google.com>, BMC-SW
	<BMC-SW@aspeedtech.com>
Subject:
 =?big5?B?pl7C0DogW1BBVENIIDUvN10gQVJNOiBkdHM6IGFzcGVlZC1nNjogQWRkIFBDSWUg?=
 =?big5?Q?RC_node?=
Thread-Topic: [PATCH 5/7] ARM: dts: aspeed-g6: Add PCIe RC node
Thread-Index: AQHb3BN5+/k5uKYPMUe/SI/Gdc6Yn7QBPt8AgApPrpA=
Date: Fri, 20 Jun 2025 05:24:39 +0000
Message-ID:
 <SEYPR06MB51343F38D4F9C130A4CE3FED9D7CA@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20250613033001.3153637-6-jacky_chou@aspeedtech.com>
 <20250613155458.GA962010@bhelgaas>
In-Reply-To: <20250613155458.GA962010@bhelgaas>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|KL1PR06MB5881:EE_
x-ms-office365-filtering-correlation-id: 04ac24ee-8c2d-4fe8-f06c-08ddafbac10e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?big5?B?QU03dG9kNktBRHROYjV4OCt0dGtiRWNFOVAzckdwd2VoRzJETkF3V0hKaFVaQmc0?=
 =?big5?B?N2t0V0k5eDloVk9xU28wOXRSQUlLSG5aWU9PTHBaS2ZxYmVsbXd2ME9GWjNQeGEz?=
 =?big5?B?YlpteUtUNVNrTFB4NFozRnlwQ05aS0lFb0lYRFdZa1RQajVkcEFMYUl6aUF5M1dO?=
 =?big5?B?L21LejkzMi8rWCtoWlVHTTBXWXFQVDFtaEd0NzB0dkVxaFc4TE5ZWTh6RE5DWWZN?=
 =?big5?B?UjBuUktTUVVaRlppYkNPZC9JSEdvU3Mwekl4ODBXcjR0YzdaZnZSUnVHVk02RE92?=
 =?big5?B?RlAvMU1IREN3TzBFOWV5WFZEaDc5eUJSS1RidFgzbGNMLy9oZW0zUUJrS2ZQT2ZK?=
 =?big5?B?MTVuZVBNY2dES0dYNVMwM3p0eHRsZ0VqZGI0STlPTkQxSnNWRVdlUWFHeHl1c2Iz?=
 =?big5?B?Q0xndlE2ajFmOUhqSVc5bVBCTE1iaG90cUY0SFBBSHMva090QkZ4MUNjbExZLzhm?=
 =?big5?B?MjhlMDQyRUtxN0hTemRpUHI0eEZaZXZsSGRDVzdCTDVhWXhVZVIvL0Fqd21OQnBW?=
 =?big5?B?NXZFMU44WWRWMUdMWTVmUlBPR2dLanFTdUVoRWlSQy9KblBsSXdCaU5FSXV0QXo5?=
 =?big5?B?THU2dmlkMTdSRnBFZTFUei9ETTQ2OHd4UHFKbWNVb1JhS0VCZDkvSGdrS3F5Nmw1?=
 =?big5?B?R0ZCWWtLdlFLbzF0RVg3M1hJQStFdzk4dmE3dDdWV09ETTJQN1h2cTA0Mk1NWTdV?=
 =?big5?B?R0Q5WE5NbUlvUmRmbUc2UUZPQlU4bUlHeUFNQ1hkNU9rNHJkY0tTbFJYZ2FUOG1Q?=
 =?big5?B?VlI4b1ZoMlh2MCthTzR4MDhlS0pQR3EzcUozZXQxSGwrcWZSYXY1K0luWDZrblE5?=
 =?big5?B?eDNyRnBNQUN3OUpjT0d2MHd3QXFjMjhKU3BaMjRLL3Q3ZUllZ2VOVUYwRldjSVBZ?=
 =?big5?B?cnZaR3JoeHZNWGxqTURBNGpQTDQyYjJwM3JBTmtQRkgzYTQ5WW5LUlJWakFqMUxV?=
 =?big5?B?MUdvZ2lXNVVhL2ZUbjlIeEVMSlNPZmlZanNMVFRXRVJlSER6QUdtdjZZeklxZ05X?=
 =?big5?B?Ry9xOXU5bzVCV3ZkbkkrOFUvYmp0MkllVXZudzY4cFBzTHV6Q2JBUnNtK3I1TEZk?=
 =?big5?B?ZSs1bXpVOG14ejFYMFJwMnhMRWpjcmVoOUdyeUtFalcyMmlsZFVtUEdjclNieDlo?=
 =?big5?B?NURXSWtoZlJHZ1pKdVFBUXU5aXNDeC9WY0FSYVZwQWw2bW9ZYWlIa0xrS3VMWkJ4?=
 =?big5?B?NGhoQjBUaGExQmxWUFRHTGZQREVTSWN3S0hSTUFEZGpYalYzR2ZQdVdZSTQ2T1cx?=
 =?big5?B?dVFDeU92M1RWN3RlYm55ZVJWVXFIczZxWWJLbEZJUXg3TldLRitETmhRUW54ZWN0?=
 =?big5?B?b2dwODh3N3FpUThzMklueUdUV0JoRHZFVTAwc3RpSVdPNFVJcW5zUnFkUDdtYlVT?=
 =?big5?B?UHF4YTJUVHhNRGxYUTN1bnlHbUJZaGpFZWFkS2Z5Sm4xcDM0RnpVRWw3SkhaM0xj?=
 =?big5?B?bWNUdDNzczhoeFFFTExDOWFGNlllQ0s5WnpkUy93SVBFcU1haHNJV0krOTZHTkZa?=
 =?big5?B?eU1kazhLK1N0QUxjRnh1U0hEY0RHRmJFYkRsTjVIS3lNczMzc0dPU1RmUWZJVEY4?=
 =?big5?B?cTIrdkNJaWxHSWx4TktlTmsyajZRdnVBeWZyM0xoK0RpT016VnZOMG5NVEI0R3NI?=
 =?big5?B?bjFPbEVHNjd6RUtQWGpJejhiNUVnWkZtSHNHQjVYNzZTRUIrSVdCWWZ1RFp2SHM5?=
 =?big5?B?Z2svTk9mYmRhcjNGdG1KcjdoM3BCOUh0N09nSGlzMTc0ZVYzMi9DT05VYm1vYkp4?=
 =?big5?B?MFZOeGU3K1B1aWZTTEUwUmk1Y1l5OHR0U21PK2k5UnN6bmJHWk1yUitGMk1pOHpV?=
 =?big5?B?czZiSXIzMnpCem0yY0d5bTF0SERQK1I1ZldBVXJtYmFBSmRLNkw3dS8wK1VOM2U4?=
 =?big5?Q?pcbvd7baHNddM4Dg6E4exYkV9QE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?big5?B?blA4WTQvSktHZ0FacmZSSE1NQ3poZTNxMllVY0UxQUM2SWUraWhlRVY1dFk3VExP?=
 =?big5?B?MUR2L09vUGhLREF2eE1rR09zcTlVelEzQmVabEMxZ211NEZ0MndFR1VqbVpYa3c5?=
 =?big5?B?MncvNWlYSThmbm5WQXFSMXNmOUw2Rm9seitra2pZdzltTE1MQVRTa0lNaWJVNGF6?=
 =?big5?B?V1Ficm14VDA0bU5KRFJtLy9rWGg3VHIyWHp6dVkzYks2aWN2VE9OcUlOUENkd3Fz?=
 =?big5?B?Rkh2L3B2Y1lyN2pjdUY2MVJCRUczYm0vMmFVUFloYmZsdWI4SjZ0ZDNTZzltUUVa?=
 =?big5?B?d2tBSGkxazROVk5FOU53dmtPT3hqdTkyazIxV080SUUwcWQ2RERFTzRUYlR5ZzJU?=
 =?big5?B?QnBvUkRBRFlOZG9iMEMxWWNncTZaTi9PeVljU3ljVmZLMDJ2eTZTdWNUbFVQNXkz?=
 =?big5?B?UktMODhqNkRRRXZTOENxbnRwenNNOVlGME1INFZSNWdrOGpTVEFzS1FiZldubW9p?=
 =?big5?B?cmJXMlJHdy9qZytkd052U3BhUjR5YW9OZVpReml6cS9LdzYzOFhLdlNVT1RyQ3Vn?=
 =?big5?B?Q1hSbG83c2J3b25ETDFxL1BLZ1ZCYVRISVYzSUg0WlpveFFDNUtXK2R6ZTFhLzZC?=
 =?big5?B?OVM5cXFXN0x4dTU2YXZZUVl3RUJsVXhvZTc4clBWQjdMcnZIMkdyVFl0U3k3STdQ?=
 =?big5?B?MXV1N0haQ2NacHR4N0hFdEoxRmpDdHVxYzJCdW9iWk1wRnl6SUQ3SW9iR1J0MkYr?=
 =?big5?B?dkVmVG56TjZ3cFA4ckRlMk4xeE1IdW93S01wMjdlcHZ2Q3V0Z1dxMU1QalloYXUv?=
 =?big5?B?dVNoTVdZRWYwb0NYTFFRamVHZU82WmwrL2JvejlMTFJtQm0zU1I1QWMwL3VlNVM5?=
 =?big5?B?bUEzcDlPMXFES3BuclZKSUpjUm1ORElybHZaNHdSRmU1UEFzclZaNU4wTGRucWx4?=
 =?big5?B?dm5xV0NJRGkrS3V2Vmd6NER6U2ZIVUJnb29uRW5KTUkybDljdGZtQno5aTF0NU5y?=
 =?big5?B?Z3FIbERLa2k3WEVteHAvZzg1cHZVc0NIRFRQbzhJdXBDV3NObU9QSUJ6eTlJT2o1?=
 =?big5?B?YVRQQnRaZG81aG1nR2tudVJPMlZTd0tLR2s4UG5hU1B6VmxORGFqOUlWaFZXWFhp?=
 =?big5?B?TjVEOTBOUFM4aGR6Wkh6WVFZWDIvaFpmTEh6ZDU1eFJ1aUJkNDJ4MmVLM0dEOHpj?=
 =?big5?B?MEJsVUVrbU1NVFdNLzBmNno1a21VZWxwT0hOVURnaG41YWMyM1cyNUNPbDNGY0hj?=
 =?big5?B?Zm42S2xGemJERCt2WVpOSzJ0RFR2RFVIci80UXBoelJSbEhZMUw3WGlwUEZnNGVZ?=
 =?big5?B?V29EbHJqdXRmZ0Q2ZEtaRVpxbktsQmFKOWZvbjVnd1VkVmpPQVl0bEFqZGpwUE5F?=
 =?big5?B?K0NzeW85K1JZWkFLeEQvZExoSkw1WmJoMklwcFNwVStndHBkVGtvT3hpSThGSStv?=
 =?big5?B?azl0blJLSjJLT2RkVDkrbXFUcE0wUTRPOFFGV3lBR3pzSEFoZnlnZDlCQ01BL29h?=
 =?big5?B?dTdsNDFuV2dVN0F6TUFFMFhmb0thTlBUbUx6RjFRcnl1UWMxcFkzN0JVTG5TR3kz?=
 =?big5?B?QjkyQ1gxdkIzVlJnN2kxZFdJMjZaNzlveUpPSTd4UXdiQWl6Mkt6Mit1SDNSVXhK?=
 =?big5?B?M2MzM2thT0lNc1Q1U0hreUlYNDRzMW5tQ0c0TGRETENOcmZXWlZ3YXRvYjR6SXQ0?=
 =?big5?B?bVd6UmVzVDR4QnZEWEpWVUFJUVZsU21ZSWZHZXEzckZGV1pGQUZZU1k4VHNQc05I?=
 =?big5?B?L2dVRU9mNVkyVUM2bitlMnBEa1BqS0xUaE45aWFwb0Erd1ZMaWxCS05jQkNtcXBK?=
 =?big5?B?ZDRFYkhmSmZsV3ZrUW5BalRXRWtqMnJUY1hKWjJZdldzNTZkMmk1Z3RNWVlPR28x?=
 =?big5?B?QWltRXlNZkQrOFZlL1R0V0dSZWxIVkhvd05EZy96OVdkc2N4T0NwSEdWZWpPNnlB?=
 =?big5?B?UXVaWXNsWWJUeEZ3andJSmp2Wk0vbmtmNTRWcWl3MmhtaG95YUlPTFdzUzFYWU9C?=
 =?big5?B?RklrMVdzdDlIUzZxZHhjd3pkTU5SdnlqdXQza2Jta2M5UmRPVzVGMHhMMURsV1JQ?=
 =?big5?Q?sTrj+93bWcNXDkWc?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5134.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ac24ee-8c2d-4fe8-f06c-08ddafbac10e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2025 05:24:39.3851
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lYfgCwCcyhZBJNHJywRyZhaN5wNyThoJOWWed1WTR1aW/QEthDawHKb+9VCSKFBxaF5hxGll12QzHTLyFXB1o7i6OW8nMLbG7odL/xt7ZTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB5881
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiA+ICsJCQkJcmVzZXRzID0gPCZzeXNjb24gQVNQRUVEX1JFU0VUX0gyWD4sDQo+ID4gKwkJCQkJ
IDwmc3lzY29uIEFTUEVFRF9SRVNFVF9QQ0lFX1JDX08+Ow0KPiA+ICsJCQkJcmVzZXQtbmFtZXMg
PSAiaDJ4IiwgInBlcnN0IjsNCj4gDQo+IFBFUlNUIyBpcyBjbGVhcmx5IGEgcGVyLVJvb3QgUG9y
dCBpdGVtIHNpbmNlIGl0J3MgYSBzaWduYWwgb24gdGhlIFBDSWUgY29ubmVjdG9yLg0KPiBDYW4g
eW91IHNlcGFyYXRlIHRoaXMgYW5kIGFueSBvdGhlciBwZXItUm9vdCBQb3J0IHRoaW5ncyBpbnRv
IGEgUm9vdCBQb3J0DQo+IHN0YW56YSB0byBsZWF2ZSBvcGVuIHRoZSBwb3NzaWJpbGl0eSBvZiBm
dXR1cmUgaGFyZHdhcmUgdGhhdCBzdXBwb3J0cyBtdWx0aXBsZQ0KPiBSb290IFBvcnRzIGluIHRo
ZSBSQz8NCg0KVGhlIFBDSWUgUkMgdGhhdCBkZXNpZ25lZCBieSB1cyBpcyBvbmx5IG9uZSByb290
IHBvcnQuDQoNClRoYW5rcywNCkphY2t5DQo=

