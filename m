Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6178840BDBE
	for <lists+openbmc@lfdr.de>; Wed, 15 Sep 2021 04:22:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H8PBn1cHYz2yHC
	for <lists+openbmc@lfdr.de>; Wed, 15 Sep 2021 12:22:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=Cj78vo9W;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.133;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=Cj78vo9W; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320133.outbound.protection.outlook.com [40.107.132.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H8P9j5xP5z2yKJ;
 Wed, 15 Sep 2021 12:22:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZIfNtLjWgSwEyLuMVvxW/EoCx3iaqCF8ZjvHoE8lmYAaiVgT498Aq4QWLIF4fGPqtGFH0YdvlGcVQC9j3QMT9TqGxTbPIP6j0FRUqdeUia8dzA7MckpkgBa5bpr7oact6ngT/K8Kespj7m4PkAjDHLux+x2Xk56UdHrI7jr2DWQ4jhaVmdJleQHXxeqPDvj5yydNy37d8y04s7KJOtgk4++lzhDWcUb/Ll5iodIMGnbnDMG8IKSM4Xn3jmgnSWAvndPMIFqQPZAmPhnSBBsV3wjItO700D2DFC/5SDUisQ7PkJcCTrLBVO8AFIAkQpFoHuSRSi7psE/x6UyEaG0pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=tl2lsQej1KXZDiglcLgVb/YViH36t15dXod7Hqr3n4I=;
 b=Mfxu8/nmb4uBmvXRY7G/i4Gr7/f+np8ohONPD5f3Apz5uulQdQVa/QEC0I7e9hCjp9WHvzWHbss0CqyONQh1kQx4h39Ry1DYL9D/b9uceBtpnHSIIFG51SCXk/v3xk+nOWARjA5ey9nmB7zKy3d0ubGs+B1TlBT1BjU6lGdbdKi2jeWbE6CXWHl/RsJS7FDHs9Z9Nwb2KezubJqw1NsZy45iSMCrwwBY1Cxe2ZuUMgWurYU10OGIbSPzXODcEa9qgifoZ1kFKFBMclDh8ViRee/nBYhLyioOsJf2kGadgOXC0g4NKBq52EtTva/6GLxO0xTZ33dnbZFlITmtOo1Y6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tl2lsQej1KXZDiglcLgVb/YViH36t15dXod7Hqr3n4I=;
 b=Cj78vo9WGl8ICiXtjD5c8wStQC6D0KvAGqaORXhrQSuIOfWiDsUyoz4ELsn1el+JZz89hhD4JKKHHnjlUaWASdcJgulciylNiFUcXZIkKO5YzwJeoP2BgqSTYZL1xEVu8mnxTuEdxx9jhK8Y2e+TNelN06XhVn89nzOi0p3fsFOHfbDA9UaL6dvFpOhpIk0KOT8DDlqWNUxztfUZA9ei42K+FFuKS88IPEuIEz5JoLoTqh9N/CnDsgHZtRBH3WSeXlqBuFSJDEWdH4hQk2tiDmD1vx+l0zVg8AxsnDE4Ze6QtqMW4uVsZfFR3GXOYkicgfwRzkz/nNmm1uKVsjqCWg==
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK2PR0601MB2003.apcprd06.prod.outlook.com (2603:1096:202:d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 02:21:41 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::3517:6c51:50d:1a55]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::3517:6c51:50d:1a55%3]) with mapi id 15.20.4500.019; Wed, 15 Sep 2021
 02:21:41 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: RE: [PATCH v4 1/4] dt-bindings: mfd: aspeed-lpc: Convert to YAML
 schema
Thread-Topic: [PATCH v4 1/4] dt-bindings: mfd: aspeed-lpc: Convert to YAML
 schema
Thread-Index: AQHXqGUb1g4D5otybEGl5hNrtwUyU6ujdyKAgADnguA=
Date: Wed, 15 Sep 2021 02:21:41 +0000
Message-ID: <HK0PR06MB3779D499AEACDAF9801D383B91DB9@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210913060231.15619-1-chiawei_wang@aspeedtech.com>
 <20210913060231.15619-2-chiawei_wang@aspeedtech.com>
 <CAL_JsqLr-fpgXPLU3XHy9T5hUNbf-mBqeh1Sads=tXWx3LkkhQ@mail.gmail.com>
In-Reply-To: <CAL_JsqLr-fpgXPLU3XHy9T5hUNbf-mBqeh1Sads=tXWx3LkkhQ@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c6678f9-7ae3-4bdd-9225-08d977ef8df9
x-ms-traffictypediagnostic: HK2PR0601MB2003:
x-microsoft-antispam-prvs: <HK2PR0601MB20038D105E35FD170E2F394C91DB9@HK2PR0601MB2003.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EwjKvLfieczlAoKMdmSeo6L/s99CBgjveYTZKmiX7EEejssIl89jDqfepJ/wIZkbSBjNXm1M9MBuJD8sZTL1d8tvTZsiYblY+duDLsDa9IgrzOuxU1eK0+7e6esw1kg8NfZjn2CvaquHPCMQ8067U0i7zEAVlVKyqCKNMKTlq6owJlf8tVLbYZ5DmaDcO2SnjQ1ZSchZrL2D9RXhLlKxL2bWGZLH7GkI+qHO20d1mp63qZQhXzmZVcKgZb+GEVzA2ZjKMr5433Zipr/NHgn9V2Zv2FD56sCkVHSb+rpAmJKLFaifm/k26E9i+0zhGLFtE+V2//P+FiQTW0yU4707caWILOcveYSph/2kmIvyy/IsfHUjbUMLUbCtGjZ3o13H+hi4XpmLSfimnav4oW6VXDEtWXob6tiAlMEXMrjyHiSA4ZbRBEbwMkLsQ96BZNuMmd6fe6zCTEZMllifITUpytEttai0MV2fAN0/y4nyNjuJ6UTVgN4cVduf+5aYqmvJsbJHRP5sGUFD6sLqfEBeEceGR6JXb0ERIee/aGJsCrFV3lBz6exg8JVAMsvKYsxIAk0VeLXNngOqtIdX3bHO8e1gBwpVIC19EzoqnqhoEQYz7Q8FvkIh8WrbMcmKmfFCvI2HQ3sAkQxH2kz7w8GnEjmrws4sc0CnFEQ5q1+p6drRZCQ0G+KYaE3W48F6JRcQXaXRsSXF70zwZO0BFtS9xQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(39840400004)(136003)(346002)(366004)(83380400001)(8676002)(4326008)(9686003)(53546011)(66476007)(7696005)(54906003)(66946007)(64756008)(55016002)(66446008)(52536014)(66556008)(33656002)(86362001)(6506007)(38070700005)(5660300002)(26005)(478600001)(316002)(7416002)(2906002)(186003)(122000001)(8936002)(38100700002)(76116006)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NStWYjFOeVhwWGxBMGloTVRKTHZNZnVKckljT1I1ZjlIc3FDRUdkUjR2eFZK?=
 =?utf-8?B?T0VxV1BhM1c4YjlZcm9GZ1JSN043T0tNVDhIM3NrTXlRQkV3K1NDUUxJcS85?=
 =?utf-8?B?ZzAwdGQvRUliRTlCZ3c5S0NyYkNRYmkyZHQ0Ym5GQzFHTFE2MkNBZk9MSGd6?=
 =?utf-8?B?WHIyQnhwS1lhN1hyd3J6REJxajV0dUdlVllIT2o4elFuU2FOajIraktld0F2?=
 =?utf-8?B?YlE5OGpLc1dWSEl3Wk1NNmZ2U3RGbzlXTUdycEhDUUl5NTdKaSt2Sk1mdU85?=
 =?utf-8?B?RG5uQzAwaU1UcGtjMDd5Y0JVV2tYUTNYZm5qRnRGT1VjL1lLQWpRY1RXZWdK?=
 =?utf-8?B?NHFHejFKdFdheTlOZ2hGandhTG4zSFdlTStKeTBrVHFDMW9zaThQTGxlejN1?=
 =?utf-8?B?YkNxdmd5OUJSMjArNU82K0VQcW5MYm83WlFMcnRLUDUxWFJRbXdrNEVraTBr?=
 =?utf-8?B?YWRadHJ6RiszRjkzMDRVN1psZlRMNi9jblF2TjBNcU5hcTZxRFV2Q1ZPcDdF?=
 =?utf-8?B?MWhaNnoxZmt4dVIzcnlrVmhyb1ZDK0FWaklsM3B2VHlpU3JlenV3bmIyZkU1?=
 =?utf-8?B?VHE4UUtTUGRmbFFNVWNtckFrZHdIUCtKMGlncTlOVG13ZHNLbitNV1U5MHha?=
 =?utf-8?B?ZEFKVXRNU0pEV2R2c3hpb0ZrV0dsTm9aTnBTaW9xQTNybFBSc010YUF2amN0?=
 =?utf-8?B?STJDZkFtN1Q2NENJUGxQK2dUanY5anNKZnRGUE02bXQ2dS9GTCtyMTZtVDVZ?=
 =?utf-8?B?Uk9rSFFZOG9oZ3lHdTNoYWxGSFBaOEd6a3lNVVQ0bHFHUDJQK3BOaXIxVVZq?=
 =?utf-8?B?dHkyT3BBNjgyZ24wY0dSRWt5SlZjanJYdEpnMU9SQXZYRW9EbXFmRGtYVUZB?=
 =?utf-8?B?ZGNqc0N1bndjc1RPc3ZRTVZ5ZkdHNWhrQSt1MnY1RXJQeVhZbXFST1hOVXhX?=
 =?utf-8?B?VzVNWGQxRkIvNXBPRDhMWlF2VURzR1R6RUtKK3VDZW5YSnJnUXBEdUlCMHRB?=
 =?utf-8?B?YTV0SURLV0czQ3F3UnVDT29xRTNub0ZablhXRkJMSGxKZkhJZE8rV2c3V25m?=
 =?utf-8?B?S3pZTlV1NVlpdTFPNU5kWkZSNDJIOFpHWjBuRUJmQzZ4OVBheFg3MVgvQkZF?=
 =?utf-8?B?WGdSMGcrOTB3YjFEMWY5WHRPMHg5eUI3cHNwRDdRQTJBTmJqTjdqT2NXYlp6?=
 =?utf-8?B?S3lBS3dqVnNFRUNXb0hEYk5KRDI4aXh5UERvYTZWYWppVnRuRitZK01nZWw5?=
 =?utf-8?B?VnAzMzlTekJsemJUaEkyeVhBYnhOMXoxNmlKa1dzV3BjakpOQ25xa1RuaTcx?=
 =?utf-8?B?ZTJjcTZOM1lFY2daejJlRSs0eFljOGwrelY5NXcxTUU3Szc3bGtKNjArSExa?=
 =?utf-8?B?aFd4bm03NmFSeWh6OGpCbGdTSlB4QUI5VmVTaytsNXBuVjZLUzFYS0NYYXpo?=
 =?utf-8?B?Y3BnMTJaUlNqSGlVMDJRUmY0ZXBrNDhIVUQrL2dBQnNoWi9zdDlGV0h0SmFj?=
 =?utf-8?B?Q3g2T3NvbG1YRlhSSDRMcUlZQ3B0enB1WlNCMm9KODRPZTlxb2ZJVnpvdFk3?=
 =?utf-8?B?TG1pOFJmbTdhM21HVFJDVFZXQVh4UllURVBDNkFIN1Y3T2M0SjZ3MlJQSlBG?=
 =?utf-8?B?c2JVeTVFNUtRandqVHkzV29XV2ttZ0dBQ2N3aUxzVkdYRWhpeEpucWlDTENq?=
 =?utf-8?B?ZTZUOGZTMFdxN20weWhINEpaNDVCNkthUnNyeTNYSzVpQUFYV1ZCQkliMVhq?=
 =?utf-8?Q?Zos2+iCuSOQTZTrSJv9XUG/5VIrO5DcnvE14aQM?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c6678f9-7ae3-4bdd-9225-08d977ef8df9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2021 02:21:41.1378 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aUMhwFjSSbkzl28nt11lTKahDbjFjD23hZ//eQ89l3mWETmsOnAXIhOzbcdeYt7+S0FNrXC2gCEpw5Ds9z7mpkscgD1I8vHh5a3dzit6aEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0601MB2003
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "yulei.sh@bytedance.com" <yulei.sh@bytedance.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Oskar Senft <osk@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiBGcm9tOiBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPg0KPiBTZW50OiBUdWVzZGF5
LCBTZXB0ZW1iZXIgMTQsIDIwMjEgODoyOCBQTQ0KPiANCj4gT24gTW9uLCBTZXAgMTMsIDIwMjEg
YXQgMTowMiBBTSBDaGlhLVdlaSBXYW5nDQo+IDxjaGlhd2VpX3dhbmdAYXNwZWVkdGVjaC5jb20+
IHdyb3RlOg0KPiA+DQo+ID4gQ29udmVydCB0aGUgYmluZGluZ3Mgb2YgQXNwZWVkIExQQyBmcm9t
IHRleHQgZmlsZSBpbnRvIFlBTUwgc2NoZW1hLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQ2hp
YS1XZWkgV2FuZyA8Y2hpYXdlaV93YW5nQGFzcGVlZHRlY2guY29tPg0KPiA+IC0tLQ0KPiA+ICAu
Li4vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvYXNwZWVkLWxwYy50eHQgICAgfCAxNTcgLS0tLS0t
LS0tLS0tLS0tDQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9hc3BlZWQtbHBjLnlh
bWwgICB8IDE4Nw0KPiArKysrKysrKysrKysrKysrKysNCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAx
ODcgaW5zZXJ0aW9ucygrKSwgMTU3IGRlbGV0aW9ucygtKSAgZGVsZXRlIG1vZGUNCj4gPiAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9hc3BlZWQtbHBjLnR4dA0K
PiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWZkL2FzcGVlZC1scGMueWFtbA0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvYXNwZWVkLWxwYy50eHQNCj4gPiBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvYXNwZWVkLWxwYy50eHQNCj4gPiBkZWxl
dGVkIGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCA5MzZhYTEwOGVhYjQuLjAwMDAwMDAwMDAw
MA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvYXNwZWVk
LWxwYy50eHQNCj4gPiArKysgL2Rldi9udWxsDQo+ID4gQEAgLTEsMTU3ICswLDAgQEANCj4gPg0K
PiA+ICtwYXR0ZXJuUHJvcGVydGllczoNCj4gPiArICAiXmxwYy1jdHJsQFswLTlhLWZdKyQiOg0K
PiA+ICsgICAgdHlwZTogb2JqZWN0DQo+ID4gKw0KPiA+ICsgICAgZGVzY3JpcHRpb246DQo+ID4g
KyAgICAgIFRoZSBMUEMgSG9zdCBJbnRlcmZhY2UgQ29udHJvbGxlciBtYW5hZ2VzIGZ1bmN0aW9u
cyBleHBvc2VkIHRvIHRoZQ0KPiBob3N0IHN1Y2ggYXMNCj4gPiArICAgICAgTFBDIGZpcm13YXJl
IGh1YiBjeWNsZXMsIGNvbmZpZ3VyYXRpb24gb2YgdGhlIExQQy10by1BSEIgbWFwcGluZywNCj4g
VUFSVCBtYW5hZ2VtZW50DQo+ID4gKyAgICAgIGFuZCBidXMgc25vb3AgY29uZmlndXJhdGlvbi4N
Cj4gPiArDQo+ID4gKyAgICBwcm9wZXJ0aWVzOg0KPiA+ICsgICAgICBjb21wdGFiaWxlOg0KPiAN
Cj4gdHlwbyBoZXJlLiBUaGlzIGlzIHRoZSBzb3VyY2Ugb2YgeW91ciB3YXJuaW5ncy4NCg0KVGhh
bmtzISBTb3JyeSBmb3IgbWFraW5nIHRoaXMgdHlwby4NCldpbGwga2VlcCBpbiBtaW5kIHRvIGNo
ZWNrIHRoZSBzcGVsbGluZyBpbiB0aGUgZnV0dXJlLg0KDQpBIHY1IHBhdGNoIHdpbGwgYmUgc2Vu
dCB0byBmaXggdGhlc2Ugd2FybmluZy4NCg0KUmVnYXJkcywNCkNoaWF3ZWkNCg==
