Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2436F3D70CC
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 10:07:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYqCZ6Gfyz3bXZ
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 18:07:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=2Er4PhcU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.104;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=luke_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=2Er4PhcU; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320104.outbound.protection.outlook.com [40.107.132.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYqCC08lrz2xZn
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jul 2021 18:07:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8I90siYNypVK7eexLB3MRtFwBQx79AXQu4u1RMuaQs/aIJeWgUevp5FaiV5J1MnqfyRrsCiqKB5s1WZ5GopnlXnioBK/LVFWjAJ/tgL56B9K9UMq6i9phBQy8NX69BES/1dCpFm4o1upydyenH+wv8+e4hNqDAZZQaOodp2H8KTplm9aROgjWulO/G3ceUJM3kDCkQUetJt+JlqCTD/TVN7F6YsoaTUauPpfdpjI67khiD7tE3lcqZm4jlxZUbH1oauSRrLaxdFoEG+UYIC/K4CYaQ9V9u/QZYzrFrjFbP5vRQQfoPnuSVe9veJ1HD0/jPbbjq5WUnR03/G58owJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DaFGjx+9mhBscDrx8GOlquL9n4AwYZ+2Z7aLIu/DcmI=;
 b=RVDSiv6NepcTjyzjjEevQpKcGl0VGg3vdSTBaLhPTGzczIlyUwGMmM6aFjT3bl5ngA3bLlAABufx441oFQtCmJyzCBQmHOFKUZNWQQjt8eQD4alMRzcd743EZnSmsUJvD1zljjRp6ORQPG6a7QCijhsjdNvena3l2d6BV5KLnMaAyU6AKkb1v0OjXYznENhM9qiH4hvnzFKspiAqy8PI7hIMAGBvxHJL0Ohjxnh6j4f6bMeYy4im1rjhszUFrEEo1e1ifiIP9S0Gr+P/Hpqezu5tFfBSikMuK1aAHHrJYQoIZlURlO9+yK3lYhx7noLpQB2EqWTZzewn7XF/sFcdAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DaFGjx+9mhBscDrx8GOlquL9n4AwYZ+2Z7aLIu/DcmI=;
 b=2Er4PhcURhZKjtds+QxG8+11NlHmEI5oRC6VtodgEQ2d4/DMklEELCkUrTUYVCIfvqXlENxD2EHb0QfFvNyafSjmW+TFfu6UqFksQ3dnyWFO+sTuvAdtuEB3rgOI8kDzZi5pfZ9CtUM2f+yawq85HxATAnrFIg4P/ixYyHtZIXoJuHkyQIU/6JuKvYc492JdsKjg4EnKl94PwTi6QzByM6V3mGyARjAb4WvtLdFdNTb35cUyzFea9csSmIqW7+Z1bQ3SOocNzD1uvMrrJsHJ8DaHMMvDfljAavDJMCmqc9YZIQ5WwGsapXA3Zy1hfd3rGn37eQnUMy3or6Xdga3ruQ==
Received: from HK0PR06MB2321.apcprd06.prod.outlook.com (2603:1096:203:49::11)
 by HK0PR06MB3108.apcprd06.prod.outlook.com (2603:1096:203:8b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Tue, 27 Jul
 2021 08:06:59 +0000
Received: from HK0PR06MB2321.apcprd06.prod.outlook.com
 ([fe80::10d4:b8ce:9878:23bc]) by HK0PR06MB2321.apcprd06.prod.outlook.com
 ([fe80::10d4:b8ce:9878:23bc%5]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 08:06:59 +0000
From: Luke Chen <luke_chen@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>
Subject: RE: Signed CLA from ASPEED
Thread-Topic: Signed CLA from ASPEED
Thread-Index: AdSF/BDVNQADm2VBRuejwbddN04pK6tWXgwgpVzwJFC1RjWcAP///z8g
Date: Tue, 27 Jul 2021 08:06:59 +0000
Message-ID: <HK0PR06MB2321ECE83353B7B73F6F19E1E1E99@HK0PR06MB2321.apcprd06.prod.outlook.com>
References: <623110cb8acb4bbc99c43c47b37f5457@TWMBX01.aspeed.com>
 <9C742B6B-8604-4EC1-9AE8-98844ACB557D@fuzziesquirrel.com>
 <HK0PR06MB23218108A08BC07208A93909E1FF0@HK0PR06MB2321.apcprd06.prod.outlook.com>
 <CAN9Jwz375dV0fFbBaE_SK6Cw8t0pyC-j-fPFuK5tm_EATWoFmA@mail.gmail.com>
 <HK0PR06MB23215E570FE7381C47EEA024E1E99@HK0PR06MB2321.apcprd06.prod.outlook.com>
 <HK0PR06MB2321716D4130BC0F706AB274E1E99@HK0PR06MB2321.apcprd06.prod.outlook.com>
 <CACPK8XfuhPDd9aw4L2+gbUfMSnMoBX6-D8yc+FwvPaZzP_EtuQ@mail.gmail.com>
In-Reply-To: <CACPK8XfuhPDd9aw4L2+gbUfMSnMoBX6-D8yc+FwvPaZzP_EtuQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc7d560b-3205-498a-ea9b-08d950d58239
x-ms-traffictypediagnostic: HK0PR06MB3108:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR06MB31084429F8F7D52901F249DBE1E99@HK0PR06MB3108.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6kFjoOwGUbK+BYJH95CK7R12ILRJX5tGQCm0Xx0sxWnXApLBXJp01vvgWn0d4+BQS+C+u68JmB7yt2yDp+PSrTXQoYmoX7Jg5It8v2uHW9DkjusWu3iU1A+vVSXBvKnLkvb2nZfpiyhUkrSU4eN6uJzvStb8kBxjZ3xcQA1YMMvfWyII4aMDrazwvrwYs8C493Soa97Ud/X9lsTMQ9OVs05JnYzBC2uiLtpL3Jz7ODnNQ5h6MOxjMRGilNRfVDVR4bYaKaN4TaskTTJGQK9D+yTBjUxoAvroCN7TZqxjeoLR/PpFa4D2nLx6CZzLqb/a9BEouFZ77I150HAQqO1GUnxUgA0iJWhst9g4p2YyZtI2i2eCNc2Ijx1pluT16HZlWn7PMC/ASVDcLza9z/dCYQvg4frjd5j71YUOyMiZa0ZcXhAZrskBYmjaPIYyDWfHT6fgyEQ0i4JlEb+g5GCxbwMZp63zy8dzdPawMlxJ3+ozLxDAp4SnT32lcDUqU6eQcftPDS2Axg1lZNob+BsjjxRFvmC0+NBuiO9cFw82lgdSlCfC3hrxvlFCK9gb9ckOhSsnjUfRD4NBIggjQ1ZoQfmXsg8dEnJ486l04WKWZMenWYKYrGvTy+iAqG2pnl1DOHaUZLnYaIkMbAh/vWf2jAWOoc6+IwuxiD4xiSinKu+ET0oVBUcc58Qa1oNhSka+km1bu5vqIx6MqjWuULHEcQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB2321.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(39840400004)(136003)(346002)(366004)(71200400001)(66476007)(186003)(64756008)(4326008)(55016002)(66446008)(8676002)(478600001)(107886003)(8936002)(7696005)(66946007)(6916009)(9686003)(66556008)(38100700002)(53546011)(86362001)(6506007)(316002)(122000001)(4744005)(83380400001)(33656002)(2906002)(76116006)(26005)(3480700007)(52536014)(5660300002)(54906003)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VTFrdndDZmxBcmpNWE5uaHBnRUxBanZwdWM0aENlY2M4di83UzRIQk5mRElP?=
 =?utf-8?B?R2UrSStraDdhMnNRSUFyU29MUGFTM1ViSzU4eDZVdTlvemsyZVN5STRpeHBL?=
 =?utf-8?B?dmhjUUs2ZGVxazZiZEdNUGRCRWNYTVpUR2VsbEh6OGZrZzZwQWE2VWFPRndZ?=
 =?utf-8?B?RG81QUZLa0x4cVlURU9yMTZndjRFQXl0NkNzd0dLWFNldVpwUmE2cDE1VGJa?=
 =?utf-8?B?VFI2R0dDZzJoRmFUY3hhdXlLUjNsb3l2cytOMDhFTEJuRXJxMDVvMHhIQ2lD?=
 =?utf-8?B?RUtQNFlKSStVUXhPL21xT1JDL3g2c0xEcTV3ajNVZzk3VWVpVGp1Nk9CaStz?=
 =?utf-8?B?d0RKU1JGMFBHSVNkVWNLL0FNS0MyZkNaWXdEWlErM0FPWHVkZVlqZ3ZnOEFV?=
 =?utf-8?B?S2c5bnVxNk1HVThSQ3NjdHM5M3hmbTQrZmk5RmQ2RlhOL3RHS3JkdmR2cFpl?=
 =?utf-8?B?TTR1cmlTZmNITnhHZ0xpVW9QM2cxREFrRTdKNEFTQWJjRlRqWjVLQXIrcTV0?=
 =?utf-8?B?alpUdnJIT3gzUzRjNzF0alcraGFJVE1BUUlDRHhmeVh0N2M5L3VIdjBITm52?=
 =?utf-8?B?cW1kdHBrSktlZk9PK0thTWxPYjc0eWF6SFNXM1QwdnhxUXdrRnBHM01OWUIy?=
 =?utf-8?B?MzJtNFZRejRjaStHbFZMOFZQcERNS3cxK0tvMVFmVmwxOVFTYy9EQkhJbHRR?=
 =?utf-8?B?VHJvQ0tZTFZHd1ByY2ZtcDdUeWI2TUIzNE5tVjJVV0doaFc0Z1pKdVY3Vkk4?=
 =?utf-8?B?aUVQU3ZBY2gxV1NtanRGcGRDMEFiaDY0bkNqN0xJR25XODZodzJGcXhORlpF?=
 =?utf-8?B?NERQd29Xc09BZFZVNjBYVWdnUDZ4S0s3emFtRUN0b1JxVHdTNW9yY3l3NGMr?=
 =?utf-8?B?UjVxU2VzVU1SOTB2alRuT01SNEFSVk1kclZ3R3ExTGFGU3E2eWM4dGFoRXpj?=
 =?utf-8?B?UmFXb1dZR3UzNmR0RWRWSi9PWmdpd2E4T1N1di9wK2lwZTB4YVAyRTcyTHYz?=
 =?utf-8?B?WDcwWUR2aTlWZWlISmZsM3drVzQxbXgwWDZrN3hGUW5NQ3hlN2dHRlJJKzN6?=
 =?utf-8?B?NTBtVlZackhHK0YveTErRExaK0RpUXBtRmhjdkwrUnVSTm10UmRsQld3b3Vy?=
 =?utf-8?B?OGplS2hwUjVhK0pjV3ROL2dyUXZJbVdTTEY3dExmZkIvb0R6NEFVUkUzcjB0?=
 =?utf-8?B?cGUyRXBidWx5L1RGU0tKS01iSVlyRVcreEtwbENVVG15aGpmZGRwOFljeXNT?=
 =?utf-8?B?L1VkMUxMcUtKUG9qNlRWTFZ1U1BicXBhaFdFOUg1UWVveFp3RWJuZmZSRW1n?=
 =?utf-8?B?SDJUZnpxY295Z3pVSW41ZWxla2lidWZBeWdubGpPL2J3Q1ZSKzJUcWI3Yysx?=
 =?utf-8?B?dEdZNnM2NTZ2SXJkaTBzQk92eW9CS25tN2ZjQUphbnRiN1FsQVh0aDkrbFVP?=
 =?utf-8?B?NnZ4VldzNm1uTWg3bGY1VHl6OVZGUTlzcTRyQzRqYjFKMnNlVWNCUkxhRU9P?=
 =?utf-8?B?dnI4MDJVdklLQ0tWakpUYVVuclNDN25oUk1kNWg3L041OVR5YlY4Z2EyQ3d0?=
 =?utf-8?B?aFZ5MEI5VUljdTIwQTRmQk8yUW5ZZjlPQm54Y2FQMC9Pd0kwOGdQNVB0Qmwr?=
 =?utf-8?B?eVhoTzZFWGwzOXN1UHRVdERUaXRyQ2ZoKy8zSHVnWlUzZmYwdkZCMm9pV3lB?=
 =?utf-8?B?U053alRubDY1ckdwNFN3QUVGVHp0blpySWE3WXhUTVdZbkZaaTFPbmZtcmZ1?=
 =?utf-8?Q?P24pxwuPWemYCudPClOP0kr74aNev872g+2UVv8?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB2321.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc7d560b-3205-498a-ea9b-08d950d58239
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2021 08:06:59.1116 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IOviQRQYnajNz7p//ZEe1fldN/sOofoHHBv1MAeHDvXr2f7yUlSlenh2uPUBJHcg70pgc3WqTn1gKA2SyZpz5gGhjiBbZFA7mq4gSuoRd4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB3108
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
Cc: "manager@lfprojects.org" <manager@lfprojects.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>,
 Troy Lee <troy_lee@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgSm9lbA0KDQpUaGFua3MuDQoNCg0KQmVzdCB3aXNoZXMNCg0KTHVrZSBDaGVuDQooTykgOiAr
ODg2LTMtNTc1MTE4NQ0KKE0pIDogKzg4Ni05MzUtNTkyLTg5Mg0KNEYsIE5vLjEsU2VjLiAzLEdv
bmdkYW8gNXRoIFJvYWQsIEVhc3QgRGlzdC4sDQpIc2luY2h1IENpdHksIDMwMDY5LFRhaXdhbixS
Lk8uQy4NCg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogSm9lbCBTdGFubGV5
IDxqb2VsQGptcy5pZC5hdT4gDQpTZW50OiBUdWVzZGF5LCBKdWx5IDI3LCAyMDIxIDQ6MDQgUE0N
ClRvOiBMdWtlIENoZW4gPGx1a2VfY2hlbkBhc3BlZWR0ZWNoLmNvbT4NCkNjOiBicmFkbGV5YkBm
dXp6aWVzcXVpcnJlbC5jb207IG1hbmFnZXJAbGZwcm9qZWN0cy5vcmc7IG9wZW5ibWNAbGlzdHMu
b3psYWJzLm9yZzsgVHJveSBMZWUgPHRyb3lfbGVlQGFzcGVlZHRlY2guY29tPg0KU3ViamVjdDog
UmU6IFNpZ25lZCBDTEEgZnJvbSBBU1BFRUQNCg0KT24gVHVlLCAyNyBKdWwgMjAyMSBhdCAwNjo0
NywgTHVrZSBDaGVuIDxsdWtlX2NoZW5AYXNwZWVkdGVjaC5jb20+IHdyb3RlOg0KPg0KPiBIaSBC
cmFkLCBNYW5hZ2VyDQo+DQo+IEl0IHNlZW1zIG15IHByZXZpb3VzIGVtYWlsIHdhcyBibG9ja2Vk
IG91dCBkdWUgdG8gdGhlIGF0dGFjaG1lbnQgZmlsZSBzaXplIGlzIG92ZXIgMTI4S0IuDQo+IFRo
ZSBhdHRhY2htZW50IGZpbGUgd2hpY2ggSSBzZW50IHlvdSBpcyB0aGUgc2lnbmVkIENDTEEgcGRm
IGZpbGUuDQoNCkkgaGF2ZSBtb2RlcmF0ZWQgdGhlIGVtYWlsIHRocm91Z2ggdG8gdGhlIGxpc3Qu
DQoNCkNoZWVycywNCg0KSm9lbA0K
