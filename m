Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D12A41813
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2025 10:05:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1ZZZ71DYz3c3n
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2025 20:05:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c400::2" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740387918;
	cv=pass; b=dMPcYGJ3MW2IJJr0f0+DWNDnvJNpStftWYDPONApWsvGoYEGzMPMUZpuwg5ReANoQ5V4vqVLJGTCreOMe6YDXj6BlLWVGK09/ZeLgJXRaDNlzwbb4mrMExOUWl+FYIxiL1mbSJfrzw8KXzP6nsDM9OLOFHZLHegtzFQNG1YC2XnTiDfFHL8WHZzDXSNdE7MQo11ossI22+GIuxhiOulE6Ity99+morvc8RGiJrqVSYkfC4oqJcrkSx75rl2hC4MqdPGZ8m/YsOdUrzUg+IEOByAK64QelNYxaJRETxI2ENKQmShZF5NWXGmhmOqjYNNk/7sWi03fSeB5BEHevAc3Rw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740387918; c=relaxed/relaxed;
	bh=1RhMuY6OIQsBs1Jcze7fS9ktq8rSEoNq0Z7+T1vS3EA=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CaKmJ7119wNPhv9uG6shfY+uZkI1f4g7TaVHmOePNWw5litAJvv4Am1umUFEdmNwBS2qH29DeHkSbJp6ghD9+QGvOqHj0EGD68CvM57aPrEh+l0VxcUCx2+QaPEcKKRr6EtyZ62exEtiKvOJ17HOi4yGdmPKa7yQKeO8JGFmUT1G0mU10EL1GFC8pOSWT9PqZAFwZTm5mw4gDSWFdwjm6w7d/iepqe6gyHtEONQfCfLGsSV2aWJ3C3+Rnt0FUZvSspa4ZiHF6QTyMdyyaKEApB29sLINGUgBbnQxeUW1OBd4ncLo+J927WcAPKu/ZTxZdqjaqNwMih9mIJIerMN2/Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=aspeedtech.com; spf=pass (client-ip=2a01:111:f403:c400::2; helo=hk3pr03cu002.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c400::2; helo=hk3pr03cu002.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazlp170110002.outbound.protection.outlook.com [IPv6:2a01:111:f403:c400::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z1ZYq3yH0z300g;
	Mon, 24 Feb 2025 20:04:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XEuJU5cJyFXEk/w0D8agICbWj0gA+Egu3jEHAckROyy+QJYw0LPZj6DAXD5xQkyZXMwb9KO3Ak6ufenIU+pw9VYLRgl+oGGopsGY1Aw+MlnGgPkjJUMyFBtyGKyfww3yYwWZv90er8FfS690rneQ0wnIisMlZxeICGH4fKLcPz3DGN58Z/6gmCXQ427yt1HiST/N3hgUuxUjPqq3v/GLVlpU24hLbD2/6A6MQz6DbS0bH2tbNK8/SbmLOAnTjoBOfpvTsN/4UfMXBIMK56dAJWdZcc3Vtp+WkuVnuijFNxy+fZk2VCkx9l4a0yXusUZtTlMPXpodAK6dav0P6k5bFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RhMuY6OIQsBs1Jcze7fS9ktq8rSEoNq0Z7+T1vS3EA=;
 b=jwcum2tQHz7Zek/5R75DfG5OOXB34VZmg6h76mqGjflYnkPlhVJzwpJAvF3EGit0TGcblyyTythgpZQke8Z9v4iv9PVxqep6AWsVcSb50zdHunIUVHgmK9auuXrMOnW+cMkTP6hczxhzagoAddKNOn3kEY44Ps0817xOQYyN2rgFNvhhc++jac9JyJkNiQbAFkURZJeLUbFq9kLV+VLFB2PRCCohoPrFP47BLCqiZa3zvnag+rs6HU8Lv9nlrDPPUJML5xr/848UdB1vzvya3kL9j2wFOgRQ/zxXVO9g+JrWMJrQx6VlxWO6xxTqC5mKggTowCYr5t0jfoAO7k1KTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RhMuY6OIQsBs1Jcze7fS9ktq8rSEoNq0Z7+T1vS3EA=;
 b=L1mXtOSI82iSJr8KHEiOFnBDSB23qunfc3rStDGqv5cLQGv6pb9rrufb8U2NQkXUgMINW3sqb60mzsQRGR/uQuRXHVTVkX1kmqXw/4DhSySFaubeJ70mnf/Hja67AwwsIGGO1l1yO0lHiIydhkD+vdnNWZltiB5vz8wPHR0AuWgpH5SilZbFjoVlbdsP/Y/iPwzXXy0OdB8xeMizyqEYU2uae0keo+44Ovq60hECqBGMS1N0WxYpwP9UPc7lIfn3fNMgwzZgBDY9UI8O1wrzTBjD36SamDtUEyoxKpLWqdWqr8tt0qhx8+qOrS1wgT06XnmwDgGF/OrB7PPehTQDwQ==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by KL1PR0601MB5630.apcprd06.prod.outlook.com (2603:1096:820:c2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 09:04:03 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%7]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 09:04:03 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, "benh@kernel.crashing.org"
	<benh@kernel.crashing.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v16 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Thread-Topic: [PATCH v16 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Thread-Index: AQHbhoFNsVARAeVOL0a52YXrKarMSbNWJmiAgAACR2A=
Date: Mon, 24 Feb 2025 09:04:03 +0000
Message-ID:  <OS8PR06MB75413DA9AF08F23506FA6DDBF2C02@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20250224055936.1804279-1-ryan_chen@aspeedtech.com>
	 <20250224055936.1804279-3-ryan_chen@aspeedtech.com>
 <ee0f5b583aadb42e7557e1afc49c5b9af594d2c3.camel@pengutronix.de>
In-Reply-To: <ee0f5b583aadb42e7557e1afc49c5b9af594d2c3.camel@pengutronix.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|KL1PR0601MB5630:EE_
x-ms-office365-filtering-correlation-id: 367f863b-150b-4fc8-e965-08dd54b22f4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018|921020;
x-microsoft-antispam-message-info:  =?utf-8?B?cFNtWGRubXJuTUtHZ1lzY1F3Vlk2SkFxa1J6SDVUeER5ek40OU5YeWNnZ05l?=
 =?utf-8?B?VTQ2ZFU4cmFGQmpNTzZ0TnlHaUxmakU3NTFsTCthWmxwNWt6NWIxeGxUZEVW?=
 =?utf-8?B?MmdNUjNENnlienpvYkxaanhGcWZCOEQrblJuMENBWEI2eXhDWG85SWZ5VEdG?=
 =?utf-8?B?YnVRRUh3dlQ1S2t0ZEpLWDNGZkMvWEU0TFk0QlBVQjd0K2tKVkZ0V0Y4bEZs?=
 =?utf-8?B?UlNHZmxhL0FSVGxNMUJucGc0SVVNZkcxU0puRXFUaUljZGZyL3JIenNoYzJo?=
 =?utf-8?B?MzA2Q3lVR1M0TEg0b0VvaCtqT2lxTlgrV2s0dnNsUXBRN3A1NzlWWHpLVHlw?=
 =?utf-8?B?V3hXSXVXeSt5SEZpTWNRaEdmdklqOHlxWHhhL3cwYld5bWFGaFA2aVdrWStX?=
 =?utf-8?B?amlLTFdFVXdlSE1HclVNK1FUMXlVem1kUThvUVJkWjQzdURORE1CZklyZlBH?=
 =?utf-8?B?QXBSSW9SR1FPSFpjZ3hpTHhOOGV5b3VNVlVENFVXamtJVWJ3bjhwK1QvVGJV?=
 =?utf-8?B?QUVGOG1sZmFlRzhDQjB2clE2OW9lcnpqTmZTeVNlVEtvK3hzam96NjUrYUZo?=
 =?utf-8?B?WmtudnNSUmh2M2JYcE9VL0dhRHFHYUV5UEpjMUF6bEhkN2gzSEp2U29IcnBR?=
 =?utf-8?B?OUIxemtULzlPTEpoYmZzMTdwTXZtVFZ2aDY2eGFYNHpudDZndGFOVXJzcG82?=
 =?utf-8?B?KzQ0OGZwR0ZpZkFUUVA3R2V6NG9BU0IxUU0zT1AreG1iYXZRVHloOGhvYXVY?=
 =?utf-8?B?ZDA4b0s0Sk9nSUZqdTRMc0N4WjJGaC9JNkVhUnBBZ2dFalIvQkFvZVZINU16?=
 =?utf-8?B?UmVpZklZS2tMN2xSUS94VVo2VTBDZEZVdFd0bmlsVHRQY0s3NmdRWG5haGhB?=
 =?utf-8?B?QUdycm5WdFNBTFlEMDRvWmhROGdWT0tILzA1SWNaditkV1FQK2xpUkNQWW5w?=
 =?utf-8?B?T21SNTNjWFBUNEQ5bnF5YnpoRE9Fa25UeFF5Y0hBdUhnYTdxT0c1NVFaUm5U?=
 =?utf-8?B?ZVg0cDQ5L3gyVDBVOVRzMElwUVpJcEl5V1VaUkZzdmJBRjBPcDZMZGh6Sncw?=
 =?utf-8?B?WEhET1lQM3hjK0FTYjRzeWRrMWJNODBKQlNuNm1ScEF2SGdXVHEvV0dLR1k4?=
 =?utf-8?B?NWQ2QmtvRFNkS2FZOTI0MU5aVDVLMTVvRGxnTlNpbHphYWl2UGRuMk1VajJm?=
 =?utf-8?B?UThBQmRabU9zR3dlZURKdHBnemRIK3B2L2dJcG9TcFhMMVU3bnIvM2NiTTlK?=
 =?utf-8?B?a1Y5WjBNVGhVNll2UmlZOFFNVDZwUmpFbVJNMmplU1Q4OGp3L2YyUnd5WktR?=
 =?utf-8?B?ZmljcFJmREUzN2FoSU42ekxnVk84eUl6THdOS00waStFUW5FcXVWc0F6K2Y2?=
 =?utf-8?B?eTF2M3g4eFBqWktqKzhDbTNUR1FCUmU1ZUxNWUpvTXNvTkIrU1hwZlV0ZzJl?=
 =?utf-8?B?eld5Wm9tWDdITlRwU216N0F2ZENYeG9pdVBtc3VVaHVSTThmdXZWdHNqSkY5?=
 =?utf-8?B?MCtMOGR5Q1VPbHZ6VU16ZGhFc3haOER5dmxNc0dsaFlvLzBOOGFqYWpUY09Z?=
 =?utf-8?B?a3lrZkcwZVVkNjNXWGkwaFViREtJSTRlTThPZzIxUzVJZmlML3FyV1ptOW5S?=
 =?utf-8?B?bk5QMytsWmxlWUpFYndDUlAwMlZqdjhOdlNrTmQ3bFE3TGk3T29DcG5yT0lw?=
 =?utf-8?B?Z0JvZE5CSEJUWTdER3VaNGRtdW9aWUg1V21OSktFUUcwM05tbHV3YXJEMHJ1?=
 =?utf-8?B?TGNwWVNkTXVXc1RXdWlJUWdXVWlaZy9mQXdlRDdxd0NGUDBPd2QvaVFnZXZ3?=
 =?utf-8?B?WjV0WTFVSDlVSHpwVWxaNjVsVEprN0NPUlV5R2IyQ3pTQnZ6WXFBbEdZTTJu?=
 =?utf-8?B?Q0k3VW1halBUOWFlMndNWnM0dnh4bCtiKzJ4M2tCYWdvODlIUUtSbXVoZUNV?=
 =?utf-8?B?ZXBscGNEY0VFaUxhTE11S0FXVFpVTG1WaWlBWExRSGNGeXk3aGJzcXBGMXZn?=
 =?utf-8?B?VGJHVVo5UURRPT0=?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UUZPV3hnTzVtb2I0Q3ZLWEUyTHppNmJXUW1NNmVIL25jT3FmWGZsSDFlNGlI?=
 =?utf-8?B?WVRxUGZnOElJaFFpZjkzMW50Qkg2R3dpNjNQQmNiTzNwVGltU2dBQW9FbTM5?=
 =?utf-8?B?b1JZT3pFZGxENnk0R21ENEQ5MlJvTGJ0eHFJTjRaY3VVV0hXTnpQUzdONkFp?=
 =?utf-8?B?ODFzQjdXOU42NkRWWHJkSDRWRjJPSHJ0M1lFQ3RON1QvcDk2RE9MbVVKdloz?=
 =?utf-8?B?S3MvQ2xmeE5NT3gvaTJGb3IvQnpNaTVYY0kxd05ORm5yQ1dHMXAzODlGYnpn?=
 =?utf-8?B?YnZ1VmFYWjJqcXlvYitnV2t6ZnNnbzBVS29nY1V1SFpBL1hHYUZFL0ZvMzIx?=
 =?utf-8?B?TVhyS3RYNWErbTNRM1JHcENYYm5vYVhjdHV5eDArL001UzVDRENZSDRDUno2?=
 =?utf-8?B?WXdLa3d5NkdQeXZodE9IOEpEQ2xCUCs5QSthQTRGMDNmaEo2bVVqR0NFQmN6?=
 =?utf-8?B?Q0wzSHZrb2ordmNmRFU1VEg2S3hXNFBwUUw0dkpaKzJLa3lOa1ZmQnh4MkhM?=
 =?utf-8?B?cElrNWdvRlFrWWpycENBc3pFRW5iS3JUbmtMbnViSnhvUXppVVllcnNHa2pt?=
 =?utf-8?B?ZWJxbmlpOFNtb20wMEdmUlhCTDBqTmZqSEhOMmtSMnRPVE9FSm5QMEdTMjZY?=
 =?utf-8?B?b1dsM0Z5UWFvOFdST1ZiN3hydUJRVWxOWXRQRDJOUGw2QWZnTzE1bzhnK1Ny?=
 =?utf-8?B?ZkhmS1BIRWdoT3lJZFNTK09rVEJYL2NFaVdISmxBZUZJWlVHdVg3UUlWdkJK?=
 =?utf-8?B?OWsrWVNoSlpUWHVrdUd5L2k2dWxVbHNDa3FqV2VDbzQwNG9BM2NHNE1rRTY0?=
 =?utf-8?B?RldXUFlNUWRpYXE3YjIxMm8ydHBvZEZKQTYzNHFrNlU3cktOa3d5ckl0Tkxy?=
 =?utf-8?B?b3pLMmdsYVZxWXR0K1RaSjZBUmswTHhzVXhtMGtsRytUZEpPUnBpTkZSZ21F?=
 =?utf-8?B?UVp1aWpaUmhIQmJOMm4vK2VTSmVkbWNTc2J2d2VyS0Q4MiswYkpnb2cwdmxx?=
 =?utf-8?B?QkJONFRFWEZoaDNydDl6Ri9WMEZqOFdPNVBGS2pTMEtJc2Y5OGtMcEI4V1c3?=
 =?utf-8?B?cXRtR1V1RURaS0loUVVaRmR2QzN3ZVNyS2x6VzdFK3hWazBKWnhNbE9HMVhM?=
 =?utf-8?B?VjA1VDhFZVRqdmNkMkE0UXRsV1BKb0JBdjlwVzhSOU5IWVNGVlpQRzdudmZE?=
 =?utf-8?B?cUEyTjA5RFovVHRPbHJhRkZyOFlhQStDbTQ5dEQyUk1YWXV4TFU1ZE5NcmdY?=
 =?utf-8?B?Q1dkamhBbmsyMWlaY1VBNW51MDJ4ajAya1BiRXMyanA3SStxQ1JteGVpUXRX?=
 =?utf-8?B?U3l2NWdXS0NWTDVpa0Vpcyt3R3pSWGVCL1YwU0trMUpFMVorY0FwdkhSM3c5?=
 =?utf-8?B?Z1VtVVRyTzI5dHdJQ2xWTWFOaU83N3Y4VEk1cjNDUjBqV3dvVUsyUTBsYWpL?=
 =?utf-8?B?THBTclIycEtEbzQ5WXBWbk05YWs0aGJNZk1mUE1QdmNId3l2MDFvMVB1cjFy?=
 =?utf-8?B?ZTRrejhSeEgzakFzR0xlUFhDM1R5cXNoS1E1V1J0VCs2aE9UazYyVzQ5dVdY?=
 =?utf-8?B?RzJDMXRlaW9TSjVDNE9ROGl4VmR4UGVPSWNpWWlRZ0owcXdtT0JEK3laVDJ2?=
 =?utf-8?B?MTVWbFZYWmVtRTRtaGpGdGd3dzRQY3pwSXp2RG5RN0RzQWFLUFRlZmFWRVpv?=
 =?utf-8?B?VXd0UWxjN3hpU2hzSGIwL2MwSGdBSnZjV3I3cklRdGVGRUpEQXhxOXpndXJw?=
 =?utf-8?B?TnhRN1YxeTRaUlptK1UrSlVacUdzb1dDVVYxSllwSjFXZjR6Wmd4ci9QdXRx?=
 =?utf-8?B?RDlNaVNaS1BrbmVTYmpWdUN6WkJ5Qno5Zkw4WHA4R0tsQUNtUFhyK21nM2VP?=
 =?utf-8?B?NFh4U0czM1RXcHdObytyUFJhM3RuNzVpcFYwTGcyWXFYbENDREtYd0g2M1hX?=
 =?utf-8?B?b2o1ZVprUG5FMUxWaUExaVpMa1V2eVl2N3Z5TW9HWnc5SW93K3dmSUdrZ0lo?=
 =?utf-8?B?WTlCSStOczk0emdNQ1FUaVkzbFg4cHdxaSs4ZXFSbFZ4eHFETjllVmtkcFZE?=
 =?utf-8?B?QWJSVzV4LzJLSzBZdTFSZXVaV3NpaVpnYTN1UExwU200ZlpTczBPS3lrWnA2?=
 =?utf-8?Q?DnIkfL7nBGI41epxLbCYH04ya?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7541.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 367f863b-150b-4fc8-e965-08dd54b22f4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 09:04:03.0480
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QKWAIS9byMY7vry8hUizTsSZPijsInpVHTa4fapNbRfWfDzaAG0VMVk+gjNWwhrSaEttY+b/VA5Q4OAsTD0limCyqY5j+0LSmnn4hCh5IU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5630
X-Spam-Status: No, score=0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYxNiAyLzNdIGkyYzogYXNwZWVkOiBzdXBwb3J0IEFTVDI2
MDAgaTJjIG5ldyByZWdpc3Rlcg0KPiBtb2RlIGRyaXZlcg0KPiANCj4gT24gTW8sIDIwMjUtMDIt
MjQgYXQgMTM6NTkgKzA4MDAsIFJ5YW4gQ2hlbiB3cm90ZToNCj4gPiBBZGQgaTJjIG5ldyByZWdp
c3RlciBtb2RlIGRyaXZlciB0byBzdXBwb3J0IEFTVDI2MDAgaTJjIG5ldyByZWdpc3Rlcg0KPiA+
IG1vZGUuIEFTVDI2MDAgaTJjIGNvbnRyb2xsZXIgaGF2ZSBsZWdhY3kgYW5kIG5ldyByZWdpc3Rl
ciBtb2RlLiBUaGUNCj4gPiBuZXcgcmVnaXN0ZXIgbW9kZSBoYXZlIGdsb2JhbCByZWdpc3RlciBz
dXBwb3J0IDQgYmFzZSBjbG9jayBmb3Igc2NsDQo+ID4gY2xvY2sgc2VsZWN0aW9uLCBhbmQgbmV3
IGNsb2NrIGRpdmlkZXIgbW9kZS4gVGhlIG5ldyByZWdpc3RlciBtb2RlDQo+ID4gaGF2ZSBzZXBh
cmF0ZSByZWdpc3RlciBzZXQgdG8gY29udHJvbCBpMmMgY29udHJvbGxlciBhbmQgdGFyZ2V0LiBU
aGlzDQo+ID4gcGF0Y2ggaXMgZm9yIGkyYyBjb250cm9sbGVyIG1vZGUgZHJpdmVyLg0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogUnlhbiBDaGVuIDxyeWFuX2NoZW5AYXNwZWVkdGVjaC5jb20+DQo+
ID4gLS0tDQo+ID4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9LY29uZmlnICAgICAgIHwgICAxMSArDQo+
ID4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9NYWtlZmlsZSAgICAgIHwgICAgMSArDQo+ID4gIGRyaXZl
cnMvaTJjL2J1c3Nlcy9pMmMtYXN0MjYwMC5jIHwgMTAzNg0KPiA+ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKw0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDEwNDggaW5zZXJ0aW9ucygrKQ0K
PiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hc3QyNjAwLmMN
Cj4gPg0KPiBbLi4uXQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWFz
dDI2MDAuYw0KPiA+IGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hc3QyNjAwLmMNCj4gPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uYmZhYzUwNzY5M2RkDQo+
ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXN0MjYw
MC5jDQo+ID4gQEAgLTAsMCArMSwxMDM2IEBADQo+IFsuLi5dDQo+ID4gK3N0YXRpYyBpbnQgYXN0
MjYwMF9pMmNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikgew0KPiA+ICsJc3Ry
dWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsNCj4gPiArCXN0cnVjdCBhc3QyNjAwX2kyY19i
dXMgKmkyY19idXM7DQo+ID4gKwlzdHJ1Y3QgcmVzb3VyY2UgKnJlczsNCj4gPiArCXUzMiBnbG9i
YWxfY3RybDsNCj4gPiArCWludCByZXQ7DQo+ID4gKw0KPiA+ICsJaTJjX2J1cyA9IGRldm1fa3ph
bGxvYyhkZXYsIHNpemVvZigqaTJjX2J1cyksIEdGUF9LRVJORUwpOw0KPiA+ICsJaWYgKCFpMmNf
YnVzKQ0KPiA+ICsJCXJldHVybiAtRU5PTUVNOw0KPiA+ICsNCj4gPiArCWkyY19idXMtPnJlZ19i
YXNlID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDApOw0KPiA+ICsJaWYg
KElTX0VSUihpMmNfYnVzLT5yZWdfYmFzZSkpDQo+ID4gKwkJcmV0dXJuIFBUUl9FUlIoaTJjX2J1
cy0+cmVnX2Jhc2UpOw0KPiA+ICsNCj4gPiArCWkyY19idXMtPnJzdCA9IGRldm1fcmVzZXRfY29u
dHJvbF9nZXRfc2hhcmVkKGRldiwgTlVMTCk7DQo+ID4gKwlpZiAoSVNfRVJSKGkyY19idXMtPnJz
dCkpDQo+ID4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKGkyY19idXMtPnJz
dCksICJNaXNzaW5nIHJlc2V0DQo+ID4gK2N0cmxcbiIpOw0KPiA+ICsNCj4gPiArCXJlc2V0X2Nv
bnRyb2xfZGVhc3NlcnQoaTJjX2J1cy0+cnN0KTsNCj4gDQo+IE5vIHJlc2V0X2NvbnRyb2xfYXNz
ZXJ0KCkgaW4gdGhlIGVycm9yIHBhdGhzIGJlbG93PyBZb3UgY291bGQgZ2V0IHRoYXQgYW5kDQo+
IHNpbXBsaWZ5IHRoaXMgYnkgdXNpbmcgZGV2bV9yZXNldF9jb250cm9sX2dldF9zaGFyZWRfZGVh
c3NlcnRlZCgpLg0KPiANClNvcnJ5LCBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X3NoYXJlZF9kZWFz
c2VydGVkIGlzIG5ldyBmb3IgbWUuDQpEbyB5b3UgbWVhbiBtb2RpZnkgYnkgZm9sbG93aW5nIA0K
DQppMmNfYnVzLT5yc3QgPSBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X3NoYXJlZF9kZWFzc2VydGVk
KGRldiwgTlVMTCk7DQppZiAoSVNfRVJSKGkyY19idXMtPnJzdCkpDQogICAgcmV0dXJuIGRldl9l
cnJfcHJvYmUoZGV2LCBQVFJfRVJSKGkyY19idXMtPnJzdCksICJNaXNzaW5nIHJlc2V0IGN0cmxc
biIpOw0KDQotIHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQoaTJjX2J1cy0+cnN0KTsNCg0KPiByZWdh
cmRzDQo+IFBoaWxpcHANCg==
