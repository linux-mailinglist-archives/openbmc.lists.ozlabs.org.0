Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC3A52E2F7
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 05:16:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4Bhy6kmnz3bkf
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 13:16:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=iyioPd1M;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:704b::709;
 helo=apc01-tyz-obe.outbound.protection.outlook.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=iyioPd1M; 
 dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20709.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::709])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4BhS1Xrvz2y8F;
 Fri, 20 May 2022 13:16:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilQX7d6epA3Q8wP57oXseMQoQu/h7ITUUG2dqry/hvhNlFqHH18O7WPkGh5Yz+143sz4kmRORH7ikkVGvjwPdaE0K8NCpN43pKFt7MoeJn5meCam2lRepJy8XE945W64oVlRdNZPImC/YqO/pXNwOb02KXZW1OdSscx0OYM3qMyLDMIpgfjbGm66U5Sk55ZkU+pJ/13u4ink8YAld2ckD/A8oDx9XXUu20wY9e2Pt+l9sUUsfR8wcVRw2mh0izJaVfIX8t81AYUnLH6q7GoKtKxA2+metyZysmL6qdWkILfcCCzmY7lU5AIGCADOW1bJ/sTWcNx6Am97vEidMEGfTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Ev0FCqBik8XC8V3ZnwYvthVk1pI4e9qsYrwFHZY/Hg=;
 b=UpRo5CCZ+WReoV+OcqRFlO4HByP8r6KE3gEoo07zBsw1MpB27XHam7ANTvHNrMZxgBPPZ77SZRz/+6lyCqDsviBwkKgYgbxrbwC07jzf8I5UlA+ioDE6bQPTobSdaGziUnzf8cKCgGr0MCiYuX8Oq3mcqcfutB6a7YwbSJe6Mq/IfBE8qAdoHGGsMz1sFaLzwr7DXHC9+qVDJmjMK0jSfrqwcFxBavORo8lSXFblMp0pPyJoB7iIR7D5fPDq9FkBvx17zhxaZKjWAj16HnkmTkL0OGOSqOnLV1RzWohSHcajb3pHY8K1NblXEyKdDnV5X6yMwCEXTC/Q7AtMzvMUug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Ev0FCqBik8XC8V3ZnwYvthVk1pI4e9qsYrwFHZY/Hg=;
 b=iyioPd1MEq/2/RLbmncrDxz34oXlTBcQ+QL8DFOytA27Qkbke1F/Lzoxm+H7nHwzg1pAi91bGx+tXvF9Zmycy7MSjSn0cKGgY25u2X5PQwjaYIPgcgmQ32hzYlWrYwWVFjJorJntBz2Es3jtnBF8GfuyxkyrvIhrRFspiF2K7NWuldyda6AhtqllJnWtCBGutvB8dH6ru+bvYSfZHVXL7/7KKvL6n/ahpyGGkbsDk8NPZJwa/nnH0cIYeFLEXbn/lor+tTqt1g6hcR2Rm+e7DprmXzn+vc3sZavsRYTSQOulXjtiT6WeXnCYumFI1z9VxF24Ru8nU/jjapm6HjqK6Q==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by HK2PR06MB3505.apcprd06.prod.outlook.com (2603:1096:202:35::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.16; Fri, 20 May
 2022 03:16:00 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8588:9527:6e72:69c2]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8588:9527:6e72:69c2%6]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 03:15:59 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Peter Delevoryas <pdel@fb.com>
Subject: RE: [PATCH v3 0/3] Add ASPEED AST2600 I2C new controller driver
Thread-Topic: [PATCH v3 0/3] Add ASPEED AST2600 I2C new controller driver
Thread-Index: AQHYaPELfXUHpGiIjU+wemSHG6ilNa0moycAgABySECAAASIgIAAA8ig
Date: Fri, 20 May 2022 03:15:59 +0000
Message-ID: <SEZPR06MB526963377857C6749D00C97CF2D39@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20220516064900.30517-1-ryan_chen@aspeedtech.com>
 <DDAAA045-3BDE-4712-A6CC-B1A52713634A@fb.com>
 <SEZPR06MB52697491CF6D06ECB85F0FB7F2D39@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <A553E632-F534-4823-BC50-89408294DB5F@fb.com>
In-Reply-To: <A553E632-F534-4823-BC50-89408294DB5F@fb.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e0851759-4782-445c-5ec0-08da3a0f1052
x-ms-traffictypediagnostic: HK2PR06MB3505:EE_
x-microsoft-antispam-prvs: <HK2PR06MB3505AA87C767E4DC32E6AB50F2D39@HK2PR06MB3505.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KhNnw0aEuie+3Vy6B/OdxMawIvGdOhKNyGPpJOOw5kRCCZzolYfN6Xa4DZoAscR0YIh/wmtZEdDpvUHI+s3kn/sBVT36+Lu3MDwoPfEVoYFrlLqlYpS3IBaHeZm5zqHH09HqwbxpXukCLhq/Ig1uWF/R7bH2g5tRcGMZZ8aDDgvK9rCsCyc8pnRU1YWeLRvKC+iSYj4chbzXBNwS1iTQiqn4VqNbb13eaV2uK4DR/DbzW1CqWpTIlbOAdf3FEAo9v4uuwOf3HKWhy5wh3DY9x29QKaVwdAzUENN/OLlyXLTPGFaEH4zhocmk1JmS2YI6U2grBcS2WBeuqs+heHmsZmF6EgkftFI3e/suRT7OI56xn1lzMM+bYOVFJB7u5sOF7zCWPcpm4lfw2NGfh3yM5OSzH4Al742i1niGfALmSs8z18bWzlNpQlb2xwHWzP4vzwuXRskw+HZbDS59LCDi8EMZ+VCQgGNS+HGM79HJJWVcmhuiZbtNpK6Tg6k0/UVxX9bi478IHQK2Qg3xZ7dpKH8DCo/O4le0xYG7DNFyCI89YmRJe9S2qrqDXOlcz03xFQFOMwqt2QiLXknB7SwKKGL36hlUqEH5qQPQurt5M724gvM+yiis320JjTOyrgYvLWqjj7oUcZOmQL/zD5dox4QUjDTLte1JW5PRrnANQu0R5cG6qs9fi8HFWFYoYykGc3dKEuklz4BfukhsCxCivFoZUoEgtQLYx5GwSI/fiUxdHfSApmQfJ1RZ5V7A/eov7XHBHDwAPUwlalYGO/UbvPpzylsgFg4Sdwh1OUqnvWr76xeLbLcjWUz57F7cOZSSCMO4dc4OOXehDSMvlGZZdg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(39850400004)(396003)(366004)(346002)(376002)(136003)(66476007)(53546011)(66946007)(66446008)(64756008)(6506007)(7696005)(76116006)(2906002)(122000001)(38100700002)(33656002)(186003)(41300700001)(26005)(107886003)(55016003)(9686003)(66556008)(38070700005)(316002)(83380400001)(6916009)(86362001)(508600001)(5660300002)(54906003)(52536014)(966005)(8676002)(4326008)(8936002)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?KzhUS2Yvbk1jQVdyMndMWGdBdCtOS0NVVHBZbThCMDVIQzB5OXVYSkdPdm81?=
 =?utf-8?B?a0ZoUk1WczdCeTVFcTRHdTFVRjBmTlp3VDhLMUVxbFROM2EzM1ZuL1ZYbHR5?=
 =?utf-8?B?MTMyZjVXQ2ZnOUtQa1R2WExqazhiZSt4K3c1OXNGeE1mRjNyK1J3Z0tzQVFC?=
 =?utf-8?B?aVdRYkkvSlpzUmduREJpZkxGME9Zem14R0ZzZnRHUW1EUDdSWVJudFJQUEFU?=
 =?utf-8?B?Q0R3aEs3L0pDYnRMNDI1ejZ4NUxaK2VwbjZvSWZDSmRmNDlxdTZRbVRlSFEy?=
 =?utf-8?B?eVlpaXpUbEFuVVdGOE41VktQcUM2dDQwRWJ6a2tYQzdDTTM5K290THl6QXFi?=
 =?utf-8?B?aVFMcG52Um9sK0RXN1NnL1RXcHRNVVZnSzMraWFpQWlSZlVIeHh0Z2EwWXJL?=
 =?utf-8?B?L3UxZU5FWDhSRUlJaExVRmFnOWZaQ0FpYjgwcGF4ajE5dmViVlhvRjkxUXhV?=
 =?utf-8?B?U3NIVXhXbUFubWRwbm5KT3d1V0RwRUdkakkwVmgvZStFYnhUaGRaeC9jQmxh?=
 =?utf-8?B?bGQyV3p4bWhPS1ZtZjA0TGZCdnFYQlczbkh1cExzeTB0TFRoK0NSN0F1bVdB?=
 =?utf-8?B?T0NCUlp6Ny84WFlyYnlUazQ0TzBmZHNBMUhkZnNhcitEd2poMEdEcDhpOTNv?=
 =?utf-8?B?NWRlam1RSlZOYlpGWmVPdUt1MkFJKzFDNnpsWXVUU3g2WklCaFFUQVlGREJa?=
 =?utf-8?B?bUVLNk9qbDRFZ2Q3eEc1M3hxZnZBZjNiY2RNVjZXK3BCa3hBOTh0OW9BOS80?=
 =?utf-8?B?cG1EczBIaG95VldoRitXOGswRHlXWUEvT2dNVWlwNVg0V29uNEw0OW9XTHI3?=
 =?utf-8?B?VTB5bDNtVmVsaE5HanVpNHdyQnEzWS9kekRQYVZMcGZZQlVrUjdUMzhrNkd4?=
 =?utf-8?B?Tld2Ylg2bm5sTmJUa3dkMEdhRUVoVmVoWkprUlFGY0ZURmhZeExFOXozNzB6?=
 =?utf-8?B?OEFTL1BSZUw1ckdiNG9zbHF6QnJRN29DZnNhbFk1Z3lKWUE2L25DajNJZnhV?=
 =?utf-8?B?VTBCWk9tOWlGZGt6TmZBdmVuOXJMUElPU2V0TTNlYitTLzUzRTJ1Nnp2TzFI?=
 =?utf-8?B?eElWaEZZTHRON09IbDZPQytGVjRBbUFxSVcxUEtHWDRmSUVQZVg2THVPMUt3?=
 =?utf-8?B?VUNYL3JpQ1ZMTHBGVjlRTFBnV05EWUZUYUUwdE9iclhFVjRVV3p5WnpVbXJv?=
 =?utf-8?B?cWpoU3NMSU1qUk1xd0hxYmplZzAwYzJFbnFQTWNuQlcrMk5EU1djY2k2bGtu?=
 =?utf-8?B?dFYxZUNQV2tjU1pZZkpOU2h5bVpoN25UNVVhTkM2Z3BObWNIMU8wamt4U3do?=
 =?utf-8?B?SHR5TFlGTnAvOUJEVHU5WGwvMlVURHJpRmtUbERMaUdDM1BiaGg2MTd6c1lP?=
 =?utf-8?B?SnhXdE1DdGozNHB1ZkU5TDk1K3RpMzdJZDRmclZySlVhMUFqYzFjR2xERWg0?=
 =?utf-8?B?Q243L1FuT3hnNFFCSCsxVlB0N0pYb2c4TGdrVXRvc0JGSldtZlExNTVlWVU4?=
 =?utf-8?B?QVFTaUcrRUFmbDk3YXFpQzNaQ3RIVlcrbmErdmw2SUZCR3lhaEwwVSsrWHEr?=
 =?utf-8?B?b3JPN2RiRUVmNW9PVzJZMEVwbXZmNFJpeTdPTVhBb0UrMWxGc3hTT0U3MzVU?=
 =?utf-8?B?c1ZKbWphcW13UmZEcnlrbE9Pc2xhN0RUS3BrcXVNclpGZ0pjQjd1L1lYUFkr?=
 =?utf-8?B?OElHSDI4enZnU2FtdnhQWkNRcnZ3Z2RWcDg5ckdFYkxpUktPYmhWQmg5UXpM?=
 =?utf-8?B?Rm9kdS9zcVZsZTJGR0oyai9rWnhEOGJSTXExVDNzalNoTHE0VHNpY2JPR2kv?=
 =?utf-8?B?WDNvQjZ6Mm9hNU1IdThTbkgyTGdPYWp4VE44TEFaOXdlS2FJS3JNQVRtaHdS?=
 =?utf-8?B?Zm1va0Q4bElsTDNmRXJicDdFdXlDWUE5dEdTT0gzdDRadEE4TjJxaE04bEFW?=
 =?utf-8?B?bzV0bGF2Z3VaVC9hNzZ3Wk9uRlJmTEk4YlNhZ1FFa0pvcGplUngzM0VITXBU?=
 =?utf-8?B?dEEvNHhqeWNIMWthMitKSHRDSXBRV3VLTnlUbEhlSHFIMjNiMEV5TG1CMnBI?=
 =?utf-8?B?emo1TnJWSXdyS2MxcUJmckgxQjU0VzVucE9nbTVzWjFoNHNnNWc5bjhwSkl2?=
 =?utf-8?B?R1QvbjVxL1dGZktGajY1QThsNStoM2YyeWlaTkJpbUE0ZjdxWHMrbllFV2Na?=
 =?utf-8?B?dCtLZUg3TG5Canp6V3ZMUWI4Z2pReEZ4K2U4UlVmUkxXV21Kb1BxREJQcis3?=
 =?utf-8?B?QlFWRUtMQ3BJZnB0cFFtYlBoOC9xZ2NUdWZhM1MvY1VFSlZlcytKNnpwSzVt?=
 =?utf-8?B?SXJCWEc0QmQ4M2lyV1FFMjVib1NDY3dMTHFmbWdQQzZaUjBuVm9oTWgwUFJC?=
 =?utf-8?Q?xsyoiZDrKGEPL7As=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0851759-4782-445c-5ec0-08da3a0f1052
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2022 03:15:59.8463 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DefCdVLuzoeijAsD+eHBuG115LFOAntPouLto0UbCvYnEuCBZ92M6udMIUdjfLTvPdkdNVM2ZoD1aGsOCuo2nkIaKEt4XKIbu23ZFrPj9Ug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR06MB3505
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC List <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Joel Stanley <joel@jms.id.au>, Philipp Zabel <p.zabel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQZXRlciBEZWxldm9yeWFzIDxw
ZGVsQGZiLmNvbT4NCj4gU2VudDogRnJpZGF5LCBNYXkgMjAsIDIwMjIgMTE6MDIgQU0NCj4gQ2M6
IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+OyBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3QGFq
LmlkLmF1PjsgUGhpbGlwcA0KPiBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT47IGxpbnV4
LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gbGludXgtYXNwZWVkQGxpc3RzLm96
bGFicy5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IE9wZW5CTUMgTGlzdA0KPiA8
b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPjsgQk1DLVNXIDxCTUMtU1dAYXNwZWVkdGVjaC5jb20+
OyBSeWFuDQo+IENoZW4gPHJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT47IFBldGVyIERlbGV2b3J5
YXMgPHBkZWxAZmIuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDAvM10gQWRkIEFTUEVF
RCBBU1QyNjAwIEkyQyBuZXcgY29udHJvbGxlciBkcml2ZXINCj4gDQo+IA0KPiANCj4gPiBPbiBN
YXkgMTksIDIwMjIsIGF0IDc6NDYgUE0sIFJ5YW4gQ2hlbiA8cnlhbl9jaGVuQGFzcGVlZHRlY2gu
Y29tPg0KPiB3cm90ZToNCj4gPg0KPiA+IEhlbGxvLA0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IFBldGVyIERlbGV2b3J5YXMgPHBkZWxAZmIuY29tPg0K
PiA+PiBTZW50OiBGcmlkYXksIE1heSAyMCwgMjAyMiAzOjU2IEFNDQo+ID4+IENjOiBKb2VsIFN0
YW5sZXkgPGpvZWxAam1zLmlkLmF1PjsgQW5kcmV3IEplZmZlcnkgPGFuZHJld0Bhai5pZC5hdT47
DQo+ID4+IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Ow0KPiA+PiBsaW51
eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+ID4+IGxpbnV4LWFzcGVlZEBsaXN0
cy5vemxhYnMub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBPcGVuQk1DDQo+ID4+
IExpc3QgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz47IEJNQy1TVyA8Qk1DLVNXQGFzcGVlZHRl
Y2guY29tPjsNCj4gPj4gUGV0ZXIgRGVsZXZvcnlhcyA8cGRlbEBmYi5jb20+OyBSeWFuIENoZW4N
Cj4gPHJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT4NCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
MyAwLzNdIEFkZCBBU1BFRUQgQVNUMjYwMCBJMkMgbmV3IGNvbnRyb2xsZXINCj4gPj4gZHJpdmVy
DQo+ID4+DQo+ID4+DQo+ID4+DQo+ID4+PiBPbiBNYXkgMTUsIDIwMjIsIGF0IDExOjQ4IFBNLCBy
eWFuX2NoZW4gPHJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT4NCj4gPj4gd3JvdGU6DQo+ID4+Pg0K
PiA+Pj4gVGhpcyBzZXJpZXMgYWRkIEFTVDI2MDAgaTJjIG5ldyByZWdpc3RlciBzZXQgZHJpdmVy
LiBUaGUgaTJjIG5ldw0KPiA+Pj4gcmVnaXN0ZXIgc2V0IGhhdmUgbmV3IGNsb2NrIGRpdmlkZXIg
b3B0aW9uIGZvciBtb3JlIGZsZXhpYWJsZSBnZW5lcmF0aW9uLg0KPiA+Pj4gQW5kIGFsc28gaGF2
ZSBzZXBhcmF0ZSBpMmMgbWFzdGVyIGFuZCBzbGF2ZSByZWdpc3RlciBzZXQgZm9yIGNvbnRyb2wu
DQo+ID4+DQo+ID4+IEhleSBSeWFuLCB0aGFua3MgZm9yIHRoaXMgd29yayEgVGhpcyBpcyBhIGxp
dHRsZSBiaXQgb2ZmLXRvcGljLCBidXQNCj4gPj4gYXJlIHlvdSBvciBhbnlvbmUgZWxzZSBhdCBB
c3BlZWQgd29ya2luZyBvbiBhbiBlcXVpdmFsZW50IFFFTVUgcGF0Y2gNCj4gPj4gc2VyaWVzPyBX
aXRob3V0IGl0LCBJIGRvbuKAmXQgdGhpbmsgUUVNVSB3aWxsIHdvcmsgd2l0aCB0aGlzIHNlcmll
cw0KPiA+PiByaWdodD8gSSB0aGluayBRRU1VIG9ubHkgc3VwcG9ydHMgdGhlIG9sZCByZWdpc3Rl
ciBzZXQgcmlnaHQgbm93Lg0KPiA+Pg0KPiA+IE5vLCB0aGVyZSBhcmUgdHdvIHN1Ym1pdCBpbiBR
RU1VIGFib3V0IGkyYyBuZXcgcmVnaXN0ZXIgbW9kZS4NCj4gPiBPbmUgaXMgQVNQRUVEIHN1Ym1p
dCA6DQo+ID4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L3FlbXUtZGV2ZWwv
bGlzdC8/c2VyaWVzPTYyNjAyOCZhcg0KPiA+IGNoaXZlPWJvdGggQW5vdGhlciBpcyBHT09HTEUg
Og0KPiA+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9xZW11LWRldmVsL2xp
c3QvP3Nlcmllcz02Mjc3MDYmYXINCj4gPiBjaGl2ZT1ib3RoDQo+IA0KPiBPaCBncmVhdCwgdGhh
bmtzLiBJIGp1c3QgdHJpZWQgdGhlIEFzcGVlZCBRRU1VIHNlcmllcyBhbmQgaXQgd29ya2VkIGZv
ciBtZQ0KPiB3aXRoIFplcGh5ciwgdmVyeSBoZWxwZnVsIQ0KVGhhbmtzIHlvdXIgZmVlZGJhY2ss
IGl0IGNoZWNrIG9rLCBwbGVhc2UgbGV0IG1lIGtub3cuDQoNCj4gDQo+ID4NCj4gPj4NCj4gPj4+
DQo+ID4+PiB2MzoNCj4gPj4+IC1maXggaTJjIGdsb2JhbCBjbG9jayBkaXZpZGUgZGVmYXVsdCB2
YWx1ZSAtcmVtb3ZlIGkyYyBzbGF2ZSBubyB1c2VkDQo+ID4+PiBkZXZfZGJnIGluZm8uDQo+ID4+
Pg0KPiA+Pj4gdjI6DQo+ID4+PiAtYWRkIGkyYyBnbG9iYWwgeW1hbCBmaWxlIGNvbW1pdA0KPiA+
Pj4gLXJlbmFtZSBmaWxlIG5hbWUgZnJvbSBuZXcgdG8gYXN0MjYwMC4NCj4gPj4+IGFzcGVlZC1p
MmMtbmV3LWdsb2JhbC5jIC0+IGkyYy1hc3QyNjAwLWdsb2JhbC5jDQo+ID4+PiBhc3BlZWQtaTJj
LW5ldy1nbG9iYWwuaCAtPiBpMmMtYXN0MjYwMC1nbG9iYWwuaCBpMmMtbmV3LWFzcGVlZC5jIC0+
DQo+ID4+PiBpMmMtYXN0MjYwMC5jIC1yZW5hbWUgYWxsIGRyaXZlciBmdW5jdGlvbiBuYW1lIHRv
IGFzdDI2MDANCj4gPj4+DQo+ID4+PiByeWFuX2NoZW4gKDMpOg0KPiA+Pj4gZHQtYmluZGluZ3M6
IGkyYy1hc3QyNjAwOiBBZGQgYmluZGluZ3MgZm9yIEFTVDI2MDAgaTJDIGdsb2JhbA0KPiA+Pj4g
cmVnaXN0ZXIgY29udHJvbGxlcg0KPiA+Pj4gZHQtYmluZGluZ3M6IGkyYy1hc3QyNjAwOiBBZGQg
YmluZGluZ3MgZm9yIEFTVDI2MDAgaTJDIGRyaXZlcg0KPiA+Pj4gaTJjOmFzcGVlZDpzdXBwb3J0
IGFzdDI2MDAgaTJjIG5ldyByZWdpc3RlciBtb2RlIGRyaXZlcg0KPiA+Pj4NCj4gPj4+IC4uLi9p
MmMvYXNwZWVkLGkyYy1hc3QyNjAwLWdsb2JhbC55bWFsIHwgNDQgKw0KPiA+Pj4gLi4uL2JpbmRp
bmdzL2kyYy9hc3BlZWQsaTJjLWFzdDI2MDAueW1hbCB8IDc4ICsNCj4gPj4+IGRyaXZlcnMvaTJj
L2J1c3Nlcy9LY29uZmlnIHwgMTEgKyBkcml2ZXJzL2kyYy9idXNzZXMvTWFrZWZpbGUgfCAxICsN
Cj4gPj4+IGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXN0MjYwMC1nbG9iYWwuYyB8IDk0ICsNCj4g
Pj4+IGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXN0MjYwMC1nbG9iYWwuaCB8IDE5ICsNCj4gPj4+
IGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXN0MjYwMC5jIHwgMTcwMw0KPiA+PiArKysrKysrKysr
KysrKysrKw0KPiA+Pj4gNyBmaWxlcyBjaGFuZ2VkLCAxOTUwIGluc2VydGlvbnMoKykNCj4gPj4+
IGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+Pj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2kyYy9hc3BlZWQsaTJjLWFzdDI2MDAtZ2xvYmFsLnltYWwNCj4gPj4+IGNyZWF0ZSBtb2Rl
IDEwMDY0NA0KPiA+Pj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9hc3Bl
ZWQsaTJjLWFzdDI2MDAueW1hbA0KPiA+Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaTJj
L2J1c3Nlcy9pMmMtYXN0MjYwMC1nbG9iYWwuYw0KPiA+Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXN0MjYwMC1nbG9iYWwuaA0KPiA+Pj4gY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXN0MjYwMC5jDQo+ID4+Pg0KPiA+Pj4gLS0N
Cj4gPj4+IDIuMTcuMQ0KDQo=
