Return-Path: <openbmc+bounces-865-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39789C4B7D1
	for <lists+openbmc@lfdr.de>; Tue, 11 Nov 2025 05:58:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5DnH6qxjz2yvL;
	Tue, 11 Nov 2025 15:58:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c40f::6" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762837091;
	cv=pass; b=LpjIqY3SzUp/kKrqeCuOobvzKAFhav8vW0xkoWd7u+DA060kgrwT1FIIQGv25YZBcomCQghTsh/rodRwM5m4vxF7YGgkXcKesD3ijnNVcVHWi61iGOqVI5zBBZ7w0otD0IVreYPdmpO1vsG8TxmwHkfiQVfcU5U/9WRfuiBrOsNUPNX7Enz/ERlP3WNbgt+DHgfIr+zHd0G9fcss3y0Tu98KNqUUhUe6a5OT4ddbevE3J/RH08m3E67wy7UoX5qcxtodxlTflJ4BhbCr5qC8rt7GRjMZjvDpjpWzuIW5Xn/VLpB1LdkkK2onZ/o4Gofr0/S+oDVRpn+W2svuI7Zh8w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762837091; c=relaxed/relaxed;
	bh=acvQROML/FODS4MuWbr4B7sgL0Z/eBASsIie1LL3B4A=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZP5NgOoyKePzrSfxPgoCmXWmHnquJO2NFU8HkQ45CkVpF4Z5cjp6N5H6kdNRpkGdKysFwBuLULWK52llzbIutkMWFl+698OYcqyKM2lajQ8kuhuzJbNJlcOaCDCEgcQk5rGJwOswOQEpk2E+S3yaRZJIxV/hCLNyXeJkpu/t3V1T1Uii6R/1psoJjFmgyKUkix9cOqriDTpng4vQ89rUZJq7EQxC+p39gENgKFDxavvoiwYT3x+eDToJ1duEhJa7PAXYC7yWnCdppIlif+jXDW6GR5rB63efrPvdJuAXKJqM6+eECyZPEwOqZM+UhvJWGg55GmVvFPx92H7TWCZVUA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=oLD5nxet; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c40f::6; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=oLD5nxet;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c40f::6; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazlp170130006.outbound.protection.outlook.com [IPv6:2a01:111:f403:c40f::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5DnG34Xrz2yvK;
	Tue, 11 Nov 2025 15:58:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PZ+y+QpkZMxzVXBlMiYhK6kqleU/SeNiUMWPdKd/0bycnhxIie5+N+0QElhEwE8IHIpmrMgxzfRRRGO2Y8cilroTlCDcXjtQnZfhj1tLxoCMAsDayxXHBXj5L67On0NZFzmGwvh1yE+5gJcxOqlr515X1oqZ9sov7Z22FERFWurisEf2EOeHVP0w4BHThB0F07BMTyVYaA2oW9Y+SJ3I6YAlZH+rY8dViTCi3ivykY6n8fL4FJDGmEwer1a28EUg/IPHCl2eWADIf5ZddXwzSsSDTa2i6fyldTj45o3c5Eu1G1fWhfnB3FfPkaORC5KMzMpz4XYB8ysh96qTP651og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=acvQROML/FODS4MuWbr4B7sgL0Z/eBASsIie1LL3B4A=;
 b=wrLGEhEHDY2kKnWKK3Q8dByur2hUKIusZsGl+sphtQaaVKjB3AwsKB+cDdH6EqIfLruOcpT90gbZ1ut+mE2qBRIXxWLO30L2rO75Q7P98nowdgSzN7/jgg6XRCwnKzz3ab5TgFQnSS0PwSmo/H2TR6E0/B/EUUKjYVoSx7qHgLajGVj3NJS9IXO7ZcsYCcCjh7S57mV8stXPpEn4L3lyxle8Jol695sIbdD6mWpucPHEUFwRvqfFvmS3pS+SdV7ECG0/J3EITn6jdOv5Uofx4nVRfIvzMKyd3p6Y+VLVIJL1PAaJUsl9FoVgD91CYC6hw9R555xZ2K84pd8AJVj7Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=acvQROML/FODS4MuWbr4B7sgL0Z/eBASsIie1LL3B4A=;
 b=oLD5nxetZ8hxFdXzV7oXr/yCExntDrNrZyBrf2vnbNaVUzGYqfMFsKZNbrflAAyx7IzcdtLauhIwBDsEzikpXH2fxuy4/K96bgvWEwaX/GCxBkYdQ9CeqsAIN0kUDXuWabvXiZe/ayoMdG4+WA2EZo888xQHYMZMAeeHAaQGTQ1TcKnW7jmvBnTnSgbfqMxnhdLzpwskEAo359WEl8LFNK/zikaomyxiE6Cey75lJIov4Bj3KJYf2ZVfuTQbgc7i3ZU6F7TCotKKldd2EKLD90HP4r4S/S1tGQ7yruGOsLspL8RDlImDh4N3WIW/hiDeHFkcG9V6Y+hMdIp8RtdsWw==
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com (2603:1096:408::791)
 by TY0PR06MB5125.apcprd06.prod.outlook.com (2603:1096:400:1b0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 04:57:43 +0000
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80]) by TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80%7]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 04:57:43 +0000
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
Thread-Index: AQHcQisKZrgNdIKVU0mDlJSyYndfALTQ+A6AgAfdvQCAACofAIAT7eJA
Date: Tue, 11 Nov 2025 04:57:43 +0000
Message-ID:
 <TY2PPF5CB9A1BE6FE06477B9CC51B8133DAF2CFA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20251021013548.2375190-1-ryan_chen@aspeedtech.com>
 <20251021013548.2375190-2-ryan_chen@aspeedtech.com>
 <0b76f196-f642-4991-ad5c-717c23938421@kernel.org>
 <TY2PPF5CB9A1BE6597ECD46BD4CB7C5F09FF2FAA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <3c3287f6-1c5c-4c4d-9349-32665a5e1585@kernel.org>
In-Reply-To: <3c3287f6-1c5c-4c4d-9349-32665a5e1585@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PPF5CB9A1BE6:EE_|TY0PR06MB5125:EE_
x-ms-office365-filtering-correlation-id: 291f4fdf-01d0-4aff-7e44-08de20ded933
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|921020|38070700021|13003099007;
x-microsoft-antispam-message-info:
 =?utf-8?B?VWtsRnJXNlZVSWRFK1lyVUwwcVYzNzlvWUxVdnJHaWdqZTJMS2phaXZuZFVS?=
 =?utf-8?B?bTQzLzhLRi96enN2bnBvRXQ0NFdJL1lFWHZDSHgrVG1vMU00MFhZWEhLTTVT?=
 =?utf-8?B?RE9HS1RTY1puOVZsWkZwNmxPMk5SSGNSYW9wbUh6YTY2WENuM1Nva2pVUVNK?=
 =?utf-8?B?UTZRQTVRNUZpUHpIc1g4M2Q2b1BMSENoeUJRRy9qbW5zN291N3VhTEJzYm9w?=
 =?utf-8?B?cjN5OHMrS0xjQ0R4OFUyWWVzWTVYbzlqWlZMNlMxb3p6akpRMXM0ZUZtQ09O?=
 =?utf-8?B?SCtoeCtGMzlJZFgzUFBMUWRPOG5vSFNkTUM3Vm5KMWhuOU5OU3FRYXBnRVA1?=
 =?utf-8?B?K3I2Uy95dGhTNVM0Q1NnTVdXdll0VzJ4VDFCREJqaFNTZkllQnZyNGdNd1Bt?=
 =?utf-8?B?TjlseTJCcksrcmJ3YTJoTlVrSUN5SGFxMGdWeHVHM3JhL2hOL05RY0phZG5N?=
 =?utf-8?B?dTcyUGNXanpRa0UxOE8wZlNndTdBeUxmSzR1ai9neUZ6S3dDZGUrbmVVWURL?=
 =?utf-8?B?Q0xjMXdLSmV6Mk9kSThwaHh4NzVWREhBUUFLeXhXY0lHTEtwV1lDT2hLUlJh?=
 =?utf-8?B?eHczMmFBRGM4M04rNE9lRFV5SzNrRGhyVTJlZWcvZmpob0kzUEtzK0E4VGFB?=
 =?utf-8?B?V1dHbjB5QldndjFhaWQweCtWRWFPTDhkZVQ5OGY3TW9jWmpBeWxqUTNWZ1Fa?=
 =?utf-8?B?YVN4Z25lYnNRQWhSUmZ6Z25CWDBpWXVLOWxQT1pqL3BVOGZERFMvTit0Yzdk?=
 =?utf-8?B?OTJkMEV0czF5T3ZUUkRtVHJ0akRNRjNOT0RldTZGU2gzdnJUMW9FVEZ2OTVt?=
 =?utf-8?B?dUFBUVdxN0p1dHV0RHc1bGxub0xmRFVGTkU4eXVYdkE0TkUyTzEvd1dHSmcz?=
 =?utf-8?B?NHpwOU05OXlCemxuOFJFY0tmWDNMVGdoTGxGdmhrWGVBMmxXcUQ2NDdHOXYw?=
 =?utf-8?B?bFI1aEpFTE0wNllQanZ6WENUWTEzT0pCTldGeFBLUnNVUlFLWWZJcmxlSkZR?=
 =?utf-8?B?NktVVnpseWJEaHpENm9HUnppanNmbmlvcGJHMFNMakF1SmpONlZUZCtYc3cr?=
 =?utf-8?B?N2lOdjMybE5pVFhvU2g1a3RMK2ZaWUZiVUxjMjJ4V1AxM0tITFFIT0RneEhu?=
 =?utf-8?B?YWRsZjd6WjdTTVdUZDNHSlhSUTNCVHJ0dlpndDdlUlU0bXZYMFl3U3pSQkxp?=
 =?utf-8?B?VHBCME1ob05MeU1nUEo4U3lyTXFRall6VzlZS1ZNOXh3ZVVmUEtiRjAzZUFV?=
 =?utf-8?B?STA5RDd4MUpuMTBwTENWaUhYR3hxRUV6ZWd6cVNHNTkzOUVSdTRwY3hWUk92?=
 =?utf-8?B?c0M0ZmxWUElCWWRKSWZ0VG41aEdQaDF4VCs1ZW5nYkt3SDhlY3IySVppdG1Y?=
 =?utf-8?B?TWFBdjg5S2VjOFh3N01kMENxeENyTkhUTVdGWStZakxTZldVaEpscUw3YWhJ?=
 =?utf-8?B?aVpUNElDNWgrMzdmZmNUWExrNVhEcGNQTHBuOEU5b0s4SXhwWUJNWHRHdGpq?=
 =?utf-8?B?eFQwT214b0tSKysvTDlJTzZvcmlSY2I1WDk4bmZOTDUycHBlZFBHRyt0ZTNz?=
 =?utf-8?B?WDJzd0ZDeEE2UGUraHdhWWNVZFBmNUVQdUFCK1pjam5MZHI3dFFJY1FsaEtm?=
 =?utf-8?B?SmNkcVlocHZ3aVJDMHNVWjZVMjFrVUx1SXA5MC90ZE95UnhGbGkzbElzN01s?=
 =?utf-8?B?L2RCZlg1OWNkYjlNcWhTaDZrUmJnamkvRnJLamZnN0JmSjZ1bGNQTTllMkhG?=
 =?utf-8?B?YXF2MXlGOXJ2bSsxQVhsTm9sQVRsaWx2MFI4MWswWUhPYlJnVWRmc3dOYTBB?=
 =?utf-8?B?UUYxMWNpUTdnaitzcUtHVGRKS1lhTTFtVVZGZFlCWjN6ODQ4ckc5ZVh0NDFZ?=
 =?utf-8?B?YU16NzIzRG1XYzZ6K1ZoWGY4eXF0UXNBR2xnWk9GQVpxZ3JxbmtTZE02TFV6?=
 =?utf-8?B?WVdjYUpveUlqQWEzRDRtMFJPbE4wVXNIMzAzZTJxRnpkL2VwN3UxS2Fvdk5D?=
 =?utf-8?Q?MCzeJ3AkQ8rkwu0vwKM8hZlCv1QvaE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020)(38070700021)(13003099007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZDdteGxJQ2dMSEhRNjkzNE1OQ3BBeTFQZjZLaVlpclNIOTVPdzlVSDZjYmpj?=
 =?utf-8?B?b3pyTStETG1DNWtsSDhaN3BmWnVIQWJLQ092L0p5RHRLWk9pZ01zR2FPR1JC?=
 =?utf-8?B?SFFiQ2c5YnRzeFluWTIvdW5oRDdZY2xjaUIvYmxkNURkUU9WY0RiWldNdFZH?=
 =?utf-8?B?d2tXVFlFZlY0QjVtd3pvVWNRWjIzbkxZa2VSUnI0OU1aQmdlZEJqVUJxbXE4?=
 =?utf-8?B?V0NPd2VDTXlDemFEMzB5YmRJdDFaTk4vK0JUNlhsMzgwQ2l4WjJPbGY0WXZR?=
 =?utf-8?B?TmJrakNjL1lKcC93UnUzd1lDRVJKd0I0TUVmMlViL3F2SlIyaHRUUElqa2tm?=
 =?utf-8?B?THV3TXlJdzFvbDRqb0dkcWxJaG83M0U3UHQrRTllZzJkRGVqSEc5WFpVeUpo?=
 =?utf-8?B?ZWZWMVBBekp1RFVBSFdZbGZMOUNRYkZnNGpabDJCT1RwWW05N3Z3TnVWQnlE?=
 =?utf-8?B?eUY0K041NHA2RnFiUTdFb2Y5NUFRVzYvYlBHS2daSlBlNmU3Ullra0t1ZUJi?=
 =?utf-8?B?Tkt4OHgxZE5kdDFINGpGZEFON3hjRjhUR0RpTDcraFZ3dE9qOXZHZkNOSGpL?=
 =?utf-8?B?YWRlMWgrVVoybmZqRnQzNVIva1NOdXBhWHRDaDNLbWdGZmVBNXhzVGhHdVZ1?=
 =?utf-8?B?bjE3cFFNby9UazI3b3E1ZjV6ckFFN2dlY1RYV2ZHT0hTSFprQUlmTnhtNytt?=
 =?utf-8?B?M1YxZE1QM1NvMVR3aGltUElmdC9oODNvTms0Vnlma1ZzMWRuaGpOSWpkdUU2?=
 =?utf-8?B?dmM0WVlKV0U3amYrTUVRalgvZVBiYTdZUi9Od3pGZk1jZ0VGc2hTL0ZUT0pE?=
 =?utf-8?B?TDBSUnJOaUdCcUFybkh3RGlDZUpaUk5OL3R0ZHZFUFBlMFdFdnhlVno5S3Y0?=
 =?utf-8?B?aXhSeDlPTS85aHZIUXliNVBYVzZuT1VkdE82QnYvMW9HQ3JMVnlHMmlSTVdQ?=
 =?utf-8?B?RGdEaHRTR0JWKzhsdHRUTnZWWnYyKy84QklLdmlTeElORGV5ZExvN3Q4RGMy?=
 =?utf-8?B?eDNMR3N1MUJJZ1gyeWlpUlZERU03TUhybVVjWEZiSzJUdnFKMmZLRE1jS1A4?=
 =?utf-8?B?WlF1TmpDdDFPZ2FtWXJnUWFhZGZQN0oxeE9VNHBWeG5FcE9BQ1BHNDBJWTRR?=
 =?utf-8?B?c1U1bDF5czI4TklLOXl2MllrMXFHWGtPUURwVWRuL2RIalkxZ0RpWU1UQkVL?=
 =?utf-8?B?VVJLY2V5c1NtWUJuM3N5R3VxblpMa1RtbU13M1dtLzN3dEEzQzlJaDJOeGw0?=
 =?utf-8?B?bEtvTDJGd2wycHRzeExNVXNLOGlTSm9hZUhOUDJDMWlic25qMVJ6SHBuaGl5?=
 =?utf-8?B?THI2clZkK1VqelZXc0h3dHZDMVMxcTJhWUd3RnRzOVY4c1dpUHIyZmJVajVx?=
 =?utf-8?B?YUQ1UVlxUjdlV0JiaUhpOTNDY2dxTkozenRaM1c2QWY2Tzczc21KaXFwUDJH?=
 =?utf-8?B?aEVBd0tDVm5zc0xGclVvM3NFMWg3RENQUktyTmdOZ3lVaitKQjY2TEZzQXRJ?=
 =?utf-8?B?U0d2dktTbGFOY0FwNm1LaTNzNXphQzBoaUVGaDJrZldQVlBjRG5xYWZER0J3?=
 =?utf-8?B?WEpVSjNrdWpQYVRCU1JLdmRpeVdackpqQm9GTm9lMm0xZ0p2byt1VHJpVWx1?=
 =?utf-8?B?YTVacWhMRHBzMmJ6WWRHVENTdWREM29sSGlSNzQvcXVRRUtjbmdHN2N6KzJi?=
 =?utf-8?B?WFFBTEdhZGNoSmZWeTBLeWlWd0d1K1dRUFlNMCs4aXZON1psK05CclE2OU1k?=
 =?utf-8?B?ZThHY0JvTFBhNjg0T0hiS3VGUEtyQVp6ZCtEYU02SzFtZUFFUWxUOW9SNjFu?=
 =?utf-8?B?Z1p3dkozd3FrQ0VvNWZlY20wUzlsR2xVeFFpOEJYNWlkWEUwNlE0K0RmZFQ1?=
 =?utf-8?B?cnhaRUd1U2Y5YzFjY1kwR1JsSUpkQ1VrQ0JiaW1yd2FTd05jdGcwQjBXT0I1?=
 =?utf-8?B?QXhGZlhQeFdCRVBNVWF2aVA5eEdlWXA3KytSYzIxaDB6Q3hmTjF4bmtTcHo3?=
 =?utf-8?B?NmJ2ZE9YdWtrQXFVWDdCdjVTRy9tTUdSWmZ1Q0FTbjU3eFNFdzRSTlRsVndm?=
 =?utf-8?B?M24vUXRQMHhNbHV2azU5UWJCVmdoS09MQmw2NndEYXd0ZXJzUHpyUlFHc1Ex?=
 =?utf-8?Q?9B3+4z4HWQgonmwqJeh75tq7v?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 291f4fdf-01d0-4aff-7e44-08de20ded933
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 04:57:43.1691
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a4b+WlU8e4epzwv0KB/OU5/cJDln1G9QUaUq9N5Nl5jyNsNsxvGgxP6682IIN+w/LXkRM59oXW5/4M6fbsHAY2gjRv+BpxHYzooyA9A5Qak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5125
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyMCAxLzRdIGR0LWJpbmRpbmdzOiBpMmM6IFNwbGl0IEFT
VDI2MDAgYmluZGluZyBpbnRvIGEgbmV3DQo+IFlBTUwNCj4gDQo+IE9uIDI5LzEwLzIwMjUgMDk6
MjksIFJ5YW4gQ2hlbiB3cm90ZToNCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MjAgMS80XSBk
dC1iaW5kaW5nczogaTJjOiBTcGxpdCBBU1QyNjAwIGJpbmRpbmcNCj4gPj4gaW50byBhIG5ldyBZ
QU1MDQo+ID4+DQo+ID4+IE9uIDIxLzEwLzIwMjUgMDM6MzUsIFJ5YW4gQ2hlbiB3cm90ZToNCj4g
Pj4+IFRoZSBBU1QyNjAwIEkyQyBjb250cm9sbGVyIGlzIGEgbmV3IGhhcmR3YXJlIGRlc2lnbiBj
b21wYXJlZCB0byB0aGUNCj4gPj4+IEkyQyBjb250cm9sbGVycyBpbiBwcmV2aW91cyBBU1BFRUQg
U29DcyAoZS5nLiwgQVNUMjQwMCwgQVNUMjUwMCkuDQo+ID4+Pg0KPiA+Pj4gSXQgaW50cm9kdWNl
cyBuZXcgZmVhdHVyZXMgc3VjaCBhczoNCj4gPj4+ICAtIEEgcmVkZXNpZ25lZCByZWdpc3RlciBs
YXlvdXQNCj4gPj4+ICAtIFNlcGFyYXRpb24gYmV0d2VlbiBjb250cm9sbGVyIGFuZCB0YXJnZXQg
bW9kZSByZWdpc3RlcnMNCj4gPj4+ICAtIFRyYW5zZmVyIG1vZGUgc2VsZWN0aW9uIChieXRlLCBi
dWZmZXIsIERNQSkNCj4gPj4+ICAtIFN1cHBvcnQgZm9yIGEgc2hhcmVkIGdsb2JhbCByZWdpc3Rl
ciBibG9jayBmb3IgY29uZmlndXJhdGlvbg0KPiA+Pj4NCj4gPj4+IER1ZSB0byB0aGVzZSBmdW5k
YW1lbnRhbCBkaWZmZXJlbmNlcywgbWFpbnRhaW5pbmcgYSBzZXBhcmF0ZQ0KPiA+Pj4gZGV2aWNl
dHJlZSBiaW5kaW5nIGZpbGUgZm9yIEFTVDI2MDAgaGVscHMgdG8gY2xlYXJseSBkaXN0aW5ndWlz
aCB0aGUNCj4gPj4+IGhhcmR3YXJlIGNhcGFiaWxpdGllcyBhbmQgY29uZmlndXJhdGlvbiBvcHRp
b25zIGZyb20gdGhlIG9sZGVyDQo+ID4+PiBjb250cm9sbGVycy4NCj4gPj4+DQo+ID4+PiBTaWdu
ZWQtb2ZmLWJ5OiBSeWFuIENoZW4gPHJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT4NCj4gPj4+IC0t
LQ0KPiA+Pj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9hc3BlZWQsaTJjLnlhbWwgICB8
ICAzICstDQo+ID4+PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2FzdDI2MDAtaTJjLnlh
bWwgIHwgNjYNCj4gPj4+ICsrKysrKysrKysrKysrKysrKysNCj4gPj4+ICAyIGZpbGVzIGNoYW5n
ZWQsIDY3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pICBjcmVhdGUgbW9kZQ0KPiA+Pj4g
MTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvYXN0MjYwMC1pMmMu
eWFtbA0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvaTJjL2FzcGVlZCxpMmMueWFtbA0KPiA+Pj4gYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvaTJjL2FzcGVlZCxpMmMueWFtbA0KPiA+Pj4gaW5kZXggNWI5YmQyZmVk
YTNiLi5kNGU0ZjQxMmZlYmEgMTAwNjQ0DQo+ID4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvaTJjL2FzcGVlZCxpMmMueWFtbA0KPiA+Pj4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9hc3BlZWQsaTJjLnlhbWwNCj4gPj4+IEBAIC00
LDcgKzQsNyBAQA0KPiA+Pj4gICRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvaTJj
L2FzcGVlZCxpMmMueWFtbCMNCj4gPj4+ICAkc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcv
bWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4gPj4+DQo+ID4+PiAtdGl0bGU6IEFTUEVFRCBJMkMg
b24gdGhlIEFTVDI0WFgsIEFTVDI1WFgsIGFuZCBBU1QyNlhYIFNvQ3MNCj4gPj4+ICt0aXRsZTog
QVNQRUVEIEkyQyBvbiB0aGUgQVNUMjRYWCwgQVNUMjVYWCBTb0NzDQo+ID4+Pg0KPiA+Pj4gIG1h
aW50YWluZXJzOg0KPiA+Pj4gICAgLSBSYXluIENoZW4gPHJheW5fY2hlbkBhc3BlZWR0ZWNoLmNv
bT4gQEAgLTE3LDcgKzE3LDYgQEANCj4gPj4+IHByb3BlcnRpZXM6DQo+ID4+PiAgICAgIGVudW06
DQo+ID4+PiAgICAgICAgLSBhc3BlZWQsYXN0MjQwMC1pMmMtYnVzDQo+ID4+PiAgICAgICAgLSBh
c3BlZWQsYXN0MjUwMC1pMmMtYnVzDQo+ID4+PiAtICAgICAgLSBhc3BlZWQsYXN0MjYwMC1pMmMt
YnVzDQo+ID4+Pg0KPiA+Pj4gICAgcmVnOg0KPiA+Pj4gICAgICBtaW5JdGVtczogMQ0KPiA+Pj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvYXN0MjYw
MC1pMmMueWFtbA0KPiA+Pj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJj
L2FzdDI2MDAtaTJjLnlhbWwNCj4gPj4NCj4gPj4gV2h5IGNvbXBsZXRlbHkgYnJlYWtpbmcgbmFt
aW5nPyBQbGVhc2UgZm9sbG93IHdyaXRpbmcgYmluZGluZ3MgY2FyZWZ1bGx5Lg0KPiA+DQo+ID4g
V2lsbCB1cGRhdGUNCj4gPiAkaWQ6ICJodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9pMmMv
YXNwZWVkLGFzdDI2MDAtaTJjLnlhbWwjIg0KPiA+Pg0KPiA+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQNCj4gPj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uNmRkY2VjNWRlY2RjDQo+ID4+PiAtLS0gL2Rl
di9udWxsDQo+ID4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJj
L2FzdDI2MDAtaTJjLnlhbWwNCj4gPj4+IEBAIC0wLDAgKzEsNjYgQEANCj4gPj4+ICsjIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkgJVlBTUwg
MS4yDQo+ID4+PiArLS0tDQo+ID4+PiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1h
cy9pMmMvYXN0MjYwMC1pMmMueWFtbCMNCj4gPj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJl
ZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4gPj4+ICsNCj4gPj4+ICt0aXRsZTogQVNQ
RUVEIEkyQyBvbiB0aGUgQVNUMjZYWCBTb0NzDQo+ID4+PiArDQo+ID4+PiArbWFpbnRhaW5lcnM6
DQo+ID4+PiArICAtIFJ5YW4gQ2hlbiA8cnlhbl9jaGVuQGFzcGVlZHRlY2guY29tPg0KPiA+Pj4g
Kw0KPiA+Pj4gK2FsbE9mOg0KPiA+Pj4gKyAgLSAkcmVmOiAvc2NoZW1hcy9pMmMvaTJjLWNvbnRy
b2xsZXIueWFtbCMNCj4gPj4+ICsNCj4gPj4+ICtwcm9wZXJ0aWVzOg0KPiA+Pj4gKyAgY29tcGF0
aWJsZToNCj4gPj4+ICsgICAgZW51bToNCj4gPj4+ICsgICAgICAtIGFzcGVlZCxhc3QyNjAwLWky
Yy1idXMNCj4gPj4+ICsNCj4gPj4+ICsgIHJlZzoNCj4gPj4+ICsgICAgbWluSXRlbXM6IDENCj4g
Pj4NCj4gPj4gV2h5Pw0KPiA+DQo+ID4gV2lsbCB1cGRhdGUgYXMgZm9sbG93aW5nLg0KPiA+DQo+
ID4gcmVnOg0KPiA+ICAgbWluSXRlbXM6IDENCj4gPiAgIG1heEl0ZW1zOiAyDQo+IA0KPiANCj4g
Tm8uIFlvdSBjaGFuZ2VkIG5vdGhpbmcuIEluc3RlYWQgZXhwbGFpbiB3aHkgdGhpcyBpcyBmbGV4
aWJsZS4NCj4gDQo+IFNlZSB3cml0aW5nIGJpbmRpbmdzLg0KDQpTb3JyeSwgSSBzdGlsbCBub3Qg
dW5kZXJzdGFuZCB5b3VyIHBvaW50LiBEbyB5b3UgbWVhbiBuZWVkIHRvIGV4cGxhaW4NCndoeSBy
ZWcgaXMgZmxleGlibGUgMSAtPiAyPw0KSWYgeWVzLCBJIHdpbGwgdXBkYXRlIHRvIGZvbGxvd2lu
Zy4NCg0KcmVnOg0KICBtaW5JdGVtczogMQ0KICBtYXhJdGVtczogMg0KICBkZXNjcmlwdGlvbjoN
CiAgICBUaGUgZmlyc3QgcmVnaW9uIGNvdmVycyB0aGUgY29udHJvbGxlciByZWdpc3RlcnMuDQog
ICAgVGhlIG9wdGlvbmFsIHNlY29uZCByZWdpb24gY292ZXJzIHRoZSBjb250cm9sbGVyJ3MgYnVm
ZmVyIHNwYWNlLg0KDQoNCj4gDQo+IA0KPiAuLi4NCj4gDQo+IA0KPiA+Pj4gKyAgYnVzLWZyZXF1
ZW5jeToNCj4gPj4+ICsgICAgbWluaW11bTogNTAwDQo+ID4+PiArICAgIG1heGltdW06IDQwMDAw
MDANCj4gPj4+ICsgICAgZGVmYXVsdDogMTAwMDAwDQo+ID4+PiArICAgIGRlc2NyaXB0aW9uOiBm
cmVxdWVuY3kgb2YgdGhlIGJ1cyBjbG9jayBpbiBIeiBkZWZhdWx0cyB0byAxMDANCj4gPj4+ICsg
a0h6IHdoZW4NCj4gPj4gbm90DQo+ID4+PiArICAgICAgc3BlY2lmaWVkDQo+ID4+DQo+ID4+IERv
bid0IHJlcGVhdCBjb25zdHJhaW50cyBpbiBmcmVlIGZvcm0gdGV4dC4NCj4gPg0KPiA+IFdpbGwg
dXBkYXRlDQo+ID4gY2xvY2stZnJlcXVlbmN5Og0KPiA+ICAgICBkZXNjcmlwdGlvbjogRGVzaXJl
ZCBJMkMgYnVzIGZyZXF1ZW5jeSBpbiBIeg0KPiA+ICAgICBkZWZhdWx0OiAxMDAwMDANCj4gDQo+
IEhlaD8gWW91IGFyZSBtYWtpbmcgcmFuZG9tIHNldCBvZiBjaGFuZ2VzIGxpa2UgZGlkIG5vdCBy
ZWFsbHkgcmVhZCB0aGUNCj4gZmVlZGJhY2suIEkgbm90IHRvIHJlcGVhdCBzb21ldGhpbmcuIFdo
YXQgaXMgcmVwZWF0ZWQ/IENvbnN0cmFpbnRzLg0KPiBXaGVyZSBhcmUgdGhlIHJlcGVhdGVkICJp
biBmcmVlIGZvcm0gdGV4dCIuIFdoYXQgZGlkIHlvdSBkbz8gRHJvcHBlZA0KPiBjb25zdHJhaW50
cy4NCg0KU29ycnksIEkgbWlzdW5kZXJzdG9vZCB5b3VyIGNvbW1lbnQsDQpJIHRoaW5rIHlvdSBh
cmUgcG9pbnQgb3V0IG15IGRlc2NyaXB0aW9uLg0KDQpJIHdpbGwgdXBkYXRlIHdpdGggZm9sbG93
aW5nLg0KDQpjbG9jay1mcmVxdWVuY3k6DQogIGRlc2NyaXB0aW9uOiBEZXNpcmVkIG9wZXJhdGlu
ZyBmcmVxdWVuY3kgb2YgdGhlIEkyQyBidXMgaW4gSHouDQogIG1pbmltdW06IDUwMA0KICBtYXhp
bXVtOiA0MDAwMDAwDQogIGRlZmF1bHQ6IDEwMDAwMA0KDQo+IA0KPiBJIGRvbid0IGtub3cgd2hh
dCB0byBzYXkuDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0K

