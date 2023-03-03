Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D1D6A950C
	for <lists+openbmc@lfdr.de>; Fri,  3 Mar 2023 11:17:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PSkS21VL0z3bhJ
	for <lists+openbmc@lfdr.de>; Fri,  3 Mar 2023 21:17:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=WYL4LDbW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::70b; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=WYL4LDbW;
	dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2070b.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::70b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PSkRG0nHDz3bTS;
	Fri,  3 Mar 2023 21:16:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ip9trwhLfJHWfBOTrvahL685rksCvbQ+BONyY6ftY996NUSRqOYIVvau1SiwWNPCSfmxF/xURDRD18QnMgQ24ZoX+mD5McT8oNFqgV6afmUqD3PLhURGc8svKDgGvsx7SPQGWhBR/0f8jV9R1bbDHSfCO5TzpZjOdu6PxLt/z8TTvrNH7LwftZhkcdGgaNYt+ojPI18Rc2NAlVQQbKQ/lj70bGe784WaTIkfD07QzWgBCOoNdKcK2xJ/vYfHz9GeMWwKsiBjaNjF57wceLN8PqxmINolc2ASwmRv895lGSFLzfznAexrzPFuww/N5bPo0KYmM+js0QMkNrbgR70G7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o93evCZ4suSoDtj6tIEh00TIZqbWC/hZ+yZP6tp8kiI=;
 b=bKuo+QwkYds22rLJGZ/HyZCWlY5y9tJBkXuox+Rl1RToWL6bxq3nkkldn5LshPhux9Jw03Jg9UmWVFLwV/6n4RKKcBhwDusV7YNxcLn8Xe2Po92TJ2ieFpsmWtGDNe0KWdZeNcNJnI9cr6GsMYuQSY7uYiz8g0ef8vwLHh9YO6+IiFe9RkXtXxpfcnX9YpdkxSgRaTiCUs2G1X/vHNElRZjzvi9b8CFBjUtqxdFN75fGfNeDPgpp2X4izdzOX5bjYydSH5beUY6XGtRUoG6cWsRH04XldJrF1zMVGJ6E12jGHo/o3rfL1Dt2vSxgOZdbAasYbRJeHmxXAd/tbHfJnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o93evCZ4suSoDtj6tIEh00TIZqbWC/hZ+yZP6tp8kiI=;
 b=WYL4LDbWaCFW3bfeflDrEg6aeROPzoUV5WwBgZ6mlGcQUa4VAfqvFPcEmlHYBIh998lse9dlaGopTd5A4XzsfM+AS64AKyNk2Qpd3OtIPmX02P+hOYT1WVd0AS24mUqXYBZ6Y9uhv6460M0joPXBKSs8zraoeuT1PWh2oHe4MVoOecQcssAINV+aOxQ9dBc3jU9gHJAdOhYNp1TXG1VjhMUxneW6radOjWe9CBa304o0MxpsfIBgzOytH0Xka5je+GiUSOIsuptT39HlJGRdDpDlPS/P5/UJv1DvQHIjjsctQN4AIECakcYyXBW5XByfU0M3NfYX4lWbPuefheRSGw==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4522.apcprd06.prod.outlook.com (2603:1096:4:156::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Fri, 3 Mar
 2023 10:16:32 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6156.016; Fri, 3 Mar 2023
 10:16:32 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Wolfram Sang
	<wsa@kernel.org>
Subject: RE: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Topic: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Index:  AQHZSZBNCqcj9BIMLU6U/5WV2MINja7idvcAgALva/CAA1hsgIAAAQawgAAHfwCAAAAwwIAACb6AgAANnCA=
Date: Fri, 3 Mar 2023 10:16:32 +0000
Message-ID:  <SEZPR06MB5269E7B070B239F8E349C427F2B39@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230226031321.3126756-1-ryan_chen@aspeedtech.com>
 <20230226031321.3126756-2-ryan_chen@aspeedtech.com>
 <53090449-58c9-bc03-56df-aa8ae93c0c26@linaro.org>
 <SEZPR06MB52699DEB2255EB54F35C2A59F2AD9@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <fc20a2d1-e2f9-c22b-dcdf-153cb527eea8@linaro.org>
 <SEZPR06MB526902637624A97D7DFB8523F2B39@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <c41ee6b5-ddb4-1253-de54-a295b3bab2cc@linaro.org>
 <SEZPR06MB5269E7B8785B3CB56A63A916F2B39@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <a3615fe7-aa2a-53e9-2732-ba4512b9369d@linaro.org>
In-Reply-To: <a3615fe7-aa2a-53e9-2732-ba4512b9369d@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|SI2PR06MB4522:EE_
x-ms-office365-filtering-correlation-id: 66f8ada7-40ce-4f8a-a32b-08db1bd05c6c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  8kcWaSQHMxzQlSfnSYoiJzrmX9/vz5yIsPEBdY38bVzPD8OC4T0PtnoL5fJRqBvzLPbHSFCHJ2kor6bS4NxVCIk6YAM1sY7oCLS9ccwRBjk1dUhJHzlHemCLgMS8BjuVEygzsfXE7jCIAJA3y7BUDrhyMioZEa/3ywVaeAbukmn2McWaba39lpbdJu+3X1ot3Il0wyvuQ8sksbccDo3lrH/9Egd0/kUIeoiB+K9r7Or87N7gg6WGpy7uXG74TtHMles2B2yw7u8Ub+k8OHcznnyr0JOkLvfjcxe3WIKHbAkYK0vqAxOKoQ01n6R0Ba1P+PCUJF57RjUHYDBZVnOwLRGryb9rf1GZKmbK8PEtC0vyEj3xkzsNV2HS5crZZ/1f6JeichVjLqTGou2VT7Urg+Hp1GPknWv3YfirDFOc5Ta2rKGU+3Pb1cxfR8DC2fgs+Qr8IDc+RsoMERslqB/uflsWhmoMgPVNE2mbsIJuuO9GOmbuSHvrXClpwziDqo697v1R96dUi2SIJPFD3tT/3DYRSHpDg/ZytwivAJ9nmW0pxG0JYq8jfeJ/I5UPd2AbKGAvGaIYsB2u+F/WsshE76PmAr8Llq6DINSrDcS8Uz23y3678bnVSnOvipRhQnCcqMwIX13olgsfnmZ7hy+g6onnDAhFtHecZaMQ9IX7oIRQTn6Hm2o1wsW7C/YBzUxw
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39850400004)(346002)(136003)(366004)(376002)(396003)(451199018)(38100700002)(122000001)(33656002)(86362001)(66556008)(66476007)(66946007)(66446008)(41300700001)(8936002)(55016003)(8676002)(7416002)(64756008)(5660300002)(4326008)(110136005)(7696005)(76116006)(53546011)(26005)(9686003)(186003)(6506007)(83380400001)(71200400001)(2906002)(478600001)(54906003)(52536014)(316002)(966005)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bjQvUFc3QXFZbzUyc0RxR1JyVkVOTUtWV3dpbXFFVWFBeEVZZFQ4NWNEcElp?=
 =?utf-8?B?Rko5SFIvQWRuMHFycUhuWmZuZTBvNmlpMnF6enNHTnU0ZTVSSXpGQzFqd2Nt?=
 =?utf-8?B?enhHYmNwcTc3dm5lSjNhWkpvWm9IY1h3a3hkUE5FcVFEd0pLMUpDTWV0ZEdq?=
 =?utf-8?B?WWhkRm03RnBLZ3dYSjJVek56UUJaM1hVOUxFR0k3Mm5wNHNmK1B1cUREQ2Vs?=
 =?utf-8?B?VEJkWWNNNnhhMEFSUk9nZU96SWkvM01VUlBnTXhBY2pkdmpIanZuV3B2QTRS?=
 =?utf-8?B?WWpvREloU2toT3hLaUZEdEdic014ZFRkWkRSTlpWTU9yM1lmUFkrM0ZJekxH?=
 =?utf-8?B?NGt2V1RRRXFFZXZ4ZS9QTWNsVDZDcG1wY2JHUVlzZmdNNVlyTFpBbmN5ekRU?=
 =?utf-8?B?WEZkdXcyc3FvQzlmZXRWRXErL1cybzNsVGszd3hjZ0JidHNMbnRmWHdIQm5I?=
 =?utf-8?B?cm1ET1V6aXpKUjJNMVpDNTNZYWNOVTNCVHduS3lIMkFqdnNPOUsxVWpsc3FB?=
 =?utf-8?B?a0FXNjZCMW5LWWIybWpuaGFGNVRBMTBoeWRuRVppNXphdzdWay9PV25PL0pF?=
 =?utf-8?B?SnoxTks4MjlZcmJEZW5jbUJoaDdSNzlVNktBQmFOZHFaSjdDSFMxL21OaWVm?=
 =?utf-8?B?OFZaR1lIYnVDKzI2THZOV2Z0ME0wcDVVN2RIdEJHMi9BRXdjRFZGMEJ4WnEw?=
 =?utf-8?B?SU85K1M5Q1hVVnRlWWhmMW96L1dXYXpwdHB2R0ZjY1Y2bzEyVVFqUkE5MWxF?=
 =?utf-8?B?T29wREMzRkNLNnJhQ0tGakQvNFU4RTE4dFlneGppVC9HVGphaWpld0psWGNT?=
 =?utf-8?B?c2tPc3FYcm10eDI3QXBqU3V4K1BnY2RSQnpGZTlGUmEzL0NTNlh6U2pBQ3p5?=
 =?utf-8?B?Q0JwZ2puZzZjMnhqRG9NOVJmQTAvcTRYYjRBVU1DNDNUdVpwdGFwVHFqb0hF?=
 =?utf-8?B?NUNzWGxpNURsZ0gyVjhYbjJBbE81bnFEbmZONis1UE5QUGFBVllIRmdmUWpX?=
 =?utf-8?B?blVOUEIwRmlMcWxHRUF6TUM2QkZxT1Z0WTFVRk53S0NYQWFmSUtobmwrRzJv?=
 =?utf-8?B?bVMzSEVBdEZJS2w0V2ZVLzlYS0Y0aHphNnZtdFo0TVJkQlRPak42Z1RQSFZv?=
 =?utf-8?B?ZlB1ZERVSkFEczdlTHpMV3QrRGlscDQ2OTZ2WnN4SVZRRFBVdjFFNEREODBy?=
 =?utf-8?B?aUJRMWVoWCs0ZU1IVGRTYzZ5WEdaaytmbGJuaitUbTFVY2w3M2ZMYWEzUkw1?=
 =?utf-8?B?bVV0ekJIR0krU2UvdnZCUDF4eVVBMGM5TUFmZmhqYUxwZTdlQnZ5QW1tT1hU?=
 =?utf-8?B?a0NId1pNNUQ0TGJSc0J0MHp6Y1RCV3lqOWJ0b0Q0N2tCZ1RSTkFtUjJ6b3M3?=
 =?utf-8?B?TFVnRHhDK3NZbjlabXdCemJ5NzUzbE42NzgrVlhUYWxvOVN5RzYrejQwK2dS?=
 =?utf-8?B?YjQ2SGZiOENydUVLNzlnWDNhRFU5WkExQ1lpNUt0N3BtRjhTZkx2R25ha2tz?=
 =?utf-8?B?V1RHd1hYYlBkdHhHUjNHb2JvUEVVdmQ0dVlvaXJXdTNYek1mcWVqOVhUc2xR?=
 =?utf-8?B?Wmd6OFZBdmxTNDREMmYxb1I5ZnhQRXRDa3V3RkY5SnNCQk1zSnZIRmNaRTd2?=
 =?utf-8?B?ZGdBd3JjK0lybUhpU3lYNW9VNXo0R0dVemJFTEtWbjQ4VUg3TWhtRFRrdVJR?=
 =?utf-8?B?RnIrNFFWKzN2alhmaVFwZmdrRmt6cWV5Q0RNTHpEdHJ0Sk80d0tEcGtiRDVu?=
 =?utf-8?B?VG9VcitTaVN0ZHZDWXFYTlJFTy9vM1NtWFRGdnNnOHY3bjVoMkxkMC9HS3pT?=
 =?utf-8?B?RmhLMXpmY01FaHdOVkN1SHlDeXBSZEY3d21URUorMDlVbjNXZ3o4TGxVNmdz?=
 =?utf-8?B?WFB6djVVTnQ1V3VtNHRDQ2xZQkd0ZWJCNVduNExobnBJa1JydWliRHovejR4?=
 =?utf-8?B?RGZNZXhUVXhCODlCZS9iSzhjaGZSMTNMTmhrRGU4T2liY3NqSVV2aWh1bmJs?=
 =?utf-8?B?WUVGVkhOVElnWnYwR0llU0ZZYlVsNll3c0NwekFZQWZaazQyaVVhQkg2bWNE?=
 =?utf-8?B?SktOZWFTQTErU2ZMS3ZWUm9jaGdKUzBVU3BRNDUzcjhYelFGZ3g5ZXBybGVW?=
 =?utf-8?Q?F2mJmXxzoVSMHmvwaCwUXSjhg?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f8ada7-40ce-4f8a-a32b-08db1bd05c6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2023 10:16:32.0515
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C4WF7GTweq5QDNKApYeYLBGmafVXT8BkunoQJBA7WN5Zvmd4vsi0bi4cc3SAJ9E+qlLpxd5Qu1JblrEPFNFYrst+h5riYsax22w1PI4dBNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4522
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
U2VudDogRnJpZGF5LCBNYXJjaCAzLCAyMDIzIDU6MjYgUE0NCj4gVG86IFJ5YW4gQ2hlbiA8cnlh
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
OiBbUEFUQ0ggdjYgMS8yXSBkdC1iaW5kaW5nczogaTJjOiBhc3BlZWQ6IHN1cHBvcnQgZm9yDQo+
IEFTVDI2MDAtaTJjdjINCj4gDQo+IE9uIDAzLzAzLzIwMjMgMDk6NTUsIFJ5YW4gQ2hlbiB3cm90
ZToNCj4gPiBIZWxsbyBLcnp5c3p0b2YsDQo+ID4NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296
bG93c2tpQGxpbmFyby5vcmc+DQo+ID4+IFNlbnQ6IEZyaWRheSwgTWFyY2ggMywgMjAyMyA0OjUx
IFBNDQo+ID4+IFRvOiBSeWFuIENoZW4gPHJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT47IFdvbGZy
YW0gU2FuZw0KPiA+PiA8d3NhQGtlcm5lbC5vcmc+DQo+ID4+IENjOiBKb2VsIFN0YW5sZXkgPGpv
ZWxAam1zLmlkLmF1PjsgQnJlbmRhbiBIaWdnaW5zDQo+ID4+IDxicmVuZGFuLmhpZ2dpbnNAbGlu
dXguZGV2PjsgS3J6eXN6dG9mIEtvemxvd3NraQ0KPiA+PiA8a3J6eXN6dG9mLmtvemxvd3NraStk
dEBsaW5hcm8ub3JnPjsgQW5kcmV3IEplZmZlcnkNCj4gPj4gPGFuZHJld0Bhai5pZC5hdT47IGRl
dmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBQaGlsaXBwIFphYmVsDQo+ID4+IDxwLnphYmVsQHBl
bmd1dHJvbml4LmRlPjsgUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz47DQo+IEJlbmph
bWluDQo+ID4+IEhlcnJlbnNjaG1pZHQgPGJlbmhAa2VybmVsLmNyYXNoaW5nLm9yZz47DQo+ID4+
IGxpbnV4LWFzcGVlZEBsaXN0cy5vemxhYnMub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmc7DQo+ID4+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IG9wZW5ibWNA
bGlzdHMub3psYWJzLm9yZzsNCj4gPj4gbGludXgtaTJjQHZnZXIua2VybmVsLm9yZw0KPiA+PiBT
dWJqZWN0OiBSZTogW1BBVENIIHY2IDEvMl0gZHQtYmluZGluZ3M6IGkyYzogYXNwZWVkOiBzdXBw
b3J0IGZvcg0KPiA+PiBBU1QyNjAwLWkyY3YyDQo+ID4+DQo+ID4+IE9uIDAzLzAzLzIwMjMgMDk6
MjgsIFJ5YW4gQ2hlbiB3cm90ZToNCj4gPj4+IEhlbGxvIEtyenlzenRvZiwNCj4gPj4+DQo+ID4+
Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4+PiBGcm9tOiBLcnp5c3p0b2YgS296
bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+ID4+Pj4gU2VudDogRnJp
ZGF5LCBNYXJjaCAzLCAyMDIzIDQ6MjAgUE0NCj4gPj4+PiBUbzogUnlhbiBDaGVuIDxyeWFuX2No
ZW5AYXNwZWVkdGVjaC5jb20+OyBXb2xmcmFtIFNhbmcNCj4gPj4+PiA8d3NhQGtlcm5lbC5vcmc+
DQo+ID4+Pj4gQ2M6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+OyBCcmVuZGFuIEhpZ2dp
bnMNCj4gPj4+PiA8YnJlbmRhbi5oaWdnaW5zQGxpbnV4LmRldj47IEtyenlzenRvZiBLb3psb3dz
a2kNCj4gPj4+PiA8a3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3JnPjsgQW5kcmV3IEpl
ZmZlcnkNCj4gPj4+PiA8YW5kcmV3QGFqLmlkLmF1PjsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5v
cmc7IFBoaWxpcHAgWmFiZWwNCj4gPj4+PiA8cC56YWJlbEBwZW5ndXRyb25peC5kZT47IFJvYiBI
ZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+Ow0KPiA+Pj4+IEJlbmphbWluIEhlcnJlbnNjaG1p
ZHQgPGJlbmhAa2VybmVsLmNyYXNoaW5nLm9yZz47DQo+ID4+Pj4gbGludXgtYXNwZWVkQGxpc3Rz
Lm96bGFicy5vcmc7DQo+ID4+Pj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn
Ow0KPiA+Pj4+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IG9wZW5ibWNAbGlzdHMub3ps
YWJzLm9yZzsNCj4gPj4+PiBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnDQo+ID4+Pj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2NiAxLzJdIGR0LWJpbmRpbmdzOiBpMmM6IGFzcGVlZDogc3VwcG9ydCBm
b3INCj4gPj4+PiBBU1QyNjAwLWkyY3YyDQo+ID4+Pj4NCj4gPj4+PiBPbiAwMS8wMy8yMDIzIDA2
OjU3LCBSeWFuIENoZW4gd3JvdGU6DQo+ID4+Pj4+IEhlbGxvIEtyenlzenRvZiwNCj4gPj4+Pj4N
Cj4gPj4+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+Pj4+PiBGcm9tOiBLcnp5
c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+ID4+Pj4+
PiBTZW50OiBNb25kYXksIEZlYnJ1YXJ5IDI3LCAyMDIzIDQ6MjUgUE0NCj4gPj4+Pj4+IFRvOiBS
eWFuIENoZW4gPHJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT47IEFuZHJldyBKZWZmZXJ5DQo+ID4+
Pj4+PiA8YW5kcmV3QGFqLmlkLmF1PjsgQnJlbmRhbiBIaWdnaW5zIDxicmVuZGFuLmhpZ2dpbnNA
bGludXguZGV2PjsNCj4gPj4+Pj4+IEJlbmphbWluIEhlcnJlbnNjaG1pZHQgPGJlbmhAa2VybmVs
LmNyYXNoaW5nLm9yZz47IEpvZWwgU3RhbmxleQ0KPiA+Pj4+Pj4gPGpvZWxAam1zLmlkLmF1Pjsg
Um9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz47IEtyenlzenRvZg0KPiA+Pj4+Pj4gS296
bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc+OyBQaGlsaXBwIFphYmVs
DQo+ID4+Pj4+PiA8cC56YWJlbEBwZW5ndXRyb25peC5kZT47IGxpbnV4LWkyY0B2Z2VyLmtlcm5l
bC5vcmc7DQo+ID4+Pj4+PiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc7IGRldmljZXRyZWVAdmdl
ci5rZXJuZWwub3JnOw0KPiA+Pj4+Pj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnOw0KPiA+Pj4+Pj4gbGludXgtYXNwZWVkQGxpc3RzLm96bGFicy5vcmc7IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmcNCj4gPj4+Pj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjYgMS8yXSBk
dC1iaW5kaW5nczogaTJjOiBhc3BlZWQ6IHN1cHBvcnQgZm9yDQo+ID4+Pj4+PiBBU1QyNjAwLWky
Y3YyDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gT24gMjYvMDIvMjAyMyAwNDoxMywgUnlhbiBDaGVuIHdy
b3RlOg0KPiA+Pj4+Pj4+IEFkZCBhc3QyNjAwLWkyY3YyIGNvbXBhdGlibGUgYW5kIGFzcGVlZCxn
bG9iYWwtcmVncywNCj4gPj4+Pj4+PiBhc3BlZWQsdGltZW91dCBhc3BlZWQseGZlci1tb2RlIGRl
c2NyaXB0aW9uIGZvciBhc3QyNjAwLWkyY3YyLg0KPiA+Pj4+Pj4+DQo+ID4+Pj4+Pj4gU2lnbmVk
LW9mZi1ieTogUnlhbiBDaGVuIDxyeWFuX2NoZW5AYXNwZWVkdGVjaC5jb20+DQo+ID4+Pj4+Pj4g
LS0tDQo+ID4+Pj4+Pj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9hc3BlZWQsaTJjLnlh
bWwgICB8IDQ0DQo+ID4+Pj4gKysrKysrKysrKysrKysrKysrKw0KPiA+Pj4+Pj4+ICAxIGZpbGUg
Y2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKQ0KPiA+Pj4+Pj4+DQo+ID4+Pj4+Pj4gZGlmZiAtLWdp
dA0KPiA+Pj4+Pj4+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9hc3Bl
ZWQsaTJjLnlhbWwNCj4gPj4+Pj4+PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9pMmMvYXNwZWVkLGkyYy55YW1sDQo+ID4+Pj4+Pj4gaW5kZXggZjU5N2Y3M2NjZDg3Li43NWRl
M2NlNDFjZjUgMTAwNjQ0DQo+ID4+Pj4+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2kyYy9hc3BlZWQsaTJjLnlhbWwNCj4gPj4+Pj4+PiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2FzcGVlZCxpMmMueWFtbA0KPiA+Pj4+Pj4+IEBA
IC00OSw2ICs0OSwyNSBAQCBwcm9wZXJ0aWVzOg0KPiA+Pj4+Pj4+ICAgICAgZGVzY3JpcHRpb246
DQo+ID4+Pj4+Pj4gICAgICAgIHN0YXRlcyB0aGF0IHRoZXJlIGlzIGFub3RoZXIgbWFzdGVyIGFj
dGl2ZSBvbiB0aGlzIGJ1cw0KPiA+Pj4+Pj4+DQo+ID4+Pj4+Pj4gKyAgYXNwZWVkLHRpbWVvdXQ6
DQo+ID4+Pj4+Pj4gKyAgICB0eXBlOiBib29sZWFuDQo+ID4+Pj4+Pj4gKyAgICBkZXNjcmlwdGlv
bjogSTJDIGJ1cyB0aW1lb3V0IGVuYWJsZSBmb3IgbWFzdGVyL3NsYXZlIG1vZGUNCj4gPj4+Pj4+
DQo+ID4+Pj4+PiBOb3RoaW5nIGltcHJvdmVkIGhlcmUgaW4gcmVnYXJkcyB0byBteSBsYXN0IGNv
bW1lbnQuDQo+ID4+Pj4+DQo+ID4+Pj4+IFllcywgYXMgSSBrbm93IHlvdXIgcmVxdWlyZSBpcyBh
Ym91dCAiIERUIGJpbmRpbmcgdG8gcmVwcmVzZW50DQo+ID4+Pj4+IGhhcmR3YXJlDQo+ID4+Pj4g
c2V0dXAiDQo+ID4+Pj4+IFNvIEkgYWRkIG1vcmUgZGVzY3JpcHRpb24gYWJvdXQgYXNwZWVkLHRp
bWVvdXQgYXMgYmxvdy4NCj4gPj4+Pj4NCj4gPj4+Pj4gQVNQRUVEIFNPQyBjaGlwIGlzIHNlcnZl
ciBwcm9kdWN0LCBpMmMgYnVzIG1heSBoYXZlIGZpbmdlcnByaW50DQo+ID4+Pj4+IGNvbm5lY3Qg
dG8NCj4gPj4+PiBhbm90aGVyIGJvYXJkLiBBbmQgYWxzbyBzdXBwb3J0IGhvdHBsdWcuDQo+ID4+
Pj4+IFRoZSBmb2xsb3dpbmcgaXMgYm9hcmQtc3BlY2lmaWMgZGVzaWduIGV4YW1wbGUuDQo+ID4+
Pj4+IEJvYXJkIEEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJvYXJk
IEINCj4gPj4+Pj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAgICAgICAgICAgICAgICAgICAg
ICAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4+Pj4+IHxpMmMgYnVzIzEobWFzdGVyL3Ns
YXZlKSAgPD09PWZpbmdlcnByaW50ID09PT4gaTJjIGJ1cyN4DQo+IChtYXN0ZXIvc2xhdmUpfA0K
PiA+Pj4+PiB8aTJjIGJ1cyMyKG1hc3RlciktPiB0bXAgaTJjIGRldmljZSB8ICAgICAgICAgIHwN
Cj4gPj4+PiB8DQo+ID4+Pj4+IHxpMmMgYnVzIzMobWFzdGVyKS0+IGFkYyBpMmMgZGV2aWNlIHwg
ICAgICAgICAgfA0KPiA+Pj4+IHwNCj4gPj4+Pj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAg
ICAgICAgICAgICAgICAgICAgICAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4+Pj4+DQo+
ID4+Pj4+IGFzcGVlZCx0aW1vdXQgcHJvcGVyaXRlczoNCj4gPj4+Pj4gRm9yIGV4YW1wbGUgSTJD
IGNvbnRyb2xsZXIgYXMgc2xhdmUgbW9kZSwgYW5kIHN1ZGRlbmx5DQo+IGRpc2Nvbm5lY3RlZC4N
Cj4gPj4+Pj4gU2xhdmUgc3RhdGUgbWFjaGluZSB3aWxsIGtlZXAgd2FpdGluZyBmb3IgbWFzdGVy
IGNsb2NrIGluIGZvcg0KPiA+Pj4+PiByeC90eA0KPiA+PiB0cmFuc21pdC4NCj4gPj4+Pj4gU28g
aXQgbmVlZCB0aW1lb3V0IHNldHRpbmcgdG8gZW5hYmxlIHRpbWVvdXQgdW5sb2NrIGNvbnRyb2xs
ZXIgc3RhdGUuDQo+ID4+Pj4+IEFuZCBpbiBhbm90aGVyIHNpZGUuIEluIE1hc3RlciBzaWRlIGFs
c28gbmVlZCBhdm9pZCBzdWRkZW5seSBzbGF2ZQ0KPiA+Pj4+IG1pc3ModW4tcGx1ZyksIE1hc3Rl
ciB3aWxsIHRpbWVvdXQgYW5kIHJlbGVhc2UgdGhlIFNEQS9TQ0wuDQo+ID4+Pj4+DQo+ID4+Pj4+
IERvIHlvdSBtZWFuIGFkZCB0aG9zZSBkZXNjcmlwdGlvbiBpbnRvIG9yZSBhc3BlZWQsdGltb3V0
DQo+ID4+Pj4+IHByb3Blcml0ZXMNCj4gPj4+PiBkZXNjcmlwdGlvbj8NCj4gPj4+Pg0KPiA+Pj4+
IFlvdSBhcmUgZGVzY3JpYmluZyBoZXJlIG9uZSBwYXJ0aWN1bGFyIGZlYXR1cmUgeW91IHdhbnQg
dG8gZW5hYmxlDQo+ID4+Pj4gaW4gdGhlIGRyaXZlciB3aGljaCBsb29rcyBub24tc2NhbGFibGUg
YW5kIG1vcmUgZGlmZmljdWx0IHRvDQo+IGNvbmZpZ3VyZS91c2UuDQo+ID4+Pj4gV2hhdCBJIHdh
cyBsb29raW5nIGZvciBpcyB0byBkZXNjcmliZSB0aGUgYWN0dWFsIGNvbmZpZ3VyYXRpb24geW91
IGhhdmUNCj4gKGUuZy4NCj4gPj4+PiBtdWx0aS1tYXN0ZXIpIHdoaWNoIGxlYWRzIHRvIGVuYWJs
ZSBvciBkaXNhYmxlIHN1Y2ggZmVhdHVyZSBpbiB5b3VyDQo+ID4+IGhhcmR3YXJlLg0KPiA+Pj4+
IEVzcGVjaWFsbHkgdGhhdCBib29sIHZhbHVlIGRvZXMgbm90IHNjYWxlIGxhdGVyIHRvIGFjdHVh
bCB0aW1lb3V0DQo+ID4+Pj4gdmFsdWVzIGluIHRpbWUgKG1zKS4uLg0KPiA+Pj4+DQo+ID4+Pj4g
SSBkb24ndCBrbm93IEkyQyB0aGF0IG11Y2gsIGJ1dCBJIHdvbmRlciAtIHdoeSB0aGlzIHNob3Vs
ZCBiZQ0KPiA+Pj4+IHNwZWNpZmljIHRvIEFzcGVlZCBJMkMgYW5kIG5vIG90aGVyIEkyQyBjb250
cm9sbGVycyBpbXBsZW1lbnQgaXQ/DQo+ID4+Pj4gSU9XLCB0aGlzIGxvb2tzIHF1aXRlIGdlbmVy
aWMgYW5kIGV2ZXJ5IEkyQyBjb250cm9sbGVyIHNob3VsZCBoYXZlDQo+ID4+Pj4gaXQuIEFkZGlu
ZyBpdCBzcGVjaWZpYyB0byBBc3BlZWQgc3VnZ2VzdHMgdGhhdCBlaXRoZXIgd2UgbWlzcyBhDQo+
ID4+Pj4gZ2VuZXJpYyBwcm9wZXJ0eSBvciB0aGlzIHNob3VsZCBub3QgYmUgaW4gRFQgYXQgYWxs
IChiZWNhdXNlIG5vIG9uZQ0KPiA+Pj4+IGVsc2UgaGFzDQo+ID4+IGl0Li4uKS4NCj4gPj4+Pg0K
PiA+Pj4+IEFsc28gSSB3b25kZXIsIHdoeSB5b3Ugd291bGRuJ3QgZW5hYmxlIHRpbWVvdXQgYWx3
YXlzLi4uDQo+ID4+Pj4NCj4gPj4+PiArQ2MgV29sZnJhbSwNCj4gPj4+PiBNYXliZSB5b3Uga25v
dyB3aGV0aGVyIGJvb2wgInRpbWVvdXQiIHByb3BlcnR5IGZvciBvbmUgY29udHJvbGxlcg0KPiA+
Pj4+IG1ha2VzIHNlbnNlPyBXaHkgd2UgZG8gbm90IGhhdmUgaXQgZm9yIGFsbCBjb250cm9sbGVy
cz8NCj4gPj4+Pg0KPiA+Pj4gQmVjYXVzZSwgaTJjIGJ1cyBkaWRu4oCZdCBzcGVjaWZpYyB0aW1l
b3V0Lg0KPiA+Pj4gQnV0IFNNQnVzIGRlZmluZXMgYSBjbG9jayBsb3cgdGltZS1vdXQsIFRJTUVP
VVQgb2YgMzUgbXMuDQo+ID4+Pg0KPiA+Pj4gSXQgaGF2ZSBkZWZpbml0aW9uIGluIFNNQnVzIHNw
ZWNpZmljYXRpb24uDQo+ID4+PiBodHRwOi8vc21idXMub3JnL3NwZWNzL1NNQnVzXzNfMV8yMDE4
MDMxOS5wZGYNCj4gPj4+IFlvdSBjYW4gY2hlY2sgUGFnZSAxOCwgTm90ZTMgdGhhdCBoYXZlIHRp
bWVvdXQgZGVzY3JpcHRpb24uDQo+ID4+DQo+ID4+IFRoZW4geW91IGhhdmUgYWxyZWFkeSBwcm9w
ZXJ0eSBmb3IgdGhpcyAtICJzbWJ1cyI/DQo+ID4gVG8gYmUgYSBwcm9wZXJ0eSAic21idXMiLCB0
aGF0IHdvdWxkIGJlIGEgYmlnIHRvcGljLCBJIHNhdyBmc2wgaTJjDQo+ID4gYWxzbyBoYXZlIHRo
aXMuDQo+ID4gaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2IvbWFzdGVyL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZQ0KPiA+IC9iaW5kaW5ncy9pMmMvaTJjLW1wYy55YW1sI0w0
My1MNDcNCj4gPiBTbywgSSBqdXN0IHRoaW5rIHRoZSAidGltZW91dCIgcHJvcGVydHkuDQo+IA0K
PiBZZWFoIGFuZCB0aGlzIGlzIHRoZSBvbmx5IHBsYWNlLiBJdCBhbHNvIGRpZmZlcnMgYmVjYXVz
ZSBpdCBhbGxvd3MgYWN0dWFsDQo+IHRpbWVvdXQgdmFsdWVzLg0KVGhhbmtzLCBTbyBjYW4gSSBz
dGlsbCBrZWVwIHRoZSBwcm9wZXJ0eSAiYXNwZWVkLHRpbWVvdXQiIGhlcmU/DQpJdCBpcyB0aGUg
b25seSBwbGFjZS4gDQoNCkJlc3QgcmVnYXJkcywNClJ5YW4gQ2hlbg0KDQo=
