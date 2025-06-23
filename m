Return-Path: <openbmc+bounces-280-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F7CAE58E6
	for <lists+openbmc@lfdr.de>; Tue, 24 Jun 2025 03:01:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bR68W2w1Pz2yf3;
	Tue, 24 Jun 2025 11:01:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c406::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750646552;
	cv=pass; b=BiVFGF1DWXy4+Z8l5qvN4fNncgYexjbXBHKuwfbDIJGKGgWVhhD2zG4Rb2xSwowucsQNy1qV6RCzhpw0eK0dG8OnbyGOzCrp/61wUjXRoKu9RMsUGYgytoY+btbq6Xw7M6YPwwt2VXejdz6ZUV0S8MJxrFyNBC/a0qwzg63G8PEHUNX9WP41DDd3cs3BATdT+i6iVdxB7HES2wpeSMWEw+uMHtz9D+XK9kgav7vnIJ2ri32i8O45255kOxFSY9kPUOxcVghFuwBOgLBl8J9ZDaOOvhVFqhHUnHl6WoaQcePL46NpZxUCuv43aon20VouQ4I5BU/zVHzJutJbM/Wi8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750646552; c=relaxed/relaxed;
	bh=JLMb7eJjr7XkcjcZ8BY9s2O7UkP9trFycXwFrhrEgfI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ajguEJd2m70RRs1qtH8kXhq9Uia9jQKOjKBLyl8qWhdUUvdCGcMzAQiZG9zsFDs7YnAAPNMkimGrSaGP47w/5DTKlg3uBsIpcT8NZkyjlfm6/Nz7b//3dFuKFp0MLOQ7jArOyGtKgjGsc7tbOaOsu4vAlxbbruglpyp9Zwgy4wbCCxFg8FhtVAWOF3qztrmWzgJivabPiYwaklGYUkam6kWBlHhE+JW3zNWK6fdetZDIz4Rj7dPWF4tHD3XN4eo7nq9r4JX9eloNJwZRRUtNLQDo5iGAz8Uxr7D9cRK/WF471ACoJQrbgmgeVZzxS8mqyZdbS6HhtwZuVI1lH6gEMQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=YiEqq14O; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=YiEqq14O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c406::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bQXRq59lLz2xRq;
	Mon, 23 Jun 2025 12:42:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=INx45uJRlL9nV+w1WjkD4TywSInnFmv8Ao3gwy8qjX0uwSXTBhg/vm5kLyNtEyCTRfQplDhjFNGr2/u6Hjvbb+FYvlsQJi79MwYzJa92OYNj9+9H89eE6goMKDN5EYLaEteNf/+m0bgwr5jF5/n+WEC54vmcVhFjJ5wpj83WRQGZEBAUd0CUfYOmDVks2eq602Ugx8/hkYlOpN4xwBQyuE1CDtylG10hUePXaoLUw6199ubTu8nM8Rf9CVRTtf2m/TFPcwtQbcJbc77ecEhmRFJXjaVfsiDrPuUtdWiWSipbNwcs+4n8GE28VkOJZKJ1hkaybPikgK8N6D0IiCmIIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JLMb7eJjr7XkcjcZ8BY9s2O7UkP9trFycXwFrhrEgfI=;
 b=rSSfHq5FSg1kOaVj7JDJoMzCVDKNMg7PLITZEjuybm8uPfe4+jN0E7EYL2ZsXJf0pdMgpvtd0SqNVXfUJ0tCtDxvlM1HCLSRxzwLFodSEZYqNFxpGVQ/yq3SL4tNdNHt3P6CQjmFrkz9Niir/ab3NPtC8DtEb0Dj+zNkbKpHfHTMPDQw1OzGkyS4ps3OCPWrc+2bTOFeOwMQzI32vYdF8QQZW6w6r4hjwwaQmn5EPU/ok5adFOzWUge1I1x2og8RAwDojcMLbrPeaZnyjvpu8qfFnqZ0lRA6XxcYMXV6hoKMfGBhhUVblVnSTwS/IEcqnKkTyGaVpPIk7Q3FwaPa/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLMb7eJjr7XkcjcZ8BY9s2O7UkP9trFycXwFrhrEgfI=;
 b=YiEqq14O2lelZ46lAcXJ9/oAwSSOEqlfkih2tOiQC7xDLxmDHzblSiV56ZQbGIps14EVZHVkTtdP1nMgZCEDIUFtH6MrqRdQvCvAd3nLcIPrp+3JrZXqLfQf1KB9EJs3OnXlD1Cn3nES1VOYQYcgx0azsZIdxaYqagsNqJtjQe2dO1CB+XEI+Y7i0QXtOCtaMs1aGajsfvA8XzN6cu4Q6R93uLWm05UB3JPB/5kKTxz2mkX5e1ojTp9w7P6IeFBPsX+qvHq89zJAPj8176Bre8N6RxAAk9fjfXc6Yla5JShe0D1+MK5yU5Jy5Sppj1YR/A5v7UUftWOIQBXhTLLEbA==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by JH0PR06MB7151.apcprd06.prod.outlook.com (2603:1096:990:8e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Mon, 23 Jun
 2025 02:42:07 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%5]) with mapi id 15.20.8857.025; Mon, 23 Jun 2025
 02:42:07 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>, "mani@kernel.org"
	<mani@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "vkoul@kernel.org" <vkoul@kernel.org>,
	"kishon@kernel.org" <kishon@kernel.org>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
CC: "elbadrym@google.com" <elbadrym@google.com>, "romlem@google.com"
	<romlem@google.com>, "anhphan@google.com" <anhphan@google.com>,
	"wak@google.com" <wak@google.com>, "yuxiaozhang@google.com"
	<yuxiaozhang@google.com>, BMC-SW <BMC-SW@aspeedtech.com>
Subject:
 =?utf-8?B?5Zue6KaGOiBbUEFUQ0ggNy83XSBwY2k6IGFzcGVlZDogQWRkIEFTUEVFRCBQ?=
 =?utf-8?Q?CIe_host_controller_driver?=
Thread-Topic: [PATCH 7/7] pci: aspeed: Add ASPEED PCIe host controller driver
Thread-Index: AQHb3BN5QYkLFJ4SFk66wBBeIABUJbQA2i+AgArqpKA=
Date: Mon, 23 Jun 2025 02:42:06 +0000
Message-ID:
 <SEYPR06MB5134623F42A5B204C20E14A99D79A@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20250613033001.3153637-1-jacky_chou@aspeedtech.com>
 <20250613033001.3153637-8-jacky_chou@aspeedtech.com>
 <576ca6bb-291c-458e-9703-46e7d2f43bbe@kernel.org>
In-Reply-To: <576ca6bb-291c-458e-9703-46e7d2f43bbe@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|JH0PR06MB7151:EE_
x-ms-office365-filtering-correlation-id: 92d6b196-db1b-4640-a36c-08ddb1ff8b7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?elBSall4VC8wSFNXdlB3SkQzV2RhZmdWbjJlKzdCN1k1Nit1d2krSkJmYmR4?=
 =?utf-8?B?NlpucVplR2ZrRXBOMXR0RVV4QW1zeGhOSmplc3FGdjJLU0RxbWxFczdOTCtW?=
 =?utf-8?B?UWpCaElucUZ4dWlIdmFaR1ZBZkxMRHYxaVMxY3JHVkpzbm9UOVFvQ1pOWWhQ?=
 =?utf-8?B?b1psMVZ4UU1ETno2RWd6SFVCNFl0bzIvSmhDR3BYc3B3SDkzN0RTdnc5WTU1?=
 =?utf-8?B?RlFuZzc5SUpmeEg2MExrSFFLcFo4UmlxaTY2YXQzR2VGUWtIV3RaaU85Z3VM?=
 =?utf-8?B?NmM0Z3RMTDlIU3ZyRTdPQ3NlQlhsZnB3ZnJQNnlLeUx6bDhhVjJRZFEzOXJ1?=
 =?utf-8?B?MWxRY0VmZmNDaitkejFRZ2dBQXhyMHlhVGRXaTFEdzB0R3hDalY4VVM0Ty9F?=
 =?utf-8?B?ZGFyeURWeXp0Q2tYUzUvaW9JRlMzVmN3WENYZGtnKytYRFVBVDNkM0dHZXVC?=
 =?utf-8?B?bStrWlJKRDBoWjhkdDIxMnFsNGg1R3lBSi9iSzJUT2FHeHRRbE5JQjNqdDJt?=
 =?utf-8?B?N0NKUmJVT0djRVlicEcrN2x1TUVRdXdlWTBRclY5ZFI0NThNNXNQVFYxVVR4?=
 =?utf-8?B?cVhISVVCNjREYXpCdmowVEVJdkVLaWRBc0dFaWpDdXZ4dUMzaVRwQlQ0L01W?=
 =?utf-8?B?WkxNbUczZzdrSkluK0NnRzNqUGh5cjZleGVhZ2toQk5tV2taKzRyNjFSTlFi?=
 =?utf-8?B?Y3FiREtQTUdnaEIrWFMyZHEwaTdoajd2eVJHbmRtZGF0UjJhTSs0OFE3VXBo?=
 =?utf-8?B?QzlWb2p0YlZJMzM4RkJlWVFKVitHNEQvZFBqRXMyS1lLNEwzSS85MGk2b054?=
 =?utf-8?B?K0lWRVJBbjNLTjVNT0JZc1lZaGRvcDdTM0VxdkV3UXJCWkhjd1p2d29XemE4?=
 =?utf-8?B?VWgrQkR1Zis1bE0rbDlqY2w0RWp2VlA5eTNKWjhocVpqTU5Fam5HYXFVT3hu?=
 =?utf-8?B?elFiVVNYQ3lRVi94K25ma1pSQ045N0MxbXJqVDBPMDRBSlZ6ZGJsbW5RUWIv?=
 =?utf-8?B?TmNsYmNFNWNNQTF3MTllYWh6Tk15VnF1OGFwWWNoMFd2NXpvOUxMVExLREpz?=
 =?utf-8?B?cnozakluTWhnYitxb0hlTzdXV3ZyYzVEUXZmc0RYYnhCZkQ4dU9kaGxZY0ZS?=
 =?utf-8?B?anhNMC94YlhZSk9SQjUyeFZaVEpxWDVwWlIzVG5BazhoVkh0OHhBSWZjd090?=
 =?utf-8?B?OGlnZVlVY0RmUmFJK3E0RU42L01jaHNtUkdGa3NsVkxMWjRQSVVuNEpLaCt0?=
 =?utf-8?B?YTY4Qkt4dTc4dnZvTVB6cCs0cEYyTmF3WmVtTjlnRE9mMnZiRCs4dUdXbTVt?=
 =?utf-8?B?ckt6emtSNHE1dHdYT2k1RDlONEdwMzZNT3MySTJmOHFQSURRY3pPZ0kzNjlk?=
 =?utf-8?B?QlNMMUJBemVTaVBJTVBiaHNjRW0zT1BQUEM0OGU0clV5YXB1VDZQUHVlUVBo?=
 =?utf-8?B?VzdmNmtHM1M2elVVMjVOSDBDdVI0NVdHTWtUZkpkcS9FSTVPTldIS01QSlEw?=
 =?utf-8?B?Z2JIN2RvTDNoKytXQmVwQTNyV3dsZlk2bmJqTXFPYnVIbE0zMzRPYlVzVDEr?=
 =?utf-8?B?bUJSNThzZGt4d3RxT01wL2xzQWwzNzlOWjhzMEdRekUyZGdjTXVTMVBqZHIy?=
 =?utf-8?B?UlBQTVlSTFpPTFcwVTEvcVJGaWpDemJ3aHp1U0MwTExhVjlJQ1RMN2Zqc0N1?=
 =?utf-8?B?b0d0ZjFGM1RNNFh4UUN6Ykc0RFJlZ2YzM2RiMWg3MlBILzhwOHlxQzk2YUlj?=
 =?utf-8?B?MHUvY3ZHeUNLME9tWGVUTGpsd0RKS0Z5ZTRiZlRzUkV3c2c0elBwdG9mZDZo?=
 =?utf-8?B?aS9hVTB6R0xVYmhUOUxybm1GRDUzaXNka3EwZXU0Q2ZZZHlWdFIxb0ErMW1P?=
 =?utf-8?B?Q3d4YTJqOU4xNDhCL0FUN0NXQ0VvRVBjcUp3ZTRIOWpobkRHYWJuVmg0S3h1?=
 =?utf-8?B?Rlh5c1AzU1hxS3FzRU5iN2JyN1RFV0ZGYWRPc01sTDkzYjhxUHdiRVV5Smxq?=
 =?utf-8?Q?/ZMXBILUVZ1j9S7irkcfTn++GGItI8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dkE2clRjYkVvYXRBVm5KdVhKUkpkOEppNitEL0t5VkhOWlcreWUvdEV4QkFi?=
 =?utf-8?B?aU4xUDhaVzUrSjBzdFN6QjRVN1dLRmNtMHhNQ2ViZnBPbFFkZmQwZTV6dHU4?=
 =?utf-8?B?WkJYODkvRzgvMnVDSW8rSlZLeHV5eFBzNHgwOWdTQnJCcnVQVEJhNWllcURZ?=
 =?utf-8?B?ckE1bDNuRUpGbUh4Uzh6azlwLzJSdFczUkRXVFF1MS9odlN6YnZqQlBFV1BY?=
 =?utf-8?B?TFo2b0FpRmZJOStsaXJzTnZKcUtLeFpOZlM2RHU5aWVIZDYrMnIwRUtFa0t4?=
 =?utf-8?B?V29tRkRCeEh6blJqMmJuNHhLaDdxUTZVcnp0aUlmSTArcXJabmhQdG1INi9O?=
 =?utf-8?B?Q0p6bm1kQWZBTzVjTXplSXJzb3Q1QUR4L2RwYzZSWFNpTDh4MVBtSVlYL3d2?=
 =?utf-8?B?VXJCS012OUxQbmcwUGNmWGZwVSszWHc0WHhDY2hTWThwdStpcFEvOEZjVysy?=
 =?utf-8?B?ekxvNGJoOTF1S2xFU3hkSTRKU21iY1lkS2o1R241V1c1UWdUY1F0bi9Cc21U?=
 =?utf-8?B?YnB3VUJScm1tOWVxTE1QUlVjN0xMOFQ5MGZMQWJDOGpzbW5kSVhmRnpJS1BF?=
 =?utf-8?B?OWFZaEtoUlJUWmFjWG5VaTZrcjk3cDg1TXlBYk9VYVhoV3ZhbnVJVytlbC9X?=
 =?utf-8?B?RDAzVFBkQWtjOGtLdFhLRkw1WjNoSmRSMnppam4rWW5VcElxZzZLSWRCd3Q5?=
 =?utf-8?B?WXFhMG1odmVHemoya1Y5eVdVQ2I2Tkh5KzUyNXdraUd6NmRZUUdoR0JOTEJB?=
 =?utf-8?B?OGdhczNFYnFBUmJaVnFZMUNtanhnSHhBYjhzZGZpbGpBRkppVWRxSjBoT1F2?=
 =?utf-8?B?V1JXMXI5bGRHWUVlRExvbW1qZ1EyNWJ6dXVTQVNsUXdIN0tQVjM3Ty80UUFX?=
 =?utf-8?B?Tlk2VVdjNEJKWEdEN21qZVlhVlYzdlpNUWxucXRQOXBLb2NZNW1sUHF4RVp6?=
 =?utf-8?B?ME5UOFFMMVYxcXNjQW0zd0FTc2V5dDVFVjZaWWpHRjAzaXExbHBMOVpkSmJ0?=
 =?utf-8?B?djV4R2tMK082VG9yc2FieU1OL29oNWVyVkFIY000RG1WQzFDM2tldWIxQ0Vs?=
 =?utf-8?B?K1c5N3NROHhTTC9GK3YxdTFPRFFwYWZQeVNSSUUzdFlGSEU3RlM2OUpYeVNw?=
 =?utf-8?B?SHF6MXh0S3grVndZQVJsL09vMkkzamttRHRzMnk3eVNrVFd5VkFoYW9kU0FY?=
 =?utf-8?B?OXBlSmxpcG9yMm5CQkVjYnczUUZ6NVBGMFJKWjFFODVVVEc5Vi9GcVhLWnBT?=
 =?utf-8?B?Z3FrRkZDZUxiKzVSYjU1bTVCOVpQYUJ6SDhldjJTb2lkNkVPZUZnbTFqUG5G?=
 =?utf-8?B?NldBcjJRektYRTBzU0xWVmpDRld3d3k2LzdQSThnOSt6Vkw0eGZKNVNBOVRW?=
 =?utf-8?B?TzRjZno0ZnpvelBpK1UxMHhrbnU1NmtLRzA0RDNSVWpnUG1wMG5HaCtEcDJU?=
 =?utf-8?B?L3RBbFI2UFN1YVF3TnZ3UkJQWkwwNzVvM3grY2pmUGpOTEo2QWprVExkNkhl?=
 =?utf-8?B?MEljNTF4QW5LS2IzZFQyc0tKSnlTL05kYVNuZS9VUU1JVTgzQUdSeTR6MTlv?=
 =?utf-8?B?aVRwV0FtMVBjaXpQWml1RFRXMEI2ZjNVbzNNOC9uVGxRcTZjQkxVeVFUQUZp?=
 =?utf-8?B?YXRMWlFrZzMzYkEzdXhlbitGVU1DZjV0M2tHTGFSN3NuWnNpUEIrUmpDVnd2?=
 =?utf-8?B?VUlUcmYzWVdUbnM3T2FrWFhidDZtL0JtcHJFcjhXbUpOOEFabHA1RlEwMlho?=
 =?utf-8?B?TDhiQkMzT1daNjV5eGFaOFpVMWxUTC9EVy9VY0ZhbURVWWdneWpjaXk5RHpp?=
 =?utf-8?B?OHVsZmxOeXNKWGpuVDJCeFordmJhdit4U2p2dTV6K1pVbHRsUzBHYVRWYTEx?=
 =?utf-8?B?V3Y4eGMzUUo3a1dQU2VvRldiUFVtbWFqZjNaUVdDejd5OGY4elZseGc4YkJz?=
 =?utf-8?B?SThNYTdIQTh6OXF1T0MxSERzbHRBTnFQdXNFSlZxY21TVDVlYSthS2RBb3NE?=
 =?utf-8?B?dzczWDdkMjFFczBQZXFEaGpmeERpVjM3UENnUytEZENxNFI5K05tNENCdjF4?=
 =?utf-8?B?L01PV0JRb3ExYXJsWWRQT29PZFV6SVBCS0w4R29ENFM1WkwzbmduN09DSCsz?=
 =?utf-8?Q?Zh3Uhfnj1/C6qG7tbZ9GiglLi?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d6b196-db1b-4640-a36c-08ddb1ff8b7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2025 02:42:07.0867
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5ekJbExjzwNFB9pWRL399kB9xS1pjMEOZtBfK6KleEyZJSC7PsX/50yEHSJZBJUJjma1BJDw5Jro25kxQDRvoEVVNb+NxBFJn7hWkJU2xa8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7151
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiA+ICAJICBUaGlzIHNlbGVjdHMgYSBkcml2ZXIgZm9yIHRoZSBNZWRpYVRlayBNVDc2MjEgUENJ
ZSBDb250cm9sbGVyLg0KPiA+DQo+ID4gK2NvbmZpZyBQQ0lFX0FTUEVFRA0KPiA+ICsJYm9vbCAi
QVNQRUVEIFBDSWUgY29udHJvbGxlciINCj4gPiArCWRlcGVuZHMgb24gUENJDQo+IA0KPiBkZXBl
bmRzIEFSQ0hfQVNQRUVEIHx8IENPTVBJTEVfVEVTVA0KPiANCg0KQWdyZWVkLg0KDQo+ID4gKwlk
ZXBlbmRzIG9uIE9GIHx8IENPTVBJTEVfVEVTVA0KPiA+ICsJc2VsZWN0IFBDSV9NU0lfQVJDSF9G
QUxMQkFDS1MNCj4gPiArCWhlbHANCj4gPiArCSAgRW5hYmxlIHRoaXMgb3B0aW9uIHRvIGFkZCBz
dXBwb3J0IGZvciB0aGUgUENJZSBjb250cm9sbGVyDQo+ID4gKwkgIGZvdW5kIG9uIEFTUEVFRCBT
b0NzLg0KPiA+ICsJICBUaGlzIGRyaXZlciBwcm92aWRlcyBpbml0aWFsaXphdGlvbiBhbmQgbWFu
YWdlbWVudCBmb3IgUENJZQ0KPiA+ICsJICBSb290IENvbXBsZXggZnVuY3Rpb25hbGl0eSwgaW5j
bHVkaW5nIGludGVycnVwdCBhbmQgTVNJIHN1cHBvcnQuDQo+ID4gKwkgIFNlbGVjdCBZIGlmIHlv
dXIgcGxhdGZvcm0gdXNlcyBhbiBBU1BFRUQgU29DIGFuZCByZXF1aXJlcyBQQ0llDQo+ID4gKwkg
IGNvbm5lY3Rpdml0eS4NCj4gPiArDQo+ID4gIGNvbmZpZyBQQ0lfSFlQRVJWX0lOVEVSRkFDRQ0K
PiA+ICAJdHJpc3RhdGUgIk1pY3Jvc29mdCBIeXBlci1WIFBDSSBJbnRlcmZhY2UiDQo+ID4gIAlk
ZXBlbmRzIG9uICgoWDg2ICYmIFg4Nl82NCkgfHwgQVJNNjQpICYmIEhZUEVSViAmJiBQQ0lfTVNJ
IGRpZmYNCj4gPiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvTWFrZWZpbGUNCj4gPiBi
L2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvTWFrZWZpbGUgaW5kZXggMDM4Y2NiZDllM2JhLi4xMzM5
Zjg4ZTE1M2QNCj4gPiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL01h
a2VmaWxlDQo+ID4gKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9NYWtlZmlsZQ0KPiA+IEBA
IC0zOSw2ICszOSw3IEBAIG9iai0kKENPTkZJR19QQ0lfTE9PTkdTT04pICs9IHBjaS1sb29uZ3Nv
bi5vDQo+ID4gIG9iai0kKENPTkZJR19QQ0lFX0hJU0lfRVJSKSArPSBwY2llLWhpc2ktZXJyb3Iu
bw0KPiA+ICBvYmotJChDT05GSUdfUENJRV9BUFBMRSkgKz0gcGNpZS1hcHBsZS5vDQo+ID4gIG9i
ai0kKENPTkZJR19QQ0lFX01UNzYyMSkgKz0gcGNpZS1tdDc2MjEubw0KPiA+ICtvYmotJChDT05G
SUdfUENJRV9BU1BFRUQpICs9IHBjaWUtYXNwZWVkLm8NCj4gPg0KPiA+ICAjIHBjaWUtaGlzaS5v
IHF1aXJrcyBhcmUgbmVlZGVkIGV2ZW4gd2l0aG91dCBDT05GSUdfUENJRV9EVw0KPiA+ICBvYmot
eQkJCQkrPSBkd2MvDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNp
ZS1hc3BlZWQuYw0KPiA+IGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLWFzcGVlZC5jDQo+
ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmM3NDU2ODRh
N2Y5Yg0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVy
L3BjaWUtYXNwZWVkLmMNCj4gPiBAQCAtMCwwICsxLDEwMzkgQEANCj4gPiArLy8gU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjArDQo+ID4gKy8qDQo+ID4gKyAqIENvcHlyaWdodCAyMDI1
IEFzcGVlZCBUZWNobm9sb2d5IEluYy4NCj4gPiArICovDQo+ID4gKyNpbmNsdWRlIDxsaW51eC9p
cnFjaGlwL2NoYWluZWRfaXJxLmg+ICNpbmNsdWRlIDxsaW51eC9pcnFkb21haW4uaD4NCj4gPiAr
I2luY2x1ZGUgPGxpbnV4L21mZC9zeXNjb24uaD4gI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPiAj
aW5jbHVkZQ0KPiA+ICs8bGludXgvbXNpLmg+ICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4gI2lu
Y2x1ZGUNCj4gPiArPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPiAjaW5jbHVkZSA8bGludXgvb2Zf
cGxhdGZvcm0uaD4NCj4gDQo+IFdoZXJlIGRvIHlvdSB1c2UgaXQ/DQoNCk5vLCBJIHdpbGwgcmVt
b3ZlIGl0IGluIG5leHQgdmVyc2lvbi4NCg0KPiANCj4gPiArI2luY2x1ZGUgPGxpbnV4L29mX2Fk
ZHJlc3MuaD4NCj4gDQo+IFdoZXJlIGRvIHlvdSB1c2UgaXQ/DQo+IA0KDQpObywgSSB3aWxsIHJl
bW92ZSBpdCBpbiBuZXh0IHZlcnNpb24uDQoNCj4gDQo+ID4gKyNpbmNsdWRlIDxsaW51eC9vZl9p
cnEuaD4NCj4gDQo+IFdoZXJlIGRvIHlvdSB1c2UgaXQ/DQo+IA0KDQpObywgSSB3aWxsIHJlbW92
ZSBpdCBpbiBuZXh0IHZlcnNpb24uDQoNCj4gDQo+ID4gKyNpbmNsdWRlIDxsaW51eC9vZl9wY2ku
aD4NCj4gDQo+IFdoZXJlIGRvIHlvdSB1c2UgaXQ/DQo+IA0KDQpObywgSSB3aWxsIHJlbW92ZSBp
dCBpbiBuZXh0IHZlcnNpb24uDQoNCj4gPiArI2luY2x1ZGUgPGxpbnV4L3BjaS5oPg0KPiA+ICsj
aW5jbHVkZSA8bGludXgvcmVnbWFwLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9yZXNldC5oPg0K
PiA+ICsjaW5jbHVkZSA8bGludXgvaXJxLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1
cHQuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L3dvcmtxdWV1ZS5oPg0KPiA+ICsjaW5jbHVkZSA8
bGludXgvZ3Bpby9jb25zdW1lci5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvYml0ZmllbGQuaD4N
Cj4gPiArI2luY2x1ZGUgPGxpbnV4L2Nsay5oPg0KPiA+ICsNCj4gDQo+IA0KPiANCj4gLi4uDQo+
IA0KPiA+ICsNCj4gPiArc3RhdGljIGludCBhc3BlZWRfcGNpZV9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KSB7DQo+ID4gKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2
Ow0KPiA+ICsJc3RydWN0IHBjaV9ob3N0X2JyaWRnZSAqaG9zdDsNCj4gPiArCXN0cnVjdCBhc3Bl
ZWRfcGNpZSAqcGNpZTsNCj4gPiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSA9IGRldi0+b2Zf
bm9kZTsNCj4gPiArCWNvbnN0IHZvaWQgKm1kID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKGRl
dik7DQo+IA0KPiBOb3Qgdm9pZCwgYnV0IHNwZWNpZmljIHR5cGUuIFRoaXMgaXMgbm90IEphdmFz
Y3JpcHQsIHdlIGhhdmUgaGVyZSB0eXBlcy4NCj4gDQoNCkFncmVlZC4NCkkgd2lsbCBhZGQgdGhp
cyB0eXBlIGluIG5leHQgdmVyc2lvbi4NCg0KPiA+ICsJaW50IGlycSwgcmV0Ow0KPiA+ICsNCj4g
PiArCWlmICghbWQpDQo+ID4gKwkJcmV0dXJuIC1FTk9ERVYNCg0KLi4uDQoNCj4gPiArDQo+ID4g
KwlpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOw0KPiA+ICsJaWYgKGlycSA8IDApDQo+
ID4gKwkJZ290byBlcnJfaXJxOw0KPiA+ICsNCj4gPiArCXJldCA9IGRldm1fcmVxdWVzdF9pcnEo
ZGV2LCBpcnEsIGFzcGVlZF9wY2llX2ludHJfaGFuZGxlciwgSVJRRl9TSEFSRUQsDQo+IGRldl9u
YW1lKGRldiksDQo+ID4gKwkJCSAgICAgICBwY2llKTsNCj4gPiArCWlmIChyZXQpDQo+ID4gKwkJ
Z290byBlcnJfaXJxOw0KPiA+ICsNCj4gPiArCXBjaWUtPmNsb2NrID0gY2xrX2dldChkZXYsIE5V
TEwpOw0KPiANCj4gSHVoLi4uDQo+IA0KPiA+ICsJaWYgKElTX0VSUihwY2llLT5jbG9jaykpDQo+
ID4gKwkJZ290byBlcnJfY2xrOw0KPiA+ICsJcmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKHBjaWUt
PmNsb2NrKTsNCj4gDQo+IGRldm1fY2xrX2dldF9lbmFibGVkLg0KPiANCg0KSSB3aWxsIGNoYW5n
ZSBpdCBpbiBuZXh0IHZlcnNpb24uDQoNCj4gPiArCWlmIChyZXQpDQo+ID4gKwkJZ290byBlcnJf
Y2xrX2VuYWJsZTsNCj4gPiArDQo+ID4gKwlyZXQgPSBwY2lfaG9zdF9wcm9iZShob3N0KTsNCj4g
PiArCWlmIChyZXQpDQo+ID4gKwkJZ290byBlcnJfY2xrX2VuYWJsZTsNCj4gPiArDQo+ID4gKwly
ZXR1cm4gMDsNCj4gPiArDQo+ID4gK2Vycl9jbGtfZW5hYmxlOg0KPiA+ICsJY2xrX3B1dChwY2ll
LT5jbG9jayk7DQo+ID4gK2Vycl9jbGs6DQo+ID4gK2Vycl9pcnE6DQo+ID4gKwlhc3BlZWRfcGNp
ZV9pcnFfZG9tYWluX2ZyZWUocGNpZSk7DQo+ID4gK2Vycl9pcnFfaW5pdDoNCj4gPiArZXJyX3Nl
dHVwOg0KPiA+ICsJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJGYWlsZWQgdG8gc2V0
dXAgUENJZSBSQ1xuIik7IH0NCj4gPiArDQo+ID4gK3N0YXRpYyB2b2lkIGFzcGVlZF9wY2llX3Jl
bW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KSB7DQo+ID4gKwlzdHJ1Y3QgYXNwZWVk
X3BjaWUgKnBjaWUgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsNCj4gPiArDQo+ID4gKwlp
ZiAocGNpZS0+Y2xvY2spIHsNCj4gPiArCQljbGtfZGlzYWJsZV91bnByZXBhcmUocGNpZS0+Y2xv
Y2spOw0KPiA+ICsJCWNsa19wdXQocGNpZS0+Y2xvY2spOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiAr
CXBjaV9zdG9wX3Jvb3RfYnVzKHBjaWUtPmhvc3QtPmJ1cyk7DQo+ID4gKwlwY2lfcmVtb3ZlX3Jv
b3RfYnVzKHBjaWUtPmhvc3QtPmJ1cyk7DQo+ID4gKwlhc3BlZWRfcGNpZV9pcnFfZG9tYWluX2Zy
ZWUocGNpZSk7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBzdHJ1Y3QgYXNwZWVkX3BjaWVf
cmNfcGxhdGZvcm0gcGNpZV9yY19hc3QyNjAwID0gew0KPiANCj4gVGhpcyBzaG91bGQgYmUgY29u
c3QuIFdoeSBpdCBjYW5ub3Q/DQo+IA0KDQpBZ3JlZWQuDQoNCj4gPiArCS5zZXR1cCA9IGFzcGVl
ZF9hc3QyNjAwX3NldHVwLA0KPiA+ICsJLnJlZ19pbnR4X2VuID0gMHgwNCwNCj4gPiArCS5yZWdf
aW50eF9zdHMgPSAweDA4LA0KPiA+ICsJLnJlZ19tc2lfZW4gPSAweDIwLA0KPiA+ICsJLnJlZ19t
c2lfc3RzID0gMHgyOCwNCj4gPiArfTsNCj4gPiArDQo+ID4gK3N0YXRpYyBzdHJ1Y3QgYXNwZWVk
X3BjaWVfcmNfcGxhdGZvcm0gcGNpZV9yY19hc3QyNzAwID0gew0KPiANCj4gVGhpcyBzaG91bGQg
YmUgY29uc3QuIFdoeSBpdCBjYW5ub3Q/DQo+IA0KDQpBZ3JlZWQuDQoNCj4gPiArCS5zZXR1cCA9
IGFzcGVlZF9hc3QyNzAwX3NldHVwLA0KPiA+ICsJLnJlZ19pbnR4X2VuID0gMHg0MCwNCj4gPiAr
CS5yZWdfaW50eF9zdHMgPSAweDQ4LA0KPiA+ICsJLnJlZ19tc2lfZW4gPSAweDUwLA0KPiA+ICsJ
LnJlZ19tc2lfc3RzID0gMHg1OCwNCj4gPiArfTsNCj4gPiArDQo+ID4gK3N0YXRpYyBjb25zdCBz
dHJ1Y3Qgb2ZfZGV2aWNlX2lkIGFzcGVlZF9wY2llX29mX21hdGNoW10gPSB7DQo+ID4gKwl7IC5j
b21wYXRpYmxlID0gImFzcGVlZCxhc3QyNjAwLXBjaWUiLCAuZGF0YSA9ICZwY2llX3JjX2FzdDI2
MDAgfSwNCj4gPiArCXsgLmNvbXBhdGlibGUgPSAiYXNwZWVkLGFzdDI3MDAtcGNpZSIsIC5kYXRh
ID0gJnBjaWVfcmNfYXN0MjcwMCB9LA0KPiA+ICsJe30NCj4gPiArfTsNCj4gPiArDQo+ID4gK3N0
YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGFzcGVlZF9wY2llX2RyaXZlciA9IHsNCj4gPiAr
CS5kcml2ZXIgPSB7DQo+ID4gKwkJLm5hbWUgPSAiYXNwZWVkLXBjaWUiLA0KPiA+ICsJCS5zdXBw
cmVzc19iaW5kX2F0dHJzID0gdHJ1ZSwNCj4gDQo+IFdoeT8NCj4gDQoNCkkgd2lsbCByZW1vdmUg
aXQgaW4gbmV4dCB2ZXJzaW9uLg0KDQo+ID4gKwkJLm9mX21hdGNoX3RhYmxlID0gYXNwZWVkX3Bj
aWVfb2ZfbWF0Y2gsDQo+ID4gKwl9LA0KPiA+ICsJLnByb2JlID0gYXNwZWVkX3BjaWVfcHJvYmUs
DQo+ID4gKwkucmVtb3ZlID0gYXNwZWVkX3BjaWVfcmVtb3ZlLA0KPiANCj4gU28gaG93IGV4YWN0
bHkgcmVtb3ZlIGNhbiBiZSB0cmlnZ2VyZWQ/DQo+IA0KDQpBZ3JlZWQuDQpJIHRoaW5rIGl0IG1h
eSBiZSB0cmlnZ2VyZWQgd2hlbiByZWJvb3RpbmcuDQpJIHdpbGwgcmVtb3ZlIGl0IGluIG5leHQg
dmVyc2lvbi4NCg0KVGhhbmtzLA0KSmFja3kNCg0K

