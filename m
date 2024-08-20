Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77456957AF7
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2024 03:30:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnsNJ5HmKz2yxS
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2024 11:30:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c400::" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:c400::; helo=hk2pr02cu002.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c400::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WnsMh3Qzvz2xKx;
	Tue, 20 Aug 2024 11:29:39 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YbtXpme1du9e2LFdTadiuldngsKzimsmxuOD+b1NGMe0gUwU2Sjf+CNbPSMLkNNKo68z/ZcsZZnEmvDZ+UQzWICWKmNV/hJT8W+XDlCQ2zjtUjvDkBNn8ArhV/ycVHuvrcEshiW5WRG4oTFn7Fp/5dlHyjrfHhUOY/hsRucHWSVqffTFTWxt6A4petcGy31j4MKPviYIA8yhCv9aasxkIqEQuPWcBJB30SW2AaYOmh+V0TqlxS9ivG1UItK8Zxnd9maIvxLtdaKGkc7moSR9D6K6IfmBtelyNViBjbGZpcmIILcb2HSiVR2CKS3Mda1Cx/DcOQwS3QUzNZDLqGSYfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUVdLDqEzUQFzLIvyy1ZSGhaRnnVA2G/NYh1/YAU/Nw=;
 b=OXd6pUsXQ4U0KxARO12YgyPDFKqOmjt5CVdhmpyxb1Zl67x8YePJE4MzEWYoCeLXSK1WGfCjcq6p9Fw3yv2Pd94Q2C4yAe4bFvWO7aVWqtprmtEf9gM67XtGKWq8Z5KaZMfcmlY3w+W9SdXwhYMWaOOPZko0WB19aAHbxF8B/1+7EtNMpUQPSv+CsFZ1pYz1MWYtcCRFKle2x29ze3llQe1au7zplQ0r5pfLA7jW0IPgwDxpehMPB2/PNs23z6GCRYW4lQVtOxs9oq7bV3yzLPDt9Wa/1lvc4E0+PVeCPJ4ot9FiF7qhV6tEbtCWA79TNKENJzjSRunv+CK1svFE4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUVdLDqEzUQFzLIvyy1ZSGhaRnnVA2G/NYh1/YAU/Nw=;
 b=Id+vmBVgZRsSzFsir1lubneqqoh9JYqe2+qBF5dJjUTDvCK0IfbWvgLO0tOZS4tzyTifSVGuv77D4+uHg4kMfj2BXjymZIBK1yybPqFU8niDaaCzkOrAZihP8ZbSfJU4N0oWK0wV6twnym+v7XTNQmnUqt4nDfKXYN0OL5qTERV6+n19xTrAHKUcu7T+vCcjJltrecjXLtGJruk1Yc/Bnztl6qCnMuyZP78v9Pboz1XjmSUNEWcpgmxR25jYmxEeNwMDQM73RANsDlUpCnHraBtAHcNCLdeTA/lNUKZknntJGTTJygGFlE1SaBJ5kiuHcw98yxnuiHSlIktf1kZikw==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by SEZPR06MB6493.apcprd06.prod.outlook.com (2603:1096:101:187::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 01:29:13 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%5]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 01:29:12 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "brendan.higgins@linux.dev"
	<brendan.higgins@linux.dev>, "benh@kernel.crashing.org"
	<benh@kernel.crashing.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v13 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Topic: [PATCH v13 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Index: AQHa8ho549HAiRHYiEK49yrqFuaLn7IuYooAgAD5pxA=
Date: Tue, 20 Aug 2024 01:29:12 +0000
Message-ID:  <OS8PR06MB75418A2ACA6693A8163F19E8F28D2@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20240819092850.1590758-1-ryan_chen@aspeedtech.com>
 <20240819092850.1590758-2-ryan_chen@aspeedtech.com>
 <7237aa34-9821-4ba7-a45b-3b1d598bc282@kernel.org>
In-Reply-To: <7237aa34-9821-4ba7-a45b-3b1d598bc282@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|SEZPR06MB6493:EE_
x-ms-office365-filtering-correlation-id: 933b1f20-548f-4a30-3048-08dcc0b77f43
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018|921020;
x-microsoft-antispam-message-info:  =?utf-8?B?ZnppQldWSkF6dFEzblVUbk9hcU1kMlFtZFlaUGNuTkdRYWNCZHdWRWkwakJx?=
 =?utf-8?B?RldUWkx1a1pYbjVMZkVJT0puSFRGb2FrdGI4djdOREZMc25XaVRVeVNSTW1T?=
 =?utf-8?B?UVdDS0ZsRWV3OEZlQlVoWUl5Q3VBR1dZVkUvTlRTVzdsbGZmVVlGcmtzbit0?=
 =?utf-8?B?cm83N1UwNlNTZ3BvM0RXbkZ4SnlJTksySU1JelEzbSsrQ1VCclJMSHBQOElX?=
 =?utf-8?B?b3NRZHRTNVNuMVU1cFloZHd6VEhwdzN5dmJFY3AvWkY4RTI2SHpVWmFSTHBW?=
 =?utf-8?B?TUY3MGJQNGlmN3doaDE3dmp4cVFGTXhRRkFuZDFkbHFVaUV6aTJBMWpyN21W?=
 =?utf-8?B?NWhrQUpCYVIrbE1UQml0OHV4RHZIYTc5bWdHYWZOVEZMMjhxVVdYR3U1WWlk?=
 =?utf-8?B?dG82RDNiY1gvVlUvMTRIeGpXeDVoR3pUVlN2YzdCTm4zcTZNbFNzaWVualJE?=
 =?utf-8?B?NmMxRWVBKzNDdlcrN2M2Uys2SFFGOVR6L0VhWm5jMnVjWGtxSGx2djI1QmpL?=
 =?utf-8?B?ejkrTnUxK3NJL0hCbGtCRjVCcVFCYXUxekgvSXpBeUt5eElIbHVzZTlqYUVx?=
 =?utf-8?B?aG5kbGt4azVYWjBKRGo1R0ZrMmVKdUxRQkJYNitvN1pyNXlQdFU3MGpDdmJx?=
 =?utf-8?B?SVhhQTc3VTRHVjF0K2ZvVnZTdDFTQjJnNUl5WUorK1llWEkxTTByZzZXT0pR?=
 =?utf-8?B?dlBjN1ZtbmlWRzVZV2lJOU9XdDIzMnNnVzZ3bmwwbDZPUmJxNFh4bkxRQUt4?=
 =?utf-8?B?K0RxbWdnczUrWjkvVlRuS0c4QUtXZDFqN3JiT2QxMkh5ZmxtbXRwdGRuRzZL?=
 =?utf-8?B?a2FUTm53OUpsci8zeEtNZGc5WUlPWHJvQlR3YnZEMisvVDErQTByYjZJY2ZQ?=
 =?utf-8?B?b0c0SE5HbXp0ZDZuYjdRdkdyN1E5YkxpeTJGdjV1Q0VIRFNuNXI1SWxwNHBU?=
 =?utf-8?B?M2VTWDJQNDhldHBBNEVNVmd5TkhJeVRkZUwyVHRrUjhxOTQ1c2NnekRsQ1Zu?=
 =?utf-8?B?OFk2b09VK0swTFV1MGlJZGNFMWVXWGRTMEtkSUFiQTVQaDZuY2t5Y05meEVn?=
 =?utf-8?B?WUd2WGF5djZZdHhYMm1PL0VRVE53WnBhYUljVEVtYzR2b0RrVkpkTUxoMll1?=
 =?utf-8?B?aTU4b0duZzJMUitzSU0rVForM1QyNlcvSzZpSUpieWVGMmZ1cVoya0VlOHJJ?=
 =?utf-8?B?NXdGRXNQUEdtYXdxQVZHNnk1azh6VmVxT0ozc0V5MS9Wb25oVWU3cDFrcElu?=
 =?utf-8?B?czFlK0FvemsvZkw3SVN3NTgxMVN3dXErbDVkdENEREFTbHBIZHBZa0JvYi83?=
 =?utf-8?B?bDlIQmZJWHlta1RUR1JqTkhwVW1MNVpwZVAzeE94eHlGNXpzQ2d1cUxmaFhn?=
 =?utf-8?B?MDNOQW1NWU96MlN2RWIwWE1nRitzcTNZZCtOWXlJK2R0R1Juc1hGMDBPZGQx?=
 =?utf-8?B?eEpNQU8rckpwdDlxM3J5UnJzUGR5WWZCKytJMi9nbUlLSHU1YVdlcWRnYnNO?=
 =?utf-8?B?dXNsMVdMdGswOVlXQlQzdVl1Qk1GWVhaTFBHaCt0dVFMc25IMlFoc1g1Zm5X?=
 =?utf-8?B?ZE9Ob3lYYnJnUDNCTWEvOGdEYWt4Q1ZXajdZU1lCMUZJak9BQmFDWTlTZmJV?=
 =?utf-8?B?QzNqTVVzVm9kbGRCNlA1OTBPclVlSW5sMnVYbTRBZ3VtY3I1ZW95QVYvRHJw?=
 =?utf-8?B?TnZmcVg4OWtqdEo4bzhyczdZZzhSaDhJQWd6TWdaUzI1MEc2YWM4SjFrT1RG?=
 =?utf-8?B?d1h1RkxGK2x1ZDFpS1dMeEdhdDhqaHhJVlgydzFnMkNSY25Sc3VLUlFaaE1R?=
 =?utf-8?B?cjhNSEt1T3owaHBNZ085Tm1ydXM3SVRWQTVVckV3VGsxSHNzV0JXYm50S09D?=
 =?utf-8?Q?j3pBeEQC31jL4?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?anR2OFhBNlBBZFdaSVlGMmlvUFVtMjU1NlVZVGNPNGJrZzdlRXpIb0M5VGh6?=
 =?utf-8?B?SEY2bXBoa2xoaGg5Q3RZaklYUTFCMFlnMldtMGxsYWE3dUd4VGRQM2JJUWNH?=
 =?utf-8?B?eU90dC82QnltRlNlejVaUVBNclJrVTV6RGd3WEQxY2c4YUtBU0dQOWh6OHZM?=
 =?utf-8?B?MmtxSWhvZWZlRmdZbGR1U0ord1BnUkowTmo3SGwxNVkydG50V1FzR1RlS2Vp?=
 =?utf-8?B?eEhVS2NuNm4rb2trSU9zTEdHNHBpSno2c2dRSXNLelhaeks1aHhpVVNSM1ZG?=
 =?utf-8?B?a3RpMUdLb1JRZUJMVExFT3ZLaGhndXdoSTVYZFlMUHdmZGNqd0Vqa1JtZVB0?=
 =?utf-8?B?MTlJS3h2TkhGcnc1YXpTMmhPdDdHMW4rcFlZbWp0RythdE9mbHBaenFieTUv?=
 =?utf-8?B?bWYzM2FHN0F4bGwvM1NTb3dOb0wrNkhVTi9OS3MxalRoR1h4ODdKWG5TSExw?=
 =?utf-8?B?aktRVzIrd2JkT0RXMDRCRzlldEpBdFFqS1VWbk9QRlU3aUZ5Qy9SeE45UGlC?=
 =?utf-8?B?OFVZK3BRZlRuZW9kR3JHZUp2T0hPbEs4bWpLSmhhTG9GQkVaWXFIVlpCbjJw?=
 =?utf-8?B?RzRsbVhiSnVHajM1Wk15L1ljMXlpQklDUHF6UlVkcC9ZdjlvZlNWbHhXUVJZ?=
 =?utf-8?B?U1pJY3JFKzN5R1FyeGZOOVE3RUg2ZUhGbEE3NThZdGEwRWQ0UCtFRWM2WVRh?=
 =?utf-8?B?c254bEVoYWFMdzUrV055aHlKU1kxR0RDaGZOakdidmpoMG1tR1NkV1Y2Wisz?=
 =?utf-8?B?L3pxZnAzRkF6dUMrVGhaNXVram5uQVd2UEk4ZDZTRUlLejdudksyeDREZkVZ?=
 =?utf-8?B?T01kR09NTk9BYWJZa1ZINkN0cmdLakp5bnFxMzNGSElPaDNzV0hHN2hQWHpJ?=
 =?utf-8?B?UUlRalRxRWpQWlBHNElHOFluRmN4eE1aeHYrdWNTd3UvVnhuKzlFcU40bmVJ?=
 =?utf-8?B?WHZZdW4rNUQxR2M3L2tDdEhiMTVob2lWNjZ0RWhTcmJoSUZJa0V6ZGxPYThI?=
 =?utf-8?B?WlhNcU5OUDBndWxXUGdyai9yblU2Z29IUFpPMTJ4OXZRWWNxdGdoaGEwZ3l3?=
 =?utf-8?B?bEt6UTFzZVBCdjRpUmF4czF4dEtYL2RzZmxIY3BRelpZNFlPYXB0a0xpY1E5?=
 =?utf-8?B?VEVIeEp2bGVaS29jTjRncFRNZ3FHb0JQUUdCdnp3S0F3Y2NmdTc1ejBKSHZN?=
 =?utf-8?B?Mmp4K001Q2NGRVdWS3Z5ZFRvNm04ZklzWDVIeStQRi9MMEVsT3l0NytiVFhP?=
 =?utf-8?B?Z1F1QnN1YUFBd3ZxUnBpRkFMQ3hLcmlMRXc5S3FPN1pmQjlQd1lDNGVVSENI?=
 =?utf-8?B?WWdGRThKcGxOaWR1RUNYdDJYWGZuTmp6U1BjUzhucW14VWltWTdwblZNRTNT?=
 =?utf-8?B?aC8rT3ZNVWtyTlh5ZlY0V2FZdHJMMy94V0JsdkVIbEFLbVNwcVd1NWx5S2pT?=
 =?utf-8?B?eENpVi9ZNktSZDdUbjFjbWxYakFrUTgvU3M1MkhFVTlpWlZhaEVTdjF4RU44?=
 =?utf-8?B?UGhzV1BvOEltaUUrckx0Y0V0MjUrOUR5Mk1yeFRVRHZDamRoaE5PdXhlWUJi?=
 =?utf-8?B?NlBmQ2NLbzI4RER1bmhtK2R3MVZEeU9BRWk4eS9CTlZ4d2ZsY3p2VlM5M2t6?=
 =?utf-8?B?ekxURHlTMU5RQm4xSWZPYVhTUE91VGU0REpyOUl3aHFwOHdrNTRlWWtYL3NB?=
 =?utf-8?B?Nk8xaSt3eTlidHZXNVFCaFNxaEhJay9IT3BIOGV4ZzNKL2wzK2trYkVLZERs?=
 =?utf-8?B?bTBKRWpXdHgrQWdjK2JwUTJKWjhqWkx3UUw1Uml2Ny84VXJFUmNxZlNDNEhm?=
 =?utf-8?B?SUR4S2Q4TUZkNWRiU1pKZDFvWG1UKy82bDkrdXlLREt4bTNNOEljZXBYRWtN?=
 =?utf-8?B?MVhOM3A3T2psWkV3NHZ2UFZ6cEdpc21IOGw1Yi9LUFc1WFdCVUdIajJ6Q2Jj?=
 =?utf-8?B?RGp4ejlkeno0OGhsNGZsUjZ4TXEyOFRwcGpoSmlobkUyVGpwYWxYbDNpS2lm?=
 =?utf-8?B?YUJpVExsL1BCQ05NUzA5NHdxZDM3ZlRGcld4dFQrMzN3cDJ5eXNkQU5nMEtZ?=
 =?utf-8?B?MjhJZzd4ZXc0elYvdGgxUVM1YXloWmJNZGxyeFhhN2VqK2kvbXlWQjJMbGxw?=
 =?utf-8?Q?SXqUMvmd8n/Mr9cm4QOSem22l?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7541.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 933b1f20-548f-4a30-3048-08dcc0b77f43
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2024 01:29:12.5918
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S0vVTbJ7CoeyAj0QX3d9zJAZ8Wjlk5uKFEtwB0I/I6mZp3PqeV/UviXWoijXdvYbtIh6iQfOEeuzeGCryqCpOgIE6X2K/NlwO77mktZNYNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6493
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYxMyAxLzNdIGR0LWJpbmRpbmdzOiBpMmM6IGFzcGVlZDog
c3VwcG9ydCBmb3INCj4gQVNUMjYwMC1pMmN2Mg0KPiANCj4gT24gMTkvMDgvMjAyNCAxMToyOCwg
UnlhbiBDaGVuIHdyb3RlOg0KPiA+IEFkZCBhc3QyNjAwLWkyY3YyIGNvbXBhdGlibGUgYW5kIGFz
cGVlZCxnbG9iYWwtcmVncywgYXNwZWVkLGVuYWJsZS1kbWENCj4gPiBhbmQgZGVzY3JpcHRpb24g
Zm9yIGFzdDI2MDAtaTJjdjIuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBSeWFuIENoZW4gPHJ5
YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6aytkdEBrZXJuZWwub3JnPg0KPiANCj4gPyE/DQo+IA0KPiBXaGF0IGhhcHBlbmVk
IGhlcmU/IFdoeSBhcmUgeW91IGFtZW5kaW5nIHRhZ3M/IT8gVGhhdCdzIG5vdCBhbGxvd2VkLiBZ
b3UNCj4gY2Fubm90IGNoYW5nZSByZWNlaXZlZCB0YWdzLCBjaGFuZ2UgcGVvcGxlIG5hbWVzIG9y
IHRoZWlyIGRhdGEhIEFuZCBob3cgaXMgaXQNCj4gZXZlbiBwb3NzaWJsZSwgc3JzbHksIGhvdyBk
byB5b3UgZXZlbiB3b3JrIHdpdGggZ2l0PyBHaXQgd291bGQgbmV2ZXIgZG8gaXQsIHNvDQo+IHlv
dSBoYWQgdG8gZG8gaXQgb24gcHVycG9zZSB2aWEgc29tZSB3ZWlyZCB3b3JrZmxvdy4NCj4gDQpT
b3JyeSwgSSBkb24ndCBrbm93IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dz
a2lAbGluYXJvLm9yZz4gaXMgeW91IG9yIG5vdC4NCk9yIHNob3VsZCBJIHN0aWxsIGtlZXAgS3J6
eXN6dG9mIEtvemxvd3NraSA8a3J6aytkdEBrZXJuZWwub3JnPj8NCg0KaHR0cHM6Ly9wYXRjaGVz
LmxpbmFyby5vcmcvcHJvamVjdC9saW51eC1pMmMvcGF0Y2gvMjAyMzA0MTUwMTI4NDguMTc3Nzc2
OC0yLXJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbS8NCg0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlz
enRvZg0KDQo=
