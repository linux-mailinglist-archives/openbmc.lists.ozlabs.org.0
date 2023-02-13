Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF2D693BFF
	for <lists+openbmc@lfdr.de>; Mon, 13 Feb 2023 02:58:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFSDC6c99z3c7B
	for <lists+openbmc@lfdr.de>; Mon, 13 Feb 2023 12:58:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=gbwwjbfu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::703; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=gbwwjbfu;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20703.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::703])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFSCY2Txjz30Mn;
	Mon, 13 Feb 2023 12:57:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QSK7KYU2E5B7ip+4jqWWDxkd9vUNCj8t7DXBbR+x0lABJMrp1fXkGccoaHRKxauWFtHrG3H3qMBB25IJ0VlVkYI2nDbh94YBemmVm74tip43yfTVQyexcaDKfwTN3IGaO54FlcH5bynRvh0kxiavHf+wCi/HchXfgsN7A+IPLVhzQH8Zdqm4bYEFGrAXFmah78pZqY1PcA0Q7qlGjzr2ppCwpias7E0DNiGHljGZyZTu9XtrVqMFYs6zO+MDe1IeZAT4pz+Dtt3Pqrs8J+MYwAa/qeEg/x0ztCQNB8bnK8oaOknKY8siX8wSGl1a29AQeSbRMB8S9qxmQ1SKRQPUYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/30rMzC427EyOJhGSW7RT2MH2AsJZi6wieJuHcBc5a8=;
 b=VPV2zvSnh6lmdUFVegMSnoFMaBZhZzMk6G0uiY/2L7G0j5uIlzvgCmE8xVaOa7h3+vElHb5+zCka8wDIfZQgk2OQCi05+UE731FhRWQQKZ0cSiAQCeZGbMtybenPUwwrKmuKhU1IOyYl8qZLV2NltCl9NJHDXQrhqUlxhuzzG0L9B/4W+pYLqOpmg70OWsDErqz1lofDKZPvYBT3mGVBR2D5CGHqrzeqlyxSFpcl+eqVZ+wtwg97yw2QSzC6fAi34xNtNp4rAw9gkSsBvbtyKxfoXPUvmZgJSxKNThMEo79Z0k28nMCr5uG0q0/C/VRfL6NOQjbSQpn0x8nGFipHKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/30rMzC427EyOJhGSW7RT2MH2AsJZi6wieJuHcBc5a8=;
 b=gbwwjbfuNGxIX1OzT0bpkQ3ix1fqSSGp57903aVuvPS9z/ATkStus8NfEJA6BZJjnrHqMeN0j5nN8QTZZ4AR5ekJZb1LanZxn1pxq2MiHwRSD3J7n/Cu6mOzyvYI3Mp7jLAmu5kPKPPZIe4uUueWr9kuq9KRVwyiatMlvpg2zM8zeBqJZt/FQk93/ArSFJcXswScMXeViqII8h0fYt+hGXDiqAlfH4OpwbccyaN9PiJcUXPsUkGjCEHthuj++d51hQvssGbZFw86cE0tM22E7DvJDy+2bjkUIub34e9cSP1vAE/iYIroCbhmC/S4h+pYM4PNS5xCRupaL4+ngk4k/w==
Received: from KL1PR0601MB3781.apcprd06.prod.outlook.com
 (2603:1096:820:11::14) by TY0PR06MB4982.apcprd06.prod.outlook.com
 (2603:1096:400:1ae::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.8; Mon, 13 Feb
 2023 01:57:21 +0000
Received: from KL1PR0601MB3781.apcprd06.prod.outlook.com
 ([fe80::2cd0:fdbf:62e0:8eaa]) by KL1PR0601MB3781.apcprd06.prod.outlook.com
 ([fe80::2cd0:fdbf:62e0:8eaa%4]) with mapi id 15.20.6111.010; Mon, 13 Feb 2023
 01:57:21 +0000
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
Subject: RE: [PATCH 1/4] dt-bindings: aspeed: Add UART controller
Thread-Topic: [PATCH 1/4] dt-bindings: aspeed: Add UART controller
Thread-Index: AQHZPSFcEcSQ+pRfl0eZpwMLVeoGZq7H5ViAgAQ7dPA=
Date: Mon, 13 Feb 2023 01:57:21 +0000
Message-ID:  <KL1PR0601MB3781A9E9E209F2E94CE2F08D91DD9@KL1PR0601MB3781.apcprd06.prod.outlook.com>
References: <20230210072643.2772-1-chiawei_wang@aspeedtech.com>
 <20230210072643.2772-2-chiawei_wang@aspeedtech.com>
 <2d0d1866-95f9-942d-57e0-06a5ed17d35d@linaro.org>
In-Reply-To: <2d0d1866-95f9-942d-57e0-06a5ed17d35d@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR0601MB3781:EE_|TY0PR06MB4982:EE_
x-ms-office365-filtering-correlation-id: c70bede0-b75d-41d5-e757-08db0d65a501
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  XCYlqp5yEXkTIzrjT91aiaET46iCzGvZ4lnUNM14ZQa4FoWWUKRPn1YEnVX3XaMol3SWjj8BCwDk45xfL3g05lu5mPpBnR8LwBGDgrvrFicLkbao8j9T0KLeck9NHp/ThLIO+YtirKYnrNbWAPbPwmgFsHE0tc/uIYW8XjmR9wXn7BniF51p8qirIQEOHYxBHHKDzJHG7V3BdHkW9vU2rKsZTL618sGg2yhddwq71UF2Ml+Y02ZQQi+ae+yGOrmWcHRqtZP1a1vGc6z/g4GiU5QhpH28YoqxC9+m3pGExsdHJbmIF8hvWIco7EeeBbIqcWZDoGwHAo1nO6Wd09fyX5lb+Acv3RFsHFs5ZNKmI5zZR+rnO6NBvhgBQ8EtWeAlpZvOFjOokBb1wmgcn3cKd8x7be3draEtknRmGxxqKfBsMwDun640SMGm3O1Kra/TlLNnQ2CSU68b0Tvyk1ziYgOR671Yq9eRYkG08OwUxuF7o4WV68Mw9XlXmO7TxrXgffN1fwepDzZbmpKGZckwFoRDleDz+C4glsDPwMOoFGD7UPpeC/kvDCv/6dtOhgpfJvSdYjUJwcatXkjYE6i0ICqZjj1DYLdp/859UaPoZ8T6h+9f2tqdxiInGNtckzXCSmwBcXUOROhLLOJiMgzbFenLjDLMNcdiNG9Bs8AP6I/tl2wzG1l+8QrgW9zYISqYVWiiTGEpW6yZE5ubcQ/oC/XoU76likg0scRqGoqqtAe+5Ii93k/FtoCe/8416fvpRpd0ZAynhhopJodAkyd8t/JWHHJp9aid5cBZDtjgjCE=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB3781.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(136003)(39840400004)(376002)(396003)(451199018)(83380400001)(38070700005)(921005)(38100700002)(55016003)(122000001)(64756008)(5660300002)(41300700001)(8676002)(52536014)(6506007)(9686003)(66946007)(53546011)(66446008)(66476007)(66556008)(76116006)(7416002)(2906002)(966005)(316002)(110136005)(8936002)(7696005)(86362001)(33656002)(71200400001)(26005)(186003)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Yy9NNjFSV2ZrOVVZRnBEeEtXWkpkK2hjcy9WeHpNWjlBTDY2enUyb2hSekZU?=
 =?utf-8?B?Q1FCckxXRmlIYTdEK2tpU1NCNWFSSDJXSm9NTGdNbndVOXRGc1ZBZ3pKdmVF?=
 =?utf-8?B?YXdNY3U1a2RXN2ZqeG1aengyTE1uZkJMSmxrVUpoa0JDUFRIaGJsYTJLdXhs?=
 =?utf-8?B?K3pTSm03dFRJa0YvNmdwcytrWUNrdmprN0pFMVV2Vm83VHg1aXB6UzVxSTRu?=
 =?utf-8?B?UmhwYmQxWDZhWVRQTFpTVWxmOHp3VkJ0RUZtNmx4VWVUd2FNbUduSnIzWEdt?=
 =?utf-8?B?aWNrR0JWdFZZdEZ1WmEzeHhUZmNyVVdVWjhBZXc0b0tnOFI3Q1JWRVBRQkJP?=
 =?utf-8?B?OWlkeHZsak1Qb2llZ0s3Y0c4MHh2ZitOSndGRWtGdmR5c0UxUnpOdzhqVjNX?=
 =?utf-8?B?MWp4UmZvS3VEUllSNDBGbkZibmtHd0VsWVBVOWE1dmJ2cm1kK3VZRTdaYThq?=
 =?utf-8?B?Qy84eWwwc1J5bTlpSHBGWVdMU1ppTVMxb3ZtdmIxN3RXTUpuSENZVFpCTThz?=
 =?utf-8?B?a0grMnl3U1ZIRmpTRjFEdHIzTFhCRk1ZNXhrRHBzLzN3dUFjdnRhMExvOVZt?=
 =?utf-8?B?eHhMRzBkRG90T2FPM3VRdldMVmNLdzIraDJROFYvZk5XMjByd1ZxS1N6M1R1?=
 =?utf-8?B?V0NOWnJ1R09Sblc5OGFrdlhuRDNPWnlCL2NBQnZ4YUVZN21sNVNWU3Mram9O?=
 =?utf-8?B?M0ZuZ1c5NmVLbUdGMnJaU1ZkZjJjang0RUxIU2wwQ3l3dEpaSDJKTDVvOVEz?=
 =?utf-8?B?KytDOGR5bC9FRzE0MXlQdXhDZUhUY2k3a29jY2h1akRqR0J5U253aVlGZlBv?=
 =?utf-8?B?M2xMUFVhMmxZWmthNHU2YmpvNXhYNjFuenNPb2JRSkNvNjZnOS9CeXd4K1VE?=
 =?utf-8?B?bCtwaHArMVp6N29HZjc2VjFWZG8xUkMraEV4NmVHUmc0MGlNL29xTkxLY0xY?=
 =?utf-8?B?UG5lcFBjN1ZzeDdFbUpOeWtJY2hQMUhkbDlFOFNzQ3ZMelJQUFhaSkN4OXJj?=
 =?utf-8?B?S2pmc1kxMTlPUEM0VEpHZTVaNlUzK3Jnb1hkMDhxUFhFRmV2QWVKN2d4cEhS?=
 =?utf-8?B?SVdTMTZLTkRQZ01DZ2F3WXNwaVRZMUFuMGszTU5UTU9iQXVIREtIcGkwaEVs?=
 =?utf-8?B?TjZpdkFVNGlVNWQxZXRTeE9wSzdKOHltYnBHdGQxOS92ck8wRDY3dVRoUmJi?=
 =?utf-8?B?MW83QmVha2ZFVDBKZTFDbHM3RFVCdWNrUUdQa045MjVjaUF2cWJzYXZDa0tX?=
 =?utf-8?B?OGZWVGtLQmdjaCtjVmlIb21HYUV6bGNpQWNjSjhOL3k2QnJ6b250OTA5WFpu?=
 =?utf-8?B?bjlVeThwUFRYeGp4VUszb0M2TCtFdWsxdnBZSVNjVUZOQlhpeStZSnZCbDVu?=
 =?utf-8?B?TUxkUTF0UjlwTTEwcXlycE9ZOUl4WnJIVDI2NTF3QjdpRUFjVGVWVVdSbWpE?=
 =?utf-8?B?U3NpNTg2ZXhFRUo3OElTTUdiMWk5UlNWaUVSVnowaWd2QlpOaXVkSGtQY0Nv?=
 =?utf-8?B?OWR4dzVTTVVHL29sMmZCU3U3WmRFMGMzSW5hOGh6MUMzV1Avb04xZjJtVGVW?=
 =?utf-8?B?VnBqbURJOGhtQjRXZ0dMMzRQcnBVYUZJT0tlM0cyYlU4eFBaMk9KS0k4c2Rk?=
 =?utf-8?B?Mi9Ea2JrMUY2SVhlSTVwRGsxQm5GUkxlT2RrYjhZWm83NnV1emJhRkVXRGRs?=
 =?utf-8?B?ODNWeUplTmtPb1psaTk5RitBOEJIQmVHd21zQm1JaGRkc3RFUEkzMytvOVdX?=
 =?utf-8?B?M1ZGOFIvRW8xREVueFYwSUFCUUlCd1pYc2FURCtVR1BWa0V2SDZRZFhNT2x6?=
 =?utf-8?B?aVBJanZFbnlMbVNKK1B2NXllN0QxMkZWLyttMC9qYkMyOFVVYy96TGY2MGhn?=
 =?utf-8?B?dVEyTzBXVVpmdUI1dExzTmhRMk5jc2ZPSjg0blVUMDZXOHRYVEdXLzdLYXpG?=
 =?utf-8?B?TThna1FYR2hBWjZPdTV1SEovQjRqSWtlY2xJR1pwaG5CNXlacmNFZkpteHBN?=
 =?utf-8?B?eWVqdzExVjNHQTB2bSswb3dkeTVaK2J1NWZPWGdDTVdtdlhDbkk0eHJDVzhi?=
 =?utf-8?B?TUxBU2c5NzhMVG9yL0Q5RzkweGs5TkF2VlViNWhLYWZ0T3ZxSzM5MmVxZHJw?=
 =?utf-8?B?Q2RTVFBMZEJBaHZkYzhveXlFcU5OQUhLdmVvWUxjK0lQc0RmWGttQzFmWGJj?=
 =?utf-8?B?bVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB3781.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c70bede0-b75d-41d5-e757-08db0d65a501
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2023 01:57:21.3968
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xbj3R857i98ZC2QH8LqnH5ZMUex9oHgcixzHv2UiR+a8ot9dXgO80dSVHE8m+2OGKy0Uai8u4o4fHP9aYLxAFUP8/emN0dLr5/+ZbugJKPw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB4982
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
cmc+DQo+IFNlbnQ6IEZyaWRheSwgRmVicnVhcnkgMTAsIDIwMjMgNToxMyBQTQ0KPiANCj4gT24g
MTAvMDIvMjAyMyAwODoyNiwgQ2hpYS1XZWkgV2FuZyB3cm90ZToNCj4gPiBBZGQgZHQtYmluZGlu
Z3MgZm9yIEFzcGVlZCBVQVJUIGNvbnRyb2xsZXIuDQo+IA0KPiBEZXNjcmliZSB0aGUgaGFyZHdh
cmUuIFdoYXQncyB0aGUgZGlmZmVyZW5jZSBhZ2FpbnN0IGV4aXN0aW5nIEFzcGVlZCBVQVJUDQo+
IHVzZWQgZXZlcnl3aGVyZT8NCg0KVGhlIGRlc2NyaXB0aW9uIHdpbGwgYmUgcmV2aXNlZCB0byBl
eHBsYWluIG1vcmUgZm9yIFVBUlQgYW5kIFZpcnR1YWwgVUFSVCBjb250cm9sbGVycy4NCg0KPiAN
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IENoaWEtV2VpIFdhbmcgPGNoaWF3ZWlfd2FuZ0Bhc3Bl
ZWR0ZWNoLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRpbmdzL3NlcmlhbC9hc3BlZWQsdWFy
dC55YW1sICAgICAgICAgIHwgODENCj4gKysrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgODEgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL2FzcGVlZCx1YXJ0LnlhbWwN
Cj4gDQo+IEZpbGVuYW1lOiBhc3BlZWQsYXN0MjYwMC11YXJ0LnlhbWwNCj4gKHVubGVzcyB5b3Ug
YXJlIGFkZGluZyBoZXJlIG1vcmUgY29tcGF0aWJsZXMsIGJ1dCB5b3VyIGNvbnN0IHN1Z2dlc3Rz
IHRoYXQgaXQncw0KPiBub3QgZ29pbmcgdG8gaGFwcGVuKQ0KPiANCj4gPg0KPiA+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL2FzcGVlZCx1YXJ0
LnlhbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwvYXNw
ZWVkLHVhcnQueWFtbA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAw
MDAwMDAwLi4xMGM0NTdkNmE3MmUNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9hc3BlZWQsdWFydC55YW1sDQo+ID4g
QEAgLTAsMCArMSw4MSBAQA0KPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIu
MC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkgJVlBTUwgMS4yDQo+ID4gKy0tLQ0KPiA+ICskaWQ6IGh0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3NlcmlhbC9hc3BlZWQsdWFydC55YW1sIw0KPiA+
ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMN
Cj4gPiArDQo+ID4gK3RpdGxlOiBBc3BlZWQgVW5pdmVyc2FsIEFzeW5jaHJvbm91cyBSZWNlaXZl
ci9UcmFuc21pdHRlcg0KPiANCj4gVGhpcyB0aXRsZSBtYXRjaGVzIG90aGVyIEFzcGVlZCBVQVJU
cywgc28gYXJlbid0IHlvdSBkdXBsaWNhdGluZyBiaW5kaW5ncz8NCj4gDQo+ID4gKw0KPiA+ICtt
YWludGFpbmVyczoNCj4gPiArICAtIENoaWEtV2VpIFdhbmcgPGNoaWF3ZWlfd2FuZ0Bhc3BlZWR0
ZWNoLmNvbT4NCj4gPiArDQo+ID4gK2FsbE9mOg0KPiA+ICsgIC0gJHJlZjogc2VyaWFsLnlhbWwj
DQo+ID4gKw0KPiA+ICtkZXNjcmlwdGlvbjogfA0KPiA+ICsgIFRoZSBBc3BlZWQgVUFSVCBpcyBi
YXNlZCBvbiB0aGUgYmFzaWMgODI1MCBVQVJUIGFuZCBjb21wYXRpYmxlDQo+ID4gKyAgd2l0aCAx
NjU1MEEsIHdpdGggc3VwcG9ydCBmb3IgRE1BDQo+ID4gKw0KPiA+ICtwcm9wZXJ0aWVzOg0KPiA+
ICsgIGNvbXBhdGlibGU6DQo+ID4gKyAgICBjb25zdDogYXNwZWVkLGFzdDI2MDAtdWFydA0KPiA+
ICsNCj4gPiArICByZWc6DQo+ID4gKyAgICBkZXNjcmlwdGlvbjogVGhlIGJhc2UgYWRkcmVzcyBv
ZiB0aGUgVUFSVCByZWdpc3RlciBiYW5rDQo+IA0KPiBEcm9wIGRlc2NyaXB0aW9uDQoNCldpbGwg
cmV2aXNlIGFzIHN1Z2dlc3RlZC4NCg0KPiANCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0K
PiA+ICsgIGNsb2NrczoNCj4gPiArICAgIGRlc2NyaXB0aW9uOiBUaGUgY2xvY2sgdGhlIGJhdWRy
YXRlIGlzIGRlcml2ZWQgZnJvbQ0KPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiArDQo+ID4gKyAg
aW50ZXJydXB0czoNCj4gPiArICAgIGRlc2NyaXB0aW9uOiBUaGUgSVJRIG51bWJlciBvZiB0aGUg
ZGV2aWNlDQo+IA0KPiBEcm9wIGRlc2NyaXB0aW9uDQoNCldpbGwgcmV2aXNlIGFzIHN1Z2dlc3Rl
ZC4NCg0KPiANCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICsgIGRtYS1tb2RlOg0K
PiA+ICsgICAgdHlwZTogYm9vbGVhbg0KPiA+ICsgICAgZGVzY3JpcHRpb246IEVuYWJsZSBETUEN
Cj4gDQo+IERyb3AgcHJvcGVydHkuIERNQSBpcyBlbmFibGVkIG9uIHByZXNlbmNlIG9mIGRtYXMu
DQo+IA0KPiA+ICsNCj4gPiArICBkbWEtY2hhbm5lbDoNCj4gPiArICAgICRyZWY6IC9zY2hlbWFz
L3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMg0KPiA+ICsgICAgZGVzY3JpcHRpb246IFRo
ZSBjaGFubmVsIG51bWJlciB0byBiZSB1c2VkIGluIHRoZSBETUEgZW5naW5lDQo+IA0KPiBUaGF0
J3Mgbm90IGEgY29ycmVjdCBETUEgcHJvcGVydHkuIGRtYXMgYW5kIGRtYS1uYW1lcyBnaXQgZ3Jl
cCBkbWEgLS0NCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzLw0KPiANCj4gDQo+
ID4gKw0KPiA+ICsgIHZpcnR1YWw6DQo+ID4gKyAgICB0eXBlOiBib29sZWFuDQo+ID4gKyAgICBk
ZXNjcmlwdGlvbjogSW5kaWNhdGUgdmlydHVhbCBVQVJUDQo+IA0KPiBWaXJ0dWFsIG1lYW5zIG5v
dCBleGlzdGluZyBpbiByZWFsIHdvcmxkPyBXZSBkbyBub3QgZGVzY3JpYmUgaW4gRFRTDQo+IG5v
bi1leGlzdGluZyBkZXZpY2VzLiBEcm9wIGVudGlyZSBwcm9wZXJ0eS4NCg0KVGhlIHZpcnR1YWwg
cHJvcGVydHkgaW5kaWNhdGVzIGl0IGlzIGEgVmlydHVhbCBVQVJUIGRldmljZS4NClZVQVJUIG9m
IEFzcGVlZCBTb0MgaXMgYWN0dWFsbHkgYSBGSUZPIGV4cG9zZWQgaW4gdGhlIDE2NTUwQSBVQVJU
IGludGVyZmFjZS4NClRoZSBvbmUgaGVhZCBvZiB0aGUgRklGTyBpcyBleHBvc2VkIHRvIEhvc3Qg
dmlhIGVTUEkvTFBDIGFuZCB0aGUgb3RoZXIgb25lIGlzIGZvciBCTUMuDQpUaGVyZSBpcyBubyBw
aHlzaWNhbCBzZXJpYWwgbGluayBiZXR3ZWVuIEhvc3QgYW5kIEJNQy4gQW5kIHRodXMgbmFtZWQg
YXMgVmlydHVhbCBVQVJULg0KDQo+IA0KPiA+ICsNCj4gPiArICBzaXJxOg0KPiA+ICsgICAgJHJl
ZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyDQo+ID4gKyAgICBkZXNj
cmlwdGlvbjogVGhlIHNlcmlhbCBJUlEgbnVtYmVyIG9uIExQQyBidXMgaW50ZXJmYWNlDQo+IA0K
PiBEcm9wIGVudGlyZSBwcm9wZXJ0eS4NCg0KTWFuZGF0b3J5IGZvciBWaXJ0dWFsIFVBUlQNCg0K
PiANCj4gPiArDQo+ID4gKyAgc2lycS1wb2xhcml0eToNCj4gPiArICAgICRyZWY6IC9zY2hlbWFz
L3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMg0KPiA+ICsgICAgZGVzY3JpcHRpb246IFRo
ZSBzZXJpYWwgSVJRIHBvbGFyaXR5IG9uIExQQyBidXMgaW50ZXJmYWNlDQo+IA0KPiBEcm9wIGVu
dGlyZSBwcm9wZXJ0eS4NCg0KTWFuZGF0b3J5IGZvciBWaXJ0dWFsIFVBUlQNCg0KPiANCj4gPiAr
DQo+ID4gKyAgcGluY3RybC0wOiB0cnVlDQo+ID4gKw0KPiA+ICsgIHBpbmN0cmxfbmFtZXM6DQo+
ID4gKyAgICBjb25zdDogZGVmYXVsdA0KPiANCj4gDQo+IERyb3AgYm90aCwgeW91IGRvIG5vIG5v
dCBuZWVkIHRoZW0uDQoNCldpbGwgcmV2aXNlIGFzIHN1Z2dlc3RlZA0KDQo+IA0KPiA+ICsNCj4g
PiArcmVxdWlyZWQ6DQo+ID4gKyAgLSBjb21wYXRpYmxlDQo+ID4gKyAgLSByZWcNCj4gPiArICAt
IGNsb2Nrcw0KPiA+ICsgIC0gaW50ZXJydXB0cw0KPiA+ICsNCj4gPiArdW5ldmFsdWF0ZWRQcm9w
ZXJ0aWVzOiBmYWxzZQ0KPiA+ICsNCg0KUmVnYXJkcywNCkNoaWF3ZWkNCg0K
