Return-Path: <openbmc+bounces-1221-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E95FD394F8
	for <lists+openbmc@lfdr.de>; Sun, 18 Jan 2026 13:39:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvCny4fz4z2yFW;
	Sun, 18 Jan 2026 23:39:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768739958;
	cv=pass; b=ogDwSnKjYDpwdCtQC+V4z+V+dnFJZ8IFsyKCHVmEn1hspZDewpiEBVUUqVEZ7ypQJOzjxvByPWfdnVZngop7R/fwo0lwFZhK+BPFWyExxAjsrdWCPhUjSJ1cD+yy4aCjQVKEGUPYb96yqWABK6pFJjsSUWkezEOoKoQjS9Pz/EMUKd+Ric51pzbUbyMDitFjOjAneJpDEzGm9zYp6s2azCJs81rq4troQS6geZxTHrIWAKz+QfeX5gyEb6b49P0jzjQji+dACxIXTea+w+Awz2XRK1w1UQ2cled9NYAQWvUdoxll+p64STqLU5y5Og10HzSZ0A4h0to52ExlxJIpDg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768739958; c=relaxed/relaxed;
	bh=qTSb7xI2loIiR9y00bf5djy27OgpYwM0bJYmXmXUqIs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FUsDkURmc29PRP/cNvIBFIU9eBMgbez6pn72Do/UUpsuMW9szKWjqbCAOavUAn+58zTVMx/2zCBouSLM70mISJH/C0O6Vc7NxKWAK/5blAbSktGVtWZitXDyVtJaohWHR4407jRPr1B0tcIfwuKEWiO7T3dmrfswle4j/PW7H2D6eqhW3IQ3vAMhOCvtSuKFAv2P+L1AX5vDzotAREkyj5859PIxc6ljOU/82ui+Jhl8lYAOy8jWNuqoaJijkGOhTIuQFA01PBk7IFYD2h95w9GcvEGuXgQpo7sxMz7EmqwZ3d6ifFigghCKLwy/tr5DnIKsigFGYa5UJBuk07MhwA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=OFua44bX; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=OFua44bX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvCns2F9Cz2xSZ;
	Sun, 18 Jan 2026 23:39:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a43xfWIfTSjwc9yxXy7x19Whu4zQRuINLym/Wou6CPc6U+SF7m7IaXFTRWR92hTmSdRVDXmNQgp5p2Zk0KzoGnk0VZYhuJ7w4KIpql6GS7/mvnAUTl9xplh+njzbjQQvOytkxIeJRqfP+6iGhfGzWh70NA+AZBksqGxGxCxunV5OXt0EOgskG+UTuBMuLwBwmkbWExb8qbeWxcawBMdXdv0z7rbRFZOvATX6tcuMizu2CqLkXSbkcXcBVv3TuiUExHVWD3klV6z49ZCEBsJAQzw5Eboj3uUCZiVvDivDI5osuYkoL4pcU6m+vs/r8upqguB0lgaCr2szlAM96x+ifg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTSb7xI2loIiR9y00bf5djy27OgpYwM0bJYmXmXUqIs=;
 b=KdzvKUb5vbtzC+Diq4yW3IZQHkhkWs1Vvk+4u5GxBzF97sqbsdGRJHaMlwMYjzgOBlps3JzTLrHS5O8WTEk98DMgHxO/8g37TNeWXHlSdOt29KiAf7oi4iMBvTmBX+FR18QZLGqNV8G0u1k8Kr2QoUAdUGReL/0TkMGLycUplHjHHRguO/rycOni1b9yD22oBuKez/YE9RQLw3CJqDYmna1MZo6UWhs38xUFvtymxOMzwOrSreKatMTss+Cjl5WgZ5tq55nPRQ3pKzgtmCFk304xPRHjXhYqHqoJpYM3PjEXSUDFjAZpqp/3o+DZobYwdGWIauVr+dF1Vm72eNjVLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTSb7xI2loIiR9y00bf5djy27OgpYwM0bJYmXmXUqIs=;
 b=OFua44bX6r3+1DSracTOMIGhkoYKFdHxFcR7pY6l1USmzc3hhvaKi5m5XufXReDbTpBUHweBiCCsFWasu2CPNST0ye/nMwfmK5t1Dt8y6A2NjgRcA+fcEbYgVvodXerRsEwzCybP/nYKdxiEpZg+qUTvoYkj+imJ2fefMI/ik9DOoGB5bvN9l33ThZgAf1yK+d2b8HkH/N8LKIYjMbX5+wsa5nnIgKh5i/o4Dwz49wFQwzwLZzTVNnrTb1oEb/PrvyctzdE/DJu1wHs2ux8EVYHS+czmqAveMh07mbFd6wZpFkRqKWP879PkwF7apEpFJfXjMq1O0kbXup7I73Df2w==
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com (2603:1096:400:1f9::9)
 by SEZPR06MB5365.apcprd06.prod.outlook.com (2603:1096:101:7d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Sun, 18 Jan
 2026 12:38:44 +0000
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::e25a:ec7b:633d:7489]) by TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::e25a:ec7b:633d:7489%3]) with mapi id 15.20.9520.009; Sun, 18 Jan 2026
 12:38:44 +0000
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
CC: "clg@kaod.org" <clg@kaod.org>, "broonie@kernel.org" <broonie@kernel.org>,
	"boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>, "joel@jms.id.au"
	<joel@jms.id.au>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-spi@vger.kernel.org"
	<linux-spi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>
Subject: RE: [PATCH v2 1/2] spi: spi-mem: Protect dirmap_create() with
 spi_mem_access_start/end
Thread-Topic: [PATCH v2 1/2] spi: spi-mem: Protect dirmap_create() with
 spi_mem_access_start/end
Thread-Index: AQHch7caU+B4ENmezUy9QJpIzL+wwLVXB7OAgADV5cA=
Date: Sun, 18 Jan 2026 12:38:43 +0000
Message-ID:
 <TYZPR06MB5203B67C187C52A47C0A29D5B28BA@TYZPR06MB5203.apcprd06.prod.outlook.com>
References: <20260117134216.595436-1-chin-ting_kuo@aspeedtech.com>
 <20260117134216.595436-2-chin-ting_kuo@aspeedtech.com>
 <ccb6b5b3-84cd-4197-a770-7e626c1ddcf3@molgen.mpg.de>
In-Reply-To: <ccb6b5b3-84cd-4197-a770-7e626c1ddcf3@molgen.mpg.de>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB5203:EE_|SEZPR06MB5365:EE_
x-ms-office365-filtering-correlation-id: 2b61cf88-2b11-4108-f68a-08de568e8462
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?NzRPeXhSVGhNazJNRU5CSWh5L0MvWUVVVTVOWGJudlczS1Y4UFRXMTh4bExZ?=
 =?utf-8?B?dk9oKzhyY2dwbzN0VTlkNkFTR2RQdWE2UEQ3RXA4ZDdmSEdseU1TY0QvVTkz?=
 =?utf-8?B?ak1jWVZiTTBDTWh6Z0tJQzFNYjZtNHRhbkRwRTV0bXVFOWtyUlVRenZJUS9a?=
 =?utf-8?B?dGVUVFpaMENPZG5BRm52aFdqdXNjOEF4YUMrR3A0a21Ya21sMVAxeHp4TDFj?=
 =?utf-8?B?dkgvZXJGSitBRDQzU1hyaVIxRkJoUjVFaVJxK0U4MGRvUHJmaERZbElaZWk4?=
 =?utf-8?B?N1pleXAxeVprbUZvblJzcm5JalJ6ME9GUUx1bjJjU1QxMUYzU3FXNjhzVWNn?=
 =?utf-8?B?Q0J1YzhiVGkxSktYSXNMcm1Md3ZDMllJaXB0Rzk5ZWczTEd6RVhEWEp2QU8w?=
 =?utf-8?B?cTJtOXIvY0Yvcm5uOUp5Q3FvR1YwV2Y0UDUrU3lkZHFRU3lPaU00NFcvMmRu?=
 =?utf-8?B?NjhCelREVDlHeDVudlFFTHhwT0RydGx5OCs3dE0zOVYyYzh4UGxFWFErNGNY?=
 =?utf-8?B?RVpKeHZqd3QxVituMnhnc3hWeGhmQjFkNm5GT1lCM1dtcm5oZzNIcm16Z3ZN?=
 =?utf-8?B?OWYrWVFEMEkwNUtlR3hocXcvSjBPL1hSYmFWWW1IbWpPdmRaLzZteGRySXhZ?=
 =?utf-8?B?bmc4M1ZBajJNdUI3Vk14bkFGakRiTkpZbDcyTndwcEh0WmYxcThYM1AzcHJD?=
 =?utf-8?B?UUxkNVpLUGFHQlQ4WUJIdVA5dncxcVdxUVpkZ2xXdmhrY3V3VnVvV3ZCOTM3?=
 =?utf-8?B?VGxnVWxGZkhRcW54ZzFlL0xTL1RIRGxLcElhK1ptMHcrSCtveDVuN3premFM?=
 =?utf-8?B?MjBoMFpRdlNBTHlVZ2RPVm5rQTVENDBpcEd5U0lGaDdobnFPTm1oK2VLNnNZ?=
 =?utf-8?B?cittNm80ejhpVFp0WlhJUFFtM3hzYmQ0ME9MNmc5MlI2azZjM1MvY3JXRkZF?=
 =?utf-8?B?WmFoYnduZmxOOUppRWZtWkFPbG5wVkh3bU5CVWsxK2lOQmhsMnFzbkIrS0I5?=
 =?utf-8?B?a1BVUnVKMkZOM2t6Smo5WEJOdFhua3JmTFBOdHpPMGs0VUljdzNwaWJDS1di?=
 =?utf-8?B?ZDZ0L2ptLzRDc1NBemZGakQ3SnVWZ3ZGbGVZTzdwQmhzYStyZGpzSlRhSS9o?=
 =?utf-8?B?cUk3K1ZqQkszUnVkVWhvbXhlbFVTMjFFTlRNZ2VQOXZsN3VmajhLNWQvdC9s?=
 =?utf-8?B?diswZ0tYQzg2MERCR1lmYkI3ZXR3R1pyMDV6aWhvR0h1R2NEMTVLYVdjT3BU?=
 =?utf-8?B?UjRuaENVdU04ZmdVU0RGM2h2L214WS9DcVM4ZnNjNWhhUVRMSTMvSVk1TURF?=
 =?utf-8?B?TDlGMC9yeVpqOEJ0SlkzWUtwZDhnUHA4ZzhNSVpBeVdTRnZZK201RzZMbEx3?=
 =?utf-8?B?dEc2VjkyVXc4NnR6MnlJa1pZVlRoN2txL0d3TkdMalVmaWV3UnY3aC9vd1Jp?=
 =?utf-8?B?ZXB2SkN5bnc4MlAyK0laUnVmQi94enFvWE8yQUZUdXA4eXNCMndUZktHeVl4?=
 =?utf-8?B?Sy8zd1JKUGhSTXR5WTN0ZUVwMnhvNFUrd3ZDeUFUQ1ZpNkxsZEV6MnVWTkY1?=
 =?utf-8?B?TC9RZHhGcHcwTHJTM0VhUkUyZHVtYXFzV2huTkY5Wmd1R2FSemFuNFpoTE9I?=
 =?utf-8?B?YUZmb0RSdzllL0U0UjMrMzNHUmd1K0gxWDl4SklzTkNRc1F6WkdVYTBiNk5B?=
 =?utf-8?B?S3pkQzhRRUdZQUpud2ZtdGRsMkhLVlQ0TWtPalJ1ZHNJL2ZFU1NmckV2cXR4?=
 =?utf-8?B?V2prVHg0ZzNSNEhvTUJrL0wrUkdRNzZYeDJGZDFWbnZJZUhEU2RxeTF0eW80?=
 =?utf-8?B?WWNWaWNBL01rNHdIWmoyZkZwYzEzVlBNcnQrQVNId3lEcVN1QWx3SlJOMmlS?=
 =?utf-8?B?Qkw5MWlrL1VKNXdmc0U3TWZHTENYOVFwMGhUY1hLSkU4TXQwZ3pTRlBEUHk3?=
 =?utf-8?B?Q2NzYzV6dWdaTHVFcHVPRC8wbDUyendaSmJpSDRQSzFVU0Q0VmNzV1pjV2M4?=
 =?utf-8?B?Q3VEY0RIenpNbTcxTFFEcUVHL0xLd0JQdzhoWmZVNXkxVnV5U3NIMkl1ZmxI?=
 =?utf-8?B?RVcwd3JGMkY2NDhEem5udVJDWnZXTzZzRmdLZFk5ZjRpQUlydklqL3A1T05V?=
 =?utf-8?B?UTFDSXJoMlBFNldiMFl4bjEzeG8zaWtMVWtwUmZnSHBLSEFvL1J4a00xSTVQ?=
 =?utf-8?Q?ikoqyK4ftkRg3PsodITiltU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5203.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WHlTZlcxZ0tlOWlXME02RTV5WE9Id29Kc1V0cnRFb3o2Z1JMc3JyUDRtN2Uy?=
 =?utf-8?B?T2ZBL0NBWkxPRUUvelc0UW42Q1ZnaFo5ZXF5ZVMzeStwNzRPbnhYaE1pUUpU?=
 =?utf-8?B?TmxURmtjTGlQUDlTdVpNSGF6MUhmcnQ5d21taGwwZmFibWhDK0F5cjhLVm5n?=
 =?utf-8?B?R2FLcXgxNVptWmN2L1lndGcxbDdYczFxSnB0Ym1LU2xDTmhIYVBlN0hvRjcv?=
 =?utf-8?B?M1huNGhCdk9RRlFLNkVER0N6VVdnRU9WVzhsWWV1WEZmR3JBenV6ODRxcFc5?=
 =?utf-8?B?eVdDV0l5VVRBaDFQZmt4RzVWUDBJZG5QTVYrVmV5cEU2R1hYYjJtV254dUZQ?=
 =?utf-8?B?aURwSnBWa0tCZmxjVkcrQ0lZcWsyN3p0dGhlYXNhemw5ZEd2cjhhSU0rRlB2?=
 =?utf-8?B?VnBsTC9qTzQ5c0N6dG8rWmdWN3lJTVh3NENxMG1OclZKY25SaHFQc3FoQnEr?=
 =?utf-8?B?VE9PejR3bFIvM0E3MzZNQVlCVk1Ib3M4dC9Tc2pkQ05jVzJEUE9pdnFVdXNs?=
 =?utf-8?B?YU9YK1k4V1NnQWFVQStVOThWQXFDRHV6L2FjTFRNZGVOVGtSdDVaOTcwRkhW?=
 =?utf-8?B?ZGYxb3pVNWFWR0tPQjhzQ2N1Z1JPQ1k2eVBYT0VPa29oWTNZRk56SFpFakVq?=
 =?utf-8?B?bDFLZWhuZXJSZmFzWjlHZHIvQlRXSEFvZ2IxWVFSTG1HN2lpd1dIY2V0L3BI?=
 =?utf-8?B?aFNzbG5yNnpCOWdheVRESkJROFp3ZzVGKzk4YjZiQ0ZUWWF2UFJUV3dTZCtr?=
 =?utf-8?B?Zlg2amtHczRPaWRrNDlXNngvRmJ2Zml4UzU5a25aMVNjT3FQL1VmOWoyWkhP?=
 =?utf-8?B?N2E4dy9qU29JUmo0c0NjQVRtc1RoRkVuK0RZZS8yVElsWXdqN3drVDhBNSs0?=
 =?utf-8?B?OHg5enpJSDBWek9EWWRBci9CN0c0ZEZLV0p3aWM4WU9KNDk3c3JTL3NRQThx?=
 =?utf-8?B?dVRpanB3MmVlU3FWOE1tUExxQkhwc3ptZUxaY0hiZGZUWmZvRTdxbXM5azQr?=
 =?utf-8?B?TllSMVFoY1paMjIyZDd1VTVrRVBEVERKbnJsNlo4aHZMcUkwWWE1bE5CYmxz?=
 =?utf-8?B?MVorN05QQ25NL2VoT0JUb1VBMFRleHd0eExUNC85NnlzMnM4aXhteEE0TjU2?=
 =?utf-8?B?cXp3VWpkaHB2ZWRSdElDckticmZVbWNKenBJeTRFR09xalJTOUdKM3lpdFZJ?=
 =?utf-8?B?TVJkcEJCQXlSYWdXWXYrem16N2lkQ2dHQVFLODMzS3ZrQ1l1aEhLWENLS0Er?=
 =?utf-8?B?SEswNGlUNnd4QmIrTURkZnpnS3h3UkRpaGJ5ck04MnhhUWFkYXlmTiswcGRX?=
 =?utf-8?B?UndYRVRteVdIaEYxZFl4aGx0cWQwMTZueU1qOWdxZTlZRC9IaHRJUWZTSkQ4?=
 =?utf-8?B?ZTVyaW1lSjlTWFlyWTJhRU9mUXB2Mld5KzFYRWJBSlVNZXpIa1VVWE5aYWFl?=
 =?utf-8?B?OUxvME15WkpibVIrbFY1S2ZlYUd1aVk0WERBNUd6U1l6bGxCL3dicnRRTlNN?=
 =?utf-8?B?N0FuZ2JzUDl3M20wdk9hZkZ6aHBaYU9wY1pxaVFIR1BXSFBhelNmYVJGeUNv?=
 =?utf-8?B?L0tPWWFzWHhaeklwemlZUkNoRGIzdTVnVFplVEd6MGRpKzZoMTFtUWdsTm91?=
 =?utf-8?B?di92enhqdHVBS1J0T00zM2hQWDYrNnB6RFFpejVjQytHMTVQald6RXA2R1dC?=
 =?utf-8?B?bUQ1RFNXQXB3MFN2ajdaVjE1b2xTdUhYbG0wSktTbmptaW5ZaDJXczRHdDBI?=
 =?utf-8?B?VnV0cjhlQ0xzY0lwenJwTWIrOTUxcXpPa256M2VuS3BpR1psbmdseURWU0xh?=
 =?utf-8?B?Z0lmNEhZa1lFUno5ZTVnS2VkMFl5c2trb25yS2h6T3o2dWI2VWhVdXgwemJk?=
 =?utf-8?B?VDZBY0VTVVVPOWJnbzBaV1VTekRVTUZoRmdtcFRoMTMyRlZnMmZhcmw2VUxi?=
 =?utf-8?B?dFRHalZkNTd0VGZxb0plY0J1bUV3WldySjRrVUFINEZCTFJLQnZFQ0JjNFMz?=
 =?utf-8?B?d3pJR2R3Y0orZVdCMGQ0eE84cktILzJFVnR4WUxnOHk2YnlRZ3IyY0hxVWdo?=
 =?utf-8?B?WEFwYjFEWnU3b2ZsVW1tZDhvU3d0aGdCNDROeDV5enIwUTJ2NndCRWlEK1Rj?=
 =?utf-8?B?RUcvdHVIbGJFdzJzZFU0L0REelY1aVA2RXlvTWJWVm5TQm0rVHd2UER6RTUx?=
 =?utf-8?B?di9sejhwR3ZIMUxkNTlSZW5sd0IydVAzbGdCNzlldmU2ano4R0QvRzhuWE5w?=
 =?utf-8?B?clFnWENidUQ3S2MzN2MrbnZ1RmsyeEJCTmcvSkxidFlBWC90WEZMenBGNDRh?=
 =?utf-8?B?cHdEVmVrLzdXampqdVZVYmJNbUIvNjdnL2s5MDJIRVZWRXIvOE03RjlVTlVW?=
 =?utf-8?Q?L8I/xwMmc13S8tx0=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5203.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b61cf88-2b11-4108-f68a-08de568e8462
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2026 12:38:43.8515
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lkeSbc37FaIJQWanpRza0wvxDj513/INMm9Wrf7vItXF1uqGePsZUgNdhg84NHsLhXAWSvwD2S0pOqDktmQ1GRKbPstoEqPalQm0AiPjmx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5365
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

SGkgUGF1bCwNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+IEZyb206IFBhdWwgTWVuemVsIDxwbWVuemVsQG1vbGdlbi5tcGcuZGU+DQo+
IFNlbnQ6IFN1bmRheSwgSmFudWFyeSAxOCwgMjAyNiA3OjQ3IEFNDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgMS8yXSBzcGk6IHNwaS1tZW06IFByb3RlY3QgZGlybWFwX2NyZWF0ZSgpIHdpdGgN
Cj4gc3BpX21lbV9hY2Nlc3Nfc3RhcnQvZW5kDQo+IA0KPiBEZWFyIENoaW4tVGluZywNCj4gDQo+
IA0KPiBUaGFuayB5b3UgZm9yIHlvdXIgcGF0Y2guDQo+IA0KPiBBbSAxNy4wMS4yNiB1bSAxNDo0
MiBzY2hyaWViIENoaW4tVGluZyBLdW86DQo+ID4gc3BpX21lbV9kaXJtYXBfY3JlYXRlKCkgbWF5
IHJlY29uZmlndXJlIGNvbnRyb2xsZXItd2lkZSBzZXR0aW5ncywNCj4gPiB3aGljaCBjYW4gaW50
ZXJmZXJlIHdpdGggY29uY3VycmVudCB0cmFuc2ZlcnMgdG8gb3RoZXIgZGV2aWNlcyBzaGFyaW5n
DQo+ID4gdGhlIHNhbWUgU1BJIGNvbnRyb2xsZXIgYnV0IHVzaW5nIGRpZmZlcmVudCBjaGlwIHNl
bGVjdHMuDQo+ID4NCj4gPiBXcmFwIHRoZSAtPmRpcm1hcF9jcmVhdGUoKSBjYWxsYmFjayB3aXRo
IHNwaV9tZW1fYWNjZXNzX3N0YXJ0KCkgYW5kDQo+ID4gc3BpX21lbV9hY2Nlc3NfZW5kKCkgdG8g
c2VyaWFsaXplIGFjY2VzcyBhbmQgcHJldmVudCBjcm9zcy1DUw0KPiA+IGludGVyZmVyZW5jZSBk
dXJpbmcgZGlybWFwIGNyZWF0aW9uLg0KPiANCj4gRG8geW91IGhhdmUgYSByZXByb2R1Y2VyIGZv
ciB0aGlzIGlzc3VlIHRvIHRlc3QgeW91ciBwYXRjaD8gSWYgeWVzLCBpdOKAmWQgYmUNCj4gZ3Jl
YXQsIGlmIHlvdSBkb2N1bWVudGVkIGl0Lg0KPiANCg0KWWVzLCBJIHZlcmlmaWVkIHRoaXMgd2l0
aCBhIHNjZW5hcmlvIHdoZXJlIGFuIFNQSSBUUE0gaXMgY29ubmVjdGVkIHRvIENTMCBvZiBhIFNQ
SSBjb250cm9sbGVyLCB3aGlsZSBhbiBTUEkgTk9SIGZsYXNoIGlzIGNvbm5lY3RlZCB0byBDUzEg
b2YgdGhlIHNhbWUgY29udHJvbGxlci4gSSB3aWxsIGFkZCB0aGlzIGRlc2NyaXB0aW9uIHRvIHRo
ZSBuZXh0IHBhdGNoIHZlcnNpb24uDQoNCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGluLVRpbmcgS3Vv
IDxjaGluLXRpbmdfa3VvQGFzcGVlZHRlY2guY29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy9z
cGkvc3BpLW1lbS5jIHwgMTEgKysrKysrKysrKy0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9zcGkvc3BpLW1lbS5jIGIvZHJpdmVycy9zcGkvc3BpLW1lbS5jIGluZGV4DQo+ID4gYzhiMmFk
ZDI2NDBlLi44NTcwMmE3N2IzYzggMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9zcGkvc3BpLW1l
bS5jDQo+ID4gKysrIGIvZHJpdmVycy9zcGkvc3BpLW1lbS5jDQo+ID4gQEAgLTcwOCw5ICs3MDgs
MTggQEAgc3BpX21lbV9kaXJtYXBfY3JlYXRlKHN0cnVjdCBzcGlfbWVtICptZW0sDQo+ID4NCj4g
PiAgIAlkZXNjLT5tZW0gPSBtZW07DQo+ID4gICAJZGVzYy0+aW5mbyA9ICppbmZvOw0KPiA+IC0J
aWYgKGN0bHItPm1lbV9vcHMgJiYgY3Rsci0+bWVtX29wcy0+ZGlybWFwX2NyZWF0ZSkNCj4gPiAr
CWlmIChjdGxyLT5tZW1fb3BzICYmIGN0bHItPm1lbV9vcHMtPmRpcm1hcF9jcmVhdGUpIHsNCj4g
PiArCQlyZXQgPSBzcGlfbWVtX2FjY2Vzc19zdGFydChtZW0pOw0KPiA+ICsJCWlmIChyZXQpIHsN
Cj4gPiArCQkJa2ZyZWUoZGVzYyk7DQo+ID4gKwkJCXJldHVybiBFUlJfUFRSKHJldCk7DQo+ID4g
KwkJfQ0KPiA+ICsNCj4gPiAgIAkJcmV0ID0gY3Rsci0+bWVtX29wcy0+ZGlybWFwX2NyZWF0ZShk
ZXNjKTsNCj4gPg0KPiA+ICsJCXNwaV9tZW1fYWNjZXNzX2VuZChtZW0pOw0KPiA+ICsJfQ0KPiA+
ICsNCj4gPiAgIAlpZiAocmV0KSB7DQo+ID4gICAJCWRlc2MtPm5vZGlybWFwID0gdHJ1ZTsNCj4g
PiAgIAkJaWYgKCFzcGlfbWVtX3N1cHBvcnRzX29wKGRlc2MtPm1lbSwgJmRlc2MtPmluZm8ub3Bf
dG1wbCkpDQo+IA0KPiBSZXZpZXdlZC1ieTogUGF1bCBNZW56ZWwgPHBtZW56ZWxAbW9sZ2VuLm1w
Zy5kZT4NCj4gDQo+IA0KPiBLaW5kIHJlZ2FyZHMsDQo+IA0KPiBQYXVsDQo=

