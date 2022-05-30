Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D2D53747F
	for <lists+openbmc@lfdr.de>; Mon, 30 May 2022 09:06:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LBRKd4vnCz3bYS
	for <lists+openbmc@lfdr.de>; Mon, 30 May 2022 17:06:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=CvIL9S+8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::71e; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=CvIL9S+8;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2071e.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::71e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LBRK60JX8z2yLg
	for <openbmc@lists.ozlabs.org>; Mon, 30 May 2022 17:06:16 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJ97fbjUQShLo0zpes3jLelQTBLgg9lfKPm8dc+aQUyv700ga8D8gvsad8qxyXt2TWRfX1PUVQ7AiTp56EfPvwkrtcSoxIZtblG1f1my8nySodYT3t+alPCxnZ74//nayHwKqMWuqVcC2Gn+hdmdi+mW6ob4bNAjew1FK9v/ypd8YNyH3DLPMSe2vd4ge3wq8zurPlKpedaaOnBEYapo9a1ndvGNa6fX1bQyuzMEUE5E92iHPWsd9vfZtSr14F0xGEpG7UsmpdBe9eb4Qzb3HqWkgdjD0uURnMge13zZ3LSS+VunFUTrNTuGvmveaNFo8ah/LBCCNzxjbYG7XqIQqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rYf7gqF5/n+fjDhfe78cDd3go78xXOZ3wBFfP+QsKFE=;
 b=WInssEsqTFSPx+++faeMTTRAPP8zrQniSyxTZC4wt2CqPxWh1fbokFLdYgw6sHXxHiDpc22CJRoV2Mo0EO/8BbMIKE2QufKBIc5zZnv59MhO7HYkxMuV03gfV/gxTlqPoA6dxW5cYpRfTc+cLNDNoSS6bfDPvEQu5mj38oLLco8Kw6b+sshOuA8Sz6vx/TUrAs/kTN0zREJ/YkpJZm/Tj6OwxBku4FeFenUowgRp/biKxbK65sl4CEcmAWZ1kag1I14cmPXoJqH3Vc30VSHx8T+jZTNn7fLilQPVBunEtnfiBLRBkTCqlFQLcRdH5JwNYTIZdApnxkavkLtJgR7bQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rYf7gqF5/n+fjDhfe78cDd3go78xXOZ3wBFfP+QsKFE=;
 b=CvIL9S+8aJDkM0LtQzeauprtURWkGA2HCdwAO+fh9ZfHEFvQvypatcNJD/Lrwb6LulsQyzGdtdyzlFW/w9k7nP0Mr4ZR2JNNNNJ5Y7pxnnN9VS/9is6wDFtRLjFEkxEf3qRcYZOQVhc8SxDO9PAG9+B7dE4BEfQ6P5pmhFX/CAPB18shROi4XOpEl7xTHdrpSSK+ZqzCS5yDSMowZKOfGNTZ+wLFcKQTzFfswBhH898Lij34mVeZvV/CzmlRVtYuiduim43MC25lVQ3ywAMpiemOPLGdRm/QZNrDjMLTCeBCCzzQAwELpO4o0rv1XwRTI5qWOHiK1nSt/GvMJJSo9Q==
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by SL2PR06MB3084.apcprd06.prod.outlook.com (2603:1096:100:32::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 07:05:55 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::5058:cb66:c181:f869]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::5058:cb66:c181:f869%5]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 07:05:54 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: =?utf-8?B?5LiN6K+t?= <junhengdi@163.com>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>
Subject: RE: How to access ESPICFG register on ast2500 ?
Thread-Topic: How to access ESPICFG register on ast2500 ?
Thread-Index: AQHYc+8o743klrmycEeVoS3hGzjJH602/ptg
Date: Mon, 30 May 2022 07:05:54 +0000
Message-ID:  <HK0PR06MB37795CB71B86D98466B0DCAE91DD9@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <5210e155.1acb.18109aca784.Coremail.junhengdi@163.com>
In-Reply-To: <5210e155.1acb.18109aca784.Coremail.junhengdi@163.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 37169545-c2b5-4c6d-95b6-08da420ad6f0
x-ms-traffictypediagnostic: SL2PR06MB3084:EE_
x-microsoft-antispam-prvs:  <SL2PR06MB3084BBBA1EFC4E729D97A90B91DD9@SL2PR06MB3084.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ZgIAlbc26P7XqSfGBEzDkdHEpHTClxYbjb/yCV/oFaE9q1z2WEmyewzh2+lIxPyb7qpWfjw/fGM1kfOenY/1VBMOdYdQ/OHcEHesWRMTckX2n4Ew4aUMrXRbIXrr5/OrE2RgY1j3X0Sjd9hCK81o57BkvcB3Qw6yURvJPyzjATCDXtItvsuwATDYhV5Wv7ugeWHgMiYwMJrC/eabndrbVPlkDhmyXKsEACNhQwfYLspKGcJKihRvLsPR/KtqJLWZ9LUPfIyJsG1R3fQJZzGsl34nSGEzca0rZ4qDMTvi7/B0goruaBhG/sL+MS6WUtHrL/2ZYraWWrN/RzU+BbP773ohuhbB4Sy3NTeJDzvDDylBbqhwexPW8sFf16qdNRUZIAcQe8WAP32CsBlRARIuUVXPC9+zm7/hUabxyCs8zd4A0kQRZ/RbS+8r7X1EC/UxQhme+NvDIDyjWDo9oc4XdIostpFK1+rL5dKdLXDYe6zuaal8D5p7sP6QJ1dQzrgIM6G2s8lt8t/1JWkdyk83TQtrGUEW1j62dfTdVyYokp/zF7Ri5xwOE+kgoQycbbSj3qAfWQvwsn0GZs1DVZiob0tRsxQpFzXph/DmzqzCS7EDJvGUxDW/rXttStrMkI9XDf7Y1CWmzx4SpmRCdH+p2tvTKb8HnZjLLH0/0ItPhk1U7EwwkqrEewGVSp9IRWR8UhQW3DzKv7SczmexRduykQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR06MB3779.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4744005)(83380400001)(33656002)(6506007)(9686003)(26005)(38100700002)(66946007)(66556008)(64756008)(66446008)(66476007)(508600001)(86362001)(316002)(7696005)(71200400001)(110136005)(8676002)(2906002)(122000001)(55016003)(76116006)(8936002)(38070700005)(5660300002)(52536014)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NHh6RUVaU0xwaUhPZ0I1VHJYeGpwNGVuajRWTksxWER6OWFrMUhDQU1qMm5u?=
 =?utf-8?B?cUtMaENzNkgvVDJiLzBndVB6ZmlHMnBRRlN0S0xxdmdac0NEQmg4MXdpaSt4?=
 =?utf-8?B?RnJLcXgyR2RUQUVIR0RBN213WnB4Mm9HMTZ2c0h4ekp0dzIxWWx5NTNseVZM?=
 =?utf-8?B?dmhLVUVPRzlWa0s4dm9rNEljdDhlSzM1RnViWlFLSGgvSXRYcm1iVzJNaVZU?=
 =?utf-8?B?cHBHWjM4ZmZJQjJLSkc4TGZSdDUySGc5Z0luZ0pxS29CSDR1cEZHOW95TVVP?=
 =?utf-8?B?QlU0SmVIRUd3MHdPSTZEekJKSDFxOUtzUUl5YXB0Y2hHazhMRC92Zy9tTjdH?=
 =?utf-8?B?TUdhcFpBR1JuWWtLU1lZYzlCdGR1TDBwemY5Q1JOcnVkQzVlWHdRSnNyVE1m?=
 =?utf-8?B?RTRsMlMwajUvQXM0eS85M1IyOEhjRnhRZ05tZDY3M1Q4a2RZOFZRTU82WWNS?=
 =?utf-8?B?WlhkSEVhMnFBUVUxc2V2alBJVDV4anRpWVoxS2dTQnZ0L042ZHJ1QjJocXgw?=
 =?utf-8?B?UnEwbjF6UGhzbjNvLzN2OXB6aFI5MFQ2R1VLL3p2MkFyVy9vYzlTVUt3Q3RR?=
 =?utf-8?B?bzg1MWxVZ2p1MlRMeHpOYkZyeVpFakNNb04wdno0YWJvU3Bwc0VycVVYQUEr?=
 =?utf-8?B?a0pGVjgyVlVpazNXSlc0aWkyRDRMNTVuR3NCQ0lZU3Q5UEczeDZHbXg1K0Vx?=
 =?utf-8?B?UWN2MlVrcUZSaVJ0NkRsUlFPelA1Y3Z3dmRMdXdraXpoUCsvbEQySzZqWlQw?=
 =?utf-8?B?bUtYbG5GZjZqa3BESVJMM21KR1I0U2swUGh4aE1raGNYYjA3QTVPd1FDT3Uy?=
 =?utf-8?B?UFhzdEVtQTZUUkIvcnpJTWtYY0NpSVhDeWRrUENNbXBEZWVMTzYxTEZweXND?=
 =?utf-8?B?ZWsrODgxTWtvakp0S3lEaFFLQi9wUTVKMUpmTVFjZVBjT0h2RkVGWjVDMW02?=
 =?utf-8?B?MGpwRGpiNFZWU0dKNjQralJiby9vNzI1RXJFZlAxT1B0d05Ec0ZyZHZlSUpQ?=
 =?utf-8?B?UzljL0s1emJJdjcwaUdxZmUzT3IzZXh2R0RnSjdZSjFOWG44bTdjd1JqUGVv?=
 =?utf-8?B?T3h4SEFpSW5LMFF4MW5DdHJQN3dXOGF3ME1WVmxRUWEvUDlRbThCdHozUE9s?=
 =?utf-8?B?U0NMdjU0VVRTOGZ1MmlnS2ZibXFKTXdyL05iQTkxNHYxTlcySmVtSnZWa1d2?=
 =?utf-8?B?R3pSWFg2czR5ZDhiaktLcXFjNXhoWEVhQk42L2hjaFhHOW5STHZEYVFlQlFy?=
 =?utf-8?B?cTU2ZmwzNDdENzhZNmozQzdqNnUyRlhMZk40TC9iMC9TN3VGR2NFR0ZDVmly?=
 =?utf-8?B?UDhDVFFPSTZPc2NQVnhQNWZYOTFRc0tkWkJTeXJqQ2hlUnprZkFyK3Z6YXhq?=
 =?utf-8?B?dlVYMVRUZTFDSHlVakxqQ0I5TGhCUWx1ZExYYmpBYzg4N3BES2RkbXNVYWkw?=
 =?utf-8?B?U1lKbmFOdlc2UTBvaU1qM2xCWUF2RmJrWDBNbnQvKzkzcnlyMzlMZDVSSE5W?=
 =?utf-8?B?V04zUXd6anRldWk3S3lGUndVVUNuekJ6Z1I4aThEbDdmU3AzNXBicmRnc0tP?=
 =?utf-8?B?TTFMNHpzNE51ekRTRUN3a2VEaUphYlcwTjRSVW9ITkJnclV6T1JUNDJ5OVll?=
 =?utf-8?B?OTZLeFpjbmNLaWd4ZE9vcE90UkZ5a0UxcnV0QlB1N1lkNHJnNEJEWjFMb1lG?=
 =?utf-8?B?eEFIOWxlVEN4THZJWmp4WTFJQS8vWXpIWnlSbkppL1VEYmFCcXJ6S2pKSTd0?=
 =?utf-8?B?Yit1a2lkbmkrakNmYmlLK2hNMXZJeWNvUnNPZG5paHJXTm5HRFF1TWhKTXk4?=
 =?utf-8?B?aGd0eVdvUFFvU2oxSVJ0OFNXN2pzVUs0TThORVlSVnJJRE5pbWJWM1c5cjRk?=
 =?utf-8?B?Lzk5b3FraXZ4d21NVnFsL0NZVmdXWGZOMWI1RnIzSjFYWmkxWWlXbDRjWndN?=
 =?utf-8?B?RmtJVkhkYmN1VHc1N0NJUDBzR0lBUTEwdFFrK3hiWnRQdTc0K3NTclJhejlS?=
 =?utf-8?B?WlI5RUVSeUYrRndCM04rRC82WFQyZGVZRDZHMlhjcEsvd3JGelpSWnFwMldm?=
 =?utf-8?B?RGZpbGxLVE1rK0Urb25mZkpIMllHL2podlo4VEFvb1U2dXBOMm82L096MHJN?=
 =?utf-8?B?ejNXVmNMeWg0YjVEbUplK1JrUm95VDNPcExDUEZoYzY5cVpZbHJobkw1bnRB?=
 =?utf-8?B?RjByNVA1QTd0MVhTMVI0WTA2Rzc4bmpNT0dvVlREVmxvd1llL1VKWGVBSWxp?=
 =?utf-8?B?UDIxMzkzK2o1U0taKzdXVnN4VFZaeTN5Y1U0cjc3RGRyL3BYVnFyczUvUFhp?=
 =?utf-8?B?ZlAxanpLa20wMGQvZ3hKdDdBRDNSQkJyelV2eU9QWkxJUnc4MEs3VzlvQVA2?=
 =?utf-8?Q?PuPNCHK3Tcvzxlkk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37169545-c2b5-4c6d-95b6-08da420ad6f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2022 07:05:54.9075
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SepVxq526WoPnK+pPI52rVDIseK51u8DUNizGNnAOdpmIzu5I8Z/RNYENZTQfMSidJ1rB6U7frFxrruTF9TOOVomlWNE2ywOoQC7bB7o0iI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR06MB3084
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

PiBGcm9tOiBvcGVuYm1jIDxvcGVuYm1jLWJvdW5jZXMrY2hpYXdlaV93YW5nPWFzcGVlZHRlY2gu
Y29tQGxpc3RzLm96bGFicy5vcmc+IE9uIEJlaGFsZiBPZiDkuI0/DQo+IFNlbnQ6IFNhdHVyZGF5
LCBNYXkgMjgsIDIwMjIgMzo1OSBQTQ0KDQo+IERlYXIgb3BlbmJtY2VyLA0KwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBJIHdhbnQgdG8gYWNjZXNzIEVTUElDRkcgcmVnaXN0ZXIg
c3VjaCBhcyBFU1BJQ0ZHMDA0ICxFU1BJQ0ZHMDA4IG9uIGFzdDI1MDAgLiBCdXQgSSBkbyBub3Qg
a25vdyB0aGUgYmFzZSBhZGRyZXNzIG9mIEVTUElDRkcgcmVnaXN0ZXIuDQrCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoEluIGFzdDI1MDAgZGF0YXNoZWV0ICwgb25seSBFU1BJIGNv
bnRyb2xsZXIgYmFzZSBhZGRyZXNzIDB4MWU2ZWUwMDAgLGJ1dCBpdCBvbmx5IGNhbiBhY2Nlc3Mg
RVNQSSByZWdpc3RlciBzdWNoIGFzIEVTUEkwMDQsIEVTUEkwMDguDQrCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoEkgd2FudCB0byBrbm93biBob3cgdG8gYWNjZXNzIHRoZSBFU1BJ
Q0ZHIHJlZ2lzdGVywqBzdWNoIGFzIEVTUElDRkcwMDQgLEVTUElDRkcwMDggb24gYXN0MjUwMC7C
oA0KDQo+wqBBbnkgYWR2aWNlIHdpbGwgYmUgYXBwcmVjaWF0ZWQuDQoNCkVTUElDRkcgcmVnaXN0
ZXJzIGNhbiBvbmx5IGJlIGFjY2Vzc2VkIGZyb20gdGhlIEhvc3QuDQpZb3UgaGF2ZSB0byBhY2Nl
c3MgRVNQSUNGRyByZWdpc3RlcnMgYnkgdGhlIEdFVF9DT05GSUdVUkFUSU9OIGFuZCBTRVRfQ09O
RklHVVJBVElPTiBjb21tYW5kcyBkZXNjcmliZWQgaW4gdGhlIGVTUEkgc3BlYy4NCg0KQ2hpYXdl
aQ0KwqANCg==
