Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D837693BE8
	for <lists+openbmc@lfdr.de>; Mon, 13 Feb 2023 02:51:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFS3t6gMzz3c6P
	for <lists+openbmc@lfdr.de>; Mon, 13 Feb 2023 12:51:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=SrswwsZQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:704b::719; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=SrswwsZQ;
	dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20719.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::719])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFS393tJNz3bVK;
	Mon, 13 Feb 2023 12:50:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EFXx4689GtPCIyzikF1xWs22+ur6hVjhoQPE2acFY7oT8FACs54mZKuX32aPLSdWYXANpJFMeQpVq3fV1DOmc5FeoiyAOFoP07zbk7fJEi+8wjmve21cndnE5T+vxpZA70XTc81RlnWxTtwMfqzmJtiVd2Rey2WLSCnXteYKTGAJNTU8vyyZdoOjedYJf2y88/0c9ijLbRITHp9di53FD9riG9WGdbfPVdjgYt2gqMXTeTodiP82mlb37ACyBps9hCcJInqu4EI903LC0F/MOS9Z6tAKmHO8JUsbURkFYX090CKZ6liIX5hE5c7w2YZFny9zDvptm31uOVfRql4pZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kf9TidOXrwLkxagS8jEALLRpTfZ1t9JmUcceDSpiOo0=;
 b=Rit1klMa1LtD8FVPtm9nJewB9CjV3l0BLfEIf73+xqwH8GpjIUOnu87LkARAfrhk9D0vp9cxmylFAfOQe80ztNBPjocotkFcbS26CD+KgWUJ6isMnupr+Nt8njBypKR55EhtMWeNgGS6880uNwYe/TaRShT4Bi0yMpqaFri9KSWebbj+EE9Nw2k667ow/uYSTthYdu2etBBwe7qhqoLKqdl09hK7J7KVDFoVKRzJrFQMtstglfB7L4YQgVeE70N0PqMGtazottdG136qpn0Dx1x8yAQArYJBymjOkdUwWTS4xin+aopHiC2ueaUDZ2THGSCTCSQCH09s7hLwyPNJmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kf9TidOXrwLkxagS8jEALLRpTfZ1t9JmUcceDSpiOo0=;
 b=SrswwsZQ6EI4D0M0WaZPtTWEQR3yFjgRszK8Kh8L8+IDW7W4XX0mZ0buTefqC9Fcbcj5oBeQQWId9Dnq9wh4zMNVb5XnILCy9TKxD0RaoOLKTfsZBrNE3FDKm57rS0q9Po4FHt9gBop26MC6DbKpo63VvX5w8ypucRzMnMRy/qOpBPDltQn9At59eL06OV2mHzolJsKB2E7nyHrpCuivek1r3WxvQ7PYj9/cqSgaRBl8ceHnAFwobos2xwwml+kWFQ8K3icvTWuazROmwRJKfsmn8wYkywA4GThmtd8kileTGg+kIX3vfJUVbBcqdzXkuB5+JTM+AssJh59nSM3VZg==
Received: from KL1PR0601MB3781.apcprd06.prod.outlook.com
 (2603:1096:820:11::14) by TYZPR06MB3966.apcprd06.prod.outlook.com
 (2603:1096:400:22::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.9; Mon, 13 Feb
 2023 01:50:08 +0000
Received: from KL1PR0601MB3781.apcprd06.prod.outlook.com
 ([fe80::2cd0:fdbf:62e0:8eaa]) by KL1PR0601MB3781.apcprd06.prod.outlook.com
 ([fe80::2cd0:fdbf:62e0:8eaa%4]) with mapi id 15.20.6111.010; Mon, 13 Feb 2023
 01:50:07 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
	"jirislaby@kernel.org" <jirislaby@kernel.org>, "linux-serial@vger.kernel.org"
	<linux-serial@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>
Subject: RE: [PATCH 2/4] soc: aspeed: Add UART DMA support
Thread-Topic: [PATCH 2/4] soc: aspeed: Add UART DMA support
Thread-Index: AQHZPSFy9nwScVAibE2otHpf/g9KRK7H5aCAgAQ6ERA=
Date: Mon, 13 Feb 2023 01:50:07 +0000
Message-ID:  <KL1PR0601MB37818F70A166356FED0FEC9C91DD9@KL1PR0601MB3781.apcprd06.prod.outlook.com>
References: <20230210072643.2772-1-chiawei_wang@aspeedtech.com>
 <20230210072643.2772-3-chiawei_wang@aspeedtech.com>
 <c1e096fa-5941-cdd8-2cdc-ecf04661a389@linaro.org>
In-Reply-To: <c1e096fa-5941-cdd8-2cdc-ecf04661a389@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0601MB3781:EE_|TYZPR06MB3966:EE_
x-ms-office365-filtering-correlation-id: dbdbebd4-38cc-4232-78e6-08db0d64a29a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  f0buEf2pv40e8giZ7hdGp/EnA7nPol2e/d9ibrzrGc6h2hbFGh147NMm2VIUxLI9WkIdn+VJ9wdwpEyVADEOIHztGHJGvy8IFSnDhT44m4O1ZifCHmrplSWGvzdOliMlA7hvjmGFMxBOxYc9XlC9FnslmIIbj3GUlgjG1Psxo8SPTk5SWMoRMx2XzUTm8CP+84DaKE4w6hShgTfjHx2kgJxkhS6GMhG88xym46elWxIsskNU2XvQjZTjl3UVROYd/Lior9+NRcqRVqKEdx+V1svznUaElOG3rGtGg8q1o4xsWh9yZm8wIHnx6JLRHNXnUvfUb5SU0rLOcrges95vYYB2noZDW83ti4L4QWA/eg5bH+/OK5sH56cTMm7enZiOZ5YitEqLdq3XZfSseuHgk1Orey3TW3LLSbGBKHKTH1sypP9Q0kg/6cAFoYWb2NI7TcSgNkZKTsXGayhGendboQeqj8WZQQU58WzqZJNM3dQ1hrFs0uhAeYfuZrYFp7myJdTkHffPMUhJpb3o7fh/BPXqE0shQrBvbw7QlnvciyNr1BEMebgxiLOaquLw0UoIU5YvBCAXsAeIMa06V3hB2IkT2zF07f68/dyp3uIFkX89wXN86zk3n44aYTOBtQtI0/cuWBQEXYDW/5eTAY6kwGo4vEiX2rJ7eFv/aocuQ35v/3mWqSErjHI8EWS5O0Revs9mNnlN6QRhoxFe119fpS7d2Y5/yqwJgJCB1wbyWdQ=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB3781.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(346002)(366004)(396003)(376002)(39830400003)(451199018)(53546011)(478600001)(71200400001)(7696005)(86362001)(26005)(6506007)(9686003)(186003)(38100700002)(83380400001)(33656002)(55016003)(122000001)(316002)(38070700005)(110136005)(64756008)(66446008)(5660300002)(7416002)(41300700001)(4744005)(52536014)(66556008)(8936002)(8676002)(76116006)(66946007)(66476007)(2906002)(921005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cXhzSmZIcFZmc0hNam1mTGlMV0tDZ0VJblcvclpGZTMxUzhRdk9sbVc0L0lV?=
 =?utf-8?B?OWs4VlRsMExwOG1rVWhmdmx1RmZyNVp1SGxlbXprbkZxYThKNm44SmEvWEVV?=
 =?utf-8?B?TUlIdURUNEVPNDBxUjFYTUhqT0NIdkdHOWNJTFY1K2NsZ0wySk1WT25KcGFv?=
 =?utf-8?B?NWM3K00wUXB1RDVDTHdhTHZUQmNRekpyMEwzZFFDd0lLQjhMc0hHNDJoSE1n?=
 =?utf-8?B?V0N0RkpIQzdVMnpqRGl1Z2hNNTBpWDhYdlA2NDRYenVSOUNpNTd0cTZPL0VC?=
 =?utf-8?B?ZCtwbHJ6WTEyUFUzVHJ4TU92UTJPbVVPTHVBSE95TVd5K2htOG9pRjdSdWFq?=
 =?utf-8?B?djl0VnRRRTFBbW5OcHIrZ2RNUzBueVB4TUhFdTAvU0w3QVJYT2tqUlIyWVBo?=
 =?utf-8?B?cUViUGsxSytKS1F4LzlWcnRsVksycDM2V0lWbUs5ZGlLcE9QK21RYU11NjlF?=
 =?utf-8?B?Sk5ZeXVnMWRodkd1Y2dlT3FGN2xScG1XNTFCa3N1MllUeDNqbnJMTzNSMmF3?=
 =?utf-8?B?M202MUR3dFVTUFJZc1FqS05IT0tNWVlwUmZyUXNOTHVacmViU1JmRGxkcVNv?=
 =?utf-8?B?QXp5bHhYUUNDRkxmNU0xVCtpOFNSUVZaQXd5YlkwM0ZSbFRHbGlJRllTYnZF?=
 =?utf-8?B?SjdWQnQrU2F3YnhSWUZ0dVlMRWR4WGtpRDhlQXdGTmdheEwxVUwxMjM0TUIx?=
 =?utf-8?B?Q3NYRDZiZmJ5dW1TOTdPaUtxQ2ZkNGpqWE5QSnFyMTFSUXJxTDN2NWlYYXh5?=
 =?utf-8?B?aFYyYkFsYlBEYWVVcW1qME1RVWU2WWk1NnFJcko1bmw2R1BHYXhNeEJVWEVO?=
 =?utf-8?B?a09RaGNyeFBTak5oVGN3WTYyZkROTittYWt3NmVwZ05UWExEVVo4N1hDc2lG?=
 =?utf-8?B?aHQ4TkhFOTU0TTN4dVE0SVY4RDVOeEs1S3JXcnhzb0taMUtOR0Vyb0N3dWxw?=
 =?utf-8?B?ZEhsSmpYdmVyRTVIY1VSMTRQUDkzY2E2NmExTFRCeEtjV09yaUdGREN5bXo0?=
 =?utf-8?B?QnNwbDFsc2ZjQjhjaWRBeWVyb1UyNVp3TFJBR0RNbVgwcVAySTI1ZW94dng4?=
 =?utf-8?B?RDMxN2VaY1Q0NHRqdjNlWUgzUXJsTlhjcG1GejRYeWpjMmhNZmNGU3g4dCtp?=
 =?utf-8?B?VFFMZEZzOXFOYzFZcVNLaHgvTkZkcGVTOFRLT1diRXczS1Jja0d2Nko2bWZD?=
 =?utf-8?B?cjAxblg3M0luZzhiMVhuTEZFMDRyaGFycDhiSU8ycjVSWm8xeldab3A5SXZW?=
 =?utf-8?B?QnZqVzNudVJDNFdjYzlVVndXNitsZ2dodDdCS0ZHTzNzQ2tqWndOeW5XTlJo?=
 =?utf-8?B?cVR2YVFFTEpWbG94RFBrczlQcXUrUVY5K29FRXRwS2xuR3ZWYVE4TkdYN2hC?=
 =?utf-8?B?b241V250cTJuTC9rZndZS1ZNSEtzWmpaY2QrWG5Ib2ljemh0RGJJaUtGNmwz?=
 =?utf-8?B?ZW5ZM3c2OWhIamg5ZGhtaGN6cFNsWm1TYnVHczM4cEsyVkhGYnFzS3VnRk9s?=
 =?utf-8?B?WXRCM1JwQlBtNEdIWkNUaElLbnh4SGh5MEtTRk91NVYxUkZENlQ0c2ZsYVF6?=
 =?utf-8?B?YUhKS296aFptN3JqWmJVd3RLM2ZlV0ltZGlMTUwxdm85ait2WXEybjY2Sm56?=
 =?utf-8?B?WVlsUW1SMURYTUU1MnV3eGVQcXYxWVJSazNTM1kySmVlUGtkdXVuNTJ4YjJm?=
 =?utf-8?B?YXlKUGhZQStNQUpVbHB1NlJHdXdwVjVUaXlrMW8waFRlaVMxMm9Jb1JtY05o?=
 =?utf-8?B?Z3hseCtmZW9nVHV4bU5wNkdxano5SlY2UkM3TUhLaUhWeU5XUUZDdWtMcmZJ?=
 =?utf-8?B?aE5ocGlPbXV1VjdCRlBIY3o3aGM4bS8xOWRhelFWeTRBS0N4Y0RXUW4wRS9Y?=
 =?utf-8?B?ZVJSby9qbVlDS3kwV3oweG84cEY1UktwRVRCdEFBbjBYeDFNUW5vUFNCTnBQ?=
 =?utf-8?B?bk05QzltdmxYTEJjZUpwUkRPVUMvWkVvZjlyemRwNURudjlVYVVxb1pwZDZt?=
 =?utf-8?B?OFpmb0xOU2VHalJ2Y0gvYXoxNHNxRWdmdzNlVkxLNFFEYzJQTXhJTUwyTVRZ?=
 =?utf-8?B?SFpoN3pFMmFjczdVR2lwSVVVTFZlSlFpOTFUWWhRZDVYQlo3ZktaYmFURWFL?=
 =?utf-8?B?a3g4YUxmRytxcTVRYkZZNko5NWtTY3V4WDZvdXk1S2tqSGxpN2U2cUYzY0Y4?=
 =?utf-8?B?TkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB3781.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbdbebd4-38cc-4232-78e6-08db0d64a29a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2023 01:50:07.8667
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z5WhKJCJksLzVqMBQZ/z06m1E/XOLHxbhfxuz5ote2ihsJ9Vyglgw6JpGFotjf++s7lalRm0FohpYSrYoe0CWiFtcs6LCXXcaJGD/yRZiBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB3966
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

PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5v
cmc+DQo+IFNlbnQ6IEZyaWRheSwgRmVicnVhcnkgMTAsIDIwMjMgNToxNCBQTQ0KPiANCj4gT24g
MTAvMDIvMjAyMyAwODoyNiwgQ2hpYS1XZWkgV2FuZyB3cm90ZToNCj4gPiBUaGlzIGRyaXZlciBw
cm92aWRlcyBETUEgc3VwcG9ydCBmb3IgQVNUMjZ4eCBVQVJUIGFuZCBWVUFSVCBkZXZpY2VzLg0K
PiA+IEl0IGlzIHVzZWZ1bCB0byBvZmZsb2FkIENQVSBvdmVyaGVhZCB3aGlsZSB1c2luZyBVQVJU
L1ZVQVJUIGZvciBiaW5hcnkNCj4gPiBmaWxlIHRyYW5zZmVyLg0KPiA+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogQ2hpYS1XZWkgV2FuZyA8Y2hpYXdlaV93YW5nQGFzcGVlZHRlY2guY29tPg0KPiA+IC0t
LQ0KPiA+ICBkcml2ZXJzL3NvYy9hc3BlZWQvS2NvbmZpZyAgICAgICAgICAgICB8ICAgOSArDQo+
ID4gIGRyaXZlcnMvc29jL2FzcGVlZC9NYWtlZmlsZSAgICAgICAgICAgIHwgICAxICsNCj4gPiAg
ZHJpdmVycy9zb2MvYXNwZWVkL2FzcGVlZC11ZG1hLmMgICAgICAgfCA0NDcNCj4gKysrKysrKysr
KysrKysrKysrKysrKysrKw0KPiA+ICBpbmNsdWRlL2xpbnV4L3NvYy9hc3BlZWQvYXNwZWVkLXVk
bWEuaCB8ICAzNCArKw0KPiANCj4gTkFLLg0KPiANCj4gRE1BIGRyaXZlcnMgZG8gbm90IGdvIHRv
IHNvYywgYnV0IHRvIGRtYSBzdWJzeXN0ZW0uDQoNClRoZSBVRE1BIGlzIGRlZGljYXRlZCBvbmx5
IHRvIFVBUlQgdXNlIGFuZCBpcyBub3QgZnVsbHkgZml0IHRvIHRoZSBETUFFbmdpbmUgc3Vic3lz
dGVtLg0KRm9yIGV4YW1wbGUsIHRoZSBzdXNwZW5kL3Jlc3VtZSBvcGVyYXRpb25zIG9mIGNvbW1v
biBETUEgZW5naW5lIGFyZSBub3Qgc3VwcG9ydGVkLg0KQWZ0ZXIgb2JzZXJ2aW5nIGNlcnRhaW4g
ZXhpc3RpbmcgRE1BIGltcGxlbWVudGF0aW9uIGluIG90aGVyIHNvYyBmb2xkZXJzLCB3ZSBwdXQg
VURNQSBpbiB0aGUgc29jL2FzcGVlZCBhcyB3ZWxsLg0KSWYgaXQgaXMgbm90IGFwcHJvcHJpYXRl
LCBzaG91bGQgd2UgaW50ZWdyYXRlIFVETUEgaW50byB0aGUgVUFSVCBkcml2ZXIgb3IgdHJ5IHRv
IG1ha2UgVURNQSBETUFFbmdpbmUgYmFzZWQ/DQoNClJlZ2FyZHMsDQpDaGlhd2VpDQo=
