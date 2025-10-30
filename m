Return-Path: <openbmc+bounces-835-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90476C1E0D2
	for <lists+openbmc@lfdr.de>; Thu, 30 Oct 2025 02:48:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxn8J5dj6z30V1;
	Thu, 30 Oct 2025 12:48:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c40f::6" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761788928;
	cv=pass; b=d/rCc0Y6ootEPr8pg6/HMnWcZuzh1uxks/vNK00G4VmzmOdzlt/EhfFftvrp0YFOjBJVviLDqSzdGn+lX1uvKt2eNLG1BzK2mSPu2MWRGalMTOUiQ5Alpr7G5gtPRoUMnfea+Fz8II8BuOoOGOWkYj59WYz7v3yrYvsMHwZZ8oRJLA6noQVpXMaBeTZB7b7k28QbrvFzpvnG27FDAzFpGMK4JkUSpDsKmlYsqgqcK99gFWBeZ2JL20G37thcrUm2rn2Q8n/2tE9tOvWkwtTsNUWBw6fu+HLnd/neLRZQzNRSsBsW9WoBu8kS+SnKUdbYiuRM0jifVEIO+JrMK0BAWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761788928; c=relaxed/relaxed;
	bh=dSOigotwOrSdXqy1brFvqpyOzVFF8i42GjFCHQbtA4c=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Elf0G/gmfQy4qXKBGydv9iXKGlXz/c3BjY2Mpob8GKV5zdwr0ioqgNnz+Cydr3dGdH252+hhqbWuHVjzdjDaqlZv0lUjffA7NloYhndqHvo2++pmSK0YBgAJ9ThzeQtYLzwIS+6xI4OlIP/3aenyk3jD07r2fV+424k7DkAX9ThSc+ha1x6AoeuKl7pq5h6Xs7YyKH8Cj+QZv4Y10ifxuYsIIriHBJP11PIMoQjkYrT+Ie14fw95l5gy17sXjoM+KCWwsTItzRcQhPV8cey5s8NB50IUNb8fDUAgMrL8O937hd4pQ15FPdSre/qLI98YJrp6HEEcDnHLD2Oxzo7WRA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=CHgKKVkc; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c40f::6; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=CHgKKVkc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c40f::6; helo=seypr02cu001.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazlp170130006.outbound.protection.outlook.com [IPv6:2a01:111:f403:c40f::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxn8H3yYXz2xxS;
	Thu, 30 Oct 2025 12:48:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qJJ62594KjsP2PgEZoAZ2f99cwuLCq+rM0FyBcfemrtHUJYtAtGFHeoo9zy4eV53aFw+Gpb/awgfg4DSxtHVEoeRpmKZXB6IjRiVzvkudpn4jiBwt7bp7kehL+LpaouYzdQRlSwnyxcWfvTXr/b9r5DUKTtsXRgfgR+xAoyNaa+9i2+meRjTM7q4JX4BBolbhW5Z8vMuOMdyHR6ymvkNNhIJd3SqsiQs278rO5h+I4E4j3RYhFuM0wQSpKzBxCC2CQswT7wxmqnQ06hzc8+qCjcAlHBK4i1YGlrKm/kGdH0yOf2wJ+aZs2+4dV2aFF24gzeVMt/dj0JkRIl3b3MwQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dSOigotwOrSdXqy1brFvqpyOzVFF8i42GjFCHQbtA4c=;
 b=NWhRERN8cWn4aDuDa4RidYyPb2mLsTWd1VikHLbIVMbGvs8pd+jXuxTEk+FZKPaOuxsub9VjNVIdZybXeztYILOM4P2Lzgw7FIlNTkLp/9BxyY8KaPWuj0zoIVLc3TgpUGTH0pGI2DaJ+94QVn2Vbyl/XWHhi+YykMPvFRt7iyhkyHDK2nwzLUYaxmw9VOeaiL/KraLDax1QdCW8jZ9AMMgEgZXmAm8yl5VAmCtABa7UMsgX+3oYKtHxXohjZdZwnE/yRDaE3pWhDfKI+ri/QKmEuY0SoMrWqapO58TifxPJCRIXzBGc1RDFGKmz8LrgG7DPOB5x1wb13VJ/FgHNQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dSOigotwOrSdXqy1brFvqpyOzVFF8i42GjFCHQbtA4c=;
 b=CHgKKVkcb5TDNR3qVmo0s1pZUmannjdqay7txkOXFjWW+MeZ3jQfK0PKwFdBmqqffI69c5c7YPpF3lIOY6GhY7YBunMkTJ6SZ92f64IfRb6DmYZr5/5oZRmORSsb1I+1kRAa+yTSe3Tgx7Kd505YS8ZFFpLTKUlHbfP+QRm+B+anPtJ6dTrK4b6SEr+l69vppDyW6E1x8H6Lqb2PDipkJt1c/c4L/pQCFka1k3R6PIX3O17ET2PjJfPZjvnOJ5z8z0D6YWMkFAXFrnUnA3iwJbMe5ptJJWLT0gd/ErPBGRPim0T/X9IVKAU+UDUdO9VG3j3IK7HvzKXlLOlcV5qazA==
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com (2603:1096:408::791)
 by SEZPR06MB6059.apcprd06.prod.outlook.com (2603:1096:101:e1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.21; Thu, 30 Oct
 2025 01:48:22 +0000
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80]) by TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80%7]) with mapi id 15.20.9253.018; Thu, 30 Oct 2025
 01:48:22 +0000
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
Thread-Index: AQHcRwi3xNYEORZZrU+2vI7qaB6dc7TWXdeAgAJ+8DCAACECAIAA8atQ
Date: Thu, 30 Oct 2025 01:48:22 +0000
Message-ID:
 <TY2PPF5CB9A1BE62BD449193B23A22DF941F2FBA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20251027061240.3427875-1-ryan_chen@aspeedtech.com>
 <20251027061240.3427875-3-ryan_chen@aspeedtech.com>
 <93a2ff5f-2f8e-494b-9652-b93bc243c229@kernel.org>
 <TY2PPF5CB9A1BE6DCA78BEDC3178B74FD75F2FAA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <36e2b87f-5567-4bd6-bd1b-789623441461@kernel.org>
In-Reply-To: <36e2b87f-5567-4bd6-bd1b-789623441461@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PPF5CB9A1BE6:EE_|SEZPR06MB6059:EE_
x-ms-office365-filtering-correlation-id: 564de2cf-b218-4a1e-541f-08de1756688d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?V0dRUzZNdnE0eURKR3NmdzFrV3d4dU9uWkZjeWh6MjdoNHFNcmdacVQ0L2xZ?=
 =?utf-8?B?aFhsdUxjZXovSTJYYWtHc2hON3hUZm90eS9OUkluWEZmYW8vbmFjcldJd01T?=
 =?utf-8?B?UHozYXg5UC9YS1pvQkdSdlJOY0VjYTRnUGxjTUhuNmFtWXVESFVSc1ZqLzI4?=
 =?utf-8?B?UW5JV1YwLyt0VXlTRzJNZGwvZmlncjh5b1pBSjNXbDF4UmxJWUlMTWg5Q055?=
 =?utf-8?B?SmZieVlXQXFMcEhKYkdTSkJiUmU4VFlxNk1id3YrYjZHRkNGZkgyVGxQbkww?=
 =?utf-8?B?V2cvemtQcSs2ZHpIeWZTUHhQMjlCMU44UVVLeXluT0NWT1N0ZUE3bkRHK0t4?=
 =?utf-8?B?SHBvajhPNi9LRFlDV293QTdRTytTRkNBbVFUSDBJQkZpQU9DZGo4cU1IZE5E?=
 =?utf-8?B?djVRWFRsRy8wWEtadFZETUVQLzUyS2MzYUZBUDNDK28xN09HWkpoc2ZlQzBH?=
 =?utf-8?B?MnZmRmxacmM5bmJna1ZRbk50dk0wUVoyYnk2T1gxbHhQMFZyVFB4UzZ4YTBC?=
 =?utf-8?B?WjY1UG1MbExlNVhiNTZmOWtGdEZVd1BJNm5wVFhNUWhwVlBEeEhLY0tETlhO?=
 =?utf-8?B?M1ozaHZFa2JJd1FIUlg2WlppWFJudGlwL0VBZStHMTFITnJhblNiZ0pMQ1ph?=
 =?utf-8?B?M3FxaURFNUJ6UlljTERCUEJTWUVsRE9xQll4MWgzMkxHQ3BlZmdQdTV5TmJJ?=
 =?utf-8?B?K2FYOFBaQzFkS29qcUZGcTNxdzNGMXpXZDlMU1VOajdMbk5NUnByczlvYUc1?=
 =?utf-8?B?ZUFOQ3hnRlFmSUpLa0QraUFrSjFVNnl2ZGdkVGQ5TWthUzkvTzFRQ1l3eTA5?=
 =?utf-8?B?WVlKUThDeHRuN3A0MkhkVWMyaGsycDdxSGZjOUhyU09CK3dCMEdwNzY2OVBm?=
 =?utf-8?B?Wk84S0psVUcrdVF5RitwMURCZnpiOGUyWWptZFZTUW9sMXFLb0dUVi8vOWt5?=
 =?utf-8?B?aWtmRXN3S1JDU3BMOTZaeXMvUDNIYUFhVjczVnZ6VFArd3ZhWmxXQk9vZnh2?=
 =?utf-8?B?UGhnN0VLUzRISWxhY0RsMU1MbW1MbityWWhhWGhoMndVK0VUUU5rMjR0dkx3?=
 =?utf-8?B?WnZrTEtURkhSMUF5NEw4eld0OGFhTXA0Qml1MWRBbEZzVnBSODRYRXhuamNv?=
 =?utf-8?B?L2g1eHNnY25YaHh4NEhBVUhOTld4TWYzeDRtMXVUeHJUVlp6bnBVTlFmTWJh?=
 =?utf-8?B?Y0FMUTZvNTJYc2c0TGdnNkpxTStNSFp4WWpuOXpBOTBEcDk3d3dEbU4rTU9H?=
 =?utf-8?B?Uzg2TTVVYXc3MTdWb2xDYW43REFNR0lhNDdnb3R2NkJTVy9wcm9qRzFtTFh1?=
 =?utf-8?B?c3EzN0xUVTdZUldZQnlVSXcyQmJjNzRaNEZGN3BDYnVldlpvOG5GNWhzSUxV?=
 =?utf-8?B?S01qeE1JbGlaMTJUV2svckxOSkNTZFphTFo5K2hYcmdOYk1vVHM0TmU3ZElr?=
 =?utf-8?B?dXN4R2JzdzFQbm1xMTBmaUdBcnk3RTYzbzh1bm05MDkvc1NQdysvR3BmWnQx?=
 =?utf-8?B?bDdIeUFjellXQ2ZaNStPTXF6Z3h4RlNCWXZlemZsaTBzRUZMOTBvNFc4Q04v?=
 =?utf-8?B?QXNUa1pKbVhsU3cvNTVncUxYNU91MjFCekNnNk1MRmhESEFENm1yV3gvZEc5?=
 =?utf-8?B?cjQ0V1F4cTg1SmdEb3R5YStHYTBNWTJMeWRZM3lydEZKMXFWaDN1K2hYei9X?=
 =?utf-8?B?cFB3VFpCeE5mc2I5Z1B5b0VJT3MwUFB3UWEwcTJFQlViVFNCL2F3ekVZQldt?=
 =?utf-8?B?TkVmTStBWUN3N2Y2K2pqeWlTZlp1SlNZZXh0ZHM4bThiZkRTMThleGM1d09r?=
 =?utf-8?B?Q3pvUnN6OXBJWjc5eFpqS3lNQmM1RkROVkdBViticDh3SVhaUkU2OGpNZ1Bx?=
 =?utf-8?B?dzhkMnhMMG93b1hXb3pIbHd0RWVNMjFUQWdyQ3pCaFRQcGNpTC9kcDBiaWFw?=
 =?utf-8?B?R1ZKSzFibkRwTTA4QWRiR0FYUms4LzgvOTROeEQ0QUZ6R3p0YllMRXNvQU1J?=
 =?utf-8?B?WVphSWxzTzJLcm8vcnNLVHcweDJGcXl4MTRDcy9iK1V3Qk1UelVSR2txdE1S?=
 =?utf-8?B?TDBwQnBmcEZMRXlOUmloOUlxaHRIMFdtSGo0QT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c1ZHUDFiY0NlUXpOeklBV21iblZObjVuTGkrU1hDQkF0OUtFc2NxZFI4K3FG?=
 =?utf-8?B?akxxNDQvUlAyNHRMNXNxajRpeVB6UU5VOHNCVVM5Z21ST2U3cmYwaGJMcWZT?=
 =?utf-8?B?Tmlhb1JocWRqY2FBUlVRTVM2NmpLcGx4RWlockJqZXJYTWZrU1BDZGRlUXd0?=
 =?utf-8?B?dThlMXpFbkxDNGtGeFgzcU5Sa2VKVERuODdmNXpKVVpvMXRHOElMN2dqUFRF?=
 =?utf-8?B?YmJEM3N5bTdVZ1d0U0daeWhTODJmbU0xQmNTWThISnZvWVN2bmpvNDRUb1Nm?=
 =?utf-8?B?R29Za2NJaExoYm1HYTE5SmRiWjZucVBVL2ZsbFYrdEJHVTNOLzBkOHVWdGpq?=
 =?utf-8?B?bTBsN2lseUFTekp2QlFPS25NclpCdFcyTFZXWm5objJNWlpaTlg3WGxrRmNR?=
 =?utf-8?B?YlRYOFR0Z0RFcUxFSEZKbGZuTlVCdE1XUTZWdjZVVG9oNW15SHMrTHp4RWll?=
 =?utf-8?B?SUVHZ2tIQ3R3YlYrcHdRa01MQU9hcXNiNUJickFjNzh0YTljNlg4bEhYSHdO?=
 =?utf-8?B?ektRZ3dmZVhsc2JWcHo0Y1ExNU1VS1Vzcm5jTndhaHM2emRpY01Fcyt4OFdl?=
 =?utf-8?B?anlCYVI0TmkxTXF6Q0ZZSTBPV1BXNEc5WmZ5dHU4dERUT3F6TUdLSnBZSmJF?=
 =?utf-8?B?d053YUhjVW1DU1ZrR2RIWWpSTVJOWlZKZTF6RndpcjFjRzA2N2xNVkM0L2hF?=
 =?utf-8?B?TGY1WkhoZEpyenVBUUxHY2plZnZlR1JJZjN1QTFKTmthOUFaSEJ5ZXVKenZ6?=
 =?utf-8?B?OEpFS3BjUWIrVzMrS1ovd1hsdjNtQzBtODhkNHUwNkVxY25IL1VQaEZmdkZS?=
 =?utf-8?B?Tk12VHVKYzV2Qm1lWkFQb0tveVNSbE0rV25jVFFqbVhFVmhiWG5MNWE5OVVG?=
 =?utf-8?B?YTlVM3MzRnI0N3hEckRCMjQ2WHJ5ZkorOWs1ZEZYMGdyaXFaTnQyQ2wrSVZz?=
 =?utf-8?B?UzF1YjkwQ3QxMXBwbkdNbmYxRGd1cElXakY0S01TRkpMRkN0YTJBUTg3RklJ?=
 =?utf-8?B?b2s2Q0dIVDN4RG9ITzhKeEROYU11VEdmYWdMekMzQ3ptRU0vSGdQSkhEclVq?=
 =?utf-8?B?VlhHVnpGdW1KRFZSdXA1dVRXd0p2UFlWQU02WUJhZUV1WmFCaTNyWk9HWUZu?=
 =?utf-8?B?RTNZamhKeVlnZ3A0MGVEeThCcUhFcGdxTlNRVHcxSEcvc0ZzZWgvaU1hODhO?=
 =?utf-8?B?MWc5ZWJLc2pDNk4xWlJ0Y1gyVXl4N1NoY1g2TlBYa3FuZlEwVlMrYkV6aXhv?=
 =?utf-8?B?M3dJQ2xKY0VtUHFrMWZwK3hqL2d1S2ZRd0xrOGhMcldrRzEzNDJKaGJRTHJK?=
 =?utf-8?B?TjVYcjdTVUJYTEJDVXNTTnpXeXQvN1N6NVdKdVZrY0lyTmgwd3dUbWsrN0ZK?=
 =?utf-8?B?ZUptdEE4Z0crV29FVGtXZHVPR1hGcTBQaVRTWkJXN2RzT1o0U2xZWnVoMWdh?=
 =?utf-8?B?bGJ6ek53aGEwSC9FUkpRb3VuZHc0dlRhbzh5S0lndURBdmNyOUVWbk1UcytI?=
 =?utf-8?B?dXB6cTZiSXpMZ05tOURYN3g3WjJPMGJiZklyQk1ZZ3d6NEZTd00xdCtCaUEx?=
 =?utf-8?B?SENLOW5qLzBKRUs3a0lPMThhektuNk5UQ2JDMlBoaks1dUplK0ZCSWdZOUF4?=
 =?utf-8?B?a2lOT2w5eWdWamp4UmlxU2diZ2dKWXpVVzZLZE14Vm9ncmczUzUwMUdQb0FX?=
 =?utf-8?B?eklxNXc2UTdSVStpU2dYOEwxRkxuNmp5TU5PRXhPbll1YVRHQmcrZU4yQVZE?=
 =?utf-8?B?QXJsalJxUitTR0swcEczMmkvU0YzMlJYbEpuZzQreUxwQURFSGltc3JmYnNv?=
 =?utf-8?B?VWRPVVB6MXlTUmVxc3VHNGtDOHRoRlRjZDBiUng5TzRKa2RXelFjVm8wVXc0?=
 =?utf-8?B?eXNDQVZNdStId0ZONGxrQ0lZU0JkQ01uYU4vN1llUWZlbUdKK0p5bURaazkw?=
 =?utf-8?B?a0VIdm9wcHNOZXJlUG5OajJqVjFhYVJXeWgvSzQ0K1JBSUh0Z1BnRWpESWgx?=
 =?utf-8?B?WWUrbEcvNmlXWnNzSnY3U0NPbUgvV0RTdnk4dVdwUHNnbGxzRUN0WFBZRWVJ?=
 =?utf-8?B?T05mU2pLZjZPUG9CTlpGZmkwUXlFc29rYm40R0JMb3d4SDlNU2x4c1pxRW9I?=
 =?utf-8?Q?5+QwuN3u3iVzm/0QrRRTl9L+e?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 564de2cf-b218-4a1e-541f-08de1756688d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 01:48:22.1309
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ieuCqvO6Oqgax9i0yjzqLx1Wgkwuc+Qmzsu4ReoaI/DkZk3jJTZ0UglQucnTocUgAvWx0zEoLSKu2+knOCWry2QH4qeIhld7UbPxgtqnja0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6059
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyMSAyLzRdIGR0LWJpbmRpbmdzOiBpMmM6IGFzdDI2MDAt
aTJjLnlhbWw6IEFkZCBnbG9iYWwtcmVncw0KPiBhbmQgdHJhbnNmZXItbW9kZSBwcm9wZXJ0aWVz
DQo+IA0KPiBPbiAyOS8xMC8yMDI1IDEwOjI1LCBSeWFuIENoZW4gd3JvdGU6DQo+ID4+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjIxIDIvNF0gZHQtYmluZGluZ3M6IGkyYzogYXN0MjYwMC1pMmMueWFt
bDogQWRkDQo+ID4+IGdsb2JhbC1yZWdzIGFuZCB0cmFuc2Zlci1tb2RlIHByb3BlcnRpZXMNCj4g
Pj4NCj4gPj4gT24gMjcvMTAvMjAyNSAwNzoxMiwgUnlhbiBDaGVuIHdyb3RlOg0KPiA+Pj4gVGhl
IEFTVDI2MDAgSTJDIGNvbnRyb2xsZXIgc3VwcG9ydHMgdGhyZWUgdHJhbnNmZXIgbW9kZXM6IGJ5
dGUsDQo+ID4+PiBidWZmZXIsIGFuZCBETUEuIFRvIGFsbG93IGJvYXJkIGRlc2lnbmVycyBhbmQg
ZmlybXdhcmUgdG8gZXhwbGljaXRseQ0KPiA+Pj4gc2VsZWN0IHRoZSBwcmVmZXJyZWQgdHJhbnNm
ZXIgbW9kZSBmb3IgZWFjaCBjb250cm9sbGVyIGluc3RhbmNlLg0KPiA+Pj4gImFzcGVlZCx0cmFu
c2Zlci1tb2RlIiB0byBhbGxvdyBkZXZpY2UgdHJlZSB0byBzcGVjaWZ5IHRoZSBkZXNpcmVkDQo+
ID4+PiB0cmFuc2ZlciBtZXRob2QgdXNlZCBieSBlYWNoIEkyQyBjb250cm9sbGVyIGluc3RhbmNl
Lg0KPiA+Pj4NCj4gPj4+IEFuZCBBU1QyNjAwIGkyYyBjb250cm9sbGVyIGhhdmUgdHdvIHJlZ2lz
dGVyIG1vZGUsIG9uZSBpcyBsZWdhY3kNCj4gPj4+IHJlZ2lzdGVyIGxheW91dCB3aGljaCBpcyBt
aXggY29udHJvbGxlci90YXJnZXQgcmVnaXN0ZXIgY29udHJvbA0KPiA+Pj4gdG9nZXRoZXIsIGFu
b3RoZXIgaXMgbmV3IG1vZGUgd2hpY2ggaXMgc2VwYXJhdGUgY29udHJvbGxlci90YXJnZXQNCj4g
Pj4+IHJlZ2lzdGVyIGNvbnRyb2wuDQo+ID4+Pg0KPiA+Pg0KPiA+PiBUaGlzIGltcGxpZXMgeW91
ciAicmVnIiBwcm9wZXJ0aWVzIGhhdmUgbm93IGNvbXBsZXRlbHkgZGlmZmVyZW50DQo+ID4+IG1l
YW5pbmcgYW5kIHRoaXMgd291bGQgYmUgcXVpdGUgYW4gQUJJIGJyZWFrLiBXZSBkaXNjdXNzZWQg
dGhpcyBwcm9iYWJseQ0KPiAxNSByZXZpc2lvbnMgYWdvLg0KPiA+PiBXaGVyZSBkaWQgeW91IGRv
Y3VtZW50IHRoZSByZXNvbHV0aW9uIG9mIHRoYXQgZGlzY3Vzc2lvbj8NCj4gPg0KPiA+IExldCBt
ZSBleHBsYWluIG1vcmUgYWJvdXQgInJlZyINCj4gPiBUaGUgJ3JlZycgcHJvcGVydHkgY29udGlu
dWVzIHRvIGRlc2NyaWJlIHRoZSBzYW1lIHJlZ2lzdGVyIHJlZ2lvbnMNCj4gPiAoYnVzIGFuZCBi
dWZmZXIpIGFzIGluIHRoZSBsZWdhY3kgbGF5b3V0LiBUaGUgc2VsZWN0aW9uIGJldHdlZW4gdGhl
DQo+ID4gbGVnYWN5IGFuZCBuZXcgcmVnaXN0ZXIgbGF5b3V0IGlzIGNvbnRyb2xsZWQgYnkgYSBi
aXQgaW4gdGhlIFNvQy1sZXZlbA0KPiA+IGdsb2JhbCByZWdpc3RlciBibG9jaywgcmVmZXJlbmNl
ZCB0aHJvdWdoIHRoZSBuZXcgJ2FzcGVlZCxnbG9iYWwtcmVncycNCj4gcHJvcGVydHkuDQo+ID4g
VGhlcmVmb3JlLCB0aGUgbWVhbmluZyBvZiB0aGUgJ3JlZycgcHJvcGVydHkgZG9lcyBub3QgY2hh
bmdlIGFuZCBubyBEVA0KPiA+IEFCSSBicmVhayBvY2N1cnMuDQo+ID4NCj4gPiBTaG91bGQgSSBh
ZGQgaXQgaW4gY29tbWl0IG1lc3NhZ2UgYWJvdXQgInJlZyIgPw0KPiANCj4gVGhlbiB3aHkgZG9l
cyB0aGUgYWRkcmVzcyBjaGFuZ2UgZnJvbSAweDQwIHRvIDB4ODAuIElmIGl0IGlzIHRoZSBzYW1l
LCBpdA0KPiBjYW5ub3QgY2hhbmdlLg0KPiANCj4gWW91IGFyZSBkZXNjcmliaW5nIHRoZSBJTyBh
ZGRyZXNzIHNwYWNlLCB0b3RhbCBhZGRyZXNzIHNwYWNlLCBhcyBkZWZpbmVkIGJ5DQo+IGRhdGFz
aGVldC4gTm90IHdoYXRldmVyIGlzIGluIHRoZSBkcml2ZXIuDQoNClRoYW5rcyBmb3IgcG9pbnRp
bmcgdGhhdCBvdXQuDQoNCkJ1dCB0byBjbGFyaWZ5OiB0aGUgYWRkcmVzcyBjaGFuZ2UgZnJvbSAw
eDQwIHRvIDB4ODAgaW4gdGhlIGV4YW1wbGUgaXMgbm90DQphcmJpdHJhcnkuIEl0IGNvbWVzIGRp
cmVjdGx5IGZyb20gdGhlIEFTVDI2MDAgU29DIGRhdGFzaGVldCwgd2hlcmUgdGhlDQpJMkMgY29u
dHJvbGxlciBiYXNlIGFuZCBidWZmZXIgcmVnaW9ucyBhcmUgYXQgZGlmZmVyZW50IG9mZnNldHMg
Y29tcGFyZWQNCnRvIHRoZSBBU1QyNTAwICgweDgwIC8gMHhjMDAgdnMgMHg0MCAvIDB4MjAwKS4N
Cmh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9ibG9iL21hc3Rlci9hcmNoL2FybS9i
b290L2R0cy9hc3BlZWQvYXNwZWVkLWc1LmR0c2kjTDU4OQ0KaHR0cHM6Ly9naXRodWIuY29tL3Rv
cnZhbGRzL2xpbnV4L2Jsb2IvbWFzdGVyL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC9hc3BlZWQt
ZzYuZHRzaSNMODg4DQp0aGUgY29ycmVjdCBoYXJkd2FyZSBsYXlvdXQgcmF0aGVyIHRoYW4gYSBk
cml2ZXItc3BlY2lmaWMgb2Zmc2V0Lg0KDQo+IA0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5
c3p0b2YNCg==

