Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB9B330804
	for <lists+openbmc@lfdr.de>; Mon,  8 Mar 2021 07:17:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dv7RG2WQxz3cSn
	for <lists+openbmc@lfdr.de>; Mon,  8 Mar 2021 17:17:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=ixDEen3o;
	dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=ixDEen3o;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.132.123; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=ixDEen3o; 
 dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=ixDEen3o; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320123.outbound.protection.outlook.com [40.107.132.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dv7Qx4sX9z30Hd
 for <openbmc@lists.ozlabs.org>; Mon,  8 Mar 2021 17:16:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJV4oM2UeIf07ABz9o4U474o74dAfAr6cp9Y5betMNE=;
 b=ixDEen3ovIzVD0ooImhZsCybIsUPZ4NhYEcUCb/kvYZsPYNgkgO67sXe4j2SganaL4sxKZ4vRcaijG1qpPQEqbCiPC6P3YfjqjtW4KKHyFPzD+MJaYLcOUUXNaEjpvj7opHQsvmLCeQpw8nLK3RnEFIikEs0Vz2lGyXLuY2w5Tld9rU4nM7XckPKeIoqGjPpX2C7piyvTtsJNgu7AHXdJcAoG/TbwbGo1eMLMSH5wHMriuTwisOBCMGYrAVpBu5jz2lzPKSLkbY9ZQhDFSlXDDHT5Hre7Pntczk1XdFB0BkUMXtHYnrlywXb2Z5rDwBkMEADxmwId9am+yWELPmVDw==
Received: from HK2PR04CA0063.apcprd04.prod.outlook.com (2603:1096:202:14::31)
 by TYZPR04MB4528.apcprd04.prod.outlook.com (2603:1096:400:58::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.18; Mon, 8 Mar
 2021 06:16:39 +0000
Received: from HK2APC01FT058.eop-APC01.prod.protection.outlook.com
 (2603:1096:202:14:cafe::7) by HK2PR04CA0063.outlook.office365.com
 (2603:1096:202:14::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Mon, 8 Mar 2021 06:16:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.51)
 smtp.mailfrom=hcl.com; google.com; dkim=pass (signature was verified)
 header.d=HCL.COM;google.com; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.51 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.51; helo=APC01-PU1-obe.outbound.protection.outlook.com;
Received: from APC01-PU1-obe.outbound.protection.outlook.com (192.8.245.51) by
 HK2APC01FT058.mail.protection.outlook.com (10.152.249.150) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.19 via Frontend Transport; Mon, 8 Mar 2021 06:16:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oRkMfe+9oIHVX87AxDBW0ySX9RrYsU+CERFUKDrcl83Ua3yly2IoYCs1DMcb4M+ppZhYhnafjITyLfr5qyAXNwxUjLSkbaHUCNlK/NtYOHwXV+PRK+fxYV2fQtIma7MGzGGfBjB6PUGYm0N5mdazZgZYAusY3bLYbd6JzvhDKi0B1MVgHa+7oBjh+WN97Bi2r0VqDHkAzBk4LuzgXk4QAEeR6KmzKLJxTAwaBCkQtLaQeqyFDjJZypcQHxpc0YSaFg4YzeY98FL6y8dN5KoGuyRXA1Ax059zU5FSeDQzvtbewCixme0WMXRHz/9FWbJC6xwI3sjbfUigI3DISxuvkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJV4oM2UeIf07ABz9o4U474o74dAfAr6cp9Y5betMNE=;
 b=WCqiTOZT4SXd4Df4B//tTAiHROyHhYBW/C4BE/5JbpX90QgNi2qaJDDfuiZ1UKL+VSyuS1y7zJQMQ62F3L7Y8WQ1WbybJsdQmtA+MDo8bSDD8SDb4cGZJXfo3r5JEXGYSs0FKyhc6OJqQCMm1wvyZL8jwYkirxBLuUjjHCsfr2Gsh0KcFqIFS3PEA1/oCrB8VZ9goDRckcIvOI9a7NDwQ4zS3xgLlUbjP0cnv0nKddqJLTByF5lTmb9vbu/Gh9nCwXtgH8sUB45dvqTau+ZehjWyAY0nSaXfRENXBI8NGx8Auz4aLYNLUvCwAbuUnLMjvE9IC04whY+ezaHRVNEFqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJV4oM2UeIf07ABz9o4U474o74dAfAr6cp9Y5betMNE=;
 b=ixDEen3ovIzVD0ooImhZsCybIsUPZ4NhYEcUCb/kvYZsPYNgkgO67sXe4j2SganaL4sxKZ4vRcaijG1qpPQEqbCiPC6P3YfjqjtW4KKHyFPzD+MJaYLcOUUXNaEjpvj7opHQsvmLCeQpw8nLK3RnEFIikEs0Vz2lGyXLuY2w5Tld9rU4nM7XckPKeIoqGjPpX2C7piyvTtsJNgu7AHXdJcAoG/TbwbGo1eMLMSH5wHMriuTwisOBCMGYrAVpBu5jz2lzPKSLkbY9ZQhDFSlXDDHT5Hre7Pntczk1XdFB0BkUMXtHYnrlywXb2Z5rDwBkMEADxmwId9am+yWELPmVDw==
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB3772.apcprd04.prod.outlook.com (2603:1096:4:a1::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.19; Mon, 8 Mar 2021 06:16:36 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::b84d:4fa9:f44b:a049]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::b84d:4fa9:f44b:a049%3]) with mapi id 15.20.3912.027; Mon, 8 Mar 2021
 06:16:36 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: Ed Tanous <edtanous@google.com>
Subject: RE: Negative value returns for sensor in tiogapass
Thread-Topic: Negative value returns for sensor in tiogapass
Thread-Index: AdcMHNUlzX6I6Je8Q2WRGNkpWs0ATgAP1CQAAeFPK8A=
Date: Mon, 8 Mar 2021 06:16:36 +0000
Message-ID: <SG2PR04MB3093F7CA1D6801FDF9D6C5BAE1939@SG2PR04MB3093.apcprd04.prod.outlook.com>
References: <SG2PR04MB30939CC20F08C50A7031DBA5E19D9@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <CAH2-KxA4tQvaxzFcAWYhYrq9WeCLrLTRdknZW66XUBzOipoFrg@mail.gmail.com>
In-Reply-To: <CAH2-KxA4tQvaxzFcAWYhYrq9WeCLrLTRdknZW66XUBzOipoFrg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiYTY0YzQ4YmUtNDhhZi00YWI4LTgwODgtYjZmZjFlZjk3YmYzIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX1B1YmwxYyJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6ImRacm5GekFrY3Y3TENURU9GaVZ5XC93aGxQUlpYWUdXTGVyY1wvVHhmamRmZmZ2VFhSWjFabVwvMWs5dEwxYXZNcHMifQ==
x-hclclassification: HCL_Cla5s_Publ1c
Authentication-Results-Original: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=hcl.com;
x-originating-ip: [192.8.226.44]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e2ca7416-362c-4f38-7dd5-08d8e1f9bc55
x-ms-traffictypediagnostic: SG2PR04MB3772:|TYZPR04MB4528:
X-Microsoft-Antispam-PRVS: <TYZPR04MB452885A1D050B93A80719785E1939@TYZPR04MB4528.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 0C8kCwTmxo1f8h7TYDnqGfSI68nJlH7udwPFTg35/doI6dAYFLYAZvuokuSg/5zduGMMZ+gIDA3RaksBh7KkynuLItNpkjnuHJjofux6ct1mV7s+AMEJQHTy6vS9VBxcA54FUbOgC7gSZ9tJV6+yYU89lohimfQL08pNZnMOV0hvUZ3wmxNNt9Sx2u4B2YMJ6SmK2/uafSltr0e67n15BJxO/zQgKb9yobJXV+s0SiAUmXl05r4wEpObjdgWqLTDfs7ZssZ8MQi1JVW90S5MngetUQNux93qqNB93SK3U0vgA8PKC5ArttswWQGpzB/isWbkFk0XdnTrUz3/QSXLpBfbf1HRzwMJYTnQ1KFaE5BGiK9EXrmdImhNOE9T2cUj5m2yuDVHeD8QbMptAIM6FIa1KrVRntaTe4TH2v10i+GalX+WDLvZ0YfjPLLFB9bTEGCAgqdVb4RSP91KXNMqNP8v8E2oehMGSJBK/49nUZW5GYrwemvx8XZwd2jfgE6mFJUUxLlS215lBFKECkRxwwaRgS00Z93nDhDextTiWKV0SxPR+XHVfqXsnl3uyNqBLdj35DXi2Wn5fFN8uh4wmzcrhj/0FQxpqD+h1+PKPZA=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(136003)(366004)(376002)(71200400001)(66556008)(55016002)(9686003)(478600001)(4326008)(26005)(86362001)(8676002)(316002)(2906002)(8936002)(5660300002)(33656002)(76116006)(966005)(83380400001)(66476007)(7696005)(6506007)(53546011)(6916009)(52536014)(186003)(66946007)(64756008)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?VHRQVVZUZ2pjRko0RGRBMzdDa3FMY1NvbEVUUUFsNjdjU25hSW1DWndIWnNU?=
 =?utf-8?B?M0xGL2QvQ0pyaXRmbHlhamtyaGFxVGJrSmN0WCtTYm9RMHBBVXhSTHN0WkpC?=
 =?utf-8?B?Smo3alA5UWNYVThRengvejJmek95WkRlYlkycFpHRHJFN3hZcy93cHFKUUVr?=
 =?utf-8?B?TVpjZjNFb2FPSmpZdkZSMUxobDNiUUplRjdOQ1JhMmp4WTRudlJma0pOSk9u?=
 =?utf-8?B?c3VmSFViQ01iYm5Jdmp5MzV6eUZySkRLUENPRngxOFo4Wkh2WUpKam54aC8w?=
 =?utf-8?B?eW9HTUp0ZkZIRncwUjJadHpZWE5Xc0tjV0NwWGdWMEw1RlorTFZkajVMVFln?=
 =?utf-8?B?YitYOUQ4ME9Zd3ZaQ3lLRGg5dEFWUTlHcjJ5MCtCTGFnaXE0czJVSlJRZDFr?=
 =?utf-8?B?SnhxSlpOL2xjTExHM0ZXdEY3THhzR0t1N3FiREJaREM0Vm5YazROTkllTGhH?=
 =?utf-8?B?elZ3bndybUk5QnZNSVpCVmt5NktxYTdwblVyK3cwcWxVYjhkUUJka04xYWpF?=
 =?utf-8?B?V0M5bnFSTGRDZ3BMR2kyVmRBbGUrYXlSdWladmhrakNaTjFtWHNtYWxoUWxq?=
 =?utf-8?B?SUFxNHpsN3NKQXRhd1RxOWMzcnIrWmJWZG1VdE8zUlhHRG1rME9UZUxuU1dK?=
 =?utf-8?B?Vjh5eXBWK3BENDU5aXdZSHl5ZTl2TW5FNVJEUkxqR0FPdDFDREdXVWRsL2c5?=
 =?utf-8?B?b2owbUx0OEZhYTAzaitmaWN6YThYYnlFUG9JQXN2WEtvVWRDcDBMVjB5WWRF?=
 =?utf-8?B?NHR6dG5saVB5c1FpbUR4NTNVUWRGZWVCakVGc0FZUzlmQTB1NlRabjI1bFdH?=
 =?utf-8?B?Z0ZQb3ZnQTZGSW1ZTW9NekJxc2lxSzR0TUVVRStsRzd3OTNlQlljVEdLUkJj?=
 =?utf-8?B?N0dLTTRXNVN1QjdpK3dYTDJtVm9yWDJtTXBFMmxHekpNd2VMdU1lWDJuQUpZ?=
 =?utf-8?B?b1Ywa2lLODVzN3NXQTJWbW4zY0oyRWRwWG9KNjY0VEZqeTlBa0pkb29IeVVC?=
 =?utf-8?B?OGZpWE9LcHdKaW1nUjlRU2JNVDF0OXA4bnJvemFhaVNlTkFZY1JQMjJsVk9a?=
 =?utf-8?B?MVY0VjlBcDFGRVJwTzdnN0pKS2VCRFlhRWRadklXNHB6Mi9TRFZHeDE0VkVo?=
 =?utf-8?B?T2hnUWQyaDN4RzhQc0ZZQXlVaUx5NHc2bmNPbFdhQUVZUVV6dmpCOU9MNHZO?=
 =?utf-8?B?L0V0aGU0MlNIMEY1bkZKUmR6SU1DbVcrRFlwQTViZmJDLzZkR1pYczRiRGQx?=
 =?utf-8?B?MjZHQ1prQkkxNjJmMnd5OGxYM0ovdkZxSDlTL3NxQytCcVBDOXpkb3pHSStO?=
 =?utf-8?B?c0twWUMxcjF5Smljdk9UWmxHSXA1eUhCeTVCRi9mM0d6anJiS1dXNkZ1eSt5?=
 =?utf-8?B?NUVpTGlybWVaZWNDMWlLZlg1bnU3Nk1jZkswUExXbjFaQW5XRUZITHFNTXNE?=
 =?utf-8?B?U3dYUTRBOHFiNDVQbGhPSmdQWE00cnByUXBCRWpuWitING90L05ORDR0RHpo?=
 =?utf-8?B?QTBWWGJES1VybDJJWXBTYmloZWs0a3NnVHRjOHlwTUUxOG4xc2dxcG5KNUhu?=
 =?utf-8?B?cGVVUk5Pai9IeDkreWo3eDVnQUtHSjBQWUdnZy9FRCtiR01BWUN3YU9CeW1m?=
 =?utf-8?B?b2lWbXhLSWYzZFlEWjdLeVphZnNsK3NQakpBQ0VROHU5L29qRzEyV2hFWnVB?=
 =?utf-8?B?Wi9nUExKTFlWZ0kvNWhnK1NiY2o3K2lwdUlNR09IRzV6bFNkR1p1akhmQjZP?=
 =?utf-8?Q?mMbeBhdEIHk8GGHRL4=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3772
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HK2APC01FT058.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: fe12229f-56b3-4704-c6b3-08d8e1f9ba69
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p/X38Yk5tbOP+CW+s3xhRjSmWPsKJgJx+u+gGNl4qsfNm2OtHC+ioXsXMiIY5E2BCa7WAvjPS1A8pipWDgM95QojzkhnVuKXLM1mNfRhT2KSKxA/te6bjxiphhe/uHjzd7IDTFRAenEWl8lasdjBIjtq7R9M8zSDWCUH5O6m3qe5IR3jUIa2NxsedRcg1fYAmVbEoQ3vyvfgxPezIowSSGD4BeW+KRSO5NFE/eiIrQA0KdOgkYxfrHe7dabKtbrg4z4o/qpRPIiwSeJOOLiiYqPYF5JgeG7OjEHUbAulJwm7ljM+2JMkpiLUL3gwlx/LHv0zPVQGiq6mc8P76oJMmq7jiUtS9uZGGGFcu0629rfDT+HUh1nY28UTHKL4pLxQLSnuRHLDlLrS6AsUFghWrqbjRjEQoeTod+2lnmVsgej8od3y1uwG19miJuZU1MnUupaWmgdaeBfWmACAukHwkgEvU0iH8h7Vx842EswLd2YX8rW+AeFbaTrbyOD9ypbdfL6NWuPuSgWZwXL3BxqIyajTqlK5DJw+xJLYJxgHtcrlElskOf7Nas+5vHpI7DbkoUjDQRzeRbBQl61FbIvRab/dEyY/GKRPLyFXkf9l/qsXMamh13WZsZEteKQtnnlD2/9R+D6OpNZyLjOFJ0XQr8mnzDL09u2XAsY1S6Gf7L1VOk5Tip+iMtkSMl0gVcn/ytVIOejOgkyzoYYWRh+i9odTD7M5bYMuZDyOKlWNUm+oeTcTtP9D8sYNWlXcICVv5AtHoMujshJGAQA5wPBBPPUy4IDMwcGWAorLmEzufAE=
X-Forefront-Antispam-Report: CIP:192.8.245.51; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-PU1-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(136003)(376002)(396003)(36840700001)(46966006)(26005)(186003)(8936002)(70586007)(2906002)(33656002)(36906005)(82740400003)(6506007)(53546011)(4326008)(70206006)(478600001)(356005)(7696005)(83380400001)(336012)(81166007)(47076005)(966005)(9686003)(34020700004)(82310400003)(36860700001)(86362001)(6916009)(52536014)(5660300002)(55016002)(8676002)(316002)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 06:16:38.9503 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ca7416-362c-4f38-7dd5-08d8e1f9bc55
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.51];
 Helo=[APC01-PU1-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT058.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB4528
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Q2xhc3NpZmljYXRpb246IFB1YmxpYw0KDQpIaSBFZCwNCg0KSW4gdGhlIGJlbG93IGxpbmssIFBY
RTE0MTBDVlIgYW5kIEFETTEyNzhIU0MgYXJlIHVzaW5nIHRoZSBzYW1lIHJlYWRpbmcgZm9ybWF0
Lg0KSSBhbSBub3QgYWJsZSB0byBmaW5kIGFueSBpbmZvcm1hdGlvbiBvbiBQWEUxNDEwQ1ZSLiBJ
ZiB0aGVyZSBpcyBhbnkgc3BlYyBhdmFpbGFibGUsIGNvdWxkIHlvdSBwbGVhc2Ugc2hhcmUgaXQu
DQpJdCB3aWxsIGJlIGhlbHBmdWwgdG8gYW5hbHl6ZSBib3RoIHRoZSBzcGVjcyBhbmQgZml4IHRo
ZSBwcm9ibGVtLg0KDQpodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9kYnVzLXNlbnNvcnMvYmxv
Yi9tYXN0ZXIvc3JjL0lwbWJTZW5zb3IuY3BwI0wxNDQNCg0KUmVnYXJkcywNCkpheWFzaHJlZQ0K
DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBFZCBUYW5vdXMgPGVkdGFub3Vz
QGdvb2dsZS5jb20+IA0KU2VudDogRnJpZGF5LCBGZWJydWFyeSAyNiwgMjAyMSA5OjU3IFBNDQpU
bzogSmF5YXNocmVlIEQgPGpheWFzaHJlZS1kQGhjbC5jb20+DQpDYzogb3BlbmJtY0BsaXN0cy5v
emxhYnMub3JnDQpTdWJqZWN0OiBSZTogTmVnYXRpdmUgdmFsdWUgcmV0dXJucyBmb3Igc2Vuc29y
IGluIHRpb2dhcGFzcw0KDQpbQ0FVVElPTjogVGhpcyBFbWFpbCBpcyBmcm9tIG91dHNpZGUgdGhl
IE9yZ2FuaXphdGlvbi4gVW5sZXNzIHlvdSB0cnVzdCB0aGUgc2VuZGVyLCBEb27igJl0IGNsaWNr
IGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgYXMgaXQgbWF5IGJlIGEgUGhpc2hpbmcgZW1haWws
IHdoaWNoIGNhbiBzdGVhbCB5b3VyIEluZm9ybWF0aW9uIGFuZCBjb21wcm9taXNlIHlvdXIgQ29t
cHV0ZXIuXQ0KDQpPbiBGcmksIEZlYiAyNiwgMjAyMSBhdCAxMjo1NSBBTSBKYXlhc2hyZWUgRCA8
amF5YXNocmVlLWRAaGNsLmNvbT4gd3JvdGU6DQo+DQo+IENsYXNzaWZpY2F0aW9uOiBQdWJsaWMN
Cj4NCj4gSGkgVGVhbSwNCj4NCj4NCj4NCj4gUmVjZW50bHksIEkgaGF2ZSB0ZXN0ZWQgc2Vuc29y
cyBmb3IgdGlvZ2FwYXNzLCBpbiB3aGljaCBvbmUgc2Vuc29yIHJldHVybnMgbmVnYXRpdmUgdmFs
dWUuDQo+DQo+IEFmdGVyIGFuYWx5c2luZyB0aGUgY29kZSBpbiB0aGUgZGJ1cy1zZW5zb3JzIHJl
cG8sIEkgZm91bmQgdGhlIGZvbGxvd2luZyBpc3N1ZS4NCj4NCj4NCj4NCj4gZGJ1cy1zZW5zb3Jz
L0lwbWJTZW5zb3IuY3BwIGF0IG1hc3RlciDCtyBvcGVuYm1jL2RidXMtc2Vuc29ycyANCj4gKGdp
dGh1Yi5jb20pDQo+DQo+DQo+DQo+IEZyb20gdGhlIGFib3ZlIGxpbmssIFdlIG5lZWQgb25seSBi
ZWxvdyBsaW5lIGluIHRoZSBjb2RlIHRvIHByb2Nlc3MgdGhlIEhTQyBzZW5zb3JzIHZhbHVlIGZv
ciB0aW9nYXBhc3MuDQo+DQo+DQo+DQo+IGludDE2X3QgdmFsdWUgPSAoKGRhdGFbNF0gPDwgOCkg
fCBkYXRhWzNdKTsNCj4NCj4NCj4NCj4gU2luY2UgdGhlIGJlbG93IGxvZ2ljIGlzIGFkZGVkLCB0
aGUgdmFsdWVzIGdldCBzaGlmdGVkIGFuZCBnZXR0aW5nIG5lZ2F0aXZlIHZhbHVlcyBhcyBvdXRw
dXQuDQo+DQo+DQo+DQo+IGNvbnN0ZXhwciBjb25zdCBzaXplX3Qgc2hpZnQgPSAxNiAtIDExOyAv
LyAxMWJpdCBpbnRvIDE2Yml0DQo+DQo+IHZhbHVlIDw8PSBzaGlmdDsNCj4NCj4gdmFsdWUgPj49
IHNoaWZ0Ow0KPg0KPg0KPg0KPiBDb3VsZCB5b3UgcGxlYXNlIHN1Z2dlc3QgYW55IGlkZWEgdG8g
cmVzb2x2ZSB0aGlzIGlzc3VlLg0KDQpJIGhhdmVuJ3QgbG9va2VkIGF0IHRoaXMgaW4gZGV0YWls
LCBidXQgd2Ugc2hvdWxkIGZvbGxvdyB3aGF0ZXZlciB0aGUgc3BlYyBzYXlzIGhlcmUuICBJZiB3
aG9tZXZlciB3cm90ZSB0aGlzIG9yaWdpbmFsbHkgcHV0IGluIHRoZSB3cm9uZyBtYXRoICh3aGlj
aCBzZWVtcyBsaWtlbHksIGdpdmVuIHRoZXkgd2VyZSBpbXBsZW1lbnRpbmcgNCB0eXBlcyBhbmQg
cHJvYmFibHkgb25seSB1c2luZyBvbmUpIHRoZW4gd2Ugc2hvdWxkIGp1c3QgZ2V0IGl0IGZpeGVk
IGFuZCBkbyB3aGF0IHRoZSBzcGVjIHNheXMuDQoNCj4NCj4NCj4NCj4gUmVnYXJkcywNCj4NCj4g
SmF5YXNocmVlDQo+DQo+DQo+DQo+IDo6RElTQ0xBSU1FUjo6DQo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fDQo+IFRoZSBjb250ZW50cyBvZiB0aGlzIGUtbWFpbCBhbmQgYW55IGF0
dGFjaG1lbnQocykgYXJlIGNvbmZpZGVudGlhbCBhbmQgaW50ZW5kZWQgZm9yIHRoZSBuYW1lZCBy
ZWNpcGllbnQocykgb25seS4gRS1tYWlsIHRyYW5zbWlzc2lvbiBpcyBub3QgZ3VhcmFudGVlZCB0
byBiZSBzZWN1cmUgb3IgZXJyb3ItZnJlZSBhcyBpbmZvcm1hdGlvbiBjb3VsZCBiZSBpbnRlcmNl
cHRlZCwgY29ycnVwdGVkLCBsb3N0LCBkZXN0cm95ZWQsIGFycml2ZSBsYXRlIG9yIGluY29tcGxl
dGUsIG9yIG1heSBjb250YWluIHZpcnVzZXMgaW4gdHJhbnNtaXNzaW9uLiBUaGUgZSBtYWlsIGFu
ZCBpdHMgY29udGVudHMgKHdpdGggb3Igd2l0aG91dCByZWZlcnJlZCBlcnJvcnMpIHNoYWxsIHRo
ZXJlZm9yZSBub3QgYXR0YWNoIGFueSBsaWFiaWxpdHkgb24gdGhlIG9yaWdpbmF0b3Igb3IgSENM
IG9yIGl0cyBhZmZpbGlhdGVzLiBWaWV3cyBvciBvcGluaW9ucywgaWYgYW55LCBwcmVzZW50ZWQg
aW4gdGhpcyBlbWFpbCBhcmUgc29sZWx5IHRob3NlIG9mIHRoZSBhdXRob3IgYW5kIG1heSBub3Qg
bmVjZXNzYXJpbHkgcmVmbGVjdCB0aGUgdmlld3Mgb3Igb3BpbmlvbnMgb2YgSENMIG9yIGl0cyBh
ZmZpbGlhdGVzLiBBbnkgZm9ybSBvZiByZXByb2R1Y3Rpb24sIGRpc3NlbWluYXRpb24sIGNvcHlp
bmcsIGRpc2Nsb3N1cmUsIG1vZGlmaWNhdGlvbiwgZGlzdHJpYnV0aW9uIGFuZCAvIG9yIHB1Ymxp
Y2F0aW9uIG9mIHRoaXMgbWVzc2FnZSB3aXRob3V0IHRoZSBwcmlvciB3cml0dGVuIGNvbnNlbnQg
b2YgYXV0aG9yaXplZCByZXByZXNlbnRhdGl2ZSBvZiBIQ0wgaXMgc3RyaWN0bHkgcHJvaGliaXRl
ZC4gSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlbWFpbCBpbiBlcnJvciBwbGVhc2UgZGVsZXRl
IGl0IGFuZCBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseS4gQmVmb3JlIG9wZW5pbmcgYW55
IGVtYWlsIGFuZC9vciBhdHRhY2htZW50cywgcGxlYXNlIGNoZWNrIHRoZW0gZm9yIHZpcnVzZXMg
YW5kIG90aGVyIGRlZmVjdHMuDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo=
