Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D8512AAD6
	for <lists+openbmc@lfdr.de>; Thu, 26 Dec 2019 08:46:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47k28r04fyzDqJg
	for <lists+openbmc@lfdr.de>; Thu, 26 Dec 2019 18:46:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=apc01-pu1-obe.outbound.protection.outlook.com
 (client-ip=40.107.132.79; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=chli30@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=nuvoton.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.b="rvfInRtA"; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320079.outbound.protection.outlook.com [40.107.132.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47k28D3kNMzDqG1
 for <openbmc@lists.ozlabs.org>; Thu, 26 Dec 2019 18:46:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVrVVLYnBzxHS77Ij7Q3sWfT0wJxylVMRpBC+2W4bgMC8jz0ZtegDJOELFI3+H+KguL/L744zO8fnQI61qes8XrgPbnKMe3QEOTcXWDGV+6bBcC1KMj1FWRAOfVM65krw69vcOyoAfFAxD6vUsIF7p8Pkhe338ADA6LX1cXAzoPIQjpaWG6Nd9Z5cjUiUhXawJJgf3AXnmBPZDtkGNZyvUaz7D/PUcQwBnw0aQH4ceHAoNI8OVP01jrscqSU5U7Y/W9WBMl+7OD9H9yE9BJY0+UlggbXXfwKlorw/4e6lCC81C0JEJldpoI92nQs5WBo1kKbYf8c608TlM6+d/AuBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QNAwsJhqFGg5ctuzBE65XYWBondZyivUyyfSl6LE7Hw=;
 b=SZBWQrWnIwNssPBkCbJxmzNQyjIGY0pvtA4hLs9it8r8Z0Giqlfmv4ai7SjwOFbcCKXypw+6FLF1t2TkyD3aYZPxNOZq8DXTql4gFD7AYJDCOugt16fK1gQtZZ/9hFb0ukITKmz0B3RD0aTdXT23kD0hXciY1r2m9FgKAFVzNdvRJgYD5Oug2+PayAlyBE0NNEHoTUVVDHZjz6a4XI35lRWRbONHzfVGwM/KM/NcP4aaly3Bpr0IEbaorCbjyVqHeeNusZvioyjMvNdxWg+waYE9tZErhZV/RpYXaDxOgZgEMdjPbcgZi9NRj3FZ0zsH/G5Zm1EtODyU00Wv2mkOlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QNAwsJhqFGg5ctuzBE65XYWBondZyivUyyfSl6LE7Hw=;
 b=rvfInRtArnzlH90nkORCTfVkCspw2r2U+CcF/zRZt6siC9vaWRR+M7hFtYjkcbBhhL948WvF8iRMPZq8f/xzANbI/lvPQxOft0/rkJKYad0MNhzGsyzW56SU1V9V0dYcC1xp6atgweGswlIHAbTY5nDnGeSJoa1rVAZQj0WFHQM=
Received: from HK0PR03MB4660.apcprd03.prod.outlook.com (52.132.237.207) by
 HK0PR03MB3796.apcprd03.prod.outlook.com (20.177.70.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.10; Thu, 26 Dec 2019 07:46:14 +0000
Received: from HK0PR03MB4660.apcprd03.prod.outlook.com
 ([fe80::c63:ab0f:5220:9999]) by HK0PR03MB4660.apcprd03.prod.outlook.com
 ([fe80::c63:ab0f:5220:9999%6]) with mapi id 15.20.2581.007; Thu, 26 Dec 2019
 07:46:13 +0000
From: CS20 CHLi30 <CHLI30@nuvoton.com>
To: Lei YU <mine260309@gmail.com>, zhang_cy1989 <zhang_cy1989@163.com>
Subject: RE: How to change the soft link in target.requires or target.wants
 directory
Thread-Topic: How to change the soft link in target.requires or target.wants
 directory
Thread-Index: AQHVu7ynwiENb//ZOkSaJWXMJLawtafMBu+AgAAA+AA=
Date: Thu, 26 Dec 2019 07:46:13 +0000
Message-ID: <HK0PR03MB4660E4622E092E8199B5AFB7CF2B0@HK0PR03MB4660.apcprd03.prod.outlook.com>
References: <13ed3524.9c60.16f4110e044.Coremail.zhang_cy1989@163.com>
 <CAARXrtkGz7oDdPHFY5R0kGTpn_c948Q1jXmwSN_hNkbJMnAKyw@mail.gmail.com>
In-Reply-To: <CAARXrtkGz7oDdPHFY5R0kGTpn_c948Q1jXmwSN_hNkbJMnAKyw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=CHLI30@nuvoton.com; 
x-originating-ip: [60.250.194.160]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 212dd59a-b125-443e-832f-08d789d7aeb5
x-ms-traffictypediagnostic: HK0PR03MB3796:|HK0PR03MB3796:
x-microsoft-antispam-prvs: <HK0PR03MB3796AD51AF4B6B1892C231A0CF2B0@HK0PR03MB3796.apcprd03.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 02638D901B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(39850400004)(366004)(376002)(346002)(13464003)(189003)(199004)(2906002)(4326008)(110136005)(66446008)(316002)(64756008)(5660300002)(52536014)(81166006)(478600001)(81156014)(8676002)(6506007)(66946007)(53546011)(76116006)(8936002)(7696005)(26005)(66476007)(66556008)(86362001)(55016002)(71200400001)(186003)(33656002)(9686003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HK0PR03MB3796;
 H:HK0PR03MB4660.apcprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nuvoton.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ekDgYImD+166E4msc64tgAD3v0kcbEhgaZuC4YAzcbjWgJqEMbAdH7zdIdXmSoW4X1ZB0Tg6q6qdRRkHpIB8amACIU0EgK9kiYaq8ZVau5rGE3RXSAYg+mrqV7bMnjdTj7hgZFommBSkn6PDo6Q00YSFw4YOQnd1KeCcVg3PZDziCoxI0qM6UwWrKh2jjk3bp05SUj3DNUQuLrbRpxCnBFtCTqWHnauUESer3RSgeP56k6zwyzCZoWCZKWMztz52rpOdFLFUaPK8SEthbnPiJ/p5xGIS2yxKXxHSgTwsXk/U3bc4kFRLf1lQemuhxwsEk1IwqZ4aaziwry28Fg7uk5IqZuOm7CtzbCfJdQEJW4Uo/MOZ3dlSyy30pk+U1bGS1F1l+m9Omj7FowXmq20R1qigGSlmj5wku55xmVHkXJ0xn4e7mlfJsH5smOtqBJf9uNI0uLGSxYSwM7xtDEhwIZElLau7LDGmQPSwQ1lNg30oY5UNQndxBHuBPMLhTEmf
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 212dd59a-b125-443e-832f-08d789d7aeb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Dec 2019 07:46:13.6720 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cEs41+ukVffSlvWEcACndDN1sXhsPKRB8+f0aQCWXq51WyYvijvYdgNr83Tqq0UGIkg0zClfvFyoz7knGFQjJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB3796
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgRmVsaXgsDQoNCklmIHlvdSBuZWVkIHRvIGFkZCB5b3VyIC5zZXJ2aWNlIHVuaXQgZmlsZSBp
bnRvIC53YW50IG9yIC5yZXF1aXJlcyBmb2xkZXIsIHlvdSBjYW4gdXNlIHN5c3RlbWQgdG8gZG8g
dGhhdCBpbiAuYmIgZmlsZS4NCg0KWW91IGNhbiByZWZlciBvYm1jLW9wLWNvbnRyb2wtcG93ZXJf
Z2l0LmJiIHRoaXMgZmlsZSBmb3IgZXhhbXBsZToNCg0KSW5zdGFsbCB0byAucmVxdWlyZXMgZm9s
ZGVyOg0KUkVTRVRfT05fVE1QTCA9ICJvcC1yZXNldC1jaGFzc2lzLXJ1bm5pbmdALnNlcnZpY2Ui
DQpSRVNFVF9PTl9JTlNURk1UID0gIm9wLXJlc2V0LWNoYXNzaXMtcnVubmluZ0B7MH0uc2Vydmlj
ZSINClJFU0VUX09OX0ZNVCA9ICIuLi8ke1JFU0VUX09OX1RNUEx9OiR7UkVTRVRfVEdURk1UfS5y
ZXF1aXJlcy8ke1JFU0VUX09OX0lOU1RGTVR9Ig0KDQpJbnN0YWxsIHRvIC53YW50IGZvbGRlcjoN
CiMgRm9yY2UgdGhlIHN0YW5kYnkgdGFyZ2V0IHRvIHJ1biB0aGUgY2hhc3NpcyByZXNldCBjaGVj
ayB0YXJnZXQNClJFU0VUX1RNUExfQ1RSTCA9ICJvYm1jLWNoYXNzaXMtcG93ZXJyZXNldEAudGFy
Z2V0Ig0KU1lTRF9UR1QgPSAibXVsdGktdXNlci50YXJnZXQiDQpSRVNFVF9JTlNURk1UX0NUUkwg
PSAib2JtYy1jaGFzc2lzLXBvd2VycmVzZXRAezB9LnRhcmdldCINClJFU0VUX0ZNVF9DVFJMID0g
Ii4uLyR7UkVTRVRfVE1QTF9DVFJMfToke1NZU0RfVEdUfS53YW50cy8ke1JFU0VUX0lOU1RGTVRf
Q1RSTH0iDQpTWVNURU1EX0xJTktfJHtQTn0gKz0gIiR7QGNvbXBvc2VfbGlzdF96aXAoZCwgJ1JF
U0VUX0ZNVF9DVFJMJywgJ09CTUNfQ0hBU1NJU19JTlNUQU5DRVMnKX0iDQoNClNpbmNlcmVseSwN
ClRpbQ0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IG9wZW5ibWMgW21haWx0bzpv
cGVuYm1jLWJvdW5jZXMrY2hsaTMwPW51dm90b24uY29tQGxpc3RzLm96bGFicy5vcmddIE9uIEJl
aGFsZiBPZiBMZWkgWVUNClNlbnQ6IFRodXJzZGF5LCBEZWNlbWJlciAyNiwgMjAxOSAzOjM3IFBN
DQpUbzogemhhbmdfY3kxOTg5IDx6aGFuZ19jeTE5ODlAMTYzLmNvbT4NCkNjOiBvcGVuYm1jQGxp
c3RzLm96bGFicy5vcmcNClN1YmplY3Q6IFJlOiBIb3cgdG8gY2hhbmdlIHRoZSBzb2Z0IGxpbmsg
aW4gdGFyZ2V0LnJlcXVpcmVzIG9yIHRhcmdldC53YW50cyBkaXJlY3RvcnkNCg0KT24gVGh1LCBE
ZWMgMjYsIDIwMTkgYXQgMzoxOCBQTSB6aGFuZ19jeTE5ODkgPHpoYW5nX2N5MTk4OUAxNjMuY29t
PiB3cm90ZToNCj4NCj4gRGVhciBBbGwNCj4gICAgVGhlIHRhcmdldC5yZXF1aXJlcyBvciB0YXJn
ZXQud2FudHMgY29udGFpbnMgc29tZSBzb2Z0IGxpbmsuDQo+ICAgIEV4Og0KPiAgICAgICAgIC9s
aWIvc3lzdGVtZC9zeXN0ZW0vb2JtYy1ob3N0LXN0YXJ0bWluQDAudGFyZ2V0LnJlcXVpcmVzDQo+
ICAgICAgICAgICAgICAgICAgICBscnd4cnd4cnd4ICAgIDEgcm9vdCAgICAgcm9vdCAgICAgICAg
ICAgIDMxIE5vdiAyOSAgMjAxOSBvYm1jLWNoYXNzaXMtcG93ZXJvbkAwLnRhcmdldCAtPiAuLi9v
Ym1jLWNoYXNzaXMtcG93ZXJvbkAudGFyZ2V0DQo+ICAgICAgICAgICAgICAgICAgICBscnd4cnd4
cnd4ICAgIDEgcm9vdCAgICAgcm9vdCAgICAgICAgICAgIDI1IE5vdiAyOCAwOTo1MSBvcC1vY2Mt
ZW5hYmxlQDAuc2VydmljZSAtPiAuLi9vcC1vY2MtZW5hYmxlQC5zZXJ2aWNlDQo+ICAgICAgICAg
ICAgICAgICAgICBscnd4cnd4cnd4ICAgIDEgcm9vdCAgICAgcm9vdCAgICAgICAgICAgIDIyIE5v
diAyOCAwOTo1NyBzdGFydF9ob3N0QDAuc2VydmljZSAtPiAuLi9zdGFydF9ob3N0QC5zZXJ2aWNl
DQo+DQo+ICAgICBOb3csIEkgd2FudCB0byBhZGQgb3IgZGVsZXRlIHNvZnQgbGluazpvcC1vY2Mt
ZW5hYmxlQDAuc2VydmljZQ0KPiAgICAgSSBjYW4gdXNlICJybSAtcmYgLi9vcC1vY2MtZW5hYmxl
QDAuc2VydmljZSIgdG8gYWNoaWV2ZSB0aGUgZ29hbC4NCj4gICAgIEJ1dCxJJ20gbm90IGV4YWN0
bHkgc3VyZSB0aGlzIGlzIGZvcm1hbCBvcGVyYXRpb24uIEFuZCBJJ20gYWZyYWlkIHRoaXMgd2ls
bCBiZSBzaWRlIGVmZmVjdC4NCj4NCj4gICAgIEFyZSB0aGVyZSBvdGhlciB0b29scyBvciBmb3Jt
YWwgbWV0aG9kcyB0byBkbyB0aGlzPw0KDQpUaGVzZSBsaW5rcyBhcmUgZXhwZWN0ZWQgdG8gYmUg
bWFuYWdlZCBieSBzeXN0ZW1kLg0KWW91IGNvdWxkIGRpc2FibGUgb3IgbWFzayB0aGUgc2Vydmlj
ZXMgYnkgYHN5c3RlbWN0bCBbZGlzYWJsZXxtYXNrXSA8c2VydmljZT5gLiBJZiB5b3UgbmVlZCB0
aGVtIGxhdGVyLCBqdXN0IGVuYWJsZSBvciB1bm1hc2sgdGhlbS4NCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KIFRoZSBw
cml2aWxlZ2VkIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlbWFp
bCBpcyBpbnRlbmRlZCBmb3IgdXNlIG9ubHkgYnkgdGhlIGFkZHJlc3NlZXMgYXMgaW5kaWNhdGVk
IGJ5IHRoZSBvcmlnaW5hbCBzZW5kZXIgb2YgdGhpcyBlbWFpbC4gSWYgeW91IGFyZSBub3QgdGhl
IGFkZHJlc3NlZSBpbmRpY2F0ZWQgaW4gdGhpcyBlbWFpbCBvciBhcmUgbm90IHJlc3BvbnNpYmxl
IGZvciBkZWxpdmVyeSBvZiB0aGUgZW1haWwgdG8gc3VjaCBhIHBlcnNvbiwgcGxlYXNlIGtpbmRs
eSByZXBseSB0byB0aGUgc2VuZGVyIGluZGljYXRpbmcgdGhpcyBmYWN0IGFuZCBkZWxldGUgYWxs
IGNvcGllcyBvZiBpdCBmcm9tIHlvdXIgY29tcHV0ZXIgYW5kIG5ldHdvcmsgc2VydmVyIGltbWVk
aWF0ZWx5LiBZb3VyIGNvb3BlcmF0aW9uIGlzIGhpZ2hseSBhcHByZWNpYXRlZC4gSXQgaXMgYWR2
aXNlZCB0aGF0IGFueSB1bmF1dGhvcml6ZWQgdXNlIG9mIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlv
biBvZiBOdXZvdG9uIGlzIHN0cmljdGx5IHByb2hpYml0ZWQ7IGFuZCBhbnkgaW5mb3JtYXRpb24g
aW4gdGhpcyBlbWFpbCBpcnJlbGV2YW50IHRvIHRoZSBvZmZpY2lhbCBidXNpbmVzcyBvZiBOdXZv
dG9uIHNoYWxsIGJlIGRlZW1lZCBhcyBuZWl0aGVyIGdpdmVuIG5vciBlbmRvcnNlZCBieSBOdXZv
dG9uLg0K
