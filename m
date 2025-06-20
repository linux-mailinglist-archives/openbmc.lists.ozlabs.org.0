Return-Path: <openbmc+bounces-270-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E43AE26FA
	for <lists+openbmc@lfdr.de>; Sat, 21 Jun 2025 04:07:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bPHl10YT2z30hF;
	Sat, 21 Jun 2025 12:06:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c40f::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750407679;
	cv=pass; b=XtZZtervaNbhQwlzcsKcFDwbdZRc9hjKJ6LBLNgnQQ+m/uJFXQLaXa9iVl/GcgPlmVCAC97Lpj2cXrTyiNdfjMtNzL8cWbdOrzj4gJu92Ui9P4IVRsS4V2O+K20vWjgaqkvHle8n0I5OB7T8mPGdhA6JCPZv00Y9Q3qwSItmh3/bovtFRBeMageq6knCoaASTmC26SkrlNHzFHWIjYtzyNX0KCHaGJq0d4QzoPNbU3v2Ey7DdkRZODMjSDWHZfP8+72PvhgLrJl4fXO7Gyhh5ypv6Q2TXN5rs42PCPBhswfTSWVunsOTKlbYDnnB6EtIf5+8JjYcckRv9GGLbv/SRw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750407679; c=relaxed/relaxed;
	bh=PKDpQwpKyAzHEQKECHwhTpmlUSCVxML/oADdqi/+5u8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fanNmkCt2H+YeyKwfr1Pu3BGwffDHkO42+w00058dN2XNBgciyJtVdIKdTScbbr+T4/rpgUzCks+TWsK3b37cLARUc2viG2RqrsmC0i6MlNKPXqVXKmoFHwaqwDTgarb2zQ7XX9lKQcvPLTT/J07zVd3MrhblGFxLXwF2ZOC0k1WZhwdOsGYDfHrLeuNqcnXn3FCiTFkCPg5Zqogj04sd2LIwNSt5Cq/3plXHvVeyXhR3DKoOI07LenU2Ahsx+MuX0QOGofZacsp2ue7CAmeV+jHOPgM/1EJIGMWeC/kkusCho4K2KGkj3Tn6BLRRA4uKKZ7v+hMCPzJxCGfdA7eOg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=pBQpwnii; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c40f::7; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=pBQpwnii;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c40f::7; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c40f::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNr6633tDz2yYJ;
	Fri, 20 Jun 2025 18:21:18 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lgUrVAWv3C/HZYfe0yhSYjUONLhFD+IwKbQaZLbOp3m1pp3dhCfI1961++plLErnq6AWqxZ+88KlBCIasxhaVOUSKvpMcwmSXF+X/LV4fLpBAOoUwuewJj5Xt+1Us1VdCeP7R9rP2QDevtF0I5umD/hxFu3v1RTyTvSKWvk7KWn/iJRR9K+pUTKDxwEkpRem0NvPp6mG7L2q2rSdtgSIQQLNwW9lOuZRk1hQkGRwBizNs43lIOYZJ5LPxzirNSPrLB4EMrEryPMTG/Isy+9+pLBBlFSD3Hc0tyMh8z75RNNj+s+RuhGzyPK9ZyqxrRvkT0/VWFmDQlXSy7OMD16kxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKDpQwpKyAzHEQKECHwhTpmlUSCVxML/oADdqi/+5u8=;
 b=LjvP1Lxm70/jxBG5MG8G8Y3iduSjy6b5FV7Boa3jql6cOfNuAxKgQgNxqYmanmeiStYRyfAKZNFwLfWKjz5cqzjzUfQqDZ+1LKfkceP+KES9URHHdYvPmIxxhWKV+MlQwJqT+V5RUUptx4kOmwAKJKmkuxKWb13qxFqpxB2EJd1dtToKk7kk1nH/a/ae9X7RCUJEOVH/oZmxikg6EF0u3U05YSb0iAe6a0QNSGlVMToU4/r1iiu/tGxnk5I+mUxj33EMt49GRUFDHVkb1hsgILCZKd//4mnXlb0bn/LWv1VCJW0koOBTMd7cFgF8MSPyOvxRPK1p5TSNObf+RuTu9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKDpQwpKyAzHEQKECHwhTpmlUSCVxML/oADdqi/+5u8=;
 b=pBQpwniirRtciV1qOBEYc8fBg9SbgiAM4FxiOzxinG75ZkAtW+5jJO+IVRxtr/yKt1oKsAZpyGwnOUD425WpNRfQIKMaSsIHee++aKHYRgwevMQxUxuMJUdazIv/0HuwueXFBtpipsuFXBXPq3RNAnH3Q0ecsYwnTxM2uiiPhhxTLvsr7V3e1Fm4EajrdG+pXPoylK+CbYMhtHfCQ46ThwcWWngRpoDL/wAecpy44AAC8x7Z7S6aNh6x6DSpwpuj7ilYSUFARbPZ1dkTYT3642RV9De2EupCtghAvNViLwSlYFD2ax1t3rZ9olpsR+Z9pba0X7V6UyZYJTErI2uFrA==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by TYZPR06MB7142.apcprd06.prod.outlook.com (2603:1096:405:b4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Fri, 20 Jun
 2025 08:20:54 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%5]) with mapi id 15.20.8835.027; Fri, 20 Jun 2025
 08:20:54 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, "bhelgaas@google.com"
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
 =?utf-8?B?5Zue6KaGOiBbUEFUQ0ggMC83XSBBZGQgQVNQRUVEIFBDSWUgUm9vdCBDb21w?=
 =?utf-8?Q?lex_support?=
Thread-Topic: [PATCH 0/7] Add ASPEED PCIe Root Complex support
Thread-Index: AQHb3BN2vR6oymJpE02QgNNVwAb5JrQA0AqAgArurhA=
Date: Fri, 20 Jun 2025 08:20:54 +0000
Message-ID:
 <SEYPR06MB513414A5AE38EE6749A2902C9D7CA@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20250613033001.3153637-1-jacky_chou@aspeedtech.com>
 <7178e816-4cb4-49b3-9a1e-1ecd4caa43ed@linaro.org>
In-Reply-To: <7178e816-4cb4-49b3-9a1e-1ecd4caa43ed@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|TYZPR06MB7142:EE_
x-ms-office365-filtering-correlation-id: 58f77e9e-224a-4639-a843-08ddafd3604e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NUF5cy9PUlZvdll3Z2duQi9xS21WMUEydmhnMXNYYi8zU0pBa2crSjVyWHha?=
 =?utf-8?B?OXpxN0dmYmMzekF5VFNuQjV4cjRpcmN4YVRWcTEwVEo3L0ZzOHlNWlJ0bFAr?=
 =?utf-8?B?ZUVqMlNuZTJDUDlEczlKMW1VandwOW1KSkcxL3B3RVZrYkpUWEg1SVYzMlc1?=
 =?utf-8?B?TEVTdFFVV24vSGRkcjQwbURMZVNvdG4rMmpYRlMxdG9YeWNJQjRCOS9CZnZm?=
 =?utf-8?B?dkxsY3Vhc2c4SmlWR3AzMzIxQXFaZlpZaUtTQ1oyQXpvVGtFSVRBdE1IU3Rp?=
 =?utf-8?B?SzN1TmorMmE5RlJXZWtuZ0hxR2lJbkxybTlqbjhvTFJhMC9iS0x3dUsvRTRz?=
 =?utf-8?B?WGc1cE43NnlaMGJGNW5ldC9QN2dVMzhyN3VWUzVMaU1SM08zSnExM3ZhQWkz?=
 =?utf-8?B?bkVpM3dZYVJZbFBvVHNNRHNOOUdGYjlrbTEzZDFRVVFJQ0FPaWk3TkVCT3FZ?=
 =?utf-8?B?ODFPZ3JscXFUNWVEcFFRZzZ0R09XMzBmYUFuWjRscG9iRERpbEpYNFhpWW9S?=
 =?utf-8?B?NmNqekJ5T2I5Um83NGRINk4xWDRrWkwwYkNHR0M1NkdpZFJyNnRWRmxJTC8r?=
 =?utf-8?B?SjQ3YlVibVVXc2lJcjgwR3ZLbEhRVmJMeWphK09YQXRwUFhEYVpvOXUxL3RL?=
 =?utf-8?B?WGlNM3JYSEJwc0w3MWlZbC9iYlJjdlBVZ3hiTzlZYjdnU1VpSVZUaTYxNDIz?=
 =?utf-8?B?V2FVVzN6dUROT3ljMDc1WldKS0RjdjM1LzFTSXV4ZmVTS0pqZ3k5MnlIcDJy?=
 =?utf-8?B?ZGtwNlRYN1NaTUlnNkVaYkgrWC9FWG4ySTZwNERzeVV3cFJVZHVaQnVUWHJx?=
 =?utf-8?B?QnY2L0dxYU02K2pqdGJaZHhNczR6dEVTUkxBYXhsSHF6aUNaNWEySkZhbDJH?=
 =?utf-8?B?OVZiSDNBYmc0bzc4NUZ6ellnMnpkR0dBbXdWYlFSclBtLzlJbTRNR2RtYjMz?=
 =?utf-8?B?aWdOSCtnV0FTTW5HWFNWRERITER3aDNkblVDQ3MzNFlpV2ZvZmJvdVhtNFhi?=
 =?utf-8?B?QmVBOUNjSHpIS0pQdTh1bVpBREdMaXRQM2UyRnZPeG82ZThEam1ZRUwycjIy?=
 =?utf-8?B?Mk54bzZ6WGIvc3pFRUMwSG1pTE1CR1l4VUl5SVZoTWtkZHc3MUlZbm02NXNl?=
 =?utf-8?B?azBQc1lSTE1jTzRpTEIrbURXQk5KSUhmUEZ4YzRRTVEyL3JvZ2prL204S1la?=
 =?utf-8?B?QW50Y1pSNWg3dzdlY2ZLdS9DcjM4VkNCWEtYa3I4alFzNnNSR3g2TVozUmt3?=
 =?utf-8?B?MW0xclpXNGp6cExVUVo1VUNWdjFVVWEveTN1bVh2YXR4SVVoTC80RWl2dExv?=
 =?utf-8?B?QmFQVm8ycXJTK1NIZEJ0eTN1WVhxbmFiZXAyRVZHQ3g3Y25lbS93Q2c0REVP?=
 =?utf-8?B?Z3NDblpaTjFPZkJlSXU1MWhOU0g3OTBtRk44QTlTSEZLdytyYXcvc3lOZlhR?=
 =?utf-8?B?ZHBieVQyeE9QRDc4amFGNUI4SzJ6TWdWV2RsNkFBcmROOUduUHZjTVluTDRh?=
 =?utf-8?B?ZkhwVWdGeEljZVZ6U1BtWHVpajlDWVZKak01L3RNdUJ0Ty9ibDdXUWdaM3lr?=
 =?utf-8?B?bmppaXRBcjVyNnBqZUNjUnpiMnF3dVl4MC9BczZkNTFVMG4zKzZNOHUxUUh5?=
 =?utf-8?B?RmRqdjJyWGd2N3Y3SFBCRWJpWU5yb2EwQktRR2ZGdUVDWHBiODQ0WTlsSWRK?=
 =?utf-8?B?WUR5V3NuZDRFbGthQkV6VXMrTGsxZW52VmsrQTJZUGlUUTI4TjNSblBZWHIw?=
 =?utf-8?B?M2kwSDFEZU5yMldlYmdDSDdBZW5wZUdsS0FaRWF4QVhPKzZWVm9hYWc2ZDVh?=
 =?utf-8?B?RlhtZHlGMVdQNWZDRkR2ejZFUWQzZ3ZrT2NYU2Z3VE5EMWRPRmxGQ2FYK0tZ?=
 =?utf-8?B?c09wK040dXgyR25Wa2JEUjdjK1VJUWJqZHpDUjNYckJvMmRZelNDYVhoR0t5?=
 =?utf-8?B?ZHFNbE9wb0ZCb2hna09QSmRaNS9YR1djTUhtM1o1ZUJrV3J1QnVCSFdxeVZR?=
 =?utf-8?Q?VkwbhRjJTy0Es8AwHZSiR8k2vdiShs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cUJoTDVIQ0JYZm83Ujg3dTVhQ3IrRE02YVRkcEJoOVBQQS9nd1BNVk9nTDF1?=
 =?utf-8?B?aUF1UThOVk96SGtnWkwwaTlzalYzU1dEU3RlUUVtam1yYWc0Sk1NdGIwYmQ3?=
 =?utf-8?B?RCtXekpwNjNKc25uOFBaNk1lVnNqRVRoWXpIVHJZUzJNU280U1pyNSttSTVZ?=
 =?utf-8?B?SkNha2RiZmtsOHVtbWt5eVdJVXNhUTdtNHJKemdRdGN3ZXZ5bktncWFLaXZk?=
 =?utf-8?B?RjdTTG9pRGQ0M3hiaTc2WHVsK1JpNGlFQXlJa1ZYTlVzUEVWYkFtMTV1NHFG?=
 =?utf-8?B?THJ4UjEyTFNXZjQ1K1FuYk54a0NFRUFKU01xMFpEZnVGOGRLSU0ya0NIcGV0?=
 =?utf-8?B?WFZQbUxMRGxiVkRwckxXSDdsczBnOUlDSHhlaUFlWTNVbHdrMkd1eitENnV4?=
 =?utf-8?B?a2VkYm8wSnMreWVHUEdlWWE3M2RHQWVoZGlNZzE0Rm04ZlZiMHpkZGNpTzQ0?=
 =?utf-8?B?Tmc0ZGFIblhTS1NYM1d1dkJzcVBrVGpwQVQvNWhOakxBakhYc0k4OGErblhZ?=
 =?utf-8?B?di9JUTJYcCsrK0RMeXVEMzNxTmdpTWpUNGFtdjYxb3RCWmxPVnA5UFRKOFBG?=
 =?utf-8?B?bnFqVlAvSkhmU1RHTEtXTW9kUk1iVjRjakFIZTh0aXlpUksvaTZpYXZhRXN6?=
 =?utf-8?B?NktJdmhLYmFpRkZqQ0Q5d2JVL240SDlSaWhiaExROGlsUk1iREdFR2JDT1VM?=
 =?utf-8?B?SDFJeWxjdFk5Q2V1ekxhNGtQQkE1QXF4SkovdHFwYkdHUWx0MmpWRWwrSktV?=
 =?utf-8?B?TXh1bzlSd0J1aEh4NHlOUzJGd2dwY3RhWlZOWHJKQlR4K1hTUzREYXp1U0NL?=
 =?utf-8?B?WWw3RTI2T0IxdHY0eGZuQnFxRFRiK0h1VDBtZGpFTXpzMzBoL2JCNE8yU2Qz?=
 =?utf-8?B?T2JHMVJPQVZ3dk5qVnFSTWFkV1oyL0o5QlNRaXd0U0ZubnRFc0RlMWpNaDBM?=
 =?utf-8?B?WWRsY0FyMllsYzZ4UDNtT1ZUeGNmRjJRQnpNV2IrVGFpZGs2bFF6TmFZNm11?=
 =?utf-8?B?ME9nZ3hBYTFxd3E4cWhSMGpPVUpIYjdTdWxCV3YzRDhGdEhlR1BBQXV2NnZN?=
 =?utf-8?B?cDMzem5wc3E4bUxPUHZjbDAvMEo3K0ZyUUxpRDBxSlZ1V2tJUElMMCtzUXl2?=
 =?utf-8?B?bGdERTdMd1YxeTF6TTd4U2hWSDhoZ1N1cU1XczNsRS8vNDNSTHZjYVlxbFJ6?=
 =?utf-8?B?UnQxL0FvSGMzTFlvQWNVZEtWNHh3S3FhSDRzYy9OS1pYbTRTWEtiNnc2Z0Nj?=
 =?utf-8?B?eUVYOFBIUGxydERaZG1ZVFowNnY3S3dTK1hmM3hIR1NRaGd4ZENMd0E2UDdL?=
 =?utf-8?B?V1lOVnN6TEYyRE1PYXNXajM1RVBaTVZlNHFLUDNqaVJyRUVyZTUrVEZBLzRV?=
 =?utf-8?B?ek5ZQzY1NE9TQzZoaE9EbjdSMVNURUNFVzhYTkdmQ2xFUjBCV1YxeEplaDhO?=
 =?utf-8?B?RlRZTWJ6Y2gvNUNtTVB6TVhqbkl6cEhQRDNINS9XVnZoeHNtUVRmd0xQaXBT?=
 =?utf-8?B?d2hMeFhJQ3NnelRXcWN6SVNNdEJ5RjNzMkRPZlB5Q0x3WVhBUDNLK3Y1Rnhu?=
 =?utf-8?B?akJmb1VWMWpma0dxdjZLSVp1WjNaZENPcE56OGk1Tm1lZ0Z0dFovL1RaS08z?=
 =?utf-8?B?aXBGdllmZFBJZU1jMWJsL3lWUVAvZ0N2TzhpMzk0M0JET3pMNTdwV1ptSEVD?=
 =?utf-8?B?ckZOTmFqSGQrUUhjbE5BY1pJeXpPVFJzc3VDd0t4VWVRRkI4Uy9FNUw0bys4?=
 =?utf-8?B?dmgzYUFwZVVHR05tdHAzZmZPY0NBY04vMUZvaklaSm1jUzMrT0t4VENkOENM?=
 =?utf-8?B?ZzhLV3pCQ1ZCMCtmZXhTSjd3WXZFcVh2aERuZ25jUElIeElxMDRHZk1tMXc0?=
 =?utf-8?B?TEZUbjdyRHpiS08zWjZoL09hN3hjbCtlNGphaEZHWVBDU2NoUzNFUjdMYWh3?=
 =?utf-8?B?RWszUkJlNXNBSHE1NEQyb0RLVTNKZDdYV0JYNUpHRVZ2QUpKZDhqazlhK1VG?=
 =?utf-8?B?b0VhalpHZlNnVW9ZSUFqUGlHT0prbUNxbjcwUFY1UkF1TkdkSVY0M1lKR3Fq?=
 =?utf-8?B?V01HK2xEQ2Ywdmp2NEhLL3lUaVIvK0lGTmQ3cmFBVEczbndJRVlXL0ZiSjEr?=
 =?utf-8?Q?bqqnXNsiJdt37tPG0AkENlsXd?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 58f77e9e-224a-4639-a843-08ddafd3604e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2025 08:20:54.4545
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2mrWfXrO/UW9hflFx45doOZvkShUldYfXXdW0b4WFAdJITZSgxZAPWj8dzpyv8Rlk6+9+cNdPoWn01Oz1d0l6SvUC2TV1U78ENw+KkLA1JU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7142
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiA+IFRoaXMgc2VyaWVzIGhhcyBiZWVuIHRlc3RlZCBvbiBBU1QyNjAwL0FTVDI3MDAgcGxhdGZv
cm1zIGFuZCBlbmFibGVzDQo+ID4gUENJZSBkZXZpY2UgZW51bWVyYXRpb24gYW5kIG9wZXJhdGlv
bi4NCj4gPg0KPiA+IEZlZWRiYWNrIGFuZCByZXZpZXcgYXJlIHdlbGNvbWUuDQo+IA0KPiBTbyBp
dCBzZWVtcyBhbGwgUENJZSBSQyBjb2RlIGlzIGJ1bmRsZWQgaW4gYSBzaW5nbGUgZHJpdmVyIGFu
ZCB0aGVyZSdzIG5vIFBDSWUNCj4gUEhZIGRyaXZlciBjb2RlLCBpcyB0aGVyZSBhIHJlYXNvbiBm
b3IgdGhhdCA/IElmIHllcyBJIHRoaW5rIGl0IHNob3VsZCBiZSBkZXNjcmliZWQNCj4gaW4gdGhl
IGNvdmVyIGxldHRlci4NCj4gDQoNClllcywgYmVjYXVzZSBvdXIgZGVzaWduIGluY2x1ZGVzIHRo
ZSBQQ0llIFJDIGFuZCB0aGUgUENJZSBFUHMuDQpUaGUgdHdvIGZ1bmN0aW9ucyB1c2UgdGhlIHNh
bWUgUENJZSBQSFkgYW5kIGFyZSBtdXR1YWxseSBleGNsdXNpdmUuDQpBbmQgdGhlcmUgYXJlIGRp
ZmZlcmVudCBjb25maWd1cmF0aW9ucyBvbiBSQyBhbmQgRVAuDQpUaGVyZWZvcmUsIHdlIGRvIG5v
dCB1c2UgYSBwaHkgZHJpdmVyIHRvIGNvbmZpZ3VyZSBvdXIgUENJZSBidXQgdXNlIA0KdGhlIHBo
YW5kbGUgb2YgcGh5IHN5c2NvbiB0byBzZXQgdGhlIFJDIGFuZCBFUCBkcml2ZXJzIHNlcGFyYXRl
bHkuDQoNCkkgd2lsbCBhZGQgbW9yZSBkZXNjcmlwdGlvbiBpbiBuZXh0IHZlcnNpb24uDQoNClRo
YW5rcywNCkphY2t5DQoNCg==

