Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C56A3655C3A
	for <lists+openbmc@lfdr.de>; Sun, 25 Dec 2022 04:08:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nfm7r4Whyz3bjN
	for <lists+openbmc@lfdr.de>; Sun, 25 Dec 2022 14:08:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=nTL82isy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.241.64; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=nTL82isy;
	dkim-atps=neutral
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2064.outbound.protection.outlook.com [40.107.241.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nfm7C4wJQz2y6F
	for <openbmc@lists.ozlabs.org>; Sun, 25 Dec 2022 14:07:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T43zYQoLzESZ7CYd5iMz0vBAWCGJUWYuInSdOOsxmCCms0D6Mjc/8Qmu7/ZjFkHcIDaPwKHaRUdsLYDHhUbpl2E01xvNUZp/sjqBttoo98JKxxiWdfcPTdsymmrPSes56yOnZKiLCaXXrSD3qw0T+hEdGe09WqSegVPAx3I77YFQlX+etZITATX/C+XCIvq+pEasI3sLQXSPiNZ5sSvzr6L4A2TLBxjdshlk1D97Zm7HAbzd53+sv6VqR8VMU5DFcmijXBD12REDpnsINJBzatjHw1bQ/aDhr3pfiWOrErBS4JnbAjv8anikd7jSUEEz6o/6z7fcLJ53ehuLgfzB6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWSixQwkG9Ol8egy7g25WR3s91TN2h7PXJ2kQetu+bI=;
 b=M9LHqjX26f7Reoz228rt9Yv8tQ56kmQFDF1CXx0SS7cjudS8tm/WwAXBSW5YM4RXhSCpDe6ZYHrI71S/eXvEnyC7DX8PciFNLEtqRl/78LEVtrMUneznT3zPRyMyn2AU8FPQE4FN5yLiKP3+YLAVu3806lH+e98irkkzqfJwDm3ItB3GXE+kC1T1KP5BmKrfiBUaLmJsIN4V/wXPF98tTIeWWp3kzPaJJ8eu81yg9mexfF4NkaAhliOt/mtXXmUcPCIweU+EbQklm0Ukn5cktFH2mqIWXCbd1dqKPGbDTVInZuCzgZl5WhB6YVypCqBg8rFNDbvgRC8DmL11xuw8+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWSixQwkG9Ol8egy7g25WR3s91TN2h7PXJ2kQetu+bI=;
 b=nTL82isyKH0KEmo/4ofZ7q31Cm5eUpJiD6B/uwEP0raEQO4r38bQvORqKBSer7EJKlxXmusnebR6yz5TqIg5Wt8e0qYUNVnIMpocpYc21Oz7rl50+xJtlfsO4gVKswHmi6oRdN9dUswsSDxHMIhdBV53uKGl2LWR8n/UkL2rOyw=
Received: from HE1PR0401MB2331.eurprd04.prod.outlook.com (2603:10a6:3:24::22)
 by DB9PR04MB8188.eurprd04.prod.outlook.com (2603:10a6:10:25e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.13; Sun, 25 Dec
 2022 03:07:13 +0000
Received: from HE1PR0401MB2331.eurprd04.prod.outlook.com
 ([fe80::ca48:3816:f0b6:3fcd]) by HE1PR0401MB2331.eurprd04.prod.outlook.com
 ([fe80::ca48:3816:f0b6:3fcd%6]) with mapi id 15.20.5944.016; Sun, 25 Dec 2022
 03:07:13 +0000
From: Frank Li <frank.li@nxp.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>, Chanh Nguyen
	<chanh@os.amperecomputing.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>, Dan Vacura <w36195@motorola.com>, Jakob
 Koschel <jakobkoschel@gmail.com>, Alan Stern <stern@rowland.harvard.edu>,
	Vijayavardhan Vennapusa <vvreddy@codeaurora.org>, Rondreis
	<linhaoguo86@gmail.com>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Open Source Submission
	<patches@amperecomputing.com>
Subject: RE: [EXT] Re: [PATCH v2] USB: gadget: Add ID numbers to
 configfs-gadget driver names
Thread-Topic: [EXT] Re: [PATCH v2] USB: gadget: Add ID numbers to
 configfs-gadget driver names
Thread-Index: AQHZFhjlqf1edg9mHkmn/Ogctu3iV65973mQ
Date: Sun, 25 Dec 2022 03:07:12 +0000
Message-ID:  <HE1PR0401MB2331C0314D27002E5F3FC17288EF9@HE1PR0401MB2331.eurprd04.prod.outlook.com>
References: <20221221091317.19380-1-chanh@os.amperecomputing.com>
 <f7067028-9662-7776-80a5-3bbe046c92e0@collabora.com>
In-Reply-To: <f7067028-9662-7776-80a5-3bbe046c92e0@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: HE1PR0401MB2331:EE_|DB9PR04MB8188:EE_
x-ms-office365-filtering-correlation-id: 0f885017-5cd3-4362-f1cd-08dae6251ea6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ua6ZkwYyrn6Y+tW4N8PXI9hwl85nsi/xzbxS9NFVE2sJqhl240M11IXQoOTkW6Q4sYZ4Pw0j71XZO6ZjOSVrci0yU6IG+fDpOLfgauBC3qOXiSaAqTcBo31lKecuky3SaSN6Apu0ByQ9wj00lXkYKEbQ6LlOqlpLl75z84A81kiA/XUPy/wTDyMWyqgROqNY2wvRp4K2JjFokuWDGKMHGduskLwO9ld2ice2dOJ54VN8hp0ikYqRe/hNX91RkxPoDv5USsEHIFJqMGIwDuYhrXRl2wHi7wHNFWDi26VqCm5pCleuSaB5WOmq+rlKGte7qV9wx9yVD5QwPT8Br3eIMsApzCQmqQijJFYgYhEqFuTg9WNqht6u30KIepuohff1J17Gh7ZG3R7jHXm+vhGEn20NFLwknkDusAbGaPfNEv+2WnGjaPd60G6WbGbdD6qQxhP6Bm66Fkuy+wtbEF+uS+NROmQE8U9oNsiHWXNKjQ2wbIfPuxQIA/BmoerjjVhkkHIvfyhIt7tG2z9MTljLrNYuoNkuTzfhria6EWm5fI+WtPXlqyzzWEPHAJL1lw7e64I/RHdFQz02bzGTbP96tQMO2TH00t3eSajjBgxj7JO9nmdlSIl55FiOHM7qcQ0GE9yZijsasz17SF3e1O82GnLJxlfbvjo6D1BNQejmW7SVqha/jBwsVfB2HNbBRY4dJeRnPv6du61qK1dcgS6uDw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0401MB2331.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(136003)(376002)(39860400002)(366004)(451199015)(33656002)(110136005)(44832011)(4744005)(41300700001)(52536014)(86362001)(8936002)(7416002)(76116006)(55016003)(66946007)(2906002)(66556008)(66476007)(64756008)(8676002)(316002)(5660300002)(66446008)(38070700005)(9686003)(26005)(186003)(38100700002)(122000001)(921005)(55236004)(6506007)(71200400001)(478600001)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dmpoeVNBTnFGS0pEekhUdDBvREdvcmxUR25FTzNnZTM0eDJNK01jd24xcXhm?=
 =?utf-8?B?U2dHUUk4NkJCeWtqck5EckZDak1FUHFVRlB0Q2d4UnpDUExwRERZNlRBNTNZ?=
 =?utf-8?B?TXZ2R0dIaG9jelg5RTN2U2g3RjBtSTFNa0s0UWYwMERKT2Q3Um1GUTNIUWtF?=
 =?utf-8?B?OVZYeWtKbmQrZmtEeGN0RWJJbCtkSmxVUklOcy9EVmNDZlp4MEJVUmk3c1E4?=
 =?utf-8?B?VU1pbGhYQlBuZEpOK2RNam4ralZuUncydW1IOGZDVGF6MHJVTGlHT292eXlo?=
 =?utf-8?B?REtYMHRuZHo0RGY0RjBkNDdyeUZFVHh0RU0zbnpabEF2ZjFsRWl5RjRuN2lr?=
 =?utf-8?B?UzQzQ3AxL0JsOVgwLytTU0lxMFBxV0lBKzNocTVqWEF3dE91RWlLeEVneUll?=
 =?utf-8?B?MkZvOFo0LzVNc1RPMFBDOWRkaWMxS1hncWR2aXc3Z05pZ0lRU0UzV2JZYTU5?=
 =?utf-8?B?MExXc2ZrOTNWQ3Q0aUNzY1g4OUc4VXNVUytnQ3NSZGVaNXhXVFhFR2w5ZUli?=
 =?utf-8?B?c1NKeHpsTjNjRTZ6amdaa0RQeFN5YUN0REdpNlNpeDcwQUlKZllYekpSdTJN?=
 =?utf-8?B?Qk9udDB2bmpDNTBmQlpRZUdQQUVIdVg5OExjM1B3L0dDOUU4SkFsNVA0Y29h?=
 =?utf-8?B?bnBoa3BpRFRyOTdranBVeEZxaU51RTduNXVYcXh2eXdiU00vcWs5QkIwWkZw?=
 =?utf-8?B?MUowT1c3ZnVyTVpsODBsZk93SmlzSTdPNXN3aTBLSC90a3FGQWViM3pYRHVD?=
 =?utf-8?B?OWhnV2ZUaGVXVEZaTklZK0xOQ1dld05qYTVTOHg3VFZ2Q2M1V1NmNDk5QjVF?=
 =?utf-8?B?Ym8raFhvWWszd0VMbzhobDNnOUlzdFB1a0U1MUZqbjBPcS9TZGRMMWhua3NL?=
 =?utf-8?B?ek9uSWs2NWFpRTk4bnV2VDVQcFA0NG01cCt3RUE5dFpndnl1cGsrbUs3MVpr?=
 =?utf-8?B?NlBYZHZZMGpmREtML01QcFYzQjdrYk5XckR1VGpsQlpJcnV6ZWt6OUpnOXB3?=
 =?utf-8?B?anpHMFFzemhRcTJNRytocHhSYTRGclQ2UllSaTl6bVVCdlBQNk5iSFhzTk9q?=
 =?utf-8?B?djlxMEFwUEhONXFJZyt6KzFBSXdQY3lvY2NGVUNJTncxWWNjSVZuWUdlYndU?=
 =?utf-8?B?aWRRTCtpdk5uYWxqdmxQUXJMZEoxZnU0NGYyQ0o1NE5pQ2FGcFp4U1o1S0ZN?=
 =?utf-8?B?K003QUdYNGZCUHdCaUNKcURwb1BYNGZwTWZseVM0RHhBZXI4WDEwb3N5WEh0?=
 =?utf-8?B?cllES0xsSVRLOUdnR3dtejMvU2EwRTBxSlZrMTVLbmNhdmdXbDNOM2FnaHQ2?=
 =?utf-8?B?Z24vdklXSGxOUXBlRlJVNWpTVVVLckVjc0Zqdk9JQlZpRU9YOVdZVXNlNUpB?=
 =?utf-8?B?emZTZjJ6ekJQYjdqdHlaVHJuOGpueUJUSHpOekRjNm9hblBTUGVrd0ZxK3VB?=
 =?utf-8?B?dW9SenBaN2RsTkZ6VzJqT0N1WEpRYXlTOHhrY2xVeGhUV2VDZDl5elltRWI4?=
 =?utf-8?B?U1kzdTFoQ3VSVUFoaW1FczFlQjByYUZnUmF5bGdZWlgwenJYVkFGK3h4ZHM0?=
 =?utf-8?B?RnNGMlpVMWxsaVhxRW5rbWpmQS9qcThuWVlBdFRmTlEwbzhhNVVBSFJzNkFM?=
 =?utf-8?B?cGRQVG1Ia2pRSFlBQ2FYQXVvTnFoK3BMSWlmRUtZaXp3UlpQTDRtb3lENnNz?=
 =?utf-8?B?SXJaYU5Zb0lZR2w5OUg1c1BUSmlYanVSdW5yK0FkbUE4cUNuek5NTFljYUdK?=
 =?utf-8?B?N01jQjBIR1pGV0FDZVN4L1ZiUWs1OFJ1Vm9uWk9UdHJUUmFkL0ZEbUxLWE5x?=
 =?utf-8?B?c05KMTE1TWlaLzMzZXUxOVVnSyt5UDArUDBvMjhUaWdPdlpMRHZXKzRETzN2?=
 =?utf-8?B?alhTbDVGbkxFcmNDcVNFZHpsTm5EQTNZT0pTaFhQdjRQbS9KbFNWS3ZhRGd1?=
 =?utf-8?B?eVZnS25lcndWbml3RFZhY0RVbjdGclM1RGhTQlN2N3RoRTY5cUlrTXE5LzJY?=
 =?utf-8?B?WEN6cEhyMFpHd01GdU5sQlh3UTB6MCtndlRQMElKNDFFR0t4c3pVV3YrSFBO?=
 =?utf-8?B?QyttTm9xN1VhcTV6cnE5bCtMMmF6L2UyaWNrem81YnRRdm5VZUpLOTg0U2ZM?=
 =?utf-8?Q?fOCk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0401MB2331.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f885017-5cd3-4362-f1cd-08dae6251ea6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2022 03:07:12.8626
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0PFhYVRSxZrEn3X+lqIBAbArSKETlZz+lH62ascs4DdW4Exi3OlMwecSnr/BQPShjHVROeO4g68iVjUdeozVOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8188
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

PiANCj4gSSdtIHdvbmRlcmluZyBpZiBpdCBtYXliZSBtYWtlcyBtb3JlIHNlbnNlIHRvIHVzZSB0
aGUgZ2FkZ2V0IG5hbWUgYXMgYQ0KPiBzdWZmaXgNCj4gaW5zdGVhZD8NCj4gDQo+ICAgICAgICAg
Z2ktPmNvbXBvc2l0ZS5nYWRnZXRfZHJpdmVyLmRyaXZlci5uYW1lID0NCj4gICAgICAgICAgICAg
ICAgIGthc3ByaW50ZihHRlBfS0VSTkVMLCAiY29uZmlnZnMtZ2FkZ2V0LiVzIiBuYW1lKTsNCj4g
DQo+IFNvIHRoYXQgd2hlbiB5b3UNCj4gDQo+IG1rZGlyIGcxDQo+IA0KPiB5b3Ugd2lsbCB1bHRp
bWF0ZWx5IHNlZSAvc3lzL2J1cy9nYWRnZXQvZHJpdmVycy9jb25maWdmcy1nYWRnZXQuZzENCj4g
DQo+IGluc3RlYWQgb2YgL3N5cy9idXMvZ2FkZ2V0L2RyaXZlcnMvY29uZmlnZnMtZ2FkZ2V0LjAN
Cj4gDQo+IEdhZGdldCBuYW1lcyBhcmUgZ3VhcmFudGVlZCB0byBiZSB1bmlxdWUgYmVjYXVzZSB0
aGV5IGFyZSBjcmVhdGVkDQo+IGFzIHNpYmxpbmcgc3ViZGlyZWN0b3JpZXMgaW4gY29uZmlnZnMu
IFlvdXIgcGF0Y2ggd291bGQgdGhlbiBiZSBncmVhdGx5DQo+IHNpbXBsaWZpZWQgKG5vIG5lZWQg
Zm9yIGlkYSkuDQoNCkkgdm90ZSB0aGlzIHdheXMuIA0KDQpCZXN0IHJlZ2FyZHMNCkZyYW5rIExp
DQoNCj4gDQo+IFJlZ2FyZHMsDQo+IA0KPiBBbmRyemVqDQo+IA0KDQo=
