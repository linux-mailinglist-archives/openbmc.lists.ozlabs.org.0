Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A643658CC
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 14:19:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPjRQ0B6cz2yxN
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 22:19:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=MCs8JW8O;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=40.107.131.123;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=charles.hsu@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=MCs8JW8O; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310123.outbound.protection.outlook.com [40.107.131.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPjR91ZT2z2xdL
 for <openbmc@lists.ozlabs.org>; Tue, 20 Apr 2021 22:19:13 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uwb3W0XzGYBQdUSEuMjH/fQgvCQL/L4qpWbYz64JNezPnl7mZ/buTUhO0T/DtjH5mLxdJp8Zgfem9QFYNPVnSsUsiE6EIBDj6olUK7FyvgjlEYA5JAVQp5n0z2nkBmbbVGKlgTZx83FRhIGE9YEvwt7AP6ZcUL7uEn3vDt8nIjBJ0IykFei9MJ6H12aaxgJzVKebYaGJ2x86rs3Mjwu4tIej9XPE6rQQVbY9NBVelaLNSJD2H2KjviPmD2CkRc8qMJV4NtIlmj+To+/WlEXLwNlWZIYtGpm06iy3iHWYtgN4HsJdH/d5SpzuI7JCjP2nt8+L3KSEYzRQ12zH/HwUpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAHwcoYbKii0gzdg51H0pDGi4J99GfOglswDjhwQwzw=;
 b=gCV0DIWF7jnYeaf8zDowbRPS1FT8D9tw5B4QJiEWi9vbH+AClapxGAWszLFbk418ypprhAE8Y1FHCoZ6l8Ae+MdOzxOnoqbPM/YzDa+3RjDgj5almgTAhH5X7EFCm+JST7h+NlRn0w9v0Sihndlgc0DfE0HjXRyz4aeUmFPCmeByU7bEyxMfMCa5KxqBe6SnpvT2o7802JXtCDKQ5bTfjV0JGdTmyZnS8G6bWH3Quk1dV677FVH/wzbL7E26Y4DjXUCzxM2UvWkQjH4f8RIO94jCpVsRxy6xMiMeZ8jS9lafv+Qx2d1uOV8qnhEhUrC6bPUsi1fnjfk/IpX6z3qx9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAHwcoYbKii0gzdg51H0pDGi4J99GfOglswDjhwQwzw=;
 b=MCs8JW8OGnxDRGzi5A6qjaLp8SGWDawq/rU5EQm/ru2r90VmK5GniR1A2WEwkiqdSKAOFrSP6tK+hgk3neqeSTUoRKcHS/gxNRIaM6pPf1Ohc1KN3pHaIGQWf5TsVZnvf61x6kFQTpanellwTp+XXquVaL1kA88bd3dB8CX5okw=
Received: from SG2PR04MB2298.apcprd04.prod.outlook.com (2603:1096:4:a::22) by
 SG2PR04MB2907.apcprd04.prod.outlook.com (2603:1096:4:18::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16; Tue, 20 Apr 2021 12:18:55 +0000
Received: from SG2PR04MB2298.apcprd04.prod.outlook.com
 ([fe80::d4f8:e25d:d792:602f]) by SG2PR04MB2298.apcprd04.prod.outlook.com
 ([fe80::d4f8:e25d:d792:602f%4]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 12:18:55 +0000
From: =?big5?B?Q2hhcmxlcyBIc3UgKK59pcPBwyk=?= <Charles.Hsu@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: x86-power-control: make the timeout configurable
Thread-Topic: x86-power-control: make the timeout configurable
Thread-Index: Adc12v7qwlgcqvejT7KSoZ5DrG8NQA==
Date: Tue, 20 Apr 2021 12:18:55 +0000
Message-ID: <SG2PR04MB2298402C7E2E3DB9E522CDB58A489@SG2PR04MB2298.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=quantatw.com;
x-originating-ip: [61.218.113.162]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 004ec822-7ac1-40ee-6bf9-08d903f677b3
x-ms-traffictypediagnostic: SG2PR04MB2907:
x-microsoft-antispam-prvs: <SG2PR04MB29079AF590256CDBCAD8F5E08A489@SG2PR04MB2907.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r8jyK2yJYeRwMqXe4GkYS6lVS05Q7XPxs9qiasWrkVvkBMBl8MMB7q8zIQQHgZ23507hhYRQ5DnVE2KI3QG2Ub0uv/XF+PZeAiuVGhSIYiPMt5MHgS7GGHwV/66PsFvG1UMyopb9u5yv1alF1Zl+48tzy4B8S+HFWNzJar8qcoVth2TpRmzZpJX1nQMSxQ1cFgFEpsf/fssK0vq1Tds7soe3X3xYPdy2vx3MYG960I77oK6lCkk798U7A6mEbSmg3FHiw7xm7TAs5vQBgvu128CmrMJJbaun3Nrzpo+XrWSWB+rgum8yU1yLeN3GMsTIUmuF5wmnr2ZfHlsBbqMgN71RsMY4Xf4ppJjxxv4HUgZPlj4065FUU4JEP3NP9apGXxVhXeJ5Dv/hJQmjyms77bAgh3fvucCZwF9AsF246JltcXuU1L3XBFnih9t9cp3RevVA3uUmk06uKybkkyGlFJ+9+sMDX/dQ8INcTsq7DV/R0XXAJL7oHl/4K3qYAAm9bA25lUFXTDzmb/shMDUIGuqmk/YKm5IIdVpr4MdyA3fik5Q5NFHR+W5ccDozF8vdvclLZRitq/c6Qn5lkTFtw35ITUOyuGXomZR0BCnK5WY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR04MB2298.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(366004)(136003)(376002)(346002)(55016002)(2906002)(26005)(66476007)(66446008)(7696005)(71200400001)(83380400001)(5660300002)(66946007)(122000001)(316002)(64756008)(478600001)(86362001)(6916009)(33656002)(9686003)(558084003)(54906003)(85182001)(6506007)(38100700002)(8676002)(4326008)(52536014)(76116006)(66556008)(186003)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?eEpUUUdUNU10TGtPd0h6dDdCcXc4UFg1M3lpNjBScnhKL2t4czlsby9xUHFaZ1RR?=
 =?big5?B?dmRHQXExV093TVptSC8xeWw4UUhKV2lJNEpleTRMWDJYUmdIdHQ3TEcwT3Qyd0RY?=
 =?big5?B?akFBRVQ5QnkwaDUvWVlWTWR4Z3RVTjRyWDgzcUtEdWZTTVZpVTVSanJZY1o5aTZP?=
 =?big5?B?aFNmNTZCc21pbE5hTXZtQ25xcDRLTG85NGtDM1lzNTFRSU5XdVhndzVidDIzc25q?=
 =?big5?B?TFVlUHd1NnFzUko1eERqVGZjejZheVdyS2ZvNzRRL0l3ODB1aUtEZXUzZVVkWUJC?=
 =?big5?B?cXVlN2I2TnkrZTRRQjh5MUgwcGZZQnFsVzJtaXlHZWh2NXFWMWJNTnpCQnkyQmY1?=
 =?big5?B?MHRDTmpWWnV6RUNUMlRwTlhDdGM4R2IyNXpaSkdwcXRDeVlkMFBmTnAzRVR3eGlQ?=
 =?big5?B?THRvbkNCYlJHc1ZxTGpSSFovQ2V3b21MM3Z6Q2hKZHZsZkN2Z0pDb0hKNUhOOXhr?=
 =?big5?B?VmJZNG1hWWdxQjBYcW1Ud3FFSGt1dVdWdDdtVDFqaXpaT1lVbG9CQ2taY3EvNUZZ?=
 =?big5?B?TEdUK2taOEdpeXByemlpL01GS0kxSTdOU3Y1aGlMemJPTzJwUjV3SEhnTVdrWG5P?=
 =?big5?B?QTA5dXlRY0ovTnZMd2VkWWtPZDRvZjVnMHNBTGY5MXlld0NzcXJxUkJYQmNxWk11?=
 =?big5?B?SGUycWVGWkM5RDRvb21NYXpZV3pwbUd5SUxaZDVBUzJkWTBOQXl3aUJ2Z2JiYjlv?=
 =?big5?B?bmNMOTdPNUdkZk9HSlo5NCtRZzl2NzNFZDlBSU1kclIvUmZKQ0xSKzRCS2kvTWto?=
 =?big5?B?YkU4dWMzYjRkbGQzTUJiVnZSRHZSM0lvcksxc1VrUkR2TTNDeFhDeFpGdzlGWEta?=
 =?big5?B?OSthTjZhNi9LVi9CVTJBS3VsU3NkenBudU5jUnBIa0JRclVTZi93S0JIN3Bqcm5J?=
 =?big5?B?djVqZ0IralFmaXh3USszVnZJN1hiVnBHa3AxZFhQYzZkNzFzQkh6a3RYbWZ1b0NU?=
 =?big5?B?NERTRjB3RFJ0STc3SzF4eURmNlVqT1JRb0ZJYjJrVlJSL1RXMkVHaEY3Z2hLZmpO?=
 =?big5?B?d2s1bHB3anp2aHhod0JGbkNqZ3V2ajhaR3gveVljZDdQUHg1Rng5VFRLMXVnNTZ1?=
 =?big5?B?TjNYaWYxVjJscDZ6cFJzdlo0TllEM0oyWXRWRWRSRFJxdjlORjdYbHR5eGRYbkds?=
 =?big5?B?RmtjL1Iwd0pTTVVVcHhLbktDQkdsbEZqcE44SWpQdlBJVGxWS3J6L2d6a2Z5QTNx?=
 =?big5?B?Ti8yMGNYc0RTb29SZDd4Zmlla1N4SXhWZTFKTnB2aXBWRXZtMzJZREk5d0JXM3ZV?=
 =?big5?B?ZnhQblJuYVFLM0hxQXNlZXg5NXluSVNqS1NuZzhxZHlxVk4rMkJBOXdVczlieGpI?=
 =?big5?B?SGZCNFZpT2tmUDJKcUl0blFXcjRERGlyZS9yT3JFWTNCTkorNGdza0prT3hGN012?=
 =?big5?B?bGpONU1McFdGd1dIVHVPcHk3djJPK3BPT2hyL2tzVFVLRWEyNzMrTnJ1MkEyY1RE?=
 =?big5?B?cnZ4cUVINk9RZExuUDBJMmdsYWQ0TWRBWmxjbGVSYml4cWRxM1cxa0ZvbnpiUzNK?=
 =?big5?B?T05rTGlRSkZMOXBNQjVkd1lIN083VmRJNkh4akZONnRPR3pFWE9SZmNIQWd4QVBi?=
 =?big5?B?NkpkVlhCVlcxdGd2R0Z2RDlBT21JTkxoUFRFSTQ2eTBPMnRCTmt3UDI1S0lRMDZD?=
 =?big5?Q?Lc+4AlOhX1aNLExlHOi61queLlNNISEKsAznoEkUiYZqlHm+?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR04MB2298.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 004ec822-7ac1-40ee-6bf9-08d903f677b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2021 12:18:55.4161 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Li7dqIvybAeRAORIGCLA8IdDnpFd4UJNfEdFuVtcYSF1pW3S9VWPt0fOKOKDIdWU8DCr4x/s3GTizffSelog8DSdtHadOFPEqZBTeNos8sg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2907
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
Cc: "jason.m.bills@intel.com" <jason.m.bills@intel.com>,
 "kuiying.wang@intel.com" <kuiying.wang@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgLA0KCUluIG15IGNhc2UsIHRoZXNlIHRpbWVycyB3aWxsIGJlIGRlc2lnbmVkIGFjY29yZGlu
ZyB0byBkaWZmZXJlbnQgaGFyZHdhcmUuDQpJIHdhbnQgdG8gbWFrZSB0aGVzZSB0aW1lcnMgY29u
ZmlndXJhYmxlIGFuZCBwdXQgdGhlbSBpbnRvIHBvd2VyLWNvbmZpZy1ob3N0MC5qc29uLg0KSWYg
eW91IGhhdmUgYW55IHN1Z2dlc3Rpb24gb3IgdGhpcyBtb2RpZmljYXRpb24gaXMgbm90IG5lZWRl
ZCwgcGxlYXNlIHRlbGwgbWUuDQoNClRoYW5rcy4NCkJlc3QgcmVnYXJkcywNCkNoYXJsZXMNCg0K
