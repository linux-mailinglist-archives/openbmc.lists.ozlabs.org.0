Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 358783734F2
	for <lists+openbmc@lfdr.de>; Wed,  5 May 2021 08:27:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZmwS1CD7z3015
	for <lists+openbmc@lfdr.de>; Wed,  5 May 2021 16:27:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=utmxuWLA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=40.107.131.109;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=george.hung@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=utmxuWLA; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310109.outbound.protection.outlook.com [40.107.131.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZmw45pZsz2yjY
 for <openbmc@lists.ozlabs.org>; Wed,  5 May 2021 16:27:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T7HR5p74ElMuovMYXSklEPO6T8s5CgqS6N0EmDYjKGCJlRzMxFUY9hDfIxRWADa5dJIvFly2+sIgPvO8rmu/n6JWfArjDGegLWKPwBmQlZTe1KtsKnmV3OwCrSSQILLcCAWWYmmmR3pb0YVHmc+NKTwi8hEQ0mUH4/p3fFPe4ZCxk9gOa3/zDZP4vShl6kTMMndizbDkSr7RsjgsnzC9BzXognRubKKqOc55N2YiNomfU8XAxMEQJRza0kjCA6Bs6bvGd65JS0NA5Inx7WL5ZrkJBWozYt1M2eOWqgot0c9omb1xvwI4rbbPMMr4uQWdNiH1tTwbPxqJQ/2MRIHfoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6Z3/UXkBEThaHhfM4ifdDYGH2RoB3V/nSVfUgLstZg=;
 b=SdWGY75DG9Pzn2wehjWi88emyiheVTslkXZezwgilyxUyUEs+z6O1qoKS5OYltBVyLq+qXFyYz2hCtqn5xbW0temD94Xau3vHKi/d/B0ImsKZ2+LElzlfbv7GHtkeWv6Vo/58QIClSAY3+dzuhyRuzeoMxoJCqn/AaqoLSfya5y2nFBHRgzhkzjP7/o2nyhxYBGxLArogb92EjIKiI9McqV9AFUqjl1jCBjpAEl3u5Qus2HhmqlkLxH0YNpuAHWSGpcw0rHrlTH2LZO8IbOeJjxBKMEGdqC4oB1S9easROLBgu3WCIxh2AGTYeWM8F2xviGMYDcSMmWwYUPkCqythg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6Z3/UXkBEThaHhfM4ifdDYGH2RoB3V/nSVfUgLstZg=;
 b=utmxuWLAFqOBK2aQrnupFb+sKP5oVKVlXUH+OrbzKy7MyONFxoDRFTSQ5Ttbyi76MsL51Ugk4B0W1z7LvUFKI01GYxFTkjil6HYqC7A4wKISlPvDyhwwoqe3M4424yM87dEWLhJIh/DgiCjDoqvCApTvdsisT7WqYZ9XI7o/QDE=
Received: from HK0PR04MB2339.apcprd04.prod.outlook.com (2603:1096:203:46::21)
 by HKAPR04MB3923.apcprd04.prod.outlook.com (2603:1096:203:da::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Wed, 5 May
 2021 06:27:00 +0000
Received: from HK0PR04MB2339.apcprd04.prod.outlook.com
 ([fe80::8522:3491:faa6:e255]) by HK0PR04MB2339.apcprd04.prod.outlook.com
 ([fe80::8522:3491:faa6:e255%4]) with mapi id 15.20.4108.025; Wed, 5 May 2021
 06:27:00 +0000
From: =?big5?B?R2VvcmdlIEh1bmcgKKx4qb63cSk=?= <George.Hung@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Andrew Geissler
 <geissonator@gmail.com>
Subject: CI build for quanta/gbs
Thread-Topic: CI build for quanta/gbs
Thread-Index: AdcPP65+jY/sq0xaRI+ylE14EJw/VQ==
Date: Wed, 5 May 2021 06:26:59 +0000
Message-ID: <HK0PR04MB233989A7F66DD0B3964E2E0B8F599@HK0PR04MB2339.apcprd04.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=quantatw.com;
x-originating-ip: [61.218.113.162]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fc3a07b1-7990-4fe7-f0a2-08d90f8eca46
x-ms-traffictypediagnostic: HKAPR04MB3923:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HKAPR04MB3923673A730877616C89EB028F599@HKAPR04MB3923.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Lmd7+rwgcBB5tupYJEGTajmL7lG2rVdLgehKkCctRfM5Ki99fB0WmBok/sZujSSg7rMJhUQv95+8i3IWHihJE4qkfeMtImpkDlNpLm+Cqt6kGaXgW1MuIgHzZwOyx/RUkhq6YPZNTI842J4lvCMEnJkGifF4aRAcxaip2bSx8magr6Y3oEfk/mgeEnK55GB9EQDIqgUKFusu2z1DuhGinF5JsVAo5rApWt34onKyAG7YZE4ivgsMuXm17hbIW9AMm65aupsYRGGTwjkjH4rrz31sp46S6HwEtvHiUjiqvSfjXibdnFe1e06wdbl0ry7Eh/JxaH9UKrUK4ze2LBFenIwQbK03H+PtrBBNOgWbGVBNuM+W8VxYCnipF6BMyLZzvaW9Cx7WqE3HTbxLQnmhg2U0XIIG2zugRn96V8X75GDrTqmzbqcMAd4ZFCRegkFArPiJ2/SS8TgntWNw73kMdMgbA8a6xZw7xoKrP5bCxVZmqsTLuntObAdDMA3wmr/H2NmVqQqtjXo7luXRUS7uTiC2O5FUUhZ7Lm6gMRAbExC2E1UPD5D8rPWlImg5ulNCpSEdQUyiLk+duYhA0ca3UgmORpXAaqvkoFI1ro5CzQI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB2339.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(33656002)(66556008)(64756008)(5660300002)(6506007)(8676002)(2906002)(66476007)(9686003)(52536014)(55016002)(7696005)(38100700002)(122000001)(110136005)(107886003)(54906003)(316002)(8936002)(26005)(86362001)(85182001)(4744005)(71200400001)(76116006)(66446008)(66946007)(186003)(83380400001)(4326008)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?Z3IzMjZHMzE0eGlSdk1IMkpxcHVUbVlQa0ZzaWRiK0RXSytGK3JOMTVxaFVkMVVJ?=
 =?big5?B?MWdFSGtiYjhYMHU5UytFS085NEovY1FUNXR3VEJoMW9kWTErV0J1dUVuWWdJU0ZY?=
 =?big5?B?L3JLR2s2MXFicm1DNWRQaWtZVHBTay9ydENUbWd5U1hsa2pjV0ZqR3NiNzZhMkdi?=
 =?big5?B?QmZibDBOTVdBdHpyV1RQUHZEQ094MUhzZmF4aVJwT2JVNDZGdVBuNDJPb0JVOEtX?=
 =?big5?B?Z0NlL1o2NlUxS0pQaWNGNHZvUGEvbWl2TS9YcWRKbUFodWZKVVRvRG82VVVZd2tJ?=
 =?big5?B?ZUh3SzdpVUc5RTBVVnNjT1VqemNLT3RyWUlZRG5TTm5NU0xybU5ORUNsZUYvT2NT?=
 =?big5?B?cXFpbjR0TERvcjhCb04vbFJKOUxKT0dOMkFIYWNGbENSYTRKUkorM0RiaU42cCtW?=
 =?big5?B?ZDd5aFFSM3JpKzNLc056TWtOTTdxVy9DV2NmK0E1YjFBdUc5UEJqQmdIZWozMmUy?=
 =?big5?B?TWU3OFpiU3crNTFNS3M1S0pkNzFKcFczbWRQWWZvMGdHT2kyTHp3ODFvNFphM3Nn?=
 =?big5?B?WHhBelA3aHc2TWxobjAyTUpGb2JKeW9uNU1Fb0lqaGZxcXB2ZnpPdmJUeXo3bmFH?=
 =?big5?B?K3ROSzZ5MTBkQzA2NTdpZE84R0MxMGVodEZlSEVQc3dYbzFCVC9pQkpSQVMwVE5N?=
 =?big5?B?bDErMzVpN1lWc0NKR3FLRmdxUXZnT01GS1JBczA2N00xRW82MGNpVG1QczRBa3FQ?=
 =?big5?B?MXBGZW5yamNJUDVBNDY2SEFEL0xnaDlGbkUxWHNEMEtCdVdHKzhNczZaZkZldkVK?=
 =?big5?B?KzJDeEk2SS9VL05GRS8wYUxNT21HNkVJRjNESG1ESXdPNXpyaFBRNTh6dkk0TUJ3?=
 =?big5?B?QW5TUHdaWTNDWDIzSzJCOE9DMHYxa1VCdm50ZmRhNDdoTXdmZWZaRlZJOXI2UVlK?=
 =?big5?B?czlLMm1CVUM0TXM4ZXhtOG9Xb1lsdUxJSmhBY1hlMk12eVB4WndyREdsWVprRXda?=
 =?big5?B?WmtUQXpFVWVoTEtiK2NPMXZaNDBCRTdCSU1UWVNUR04xaGZYWFpHN3hPSW05Q1No?=
 =?big5?B?YzlxeE9HM1JoejJVUlFmSHFiQldOeHlHQnowRUk2TFpKSWVFcWJES21FSmJaemx0?=
 =?big5?B?eUF3L3IweHcreFloSVF2QTNMWmdFVnZyVWdVOVVpTnNxaDBqeVRNU0tIdTRDdVFI?=
 =?big5?B?ZWZqYTAvc0ptb21XQnVIb2VISkdQTDVLemtxZ1RhMkdTbXpsNGJxK1VORk9qYXdV?=
 =?big5?B?ZldTbGEvcU9VVS9BeTBETHFGblh1YmNjekVKN0V1enZLZkRoR01BbEhoVEt2RWdH?=
 =?big5?B?WE5hWWtoODdRaW5kYzY4NGYxNU5jRm42YmV0bTR2K0FBejRPOCsyV0pqYm5DWDVq?=
 =?big5?B?dkhlNEQ3UDkwemxoZlVDaGpjZGZic2l0VEtyRzlOalZrbGxyaTdBcjV0NGNQdis0?=
 =?big5?B?K0ZrTkx5OEFIdHdiVU5kYThhTUoxQXRVeCtYSzg5ZmR2VUl6aktPTDY5cno1Q3hp?=
 =?big5?B?Uzg4Tlg3L29EdXYzQi9LeTJMQngwSVFWSS9LamNCTE50T2VzbTZGR1FiemVaMGlz?=
 =?big5?B?bDBueEhTZlBaQ2R6b0F1OWtYTzFTS2w0eHB1dHl0YTVua0RYaUdIYW1tZno0bWp3?=
 =?big5?B?VUFpTUc4emtzN3VKZDFPOTcrRE0ra3ppR0t2VkI1ck1mUVhHZzNpRkRCODJ2K3pp?=
 =?big5?Q?Rx+uFwiRgPcFkqQGiQztltVtPlix5BvZK8++KYtWD/CxlIIs?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB2339.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc3a07b1-7990-4fe7-f0a2-08d90f8eca46
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2021 06:26:59.9197 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f7ycKEASu4k4jgpP0mZjYm78GVJJnTbXl1ETLgQv0PYKZOx0QKmRbdOOewU/rRAxiTt4VyPHTX4sh5eTMgpNhYqfRRyTqe1dONUzgCAt6yM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HKAPR04MB3923
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
Cc: Brandon Kim <brandonkim@google.com>,
 =?big5?B?RnJhbiBIc3UgKK59u3jBvik=?= <Fran.Hsu@quantatw.com>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQW5kcmV3IEdlaXNzbGVyLA0KDQpXZSBoYXZlIHBvcnRlZCBtYW55IE9wZW5CTUMgZmVhdHVy
ZXMgdG8gcXVhbnRhL2dicyBtYWNoaW5lIChOdXZvdG9uIEJNQyBwbGF0Zm9ybSkgYW5kIGhvcGUg
aXQgY291bGQgYmUgYWRkZWQgdG8gQ0kgYnVpbGQsIGNvdWxkIHlvdSBoZWxwIGFkZCBxdWFudGEv
Z2JzIG1hY2hpbmUgdG8gQ0kgYnVpbGQgdmVyaWZpY2F0aW9uID8gKEknbSBub3QgZmFtaWxpYXIg
d2l0aCB0aGlzLCBpZiB0aGVyZSdzIGFueXRoaW5nIHdlIG5lZWQgdG8gZG8gZmlyc3QsIHBsZWFz
ZSBsZXQgdXMga25vdykNCg0KDQpUaGFua3MgYSBsb3QuDQoNCkJlc3QgUmVnYXJkcyANCkdlb3Jn
ZSBIdW5nDQoNCg==
