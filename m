Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 045134BD94B
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 12:02:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2KCN2cNmz3cCs
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 22:02:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=uAQ7EPz6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:feab::723;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=uAQ7EPz6; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20723.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::723])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2KBs6h2Jz30RD
 for <openbmc@lists.ozlabs.org>; Mon, 21 Feb 2022 22:02:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mZPSs7QhdkP+992VkopowwoA/7AFkZ1J6gfEL3uWrizWkLUD7vvi1mBciOLpoJhzGUJJnC/8qE5qVCsGCGCXZzfK/aMmBcOCGeqGmwUb5dcPpL4/DxmTByK3nvO7CU2rW8jJgkgPaO1MywH3gYS5Mxcqkp4z26J/WjmJbd91Z/AHHmvPFjP/8rrchAlFc6Kvh4+eG0rVCnibphWCeP3w4YcaqEZaxG2Wq0lbJOEKZjrddF9teGrgI6OmMwoPnltRIp6ssEuP25d7DuF8LMven/qrFLRwnl2AbeJCs/ptP22C2IQIg/6lNiQf8r6wZSxTHg7N/4E9VsnoDhrFVQwDMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eacjheUXZiJiSzSfrPcKhhjQRmzLmtg+NmOTivirK0k=;
 b=T+K765cxltkHhcFBrjoiIYgOe1mv7SvUnypKO2BXPl0G5YpkDcdpfRCmdWM5uA/EJmPZjRv7eWkkyiy93olgZD4/wuyTKKQlAXaxzklLzyAbwPbg7/aZfc6HFPreCL7virBRJHRl906FpZJEwWTAHiXpyvO9ty1SL2P6PUf2rQW9gqZ/TZ6APpC5KSJW6izdPdxQkODbfEEgE3kjCy+ZACnYJPa8pzVdRBd1jw9GKcUAnD89B3w9nHRWpLcsp9pjstiZ/uaGHkQpMWwHdW+RW9RlVqPIM9JviQU46ZFMKS3CxDfJLvu4OhwkOZNrcpovunVKCO4DzdE0jf5nytfXkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eacjheUXZiJiSzSfrPcKhhjQRmzLmtg+NmOTivirK0k=;
 b=uAQ7EPz6JkZAKuUWbdUE6xli4IQuecEM6851yV+rsV1dum94O8fXZioAfFHFngWHsRdkxiOcHom0S3iYt2V2o4gFQ7P/oNq8wYCRxHFIxU00YGbEE8i/2FEBEFtip1spxs4WBpV+zEiNmJj9LipcRh2uF9wA9FtOnubz7R/4vyw=
Received: from TY2PR04MB3295.apcprd04.prod.outlook.com (2603:1096:404:a1::12)
 by TY2PR04MB2704.apcprd04.prod.outlook.com (2603:1096:404:4a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Mon, 21 Feb
 2022 11:02:07 +0000
Received: from TY2PR04MB3295.apcprd04.prod.outlook.com
 ([fe80::5183:bbb0:20a3:5727]) by TY2PR04MB3295.apcprd04.prod.outlook.com
 ([fe80::5183:bbb0:20a3:5727%4]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 11:02:07 +0000
From: =?utf-8?B?UG90aW4gTGFpICjos7Tmn4/lu7cp?= <Potin.Lai@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "joel@jms.id.au"
 <joel@jms.id.au>, Patrick Williams <patrick@stwcx.xyz>, Jamin Lin
 <jamin_lin@aspeedtech.com>
Subject: Re: [u-boot,v2019.04-aspeed-openbmc v3 1/1] arm: dts: Aspeed: add
 Bletchley dts
Thread-Topic: [u-boot,v2019.04-aspeed-openbmc v3 1/1] arm: dts: Aspeed: add
 Bletchley dts
Thread-Index: AQHYHuHuzcZS6fL1n0iOi2bWHC6vmqyd5ykA
Date: Mon, 21 Feb 2022 11:02:06 +0000
Message-ID: <774e60b8-85c7-986b-317c-6231c166f2a5@quantatw.com>
References: <20220211005419.14454-1-potin.lai@quantatw.com>
In-Reply-To: <20220211005419.14454-1-potin.lai@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eda4faed-a814-44db-2d6e-08d9f52999b6
x-ms-traffictypediagnostic: TY2PR04MB2704:EE_
x-microsoft-antispam-prvs: <TY2PR04MB27041850E29A0AC7E34147A08E3A9@TY2PR04MB2704.apcprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JVs8fZeOzuUW5H2ASpZUaeWdn/BXwH+5hSFYFw7QzJzqDFGG3ZjbZBQmPL9cyL88Erx1xQgrS0g+/0+C5o1Xr5H7lO70SBA9Rg4THlMhOeRQ1voz+oGyAqTzLkBrZ0PUwHXLYhYxUshIFi9bxlTi3K/uoXkcHYU0JL7grWI++1OUQExBuHg65X4Y917S3N2dWoRIrgsr2ypkLuwzcwIaQsVJ28NxwFMOhUfvX6537S5HSrt9wWvFxhwp8YXC7LRhLmDqg8ip3h5BE2MiBDwlKtHy0p4SYuJEYtEFC0wVoAVgnXeOFvoVLWtxHUuyj7QFujPNVfVuw3OymGBDQk5OYQtecfYDEqPj4JRXLToeBLQW7rEmRf/QA69zxp1uGXmvyLhW+VLJVROepbGgusPqUqgUq+sHJ9HUjVyUap2HagDlBYViYjYnmLtpDNJhkAD80zPszfmSFGvJAZnFq5s7Flsg6vX8+1Ai6+/fO9jOiqSNhwHsZrTmVu1w1gtHZLvola6z5akn+y2TdMWTXs7FDkdg/xNFtw1q6CwZ5jOfulQpPbWhIPYBguYz890RDsw6af7WNQP69+ACyhKjQJf5lZtQRxG1P2HYJMJ+DazOQKJkH6djDeVGNblwU5aNzwlUbcaTXWgwINUTJKHlaG0PXxARsLcGcZtbg/QOgQvQflgBKkAJebXIbrKOZnt4fTWxu8BsyAUxbtb1jPtxosVX4edE0qOnRX4cVx2XYIjg667S62I8wBCurQLmFTNkzam6g76wvWFHccVE2pYecuQoRQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR04MB3295.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(64756008)(83380400001)(66946007)(66556008)(66476007)(66446008)(36756003)(85182001)(26005)(186003)(31686004)(122000001)(2906002)(2616005)(508600001)(86362001)(31696002)(38070700005)(38100700002)(8936002)(5660300002)(71200400001)(8676002)(6506007)(91956017)(76116006)(110136005)(316002)(6486002)(53546011)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dWJrZGQvMXBZUVFCaDlLaFliaFc4MXdyYVBab3hVN3RBZmNZQ2hrQThteUVx?=
 =?utf-8?B?UHJYQUdPY0VTbU16anpDQlJsYWk5QUNxc2sra3lZTnNiTXJycTcyb3JNbWR0?=
 =?utf-8?B?a3Z6NFJuUFFSQlBWcE1Balc0RkQ5bWg2emhYTmIvZVE0U1draUJwcVZkbUZP?=
 =?utf-8?B?aWUrckdHbVlhcEtGT08wOG55MmxBTVhsRko4NnoxREx3OEVSdUpVZXBVd0lj?=
 =?utf-8?B?NlpWWFc5OUtyaVczOXhvRW90cWg5bUZJbFpBWHA5bHd4c3pEMURUMkFFY2ll?=
 =?utf-8?B?N3V6N09wNHo0SUN6dTZneWZjVnNHY2o5ckRpSVhzSWJpNXdxN2VpSTNHbHBm?=
 =?utf-8?B?ek1iOFNId3U0MEVvelphdndwQklkZUw5Q0lyRlhYRDFORTZZUGYrcEUxUzFU?=
 =?utf-8?B?TXBFaEVJS1V4RnVEc0NaejhTY0FWNnlIL0ozcittSU1ZcUpjQVVVMzlBa09D?=
 =?utf-8?B?QzA3NWxoK0RveHp5dUIrOVpYRGllTmNuMVZMTnZwdlNzalMwbTZQUUx1M2lu?=
 =?utf-8?B?UWo2c0dpb0hNZDF2bkw2OFVOdUlnZVpiZys0Z0syZjBXV3lNT1ZYZWFJREYz?=
 =?utf-8?B?VnRidjZPc0hweEZtbnNERXRHblRzaVNnbDFxa2M4WFArb1RIVjZXSmdPYUVZ?=
 =?utf-8?B?cjNQdEdna2NDbmtOV2dUbGtYUnF5RCtaR0x1NTNmTTFaYzBERTBuMGhsWG05?=
 =?utf-8?B?Nm56WDNNQUNrMWNwb2FnQ3Q1NzVMV1B1WTFtVlo4RVZOc3RIdlBTVVVRelFl?=
 =?utf-8?B?ckRnWkY0OXFBMGx4WHdGdUpNSzlQM2EreTJiRWUwcmdZWnd4NGpRT3drVWFJ?=
 =?utf-8?B?ZVVWQ1hMWjh0REJ3WGNaQTJRSzJYVFhsWUMxQmtpQjE0Z0pDZTNQMnFtRmx3?=
 =?utf-8?B?M0VvUU9VZU9ET2ErNTR6M2hNaCtLd29PRDQ3Wnl3VzFTZ1lZVkpTaEFEL0dP?=
 =?utf-8?B?MklIUE1IYWJxc3lwQncxdFNnRW4zbGhDQmFHeXFwb1kwWHRyUlhJQ3d2OUln?=
 =?utf-8?B?TnJGMXl6aDVCMDBwVFlJRC83TzZyUjAyR3dmNFp6TDV3aURTZXFEYWJlVS80?=
 =?utf-8?B?d2V5aWp3eklncnM2Rjg4YVIvM2FmZW9wV0kvb3pMd3JRZEVCZmtML2wzb21Q?=
 =?utf-8?B?bm44cTE1U1lJY3ZCcUJjdm9hOUZXTS8vWjFHR3NyUEJxdUR1L3FJSnIzMEdF?=
 =?utf-8?B?S29XSjg2MXFRSnZvNlErZDhUUGhYaitMZXFZVU9zWUc2d3VRNW9peFBwZlpu?=
 =?utf-8?B?YUl5ZTNKU0Z3YXdYdXRXdngvMU1OWkdNa24yMGpiOHd3SW1WRTd5N0hXd3hZ?=
 =?utf-8?B?cXhaRytrODBmRXZHWGJaVjhRQ0RiWVE0SzVYNUJjbUxxNmxCQTcwb3lJSjZD?=
 =?utf-8?B?WTEwNzlNREp5K3BzS1Nxa1hzNlY2eW5ZSkFpNFB0eVFGMWN0RWdKbXpySmU2?=
 =?utf-8?B?UFBZQy9VaWxMNVdoK1dBa0o5b2tNM2U5TXN4Z2J4dnBxdDBqS1Q2QzhFVVFT?=
 =?utf-8?B?K1hHN2l1TG0vTzdnbDhIQjRKMlpDQTJVT1ZlNFJKRWRjSW1xUGc2MEkzb0Zk?=
 =?utf-8?B?ejU5RlZqNnpkdDhwNUEvWVorVEpMeCtqREdIWkNGbjNFL0NrOTlaMmdqR2Z3?=
 =?utf-8?B?cVhFNUFFeFFSTFR5TFliTFIyUk1ZZXhXSXYyRHI0b1NRNmVHem83QVFXQUJ3?=
 =?utf-8?B?ZkJGcXdaQ2hqMnNtNjlJekJsalpjWWdEVDE3TGtFbVYxU2gzai9OT1RlR1N2?=
 =?utf-8?B?MlJmMG5pWTBLdmMydGxWSDlwM25RcklENGFmc0k2UWN3Yzh5N3ptVjZTZUVV?=
 =?utf-8?B?dGJFdmJMVFRNanYrSWEzMi9TYmV5bnllVmx6ZlRRbWZWbkF1Und6TllXcjBX?=
 =?utf-8?B?eVlhS2lseGtITWUwVnRoMlR0SjRiT3ZDdzNEV1JhYzg3VmxvTEdKeTNRN1Zk?=
 =?utf-8?B?dkJxLzM5Q01PdVdraVJaWkI4dmxEd0VKME05S2NzZ3ZnZUtEQmFDamVtcUNG?=
 =?utf-8?B?RHFiTDBXd1hHV2JrS3hjUzZBL0RlQ1Rmd08vcnVYR3llSHJVYURMVk43MVZN?=
 =?utf-8?B?VFZvbzB5UXdXdndJYVlxYjEzS1k0NVNncWRFN0FYeU9XQ0EvYzJTVnZVOGxs?=
 =?utf-8?B?RGRlNy9CZ0ZEd0NsSGZNSzhNYVJJcitkcUVzSjdZZStjajRnbEFxUDJIalRW?=
 =?utf-8?B?a0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <363E69BC28C4E44E844E5E9AA705813F@apcprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR04MB3295.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eda4faed-a814-44db-2d6e-08d9f52999b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2022 11:02:06.9390 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FJqivtdMXDoeQWggUQLQJ7R3JKleJwkAaXM98SPaKx4lNLYZpX2rE/fyesZ1h79uA4Up+dRAUKRW3mKYpywerw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB2704
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

T24gMi8xMS8yMiAwODo1NCwgUG90aW4gTGFpICjos7Tmn4/lu7cpIHdyb3RlOg0KPiBJbml0aWFs
IGludHJvZHVjdGlvbiBvZiBCbGV0Y2hsZXkgZXF1aXBwZWQgd2l0aA0KPiBBc3BlZWQgMjYwMCBC
TUMgU29DLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBQb3RpbiBMYWkgPHBvdGluLmxhaUBxdWFudGF0
dy5jb20+DQo+DQo+IC0tLQ0KPg0KPiBjaGFuZ2UgdjIgLT4gdjM6DQo+ICogdXBkYXRlIG1vZGVs
ICYgY29tcGF0aWJsZSB0byBtYXRjaCB3aXRoIGtlcm5lbCBkdHMNCj4NCj4gY2hhbmdlIHYxIC0+
IHYyOg0KPiAqIHNvcnQgTWFrZWZpbGUgYWxwaGFiZXRpY2FsbHkNCj4gKiBhZGQgbGljZW5jZSBh
bmQgY29weXJpZ2h0DQo+ICogdXBkYXRlIG1vZGVsIG5hbWUNCj4gKiByZW1vdmUgdGhlIG5vZGVz
IG5vdCB1c2luZyAoZnNpLCBlbW1jLCBzZGhjaSwgZWhjaSwgcGNpZSAmIGRpc3BsYXlfcG9ydCkN
Cg0KSGkgSm9lbCwgY291bGQgeW91IGhlbHAgcmV2aWV3IHRoaXMgcGF0Y2ggYW5kIGxldCBtZSBr
bm93IGlmIGFueSBtb2RpZmljYXRpb24gbmVlZGVkPyBNYW55IHRoYW5rcw0KDQpQb3Rpbg0KDQo+
IC0tLQ0KPiAgYXJjaC9hcm0vZHRzL01ha2VmaWxlICAgICAgICAgICAgICB8ICAgOSArLQ0KPiAg
YXJjaC9hcm0vZHRzL2FzdDI2MDAtYmxldGNobGV5LmR0cyB8IDIyMyArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyMjggaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9kdHMvYXN0MjYwMC1i
bGV0Y2hsZXkuZHRzDQo+DQo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9kdHMvTWFrZWZpbGUgYi9h
cmNoL2FybS9kdHMvTWFrZWZpbGUNCj4gaW5kZXggZGY4NDQwNjVjZC4uYWM5M2E4OWMwNyAxMDA3
NTUNCj4gLS0tIGEvYXJjaC9hcm0vZHRzL01ha2VmaWxlDQo+ICsrKyBiL2FyY2gvYXJtL2R0cy9N
YWtlZmlsZQ0KPiBAQCAtNjc3LDE1ICs2NzcsMTYgQEAgZHRiLSQoQ09ORklHX0FSQ0hfQkNNNjg1
OCkgKz0gXA0KPiAgZHRiLSQoQ09ORklHX0FSQ0hfQVNQRUVEKSArPSBcDQo+ICAJYXN0MjQwMC1l
dmIuZHRiIFwNCj4gIAlhc3QyNTAwLWV2Yi5kdGIgXA0KPiAtCWFzdDI2MDAtZXZiLmR0YiBcDQo+
IC0JYXN0MjYwMC1uY3NpLmR0YiBcDQo+ICAJYXN0MjYwMGEwLWV2Yi5kdGIgXA0KPiAgCWFzdDI2
MDBhMS1ldmIuZHRiIFwNCj4gKwlhc3QyNjAwLWJsZXRjaGxleS5kdGIgXA0KPiArCWFzdDI2MDAt
ZXZiLmR0YiBcDQo+ICAJYXN0MjYwMC1mcGdhLmR0YiBcDQo+ICsJYXN0MjYwMC1pbnRlbC5kdGIg
XA0KPiArCWFzdDI2MDAtbmNzaS5kdGIgXA0KPiAgCWFzdDI2MDAtcmFpbmllci5kdGIgXA0KPiAg
CWFzdDI2MDAtc2x0LmR0YiBcDQo+IC0JYXN0MjYwMC10YWNvbWEuZHRiIFwNCj4gLQlhc3QyNjAw
LWludGVsLmR0Yg0KPiArCWFzdDI2MDAtdGFjb21hLmR0Yg0KPiAgDQo+ICBkdGItJChDT05GSUdf
QVJDSF9TVEkpICs9IHN0aWg0MTAtYjIyNjAuZHRiDQo+ICANCj4gZGlmZiAtLWdpdCBhL2FyY2gv
YXJtL2R0cy9hc3QyNjAwLWJsZXRjaGxleS5kdHMgYi9hcmNoL2FybS9kdHMvYXN0MjYwMC1ibGV0
Y2hsZXkuZHRzDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAuLjU3
Y2E4NDViOTQNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9hcmNoL2FybS9kdHMvYXN0MjYwMC1i
bGV0Y2hsZXkuZHRzDQo+IEBAIC0wLDAgKzEsMjIzIEBADQo+ICsvLyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMCsNCj4gKy8vIENvcHlyaWdodCAoYykgMjAyMiBNZXRhIFBsYXRmb3Jt
cyBJbmMuDQo+ICsvZHRzLXYxLzsNCj4gKw0KPiArI2luY2x1ZGUgImFzdDI2MDAtdS1ib290LmR0
c2kiDQo+ICsNCj4gKy8gew0KPiArCW1vZGVsID0gIkZhY2Vib29rIEJsZXRjaGxleSBCTUMiOw0K
PiArCWNvbXBhdGlibGUgPSAiZmFjZWJvb2ssYmxldGNobGV5LWJtYyIsICJhc3BlZWQsYXN0MjYw
MCI7DQo+ICsNCj4gKwltZW1vcnkgew0KPiArCQlkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOw0KPiAr
CQlyZWcgPSA8MHg4MDAwMDAwMCAweDQwMDAwMDAwPjsNCj4gKwl9Ow0KPiArDQo+ICsJY2hvc2Vu
IHsNCj4gKwkJc3Rkb3V0LXBhdGggPSAmdWFydDU7DQo+ICsJfTsNCj4gKw0KPiArCWFsaWFzZXMg
ew0KPiArCQltbWMwID0gJmVtbWNfc2xvdDA7DQo+ICsJCW1tYzEgPSAmc2RoY2lfc2xvdDA7DQo+
ICsJCW1tYzIgPSAmc2RoY2lfc2xvdDE7DQo+ICsJCXNwaTAgPSAmZm1jOw0KPiArCQlzcGkxID0g
JnNwaTE7DQo+ICsJCXNwaTIgPSAmc3BpMjsNCj4gKwkJZXRoZXJuZXQwID0gJm1hYzA7DQo+ICsJ
CWV0aGVybmV0MSA9ICZtYWMxOw0KPiArCQlldGhlcm5ldDIgPSAmbWFjMjsNCj4gKwkJZXRoZXJu
ZXQzID0gJm1hYzM7DQo+ICsJfTsNCj4gKw0KPiArCWNwdXMgew0KPiArCQljcHVAMCB7DQo+ICsJ
CQljbG9jay1mcmVxdWVuY3kgPSA8ODAwMDAwMDAwPjsNCj4gKwkJfTsNCj4gKwkJY3B1QDEgew0K
PiArCQkJY2xvY2stZnJlcXVlbmN5ID0gPDgwMDAwMDAwMD47DQo+ICsJCX07DQo+ICsJfTsNCj4g
K307DQo+ICsNCj4gKyZ1YXJ0NSB7DQo+ICsJdS1ib290LGRtLXByZS1yZWxvYzsNCj4gKwlzdGF0
dXMgPSAib2theSI7DQo+ICt9Ow0KPiArDQo+ICsmc2RyYW1tYyB7DQo+ICsJY2xvY2stZnJlcXVl
bmN5ID0gPDQwMDAwMDAwMD47DQo+ICt9Ow0KPiArDQo+ICsmd2R0MSB7DQo+ICsJc3RhdHVzID0g
Im9rYXkiOw0KPiArfTsNCj4gKw0KPiArJndkdDIgew0KPiArCXN0YXR1cyA9ICJva2F5IjsNCj4g
K307DQo+ICsNCj4gKyZ3ZHQzIHsNCj4gKwlzdGF0dXMgPSAib2theSI7DQo+ICt9Ow0KPiArDQo+
ICsmbWRpbyB7DQo+ICsJc3RhdHVzID0gIm9rYXkiOw0KPiArCXBpbmN0cmwtbmFtZXMgPSAiZGVm
YXVsdCI7DQo+ICsJcGluY3RybC0wID0gPCZwaW5jdHJsX21kaW80X2RlZmF1bHQ+Ow0KPiArCSNh
ZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiArCSNzaXplLWNlbGxzID0gPDA+Ow0KPiArfTsNCj4gKw0K
PiArJm1hYzIgew0KPiArCXN0YXR1cyA9ICJva2F5IjsNCj4gKwlwaHktbW9kZSA9ICJyZ21paSI7
DQo+ICsJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gKwlwaW5jdHJsLTAgPSA8JnBpbmN0
cmxfcmdtaWkzX2RlZmF1bHQgJnBpbmN0cmxfbWFjM2xpbmtfZGVmYXVsdD47DQo+ICsJZml4ZWQt
bGluayB7DQo+ICsJCXNwZWVkID0gPDEwMDA+Ow0KPiArCQlmdWxsLWR1cGxleDsNCj4gKwl9Ow0K
PiArfTsNCj4gKw0KPiArJmZtYyB7DQo+ICsJc3RhdHVzID0gIm9rYXkiOw0KPiArDQo+ICsJcGlu
Y3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gKwlwaW5jdHJsLTAgPSA8JnBpbmN0cmxfZm1jcXVh
ZF9kZWZhdWx0PjsNCj4gKw0KPiArCWZsYXNoQDAgew0KPiArCQljb21wYXRpYmxlID0gInNwaS1m
bGFzaCIsICJzc3QsdzI1cTI1NiI7DQo+ICsJCXN0YXR1cyA9ICJva2F5IjsNCj4gKwkJc3BpLW1h
eC1mcmVxdWVuY3kgPSA8NTAwMDAwMDA+Ow0KPiArCQlzcGktdHgtYnVzLXdpZHRoID0gPDI+Ow0K
PiArCQlzcGktcngtYnVzLXdpZHRoID0gPDI+Ow0KPiArCX07DQo+ICsNCj4gKwlmbGFzaEAxIHsN
Cj4gKwkJY29tcGF0aWJsZSA9ICJzcGktZmxhc2giLCAic3N0LHcyNXEyNTYiOw0KPiArCQlzdGF0
dXMgPSAib2theSI7DQo+ICsJCXNwaS1tYXgtZnJlcXVlbmN5ID0gPDUwMDAwMDAwPjsNCj4gKwkJ
c3BpLXR4LWJ1cy13aWR0aCA9IDwyPjsNCj4gKwkJc3BpLXJ4LWJ1cy13aWR0aCA9IDwyPjsNCj4g
Kwl9Ow0KPiArDQo+ICsJZmxhc2hAMiB7DQo+ICsJCWNvbXBhdGlibGUgPSAic3BpLWZsYXNoIiwg
InNzdCx3MjVxMjU2IjsNCj4gKwkJc3RhdHVzID0gIm9rYXkiOw0KPiArCQlzcGktbWF4LWZyZXF1
ZW5jeSA9IDw1MDAwMDAwMD47DQo+ICsJCXNwaS10eC1idXMtd2lkdGggPSA8Mj47DQo+ICsJCXNw
aS1yeC1idXMtd2lkdGggPSA8Mj47DQo+ICsJfTsNCj4gK307DQo+ICsNCj4gKyZzcGkxIHsNCj4g
KwlzdGF0dXMgPSAib2theSI7DQo+ICsNCj4gKwlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0K
PiArCXBpbmN0cmwtMCA9IDwmcGluY3RybF9zcGkxX2RlZmF1bHQgJnBpbmN0cmxfc3BpMWFicl9k
ZWZhdWx0DQo+ICsJCQkmcGluY3RybF9zcGkxY3MxX2RlZmF1bHQgJnBpbmN0cmxfc3BpMXdwX2Rl
ZmF1bHQNCj4gKwkJCSZwaW5jdHJsX3NwaTF3cF9kZWZhdWx0ICZwaW5jdHJsX3NwaTFxdWFkX2Rl
ZmF1bHQ+Ow0KPiArDQo+ICsJZmxhc2hAMCB7DQo+ICsJCWNvbXBhdGlibGUgPSAic3BpLWZsYXNo
IiwgInNzdCx3MjVxMjU2IjsNCj4gKwkJc3RhdHVzID0gIm9rYXkiOw0KPiArCQlzcGktbWF4LWZy
ZXF1ZW5jeSA9IDw1MDAwMDAwMD47DQo+ICsJCXNwaS10eC1idXMtd2lkdGggPSA8ND47DQo+ICsJ
CXNwaS1yeC1idXMtd2lkdGggPSA8ND47DQo+ICsJfTsNCj4gKw0KPiArCWZsYXNoQDEgew0KPiAr
CQljb21wYXRpYmxlID0gInNwaS1mbGFzaCIsICJzc3QsdzI1cTI1NiI7DQo+ICsJCXN0YXR1cyA9
ICJva2F5IjsNCj4gKwkJc3BpLW1heC1mcmVxdWVuY3kgPSA8NTAwMDAwMDA+Ow0KPiArCQlzcGkt
dHgtYnVzLXdpZHRoID0gPDQ+Ow0KPiArCQlzcGktcngtYnVzLXdpZHRoID0gPDQ+Ow0KPiArCX07
DQo+ICt9Ow0KPiArDQo+ICsmc3BpMiB7DQo+ICsJc3RhdHVzID0gIm9rYXkiOw0KPiArDQo+ICsJ
cGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gKwlwaW5jdHJsLTAgPSA8JnBpbmN0cmxfc3Bp
Ml9kZWZhdWx0ICZwaW5jdHJsX3NwaTJjczFfZGVmYXVsdA0KPiArCQkJJnBpbmN0cmxfc3BpMmNz
Ml9kZWZhdWx0ICZwaW5jdHJsX3NwaTJxdWFkX2RlZmF1bHQ+Ow0KPiArDQo+ICsJZmxhc2hAMCB7
DQo+ICsJCWNvbXBhdGlibGUgPSAic3BpLWZsYXNoIiwgInNzdCx3MjVxMjU2IjsNCj4gKwkJc3Rh
dHVzID0gIm9rYXkiOw0KPiArCQlzcGktbWF4LWZyZXF1ZW5jeSA9IDw1MDAwMDAwMD47DQo+ICsJ
CXNwaS10eC1idXMtd2lkdGggPSA8ND47DQo+ICsJCXNwaS1yeC1idXMtd2lkdGggPSA8ND47DQo+
ICsJfTsNCj4gKw0KPiArCWZsYXNoQDEgew0KPiArCQljb21wYXRpYmxlID0gInNwaS1mbGFzaCIs
ICJzc3QsdzI1cTI1NiI7DQo+ICsJCXN0YXR1cyA9ICJva2F5IjsNCj4gKwkJc3BpLW1heC1mcmVx
dWVuY3kgPSA8NTAwMDAwMDA+Ow0KPiArCQlzcGktdHgtYnVzLXdpZHRoID0gPDQ+Ow0KPiArCQlz
cGktcngtYnVzLXdpZHRoID0gPDQ+Ow0KPiArCX07DQo+ICsNCj4gKwlmbGFzaEAyIHsNCj4gKwkJ
Y29tcGF0aWJsZSA9ICJzcGktZmxhc2giLCAic3N0LHcyNXEyNTYiOw0KPiArCQlzdGF0dXMgPSAi
b2theSI7DQo+ICsJCXNwaS1tYXgtZnJlcXVlbmN5ID0gPDUwMDAwMDAwPjsNCj4gKwkJc3BpLXR4
LWJ1cy13aWR0aCA9IDw0PjsNCj4gKwkJc3BpLXJ4LWJ1cy13aWR0aCA9IDw0PjsNCj4gKwl9Ow0K
PiArfTsNCj4gKw0KPiArJmkyYzQgew0KPiArCXN0YXR1cyA9ICJva2F5IjsNCj4gKw0KPiArCXBp
bmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+ICsJcGluY3RybC0wID0gPCZwaW5jdHJsX2kyYzVf
ZGVmYXVsdD47DQo+ICt9Ow0KPiArDQo+ICsmaTJjNSB7DQo+ICsJc3RhdHVzID0gIm9rYXkiOw0K
PiArDQo+ICsJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gKwlwaW5jdHJsLTAgPSA8JnBp
bmN0cmxfaTJjNl9kZWZhdWx0PjsNCj4gK307DQo+ICsNCj4gKyZpMmM2IHsNCj4gKwlzdGF0dXMg
PSAib2theSI7DQo+ICsNCj4gKwlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KPiArCXBpbmN0
cmwtMCA9IDwmcGluY3RybF9pMmM3X2RlZmF1bHQ+Ow0KPiArfTsNCj4gKw0KPiArJmkyYzcgew0K
PiArCXN0YXR1cyA9ICJva2F5IjsNCj4gKw0KPiArCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7
DQo+ICsJcGluY3RybC0wID0gPCZwaW5jdHJsX2kyYzhfZGVmYXVsdD47DQo+ICt9Ow0KPiArDQo+
ICsmaTJjOCB7DQo+ICsJc3RhdHVzID0gIm9rYXkiOw0KPiArDQo+ICsJcGluY3RybC1uYW1lcyA9
ICJkZWZhdWx0IjsNCj4gKwlwaW5jdHJsLTAgPSA8JnBpbmN0cmxfaTJjOV9kZWZhdWx0PjsNCj4g
K307DQo+ICsNCj4gKyZzY3Ugew0KPiArCW1hYzAtY2xrLWRlbGF5ID0gPDB4MTAgMHgwYQ0KPiAr
CQkJICAweDEwIDB4MTANCj4gKwkJCSAgMHgxMCAweDEwPjsNCj4gKwltYWMxLWNsay1kZWxheSA9
IDwweDEwIDB4MGENCj4gKwkJCSAgMHgxMCAweDEwDQo+ICsJCQkgIDB4MTAgMHgxMD47DQo+ICsJ
bWFjMi1jbGstZGVsYXkgPSA8MHgwOCAweDA0DQo+ICsJCQkgIDB4MDggMHgwNA0KPiArCQkJICAw
eDA4IDB4MDQ+Ow0KPiArCW1hYzMtY2xrLWRlbGF5ID0gPDB4MDggMHgwNA0KPiArCQkJICAweDA4
IDB4MDQNCj4gKwkJCSAgMHgwOCAweDA0PjsNCj4gK307DQo+ICsNCj4gKyZoYWNlIHsNCj4gKwlz
dGF0dXMgPSAib2theSI7DQo+ICt9Ow0KDQoNCg==
