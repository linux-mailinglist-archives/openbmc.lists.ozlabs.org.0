Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A62716A9270
	for <lists+openbmc@lfdr.de>; Fri,  3 Mar 2023 09:29:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PSh3k3LbSz3cfL
	for <lists+openbmc@lfdr.de>; Fri,  3 Mar 2023 19:29:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=NswTknJA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::72a; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=NswTknJA;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2072a.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::72a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PSh2y1W8Rz3bhJ;
	Fri,  3 Mar 2023 19:29:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hA68IMCXcujj0JO2Dv/JUMjJ7cl8qQs5EtcudvSMYcpOx/hhCrjVVVINtGj4Gn+qDvylTkFl2MWcaZoH2h/Ne4SXYEUN4LazbhdhK542YWWNthqKO/FAhAkO6lStGwg2A31zK3Hx5/E0ItkWqmCHOBBbCvJflSzmPsWBwdpBwjMkOo+pbI0S3Req/OmgR4rCYSCIXIoTgLIipBKH0EzcKlhR0bqWprxjs8lbsw1mFH6Mn/NgDK7nURXFaH/J/kqoM+NFpSVcd5h01ZFiIofaD5jwY+L/+iX3YkzUGqIf/w9wjE53qTMk49n3TEKyMtXh/XdtJMIl5L3Qnjvgj0mQhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0rorX8OO53y7uE1lUs5cZM/fcQBEsrgspdXmT4W1LDI=;
 b=Ct4FTsA1fOnIR26srzI+lCw78zLW6oe1SrPsMZLs1x5GZqcnfYvYu1jgLngKm6A6ZoLMSZ0rNzVfpDUDW3GJS2ZO8FTiybQywzvvG5tX91rS//CEtWgIp1mrHyU1pXDXFkcevOJXVTBJXezf+Nd/z7jyYkGDITrjAggaT4cy7ajuDZqeHNDItk2FeC1Ib0G9bClwAAgbifmPNoNg0fZizinJbTTvmNvhCNRQa8Jf4iBdPoTfsaHTv2AWtM+knJYO3LIbBhmC+11UZ9BrIAQg6PAQBOa/Jtn1FlDhB1dIumiATIL3fpyJkNQfGFU/rbaXyuF0ZJ2/WSv7vXqHgZDcng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rorX8OO53y7uE1lUs5cZM/fcQBEsrgspdXmT4W1LDI=;
 b=NswTknJACHkI8EtZhAiEWHPMxUX8vgpz00605l1c7FJZ33q/gIlG2aQbsNwV/ZfHmRRgiEsJqN26DbOhQyz+y/9nY0v2xVkQ4PvzBSS+KY/P46w5z4ZnEn/uEwhauOemO6QpJdXD2M8hqAjzX4KTFs1szea7wj/GWaQF+rUJ2u0uiJJhEEigd0imv2Og4nmBR7DSpjOxjJWSKu6Mb1bWVWbW93CkM7KxtmmoYBfki3xznhcs8r0fbX3vk6llCXR5pi+XO2JR3Ku9sphaBkxoZghsLicshnwULwNk6MTsbpgpLl5Ddzpa1UUfHU9YFANsbwfPyqecO7tf40XmJHBtuA==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4364.apcprd06.prod.outlook.com (2603:1096:4:153::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Fri, 3 Mar
 2023 08:28:52 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6156.016; Fri, 3 Mar 2023
 08:28:52 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Wolfram Sang
	<wsa@kernel.org>
Subject: RE: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Topic: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Index: AQHZSZBNCqcj9BIMLU6U/5WV2MINja7idvcAgALva/CAA1hsgIAAAQaw
Date: Fri, 3 Mar 2023 08:28:52 +0000
Message-ID:  <SEZPR06MB526902637624A97D7DFB8523F2B39@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230226031321.3126756-1-ryan_chen@aspeedtech.com>
 <20230226031321.3126756-2-ryan_chen@aspeedtech.com>
 <53090449-58c9-bc03-56df-aa8ae93c0c26@linaro.org>
 <SEZPR06MB52699DEB2255EB54F35C2A59F2AD9@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <fc20a2d1-e2f9-c22b-dcdf-153cb527eea8@linaro.org>
In-Reply-To: <fc20a2d1-e2f9-c22b-dcdf-153cb527eea8@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|SI2PR06MB4364:EE_
x-ms-office365-filtering-correlation-id: a73a459f-477d-4a63-7d2e-08db1bc1522e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  hAMxUb1u8rG8blbzRqIog16XXGHQOO+f7/5s2vA8GNrAeQfsYbldTikyw52xv68H2+HPQH4DKgvErZJbxR5pWgloQiQiHFHvn9UsyYN/HUb9Kq51gEGls1UkVz/uVTpe8bC6IORNiRNJuc5pAddF+k1JDm865gJpkYHAAOX28Zw7/gQ4XmntrxusZatdTlb7kOobIsaFFhfX50qAnkW9KWPV3yXw+P6au8bhDHZE2O/gtO+IiLg/TfeoNAIyGjWsZGbJpw/zI5NGcyQ469R2THrYt5MOl+y8MDSx6PTJZ+P1tV/Q7KOjrcjo0JOre+IcZ4F7ZZWS8Wx4G4bs6/s6SkO3SKyg0g9s841bkAcaKzhFJEg/zT2rqdJTRa6IS8eX25Qp3sfa3KUReb/r0XGxHQK2S3jsCCw1PGpob7nPM2LCLB1MSPyudyg+MnPXHda01qUm6dBjJ3+QRF/X4lx3JS3Pknvryc0tR9nq1XMCNi7b9nOHFGD5cxLs+CfsIhqpbyvvBChuyDbFY5o9ByspZoWePSRXhtIXBE8aBWymZGmIAZQWVUuwMVfqHAwathgaL1LkyFsthjSXqsPZnVAOs+5+3HMAt41712PJzHyGoh0l73GF3Su+LKT/HKCI5NdUXwt6j9YUX7ZzQyHF3PcZHfkjhi9Nihf7e9/NAEWU39zFI6wvGSUaC1SjeDjGuCKR
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(376002)(396003)(346002)(39850400004)(451199018)(478600001)(316002)(110136005)(83380400001)(54906003)(33656002)(76116006)(122000001)(64756008)(66476007)(66446008)(38100700002)(8676002)(9686003)(26005)(5660300002)(6506007)(53546011)(7696005)(4326008)(966005)(71200400001)(66946007)(7416002)(38070700005)(55016003)(66556008)(86362001)(8936002)(41300700001)(52536014)(186003)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?S3IycHk1WTFuSFdmbjA5RWFpNWN3TXlSNDM4clk5MXRtaWFVRVFkeU1XbVZ4?=
 =?utf-8?B?RUo0dFA1VytFTHRYelVMRVlVek5EaTRwOFgzemN1YmpLMncyMGhOTFBodGVW?=
 =?utf-8?B?SUdtRHdyY2ZWOGpqNVlRL3FKODdoQjMyUGl2cWtPWFJ6MmxuR2NPWE5ieWNi?=
 =?utf-8?B?NUxKNmhLWUR0ZElhNjlUMnNraGZtdHFYZlQxUzZMV2JmbjNpdWovL3FPdllR?=
 =?utf-8?B?VkV2N2Nmb2pKVVJQRndDa0ZwVkZsOCtVam5XWjhnU2ExanMvRFR5VWhJYThO?=
 =?utf-8?B?NGJHT0tYcTBzdm9jSnlYaTEzdVg1aEFQUW13RFlBQ3BRQXdKYXJGczZnUEgx?=
 =?utf-8?B?L1VYckFOTmErYzBSS2Vyd1BZTEFpRWVycXgvK3N3emNGeDNNU0RmQXRRTVBS?=
 =?utf-8?B?d3B0aXdXZ0R2Rm1BUFdjdmJxemlaOFlMbmFucWVhSmhZZXNvNlZoQTlieHJX?=
 =?utf-8?B?aWlHdUZDSExSTXNXVUVxN0hsMGNZZHhPTkdkNGphekhlVXVoc2xITUFYTHJO?=
 =?utf-8?B?VlZLK2taendSTkFwbzJ1R1dYUFZUSGptclVQWkVBdFQ2ZEQ2YjVXdFREb0ph?=
 =?utf-8?B?S3kyMnNMdmFzOTVMbGR3Zk85SC8zQ241ejdRUndVOUZicDJ6WVpNVnZHaklo?=
 =?utf-8?B?L1Nra1Y0VklGbWoxbzUvd3hKU3NFQkZDZlo1L3pMR3JMMHFHWDEyalZBcERY?=
 =?utf-8?B?MEdBanZGQjVnSmNGdkFFMExsbTBNTG9ZYkMraGtVVUpEUTlZVXNvKzlWQVdX?=
 =?utf-8?B?WGF6ZWtRWkJ2R3FBWTFmM3FCaVVVd3UvcjdaeS9rRzZHUmNsRXBPQkVoeWJU?=
 =?utf-8?B?Rk5BdGM1TVZBM0QrcVNPQzJyTTdUL2JWeHQ1aDBxcUMrdHg1WlFFOGdCbnpX?=
 =?utf-8?B?STN1TEttRnMxbGtzK1lwYzN3NjdhZm9Qc2NqWlNLWU93a1JYVGM3NDl5RU9r?=
 =?utf-8?B?V3dpbTUrTnB4VFNqY3dBNzFNZUpObncyaEltd09uWHIwT20zSHhONFFrRGE1?=
 =?utf-8?B?cHJ1c05KMHY1bVN3amVhaTJxNVdBak83NytpN3ptVHEwc1pOcHNCUEVwMDFm?=
 =?utf-8?B?UWx2bGJtQ1dmemIyaUVDL1prOFI1NFBKZW5HK205SEw4c0h2Y0p6cjFNbElX?=
 =?utf-8?B?NUU3cHN5V3owc0s1L3N6ZUxkaFJrUFFtbXRjMW9UdVVUcXIxZzN6TlpEU3Jl?=
 =?utf-8?B?a0ZNUmhZT1lESnFxMCtCenVIT2F4NXl0NGhIRkNnWTNvNGFlalgwZnlPWldZ?=
 =?utf-8?B?VEltSjNIWmEzQ0tHN3hLckRhQ1F2R25tYTF0RWdLUlpGeDlEc0NONVVwcVg3?=
 =?utf-8?B?OVc3T0RzZzJTUGczS0ZWK1Y5SzFMQyt3NDIxN0lsKytTaFdyeTBCeWx1Z3pC?=
 =?utf-8?B?enNrR1BXYnRsL0RTTzRFb1pHYTdKamZkbUs5QkpzYXQ2SkF1RXh1UDVsYjd6?=
 =?utf-8?B?UHN5QlNEbHgrTnBOUldwYTlzV3VrWjRYalk3cDNVczVXNEUzU3dZU0hTd1Ba?=
 =?utf-8?B?QWhXSjhqdUMwc1VjM0V6TEFLWDF0Qzk4dUFPQm9YQUs3bDNpdGpvd0p1SjlG?=
 =?utf-8?B?d2JGMVFrRlA5UTRpSHI0eUU3MXU4VjdjRjA2dHpQcXJVcFVYNzlHUkJDS3pR?=
 =?utf-8?B?M2R2ZXJKTDE4bXNVQWFDb3JvMFBRcmZiWUxNNmlSMXBacTZXRHdRR2ZtLysy?=
 =?utf-8?B?ODIrbDloWXJwN1B4SUVQUEtCNWdPUTNSZDB6eXNGZlhER2VZdSs0K1BUd21T?=
 =?utf-8?B?QW9lQjhhd1I2ZGZtQzN1Zy9WL1R4QXdqelRXd2t2c291T0t3dmJySjBDNUtn?=
 =?utf-8?B?eFdYVmw1aTY0YUIyTXhJMS91azNzNE82TllMUnk1OGJZVjBSemtEMXlRTzY0?=
 =?utf-8?B?VFBlUnZES0ErOFFaa1pGeG1IZkI0a0VwMzRLVUUzWHQ4RVRDWTdvS2xKK01j?=
 =?utf-8?B?QytlZXdKQ3FpcG9HNlh2VVgweWl1ckJ0RmRLVzFPVnZDTnd6MnFzeGxyWTNs?=
 =?utf-8?B?dmlNZDNIVnd0TGd1aVNFS0g1T2VXbW4rekJFK1h2Q0xmMklXb1BGNEcxdFBS?=
 =?utf-8?B?Q0lYMWQxR0k0RWdibVVXc3Y3M0hpanc1REJKN3VqN21oOVZ3alMyY2VpcDdM?=
 =?utf-8?B?eTRsdzJxMmVPNU1pUW5ZS2puVDZXWnVLd01EcnpJeG9LSFpXNWh2SldGcUdt?=
 =?utf-8?B?OVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a73a459f-477d-4a63-7d2e-08db1bc1522e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2023 08:28:52.4004
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lLWWaDkIPcqndMIQdsoq7wPL7a1qyKXV5nxsg75hBjYy1HByAEk2F9mo7r9KmXClTGeKHjQ+V5VNjcUGxUuREu03bby3NQfxI5nQXPet6fw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4364
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Philipp Zabel <p.zabel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGVsbG8gS3J6eXN6dG9mLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4g
U2VudDogRnJpZGF5LCBNYXJjaCAzLCAyMDIzIDQ6MjAgUE0NCj4gVG86IFJ5YW4gQ2hlbiA8cnlh
bl9jaGVuQGFzcGVlZHRlY2guY29tPjsgV29sZnJhbSBTYW5nDQo+IDx3c2FAa2VybmVsLm9yZz4N
Cj4gQ2M6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+OyBCcmVuZGFuIEhpZ2dpbnMNCj4g
PGJyZW5kYW4uaGlnZ2luc0BsaW51eC5kZXY+OyBLcnp5c3p0b2YgS296bG93c2tpDQo+IDxrcnp5
c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc+OyBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3QGFq
LmlkLmF1PjsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IFBoaWxpcHAgWmFiZWwgPHAu
emFiZWxAcGVuZ3V0cm9uaXguZGU+OyBSb2INCj4gSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3Jn
PjsgQmVuamFtaW4gSGVycmVuc2NobWlkdA0KPiA8YmVuaEBrZXJuZWwuY3Jhc2hpbmcub3JnPjsg
bGludXgtYXNwZWVkQGxpc3RzLm96bGFicy5vcmc7DQo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gb3BlbmJtY0Bs
aXN0cy5vemxhYnMub3JnOyBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjYgMS8yXSBkdC1iaW5kaW5nczogaTJjOiBhc3BlZWQ6IHN1cHBvcnQgZm9yIEFT
VDI2MDAtaTJjdjINCj4gDQo+IE9uIDAxLzAzLzIwMjMgMDY6NTcsIFJ5YW4gQ2hlbiB3cm90ZToN
Cj4gPiBIZWxsbyBLcnp5c3p0b2YsDQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gPj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBs
aW5hcm8ub3JnPg0KPiA+PiBTZW50OiBNb25kYXksIEZlYnJ1YXJ5IDI3LCAyMDIzIDQ6MjUgUE0N
Cj4gPj4gVG86IFJ5YW4gQ2hlbiA8cnlhbl9jaGVuQGFzcGVlZHRlY2guY29tPjsgQW5kcmV3IEpl
ZmZlcnkNCj4gPj4gPGFuZHJld0Bhai5pZC5hdT47IEJyZW5kYW4gSGlnZ2lucyA8YnJlbmRhbi5o
aWdnaW5zQGxpbnV4LmRldj47DQo+ID4+IEJlbmphbWluIEhlcnJlbnNjaG1pZHQgPGJlbmhAa2Vy
bmVsLmNyYXNoaW5nLm9yZz47IEpvZWwgU3RhbmxleQ0KPiA+PiA8am9lbEBqbXMuaWQuYXU+OyBS
b2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsgS3J6eXN6dG9mDQo+ID4+IEtvemxvd3Nr
aSA8a3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3JnPjsgUGhpbGlwcCBaYWJlbA0KPiA+
PiA8cC56YWJlbEBwZW5ndXRyb25peC5kZT47IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmc7DQo+
ID4+IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7
DQo+ID4+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gPj4gbGludXgt
YXNwZWVkQGxpc3RzLm96bGFicy5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4g
Pj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NiAxLzJdIGR0LWJpbmRpbmdzOiBpMmM6IGFzcGVlZDog
c3VwcG9ydCBmb3INCj4gPj4gQVNUMjYwMC1pMmN2Mg0KPiA+Pg0KPiA+PiBPbiAyNi8wMi8yMDIz
IDA0OjEzLCBSeWFuIENoZW4gd3JvdGU6DQo+ID4+PiBBZGQgYXN0MjYwMC1pMmN2MiBjb21wYXRp
YmxlIGFuZCBhc3BlZWQsZ2xvYmFsLXJlZ3MsIGFzcGVlZCx0aW1lb3V0DQo+ID4+PiBhc3BlZWQs
eGZlci1tb2RlIGRlc2NyaXB0aW9uIGZvciBhc3QyNjAwLWkyY3YyLg0KPiA+Pj4NCj4gPj4+IFNp
Z25lZC1vZmYtYnk6IFJ5YW4gQ2hlbiA8cnlhbl9jaGVuQGFzcGVlZHRlY2guY29tPg0KPiA+Pj4g
LS0tDQo+ID4+PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2FzcGVlZCxpMmMueWFtbCAg
IHwgNDQNCj4gKysrKysrKysrKysrKysrKysrKw0KPiA+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA0NCBp
bnNlcnRpb25zKCspDQo+ID4+Pg0KPiA+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9pMmMvYXNwZWVkLGkyYy55YW1sDQo+ID4+PiBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvYXNwZWVkLGkyYy55YW1sDQo+ID4+PiBpbmRleCBm
NTk3ZjczY2NkODcuLjc1ZGUzY2U0MWNmNSAxMDA2NDQNCj4gPj4+IC0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvYXNwZWVkLGkyYy55YW1sDQo+ID4+PiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2FzcGVlZCxpMmMueWFtbA0KPiA+
Pj4gQEAgLTQ5LDYgKzQ5LDI1IEBAIHByb3BlcnRpZXM6DQo+ID4+PiAgICAgIGRlc2NyaXB0aW9u
Og0KPiA+Pj4gICAgICAgIHN0YXRlcyB0aGF0IHRoZXJlIGlzIGFub3RoZXIgbWFzdGVyIGFjdGl2
ZSBvbiB0aGlzIGJ1cw0KPiA+Pj4NCj4gPj4+ICsgIGFzcGVlZCx0aW1lb3V0Og0KPiA+Pj4gKyAg
ICB0eXBlOiBib29sZWFuDQo+ID4+PiArICAgIGRlc2NyaXB0aW9uOiBJMkMgYnVzIHRpbWVvdXQg
ZW5hYmxlIGZvciBtYXN0ZXIvc2xhdmUgbW9kZQ0KPiA+Pg0KPiA+PiBOb3RoaW5nIGltcHJvdmVk
IGhlcmUgaW4gcmVnYXJkcyB0byBteSBsYXN0IGNvbW1lbnQuDQo+ID4NCj4gPiBZZXMsIGFzIEkg
a25vdyB5b3VyIHJlcXVpcmUgaXMgYWJvdXQgIiBEVCBiaW5kaW5nIHRvIHJlcHJlc2VudCBoYXJk
d2FyZQ0KPiBzZXR1cCINCj4gPiBTbyBJIGFkZCBtb3JlIGRlc2NyaXB0aW9uIGFib3V0IGFzcGVl
ZCx0aW1lb3V0IGFzIGJsb3cuDQo+ID4NCj4gPiBBU1BFRUQgU09DIGNoaXAgaXMgc2VydmVyIHBy
b2R1Y3QsIGkyYyBidXMgbWF5IGhhdmUgZmluZ2VycHJpbnQgY29ubmVjdCB0bw0KPiBhbm90aGVy
IGJvYXJkLiBBbmQgYWxzbyBzdXBwb3J0IGhvdHBsdWcuDQo+ID4gVGhlIGZvbGxvd2luZyBpcyBi
b2FyZC1zcGVjaWZpYyBkZXNpZ24gZXhhbXBsZS4NCj4gPiBCb2FyZCBBICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBCb2FyZCBCDQo+ID4gLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLSAgICAgICAgICAgICAgICAgICAgICAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+
ID4gfGkyYyBidXMjMShtYXN0ZXIvc2xhdmUpICA8PT09ZmluZ2VycHJpbnQgPT09PiBpMmMgYnVz
I3ggKG1hc3Rlci9zbGF2ZSl8DQo+ID4gfGkyYyBidXMjMihtYXN0ZXIpLT4gdG1wIGkyYyBkZXZp
Y2UgfCAgICAgICAgICB8DQo+IHwNCj4gPiB8aTJjIGJ1cyMzKG1hc3RlciktPiBhZGMgaTJjIGRl
dmljZSB8ICAgICAgICAgIHwNCj4gfA0KPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gICAg
ICAgICAgICAgICAgICAgICAgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+DQo+ID4gYXNw
ZWVkLHRpbW91dCBwcm9wZXJpdGVzOg0KPiA+IEZvciBleGFtcGxlIEkyQyBjb250cm9sbGVyIGFz
IHNsYXZlIG1vZGUsIGFuZCBzdWRkZW5seSBkaXNjb25uZWN0ZWQuDQo+ID4gU2xhdmUgc3RhdGUg
bWFjaGluZSB3aWxsIGtlZXAgd2FpdGluZyBmb3IgbWFzdGVyIGNsb2NrIGluIGZvciByeC90eCB0
cmFuc21pdC4NCj4gPiBTbyBpdCBuZWVkIHRpbWVvdXQgc2V0dGluZyB0byBlbmFibGUgdGltZW91
dCB1bmxvY2sgY29udHJvbGxlciBzdGF0ZS4NCj4gPiBBbmQgaW4gYW5vdGhlciBzaWRlLiBJbiBN
YXN0ZXIgc2lkZSBhbHNvIG5lZWQgYXZvaWQgc3VkZGVubHkgc2xhdmUNCj4gbWlzcyh1bi1wbHVn
KSwgTWFzdGVyIHdpbGwgdGltZW91dCBhbmQgcmVsZWFzZSB0aGUgU0RBL1NDTC4NCj4gPg0KPiA+
IERvIHlvdSBtZWFuIGFkZCB0aG9zZSBkZXNjcmlwdGlvbiBpbnRvIG9yZSBhc3BlZWQsdGltb3V0
IHByb3Blcml0ZXMNCj4gZGVzY3JpcHRpb24/DQo+IA0KPiBZb3UgYXJlIGRlc2NyaWJpbmcgaGVy
ZSBvbmUgcGFydGljdWxhciBmZWF0dXJlIHlvdSB3YW50IHRvIGVuYWJsZSBpbiB0aGUgZHJpdmVy
DQo+IHdoaWNoIGxvb2tzIG5vbi1zY2FsYWJsZSBhbmQgbW9yZSBkaWZmaWN1bHQgdG8gY29uZmln
dXJlL3VzZS4NCj4gV2hhdCBJIHdhcyBsb29raW5nIGZvciBpcyB0byBkZXNjcmliZSB0aGUgYWN0
dWFsIGNvbmZpZ3VyYXRpb24geW91IGhhdmUgKGUuZy4NCj4gbXVsdGktbWFzdGVyKSB3aGljaCBs
ZWFkcyB0byBlbmFibGUgb3IgZGlzYWJsZSBzdWNoIGZlYXR1cmUgaW4geW91ciBoYXJkd2FyZS4N
Cj4gRXNwZWNpYWxseSB0aGF0IGJvb2wgdmFsdWUgZG9lcyBub3Qgc2NhbGUgbGF0ZXIgdG8gYWN0
dWFsIHRpbWVvdXQgdmFsdWVzIGluIHRpbWUNCj4gKG1zKS4uLg0KPiANCj4gSSBkb24ndCBrbm93
IEkyQyB0aGF0IG11Y2gsIGJ1dCBJIHdvbmRlciAtIHdoeSB0aGlzIHNob3VsZCBiZSBzcGVjaWZp
YyB0bw0KPiBBc3BlZWQgSTJDIGFuZCBubyBvdGhlciBJMkMgY29udHJvbGxlcnMgaW1wbGVtZW50
IGl0PyBJT1csIHRoaXMgbG9va3MgcXVpdGUNCj4gZ2VuZXJpYyBhbmQgZXZlcnkgSTJDIGNvbnRy
b2xsZXIgc2hvdWxkIGhhdmUgaXQuIEFkZGluZyBpdCBzcGVjaWZpYyB0byBBc3BlZWQNCj4gc3Vn
Z2VzdHMgdGhhdCBlaXRoZXIgd2UgbWlzcyBhIGdlbmVyaWMgcHJvcGVydHkgb3IgdGhpcyBzaG91
bGQgbm90IGJlIGluIERUIGF0DQo+IGFsbCAoYmVjYXVzZSBubyBvbmUgZWxzZSBoYXMgaXQuLi4p
Lg0KPiANCj4gQWxzbyBJIHdvbmRlciwgd2h5IHlvdSB3b3VsZG4ndCBlbmFibGUgdGltZW91dCBh
bHdheXMuLi4NCj4gDQo+ICtDYyBXb2xmcmFtLA0KPiBNYXliZSB5b3Uga25vdyB3aGV0aGVyIGJv
b2wgInRpbWVvdXQiIHByb3BlcnR5IGZvciBvbmUgY29udHJvbGxlciBtYWtlcw0KPiBzZW5zZT8g
V2h5IHdlIGRvIG5vdCBoYXZlIGl0IGZvciBhbGwgY29udHJvbGxlcnM/DQo+IA0KQmVjYXVzZSwg
aTJjIGJ1cyBkaWRu4oCZdCBzcGVjaWZpYyB0aW1lb3V0Lg0KQnV0IFNNQnVzIGRlZmluZXMgYSBj
bG9jayBsb3cgdGltZS1vdXQsIFRJTUVPVVQgb2YgMzUgbXMuIA0KDQpJdCBoYXZlIGRlZmluaXRp
b24gaW4gU01CdXMgc3BlY2lmaWNhdGlvbi4gDQpodHRwOi8vc21idXMub3JnL3NwZWNzL1NNQnVz
XzNfMV8yMDE4MDMxOS5wZGYNCllvdSBjYW4gY2hlY2sgUGFnZSAxOCwgTm90ZTMgdGhhdCBoYXZl
IHRpbWVvdXQgZGVzY3JpcHRpb24uDQoNCj4gPj4NCj4gPj4+ICsNCj4gPj4+ICsgIGFzcGVlZCx4
ZmVyLW1vZGU6DQo+ID4+PiArICAgIGRlc2NyaXB0aW9uOiB8DQo+ID4+PiArICAgICAgSTJDIGJ1
cyB0cmFuc2ZlciBtb2RlIHNlbGVjdGlvbi4NCj4gPj4+ICsgICAgICAtICJieXRlIjogSTJDIGJ1
cyBieXRlIHRyYW5zZmVyIG1vZGUuDQo+ID4+PiArICAgICAgLSAiYnVmZmVyZWQiOiBJMkMgYnVz
IGJ1ZmZlciByZWdpc3RlciB0cmFuc2ZlciBtb2RlLg0KPiA+Pj4gKyAgICAgIC0gImRtYSI6IEky
QyBidXMgZG1hIHRyYW5zZmVyIG1vZGUgKGRlZmF1bHQpDQo+ID4+PiArICAgIGl0ZW1zOg0KPiA+
Pj4gKyAgICAgIGVudW06IFtieXRlLCBidWZmZXJlZCwgZG1hXQ0KPiA+Pj4gKyAgICBtYXhJdGVt
czogMQ0KPiA+Pg0KPiA+PiBEcm9wLCBub3QgYW4gYXJyYXkuDQo+ID4+DQo+ID4+PiArICAgICRy
ZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL25vbi11bmlxdWUtc3RyaW5nLWFy
cmF5DQo+ID4+DQo+ID4+IFdyb25nIHJlZi4gVGhpcyBpcyBub3QgYW4gYXJyYXksIGJ1dCBvbmUg
c3RyaW5nLg0KPiA+DQo+ID4gU29ycnksIEkgY2FuJ3QgY2F0Y2ggeW91ciAib25lIHN0cmluZyIg
cG9pbnQuDQo+IA0KPiBIb3cgbWFueSBzdHJpbmdzIHlvdSBhcmUgZ29pbmcgdG8gaGF2ZSBpbiB0
aGlzIHByb3BlcnR5PyBJZiBvbmUNCj4gKG1heEl0ZW1zOiAxKSwgdGhlbiB0aGlzIGlzIG5vdCBh
biBhcnJheS4NCj4gDQo+ID4gQ291bGQgeW91IHBvaW50IG1lIHdoYXQgcmVmIEkgY2FuIHJlZmVy
IHRvPw0KPiA+IFRoYXQgSSBjYW4gY2hlY2sgaW50byBMaW51eCBleGFtcGxlLiBUaGFua3MgYSBs
b3QuDQo+ID4+DQo+ID4+PiArDQo+ID4+PiArICBhc3BlZWQsZ2xvYmFsLXJlZ3M6DQo+ID4+PiAr
ICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUNCj4gPj4+
ICsgICAgZGVzY3JpcHRpb246IFRoZSBwaGFuZGxlIG9mIGkyYyBnbG9iYWwgcmVnaXN0ZXIgbm9k
ZS4NCj4gPj4+ICsNCj4gPj4+ICByZXF1aXJlZDoNCj4gPj4+ICAgIC0gcmVnDQo+ID4+PiAgICAt
IGNvbXBhdGlibGUNCj4gPj4+IEBAIC01Nyw2ICs3NiwxOSBAQCByZXF1aXJlZDoNCj4gPj4+DQo+
ID4+PiAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+Pj4NCj4gPj4+ICtpZjoNCj4g
Pj4NCj4gPj4gVGhpcyBzaG91bGQgYmUgdW5kZXIgYWxsT2YgKGluIHRoaXMgbG9jYXRpb24pDQo+
ID4+DQo+ID4+PiArICBwcm9wZXJ0aWVzOg0KPiA+Pj4gKyAgICBjb21wYXRpYmxlOg0KPiA+Pj4g
KyAgICAgIGNvbnRhaW5zOg0KPiA+Pj4gKyAgICAgICAgY29uc3Q6IGFzcGVlZCxhc3QyNjAwLWky
Y3YyDQo+ID4+PiArDQo+ID4+PiArdGhlbjoNCj4gPj4+ICsgIHByb3BlcnRpZXM6DQo+ID4+PiAr
ICAgIHJlZzoNCj4gPj4+ICsgICAgICBtaW5JdGVtczogMg0KPiA+Pj4gKyAgcmVxdWlyZWQ6DQo+
ID4+PiArICAgIC0gYXNwZWVkLGdsb2JhbC1yZWdzDQo+ID4+DQo+ID4+IGVsc2U6DQo+ID4+ICAg
YXNwZWVkLGdsb2JhbC1yZWdzOiBmYWxzZQ0KPiA+PiBhbmQgdGhlIHNhbWUgZm9yIG90aGVyIHYy
IHByb3BlcnRpZXMNCj4gPj4NCj4gPg0KPiA+IERvZXMgbW9kaWZ5IGJ5IGZvbGxvd2luZz8NCj4g
Pg0KPiA+IGFsbE9mOg0KPiA+ICAtaWY6DQo+ID4gICAgcHJvcGVydGllczoNCj4gPiAgICAgY29t
cGF0aWJsZToNCj4gPiAgICAgICBjb250YWluczoNCj4gPiAgICAgICAgIGNvbnN0OiBhc3BlZWQs
YXN0MjYwMC1pMmN2Mg0KPiA+DQo+ID4gIHRoZW46DQo+ID4gICBwcm9wZXJ0aWVzOg0KPiA+ICAg
ICByZWc6DQo+ID4gICAgICAgbWluSXRlbXM6IDINCj4gPiAgIHJlcXVpcmVkOg0KPiA+ICAgICAt
IGFzcGVlZCxnbG9iYWwtcmVncw0KPiA+ICBlbHNlOg0KPiA+ICAgICAtIGFzcGVlZCxnbG9iYWwt
cmVnczogZmFsc2UNCj4gPiAgICAgLWFzcGVlZCx0aW1lb3V0OiBmYWxzZQ0KPiA+ICAgICAtIGFz
cGVlZCx4ZmVyLW1vZGU6IGZhbHNlDQo+IA0KPiB5ZXMNCj4gDQo+IA0KPiANCj4gQmVzdCByZWdh
cmRzLA0KPiBLcnp5c3p0b2YNCg0K
