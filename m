Return-Path: <openbmc+bounces-831-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6E1C190A3
	for <lists+openbmc@lfdr.de>; Wed, 29 Oct 2025 09:30:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxL5n74dXz3bfN;
	Wed, 29 Oct 2025 19:30:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761726605;
	cv=pass; b=EtmuIDIPkb3Ln/vIItEmxI2avruMAPb6ytNWqA79EqXrvrtxmCvxWqsH34s7zEu7BUaSzDT/PXSv3bONduL25ElTwsZthdG2zGRX5Sn9QNOr4yoK4P2pmANemz2XMBHwizuAHc5YbBk8MlpB0o5uPulYpjVDf2nXudZ7qNpPmj13P9YXJGPy35fYaMPpF257Prmc9jz2RFHP7bai+/sCLoIun+wcTZGkfVoSdm+vuRHOZ/CAbYI/3OfeEsM4OS5JBQaPQyG3hDKnUfHqvnRodFwJWqlIMc0zx8NjyI88Du+pCjcdJgkXCicum4yhCJc1CsikA3x7fIMTWL5aYlmO5A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761726605; c=relaxed/relaxed;
	bh=8CDeYTthH75N6eUDoTagqDPrzwXpicTxcbfi2IXb29U=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dbPfA+acZlrGHCOI5nDvji4oO2kaAhQdViFp8TrU9RtfwRIJzbID9oswLqk/km2Q/TU7SYiEwaCk6RU0RA6cXmnPZ7weml73szMaLaJnjLuab+1miKyFjOhsjFqHyp2aZdoWSMy++n5k8GRJ4oxW9Ee1xeJ+l2jbUR0yR6qjVkALA3blQpIYY7DTgqXrRKVu0AxX2NtmMG4X+9jJkwa/2oNstTyefMyFpzE0q8cyWaKndud2snwkMS43zHBWrOs2YQsHdZ15elZpT1AMgVyIDek9evg3VQ1sqD1aSGwr2ttIxdVr9T7JGGkC51EedcCKmlofzdPQO2BlAYvVHgpXqQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=mQAziaF2; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=mQAziaF2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxL5l69qqz2xnk;
	Wed, 29 Oct 2025 19:30:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hCr21w7clNmoeR166RlhYP6DY95AxuemGlFXtkcn2dxPOhy1tvK2SnIKgXPej0/GCc+I/yC02mVLd6bSa6WiRRu1FnPyvxJBCcfEdzTcBiRh5tA65NUY1OC6ITH1Rrr9cEM1D6Uf6KVSQwrTaP2MOGIMiNYvYWsZRf6Aa6iHV2Fq7TDp4zekfgeYWsmcnf2Cxzq588ysA3mR/U4lCZ1WyJCrtig9fGBuzHe6G5NivaMudlYHQd8dTsSCdPTX6qaNpsG2/6B7am+Dd5PqzxLWFLoVQDPq/f3MXlkjsaSbFk3reXPXhObVYebGapfzL6hMexXddjBqbm/e4udpcG9y/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8CDeYTthH75N6eUDoTagqDPrzwXpicTxcbfi2IXb29U=;
 b=XsjavsD7EJum3VObitwQJKhcBqv7L1YhMLGbzsfaW7yhknTnJcqEgPiCgWzYMNHlYjJ8I//i9suXjgt5HBSCBhTRJMcVuK7w2VMwisPdAEpG5QSVT2Paig3/EMc0gkSPT5CT/ouSXs56ko6GjBMrfQGEqNPzC91mtmnZP/4Ny/5c7J0DLiawiwv3j3BiDlM9o0ThAE3sIl25jmD/RK099mQ3mjCXUnALvsN12SDi3J+RQ8ZlCcoMGghj8KB63s2R57OFIBp6toHvEivVE/cGixdgWUg6FUKoXsu/EugS4atIy1cY/jIQzaJmyY1grq4r7ZHtD0Wlyrs6ytpUcqw7Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8CDeYTthH75N6eUDoTagqDPrzwXpicTxcbfi2IXb29U=;
 b=mQAziaF2xm+bvUB9iZjk+8Hun8TT5VTpaLdJYGlmbrF0faLpVP0jmNOuQbp1iMJL3ifdM/j/Xhg9rJQex6q+YcHcefTUzLSXHIU53iQhWd5eBylqWQFbka8ocjHJc2gRGWcIhV1X+Len6ydHZ3rQ8FIqkKf6rSfEBmvPeTYbe9YMGC8KSrcfLG5TKK7FwWdHVtS1KjsFGC+IO6FePS2UJE2WprHriEbRv0iB50jPVKphmbEVQoIOLGZvicbIEw9nseXbwUsfDjCizGtjinFRbBgZrPzk9dQi6OvBrVBtfD3ivGdmviZqdywgI27T48kK3C8iuNGO7ou97m+DrKHrpg==
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com (2603:1096:408::791)
 by KL1PR06MB6135.apcprd06.prod.outlook.com (2603:1096:820:d3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 29 Oct
 2025 08:29:36 +0000
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80]) by TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80%7]) with mapi id 15.20.9253.018; Wed, 29 Oct 2025
 08:29:35 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "benh@kernel.crashing.org"
	<benh@kernel.crashing.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "jk@codeconstruct.com.au"
	<jk@codeconstruct.com.au>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>, "naresh.solanki@9elements.com"
	<naresh.solanki@9elements.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v20 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
Thread-Topic: [PATCH v20 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
Thread-Index: AQHcQisKZrgNdIKVU0mDlJSyYndfALTQ+A6AgAfdvQA=
Date: Wed, 29 Oct 2025 08:29:35 +0000
Message-ID:
 <TY2PPF5CB9A1BE6597ECD46BD4CB7C5F09FF2FAA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20251021013548.2375190-1-ryan_chen@aspeedtech.com>
 <20251021013548.2375190-2-ryan_chen@aspeedtech.com>
 <0b76f196-f642-4991-ad5c-717c23938421@kernel.org>
In-Reply-To: <0b76f196-f642-4991-ad5c-717c23938421@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PPF5CB9A1BE6:EE_|KL1PR06MB6135:EE_
x-ms-office365-filtering-correlation-id: 0e0324ba-b48b-4c75-b4a8-08de16c54b10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|38070700021|13003099007;
x-microsoft-antispam-message-info:
 =?utf-8?B?VndsKzduampKV05YTmFYbTh2UDc2UXR1bXRZZ2xvY3pyL1RkVmZoeDJBY0pS?=
 =?utf-8?B?c3NNeFhiM2drOWdFS2ZsajRxWjMvajV1QW0zVWtnT3djNWNVRyszU1FXdEI4?=
 =?utf-8?B?MldPTER1NzJWUm00Y0NUYnNoYWV2WkxNKzJxWnd4bjBPeUdLY2JOdnBwanpn?=
 =?utf-8?B?OW1aSE1lYW1HeEQ2K25PdldpK2lBeVlkblFDUVJsVVptSGhPbTBSTU5KaE5k?=
 =?utf-8?B?cVp5OWc2MFR2OFAxekVTSks1dTh4NmhoZUR5TGROSkY3TzlKMFlld1V0d3VG?=
 =?utf-8?B?ZFRQbzlodGRCdkR6U1QxRGtvdUZkNjVSc1d0RmttVlNQcFZwUG5PREZuODBK?=
 =?utf-8?B?QlJwVHNNRVdzMUtqK3haaTBJaEk1MnNGSlJQVHpBY3ptY2FLaGY3OCtBVHF3?=
 =?utf-8?B?dE5IK2hvOTFHM3JHcjVmb2IzekNRR1pJTmFiTmNET0pGcHNjNWRoVEF6U2Ux?=
 =?utf-8?B?VVBWeFNiVDVzUzQ1YzhzSnMydkFnWlNobFlJVGZhbGg4UFJHL2pKYk5VZHc2?=
 =?utf-8?B?emRkbld1ZVFYcEhYWFNzcnZFOWY2ck95RmZubk9JbFBud0x6S2NWNk9JVkhw?=
 =?utf-8?B?RzNoYXRQa3hTc08rMldKSEdzdFZCRlI5Y3JIVllEcitVcFVDb203NmRoY3po?=
 =?utf-8?B?QWovWEFDQTJMR3ZrN1hiYXhLZmN3Y1RCSUtpaDVzNC9TeXIrc1owY2ZNTkMw?=
 =?utf-8?B?ekI2OFNDU1puNzJJUW1iSEZvTk1pbm5KLyt4Q29LM0tvcjY2TnFJKzE5ejlv?=
 =?utf-8?B?SnlCSHNLOVdiVy9rRVM4STJxREZreGgxc0IrMmpheGRtK3d1enc0dWJGeVpC?=
 =?utf-8?B?WHZRdm1ONzZtK3hQOGV3NU81SjN1VUZNS2FCdlVDQTk2aHVPaUx6TWtxYW8x?=
 =?utf-8?B?ZHo2YlJjcnUrdVk3Rk9YTytZcFh2dzZucFNJTU9lQVd1bXZiMzlKSEQyTlBY?=
 =?utf-8?B?M2NDR0dZSFd0VlIyOVE5QkdYNGdTTUhKZ3JubmI4YUJOdFdDZWN3dEVTaUJy?=
 =?utf-8?B?REdUWC9TU1RpOVJiV2xMRTFPVFBrdTU1OC9HZVRXYlc2ZFBVODFSellsakdh?=
 =?utf-8?B?UmliaWdGYUl6Q2RHNm9JV1QwWk1VTzNQUkoxTjkyaWg4R0tCQ2Z0OElYY3Vv?=
 =?utf-8?B?b3IxUHh1Y2xHV2RLVjRkZzdvYXpHbElvNWtOb3cwdnd2TTlUeEIyaTZPNFpK?=
 =?utf-8?B?Q2FVc2hvYkg1RCt3dlRweGFvaGRoWVhPYjBXdWRQeHV3eTVWTVlmMmx3OEho?=
 =?utf-8?B?cU9LMUhTVFhSY0h3bmx4bDhheTFpanJrbHM4WUdLT3RjbDZXVHV5VTdhc2lR?=
 =?utf-8?B?Q2dQUnRxVjVkejQ1Yk1xT0l1L0JLa0N0SExpNmRnNnd1UEphMHpzZy9MWDZ1?=
 =?utf-8?B?RnJVV3ZpSEZidndOaU05UXZvTGVKbnF6WEhoQnRlWW9FZ05UUmVMTXUzakZh?=
 =?utf-8?B?M3VZZGg0d3ZMRWIrbkZwRGtHVVZyL3BPM2EyNFhtWXp6Y0xrWW1nQkFMTHQ3?=
 =?utf-8?B?eGJ5aWdvWUVqYUJXTHRraHJhbkRGaks1c05KNEt3TDNmd3VhclZXVFBSZkla?=
 =?utf-8?B?VVVwTnoraFRPT1hEaHgzRXF6RDBTRXBYNko0ZWMzcFdxenZaTFRLZHdDTWNi?=
 =?utf-8?B?VjBwd05ESkd6eHlZaWRlaFdISlRrUVYrSjhJUWxEbE12L0w2a3Q3OXdORXI1?=
 =?utf-8?B?ejROUDNxOEZ2Y0poWDN5OHZOZ0Q5Rkl3anBGTkZIaHVoejRTSmdZWFBJMHlG?=
 =?utf-8?B?SVp5c0xCZHg2NHRuV2tNNzBIeDVNQkEzYTRoa3l1Z2k2TnJXd283bFBWVlRJ?=
 =?utf-8?B?Z2h2b25oOGFlTmdJdXNadXZ5UTliOEd0dy9FU0h3Wlp2Z2hZdjBaQktGaE9m?=
 =?utf-8?B?NEVIdVZNMjRvaTBLV0YydXVPSk9OVFVSczIxKy9saHBhaFdYN2JiTTFnWW1N?=
 =?utf-8?B?V0hKbTAxSWduS0orUDVudHkxMnd5SE5NcE1mSjhuZ2dtWlpsK3hBZy9JdXo1?=
 =?utf-8?Q?ElWSV0ZDN3RSG8PiW4ahm0kcuPOio4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700021)(13003099007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bXh5MTh5K1RuTDYwMlRRUUxyTzk4cmZwejRmWDRDYy9zb0pqeVN3ZytZeXZk?=
 =?utf-8?B?WXQ0ekxWM0F4OWx2NUhlWkUwcE41TVJLTmlmNlRRekpTMEdrRld3MnZGeHlU?=
 =?utf-8?B?V2d0MXJWWndjM2xLQjhieUdBWGo2WWhSbVlRcFFWUmV4QW1hTXpqWjFLbSt2?=
 =?utf-8?B?WkJnS0p5RXBYbWVZY1J1TVVJckJlcnB3ZXlFR2ZKSDJzMWVLR1l3K0k5RUt6?=
 =?utf-8?B?akVJUUt3RlMyV0pvYjArV0VIcStSUzZlMTJ2Q3p4V044RTZrR3RZZCtQWEVL?=
 =?utf-8?B?Q0EvL21ReVRFVU05WmdZa2VnbnBUY2tuSmhNdWxMK25iYzk0VzdZVXVPNTNT?=
 =?utf-8?B?MHg5c1d6UDZmK2grZmU0N3ltRHNmMEpLY0doR0xXR21WT1VFWWVzN2psUWhP?=
 =?utf-8?B?cmt5bVYzalZPdHIrdkRlZGpKSzJnd2FhNW9aYXJWNGFWRGp3NmdJdFlQMVFD?=
 =?utf-8?B?cGFaSkUwbHRqZXBtQjUzM0hQRTNWckdtYUVhNWlUdmFGWWtta2cwTXBlOWhX?=
 =?utf-8?B?OXVYcmcrOXRxa28ydk9mTDNQbkZhQkRSeXEyNUFIZnFHRFlEdWNxTDFlNkx0?=
 =?utf-8?B?ZnlvWUFDQXcydHVjc01MVWxpUlMyRGJIWWF0ZVdBSDd3Lzh5aXNoZzJWc3F4?=
 =?utf-8?B?V015cWg2MkF3UlpFbUtNT1RVU3RDZHIwYTd3OFlESUNXM1ViMTdTc2pYZ002?=
 =?utf-8?B?Y1ZXVE00U1VVZjF3WDhlNUtFM3RUK1VxQ05YMmVnYW1URGw2cllyRUNSUTAw?=
 =?utf-8?B?RTVtL1V4YjRIQVpvNmE2SmNzbVF6SkY5Q2s3WDkxa0d2bmY4ZGtJcXluTFRl?=
 =?utf-8?B?OE5ocmEzSm10SitXZ1kxUXZ2bU5EMVkzQXZiZ2ltV3JkR3RiY2Z0UWZTM3Rm?=
 =?utf-8?B?S0RGQkxTMWtwQm53VCtYaHEvMWYxZ3BmMnBuSXhuMlhrdVYycHFnMDFRWE52?=
 =?utf-8?B?S3NYcnpxK0o3UUVyRU9VOUhMYTVOcWhPdTVlRGUzNWhFd2EzVTEvNWpZRUpU?=
 =?utf-8?B?THR5WHpvWGFrd3ZocHpSaHVyc0YraW5IejNiOE1vNSt3T2kzNlVHS2NxSHBo?=
 =?utf-8?B?TmRzLzJtR2UyOHZ6ZWF2OVRxNy9WNkJVY1dNbUdkL1hmRWNBRi8rYmQxNUVh?=
 =?utf-8?B?SnhxaUttNFhlYVZFK3YyQ2IyNktLTGU3aithY2s1c09KK3YxeENEKy9FZ3ZY?=
 =?utf-8?B?SFhFcFpraFBGK3JMemp2cDVyVkUwWUNqY0NRSzhKUEtkK0JOUmFwMzdwaHM1?=
 =?utf-8?B?Q2srUGtIUjFIN3k3d0FBYTFqS2gxeG5iZlpDMzFUV2g3RHBJMFVyVVB0djFu?=
 =?utf-8?B?amRvUkgwdGZ3WWZQdzBOc2s1MWZIUFE3ZWxacDZJdzhnVGZ6RkkwRjdUeXgy?=
 =?utf-8?B?alM2Nzd5T1I4T1BxVFlnS0hNdWZIRzB4VEozc3BINXNxbUV4MWpWcVN3Y0kr?=
 =?utf-8?B?aCtYYjRsT0xvTHFkczU5TitZSDV2WTNFdERkNkQxVWhOYjhnS201ckhER2Ns?=
 =?utf-8?B?cjNYUTI3TVBlR3lBcHk0WHI0QjFCNUx2Qy9idnFLWStQQzFQajhXdXhCYzhM?=
 =?utf-8?B?UGMxVGk3UVlRRDlid3AwZE5DT3RsNWplVGRqRWVXUEJ5OXlyVlRkcG5yNVdW?=
 =?utf-8?B?SjdZQzNZMEhVcFNRQlR1R0FlY0h3MHJxY01aeld4Z0plbzVrbkFpVGErZElW?=
 =?utf-8?B?M0NndFUzdTBRU3QxYmRGQ05xdUd1cFRQZk10M0JuUXppejU5L1ZQRVlETXp3?=
 =?utf-8?B?QnpBektobWNwNkhkTkYvYnhJNmdkalJDMDBEM2kzTG9DdWlzeHJTRmlaakw4?=
 =?utf-8?B?NWs0NVoyQ1ZtRm9EeG56SEFqYzh4K0dHbFdjM3NBNXB3cFRzTE1RQ1FxQ0Ur?=
 =?utf-8?B?V29KK1ZQRWpiQkY4R1RZVU55NTl6S0ZSay9NeUt4YVZQVGl2ZEwzUEpLcFBt?=
 =?utf-8?B?N2cxdUNYWVdWbnZFelNRN0xJbnlxYWJNL21QU25ITUM5VE4vZGV3UndqWnB6?=
 =?utf-8?B?alNwdTZ6VXEwdmU3byttRkk0OEkxaFhtdzdsZ1l5OElpaXk0em1ubGh5T0l2?=
 =?utf-8?B?VjVjWHZqODFXS084NExLUG1qWFk2eHpJTzZyU3dLait6dGRyVk93RnBWanN2?=
 =?utf-8?Q?ihsZcw+Y5db5pW6BZt+Zpgi9h?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e0324ba-b48b-4c75-b4a8-08de16c54b10
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2025 08:29:35.6425
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TpKgoDvZ80MihjY5/bA4rfv1XC63wTDRv6lFNkjSOZtmCNbemgR9yppyul0VNs+kAfTTkQul2WEvEcmnpGlXtB1Z9MQ1bQvAccoIZ/YSy7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6135
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyMCAxLzRdIGR0LWJpbmRpbmdzOiBpMmM6IFNwbGl0IEFT
VDI2MDAgYmluZGluZyBpbnRvIGEgbmV3DQo+IFlBTUwNCj4gDQo+IE9uIDIxLzEwLzIwMjUgMDM6
MzUsIFJ5YW4gQ2hlbiB3cm90ZToNCj4gPiBUaGUgQVNUMjYwMCBJMkMgY29udHJvbGxlciBpcyBh
IG5ldyBoYXJkd2FyZSBkZXNpZ24gY29tcGFyZWQgdG8gdGhlDQo+ID4gSTJDIGNvbnRyb2xsZXJz
IGluIHByZXZpb3VzIEFTUEVFRCBTb0NzIChlLmcuLCBBU1QyNDAwLCBBU1QyNTAwKS4NCj4gPg0K
PiA+IEl0IGludHJvZHVjZXMgbmV3IGZlYXR1cmVzIHN1Y2ggYXM6DQo+ID4gIC0gQSByZWRlc2ln
bmVkIHJlZ2lzdGVyIGxheW91dA0KPiA+ICAtIFNlcGFyYXRpb24gYmV0d2VlbiBjb250cm9sbGVy
IGFuZCB0YXJnZXQgbW9kZSByZWdpc3RlcnMNCj4gPiAgLSBUcmFuc2ZlciBtb2RlIHNlbGVjdGlv
biAoYnl0ZSwgYnVmZmVyLCBETUEpDQo+ID4gIC0gU3VwcG9ydCBmb3IgYSBzaGFyZWQgZ2xvYmFs
IHJlZ2lzdGVyIGJsb2NrIGZvciBjb25maWd1cmF0aW9uDQo+ID4NCj4gPiBEdWUgdG8gdGhlc2Ug
ZnVuZGFtZW50YWwgZGlmZmVyZW5jZXMsIG1haW50YWluaW5nIGEgc2VwYXJhdGUNCj4gPiBkZXZp
Y2V0cmVlIGJpbmRpbmcgZmlsZSBmb3IgQVNUMjYwMCBoZWxwcyB0byBjbGVhcmx5IGRpc3Rpbmd1
aXNoIHRoZQ0KPiA+IGhhcmR3YXJlIGNhcGFiaWxpdGllcyBhbmQgY29uZmlndXJhdGlvbiBvcHRp
b25zIGZyb20gdGhlIG9sZGVyDQo+ID4gY29udHJvbGxlcnMuDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBSeWFuIENoZW4gPHJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT4NCj4gPiAtLS0NCj4gPiAg
Li4uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2FzcGVlZCxpMmMueWFtbCAgIHwgIDMgKy0NCj4g
PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2FzdDI2MDAtaTJjLnlhbWwgIHwgNjYNCj4g
PiArKysrKysrKysrKysrKysrKysrDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNjcgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkgIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvYXN0MjYwMC1pMmMueWFtbA0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvYXNwZWVkLGky
Yy55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2FzcGVl
ZCxpMmMueWFtbA0KPiA+IGluZGV4IDViOWJkMmZlZGEzYi4uZDRlNGY0MTJmZWJhIDEwMDY0NA0K
PiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvYXNwZWVkLGky
Yy55YW1sDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9h
c3BlZWQsaTJjLnlhbWwNCj4gPiBAQCAtNCw3ICs0LDcgQEANCj4gPiAgJGlkOiBodHRwOi8vZGV2
aWNldHJlZS5vcmcvc2NoZW1hcy9pMmMvYXNwZWVkLGkyYy55YW1sIw0KPiA+ICAkc2NoZW1hOiBo
dHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4gPg0KPiA+IC10
aXRsZTogQVNQRUVEIEkyQyBvbiB0aGUgQVNUMjRYWCwgQVNUMjVYWCwgYW5kIEFTVDI2WFggU29D
cw0KPiA+ICt0aXRsZTogQVNQRUVEIEkyQyBvbiB0aGUgQVNUMjRYWCwgQVNUMjVYWCBTb0NzDQo+
ID4NCj4gPiAgbWFpbnRhaW5lcnM6DQo+ID4gICAgLSBSYXluIENoZW4gPHJheW5fY2hlbkBhc3Bl
ZWR0ZWNoLmNvbT4gQEAgLTE3LDcgKzE3LDYgQEANCj4gPiBwcm9wZXJ0aWVzOg0KPiA+ICAgICAg
ZW51bToNCj4gPiAgICAgICAgLSBhc3BlZWQsYXN0MjQwMC1pMmMtYnVzDQo+ID4gICAgICAgIC0g
YXNwZWVkLGFzdDI1MDAtaTJjLWJ1cw0KPiA+IC0gICAgICAtIGFzcGVlZCxhc3QyNjAwLWkyYy1i
dXMNCj4gPg0KPiA+ICAgIHJlZzoNCj4gPiAgICAgIG1pbkl0ZW1zOiAxDQo+ID4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvYXN0MjYwMC1pMmMueWFt
bA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9hc3QyNjAwLWky
Yy55YW1sDQo+IA0KPiBXaHkgY29tcGxldGVseSBicmVha2luZyBuYW1pbmc/IFBsZWFzZSBmb2xs
b3cgd3JpdGluZyBiaW5kaW5ncyBjYXJlZnVsbHkuDQoNCldpbGwgdXBkYXRlIA0KJGlkOiAiaHR0
cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvaTJjL2FzcGVlZCxhc3QyNjAwLWkyYy55YW1sIyIN
Cj4gDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjZk
ZGNlYzVkZWNkYw0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvaTJjL2FzdDI2MDAtaTJjLnlhbWwNCj4gPiBAQCAtMCwwICsxLDY2
IEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNE
LTItQ2xhdXNlKSAlWUFNTCAxLjINCj4gPiArLS0tDQo+ID4gKyRpZDogaHR0cDovL2RldmljZXRy
ZWUub3JnL3NjaGVtYXMvaTJjL2FzdDI2MDAtaTJjLnlhbWwjDQo+ID4gKyRzY2hlbWE6IGh0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KPiA+ICsNCj4gPiArdGl0
bGU6IEFTUEVFRCBJMkMgb24gdGhlIEFTVDI2WFggU29Dcw0KPiA+ICsNCj4gPiArbWFpbnRhaW5l
cnM6DQo+ID4gKyAgLSBSeWFuIENoZW4gPHJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT4NCj4gPiAr
DQo+ID4gK2FsbE9mOg0KPiA+ICsgIC0gJHJlZjogL3NjaGVtYXMvaTJjL2kyYy1jb250cm9sbGVy
LnlhbWwjDQo+ID4gKw0KPiA+ICtwcm9wZXJ0aWVzOg0KPiA+ICsgIGNvbXBhdGlibGU6DQo+ID4g
KyAgICBlbnVtOg0KPiA+ICsgICAgICAtIGFzcGVlZCxhc3QyNjAwLWkyYy1idXMNCj4gPiArDQo+
ID4gKyAgcmVnOg0KPiA+ICsgICAgbWluSXRlbXM6IDENCj4gDQo+IFdoeT8NCg0KV2lsbCB1cGRh
dGUgYXMgZm9sbG93aW5nLg0KDQpyZWc6DQogIG1pbkl0ZW1zOiAxDQogIG1heEl0ZW1zOiAyDQog
IGl0ZW1zOg0KICAgIC0gZGVzY3JpcHRpb246IEkyQyBidXMgcmVnaXN0ZXIgcmFuZ2UNCiAgICAt
IGRlc2NyaXB0aW9uOiBPcHRpb25hbCBwb29sIGJ1ZmZlciByZWdpc3RlciByYW5nZQ0KDQo+IA0K
PiA+ICsgICAgaXRlbXM6DQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IGFkZHJlc3Mgb2Zmc2V0
IGFuZCByYW5nZSBvZiBidXMNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogYWRkcmVzcyBvZmZz
ZXQgYW5kIHJhbmdlIG9mIGJ1cyBidWZmZXINCj4gPiArDQo+ID4gKyAgaW50ZXJydXB0czoNCj4g
PiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICsgIGNsb2NrczoNCj4gPiArICAgIG1heEl0
ZW1zOiAxDQo+ID4gKyAgICBkZXNjcmlwdGlvbjoNCj4gPiArICAgICAgcm9vdCBjbG9jayBvZiBi
dXMsIHNob3VsZCByZWZlcmVuY2UgdGhlIEFQQg0KPiA+ICsgICAgICBjbG9jayBpbiB0aGUgc2Vj
b25kIGNlbGwNCj4gDQo+IFRoYXQncyBub3QgZXZlbiBjb3JyZWN0LkVpdGhlciByb290IGNsb2Nr
IG9yIEFQQiBjbG9jaywgeW91IGNhbm5vdCBoYXZlIGJvdGguDQo+IFVubGVzcyAicm9vdCBjbG9j
ayIgaXMgbm90ICJjbG9jayIgYnV0IHRoZW4gaXQgaXMganVzdCBjb25mdXNpbmcuDQo+IERyb3Ag
ZGVzY3JpcHRpb24gYW5kIGZpeCB0aGUgY29uc3RyYWludHMuDQoNClRoYW5rcywgd2lsbCBkcm9w
IHRoZSBkZXNjcmlwdGlvbi4NCmNsb2NrczoNCiAgbWF4SXRlbXM6IDENCg0KPiANCj4gPiArDQo+
ID4gKyAgcmVzZXRzOg0KPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiArDQo+ID4gKyAgYnVzLWZy
ZXF1ZW5jeToNCj4gPiArICAgIG1pbmltdW06IDUwMA0KPiA+ICsgICAgbWF4aW11bTogNDAwMDAw
MA0KPiA+ICsgICAgZGVmYXVsdDogMTAwMDAwDQo+ID4gKyAgICBkZXNjcmlwdGlvbjogZnJlcXVl
bmN5IG9mIHRoZSBidXMgY2xvY2sgaW4gSHogZGVmYXVsdHMgdG8gMTAwIGtIeiB3aGVuDQo+IG5v
dA0KPiA+ICsgICAgICBzcGVjaWZpZWQNCj4gDQo+IERvbid0IHJlcGVhdCBjb25zdHJhaW50cyBp
biBmcmVlIGZvcm0gdGV4dC4NCg0KV2lsbCB1cGRhdGUNCmNsb2NrLWZyZXF1ZW5jeToNCiAgICBk
ZXNjcmlwdGlvbjogRGVzaXJlZCBJMkMgYnVzIGZyZXF1ZW5jeSBpbiBIeg0KICAgIGRlZmF1bHQ6
IDEwMDAwMA0KDQo+IA0KPiA+ICsNCj4gPiArcmVxdWlyZWQ6DQo+ID4gKyAgLSByZWcNCj4gPiAr
ICAtIGNvbXBhdGlibGUNCj4gDQo+IA0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YN
Cg==

