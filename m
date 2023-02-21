Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 264DB69D7EC
	for <lists+openbmc@lfdr.de>; Tue, 21 Feb 2023 02:13:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLLs80Pw2z3c6s
	for <lists+openbmc@lfdr.de>; Tue, 21 Feb 2023 12:13:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=YoXsx5wW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::707; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=YoXsx5wW;
	dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20707.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::707])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLLrN0F7lz3bVP;
	Tue, 21 Feb 2023 12:13:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nZgTYZ0TUK6VvraZF990GQvZwl3jpjdBuTruuVh5sHHVFg6m0MsIHmcr9xB445KAWNpVG2m61WHi7bQisfMtGWdEIzDoWRozu9oTsWiV8URASdmFQwdjs9XWv3eFl0eBqp4U99HUKhB0Z1/O8r9HmJ1dQYmbwMOw7NPYZ+xDwShai+klURgukvdHyUTpi24kVNhXho/IAkSq283YT7YfqJXNmhj9th5uz9IsSMpn4/Ny3UTqEkXjAVFf85TOzD/kW3xDvI+yCemTD4O0Djt7dxd2P0BCrxTojlRKXCwhBbgwHjs+nxTbvwYEa1C38sEuAwYE8lsvbemdkRvfUrPAUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AC9Fq9uilYHzcM3I7TI69CQt+4eX0Ijg44PgOk4bnn8=;
 b=MSE6ULY0VYBu6BFcy6WdAhmfNbd9SjURuoxG8Jtu2Bck1FKMbnLh8lVhtpy9eWDKWBLxRV8D9P7p5979E+JRJ5LlXGHulc/l8JcCLZP/mNiL+JiOp7sfWNG89cpnQx2L+Ly9IZ4G4180scvPhBUL1Eur9vLayblzLdiiky/T6SO/A2T8qeciO3Pz7b823ZSJ6uUFYyBaCBA+kzvPjfOFzA4aWiNmqzGJoNmvn5sEJRIy27NQ059kgyfDnrIl8aoAIdq1ekwGPS7jfZ1cLgxxQnutFb1FLCaUKZ/3eKq1g4q65k8Udi3eBLY8Id36u8wnpP0QS98OXN7PZSVvTUL0Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AC9Fq9uilYHzcM3I7TI69CQt+4eX0Ijg44PgOk4bnn8=;
 b=YoXsx5wWN9mqMXT7UdSE4YQQPcDNHofWCIQ9GyHLbnhSha4G7OwU84uW2v+Gwsbr1+iAqcx/X62VNtfKU7HGpr9c4PrIyHGU1FvSspij47eHBJvXv242DxtrCobdoZX6qXZIpkiu4enKmOr9hfup3TMz5eHDwMNVn5QRUlnZAE57+uoWakTXRF6iqq2BrI+qipMt1gseAwSk16BbwoMyy6QZXmUgz2G8RURFvFCQMXzuUEOrA/BarTSIT63C9ObxZ1JNzw5GTj5n4qn6Vuz6tmLR2cYCOPZgtPtQqQCbTo3aGHw/Ij7A+0Tx6GFbwUsgX1x1PIdAssFKbdzpI2WaFg==
Received: from TYZPR06MB5274.apcprd06.prod.outlook.com (2603:1096:400:1ff::14)
 by SI2PR06MB5385.apcprd06.prod.outlook.com (2603:1096:4:1ec::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.10; Tue, 21 Feb
 2023 01:12:47 +0000
Received: from TYZPR06MB5274.apcprd06.prod.outlook.com
 ([fe80::e7c2:8fd8:5892:6687]) by TYZPR06MB5274.apcprd06.prod.outlook.com
 ([fe80::e7c2:8fd8:5892:6687%9]) with mapi id 15.20.6111.009; Tue, 21 Feb 2023
 01:12:47 +0000
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
Subject: RE: [PATCH v5 0/2] Add ASPEED AST2600 I2Cv2 controller driver
Thread-Topic: [PATCH v5 0/2] Add ASPEED AST2600 I2Cv2 controller driver
Thread-Index: AQHZRPMQRsE7XcRDFESdaCc38f1sNK7XgUEAgAAXKSCAAAvLAIAA87Xw
Date: Tue, 21 Feb 2023 01:12:47 +0000
Message-ID:  <TYZPR06MB52743FC4ED5ED152446106ABF2A59@TYZPR06MB5274.apcprd06.prod.outlook.com>
References: <20230220061745.1973981-1-ryan_chen@aspeedtech.com>
 <54ef0dee-30dc-3ba9-d2f7-8270204b5505@linaro.org>
 <TYZPR06MB5274195CB92C4604280A776EF2A49@TYZPR06MB5274.apcprd06.prod.outlook.com>
 <abec828b-9b34-fc5a-cd36-8be6f20dfd25@linaro.org>
In-Reply-To: <abec828b-9b34-fc5a-cd36-8be6f20dfd25@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB5274:EE_|SI2PR06MB5385:EE_
x-ms-office365-filtering-correlation-id: 7481f973-35c7-4391-d392-08db13a8be67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  cqu0/pKbKJsyj60CwHGDJAmWzvnkH9AonPxtyqIHK/RXepLvd/qEtRY/Kp+gt/MfiO48dWYlMMwY5pnWufpiwCs+xDIljGM5ii9TRLGzp6oan/y2NDT67SDGJnw9pFr5lZ5gFRuy6SG7eXcjmHH69an0ySAHQYdXSVdMvWZdJJfP9AX8eXYIklHjNtOShh5LS8O7BB5Fp1xGmizSUy1vVSnWmh87Z9Y37HizaGuK62TlX1bIQa1Aj+6Ia/Qrhwj/C0GqWhCbrwXabcSzAFLqb+QEP11mbTsF5IHzRlJy2x+D1jw46RSu3FX8RmrTN2Wu7b+X0ve+q9pFUsKZVJJMVAm52eQPTiKP6jbC3RKXgOq/nakpQ1/TExcHk0f2OgvKidWucq6ncbBUD2bDI2nzWBYIcvws2s+MjkYuFtUL54diIqZKjkgAW7ZlZdYvUW4H5M21DKlqvMgEOnzBXhFQFGJUymUHyuT0PB6r45OqwGNHdQOsKGI7Sz2G8nsDcaprDm1zokiV5gtkOhfjsHFGKYnUMDE3BNpqm1sXFUc3zxgbx43l7KuDRvdnxmIJ69Aa2G8Dgm8tiNWvgEFdAmxJBZuR/XbFn0jiBBz9kgPeK1pYLkoyt5CRsUIfQkDxsKpTXcQvMr34plRC8vAEUqJ6ty5kVNVrMbqx0DcmuKxMUy9vwuCXs7CRgkXDxL2KBjrMNyePtOfF8Tj3G0NVG3oPvQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5274.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(366004)(376002)(39850400004)(136003)(451199018)(71200400001)(38100700002)(5660300002)(7696005)(2906002)(478600001)(316002)(76116006)(64756008)(66476007)(66556008)(86362001)(8676002)(66446008)(66946007)(38070700005)(52536014)(7416002)(8936002)(41300700001)(55016003)(921005)(83380400001)(110136005)(186003)(53546011)(33656002)(122000001)(26005)(6506007)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?YnNHUVc0NHlLdE41UlRDTmJUYXgxc285eUVVdm93dEhRbndjdm1KaW8wOEw1?=
 =?utf-8?B?ak1hZWh3RnJoVVZ1UmhHbklPY3lITGpKUkdQZUkxeFk0ZnpoWm01YWZJUTQy?=
 =?utf-8?B?bmFDL1IwRTlvWlB3ZFZKYkUyeGhKZURKajNzMkJlK3JXUm1wQVhCSmpRLzNG?=
 =?utf-8?B?cVd5OTNKU3ZrNUFTM3hYOEZwbG9icFRSeld3Nmk5YVpDZ2ZSUmdYcEwvdVND?=
 =?utf-8?B?ZGVvWXhWWjQvcGxUelExaDdZL2d4NFVqUDBEdXBncjNHZTg2cnZHYklpWit6?=
 =?utf-8?B?bm53dFhHeE5zK3ZienJuQ2J1WlErVDIvWndCZGN1QzEyZ0hjczlQSGVWbDFq?=
 =?utf-8?B?OTlnOFpsWE9KSk1nbVpCNTUwSzdSY2VSVzhsNFl5cWp5Zm1ab05aUllieWVI?=
 =?utf-8?B?K2ViblZlSDVkWUNMdCsxaE9HdlNkQjkyWHBRMThmY2ZyWWNkZ3pWTFVnb29K?=
 =?utf-8?B?RThGWnY1dkdvMDQ5UERjTjhNKzRJZzgySXdBUnlZN2RLa21sWUdEaWZDUUc5?=
 =?utf-8?B?ZFJkdzcrdGUzUGtmUkpNY2dhL215VVhWMk0wQXVYMnlSUUJpaGJERWp5dXFj?=
 =?utf-8?B?WlhOMkd4OHBFV3Y5bzVhWDFvQ09DZTdqb1E1eVYrb2Niemh3NHg1a3V1TEU0?=
 =?utf-8?B?TmJWYUpOc1B4YTBEb3hzeU9ucG9Pd244bEFta2tOREMrQkt2YkdpcXRKbXVH?=
 =?utf-8?B?V0xpWW5HQ29URTcvalBMNWpFVjlpb2xkK3FhNlhtZFpYUEJmK2NQODZJejNZ?=
 =?utf-8?B?WDNsQUswR0Z6TEpHZVg2dWhHWHdIRmVNSFlTU3NDREcwV0Z5Q0VtQkhHS0NR?=
 =?utf-8?B?OCtuMDlCM0dJS25sMUZCQmd4QnMwZHBSazg0cmhNMW1iYWZxbFFTbTY2VFcz?=
 =?utf-8?B?VytMbXRZMVFDWkp2a3N0enp6bENpaEk3czFTWW9hM3lkS3BXVGJCVDdidmJo?=
 =?utf-8?B?aGRmeDEyM0pnVnRCS0NsYlZtTk9ocU1RVmpBeHJpTVBYbmhTb0w2bE5wMk9r?=
 =?utf-8?B?clBxT2RSZFAvMjJ2dmpRelFvM0EwSS9uU1grRXVuVThnaXMvM2dEUzdUYmxZ?=
 =?utf-8?B?bEpaTFMrQ2Z3c25oWElneVlFRlN6S0poQVVndU10WFRyNWt1a0FqVHNXb3Ri?=
 =?utf-8?B?TERMLytSWmVFeGpuOW0vTS9rS1h6YWlXR0ZIRnhSN1VCb1EzZXVlMVBvYUNy?=
 =?utf-8?B?UGhia2ltRUF3Y1QrWE9KUjdic3crWnRKU3hjVFlTUlNKRnUwVWhJaWtxRzRP?=
 =?utf-8?B?ejBwWEw0Q1gxYlBqeFNsRWMrUzRvaDMvcWg5QklEc3ZYYXRaNkdwVWh5em5K?=
 =?utf-8?B?VHFBS2VPSmpENzE1M2p3Q2cwdlZPMkRoYXFhMXB4OFJLd2oxVU9pdFNYVXZw?=
 =?utf-8?B?cEQrN0VxcytZY2Q0SHJ6NHdBN3pHQlk1YmNtWGpKMzBGbHVaZjRaK1FGekcz?=
 =?utf-8?B?K2QyY2dwbE9qOEs5RG5JQWUxMUdxNVZQRjRBVGR0UzJHSUFtVld1TnhTSjRX?=
 =?utf-8?B?WWtCcG5HQVhyaXV1djdsZTVDM2JydmRvcHVSN2RSUWpYQURpTENjQjNsQ3JS?=
 =?utf-8?B?Y3l6ejFXZlNMN0pzZGxTT3dWWWk2SUFKaG1yTWtOSERIakVrcEgwRGNyMStp?=
 =?utf-8?B?N05UNWdXZEFnQ0VoME4xZERKVDBMcUo2OGpTd0ZZNHdoN3h5YmdMS2FxU3k0?=
 =?utf-8?B?cXR4SzByK2tjZjJPTWZGNHVrbGVoTTlPRzB6VDg4YmRFL3JYSk11cVplV1p5?=
 =?utf-8?B?NG5kV3A5TEJnUWFZSmRTNWV6RGJycDZkTFo3WHFQaTZvSlRRTUFBRFhaTS9X?=
 =?utf-8?B?dGpJN3NqQklWeUh4MXBiVnhJQ2ttaXdpaWdPdm1KVHg3M05oU08vN0ZtVjRk?=
 =?utf-8?B?eE1XVms4SDd1dkhQNHhzT2RkcFVjaVMxeFNmNE5ZYXdIalIxOU10VlNJMXN6?=
 =?utf-8?B?RG1yMEtaQitpVFFiZmxROU9WU1lYNzF1NCtKRWVna3ErdDRrcnJWOGdJSXJo?=
 =?utf-8?B?N3lla3ZDY2syTXN2anRlNStNMDRrR1orUjZxVnRVamRKOXdSVVorUVlteFBB?=
 =?utf-8?B?R3ZpTmVYOVRXdnFjZG1mN1pyWit1R3l0bEtWa0NLWUcyQU4wVHkyT0tkMnBx?=
 =?utf-8?B?NTVLMjhEeWo5eGxQajNQLytDVVNmMGNOZ05CeGUyc0ltb2NzSFhUWko2QVRp?=
 =?utf-8?B?V3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5274.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7481f973-35c7-4391-d392-08db13a8be67
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2023 01:12:47.2341
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wDpItuJcXdnHFRTbY1ahGAs83TOmcL79mX9p2A99nd904rWrLMwk4cw5RWFXknSsYrZEc+mrXsryk+yccvoIUDfcg89uiqYhZ4ElH/lNvjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5385
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
PiBTZW50OiBNb25kYXksIEZlYnJ1YXJ5IDIwLCAyMDIzIDY6MzYgUE0NCj4gVG86IFJ5YW4gQ2hl
biA8cnlhbl9jaGVuQGFzcGVlZHRlY2guY29tPjsgUm9iIEhlcnJpbmcNCj4gPHJvYmgrZHRAa2Vy
bmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kNCj4gPGtyenlzenRvZi5rb3psb3dza2krZHRA
bGluYXJvLm9yZz47IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+OyBBbmRyZXcNCj4gSmVm
ZmVyeSA8YW5kcmV3QGFqLmlkLmF1PjsgUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25p
eC5kZT47DQo+IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnOw0KPiBsaW51eC1hc3BlZWRAbGlzdHMub3psYWJzLm9yZzsgbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDAvMl0gQWRk
IEFTUEVFRCBBU1QyNjAwIEkyQ3YyIGNvbnRyb2xsZXIgZHJpdmVyDQo+IA0KPiBPbiAyMC8wMi8y
MDIzIDEwOjU2LCBSeWFuIENoZW4gd3JvdGU6DQo+ID4+DQo+ID4+PiBBbmQgYWxzbyBoYXZlIHNl
cGFyYXRlIGkyYyBtYXN0ZXIgYW5kIHNsYXZlIHJlZ2lzdGVyIHNldCBmb3IgY29udHJvbC4NCj4g
Pj4NCj4gPj4gU2luY2Ugc2V2ZXJhbCBvZiBteSBxdWVzdGlvbnMgcmVtYWluZWQgdW5hbnN3ZXJl
ZCBhbmQgcXVpdGUgZnJhbmtseQ0KPiA+PiBpdCdzIGZydWl0bGVzcy4uLiBzbyBsZXQgbWUgcmVh
ZCB0aGUgY29tbWl0IG1zZyBkaXJlY3RseSAtIGl0J3MgdGhlDQo+ID4+IHNhbWUgZGV2aWNlLCBq
dXN0IHdpdGggZGlmZmVyZW50IHJlZ2lzdGVyIGxheW91dC4gSGF2aW5nIG5ldw0KPiA+PiBjb21w
YXRpYmxlIG1ha2VzIHNlbnNlLCBidXQgdGhpcyBzaG91bGQgYmUgcGFydCBvZiBvbGQgYmluZGlu
Zy4NCj4gPj4NCj4gPiBTb3JyeSwgSSBhbSBjb25mdXNlZCwgRG8geW91IG1lYW4gSSBzaG91bGQg
YmFzZSBvbiBvcmlnaW5hbA0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9p
MmMvYXNwZWVkLGkyYy55YW1sDQo+ID4gQWRkIG5ldyBjb21wYXRpYmxlPyBOb3QgYWRkIGFub3Ro
ZXIgYXNwZWVkLGkyY3YyLnlhbWwuDQo+IA0KPiBZZXMuIE5ldyBjb21wYXRpYmxlIGFuZCBuZXcg
c3lzY29uIHBoYW5kbGUgKGNvbnN0cmFpbmVkIHRvIHNwZWNpZmljDQo+IGNvbXBhdGlibGVzIGlu
IGFsbE9mOmlmOnRoZW46KSB0byB0aGUgb2xkIGJpbmRpbmcuDQpUaGFuayB5b3VyIGd1aWRhbmNl
Lg0KVGhlIGZvbGxvd2luZyBpcyBteSBzYW1wbGUgbW9kaWZ5LCBpZiBteSB1bmRlcnN0YW5kIGlz
IGNvcnJlY3QsIEkgd2lsbCB1cGRhdGUgaW4gcGF0Y2gxIHRocmVhZCBkaXNjdXNzaW9uLg0KSSBu
ZWVkIGFkZCBpbiBvcmlnaW5hbCBhc3BlZWQsaTJjLnlhbWwgbm90IGFzcGVlZCxpMmN2Mi55YW1s
DQphbGxPZjoNCiAgLSAkcmVmOiAvc2NoZW1hcy9pMmMvaTJjLWNvbnRyb2xsZXIueWFtbCMNCiAg
LSBpZjoNCiAgICAgIHByb3BlcnRpZXM6DQogICAgICAgIGNvbXBhdGlibGU6DQogICAgICAgICAg
Y29udGFpbnM6DQogICAgICAgICAgICBjb25zdDogYXNwZWVkLGFzdDI2MDAtaTJjdjINCg0KICAg
IHRoZW46DQogICAgICByZXF1aXJlZDoNCiAgICAgICAgLSBhc3BlZWQsZ3INCgkJLWFzIGlzLg0K
DQpCZXN0IHJlZ2FyZHMsDQpSeWFuIENoZW4NCg==
