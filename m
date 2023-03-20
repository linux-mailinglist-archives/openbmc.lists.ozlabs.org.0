Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 176C46C0915
	for <lists+openbmc@lfdr.de>; Mon, 20 Mar 2023 03:57:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pfzt66Pz7z3cFx
	for <lists+openbmc@lfdr.de>; Mon, 20 Mar 2023 13:57:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=LHhEbirc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:704b::72f; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=LHhEbirc;
	dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2072f.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::72f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PfzsN6PHTz3bjj;
	Mon, 20 Mar 2023 13:56:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mx1WhSzEOEsx0MiDn4iMDqR7hMwFVC+ONU6yYScMhx2Ew2OtGX3i5Ur1V7STSdqyTPZldRKKk8ByK5IRj0OdG70xasNpjUzzcA2+v6lowr7tfOZWk1lNa723CF7WjAgLN3++PMHxXIyQqBSxt7sh1A4Ysl8BA8frJYwDDGSicKsOD9qdA7NirXCdbpmIzHfpxkFkO8pWg/orgzLSRRBPVRhtrOr4sL4lhiF+dI8uO4pYgRZ2d8/HzGjOeDcxWW0djqbip3uJ3bmGirbN8b7FnrQFJLLEkVqihjCYOagMny2fi+EOnTb0lbuueI2BwFRg4tBF5FqXN74cw403Tji1Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jtfZRX3G51yoKu4ZU2Sd04/q0MO4ItcbBdLSPatKxwU=;
 b=aThc7MoITd0nKjAXo+809hxiF5DNX9zLb3Moq4L9cSjWuTl/cqMvm/WO/EOCbwdJH+j/HySG2lV5chI4B+61UFnF3Y3J3kijXMI0e2vbzQ1m4dsqpawYJ1IEybK5WQfrQ/1EDJNHBeXRq+hJ9Dd9uHGPk2UwiAxjGP02/BajoBOfupY17SPa8eRHHpoz1LRanBtseNb0rfC18ghi2pIOWJleJUlw7zj+u+EiLN5BGeLxpTxQ1K5RyF6I0b0uV9OvvN9s3TpWiyutRCeBQ862OaATUwkwugthp9xMwjvTHG3dOiIu79I/RQrGiByaL2UH3jzTyffg/weIZguYQa5nfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtfZRX3G51yoKu4ZU2Sd04/q0MO4ItcbBdLSPatKxwU=;
 b=LHhEbircV0hjaDpG7fCNs4JTpPFf/hqmJTNb1jtmV4SjeTkZ3skS+3aMB0N74HX5bQf/TMGuP7ar2mRa7kMFgnmP9Jiq+gYiJnA2+hATNYk8In1rYePu07tXXz41CNe1b0vCybxuuGQ1ZB5gVUts/KyybakaRKxpyukbQ23SM0SB0KeV43CUC56x/cNBGze2nJ2dTmpid1vVYqtbzbtJkplSoBKh9kHRxsFbOGkn6liDAgLID3I7n8enrMop7xTI5ayClCzbvrpmScUqi0V9XLh5UouLZGUisSaAWOWPKr73E2zFrD8rNXSWKexyniCq2L9IP4m2UEkKrHsWBPE48g==
Received: from KL1PR0601MB3781.apcprd06.prod.outlook.com
 (2603:1096:820:11::14) by SEZPR06MB6206.apcprd06.prod.outlook.com
 (2603:1096:101:e8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 02:56:18 +0000
Received: from KL1PR0601MB3781.apcprd06.prod.outlook.com
 ([fe80::2cd0:fdbf:62e0:8eaa]) by KL1PR0601MB3781.apcprd06.prod.outlook.com
 ([fe80::2cd0:fdbf:62e0:8eaa%7]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 02:56:18 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [PATCH v2 2/5] dt-bindings: dmaengine: Add AST2600 UDMA bindings
Thread-Topic: [PATCH v2 2/5] dt-bindings: dmaengine: Add AST2600 UDMA bindings
Thread-Index: AQHZVhuLBR+R86KP00ezvaE3fv5YBK7/fEAAgAOGPeA=
Date: Mon, 20 Mar 2023 02:56:17 +0000
Message-ID:  <KL1PR0601MB378198F19051147004321C0491809@KL1PR0601MB3781.apcprd06.prod.outlook.com>
References: <20230314021817.30446-1-chiawei_wang@aspeedtech.com>
 <20230314021817.30446-3-chiawei_wang@aspeedtech.com>
 <20230317210542.GB2790192-robh@kernel.org>
In-Reply-To: <20230317210542.GB2790192-robh@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0601MB3781:EE_|SEZPR06MB6206:EE_
x-ms-office365-filtering-correlation-id: d14f8176-9bb6-48eb-8309-08db28eead85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Lm5wnhTODHuMG3NeQdgdvoMxgHUCU/I6FpLri34TlmxVYzrQF/2gUEDXb2mLz18SkuDVhKaZq9rxaYKmeuJenamB/DGu8Mo34tgW+6DmGh7he9TEuZa+4aWxsQd/Euq2jadK6SpS2ovhA74AMDU26KX2eS2ko5XG8bbF6e5zZVyJNT9E7Rv3VEoExnmDM3B4d5sgaH6LSQmMEQuYw1CK/vix4KjEPlJqreZHWr+UDp3g2x6NileGTdYH36X+A7cv6m3SZllYQZhw/PUNKjOH4XfN7NN0qD9tpolhTNIYnVGkU0hwaIpp4IXnuhYlmXWWYL3qugcotfaVsnKROmEZxwrRNIlNb185DD9nVy0O9YwHcFIO2WkmUEi72NNyzxWHcc4SGiZpyzIaHz2HKYyxLjx3O7kXDehNRm3uO5rmVsWn5l1H2CvMKad2NcX+g8l8DlFo2k91x4LKmWlbx1RAut3DbCrkTW7UmkWEyMdUGeZ1D8n79dRUa8ml9fzVRRdMuajXeFe523pP4EsJizlG1icfB/4VQjmf/BIYAb1fEb3jxxOXmgeZ9/kpcHAV6+J60OoAI2N1cklr9eM7CgFdt2nvy0k7DYeNgDsCggGcNTzM+eiNiC/4aRXBVCzcSm9t12JhwtElYF5XLUEeP5Ieug1ORUlsHOWLlJn7R46VljgUPYHtCEuo2BHv7ejztZsjrbnn6+NdYPIgDevVsQO/5q9z9qOmQcro58gx3XfzKDo=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB3781.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(346002)(396003)(366004)(376002)(39840400004)(451199018)(7696005)(71200400001)(966005)(33656002)(6506007)(26005)(316002)(83380400001)(54906003)(478600001)(9686003)(86362001)(186003)(8676002)(6916009)(4326008)(64756008)(66946007)(66556008)(66476007)(66446008)(76116006)(41300700001)(7416002)(5660300002)(8936002)(52536014)(2906002)(122000001)(38100700002)(55016003)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?K1BBTHI4RE4yUWFvbHRZK0J0ZFBHTWdQa1RiT2pvSmYvRmwrcjhlajlROEZl?=
 =?utf-8?B?bFRiUUVuanRWc3VEQ1Vnbjc5QzRCOGhKMmIrb2xVdDlMQk8wZHFzZmtTNTgw?=
 =?utf-8?B?a2lvZTVNZnkvbExnemJYVHdkQVRRY0VEU2EyUmtidnk5cXFuU2xnL0hLQUtU?=
 =?utf-8?B?Y0hPSG5NeHpuWHR4bTBRL2p5ZENsdGZaNUlCdW01RSsraXZERERUb3l2d1oy?=
 =?utf-8?B?L0xVTHdaTUxHM2k1ZVZCdlQzUXBTRmkvek14bXpjVGdkNTJzSUI2Wkg2TWQ5?=
 =?utf-8?B?ZkNoZGF0TVVHMlBkcDlQMURmNWlhOGtTZHovZEJFUTZSaHBFVHV4ek1wcFJX?=
 =?utf-8?B?YWpGcFFBTXhHV0FaUjgrcHRrNVlRa3JhWVlqdmNDWEZjN2k4ODlxZk9Qem0w?=
 =?utf-8?B?UkFPT3BTaVpzbDVvQXc2Y3YyTE5qTUNKcXNJYUF1NkpkWFFwOEFXaTBEZnVa?=
 =?utf-8?B?YWR2NmtMb3M1S1ZtU3EvV294TWtmbTExWUZ5NWs5U1pNeURhZUc1SXdaY1B1?=
 =?utf-8?B?WWRQMXdIUWZBVUlWMEhFb01mTFAvQWtuQXNKaHUyWFRnSjNsWkJwaTZORzFM?=
 =?utf-8?B?UDJEWDNiNlE0d0dEUDRHQU11MW16bXpJWEtSZFVNUFlJdW42WmdvOVFNZmR1?=
 =?utf-8?B?V1poeWdiWWlHTjJNQlJvOEk3OHF2cnlSK0J6cUYzN1FyTTFmSnVJaEZvQ3JE?=
 =?utf-8?B?dDdWRmUzUC8yWDBQanpSUzE0aVhmTm9YT0RUUDY2bUJEOHFDcmhUcytOeTBy?=
 =?utf-8?B?WFZmd1hCTlZmb1hJVG8vbmJmemhXNm55eXJ5Wi9KdWJmcmNMR2UyMU9zRmZX?=
 =?utf-8?B?WDlkSnJ6ZmRQRk9nclQrZFhIbVhHc09jYUlXbGRCYVltV1dZamptdlBYN1BN?=
 =?utf-8?B?MDhKc1QwM1hvdFFIS3NEYTBrNFFRUERYU3NSeVBveS9UeDRNckZPZHo3SkRO?=
 =?utf-8?B?T0pJMWJsUDd6Rk9DWGZqRmF2N29oSWJNd2RkOTNuSGtGRkp5ZzVVbjVSa1Fz?=
 =?utf-8?B?Z1lhYlZzbEZXaUcyL2hwWE9LT2JiSXVDcUpHUzRTcW5IZ3Y3czFEeWo1cUpQ?=
 =?utf-8?B?aHo5QWM4M044ekhka0k5T2JVajkvZURjOVQ4TElwYUxzdFpGV2NWaWkxdFB1?=
 =?utf-8?B?K1czWlVqaUJuNEUvallhR1lTOFovYlRGRW1FZEtZaytIVnp0dnk0YVVRZlA5?=
 =?utf-8?B?ekhSMXRuenNKeFJQNEQwY0ZkUHFZUE5tMmE2QVRIZW15UE01QnkwQjNhZWQx?=
 =?utf-8?B?VGt3by9SOEl1VUVIcXB3cjM1VjJJQzUvK1M2UnpMS3UvNUlJM1BDVERMNUdm?=
 =?utf-8?B?RDRYZ1JUdnVOa2pUNmNaM3JyRUdNSGdNTFdDMTduMzAzUjJwR1k0cUovcVJZ?=
 =?utf-8?B?QWxvekcrU3V2azZ2dHF1eXMvTkN1U2NWZUc0WDA0NU9uLzVrSVdkbEgwNkhY?=
 =?utf-8?B?ekhNSWpoYVRrSkZJdE5uN2NQdmNITGtQajFMK2o2S2VYd1ZWSVlsNzUvTUlL?=
 =?utf-8?B?Wk9LdzJLNVl4dkY0TFhmRllEK2EyREYxSnFidDVHc3YwYVJmOGJ2ZldNYWFz?=
 =?utf-8?B?Rm94RUhtbFVWUlQycXlwY3pwdUFTLzkzV3NSeTliNjdML24rcFJwRVllMUFX?=
 =?utf-8?B?NVV0a1dMekowblE4aGczRUl1U0l2aWRuakpObVpVU0hrekRZUHB2L0RMNmNl?=
 =?utf-8?B?dSt1Ky9tdjVrRFVKMzJEV2c0ZWdXUm50UUtlbXlRZUp0dlA3Zm5ZWHllZU1n?=
 =?utf-8?B?b2xmWFF4Qmg0OXBwb2lYbytqWmtnZkVnTkdzRlcxYTA0a2s1bkxONldrQUtm?=
 =?utf-8?B?STZsYk0vMG5wMUdqOUxhQmNrMWVSRVV4RUVicTJ2ZDVoMTNmNklyTElGdGRW?=
 =?utf-8?B?MlByVG02clNiMUNFZGJ1KzJKN295d0VSbHBuNGJyQVV1WWtzbmFwNVVBNkM2?=
 =?utf-8?B?ck9HUGRXdmR4R0RIdVdKYldGeVpZME0xWUdaUGdtTVhSdjYxRHZrYmxqQVc2?=
 =?utf-8?B?UFhtK1U4cGdXdlJ0V0gxUGd3bGxIMndKbitLaFl4UlFHK1pWanF3bW5BV2NC?=
 =?utf-8?B?cDJWeVVHdEpLWUhLVVJRSFVOblNQRWhqWnpRaVBkS0QwcmpkWUd5bHA5OEtP?=
 =?utf-8?B?ZWEvZkhDdkFwbVhaNTZRUVkvMUE0d2VCSVNEQ0pwelhyUEZXOEpNRSsrNjhN?=
 =?utf-8?B?bUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB3781.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d14f8176-9bb6-48eb-8309-08db28eead85
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2023 02:56:18.1124
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bpI+3blNX6hpFINysxgq0Q5b50eUFALwCMdx3dJ8U9tv/OKv+xeEmffzxXktm1108JDk47cRL9tMry2rs/eT1bG6HMHdh9j/wV7VXFIE+zc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6206
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
Cc: "pmenzel@molgen.mpg.de" <pmenzel@molgen.mpg.de>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "andrew@aj.id.au" <andrew@aj.id.au>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "vkoul@kernel.org" <vkoul@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "jirislaby@kernel.org" <jirislaby@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiBGcm9tOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0KPiBTZW50OiBTYXR1cmRheSwg
TWFyY2ggMTgsIDIwMjMgNTowNiBBTQ0KPiANCj4gT24gVHVlLCBNYXIgMTQsIDIwMjMgYXQgMTA6
MTg6MTRBTSArMDgwMCwgQ2hpYS1XZWkgV2FuZyB3cm90ZToNCj4gPiBBZGQgdGhlIGRtYWVuZ2lu
ZSBiaW5kaW5ncyBmb3IgdGhlIFVBUlQgRE1BIGVuZ2luZSBvZiBBc3BlZWQgQVNUMjYwMA0KPiBT
b0MuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGlhLVdlaSBXYW5nIDxjaGlhd2VpX3dhbmdA
YXNwZWVkdGVjaC5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9iaW5kaW5ncy9kbWEvYXNwZWVkLGFz
dDI2MDAtdWRtYS55YW1sICAgICB8IDU2DQo+ICsrKysrKysrKysrKysrKysrKysNCj4gPiAgaW5j
bHVkZS9kdC1iaW5kaW5ncy9kbWEvYXN0MjYwMC11ZG1hLmggICAgICAgIHwgNDAgKysrKysrKysr
KysrKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDk2IGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0DQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RtYS9h
c3BlZWQsYXN0MjYwMC11ZG1hLnlhbWwNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUv
ZHQtYmluZGluZ3MvZG1hL2FzdDI2MDAtdWRtYS5oDQo+ID4NCj4gPiBkaWZmIC0tZ2l0DQo+ID4g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZG1hL2FzcGVlZCxhc3QyNjAwLXVk
bWEueWFtbA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RtYS9hc3Bl
ZWQsYXN0MjYwMC11ZG1hLnlhbWwNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4
IDAwMDAwMDAwMDAwMC4uZjkyZTA2YWM5ZjM5DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kbWEvYXNwZWVkLGFzdDI2MDAtdWRt
YS55YW1sDQo+ID4gQEAgLTAsMCArMSw1NiBAQA0KPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkgJVlBTUwgMS4yDQo+ID4gKy0tLQ0K
PiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2RtYS9hc3BlZWQsYXN0MjYw
MC11ZG1hLnlhbWwjDQo+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNj
aGVtYXMvY29yZS55YW1sIw0KPiA+ICsNCj4gPiArdGl0bGU6IEFzcGVlZCBBU1QyNjAwIFVBUlQg
RE1BIGNvbnRyb2xsZXINCj4gPiArDQo+ID4gK21haW50YWluZXJzOg0KPiA+ICsgIC0gQ2hpYS1X
ZWkgV2FuZyA8Y2hpYXdlaV93YW5nQGFzcGVlZHRlY2guY29tPg0KPiA+ICsNCj4gPiArZGVzY3Jp
cHRpb246IHwNCj4gDQo+IERvbid0IG5lZWQgJ3wnDQoNCldpbGwgcmV2aXNlIGluIHYzIHJldmlz
aW9uLg0KDQo+IA0KPiA+ICsgIFRoZSBBc3BlZWQgQVNUMjYwMCBVRE1BIGNvbnRyb2xsZXIgcHJv
dmlkZXMgZGlyZWN0IG1lbW9yeSBhY2Nlc3MNCj4gPiArIGNhcGFiaWxpdGllcyAgZm9yIHRoZSBO
UzE2NTUwQS1jb21wYXRpYmxlIFVBUlQgZGV2aWNlcyBpbnNpZGUNCj4gPiArIEFTVDI2MDAgU29D
cy4gVURNQSBzdXBwb3J0cyAyOCAgRE1BIGNoYW5uZWxzIGFuZCBlYWNoIFVBUlQgZGV2aWNlDQo+
IGhhcyBpdHMgZGVkaWNhdGVkIHBhaXIgb2YgVFggYW5kIFJYIGNoYW5uZWxzLg0KPiA+ICsNCj4g
PiArYWxsT2Y6DQo+ID4gKyAgLSAkcmVmOiAiZG1hLWNvbnRyb2xsZXIueWFtbCMiDQo+IA0KPiBE
cm9wIHF1b3Rlcw0KDQpXaWxsIHJldmlzZSBpbiB2MyByZXZpc2lvbi4NCg0KPiANCj4gPiArDQo+
ID4gK3Byb3BlcnRpZXM6DQo+ID4gKyAgY29tcGF0aWJsZToNCj4gPiArICAgIGNvbnN0OiBhc3Bl
ZWQsYXN0MjYwMC11ZG1hDQo+ID4gKw0KPiA+ICsgIHJlZzoNCj4gPiArICAgIG1heEl0ZW1zOiAx
DQo+ID4gKw0KPiA+ICsgIGludGVycnVwdHM6DQo+ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ICsN
Cj4gPiArICAiI2RtYS1jZWxscyI6DQo+ID4gKyAgICBjb25zdDogMQ0KPiA+ICsNCj4gPiArICBk
bWEtY2hhbm5lbHM6DQo+ID4gKyAgICBtYXhpbXVtOiAyOA0KPiA+ICsNCj4gPiArcmVxdWlyZWQ6
DQo+ID4gKyAgLSBjb21wYXRpYmxlDQo+ID4gKyAgLSByZWcNCj4gPiArICAtIGludGVycnVwdHMN
Cj4gPiArICAtICIjZG1hLWNlbGxzIg0KPiA+ICsgIC0gZG1hLWNoYW5uZWxzDQo+ID4gKw0KPiA+
ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4gPiArDQo+ID4gK2V4YW1wbGVzOg0KPiA+
ICsgIC0gfA0KPiA+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9s
bGVyL2FybS1naWMuaD4NCj4gPiArICAgIHVkbWE6IGRtYS1jb250cm9sbGVyQDFlNzllMDAwIHsN
Cj4gDQo+IERyb3AgdW51c2VkIGxhYmVsLg0KDQpXaWxsIHJldmlzZSBpbiB2MyByZXZpc2lvbi4N
Cg0KPiANCj4gPiArICAgICAgICBjb21wYXRpYmxlID0gImFzcGVlZCxhc3QyNjAwLXVkbWEiOw0K
PiA+ICsgICAgICAgIHJlZyA9IDwweDFlNzllMDAwIDB4MTAwMD47DQo+ID4gKyAgICAgICAgaW50
ZXJydXB0cyA9IDxHSUNfU1BJIDU2IElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KPiA+ICsgICAgICAg
IGRtYS1jaGFubmVscyA9IDwyOD47DQo+ID4gKyAgICAgICAgI2RtYS1jZWxscyA9IDwxPjsNCj4g
PiArICAgIH07DQo+ID4gKw0KPiA+ICsuLi4NCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1i
aW5kaW5ncy9kbWEvYXN0MjYwMC11ZG1hLmgNCj4gPiBiL2luY2x1ZGUvZHQtYmluZGluZ3MvZG1h
L2FzdDI2MDAtdWRtYS5oDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAw
MDAwMDAwMDAuLjBiOTIwMzViOTRmMQ0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9pbmNs
dWRlL2R0LWJpbmRpbmdzL2RtYS9hc3QyNjAwLXVkbWEuaA0KPiA+IEBAIC0wLDAgKzEsNDAgQEAN
Cj4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSAqLw0KPiANCj4g
SGVhZGVycyBzaG91bGQgYmUgZHVhbCBsaWNlbnNlZC4NCj4gDQo+IEhvd2V2ZXIsIHNpbWlsYXIg
dG8gaW50ZXJydXB0cywgd2UgZG9uJ3Qgbm9ybWFsbHkgZG8gZGVmaW5lcyBmb3IgRE1BIHJlcXVl
c3QNCj4gbnVtYmVycy4gSXQncyBvbmx5IHdoZW4gd2UgbWFrZSB1cCB0aGUgbnVtYmVyaW5nIChl
LmcuIGNsb2NrIGlkcykuDQo+IA0KDQpXaWxsIHJlbW92ZSB0aGUgaGVhZGVyIGZpbGUgaW4gdjMg
cmV2aXNpb24uDQoNClRoYW5rcywNCkNoaWF3ZWkNCg0K
