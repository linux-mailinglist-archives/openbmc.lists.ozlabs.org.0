Return-Path: <openbmc+bounces-261-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC09AE1016
	for <lists+openbmc@lfdr.de>; Fri, 20 Jun 2025 01:45:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNcfc4QvQz30LS;
	Fri, 20 Jun 2025 09:45:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750316291;
	cv=pass; b=ENIGe/KIjQx7U2W3iQ6YfsrI+wY1ymPigBUeYM4VOdAv8HGPgJLDlKVAV8J3bmW//vu6zHrIDvEuhuUCCFEha4C9s6CT00SoEbw4UeovJoA/vW3LoRQKFz2dxsmEyH8mGInZZEF4+iUtCaOSgO5HJE/BEA3cMXOgmZVUij/anvoqiRSt6doThSphCL6Rj/JFJx1hJOIsa1BAj+CcI/9c4jXDYRjwhRafFCG9iYX423zwXak5duTh8pRCFpZCRq7Bzp7CW/9NGJDshdGj3rC+J7JGIZbYFh/AlH762+qvV7vflLZviqz43tHOfrvwWI4mY5kyMaI0Zbac95rxtubCew==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750316291; c=relaxed/relaxed;
	bh=y5bpmBGEIFPsEHuQJNQNj83vwroiIGjzis1YIYsIhxk=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LG6uGuPB0zMZPvSCujleJyO0RQuKDhBXHHMrmpwTGvdZuWHqBJ2Q9s/a9AZDxtK+RZBrur/z4E2mMw4PpslA/Xq0djCeQEKlrvsIvWVgv/st4kxemVPK7FpYPNFd8BX6L/N4ii4Zw3YJd3VKtXY++aZzNYw1LiOJYUZPkNbM5KZ6CS3D3giB6BA8rqPeGzIaqgYaMLS0rPCXXN8Xp127I8gVB9LhIzmA7TFSzqwFW5JiIU95jo7uCbIxs7WxTNLaMqH1jNwLmRbYUladElLNQh/QAMDbWPv8QfkYiyX0lINbi5b0MHtJoukIOVOB7n6HmEvWCUIae4ZRgczVdHrRFg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=AxmNvKlZ; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=cool_lee@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=AxmNvKlZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=cool_lee@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNBJf66pWz2xS2;
	Thu, 19 Jun 2025 16:58:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bd4A/Dem8+rB+GZlLc5PgRa2VrjpmRKRyHGzqlmOnbX1uXZZZHL0UITwxqANLepe1wnpAmu190xxWJoLOa4vz9bVjWzUSr/w0OX9ErGWpe38rRiEPjEMiYQNcgI6sl6S+w9g+RozIf6srhuJnDYuzIlWe1kcru9jpERtwacNsBAGVp+Tn8ZdFjMS58IIeyjuPxpFGFheTujyCtLSZRR4gXLYp98lCxBBqFJ5A7bpMktMp8l6WTZ6nsr9IlpXO2BYQ3ne/C5zItD7I4TFY03rKtYpormxos4Kne3tu2LGMAVNS6EPGgVEcS0EdxVTf54UyV4SHr8kkL3EqJmmiOpysA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y5bpmBGEIFPsEHuQJNQNj83vwroiIGjzis1YIYsIhxk=;
 b=h8cvLmF4w71gJPBf8SLDI3pZUDxae3n1e2iavI1UUFyft2BI6N1ELpfswZNWpadQW9UgB+5P/qy4zBmiQPD2v/YAseeQ8H80VDgAAL/06TkZkSFprtRaBJxxPdgO4Jzjr9WH6QIMqFtkSbPEF2r4ZTUtXLqI6Wrj04vxJusHZM6Lal8KzR5G4Ac9PEa8eppNNiAxr8goKN8HUPsesxRL6dMnla05KdS5Ql14arpePYKRs5uYYp6wPqBlUnh/OUQDW87U8D63Mk9CVJm5BuE+wKE11Ds2fX8hN3ivZOqoeAzLSHa1W3y5jxSPpPWMSSIegfiuLkMMuyXkWNKQzfZcRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y5bpmBGEIFPsEHuQJNQNj83vwroiIGjzis1YIYsIhxk=;
 b=AxmNvKlZn3GUlKeS4e/pPom9sbDyrHaBAc82W78wyueiZI0F1Va3v2qnGJKtXQrknEshVOu9fYUjpiNXZ/HWV0WEyotgPu3p47f0ZZRW/XaXicuhjQjT+hn/LW99TQA6qpJkC+JDMho9qyutKChDzMoRxBdI3KXw1lGhf2dlDMgUxvVVGGAgtuaKMIe5rlzxIy3JZlJa0PnW/dwUy7nnLoonjbEyO9vb3lAZftsARirkeGs5YVLCWsIYuln8Jjh1j4KSOkUNboAcuVjDmzmbJ/X0siiHaD0orsXaO4uU2c9omCELpjhoGgB/AOumso2ak5gfGGRUdQ2+V7NeRZ/cHw==
Received: from TYSPR06MB7068.apcprd06.prod.outlook.com (2603:1096:400:466::8)
 by SEZPR06MB6303.apcprd06.prod.outlook.com (2603:1096:101:129::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Thu, 19 Jun
 2025 06:57:46 +0000
Received: from TYSPR06MB7068.apcprd06.prod.outlook.com
 ([fe80::e1c7:8707:7d43:bbed]) by TYSPR06MB7068.apcprd06.prod.outlook.com
 ([fe80::e1c7:8707:7d43:bbed%4]) with mapi id 15.20.8835.026; Thu, 19 Jun 2025
 06:57:46 +0000
From: Cool Lee <cool_lee@aspeedtech.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, "adrian.hunter@intel.com"
	<adrian.hunter@intel.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>
Subject: RE: [PATCH 3/8] mmc: sdhci-of-aspeed: Patch HOST_CONTROL2 register
 missing after top reset
Thread-Topic: [PATCH 3/8] mmc: sdhci-of-aspeed: Patch HOST_CONTROL2 register
 missing after top reset
Thread-Index: AQHb3/lJBPtCuugbIEiiqOWbxb38iLQKDthg
Date: Thu, 19 Jun 2025 06:57:45 +0000
Message-ID:
 <TYSPR06MB7068B3BC5D9D6FA9154A3BB6957DA@TYSPR06MB7068.apcprd06.prod.outlook.com>
References: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
	 <20250615035803.3752235-4-cool_lee@aspeedtech.com>
 <100bed083e9a98432888c0b1db8cbc445f96cd64.camel@codeconstruct.com.au>
In-Reply-To:
 <100bed083e9a98432888c0b1db8cbc445f96cd64.camel@codeconstruct.com.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYSPR06MB7068:EE_|SEZPR06MB6303:EE_
x-ms-office365-filtering-correlation-id: 0247710a-cf90-4621-3f11-08ddaefe9884
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?eGc1aE9ST0FHNTVEM2toNHNuRVRHQWdsck90LzA1dityU1JvVEJkdGU1RzJY?=
 =?utf-8?B?ckxZbXFYd3QyTzlSWVRrMW9nRWJpUmIxMno1dFdrSFRRNWRRRkVqMWg4d2ZD?=
 =?utf-8?B?eEF0VDRQZTRqYnB6WUd5emtYbTBxOVh1MCtJV0NmeExZd1BoU2srd1lDNjNL?=
 =?utf-8?B?QXE1UHd6TVpDcklvcGJnUzdLTVR3Y0RmUThIQnZkVWJ2c1l5ZTVNS3BjYjBx?=
 =?utf-8?B?bUdQODZpQUpaSE5UUWdKVUNsYmpzQ2luQmxJRkh0SysyZi9ybVRqdjg2MTR6?=
 =?utf-8?B?WnlxQjBBMVBlL3VaWjN4M01iL2ZZVXdrZ3VzZjkvVVdBc2kzZHJMVWVWY2d3?=
 =?utf-8?B?c1BpemloRmhJZDUxaE1XeGUrdXhUQ0t2M29sVXppMXdQdTJ0QTlWTS9xS1N6?=
 =?utf-8?B?cmlCbEFBQWJhRnZ1cnI3MXpRdkNncnMydVRkS3U0bjFQa1IvYkJzT1BwTXFs?=
 =?utf-8?B?WDlCbXpJS2dXa3NJR0dTcTNvWmdqZ0JQdllXT25mQk1SaDVoNkQ1TTNXNUVC?=
 =?utf-8?B?c2xmZGE4YjdxaWg4RlQ4TlBNZkFTYll6bi9BL2U5V0FkQnluenRsYjFOam5D?=
 =?utf-8?B?VzBkZUlJRUp6bGdKWXRURlN5Z2RFUExiNEpmVHdLMVV4alo1MklRd08zNHp3?=
 =?utf-8?B?VzVrVDlEM2hRTEJVZUR5RTZLQy83UkFuc2p5UDBkalo0WU9TV0h6anh5MVFj?=
 =?utf-8?B?cUk1Z21WalBzYzNuQjdvZXp1QS81aEdVU01mVTJrUlZhMDh3NVpwTzBoNGVy?=
 =?utf-8?B?WWV6dUZ2ZTR2dm01aThCOTJwWllDQnRzMlZEZHUzRUp1VW5oeVA0UlVqazhl?=
 =?utf-8?B?R3U5ZXBXK3oyUlRMcWxETXBEYUIxZTdVa0xjdlNmeVhmZVVmNVhTbnZ5R09L?=
 =?utf-8?B?ZUIrRjNudzhRcHRxaUJjU1lid3dYam9IKzNyeXVodUZUa0RHbDJFbFpuMVhI?=
 =?utf-8?B?THdFM2JPRXJtaUkzVnI5K2RPRW5TV3Q0dkpGbjBEZ0RpRHM3SXpVb00xSWts?=
 =?utf-8?B?bnp3U3ZROHBTRENwVFJzdy9nTzF6bSt3YVNlVXNvV1JXM3k0eE9VeXlwS1hZ?=
 =?utf-8?B?SmVYQ0IvOGhZTC8xQWJERGJmSzFrZXlhaHIrR3liT0k2WVNCcW9Ed3ZjenBI?=
 =?utf-8?B?cGhydDBuMFBRMlEyUnhSVDJxUCtYNG9KZGxNSFVCTUc4K2RETlc1VjZvS2J0?=
 =?utf-8?B?YUF6QWpiQUZMUHovbWNCSGJXWEI4UHkveHZwZUt6MmZrQmNGUDYxRmNuZTBv?=
 =?utf-8?B?R0xOZmNUdE9Ub1JROHRxNjduVVJCQWR1eW1PbVhCaUdFazVzdFBDQW5XamZB?=
 =?utf-8?B?bDZ0NHdhaDZBbFhSUUZMZk84WHJFdHNTKzZ6N3kyQ2I1K3VpNTdXZXNhR0NK?=
 =?utf-8?B?VmxtemhzaW5oMGtHbEVXdEwrSFE4cUJwSXgwYXNMWVZJak5WcXNMZitPYnp0?=
 =?utf-8?B?VGlsU3lzdnZSWmFsalI5N01uZDFmeGNXV3JkTjZjUTNTN3lBenpKY01IZ1pl?=
 =?utf-8?B?SDc2MmxPWllaaFZxRThrOWhqZnJnNXVaTEhtNllqRktKVmR4UjZTWWIzSFhH?=
 =?utf-8?B?b0l5YWNGK0lNc0haeUQ1SHFwckJFa0RYWVU5TTd4ZXAwZmFvTEl6c1l6ZHZT?=
 =?utf-8?B?UkhENkdqZU1GTkRUN0ZkT2RtTVJSY0h2Y2ZFYlE0SDBsSmFqWXF3dG1oZnRk?=
 =?utf-8?B?dmpEYzRpQlR1Z2R4K1hVS2cyR051NWNDSzVoMndVOEptY3pwQTR2elcrVGVq?=
 =?utf-8?B?Tk1DMDA1OVUxaFNseU0wdDlPT3pkUXR1OHRWMWVKSWZKanN5RUc3YWs0VzRp?=
 =?utf-8?B?OWpYaVBia0JuRlJ0WXpWd1JNLzVOK0ovajl5ZWFkVEhMd280ZVgwWVYyazVi?=
 =?utf-8?B?RmRTSURySDFrNVlFMzk1ZDM2Tm9raFFrd2xnUXRJVUpKYnl5UHlLSmZpT25Q?=
 =?utf-8?B?SHlYNkZTK3M4eEVWYlJURklZV2ZFcStEaVdFZ3ZwWE1rdVRyRHhhazBxc2Vm?=
 =?utf-8?Q?jEgpp5T5GxGUxzWts2y/N257OSXqRE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR06MB7068.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dUtIMWlxOUVranhRSGI3aXNGMmJZc1Vtdk5oeThnRmw4VEY0bE4wQXF2SEhF?=
 =?utf-8?B?bnRZT3htditrdlByakplb0pOYjBZRmhGM1BmbFlTZXA5Z2daM0FjcER5REs0?=
 =?utf-8?B?azNYcFB4MWVSNk5MVjRPK1Q3STdXdGlPTXlUR2d0NzlUblcvbk1qUGN6L3VL?=
 =?utf-8?B?TmlJZGdlZnBkeUJXSzFjWUd0RlZXZlhSbC9ENnJaQmoweC9hcU9OMG9qdmwr?=
 =?utf-8?B?b3U5Rk4yUnVnQUxaZ1VSVi8zem9vazNpay9wV2djaVA0cjRncEo2NlNDT2ZD?=
 =?utf-8?B?TGtMWVBhZFpoTElXRlhrblhTUHRrZlkrbHMrSHlHajF4VVl5YTRtcm50NHZz?=
 =?utf-8?B?U3JweVIxMjJvOWhvS1BTOHM3QWRrQlg1TElWTE5aYloxcEh5aldiVytwVjVN?=
 =?utf-8?B?TjIzQThrQUxpb1UrbENBUjBTRzlpeFV0VklMYm5lTEd3RWZJSEdFaDBZMHBP?=
 =?utf-8?B?UkxubnVMYU8rQ1lQTk4ybm5LOGZ5ZlBjSFc5NUVtelBCOVYzY2owM012M1Jh?=
 =?utf-8?B?cTZJVXp3NVNwcUtrN1BwM2JaZThYS2ovbSswUC8yUHEwMnRyZmsrMzJQYWY0?=
 =?utf-8?B?MFk0OHZUR0srU1NMWFNCdkhUNThWSGNEamZTT1hDdUFDRjhmVE9GcElkakdr?=
 =?utf-8?B?TDFqTS9QY1NsQmcxZFhTdnNTYUNxTGtad3lzSVVrdCt5ZStkbFYwV3RZQ0du?=
 =?utf-8?B?QmRrdDFHSisySkZ1NldmcDhQeVZCSkdMOUczbXZHV2ZWZkY3Rkd4MklCMDdn?=
 =?utf-8?B?VHRCK0I1cWZyWloyK1pMSlUxcHhLVENnOG1zSHgvbmFBWTlLdm50dWhmUGxo?=
 =?utf-8?B?amEvQXJpeEZuekxTZGcyd2l5bjdVbnlaUXN4VGorTkFsOFh6SkYrbmRGb1VL?=
 =?utf-8?B?VHJDbFIwWWFGaklNRDNjb0JaQ3RyM2ZRaWlFT3R4cldaZVl4ZFFyY1ZZMmZT?=
 =?utf-8?B?UXdlaWRoOEFyNXRiazB1UWJKT1kvdHpSRm9RS3JwSFlZcG9DRVI3UGFnQ3Vh?=
 =?utf-8?B?TDZHb01WN1F6d01zQXBoRlJub2dyaldPVStxQy9keXc5SHZvRjl1cEtETFlZ?=
 =?utf-8?B?YjQ3SVRNdW0wYWxSaHNnVHk3VHRXbEVuKzB3L1J3b3VYcHorK052QWt3bUZQ?=
 =?utf-8?B?ZjRXenFVemNrckk4cG5nbDQ4QXg3dTI2Ym5oYTVKU2tocW1SZ1h5MDFxWjlH?=
 =?utf-8?B?clF0dzJGdUNkSnpLUS9ObzZNWkFvcW5nRno5ZG84TTRlUmI0SGYwUDg3VjNU?=
 =?utf-8?B?V0F4YlMxYnRqakIwb2ZKbjdpWFlGaW5XYUxEVC84ZkZXR3RzQTZZM1lTNHgw?=
 =?utf-8?B?bXN4L05DSjBuV044aGQ0TCs3WlRiM2FuMkVIamFDMXFRWVJwZjZzSWRiL2R0?=
 =?utf-8?B?QmlyQ2NSTDJza2FJOVBsYXJNK2RpVFBoSEZIeWZkeFFOZ1AyQUFYZU1La3hQ?=
 =?utf-8?B?dU1WUStIQTcrbWVOYkZkejdmbm80MzNaR21VM016V05lK2JxZEpwMmZ3N2l2?=
 =?utf-8?B?dXA4MWZNanFZVHNKeTlNUld2M0RJYjR5bVI5eHRpV0hkcWRZZURJOU9STy9U?=
 =?utf-8?B?bDZmelQydGU1anphbTUzeGFhS21Ja05ZdWFveE5pSEJ6OXdacmNNY1NoUXRm?=
 =?utf-8?B?ZVlyWHJ1TGNjN1d4U2lDRWduN3ovb3NlMDFIQmEvZ1ZMZ2Y3eDNaVlNoVjMy?=
 =?utf-8?B?RlE0aERWMU8xS3U2VWtUSVRWeE5xaENOaFM4QWJWN0ZYamlrVGphT2h6U25a?=
 =?utf-8?B?cjhwQ3VwLzRyb1JvWTVqK28zd2x2R2lqemRNbUhLWFFxMGVoTGdlSjBKb3lp?=
 =?utf-8?B?RTgzOU0xWFk0TkxUZGJydzNhSmJ1UHFmWkV4aEdYdll4UXh0WFlTczV1cFll?=
 =?utf-8?B?aWd6bS9qaWtiQ2U0VE9NOUFYbHdiYURBUDVISHM1a2VGdS9Ha2RsVlpQckRS?=
 =?utf-8?B?MVlLSzVQbTRRNU94ZEovMkxLc2FGQVpsRVFIQWJQR0Ixc2JxYkx4VTB4NkU0?=
 =?utf-8?B?ZnFJNXpZbWtrZ1FTWEpNOVdjbzU3cFM0aUZtdXU4WnVkd2pWUTVycm43bUdD?=
 =?utf-8?B?dVU2QnJEc2NlSGpiS0oxcU5KWXR3dCtza04xUmhubVlHMjZHUWV2dllKZkE5?=
 =?utf-8?Q?8EvZMHDvCOB6i6dDzF87covZC?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYSPR06MB7068.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0247710a-cf90-4621-3f11-08ddaefe9884
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 06:57:46.0099
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EDE95ehxypsF9RC79lgaWeR2rtBK/doq5+ZuhvcQ3R81XyjxT+9Tbee0pMOc4DY0zoSeEgtsQ3Ulv3+s96eaaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6303
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

DQo+ID4gSE9TVF9DT05UUk9MMiByZWdpc3RlciB3aWxsIGJlIGNsZWFyZWQgYWZ0ZXIgdG9wIHJl
c2V0LCBpdCBuZWVkcyB0byBiZQ0KPiA+IHNhdmVkL3Jlc290cmVkIHdoaWxlIHJlc2V0Lg0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogQ29vbCBMZWUgPGNvb2xfbGVlQGFzcGVlZHRlY2guY29tPg0K
PiANCj4gUGxlYXNlIHNxdWFzaCB0aGlzIGludG8gdGhlIGZpcnN0IHBhdGNoLg0KT2ssIEkgd2ls
bCBkbyB0aGlzLg0KDQo+IA0KPiBBbmRyZXcNCg0K

