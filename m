Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A87742A30B
	for <lists+openbmc@lfdr.de>; Tue, 12 Oct 2021 13:19:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTCqm01Cwz2yY7
	for <lists+openbmc@lfdr.de>; Tue, 12 Oct 2021 22:19:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=GC/AzW7u;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=40.107.130.99;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=GC/AzW7u; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300099.outbound.protection.outlook.com [40.107.130.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTCqJ6MS7z2xsN
 for <openbmc@lists.ozlabs.org>; Tue, 12 Oct 2021 22:19:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iTPE/4ICT12+Rrl7YbwViyubjzN4L35DHAkUwv9IuyITG5DOocPnYyQAwwnDpV0fpcscapE682ip+am8DJBFbJxT55d5bRqAP9Oe0BjydQSkbpiiZ7T89jg8IE8vzru6vmBFkuI9NpENJLinH0KLKJ1lWGeAnxmARpSxKErHG5WZzRNjG9jdvwE5c50GiHyYbtr3hEiMEZegb1ICIViRmro0vsPCaX0BQYUsyEmHFT7+IMMrX1CgdZRpitauMb6kgde25bkaG73b6IhYmVabdrX6J+Ldyu4Qgha5ceLUuwvZzXU+5cY+tVBZcSAePY8pROJ0o/ILHoqWXnGe81DETw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6r+NvNJBBsgNz7HwJyRXObHojhUNLIAYGGzJ3W1ui8=;
 b=mbYg3wfpyqsG7GerYdegs5f4MS/jJd8j0XNIqy1FKJ9C7npQ44La08nHBbcBi0NRpe02Mv1z2A8M2w/fvpY8qJrLh1C5XDQnew9CHuH4BJIXlW+52FeRtIbaeEZGcncQwOkvUkQTwoL26/asdmL1sUkRifLc9aNCURboESqM4c0yEDawh6Rn6mUpEqXfkHuworMqlSmH9NmGqQh1cn9AkwjVnvY0nkKG5uhEdM+oeFwJhE96VZfFjnJjykj8AtD+x6DGnPLbAalr0pnstf1Svh7S3AOsBmdT8RBXJV46KTm/Kx/XSkY0upsIHhTiw60rbchJITumSQbJpS7SuEIjug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6r+NvNJBBsgNz7HwJyRXObHojhUNLIAYGGzJ3W1ui8=;
 b=GC/AzW7u6Xb8j2IgpHLdtg4S10F4HIr8bKNQo4/9ExEKhsDO86JVvarnV1cAZuklrX62xEwPd2ZWcLTf9HiCAN5XoBhVOEgCHFYU1fHOVfpPXru5t24E/kcS2QRWJ7Y27WHFosIIlxWHkHk4LvdE/O8jc9fVFWJwy1qdcgATvmA=
Received: from HK0PR04MB3058.apcprd04.prod.outlook.com (2603:1096:203:8d::11)
 by HK0PR04MB3105.apcprd04.prod.outlook.com (2603:1096:203:8e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Tue, 12 Oct
 2021 11:19:04 +0000
Received: from HK0PR04MB3058.apcprd04.prod.outlook.com
 ([fe80::517b:d054:1ce3:ef40]) by HK0PR04MB3058.apcprd04.prod.outlook.com
 ([fe80::517b:d054:1ce3:ef40%7]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 11:19:04 +0000
From: =?big5?B?VG9ueSBMZWUgKKf1pOW0SSk=?= <Tony.Lee@quantatw.com>
To: George Keishing <gkeishin@in.ibm.com>
Subject: Expected response table for ipmi standard commands used for
 verification
Thread-Topic: Expected response table for ipmi standard commands used for
 verification
Thread-Index: Ade/WNbNdxPEHNQBS3mjwGoKhU9yjw==
Date: Tue, 12 Oct 2021 11:19:04 +0000
Message-ID: <HK0PR04MB305832327CA30B3FB2D70985E6B69@HK0PR04MB3058.apcprd04.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: in.ibm.com; dkim=none (message not signed)
 header.d=none;in.ibm.com; dmarc=none action=none header.from=quantatw.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c06a5fe-4e03-44ee-617c-08d98d72197c
x-ms-traffictypediagnostic: HK0PR04MB3105:
x-microsoft-antispam-prvs: <HK0PR04MB310521C8C684F8499511D81EE6B69@HK0PR04MB3105.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IGzd0EtFPRq5bXYCp07ojhm29T6lwCH+RZ3hnacjEGNb0mzG5iaawTDE+b9IXm9Aa8yy+FXKy1OeaaxbnjZV/x20QAK2QjdNBGS39Sw1XZ6igLgsnSG2sH8Z/j4L3ZFbnvrdCy8EWN+j1inRDeN2gqWAainRXnlzX8SoT9OW163rbnckqMvUASD5Ew7nnG6uzEHI1zM5Rs6/JXnUBrzawuP3a7JBeDpzbR67BhUNaFimPz0vq8K5ikMicGLHU2BvdpjB1mZ034G1fHPOpVT+OFscgC6WwNCKj6aJP6Wb7hQ1X2v1Txj42tEXL6YoxILBrTjI3z0JjbwVUpSjcWXKtqcLaAZk2WQ7OIFoAj7n5XxpcO7dQGGOIjLdRUSjTEpbHMPlyVDlZ3+TZv0CzN4JD1Y3fr9R0xUU51qd/fgyufIHmVfe0jfSyMe6PULc1eil/LFWRjhSXnoTcl6JLwRrauN/pBvFZm3jYzdKuLYxs1pWr5Vckr+C/iTq0+geqQodUp3cUep/rlSjaPBM5q1hQTaDYLIUZqI66nIonQ0JH1n4P6zzwfed3KcO6VOiYBuzvr6BLVi51WxWNyPWXfoh4jWRluoGRjIvMjrh+AOdOtBwOGzUSgu16ZKqjaViUDAwj+5NwbIIXJr2hQfX6BLN0dhQviWvRggCr6CE5uFgcWQvWHcdcMgGuTK65zil4GXM2swODwx0DGeBCF0tC+2jJg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3058.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(38070700005)(4326008)(6916009)(52536014)(26005)(71200400001)(186003)(6506007)(86362001)(4744005)(33656002)(55016002)(9686003)(122000001)(316002)(15650500001)(38100700002)(85182001)(2906002)(7696005)(8936002)(83380400001)(76116006)(66946007)(64756008)(66556008)(66446008)(66476007)(508600001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?M3VQTEpuUmhpaXVWeDNNU3BocDJRUEM1SGZKOFRXbkhVMVBVZWpyUUVtT0dkdmFS?=
 =?big5?B?bkVjemQ2ZGpHQWErazJ4bFpDQjdFaHQ1cm1idk1SVWhsWXJqd1AvZVJ2a05Xa1lM?=
 =?big5?B?bENaU3IxS3ZNeTdHWVErOXJRZlJhQ1pDVzFVUXlvcW51ZW9PQUJ1RkJnVDFtS3Ba?=
 =?big5?B?OTIwTW1DWG5SVDcrNjByc2hKb0VCNTZFU0gvQ1JQTmNucXFxdW1tZk5CaVM2VENY?=
 =?big5?B?cSsza3ZNVzhvd2RQZlVKZFpRKytCSUJzWUpRby9xTXgrWko2Mk9DbjBtS3huU1A0?=
 =?big5?B?ZFhsOU9mSlhJMDRGbmVIaXNjTVpEcU9HaFAyZW9FUnFXVGVkWDlsVVhSc2FMYVZN?=
 =?big5?B?Tm5LbVlCeDJBUjUzUXM5Vzd4TFJuK01pdmlPOWxFOTRqR0ZKaDFYempoUk9HTUwz?=
 =?big5?B?UGFjYmF2NXJ2eTgxNXBWUjZyaUZKOGgxUEFZOXF4MkFDOEo5L3VSS0s4WFRkRmpr?=
 =?big5?B?TWd5TTFjOHZRVVpXalpWTU5XSTFQdHRhRkJpSmVHVHh4clRJL0FaVW1sRDNnZEtY?=
 =?big5?B?MUNpSEljczZ5Ui9tOUlqbFNkbkRxcTMvNXh3bHo0SndaZkdjV2YzVFJnUGVuRXZr?=
 =?big5?B?dFYxVHRRNHU5NkYzQ2hpNFphamozQ3VFMWFrQ1YxNUNaQzRieG45TDBVT0VTejJy?=
 =?big5?B?d2NvVU10NDc0SVg4b0o4cVJQWU1ka2tFcjBSUzVJeEZPNVovbHlsS2ZJU3dIRWdo?=
 =?big5?B?aFhENjNPclNYdlFyK0dndGVYeE9qcGs4M3RkMjRWbEhZcjJsYm5mTE1JaDBYR0E2?=
 =?big5?B?SWY2ZTlnZnJVWWREK25kZzE2Sm13ZFhudTFGRkszNURyN2VHemlpVEN2aTgzVEdH?=
 =?big5?B?c01vWkozNEt6TzdreC9YcXlyNEhzSldsYzlnaytkWnh6T3lHRE9tMlVvTEwweCtR?=
 =?big5?B?M2IyU3JTcXVZQWxtc2IxdTlybDdxWmxCa0xUK3J6Vy9BZm52UE1YZG1ENjJUbFFO?=
 =?big5?B?UUF0Q29FR2dYVW9MTVhYclhYN0NUSkROQ0dOcGZ1V21KSFJlTlZLSjBMcnBXWjhh?=
 =?big5?B?VUliV0NTdGRIaWtTUHg5S3BTN0JiYmJycXBTL3hBVHJIL25NOG1Rck5oVzZzTG0x?=
 =?big5?B?MkZrcFlWQW5NR0EzS1ZxZlZ1L28vRkpxL2xOU2puMFJZZ2MvNXo2ejVMNFlKL2xN?=
 =?big5?B?cWdJK2ZrL1FENDZNWHhLd0VXNnhQU0VoU1psMFh0THBnOTNxVG5TbU1ib1dlN0hX?=
 =?big5?B?eTZUbUFYNWJsV296RzRhVDBqT2FkTlQ3R3R2c2ZVVEJJbXZONDJyVk9nd0F5eXVr?=
 =?big5?B?ME9wL3AzZEwrajgrUXZ3eW5HUE1HdERYYldwN2ZzamcvNE1hbDdSYzRtd2tzMlcz?=
 =?big5?B?ZG5RdFU2dVExY0xLT1kvM3Q5TVlIM2ptem5ZZ2ZCdU5wdzJqRXh5K0dYYTVPMmVw?=
 =?big5?B?WTBrSnFmdWpVMTFsOE9qVzBGWVNGdi9IbzhIcDJDVkorT3hMTXhjYWg5L1NURkVy?=
 =?big5?B?bUxVVS8zdldKRTVEM3Q0cXJSYTBxL0J1ZEpxRFVUYnhqZktxN3dJODhlcXIyZldL?=
 =?big5?B?TGhSMEZTaERVZ3B1bEVIakRoWGg0UWtBbEFXbUVkbStqdDhicmN2Z0dLR01YQ2lm?=
 =?big5?B?ZzJvSGFuYTlVWEpXbnZ0bzFtK0V6ZFZsSzkrRUx5bndLVnRkRnl0VWt6SUtrbVBu?=
 =?big5?Q?vnnpzKyUfIKTrOMVtcf+ByveONTFH3vC7BJ/KGWoH+jdg6PV?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3058.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c06a5fe-4e03-44ee-617c-08d98d72197c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2021 11:19:04.1296 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XgXt0NReyeBBcdErr+7qjC2jmphNifNzTMxZee6GrpzhN52vMQgMpE+OlRG8NMBs2AcCpVxCChlaGh7PQgjGRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB3105
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgR2VvcmdlLA0KDQpJIHdvdWxkIGxpa2UgdG8gYWRkIGEgdGFibGUgd2hpY2ggc2ltaWxhciB0
byBkYXRhL2lwbWlfcmF3X2NtZF90YWJsZS5weSBmb3IgaXBtaSBzdGFuZGFyZCBjb21tYW5kcy4N
Cg0KRm9yIGV4YW1wbGUsIGluIHRoZSB0ZXN0ICJWZXJpZnlfU0RSX0luZm8iLg0KVGhlIG91dHB1
dCBvZiB0aGUgU0RSIGluZm8gY29tbWFuZCBjb3VsZCBiZSBkaWZmZXJlbnQgZm9yIGRpZmZlcmVu
dCBtYWNoaW5lcy4NCg0KVGhlIHRhYmxlIHdpbGwgYmUgbGlrZToNCicnJw0KaXBtaV9zdGFuZGFy
ZF9jbWRfcmVzcF9tYXAgPSB7DQogICAgIiR7bWFjaGluZX0iOiB7DQogICAgICAgICJzZHJfaW5m
byI6IHsNCiAgICAgICAgICAgICJmcmVlX3NwYWNlIjogInVuc3BlY2lmaWVkIiwNCiAgICAgICAg
ICAgICJtb3N0X3JlY2VudF9hZGRpdGlvbiI6ICIwMS8wMS8xOTcwIDAwOjAwOjU5IiwNCiAgICAg
ICAgICAgICJtb3N0X3JlY2VudF9lcmFzZSI6ICIwMS8wMS8xOTcwIDAwOjAwOjU5IiwNCiAgICAg
ICAgICAgICJzZHJfb3ZlcmZsb3ciOiAieWVzIiwNCiAgICAgICAgICAgICJzZHJfcmVwb3NpdG9y
eV91cGRhdGVfc3VwcG9ydCI6ICJ1bnNwZWNpZmllZCIsDQogICAgICAgICAgICAiZGVsZXRlX3Nk
cl9zdXBwb3J0ZWQiOiAibm8iLA0KICAgICAgICAgICAgInBhcnRpYWxfYWRkX3Nkcl9zdXBwb3J0
ZWQiOiAibm8iLA0KICAgICAgICAgICAgInJlc2VydmVfc2RyX3JlcG9zaXRvcnlfc3VwcG9ydGVk
IjogInllcyIsDQogICAgICAgICAgICAic2RyX3JlcG9zaXRvcnlfYWxsb2NfaW5mb19zdXBwb3J0
ZWQiOiAieWVzIg0KICAgICAgICB9LA0KCQkiJHtpcG1pX3N0YW5kYXJkX2NtZH0iOnsNCg0KCQku
Li4NCgkJfQ0KICAgIH0NCicnJw0KDQpEb2VzIHRoaXMgc2VlbSBmZWFzaWJsZSB0byB5b3U/DQoN
ClRoYW5rcw0KQmVzdCBSZWdhcmRzLA0KVG9ueQ0KDQo=
