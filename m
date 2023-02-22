Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E2369F2EC
	for <lists+openbmc@lfdr.de>; Wed, 22 Feb 2023 11:48:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMCYJ1d70z3cF7
	for <lists+openbmc@lfdr.de>; Wed, 22 Feb 2023 21:48:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=sJaCekYg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:704b::72f; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=sJaCekYg;
	dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2072f.outbound.protection.outlook.com [IPv6:2a01:111:f403:704b::72f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMCXY24DLz2xHH;
	Wed, 22 Feb 2023 21:47:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MxFzFuzrws+0vXtB1jv6h6jxR+NPvumd0dvtYXsKenU707WWL+ccuNVANS0eBAkZGAiQ/Bt0syQWgiiDw7d6zDW8Tc63iFiMluhRlGkj33RCFRDn6fsHP/3GJ3PhUqXSbvI6xoqYkuqfqqLX6GoXCOILV9IOW1t/vX4Y8grn4ZqcxdsKDdvRrCgu7jqdP5eCkkh+XElxmAlYX8kQMiE/+hKI0Oms7TLJXgLOXGuLzN/34n+oPixeyqC96Xh5kHPWDNxI4pkQ6x7kS25gvnlIc5AB2fcrTclySTFE350hJohFc0jajcZbNV7c8eJrOYOwcN9NJctbHWITzJufA8Mh/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+fApZDrntihhT3tQQMZtOhvMtDqVX5vbhTwPWGbpcjY=;
 b=PQX+Lf1c11Po6NrbV+wUacmWvuNRw4/NGmpE1MwQgHkdaQ6T8d8zt9N4idkc9t+sJzdeJ+gjBbJEH5xPFgqE8AHQuvcMrYLJ/9/svIo4jI6vKJMW+Ftyku+0RzV85+Sr7EY8zypelGZVDBs0Gu6VzIlbj061TFB8GEGQZstGg01RuyI34kudOpA4o0yojU61R35PtDfV3QfujYoPz5C4/nuKoCvZiT19XAcbZoQodS2jRU1H8+Wrd5cAdKffXTnC5nH+PSt0iQNfDyWiaVrurhPE6jb9+76PX47xVn9x3Of3GuJdoefi2eJqM750bi/gLL5gA4NBo283XDEuGn+Gug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+fApZDrntihhT3tQQMZtOhvMtDqVX5vbhTwPWGbpcjY=;
 b=sJaCekYgmpGFlVAHpMirPJT6/CEbwR5BPdksVa+tR6VZKGmNriwbSP6lGczyECkCo35FGiIWrdpIezLPBsWjozC3ychBCuX6r8CKfgtSiJ7wBoylJH7L8fzFvE/7QVa6e/X6FHsOFUiphCoJekr4J52n9+CPllbWdfZKHml/MIeW/oALvSAMV/DtseIZX/feDhHUciVP2FVZd5qZ7wsRIBc8OWQJ1hnCmUmY9LVyN4eX1NBrnxFOoz6atP4X1V6YXSsOZ6E1/XvuqQftYxAZR3lkLnrYMpWVjJ4179qSZvm1OVu9+ZTuKTuaEGcbUupix/hv5Kxlmt+7SM6hyvKwOQ==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB5512.apcprd06.prod.outlook.com (2603:1096:820:bc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.11; Wed, 22 Feb
 2023 10:47:01 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6111.010; Wed, 22 Feb 2023
 10:47:01 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@aj.id.au>, Philipp Zabel <p.zabel@pengutronix.de>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 1/2] dt-bindings: i2c: Add support for ASPEED i2Cv2
Thread-Topic: [PATCH v5 1/2] dt-bindings: i2c: Add support for ASPEED i2Cv2
Thread-Index:  AQHZRPMR/TOuXj0GdEGWPZ2JFslGsK7Xgo8AgAEkZWCAAIA2gIAABk2QgAARNgCAAQdUEIAAXpcAgAAiCSCAAAJCAIAAAIJw
Date: Wed, 22 Feb 2023 10:47:01 +0000
Message-ID:  <SEZPR06MB5269052D7ADCD0D0F939E60DF2AA9@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230220061745.1973981-1-ryan_chen@aspeedtech.com>
 <20230220061745.1973981-2-ryan_chen@aspeedtech.com>
 <676c7777-635c-cc1f-b919-d33e84a45442@linaro.org>
 <TYZPR06MB527427ADCCD29DFD77FB0EE3F2A59@TYZPR06MB5274.apcprd06.prod.outlook.com>
 <80d873d4-d813-6c25-8f47-f5ff9af718ec@linaro.org>
 <SEZPR06MB5269502D7CBCD5698B65FF9FF2A59@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <c0ac0ab3-87fc-e74a-b4e2-3cf1b3a8a5e2@linaro.org>
 <SEZPR06MB52698CCA6AE59DDC6C15CBE4F2AA9@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <94238c42-1250-4d51-86e5-0a960dea0ffc@linaro.org>
 <SEZPR06MB52696835ED8E2709D6A454DAF2AA9@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <b7ca24ea-a265-81cb-3da6-19f938b35878@linaro.org>
In-Reply-To: <b7ca24ea-a265-81cb-3da6-19f938b35878@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|KL1PR0601MB5512:EE_
x-ms-office365-filtering-correlation-id: 26cb19f1-3145-4a7f-f3bd-08db14c22109
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  uyxEtTux7RkzRmezETaRFGbB2nBG+703uf0f6leadme0B7u/oG5bWU5Lq/a3Xx/w7K3AaJQ12TLZ6t5HC4Dg4elRIiEs8xy149leg7W6Wk5DIXfp5gueTlmDQQ3x7T7c5Tb7XK3Gn/TGL5m9F3oYv13TtHCBUKB8I0CAy1GHD58G4UOcZTsRDcOTfb4XTU4xdLretyxQeUHy6LDez5SnKJNlc7T/JqtUxVxB6YcclFPjzEbkfAsX5ua371mQKuR4q+1SgTXq3WrFqSZVS7zT6X0+Y5328aDgzpLWTfJAtyTx9y/KfhK0YEmNpVqic02aaTsbuFUd+kEB+Qt8fljtR+ocKwEwap07HNIytfcjWP4BqUMW7LUIMdpm9q7KhWvd9Bd9/YjS/IKciQ5/VNx7mpTU4LYWMM50kq3dutLUVY1DZzQ7BVXDIqICdbwL4PodHEwklEiuAhrBNN1zjAp1b9szvqalAQDclPu/1LjbmxREWug2d6KKAp2E7JGggz1f4SN31xjYhDO1yXlLmO0KHqaAlY3BcsLu2f5PpsOnBSTHQauyTAoSw4gtwf5a2yeuydKR4+55Cer+/kBABQ66e9+CbWMXSGvgqvzso9QsZqEfTlCrGuZAbbdc54/SiFBtfFCTO7tnEaXTJHAcJZy1/WtNnRLCOhVDHJhz0I6J0ba7vdtkaPdCiub1kPK/hISFb56KFLTLxEdC3jvngVhXeaNEKttN9eYG2Xa1cR20u0U=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(39850400004)(376002)(346002)(396003)(136003)(451199018)(71200400001)(5660300002)(8676002)(66476007)(83380400001)(64756008)(66556008)(7416002)(66946007)(8936002)(66446008)(52536014)(316002)(41300700001)(9686003)(478600001)(6506007)(53546011)(26005)(921005)(33656002)(7696005)(110136005)(55016003)(186003)(86362001)(38070700005)(38100700002)(122000001)(76116006)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dGt4UkU2cmVYbXAwYk9SU2lIeTZjTDE5cTFNOS9PODh1UUd4SlNweW13WmFt?=
 =?utf-8?B?cUFqNGo5UEpCOXM5YzdINzA2Z3lZS1hzK2tPcmIvRDBrWVdLbFJVdjhLeThH?=
 =?utf-8?B?bkJFcHREaW1KT3l3UjQxTVF5L2UxT1NocE1uVERlUDIva2NycDJmVjZyck1y?=
 =?utf-8?B?cVJDYjlpS0txUDAwS2FRbFZRMjkza3hhNHRhUFlRbGswOUp0UERjMDFpUFdI?=
 =?utf-8?B?UmZpL2lyenlpM1hySWZTaSszejFPTU5Sclhpd2poYXAzd20xWWdoenh6dUh6?=
 =?utf-8?B?cS9IQkRERHVvb21kWkpPRlJqWW43eEJydkpzWUlPN0xDdXllZkNVMnpWckRm?=
 =?utf-8?B?U1RHK0NhZzVOVks4eUFoMTl6bUJZUkpLWGJTaUxqNEh2WGVZYlJabnhUZEZJ?=
 =?utf-8?B?ZE5KT09SM0ZJa2YzbklFMHRpN3V5bEszRVhvRnowWEVmS1FmVXJmdE9KK0Vj?=
 =?utf-8?B?bU1KaHB2dVRhblJOVldSZTJLMk56TUNuU2k1WS9qdWVBbkI1UlV3ZW81b1N6?=
 =?utf-8?B?MFdreGp1bkhUU1hhcDU3WGVQeGN6Mmc0UDh2dVErNU82aXg0djBCM2krQnR4?=
 =?utf-8?B?RFpHVGl3SHJxRDE5UFpWSlpkcmdWNFBvaDhEUU0wU0pCSVExRTlUMU1EZW9G?=
 =?utf-8?B?U1ZCL2U4TGUxSjFCK3k1dzFmOU1nZHBaeVcrSEhCNm9hWDNWNERXMThBb2ww?=
 =?utf-8?B?TCtFa2VkeG1nbnFlTXpKalJXMHJRQndPdVlZNVBnTGxoN2FOU0RTdVRURWFX?=
 =?utf-8?B?NnZvWHJvZThNSzBScENoenVxZXlrdkR2bzRnbWl1YTlEWURrMWIwZFZ4K2ZD?=
 =?utf-8?B?cHhSRHZ5WGVNMU9NeWk0aE1lTXRmNUg2VUxsVFVaT0RSTG5EWWIrYWloVXVE?=
 =?utf-8?B?bGpicXN6QzZKOURZYWZVdEJyZ29xRUNscW9IQ0w0QytYdjFxZG5qQjVmbnNw?=
 =?utf-8?B?OEJ1S3hoQzNsRllXNjRrRC9wRGNXTnB3OU1NOVVDVEthQzl6bGVGOGxkNGtU?=
 =?utf-8?B?NUVITjRQOWxpNVNsY1R3eGdoa1NHcGhiRlVrYUtFVjNrbVlmVTdkM3FpdHBS?=
 =?utf-8?B?M2oxVlh3OWIyckYrTmthQkUrMzhkM0VyZ2RHUlJnUVkwb2hWNVFjc1htT2pO?=
 =?utf-8?B?QlZSOTcwZSt0QWpqNTh0K283ci9kUUtWT01NRmpiTVBOelgxaUNUdWljbndI?=
 =?utf-8?B?ZmFxTUhkTlgvVTIreFRPQm1sWXFXR3NmYnlCeFh2czIzemhjc2FIcXFqVzMv?=
 =?utf-8?B?UUVUeGF4TitrV1VUbjRMcGxUb3ZaaDhHakRKdmwwM21KMTBLZFRpNGo3UmVF?=
 =?utf-8?B?VllVcEdVWHBLMEsyRE5Mb0c2Qko0bFhudDlFWFlWbmNkWnZ6S0lzV1VzQVBl?=
 =?utf-8?B?R0g1V2JLVGJMMXk5N2xyNlhVaGczVzdzZ21GZWFjSTd6ZGx1ai9FQmllazZ6?=
 =?utf-8?B?UTF6RFFzcHJmaEVzVWRNMDVaazZHcmFYMnhLUTVrYjhyTzFsTmJmQUtBVWN5?=
 =?utf-8?B?RDgyRkVhT2dsS3ZDVytNSDJ2UWlqdWlEYm9Ib1ZPdllMNWVmRENhQXhRclUw?=
 =?utf-8?B?ZDRiOEEzM0dodnlxUEtEMHhEVFlxTWlCVzIyd053em55TWtMT2hvZnhuSjZG?=
 =?utf-8?B?cU0rWFBzZmpRVUNHNkltOFVFMzJiaTlqa3NWeXNFS0lYR3V3TUJpQVc1VWd6?=
 =?utf-8?B?TFRoQmRqcDlib2psdGVRVGRXOGIrcFZmMUt5VDNKbGRRcTRJd0tTUHl2RWdI?=
 =?utf-8?B?VkppdHJLTnhHTjh3ZTVFUEhORHRrTXhldzJ1STE3RE52WTBONVZ3Vm5wdjQ4?=
 =?utf-8?B?aFR4TnBlY01BMWVpL1J6L3ozK0V3VnR2MFc1dkMvVUFTZDNZeHBkWWxBNUpq?=
 =?utf-8?B?Yll2YWlLUlZWdmJpc0ZJL284ak84NHVlUVBwc0RDWGp2Z0o4UFpCUUNOUWZZ?=
 =?utf-8?B?eTRQL3loMHhSR3o1ZEo4VlE2cUJDY0E4SC9iWnFrL0ZTU2c5Z2tOblpqL2RP?=
 =?utf-8?B?Rk1QbFYyenJobGltdUp6dUp5cWRMSzJmZyt6VXc4OGMyZnYveENEMnY3eFBI?=
 =?utf-8?B?UHdnY25nV0hxeXpuSW90V1gwbCtRR1l2cWIyVWpsQWM3UnZ4bENiK3EvcER4?=
 =?utf-8?B?YXp1RFdwKzFSU2Y0Y0tVU1graTJ2dnpsdVBLNXVCcjBwWlRGQm1zd0l4RkJI?=
 =?utf-8?B?eVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26cb19f1-3145-4a7f-f3bd-08db14c22109
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2023 10:47:01.2943
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zHa3yZ1vQkaTDY4fbvXV0xxEWDypEO7oTCZgelb0xbEAZuSTa8Wcch92XHMFGq27We3eRNY6ARBHR9NKMx4Rtz1m6vMhX6DWxHvR2QDeL50=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5512
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

SGVsbG8gS3J6eXN6dG9mLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4g
U2VudDogV2VkbmVzZGF5LCBGZWJydWFyeSAyMiwgMjAyMyA2OjM2IFBNDQo+IFRvOiBSeWFuIENo
ZW4gPHJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT47IFJvYiBIZXJyaW5nDQo+IDxyb2JoK2R0QGtl
cm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpDQo+IDxrcnp5c3p0b2Yua296bG93c2tpK2R0
QGxpbmFyby5vcmc+OyBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1PjsgQW5kcmV3DQo+IEpl
ZmZlcnkgPGFuZHJld0Bhai5pZC5hdT47IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9u
aXguZGU+Ow0KPiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZzsNCj4gbGludXgtYXNwZWVkQGxpc3RzLm96bGFicy5vcmc7IGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAxLzJdIGR0
LWJpbmRpbmdzOiBpMmM6IEFkZCBzdXBwb3J0IGZvciBBU1BFRUQgaTJDdjINCj4gDQo+IE9uIDIy
LzAyLzIwMjMgMTE6MzEsIFJ5YW4gQ2hlbiB3cm90ZToNCj4gPj4gCUJvYXJkIEINCj4gPj4+IC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+
ID4+IAktLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQ0KPiA+Pj4gfCAgICBpMmMgYnVzIzEobWFzdGVyL3NsYXZlKSAgPC0tLS0tLS0tLS0tLS0t
LS0tLS0tPg0KPiA+Pj4gfCBmaW5nZXJwcmludC4oY2FuIGJlIHVucGx1ZykNCj4gPj4gPC0tLS0t
LS0tLS0tLS0tLS0tLS0tPiBpMmMgYnVzI3ggKG1hc3Rlci9zbGF2ZSkgfA0KPiA+Pj4gfCAgICBp
MmMgYnVzIzIobWFzdGVyKSAtPiB0bXAgaTJjIGRldmljZSAgICAgfA0KPiA+PiAJfAkJCQkJCQkJ
CXwNCj4gPj4+IHwgICAgaTJjIGJ1cyMzKG1hc3RlcikgLT4gYWRjIGkyYyBkZXZpY2UgICAgICB8
DQo+IAl8DQo+ID4+IAkJCQkJCQkJfA0KPiA+Pj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPj4gCS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4+PiBJbiB0aGlzIGNhc2Ug
aTJjIGJ1cyMxIG5lZWQgZW5hYmxlIHRpbWVvdXQsIGF2b2lkIHN1ZGRlbmx5IHVucGx1Zw0KPiA+
Pj4gdGhlDQo+ID4+IGNvbm5lY3Rvci4gVGhhdCBzbGF2ZSB3aWxsIGtlZXAgc3RhdGUgdG8gZHJp
dmUgY2xvY2sgc3RyZXRjaGluZy4NCj4gPj4+IFNvIGl0IGlzIHNwZWNpZmljIGVuYWJsZSBpbiBp
MmMgYnVzIzEuIE90aGVycyBpcyBub3QgbmVlZGVkIGVuYWJsZSB0aW1lb3V0Lg0KPiA+Pj4gRG9l
cyB0aGlzIGRyYXcgaXMgbW9yZSBjbGVhciBpbiBzY2VuYXJpbz8NCj4gPj4NCj4gPj4gSTJDIGJ1
cyAjMSB3b3JrcyBpbiBzbGF2ZSBtb2RlPyBTbyB5b3UgYWx3YXlzIG5lZWQgaXQgZm9yIHNsYXZl
IHdvcms/DQo+ID4NCj4gPiBZZXMsIGl0IGlzIGJvdGggc2xhdmUvbWFzdGVyIG1vZGUuIEl0IGlz
IGFsd2F5cyBkdWFsIHJvbGUuIFNsYXZlIG11c3QgYWx3YXlzDQo+IHdvcmsuDQo+ID4gRHVlIHRv
IGFub3RoZXIgYm9hcmQgbWFzdGVyIHdpbGwgc2VuZC4NCj4gDQo+IEkgbWVhbnQgdGhhdCB5b3Ug
bmVlZCB0aGlzIHByb3BlcnR5IHdoZW4gaXQgd29ya3MgaW4gc2xhdmUgbW9kZT8gSXQgd291bGQg
YmUNCj4gdGhlbiByZWR1bmRhbnQgdG8gaGF2ZSBpbiBEVCBhcyBpdCBpcyBpbXBsaWVkIGJ5IHRo
ZSBtb2RlLg0KDQpCdXQgdGltZW91dCBmZWF0dXJlIGlzIGFsc28gYXBwbHkgaW4gbWFzdGVyLiBJ
dCBmb3IgYXZvaWQgc3VkZGVubHkgc2xhdmUgbWlzcyh1bi1wbHVnKSANCk1hc3RlciBjYW4gdGlt
ZW91dCBhbmQgcmVsZWFzZSB0aGUgU0RBL1NDTCwgcmV0dXJuLiANCg0KPiANCj4gPg0KPiA+Pj4N
Cj4gPj4+Pj4NCj4gPj4+Pj4gU28gaW4gdGhvc2UgcmVhc29uIGFkZCB0aGlzIHRpbWVvdXQgZGVz
aWduIGluIGNvbnRyb2xsZXIuDQo+ID4+Pj4NCj4gPj4+PiBZb3UgbmVlZCB0byBqdXN0aWZ5IHdo
eSBEVCBpcyBjb3JyZWN0IHBsYWNlIGZvciB0aGlzIHByb3BlcnR5LiBEVA0KPiA+Pj4+IGlzIG5v
dCBmb3IgY29uZmlndXJpbmcgT1MsIGJ1dCB0byBkZXNjcmliZSBoYXJkd2FyZS4gSSBnYXZlIHlv
dSBvbmUNCj4gPj4+PiBwb3NzaWJpbGl0eQ0KPiA+Pj4+IC0gd2h5IGRpZmZlcmVudCBib2FyZHMg
d291bGQgbGlrZSB0byBzZXQgdGhpcyBwcm9wZXJ0eS4gWW91IHNhaWQgaXQNCj4gPj4+PiBpcyBu
b3QgYm9hcmQgc3BlY2lmaWMsIHRodXMgYWxsIGJvYXJkcyB3aWxsIGhhdmUgaXQgKG9yIG5vbmUg
b2YgdGhlbSkuDQo+ID4+Pj4gV2l0aG91dCBhbnkgb3RoZXIgcmVhc29uLCB0aGlzIGlzIG5vdCBh
IERUIHByb3BlcnR5LiBEcm9wLg0KPiA+Pj4+DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4+DQo+ID4+Pj4+
Pj4+PiArDQo+ID4+Pj4+Pj4+PiArICBieXRlLW1vZGU6DQo+ID4+Pj4+Pj4+PiArICAgIHR5cGU6
IGJvb2xlYW4NCj4gPj4+Pj4+Pj4+ICsgICAgZGVzY3JpcHRpb246IEZvcmNlIGkyYyBkcml2ZXIg
dXNlIGJ5dGUgbW9kZSB0cmFuc21pdA0KPiA+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+PiBEcm9wLCBub3Qg
YSBEVCBwcm9wZXJ0eS4NCj4gPj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4+ICsNCj4gPj4+Pj4+Pj4+ICsg
IGJ1ZmYtbW9kZToNCj4gPj4+Pj4+Pj4+ICsgICAgdHlwZTogYm9vbGVhbg0KPiA+Pj4+Pj4+Pj4g
KyAgICBkZXNjcmlwdGlvbjogRm9yY2UgaTJjIGRyaXZlciB1c2UgYnVmZmVyIG1vZGUgdHJhbnNt
aXQNCj4gPj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4gRHJvcCwgbm90IGEgRFQgcHJvcGVydHkuDQo+ID4+
Pj4+Pj4+DQo+ID4+Pj4+Pj4gVGhlIGNvbnRyb2xsZXIgc3VwcG9ydCAzIGRpZmZlcmVudCBmb3Ig
dHJhbnNmZXIuDQo+ID4+Pj4+Pj4gQnl0ZSBtb2RlOiBpdCBtZWFucyBzdGVwIGJ5IHN0ZXAgdG8g
aXNzdWUgdHJhbnNmZXIuDQo+ID4+Pj4+Pj4gRXhhbXBsZSBpMmMgcmVhZCwgZWFjaCBzdGVwIHdp
bGwgaXNzdWUgaW50ZXJydXB0IHRoZW4gZW5hYmxlIG5leHQNCj4gc3RlcC4NCj4gPj4+Pj4+PiBT
ciAoc3RhcnQgcmVhZCkgfCBEIHwgRCB8IEQgfCBQDQo+ID4+Pj4+Pj4gQnVmZmVyIG1vZGU6IGl0
IG1lYW5zLCB0aGUgZGF0YSBjYW4gcHJlcGFyZSBpbnRvIGJ1ZmZlcg0KPiA+Pj4+Pj4+IHJlZ2lz
dGVyLCB0aGVuIFRyaWdnZXIgdHJhbnNmZXIuIFNvIFNyIEQgRCBEIFAsIG9ubHkgaGF2ZSBvbmx5
IDEgaW50ZXJydXB0DQo+IGhhbmRsaW5nLg0KPiA+Pj4+Pj4+IFRoZSBETUEgbW9kZSBtb3N0IGxp
a2Ugd2l0aCBidWZmZXIgbW9kZSwgVGhlIGRpZmZlciBpcyBkYXRhDQo+ID4+Pj4+Pj4gcHJlcGFy
ZSBpbiBEUkFNLCB0aGFuIHRyaWdnZXIgdHJhbnNmZXIuDQo+ID4+Pj4+Pj4NCj4gPj4+Pj4+PiBT
bywgc2hvdWxkIEkgbW9kaWZ5IHRvDQo+ID4+Pj4+Pj4gICBhc3BlZWQsYnl0ZToNCj4gPj4+Pj4+
PiAJdHlwZTogYm9vbGVhbg0KPiA+Pj4+Pj4+ICAgICBkZXNjcmlwdGlvbjogRW5hYmxlIGkyYyBj
b250cm9sbGVyIHRyYW5zZmVyIHdpdGggYnl0ZSBtb2RlDQo+ID4+Pj4+Pj4NCj4gPj4+Pj4+PiAg
IGFzcGVlZCxidWZmOg0KPiA+Pj4+Pj4+IAl0eXBlOiBib29sZWFuDQo+ID4+Pj4+Pj4gICAgIGRl
c2NyaXB0aW9uOiBFbmFibGUgaTJjIGNvbnRyb2xsZXIgdHJhbnNmZXIgd2l0aCBidWZmIG1vZGUN
Cj4gPj4+Pj4+DQo+ID4+Pj4+PiAxLiBObywgdGhlc2UgYXJlIG5vdCBib29scyBidXQgZW51bSBp
biBzdWNoIGNhc2UuDQo+ID4+Pj4+DQo+ID4+Pj4+IFRoYW5rcywgd2lsbCBtb2RpZnkgZm9sbG93
aW5nLg0KPiA+Pj4+PiBhc3BlZWQseGZlcl9tb2RlOg0KPiA+Pj4+PiAgICAgZW51bTogWzAsIDEs
IDJdDQo+ID4+Pj4+ICAgICBkZXNjcmlwdGlvbjoNCj4gPj4+Pj4gICAgICAgMDogYnl0ZSBtb2Rl
LCAxOiBidWZmX21vZGUsIDI6IGRtYV9tb2RlDQo+ID4+Pj4NCj4gPj4+PiBKdXN0IGtlZXAgaXQg
dGV4dCAtIGJ5dGUsIGJ1ZmZlcmVkLCBkbWENCj4gPj4+Pg0KPiA+Pj4+Pg0KPiA+Pj4+Pj4gMi4g
QW5kIHdoeSBleGFjdGx5IHRoaXMgaXMgYm9hcmQtc3BlY2lmaWM/DQo+ID4+Pj4+DQo+ID4+Pj4+
IE5vLCBpdCBub3QgZGVwZW5kcyBvbiBib2FyZCBkZXNpZ24uIEl0IGlzIG9ubHkgZm9yIHJlZ2lz
dGVyDQo+ID4+Pj4+IGNvbnRyb2wgZm9yDQo+ID4+Pj4gY29udHJvbGxlciB0cmFuc2ZlciBiZWhh
dmUuDQo+ID4+Pj4+IFRoZSBjb250cm9sbGVyIHN1cHBvcnQgMyBkaWZmZXJlbnQgdHJpZ2dlciBt
b2RlIGZvciB0cmFuc2Zlci4NCj4gPj4+Pj4gQXNzaWduIGJ1cyMxIH4gMyA6IGRtYSB0cmFuZmVy
IGFuZCBhc3NpZ24gYnVzIzQgfiA2IDogYnVmZmVyIG1vZGUNCj4gPj4+Pj4gdHJhbnNmZXIsIFRo
YXQgY2FuIHJlZHVjZSB0aGUgZHJhbSB1c2FnZS4NCj4gPj4+Pg0KPiA+Pj4+IFRoZW4gYW55d2F5
IGl0IGRvZXMgbm90IGxvb2sgbGlrZSBwcm9wZXJ0eSBmb3IgRGV2aWNldHJlZS4gRFQNCj4gPj4+
PiBkZXNjcmliZXMgaGFyZHdhcmUsIG5vdCBPUyBiZWhhdmlvci4NCj4gPj4+DQo+ID4+PiBUaGUg
c2FtZSBkcmF3LCBpbiB0aGlzIGNhc2UsIGkyYyBidXMjMSB0aGF0IGlzIG11bHRpLW1hc3RlciB0
cmFuc2Zlcg0KPiA+PiBhcmNoaXRlY3R1cmUuDQo+ID4+PiBCb3RoIHdpbGwgaW5hY3RpdmUgd2l0
aCB0cnVuayBkYXRhLiBUaGF0IGNhbmUgZW5hYmxlIGkyYyMxIHVzZSBETUENCj4gPj4+IHRyYW5z
ZmVyDQo+ID4+IHRvIHJlZHVjZSBDUFUgdXRpbGl6ZWQuDQo+ID4+PiBPdGhlcnMgKGJ1cyMyLzMp
IGNhbiBrZWVwIGJ5dGUvYnVmZiBtb2RlLg0KPiA+Pg0KPiA+PiBJc24ndCB0aGVuIGN1cnJlbnQg
YnVzIGNvbmZpZ3VyYXRpb24gZm9yIEkyQyMxIGtub3duIHRvIHRoZSBkcml2ZXI/DQo+ID4+IEpl
cmVteSBhc2tlZCBmZXcgb3RoZXIgcXVlc3Rpb25zIGFyb3VuZCBoZXJlLi4uDQo+ID4NCj4gPiBO
bywgVGhlIGRyaXZlciBkb24ndCBrbm93IGN1cnJlbnRseSBib2FyZCBjb25maWd1cmF0aW9uLg0K
PiANCj4gSXQga25vd3Mgd2hldGhlciBpdCBpcyB3b3JraW5nIGluIG11bHRpLW1hc3Rlci9zbGF2
ZSBtb2RlLg0KDQpCdXQgaW4gRFQgY2FuIGRlY2lkZSB3aGljaCBpMmMgYnVzIG51bWJlciBjYW4g
dXNlIGRtYSBvciBidWZmZXIgbW9kZSB0cmFuc2Zlci4NCklmIGluIGFub3RoZXIgaTJjIGJ1cyBz
dXBwb3J0IG1hc3RlciBvbmx5LCBhbHNvIGNhbiB1c2UgZG1hIHRvIHRyYW5zZmVyIHRydW5rIGRh
dGEgdG8gYW5vdGhlciBzbGF2ZS4gDQoNCkJlc3QgcmVnYXJkcywNClJ5YW4gQ2hlbg0K
