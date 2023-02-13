Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB07693D60
	for <lists+openbmc@lfdr.de>; Mon, 13 Feb 2023 05:19:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFWMT2jxVz2xZV
	for <lists+openbmc@lfdr.de>; Mon, 13 Feb 2023 15:19:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=TdPSrP48;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:704b::71a; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2071a.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::71a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFWLb6PSTz3bhP;
	Mon, 13 Feb 2023 15:18:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fEsAW0IE10zgSSyn/mTn7XXko2FsqN8LdkNtCiPJkim0bGmDKvU7SHlcMWqm0CfvopBci6jqtYNarF3Piu4V9ZO0Xnq3eQLk2ggujvtwAFZqxj/w0EFAlQ3c2x0aXhhfYxHDO22YPgmTSTqZG+45A6iivn+j4nOxBAMCqvIAnkmOdIn6SlRoY6FqEbH3HfvMoUKhysAyo6Fo5sz77oWZ2gqvNS28AeA+CVpw/R9OZtvYOOgsZCTbtLZHbDCFaP1ShFIx4VDCGYIttdD0S4lBFyUJQmuVAE3Ca39Hrj4ar+HhKSbBXhUsp3XUxH6+sL2OU1mcPHzeWZ6u9pm7IkBgZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTF1iGJu2WouPVL9FLuBlkzln2U5RtwyIBw9r1Upmhk=;
 b=mx5U2Lfiks1BSkP0UhwPWn29KzIv85G0bz5aB2sD+1juScN713CWXlR0trZVuii7fTmFxluDDaGPGIfPFOEBozg8A8YJQx0k3y+KdOJPXxbHJHIMuVSBlQOrMH6r3lJdV0hSorIrAY/UCYk32/UCx1ofhXtR0pdOWSW8xF2MIZxg/PIo+EBSzNeMzj+jYN5/xD5EwEU8qs71wf12IzCimeoetDUkViSqem+PWAovk4l3Rk6k33HAAOsUDjOoXtORBweGVKPywrphXOjn+WxBA/p90xWA847csLwXPMXFNMSz7huo2l2SgV1mpN0UZE94ZM1O4Vx3YF0CUw4A5z2FsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTF1iGJu2WouPVL9FLuBlkzln2U5RtwyIBw9r1Upmhk=;
 b=TdPSrP48533SF9MseTgxElwBnY49YbtbXHmLOUa8dk7MjARUmBZrQmWN4rGhYAbIag+bKLCb8CFOJNlUyn767oRiDr9AWWsRUAZ/C7in3bM43Y00rzETLlIhMK1Mmgk2ltOY/EH+5TtG4UBOSQ0sd+UPa3FvCXmrCC15sHik0A5VLVRMazLyKw2NR9AcbEcghcsPBq+wAwNrYK6kc+EuNsx8vDg59zX5DuFTN0wpiGQDHl8cmyRnpxf1oVUK9UsaVLnfre5wC3Dl/8hP307SHxNUAJokyQMjSKC/mIwx1IDK7zKItYzgvslvw5+Y09ZuqU6o1B6XvnDTDUJZYzGf6g==
Received: from KL1PR0601MB3781.apcprd06.prod.outlook.com
 (2603:1096:820:11::14) by TY0PR06MB5563.apcprd06.prod.outlook.com
 (2603:1096:400:328::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.6; Mon, 13 Feb
 2023 04:18:17 +0000
Received: from KL1PR0601MB3781.apcprd06.prod.outlook.com
 ([fe80::2cd0:fdbf:62e0:8eaa]) by KL1PR0601MB3781.apcprd06.prod.outlook.com
 ([fe80::2cd0:fdbf:62e0:8eaa%4]) with mapi id 15.20.6111.010; Mon, 13 Feb 2023
 04:18:16 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: RE: [PATCH 3/4] serial: 8250: Add Aspeed UART driver
Thread-Topic: [PATCH 3/4] serial: 8250: Add Aspeed UART driver
Thread-Index: AQHZPSGHc2FuUfvkK0yq1ehxne+sqq7H/IaAgARD7DA=
Date: Mon, 13 Feb 2023 04:18:16 +0000
Message-ID:  <KL1PR0601MB3781ABE9B28372C88E62946491DD9@KL1PR0601MB3781.apcprd06.prod.outlook.com>
References: <20230210072643.2772-1-chiawei_wang@aspeedtech.com>
 <20230210072643.2772-4-chiawei_wang@aspeedtech.com>
 <34e3729f-9266-3606-9f11-33222f50e753@molgen.mpg.de>
In-Reply-To: <34e3729f-9266-3606-9f11-33222f50e753@molgen.mpg.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0601MB3781:EE_|TY0PR06MB5563:EE_
x-ms-office365-filtering-correlation-id: 9c7f0aa1-0f18-4597-dc6e-08db0d7954db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  5hZDOetv4ceWl7DAvNoRaW9EAhz37v+u9xWXdMMjxVtNaXel4Iau6i/G1GIgHUEUc7GdUKQBg4/k8XNB/Wb8R0uLK0AOmnjslpEYvkxjzPdNXMnVRP3tPVydsRUOOwr8lbdaP2igeRT2j6ZLT/kcIZLf1/jA09cq99vJjfZzfpiAQuN7OqzJQA1ls3IjwlHBOVt8QM+eC52q+kDqaL8Xs81MRWzdL6pnUJbG5IesAcNEiPhyZObxw0ehTAUrIEoOGLcNIDzUD4PHst0/CJUYWmGzuIvmvbGq9OaS0XI9d8SMq5FsREVT/oLMbxaMDEC/CnwcnZDxfrsffhoGHUtNdyQ9qainoKm5wWnsASuriCzK84ZlptYyrY6JU+O/Ak6HAUsJ7ZC+RguAY+kTY2Zff0FPz4yjYi6qtPwgFx8vxcpKE3GtFyD+OPom75hoDZuaXZKgqK2wjlJo0arErHNKtz0S5W97fp17Fhyw2YNUM9wC4qqK4e+1tjQns6Utb5DYWFrCxJZ276Pa2MrNXSU2c/90y1skZ3nB36uyvWFEgdzvF/rofoU78Yg6UmZRqsstYDx6HFavqAE/V4AjGTNI0wqJYfE/x8e/uhu7M7Sx2aVsUHJE2g3Mbn2WLNOdnW5szhTaLSiJ8hcKJRVia6limqvD7/macAbC0X8KVkEuWh/YwNbxsRyoM0j1qIf79nXk+G3kf0OwqNs4Gw/Tp3zCGQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB3781.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(376002)(39840400004)(396003)(346002)(366004)(451199018)(33656002)(38070700005)(122000001)(38100700002)(316002)(86362001)(26005)(186003)(6506007)(71200400001)(9686003)(7696005)(478600001)(83380400001)(8936002)(7416002)(2906002)(41300700001)(5660300002)(66476007)(52536014)(54906003)(64756008)(4326008)(6916009)(66446008)(8676002)(66946007)(55016003)(76116006)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RnRoc1h0OTVKVHRoVkY4eHBJWlZSb2tFZ05GZXc4NlFzUEN6d2RBWnlTSlE3?=
 =?utf-8?B?VmtxakN4WG1vQVBua08xM0ZkNkcyM1h6UE0vTzBJYmVrcFZ6SGFLZFBuQzlt?=
 =?utf-8?B?eFdpMnk3YnRVNVQzQU9NejJYRjFVWXB4U1lrTEhvQW9sV3UvdUtYN0Z0L05B?=
 =?utf-8?B?VnNpcHppS0dXR3gzYjJuak5vYm1IV0tuallUbUhDREx4N3BqYkZvV0NMSlNm?=
 =?utf-8?B?M2o4aXFYNTlRdkZNUjVFNkVxcjQyaUdyUm1CclRjUzVnR1dsNjYrOG1WSkpX?=
 =?utf-8?B?U2lXNGRTMlJLcVBQeHhLR3Y4M1ZwOHNOZXE1MGhybTVXQ1orSnAvRXVvMDRN?=
 =?utf-8?B?T3NsdVdEV3F6QmZXVld4NTM0L0VONXlIY1plNytVdnA2dFp3ZVdIVGxEM1o0?=
 =?utf-8?B?NGZUbWg1N1kzZFh4d3h5aGFqSitaZzM5K21aYmdOOEplZXhYVDh2bUdIN0NJ?=
 =?utf-8?B?UlU2YXpvbDAxOERCYnRCbjVENjdIY1RjWFVmZXoydzM3ZmkyOEJCK2d3RDQ5?=
 =?utf-8?B?US9OZ3prR3FXSXFJQ3dyWUZSUGVLaTVjR2wvY2xrTlhpMFNqS3RuZGZpVTlx?=
 =?utf-8?B?NHkvV0p3RDVrZ25Pcy9rL3pvNEZ2YVl2Q3VORTNMaGZYMEZqbWpDYjZoVC9y?=
 =?utf-8?B?U0dDS0pKOVJjSWt6dkpZV2I4T0dQeGVsajdLemVodSt4SlVicmpNcmRaVFg5?=
 =?utf-8?B?bmtoSzMyVjQ0M3M3K1ZYUmdCTnNBM29rVDNCYldJQ21NU3AvUzA3aUpWRjdR?=
 =?utf-8?B?b09FNDdzZ1g1QS9GcUlUQmdabWJOMjVmZHZjeUhxUndFV1VKU2JZaHRvN0NE?=
 =?utf-8?B?b3ZZUE9lNm5IRjRKRmNDcW03MVlFNnFMK0R3Sko3SnZSaGRCb3RxUmJDUG11?=
 =?utf-8?B?cEF0MU5WWk1WcDRrcUJyWU5vOUdoOGZxZFhNS1haVzlCdzF3OUd1VjlLbi9Q?=
 =?utf-8?B?OXdnNU1SWU9MMnhqSlJmajlHK05lZmJTcFBVdGZGSUtsZndNRWRHVW5kU3hZ?=
 =?utf-8?B?VS83R0VDN3NsZ0pBNFl5MDNJTkxiai9wYW9oamZLeGh5aWRiL1A1YW1XOGkx?=
 =?utf-8?B?QzlsNVlsRncxWmJiNHRIdktWQjJiTy9sWitJaG8weG9Ed0Q1a0t3Rnk4VTIx?=
 =?utf-8?B?di94VVd3M3QvSTVNUkwzemlBV0VtTURHYjBNOUlNUXV0WUhpMnhrRXJMdklT?=
 =?utf-8?B?bnN5cUVXaTJkU0NPRGdMMG9nV2pOdnpxcmNJcnJlNjkybjI3OVFib0tKYksw?=
 =?utf-8?B?N01ncWpCa0tESDVZMStNT0xEblZaTW9QYVRHM2VURDlmQkphVkQ5YjBwTVZN?=
 =?utf-8?B?SXBVc1ZTNk8ycWRwNHByNnZ6eGE1aEh4ZDl0TE1mSm94ZHFqNWIyV2tTUXdv?=
 =?utf-8?B?REJRY1NaSXhDb3NWRlhnc0owSkkwcWg1Z0dVaks0SXNzMSttdXVnMysrQ0VI?=
 =?utf-8?B?WTUzYjViSS9QNUFoSGZPeXlOcmxaMFhQR1dkQ0FMWi92RERzOU9MQU56eWZI?=
 =?utf-8?B?MHVSRk5VOUhLR2lnOFVEalF0aElEQk1NMWowTll0TU9uM3NpdVJkdlRwZEpP?=
 =?utf-8?B?ZjF0T3JGcG1oMWFwUEdPcmZBZ3VaK011ZXY2Wi84SDQ4cEdBZ2w0SVAzNHps?=
 =?utf-8?B?L3IrazNucUpHQ1ltUUNBSURIbGtrVGErcEdRa203eXF2RVBWYkxmNG9DSW1k?=
 =?utf-8?B?K2ovM0gvak9YcWNVZVR2dU1NeWh6OElCenZaNnV6dTJVc241SkJsN3lBNVZD?=
 =?utf-8?B?QjdsR0paWkVEek5GRWExZlBaNUVhTlo4dTczY2RDZkFiTkcrN1F3bmlOOU5Z?=
 =?utf-8?B?UFp0RE5wQnRtZzZNTTdKR0N4ajBaU0N5UVc4ZlJnRlZWRGJrMHg0VmM4QUlq?=
 =?utf-8?B?WHZoQlJtaVpScXJPTGd0bEhPZXg5UHN2YVJKRjJSdjBjNUt3OWJ1amx5d2Qw?=
 =?utf-8?B?RXpNSlJydnZscWpXSmkxcXlDdDB4L2V4OFBaN3JVcVlSNEM4L01VSnpKcGp5?=
 =?utf-8?B?N3JBVUJwRVJXSGpKOFphUFg5KzNYbDFKaXZhWG5sT0E3RXo3cHFlZVY3QnUw?=
 =?utf-8?B?U1lNUzV3YzhGZHBsNjdKSTFLMElEazVXWk8ySjgvbmpVMzIweHQyb2JDdUZx?=
 =?utf-8?B?b2ZWOHN1SjdrMHlES2kyQmpjZW5KR0VQakhkcnJkUldVSEpJektjdlhFc25k?=
 =?utf-8?B?Qnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB3781.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c7f0aa1-0f18-4597-dc6e-08db0d7954db
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2023 04:18:16.8643
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wOzl+hRsg34oKgnucDPDz7FPTVp5fZ1FyZKbaNPhCHYBYEZoB6AZnf/u5tgxUp8T/jR4WlD+2kHYJfeTaKuC+FgOp5+wcqzyybIasSBDySQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5563
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "andrew@aj.id.au" <andrew@aj.id.au>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "jirislaby@kernel.org" <jirislaby@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiBGcm9tOiBQYXVsIE1lbnplbCA8cG1lbnplbEBtb2xnZW4ubXBnLmRlPg0KPiBTZW50OiBGcmlk
YXksIEZlYnJ1YXJ5IDEwLCAyMDIzIDY6MzUgUE0NCj4gDQo+IERlYXIgQ2hpYS1XZWksDQo+IA0K
PiANCj4gVGhhbmsgeW91IGZvciB5b3VyIHBhdGNoLg0KPiANCj4gQW0gMTAuMDIuMjMgdW0gMDg6
MjYgc2NocmllYiBDaGlhLVdlaSBXYW5nOg0KPiA+IEFkZCB0aGUgZHJpdmVyIGZvciBBc3BlZWQg
VUFSVC9WVUFSVCBkZXZpY2VzLCB3aGljaCBhcmUgMTY1NTBBDQo+ID4gY29tcGF0aWJsZS4gSXQg
aXMgYW4gd3JhcHBlciB0byBjb3ZlciB0aGUgZ2VuZXJpYyAxNjU1MEEgb3BlcmF0aW9uDQo+IA0K
PiBhIHdyYXBwZXINCj4gDQo+ID4gd2hpbGUgZXhldGVuZGluZyBETUEgZmVhdHVyZSBmb3IgdGhl
IGRldmljZXMuDQo+IA0KPiBleHRlbmRpbmcNCj4gDQo+IElzIHRoaXMgZm9yIGFsbCBBU1BFRUQg
ZGV2aWNlcyBvciBvbmx5IGN1cnJlbnQgb25lcz8NCg0KVGhlcmUgaXMgbWFqb3IgZGVzaWduIGNo
YW5nZSBvZiBVRE1BLg0KVGhlcmVmb3JlLCB0aGlzIHBhdGNoIGlzIGZvciBBU1QyNjAwIG9ubHku
DQoNCj4gDQo+IEhvdyBkaWQgeW91IHRlc3QgdGhpcz8gV2hhdCBpcyB0aGUgbWF4aW11bSB0cmFu
c2ZlciBzcGVlZD8NCg0KWWVzLg0KSSBjYW4ndCByZW1lbWJlciB0aGUgcHJlY2lzZSBkYXRhLiBU
aGUgZXhwZXJpbWVudCB3YXMgZG9uZSBsaWtlIDIgeWVhcnMgYWdvLg0KQnV0IGl0IHNob3VsZCBi
ZSBhYm92ZSAyTUIvcw0KDQo+IA0KPiBUaGVyZSBhcmUgb3RoZXIgc2VyaWFsIGRyaXZlcnMgYWxz
byBzdXBwb3J0aW5nIERNQSwgYW5kIHRob3NlIHNlZW0gdG8gdXNlDQo+IERNQWVuZ2luZT8NCj4g
DQo+ICAgICAgJCBnaXQgZ3JlcCBkbWFlbmdpbmUgZHJpdmVycy90dHkvc2VyaWFsLzgyNTAvDQo+
IA0KDQpZZXMuDQpUaGUgVURNQSBkZXNpZ24gaXMgZGVkaWNhdGVkIHRvLCBhbmQgdGlnaHRseSBj
b3VwbGVkIHdpdGggZWFjaCBVQVJUL1ZVQVJUIGRldmljZXMuDQpBbmQgVURNQSBkb2VzIG5vdCBz
dXBwb3J0IGNvbW1vbiBETUEgY29udHJvbCBzdWNoIGFzIHN1c3BlbmQvcmVzdW1lLg0KDQpXZSBm
b3VuZCBjZXJ0YWluIGRpc2N1c3Npb25zIGluIHRoZSBvbGQgbWFpbGluZyBsaXN0IHNheWluZyB0
aGF0IGlmIGEgRE1BIGNvbnRyb2xsZXIgaXMgbm90IGZ1bGx5IGZpdCBpbnRvIHRoZSBETUFFbmdp
bmUgc3Vic3lzdGVtLA0KcGxhY2luZyB0aGUgaW1wbGVtZW50YXRpb24gaW4gdGhlIHNvYyBmb2xk
ZXIgbWlnaHQgYmUgYW4gb3B0aW9uLg0KDQpSZWdhcmRzLA0KQ2hpYXdlaQ0K
