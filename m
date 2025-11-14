Return-Path: <openbmc+bounces-892-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EEFC5B7EF
	for <lists+openbmc@lfdr.de>; Fri, 14 Nov 2025 07:18:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d76QX4DCgz2yw7;
	Fri, 14 Nov 2025 17:18:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c40f::6" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763101108;
	cv=pass; b=CZESaSw1ip/zOM6Swrj4xwPItpqzjDF6Mwds0Cq8hbscZ9+wy2gNL0IAPUrTDRaoRdXDkdkdc5BReShjmidhivFuQGgjq95+5ehDxe0beojzNGkqg7ytnApN8ZXsMJCQ85/2MqA/0/nHONiiKrdVjAuSyuvj5b0RUwkyjpHeRygToYYu0aCv787guF6wcbI0ciwZHn7Md9p2o/hf6Z9HfQVgki1lH1SU9U4N3TxQ1Xq7vcdrwmN56hQAwO8Lyb82KReHvw3sOCx5kEDA6fVHBcCHr8qKcq9D2kKRjxTFMz5xgSsdn1S7gX27lw14FK+1r3EjxT2e/Ni8PoohpqmjjQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763101108; c=relaxed/relaxed;
	bh=wpwsxrxRHboddxyI7P35xeq/O0JfaeF1EMdMQAn4ZYs=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Us4cMj05cTbfDYU/6hRITY7Sqigfs8KLDGfCid21sfzLa2zVK/95yu6Px7It1dFHJHwrfUd7P4UrTfquYreiFMvxGq1LbB2563yfwH3kaTQGLpMO86Qi/Tu37n++9LS2t1n6YUBm3y+bS55s8e8ZeiKkX9JSC417O2Lo00f1CdurL+wKOH8rgVHCe1nzsFyKGkUu+kZuod/rj45kalLpHhx9hOmiXpQW2syAQIego39rbuHRT2UiMmCeDg5q5yx5lVBPHCMjOhZDDzOmimPmO8yUVN2DkfeqA5Dc4QA44iFtvLef9Gt5Ez20En+vbdtol7BQo+wpDm4UTtstW0Tjug==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=DDT9Bn+m; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c40f::6; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=DDT9Bn+m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c40f::6; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazlp170130006.outbound.protection.outlook.com [IPv6:2a01:111:f403:c40f::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d76QV5pPTz2yvN;
	Fri, 14 Nov 2025 17:18:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bb16k1E177nLcbItxLC1z3no2CCeQcG5XrQPuEP/PrWuqHxO8ki2YNI647Jm81U9inDWde7fRl2e7aLKX0XvmEDGbF7znSFK7P7BEEkPWNCYYBnea4W2xWBttqnJZJ9+YbrFHiC1tIBKh8GjLOH04bfbqQpJta6ENp4A3PaNE5SPpgCPjZUI975sv63KfrKp8ulYePvqyirJuj2mFukiMWvNAO+9RFhooqMaMzCnOBnbtWF31s13Qkv3fL5+hYrfFRQb9VXxNOgx7B6ianbjsAgE71BuEOJtXdznFCpeaaq9DB6+I1d4Vji1p5fVIMJ1i3CueAMzsTXQAIzO6N9ZJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wpwsxrxRHboddxyI7P35xeq/O0JfaeF1EMdMQAn4ZYs=;
 b=QHXDpVzPZnBde+VN8PmJW9O5Bau32hE5FVmoNXBOdqtM+2hd3vUD6LewOJ8mkjfOhqoowM3gESKThFS2dAqyuTF54MmGLClAcIziuPx8zya5gvTe5SIWeW4UTk5hFRix18dUsRMAOAyTL7uZ8sx72nYJL5oGWFVeI1owDHI46j9MgBNaCP0Cj2c4OYD69EewQgLApZuM+1kAzdonWYnYq/ELl591CtjF3kmNZPvc5SCDtPGkJRxy4A9LNwWAqJPVU+xCmROswS8iR900EkE444dKZTyb3+V2oYtxlzgSncVnYUo6+ov3xBWt5w7oDlvQBsnrqaOwl2wwpS6geJEqGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wpwsxrxRHboddxyI7P35xeq/O0JfaeF1EMdMQAn4ZYs=;
 b=DDT9Bn+m88kLfd4ahqFIKPL1RU7Tckc+H9mk+cnh2hKcPwYiJ7zPISy+hwQ6Wc/pIsAGjGZupz939LzzCGJ9fwuD2QpPsPTWOYz+SFXQqCxLIXbRMJJF4n7Aw3dCP9WHhCxCtVG1rMKENDQCc3lDUijQF+nDEMt44T2YXjepSOzkAfjTe7OS1SsDeiXx7i5MuOu7aCPI95YQJVOqHVqzA2RxLkwYSEVykAU6LbR+dZddVMHaUxdOuAHTy667VlDXjr9hoLcerxz4gecoktOLH0l2GsYSSjG0Mj85r9+s4BiUNiJ8LxnDILnlYLa/5oaeBg1fhpEtOr4n44ZcVLcc0A==
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com (2603:1096:408::791)
 by SEZPR06MB6422.apcprd06.prod.outlook.com (2603:1096:101:185::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Fri, 14 Nov
 2025 06:17:57 +0000
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80]) by TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80%7]) with mapi id 15.20.9298.015; Fri, 14 Nov 2025
 06:17:56 +0000
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
Thread-Index:
 AQHcQisKZrgNdIKVU0mDlJSyYndfALTQ+A6AgAfdvQCAACofAIAT7eJAgAOJTnCAABhjAIABSC2g
Date: Fri, 14 Nov 2025 06:17:56 +0000
Message-ID:
 <TY2PPF5CB9A1BE6C0ACB11FE9BB209B9273F2CAA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20251021013548.2375190-1-ryan_chen@aspeedtech.com>
 <20251021013548.2375190-2-ryan_chen@aspeedtech.com>
 <0b76f196-f642-4991-ad5c-717c23938421@kernel.org>
 <TY2PPF5CB9A1BE6597ECD46BD4CB7C5F09FF2FAA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <3c3287f6-1c5c-4c4d-9349-32665a5e1585@kernel.org>
 <TY2PPF5CB9A1BE6FE06477B9CC51B8133DAF2CFA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <TY2PPF5CB9A1BE67DBBC08424DD062549BDF2CDA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <28fa635b-f9a6-41c3-8199-9630ed3e7649@kernel.org>
In-Reply-To: <28fa635b-f9a6-41c3-8199-9630ed3e7649@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PPF5CB9A1BE6:EE_|SEZPR06MB6422:EE_
x-ms-office365-filtering-correlation-id: bdbd9b53-ef91-4c82-d2fc-08de23458d8c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?dm1PaUFTN3QyVXpHQzBrWmtsMGNBRGd3TjJhd1JDSnFTRWVyYlNBOHJybnZM?=
 =?utf-8?B?YmczY2U2YUcydm9DbzNJNzdoaElnM0F6QWNOUkwwR1Rrb1FlVlE0d1Zyd1Jz?=
 =?utf-8?B?RWFXeHlkRXduZTBhQkZJR2ZPYmZaZVFab0pucStYV2lIOVVzVVhiU3pnUFJK?=
 =?utf-8?B?eFEyYWk5OCtNNjN4WnRybGpwYWtMM3V3ZWdUS1hDdDI4VThiNEtIbWtPdks0?=
 =?utf-8?B?NWFiMElPWGNrYzhBem5MOTh4MmpCNkcyK3dZbjZIYXhjUnI2NEVSYVVKbGg0?=
 =?utf-8?B?RFdmYWpOSExhc2czdDZNUzRSck9qcEszdlE4U3RXZU9zeFBHdGRKdjQ4VjND?=
 =?utf-8?B?djM5Y0ZIalJWZE1VZmROTjhjMEFWMzdBTVppU2JSay9pbWkyZStjcWpMR2t4?=
 =?utf-8?B?Sm9RL3doQzB6Unh2bVhDbHVmWnh1MFVNN05rd05rLytuVytrUys5U1E3NUhF?=
 =?utf-8?B?a0J5RE9sMUMxR1k3dHkrYmNQalVSMW1HT2tvNEJHak81enZGeEJFTUVhaVVL?=
 =?utf-8?B?RVlZN0NYclNLS2FVOFVmTzJCSDVEQmdDdmYzWDNRdGpoeUtvcEpYdTJHdHpZ?=
 =?utf-8?B?VlpQZ3A3QVJkQmxVOGgvZG40b25Qb0ZrOTdEUG9NTmRHMzZDV1ArUitLNW1n?=
 =?utf-8?B?NXBieG5OeWdTb1hCMFdMcnBySjJ1dDNDdmVxamE0TXV3eTY5dGlMN1BpV0JZ?=
 =?utf-8?B?bkx1b0F5U3hRUUFCakdmTEVJMUxPZkFKZEl1Q3JHYS9ESHI0RDU2eWRHNENw?=
 =?utf-8?B?dml3UVFIN1FwOGtrWnJGUEJBWGZab0F6T0VRRDJFNC9sMTFYZnpWRHFZbk9n?=
 =?utf-8?B?RTAzS0JvaUt1YS8wY2RvN0lwbmdUTmJEYUNVMGpPNlZtTHVTYzJSM2xzYzlm?=
 =?utf-8?B?UStYQXdZRTlSaTkvb0ZXdVRlWkw3RThJYnpTSjNuMmpRZDVxeUdaRExDeUlT?=
 =?utf-8?B?d2hIaFZUa3NVWm55WXdzUDFaMGFlR0FqbzFOTGwrdCtJNTJlL2trMjRNOXI3?=
 =?utf-8?B?dzJMcWFtNCtaZWN0emhmYUxHZkRTQVpZejdYSEZETWw2bG96YUpSSFhQanpi?=
 =?utf-8?B?ajhFWTRZUFhpMGs0R0dHa1NpanliOFdpY0RQd2tFbVI2U0NJcm9la2loUGxR?=
 =?utf-8?B?WmQzWkVTQm0zODAzL2h5cVE2TG9QM1VUNTZnaHJBMEc3RlpYVVdWZHFaZTU0?=
 =?utf-8?B?UklhWTdVYVBTYVdubjN5NHNrM1JsL2Z0REFzNE1KVzQ3VkY1L2ZUeG11TVpS?=
 =?utf-8?B?dGNTRytVcGJ5Mkp4aXdGcXZ4RDBCQlJ0SVJBWG9CdUFJeXVyQXlXRXBwNFpx?=
 =?utf-8?B?LzRjN25hSExqYjY1STJ1K2Jpd09jR253Q21lMTJ1a3RaMVdLSzEzV3A2b2dD?=
 =?utf-8?B?RVhQR25QTVVrOERKRmsvNUZ5azV4RmZtMUhLTGRqV1JWc2IxUUduZ0Q0aEZ5?=
 =?utf-8?B?ZGJsYU1xdFM1bTB6M3l2ZVpOU2RIV0FXclB5T0E2YkNsZW4zcEZJcXZSdEtF?=
 =?utf-8?B?cUlKTWhGVUJZVGRNTm1ZYzRDUWVyVkZ3TDhkNzB4WjF2dXdjVU1PQWEwNkdy?=
 =?utf-8?B?bTcrdWpTMUgzNCtTMU1VYlR4Z2hLVnQ0N2NtQ0RQeVN1YklvMTlLdDczbDJt?=
 =?utf-8?B?MStpT0grMkJjeENyUTlZM0xlZW1sc0xHMWF3Z2k2enppMTc2bkRlb2l2Y0d0?=
 =?utf-8?B?d0VuUm1uMVNHUzZKRVhiVmlwOFUzMVpLcmJ5azNJS29FRWUvZEJ1WVVRQTcw?=
 =?utf-8?B?Q1l2K3JMVzlNNXh1VzBTQ3dnenM4Q2xoa3kvL2hHcEVGR2loWHFWOHR1Tzcv?=
 =?utf-8?B?NzhHVDJibTdrUTRKQUtGb3g0YUI0eGkrcDN0aDI1VnJ3MmVyTHJKaTU3Ymdp?=
 =?utf-8?B?SitxSUpRYTNRTWVvWGVsTUZlZUNscG5GMlF1b1N4VURrbWdrMHV4YmZVQ3kz?=
 =?utf-8?B?NDhsTW4yN1RXb0FJbDRjSTM5d1h6VHY1azU1ZzdmNDVIV1pjZVArZVc4N3dZ?=
 =?utf-8?B?TEo4WkhuYmo5ZU8wT3RYMVlkQTJSZTVmT000V3FBWHdBNVUrVE12QVpLRWUr?=
 =?utf-8?B?WDZabTZiNXRoaEJMa3E4S1V5WnhrOGg4VlZpdz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TEdQUW9nYXdFT0hicHd6RzQyNGVYREVQVFZFQUNIVUZLaml3VTc0bDVuOGww?=
 =?utf-8?B?Z0RheE4zbTh6QVBuMmt4Y1NiTjJTWnJiTmJ3RlNOOFp4TDBzTlJyaWpzVUta?=
 =?utf-8?B?cTNSWTNFTWxuZFQvanA2V0xLR0prclFEYWlhQWZTSWFlUGxSckMzOEszdVIw?=
 =?utf-8?B?NEZMak02ZldabnJUWFJPWm9QZDlBTENqNmZQOUpUUit1am92eVhsUG5GcWQx?=
 =?utf-8?B?c1RqSTBnSHdPeXZFcWppSFAvUzhXNWRLc0o0SGJOdVYwTXNkbCtrTHQyV3Z3?=
 =?utf-8?B?QkZjL002VjBQVWtSd2h4UWUxNnI1MU9DS0w0WlZYNlhkWFZCZVBJTTR3UnFN?=
 =?utf-8?B?dDNVMFBadG5JcTljQVNqYUUvUTM5REgzVVpPemVpUmpna3lWWVF1ak5iMGJz?=
 =?utf-8?B?RjZ0V09iQUNUTWRjKzhTUkdxMW5FU0pMa3BZMG9lbXNaUXYyclB3bGZwRzdk?=
 =?utf-8?B?aE52V0tGL1hnYk5CWGJyVUZZMWhraTF3WnAwbHUwRjR2NUFadXJyRW82Mzcy?=
 =?utf-8?B?c21RaGR0d2loQXpva2tSZXJUMzJtcVdFSnRSODFkejM5MzJCcCtubkdaaGI0?=
 =?utf-8?B?ekJqSFN0Z3BDajZCZ0t2V2o4S21IL1crL1VzbXk4bzNNTzE3WnBhVElpTHhZ?=
 =?utf-8?B?TlFUZ3RoYlBKZUlkNjRPNmpveW5XMy9yNlltVVo0cy9JNGlvY3N0MVltN2pa?=
 =?utf-8?B?Mi9NQWVNT3NlTk44SnNzb0VLbmlLSG1JZ3ZWdVVhOXAyZkppZEo2OFBlNU9M?=
 =?utf-8?B?MzQxTHJBbEQzNERSeEluRnFKc2JxWXJMeWp4R3hmUVUvTWU2djJ1WlpkZTJ3?=
 =?utf-8?B?R1F2RXBtdC9oQUdWeGZSQTVDN1hERkYxMDdCRnRYSDVEODFLM1BvbUpHalVN?=
 =?utf-8?B?TU5sY2ZXNUZwVFFGanRHRnN5YnJDMnhrSnIxQWVSekM3eWFENklnbmdhMnVh?=
 =?utf-8?B?aE9tdEJ4cTUvRzJ2UUl6bTlxa2dtTVFwVjNXWlFFNUVBUldUdnljK1NlRlFh?=
 =?utf-8?B?NkVPUXNrbXdyMm5Hb2wvdm9iaDg5cWlqenZ5TWk3RnNIbFhxK1R4TldBbHIx?=
 =?utf-8?B?QUNMVDlac0JtTloxKzlLMmhhdk5WZ0NDUjNqN3pQMzc3QTlvVnJZTG5URkEw?=
 =?utf-8?B?dTdrZXp5THlaSzRmcjJEWXRrRUtDSkpxdEdXbkdER011aDFDTEdEQisvcnFT?=
 =?utf-8?B?MCtDL1JzY0NBN2V5U3ZpTmZUS1J3U1BOaVY0cDJORnhEeU5pTE9LcjI4elNO?=
 =?utf-8?B?cU9TNlRSUXAwQVlnVllQVEkxUnNwNHpRbWJhQmpoZ1l0blRzNzN0TTNNYllC?=
 =?utf-8?B?R1N1TE5Ib1g3V1NsVDM1TVQvWDRMQ0ErTGVxNVM3TGE3VnVYUlJLdlVGVE9s?=
 =?utf-8?B?Q0JPTS9oODdqUkFJVHZ3MXhOdjdKQ1Jhdk5hMTBQSjV6REc2K1VacUNaZXVk?=
 =?utf-8?B?YW82bDIrMXplVGtFeW1yMjd4UWo4cVRqeFhld0lkaGZRa2pEclJNTlEvL1Nj?=
 =?utf-8?B?OTFWYXBTak0wQ1lRNEtmRVgzKzg4WE56Znh4bzhXQVNnN3k1RXIvaDdpS0w5?=
 =?utf-8?B?Y2ljaS9ld3RSS21NVXZtNDBTOEpCaUkzM1A4VHVHZW5SME5wOXhJNEFQL0ty?=
 =?utf-8?B?dWdETjhTYkNhcDZ4YTJ1djQ3NzlvV0h2YnhRQmhhT0RDYS9WYXhXdzZ1YklC?=
 =?utf-8?B?a0VXSktzQXdFQlhKc3dTUzRwbjhhYXdhRmEycmpLcWxBNHVhdkRuRVAzYzhj?=
 =?utf-8?B?YXRULzJIbkZ4N0E4S1N3ckVZMDI2YmNHRldwdEdpVGNxMHN4ZG9XS3lTb01P?=
 =?utf-8?B?QmZRRkMrTUdaY0F2bHFKN2xycFVzRFh4TXROOVZzNVNrUGVCSlR5Wnpjay9t?=
 =?utf-8?B?Vyt2TkpWdUZzUFBxTjZSZXB1dVhmL09XVndUWFd6U3BnTTdIREdrUDFyUUkw?=
 =?utf-8?B?RmpoUVhUOTVXQkxhZFpLbXV2UnpXdnhvMEdsc2l4bStIYXVzZm1nY0MwZGRn?=
 =?utf-8?B?SnVGbHc4UmtWTnIzRUQyUnJFOXlsV05FSGRub1NVUXhFZURKckdpcDYzb25R?=
 =?utf-8?B?NTVtM0MyOHBUcEhyZkZYZGt6SWJpSXBjdjlxTFBLOFV6bUQvSTNhalhySTlv?=
 =?utf-8?Q?2cx39Od5+M42+jIsxrdRMB+fB?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bdbd9b53-ef91-4c82-d2fc-08de23458d8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2025 06:17:56.7141
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BcqNaRQkgYUMaUKXVS/gekJSzeM9bSZGhbel7qXOs0SJ136LOIe80gKoh50mYB/IUx9ei90ZrbseaRlCm33ZoRdP3xHKdZ7iOOJMIMuGkxk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6422
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyMCAxLzRdIGR0LWJpbmRpbmdzOiBpMmM6IFNwbGl0IEFT
VDI2MDAgYmluZGluZyBpbnRvIGEgbmV3DQo+IFlBTUwNCj4gDQo+IE9uIDEzLzExLzIwMjUgMTA6
MzQsIFJ5YW4gQ2hlbiB3cm90ZToNCj4gPj4+Pj4+ICsgIHJlZzoNCj4gPj4+Pj4+ICsgICAgbWlu
SXRlbXM6IDENCj4gPj4+Pj4NCj4gPj4+Pj4gV2h5Pw0KPiA+Pj4+DQo+ID4+Pj4gV2lsbCB1cGRh
dGUgYXMgZm9sbG93aW5nLg0KPiA+Pj4+DQo+ID4+Pj4gcmVnOg0KPiA+Pj4+ICAgbWluSXRlbXM6
IDENCj4gPj4+PiAgIG1heEl0ZW1zOiAyDQo+ID4+Pg0KPiA+Pj4NCj4gPj4+IE5vLiBZb3UgY2hh
bmdlZCBub3RoaW5nLiBJbnN0ZWFkIGV4cGxhaW4gd2h5IHRoaXMgaXMgZmxleGlibGUuDQo+ID4+
Pg0KPiA+Pj4gU2VlIHdyaXRpbmcgYmluZGluZ3MuDQo+ID4+DQo+ID4+IFNvcnJ5LCBJIHN0aWxs
IG5vdCB1bmRlcnN0YW5kIHlvdXIgcG9pbnQuIERvIHlvdSBtZWFuIG5lZWQgdG8gZXhwbGFpbg0K
PiA+PiB3aHkgcmVnIGlzIGZsZXhpYmxlIDEgLT4gMj8NCj4gPj4gSWYgeWVzLCBJIHdpbGwgdXBk
YXRlIHRvIGZvbGxvd2luZy4NCj4gPj4NCj4gPj4gcmVnOg0KPiA+PiAgIG1pbkl0ZW1zOiAxDQo+
ID4+ICAgbWF4SXRlbXM6IDINCj4gPj4gICBkZXNjcmlwdGlvbjoNCj4gPj4gICAgIFRoZSBmaXJz
dCByZWdpb24gY292ZXJzIHRoZSBjb250cm9sbGVyIHJlZ2lzdGVycy4NCj4gPj4gICAgIFRoZSBv
cHRpb25hbCBzZWNvbmQgcmVnaW9uIGNvdmVycyB0aGUgY29udHJvbGxlcidzIGJ1ZmZlciBzcGFj
ZS4NCj4gPg0KPiA+IEFmdGVyIGNoZWNrIHRoZQ0KPiA+IGh0dHBzOi8vZG9jcy5rZXJuZWwub3Jn
L2RldmljZXRyZWUvYmluZGluZ3Mvd3JpdGluZy1zY2hlbWEuaHRtbCNhbm5vdGENCj4gPiB0ZWQt
ZXhhbXBsZS1zY2hlbWEgSSB0aGluayBJIHNob3VsZCB1cGRhdGUgd2l0aCBmb2xsb3dpbmcsIGFt
IEkNCj4gPiBjb3JyZWN0ID8NCj4gPg0KPiA+ICByZWc6DQo+ID4gICAgaXRlbXM6DQo+ID4gICAg
ICAtIGRlc2NyaXB0aW9uOiBUaGUgZmlyc3QgcmVnaW9uIGNvdmVycyB0aGUgY29udHJvbGxlciBy
ZWdpc3RlcnMuDQo+ID4gCSAtIGRlc2NyaXB0aW9uOiBUaGUgb3B0aW9uYWwgc2Vjb25kIHJlZ2lv
biBjb3ZlcnMgdGhlIGNvbnRyb2xsZXIncyBidWZmZXINCj4gc3BhY2UuDQo+IA0KPiBQbGVhc2Ug
ZHJvcCAiVGhlIGZpcnN0IHJlZ2lvbiBjb3ZlcnMiIGFuZCBzYW1lIGZvciB0aGUgc2Vjb25kLiBK
dXN0IHNheSB3aGF0IGlzDQo+IHRoaXMgLSBjb250cm9sbGVyIHJlZ2lzdGVyIGFuZCBjb250cm9s
bGVycyBidWZmZXIgc3BhY2UgLSBhbmQgc2Vjb25kIG9uZSBpcyBub3QNCj4gb3B0aW9uYWwgbm93
Lg0KDQpUaGFua3MsIHdpbGwgdXBkYXRlDQoNCml0ZW1zOg0KICAtIGRlc2NyaXB0aW9uOiBDb250
cm9sbGVyIHJlZ2lzdGVycw0KICAtIGRlc2NyaXB0aW9uOiBDb250cm9sbGVyIGJ1ZmZlciBzcGFj
ZQ0KPiANCj4gPg0KPiA+IFdoYXQgeW91IHF1ZXN0aW9uIGFib3V0DQo+ID4gIiBQbGVhc2UgZXhw
bGFpbiBtZSBob3cgb25lLCBzYW1lIFNvQyBoYXMgb3B0aW9uYWwgSU8gYWRkcmVzcyBzcGFjZT8g
SQ0KPiBhc2tlZCB0byBleHBsYWluIFdIWSB0aGlzIGlzIGZsZXhpYmxlIg0KPiA+IFRoZSBBU1Qy
NjAwIGkyYyBjb250cm9sbGVyIGhhdmUgdGhyZWUgaW8sYnVmZmVyLGRtYSBtb2RlLg0KPiA+IFRo
ZSBBU1QyNjAwIGhhdmUgYnVmZmVyIHJlZ2lzdGVyIGZvciBidWZmZXIgdHJhbnNmZXIuIFRoYXQg
aXMgMm5kIHJlZyBvZmZzZXQuDQo+IA0KPiBTbyB0aGUgU29DICpIQVMqIGl0LiBJdCBpcyBhbHdh
eXMgdGhlcmUuIEl0IGNhbm5vdCBiZSBtaXNzaW5nIGluIHRoZSBoYXJkd2FyZS4NCj4gDQo+ID4g
SWYgZHRzaSBub3QgZGVzY3JpcHQgaXQsIHRoZSBkcml2ZXIgd2lsbCBnbyBiYWNrIHRvIGlvIG1v
ZGUgdHJhbnNmZXIuIEZsZXhpYmxlDQo+IGltcGxlbWVudCBpcyBpbiBkcml2ZXIuDQo+IA0KPiBE
ZXNjcmliZSB0aGUgaGFyZHdhcmUuDQoNClVuZGVyc3Rvb2QsIHRoYW5rcyB5b3VyIGd1aWRhbmNl
Lg0KDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0K

