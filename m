Return-Path: <openbmc+bounces-832-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF23C195C6
	for <lists+openbmc@lfdr.de>; Wed, 29 Oct 2025 10:25:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxMKq3dMHz3bfN;
	Wed, 29 Oct 2025 20:25:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761729935;
	cv=pass; b=JERP5X3xyaP0JmAOxK889B3Luww+ZsmW5BXWncthxpqFejKlpZEMxSfVZ4Daflf38rq3JbxOPfqliB5TWEJeSLRD7MsnnwMnZb+Peviogt1nQhFtGp51/TxA1prvY9T8kIJ7AXh5IcJX3E1QtPPkUnWmXrMiOlSA65WPjREm2odlvrth1NaI9Iuhov4BaMJJOuoO8ge32YJLGWL+4dL1OElSRxkVm5W0gZGI0CeuhlJ4BoO36kjGLlTn/Oi2/hMUoKPJv0teO/72fXblDjENNauFPUc+T2DzGxXDIhJEtiioLgN9sK+RMXIx12v56uXYXmu6rgi+gPWaAxVoeiIKnA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761729935; c=relaxed/relaxed;
	bh=nUkkPRn5QZq/++be4W40n7xRO8gL2CdykeJ/gUDcYZQ=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oDP+R7yLtyVpRQLlOp3jp720RJJTFAEF4FBHcVreyhV4dnQAKHeM0Fu67JEra4GC4ic+bJT1mNrqImG0v/sgzcXK1RlOXOV5kUOkXTZ31Ig/tfGbXoSEIox3TtEXA8HWsrByrXhLe7sajQd4p6bfjmJPTB+pc/PwOT0LspBOBmtd0bBiZtHSOHK9tc6x1z0xaxZDk6p7dtnGjwp5GLZ7mJnxrwxM/ibK6t+BzkOiaXk4Gaq4Cp77f6gfVikt+5O2EFLwDKtyoGoCOf96hM8VgMKwNtwluzW5QuVNkRou4B5tCjT4jA1jYiou+KnciFwwYjHQqdtO1uy82Qwbbgz04w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=roMePWNU; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=roMePWNU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c405::7; helo=tydpr03cu002.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxMKn3Lg2z30hP;
	Wed, 29 Oct 2025 20:25:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T5s0iNF8PYDsFeoEIF0Zgggvfa8/QKOIntJvL20EAKQhgeTgVSkPldGKtGvhMNoxlLW2uB25B7s8/74hk+ptn5tA3BW/gcF9zyt+z3LxNvFJgWti5IQeokunqiByF0whF56VVlFMF8jIQ+NUh6biHNCEh7ZxmwtkJir1bdpvcEwrMOFMW56WA017sdzS3ZI0Ot+PWq2bS+2PB6uIm7dzfNcLrkI0Ypfo3bMHfFmuGVaX34zHTTKjLKz0a2JEdY0xedi00hxdDIeN9zu8da8a1oAIGt0tCYvV/ZhpNYmCbdHPKDOCiZci9uoX/d9WRKSaFuGGvYUX1Jk+umU2ZI+SeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nUkkPRn5QZq/++be4W40n7xRO8gL2CdykeJ/gUDcYZQ=;
 b=F6acM4G5B8WFFA3XUALI0RluFoTZeqoi1su4jXbzcRTAhDufrBc56muv1qg0TT9x8iDlOgCI5+pA7I+FUtojL4H7gjOzSPiMXOqmrgqNfy7Wle9dq9Zi2bFCBjHD2+SEuSbHrkCTUlBZuwDP0NSjDP+gFxKU8yKrqjrrv1O0AS/h+Hil+0FVRRrrIWxL6cB1gw7LfqIinwLce2bvl9nWs6R5Lw/GiFHGxA2whf5Y++OkJW7q7BLtlO6iIiJ9Bsh5zTw0g1OGU8kWRNOYFVlVs+8eSyTLCd98FGqssXa1hLsGjKz0KFLJEFaj6fmeu5HNafCt+FnTkx7CEgydpeNR1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUkkPRn5QZq/++be4W40n7xRO8gL2CdykeJ/gUDcYZQ=;
 b=roMePWNUWwYU0mtZcSsUR1zfObtS7UT/zXNh4Mmcj7wy04suHG2YW4aPGR6xiqAiA+ObkUWY20B/CWzipil/+EWpqikkb4EVWPdOfm5IzxhSURNwB7j+gNRIE7TSyleEmyhgpvlo8T+ha7aX9JGCCWNlbSh68J6t1uK2S2VtHaRykhntatGFy4HbWSvobuxMz2ZK7enNeW+Emg53r212aOJgNsXQdoBVBCFyQomOJl2e7fU3q9JHRJVQI9v4zqQAH1le6yHtJkErwGkeOKIqA5rMUxOCPo7iPyqAF/yV0mbs/WXSy14LvBU1BgVDEPdqYWP05QcarO2vnaw7h/GKeQ==
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com (2603:1096:408::791)
 by TY1PPF93F545ADF.apcprd06.prod.outlook.com (2603:1096:408::91d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 29 Oct
 2025 09:25:09 +0000
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80]) by TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80%7]) with mapi id 15.20.9253.018; Wed, 29 Oct 2025
 09:25:09 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>,
	"benh@kernel.crashing.org" <benh@kernel.crashing.org>, "joel@jms.id.au"
	<joel@jms.id.au>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"jk@codeconstruct.com.au" <jk@codeconstruct.com.au>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "andrew@codeconstruct.com.au"
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
Subject: RE: [PATCH v21 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add
 global-regs and transfer-mode properties
Thread-Topic: [PATCH v21 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add
 global-regs and transfer-mode properties
Thread-Index: AQHcRwi3xNYEORZZrU+2vI7qaB6dc7TWXdeAgAJ+8DA=
Date: Wed, 29 Oct 2025 09:25:09 +0000
Message-ID:
 <TY2PPF5CB9A1BE6DCA78BEDC3178B74FD75F2FAA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20251027061240.3427875-1-ryan_chen@aspeedtech.com>
 <20251027061240.3427875-3-ryan_chen@aspeedtech.com>
 <93a2ff5f-2f8e-494b-9652-b93bc243c229@kernel.org>
In-Reply-To: <93a2ff5f-2f8e-494b-9652-b93bc243c229@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PPF5CB9A1BE6:EE_|TY1PPF93F545ADF:EE_
x-ms-office365-filtering-correlation-id: 67f15be5-45d1-4746-4326-08de16cd0e10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?QUNrVzhVMnJ2RUMwYSs1QUdoQmhsVkJzbG1BWUZLUVJPYXFXM1ZUUlhJRXls?=
 =?utf-8?B?QWVpY1FuNkcxZWJRTW0ybnJxa0ZRb015UUYzY1ZHdEgzMGtYVWpMQXUyc2cr?=
 =?utf-8?B?U09qN1E4cTgweE0vbENHbTlmejYxTHRpaUU1Tm1mMVhIU09ETnZLck5HcUVL?=
 =?utf-8?B?RUFtZ2RSOER4SERnUFh2dTJaUEJXekxLSDhCaWJsZi9xVWVWMUVkYXFycUFB?=
 =?utf-8?B?Z3VyNVFwdTNUY3NCRHhSUXN5WFRGa2h6cnA4QlZTNCtwOWNBbFh2U0l1RU9B?=
 =?utf-8?B?Um9NL1NRT3dqSlczUDV6NkZiTS9EMFdJN1ByZDJmRXFVQlQwMG5nSDBKMVdl?=
 =?utf-8?B?b0l5Q1l1bW1Wd1pQcWtWdE1zZEF5bEh3MFVoUVdyOTM5QnZpeEVMSE9aWFlN?=
 =?utf-8?B?NHNXZW1OQTBhRllEbFpTcFJXWjRYdnBNUi9CaUQzSVNLbVZYYjIreko1N2Q5?=
 =?utf-8?B?VmVmM1dWblc5T2JsbFpFZDAzRWo4MnozNnM2ZWtERlArc3NQazM5VTlCKzFK?=
 =?utf-8?B?cU81YzRmb0VGYnk0WGgxdWtJQVN3bUpZYUdpbHhDZUhpNngrT2lkbVd2cUM5?=
 =?utf-8?B?aVVsbHp6M1k5c01sdWF1d3NBaDE0VzM0eEEyMms2VXpPS2JIeWpoQnFLWFRL?=
 =?utf-8?B?VlEzT3NQcmVkM0c0YkNSQU10M3ByTHo5cW1nNC9NOXVUcUtNc0lXYmxrM1B3?=
 =?utf-8?B?NVREcHBjelBPbWZRVVlIRGtsc0k1UnlnK25uVGNWL1NDRnVjK2Q4K0hoWlZw?=
 =?utf-8?B?cDBHUXpPSUc1ajkrZ0dmSzhrd0txYVNReGRHVzlieG5HNGFndTh6T0NzZW9n?=
 =?utf-8?B?QzJsUHJ3M3pBV25CYzhjRHpOTW83NCtjVkRoL24wZFJTazZGMEJDRUNic1pv?=
 =?utf-8?B?S3l2dUlTUkhaSkI1cDdzcmJ1b1dEQWVyUmpwUUhJTlNKOG1ZQnB1ZkdaSml6?=
 =?utf-8?B?eUV1RmZvQzc0cXgzaTA0bWJvU3FHd28waFJibzRRV2JOcEp2VDNzb0VQbU9T?=
 =?utf-8?B?TzFnSFRRQldldjhnMTJFQS8wQzRxSkliT2FXUnFkOHNqVVRETFF6MDZ4TmNG?=
 =?utf-8?B?cWNDbUxKVFByaldsUmVvb01rRldRZzJndjZNbEFaZnN5d09qSjIzL1g0TE9m?=
 =?utf-8?B?Nk5Ebnl5eExLekhld0xjV296dUFoNWc4ZElxcENtL1gvcERua2ZQTktTdGl1?=
 =?utf-8?B?bTMwM052T3FveDZLRHMxTGUxZ0JUQlRuaVZpTG9sRVhLTk9RUVYzZG85eEJZ?=
 =?utf-8?B?NEx2K1NBTFFaZDNCTEk3S3lidzBMci9CT2wrRzdpdVlBM0dPbUY5VDFuTmtS?=
 =?utf-8?B?cWs3Q0ZMdG1abDI5UCttbTVzZjNWVnNPNjBHM3pFTjV6SmpPTG4wQ0drS0RP?=
 =?utf-8?B?K2JzbWg3WWw1WU1YUzhmSVBFdUgzNFBTRGZmOXFzNHRjZ2ZmS2FCYmRkVW5G?=
 =?utf-8?B?ZVN0bkJCbjNseXFjTVpqY0NSNWtEaU9pbHFDTDFOL3lyU3lCNENUSU5ZaEov?=
 =?utf-8?B?VDg5bFRLbFpmdTN6NEt4QU1WYlV3TUM5N2U1aGc5dVBsYWo4WGhPS0FLYXFa?=
 =?utf-8?B?Q2NvNXo5ZGlySlNFYWNnLzNORlFwQ2hQMmd4R2hZOFZnUkgyQ3o0dk1QaHE2?=
 =?utf-8?B?V2tOY3VmRWJYNnFiNFNCQS9OYmFOTnN4eUFDcldPeTRpaXQ5RStGRDZRMXFE?=
 =?utf-8?B?a2NrQmlwQzdtTWp3bURmNFFKYkw0cFdkWTZINi9WSm5hZUJxWHVKcmdmZzFW?=
 =?utf-8?B?N2laMWMvaTcyYU9IMzV5dFo1YTlnZ0hyT1BQTFZOY2NFYktQV2wzbWUrN3ZJ?=
 =?utf-8?B?aUMvdG9LS1dyWEMwRStrdmdsRUZoS0xpblRFNWp0NGJmZ2xnWTlVQVVUN3E4?=
 =?utf-8?B?NytzLytNdnhNMEZMdE1CSWdYVDhCVmFseVU0N2x3QzhJUWNPRkVBQU5Ob1NQ?=
 =?utf-8?B?THdWK25HZUVHQ1NCNEJRdTJMeU1Sa0hhaGV6UCttVDh6OVEwUTRwRlpGUyt2?=
 =?utf-8?B?QjE3WU5wMDQxaGVBTStEWUdpbGtxTFFhRHBWbGJ3TDQ4VFRLQVVtS0sxbVJ6?=
 =?utf-8?Q?lVOuZ3?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d3c4R1IxcTR6RitmaDJXTlpvTUxVY0pWNXh2ZnJJQWNHaFhrdjBGcTZvRkQ4?=
 =?utf-8?B?RmFEaW5HMHFqM29LY3FicXNnSk5xeVlNNmxQTzZaZEVyQ1R3YUx2dWhEM3FX?=
 =?utf-8?B?VkNQQm1MalBVSksxKzVlSjBseGpONzI2b3F0U0dKQmtwdHk1bngyQmx3WGNX?=
 =?utf-8?B?NUJSakhZdTZHeC9wYStDcVYzUVNzSDk0YmdtazFnVm50Zmh5RFd3c3NSemZ4?=
 =?utf-8?B?bEEySzRGTWxMdHIyQThEbDg1TjZnLzFQaWZWcThDQnBMRTRvTGtOSWVOSmRX?=
 =?utf-8?B?QzhJTklLVitFZTBZYzMvVzFPWTNOUmpuclZYSTBpbHRKVCtlS3pZNEZDU2gr?=
 =?utf-8?B?dHozMFlZSWNnTkJSVmhrNXRxOTFCclV3Q0FwMXg3TFVNVWkzcE5UNExzcWVX?=
 =?utf-8?B?VSt3ckw0Vi84N0Zwdm40UWcvaW1tV2c0c3VhUHR4bXR0Q0xhUER5YkpuYTZT?=
 =?utf-8?B?UmhuMEVPRDZXTHlYWnJUblA5L2Njb0NkNlJpS3ZubURBcDJ1TDBDeWFDdy9D?=
 =?utf-8?B?UStITHM4cWhWcWJlN0I5TFRxNEltSXYvdEpIdzNnMDlDNzQvazRsMnB6alVO?=
 =?utf-8?B?bE0wNTFpb1dENzgrK0J5WTV6aEtIQ2NaZ3ltekFLZ2VtQ1k1RTZiMUI2MGox?=
 =?utf-8?B?NHNMZk9KQ3V1TUJCQ0MzZWxOdHJNb2FSUlFieXBFSEMyaCtnNGN5SW5sK3Bn?=
 =?utf-8?B?cnE2cTQ0QUxvdC9ONzllLzJ6T3BPRHoyOGFlSmlIM0poTC9kdVY1NURuMERL?=
 =?utf-8?B?OENwYk9PTDRYeGtUZFhKa0Rub1VCS3pydVJ4MjhXQkp3d29TQURUdWhtOWFj?=
 =?utf-8?B?QjYwczhVaWlaVDBtaWZJY1ZNb3VVYkpjdWR1MmZJNTJYdXlROFdOK0FxY1VY?=
 =?utf-8?B?VnlHTXZjY1duTklJZmpXcUt4QUxGNkFybXAxdWVzcVVtMUVIdVZCVkQ5RWpH?=
 =?utf-8?B?c2Qxbjl1c3hIQXFwWWlvWWMrV1l2QjNIbFRJTkJpU3ZOT2psY1AzTWVlSUdn?=
 =?utf-8?B?TjY5UTlnUTdyM0RsWjFFT3M4NkZqV1l5clNsdkp5L2s5c2xuR0NySkxiamFZ?=
 =?utf-8?B?MGgrZDRpZ1JzcERvcHUzYTVXa1VIenltZXp0ZFRZeDNtemNVdWYwUzFEVC9J?=
 =?utf-8?B?alhIZVN2d1NIV0xjU1U1QUl6TG94Wkt1c0txWitpbzRPVmxNUWJ4eFcrY1Y5?=
 =?utf-8?B?V0lZaXJVNGJoZHRmWUcxTnR1eDhBaUora1BkeEdMdS9oUEQ0c0t0b3IzVnkr?=
 =?utf-8?B?N3pQNjRPWVBMV2tmWG5ZUXRiTmNTN2phMDMyRkM4c1pNTExPczRIQ2dmUkdv?=
 =?utf-8?B?Yzh5ZnpvRGJ3UWhsbFNsTnEvcnhZeTNGZm9TTStHRW1XekZLbm1Xei8vSk45?=
 =?utf-8?B?ZWxYa0dKSUVRQ1hEMERZYXg5WWcxTVVIZ25FQ3djc0NXUSt0T2orSEU1bXM4?=
 =?utf-8?B?Q29GbXMxNzUwL28vbVg5WWdQMmdzMFFSZmxGekM1ZzRyUkpqZ1RLaWx2ZWcz?=
 =?utf-8?B?a3BIbm41K3MvMm5NcmUrWkhDaStvOFlSQ3dweUJ5NlA2VU0rRng1MVZvYkRE?=
 =?utf-8?B?Vk9QMHUxdG1uSUgzajk3K1VsUlRBcm1vWm5sMVNnUUpmM29OS3RBZW1HTHpr?=
 =?utf-8?B?bmd4L2Z6VFNnd0xWbGlZRHd3T25FdExpekNBVGJJU0hUbEM2R1ArK1BVMHl2?=
 =?utf-8?B?WjZpRS9zK0I2L3k2Z3hUMERKYVpaOGh6MlJjN3MxR1JUVmFpN1Z0VXBaUldQ?=
 =?utf-8?B?WU43aTBwOXh1U0J0Smt0TkNOUTVLam9vamh2WCt3MkpRZi9iWDAwaXRXTWli?=
 =?utf-8?B?WmR5UjhQbmttNFBWN0hNSjZtWnUvQitiNEM0R3NpOGJIWGNSS1VzcS8ydDRP?=
 =?utf-8?B?WEVsMnhpMFNDZmwwZW5wcnZDcllBdWpVYlFHakVudDRTbkQzSUEyc3hwMkx0?=
 =?utf-8?B?ZjVtenpWOEZWSzltclljeTRhOVZyQ3JEWVNSZlZKbmREeDMzYnoyeTNWeXUw?=
 =?utf-8?B?WkZIVkIxWkI2R2kybmhJWU55L0lSSnkrNmliYmU2Q0xSZDNuZ2NQN2dLRU9z?=
 =?utf-8?B?NzRQSU9LdzlncWdGM2JpdUxyalU1RTAwS3Q1WmNuN3ZpQjNhbVVEL3FwSkpL?=
 =?utf-8?Q?uCqhe3GYzRT1Cnhh0ylkXqQU1?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f15be5-45d1-4746-4326-08de16cd0e10
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2025 09:25:09.2795
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TMoVS0wLA4txck8jjk0k0yYXAFrG+1B509H2ggFzyDiH0u0Qr82184xRU4SPZfWq386ThMXZ1tT/nx72j5hFFG1nF7c6ao+C50W5H+88qXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPF93F545ADF
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyMSAyLzRdIGR0LWJpbmRpbmdzOiBpMmM6IGFzdDI2MDAt
aTJjLnlhbWw6IEFkZCBnbG9iYWwtcmVncw0KPiBhbmQgdHJhbnNmZXItbW9kZSBwcm9wZXJ0aWVz
DQo+IA0KPiBPbiAyNy8xMC8yMDI1IDA3OjEyLCBSeWFuIENoZW4gd3JvdGU6DQo+ID4gVGhlIEFT
VDI2MDAgSTJDIGNvbnRyb2xsZXIgc3VwcG9ydHMgdGhyZWUgdHJhbnNmZXIgbW9kZXM6IGJ5dGUs
DQo+ID4gYnVmZmVyLCBhbmQgRE1BLiBUbyBhbGxvdyBib2FyZCBkZXNpZ25lcnMgYW5kIGZpcm13
YXJlIHRvIGV4cGxpY2l0bHkNCj4gPiBzZWxlY3QgdGhlIHByZWZlcnJlZCB0cmFuc2ZlciBtb2Rl
IGZvciBlYWNoIGNvbnRyb2xsZXIgaW5zdGFuY2UuDQo+ID4gImFzcGVlZCx0cmFuc2Zlci1tb2Rl
IiB0byBhbGxvdyBkZXZpY2UgdHJlZSB0byBzcGVjaWZ5IHRoZSBkZXNpcmVkDQo+ID4gdHJhbnNm
ZXIgbWV0aG9kIHVzZWQgYnkgZWFjaCBJMkMgY29udHJvbGxlciBpbnN0YW5jZS4NCj4gPg0KPiA+
IEFuZCBBU1QyNjAwIGkyYyBjb250cm9sbGVyIGhhdmUgdHdvIHJlZ2lzdGVyIG1vZGUsIG9uZSBp
cyBsZWdhY3kNCj4gPiByZWdpc3RlciBsYXlvdXQgd2hpY2ggaXMgbWl4IGNvbnRyb2xsZXIvdGFy
Z2V0IHJlZ2lzdGVyIGNvbnRyb2wNCj4gPiB0b2dldGhlciwgYW5vdGhlciBpcyBuZXcgbW9kZSB3
aGljaCBpcyBzZXBhcmF0ZSBjb250cm9sbGVyL3RhcmdldA0KPiA+IHJlZ2lzdGVyIGNvbnRyb2wu
DQo+ID4NCj4gDQo+IFRoaXMgaW1wbGllcyB5b3VyICJyZWciIHByb3BlcnRpZXMgaGF2ZSBub3cg
Y29tcGxldGVseSBkaWZmZXJlbnQgbWVhbmluZyBhbmQNCj4gdGhpcyB3b3VsZCBiZSBxdWl0ZSBh
biBBQkkgYnJlYWsuIFdlIGRpc2N1c3NlZCB0aGlzIHByb2JhYmx5IDE1IHJldmlzaW9ucyBhZ28u
DQo+IFdoZXJlIGRpZCB5b3UgZG9jdW1lbnQgdGhlIHJlc29sdXRpb24gb2YgdGhhdCBkaXNjdXNz
aW9uPw0KDQpMZXQgbWUgZXhwbGFpbiBtb3JlIGFib3V0ICJyZWciDQpUaGUgJ3JlZycgcHJvcGVy
dHkgY29udGludWVzIHRvIGRlc2NyaWJlIHRoZSBzYW1lIHJlZ2lzdGVyIHJlZ2lvbnMNCihidXMg
YW5kIGJ1ZmZlcikgYXMgaW4gdGhlIGxlZ2FjeSBsYXlvdXQuIFRoZSBzZWxlY3Rpb24gYmV0d2Vl
biB0aGUgbGVnYWN5DQphbmQgbmV3IHJlZ2lzdGVyIGxheW91dCBpcyBjb250cm9sbGVkIGJ5IGEg
Yml0IGluIHRoZSBTb0MtbGV2ZWwgZ2xvYmFsDQpyZWdpc3RlciBibG9jaywgcmVmZXJlbmNlZCB0
aHJvdWdoIHRoZSBuZXcgJ2FzcGVlZCxnbG9iYWwtcmVncycgcHJvcGVydHkuDQpUaGVyZWZvcmUs
IHRoZSBtZWFuaW5nIG9mIHRoZSAncmVnJyBwcm9wZXJ0eSBkb2VzIG5vdCBjaGFuZ2UgYW5kIG5v
IERUIEFCSQ0KYnJlYWsgb2NjdXJzLg0KDQpTaG91bGQgSSBhZGQgaXQgaW4gY29tbWl0IG1lc3Nh
Z2UgYWJvdXQgInJlZyIgPw0KDQo+IA0KPiA+DQo+ID4gIHVuZXZhbHVhdGVkUHJvcGVydGllczog
ZmFsc2UNCj4gPg0KPiA+IEBAIC01NywxMCArODUsMTIgQEAgZXhhbXBsZXM6DQo+ID4gICAgICAg
ICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiA+ICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCj4g
PiAgICAgICAgY29tcGF0aWJsZSA9ICJhc3BlZWQsYXN0MjYwMC1pMmMtYnVzIjsNCj4gPiAtICAg
ICAgcmVnID0gPDB4NDAgMHg0MD47DQo+ID4gKyAgICAgIHJlZyA9IDwweDgwIDB4ODA+LCA8MHhj
MDAgMHgyMD47DQo+IA0KPiBOb3QgcmVsZXZhbnQgdG8gdGhpcyBwYXRjaC4gWW91IGp1c3QgYWRk
ZWQgdGhpcyBsaW5lIGluIHBhdGNoICMxLCBzbyBkaWQgeW91IGFkZA0KPiBpbmNvcnJlY3QgY29k
ZSBqdXN0IHRvIGZpeCBpdCByaWdodCBhd2F5Pw0KDQpJIHdpbGwgZml4IGl0IGluIHBhdGNoICMx
Lg0KPiANCj4gTm8sIGZpeCB5b3VyIGV4YW1wbGUgd2hlbiBjcmVhdGluZyBpdC4NCj4gDQo+IA0K
PiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0K

