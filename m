Return-Path: <openbmc+bounces-390-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19392B0BBAB
	for <lists+openbmc@lfdr.de>; Mon, 21 Jul 2025 06:10:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bln4P4TQqz3bkg;
	Mon, 21 Jul 2025 14:10:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c406::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753068127;
	cv=pass; b=LfehC2+icjmAyeeuumf1LJpzuoA6FUlPPwxglCqLms6d+Q9R0VXYHCjU3vcbgiJ2KT6/Neswe2T4TF90aW9cSNWK5MtljSRbkT64g8hYakd9nuGsEgXK0wjbb+xTuQFVfapoi3kSKnXoWVNNWUvSgHBvcIBClNMFsD8aLDsnGq/HlDr5EdQTdmYNWodOgTeyXh9idLSiNQ2B3x2j2UVaTb7R3FTY/Z9I5Fk0G9uiowsArIdqMCz7dN8IzG1wLlO8IzS7qy5XjCGZ8a9FipHC0cxvb+H8r3MIZC4m2BU+BDATyCvwnziLNUiZkLjSR3anMM9kg5nG0gFA1vj4EUdanQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753068127; c=relaxed/relaxed;
	bh=blYfGd5nt2SplSGTrUdJ6rKjykwVIflroq+TDbpTV54=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lPhR84/p4C5O2gbR0kaMG5d20SG1HcKcrl1s4Kgclaiuo0L9NBxhrvFl2yYehMsqxOm9Rvtn6RrKtCPq/2oboe4qtA7kQFAqFordor+jADvSGX7GBQ5RkZvR0br4ShWO+YaXlGtU9aMYJWULyQWibMm/nf5KWNhwpyBn4LrV9Pb6ilUHnKBpULP8SbDG4CPHX8PSEdGyBVJNMiXRKDYQ6JDZp4KtKkZ1q/CSkLM3nrtq6YfUPQs2Sbz3tWlAiv9GpyDEPfkX+PShwVvfaMPCn+Oh4etM52K3/y/IZhPxK0wd67BINQRB8EUqDzaIWt6AWYhs7nsuQfbBP3vxkgCsvw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=dPZL3nT8; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=dPZL3nT8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c406::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4blm0Q6XSbz2yFQ;
	Mon, 21 Jul 2025 13:21:56 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1YrWneXHJahFSJ7cCEfAOheeTnRCDwSQ8c4/4K14YYoyVzJdowawrnHKWgUEqirBNGgE6B+xGxf38tM5kgvXSXOUIJDfzugVYRmBuNBt3NbGMRGufJc3ek994qSNMXvltTxRYytvTrUz6UtwJLpknkaeCV7ROGHs4/eI3ZsgBM31XTCJGtXtHgnCcEwmG/+bZi4gepf4Lc1jAfc4h5NL35PdaX0LHb3J3OfDUFjstlvAlVJGu9K/JwQ8efQtHY2Tx9kFojTOMCec+D0G7cfZTH229xQimAFjC2Fxj/GimujLT12ijhvnjIHP0N1TU9zNDSLSZvl2G7sXQtCxq/cQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=blYfGd5nt2SplSGTrUdJ6rKjykwVIflroq+TDbpTV54=;
 b=kPBONlwGEV07Y122vPN4PJU8HmJr6UHEan98T+t7OIeAJK3HhyH2/sPUBc6S4ZvXv4JkPvQacgaPXNwazI/DFVqw1DRsD1V2vTT/qwFQVxuRGD0B6PLFsDKjFi8iKBXDS8pme0FHSesjT9gzzR8RgvWdHz2GxCn0mJjEHrZ/JK4H+YtHf966f86+gHNB82Lom3SzgqhZNpo5qvW4IG7+ZDXzuSNM8ZGnaAtcRXvqyZ5/lWtsgzvgC0rbU6SYXA2UfSmZusRiFcieuOixj/P4aMMeMuT+av2j3PEYQmb2p2Ew+OtPjY+ojzqa30dzlfwuxPSxu2Hjow274GQ/nUv4LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blYfGd5nt2SplSGTrUdJ6rKjykwVIflroq+TDbpTV54=;
 b=dPZL3nT8dMKE+xNwWl3+sHg3jaS56jtQsLBGSlR0Gr619uSFBelZNJUiZCwoKZHGu0RDTbeQ7ajXZFddObDiv+IxdjyqW5j6ynyHVFjJVW9Z5u9SMD4RKQMPrX2BEnCtLeQgmfNy4tkl9AUcJeXBowsxkoVMk80FC3Lr8HZykFLKrRrIM+zy1oluqcJy5jLvktWrx/rb1aQMx7R/yFB/8Yt9zK8q8ZAu39bxt1JT5WkDBRV5JLPOcnNWnuKf2pc7rkSuYU6/y4RvS8b6NVP6Y/nB3tXC2qSIgKMW8BQiwcrlNhE/J/8CPOJOfn4RirhEI/oW9++hSMFzBIo7Vs72sQ==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by SEYPR06MB6397.apcprd06.prod.outlook.com (2603:1096:101:143::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 03:21:32 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%7]) with mapi id 15.20.8943.028; Mon, 21 Jul 2025
 03:21:32 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Rob Herring <robh@kernel.org>
CC: "bhelgaas@google.com" <bhelgaas@google.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, BMC-SW <BMC-SW@aspeedtech.com>
Subject:
 =?big5?B?pl7C0DogW1BBVENIIHYyIDA2LzEwXSBBUk06IGR0czogYXNwZWVkLWc2OiBBZGQg?=
 =?big5?Q?PCIe_RC_node?=
Thread-Topic: [PATCH v2 06/10] ARM: dts: aspeed-g6: Add PCIe RC node
Thread-Index: AQHb9TqkQDR8o2SUn0W5qxLHkZJlFLQzTswAgADEMrCAB4wcAIAAT52Q
Date: Mon, 21 Jul 2025 03:21:31 +0000
Message-ID:
 <SEYPR06MB5134AD91113EAA7C28F485129D5DA@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20250715034320.2553837-1-jacky_chou@aspeedtech.com>
 <20250715034320.2553837-7-jacky_chou@aspeedtech.com>
 <CAL_JsqJ4yeYGAyCwHi=4CBurxGOc5oAqTQqun+5+Ps4hxwDU9Q@mail.gmail.com>
 <SEYPR06MB5134EB5D018F8518E88495FF9D56A@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <20250720222230.GA2842356-robh@kernel.org>
In-Reply-To: <20250720222230.GA2842356-robh@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|SEYPR06MB6397:EE_
x-ms-office365-filtering-correlation-id: 30f6cee2-603c-438a-0478-08ddc805b0a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?big5?B?MCthT3kxenA1RGRIa21LSVJOZ1VPUU1icmgyVXRpeXRROTNzTmEwUGdkVGhGSUF4?=
 =?big5?B?a25SYXczdDIzYUlCUk1TdXdkcnU1LzRUdEVNYUhETHdpWjVCMDJCN2JFRzA4emxs?=
 =?big5?B?cmF0RGNmN3FNQzZIeUhtWS9LWmIyNnExcjE2M3o4eEkzYm45ajJ2U2FFZHk0bjlW?=
 =?big5?B?dml0Z3pZK1ZBbTFGWlZLejc2VjhiaWtEOEpCSDAyOFozSnlmWHBaV0ZBd1pmNmNO?=
 =?big5?B?VVNySVlrQkJFczdocTJNTlAzVVlJNkZOeWllc3NWNkhRbkdsNHFnTGJIQTMxN2dT?=
 =?big5?B?SjVQQXpJQnQyTkh1L01oNUFkSXVjUFN0Q0FtQTdEN20xSTRRRk5PQkM4cXNiUjJh?=
 =?big5?B?RG1BM0ppS3BzTzhJSk9OdlhtYzJrT1o5M25JazVoV3c1WmU0RjZjMHMzK0dBK3J4?=
 =?big5?B?MWdvRUd4cTNYRUprVHFmQUVxbCtOVmJ2aGxZNkhuUXFRclhiNkRpUEgyVm4vYVpx?=
 =?big5?B?OVoxT3l3b1g3WmFqOWgxcFRYdWsvT3l3aEVnUlc0WVJsQ3F6bjByREMySkcvNXp3?=
 =?big5?B?L2NHMURmSENyMktxMFBHc0ZLSzlTOXAyb3dVL0ZaWmppSjF5S0VpVkcxcy9CbmpF?=
 =?big5?B?Mnc1MUQvSVQzYW45UW5EWDRhbzJBYzNxRzBaN0MzYnQxUkh3NmluSjQxS1YySTRR?=
 =?big5?B?c0w4M21EYng2M2NSNERHSi9VYUhxVVFkVHU3MDRWMzhyMjlDS3JNbkRDY2lRWGNJ?=
 =?big5?B?cTYyNThOd1I4dEhORDNqYmo3aVJ5cDVVQ2N6Z0xEbjhLY09qQlJiOXNXb3RleVpq?=
 =?big5?B?NUJ1WTFmSENJTE5ndGpSWDhrT2NQYXZIWlpEbm1FY2ZSSW1mKzNWNFNBNGxOV0w1?=
 =?big5?B?ci95RGlOWldKQjFKUERmbjllSldCRFdKRjQvUDduamdSYTFUaFJvay9FSGg2cDN2?=
 =?big5?B?WjlzejZRekdudE0wK01XL0pmaktlUk04c3NXckY1NE9BNFluSmh1WHRRVWJ3Nmto?=
 =?big5?B?OUR6WlNqcndvTGhZZnE2WEw5MGZKVHNldERZVDRpODEvbjRMOTJ1bDhtdVJWUVFO?=
 =?big5?B?UXZ0Vy9tT3ErNHFmS2szMFJFdk40a3kvWXRQRW5oblBvVEgyTGdseFVlNEN4c1pM?=
 =?big5?B?MEk3UFV4OXdxcWZrbWlEWGF5RjYzN0xOd0tSbHNOZVZwVDdPeXRxYnZnNXpKUzVP?=
 =?big5?B?MHZ3enI2VERvNmRKSWNEMnZ2cGw2b3Zra2ptWWtVck90ZnViRDJ4a011VlZNeGVC?=
 =?big5?B?VXFFU3B2K3RoMk45MS8zVWJLNlYrUFVKcGl2L2l4UXcvN3FIaitDY2s3b0s1ekhP?=
 =?big5?B?YUpzQWt5RWdpV1FORHZwWjVLU1RxVy9TaStwdmVjVXQ0WUFVWHBERmNzeHhvVDNW?=
 =?big5?B?alpkR3lFY0NPTXozeEV5RGJWKytmWkNNd1psLzZIc1BOQzRPV1hKVkZ3WUZzVW43?=
 =?big5?B?a0lzYWFYbUdBZ1FFaXpXNmtQOE5Obkd6QlRhbGlpS1lBVlVhVVNnNzYzUTdockZ1?=
 =?big5?B?elN4MjYrNTBGdFFScEQ1aVplZHdDWEE3TUhwQm50czFpejFhUUpwaHpyN0V3WTNE?=
 =?big5?B?MlhidVlKNWx0Rmh3ZWJ1TUJSb2RPeHVoOC9aVkRFYmtVWll6YXBlWTA5WHlhdnpm?=
 =?big5?B?dUw3SHMva1dKdVNLRlBUcy9oVVVwNjQvN2ZiY3BZNWVTNFBWQVdXMWhSTld5WVlD?=
 =?big5?B?eWRvcDh3T05FUkxZK25TREd3UFNENDM3cUN3N0Y5L3luZ1AwOGd5ZDczd2JkQjJm?=
 =?big5?B?VTAyMVh4VDdGaTZTWlpUQ0FDWmpPakZzZkg3M2p4UW5pQjdqbHRlZ2dxRVZscEtS?=
 =?big5?B?NHBpMlE2SldDVi85Q2ZUK2djdkpVaHhzTU9uMmdXbk9HaTdWdlpYWEMzWjUvblJM?=
 =?big5?B?YmlORmFZMGd4cExrbkpJeldxSXpBNjZ5cDFvZE5IRU1PNUowVW1PY3FPV1NzcVNR?=
 =?big5?B?WXB5Umx3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?big5?B?V2VRRW9IZlhrQm5tVWMyRU1KelVpL0R2MXJ0OWNqUkRFNXlYRGNRT3R3RnhQUVUv?=
 =?big5?B?TnRsMnFkOE1IU0hZY1BtT25uSnV6QmhsbmR6WVFBYSt3RG11RDQyenlGbFlTYW9m?=
 =?big5?B?RTVuM3Q0dGk3ZmgvTWpNUmZSeU5DejZKSFcvMXp1eDRLL2EzYUpTeWpiWHZVdCtT?=
 =?big5?B?WlRkSEhWZndjNWRKUzNoRFVsa3pFMEUxSCsrRUdObXI3SzRraEJTbU5GYzFuZERz?=
 =?big5?B?bm9hWFdzR2s2WUtwUTdLQTdzM24vczBPaEtqTmVpNm8vUnl5NkNxbkx2R2ZOZ2NY?=
 =?big5?B?a3BpRDlEazM1bzY2Z3BxUDl2M040bE5qb3FMNVFkc1I1UkRocnFCUXdnR00zMVdK?=
 =?big5?B?NDUxYWFMcWtNSXJ6TjYvSDd4Mm5SbFZLZU9MU080WEZhQmRPM0hsTEJ4ek1Rd2xi?=
 =?big5?B?eElqN2N0alFPMStmZ3RqK1c0MXFIZFpCaTR0WW1lWW80UGhHOGVTNTNmV1Q4MStr?=
 =?big5?B?SnRHWEFmMTgreWpTbDVOd2F3cytrM0sxWDJNOXB3RUQ0Y3JyaXhsOWFuOHdqVk5v?=
 =?big5?B?U1lwSVlWaEdYbW4wQTdBdkRhM2lCY25yK2JtMXROWkp0VytlY3gxRTRwRkQrYXlC?=
 =?big5?B?bm9paDg4SXRSbUZ0eERIQWxGRGVzOVV1RDR5MFB4Uk51Y05LWWpNQ1hLclpzc3lp?=
 =?big5?B?ZytJcVhYUW96VmtKOXh5LzNwVjFWWkZOSnFmZFF4cytOU0NTRmh6QnNMSkZiRHVZ?=
 =?big5?B?YXNFSC9xakVXSE52SG5aRnFUeW44Tzl4QmVPL0p2VEFYaStwcERBbDlEUGJOSWxF?=
 =?big5?B?bks2YzhUc3l3WlhZOW9PY3pHQWQvRGVxRmVZM09YM3ZVemloM1hpQnVVcHFmN05J?=
 =?big5?B?aDF2c0U0TkIrZzBDYjRDd1hkT0oyRnZQNXd1aForMUhYcmpnRGxLUG5kLzZhNDFo?=
 =?big5?B?cXptS2M0UHhjZC9QYUFRczdZaTRFSFR2T0lJNlVNeUpTMG1jVVNyV01BQTlXVVJv?=
 =?big5?B?dHg2b1U5bjM3STBNZGxJeFhLWXJqcDBORlFOSXRlWkNoZTYwdDN4UlQ4MTBDN0N6?=
 =?big5?B?QUNsdGFLQituZldPbENxK2YrWm44cGx4a3hBY2pLRkJqQ1lzbk5sK29QUVNxekoz?=
 =?big5?B?WEh2cFU1QlNRMXV6L0M3aWpFTVJUdXdUQVV1dHkzbkFKb0FudHdCaUpNSFRGQVhK?=
 =?big5?B?U3EzbXgrU0d1Q1NGeU1sQ3ZQYmxMUUtMVmZFZFlJQTBKUitKbXRUc2xDNUg3Vko0?=
 =?big5?B?K2w4NW8vaFloMDBsV2FWTTNMOUlKYWhkYitGRDJiQzRUWERZTTBPTmRyVWIvNklD?=
 =?big5?B?REF4YVRwbXhuRXo3Q2J2aW5rRUl0WEFXYlp4T2hvcXZLMFFBVjJ5cHVud2QvWlNw?=
 =?big5?B?VDhyNVNIUTNLOGxoRFlwMmRKclZrVmFqYXVKVXRvK0p5RnBJMEZadHNXOTM2aHhN?=
 =?big5?B?UkZOVVkxRjRkWkozM0xBOXhyc1gzRjBieTFmNjR4K2RpWEJSZTZ3SGRFQjA5ZGlG?=
 =?big5?B?U1U3SlNlODFVOTNuSndzblpEcEc0MXBHOUNnNzlFajdiZEZnQ1h3bURvS3NKV3lE?=
 =?big5?B?blJ4TzJNY2dPMFJWZG0ya2dUbUVhMjB1NHJjVVNPVnlpdnNoakRkZm53a2JDSGZY?=
 =?big5?B?bm5EaGRjeEFwL3I2VU1lVlUvOWRHeXovT0VGRTZ2ZlN1ZXloanZCd3RQdDE2cWZW?=
 =?big5?B?TnlYMm8xS2g0dFdKUmlFSVUrVEVoSDdta09NNkFKekZXRUJhWTVUaEV5K3FLNFpm?=
 =?big5?B?TXJoUk5xOHlHSVQyTVhZVEZiWFY4UXR0a3ZuMUZMUm8xTXZoQzJUcGVIZjlWTytK?=
 =?big5?B?ckJEdC9lM05rWjdKbG1KMjN5MEQ0N2dDQ2xwWGlXN0xOWlRTSnpkbVNObG5BOUtK?=
 =?big5?B?azJ2SDUrMEozV0xRY1N0MVNsYnV0T2VMNWJNeXVGM0FmaE1KZUUwUE9FaUhvUWJG?=
 =?big5?B?VlBoU3lsZ1hpMGxBY2FmczdEREt1WWtuS3ZyRTJ5RjNYVEJERWY2cVFaSlB3VmNn?=
 =?big5?B?OHJDMWdEYzUzV2FKdWhtQUI5L1VBbC83dTBCa3VCM25nc0g3ay9tU2xCTTByT2Ju?=
 =?big5?Q?Tccydzf6gFmviMRO?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 30f6cee2-603c-438a-0478-08ddc805b0a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2025 03:21:32.0464
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V3yxhqCPzZCv5IOhun/+QnmHLAVy7/ppOO3EOWsm4omFKN8tFcXVFWfVBG14FCkRUEo2hETy0FHizg1BNHOsSaocWcrkO6WHzf428NW9mls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6397
X-Spam-Status: No, score=0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHF1YWxpdHkgPSA8MTAwPjsN
Cj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgfTsNCj4gPiA+ID4NCj4gPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgcGNpZV9waHkxOiBzeXNjb25AMWU2ZWQyMDAgew0KPiA+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYXNwZWVkLHBj
aWUtcGh5IiwNCj4gPiA+ICJzeXNjb24iOw0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHJlZyA9IDwweDFlNmVkMjAwIDB4MTAwPjsNCj4gPiA+DQo+ID4gPiBUaGlzIGxv
b2tzIGxpa2UgcGFydCBvZiBzb21ldGhpbmcgZWxzZT8gSXQgc2hvdWxkIGJlIGEgY2hpbGQgb2Yg
dGhhdC4NCj4gPiA+DQo+ID4gPiBJZiB0aGlzIGlzIHRoZSBjb250cm9scyBmb3IgdGhlIFBDSWUg
UEhZLCB0aGVuIHVzZSB0aGUgUEhZIGJpbmRpbmcNCj4gPiA+IGluc3RlYWQgb2YgeW91ciBvd24g
Y3VzdG9tIHBoYW5kbGUgcHJvcGVydHkuDQo+ID4gPg0KPiA+DQo+ID4gT3VyIFBDSWUgZGVzaWdu
IGhhcyBtdWx0aXBsZSBmdW5jdGlvbnMuIEFuZCB0aGUgc2VyaWVzIG9mIHBhdGNoZXMgYXJlDQo+
ID4gc3VibWl0dGVkIGZvciBQQ0llIFJDLiBUaGUgb3RoZXIgUENJZSBmdW5jdGlvbnMgYWxzbyB1
c2UgdGhpcyBwaHkgbm9kZS4NCj4gPiBJIHRyYWNlZCB0aGUgUEhZIGRyaXZlciBpbnRlcmZhY2Us
IGl0IGNhbm5vdCBtZWV0IG91ciB1c2FnZS4NCj4gDQo+IFdoeSBub3Q/DQo+IA0KPiBUaGVyZSBp
cyBhbHNvIG5vIHJlcXVpcmVtZW50IHRoYXQgdXNpbmcgdGhlIERUIFBIWSBiaW5kaW5nIG1lYW5z
IHlvdSBoYXZlIHRvDQo+IHVzZSB0aGUgTGludXggUEhZIHN1YnN5c3RlbS4NCj4gDQoNCkdvdCBp
dC4gSSBhbHdheXMgZm9jdXNlZCBvbiB3aGVuIHVzaW5nIHRoZSAicGh5cyIgcHJvcGVydHksIEkg
bXVzdCB1c2UgdGhlIExpbnV4IFBIWQ0Kc3Vic3lzdGVtLiBJIHdpbGwgY2hhbmdlIHRoaXMgcGFy
dCB0byB1c2UgdGhlICJwaHlzIiBwcm9wZXJ0eSBpbnN0ZWFkIG9mIG91ciBkZWZpbml0aW9uDQpw
cm9wZXJ0eS4NClRoYW5rIHlvdSBmb3IgeW91ciBjb21tZW50cy4NCg0KPiA+IFRoZXJlZm9yZSwg
dGhlIFJDIGRyaXZlciB1c2VzIHRoZSBwaGFuZGxlIHByb3BlcnR5IHRvIGNvbmZpZ3VyZS4NCj4g
PiBBbmQgdGhpcyBzeXNjb24gYWxzbyBpcyB1c2VkIGJ5IHRoZSBvdGhlciBQQ0llIGZ1bmN0aW9u
cy4NCj4gDQo+IExpa2Ugd2hhdD8NCj4gDQoNCk90aGVyIFBDSWUgZnVuY3Rpb25zIHN1Y2ggYXMg
TUNUUCBhbHNvIHVzZSB0aGUgUEhZIGludGVyZmFjZS4NCg0KPiA+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICB9Ow0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IHBjaWVfY2ZnOiBzeXNjb25AMWU3NzAwMDAgew0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYXNwZWVkLHBjaWUtY2ZnIiwNCj4gPiA+ICJzeXNj
b24iOw0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDFl
NzcwMDAwIDB4ODA+Ow0KPiA+ID4NCj4gPiA+IExvb2tzIGxpa2UgdGhpcyBpcyByZWFsbHkgcGFy
dCBvZiB0aGUgUENJZSBibG9jayBhcyBhIGgvdyBibG9jaw0KPiA+ID4gaXNuJ3QgZ29pbmcgdG8g
c3RhcnQgYXQgb2Zmc2V0IDB4YzAuDQo+ID4gPg0KPiA+ID4NCj4gPg0KPiA+IEFjdHVhbGx5Lg0K
PiA+IFRoZXJlIGFyZSB0d28gUENJZSBidXMgaW4gQVNUMjYwMA0KPiA+IFdlIHVzZSB0aGUgb3Ro
ZXIgb25lIFBDSWUgdG8gRVAgbW9kZSwgaGVyZSBJIGNhbGwgUENJZSBBLg0KPiA+IEkgY2FsbCB0
aGUgcGNpZTAgbm9kZSBhcyBQQ0llIEIuDQo+ID4gV2UgZG8gbm90IHByb3ZpZGUgUENJZSBBIHRv
IFJDIG1vZGUgZm9yIHVzYWdlLCBqdXN0IEVQIG1vZGUuDQo+ID4gQnV0LCB3aGVuIFBDSWUgQSBp
cyB1c2VkIGFzIFJDLCBpdCByZWcgbWFwcGluZyBpcyBzdGFydGluZyBmcm9tIDB4MWU3NzAwODAu
DQo+ID4gSSBsaXN0IHRoZXJlIG1hcHBpbmcuDQo+ID4NCj4gPiAweDFlNzdfMDAwMCB+IDB4MWU3
N18wMDdmIDogY29tbW9uIHVzYWdlDQo+ID4gMHgxZTc3XzAwODAgfiAweDFlNzdfMDBiZiA6IFBD
SUUgQQ0KPiA+IDB4MWU3N18wMEMwIH4gMHgxZTc3XzAwZmYgOiBQQ0lFIEINCj4gPg0KPiA+IFNv
LCBpdCBpcyB3aHkgd2UgY3JlYXRlIG9uZSBub2RlIHRvIGRlc2NyaWJlIGNvbW1vbiB1c2FnZSBm
b3IgUENJZSBBIGFuZCBCLg0KPiA+IEFuZCwgd2h5IHRoZSBwY2llMCByZWcgbWFwcGluZyBpcyBz
dGFydGluZyBmcm9tIDB4MWU3N18wMGMwLg0KPiANCj4gSW4gdGhhdCBjYXNlLCBtYXliZSB5b3Ug
bmVlZCBhIGNvbW1vbiBwYXJlbnQgbm9kZSB3aXRoIDIgY2hpbGQgbm9kZXMgZm9yDQo+IGVhY2gg
YnVzLg0KDQpHb3QgaXQuIEJ1dCB3ZSBtYXkgcmVtb3ZlIHRoZSBwY2llX2NmZyBub2RlIGFuZCBt
ZXJnZSB0aGVzZSByZWdpc3RlciByZWdpb25zLg0KDQo+ID4NCj4gPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgfTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAg
ICBwY2llMDogcGNpZUAxZTc3MDBjMCB7DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY29tcGF0aWJsZSA9DQo+ICJhc3BlZWQsYXN0MjYwMC1wY2llIjsNCj4gPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZXZpY2VfdHlwZSA9ICJwY2kiOw0KPiA+
ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDFlNzcwMGMwIDB4
NDA+Ow0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpbnV4LHBjaS1k
b21haW4gPSA8MD47DQo+ID4gPg0KPiA+ID4gTm8gbmVlZCBmb3IgdGhpcy4gWW91IG9ubHkgaGF2
ZSAxIFBDSSBob3N0Lg0KPiA+ID4NCj4gPg0KPiA+IEFncmVlZC4NCj4gPiBXZSBvbmx5IHByb3Zp
ZGUgb25lIFJDLg0KPiA+DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
I2FkZHJlc3MtY2VsbHMgPSA8Mz47DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgI3NpemUtY2VsbHMgPSA8Mj47DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDE2OA0KPiA+ID4gSVJRX1RZUEVfTEVWRUxf
SElHSD47DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnVzLXJhbmdl
ID0gPDB4ODAgMHhmZj47DQo+ID4gPg0KPiA+ID4gRG9lcyB0aGlzIGgvdyBub3Qgc3VwcG9ydCBi
dXMgMC0weDdmIGZvciBzb21lIHJlYXNvbj8NCj4gPiA+DQo+ID4NCj4gPiBMaXN0Og0KPiA+IFBD
SUUgQTogMC0weDdmDQo+ID4gUENJRSBCOiAweDgwLTB4ZmYNCj4gPg0KPiA+IEl0IGlzIG91ciBk
ZXNpZ24gb24gUENJZSBCIHRvIHVzZSBidXMtcmFuZ2UgMHg4MC0weGZmLg0KPiANCj4gVGhhdCdz
IGEgcG9saWN5IG9yIGgvdyBsaW1pdGF0aW9uPw0KPiANCg0KSXQgaXMgYSBoYXJkd2FyZSBsaW1p
dGF0aW9uIG9mIHRoaXMgUENJZSBSQy4NCg0KVGhhbmtzLA0KSmFja3kNCg==

