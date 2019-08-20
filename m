Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E7409A4CD9
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 02:39:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MB6D3zlLzDqZx
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 10:39:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microchip.com
 (client-ip=68.232.154.123; helo=esa4.microchip.iphmx.com;
 envelope-from=tudor.ambarus@microchip.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=microchip.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="Hcphfi3X"; 
 dkim-atps=neutral
X-Greylist: delayed 69 seconds by postgrey-1.36 at bilbo;
 Wed, 21 Aug 2019 00:29:08 AEST
Received: from esa4.microchip.iphmx.com (esa4.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CY845lGWzDqMf
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 00:29:08 +1000 (AEST)
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: Z76A+xReMfmXVWlUywhJzDVDO2eleQOIOHh0I6tGjZq6+oBqMkYlh2/oggzE5tmc/zEfwG9t2V
 pZGL/t1A6d9s8YmZlbC7zLVbR+PUmYXw4FlyXYGxulNU9vmXDTi1w31E2zKRGlhf7DUi+Qg83d
 vz5r3eAVsuNb2i6n+/Kjo8shMUQbBJCxFHGuN+1XH6nC3lUAw4tCjYmjtBpGngSc4ztwuxy8qc
 vkfal6qkYt2bP4jRDra78uJnBLLhpKU5O6y4+uyNoK03VYdIr7LS+AfGs4mYwHmscnmPpM1ecv
 J8k=
X-IronPort-AV: E=Sophos;i="5.64,408,1559545200"; d="scan'208";a="44940251"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Aug 2019 07:27:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 20 Aug 2019 07:27:54 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 20 Aug 2019 07:27:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hxy2ixSI5rKN11ISZ/nAaTMtBuV7LreYBkFn6IN1/mIjFyG3kOX0WrF5U/zMx5Mb41h3tV9iKZoYrUVsQ3XTBjb23v3x6b75JxH7/31Vqf5vHmHbGe2GYpTqj5x4Lh1l89E8WY7u0uZ8aHbcxfgL+7xDAzPEJHvwH64w8AurITNBqVh6n5RDEIGnVczJTGELZsuPLQAf0Dsa30EDhDIv3u/FVgU8Y9TaA/nRCTzPtRKql+k6BkKGtrXymCt1DZHLedZLTTYWVMinSCZgvPH7mHIAFlAh0Z8L7hKjG18Y9hj2O9UU7g7/AmaUc6E5NfcFZf60vi6jeu+uBypJcUuCGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxmURSRQCT7QXxYe7VoM4+0YvcnBmYJ2X7G+SRvmQQ0=;
 b=BZ2Gs/Hr7HP89mtRUZ+X1tvdIvbISJ46GldDK/EXqZhdSE75TkA4JhB6foIJE3VaKDe5bNk/SNebwBAtj4+cyPRzkrCmr19EInWYo9+XrWS1zwOtGBAxGAllFQeR2nH0O3K5qxiFruzNwbrZTJliJ+xz0yBm34UW//MXBeLA6aQDN9Bv943RzBEFA4K79dChIg2kzL+7ty/G87ipiPtcRCce7H3iALFsCdp/6d6iyaP7HUzO2elyT/WUSo5ENwIWHm+Eo4RLVWArYmUw8qp9sc6lE9uJf5RvHTNJDXPZBvcAEodwile2vkU9SOtrVFcjaL86gvYsxhIC3rmJQVl/FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxmURSRQCT7QXxYe7VoM4+0YvcnBmYJ2X7G+SRvmQQ0=;
 b=Hcphfi3X+N278gBsi07fpCgBSCEcG7mayR8JG52FqfEPV1lu15GjnNlBZrHPsK1eJvdH3ZjGgBhwh+3Xo4w4Ml3FaI+H6oqwZkhAT7lraXgNfZEjs5IDzp7DT7nlM55v8vwqJ1AQHOw1/98Fh/DGrlmajTuSnIUj+/JIhBOMis0=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3902.namprd11.prod.outlook.com (10.255.180.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Tue, 20 Aug 2019 14:27:54 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2178.018; Tue, 20 Aug 2019
 14:27:54 +0000
From: <Tudor.Ambarus@microchip.com>
To: <avifishman70@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>, 
 <vigneshr@ti.com>, <joel@jms.id.au>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2] mtd: spi-nor: Add Winbond w25q256jvm
Thread-Topic: [PATCH v2] mtd: spi-nor: Add Winbond w25q256jvm
Thread-Index: AQHVRq+si21hV/W8IkmhTrNYaeTiY6cEOX8A
Date: Tue, 20 Aug 2019 14:27:54 +0000
Message-ID: <0f86aed8-3f24-fee7-61a7-968b69dee107@microchip.com>
References: <20190730081832.271125-1-avifishman70@gmail.com>
In-Reply-To: <20190730081832.271125-1-avifishman70@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR04CA0054.eurprd04.prod.outlook.com
 (2603:10a6:802:2::25) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: faf57603-7794-4ee0-8137-08d7257a9690
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3902; 
x-ms-traffictypediagnostic: MN2PR11MB3902:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <MN2PR11MB3902402FE2270CF17E99C890F0AB0@MN2PR11MB3902.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(396003)(346002)(366004)(136003)(199004)(189003)(2906002)(2201001)(478600001)(7736002)(6116002)(6512007)(3846002)(31686004)(305945005)(76176011)(6436002)(86362001)(31696002)(6306002)(966005)(7416002)(229853002)(5660300002)(26005)(14444005)(256004)(25786009)(14454004)(6486002)(316002)(53936002)(110136005)(4744005)(54906003)(4326008)(6246003)(66066001)(186003)(36756003)(99286004)(8936002)(102836004)(66446008)(66476007)(81166006)(81156014)(64756008)(66556008)(71190400001)(71200400001)(11346002)(53546011)(2501003)(6506007)(486006)(476003)(2616005)(8676002)(386003)(66946007)(52116002)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3902;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /6sxK0VyCJ7thlbJBAzoEljOsSsOzVl4B1Q3VI/zVBCOBfRSLKZxFoUV3cFO83iCsMeisMmwLkT4Wy+afJ3QFDDNDzxA2UlFLgrYtfMS8KU3DJpj4/ydmmG6RoScA9PuZyIoHGOcoRR5nOK4P/3IzcyVrh6qVWdM0K7EwHata0i2Sat3OJWk9nutf/dpxBVQVemKBwFFUMMKPze9wGVk0+aKwt1FvKLSZbgDZiOqXBAThg79wxHgVn1qZcQtrMnb5o1IPGbdxImzAUb48ZZ8SU2IjVgLbYXKCNvbh4bBe3YhURlSpFalljvcHQGyy/ySOmoUGOhLXLdJO/Dnfv8h95Dud5cC4K7QM5mkRdIkcsFO5OSjotlkvjmzry4Ng2BRU2XtDOifprb5GOG2+yvgMBnP/3PyWvC7dyt7lnIC8tY=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3B5DF9CE8F61A4DB38F1205E86E1131@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: faf57603-7794-4ee0-8137-08d7257a9690
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 14:27:54.0943 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RKW5Pt7qcHDpNcxRz9NChKwePvoGkxmWchSeUGCXWmjTesFz8jCjmcRgxfOOElRABWOllcYDQt/xGRRjbsWPFpGrl/z7ktXNIDSg0Hyth9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3902
X-Mailman-Approved-At: Mon, 02 Sep 2019 10:34:52 +1000
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
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCk9uIDA3LzMwLzIwMTkgMTE6MTggQU0sIEF2aSBGaXNobWFuIHdyb3RlOg0KPiBFeHRlcm5h
bCBFLU1haWwNCj4gDQo+IA0KPiBTaW1pbGFyIHRvIHcyNXEyNTYgKGJlc2lkZXMgbm90IHN1cHBv
cnRpbmcgUVBJIG1vZGUpIGJ1dCB3aXRoIGRpZmZlcmVudCBJRC4NCj4gVGhlICJKVk0iIHN1ZmZp
eCBpcyBpbiB0aGUgZGF0YXNoZWV0Lg0KPiBUaGUgZGF0YXNoZWV0IGluZGljYXRlcyBEVUFMIGFu
ZCBRVUFEIGFyZSBzdXBwb3J0ZWQuDQo+IGh0dHBzOi8vd3d3LndpbmJvbmQuY29tL3Jlc291cmNl
LWZpbGVzL3cyNXEyNTZqdiUyMHNwaSUyMHJldmklMjAxMDIzMjAxOCUyMHBsdXMucGRmDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBBdmkgRmlzaG1hbiA8YXZpZmlzaG1hbjcwQGdtYWlsLmNvbT4NCj4g
LS0tDQo+ICBkcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYyB8IDIgKysNCj4gIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gDQoNCkFwcGxpZWQgdG8gaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCwNCnNwaS1ub3Iv
bmV4dCBicmFuY2guDQoNClRoYW5rcywNCnRhDQoNCg==
