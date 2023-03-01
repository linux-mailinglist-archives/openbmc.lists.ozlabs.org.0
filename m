Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F3A6A662A
	for <lists+openbmc@lfdr.de>; Wed,  1 Mar 2023 04:03:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRJvr0WPlz2yHT
	for <lists+openbmc@lfdr.de>; Wed,  1 Mar 2023 14:03:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=iXlqaQyr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::706; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=iXlqaQyr;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20706.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::706])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRJv21sZ1z306l;
	Wed,  1 Mar 2023 14:02:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CdqkGYi8fRoKiXjBp5XEuTAcIT0z7h2XPxva/GjkrMVnO3bUA0alRpWiq/0J4fRMTdaik4LU1BIBDSzeUfaGzJN2MaQrCWh3PWbEkmm/ST+5oNpLvHNIvxtybjUhtQKxtpOd0pEEMGNyt8I6u8wAPeXgB8l4/9kMqjuKxTH9fsV4E6z4ldPGTrsqjsllVHKNCI327JlqwSssOkFN3oIH9mQQQ93CTCpJiAgydrt17qIw+jsd7aZIB7Hb8FNOP+Ux0hX6zqprsnt0EpVtWgYemy+96UDK5Ef4suzsJnyZgtt7jxRSzldPHGkHNOU4JitHsDrx8nSvR63lD9c57Rluww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Nf28nVChX2z4Y39HsfNVg6IS6a64Lx8J4fraaeQsSk=;
 b=nX6Fm6jhjDuhEmQB7iZYGBb07q83GEBVsE71j1GHAEKN4LKAsrvDl0Bpy7+5syOwV06nSbGh0wZ+xnCx7OFzYSzftmM4KeQUmaaQDX6g+SFBs6X1SaAEMQAY6+dXmbk++Mhr2S3Az7FDB1U4EpC0WKbY8FyVHZq+d+bFR9mtph40qr2PDJC1WtZaQITbTdLnbtaHui00CkWlzMYI0S4dsNexbiI0ckpPXInsSY17K3dhCZJP6NudycYnUWm6rWZ+kGKm3/Am6JCgzi3/P33/UiTl8KuOBh6uV6avEvyNYu7jSw01n9Ih6QfapLDn0skWbMZW9hfw6WecH9cyxUGcDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Nf28nVChX2z4Y39HsfNVg6IS6a64Lx8J4fraaeQsSk=;
 b=iXlqaQyrpv2UiRxKHveTqI0YbD1UE6YEIItv8e0IJWRNuyz8G156bzMfwJQ9mywJat6lBITTEmHOXJQq9I18EjlX7mZZKYggdPIU6MbdO1w9kqJP/euB9rgTIpdGLE7E+U35XFaQzNIMY59RNhmOm2PCtNEgVrlKc1TIX7+Ua+nXCepSugRtniFI7tx0MApXFhDfkibl4jvMr/eTQoZfaNzXldJGxQ2Gg7wZ3pcDM1p43dxBtAOkay6p74yGb1wN3DbMsfud10moTbZ5vymLyCNvUIywwAfDWYRBOoX/a07ROrE142cQPKZi22B2rHrc3OoxG3ZDvsSf61jlmZRPkQ==
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PSAPR06MB4072.apcprd06.prod.outlook.com (2603:1096:301:31::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Wed, 1 Mar
 2023 03:02:11 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6156.016; Wed, 1 Mar 2023
 03:02:11 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>, Andrew Jeffery <andrew@aj.id.au>,
	Brendan Higgins <brendan.higgins@linux.dev>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Topic: [PATCH v6 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Thread-Index: AQHZSZBNCqcj9BIMLU6U/5WV2MINja7gzfMAgAFcBjCAAB7SAIAC81VA
Date: Wed, 1 Mar 2023 03:02:11 +0000
Message-ID:  <SEZPR06MB52695281E21B27DB57A7B2FFF2AD9@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230226031321.3126756-1-ryan_chen@aspeedtech.com>
	 <20230226031321.3126756-2-ryan_chen@aspeedtech.com>
	 <8999ef4a57b035a81b086d8732d119638d46968c.camel@codeconstruct.com.au>
	 <SEZPR06MB52699858C92383E8E07D0832F2AF9@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <f4cb3efc9825efa582aa94bd03657b1319ff38fd.camel@codeconstruct.com.au>
In-Reply-To:  <f4cb3efc9825efa582aa94bd03657b1319ff38fd.camel@codeconstruct.com.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB5269:EE_|PSAPR06MB4072:EE_
x-ms-office365-filtering-correlation-id: f14c9af8-a0ab-4ee6-5631-08db1a015a44
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  6hNdJu0DsxOWxoAp1U+k8DAfZ23jC2zfDC2PvKogi3BiEnScJ/o/w+c8B/RReu0KndOEBGFqKeyn3xwuJg5ZBAARenPUjtTUMtoTeV3mDwXI7+PxbmYsOg3qZXN/UGk4OHT65DmX+ReIkIiQvIxn/st0XAi3GUl2zVGrulZ83/iC4ppxcTVE0xzmbh7UCYBBlWdYLTiL7e1rBdlDHk5AkjbxsjawX4j2NEoObd7mniX8cFV6EiKWfSaJ+XzM7z2BmKWJT9Ua7ccaYDf5byvLDAkJWFLetEi1hPixZgrjav4xvA2NTb747/v4ur0GVXtstgBcbKr0S4Dwdx5ifYC4YtKRQgryEl1Rn3rWe4gt8AKJAx76404TjvjGwWnd8UNmPG8tRecPKoFKlLEuqhc8w3826wZc12yY6Rg1JN3dA2rpt/cY+dm1rKf6C6PfJ5f8GH3b+DXooUSzCLtNZdtqqIJ2Te8H7aZKojP547GAF9zOjNgWgTiJa61u9mhbivYUcTgN3C7mrO8noTa2i8BMZMMTs7/l/IQUU328VMOndzItsiXwO3v+ZkonNdBvoPMjp9KseK276gVp9gqiR0xEZTXF6t9P36mWkKWprDcrgKah1diIlHTnaXDPfAloGn435hXxEBRY3y96GNQvi2D3OFygdmqfA4A1/a8EU9+Tg8bBdctMQtiz7e1YQroLDPRsdJSHLGKRG5uNNqsROq9VePABXfRRF2WOjnMlMzw/IA8=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(376002)(396003)(366004)(346002)(39840400004)(451199018)(6506007)(26005)(186003)(53546011)(9686003)(38070700005)(921005)(83380400001)(86362001)(33656002)(38100700002)(55016003)(122000001)(41300700001)(71200400001)(5660300002)(8676002)(76116006)(66556008)(64756008)(66446008)(66946007)(2906002)(52536014)(8936002)(66476007)(7416002)(7696005)(478600001)(110136005)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UDFsc3ZwNmR4NXd3bDRlL1RCTEY1YW9qSUFJL25pOHlEUGloY0tBL3IweU9L?=
 =?utf-8?B?TG1weVI2dEo3akdsekhJWEFCZE1JbzVvNHhXYVBTeWwyaksxa0kySFZuSGJC?=
 =?utf-8?B?bDFDaVNsbkhYR2ZiUWs0akJYa3ZEeGcxU3NNbU9zcGFVODVDek9EaEN0UU5X?=
 =?utf-8?B?bU1TeUtQUFJmVHR3R25PU0NDTzR3SzVoeDhTRExwQytmYThWbnQwWHJoSVh2?=
 =?utf-8?B?MzRhL01FeHQvWnRUcXkwcHpadHdVcWJHMnJIekZ6YTFWcGY1bElvSWtnbHFk?=
 =?utf-8?B?ODZKVDVNeVlVRmRnRDBacWxZS3U5VTMxMzRhSkx3aEM4RHFkR29UcjcrYW56?=
 =?utf-8?B?SVZaN3c3eWhhMk9SN2NXd21aMVpRcGFlNlh1K3QwaDZsMU16RHpUS3orN0Ix?=
 =?utf-8?B?Rk5MZ3Y4cGh4N2JrRWROcjZrVElEWTBtbFQzS0kzejkzaFFjN1N1UnNHTjdq?=
 =?utf-8?B?bHNhYkFBUHRKZWIzZXJUaGpoRVVtRndZN3RPamExYkhRNFBQMGVEYnlLeldr?=
 =?utf-8?B?cHZmcGRaNkYxRjFRUXVBRGpWdFlka1FRK3oxSDcvR29Sa0p6WnVDbHFPWk1L?=
 =?utf-8?B?STI2UnZsTGFZenRvOVNzakphQjJRTytMQVZjanlsU0Y1M1M3bkZzalNhQzEv?=
 =?utf-8?B?M3JwSjNlNy9kbVVRT0daTHFQMkVlYVowSHJOK3BnRzF2UmZ6UnZsczVoV3R3?=
 =?utf-8?B?cGZZYUI3MElTaHhIQnp4VWFIRld3RGtNbzFqdW1aQVoyRDd2WjNmY3dlOHBG?=
 =?utf-8?B?N0tseXlTQ3p5Z011VldVRVkvdWx3Zk5OcTdZbVVDcjJDM0Ixejgwd21RQ3Mz?=
 =?utf-8?B?SEZNbXJIbFNXWGwwb0w3aG5zdnpOa0hzTVl2Y2NkZkNCc0RaeFVNQ05zQUdO?=
 =?utf-8?B?UVluUmQrWnFWU0J4eWRSbkwvY2RsMmcrc1FDMmtSUnZrZWVNK2VGVDNPd1Yy?=
 =?utf-8?B?NGtnRkJRM1QyNlJUVVJRY2JXRURycjZLSjYycHdJNGQrTGM0SlVQL2xUenZM?=
 =?utf-8?B?WHBVWkkyM3hRVzA5a2puajg2dTZQQ0ROTHBpcnJ3VzJ3cGVDSXFWaGg1dnV4?=
 =?utf-8?B?MnoxdnJ0dEVIQ1FsNGRJZm44NmhFNzlwUitnZXh4bUY2MFNRdzZHQUtZUU1L?=
 =?utf-8?B?a251SnAwUHJ3TWI2dzNVeFZlY052VmRDQTQvcmNiSTd1UDBQN1N2UitNM0Zs?=
 =?utf-8?B?aG50U2JTdlFEREVtQXUxWFl5ay9XRXc5TUFtWkxSRjRDZDBCTm1LUmhza055?=
 =?utf-8?B?QTJQUG9HVkl4bTZyMlBsNGdDVmFRbHEyeXpKc0tVUkVxREgyZGpDNk4wV1Vr?=
 =?utf-8?B?TlVJMU42Z1NkUEViZEdMTDRqUDYrT0dEazRnQnd3VFY0NUY1SFJSV0V0dHJN?=
 =?utf-8?B?aVJxbXM5VmRzNk1PTC9OZlU3eGt5QS92TjhGaTcyVkxzWDZ5VWFCaG5GbFhO?=
 =?utf-8?B?WUc1bmhVWDZTVnM2UDJTd3Y0cHNZSlJDbUhPSk1qN251eXpWZTU3MUZPUmtY?=
 =?utf-8?B?dU5nS3VLUVVaeFdub09tTldzdlNXUWltbG5maG14dEcvSk9zRHpZdUpGb2o0?=
 =?utf-8?B?SnlJVEJ1OXQrUmJrTDFWNy9uczhhT1BUbzZBc0ZHK3NlN0lXbllVRU9wV1RV?=
 =?utf-8?B?dE84REZOSXkxWmcrcEdmU3lnNHhZVWxkRFlBZm9aZ2p4eW42RERJdUZ6YUpy?=
 =?utf-8?B?NXd6V2ZkUEt1K0FVelQ2ZmdTeU9tREk1S25lRW1hOUNwSXAvQnI5bXM5MWNi?=
 =?utf-8?B?M0hQM3dqTmRwOWtSd1F5aW84bERnb1JmcUlVSGVDZnJ3QlUrSmsvSWgydVZG?=
 =?utf-8?B?N1JpemhTbGdnWElNVU9EZjdXdlJwK3dLQjdWTHUzSHpISFN6TnBDMi8zZzZD?=
 =?utf-8?B?WXVWWkJkTHduWnpIdE0yMWJQZlJiYldlL2tPcE1RNmxJZkxjNzJiTjlTYnZE?=
 =?utf-8?B?cVVKayswME4renRwemNtSmMwK2JzVEZiOGI4UlFhU0NCM1gxbVh5T3hla1Q2?=
 =?utf-8?B?MUgxVlZZWnFqdVlYY2dIVW5NNUpUOFBTcEt5azFBUW14cW5YMWd2M0xSWFgz?=
 =?utf-8?B?VXhuUmNuQzdVdXY0TGRaS3dkS3AraXQ2djhhM1JoaEplUWpud1VFTFAvOFBG?=
 =?utf-8?B?SFp5N0Nta0ZnTEptU1RUOTNEMWRCZDdKdEI3YUQ5UU5uVVlWSFdnemZSbjNG?=
 =?utf-8?B?Zmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f14c9af8-a0ab-4ee6-5631-08db1a015a44
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2023 03:02:11.4462
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tUIBJ608cDLRW9R7b4kiusEykhYp1aSaiqc+SH1mHnM3PYl3pOckQ1p7zgD57qm4CLvt+i3zFB6hq/CtzyFv6kAXkJC4c2ZrtpOnETewO3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4072
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

SGVsbG8gSmVyZW15LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEpl
cmVteSBLZXJyIDxqa0Bjb2RlY29uc3RydWN0LmNvbS5hdT4NCj4gU2VudDogTW9uZGF5LCBGZWJy
dWFyeSAyNywgMjAyMyAxOjQwIFBNDQo+IFRvOiBSeWFuIENoZW4gPHJ5YW5fY2hlbkBhc3BlZWR0
ZWNoLmNvbT47IEFuZHJldyBKZWZmZXJ5DQo+IDxhbmRyZXdAYWouaWQuYXU+OyBCcmVuZGFuIEhp
Z2dpbnMgPGJyZW5kYW4uaGlnZ2luc0BsaW51eC5kZXY+OyBCZW5qYW1pbg0KPiBIZXJyZW5zY2ht
aWR0IDxiZW5oQGtlcm5lbC5jcmFzaGluZy5vcmc+OyBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlk
LmF1PjsNCj4gUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3ps
b3dza2kNCj4gPGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZz47IFBoaWxpcHAgWmFi
ZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Ow0KPiBsaW51eC1pMmNAdmdlci5rZXJuZWwub3Jn
OyBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc7DQo+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3Jn
OyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IGxpbnV4LWFzcGVlZEBs
aXN0cy5vemxhYnMub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggdjYgMS8yXSBkdC1iaW5kaW5nczogaTJjOiBhc3BlZWQ6IHN1cHBvcnQgZm9y
IEFTVDI2MDAtaTJjdjINCj4gDQo+IEhpIFJ5YW4sDQo+IA0KPiA+IFllcywgSTJDIGNvbnRyb2xs
ZXIgc2hhcmUgdGhlIHNhbWUgZG1hIGVuZ2luZS4gVGhlIG9yaWdpbmFsIHRob3VnaHQNCj4gPiBj
YW4gYmUgZW5hYmxlIGluIGFsbCBpMmMgY2hhbm5lbC4gQnV0IGluIEFTVDI2MDAgaGF2ZSBFUlJB
VEEgIkkyQyBETUENCj4gPiBmYWlscyB3aGVuIERSQU0gYnVzIGlzIGJ1c3kgYW5kIGl0IGNhbiBu
b3QgdGFrZSBETUEgd3JpdGUgZGF0YQ0KPiA+IGltbWVkaWF0ZWx5IiwgU28gaXQgbWVhbnMgb25s
eSAxIGkyYyBidXMgY2FuIGJlIGVuYWJsZSBmb3IgRE1BIG1vZGUuDQo+IA0KPiBPSywgdGhpcyBp
cyBhIHByZXR0eSBpbXBvcnRhbnQgZGV0YWlsISBJJ2Qgc3VnZ2VzdCBwdXR0aW5nIGl0IGluIHRo
ZSBiaW5kaW5nDQo+IGRvY3VtZW50Lg0KDQpTb3JyeSwgRG8geW91IG1lYW4gYWRkIGluIGRlc2Ny
aXB0aW9uIGxpa2UgZm9sbG93aW5nPz8NCiAgYXNwZWVkLHhmZXItbW9kZToNCiAgICBkZXNjcmlw
dGlvbjogfA0KICAgICAgSTJDIGJ1cyB0cmFuc2ZlciBtb2RlIHNlbGVjdGlvbi4NCgkgIEVSUkFU
QSAiSTJDIERNQSBmYWlscyB3aGVuIERSQU0gYnVzIGlzIGJ1c3kgYW5kIGl0IGNhbiBub3QgdGFr
ZSBETUEgd3JpdGUgZGF0YQ0KSW1tZWRpYXRlbHkiLCBvbmx5IDEgaTJjIGJ1cyBjYW4gYmUgZW5h
YmxlIGZvciBETUEgbW9kZS4NCiAgICAgIC0gImJ5dGUiOiBJMkMgYnVzIGJ5dGUgdHJhbnNmZXIg
bW9kZS4NCiAgICAgIC0gImJ1ZmZlcmVkIjogSTJDIGJ1cyBidWZmZXIgcmVnaXN0ZXIgdHJhbnNm
ZXIgbW9kZS4NCiAgICAgIC0gImRtYSI6IEkyQyBidXMgZG1hIHRyYW5zZmVyIG1vZGUgKGRlZmF1
bHQpDQogICAgICANCj4gQW55dGhpbmcgaW4gdGhlIGNvdmVyIGxldHRlciB3aWxsIGdldCBsb3N0
IGFmdGVyIHJldmlldy4gSWYgdGhlcmUgaXMgZG9jdW1lbnRhdGlvbg0KPiB0aGF0IHdvdWxkIGJl
IHVzZWZ1bCBmb3IgYSBEVFMgYXV0aG9yLCBJJ2Qgc3VnZ2VzdCBwdXR0aW5nIGl0IGluIHRoZSBi
aW5kaW5nLg0KPiANCj4gPiBJdCBtZWFucyBvbmx5IDEgYnVzIGNoYW5uZWwgY2FuIGJlIGVuYWJs
ZSBETUEgZm9yIHVzZSBjYXNlLg0KPiA+IFRoYXQgZm9sbG93aW5nIGV4YW1wbGUgZm9yIGJvYXJk
LXNwZWNpZmljIHNlbGVjdGlvbi4NCj4gPiBJdCBpcyBkZXNjcmlwdGlvbiBpbiBjb3Zlci1sZXR0
ZXIuDQo+ID4gVGhlIGZvbGxvd2luZyBpcyBib2FyZC1zcGVjaWZpYyBkZXNpZ24gZXhhbXBsZS4N
Cj4gPiBCb2FyZCBBwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQm9hcmQNCj4gQg0KPiA+IC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiA+
IGkyYyBidXMjMShtYXN0ZXIvc2xhdmUpwqAgPD09PWZpbmdlcnByaW50ID09PT4gaTJjIGJ1cyN4
DQo+ID4gPiAobWFzdGVyL3NsYXZlKXwgaTJjIGJ1cyMyKG1hc3RlciktPiB0bXAgaTJjIGRldmlj
ZQ0KPiB8wqDCoMKgwqDCoMKgwqAgfA0KPiA+ID4gfCBpMmMgYnVzIzMobWFzdGVyKS0+IGFkYyBp
MmMgZGV2aWNlDQo+IHzCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHwNCj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tDQo+ID4NCj4gPiAtIGluIGJ1cyMxIHNpdHVhdGlvbiwgeW91IHNob3Vs
ZCB1c2UgRE1BIG1vZGUuDQo+ID4gQmVjYXVzZSBidXMjMSBoYXZlIHRydW5rIGRhdGEgbmVlZGVk
IGZvciB0cmFuc2ZlciwgaXQgY2FuIGVuYWJsZSBidXMNCj4gPiBkbWEgbW9kZSB0byByZWR1Y2Ug
Y3B1IHV0aWxpemVkLg0KPiANCj4gV2hhdCBpcyAidHJ1bmsgZGF0YSIgaW4gdGhpcyBjb250ZXh0
PyBJcyB0aGlzIGp1c3QgYSBzdGF0ZW1lbnQgYWJvdXQgdGhlIGFtb3VudA0KPiBvZiBleHBlY3Rl
ZCB0cmFuc2ZlcnM/DQpTb3JyeSwgSSBjYW4ndCBjYXRjaCB5b3VyIHBvaW50LCBmb3IgZXhhbXBs
ZSBmb3IgbW9zdCBzZXJ2ZXIgYXBwbGljYXRpb24gdXNhZ2UuDQpUaGUgaTJjIG5vdCBvbmx5IGNv
bm5lY3Qgd2l0aCBzbWFsbCBkZXZpY2UgKGxpa2UgdGVtcGVyYXR1cmUgc2Vuc29yLyBhZGMpLg0K
SXQgYWxzbyBjb25uZWN0IHdpdGggb3RoZXIgbWN1IGJhc2UgZGV2aWNlIHN1cHBvcnQgaTJjIHNs
YXZlLg0KTW9zdCBjYXNlIGlzIHRyYW5zZmVyIE1DVFAgcGFja2FnZS4gKGJhc2ljIDY0a2J5dGVz
KS4gU28gSSBzYXkgInRydW5rIGRhdGEiLg0KDQo+IA0KPiA+IC0gaW4gYnVzIzIvMyBzaXR1YXRp
b24sIHlvdSBzaG91bGQgdXNlIGJ1ZmZlci9ieXRlIG1vZGUNCj4gPiBidXMjMi8zIGlzIHNtYWxs
IHBhY2thZ2UgdHJhbnNtaXQsIGl0IGNhbiBlbmFibGUgYnVmZmVyIG1vZGUgb3IgYnl0ZQ0KPiA+
IG1vZGUgdG8gcmVkdWNlIG1lbW9yeSBjYWNoZSBmbHVzaCBvdmVyaGVhZC4NCj4gPiBCdWZmZXIg
bW9kZSBpcyBiZXR0ZXIsIGJlY2F1c2UgYnl0ZSBtb2RlIGhhdmUgaW50ZXJydXB0DQo+ID4gb3Zl
cmhlYWQoaW50ZXJydXB0IHBlciBieXRlIGRhdGEgdHJhbnNtaXQpLA0KPiA+DQo+ID4gLUJ1dCBp
ZiB5b3UgbW9yZSBidXMjNCB0aGF0IHN0aWxsIGhhdmUgdHJ1bmsgZGF0YSBuZWVkZWQgZm9yIHRy
YW5zZmVyDQo+ID4gKG1hc3Rlci9zbGF2ZSksIGl0IGFsc28gdXNlIGJ1ZmZlciBtb2RlIHRvIHRy
YW5zbWl0LiBCZWNhdXNlIGJ1cyMxDQo+ID4gaGF2ZSBiZWVuIHVzZSBmb3IgRE1BIG1vZGUuDQo+
IA0KPiBTbywgaXQgc291bmRzIGxpa2U6DQo+IA0KPiAgLSB0aGVyZSdzIG5vIHBvaW50IGluIHVz
aW5nIGJ5dGUgbW9kZSwgYXMgYnVmZmVyIG1vZGUgcHJvdmlkZXMNCj4gICAgZXF1aXZhbGVudCBm
dW5jdGlvbmFsaXR5IHdpdGggZmV3ZXIgZHJhd2JhY2tzIChpZSwgbGVzcyBpbnRlcnJ1cHQNCj4g
ICAgbG9hZCkNCj4gDQo+ICAtIHRoaXMganVzdCBsZWF2ZXMgdGhlIGRtYSBhbmQgYnVmZmVyIG1v
ZGVzDQo+IA0KPiAgLSBvbmx5IG9uZSBjb250cm9sbGVyIGNhbiB1c2UgZG1hIG1vZGUNCj4gDQo+
IFNvOiBob3cgYWJvdXQganVzdCBhIHNpbmdsZSBib29sZWFuIHByb3BlcnR5IHRvIGluZGljYXRl
ICJ1c2UgRE1BIG9uIHRoaXMNCj4gY29udHJvbGxlciI/IFNvbWV0aGluZyBsaWtlIGFzcGVlZCxl
bmFibGUtZG1hPyBPciBpZiBEVCBiaW5kaW5nIGV4cGVydHMgY2FuDQo+IHN1Z2dlc3Qgc29tZXRo
aW5nIGNvbW1vbiB0aGF0IG1pZ2h0IGJlIG1vcmUgc3VpdGFibGU/DQoNCklmIHNvLCBqdXN0IGxl
YXZlIGVuYWJsZS1kbWEgYW5kIG9ubHkgc3VwcG9ydCBmb3IgYnVmZmVyIG1vZGUgYW5kIGRtYSBt
b2RlLCBhbSBJIHJpZ2h0Pw0KDQpCZXN0IFJlZ2FyZHMuDQpSeWFuDQo=
