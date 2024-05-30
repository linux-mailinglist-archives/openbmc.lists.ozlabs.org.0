Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DE48D469F
	for <lists+openbmc@lfdr.de>; Thu, 30 May 2024 10:02:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=qPgNUsMv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vqdyn1Qqzz3cY2
	for <lists+openbmc@lfdr.de>; Thu, 30 May 2024 18:02:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=qPgNUsMv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::70b; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=tommy_huang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2070b.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::70b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vqdy52xhqz3cWf;
	Thu, 30 May 2024 18:02:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVXLlQLDKzdD5Jo8e9C4K7jWVK2n52dYXFt9HOcnVa0/UIFgjLwVJlTqSbgM9Vu6ulFzpROA9pq6dSM9Wrn0o8sx/tQXENP1MgbcUtL03z0Y2DomZPfeZlHBjnd1ajgw6/hV1HprXNK+xlpxEPc4vkJVx0kZj8OyUYZNPGSto4OeAUhDngA6BXLzfgGPTjPsINlkSEidsMxXahGkhgLLfKRWCcNLgPs72xmvE0zq4xeh5yGZj50LZoANatbF1IBNZuYucgvVr7FkqIAgq9nD3Nv9ZH8yhwECwoSxmW9dqyqBs7IkUPP0tgzAviWDDfjE5kpvO9a9rZE1GxQKo34Y8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hNfAo5mSy/WS5gLDqp5z3ccLpTfiIn0eYWAeHWdARaM=;
 b=YBV7B6FmNY0DlOYsUJN5Y2n7Q1pMzis4jadgraX53MjkpNbhlIeG//Bx9NjAOXH5qD9bGNpqiei8Po7dIp3xy0BODBTZMLyKI27oQjnCIqzThzsEeFT1F5wbl3TdHkVLTy3+hr1C7bPfTZErE4oN2MpRmAt8YkgT9Y0HDzcJeE14B7++U0iuKg8QasJ9Dhq/nKzUtkK9UA9pffRKR5DXZ0K+OZMUJWrGxJSl04s7MvTJAMIG7/e0MBbeNZ/sDpLXjbg4ZmSh4hw6qC2o6Vnv2ZurQjMPANebMTInbkRIKMvfs62f58rgOCEdSVZWMxse5Lueri6tgSxJ6FSOdy1xrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNfAo5mSy/WS5gLDqp5z3ccLpTfiIn0eYWAeHWdARaM=;
 b=qPgNUsMvHSgLYisBd5/KAv3NdS1qZDgnzQjhscSYtUbSsDgXUZo/ehn/jezgnQcl4VdEF2lHkoUlO8GSgUR2k866sZ9LmIReHKvETyRzMW2c8U/5APBTdUx7TSgtzPeaIRyvm7R64n6lwzix9R0CzaTiDYwXftMpD7Sb+fGRH27PDYJJQk3HGB3wfprz8IfrkNJYnydBZ38JCmPECCKzoLnY+GQCQ3po25alNH1k8GaL7kgAgFnKJ0jX0v4pnJ+S36QbEbrWpHBHZXn9oQXMIAlqWgu6YSbg0Ler+ANLwl4hH55twz8yCBJES8BE3ZGJwlnC3tWTdCq9KwnLeomEpw==
Received: from TYZPR06MB6191.apcprd06.prod.outlook.com (2603:1096:400:33d::12)
 by SEYPR06MB5857.apcprd06.prod.outlook.com (2603:1096:101:c3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 08:01:31 +0000
Received: from TYZPR06MB6191.apcprd06.prod.outlook.com
 ([fe80::cc07:35e3:9143:c8e2]) by TYZPR06MB6191.apcprd06.prod.outlook.com
 ([fe80::cc07:35e3:9143:c8e2%5]) with mapi id 15.20.7611.030; Thu, 30 May 2024
 08:01:31 +0000
From: Tommy Huang <tommy_huang@aspeedtech.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: RE: [PATCH] i2c: aspeed: Update the stop sw state when the bus
 recovry occurs
Thread-Topic: [PATCH] i2c: aspeed: Update the stop sw state when the bus
 recovry occurs
Thread-Index: AQHasl/7kNWQnBw5T0ayJZ/33ciwnbGvZo8AgAAAYFA=
Date: Thu, 30 May 2024 08:01:31 +0000
Message-ID:  <TYZPR06MB6191FAF87E840853959AB98CE1F32@TYZPR06MB6191.apcprd06.prod.outlook.com>
References: <20240530070656.3841066-1-tommy_huang@aspeedtech.com>
 <2774cb4c-4eea-4bf5-8b2b-438adf18448d@molgen.mpg.de>
In-Reply-To: <2774cb4c-4eea-4bf5-8b2b-438adf18448d@molgen.mpg.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6191:EE_|SEYPR06MB5857:EE_
x-ms-office365-filtering-correlation-id: 8033774b-2b95-4820-eb64-08dc807eb79d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230031|366007|376005|1800799015|7416005|38070700009;
x-microsoft-antispam-message-info:  =?utf-8?B?TkRNWkE5Uk9TZjBaRmk5S2VJUFplSUtjZmhqZmN2QmNyTVM3bVB1SXFXSkVP?=
 =?utf-8?B?ckhLRzdCbFR2KzdTQ2JJcVNVS2twVzE1cmpxanVtT1JHRy9IaGJrM3JGc1l1?=
 =?utf-8?B?RG9BOHZaaUJRVWdXL0VQY1V4NXZ2TTNaaGJjQWtJTDRQd2xXWVFGUE9jbEpq?=
 =?utf-8?B?T1R0WGNNREhSV1hTSlJSckhrYzE5bVM0cFhRbEt5dGxtdU1UMk1oTDFLLzYv?=
 =?utf-8?B?WmtzS05tM3V5OXNuM1N1SU1COUk0cEFqbUg5R1VVOGUzSEtSRGo3b1BPY2Rt?=
 =?utf-8?B?c2FTU0VJaU1MdW1XcSttWTh1cExYd0pPbHM4eHYyaEh2eWx5TVFYQkwyVERu?=
 =?utf-8?B?NDN5VWFrQ20yVElwakczUUNyZkpKN3RId3pZWTFwMmxrRmIxdnVjZlp2QTBN?=
 =?utf-8?B?MWZ6cVpqRjRPa3M3Y1RpWHBxWmkwaFBVSmZqWmJtbzd6SmVWQTd0NTRNTlY0?=
 =?utf-8?B?NUdsWVZjcmxmUUJxcUxqcXpHZG82MG5tNzZuVGZWL1d6Z09VemE1K0dFTmxv?=
 =?utf-8?B?bUdxT3BPNGVxV0ZhNVMzbEh6NGFLK1ZlMmQrVDU1VUQzaW10TkNkUy9hcnFa?=
 =?utf-8?B?TkNJTmZLQU80aHQ1ejhYVVN6T1VCT015TVpMUlJGV0hUaEhkOUZzazMwNldL?=
 =?utf-8?B?d2JZUW5SMmN3NTNHVmg4U1ZvalozL3JWVlNoUU52OEhjaTdCVUZmUUYzM01r?=
 =?utf-8?B?WUZ4eUpjQ1hyMTRQN1ZzaEVzYWdKeEdMZHpqSnhxalk0UlF0Yi9EVHVmaEFI?=
 =?utf-8?B?cldEY1FZaElwbXY4aEYycTNpakJKTGNvU2JyVXFLNGRJUUo1cVJEWTFDMmJl?=
 =?utf-8?B?RFJWdHovUjRvanR2NldkTzhKNFRaYVBCS0s1VE5POG83VWpVNGVqY1FyOEhi?=
 =?utf-8?B?UVpHMUgwTi9RL0VmUisrV3l5MGhadWE4bS8zcGczU09oRVc3Y1dXbkx3QkRr?=
 =?utf-8?B?dE95alJhRWhHVk9uYWNFQ24rWURRVE1qS3JtOU1Ec0U0M2pZK3FZSDVGZjMv?=
 =?utf-8?B?WTE4NGowMTZZamFWdkNxMUs5Zy9KVW5iN3JxYmdvSE5QNTFWMjNoL2ZESE1I?=
 =?utf-8?B?akZ3bHFGVExzam5DS0pwUzFESmZDckp5V0p5amVsa0RzTEN1Qkt2QzR5azNM?=
 =?utf-8?B?S1lCN29QVVBTYXRtRHZ0ZzFSNWZPb1lqWXVzZFVzZ3JKQU5qSkVZK1p3bm15?=
 =?utf-8?B?S3Eyb3I0SlZaVVVVUVBDNmQ0dmFSQUVzb29yYytNVW5EQTVnc3ZEVFhIN082?=
 =?utf-8?B?b2lueVpTNUNMeEJ6bGg5TmxWVkNaODR3Q3BUMjNCSXRmSU5FZUJaSGdkb0hs?=
 =?utf-8?B?bFVBZTFjNUpJak1GajZ3MU5GRFphOGpXVmwwWm80LzRjSmhSclR4dGNxU0tW?=
 =?utf-8?B?RlRtcEpuTUR0dE13VlIvL3JUdVhRSkVRcU02RnJOUXlJYUd5blV4Rzl5Zm9T?=
 =?utf-8?B?VHdIWFBMdFVsWDVUNjFSYmRNeGpLVnV0NUkzZTJMUG5IUmk0azR4emJWbTl4?=
 =?utf-8?B?NE05V2lMeHdYYlZmVE5VVzQxNVNtOUVCT2V2cVNkVHdIVFRtazNkSEFsWDVN?=
 =?utf-8?B?R2tDZngxRDBjRFdzRDNwY253cEJGOXJmOXBYQTFWTmVkVk5zdUR0cm52eEVZ?=
 =?utf-8?B?NFl5UlBlVmh5VEd4eFF2UEEwMzNkZXorVDI0N3k3RmxLWXloZWd5YmdNM2tj?=
 =?utf-8?B?MU1JUmlmWHNHS3JvbW5saktna0dvY0ZnUTh5aE80VzNFaTNudExzbElBUXN5?=
 =?utf-8?B?VVhLWkEzblJLY1k2TTh0MXExZkhuWlZwSzJpUnI1ZEwxNlRCVGJkMURCb0du?=
 =?utf-8?B?RDJUZHpOMWNXWVpvc2NTQT09?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6191.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(7416005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TitHT0dNQ3dyUmtSOFozYjRxekJnVHB0L1VQaGlLUDdsSWY2VnZreWoxWjZK?=
 =?utf-8?B?MlJLTUZ2d3dTeWw3V00rOUR3eDlaODRWWmQvaVM3M1J5N0tGNGxWUnNoZnBR?=
 =?utf-8?B?Y0lmc0ZyWEFiTDlidEVieWtHbkNqelpmblhuU1RTWnhabUgybEp6U1kzeEJn?=
 =?utf-8?B?ZlNKTE1kVzZwY0VoeG50OUpTNVZxZDZCN0xFT2crQ2VlN2g2ckFFYS9IT1Ry?=
 =?utf-8?B?YXFtWVVsOGxyeHQ4NWJWQ3BvdE5aNFR2Rk9sOFQweDZaSUc0R3o4cFJJeGdo?=
 =?utf-8?B?WGYrdEVwdmNuT1VkcEJkUmZwWmN6T3hqcmt5c3Fib2tlOWF0U3h5RVgvRTNC?=
 =?utf-8?B?cFYvcVQ1bzhpVlpHcVhWTDRkZzBZdzNlSGUyODM2Z3Z1akxKQnd1Y1lBNm04?=
 =?utf-8?B?a0grNDZ0b3NpLyt3eHdDMVBUb3FKL0Q3WUZhNEtZSUc2L1BaRFhmMC9EVVQw?=
 =?utf-8?B?WUY1KzlweFRKZHRFMkI2azluTG5qYW1CdW5HY1k2MGwra2ZoYUVFMDhrVEx3?=
 =?utf-8?B?WjZHRVh1ZGc2Q3VBQ1hqaXpQbVJvaU9TVnd5UEtyaU9uNXRVZnNCT0diOWxU?=
 =?utf-8?B?NVpaZlJYRUlpR0RkYXArM29WbWRiTHAvOEY3c0kzT0dBWlZTM1hxZFQ3Nko4?=
 =?utf-8?B?N1BXVkRmMnpRcU0xUi9aR0VBdllDZmNhK3JiVkhMZU5jcGJIekdOYmoxUWY2?=
 =?utf-8?B?SEQrd0JBeFpTL2k4akVWdll5ZlRibUFHSHV3UUZrMjVqZnRaY1FTNnVIZy85?=
 =?utf-8?B?dHFTMjRRUzVhZkRhSXRONlY2M2ZBTUE1WlJnWGNXeHFmTDlNMUVxQm9zSmV3?=
 =?utf-8?B?Z0RydEh1TGFKTE9JMkhiUmNmZHNQSE80anVvWmdKams3UjZYajVsMTNyekRE?=
 =?utf-8?B?aVRtUUwxRDVqLy9kM1Q0WVZBSDV2ZG1ZZzd1NnZOMCtlWmZRZUJha0w0WHNX?=
 =?utf-8?B?dDJqZEZRdmRvK2IxZnVLRm82TmRBSDU2QzMvQUYrZGxWVGRMV2dFTjBUVTJF?=
 =?utf-8?B?Uk5IQmJwTFVjYnlucUJmbXdWVXdEWFFPc2VIRVRyZmtvL1BoVC83enhLMDdi?=
 =?utf-8?B?WXNneHNsMEM5K3piZk5BOTBTY2taaFFiZ2NxYnZJb3NVbXUvdjhUSCtkaThM?=
 =?utf-8?B?Q1l5RzNRSTBIRzI0anFISTBqOFZtT2JSZVlDODRZUnpoQ1czb3dlYWZ5bmxr?=
 =?utf-8?B?RG15NHo4UUhPRlpDNS8xcWMxVVlJcno3TkJFcXp1a0toS0dMVDYwZ3pjUEdj?=
 =?utf-8?B?WDE0dTVPZG8wVXQrOHdhRFJ4RmUzYWN6bGJGM0NQajFGQWNpRGRSR1VGeDB2?=
 =?utf-8?B?ZG54eFkvWmdwWXc3RkMveHdBdkQ0OXlDY1J4c2c4OUlRUC9tc09CZTZQVHcw?=
 =?utf-8?B?cml5NitBZG9ZNkFWTDRyUVI2MGRsYTRWTEV1U1RPdkp5QVRUbFdyT2lsdnN2?=
 =?utf-8?B?VlhxRHhWWTY5RFlkMW5Fc0tyYnFmRGVYaW04V3JueEpVMUdEQzdkNjREZFZp?=
 =?utf-8?B?QjBNL0Z0aGN0VnNVejVZaDkySFJqbEIxZHNjUjBObDFieEgvaW9GUzlWM01M?=
 =?utf-8?B?Y1h4N0dnRzFoOTl3d1l5VzFEc3JYUTY2MlBQVHJhNTVpQko2Y3h3M0twUEZB?=
 =?utf-8?B?a3Iyc0lVMk9OUVhyTDJOZHNjQXFRMFptTGVGSjZEK2FQaWNMalJjY2lkQXp1?=
 =?utf-8?B?SnRuUVpmREVQRGVxNFlGNCs0QTFiVldmaG94MXNhS0JWdGwzaGZVTXUwekFw?=
 =?utf-8?B?a045SFJBamM5VloyM2QrSHZ0dWJicXdicjlxQ0hUNHZzZ1F0dWl1c1RUVS9h?=
 =?utf-8?B?TjhhRlFZcmJpdzRhSnR4cG9URkRRZ2Q4Q0RIS0E1aFdQV1kvTG5sOExDZ1ZE?=
 =?utf-8?B?Q2F0REtsT3VPZ2tXSVV5bndvK1VJVm9WZlVpUzlETjJVUCtwZ3pWdmpNeU9T?=
 =?utf-8?B?MVJJVkYwMVo2a254dDRsZ3BsSCtDSXpzZDVkaHdIaGNDdXB5akJtaWNYMmJ1?=
 =?utf-8?B?RUN5amtGaWR0ZlRoMUtrajNpMW1Zd3ltREZEeEVKdy9rYTE1SDloNG9vT1lS?=
 =?utf-8?B?R1RncmovWlpyTE93bjJzM2NhM0k1UmpJNDVIcW93K3dadEFWeGE0eXNzUzJr?=
 =?utf-8?B?YjcrS2YyOVdWYkNIWDlVWElhdDRmSmZLK2FpcCtjbzd1OFc3SE51Yk1PNng0?=
 =?utf-8?B?aXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6191.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8033774b-2b95-4820-eb64-08dc807eb79d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2024 08:01:31.4485
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3q9jgkR8gc+lO9/CLah6JMiHskO8GVC8oketq0mEknaRRteK1DIo+xL/4XtUdSy5g3v2WmfVgTMwBb47C5lgrVz+cN3H4kQJVBRvRI4hWkw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5857
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "wsa@kernel.org" <wsa@kernel.org>, "brendan.higgins@linux.dev" <brendan.higgins@linux.dev>, "joel@jms.id.au" <joel@jms.id.au>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgUGF1bCwNCg0KCVRoYW5rcyBmb3IgeW91ciBjb21tZW50cy4NCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQYXVsIE1lbnplbCA8cG1lbnplbEBtb2xnZW4ubXBnLmRl
Pg0KPiBTZW50OiBUaHVyc2RheSwgTWF5IDMwLCAyMDI0IDM6NDggUE0NCj4gVG86IFRvbW15IEh1
YW5nIDx0b21teV9odWFuZ0Bhc3BlZWR0ZWNoLmNvbT4NCj4gQ2M6IGJyZW5kYW4uaGlnZ2luc0Bs
aW51eC5kZXY7IGJlbmhAa2VybmVsLmNyYXNoaW5nLm9yZzsgam9lbEBqbXMuaWQuYXU7DQo+IGFu
ZGkuc2h5dGlAa2VybmVsLm9yZzsgYW5kcmV3QGNvZGVjb25zdHJ1Y3QuY29tLmF1OyB3c2FAa2Vy
bmVsLm9yZzsNCj4gQk1DLVNXIDxCTUMtU1dAYXNwZWVkdGVjaC5jb20+OyBsaW51eC1hc3BlZWRA
bGlzdHMub3psYWJzLm9yZzsNCj4gb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOyBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnOw0KPiBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnOyBsaW51eC1h
cm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gaTJj
OiBhc3BlZWQ6IFVwZGF0ZSB0aGUgc3RvcCBzdyBzdGF0ZSB3aGVuIHRoZSBidXMNCj4gcmVjb3Zy
eSBvY2N1cnMNCj4gDQo+IERlYXIgVG9tbXksDQo+IA0KPiANCj4gVGhhbmsgeW91IGZvciB5b3Vy
IHBhdGNoLg0KPiANCj4gQW0gMzAuMDUuMjQgdW0gMDk6MDYgc2NocmllYiBUb21teSBIdWFuZzoN
Cj4gPiBXaGVuIHRoZSBpMmMgYnVzIHJlY292ZXkgb2NjdXJzLCBkcml2ZXIgd2lsbCBzZW5kIGky
YyBzdG9wIGNvbW1hbmQNCj4gDQo+IHJlY292ZSpyKnkNCg0KSSB3aWxsIGZpeCB0aGlzIHNwZWxs
aW5nIHR5cG8gb24gbmV4dCBwYXRjaC4gVGhhbmtzLg0KDQo+IA0KPiA+IGluIHRoZSBzY2wgbG93
IGNvbmRpdGlvbi4gSW4gdGhpcyBjYXNlIHRoZSBzdyBzdGF0ZSB3aWxsIHN0aWxsIGtlZXANCj4g
PiBvcmlnaW5hbCBzaXR1YXRpb24uIFVuZGVyIG11bHRpLW1hc3RlciB1c2FnZSwgaTJjIGJ1cyBy
ZWNvdmVyeSB3aWxsDQo+IA0KPiBXaGF0IGlzIHRoZSB1c2VyIHZpc2libGUgcHJvYmxlbT8NCj4g
DQoNCkluIHRoZSBtdWx0aS1tYXN0ZXIgY2FzZSwgdGhlIGkyYyB0cmFuc2ZlciB0aW1lb3V0IHdp
bGwgZXhlY3V0ZSB0aGUgYXNwZWVkX2kyY19yZWNvdmVyX2J1cy4NCldoYXQgd2Ugbm90aWNlZCB3
aGVuIHRpbWVvdXQgYXBwZWFycywgYW5kIGtlcm5lbCBwYW5pYyBpcyBvYnNlcnZlZDoNCi0JeGZl
ciBnb2VzIHRocm91Z2ggYXNwZWVkX2kyY19yZWNvdmVyeV9idXMgDQotCWluc2lkZSByZWNvdmVy
eSB3ZSBjYW4gc2VlIOKAnFNDTCBodW5nIChzdGF0ZSBlYzBiMDAwMCksIGF0dGVtcHRpbmcgcmVj
b3ZlcnnigJ0uIA0KLQlTVE9QX0NNRCBpcyBwZXJmb3JtZWQgYnV0IHRpbWVfbGVmdCA9IDAgd2hh
dCBjYXVzZXMgdGhhdCBhc3BlZWRfaTJjX3Jlc2V0IGlzIGNhbGxlZCAoYW5kIHJldHVybnMgMCkN
Ci0JR29pbmcgb3V0IG9mIHRpbWVvdXQgaGFuZGxpbmcsIHJlbGVhc2UgbWVtb3J5LCBpcnEgaGFu
ZGxlciBpcyBpbnZva2VkIGFuZCByaXNlIGludGVycnVwdCBjYXVzaW5nIHRoYXQgcmVsZWFzZWQg
bWVtb3J5IGlzIHVzZWQuDQoNCj4gPiBiZSBjYWxsZWQgd2hlbiBpMmMgdHJhbnNmZXIgdGltZW91
dCBvY2N1cnMuIFVwZGF0ZSB0aGUgc3RvcCBjb21tYW5kDQo+ID4gY2FsbGluZyB3aXRoIGFzcGVl
ZF9pMmNfZG9fc3RvcCBmdW5jdGlvbiB0byB1cGRhdGUgbWFzdGVyX3N0YXRlLg0KPiANCj4gSG93
IGNhbiB0aGlzIGJlIHRlc3RlZD8NCg0KSXQganVzdCB1cGRhdGVzIG1hc3Rlcl9zdGF0ZSBmb3Ig
dXNhZ2Ugc2FmZXR5LiBUaGUgb3JpZ2luYWwgc3RvcCBjb21tYW5kIHN0aWxsIGJlIHRyaWdnZXJl
ZC4NCj4gDQo+ID4gRml4ZXM6IGYzMjdjNjg2ZDNiYSAoImkyYzogYXNwZWVkOiBhZGRlZCBkcml2
ZXIgZm9yIEFzcGVlZCBJMkMiKQ0KPiA+DQo+IA0KPiBUaGUgYmxhbmsgbGluZSBjYW4gYmUgcmVt
b3ZlZC4NCj4gDQo+ID4gU2lnbmVkLW9mZi1ieTogVG9tbXkgSHVhbmcgPHRvbW15X2h1YW5nQGFz
cGVlZHRlY2guY29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hc3Bl
ZWQuYyB8IDMgKystDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1h
c3BlZWQuYw0KPiA+IGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hc3BlZWQuYyBpbmRleCBjZThj
NDg0NmI3ZmEuLjMyZjhiMGMxYzE3NA0KPiA+IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvaTJj
L2J1c3Nlcy9pMmMtYXNwZWVkLmMNCj4gPiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWFz
cGVlZC5jDQo+ID4gQEAgLTE2OSw2ICsxNjksNyBAQCBzdHJ1Y3QgYXNwZWVkX2kyY19idXMgew0K
PiA+ICAgfTsNCj4gPg0KPiA+ICAgc3RhdGljIGludCBhc3BlZWRfaTJjX3Jlc2V0KHN0cnVjdCBh
c3BlZWRfaTJjX2J1cyAqYnVzKTsNCj4gPiArc3RhdGljIHZvaWQgYXNwZWVkX2kyY19kb19zdG9w
KHN0cnVjdCBhc3BlZWRfaTJjX2J1cyAqYnVzKTsNCj4gPg0KPiA+ICAgc3RhdGljIGludCBhc3Bl
ZWRfaTJjX3JlY292ZXJfYnVzKHN0cnVjdCBhc3BlZWRfaTJjX2J1cyAqYnVzKQ0KPiA+ICAgew0K
PiA+IEBAIC0xODcsNyArMTg4LDcgQEAgc3RhdGljIGludCBhc3BlZWRfaTJjX3JlY292ZXJfYnVz
KHN0cnVjdA0KPiBhc3BlZWRfaTJjX2J1cyAqYnVzKQ0KPiA+ICAgCQkJY29tbWFuZCk7DQo+ID4N
Cj4gPiAgIAkJcmVpbml0X2NvbXBsZXRpb24oJmJ1cy0+Y21kX2NvbXBsZXRlKTsNCj4gPiAtCQl3
cml0ZWwoQVNQRUVEX0kyQ0RfTV9TVE9QX0NNRCwgYnVzLT5iYXNlICsNCj4gQVNQRUVEX0kyQ19D
TURfUkVHKTsNCj4gPiArCQlhc3BlZWRfaTJjX2RvX3N0b3AoYnVzKTsNCj4gPiAgIAkJc3Bpbl91
bmxvY2tfaXJxcmVzdG9yZSgmYnVzLT5sb2NrLCBmbGFncyk7DQo+ID4NCj4gPiAgIAkJdGltZV9s
ZWZ0ID0gd2FpdF9mb3JfY29tcGxldGlvbl90aW1lb3V0KA0KPiANCj4gDQo+IEtpbmQgcmVnYXJk
cywNCj4gDQo+IFBhdWwNCg0KQlIsDQoNClRvbW15DQo=
