Return-Path: <openbmc+bounces-923-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8F8C6C87D
	for <lists+openbmc@lfdr.de>; Wed, 19 Nov 2025 04:12:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dB63314Mpz2yFJ;
	Wed, 19 Nov 2025 14:11:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c40f::6" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763521919;
	cv=pass; b=mq1NV1k9JbG9H3yb1Iu0sZMtG/MnJJRqSXE68WKvdLqwFlkVcn4qeRtGENAH+TPlLIv8Hu7+CgpUDaIiOYiXMQNSn4j/rgJbglHKLm0j0+Xver8f0qG4sP/FgR7EOnBhgQ4Z9HXPBdGfcaXPmabRS9M+am59dKjjCmAp5+CZyTS60phUqnziU+IFl1lBKB41xQPBoi6UZOqMyehYeODk37IFwQv3TecgVdebtNEpD8H64I0uzR0xg+nCdT0njXg0f7+F7vhTQwuUFS3C1nBY9NKcVkh5uz4j7cGl4n/XDOg/oHG16w5BlzZhqo4IVJ9xMWXlQ2plihWIPSyuHSS3PQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763521919; c=relaxed/relaxed;
	bh=NwhPe5loO62ZfuWWD0Z3xpOfPl/iqORFJIU9qO1D3Ao=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hEkErEEWuyp8OZ9NJWnhAlOqqpS7kU2dqvtn+OC1YOsUjLyLpMmMi/ULh2ohWrKcgHmWKpA8Asou8ZLGjstKbUUW4ZgeU+R4KvXMgPy9Iga+MhFuXu/z2joBlj5PmrRjPLFZsFZqotDt+qvEZceD+B7A6M6nnUjg1+ClrfsNerC66+QF0Y5S27et6Fpnn5uovnf0YgecGrfujhD02/t99XU+xE6SoaW5F7bGM0K/PFqGq0CsMdAx3hViLC+h4Jb71eEslB81pxveVhkhSKLWUQ5504hSLu2aR1fZQ8t+fj2840ybn9KTGf/pjkEye7XlDDN419HXBcsBo0by7M/0iw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=K3Vb+o7Q; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c40f::6; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=K3Vb+o7Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c40f::6; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazlp170130006.outbound.protection.outlook.com [IPv6:2a01:111:f403:c40f::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dB6320pr4z2xqh;
	Wed, 19 Nov 2025 14:11:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=suE6Gnz92cuSKee1dUQjpWKCBPgd8iJWEUXFOEY6PPjcJcVuMTm96VCzhfF2Lk3LhT7KrXQK19JyYyLp5Jl4pj9beeF+T+spd1AM79OC+iti4rBOoEzyJMz79QjCfQxvZFSoUhdnSF6jz6KpElGlNs/jFxQUGApAO4/BtC6ddvv9qpF5tnufzbB0iaQaT+DcwOQqVVEZx0fpqbbWXqHy26QZGzJbNNEdj7p5xHpLB+Ubs/Y4iGaCwI1wusPIxIjqrgYwxGtbnjbyMD3ECGeGYRKQ679I7hn5aiXozKsoL/mDZxfs6nL+6zjTZFd23Dp1oDr2nAArTTl+cQOdXhTzTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwhPe5loO62ZfuWWD0Z3xpOfPl/iqORFJIU9qO1D3Ao=;
 b=ATcHPIHRxEC0qx12nQodDsN9qzrRekBOGjQYhXBqs0zGew1mHAZoRpMMNQqpe3C2RbITEh2PBtMWvzd1RonCy21qEYJ/Xo5SVc5MbqAmPdjS0Z8+IosKf/4RVS+NiHXaozgN0bYvE9BnAZO+RM1+SNPrWTtwFCa4Ae83h5fkRnGcUqp7HrvzOyAsQ7d2uOdLloSZVFCADiQE0SIRwAkKcooGFt4XLSAbcdNceaM945/teE7Fn0kY8JmfD3jY1jC9FeKuJtXYpa2PEczhlKJ+V3IjTa8ie4kP6fACoJBQPU9r8/D3E+HM1cPdEfB22IZLb4BxVm+SASiA9sN+Kpg1/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwhPe5loO62ZfuWWD0Z3xpOfPl/iqORFJIU9qO1D3Ao=;
 b=K3Vb+o7QwA9lCQwBjVx2KQrQor9UJmfDe+Z1DUWxp8asS6i68pzNZ2IQQisNkvaY+KC6gPFJhPbsFF6HSBA5mishnWCsd2l46i9vFIlVhLRxYeTvzgyWS1mxdHZtDKvS+QT9MmEEAmf/6GtxKNF8i8EvTo7MTFn/ezoYX5btxb4cIFfa66o0xNSWgyGnRQcsE1Z1D+857SvXBKRcUB/wBw99QsHcvr+aMzNfQrTy5P4WRteDtQ8NeFLRggaYBEelRaW2tjoIZ9uryL9AQs5JS3zUuhra3zHB5dTwDuHMOTVGjRsZy6/ZL0liwCevgkMW31CzQODsAzgnGjzqHC2XoA==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by TYZPR06MB5027.apcprd06.prod.outlook.com (2603:1096:400:1c9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 03:11:33 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%6]) with mapi id 15.20.9320.018; Wed, 19 Nov 2025
 03:11:33 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Rob Herring <robh@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, =?utf-8?B?S3J6eXN6dG9mIFdpbGN6ecWEc2tp?=
	<kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Linus
 Walleij <linus.walleij@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: [PATCH v5 2/8] dt-bindings: PCI: Add ASPEED PCIe RC support
Thread-Topic: [PATCH v5 2/8] dt-bindings: PCI: Add ASPEED PCIe RC support
Thread-Index: AQHcV78m/FQAr+3pg0ChA2uxl1TDqbT3b3GAgAHkIeA=
Date: Wed, 19 Nov 2025 03:11:33 +0000
Message-ID:
 <SEYPR06MB51347EB7A223723DF021EFAE9DD7A@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20251117-upstream_pcie_rc-v5-0-b4a198576acf@aspeedtech.com>
 <20251117-upstream_pcie_rc-v5-2-b4a198576acf@aspeedtech.com>
 <20251117221357.GA806266-robh@kernel.org>
In-Reply-To: <20251117221357.GA806266-robh@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|TYZPR06MB5027:EE_
x-ms-office365-filtering-correlation-id: aa73e166-e3d3-4d52-9050-08de271957b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZXQ4ejFHNXlRKzJTUFhnakZCUG9mUjliMGdHYjhoUnhXU3ZOcFVLTlViS1FI?=
 =?utf-8?B?QjlXN1lhMWFydE1zOWlpLzU2cE9tbXNIbXUvL3NISk41aGkwU3g4a3o0S1I0?=
 =?utf-8?B?TDNsZ3MzUUNSUTVUL254YkVoemFEVDQ0blBQWDNvaUhpeldZYnRkVUxmTVVl?=
 =?utf-8?B?Rm01cWxEY3BLSER0azNrVXhBZzZvK05GWHI4SFlIcW5sVDBhb3Z3dlREUXVy?=
 =?utf-8?B?S29zU1FLbXRwN0t0NFpPVFpia3k1U3RiM1NpN2w0WUdBSXlJVGd6a1h2RmJL?=
 =?utf-8?B?SWpIL0ErNXpJS0RPNGRjRzNnSzRFc1FlVXNjTUQ3Z0dKZkFYY2RVdUkxS0Rw?=
 =?utf-8?B?bHllYnBENEJmUllHelY5Wjg4eGNva2htNXg2dUxCcnQ1Y0NJa1hGM3dWN2Zk?=
 =?utf-8?B?MlM1ZEdRZEwyR0RuTVF5N2xaTXMvcnlFUTA5Ukd4R01kSDUzUW44bCsyOFJk?=
 =?utf-8?B?bnQva3FmSFgrQjVIeGFEYWlWQmt3OE1TWS9qTzZ5WDdGczAzcWx3MC9QNUZm?=
 =?utf-8?B?SHZFL2lNQm9QeERzTkF5TmdoVEtDODFRWVVER290eGVjM2ZlTTRJQ2tLYTRJ?=
 =?utf-8?B?OHl5WkRyMWlzNWMrc28vTU5IbEpPUTUyR3d0RE1DekJhMFJOMG1pWVRiN25i?=
 =?utf-8?B?eWtqQmo2M1ZXeCtDczl4eUJlS2hQQTBFOEthOVZrZUkvaTgwQXcvL3JzOUxO?=
 =?utf-8?B?aStxeTEvUldMQ09YaStFb25qM1lSOVI4UXdxV3dpcWI1UzBpQzI0dlRjYjZY?=
 =?utf-8?B?WWxINmRZLzZTNFNOY2dEOTJqVW9rS1ZzWUp5enBHV2didndVRjZaUEdFYXNC?=
 =?utf-8?B?WUNlaWw0azFFelM0clBiNTRRSUo2S0IwdFl2MWN6RDVZYks4QVJadXowSVZC?=
 =?utf-8?B?ZTRJSTBHSWFQbGVFTE56eFMzQWt0WnBWUUtUR1FEVURiUWlTL3A2Qm9xemZt?=
 =?utf-8?B?Q0xOWVR2TTRjclcwVzRDdTVVMi84ODZlRTRUZXllZWhSZjJYTVNFWFpMRHBP?=
 =?utf-8?B?bUkwNmxPY2ZBT3V6QlRPN3hnOVhhR0RCWUJPS0ZCcHpxakFBOUJMTUZZZzRj?=
 =?utf-8?B?dWJuNlFuY3UwbzZ1OGhpRmxwbjlmVzNHT2txVlpicW9OWnJtQ1B0aGZCMzNE?=
 =?utf-8?B?VjVCaTAvcU9NRFRJNksrMzRIVzJJZ3pCcmsxeUYzRFNONkJTc0ZjVi9kdU8r?=
 =?utf-8?B?TitkNXdlc3BsdVFBb2hqaVdiSGlsR0xCdHBDNUIrcEkyN0RhNURLdGR4WFhZ?=
 =?utf-8?B?d1lKRTcybnFrNVQzMXlFK2hPVG54RjlOWFREcm8zd09YU0t2NWVFc2NDMDNF?=
 =?utf-8?B?enJMN0NPeHhheldZT0pDNWQydVYvdktyeVJlSkFLbVd2WlRwdXZIMUJjZWtL?=
 =?utf-8?B?QzBGdmQwa0pHdWdKVStiMXAwRDNuaFlGVVFrbUMwYUNCMllIY2tKT1UvOEZl?=
 =?utf-8?B?a1k2YUlaWG81K2RxajQ5ZDc3Q2VCUGVLN3czTEFjakVEQnZ1YkRjLzIzZmRE?=
 =?utf-8?B?R2gzL2FObmlhc2tWSDZmU3JlZE4xbkVuNlJIUzJkVENOVElkYkdkcEY2NFln?=
 =?utf-8?B?c3RXNVA1Nk5GdWgrSFB3dE5uQnVjSGhFYnEyWTk2Q1BYaTdxNVpicDhoVjZv?=
 =?utf-8?B?QTRDRDU4WDJudUJBRU9aalVjZGFTYVhOeit3NWM3Z3VOam9NdlZBejBsRGZk?=
 =?utf-8?B?NHFtdjlFL3ZOYmVXTzVVOFBucXRyS3NCazJEZDI0c2NnOVFIUEtEZGZLLzFD?=
 =?utf-8?B?dUllLzlxYk1rR1JRTzAreGhNZW1mUm5hRzJibzJ4OGdsLytJUjBjOFhpMWMx?=
 =?utf-8?B?bmprNnZKeWdWZmZ0YUdZMzFLcE0zKzZ0R2dUbXU5eHMwMFBGZy9MVmlJVHdz?=
 =?utf-8?B?Q3Nqemtob2hsNlFMOTE5bi9BeFliL2ZNL2hienFGTS9hdUVMZERuSUQxcUlt?=
 =?utf-8?B?RVR2ZkZ2bys0c3pZNnpTS3BzZGxnSk1BeXRsQTlJR1dtaVQ3TVYxeU01SUtO?=
 =?utf-8?B?eDZLamZpMWpPcXNhUFMrdHpWWCtoZzhMUnljM0xqc1lFSUw4Z3B0cGRqRzZH?=
 =?utf-8?Q?PqXYC8?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dHJvLzNObEkyWTU2NnNKc2lkbEhtN0pWbzE1b3EveGdQUWthampFTUN4dmMw?=
 =?utf-8?B?dFBzVWlLUmV0cmY2ejFSQ25mY0Y4eTBVRTZaK1UyL2IvRFlraHh6WTlYV3dF?=
 =?utf-8?B?UjRDZEVrU1p3S1FkSGlhMERwdFdKTzFpVnVIZ3dxRVpMTEdzZ1U5bmRlbHhC?=
 =?utf-8?B?dzRSSWpBU3ZzMnIrcnVET3lRTENnOUdFUTJ6Rkk5N0t5YXkvZjZjL1c3aVBs?=
 =?utf-8?B?ZFV1TlB4Smt4VzBYeWxKMkdEN1JvNU9ubUQ4QVBiY0lEaG5kekNjMzdFc1lC?=
 =?utf-8?B?Kzc1WFJXZWFBMzR3MGVnRFFGaHBCV28wNTJCY3R2ekttODZWdlRLR1krdVA5?=
 =?utf-8?B?VWdhWjF2S2lHUjNURWNCTHZGUXlwek9sb1dockdFY2NvbWVicG9tdVlXaDdF?=
 =?utf-8?B?SlEwQkVPbXJaNUMvVDhxRjhTSVF3cE1xcVFyMENjajlYQ2g0M1M2SGd0dUJD?=
 =?utf-8?B?dWdvZVMvM2NTZWtzL0h0eUFERVlva2NmeWhoeWZkRy96bmxiY3BLNU53eDhQ?=
 =?utf-8?B?UVdqYkpmRDhzWllVd0NQSUNkSzRKTDdteGtSbUovZWUrSERpa2hMczhKM2lK?=
 =?utf-8?B?eUZ4a2tLeWdLNFk1Y3RpeXQyNmhBUklOR0pwZkRNdEFwU05PTTZ0L3RRVUFO?=
 =?utf-8?B?ZEh3UExyVDdKYW55MUs3WDRZZTIwT2xZSTNHVnA5SVFPVXZ6eEx4OGZOQjUr?=
 =?utf-8?B?WjVWOE1pTks0QWVlV241Q29ZUWppR2lBSnBiK3BTR054QlQ4MzU2SzB1alk2?=
 =?utf-8?B?bUd2Nkt3a3RGN0o1bWRnZk40OHRacnpZUkxqanZGZ2x2ZHpteDFrd1B1MHZF?=
 =?utf-8?B?VTdqTFBoMVNjaHNrWW5CNjZPWVF6QUpTdnFlUjdyV1RraGZvQ0h0bUlJMmFx?=
 =?utf-8?B?RlNQY3RrOWE2RHBOOWR2akhFQjZmWHV6Y0JTNzRvdzhqTzRqbHZUTmtLcHh1?=
 =?utf-8?B?N2ZtYUVJTkVIWlloWmlHaENBeXpDOTdtemkzK082eWtRd3JLMjI2THE1SDF5?=
 =?utf-8?B?U3RUYndod095MFZicEtlS1AwWjlCaEpVK2lZL1JmTjZjMXFsRTVkbjZ4Z0Z0?=
 =?utf-8?B?aXRPVlJBYllaczMxRFN1SER6Nml6UDBNaU9pOEVNcEJTUHZhSVV1SWwrR3Jn?=
 =?utf-8?B?VkF6TWFoQy95L3d4M3VJUngvZzZxV1Z5ZDRhdXZJbWNhZmI4KzlOamlzSmFS?=
 =?utf-8?B?WmdaWVdmWDh2TGd3MUUvVytHWmx5b2xNcEIyQUptMGM5L2VqQWR6VlhIeXQ0?=
 =?utf-8?B?UktTWFpMYXFnZUh4ekFmbEZtbTFQWGoxMGduV2dVU3pvY0UxNGM5YThjUlpN?=
 =?utf-8?B?YWVKcGRGZm5UZW5OQWU0N1JuaHFGdUpUUTZIME8ra3ozNWZ0SW5KMlFOZDVm?=
 =?utf-8?B?MnpUbVF1eXUyalJMRTF0K3RBVkVvMGxBRHRTRTVzV21ScXdrQlVuNitwd2s3?=
 =?utf-8?B?d2pCRFpxT0ZwcEdFeit4Um1ObnowemtjYWJWallyK0V1K2ZEYkZqdzFIUHI2?=
 =?utf-8?B?V1pkazZUVlVuZlRFTGtxOVRiN2xWMVQ3VGVQdy9JWGIxYnBoQUhyMWVxTU1N?=
 =?utf-8?B?cThQTGdvUGxmNC80UGFWN003MEp1SFFjZkpoMFRzM1NKeEY0YTZZVWduQUds?=
 =?utf-8?B?S2JMeWJFRk1HejRYUnoyZlkzenJqTmQ2cktydnhMQ2l1UzNjR2RPR0N6elN5?=
 =?utf-8?B?OGY4NkREUTlmTWtQU3lGWHVUOStVMWtMYTZncTBpbFVvSFZoRllubEhyeHA3?=
 =?utf-8?B?Q2oyaThFQXMwc3VneThTR0ZzUm9sRmR4OEw4OVkvL1lWMzQ0aExRelhSR0k5?=
 =?utf-8?B?L3Nmdyt3SGNDY2hsQ1dUNVVZY2ZDa3FkTzk5UkVYUllxbGZnbUdKRW9obFd0?=
 =?utf-8?B?S1czMVFnVE5MZi9xcXdxY2tDZ1RNcWJEZUEwUFJ5cWJIVFZzZy95ZGpHcXFQ?=
 =?utf-8?B?eWJyMjNHdmE4ZlZOb3FsTU1DdWpvQ0dJdGM2WFd5ejRGRUEyclduQVV6V1Ir?=
 =?utf-8?B?cm1nS29Ra0pPVk83UlRkS1VQS25RMXBkOG5FalZ2cU1VbTFmNmlLSlA0Wko4?=
 =?utf-8?B?dHRoelY1Nk83cFJWVVBDNzFLMFRLd3BCMFZydUVSNGZhVXBUdTZSRUIxWlFF?=
 =?utf-8?Q?3gET9c+g5PTSzo3m6LfZLImtJ?=
Content-Type: text/plain; charset="utf-8"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: aa73e166-e3d3-4d52-9050-08de271957b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 03:11:33.2278
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8Phfh2v4GoNiqqiR7dOdS1Do0JT2PiitqOwc22VdVnkpvP0Fp3u6hrI8Dp4h+Yi205ugxEYftsDYhe0nosavBSlil2Pr6Z+LYR2uDSmvcoU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5027
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

SGkgUm9iLA0KDQo+ID4gKw0KPiA+ICsgICAgICBwY2llQDgsMCB7DQo+IA0KPiBUaGlzIG5vZGUg
YW5kIHRoZSBwcm9wZXJ0aWVzIG5lZWQgdG8gYmUgaW4gdGhlIHNjaGVtYSBhbG9uZyB3aXRoIGEg
cmVmIHRvDQo+IHBjaS1wY2ktYnJpZGdlLnlhbWwuDQo+IA0KDQpUaGFuayB5b3UgZm9yIHlvdXIg
aW5mb3JtYXRpb24NCg0KPiA+ICsgICAgICAgIHJlZyA9IDwweDgwNDAwMCAwIDAgMCAwPjsNCj4g
DQo+IFRoZSBhZGRyZXNzIHNob3VsZCBub3QgaGF2ZSB0aGUgYnVzIG51bWJlciBhcyBpdCBpcyBk
eW5hbWljLg0KPiANCg0KQWdyZWVkLg0KVGhlIGJ1cyByYW5nZSBpcyAweDAwIHRvIDB4RkYuIEkg
d2lsbCBtb2RpZnkgaXQgaW4gbmV4dCB2ZXJzaW9uLg0KDQo+ID4gKyAgICAgICAgI2FkZHJlc3Mt
Y2VsbHMgPSA8Mz47DQo+ID4gKyAgICAgICAgI3NpemUtY2VsbHMgPSA8Mj47DQo+ID4gKyAgICAg
ICAgZGV2aWNlX3R5cGUgPSAicGNpIjsNCj4gPiArICAgICAgICByZXNldHMgPSA8JnN5c2NvbiBB
U1BFRURfUkVTRVRfUENJRV9SQ19PPjsNCj4gPiArICAgICAgICByZXNldC1uYW1lcyA9ICJwZXJz
dCI7DQo+IA0KPiBOb3Qgc3VyZSB0aGlzIG5hbWUgaXMgY29ycmVjdC4gUEVSU1QgaXMgYSBzaWdu
YWwgb24gdGhlIGNvbm5lY3RvciBnb2luZw0KPiBkb3duc3RyZWFtIHRvIHRoZSBlbmRwb2ludC4N
Cj4NCg0KVGhlIHJlc2V0IHByb3BlcnR5IGFjdHVhbGx5IGNvbnRyb2xzIHRoZSBQRVJTVCBwaW4g
b24gdGhpcyBwb3J0Lg0KQXQgdGhlIHNhbWUgdGltZSwgaXQgYWxzbyByZXNldCB0aGlzIHBvcnQu
DQoNClRoZXJlZm9yZSwgaGVyZSB1c2VzIHRoZSAicGVyc3QiIG5hbWUuDQoNCj4gPiArICAgICAg
ICBjbG9ja3MgPSA8JnN5c2NvbiBBU1BFRURfQ0xLX0dBVEVfQkNMSz47DQo+ID4gKyAgICAgICAg
cGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gPiArICAgICAgICBwaW5jdHJsLTAgPSA8JnBp
bmN0cmxfcGNpZXJjMV9kZWZhdWx0PjsNCj4gPiArICAgICAgICBwaHlzID0gPCZwY2llX3BoeTE+
Ow0KPiA+ICsgICAgICAgIHJhbmdlczsNCj4gPiArICAgICAgfTsNCj4gPiArICAgIH07DQoNClRo
YW5rcywNCkphY2t5DQo=

