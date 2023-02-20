Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C753A69C819
	for <lists+openbmc@lfdr.de>; Mon, 20 Feb 2023 10:57:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKyWM4dygz3cBp
	for <lists+openbmc@lfdr.de>; Mon, 20 Feb 2023 20:57:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=hy0oVyWV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::720; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=hy0oVyWV;
	dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20720.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::720])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PKyVf43Mnz3bjw;
	Mon, 20 Feb 2023 20:56:25 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WXleuJU6oBURF8aYlRUQ+dEdAhbQ7UUPoW67DtEMFN6WglwD4l5hYX6wY42+JLsNZhkoJhkITEqR6CNAEJXtlwLzd/iG6oLm1fNzACeU1+cO+41lxuK0p8c7RiNPHhy2eWrnSkKKcqoronQBfKwN8wRPjukAb2yn4hS4a4aT+FqEpMdH6t8fBYW4JxTmjuSGpfynL8iOnNwzozqUVKzzI6gIbIY12yT3jD/DgjNm4Sg7pQt2IdkGcf90iRQpaQYVBSYDOStFO/hS96ebXizU3x9b53DQmv7HF6lDDY6TAfwoH+BQ0NFmc/IYdx9JfPhFseztsFUA97MeVwNOLm3/tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rE+1bJLg155VmtGl2JrpQcgNdAPhXCjiNiqaBBIJX78=;
 b=UCnB5VPKRIPH2qL/hb6qdQIyltP3UCNZ1X1MTY/C5Kb/jyOs/CsOw7aiQVNsED6zPkvKJSUN9avo1R6e0X34zjAPLjzhlqBwGJmVVUKF/wYZGu3VqKiNVSVa6U7WYskOhpflhIyg19rfbKvCVDNDfuE9DiY4fv06Psd0z8WNXKzaClxgwnLRNJkoiJzVntJe2Z81chiAmYlQO6fTVWsYDsptckUAnHLxqWJQyaulVCKXYL4rYZBD8bZkqVS2V0++e+EZUxDwaP5cAKT75Au6Rwg98EEyysfZYDhO009tYGHBWl9ygPDPnoUZ2nb7A/0tQdjK66kVW6VkvseVUQTgWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rE+1bJLg155VmtGl2JrpQcgNdAPhXCjiNiqaBBIJX78=;
 b=hy0oVyWVmLAMaeeVZ9ueiVFDBmL/Ux+9BQMDJkees/yatd6x73m4IySRVlVeUHmI0JwesjDZVxAYffTSr7FuMotrUTwJD3U1QiGIaqMOzJHqGXrL9tTIfBOzrjHus/9U39InY/Npdjl+I8jiNpnAzpaS0f0MoFKkag+coMeZJA2pp5U3Ob4EE/6nzMv5u7lVdRTYUpOEI5S3eqRDpvWATVruOTw12rrBrXa10FI8+jXEhxAdKbbTCistt7ITu8lQAfDC9fwOS6gRmBNbEyeii9RWonw/B/LWkvCi1kIbjYTfe73bT78e6G50Anr02848CBgJRmZXwD4JzTraHuJddg==
Received: from TYZPR06MB5274.apcprd06.prod.outlook.com (2603:1096:400:1ff::14)
 by SEYPR06MB6084.apcprd06.prod.outlook.com (2603:1096:101:d9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.14; Mon, 20 Feb
 2023 09:56:04 +0000
Received: from TYZPR06MB5274.apcprd06.prod.outlook.com
 ([fe80::e7c2:8fd8:5892:6687]) by TYZPR06MB5274.apcprd06.prod.outlook.com
 ([fe80::e7c2:8fd8:5892:6687%9]) with mapi id 15.20.6111.009; Mon, 20 Feb 2023
 09:56:04 +0000
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
Thread-Index: AQHZRPMQRsE7XcRDFESdaCc38f1sNK7XgUEAgAAXKSA=
Date: Mon, 20 Feb 2023 09:56:04 +0000
Message-ID:  <TYZPR06MB5274195CB92C4604280A776EF2A49@TYZPR06MB5274.apcprd06.prod.outlook.com>
References: <20230220061745.1973981-1-ryan_chen@aspeedtech.com>
 <54ef0dee-30dc-3ba9-d2f7-8270204b5505@linaro.org>
In-Reply-To: <54ef0dee-30dc-3ba9-d2f7-8270204b5505@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB5274:EE_|SEYPR06MB6084:EE_
x-ms-office365-filtering-correlation-id: 099e2cc5-090f-4d79-40b8-08db1328ae43
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  eIQ8Zfcd7mKOAxZNYMIUZSo147J1V86eFEApbenIzPB61UIoD/Dtq+99DjZhCSv/ceKbUyhywFLHFTiYqCdl3DZ6F8CKclQfiHEa8ZmBP15Q/MNfXM18+EhcfJWTuxUp5oS0Na23wB7iC6c71G51zPIyb9aagYs/qbiMV0EPdPIJwu5MDA1Y2Cha1oBZi0qqDpWAJdgzn4dXPbvoHiw5k/p+6JJAzInhml+PIi3bpsu/3p9toRQ4JaRGJnENpH6eIDl8yHEl5+WqQmrf3YudqGq0jE678NFcuOMkvPGEHBgJVWqayHvQJmORWpT8zMLzor6U+TZIUxhyt4FoOHi3LltMpiYI3ysDQyUDLxapQjqw6TVeLDkd91n/gQkmchTMRs4z4QloSztI2HrTKyfLN5d8EtPvq+lNBnhJo6DwhpC0gmUb1Cyj9+RhLaKcjXkEmGEcBSDEq9jNbyrEgLjL5It0zZhKwQnLZ+i3PJbAxT497/UVzcyG60FJAlTkvchtu5pek61p5grqx9r0oBcv/HcKJXgLduS2vaieM8dOyUmXWwp01C92uGUXtTSk+FfcBUyChlOr/EGgUfo2BKa3zEn3rLf5UaLbh6Fa2261RfNvPLPopyZnlGP2O1RQAewE3PTAi/Y5jUHWDlSLM7lAFlVfjSQacW/iU3Mna6tTWjK6SH1WEezmDyoRVV650R4Il05DSztD43py8c+U6QoH2hXIQat5EozybP/Vevy2h6w=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5274.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(396003)(136003)(346002)(376002)(39850400004)(451199018)(110136005)(5660300002)(7416002)(86362001)(316002)(478600001)(9686003)(186003)(26005)(33656002)(83380400001)(52536014)(66946007)(7696005)(76116006)(2906002)(66556008)(66476007)(8676002)(71200400001)(64756008)(66446008)(8936002)(38070700005)(53546011)(6506007)(55016003)(921005)(38100700002)(122000001)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dDhzT3lwdU13NmM2N2h3YVZUSWFTRjVkMDh4VS9HZFFRbkJOVkZUQkhMODNl?=
 =?utf-8?B?eFZBQ2xnY1p5VlZNUC9IWEc1L29vMDVmbW56bFBDRkNXME1SdzFGYzFYeldY?=
 =?utf-8?B?WDNMOEM2M3VvcGZJWXhaOWV3U1Z5TjcrWGswMFBUeXNRZ21xeS9NVW1rdEF4?=
 =?utf-8?B?SWV5dHVDdmJabDZFUEJpeXFFRFBRcFZDRGJvQWdhQVdUcTdyem9OT1haTVlE?=
 =?utf-8?B?bUs3aU9QYTRTdW5UYmtYUm5Nbk05TGtETlROQm42VEtja1MrRFFtNmo4M2hQ?=
 =?utf-8?B?RFQ1YjB5YWNPMmtqR2xraGFDVEZtekt2WU5vcUQyNGNiRjY4eWVRczRXMTZl?=
 =?utf-8?B?eTY0bEtwTXZDc2dKY09SV21QeVhySDdEai9Ld3RIWGE2em9nNXYrREJFS1VP?=
 =?utf-8?B?QmIzcjRPaDhUZ3V1TTE0a2Q0Tm9GM0swR2pBaVU5UHI3ZTBJS1BsOTlhdHll?=
 =?utf-8?B?MjZRVCtIREFQV29mbE5CTW1pYzFHTTh6UkNucHZ5bytkTFU2K1JxaUFvUFRG?=
 =?utf-8?B?Nkl1K2dRc3RoOEVUK2FQVXFIRWJ4ZXlJdkdET0xJb0ZtM2dsbnEyaWVNL1Zo?=
 =?utf-8?B?TC95ZDNKSU5kSXhuSHMyTzBuZUpmempvY0FkZUtsLzNXaHJyeWdwL2NVaGxJ?=
 =?utf-8?B?ZWI3MzlpUEtwUUJKdk5HZUtzclNSU1pXcjJ5NjExVS9PMlQzNnp0Yy9mNHd3?=
 =?utf-8?B?bUU4cEhWMk5tM0xuYVN4dDQ2elFiM3FEYnc2N2E5aUhNNmdoZHpUTVB4M3J6?=
 =?utf-8?B?cXgvMVdhSWtkV0lzMWpNTUNDdlJVLytaQVdnWWFHUnhOdC9yQTZ3bTl2UlRB?=
 =?utf-8?B?ekgzd0JBckhRWTAvM1dkcnFNa3dQdmdBSExDajFtSWx4MEVCVDZDak4ybEdG?=
 =?utf-8?B?QUJJUStTTCtGRUJUVTBYY1plWDE0VVlKTDg4Mi9MYkVxRGFKT1pBck5tbjNR?=
 =?utf-8?B?a0N4dXUxSE5qVWl0b3FVOXY0TmMrZXpBQVEvS05KdHozN0FoSzFHeEthbDZ1?=
 =?utf-8?B?SG0zVXArd2FmSmxnbjRyKzdaWGo3TVdqcEFzZ2VpTjFMRkpsNlFRb1NzY3No?=
 =?utf-8?B?UnNZUGI2R3pyN2tMV3l2SXFHVjBSQVRoaUliRFFxZGtJSFZaMGZXYlphNXBI?=
 =?utf-8?B?OVJQYkE0eS81LzVJYkhvVXU0TVYvWE9ONWpPb3JoVnQ5MjdqbXJxZ0hEd0JN?=
 =?utf-8?B?K1hRUXR4K0hRY1Y1Umg4TU1KYXVVSDNuSDRtOE5wN1gvRHNBOGZMT3hKTGsx?=
 =?utf-8?B?OURIVVdjNXNPK3JCcFVsM204WHdwTDBOYjNxUENkeVFoc1FkR2hmdnBWTExm?=
 =?utf-8?B?eVordEFpaDFwQ0JRaVRTZk1LQkF1Nm9MQUNibUxqZW43aUt1M2JIeE80UXk5?=
 =?utf-8?B?dmkrZGtqNmNVMFBZMjlJYzY0dGJtYTZjc3VOYkpEcWo1U0wwQXpuajVZTDVG?=
 =?utf-8?B?Y1pVOGlVS3F1STd1bzdveFg5eENkYXF1NjRrWXhLaEVENmxVSWZFclFueU1P?=
 =?utf-8?B?b2IyaW9oaTlvNDZOM2hNaUJNQWJ2ZysvZ3E3amdOY1dJRWRlZDFQOFZMY0tV?=
 =?utf-8?B?VUZnZm5abXROTjVybUJWRUZveFNDV1BnKzZiTTBXVzg5aVBnaDJoV2FqL081?=
 =?utf-8?B?T3grcVhERERlK2JTeHoxVkpPVFNKOEhvdE5EMzlXVUhxRzBlNDgzQUs0Sk13?=
 =?utf-8?B?UmtMZ0VoY1hoQXBOZm9wKzlNZ1BGc1lFRlE3eG9Fdm4xcHd3RS9wd2h6c2JU?=
 =?utf-8?B?YWlVYldrUWs2M0x3ZDcyUlpHVGtZZm1BVzN4RVcrdXJ1TTlPSjBzQmd3dXd1?=
 =?utf-8?B?NWpjV0lLMXpidEVJVEozc3dKeUEyZ0dkUGs2UDV3WVFzWEZuWjNTZ1g5dlNl?=
 =?utf-8?B?bGx1Z1Z4d055N3ZIeTRkMXdDUEl4RXozcHZOOEtCRUNtblEwQ0MxbGNpOUF5?=
 =?utf-8?B?dy90bG51UUlTNUlTZE1nSlJheklqSkZuRWswK2F0QTZEeHc3L2FyM3psSWtn?=
 =?utf-8?B?eldOc2NEUmpZWHhTYlpUYXRYSjZJekFyOUl5bTdIejhoam1hak5UWmtrb3h4?=
 =?utf-8?B?UnAyMHJ1TXdvOHkxRndabW5xZkw0YXkrRzcwK3FjcGpxN2tFdkY4TGFzeW9U?=
 =?utf-8?B?U2htaUh5cWIwVmRRczZDaXhnZ0lWTVdHQWRLNFR4RVBhaThqY2RUS2JFdWRN?=
 =?utf-8?B?Wmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5274.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 099e2cc5-090f-4d79-40b8-08db1328ae43
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2023 09:56:04.5851
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pr06+DF6LjaTSlL+5mdXO1EJ5fofNv3s/qwRhhRMoynasRXkZTzrTwn/wQWI1F+lnJqp8xdiA3KQfMB/Khqcp8z4O38CUs5J6BuwqRAFZ+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6084
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

SGVsbG8gS3J6eXN6dG9mLA0KDQpSeWFuIENoZW4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxp
bmFyby5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgRmVicnVhcnkgMjAsIDIwMjMgNDozMCBQTQ0KPiBU
bzogUnlhbiBDaGVuIDxyeWFuX2NoZW5AYXNwZWVkdGVjaC5jb20+OyBSb2IgSGVycmluZw0KPiA8
cm9iaCtkdEBrZXJuZWwub3JnPjsgS3J6eXN6dG9mIEtvemxvd3NraQ0KPiA8a3J6eXN6dG9mLmtv
emxvd3NraStkdEBsaW5hcm8ub3JnPjsgSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT47IEFu
ZHJldw0KPiBKZWZmZXJ5IDxhbmRyZXdAYWouaWQuYXU+OyBQaGlsaXBwIFphYmVsIDxwLnphYmVs
QHBlbmd1dHJvbml4LmRlPjsNCj4gb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOyBsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IGxpbnV4LWFzcGVlZEBsaXN0cy5vemxhYnMu
b3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djUgMC8yXSBBZGQgQVNQRUVEIEFTVDI2MDAgSTJDdjIgY29udHJvbGxlciBkcml2ZXINCj4gDQo+
IA0KPiBPbiAyMC8wMi8yMDIzIDA3OjE3LCBSeWFuIENoZW4gd3JvdGU6DQo+ID4gVGhpcyBzZXJp
ZXMgYWRkIEFTVDI2MDAgaTJjdjIgbmV3IHJlZ2lzdGVyIHNldCBkcml2ZXIuIFRoZSBpMmN2MiBu
ZXcNCj4gPiByZWdpc3RlciBzZXQgaGF2ZSBuZXcgY2xvY2sgZGl2aWRlciBvcHRpb24gZm9yIG1v
cmUgZmxleGlhYmxlIGdlbmVyYXRpb24uDQo+IA0KPiBUeXBvOiBmbGV4aWJsZQ0KV2lsbCBmaXgg
dHlwby4gDQo+IA0KPiA+IEFuZCBhbHNvIGhhdmUgc2VwYXJhdGUgaTJjIG1hc3RlciBhbmQgc2xh
dmUgcmVnaXN0ZXIgc2V0IGZvciBjb250cm9sLg0KPiANCj4gU2luY2Ugc2V2ZXJhbCBvZiBteSBx
dWVzdGlvbnMgcmVtYWluZWQgdW5hbnN3ZXJlZCBhbmQgcXVpdGUgZnJhbmtseSBpdCdzDQo+IGZy
dWl0bGVzcy4uLiBzbyBsZXQgbWUgcmVhZCB0aGUgY29tbWl0IG1zZyBkaXJlY3RseSAtIGl0J3Mg
dGhlIHNhbWUgZGV2aWNlLCBqdXN0DQo+IHdpdGggZGlmZmVyZW50IHJlZ2lzdGVyIGxheW91dC4g
SGF2aW5nIG5ldyBjb21wYXRpYmxlIG1ha2VzIHNlbnNlLCBidXQgdGhpcw0KPiBzaG91bGQgYmUg
cGFydCBvZiBvbGQgYmluZGluZy4NCj4gDQpTb3JyeSwgSSBhbSBjb25mdXNlZCwgRG8geW91IG1l
YW4gSSBzaG91bGQgYmFzZSBvbiBvcmlnaW5hbCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvaTJjL2FzcGVlZCxpMmMueWFtbA0KQWRkIG5ldyBjb21wYXRpYmxlPyBOb3QgYWRkIGFu
b3RoZXIgYXNwZWVkLGkyY3YyLnlhbWwuDQoNCg0KQmVzdCByZWdhcmRzLA0KUnlhbg0K
