Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FAE6AB3F3
	for <lists+openbmc@lfdr.de>; Mon,  6 Mar 2023 01:49:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVKjb53kcz2xrW
	for <lists+openbmc@lfdr.de>; Mon,  6 Mar 2023 11:49:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=Xyv+/6SE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::70c; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=Xyv+/6SE;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2070c.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::70c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVKhr5xsmz3c8r;
	Mon,  6 Mar 2023 11:49:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WbQ7bnYCl83jYmZlRoPPQ+aHpHts6DmjeZGBR4VJY1QnIV3bwvS3LoqRPFAUlLW8QotnS3qa0tlpS8g/yrchIQrUOtVC0m27jWtUDGB0SWexwzPHJaIeb5hnvC8UFPqsFtz4L41oGQVAN7376PV7C38UCyuCBeBYXCRtJZoTWExeDsDQ3OYdpnc2XbOBsDrlR+gy8yb+sklvwzFYmekwYBJcDXfDRN4Kk1OAmwZasW/38IykjIt0KdbjzunX9SoTUV0oHsZ21BpaSmTRq6rq1qqmynuNzHd3o7tSgAGK/TRyjl7PF6a6izUpRRue8IqE94AcRmWt70H4RdgCZIVzhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FW8ETPhWF4iLuInhwBh0O3RNQXA0by4j83FY2En09I4=;
 b=TBCZ9NDKOmKNIYozKi56/L8hGGI78VeoTd4r5BJONHRXJGb6IOl/i2i2Kn6es5G4g2X6kIGPYoACa6jaSUJAmKoiIFWBVgBKvpxz3dJn6toZ41Za184h+psNldWI3ik3xHOnQGHeIBmeOuqcuVjOYunVb4+N74DFV3PaTnO740JuPhlI8HE1KY2v/rIoMkywhsHY91GUHds+OSrorl2ki6hhXiLLxM/CLS0IGSDwFxjtX9Wcr1qKkV2C134ESgeX7/P+G46aFdjTuxZBBULHqmldpOuK41hjROqbiMPaUfbMUSIBpeY46Z84KAwny0fU7n5yj4bwVCs7U/qD+ppN0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FW8ETPhWF4iLuInhwBh0O3RNQXA0by4j83FY2En09I4=;
 b=Xyv+/6SEkY5pE/nh/RdvK9xzjPXv/YlxwjJz1nriZeJv3t9pczjrvUtSC/pOCysjJ/Un7veKs9U3uLOTEdYBeG1Dz4nwI17iInllwWNrJC5xYOAwrANhx37FloKeJX38pWQ2YqpP4PvS2bStsbEchO7poGi2vbLxm8ZU0b0xQOV1houacuqWFFARMN4bM29iELdz6kMfqQ0hk6vkFrE0KTX/ac9+oVMi5ElbZWPP22kU7AmpXnHpu4M8BCJ3s0iM629cNQ/EdL0O2pkx1oP/rwPgrXtV0Nd5zDAMzfrvhy6hDrts4vf/4J+ODr8mDZld2uPRX5wZXH17wMYpkLfF4w==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYUPR06MB6149.apcprd06.prod.outlook.com (2603:1096:400:354::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Mon, 6 Mar
 2023 00:48:52 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 00:48:52 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Wolfram Sang
	<wsa@kernel.org>
Subject: RE: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Topic: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Index:  AQHZSZBNCqcj9BIMLU6U/5WV2MINja7idvcAgALva/CAA1hsgIAAAQawgAAHfwCAAAAwwIAACb6AgAANnCCAAAdYAIAA+HuggAIdpoCAAPm8QA==
Date: Mon, 6 Mar 2023 00:48:52 +0000
Message-ID:  <SEZPR06MB5269B541150855BF0DABFACFF2B69@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230226031321.3126756-1-ryan_chen@aspeedtech.com>
 <20230226031321.3126756-2-ryan_chen@aspeedtech.com>
 <53090449-58c9-bc03-56df-aa8ae93c0c26@linaro.org>
 <SEZPR06MB52699DEB2255EB54F35C2A59F2AD9@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <fc20a2d1-e2f9-c22b-dcdf-153cb527eea8@linaro.org>
 <SEZPR06MB526902637624A97D7DFB8523F2B39@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <c41ee6b5-ddb4-1253-de54-a295b3bab2cc@linaro.org>
 <SEZPR06MB5269E7B8785B3CB56A63A916F2B39@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <a3615fe7-aa2a-53e9-2732-ba4512b9369d@linaro.org>
 <SEZPR06MB5269E7B070B239F8E349C427F2B39@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <c5cf6e0a-05dc-dff7-6218-df0984d1ba47@linaro.org>
 <SEZPR06MB5269CB53B51B89C3CA039442F2B09@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <e59fe30a-75d1-eb59-52a3-014fe3c961a6@linaro.org>
In-Reply-To: <e59fe30a-75d1-eb59-52a3-014fe3c961a6@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|TYUPR06MB6149:EE_
x-ms-office365-filtering-correlation-id: 7b09ef86-75dd-415b-6d1a-08db1ddc8e72
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ufuga2hYRiirD00u8wezHPoHGRb+cbXMGBZcu+21kSUwipZHexNCZEVo68GX/oG+jM5TJMaUuPyuJ75SaGMGsvIb8oMdlCTMPTAtcb0RpT++8Ibhz6AZMprc4jeglopYcJKAg+UMWJ9LC6pbL0QM2+dBAOCOUlI3F/S5RGWANBf+nc4UGfy/IVbby0/g3gh7/yzweWFi6PW5RBr4D7Rxos5lVcOsIMq63BB2GpnpSwWmNbyW36A5PHYJE5XeoGEFJf5RS+LWlfXgiy4sNewb0Tgn89pqqwvpNXIAYI9f8pBqXSFThXU8+k8xdEoKTOOlk942CaArkoL9TST538KydNtnMM/tIO/YfWrigerjYoZYRqlz2FkIfYO3zikqlepmCAF6EfLKCq1kFMhijCvEr+0o0yrMqVJwwFpXCmfSCjgDPeV1aiTd+1J1mJvti1a6sfT5j4FUIeg0QaFHU8OlJ3JExzTTAdJdhfTDSoz2P+D8mTIhS2H9tcxfH+tyfpZwGdQhLpajbeDFEx0ZkMdM1116h2WWzWmUVXOPK1Rejap5TXm7ojcgUDtPsJLAsdbKB/AwbR/tFpYCnbZlSgx5jh9ARBqeJcno9eS/rSAhqqYwLyxDt7FyhHoH98C0Wg83aReR/inafO2HLr5tiT7EE/yVVSdeTSBF2QlUW7+BwgXavFptoLOQlMAK4hqPjfj9
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(376002)(366004)(136003)(39830400003)(346002)(451199018)(6506007)(53546011)(186003)(9686003)(26005)(478600001)(2906002)(38070700005)(71200400001)(55016003)(7696005)(38100700002)(8936002)(52536014)(966005)(122000001)(5660300002)(66946007)(8676002)(66556008)(66446008)(64756008)(76116006)(41300700001)(4326008)(66476007)(7416002)(33656002)(316002)(54906003)(86362001)(110136005)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?c3pKNmVsWXBsMVdES1cvTTYvQ3YzSmFuVFF2dnV5elRrZE5sU1RQWklTZEUy?=
 =?utf-8?B?M2hzS2pJWU1mRDJaUjFaejQ1aGRSdVRRcU5TM2kwZ1Brb0FGNS9QK1VXclNw?=
 =?utf-8?B?VDFuYWNJSm5kaDdENlAwOE1mRVhMN2tDcjI4RTVpZjJtaXJpaGZOK0RRbW1H?=
 =?utf-8?B?SnVyMXM2MjZrSTl5STVtL3kwMXR4cUdCN3VOYWlTU0czRzNkQlZGYkcwL29i?=
 =?utf-8?B?bzNNZjJnY3VVZTQ2TkUyL2dndU5Tb3VNUlh4OVF4RzV5djNTdFVwVC82VE8y?=
 =?utf-8?B?dG1USUlzTkN3WjI5emwzWHV6ajNodFNLYzk3d3lSdXhiV1I1blJXaXV3TXl2?=
 =?utf-8?B?cklnQUZXQS9mMXFWdmlqa1RIUXZhWmthUHB2YWk0dDZVQzNLMnI3ZDJiUlVX?=
 =?utf-8?B?bFcxYVkxWFhoK0ZsMkhnbnRLU3BFcXBvV2tONEZWMzZReGIrdDY3Y1JmK2NV?=
 =?utf-8?B?Ykl6aUFna2FQd0V5blhSTkVIUVRpUDV5WHZZTk1Ba2FBM0pvejhKbW1WMjg2?=
 =?utf-8?B?MTZ4YXROWFRWZkxsL1Bub3MxaEVIL2VYejJPNzJPK09LNFVBM0ZyU2Z5Y2U0?=
 =?utf-8?B?SDFjSnVLN2xDTmJiZGRIcGs3NXlMOFg1dzBYVHFaZUNhRXFJRkh4NHAwNm9x?=
 =?utf-8?B?M0FlZS9XM0E4d0Nockc3aWRhc2RJbkloQzgwbjgzakdLQ0tuQlgzOG40ZHpW?=
 =?utf-8?B?ZXZISEkza0J2TlNyVlJaNkx5c0dCNU82VFF3dnRXZ280S2lJSHhhUC9CWHQ3?=
 =?utf-8?B?c3FDMVAzYzRlSUxPSWNJREZqZGNnLytkbWJCdDVkeGJkMElnUXdzN1V1OStV?=
 =?utf-8?B?V1BzM3VhVm1rUWxNcVpFS1c5OVJmNkJkd1B0ZEM5ZUU1bGtNNENWV01acjJp?=
 =?utf-8?B?VnB0a3BVN2taYWs3cTZCMit1S003a2JqNktwWU9GTFRsTjVlamFQTk1qTG41?=
 =?utf-8?B?OTAwQjJPald4cUFOWnhvM2FYKzVwZVhpNy81MlA5a0o5cTRPL1N2UmVSV0kv?=
 =?utf-8?B?TkV6WExOeFpsQ1lydlQ2cHpZdjNGTVZPZXlKd0ZlaTUzVXdoOUVEbTRHY014?=
 =?utf-8?B?aUJnZXh2U0JyRnJYZFJaZFhvWURKMkp5K3IvNVgvZnc5S3dVb1dNZ0R1dnBX?=
 =?utf-8?B?cnNpWGZKTkJNa3RsYklxekgyQkNmaVRFbVVCNXR4OGR1VTdoZWJxL1hqR2tH?=
 =?utf-8?B?YkVVQUlBQ1BGazRMY3ZWM3QrM3lKd2lqN1RFamg3dEkyTU51dHVYNUtITHpq?=
 =?utf-8?B?Y3NnejYwbXR5Zm8xTmJHVE5zOEk1RDgvTjgvQU0rOThqbyswVFYrZmwrNmZX?=
 =?utf-8?B?ZDV4Z1lrL0JNYWVZWk1MWVJPSEQwcHhXUUFnVmQ0ZFRwTlhkZmwyZTFtUDA0?=
 =?utf-8?B?MmJtV0JOdVJ4U3VqakdXOERYZlpVY2ZSYldtaXRjUm0vaHFaTERybmJ3STBy?=
 =?utf-8?B?ZWFFYjFLOUVBeWFTdHdrelRJN2JHN1o4b0t3SWlxUlJQR3dvajFXU0NZcGFZ?=
 =?utf-8?B?NThJd0QxNGNXQ28vNEJBa0tRMWliTmx3Y0huRTR1YVFZOTR3YWQyRXlUVE8z?=
 =?utf-8?B?S1FhZExDQTVoOHJEMzVNaTIwenVnWXpqTGVtZUdlQWxqcnJQU0Z1eGt4ekxq?=
 =?utf-8?B?UmNIS3UzVk4zOTZuaFBDeG9UTFltdzB3SlEzNlRCcG8vVHQ4OWI0VkxYeVdx?=
 =?utf-8?B?V1dlU1ZuOURueFg0dWpiaWl3QVVFZnJ0ZGd0T0J4L2I3NmVnOS9vQWhzS1B5?=
 =?utf-8?B?MGo3WVhnTzNvZXdpT1gwSy9LMTdFbXlZYjYxUGJoUHVVaE4zZlArMDU3bW96?=
 =?utf-8?B?K2RUU051N0IzYUFWWUExbWg2QVBvRzNGeGpVeUcxSmppeW13MUdyYW52TCti?=
 =?utf-8?B?SnZ6RHBoSWxsamlzVjdkUVJKZmo3N1hYRnhsWEpBZWkzY1RpY0hXMzM2dlk4?=
 =?utf-8?B?eVpzREVuMzh5SlV4Wk9WM1lUZ2ZTYTNvd0VYZkFoblh2d2w5Vk4vS1NKMGlx?=
 =?utf-8?B?eG1hbGd4UUE1WThhNU44dWtuSGlXbGk2aTVIdW5idWZQaFdVOFZWUkJxUjVH?=
 =?utf-8?B?TXdhWjRQdEFIRi9ja0cvTFBFM1k5RDgyeEQzU1hoMXF3d1pRSjFIQ2RHeXo1?=
 =?utf-8?Q?oUZvuKMW21kJncYZ8fpI3qltQ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b09ef86-75dd-415b-6d1a-08db1ddc8e72
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2023 00:48:52.2619
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0kToxIZPDRlvuj/wWvIgn6NByE0ZfmDrLYoaObKPiRdkMV/I7UU6Lyo2z85d4oCiKdynHDnN22PV5pVKITcmoMCmbkBljomxz5SmxIrqcL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6149
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
U2VudDogU3VuZGF5LCBNYXJjaCA1LCAyMDIzIDU6NDkgUE0NCj4gVG86IFJ5YW4gQ2hlbiA8cnlh
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
VDI2MDAtaTJjdjINCj4gDQo+IE9uIDA0LzAzLzIwMjMgMDI6MzMsIFJ5YW4gQ2hlbiB3cm90ZToN
Cj4gPiBIZWxsbyBLcnp5c3p0b2YsDQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gPj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBs
aW5hcm8ub3JnPg0KPiA+PiBTZW50OiBGcmlkYXksIE1hcmNoIDMsIDIwMjMgNjo0MSBQTQ0KPiA+
PiBUbzogUnlhbiBDaGVuIDxyeWFuX2NoZW5AYXNwZWVkdGVjaC5jb20+OyBXb2xmcmFtIFNhbmcN
Cj4gPj4gPHdzYUBrZXJuZWwub3JnPg0KPiA+PiBDYzogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5p
ZC5hdT47IEJyZW5kYW4gSGlnZ2lucw0KPiA+PiA8YnJlbmRhbi5oaWdnaW5zQGxpbnV4LmRldj47
IEtyenlzenRvZiBLb3psb3dza2kNCj4gPj4gPGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJv
Lm9yZz47IEFuZHJldyBKZWZmZXJ5DQo+ID4+IDxhbmRyZXdAYWouaWQuYXU+OyBkZXZpY2V0cmVl
QHZnZXIua2VybmVsLm9yZzsgUGhpbGlwcCBaYWJlbA0KPiA+PiA8cC56YWJlbEBwZW5ndXRyb25p
eC5kZT47IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBCZW5qYW1pbg0KPiA+PiBI
ZXJyZW5zY2htaWR0IDxiZW5oQGtlcm5lbC5jcmFzaGluZy5vcmc+Ow0KPiA+PiBsaW51eC1hc3Bl
ZWRAbGlzdHMub3psYWJzLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn
Ow0KPiA+PiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBvcGVuYm1jQGxpc3RzLm96bGFi
cy5vcmc7DQo+ID4+IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmcNCj4gPj4gU3ViamVjdDogUmU6
IFtQQVRDSCB2NiAxLzJdIGR0LWJpbmRpbmdzOiBpMmM6IGFzcGVlZDogc3VwcG9ydCBmb3INCj4g
Pj4gQVNUMjYwMC1pMmN2Mg0KPiA+Pg0KPiA+PiBPbiAwMy8wMy8yMDIzIDExOjE2LCBSeWFuIENo
ZW4gd3JvdGU6DQo+ID4+Pj4+Pj4+PiBhc3BlZWQsdGltb3V0IHByb3Blcml0ZXM6DQo+ID4+Pj4+
Pj4+PiBGb3IgZXhhbXBsZSBJMkMgY29udHJvbGxlciBhcyBzbGF2ZSBtb2RlLCBhbmQgc3VkZGVu
bHkNCj4gPj4+PiBkaXNjb25uZWN0ZWQuDQo+ID4+Pj4+Pj4+PiBTbGF2ZSBzdGF0ZSBtYWNoaW5l
IHdpbGwga2VlcCB3YWl0aW5nIGZvciBtYXN0ZXIgY2xvY2sgaW4gZm9yDQo+ID4+Pj4+Pj4+PiBy
eC90eA0KPiA+Pj4+Pj4gdHJhbnNtaXQuDQo+ID4+Pj4+Pj4+PiBTbyBpdCBuZWVkIHRpbWVvdXQg
c2V0dGluZyB0byBlbmFibGUgdGltZW91dCB1bmxvY2sgY29udHJvbGxlcg0KPiBzdGF0ZS4NCj4g
Pj4+Pj4+Pj4+IEFuZCBpbiBhbm90aGVyIHNpZGUuIEluIE1hc3RlciBzaWRlIGFsc28gbmVlZCBh
dm9pZCBzdWRkZW5seQ0KPiA+Pj4+Pj4+Pj4gc2xhdmUNCj4gPj4+Pj4+Pj4gbWlzcyh1bi1wbHVn
KSwgTWFzdGVyIHdpbGwgdGltZW91dCBhbmQgcmVsZWFzZSB0aGUgU0RBL1NDTC4NCj4gPj4+Pj4+
Pj4+DQo+ID4+Pj4+Pj4+PiBEbyB5b3UgbWVhbiBhZGQgdGhvc2UgZGVzY3JpcHRpb24gaW50byBv
cmUgYXNwZWVkLHRpbW91dA0KPiA+Pj4+Pj4+Pj4gcHJvcGVyaXRlcw0KPiA+Pj4+Pj4+PiBkZXNj
cmlwdGlvbj8NCj4gPj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4gWW91IGFyZSBkZXNjcmliaW5nIGhlcmUg
b25lIHBhcnRpY3VsYXIgZmVhdHVyZSB5b3Ugd2FudCB0bw0KPiA+Pj4+Pj4+PiBlbmFibGUgaW4g
dGhlIGRyaXZlciB3aGljaCBsb29rcyBub24tc2NhbGFibGUgYW5kIG1vcmUNCj4gPj4+Pj4+Pj4g
ZGlmZmljdWx0IHRvDQo+ID4+Pj4gY29uZmlndXJlL3VzZS4NCj4gPj4+Pj4+Pj4gV2hhdCBJIHdh
cyBsb29raW5nIGZvciBpcyB0byBkZXNjcmliZSB0aGUgYWN0dWFsIGNvbmZpZ3VyYXRpb24NCj4g
Pj4+Pj4+Pj4geW91IGhhdmUNCj4gPj4+PiAoZS5nLg0KPiA+Pj4+Pj4+PiBtdWx0aS1tYXN0ZXIp
IHdoaWNoIGxlYWRzIHRvIGVuYWJsZSBvciBkaXNhYmxlIHN1Y2ggZmVhdHVyZSBpbg0KPiA+Pj4+
Pj4+PiB5b3VyDQo+ID4+Pj4+PiBoYXJkd2FyZS4NCj4gPj4+Pj4+Pj4gRXNwZWNpYWxseSB0aGF0
IGJvb2wgdmFsdWUgZG9lcyBub3Qgc2NhbGUgbGF0ZXIgdG8gYWN0dWFsDQo+ID4+Pj4+Pj4+IHRp
bWVvdXQgdmFsdWVzIGluIHRpbWUgKG1zKS4uLg0KPiA+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+PiBJIGRv
bid0IGtub3cgSTJDIHRoYXQgbXVjaCwgYnV0IEkgd29uZGVyIC0gd2h5IHRoaXMgc2hvdWxkIGJl
DQo+ID4+Pj4+Pj4+IHNwZWNpZmljIHRvIEFzcGVlZCBJMkMgYW5kIG5vIG90aGVyIEkyQyBjb250
cm9sbGVycyBpbXBsZW1lbnQgaXQ/DQo+ID4+Pj4+Pj4+IElPVywgdGhpcyBsb29rcyBxdWl0ZSBn
ZW5lcmljIGFuZCBldmVyeSBJMkMgY29udHJvbGxlciBzaG91bGQNCj4gPj4+Pj4+Pj4gaGF2ZSBp
dC4gQWRkaW5nIGl0IHNwZWNpZmljIHRvIEFzcGVlZCBzdWdnZXN0cyB0aGF0IGVpdGhlciB3ZQ0K
PiA+Pj4+Pj4+PiBtaXNzIGEgZ2VuZXJpYyBwcm9wZXJ0eSBvciB0aGlzIHNob3VsZCBub3QgYmUg
aW4gRFQgYXQgYWxsDQo+ID4+Pj4+Pj4+IChiZWNhdXNlIG5vIG9uZSBlbHNlIGhhcw0KPiA+Pj4+
Pj4gaXQuLi4pLg0KPiA+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+PiBBbHNvIEkgd29uZGVyLCB3aHkgeW91
IHdvdWxkbid0IGVuYWJsZSB0aW1lb3V0IGFsd2F5cy4uLg0KPiA+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+
PiArQ2MgV29sZnJhbSwNCj4gPj4+Pj4+Pj4gTWF5YmUgeW91IGtub3cgd2hldGhlciBib29sICJ0
aW1lb3V0IiBwcm9wZXJ0eSBmb3Igb25lDQo+ID4+Pj4+Pj4+IGNvbnRyb2xsZXIgbWFrZXMgc2Vu
c2U/IFdoeSB3ZSBkbyBub3QgaGF2ZSBpdCBmb3IgYWxsIGNvbnRyb2xsZXJzPw0KPiA+Pj4+Pj4+
Pg0KPiA+Pj4+Pj4+IEJlY2F1c2UsIGkyYyBidXMgZGlkbuKAmXQgc3BlY2lmaWMgdGltZW91dC4N
Cj4gPj4+Pj4+PiBCdXQgU01CdXMgZGVmaW5lcyBhIGNsb2NrIGxvdyB0aW1lLW91dCwgVElNRU9V
VCBvZiAzNSBtcy4NCj4gPj4+Pj4+Pg0KPiA+Pj4+Pj4+IEl0IGhhdmUgZGVmaW5pdGlvbiBpbiBT
TUJ1cyBzcGVjaWZpY2F0aW9uLg0KPiA+Pj4+Pj4+IGh0dHA6Ly9zbWJ1cy5vcmcvc3BlY3MvU01C
dXNfM18xXzIwMTgwMzE5LnBkZg0KPiA+Pj4+Pj4+IFlvdSBjYW4gY2hlY2sgUGFnZSAxOCwgTm90
ZTMgdGhhdCBoYXZlIHRpbWVvdXQgZGVzY3JpcHRpb24uDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gVGhl
biB5b3UgaGF2ZSBhbHJlYWR5IHByb3BlcnR5IGZvciB0aGlzIC0gInNtYnVzIj8NCj4gPj4+Pj4g
VG8gYmUgYSBwcm9wZXJ0eSAic21idXMiLCB0aGF0IHdvdWxkIGJlIGEgYmlnIHRvcGljLCBJIHNh
dyBmc2wgaTJjDQo+ID4+Pj4+IGFsc28gaGF2ZSB0aGlzLg0KPiA+Pj4+PiBodHRwczovL2dpdGh1
Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi9tYXN0ZXIvRG9jdW1lbnRhdGlvbi9kZXZpY2UNCj4g
Pj4+Pj4gdHINCj4gPj4+Pj4gZWUNCj4gPj4+Pj4gL2JpbmRpbmdzL2kyYy9pMmMtbXBjLnlhbWwj
TDQzLUw0Nw0KPiA+Pj4+PiBTbywgSSBqdXN0IHRoaW5rIHRoZSAidGltZW91dCIgcHJvcGVydHku
DQo+ID4+Pj4NCj4gPj4+PiBZZWFoIGFuZCB0aGlzIGlzIHRoZSBvbmx5IHBsYWNlLiBJdCBhbHNv
IGRpZmZlcnMgYmVjYXVzZSBpdCBhbGxvd3MNCj4gPj4+PiBhY3R1YWwgdGltZW91dCB2YWx1ZXMu
DQo+ID4+PiBUaGFua3MsIFNvIGNhbiBJIHN0aWxsIGtlZXAgdGhlIHByb3BlcnR5ICJhc3BlZWQs
dGltZW91dCIgaGVyZT8NCj4gPj4+IEl0IGlzIHRoZSBvbmx5IHBsYWNlLg0KPiA+Pg0KPiA+PiBO
bywgYmVjYXVzZSBub25lIG9mIG15IGNvbmNlcm5zIGFib3ZlIGFyZSBhZGRyZXNzZWQuDQo+ID4+
DQo+ID4gVGhhbmtzLCBJIHJlYWxpemUgeW91ciBjb25jZXJucy4NCj4gPg0KPiA+IFNvLCBJIG1v
ZGlmeSBpdCBsaWtlIGkyYy1tcGMueWFtbA0KPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxk
cy9saW51eC9ibG9iL21hc3Rlci9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUNCj4gPiAvYmluZGlu
Z3MvaTJjL2kyYy1tcGMueWFtbCNMNDMtTDQ3DQo+ID4NCj4gPiAgIGFzcGVlZCx0aW1lb3V0Og0K
PiA+ICAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzINCj4g
PiAgICAgZGVzY3JpcHRpb246IHwNCj4gPiAgICAgICBJMkMgYnVzIHRpbWVvdXQgaW4gbWljcm9z
ZWNvbmRzDQo+ID4gSXMgdGhpcyB3YXkgYWNjZXB0YWJsZT8NCj4gDQo+IFNvLCBsZXQncyByZXBl
YXQgbXkgbGFzdCBxdWVzdGlvbnM6DQo+IA0KPiAxLiBXaHkgeW91IHdvdWxkbid0IGVuYWJsZSB0
aW1lb3V0IGFsd2F5cy4uLg0KPiANCj4gWW91IHdyb3RlOg0KPiA+IGh0dHA6Ly9zbWJ1cy5vcmcv
c3BlY3MvU01CdXNfM18xXzIwMTgwMzE5LnBkZg0KPiA+IFlvdSBjYW4gY2hlY2sgUGFnZSAxOCwg
Tm90ZTMgdGhhdCBoYXZlIHRpbWVvdXQgZGVzY3JpcHRpb24uDQo+IA0KPiB3aGljaCBpbmRpY2F0
ZXMgeW91IHNob3VsZCBhbHdheXMgdXNlIHRpbWVvdXQsIGRvZXNuJ3QgaXQ/DQoNClllcywgaWYg
Ym9hcmQgZGVzaWduIHRoZSBidXMgaXMgY29ubmVjdGVkIHdpdGggU01CVVMgZGV2aWNlLCBpdCBz
aG91bGQgZW5hYmxlLg0KQnV0IGluIG15IHByZXZpb3VzIHN0YXRlbWVudCwgdGhlIGJvYXJkIGRl
c2lnbiBpcyB0d28gbXVsdGktbWFzdGVyIGRldmljZXMgY29ubmVjdGVkIGVhY2ggb3RoZXIuIA0K
QW5kIGJvdGggZGV2aWNlIGlzIHRyYW5zZmVyIHdpdGggTUNUUCBwcm90b2NvbC4gDQpUaGF0IHdp
bGwgbm90IFNNQlVTIHByb3RvY29sLiANClRoZXkgbmVlZCBoYXZlIHRpbWVvdXQgdGhhdCBwcmV2
ZW50IHVuZXhwZWN0ZWQgdW4tcGx1Zy4NCkkgZG8gdGhlIHN0dWR5IHdpdGggc21idXMgaW4gTGlu
dXgsIHRoYXQgd2lsbCBkaWZmZXJlbnQgc2xhdmUgY2FsbCBiYWNrLiBDb21wYXJlIHdpdGggc21i
dXMgc2xhdmUgYW5kIG1jdHAgc2xhdmUuDQpTbyBpbiB0aGlzIHNjZW5hcmlvLCB0aGF0IGlzIG9u
bHkgZW5hYmxlIGZvciB0aW1lb3V0LiANCiANCj4gMi4gV2h5IHdlIGRvIG5vdCBoYXZlIGl0IGZv
ciBhbGwgY29udHJvbGxlcnMgd2l0aCBTTUJ1cyB2Mz8gV2h5IHRoaXMgb25lIGlzDQo+IHNwZWNp
YWw/DQoNCk5vdCBhbGwgYnVzIGlzIGNvbm5lY3RlZCB3aXRoIHNtYnVzLiBNb3N0IGFyZSBpMmMg
ZGV2aWNlIGNvbm5lY3RlZCBpbiBib2FyZC4NClRoYXQgd2lsbCBiZSBzcGVjaWZpYyBzdGF0ZW1l
bnQgZm9yIGVhY2ggYnVzLg0KDQpCZXN0IHJlZ2FyZHMsDQpSeWFuIENoZW4NCg==
