Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A91EC5E9A6E
	for <lists+openbmc@lfdr.de>; Mon, 26 Sep 2022 09:29:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbZBq53nNz3bcw
	for <lists+openbmc@lfdr.de>; Mon, 26 Sep 2022 17:29:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=tbQqzTJx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=40.107.117.137; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=tbQqzTJx;
	dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2137.outbound.protection.outlook.com [40.107.117.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbZBD2Xq0z2xJM
	for <openbmc@lists.ozlabs.org>; Mon, 26 Sep 2022 17:28:50 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fd+oy7SkW/N93JrF2Fl6FpYxolVVQr+Qolx0JfrFBVNnk+t7FDNMkSNtS0KNaH53zKCx3fjVPDfDY8xPNUCTMfLRVr1awYwQi0hBnnHoXIJYX/aQdollOTJkVtv1tRlDQrLSqqXW5cT/rUzqmeqwVVoFYZ2jA7yPHMErsdlJlpwHVn+5VMY2uv9xD6gm/IAE8/4p/de56CNg6wmrxkdgwcEEQ6A19m6Qh8TW3xYv0oOeXC57OinkORD0ClHUSqTiNBWW7lrmYvKh1W4JnKno9fiwCgvjbPjQmN+NoJ1Gj2pg4iceeoBLpmv3gExPX95FImncmASHYICVV6YAbihL0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UO9No+B175LwkGw8krhUqOKLtUBdH/cua1Fm/D78rt8=;
 b=DBPwP8cLoDZGv3wy47NDlPzWwPapxrX0AjGCWDyGwoPS9YX8nHvG0ExE1ixFV2hNT3pi8yqbx4mQV942LlzAte2yRTZEINwrfJuXFJ6eVlhvhY8QemGs1x4I913AU1gVPkFOq5ZopF3SgrNB4z+nkTU59o3cUVukr0/I/xldPRdbW8j6ZayYOL6psx+FRdC5tzqE7qdc9SPK3mghy4j1jpEal1nY0iW2CFGfZVyrffoYHhs6RdMvTR06PfS5SyccxUkF9t6l5O4Rd/jRkVAAy0eZakw4GOrugGq5hP8Y+Xg/An+vVSpYY+ZjlAbGiAjOrp5FcAHdZcKtfpfhng2DjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UO9No+B175LwkGw8krhUqOKLtUBdH/cua1Fm/D78rt8=;
 b=tbQqzTJxcT03DICRMFj6Uuoyul3Qbbt6ODdaBiH1SSstrj8SFPJgTLwheazOG8oGFD0tDxuEPAkXzECQbQPrRBLfxB/Jma456wpEY/mxxTSmVuATN8sH+AGl/Ku05Nd1EPE4DkMRkuFSCcpXB2TvnhkUyaQ3zwKuOC8XA/tY7MOGxZcQKSBCF9QhaGhpOc2slP5QlPG2VI9wmbIJtUkABXR9r/XvSM2cU/w10PACROPb7E/xdCZW4M0bqboPUWZu0VY5QqTy7zOMA6xP/aHogiHJhQ1/KslhGY126+b2Gev6JhESrYTKqJITofksUNocmt3ZRlxp+abwkRCxGYy46w==
Received: from TY2PR06MB2799.apcprd06.prod.outlook.com (2603:1096:404:3d::19)
 by KL1PR0601MB5582.apcprd06.prod.outlook.com (2603:1096:820:c6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 07:28:28 +0000
Received: from TY2PR06MB2799.apcprd06.prod.outlook.com
 ([fe80::65ed:5af5:6036:8593]) by TY2PR06MB2799.apcprd06.prod.outlook.com
 ([fe80::65ed:5af5:6036:8593%7]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 07:28:28 +0000
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: Tao Ren <rentao.bupt@gmail.com>, Konstantin Klubnichkin
	<kitsok@yandex-team.ru>, Ryan Chen <ryan_chen@aspeedtech.com>
Subject: RE: Wedge400 (AST2520) OpenBMC stuck at reboot
Thread-Topic: Wedge400 (AST2520) OpenBMC stuck at reboot
Thread-Index: AQHYzgbDf66TFwnifkafHTXV9YyO4a3rFlkAgAD6HgCABUXL0A==
Date: Mon, 26 Sep 2022 07:28:27 +0000
Message-ID:  <TY2PR06MB27993612ED19D993284E8432B2529@TY2PR06MB2799.apcprd06.prod.outlook.com>
References: <YyuLaigEAyiYpl+B@taoren-fedora-PC23YAB4>
 <217031663833427@mail.yandex-team.ru>
 <YyznoHJ2pw1DHRsj@taoren-fedora-PC23YAB4>
In-Reply-To: <YyznoHJ2pw1DHRsj@taoren-fedora-PC23YAB4>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR06MB2799:EE_|KL1PR0601MB5582:EE_
x-ms-office365-filtering-correlation-id: a4f3141e-a23c-4f17-492d-08da9f90b48c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  AIw5LszxfgXeeOwLbt2Kz+f2j2a7Tu6H27CiASoBPBeWnbLVY4o0k87fdv8PSxUMPvoUCovbCi7SGhf3HAbMiyS2d9XXruXVJp1J66HpRfnCe9BzLd4h0V3PCFELw3z90XDiDpcG/nmiOWwK0tS/v959PfKhbHor37wuPy0z7qy9JFMYDgmR1EN/qwVhaKYiBMN3kUm6BAj/FAnoYe1kpktdsJQMUOL91U5J3eatj9CqYEq1HCDboUglV2PyMd3hHlTjLYDKovuI2McxLX2F/Sz5RPaXhTzplPi8azLOkZV0TBTnyUI5PHWjEPli4WTKoTTt0Xx+DAuf26UjWnRItVnlEfuve9eJc7fmNtKfR1CBLw9rVYvsZ1aJ0w1wBV+y000NisLGc2SJ1y8qt28G1eabSK/FbSe/M8VebS20uQ7TVAu1WbqVMsXeRoWBB/U8Ux1Z8nNJESmZWRDnnOzRSEZ6xqoXVdEvq0V50b+/ULFZ3lPeFsxyNL3JfzxWguXEJsdBqpWDgUwTcqANuitOAwED0Se1sVM+aJugIZjKKGEK3qbpMvYtEGk96CkqlaKEO7zZ1HHjyZLgQ12MTNwa9Fyumloi+U65fmm9ZLehqi1hd+C3Gzs7Qc9eHUPZ7PAcC8wrQU9uzSjK/meN+xewn2PcPVM2etU35x7EsrH9MQBqIf7hXQXM4i/+OZtX6As+tL2lWA7rNSZOA6MW/NKuWDB8op8x1k0Up5i1p7XJ9ipqMhO8wSfZhljXIedAGj5Ynv39taCqbv/LgoYwbff/qw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR06MB2799.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(396003)(346002)(366004)(39850400004)(451199015)(6636002)(71200400001)(110136005)(54906003)(316002)(478600001)(6506007)(7696005)(107886003)(76116006)(64756008)(8676002)(41300700001)(66556008)(66476007)(66446008)(66946007)(4326008)(5660300002)(26005)(8936002)(2906002)(52536014)(38070700005)(9686003)(33656002)(186003)(83380400001)(53546011)(55016003)(122000001)(86362001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Y08vMVQwWXBwaDY2RVd6cUlTaWE3NTRtdll3R3ByODJxK0MrQ08vNWtzWk5L?=
 =?utf-8?B?WjZ6YlhjYW90VkJ2enN3SjJFYm1ZclNYMXRjeitxNlpLR1JzWmxQdXdLUHhS?=
 =?utf-8?B?aG9DK0VUckowNWt1TUpkeEd2aTdSR1l1dUtIcFdja2hVVzdUczZQK2RMWE1W?=
 =?utf-8?B?emJwcnpFRmVDQlNOaGpZZElJUHlyS1dMa0JpcTNBckFFMU0zYnNpUVgwWXVS?=
 =?utf-8?B?MFE4NWE1cFJESW5lZTZ0UXY3ZjE4NElDK3lwd3BzUkR5ak9jNHRheEYzbHdI?=
 =?utf-8?B?QkY5ZkdrYjAySmhYdUhhWXlua3ZLMTZjUjJtOUo1SUpQTkwvSHl0RVZqQXB2?=
 =?utf-8?B?eHNrbWZPR0tMZ2JSdTZRMWxTQmpNeEdORktpU1dTMWRIZ2p6WENyQzdDZVRV?=
 =?utf-8?B?Q3JDRG9nSTdncFpTbnM1QWdxZDl0czhLMHozckdJU2lOS0xNck9CT2duWm43?=
 =?utf-8?B?Nlp1VjFQNzNjc3MwQWVJRnc3elZqc09uUjFMalBZTFFPcUJYd1RsNVc3ZldS?=
 =?utf-8?B?RHVTOCt5V1VHeVpFVHVFU3hSa2wwV0poK2k5eUpKc1dhTERlWnVlUXA0ZEVk?=
 =?utf-8?B?UkJ4bnBnckM0UkFVUjNQdTJPUXZaNFFMOGs4elloQzIrVFZNYkxmZVlwa1VC?=
 =?utf-8?B?cVhSYkY3dXduNkljbk5nWWZSV0FDQmdGMDZnU3hMZG9RWGxyUUUvdU83S2NP?=
 =?utf-8?B?cGxRck16dXpka25SOTdtMEJxMFZ0N3h2VTdCK3BoUnBJcUJScFJVOVIvQnhQ?=
 =?utf-8?B?WTlva05vVThBZVhwTTJBdGljMjFJV3VkMHhJYzdLd2hYQjdrZ2srNzl6d29y?=
 =?utf-8?B?ZWF5akxzbHJYbHVhbnZ3dDBISWY2ODZLYURnekpzZlBDelh4ak8rVllqNDE4?=
 =?utf-8?B?S1UwdGhqM000WnlTY3dIMVVnMkZwanJWbEh1dDZlZlZ2TzUxcVZqUG9oMlpk?=
 =?utf-8?B?T0wydVJzK0VZWUNkbTlYZk1BeExBN2swMXI5M080WXI1WG9wTkRxWUxpWkdL?=
 =?utf-8?B?NFgwNHFqd1F5N0xLcmI4SjFDekE1Q3h2Y3JvUjF6SncxOTVKK0R4K3lGRDlG?=
 =?utf-8?B?ME5HU3JDc3V1UDd5VTB3VUtQZFRYRHRHRmNkOTg1bXd2ZGVyb1NNdnl0VzRp?=
 =?utf-8?B?Sk5VaVhGTFlSdlM0V3J3cW54TTFaYzl6aHdIZFU2bzhpazlSekVMQ0JUZWk3?=
 =?utf-8?B?ZndZQXNtMUVuR1lFNldocytTanlWWVl6bmpjVDlIV3JRWkU0dFVEQVJKY3Zh?=
 =?utf-8?B?aGZFWE42b29mSmJMd1BGZ21tZmVaYytmNWtnZmJ2T0xIT0U2Zk05SGI1Rk16?=
 =?utf-8?B?Y1Q5cWJWbDZxR1BBc3JNcjF2VXFDSVRENUNEK0xMbU5yRCtESG5RZXh0Visv?=
 =?utf-8?B?WjEyTDBFczVRRFZ3cUhFcndPTFNNQnpEMzRFd2ZEcFFsam5uYXA5WHJtVUJj?=
 =?utf-8?B?MWEzc2hjZmtoUW5USUVOM1hIdGxYbkViRll6VXdVdzl4MlBCcTYzTGNta1Rj?=
 =?utf-8?B?K3QvTGpEb05Dc3FQbXA4NjJlMnVSemNMVEJZc09kZytUUVRTMFMxdjVKd1Jh?=
 =?utf-8?B?cElYdnk2NU5WaGNTRXpXdkNYQ1ZNZ2d6bDJ0dGYvVDlkUTZnUUdpZjhJck1h?=
 =?utf-8?B?dk56Tm9CeFIyb3p1OU14V2lUd0xCcXhMN096R205d1VxYkZpeGVzL3c0c3dM?=
 =?utf-8?B?SmpDcGRpMXJ5aFF3eGpSa1k4WmlhRkRlV2pBTGFUbXhpZmMvM2NXRlZPckdv?=
 =?utf-8?B?dUNTdHJDQnJxVzkxOFdiVmFNWGw5Y215ejBiMEpmaDRUanJkMXhrWVRleUlW?=
 =?utf-8?B?dmtOMGxZakhORmphaGErbVhHZEVQVlVNWTNSbDBCWHVMaFQ3dHZ0REZscmwv?=
 =?utf-8?B?MTlOSjNabkgvd1ZMaVFaMXZONHQrSXF5K1Rod0hEbWdnK1lzMS9aYWwxcmY0?=
 =?utf-8?B?THQrb0tweWQ0eS8yNEpmUVFhcmh2ZWdsSlZKMk4vOFJ0K28zTUtOL3hUUHBE?=
 =?utf-8?B?Y0hxaFEzUHZDNlZtemFCSEJqZnp3RTRwRWkyK3IzWXFMS1hOTWs5eE5paDE4?=
 =?utf-8?B?eDU3OXFwTEVMRHdxOWRFNVpSMWdQQlNoV3hYL1VDZHNadW9SMzFvSTczV2dU?=
 =?utf-8?B?MzFPWXNES1JPamVlWkFJV1lRZ2xVQkpPdlpMVXhSK3pPNk9tWDlOMGVpUTJB?=
 =?utf-8?B?WEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR06MB2799.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4f3141e-a23c-4f17-492d-08da9f90b48c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2022 07:28:27.8921
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ykEOXSKD9F//XxM6o4x/Qi6gUkxrwCpZI7xoWzLltkWW0OzF6XRXYIsFBVwhO+41gd2LC9i9oXADKrpPDAJQly41VSv2pT1UA7Ags21mloc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5582
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
Cc: Ron Chen <ron_chen@aspeedtech.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgVGFvLA0KDQpUaGlzIHByb2JsZW0gY2Fubm90IGJlIHJlcHJvZHVjZWQgb24gb3VyIEFTVDI1
MDAgRVZCIHdpdGggb3VyIGtlcm5lbC01LjE1IFNESyBpbWFnZS4NCldlIGhhdmUgaW1wbGVtZW50
ZWQgdGhyZWUgZGF5cyByZWJvb3Qgc3RyZXNzIGZvciBhYm91dCAxLDk4MCB0aW1lcy4NCg0KDQoN
Cg0KVGhhbmtzLg0KDQpCZXN0IFdpc2hlcywNCkNoaW4tVGluZw0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IG9wZW5ibWMNCj4gPG9wZW5ibWMtYm91bmNlcytjaGluLXRp
bmdfa3VvPWFzcGVlZHRlY2guY29tQGxpc3RzLm96bGFicy5vcmc+IE9uDQo+IEJlaGFsZiBPZiBU
YW8gUmVuDQo+IFNlbnQ6IEZyaWRheSwgU2VwdGVtYmVyIDIzLCAyMDIyIDY6NTQgQU0NCj4gVG86
IEtvbnN0YW50aW4gS2x1Ym5pY2hraW4gPGtpdHNva0B5YW5kZXgtdGVhbS5ydT47IFJ5YW4gQ2hl
bg0KPiA8cnlhbl9jaGVuQGFzcGVlZHRlY2guY29tPg0KPiBDYzogb3BlbmJtY0BsaXN0cy5vemxh
YnMub3JnDQo+IFN1YmplY3Q6IFJlOiBXZWRnZTQwMCAoQVNUMjUyMCkgT3BlbkJNQyBzdHVjayBh
dCByZWJvb3QNCj4gDQo+IEhpIEtvbnN0YW50aW4sDQo+IA0KPiBUaGFua3MgZm9yIHRoZSBzaGFy
aW5nLiBUaGUgd2F0Y2hkb2cgY29udHJvbCBsb2dpYyBpbiB0aGUgc2NyaXB0IGlzIHNpbWlsYXIg
dG8NCj4gYXNwZWVkX3dkdF9yZXN0YXJ0KCksIGJ1dCB0aGUgZ29vZCBwYXJ0IGlzOiBzeXN0ZW0g
aXMgc3RpbGwgcmVhY2hhYmxlIGlmDQo+IHdhdGNoZG9nIGNhbm5vdCByZXNldCB0aGUgc3lzdGVt
IHN1Y2Nlc3NmdWxseS4NCj4gDQo+IEhpIFJ5YW4sDQo+IA0KPiBIYXZlIHlvdSBldmVyIHNlZW4g
dGhlIHByb2JsZW0gaW4geW91ciBlbnZpcm9ubWVudD8gTG9va3MgbGlrZSBpdCBpcyBhZmZlY3Rp
bmcNCj4gbXVsdGlwbGUgQVNQRUVEIHBsYXRmb3Jtcy4gQW55IHN1Z2dlc3Rpb25zPw0KPiANCj4g
QlRXLCBJJ20gcnVubmluZyBMaW51eCA1LjE1IGluIFdlZGdlNDAwIEFTVDI1MjBBMiBPcGVuQk1D
Lg0KPiANCj4gDQo+IENoZWVycywNCj4gDQo+IFRhbw0KPiANCj4gT24gVGh1LCBTZXAgMjIsIDIw
MjIgYXQgMTA6NTk6MTJBTSArMDMwMCwgS29uc3RhbnRpbiBLbHVibmljaGtpbiB3cm90ZToNCj4g
PiA8ZGl2Pi0g0LLRgdC1PC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+SGVsbG8hPC9kaXY+PGRpdj7C
oDwvZGl2PjxkaXY+SSd2ZQ0KPiA+IGZhY2VkIHRoaXMgaXNzdWUuPC9kaXY+PGRpdj5GaW5hbGx5
IG15IHNvbHV0aW9uIHdhcyB0byBtb2RpZnkgc2h1dGRvd24NCj4gPiBzY3JpcHQ6PC9kaXY+PGRp
dj4NCj4gPg0KPiA8L2Rpdj48ZGl2Pj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PQ0KPiA8L2Rpdg0KPiA+ID48ZGl2PjxkaXY+IyB0Y3NhdHRyKHR0
eSwgVElPQ0RSQUlOLCBtb2RlKSB0byBkcmFpbiB0dHkgbWVzc2FnZXMgdG8NCj4gPiBjb25zb2xl
IMKgwqA8L2Rpdj48ZGl2PnRlc3QgLXQgMSAmYW1wOyZhbXA7IHN0dHkgY29va2VkDQo+IDAmbHQ7
JmFtcDsxDQo+ID4NCj4gPC9kaXY+PGRpdj4NCj4gDQo+ID4gPC9kaXY+PGRpdj5lY2hvDQo+ICJT
eW5jaW5nLi4uIg0KPiANCj4gPiA8L2Rpdj48ZGl2PnN5bmMNCj4gfHwgOg0KPiA+IDwvZGl2Pjxk
aXY+c3luYyB8fCA6IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPC9kaXY+
PGRpdj5zeW5jDQo+IHx8IDoNCj4gPg0KPiA8L2Rpdj48ZGl2PsKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPC9kaXY+PGRpdj5lDQo+IGNo
bw0KPiA+ICJTdG9wcGluZw0KPiBXRFRzLi4uIg0KPiANCj4gPiA8L2Rpdj48ZGl2PnJldj0kKGFz
dF9nZXRyZXYgfHwgOikgwqAgwqAgwqAgwqAgwqAgwqAgwqA8L2Rpdj48ZGl2PmlmIFsgIiRyZXYi
DQo+ID4gPSAiRzUiIF07IHRoZW4gwqAgwqAgwqAgwqAgwqDCoDwvZGl2PjxkaXY+wqAgwqAgwqAg
wqAgZGV2bWVtIDB4MWU3ODUwMGMgMzINCj4gMCB8fA0KPiA+IDogwqAgwqAgwqAgwqAgwqAgwqAg
wqA8L2Rpdj48ZGl2PsKgIMKgIMKgIMKgIGRldm1lbSAweDFlNzg1MDJjIDMyIDAgfHwgOg0KPiA+
IDwvZGl2PjxkaXY+wqAgwqAgwqAgwqAgZGV2bWVtIDB4MWU3ODUwNGMgMzIgMCB8fCA6DQo+ID4g
PC9kaXY+PGRpdj5maQ0KPiA+IDwvZGl2PjxkaXY+aWYgWyAiJHJldiIgPSAiRzYiIF07DQo+IHRo
ZW4NCj4gPiA8L2Rpdj48ZGl2PsKgIMKgIMKgIMKgIGRldm1lbSAweDFlNzg1MDBjIDMyIDANCj4g
fHwgOg0KPiA+IDwvZGl2PjxkaXY+wqAgwqAgwqAgwqAgZGV2bWVtIDB4MWU3ODUwNGMgMzIgMA0K
PiB8fCA6DQo+ID4gPC9kaXY+PGRpdj7CoCDCoCDCoCDCoCBkZXZtZW0gMHgxZTc4NTA4YyAzMiAw
DQo+IHx8IDoNCj4gPiA8L2Rpdj48ZGl2PsKgIMKgIMKgIMKgIGRldm1lbSAweDFlNzg1MGNjIDMy
IDANCj4gfHwgOg0KPiA+IDwvZGl2PjxkaXY+wqAgwqAgwqAgwqAgZGV2bWVtIDB4MWU3ODUxMGMg
MzIgMA0KPiB8fCA6DQo+ID4gPC9kaXY+PGRpdj7CoCDCoCDCoCDCoCBkZXZtZW0gMHgxZTc4NTE0
YyAzMiAwDQo+IHx8IDoNCj4gPiA8L2Rpdj48ZGl2PsKgIMKgIMKgIMKgIGRldm1lbSAweDFlNzg1
MThjIDMyIDANCj4gfHwgOg0KPiA+IDwvZGl2PjxkaXY+wqAgwqAgwqAgwqAgZGV2bWVtIDB4MWU3
ODUxY2MgMzIgMA0KPiB8fCA6DQo+ID4NCj4gPC9kaXY+PGRpdj5maQ0KPiANCj4gPg0KPiA8L2Rp
dj48ZGl2Pg0KPiANCj4gPiA8L2Rpdj48ZGl2PnNsZWRfaGJfaGINCj4gfHwgOg0KPiA+DQo+IDwv
ZGl2PjxkaXY+DQo+IA0KPiA+IDwvZGl2PjxkaXY+ZWNobyAiU2V0dGluZyB1cCBXRFQxIGZvciBB
Uk0NCj4gcmVib290Ig0KPiA+IDwvZGl2PjxkaXY+IyBTZXQgdGltZW91dCB0byA1DQo+IHNlY29u
ZHMNCj4gPiA8L2Rpdj48ZGl2PmRldm1lbSAweDFlNzg1MDA0IDMyIDB4NGM0YjQwDQo+IHx8IDoN
Cj4gPiA8L2Rpdj48ZGl2PiMgTG9hZCBjb3VudGVyIHJlbG9hZCB2YWx1ZSB0byBjb3VudGVyDQo+
IHJlZ2lzdGVyDQo+ID4gPC9kaXY+PGRpdj5kZXZtZW0gMHgxZTc4NTAwOCAzMiAweDQ3NTUNCj4g
fHwgOg0KPiA+IDwvZGl2PjxkaXY+IyBFbmFibGUgV0RUMSwgcmVzZXQgQVJNIGNvcmUgb25seSwg
dXNlIGZpcnN0IGZsYXNoDQo+ID4gKEFTVDI1MDAgb25seSksPC9kaXY+PGRpdj4jIGRpc2FibGUg
aW50ZXJydXB0LCDCoHVzZSAxTUh6IGNsb2NrDQo+ID4gKEFTVDI1MDAgb25seSk8L2Rpdj48ZGl2
PmRldm1lbSAweDFlNzg1MDBjIDMyIDB4NTMNCj4gfHwgOg0KPiA+DQo+IDwvZGl2PjxkaXY+wqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqDCoDwvZGl2DQo+ID48ZGl2PmVjaG8NCj4gPiAtbiAiV0RUMUNSICIgfHwgOiDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDwvZGl2PjxkaXY+ZGV2bWVtDQo+IDB4MWU3ODUwMGMg
fHwNCj4gPiA6IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPC9kaXY+PGRpdj4NCj4g
DQo+ID4gPC9kaXY+PGRpdj5lY2hvICJMYXN0IGhlYXJ0IGJlYXRzDQo+IGZvbGxvd2luZy4uLiIN
Cj4gPg0KPiA8L2Rpdj48ZGl2Pg0KPiANCj4gPiA8L2Rpdj48ZGl2PndoaWxlIHRydWU7DQo+IGRv
DQo+ID4gPC9kaXY+PGRpdj7CoCDCoCDCoCDCoCBlY2hvICJLTk9DSw0KPiBrbm9jay4uLiINCj4g
PiA8L2Rpdj48ZGl2PsKgIMKgIMKgIMKgIHNsZWVwDQo+IDENCj4gPg0KPiA8L2Rpdj48ZGl2PmRv
bmUNCj4gDQo+IA0KPiANCj4gPiA8L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj5lY2hvICJXQVJOSU5H
ISEhISBaT01CSUUNCj4gQVRUQUNLISEhIsKgPC9kaXY+PGRpdj4NCj4gDQo+ID4gPC9kaXY+PGRp
dj4jIEV4ZWN1dGUgdGhlIGNvbW1hbmQgc3lzdGVtZCB0b2xkIHVzDQo+IHRvIC4uLg0KPiA+IDwv
ZGl2PjxkaXY+aWYgdGVzdCAtZCAvb2xkcm9vdCDCoCZhbXA7JmFtcDsgdGVzdA0KPiAiJDEiDQo+
ID4NCj4gPC9kaXY+PGRpdj50aGVuDQo+IA0KPiA+IDwvZGl2PjxkaXY+wqAgwqAgwqAgwqAgaWYg
dGVzdCAiJDEiID0NCj4ga2V4ZWMNCj4gPg0KPiA8L2Rpdj48ZGl2PsKgIMKgIMKgIMKgIHRoZW4N
Cj4gDQo+ID4gPC9kaXY+PGRpdj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAkMSAtZg0KPiAtZQ0K
PiA+DQo+IDwvZGl2PjxkaXY+wqAgwqAgwqAgwqAgZWxzZQ0KPiANCj4gPiA8L2Rpdj48ZGl2PsKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgICQxDQo+IC1mDQo+ID4NCj4gPC9kaXY+PGRpdj7CoCDCoCDC
oCDCoCBmaQ0KPiANCj4gPiA8L2Rpdj48ZGl2PmZpDQo+ID4NCj4gPC9kaXY+PC9kaXY+PGRpdj48
ZGl2Pj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiA9PT0N
Cj4gPiA9PT09PT08L2Rpdj48L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj4yMi4wOS4yMDIyLCAwMTow
OSwgIlRhbyBSZW4iDQo+ID4gJmx0O3JlbnRhby5idXB0QGdtYWlsLmNvbSZndDs6PC9kaXY+PGJs
b2NrcXVvdGU+PHA+SGkgdGhlcmUsPGJyIC8+PGJyDQo+ID4gLz5SZWNlbnRseSBJIG5vdGljZWQg
YSBmZXcgV2VkZ2U0MDAgKEFTVDI1MjBBMikgdW5pdHMgc3R1Y2sgYWZ0ZXINCj4gPiAicmVib290
IjxiciAvPmNvbW1hbmQuIEl0J3MgaGFyZCB0byByZXByb2R1Y2UgKGFmZmVjdGluZyB+MSBvdXQg
b2YNCj4gPiAxLDAwMCB1bml0cyksIGJ1dDxiciAvPm9uY2UgaXQgaGFwcGVucywgSSBoYXZlIHRv
IHBvd2VyIGN5Y2xlIHRoZQ0KPiA+IGNoYXNzaXMgdG8gcmVjb3ZlciBPcGVuQk1DLjxiciAvPjxi
ciAvPkkgY2hlY2tlZCBhc3BlZWRfd2R0LmMgYW5kDQo+ID4gbWFudWFsbHkgcGxheWVkIHdpdGgg
d2F0Y2hkb2cgcmVnaXN0ZXJzLCBidXQ8YnIgLz5ldmVyeXRoaW5nIGxvb2tzDQo+ID4gbm9ybWFs
IHRvIG1lLiBEaWQgYW55b25lIGhpdCB0aGUgc2ltaWxhciBlcnJvciBiZWZvcmU/PGJyIC8+QW55
DQo+ID4gc3VnZ2VzdGlvbnMgd2hpY2ggYXJlYSBJIHNob3VsZCBsb29rIGludG8/PGJyIC8+PGJy
IC8+QmVsb3cgYXJlIHRoZQ0KPiA+IGxhc3QgZmV3IGxpbmVzIG9mIGxvZ3MgYmVmb3JlIE9wZW5C
TUMgaGFuZ3M6PGJyIC8+PGJyIC8+Ym1jLW9vYg0KPiA+IGxvZ2luOjxiciAvPklOSVQ6IFNlbmRp
bmcgcHJvY2Vzc2VzIGNvbmZpZ3VyZWQgdmlhIC9ldGMvaW5pdHRhYiB0aGUNCj4gPiBURVJNIHNp
Z25hbDxiciAvPlN0b3BwaW5nIE9wZW5CU0QgU2VjdXJlIFNoZWxsIHNlcnZlcjogc3NoZHN0b3Bw
ZWQNCj4gPiAvdXNyL3NiaW4vc3NoZCAocGlkIDczOTcgMTE4OSk8YnIgLz5TdG9wcGluZyBudHBk
OiBkb25lPGJyIC8+c3RvcHBpbmcNCj4gPiByc3lzbG9nZCAuLi4gZG9uZTxiciAvPlN0b3BwaW5n
IHJhbmRvbSBudW1iZXIgZ2VuZXJhdG9yIGRhZW1vbi48YnINCj4gPiAvPkRlY29uZmlndXJpbmcg
bmV0d29yayBpbnRlcmZhY2VzLi4uIGRvbmUuPGJyIC8+U2VuZGluZyBhbGwgcHJvY2Vzc2VzDQo+
ID4gdGhlIFRFUk0gc2lnbmFsLi4uPGJyIC8+cmFja21vbmRbMTc0N106IEdvdCByZXF1ZXN0IGV4
aXRbIDUyOC4zODMxMzNdDQo+ID4gd2F0Y2hkb2c6IHdhdGNoZG9nMDogd2F0Y2hkb2cgZGlkIG5v
dCBzdG9wITxiciAvPlNlbmRpbmcgYWxsIHByb2Nlc3Nlcw0KPiA+IHRoZSBLSUxMIHNpZ25hbC4u
LjxiciAvPlVubW91bnRpbmcgcmVtb3RlIGZpbGVzeXN0ZW1zLi4uPGJyDQo+ID4gLz5EZWFjdGl2
YXRpbmcgc3dhcC4uLjxiciAvPlVubW91bnRpbmcgbG9jYWwgZmlsZXN5c3RlbXMuLi48YnINCj4g
PiAvPlJlYm9vdGluZy4uLiBbIDUyOS43MjUwMDldIHJlYm9vdDogUmVzdGFydGluZyBzeXN0ZW08
YnIgLz48YnIgLz48YnINCj4gPiAvPkNoZWVycyw8YnIgLz48YnIgLz5UYW88L3A+PC9ibG9ja3F1
b3RlPjxkaXY+wqA8L2Rpdj48ZGl2Pg0KPiA+IDwvZGl2PjxkaXY+LS3CoDwvZGl2PjxkaXY+QmVz
dCByZWdhcmRzLDwvZGl2PjxkaXY+S29uc3RhbnRpbg0KPiA+IEtsdWJuaWNoa2luLDwvZGl2Pjxk
aXY+bGVhZCBmaXJtd2FyZSBlbmdpbmVlciw8L2Rpdj48ZGl2PnNlcnZlcg0KPiA+IGhhcmR3YXJl
IFImYW1wO0QgZ3JvdXAsPC9kaXY+PGRpdj5ZYW5kZXggTW9zY293IG9mZmljZS48L2Rpdj48ZGl2
PnRlbDoNCj4gPiArNy05MDMtNTEwLTMzLTMzPC9kaXY+PGRpdj7CoDwvZGl2Pg0K
