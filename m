Return-Path: <openbmc+bounces-296-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB55BAE93BD
	for <lists+openbmc@lfdr.de>; Thu, 26 Jun 2025 03:31:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSLkH0FKgz30BG;
	Thu, 26 Jun 2025 11:31:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c406::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750840361;
	cv=pass; b=Vp0RsZVDulFk4lz5HR93NDIp7RxPQRccuajhMIlelybe111B0W01ViTITsPSEFBXxaiIvv7O7vQKN1upZnlk2gxP8PzFMvNhnylgXGqbMAJP+rx2nI2xyCpzP1wNaCcm06BU60sIMXLeWSL98o+RIYt/NB+9aQn5FQD26qAxrndURXYT3tQrkFKSrLR6LJaPGq/UGjH3ddbR+3+SbZSZKWyRim0kufNM0y+cq/vALKTAINXSOnHvg1eP/wK8/gUDW8GeoK3z4/D/xEKUDI8W/QTXgrACNwstDQfvH7w5Zz3FZxXwfWhFIq1kz++GJTF3t/3ooCmH4XynlVtf2DQFMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750840361; c=relaxed/relaxed;
	bh=Qitvdw7y71M0si5J6Xr4PF4TX/okXwb+cexPgZIERK4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CfOw32p2aF++ME1ovqw1iWH6PMJT2ptreHKEwhmiQ5u9IxMdFGxCiu/h4wME6zwk4TjABMx3BYB0LHzXuso4lh0LZ/tdDWIpa8cR1Z/XOza+XWgDlE5CIZ4zhC/HkK4gzckpMP9gNf1VMXhhZpsbIZfUU/jJyJZUS/qTC6BecCzKfkt76p3Vm1nhOZfPHIMy6UMs3kji+LDhXM3mDbV6ZhZmFFzj4h3CZxJKv5hRnoVdFQeYl0NVyi+GYNTSBxn2WTKaOsxH2d+EPYYhIJRxFtFTVOiBv5opR4dEH979f1P+swDnD5rSNlZtKNGZVLyP7qkde5aLrUZO9s6aWtgnpQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=M/LgXsOK; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=M/LgXsOK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c406::3; helo=os8pr02cu002.outbound.protection.outlook.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazlp170120003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c406::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRw6v64DMz2yKq;
	Wed, 25 Jun 2025 18:32:39 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RqTufMNnpvFJzqR8eFTf22BzOXJ+V4K4o24NsiVcp7FtzBI2wB7Ugn2mnpqVF5+PnxfMIhK4tCfa4OC+2d+etVQrqi4M6paTf+qyDl8idxCiIWXkvFqx101QJ2TjaMh0ou73a3m5X0M4aD2yPvQwXs4igKrYJMnj1bWsa82F4crZymBKoiAceRgd8FesIpluqP2GJg8Ip606XDEAq3zYg0zJ0CwMN7c1cBzw0ZIwKM9BDyHU+Nv69KQovyFsNmaDQrsepQPpSyzAaqjcZc9m1uX0OjGd9hMhaQisXSW6FHG+BDOQHasJgytVGO8QlrTSBE1ZfdrqJ/77LgIOtnNAFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qitvdw7y71M0si5J6Xr4PF4TX/okXwb+cexPgZIERK4=;
 b=R4T4TxweD5HOh3QtLPl1FKkmQEX/adybRQM7US3f5ZQbnYdaqviCeb9V31K/ve0WlKNCSDx8jvnowI0vmXGoKjWK0lwqHE9ew0mreMpmBp/+685+lIg1O874JFLm2zr4nXA7y/DSnjKxUeSW3CCNHLreA+s2VQYz8xzL9pT0g07s9DlaBKvrq6CHDklf8ylnPqngcXYIJ6opktqS3DOHXK7F7/yHflQe770Rhibn29KTOkMzbQVRxRNOk2ibohQExOQgOWK0mFOsRXOEwWceQipyaz9LlboAHe6VEje7hLe34L0CDUDlR5WAe/IdvZrVUm5Yu6UGnxseJP6vdfwdKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qitvdw7y71M0si5J6Xr4PF4TX/okXwb+cexPgZIERK4=;
 b=M/LgXsOKA3OUjYd8n/NbrC6phJ4JTSLsczQ7ZQ65i0GB5SY2u5/YS8yiUtYXb8I63bqfezZWpbzyx/LtilxevlmdAdQHliNmnRUjYseBFwHueAuowL9P/vycN4sUZgYblBB1JqJjpNcG3skCrZPywtimYxH6mU1HkcHmM47O0/kPM4wM0t1YHPCo7CJbCq6+x2fNr4zGJarQ8izc3fVgd25khQ/OaG+A3B0DQpy3aYLJNc1NnGDgb3L01jZZNP8zgbh39a5KyeeM2Lhve+7OhYryyVJKVGYuFL934yctvUFFcOhfHhKECSCKUimWEAxuTrf8JxhjeobZRgWQgkdrfw==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by SEYPR06MB6130.apcprd06.prod.outlook.com (2603:1096:101:db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 08:32:14 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%5]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 08:32:14 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: =?utf-8?B?SWxwbyBKw6RydmluZW4=?= <ilpo.jarvinen@linux.intel.com>,
	"bhelgaas@google.com" <bhelgaas@google.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"vkoul@kernel.org" <vkoul@kernel.org>, "kishon@kernel.org"
	<kishon@kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"elbadrym@google.com" <elbadrym@google.com>, "romlem@google.com"
	<romlem@google.com>, "anhphan@google.com" <anhphan@google.com>,
	"wak@google.com" <wak@google.com>, "yuxiaozhang@google.com"
	<yuxiaozhang@google.com>, BMC-SW <BMC-SW@aspeedtech.com>
Subject:
 =?utf-8?B?5Zue6KaGOiBbUEFUQ0ggNy83XSBwY2k6IGFzcGVlZDogQWRkIEFTUEVFRCBQ?=
 =?utf-8?Q?CIe_host_controller_driver?=
Thread-Topic: [PATCH 7/7] pci: aspeed: Add ASPEED PCIe host controller driver
Thread-Index: AQHb3BN5QYkLFJ4SFk66wBBeIABUJbQA/lGAgA8cdnCAAmnUAIABGaYQ
Date: Wed, 25 Jun 2025 08:32:13 +0000
Message-ID:
 <SEYPR06MB5134003D5FA55835C9A5537E9D7BA@SEYPR06MB5134.apcprd06.prod.outlook.com>
References:
 <SEYPR06MB5134973F678EB5B163DD50809D79A@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <20250624154058.GA1478094@bhelgaas>
In-Reply-To: <20250624154058.GA1478094@bhelgaas>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|SEYPR06MB6130:EE_
x-ms-office365-filtering-correlation-id: f725c3ef-6f6a-4e3e-4b1a-08ddb3c2c969
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SnlRVzZyaG81cFdWUmVlVFlYWFlzQ2szZGhsYm5ubS9xVHdUNGlpTFZCVzZ3?=
 =?utf-8?B?dXRLbkk3WEQxcjNBTitpMGVWSzN0NU93cWttbHh5dlZqdjA1Q1F1YmkxdjJP?=
 =?utf-8?B?WHlJNEllcEtLU3FxSFhDS2tXeUNnVUROWHJ6ak1WaTY2QXZUTVFCcm9tMzNX?=
 =?utf-8?B?TlJkVno1ZVJQM0xVV21FOGcwMEN6d0hwNWdrWFZJUU5ZTy9haVZ1NC93WUo1?=
 =?utf-8?B?M3RHOFNiRWM3SlNYQW5EWkZ0QUIxU3loTnVnRnlQeWlsejlYcTB0SEFnMWVW?=
 =?utf-8?B?SFRENlI1ZDE0bnhZOEMvWEk3eVBCVDRranFIQ1pmQTlFV3g0ZEYwamJmMmZa?=
 =?utf-8?B?dzBoQ0RUQktSVTdmZVVib0o2OFUwMEVqTDZwUTB4dWE5Ti9JN3VrNy9DOG5z?=
 =?utf-8?B?b05aNFluSTFiaCt3cUtiRFFFZFpyTDZJS2tIeWt0STlKTmR6L1BKYU5Oa2NL?=
 =?utf-8?B?RnhHZnlnS2ZKdTR5L0J4amdnK01BR2pJdTZCdVBrWjFqVnZRMDliNnZrN0N2?=
 =?utf-8?B?T0IxSStuVm9ydlVSTHp4L29rQks1QmdZc2hacjg0VDBvMFBWRGx5ejh6d2M4?=
 =?utf-8?B?ZzFWVDNoMFd6SVhrMGRZbm5wK2hjb29jNUVpaE9TZmZkSVJTUEdVcXFnSUFO?=
 =?utf-8?B?cFpPazNDNjE2TFNZdUsrN1A5eTZ6NlBXVVNBM1lCU1gwVWp2dG13V2JIbS9m?=
 =?utf-8?B?MXI5NmpJbXJGUHIzYnBYTTNLcE1EWTRkektEcHo2UWVQSEJaNXUxS3E3Nkh2?=
 =?utf-8?B?QU94UmhWNUY5ZmV4M2x1aThzSVI0MTdpejZyRUVYNHBMMEVUVHU3YlNXUUtG?=
 =?utf-8?B?WGxRd1VCdUpuNHMrMFpka0dtMWFCWFFGUmRXOWFBRFpBK3g2MG1Ub0dnYzVP?=
 =?utf-8?B?T2FhYXViOHR5anE4TFNLV3hGUVh5Q2ZHb0oxRTJoTVJXMG1rZEx2N3pIWHBD?=
 =?utf-8?B?WWNBNUZURHlkL1VQb2dxaTE4RGUvSk0zOXJNWUE5ak5jaFp5TW5sOWRsR3lt?=
 =?utf-8?B?MnhFOXFvSEpZQ2ZOZFhaSkJQaDd4MFRhN2F5QWQvZGdqdW1HcFc2Nm1TbWgy?=
 =?utf-8?B?dGp6aHg2K0lUb2tacVJjWHhXN1Jod256a3N4U2d1L3lnQ0ZBeDZsNGhhVjlJ?=
 =?utf-8?B?UmpONGg2OW5QS2QwWXRJVmc0eUt5eVdDd3N5YmNLb0RmaHplTk5XbWo3aWQw?=
 =?utf-8?B?K3QrZjFIb3dxQzArak05QzdQYm1OOUhHTWZuWkVRcDJjYU0vVlVxeWVGdzRj?=
 =?utf-8?B?Y0hkL3FBZzFWb09Wb05pT2xjcFhXRDBWb3FjcmlDb3ltN0xycjBMamppWjJH?=
 =?utf-8?B?WklGbWZiMktTWHdpZm1XV2ZSNVFFOHVFTWpibjJQbXN5MHRnSzl4SmFJc0tD?=
 =?utf-8?B?Wlh3VnE5OW9tKzM3Ukp2YXNVS1BINGVrOXRNRm05OWoyOURLaGs4UkFRUHlv?=
 =?utf-8?B?Q2REMnZ6SmRZNnVseG9RUE0vU3FpL2FPMlNnZlBPU1RKNTdaWTdPMklaemlu?=
 =?utf-8?B?MFkvYmdmYUp1bmRtYkMwTC9TejB3K245SDhKbEthUzAyR1ZOeXpncjVvcWdk?=
 =?utf-8?B?eGIvd21PdEE3K0E3N3dDM1Z1emx0aXBtQ3FkL2xmWXZNUlBDeVhnMnhvYVZa?=
 =?utf-8?B?WXBGeDJlUmw5YjI3QkFGRURBSUtvMk9acUZJT2pMdXovOWkyejZkUWxiNGFM?=
 =?utf-8?B?ZCtUN0NnK29nUy9pRVAxbTdsbGkwQ1dQWFFIRVk0azdQZjNSdTFuUzRXZUlE?=
 =?utf-8?B?MjNQVEhBbCszN2RZc2IzZUJjOGdUZGtvTDREWi9IYU5ZRUxGS3RRandnMU9P?=
 =?utf-8?B?Q2R0czZhQjFzcy9vMS85SVZtbElPQmFJQVpYMVNBakt5dFM0T2hYSmN2Nkt4?=
 =?utf-8?B?cHNEaDhkNE54eFFpQWxGbzVPMXp1U3Z0a0xZTHBtY0VxNnJHTXhCS1lQWUt2?=
 =?utf-8?B?UWhSbnBDa3ZnWHpSWU5McjZNcFRON00wZDB2L1lBaEJaS0xscnZnTzNTOWdK?=
 =?utf-8?B?Si9GdHhZcGFBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZWE1bmlnamhFKy9lSmZSYktFWlpGVi91L3JycWs2Z1dQQkl6b1pVclJNdlpM?=
 =?utf-8?B?bFQ2NWFXSCtJam1HVGx2bFpNaGRMaGh6aGprU1JSeTVpcUVaQzdremF4N2Ev?=
 =?utf-8?B?d1FMMVowbDJHdStsRFF3ZG5QZjdNVy9Gck5VV1UvUy9COGRKSVZOd1o2T1Q3?=
 =?utf-8?B?SGluWFB2WXNkenUrSDUxK0ZxVU14RzB6NHJ5emRXYmUrbERHOGw5SHM1dEls?=
 =?utf-8?B?VFRNd2xhVm1ic1lvckpxQ25tdXAyUW1XUUtYellaUXh6MDhEOXlWRW9CWnZX?=
 =?utf-8?B?Vmp6czZFcjdXZTNSNnNqc041V01xQzBkYVc5TmEwb3NETVExdjJvZFF5S1Uw?=
 =?utf-8?B?RWozaGI4WGdiT1psUFlOT1hJRkgyOEZScnlEMThZa2xvZHFMNU5lcENVbU5q?=
 =?utf-8?B?VjNTY1RkU3NKSGxlRGkzaFJsMTluV25XVUhkTXp6eXlWbVNSQmxta2I0KzlZ?=
 =?utf-8?B?aCtGUnZMRFR0R2dqMjhtME1DUmpQYy9ZaDZQNWg4VWpoQ3BnNnpmWHZFaGhB?=
 =?utf-8?B?VVQ2eVpYTWJWdXJaeXRCY05ERnh6YTAzTTYxVjdCTlFOSnhTYThpa25xN1ZC?=
 =?utf-8?B?K05MN1BZanYwcDViM0c5VE9wczZHNmJaVXQwSEppRHFKbHdzTEp2RURHcW5P?=
 =?utf-8?B?UHllVkUwVlZqUHFlWk5meW8xb2I3NkhoK2tQWXZ1T05BbTNTT3NnVVJGWXBu?=
 =?utf-8?B?R1VLR3JVd1c0K3ZtaDZVYkNpMzFGY2hlMi85ZU5oUVpGY0grMWxEZDFlZzRm?=
 =?utf-8?B?MnJmK0RONjlNUWtzcnRqZGd0bXNvZVJaL0dIbFlsb2FzNnM1WFJEL3ZSZUt2?=
 =?utf-8?B?aW44WmkzV1l0dnZReU8vYkJYZWwyUFdDck5ZN3VpMTlYeThmQUwwd2l1M0lL?=
 =?utf-8?B?Rm51WDAyNnpZNjNXMUhPUHNQQlZ4NWtUYU10OXF3V1lNS21uMVIvNVZoL0ZO?=
 =?utf-8?B?TmdUSEZTYnkyNm1VWVpLdVBWdkh6RlFORCtWaTRXdEIrNi9vdldlbDdXY3l0?=
 =?utf-8?B?UGpiZnJablhSMk9IWk1XSkNrRzUyWGxiK2pCdmtycTc1ZitENHZ2dDU3Nkpz?=
 =?utf-8?B?WXdYdFQyeTN4Y2tnbDAyWUVaTFVnd2ZiVktURzJKbnp0ZWhTU3VJWWlURGNY?=
 =?utf-8?B?NnF1MFZSZFpiaWlYenppVm1ZYVV5c0FZVGpsNmNWcHZGUTBuWEdLMlFFUDVV?=
 =?utf-8?B?Q1psWU5kN2t6WXh5NnRlSFhjaHBIOFVUNVdvVzZXVjRpbm5ibGpqUXhMTkRp?=
 =?utf-8?B?eHpFYmM5SjVFWkxlMy91bG1yWU0vajZON2hOYnA2TXowMExQWFZqbDAxOVl4?=
 =?utf-8?B?OGxQdEQwdW81REJKakJ0eUVvYXIvbXpHUVp3OVZNdVBuR2Nzby9vRERrSWNX?=
 =?utf-8?B?WnQ2VmJpeEgwdFJEaDNFYUYvcUZnK2NyODBXbE1yVnZyZTNqL24wa2kzZ2J2?=
 =?utf-8?B?U1htbmR0aklpN28zQXdRWVhZdEFpZnQ4Qm1LL1lYY3pEdmVFTTl5NE9YZlFQ?=
 =?utf-8?B?dGhtK0FjbXp1bTAweHV2aFU5eVlkRWtDeFU0SGpVOFlwVmpDWFllSElMaEEy?=
 =?utf-8?B?ZHNpdEZwbDYrUU8wejN3b1VTOC8yZ0tlWk1oQ2pUL284QkFEVGJnQXRwZUYr?=
 =?utf-8?B?TzdVTHhQY2RPS2puK0M3K0JjMHJXTlRBaXh5WlR2RmxkelJNVFQ5T2t2QTB6?=
 =?utf-8?B?VDQ2TmUxVzZLbzFlTkUwTlNOdHNqUEhrNjhFNC9BS3BNUzVqTUxDL1M5SjN1?=
 =?utf-8?B?TitsYjhSODhwNXg4cEl4ajZrSzVIRUtqbDZUVENIMHZLbHZQbGZQV3VTOFdF?=
 =?utf-8?B?ZXcxTzlMV2hyMFY3enRlYUpWNjJoWlk5VUhrUUY1VS9iMjZaTmdoNWYvZUdL?=
 =?utf-8?B?NHNoNTZHRmdnV0dEMUxYQXF0dW9lcURhL0dVTHo3NTREalNBRWw3YlJzSG1H?=
 =?utf-8?B?eUsxbE9qdDNwUjgyQ2VpK29rNFdkSUpBOHIzb0hwb2pXcHlLbXF2R0hKeEw5?=
 =?utf-8?B?ejVmOStTTTBpYWhrdkozV3JkMlhsMko3RlJmaE0rL1FiMjUvTzg3VkNLVFhL?=
 =?utf-8?B?blhyT2tFV3BqNUxRdXI0Q0ZkU2t4OWU4Y2oxR1VtR085ZWJHTGVYUHRuWHE2?=
 =?utf-8?Q?9v9RHDUj2TEHxVKBWGy2RgH93?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f725c3ef-6f6a-4e3e-4b1a-08ddb3c2c969
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 08:32:14.0506
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wmi2/N8DgvtVTkcCVsWxRlVmfhpIi6dP3+ystsZUX6NOrsUsm57N1hLErCczKyfMCO7bP/5z78uVqt3z43h9Qz/2ETc6ZMcnmRhAm1JfCr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6130
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiA+ID4gPiArLyogVExQIGNvbmZpZ3VyYXRpb24gdHlwZSAwIGFuZCB0eXBlIDEgKi8NCj4gPiA+
ID4gKyNkZWZpbmUgQ1JHX1JFQURfRk1UVFlQRSh0eXBlKQkJKDB4MDQwMDAwMDAgfCAodHlwZSA8
PCAyNCkpDQo+ID4gPiA+ICsjZGVmaW5lIENSR19XUklURV9GTVRUWVBFKHR5cGUpCQkoMHg0NDAw
MDAwMCB8ICh0eXBlIDw8IDI0KSkNCj4gPiA+DQo+ID4gPiBUaGVzZSBhcmUgc3RyYWlnaHQgZnJv
bSBQQ0llIHNwZWMsIHJpZ2h0Pw0KPiA+ID4NCj4gPiA+IEkgdGhpbmsgdGhvc2Ugc2hvdWxkIGNv
bWUgZnJvbSBkZWZpbmVzIGluc2lkZQ0KPiA+ID4gaW5jbHVkZS91YXBpL2xpbnV4L3BjaV9yZWdz
LmgsIHRoZXJlIG1pZ2h0IG5vdCBiZSBvbmUgYWxyZWFkeSwgc28NCj4gPiA+IHlvdSBtaWdodCBo
YXZlIHRvIGFkZCB0aGVtLg0KPiA+ID4NCj4gPiA+IEkgYWxzbyB0aGluayB5b3Ugc2hvdWxkIGFj
dHVhbGx5IHVzZSB0aGUgdHlwZSBhcyBib29sZWFuLCBhbmQgcmV0dXJuDQo+ID4gPiBvbmUgb2Yg
dGhlIHR3byBkZWZpbmVzIGJhc2VkIG9uIGl0LiBBIGhlbHBlciB0byBkbyB0aGF0IG1pZ2h0IGJl
DQo+ID4gPiBnZW5lcmljIFBDSSBoZWFkZXIgbWF0ZXJpYWwgYXMgd2VsbC4NCj4gPiA+DQo+ID4N
Cj4gPiBBZ3JlZWQuICBUaGlzIGRlZmluaXRpb24gaXMgdXNlZCBvbiBUTFAgaGVhZGVyLiAgTWF5
YmUgSSB3aWxsIHRyeSB0bw0KPiA+IGFkZCBzb21lIGRlZmluaXRpb25zIHRvIHBjaV9yZWdzLmgg
b3IgcGNpLmgNCj4gDQo+IFRoaXMgdmFsdWVzIG1pZ2h0IGNvbWUgZnJvbSB0aGUgUENJZSBzcGVj
LCBidXQgdW5sZXNzIHRoZXkgYXJlIG5lZWRlZCBvdXRzaWRlDQo+IGRyaXZlcnMvcGNpLCBhbnkg
I2RlZmluZXMgc2hvdWxkIHByb2JhYmx5IGdvIGluIGRyaXZlcnMvcGNpL3BjaS5oLg0KDQpHb3Qg
aXQuIEkgd2lsbCBzcGVyYXRlIHNvbWUgZGVmaW5pdGlvbnMgdGhhdCBhcmUgZnJvbSBQQ0llIHNw
ZWMgdG8gZHJpdmVycy9wY2kvcGNpLmgNCkluIG5leHQgdmVyc2lvbi4NClRoZXNlIHZhbHVlcyBh
cmUgbGlrZSB0aGUgY29udGVudCBvZiBUTFAgaGVhZGVyIGZvcm1hdC4gSSB3aWxsIGRlZmluZSB0
aGVtIGluIA0KZHJpdmVycy9wY2kvcGNpLmguDQoNClRoYW5rcywNCkphY2t5DQo=

