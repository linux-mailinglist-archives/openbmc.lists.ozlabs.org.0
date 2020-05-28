Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E198A1E5CF6
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 12:17:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XkCp1dS4zDqSv
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 20:17:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=apc01-pu1-obe.outbound.protection.outlook.com
 (client-ip=40.107.132.51; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=kwliu@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=nuvoton.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-nuvoton-onmicrosoft-com header.b=r4gCJtaQ; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320051.outbound.protection.outlook.com [40.107.132.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XkBv4N09zDqX8
 for <openbmc@lists.ozlabs.org>; Thu, 28 May 2020 20:16:54 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cv8cy2RYhpblUn4EHJF5A4IQ1noBrMTK2E7w8DnRlhS6lgO47mAab9zdQVbHRGmbBQtfDIlhpUW4AtgAo1VM/m2qrAYgftP5l0pXsyaANz6x/PsWG4+nL/wJcnFNpKiCgfMqsCjBCJKY9n/bUrhiUhVE/CjtBEYMS5N0WPo88A6TqE9AxUMcGzmSIQ9HZBfwD1fOhOZ26s6dyLbzsVOpYAKbBgO1pliJuGil3qKZl6b2mhUR8V9vzpnn0GX0JRD448P15Ht8ngL4QgdZ1hBrph1OucLlc3HHs3xAUC9TdwBaDLi37e75HXqURRb4j2wGDWKOQojcO541F98Z/DhTVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RR2LCoSU6nPTBRjoVI4EANuS5PUb7qVEcOU2t8iAgNs=;
 b=Nmsk44gm0Bna3+mOFpmKiXPXBTgBjy4l5zF5H63saiiPH6Ttijt5EJYgx3m6sO6D/B/WC+wwyorYKeUzGWw20w44T9yLknV45sWboTaxW0s9u5SN69PTBy1YzdTfzbe5W0qLxySNVGPFyiVMSiOqWuSzbpWuNfT2K4dDgdHBrrBi5a6szQ0SYNKbZfCzwaUtkfgYWFh3DFGtx7BvnHgx/Y4Ihau6JLWx3a8aDL1+EkdUG5RreN0IvGBDKZnd9YIqCmhS2HxdfBvgUHy0Jb0HPiqbrQSvfLV5rzAa50+obuSKT1nKwoxapP7vH5/myXqYrd+g0vLpH4dh049ogVSIyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RR2LCoSU6nPTBRjoVI4EANuS5PUb7qVEcOU2t8iAgNs=;
 b=r4gCJtaQxieKQcJkGoe9VD2Om7jSnb/tZY5e8DdH910cb2AJrnzQGp385oeOxfT1Za10MvnMD3tYdhm13QYzcC5HTSzJux2J8TcIr5QkUSc6LLqv+a/8wF1EMG8sYg9FE4QAuEfHFLy9Sf5WGlYxzzFSVfvl3NgxFdOySdJCuH4=
Received: from HK2PR03MB4371.apcprd03.prod.outlook.com (2603:1096:202:1d::20)
 by HK2PR03MB4259.apcprd03.prod.outlook.com (2603:1096:202:1f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.7; Thu, 28 May
 2020 10:16:48 +0000
Received: from HK2PR03MB4371.apcprd03.prod.outlook.com
 ([fe80::f90e:35fa:737e:d13c]) by HK2PR03MB4371.apcprd03.prod.outlook.com
 ([fe80::f90e:35fa:737e:d13c%7]) with mapi id 15.20.3045.018; Thu, 28 May 2020
 10:16:47 +0000
From: CS20 KWLiu <KWLIU@nuvoton.com>
To: =?utf-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>
Subject: RE: Adding usb-ctrl from intel-bmc into phosphor-misc
Thread-Topic: Adding usb-ctrl from intel-bmc into phosphor-misc
Thread-Index: AQHWNNMc+/JBKh1y00Cs+wXaij+E7ai9P6yw
Date: Thu, 28 May 2020 10:16:47 +0000
Message-ID: <HK2PR03MB43717A31E8F612DD03F98B91AE8E0@HK2PR03MB4371.apcprd03.prod.outlook.com>
References: <2ea02fe94323438fbc4cec4e62c242c4@intel.com>
 <CAGm54UEYbzqONDMDweanD_T9fsuWXQ9czFB0=1GjsmGANJ1wKA@mail.gmail.com>
 <c3ab98b048824b50859560d747d07f84@intel.com>
 <CAGm54UG4peETHnXjaGoAV2vCxxiKOKfTbhHmZUiinjMPf6wHGQ@mail.gmail.com>
 <HK2PR03MB4371B6DB3601AB751B32F9F0AE8E0@HK2PR03MB4371.apcprd03.prod.outlook.com>
 <CAGm54UG8feqtPFNZwB9MUVRO9hsYn4TNwPDQ4j4YKM8uofzQ6g@mail.gmail.com>
In-Reply-To: <CAGm54UG8feqtPFNZwB9MUVRO9hsYn4TNwPDQ4j4YKM8uofzQ6g@mail.gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bytedance.com; dkim=none (message not signed)
 header.d=none;bytedance.com; dmarc=none action=none header.from=nuvoton.com;
x-originating-ip: [39.11.68.236]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bee2b8eb-98cb-4484-649b-08d802f03b1a
x-ms-traffictypediagnostic: HK2PR03MB4259:
x-microsoft-antispam-prvs: <HK2PR03MB4259A84431C804555EC528DBAE8E0@HK2PR03MB4259.apcprd03.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0417A3FFD2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ImjEJkJ9nGxwyx2hEmhD8HtZT1QYL1cbGZ6NB7EV9jsP+zgdIZdVMCHqOL9PkHs6dAQX3I5u5mqVeqi0Z7h3n7w99hWUeCm3TBQj+YNHdjp9TaKlFmSMW+fdB6LpDj5CVTskDiuqGlMH/ba9yeiuyNeTM3ynS6ahKNOgHaAAitgcZqQ+SCWpT0VaYBoQ14TiUktYfedAQ9ecr0warloR0Hd6w3+NkbQ2TP7+MOve3+f0rtBowC+MyivLT6TsitIh/f+XM2BdOJCDj1Kap603A64jpI6xNTeo7B2aHXmY8QsE9HlXsFDDaNKqXyNDuV6mongP8i4wg/lVtcmM/DUh1tEfkjIbUhgH4Wi+YAh2pWjAxC4DwHFSDqkRXbMGcK+hWcfndOa7m02ikCbX+iImBw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR03MB4371.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(376002)(346002)(396003)(136003)(39850400004)(4326008)(9686003)(2906002)(8936002)(478600001)(186003)(86362001)(45080400002)(54906003)(26005)(83380400001)(966005)(6916009)(33656002)(316002)(66476007)(66946007)(66556008)(64756008)(66446008)(7696005)(55016002)(8676002)(53546011)(6506007)(5660300002)(19627235002)(76116006)(52536014)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Zlg05YGt4cSRe+r4Wj32m9ouVSPvPymb6uzbuKQAWO30i9NGRTACynk/IU9HRF2RZ114d8mVz7C+mvpszMO7YxnppIDM5dPfj7g9qKhK7Tc/3s7Rl4ZuupsrlS6u9BdMLSyIj22ADoBeOm/g0VSarrSRmxL3oZ9lodoRRUjMvc0n65mb3zkw9J+t8L6WyeNtcji3THus7BlKQ/CYkIAdtkhhm/xwaePKsQoAuCm59HxU24vCKM5Fp6spclOF7cFkp4WnRJyVXd8jrK34eNpuvF/IC3ew3QKqN97lmbtuTn3uNLFVpUxoAkR919pMDPWf827dxVKRj3qPXEUUQelEHKaVdWJO5erM8xMYEpmj3G6ladBgn6MMfF161GUOvyv6cX70AE12bJppxXgNtlrYNyPVfAcP3qyOOPl1oR0uMYz378+NcaXRLbeTqfg47VW1jjP3kW/q7D6QqIPZYyG2snUH2fZVZ5F3Fqh5A8jNA3c=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bee2b8eb-98cb-4484-649b-08d802f03b1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2020 10:16:47.8308 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o8OKteaLjSwQZyn9z1+rBdRE3IX+x8UnrqWshHJyrYhSNgjLVbw/eqzoRax/prrM5v5yGhUEUWZPmOmEEMTtHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR03MB4259
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
Cc: "Wang, Kuiying" <kuiying.wang@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkNCg0KUk5ESVMgaXMgYSBNaWNyb3NvZnQgc3RhbmRhcmQsIGl0IGlzIG5vdCBvbmx5IHN1cHBv
cnRlZCBpbiBXaW5kb3dzIE9TIGJ1dCBhbHNvIGluIG90aGVyIE9TIHBsYXRmb3Jtcy4NClNvLCB0
aGlzIGlzIGFuIG9wdGlvbiB3ZSBjYW4gcHJvdmlkZSBhcyB3ZWxsLg0KDQpJIHdpbGwgY2hlY2sg
eW91ciBwYXRjaCB0byBzZWUgaG93IHRvIG1lcmdlIHJuZGlzIHNjcmlwdC4NCg0KVGhhbmtzLg0K
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IOmDgembtyA8eXVsZWkuc2hAYnl0ZWRh
bmNlLmNvbT4NClNlbnQ6IFRodXJzZGF5LCBNYXkgMjgsIDIwMjAgNTozNCBQTQ0KVG86IENTMjAg
S1dMaXUgPEtXTElVQG51dm90b24uY29tPg0KQ2M6IFdhbmcsIEt1aXlpbmcgPGt1aXlpbmcud2Fu
Z0BpbnRlbC5jb20+OyBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNClN1YmplY3Q6IFJFOiBBZGRp
bmcgdXNiLWN0cmwgZnJvbSBpbnRlbC1ibWMgaW50byBwaG9zcGhvci1taXNjDQoNCk9uIFRodSwg
TWF5IDI4LCAyMDIwIGF0IDU6MDIgUE0gQ1MyMCBLV0xpdSA8S1dMSVVAbnV2b3Rvbi5jb20+IHdy
b3RlOg0KPg0KPiBIaSwNCj4NCj4gRm9yIGluLWJhbmQgdXNiIG5ldHdvcmsgY29tbXVuaWNhdGlv
biwgSSByZWNvbW1lbmQgdGhhdCB5b3UgY2FuIHVzZSBybmRpcy4NCj4gVGhlcmUgaXMgYSB1c2Ig
bmV0d29yayByZWNpcGUgbG9jYXRlcyBpbiBxdWFudGEncyBsYXllciwgeW91IGNhbiB0YWtlIGl0
IGFzIHJlZmVyZW5jZS4NCj4gaHR0cHM6Ly91cmxkZWZlbnNlLnByb29mcG9pbnQuY29tL3YyL3Vy
bD91PWh0dHBzLTNBX19naXRodWIuY29tX29wZW5ibQ0KPiBjX29wZW5ibWNfdHJlZV9tYXN0ZXJf
bWV0YS0yRHF1YW50YV9tZXRhLTJEY29tbW9uX25ldHdvcmsmZD1Ed0lCYVEmYz11DQo+IGU4bU84
emdDNFZaNHFfYU5WS3Q4RzlNQzAxVUZEbWlzdk1SMWstRW9ETSZyPTdnMkQxWERjMUVUM0NuWTF5
U25hV1FYUHgNCj4gUHhmcEx3dzFNaURiTFc0djhRJm09Qi1VWXQwUGJxRU5oaEZ3UFJlUjA3T0Y4
ZGkxbmF1SWc3ejByM3UyWnBxTSZzPXh4dw0KPiBPNUJNeDhjTXdSWHROWi1aR1RQZ0NEcmdJeTVl
WGZoRU1vckYtRk5ZJmU9DQo+IGh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91
cmw/dT1odHRwcy0zQV9fZ2l0aHViLmNvbV9vcGVuYm0NCj4gY19vcGVuYm1jX2Jsb2JfbWFzdGVy
X21ldGEtMkRxdWFudGFfbWV0YS0yRGdzal9yZWNpcGVzLTJEa2VybmVsX2xpbnV4Xw0KPiBsaW51
eC0yRG51dm90b25fZ3NqLmNmZy0yM0w0MCZkPUR3SUJhUSZjPXVlOG1POHpnQzRWWjRxX2FOVkt0
OEc5TUMwMVVGDQo+IERtaXN2TVIxay1Fb0RNJnI9N2cyRDFYRGMxRVQzQ25ZMXlTbmFXUVhQeFB4
ZnBMd3cxTWlEYkxXNHY4USZtPUItVVl0MFANCj4gYnFFTmhoRndQUmVSMDdPRjhkaTFuYXVJZzd6
MHIzdTJacHFNJnM9aU92RHRaaUlKS29FSVFCYTZVYUtOaFdiVVFKaERILQ0KPiB0dVNsbkRuRFAw
ZGcmZT0NCg0KWXVwLCBpdCBsb29rcyBsaWtlIGJvdGggcm5kaXMgYW5kIGVjbSB3b3JrLg0KQ291
bGQgeW91IGtpbmRseSBlbGFib3JhdGUgd2h5IHlvdSByZWNvbW1lbmQgcm5kaXM/DQoNCkJ0dywg
SSBzZWUgdGhlcmUgYXJlIHR3byBkaWZmZXJlbnQgc2NyaXB0cyBpbiBtZXRhLXF1YW50YSBsYXll
ciwgb25lIHVzZXMgcm5kaXMgYW5kIHRoZSBvdGhlciB1c2VzIGVjbToNCmh0dHBzOi8vdXJsZGVm
ZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwcy0zQV9fZ2l0aHViLmNvbV9vcGVuYm1j
X29wZW5ibWNfYmxvYl9tYXN0ZXJfbWV0YS0yRHF1YW50YV9tZXRhLTJEZ3NqX3JlY2lwZXMtMkRn
c2pfdXNiLTJEbmV0d29ya19maWxlc191c2ItNUZuZXR3b3JrLnNoJmQ9RHdJQmFRJmM9dWU4bU84
emdDNFZaNHFfYU5WS3Q4RzlNQzAxVUZEbWlzdk1SMWstRW9ETSZyPTdnMkQxWERjMUVUM0NuWTF5
U25hV1FYUHhQeGZwTHd3MU1pRGJMVzR2OFEmbT1CLVVZdDBQYnFFTmhoRndQUmVSMDdPRjhkaTFu
YXVJZzd6MHIzdTJacHFNJnM9bURwLUJrOWVTUzgteHlSc1NlYkYyU3ZuLW9taFp5QTllSU5hSXJQ
N2tkMCZlPQ0KaHR0cHM6Ly91cmxkZWZlbnNlLnByb29mcG9pbnQuY29tL3YyL3VybD91PWh0dHBz
LTNBX19naXRodWIuY29tX29wZW5ibWNfb3BlbmJtY19ibG9iX21hc3Rlcl9tZXRhLTJEcXVhbnRh
X21ldGEtMkRjb21tb25fbmV0d29ya191c2ItMkRuZXR3b3JrX3VzYi0yRG5ldHdvcmsuc2gmZD1E
d0lCYVEmYz11ZThtTzh6Z0M0Vlo0cV9hTlZLdDhHOU1DMDFVRkRtaXN2TVIxay1Fb0RNJnI9N2cy
RDFYRGMxRVQzQ25ZMXlTbmFXUVhQeFB4ZnBMd3cxTWlEYkxXNHY4USZtPUItVVl0MFBicUVOaGhG
d1BSZVIwN09GOGRpMW5hdUlnN3owcjN1MlpwcU0mcz1KNkFPbW1taXNnR2EtVHZvcWZ3VHJ0cng2
TTFjSkd5b0VQTmJZbmZNV01VJmU9DQoNCldvdWxkIHlvdSBtaW5kIGlmIHlvdSBjb3VsZCBtZXJn
ZSB0aGUgc2NyaXB0cyBpbnRvIGh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91
cmw/dT1odHRwcy0zQV9fZ2Vycml0Lm9wZW5ibWMtMkRwcm9qZWN0Lnh5el9jX29wZW5ibWNfcGhv
c3Bob3ItMkRtaXNjXy0yQl8zMjg3OC0zRiZkPUR3SUJhUSZjPXVlOG1POHpnQzRWWjRxX2FOVkt0
OEc5TUMwMVVGRG1pc3ZNUjFrLUVvRE0mcj03ZzJEMVhEYzFFVDNDblkxeVNuYVdRWFB4UHhmcEx3
dzFNaURiTFc0djhRJm09Qi1VWXQwUGJxRU5oaEZ3UFJlUjA3T0Y4ZGkxbmF1SWc3ejByM3UyWnBx
TSZzPXo1eHh0cXNRTjNXcVp1NG1rUzk4YVRtR1JaMU8tWTZzcHpqdEx6Y0JVZXMmZT0NCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXw0KIFRoZSBwcml2aWxlZ2VkIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlvbiBjb250YWluZWQg
aW4gdGhpcyBlbWFpbCBpcyBpbnRlbmRlZCBmb3IgdXNlIG9ubHkgYnkgdGhlIGFkZHJlc3NlZXMg
YXMgaW5kaWNhdGVkIGJ5IHRoZSBvcmlnaW5hbCBzZW5kZXIgb2YgdGhpcyBlbWFpbC4gSWYgeW91
IGFyZSBub3QgdGhlIGFkZHJlc3NlZSBpbmRpY2F0ZWQgaW4gdGhpcyBlbWFpbCBvciBhcmUgbm90
IHJlc3BvbnNpYmxlIGZvciBkZWxpdmVyeSBvZiB0aGUgZW1haWwgdG8gc3VjaCBhIHBlcnNvbiwg
cGxlYXNlIGtpbmRseSByZXBseSB0byB0aGUgc2VuZGVyIGluZGljYXRpbmcgdGhpcyBmYWN0IGFu
ZCBkZWxldGUgYWxsIGNvcGllcyBvZiBpdCBmcm9tIHlvdXIgY29tcHV0ZXIgYW5kIG5ldHdvcmsg
c2VydmVyIGltbWVkaWF0ZWx5LiBZb3VyIGNvb3BlcmF0aW9uIGlzIGhpZ2hseSBhcHByZWNpYXRl
ZC4gSXQgaXMgYWR2aXNlZCB0aGF0IGFueSB1bmF1dGhvcml6ZWQgdXNlIG9mIGNvbmZpZGVudGlh
bCBpbmZvcm1hdGlvbiBvZiBOdXZvdG9uIGlzIHN0cmljdGx5IHByb2hpYml0ZWQ7IGFuZCBhbnkg
aW5mb3JtYXRpb24gaW4gdGhpcyBlbWFpbCBpcnJlbGV2YW50IHRvIHRoZSBvZmZpY2lhbCBidXNp
bmVzcyBvZiBOdXZvdG9uIHNoYWxsIGJlIGRlZW1lZCBhcyBuZWl0aGVyIGdpdmVuIG5vciBlbmRv
cnNlZCBieSBOdXZvdG9uLg0K
