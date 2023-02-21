Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C9369DE1D
	for <lists+openbmc@lfdr.de>; Tue, 21 Feb 2023 11:43:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLbVY3HtQz3c3W
	for <lists+openbmc@lfdr.de>; Tue, 21 Feb 2023 21:43:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=I6D299XW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::725; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=I6D299XW;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20725.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::725])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLbTj2nV7z309V;
	Tue, 21 Feb 2023 21:42:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPYODId4Fh53vvzk75MwsBdWj9fJof6WLZYTpUAzrCkGEQcPDXfcXETXSCT5tatEANICUoNskoEEO+yalKgN6hU02LePrRZ0QfqO64xhFrVF2zWDwqVjotgiJiekePeYw5ca4Uz8FXngybl5rBgv8Cnim/wsCVeDeYdnDAG71HnbpjE0RwbkkhOp2dezWtkJ4uw2AUjCMNKKcBpwewdCgx0XH39q2abuLFPy9v3uG+kb4XCjC+XVyM3yJhpHoiilCd/89maka8mIh5jjxXT/FSesj8EXO7oEBR5cGJQ1weB3d6RS+QhJ3xU1qdSADY/CGgJLk443lypgdzyNe9nqfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5bNGzujxwwbpLiPKcvafJA8c8H2ws++mbDMZBgIJl1Q=;
 b=oEQVeSCWUmqQyRzPl6d9FlA0MMK0j73rILqtZ+NwY/lC9nYfgwWNblGsWNr+nYanfdBUNzS4nBYRsbgSzfi6YZ6HaYlM2V+wegJiTwKTOyIDr0FKh/pK6HBH1pzzGFHudDd7J9H/JcM1WaCUN+DouI3VIb5/2X7cqpn/k3AV5FvMZurb2IXRKBlNcYJFChjgVeqB91W0vRMlDrgqJxvJp+kRorsO3xo6vPnXzLokpAJlG3xWGaIQOS/eCc+c8Gx/gqEuvUklFXC2YOldebTNMcVUtQMNn1Q0hFwH5YykReAwdL/OO1AcgDXf9WncPKVFkCa0ZipwYWBBCgCAoAe6yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5bNGzujxwwbpLiPKcvafJA8c8H2ws++mbDMZBgIJl1Q=;
 b=I6D299XW7xNEX+uShJL9oB2frAJrdhnLSiVwkLd5VtH2XmW9ZIGOK2QPJA5klnGbwk46+n5UNNPCKs6FGIPrshbKhdkIRVzo0BvVne/bRTq5A5mwBPpwOnUXKZ4q+OSyWAnWOAWbSRw3opMnV/M1rm3YCgg6qFEDkKk819CU01CBBco0iCNwAVxktvcn8tj2SQp1KB0jC6l4N+zBXSJ1p8LvHkBCMHnj5B/BFIE+4bnJVuth0DCVLnkphKbNmgWPFAj9HfMfakURZVcXkGjeL7QgK0Il5wXtEWcfVhlqu5wIyf4jyR+hu4bIpfWmUiwMqO4UnkcTmocA9K8O/GWTDg==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYUPR06MB6077.apcprd06.prod.outlook.com (2603:1096:400:353::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.12; Tue, 21 Feb
 2023 10:42:22 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6111.010; Tue, 21 Feb 2023
 10:42:22 +0000
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
Thread-Index: AQHZRPMR/TOuXj0GdEGWPZ2JFslGsK7Xgo8AgAEkZWCAAIA2gIAABk2Q
Date: Tue, 21 Feb 2023 10:42:21 +0000
Message-ID:  <SEZPR06MB5269502D7CBCD5698B65FF9FF2A59@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230220061745.1973981-1-ryan_chen@aspeedtech.com>
 <20230220061745.1973981-2-ryan_chen@aspeedtech.com>
 <676c7777-635c-cc1f-b919-d33e84a45442@linaro.org>
 <TYZPR06MB527427ADCCD29DFD77FB0EE3F2A59@TYZPR06MB5274.apcprd06.prod.outlook.com>
 <80d873d4-d813-6c25-8f47-f5ff9af718ec@linaro.org>
In-Reply-To: <80d873d4-d813-6c25-8f47-f5ff9af718ec@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|TYUPR06MB6077:EE_
x-ms-office365-filtering-correlation-id: 74d43244-b8f7-49bf-65a6-08db13f85019
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  fdW5PeVyenFy4G+JHMtmSn3m+yi0WVsA8ehX6gYRXgjv27AAbxjr2Lg55qBKxnXjE/Y9Mp42+0aus4XJupC5RAiL6qnLX1UTYVUidjFeecrPOKu7wDeT1xOgg6W7b9e8mUKbQXgq5s98TS6Z9JuzmWl7Scqu9BXsoM3hQUmB1ewudfmtOr+ypjuJuGLHaQ4EB92xqxAhCXNCuIeEFlxRa3LNkK5TtLA5ch5FrRUkkQdicxHXGWwdO26ASaMq/GNIryH/5AW4tf7iODsOCRePF9WPDXa0GtSCD0vxDRngjHdfXiYj9Vd7wqOOLX7oSP/qHMt7aiDd2rge5/DThZoBB3XfYS+DsAs/QxqLbLIUgQa6cwziGQGU4bSJUOnzGEK94Znj+sVO/4rXpFMPUyplZfbyIpcHQfKrWEYQ4ANPCxAwI26HWNJQ8Jnf+grQTedqzBGxxGFcR8x5fbFjv/NT0/NEe0JHZJDsfyTXYao4u02qSRRecw+V4vwtejrD/MeAVB8hHj4xtod9nFrrhBopYdVyu63T+E2L8Tg/TSxYndTvwlcJ/ldCId1XMEwQUpd0SbIJkyqHrEw+WPI22tFRSf60pnNCBhcf4UF+prvb1JVeUBVIQP4SYQU9BI1Ld01sxFHTsbSLqiVclGXAgFhVOJ2Ld+WnlNvZ3mNLbDXx7njvFMiQTi/7fc7PS6trgghSXYBPALkUDpAoejjhzf4K4QjCSSJmG5O7n886e7/itkwymG+5GxOL9Hlt7DiZ1hzr
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(366004)(39850400004)(376002)(396003)(136003)(451199018)(5660300002)(7416002)(52536014)(8676002)(2906002)(41300700001)(8936002)(38100700002)(122000001)(478600001)(110136005)(966005)(7696005)(86362001)(55016003)(83380400001)(33656002)(38070700005)(921005)(26005)(186003)(6506007)(64756008)(9686003)(66556008)(66446008)(76116006)(316002)(66476007)(66946007)(71200400001)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Znp5SHdaNm03aElYMEJub3E1RDM0U2dPc05MallkM1l4S1M4TDd0N0M5eXRG?=
 =?utf-8?B?bkovbXJVWDVRU3JDUWhhNkxoMGhYUlBheUI0TUtuTWhmRkdZZ1VFMU5yUyts?=
 =?utf-8?B?YjE3T1R2TTV4YW85RW1nVDhiek9vYXJScFpRaDZKZWl3RGFuN1VhbUhuNFh4?=
 =?utf-8?B?UkhPdFBMSGpWaWMycTdscjZZV0daU0pVbi9qcVJrNmYyNGxMQmJSdXU3eTNp?=
 =?utf-8?B?Sng0OHdCVEpDd0xFZ21aWjJYV0NIRDVtUmxVTDR3TnFQS1VWNkNMOGsrdHR3?=
 =?utf-8?B?L2lWcnpOOUp2QmljaGw0SzEydDBaNTRZalFnTk13MXBXekUxNCs5Q21MZitQ?=
 =?utf-8?B?VkhrbEtNYllqNVF1S1pRUW5sK2VHKytacUlESlpSVWhOQnRXKzJtRWhEaWRv?=
 =?utf-8?B?OGtHS3NHUWtyOXM2aVg1bHBPQTlrWFpnZHZJRDRROGRqV3RLWmNBSDZpVS9N?=
 =?utf-8?B?N0dIQXZ0ZG44LzhyUkxtekVCajI1YUtPbzRDNk0wTUJyS2tMbkFzemt6MWRu?=
 =?utf-8?B?WHo1Uy85WjRRcFJPU05mU08yNEJOMTlQeE1odFFJZHoxUklxZXNlbmk1bWpz?=
 =?utf-8?B?cXZGa0JyeTVVUGRrRXhWNVd3RDRMeDBTZllhRFdPbklTTVFKMEZZQ0h5YXlr?=
 =?utf-8?B?L2pBQzZTZHNRRmFIQnppMlFybnZ5M1QxR3pwSGYzVGRMM2s1cE1SR2ZPZXgr?=
 =?utf-8?B?YXhoSXNmZTF0eXFObGF1RU5YeHI2UldDYnYzemFuQUhrRVFyVGRPaEYxZEY4?=
 =?utf-8?B?dlo1bEttT1Y3QjNpdWZRb1NVcUp6WDFaUGNtK2ViT05CQTVUZmlOM0RtNFBG?=
 =?utf-8?B?VWpWZEdhS1RZY0dNTi9TRnRrUVl6SW5qQTV1eDdRZEt4UmxZc3hZRHZMUWhr?=
 =?utf-8?B?KzBNVXRBSmtSbnJpVzF3bjJrYTcvMmxscHdheE1LMnFrUW5Ba1hML3V2dWds?=
 =?utf-8?B?QnRIUWxSS2VYdGRlczJWaUpERzBqK25XZVhRZERPYnhXeWQ1Z2ZabUFRWWla?=
 =?utf-8?B?OTlqVi8yczlZTjlyMUNBNnBNNTVjaitYMVVaQ3R5UWFHY3I3RkwxWkJkc3lz?=
 =?utf-8?B?MnBWbjJNR1owZWZTdmpYaldrdlhvU29VNFBkS3dLY0ExbnpmYnNVRWJPT1dv?=
 =?utf-8?B?T2ZjQmQ4YWVHU2M2cGd6VFhLcUJ1NnRDNGlXQ09ZMENOSmlCWmFFSEdDREZj?=
 =?utf-8?B?VEE0QXE0Wk1QcnpRemp0TkZibzA5YXNHTTUvZVFPZ29jdktYYVV3YVh0WGw5?=
 =?utf-8?B?dTZ5NEpwalNkWkVKTkg4dnI2b2pqbnJiY1JQVWlWeHUrVmordmtVc3NsNlZZ?=
 =?utf-8?B?UzBrSWplNWJuWVFKWVZhMWZoVnZpK3hkbnBWZDJncXMyY2E5MU9Nc29rTXFE?=
 =?utf-8?B?VmhWZTBoeW9UTUxlWHhyVzBiQ2RQVEZzYUxnS0ROSjNCSGgvdGlLTVJqWUJD?=
 =?utf-8?B?YXJIbmZtWjZEZEVxZVBrSzVmcjVaamdURzljWTN6dGtrSVBIcHdWR0FMTHBs?=
 =?utf-8?B?TmRtdld0N1RnSGZPQk91cUJNTkJVaTZLa0lBazdxYVNlTENGYm8wMlhPMWZY?=
 =?utf-8?B?d3lWQUdKd1ZkLzI5cFlaWmN1aU9rdlk1RENYYzJUZndyZU9TazhIRTc4L0Q4?=
 =?utf-8?B?d3ZZVWNUVmM2VWc0QlBTVEZaMWF1TEVJRmh6NzI1dGZpVkZtUmRJRlpZWVBE?=
 =?utf-8?B?SHo2c3BEVURmT05XQ29pQmNybml3U0NlMTJIdGx3ZzFsYVZmOXlQZmMrczlI?=
 =?utf-8?B?L1VKb0Fzb1pqbUZST0dlUHdFT3haYW5zZ0F3MEIvNWJRaDNvMWt6aFNoc3RR?=
 =?utf-8?B?aWMzWmhIei9ITk5jSDRXR0tEOFdaejlUM09YdmJKN09MR1BSUVYyNk5GZWU4?=
 =?utf-8?B?MmlTTlA5ejNnZWp5WExkK05QRS96eFZTQUViOEl5V1ljOFRNTjVhZW5rcG9h?=
 =?utf-8?B?L21ON2lKN0ZJK3NGRG9PeXcxWk1tUXJRRE9nRDl1amxRdjIwRjM1c3pmVElj?=
 =?utf-8?B?Yld5aE4vVlVKbGk1alpyMmhUbVVKVG9Ud1RJTk5uTk5VNVZIQUNpdXRHM0ts?=
 =?utf-8?B?ZWEvSTNodjE0ZjFCRFd5T24rS1duMWtqTFFNeGdNN0VpYnFkNVFWNjBVSm52?=
 =?utf-8?B?T2FtZ1VjMlFsa0tTYzlONE5ENUpUVVd1VjhJTEllTG9tUEFWTlZYWUlwSVJa?=
 =?utf-8?B?UlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74d43244-b8f7-49bf-65a6-08db13f85019
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2023 10:42:21.9403
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dDzs6k8VPZaSDdH7huFqBMOLXfO4PPQCR9NNMAqPCAXaoXZoT/6tjZqmqwuDnR6VGsvtLms56wEL+ek3fYslHoHYD3Y6+GC0W9Ud7bSAlpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6077
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

SGVsbG8gS3J6eXN6dG9mLA0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPg0K
PiBTZW50OiBUdWVzZGF5LCBGZWJydWFyeSAyMSwgMjAyMyA1OjQwIFBNDQo+IFRvOiBSeWFuIENo
ZW4gPHJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT47IFJvYiBIZXJyaW5nDQo+IDxyb2JoK2R0QGtl
cm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpDQo+IDxrcnp5c3p0b2Yua296bG93c2tpK2R0
QGxpbmFyby5vcmc+OyBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1PjsgQW5kcmV3DQo+IEpl
ZmZlcnkgPGFuZHJld0Bhai5pZC5hdT47IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9u
aXguZGU+Ow0KPiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZzsNCj4gbGludXgtYXNwZWVkQGxpc3RzLm96bGFicy5vcmc7IGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAxLzJdIGR0
LWJpbmRpbmdzOiBpMmM6IEFkZCBzdXBwb3J0IGZvciBBU1BFRUQgaTJDdjINCj4gDQo+IE9uIDIx
LzAyLzIwMjMgMDM6NDMsIFJ5YW4gQ2hlbiB3cm90ZToNCj4gPiBIZWxsbyBLcnp5c3p0b2YsDQo+
ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogS3J6eXN6dG9m
IEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPg0KPiA+PiBTZW50OiBN
b25kYXksIEZlYnJ1YXJ5IDIwLCAyMDIzIDQ6MzUgUE0NCj4gPj4gVG86IFJ5YW4gQ2hlbiA8cnlh
bl9jaGVuQGFzcGVlZHRlY2guY29tPjsgUm9iIEhlcnJpbmcNCj4gPj4gPHJvYmgrZHRAa2VybmVs
Lm9yZz47IEtyenlzenRvZiBLb3psb3dza2kNCj4gPj4gPGtyenlzenRvZi5rb3psb3dza2krZHRA
bGluYXJvLm9yZz47IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+Ow0KPiA+PiBBbmRyZXcg
SmVmZmVyeSA8YW5kcmV3QGFqLmlkLmF1PjsgUGhpbGlwcCBaYWJlbA0KPiA+PiA8cC56YWJlbEBw
ZW5ndXRyb25peC5kZT47IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzsNCj4gPj4gbGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOw0KPiA+PiBsaW51eC1hc3BlZWRAbGlzdHMub3ps
YWJzLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiA+PiBTdWJqZWN0OiBSZTog
W1BBVENIIHY1IDEvMl0gZHQtYmluZGluZ3M6IGkyYzogQWRkIHN1cHBvcnQgZm9yIEFTUEVFRA0K
PiA+PiBpMkN2Mg0KPiA+Pg0KPiA+PiBPbiAyMC8wMi8yMDIzIDA3OjE3LCBSeWFuIENoZW4gd3Jv
dGU6DQo+ID4+PiBBU1QyNjAwIHN1cHBvcnQgbmV3IHJlZ2lzdGVyIHNldCBmb3IgSTJDdjIgY29u
dHJvbGxlciwgYWRkIGJpbmRpbmdzDQo+ID4+PiBkb2N1bWVudCB0byBzdXBwb3J0IGRyaXZlciBv
ZiBpMmN2MiBuZXcgcmVnaXN0ZXIgbW9kZSBjb250cm9sbGVyLg0KPiA+Pj4NCj4gPj4+IFNpZ25l
ZC1vZmYtYnk6IFJ5YW4gQ2hlbiA8cnlhbl9jaGVuQGFzcGVlZHRlY2guY29tPg0KPiA+Pj4gLS0t
DQo+ID4+PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2FzcGVlZCxpMmN2Mi55YW1sIHwg
ODMNCj4gPj4+ICsrKysrKysrKysrKysrKysrKysNCj4gPj4+ICAxIGZpbGUgY2hhbmdlZCwgODMg
aW5zZXJ0aW9ucygrKQ0KPiA+Pj4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+Pj4gRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9hc3BlZWQsaTJjdjIueWFtbA0KPiA+Pg0KPiA+
PiBOZXcgY29tcGF0aWJsZSBpcyBva2F5LCBidXQgYXMgdGhpcyBpcyB0aGUgc2FtZSBjb250cm9s
bGVyIGFzIG9sZA0KPiA+PiBvbmUsIHRoaXMgc2hvdWxkIGdvIHRvIG9sZCBiaW5kaW5nLg0KPiA+
Pg0KPiA+PiBUaGVyZSBhcmUgc2V2ZXJhbCBpc3N1ZXMgYW55d2F5IGhlcmUsIGJ1dCBJIHdvbid0
IHJldmlld2luZyBpdCBleGNlcHQNCj4gPj4gZmV3IG9idmlvdXMgY2FzZXMuDQo+ID4+DQo+ID4+
Pg0KPiA+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9p
MmMvYXNwZWVkLGkyY3YyLnlhbWwNCj4gPj4+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2kyYy9hc3BlZWQsaTJjdjIueWFtbA0KPiA+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQN
Cj4gPj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uOTEzZmI0NWQ1ZmJlDQo+ID4+PiAtLS0gL2Rldi9u
dWxsDQo+ID4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2Fz
cGVlZCxpMmN2Mi55YW1sDQo+ID4+PiBAQCAtMCwwICsxLDgzIEBADQo+ID4+PiArIyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpICVZQU1MIDEu
Mg0KPiA+Pj4gKy0tLQ0KPiA+Pj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMv
aTJjL2FzcGVlZCxpMmN2Mi55YW1sIw0KPiA+Pj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVl
Lm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KPiA+Pj4gKw0KPiA+Pj4gK3RpdGxlOiBBU1BF
RUQgSTJDdjIgQ29udHJvbGxlciBvbiB0aGUgQVNUMjZYWCBTb0NzDQo+ID4+PiArDQo+ID4+PiAr
bWFpbnRhaW5lcnM6DQo+ID4+PiArICAtIFJ5YW4gQ2hlbiA8cnlhbl9jaGVuQGFzcGVlZHRlY2gu
Y29tPg0KPiA+Pj4gKw0KPiA+Pj4gK2FsbE9mOg0KPiA+Pj4gKyAgLSAkcmVmOiAvc2NoZW1hcy9p
MmMvaTJjLWNvbnRyb2xsZXIueWFtbCMNCj4gPj4+ICsNCj4gPj4+ICtwcm9wZXJ0aWVzOg0KPiA+
Pj4gKyAgY29tcGF0aWJsZToNCj4gPj4+ICsgICAgZW51bToNCj4gPj4+ICsgICAgICAtIGFzcGVl
ZCxhc3QyNjAwLWkyY3YyDQo+ID4+PiArDQo+ID4+PiArICByZWc6DQo+ID4+PiArICAgIG1pbkl0
ZW1zOiAxDQo+ID4+PiArICAgIGl0ZW1zOg0KPiA+Pj4gKyAgICAgIC0gZGVzY3JpcHRpb246IGFk
ZHJlc3Mgb2Zmc2V0IGFuZCByYW5nZSBvZiByZWdpc3Rlcg0KPiA+Pj4gKyAgICAgIC0gZGVzY3Jp
cHRpb246IGFkZHJlc3Mgb2Zmc2V0IGFuZCByYW5nZSBvZiBidWZmZXIgcmVnaXN0ZXINCj4gPj4N
Cj4gPj4gV2h5IHRoaXMgaXMgb3B0aW9uYWw/DQo+ID4NCj4gPiBXaWxsIG1vZGlmeSBtaW5JdGVt
czogMSB0byAyDQo+ID4+DQo+ID4+PiArDQo+ID4+PiArICBpbnRlcnJ1cHRzOg0KPiA+Pj4gKyAg
ICBtYXhJdGVtczogMQ0KPiA+Pj4gKw0KPiA+Pj4gKyAgY2xvY2tzOg0KPiA+Pj4gKyAgICBtYXhJ
dGVtczogMQ0KPiA+Pj4gKyAgICBkZXNjcmlwdGlvbjoNCj4gPj4+ICsgICAgICBSZWZlcmVuY2Ug
Y2xvY2sgZm9yIHRoZSBJMkMgYnVzDQo+ID4+PiArDQo+ID4+PiArICByZXNldHM6DQo+ID4+PiAr
ICAgIG1heEl0ZW1zOiAxDQo+ID4+PiArDQo+ID4+PiArICBjbG9jay1mcmVxdWVuY3k6DQo+ID4+
PiArICAgIGRlc2NyaXB0aW9uOg0KPiA+Pj4gKyAgICAgIERlc2lyZWQgSTJDIGJ1cyBjbG9jayBm
cmVxdWVuY3kgaW4gSHouIGRlZmF1bHQgMTAwa2h6Lg0KPiA+Pj4gKw0KPiA+Pj4gKyAgbXVsdGkt
bWFzdGVyOg0KPiA+Pj4gKyAgICB0eXBlOiBib29sZWFuDQo+ID4+PiArICAgIGRlc2NyaXB0aW9u
Og0KPiA+Pj4gKyAgICAgIHN0YXRlcyB0aGF0IHRoZXJlIGlzIGFub3RoZXIgbWFzdGVyIGFjdGl2
ZSBvbiB0aGlzIGJ1cw0KPiA+Pg0KPiA+PiBEcm9wIGRlc2NyaXB0aW9uIGFuZCB0eXBlLiBKdXN0
IDp0cnVlLg0KPiA+Pg0KPiA+IFNpbmNlIGkyYy50eHQgaGF2ZSBtdWx0aS1tYXN0ZXIgd2lsbCBk
cm9wIGl0Lg0KPiA+Pj4gKw0KPiA+Pj4gKyAgdGltZW91dDoNCj4gPj4+ICsgICAgdHlwZTogYm9v
bGVhbg0KPiA+Pj4gKyAgICBkZXNjcmlwdGlvbjogRW5hYmxlIGkyYyBidXMgdGltZW91dCBmb3Ig
bWFzdGVyL3NsYXZlICgzNW1zKQ0KPiA+Pg0KPiA+PiBXaHkgdGhpcyBpcyBwcm9wZXJ0eSBmb3Ig
RFQ/IEl0J3MgZm9yIHN1cmUgbm90IGJvb2wsIGJ1dCBwcm9wZXIgdHlwZQ0KPiA+PiBjb21pbmcg
ZnJvbSB1bml0cy4NCj4gPiBUaGlzIGlzIGkyYyBjb250cm9sbGVyIGZlYXR1cmUgZm9yIGVuYWJs
ZSBzbGF2ZSBtb2RlIGluYWN0aXZlIHRpbWVvdXQNCj4gPiBhbmQgYWxzbyBtYXN0ZXIgbW9kZSBz
ZGEvc2NsIGF1dG8gcmVsZWFzZSB0aW1lb3V0Lg0KPiA+IFNvIEkgd2lsbCBtb2RpZnkgdG8NCj4g
PiAgIGFzcGVlZCx0aW1lb3V0Og0KPiA+IAl0eXBlOiBib29sZWFuDQo+ID4gICAgIGRlc2NyaXB0
aW9uOiBJMkMgYnVzIHRpbWVvdXQgZW5hYmxlIGZvciBtYXN0ZXIvc2xhdmUgbW9kZQ0KPiANCj4g
VGhpcyBkb2VzIG5vdCBhbnN3ZXIgbXkgY29uY2VybnMuIFdoeSB0aGlzIGlzIGJvYXJkIHNwZWNp
ZmljPw0KU29ycnksIGNhbuKAmXQgY2F0Y2ggeW91ciBwb2ludC4NCkl0IGlzIG5vdCBib2FyZCBz
cGVjaWZpYy4gSXQgaXMgY29udHJvbGxlciBmZWF0dXJlLg0KQVNQRUVEIFNPQyBjaGlwIGlzIHNl
cnZlciBwcm9kdWN0LCBtYXN0ZXIgY29ubmVjdCBtYXkgaGF2ZSBmaW5nZXJwcmludA0KY29ubmVj
dCB0byBhbm90aGVyIGJvYXJkLiBBbmQgYWxzbyBzdXBwb3J0IGhvdHBsdWcuDQpGb3IgZXhhbXBs
ZSBJMkMgY29udHJvbGxlciBhcyBzbGF2ZSBtb2RlLCBhbmQgc3VkZGVubHkgZGlzY29ubmVjdGVk
Lg0KU2xhdmUgc3RhdGUgbWFjaGluZSB3aWxsIGtlZXAgd2FpdGluZyBmb3IgbWFzdGVyIGNsb2Nr
IGluIGZvciByeC90eCB0cmFuc2Zlci4NClNvIGl0IG5lZWQgdGltZW91dCBzZXR0aW5nIHRvIGVu
YWJsZSB0aW1lb3V0IHVubG9jayBjb250cm9sbGVyIHN0YXRlLg0KQW5kIGluIGFub3RoZXIgc2lk
ZS4gQXMgbWFzdGVyIG1vZGUsIHNsYXZlIGlzIGNsb2NrIHN0cmV0Y2hpbmcuDQpUaGUgbWFzdGVy
IHdpbGwgYmUga2VlcCB3YWl0aW5nLCB1bnRpbCBzbGF2ZSByZWxlYXNlIGNsbCBzdHJldGNoaW5n
Lg0KDQpTbyBpbiB0aG9zZSByZWFzb24gYWRkIHRoaXMgdGltZW91dCBkZXNpZ24gaW4gY29udHJv
bGxlci4gDQo+IA0KPiA+DQo+ID4+PiArDQo+ID4+PiArICBieXRlLW1vZGU6DQo+ID4+PiArICAg
IHR5cGU6IGJvb2xlYW4NCj4gPj4+ICsgICAgZGVzY3JpcHRpb246IEZvcmNlIGkyYyBkcml2ZXIg
dXNlIGJ5dGUgbW9kZSB0cmFuc21pdA0KPiA+Pg0KPiA+PiBEcm9wLCBub3QgYSBEVCBwcm9wZXJ0
eS4NCj4gPj4NCj4gPj4+ICsNCj4gPj4+ICsgIGJ1ZmYtbW9kZToNCj4gPj4+ICsgICAgdHlwZTog
Ym9vbGVhbg0KPiA+Pj4gKyAgICBkZXNjcmlwdGlvbjogRm9yY2UgaTJjIGRyaXZlciB1c2UgYnVm
ZmVyIG1vZGUgdHJhbnNtaXQNCj4gPj4NCj4gPj4gRHJvcCwgbm90IGEgRFQgcHJvcGVydHkuDQo+
ID4+DQo+ID4gVGhlIGNvbnRyb2xsZXIgc3VwcG9ydCAzIGRpZmZlcmVudCBmb3IgdHJhbnNmZXIu
DQo+ID4gQnl0ZSBtb2RlOiBpdCBtZWFucyBzdGVwIGJ5IHN0ZXAgdG8gaXNzdWUgdHJhbnNmZXIu
DQo+ID4gRXhhbXBsZSBpMmMgcmVhZCwgZWFjaCBzdGVwIHdpbGwgaXNzdWUgaW50ZXJydXB0IHRo
ZW4gZW5hYmxlIG5leHQgc3RlcC4NCj4gPiBTciAoc3RhcnQgcmVhZCkgfCBEIHwgRCB8IEQgfCBQ
DQo+ID4gQnVmZmVyIG1vZGU6IGl0IG1lYW5zLCB0aGUgZGF0YSBjYW4gcHJlcGFyZSBpbnRvIGJ1
ZmZlciByZWdpc3RlciwgdGhlbg0KPiA+IFRyaWdnZXIgdHJhbnNmZXIuIFNvIFNyIEQgRCBEIFAs
IG9ubHkgaGF2ZSBvbmx5IDEgaW50ZXJydXB0IGhhbmRsaW5nLg0KPiA+IFRoZSBETUEgbW9kZSBt
b3N0IGxpa2Ugd2l0aCBidWZmZXIgbW9kZSwgVGhlIGRpZmZlciBpcyBkYXRhIHByZXBhcmUgaW4N
Cj4gPiBEUkFNLCB0aGFuIHRyaWdnZXIgdHJhbnNmZXIuDQo+ID4NCj4gPiBTbywgc2hvdWxkIEkg
bW9kaWZ5IHRvDQo+ID4gICBhc3BlZWQsYnl0ZToNCj4gPiAJdHlwZTogYm9vbGVhbg0KPiA+ICAg
ICBkZXNjcmlwdGlvbjogRW5hYmxlIGkyYyBjb250cm9sbGVyIHRyYW5zZmVyIHdpdGggYnl0ZSBt
b2RlDQo+ID4NCj4gPiAgIGFzcGVlZCxidWZmOg0KPiA+IAl0eXBlOiBib29sZWFuDQo+ID4gICAg
IGRlc2NyaXB0aW9uOiBFbmFibGUgaTJjIGNvbnRyb2xsZXIgdHJhbnNmZXIgd2l0aCBidWZmIG1v
ZGUNCj4gDQo+IDEuIE5vLCB0aGVzZSBhcmUgbm90IGJvb2xzIGJ1dCBlbnVtIGluIHN1Y2ggY2Fz
ZS4NCg0KVGhhbmtzLCB3aWxsIG1vZGlmeSBmb2xsb3dpbmcuDQphc3BlZWQseGZlcl9tb2RlOg0K
ICAgIGVudW06IFswLCAxLCAyXQ0KICAgIGRlc2NyaXB0aW9uOg0KICAgICAgMDogYnl0ZSBtb2Rl
LCAxOiBidWZmX21vZGUsIDI6IGRtYV9tb2RlDQoNCj4gMi4gQW5kIHdoeSBleGFjdGx5IHRoaXMg
aXMgYm9hcmQtc3BlY2lmaWM/DQoNCk5vLCBpdCBub3QgZGVwZW5kcyBvbiBib2FyZCBkZXNpZ24u
IEl0IGlzIG9ubHkgZm9yIHJlZ2lzdGVyIGNvbnRyb2wgZm9yIGNvbnRyb2xsZXIgdHJhbnNmZXIg
YmVoYXZlLg0KVGhlIGNvbnRyb2xsZXIgc3VwcG9ydCAzIGRpZmZlcmVudCB0cmlnZ2VyIG1vZGUg
Zm9yIHRyYW5zZmVyLg0KQXNzaWduIGJ1cyMxIH4gMyA6IGRtYSB0cmFuZmVyIGFuZCBhc3NpZ24g
YnVzIzQgfiA2IDogYnVmZmVyIG1vZGUgdHJhbnNmZXIsDQpUaGF0IGNhbiByZWR1Y2UgdGhlIGRy
YW0gdXNhZ2UuIA0KDQpCZXN0IHJlZ2FyZHMsDQpSeWFuDQo=
