Return-Path: <openbmc+bounces-930-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB17C77AEF
	for <lists+openbmc@lfdr.de>; Fri, 21 Nov 2025 08:23:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCRX51zC3z2yD5;
	Fri, 21 Nov 2025 18:23:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c405::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763709797;
	cv=pass; b=PDiVtyBCuq0FvXkaKuNRmd5mhWXcfLb6w4Kfba7cwwYDyckqQC/qEW/XnWRXbYkqhBmm4P28v86DyV4+j2gogNUqZeShkcpm51/0NbGE5ZVUBVYOxSiJZ/pN7hLA8gjlogt+faOQshjVYZRr5ZxMvd3F8uJZ0pERMkGUjoEIPCTMBINHjuE01JQlBNE5pGc4AaA3lA5B3/G11K7N/psl+YJfqvK7zDqFz9pDrtbRtdv87Jg6oACkPwG8Osr1xjx+J+HozlB8eW1fErbxN+6zE+Dcd151gipdGFbwBcAXjIj5yfcYQxBU9cWHHPyIZZ/iUYjZYNI6AUL4B/sL2b7a9A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763709797; c=relaxed/relaxed;
	bh=dxfwlGGonHje9mcgFt5w1W06k+Ns3rA3miCyZmma4Cc=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=b5BA5NgOsvrccUDoaD0vHcbjf2+3WmEPBgXC/qVyqB8c5TqqIyDGMgmmWMhXDDNhHNmn221dHC5jBxhY2wyQ2fkS9sXGtVqJMt8oageBBQA+IeWZtJ8lVw76qOTaMXlFbbm6AWXeWc6Y+GAfDLl8SaGUU5y08waUrx1znlGyQACcz2U2loBedFDeGf4xNQC+XV4UmoHIikcnmkH3J936nOzdP1tq05S9gUkY1a+Fsy0hYjBkM4ItCuzNhGaE0mSkJAftnJzK5xM5rP0UMB6bTBTkNuKAT18ZgfZHs18lZox7IRyA15ZrHh8hmP/Cr2YbTb8PfysyuZomglMZQEp/qw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=FtbJw7ld; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c405::5; helo=typpr03cu001.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=FtbJw7ld;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c405::5; helo=typpr03cu001.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c405::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCRX404T6z2y5T;
	Fri, 21 Nov 2025 18:23:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KtTPga8W3T6R0QJnKZBhi3h9Nno4PXW0ZHfa99HRQRgkLQW8gUYfKFpFtNXImb0dbEuhdp3ZmxATYikrZJYmS10mtLgEf4u2jhf2M5te/lMug+JStQ191laZEoyIIkQhNGC6Q2w/tx/wt1pCRIFcGKgsHmqisusZIskSvcXYaDQmjck0dkmwUxPAvdWs8bTN70T+GDIAMSzs+Zk4R+J0/bI4+N7eKeXd1qb44AtUX8ZhEHgQEcpokONO3IvTzSyJJbKghFQKYwBuSjPFqN2gaybjCG28A1/oklgw9bC+k9VlQrZz7F/hAI3E1cvcCsBvnBh4j3BYDX35Qps84CWgAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dxfwlGGonHje9mcgFt5w1W06k+Ns3rA3miCyZmma4Cc=;
 b=mAXeKxlgfTEW0R0J7D6ReOJx3XSS6RKoQGDKv9RPxfME0Bgueh9sedcj5W8HYNONmqbkeeiuV9xkUtY5BL1Sp2WoJG7Xl5VIq86Ir7JC9MLMIvSLsi38BEmLh1SIYFblfEqZVagSouqz5110QaDH9E83cEU4+ygV7krTvDdz6k4p0dlj2sMI/Mgnn1xbscH4oIR4RrL8nkeevyamVPCxiKfgvk9c6K3RnX61vjMGEegIM/Zgx3zZtWpXgSXVsXbGWoBGD1q35mEDMBIeZuhAvEeVZ7FqHBbvR/dP7eO/qIocc8tDo8YXzK9dc5czpfUsGSv1nie9M4+3eD/1+l0/jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxfwlGGonHje9mcgFt5w1W06k+Ns3rA3miCyZmma4Cc=;
 b=FtbJw7ldpQEtHiiB+WmONEx/1DarbDo6ffqORw7oasN6VPKIH4oT4UxncX0uU3T6k4MufLxnjz5coN14hVDvX1PFfBESzuRNv1wfkZlE+eQHwvWpZSkds8PavIgtm7tbiq7tJxQtpOf+2mzx3TelxOcg20t6vhpQZEqShQEDVsCPixtmIzi7+1Gi10zdaCBVscVzVrWRZpS/LXQh2wBPEuZqkxxv6d1QxWEyy0vISU8ON/hpnrhc5+SCpv1pin7MgIadqtNAwD1NrsT/ZsXJgwduV45Ujwb+Ui7WWmljCu5su5jem1gCZshf7YvQQgVqwX1J4VAbEV+KVX7umW7g+A==
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com (2603:1096:408::791)
 by SEYPR06MB5695.apcprd06.prod.outlook.com (2603:1096:101:bc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 07:22:51 +0000
Received: from TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80]) by TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com
 ([fe80::df4f:b1a1:1825:4a80%7]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 07:22:50 +0000
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
 AQHcQisKZrgNdIKVU0mDlJSyYndfALTQ+A6AgAfdvQCAACofAIAT7eJAgAOJTnCAABhjAIABSC2ggArwQDCAACHvAIAAAOlQ
Date: Fri, 21 Nov 2025 07:22:50 +0000
Message-ID:
 <TY2PPF5CB9A1BE6B4BB7A8237EE8A125B2DF2D5A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20251021013548.2375190-1-ryan_chen@aspeedtech.com>
 <20251021013548.2375190-2-ryan_chen@aspeedtech.com>
 <0b76f196-f642-4991-ad5c-717c23938421@kernel.org>
 <TY2PPF5CB9A1BE6597ECD46BD4CB7C5F09FF2FAA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <3c3287f6-1c5c-4c4d-9349-32665a5e1585@kernel.org>
 <TY2PPF5CB9A1BE6FE06477B9CC51B8133DAF2CFA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <TY2PPF5CB9A1BE67DBBC08424DD062549BDF2CDA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <28fa635b-f9a6-41c3-8199-9630ed3e7649@kernel.org>
 <TY2PPF5CB9A1BE6C0ACB11FE9BB209B9273F2CAA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <TY2PPF5CB9A1BE605A022105E6F1B6AA8F5F2D5A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <3f81e6dc-65c9-4c99-ac5a-43bea16d6e55@kernel.org>
In-Reply-To: <3f81e6dc-65c9-4c99-ac5a-43bea16d6e55@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PPF5CB9A1BE6:EE_|SEYPR06MB5695:EE_
x-ms-office365-filtering-correlation-id: 47ff5d2b-a2c7-4fb5-e589-08de28cec783
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?V09GT1ZRa0JxTFFpMlJ3RnBsK3dZeEZURGk3VkJBT3FrTENEdnlsRlcza1gz?=
 =?utf-8?B?RG9WeWlQcXYxbEFCZWNUTTJlM0RnQzRuV0cyMmZIL0k1UnpxQXp1YVBiY3Ar?=
 =?utf-8?B?TW94RDlYZ2x2THVHMkgxK2NlVlh1T1pDUnoyWjhBNy9vS05vaUk4QU85QVF2?=
 =?utf-8?B?ZGlwc0Z5dndNOWMxd2d3U04waS9OWk9wTVFEeGxPelhrZ1lIeTFQR1JlR0pK?=
 =?utf-8?B?Mml6bFpHQkxmbXhSbm1ScitvMVJjNzl3K09uc1Y1Z0lWNGxDZ2xNQk1EOTdh?=
 =?utf-8?B?SSttMXQwNjVOYkJFenlzYW5JWDl5dit1SDVNUUV0UStWSzZ1MkZiUDNFb25Q?=
 =?utf-8?B?b2hsY2xkNlREZUxORHlKcU1FSEN3VTI2K2syOERQQVhYbmZJUUNJVUNub0JC?=
 =?utf-8?B?NU96cDRDTGNYZHUwaTFGZ3ZhWlVQNCtublFiOTJ1ZUlHZmg3UFVzVGdrV3Nl?=
 =?utf-8?B?a3dncFhUR015TGVyQVdaN2s1T1p5UG1SaUM4bkxoYUdHYXZQenZLSndTSm9o?=
 =?utf-8?B?MTFpTDBFVGVQNWgrMWg3bkVVbG5KM3FIS1FCQ1pCc0d1S3pvM0pSWVZ3b3FB?=
 =?utf-8?B?dGJZZkRnYjhWbFMvL0JVSC9zYndTWFFjdkJDdVZ1WjJ3UkdqN0hkSGd6T0I4?=
 =?utf-8?B?UERXMWtuTW4wTnhrc2lXa3habDc5Q3JvUTBSaXBNcWg2Y1VYbGpiRkdDa013?=
 =?utf-8?B?RTRGQm5EcXVnSWVNd1VBbFZubkVVV1FDZTZaZWhtZFFMVnBLc3ZtUGJiRFpx?=
 =?utf-8?B?K2dEQWdJMFl6dE5sK3VlVEZLL1VkYk1QQk9ZaGUyTVFUUXovcGlCYVQ4QnRr?=
 =?utf-8?B?NG1RVk5tc01rSGFQSUYwRVFDNkttTEpoRkFVdmhHT1FzaWZXUGJBdUZxaGxN?=
 =?utf-8?B?MXU2b1g0MHRqc0F4RHBaMjZnbERra08vVVE2bzI3RFVUWVBkSHoxWFNvNTBV?=
 =?utf-8?B?SHgwOG13MFF0SWxyeitVNXNERUo0WTUzRWxQWWZKOGJXenJPU3hvTGkzM25P?=
 =?utf-8?B?ZDh5M3FqYk5IN1dLTTV3K1l2QkcwTzJkcTVsbmlQUGpCc1Jqb015dDU3aC9V?=
 =?utf-8?B?cndhQjhkN2I3a2JBcnRZT3VERUtlTjdEN3dmV2tRZTZSc3hwWkoraEFwM0JG?=
 =?utf-8?B?UVFvRXp0RUNCNlhmUGoyTVRKYkJGYnJ2N3dKdkJNMDRzQ1ZIUy9KTDZvNkI1?=
 =?utf-8?B?ZU1aVm9hUTg2UlJrblJ6USszYnRtVkxkUmdaSHNpbU9zMStnNG4vS2RDTStK?=
 =?utf-8?B?TDMrTWtZY3NZSmVWamV6N3pZOE1xNEkreXM4ZWVwRlBFZzFwS1lsVnFLM21p?=
 =?utf-8?B?S2F6WFJOczF6Y3hxckNhR2k1bnJmRlJ5L3JDUVpwNE5ySkRXN003SWx1WkFS?=
 =?utf-8?B?L2ZZR1Nhc3orUUxtbkVPNllmSmRLNFc3d05PSkViUVNJT1NNdCtsQm9uZmll?=
 =?utf-8?B?R0xtV3J6MzdsTXpaa0U0K1pFQ0JVNG8zdUFtZVdWTzJCOElPZjI3dTdDWTkw?=
 =?utf-8?B?QWVxWEJSd3czNGFCUFk1bVFZUmdEYUhBVWZ1Z0hVcXg1L3A3YklHM2U1NGxR?=
 =?utf-8?B?NFlpOE1QNmFVNk80TGw2YWMxK3QvWHVaaXZMb3pVVmREdEFWSlVUMVgvNitw?=
 =?utf-8?B?d1pRdC9ZQ3VNRThMcVE3eTl0UStNMlpFaitKenIvYkRuaER0WnNZcDFZNm5V?=
 =?utf-8?B?UDRSWHkrWDBGRzVsaTZpRXRUcUxkTmJ6YVQ3MUgwa1ZSamRPRzBEaG1XeVJ4?=
 =?utf-8?B?RHZvRWMwZXV3ZWd6eUFqTkl6emhpakI2UnorbkkyZzIzMTNuVGRvVWNCTkh6?=
 =?utf-8?B?cC9EQkxMdHpYbTZ3RzZDMVdWeFN5MXV2SmlXckpsbHBzam1HN3huYTVjMjBX?=
 =?utf-8?B?a1VTTzhDdUEzWWhpSmlSaXFXTWlTTVl1NGs1QTZYTUlaVE5VS1A5cHNzMUxh?=
 =?utf-8?B?cUJXbklTall1ZE1ENVZnWmJBTjZaeStUK3QvRno2bXVGNjd1TTZBZmJNL3ZY?=
 =?utf-8?B?dHB0blpLd25Jd1lLWFV0eXgzU3k0NytKN0I2K2EwQXFweHVUSUR6TjF6TGRh?=
 =?utf-8?B?cUFZeHNvRndTM0h1WEVUc2pLZWd5YjFqcUFqUT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MktGOEl4SW16bHlKNnRxYWI2c3FZaWNNK2FMSzZOaVRjMFhudFRzc3lIdXJG?=
 =?utf-8?B?ZE5mbUdlUkJFY1pXK1Z2dGVWbU1lZTZOZGdKMzhOTUp3SHJhT3Q1Z25CVVpY?=
 =?utf-8?B?QkVJUVFHYkVidlN3eC93b20yRVQxK3RZdXNxT3JrYkJNdC9CLzNuR2ZnN2Ex?=
 =?utf-8?B?azNITkJPM2cvV0pCSW85MFl1emhzODlxVjNFWHhlZ0U2aVlJRkNaaXVCQWZ3?=
 =?utf-8?B?UnhhN090YjBwNXh0a2hFQ1JMTVdaeVA2dFVXQlZjM29iZ2dPZEFDTTR6UG5l?=
 =?utf-8?B?KysyZ05aS3pEb0RDQ2NMenBMT0N1NFFkLzVueFUyYkMrVko4TDViQUVYWlF3?=
 =?utf-8?B?UzRuVCtSVXBid252eFpXTWtOdGtacUVidm4zaDNZY1I3a2lHQXFXSWM3WDh6?=
 =?utf-8?B?RzVpUnlVTDhDWDcrYnZlOWUrNXVMUldFYlQvSUxLSUZwcFo4VENrbGZEaXNY?=
 =?utf-8?B?RUh4T2tJejIwV0tlcStHRFcyMEVMR0UrZkVDbWtMY3RtQTZpMEpMLzdKODJQ?=
 =?utf-8?B?ekUwQkpIV2JiWDBUMTlSSTBpMHpCVk1BWlhnNDlDeE9qV2NsS3BMNUlwVDBH?=
 =?utf-8?B?WktlUjF1NzJNOENWSXNFSGlDVHBZVVA2WnJ3cW5vSk5tNnlDL0JKdmFjYkds?=
 =?utf-8?B?azc3dGhBRkNPYkdXSW1SRGlQMzlzdG5TdDlHMXNwS0diWGlrV0czQXNINjRZ?=
 =?utf-8?B?b2hQS3NVQ3M1OFhTTThsa2k0bzNDYXlhUmxjYzduVnk3T09zNEJaNzlqTHN6?=
 =?utf-8?B?R2M2cmlYeVUzUm50cWViLzJaSCtmTjE3T1BOc00vNDI5dUduU3FadklHb0Zp?=
 =?utf-8?B?ZkFDNE1qekZlQUs5Z0NUWHRxdHNDYS92LzBEUndrM0YvTjBQWFhpOTFYWXZk?=
 =?utf-8?B?QWZpMWJ2bXQxbXpzbGZuYitOSG54anZZRVV4Zk8vZU5sOWdkeEdBeVZjeU16?=
 =?utf-8?B?RldBMmE1Q3FtVFRCcTkvM2c4aWxYbEZVVWhrOGlDRGVUTWF0Q1licUg3bnRG?=
 =?utf-8?B?cFhCR3krKytZVC90RUtyWk94RnpoVnNiRVVKRjRPNWtCbk55cFFZR3Rva1Yv?=
 =?utf-8?B?NHIveHdGNHp5dk1vYUlQQjhlYUVIeWZKV0VqY1luZW9oVVJtZ2JXZGJaNW9E?=
 =?utf-8?B?WHR2eDJLRzdEc3gwMEtzWTc1QXhoNEhFbnYvN0NFL3Y3Y05PcTRYaGpEZVdG?=
 =?utf-8?B?Ym5PSVRnOGFnSnE4VGMzVUlaeWRHc0EveW84V3BIOElqeFhvWUoyVnB3VlJZ?=
 =?utf-8?B?dnpyTG1rc2NSbWN1QytsNzFpMHk1WityalU4a0Q3R1Z5eXRvT250dDV2Qy9U?=
 =?utf-8?B?R2JaNklUR2c0dnd5V1d2ZFZYNWRibHgvQzBoWDlpMEljbXQyREk4QzBDN1dj?=
 =?utf-8?B?RWhLcXVCWTZ1QXFFNEpUSy9SQnQySHF5RWM0MmFRQW5NOE5MZG9nVkUwbVFW?=
 =?utf-8?B?OXQzK3YzdHFzc050RG5scjhKTnhIS1ZzL3pXYWQzN29BQWtXa1FqelVHMWZw?=
 =?utf-8?B?eXhVdnVHTUw0ZmRldGxwOWppZzIxQ29qVWhjcmNDUUprcU1uWHhVTFYwMUtO?=
 =?utf-8?B?SUl6dXA0RTdjZFB6TDBPMVFiWE9RY1l5UktJM0txS2JDa3N2U1I4Tzl0YTNK?=
 =?utf-8?B?ZDU1ejdzajJzRzJrV0x5RlVZVTN1bldMQnRUQWpWRGsxVVQvYXRhK1d0OU14?=
 =?utf-8?B?YVlzZkdLTjNxK3krRUV5VDIzcDlKVDBvOHRtUXA5MU45MnNBUE95bEkwb2tP?=
 =?utf-8?B?SXhCbkhuQnhkVk05OU5ZTFVOWlNSdy8wS21hd1BMOUhGMk15dTIrN3U4TkY5?=
 =?utf-8?B?cW1uSHVtZzBocEVHTFVWWU0xbkNKTy9IekpUdFpVWUJMY3Q1S1crOGFQa3pv?=
 =?utf-8?B?YWt2SzF3ODBrV25XSjlQa054WUNGNnh0TGxjYkg2Rk1RYXRBTU9scmpobWh2?=
 =?utf-8?B?a2lEZ1ZicWNLcmQ1akUyOFM5YXhWQU83QjBmeVdtamZjcXcwT1RTazNDU05y?=
 =?utf-8?B?NmRDRUpvSU93bTFXazFWWHRJREg5NXJmbDFoN2ZxaHJnVTBtMjlacFJ1OTZB?=
 =?utf-8?B?S2ZKWnA0bXhLellPMjdtYkVjR3hmWDFqQW9ONDRBYVFkam9GTEl2N0Qxck51?=
 =?utf-8?Q?kFJHIVDOsen1GcqtLGMDC5Cg8?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 47ff5d2b-a2c7-4fb5-e589-08de28cec783
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 07:22:50.8290
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GchVbJBIuhPTCLK8n//4DIwGhon9uskRuMAVTvdtFfCR+BkNb9DAuBN0XZ3+WhHxzxl68heWZVtUxxfHvKc7iJXXy9fc7TVAU9oPdJ8ION4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5695
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyMCAxLzRdIGR0LWJpbmRpbmdzOiBpMmM6IFNwbGl0IEFT
VDI2MDAgYmluZGluZyBpbnRvIGEgbmV3DQo+IFlBTUwNCj4gDQo+IE9uIDIxLzExLzIwMjUgMDY6
MjMsIFJ5YW4gQ2hlbiB3cm90ZToNCj4gPj4gU3ViamVjdDogUkU6IFtQQVRDSCB2MjAgMS80XSBk
dC1iaW5kaW5nczogaTJjOiBTcGxpdCBBU1QyNjAwIGJpbmRpbmcNCj4gPj4gaW50byBhIG5ldyBZ
QU1MDQo+ID4+DQo+ID4+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyMCAxLzRdIGR0LWJpbmRpbmdz
OiBpMmM6IFNwbGl0IEFTVDI2MDAgYmluZGluZw0KPiA+Pj4gaW50byBhIG5ldyBZQU1MDQo+ID4+
Pg0KPiA+Pj4gT24gMTMvMTEvMjAyNSAxMDozNCwgUnlhbiBDaGVuIHdyb3RlOg0KPiA+Pj4+Pj4+
Pj4gKyAgcmVnOg0KPiA+Pj4+Pj4+Pj4gKyAgICBtaW5JdGVtczogMQ0KPiA+Pj4+Pj4+Pg0KPiA+
Pj4+Pj4+PiBXaHk/DQo+ID4+Pj4+Pj4NCj4gPj4+Pj4+PiBXaWxsIHVwZGF0ZSBhcyBmb2xsb3dp
bmcuDQo+ID4+Pj4+Pj4NCj4gPj4+Pj4+PiByZWc6DQo+ID4+Pj4+Pj4gICBtaW5JdGVtczogMQ0K
PiA+Pj4+Pj4+ICAgbWF4SXRlbXM6IDINCj4gPj4+Pj4+DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gTm8u
IFlvdSBjaGFuZ2VkIG5vdGhpbmcuIEluc3RlYWQgZXhwbGFpbiB3aHkgdGhpcyBpcyBmbGV4aWJs
ZS4NCj4gPj4+Pj4+DQo+ID4+Pj4+PiBTZWUgd3JpdGluZyBiaW5kaW5ncy4NCj4gPj4+Pj4NCj4g
Pj4+Pj4gU29ycnksIEkgc3RpbGwgbm90IHVuZGVyc3RhbmQgeW91ciBwb2ludC4gRG8geW91IG1l
YW4gbmVlZCB0bw0KPiA+Pj4+PiBleHBsYWluIHdoeSByZWcgaXMgZmxleGlibGUgMSAtPiAyPw0K
PiA+Pj4+PiBJZiB5ZXMsIEkgd2lsbCB1cGRhdGUgdG8gZm9sbG93aW5nLg0KPiA+Pj4+Pg0KPiA+
Pj4+PiByZWc6DQo+ID4+Pj4+ICAgbWluSXRlbXM6IDENCj4gPj4+Pj4gICBtYXhJdGVtczogMg0K
PiA+Pj4+PiAgIGRlc2NyaXB0aW9uOg0KPiA+Pj4+PiAgICAgVGhlIGZpcnN0IHJlZ2lvbiBjb3Zl
cnMgdGhlIGNvbnRyb2xsZXIgcmVnaXN0ZXJzLg0KPiA+Pj4+PiAgICAgVGhlIG9wdGlvbmFsIHNl
Y29uZCByZWdpb24gY292ZXJzIHRoZSBjb250cm9sbGVyJ3MgYnVmZmVyIHNwYWNlLg0KPiA+Pj4+
DQo+ID4+Pj4gQWZ0ZXIgY2hlY2sgdGhlDQo+ID4+Pj4gaHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcv
ZGV2aWNldHJlZS9iaW5kaW5ncy93cml0aW5nLXNjaGVtYS5odG1sI2Fubg0KPiA+Pj4+IG8gdGEg
dGVkLWV4YW1wbGUtc2NoZW1hIEkgdGhpbmsgSSBzaG91bGQgdXBkYXRlIHdpdGggZm9sbG93aW5n
LCBhbQ0KPiA+Pj4+IEkgY29ycmVjdCA/DQo+ID4+Pj4NCj4gPj4+PiAgcmVnOg0KPiA+Pj4+ICAg
IGl0ZW1zOg0KPiA+Pj4+ICAgICAgLSBkZXNjcmlwdGlvbjogVGhlIGZpcnN0IHJlZ2lvbiBjb3Zl
cnMgdGhlIGNvbnRyb2xsZXIgcmVnaXN0ZXJzLg0KPiA+Pj4+IAkgLSBkZXNjcmlwdGlvbjogVGhl
IG9wdGlvbmFsIHNlY29uZCByZWdpb24gY292ZXJzIHRoZSBjb250cm9sbGVyJ3MNCj4gPj4+PiBi
dWZmZXINCj4gPj4+IHNwYWNlLg0KPiA+Pj4NCj4gPj4+IFBsZWFzZSBkcm9wICJUaGUgZmlyc3Qg
cmVnaW9uIGNvdmVycyIgYW5kIHNhbWUgZm9yIHRoZSBzZWNvbmQuIEp1c3QNCj4gPj4+IHNheSB3
aGF0IGlzIHRoaXMgLSBjb250cm9sbGVyIHJlZ2lzdGVyIGFuZCBjb250cm9sbGVycyBidWZmZXIg
c3BhY2UNCj4gPj4+IC0gYW5kIHNlY29uZCBvbmUgaXMgbm90IG9wdGlvbmFsIG5vdy4NCj4gPj4N
Cj4gPj4gVGhhbmtzLCB3aWxsIHVwZGF0ZQ0KPiA+Pg0KPiA+PiBpdGVtczoNCj4gPj4gICAtIGRl
c2NyaXB0aW9uOiBDb250cm9sbGVyIHJlZ2lzdGVycw0KPiA+PiAgIC0gZGVzY3JpcHRpb246IENv
bnRyb2xsZXIgYnVmZmVyIHNwYWNlDQo+ID4+Pg0KPiA+Pj4+DQo+ID4+Pj4gV2hhdCB5b3UgcXVl
c3Rpb24gYWJvdXQNCj4gPj4+PiAiIFBsZWFzZSBleHBsYWluIG1lIGhvdyBvbmUsIHNhbWUgU29D
IGhhcyBvcHRpb25hbCBJTyBhZGRyZXNzIHNwYWNlPw0KPiA+Pj4+IEkNCj4gPj4+IGFza2VkIHRv
IGV4cGxhaW4gV0hZIHRoaXMgaXMgZmxleGlibGUiDQo+ID4+Pj4gVGhlIEFTVDI2MDAgaTJjIGNv
bnRyb2xsZXIgaGF2ZSB0aHJlZSBpbyxidWZmZXIsZG1hIG1vZGUuDQo+ID4+Pj4gVGhlIEFTVDI2
MDAgaGF2ZSBidWZmZXIgcmVnaXN0ZXIgZm9yIGJ1ZmZlciB0cmFuc2Zlci4gVGhhdCBpcyAybmQg
cmVnDQo+IG9mZnNldC4NCj4gPj4+DQo+ID4+PiBTbyB0aGUgU29DICpIQVMqIGl0LiBJdCBpcyBh
bHdheXMgdGhlcmUuIEl0IGNhbm5vdCBiZSBtaXNzaW5nIGluIHRoZQ0KPiBoYXJkd2FyZS4NCj4g
Pj4+DQo+ID4+Pj4gSWYgZHRzaSBub3QgZGVzY3JpcHQgaXQsIHRoZSBkcml2ZXIgd2lsbCBnbyBi
YWNrIHRvIGlvIG1vZGUNCj4gPj4+PiB0cmFuc2Zlci4gRmxleGlibGUNCj4gPj4+IGltcGxlbWVu
dCBpcyBpbiBkcml2ZXIuDQo+ID4+Pg0KPiA+Pj4gRGVzY3JpYmUgdGhlIGhhcmR3YXJlLg0KPiA+
Pg0KPiA+PiBVbmRlcnN0b29kLCB0aGFua3MgeW91ciBndWlkYW5jZS4NCj4gPg0KPiA+IEhlbGxv
IEtyenlzenRvZi4NCj4gPiAJQXBwcmVjaWF0ZSB5b3VyIHJldmlldy4NCj4gPiAJSeKAmXZlIHVw
ZGF0ZWQgdGhlIHJlZyBhbmQgY2xvY2sgc2VjdGlvbiBhY2NvcmRpbmcgdG8geW91ciBjb21tZW50
cy4NCj4gPiAJRG8geW91IGhhdmUgYW55IGZ1cnRoZXIgc3VnZ2VzdGlvbnMgb24gdGhvc2UgdXBk
YXRlcz8NCj4gCWh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MTExODAxNDAzNC44MjA5
ODgtMi1yeWFuX2NoZW5AYXNwZWVkDQo+IHRlY2guY29tLw0KPiANCj4gWW91IHNlbnQgaXQgb24g
Tm92IDE4LiBUaGVuIHlvdSBwaW5nZWQgb24gTm92IDE5LCBub3cgeW91IHBpbmcgb24gTm92IDIx
Lg0KPiANCj4gV2hhdCdzIHNvcnQgb2YgcnVzaCBpcyB0aGlzPyBJIGRvbid0IHJlc3BvbmQgd2Vs
bCB0byBzdWNoIHByZXNzdXJlIHNvIEkgd2lsbCBtb3ZlDQo+IHlvdXIgcGF0Y2ggdG8gdGhlIGJv
dHRvbSBvZiByZXZpZXcgcXVldWUuDQoNCkhpIEtyenlzenRvZiwNCg0KVGhhbmsgeW91IGZvciB0
aGUgcmVtaW5kZXIuDQoNCk15IGludGVudGlvbiB3YXMgbm90IHRvIHJ1c2ggeW91IOKAlCBJIGFw
b2xvZ2l6ZSBpZiBteSBmb2xsb3ctdXBzIGdhdmUgdGhhdCBpbXByZXNzaW9uLg0KSSBvbmx5IHdh
bnRlZCB0byBjb25maXJtIHdoZXRoZXIgSSBoYWQgbWlzdW5kZXJzdG9vZCBvciBmYWlsZWQgdG8g
YWRkcmVzcyBhbnkgb2YgeW91ciBjb21tZW50cywgc2luY2UgSSB3YXMgd29ycmllZCB0aGF0IEkg
bWlnaHQgYmUgbWlzc2luZyBzb21ldGhpbmcgaW1wb3J0YW50Lg0KDQpJIGFwcHJlY2lhdGUgeW91
ciB0aW1lIGFuZCB5b3VyIGd1aWRhbmNlIG9uIHRoaXMgc2VyaWVzLg0KSSB3aWxsIHdhaXQgZm9y
IHlvdXIgcmV2aWV3IHBhdGllbnRseS4NCg0KQmVzdCByZWdhcmRzLA0KUnlhbg0K

