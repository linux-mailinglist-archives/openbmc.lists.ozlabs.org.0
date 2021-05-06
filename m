Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1D937516E
	for <lists+openbmc@lfdr.de>; Thu,  6 May 2021 11:22:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbSm50DDlz30DT
	for <lists+openbmc@lfdr.de>; Thu,  6 May 2021 19:22:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=YSZHqIXT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.77.123;
 helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=thu@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=YSZHqIXT; 
 dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770123.outbound.protection.outlook.com [40.107.77.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbSlm6192z2yZB
 for <openbmc@lists.ozlabs.org>; Thu,  6 May 2021 19:22:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MYQtGXfNz1RM72t2emPpMBm+TsUlAXQnXly5YRpDFyvrMUshLfn3C9nwPFc4JRMO3OqiQtQKo6Mp9+oQqTVdA58prFwkYkwQnjDe2OoFqT83SWVu3pvPTRhJAJcBFyCwBZlUcZMPnY3bDmkZduwgCXUoDjbYeMJAIbqZLCMv8UGs4E9N3o9JHwvCSbeFw1TpKw3wlUYywWYHZhslBiu88SQ0YviHFwL7EadqwbZ6fdN+1P5qdALP71CEsBlUUNWyj+O7leKsv5JhZ+9dn9LK4OgujQCzcxxdBR7yRw9QxcjDY2jIVfqrwSpVBk6pb1vzJFP04dBVxbwe59F4q+o78Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBAabQIj7xpvjVipwQe2dL0td0hlz3a99fUDWJBW6G0=;
 b=mwAk2gpe5RGfU2ji1Wk5wtCIOucrt91ZMWG2ywuGOjr/EAFb3+/ybsUf806DOoNO6Y6uSue6eM7M9DElsN+MqViI85ByoyAxcWyuL8lHchWKvM3zFeZNkoZjkSHagWqMB40QBwT8abLIh1KeZWRrsnLIJSVmxpBolF/vB+6SWEADGX3mtTtAJRkZJwtZJpoA0zkytDq+KDTbe1w8AoBslzDrGiZ9g5gyR3ILJsYSn8+t3McKumSRwd1juxbUlhuj8qtxuh0f4LfIYdkUhcBjlq+981jGM1Nz4c0ESMPmGnaWaOqUIRSAkxMVkl087I0n/CaEdVcCf6xkrzeEpnebAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBAabQIj7xpvjVipwQe2dL0td0hlz3a99fUDWJBW6G0=;
 b=YSZHqIXTQpzEFJVhKt2IVu4LpNltqI6AT8Hk44iXSiIaM6MKvPVgG5RWx0wE3/J9tij1zkApFuc5PgWSlbca6rTAEFZojZGKbzIjBfimfd5ifVjh1o7AD4KTGO29jEunsrOh1iwJqFG+msUGLVRecqzKijzZ2L4yNWu5cXjpays=
Received: from DM6PR01MB5145.prod.exchangelabs.com (2603:10b6:5:56::16) by
 DM6PR01MB4140.prod.exchangelabs.com (2603:10b6:5:1d::19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25; Thu, 6 May 2021 09:22:20 +0000
Received: from DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::fd97:f560:f2cf:d58d]) by DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::fd97:f560:f2cf:d58d%5]) with mapi id 15.20.4065.039; Thu, 6 May 2021
 09:22:20 +0000
From: Thu Nguyen OS <thu@os.amperecomputing.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Add phosphor-fan configuration for the fan which added by dbus-sensor
Thread-Topic: Add phosphor-fan configuration for the fan which added by
 dbus-sensor
Thread-Index: AQHXQllQCBPi6KR9P0WKkzFc+/PDQw==
Date: Thu, 6 May 2021 09:22:20 +0000
Message-ID: <B6120112-33DD-41A6-A0F2-7A9FBFEEB081@amperemail.onmicrosoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
x-originating-ip: [2402:800:6344:392d:a1d3:195d:8023:5cd4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b1516c3-7d62-4c76-94d6-08d910707337
x-ms-traffictypediagnostic: DM6PR01MB4140:
x-microsoft-antispam-prvs: <DM6PR01MB4140F82B124DF65C487A2C6C90589@DM6PR01MB4140.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1yBngfnWYG+7gX8n1rcaFslTasbkl0FM1kDWfgAa1rcL7TpcvGlZg8PDvfw9DyEs1T8YEP8Ub2muixvbUGKwIxzNMDsWX03jPJF1KXsOphSw8SEDUEhsssli6aAu8P/GFvoRV6Hvpk/x+4XumuNCStqh4Kyn8+JqC3kKMuGcTljmUkRGaVnOoQgRwDsDnf95imj3E2S1Pc4cVAgKKeLMw+EozZlG/xvb7GR3cENj8Hxtn0lbnUjnkHe7JF1/X9OH1hr5+v03Ya1TrbbTBodwoTeeUkEXm79QxDHaiC51JNou0GCOVMo4BLk0kPXFUBkLfsJduEVXCZa6L/bwhwB2vc1S5wJbZycOHvDXqqFr16TXRulZAgF93bs1AKLUEorrXOaNxARp/dXw6ly+ADLS8vjOFj6tDPlFoQvEhNy8VxK+CFP9hL1MuK9PNUOn6EIiS6JQBAKUQioSvtPtfqVf18n504oGPGYoQntTuBTPDdrAMtOCrxlHT1vf/1YVbN0BmHPnU7J55V4EWoOGDaGZ7JJaaaIneJ59zX5/X5dyeFZQzLYuBazYDaARjFpYy2cL0Mbs4dOlvs5+ACS1yOLEi+26KaRie5FrREbYr9ghngdrgEeF8IbvRtWWzqlEgMvjfYcZxAl6g4sYviaX8YihEAWDHMpVHmZ3MNKPbVR3T/w=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR01MB5145.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(346002)(366004)(39850400004)(86362001)(83380400001)(6506007)(4744005)(8676002)(6916009)(66446008)(6486002)(186003)(33656002)(478600001)(8936002)(9686003)(6512007)(2906002)(76116006)(5660300002)(316002)(66476007)(71200400001)(91956017)(122000001)(38100700002)(66946007)(66556008)(966005)(64756008)(166002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?bGZ0RGd0UU5DLzE4QndUd1d6cys1VDlmVjBRejMvWkh5MzBlRFFWWWVDZ1E5?=
 =?utf-8?B?UHRMalRIaHFrazNIU2NJQUROMlJUS1ExZURmaFJZaHVOOTBzRVk3Y2YrM1B4?=
 =?utf-8?B?OG5hR1JjSXd3YjB0M2pwK3VyS254QUtvc21DZVlLR0RtWWFzY204cHFSRGl6?=
 =?utf-8?B?TUI4OTZac3JCVG1oQ0pQQ1N6a09mL2dZK014bEVKMDVwNVJLTk14ZkIwQk5K?=
 =?utf-8?B?cnEvbmZ0RWlCWFpEOU1iMkpIMjBRbkVXQ09KYlRuV2dlVyt2NGJOQ2NEODhz?=
 =?utf-8?B?Mk45VUVOTUwvRHlrMmxWZE5GUGZPeGdzeFRxVEszQ3FFWTVMbFVHVkVYdEZs?=
 =?utf-8?B?cmhPNi9tdEFrVzFESUNReFdkUVpYTHNvbTBXRTJjajBvMGNQdXNUTmU5Tkxs?=
 =?utf-8?B?K0hGWGZ0VlU0NytHaGIzTWFiWElBTkptWXYrWSt1aGJ4RE9HYWs3Q1Q0blVh?=
 =?utf-8?B?bVk3T0VSVmtQbEdzMnYzSUZSaFRaZFdhNmtUeVRtOXJXZWZGaTBZRDcrNlVR?=
 =?utf-8?B?UWdhK2NIdk9MdVMrcno0KzN0d2pKaElxRmxVOWplM2N6WXhRZ2ZTLzZvSFlP?=
 =?utf-8?B?ejJvY28zUU1HeHg2aDhMYzdMMHNQTUhqTEFPSTExdmNJd3hwMGQ3R05IVmRu?=
 =?utf-8?B?UFV0dDdSMGhySDJjTW5zTlRXZlJ4d1VyVTBwaGIrTXJRcTc1bFVLUmgxK2p5?=
 =?utf-8?B?VDRDOGVkQzA2eDdJeEJBdHc0VlpTMVJaYXBPL0xkejZxdG5jenhDZVlMNThZ?=
 =?utf-8?B?VDI5SEsybkdOWTZoaTRpMW9VUlZ1aUo2elNSSFJpbEswZGdhem1sRDFCbDc5?=
 =?utf-8?B?bXBIRUVsR1RGSnJObXdGWTlXMXJ6NW9IbGJNU0NSa0pPY0dzQmFPRVdlSVNi?=
 =?utf-8?B?bjhLYmJNdEZxM3dlTXBwa0VWNDU1eU5TL3NiTG4yRkxiQ3lJZVhKV1dZTnU1?=
 =?utf-8?B?ZTB5OWVuL2FGUXRlY2d4eWF0MlI2d2xlbm00NThXaVN2T2s3NXArcW1hVWFi?=
 =?utf-8?B?RmVHWmR6ak1vWWEzcHlNUVVQTkI2bWtpL2xoOFZaMmRySTUvZXdadzFObFps?=
 =?utf-8?B?bnZuTUFVSk9kdGUrZ0luNjh5aDcxQjY4aHhJZ2tGUnNxejgvM1RXdzc2TGpr?=
 =?utf-8?B?enJGRWJGL0hoZ0JwdEdZbkVmYVZFVDNtK2ZZUWphWUhBdC8ya2ZWakN1MHdo?=
 =?utf-8?B?RHVLdmtuUDBFOENPeGE4NDhQRWRDZ3pTVmFQQVY4d0pFWE5wdGo2ZkxlNS9S?=
 =?utf-8?B?ZzFjN0NFZGZ0bzNieDdibUlwSU9Xd0pFSnQzY3BJQkROdVJiSUs0Ui95MHNz?=
 =?utf-8?B?ZXhtYmFrNDFtVWwvNis2a2dGYW9ZQ0p4ZlMwNmNTb3ZDcWZzSWJ0WldyejJr?=
 =?utf-8?B?QWF1Vk13c29kTktsMEtoOFRFVmZNRGZJdEVsenlZeGl3Vm42RlVEL3JIeUFP?=
 =?utf-8?B?NzhpakZGS3h3UVZrTU12T1dRNVh4WDNJbXgzaFFBK1Q4S0FiN0RqMEFqaThw?=
 =?utf-8?B?NDNHeFBrZEs4T3Z0bExEWndEVEtmN3lmU0JnYXQ4WlFFc0E0cDhOMWh6R2ZU?=
 =?utf-8?B?ZTY3ai9Dc3VoU3RQSmZiWGdDZm1QSEVnTzEyQjFoU1c2anR5VEpoMllQTk5u?=
 =?utf-8?B?TUFUbFJFRWtpKzV1K0lIc0I4alhBZUEwR016dHlueFlhTllYRXVDK0cwWStR?=
 =?utf-8?B?WTdPYjlmazJST0ppNGxDR1VLK1lBWkNVVm1sSlg2S2ZIaFBQR3Z5Ry81Ui9m?=
 =?utf-8?B?UEhMMW1VbXpSMms2a09RV3h1eGp3Q2FnTm9GeVhicVQxU3h1MG85aXVPMXlz?=
 =?utf-8?B?TWE4cFlZMys1bkVPVDJNWXAzTis4ZitOeVJncEEzdDFPeCsxLzRyR29WaXdq?=
 =?utf-8?Q?/DBmGn2Vh+HJC?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_B612011233DD41A6A0F27A9FBFEEB081amperemailonmicrosoftco_"
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5145.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b1516c3-7d62-4c76-94d6-08d910707337
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2021 09:22:20.3870 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HHcSTcFSS/I9hnFBMrHIrw168jnTB7UdB8CS0rKw7S95Jcz8vqLZh4txrN1g9YgvfcHLRNbhtuK3m4tisGhI09dcygC19pGfQAR0vKGIfC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4140
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

--_000_B612011233DD41A6A0F27A9FBFEEB081amperemailonmicrosoftco_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNCknigJltIHN1cHBvcnRpbmcgdGhlIGZhbiBjb250cm9sIGFsZ29yaXRobXMgdXNpbmcg
cGhvc3Bob3ItZmFuLiBQaG9zcGhvci1mYW4gbW9uaXRvcmluZyBhbmQgY29udHJvbGxpbmcgcmVx
dWlyZSBpbnRlcmZhY2UgeHl6Lm9wZW5ibWNfcHJvamVjdC5Db250cm9sLkZhblB3bSBpbiB0aGUg
ZmFuIGludmVudG9yeSBvYmplY3QuDQpodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9waG9zcGhv
ci1mYW4tcHJlc2VuY2UvYmxvYi9tYXN0ZXIvZG9jcy9tb25pdG9yL2ludmVudG9yeS5tZA0KDQpC
dXQgRmFuU2Vuc29yIGRhZW1vbiBvZiBkYnVzLXNlbnNvciBvbmx5IGFkZHMgL3h5ei9vcGVuYm1j
X3Byb2plY3Qvc2Vuc29ycy9mYW5fdGFjaCB0byBpbnZlbnRvcnkgbGlzdCwgYW5kIHRoaXMgcGF0
aCBkb27igJl0IHN1cHBvcnQgeHl6Lm9wZW5ibWNfcHJvamVjdC5Db250cm9sLkZhblB3bSBpbnRl
cmZhY2UuDQoNCkRvIHlvdSBoYXZlIGFueSBzb2x1dGlvbiB0byBtYWtlIHBob3NwaG9yLWZhbiB3
b3JrIHdpdGggZGJ1cy1zZW5zb3I/DQoNCknigJltIGN1cnJlbnRseSB1cGRhdGUgRmFuU2Vuc29y
IGluIGRidXMtc2Vuc29yIHRvIGFkZCB4eXoub3BlbmJtY19wcm9qZWN0LkNvbnRyb2wuRmFuUHdt
IHRvIC94eXovb3BlbmJtY19wcm9qZWN0L3NlbnNvcnMvZmFuX3RhY2guDQoNClJlZ2FyZHMuDQpU
aHUgTmd1eWVuLg0K

--_000_B612011233DD41A6A0F27A9FBFEEB081amperemailonmicrosoftco_
Content-Type: text/html; charset="utf-8"
Content-ID: <B81E23EE4EF38447BB1534AE853920B1@prod.exchangelabs.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToy
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3Jt
YWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGNtOw0KCWZvbnQtc2l6
ZToxMS4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KYTpsaW5rLCBz
cGFuLk1zb0h5cGVybGluaw0KCXttc28tc3R5bGUtcHJpb3JpdHk6OTk7DQoJY29sb3I6IzA1NjND
MTsNCgl0ZXh0LWRlY29yYXRpb246dW5kZXJsaW5lO30NCnNwYW4uRW1haWxTdHlsZTE3DQoJe21z
by1zdHlsZS10eXBlOnBlcnNvbmFsLWNvbXBvc2U7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNh
bnMtc2VyaWY7DQoJY29sb3I6d2luZG93dGV4dDt9DQouTXNvQ2hwRGVmYXVsdA0KCXttc28tc3R5
bGUtdHlwZTpleHBvcnQtb25seTt9DQpAcGFnZSBXb3JkU2VjdGlvbjENCgl7c2l6ZTo2MTIuMHB0
IDc5Mi4wcHQ7DQoJbWFyZ2luOjcyLjBwdCA3Mi4wcHQgNzIuMHB0IDcyLjBwdDt9DQpkaXYuV29y
ZFNlY3Rpb24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+DQo8L2hlYWQ+DQo8
Ym9keSBsYW5nPSJlbi1WTiIgbGluaz0iIzA1NjNDMSIgdmxpbms9IiM5NTRGNzIiIHN0eWxlPSJ3
b3JkLXdyYXA6YnJlYWstd29yZCI+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+PHNwYW4gbGFuZz0iRU4tVVMiPkhpLDxvOnA+PC9vOnA+PC9zcGFuPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9IkVOLVVTIj48bzpwPiZuYnNwOzwv
bzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBsYW5nPSJFTi1VUyI+
SeKAmW0gc3VwcG9ydGluZyB0aGUgZmFuIGNvbnRyb2wgYWxnb3JpdGhtcyB1c2luZyBwaG9zcGhv
ci1mYW4uIFBob3NwaG9yLWZhbiBtb25pdG9yaW5nIGFuZCBjb250cm9sbGluZyByZXF1aXJlIGlu
dGVyZmFjZSB4eXoub3BlbmJtY19wcm9qZWN0LkNvbnRyb2wuRmFuUHdtIGluIHRoZSBmYW4gaW52
ZW50b3J5IG9iamVjdC48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij48c3BhbiBsYW5nPSJFTi1VUyI+PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMv
cGhvc3Bob3ItZmFuLXByZXNlbmNlL2Jsb2IvbWFzdGVyL2RvY3MvbW9uaXRvci9pbnZlbnRvcnku
bWQiPmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bob3NwaG9yLWZhbi1wcmVzZW5jZS9ibG9i
L21hc3Rlci9kb2NzL21vbml0b3IvaW52ZW50b3J5Lm1kPC9hPjxvOnA+PC9vOnA+PC9zcGFuPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9IkVOLVVTIj48bzpwPiZuYnNwOzwv
bzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBsYW5nPSJFTi1VUyI+
QnV0IEZhblNlbnNvciBkYWVtb24gb2YgZGJ1cy1zZW5zb3Igb25seSBhZGRzIC94eXovb3BlbmJt
Y19wcm9qZWN0L3NlbnNvcnMvZmFuX3RhY2ggdG8gaW52ZW50b3J5IGxpc3QsIGFuZCB0aGlzIHBh
dGggZG9u4oCZdCBzdXBwb3J0IHh5ei5vcGVuYm1jX3Byb2plY3QuQ29udHJvbC5GYW5Qd20gaW50
ZXJmYWNlLjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFu
IGxhbmc9IkVOLVVTIj48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj48c3BhbiBsYW5nPSJFTi1VUyI+RG8geW91IGhhdmUgYW55IHNvbHV0aW9uIHRvIG1h
a2UgcGhvc3Bob3ItZmFuIHdvcmsgd2l0aCBkYnVzLXNlbnNvcj88bzpwPjwvbzpwPjwvc3Bhbj48
L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBsYW5nPSJFTi1VUyI+PG86cD4mbmJzcDs8
L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gbGFuZz0iRU4tVVMi
PknigJltIGN1cnJlbnRseSB1cGRhdGUgRmFuU2Vuc29yIGluIGRidXMtc2Vuc29yIHRvIGFkZCB4
eXoub3BlbmJtY19wcm9qZWN0LkNvbnRyb2wuRmFuUHdtIHRvIC94eXovb3BlbmJtY19wcm9qZWN0
L3NlbnNvcnMvZmFuX3RhY2guPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+PHNwYW4gbGFuZz0iRU4tVVMiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9IkVOLVVTIj5SZWdhcmRzLjxvOnA+PC9vOnA+
PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9IkVOLVVTIj5UaHUg
Tmd1eWVuLjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_B612011233DD41A6A0F27A9FBFEEB081amperemailonmicrosoftco_--
