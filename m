Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A00D1C849A
	for <lists+openbmc@lfdr.de>; Thu,  7 May 2020 10:17:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49HmXN2zLSzDqwv
	for <lists+openbmc@lfdr.de>; Thu,  7 May 2020 18:17:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=40.107.93.104;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.a=rsa-sha256 header.s=selector2 header.b=Z33Me/e2; 
 dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2104.outbound.protection.outlook.com [40.107.93.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49HmTW1gdpzDqvy
 for <openbmc@lists.ozlabs.org>; Thu,  7 May 2020 18:14:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OGrTlKpEPGJsCSNXtMQckbjYom3NWmWSH7z/+M37kK0PwKPOHkJL4WULvrOztmfQ/EITzmwFXCUJjGBfNWAF3Jv1cqbpOl/4K+tpicofZwV5IEJ+7hrpvXtnFBSkKcVbTaLOzeFjPSUy+Rc3FYvEmUPcM3jYdqx0R+EkEn0CSlmgZixo7cNUsWg4ySpnXR9sG6rGsiy7Hm8PBL/LlyolK8tAfJcEepfLqn6koHdZu0KnndonwlGnC/oZNjIOT2LK68TtKRdKeGao33zCg4KTC+yQ7SXLugU9oTm4Dw2wWAGDfjftU4NI7LdcbgIAiPVR98U1P5istf7bFJXzi7Q+mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PuyS0MfaIczzT/RRVHahZNsRhn8nCJI/vGD1KQQ1aJc=;
 b=lMxKQZT9bq78YMWECPYwxkta5vw2/h2OkooWcS1Yo7U9i2NM0fqB+0JXwSudiPCsSUpT98B/0qfos3ERT6/xXYfpKV+jhWRCoit4u/UOkWJuc8DWitrqDeoaLepOg0g/t5xtZya4aVRSDpjnKlvmIxUopg0dcLDF0HMs8H8sBOviWzCNosA/G9Z0aeUjx+eegvOl9Ti8c31FxjAEEQHXGs8UMKD7aDc1ELyiWCAb6Y3CCshcHKIIVOQWK8yuQMmoZDWL+32CeNzMDlgx0tHVJV38cMdM9N2qEpxd4lX+WX5qD/jTk7XPBStthF1i1WxB+gtALrok3JiG1ow2JR0pRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PuyS0MfaIczzT/RRVHahZNsRhn8nCJI/vGD1KQQ1aJc=;
 b=Z33Me/e2KXYFCUSH6gwM0NX1DU9s9dRMJpDzXgQaNEBp3onAEieNvNDG6ETu3V8plH/kjaVx1u6gMO4PJtRjJ3cNrrrTy0kwucNioMH7XCTFJZMmDFn3sic+itqJ0Hn1+yC3k0O7kzEkOVKroGZL9GHxU+wZJRZkGIPsSreNsxY=
Received: from CH2PR21MB1510.namprd21.prod.outlook.com (2603:10b6:610:8e::7)
 by CH2PR21MB1462.namprd21.prod.outlook.com (2603:10b6:610:81::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.10; Thu, 7 May
 2020 08:14:31 +0000
Received: from CH2PR21MB1510.namprd21.prod.outlook.com
 ([fe80::6838:df24:78e3:e78a]) by CH2PR21MB1510.namprd21.prod.outlook.com
 ([fe80::6838:df24:78e3:e78a%9]) with mapi id 15.20.3000.011; Thu, 7 May 2020
 08:14:31 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: Zbyszek <zbigniewku@gmail.com>, Zhenfei Tai <ztai@google.com>
Subject: RE: [EXTERNAL] Re: [bmcweb] mTLS client authentication always succeeds
Thread-Topic: [EXTERNAL] Re: [bmcweb] mTLS client authentication always
 succeeds
Thread-Index: AQHWI5i5HOV3G831BkidKbnmFPWauaibXosAgADiHgCAAABX0A==
Date: Thu, 7 May 2020 08:14:31 +0000
Message-ID: <CH2PR21MB1510B40F09178BC841F62AA6C8A50@CH2PR21MB1510.namprd21.prod.outlook.com>
References: <CAMXw96Mnk8Hf4wAB_Ot=XEqp9yecspPfMGB6oF_LSgjRFMNHvw@mail.gmail.com>
 <CAB_SOc5tEo7xRg65aMfBOWyY_yXkb6+mLmRhf8hifNhHDWGVgQ@mail.gmail.com>
 <CAMXw96NoWn+sZELD1Xd=WUyLwvOUZ9prKyqqaLFKiMwM6ChuMw@mail.gmail.com>
 <CAB_SOc6pgn2OXd-KRYNpzszxWyhfGOdBTHMB5FWbat8QaZ1CoQ@mail.gmail.com>
In-Reply-To: <CAB_SOc6pgn2OXd-KRYNpzszxWyhfGOdBTHMB5FWbat8QaZ1CoQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microsoft.com;
x-originating-ip: [50.47.133.153]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3b8039fe-8f88-4c3f-b02b-08d7f25eabbd
x-ms-traffictypediagnostic: CH2PR21MB1462:
x-microsoft-antispam-prvs: <CH2PR21MB1462B03DE8B86EC5DD759E9CC8A50@CH2PR21MB1462.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 03965EFC76
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ir4eSFaynhw4Us3QTHbqvayTZNS2h/co5mzyMSZXsYQV6JJ4T+fzJomxWml13AUd1qxy18LitZ27RX53tSZhOcNEVjhPETyiheL08fKFamYX34cWmTOZFo8EysYuYGkc7zHOl2uPF4Awsa+xkrRqj52C7k4wHL7n5jAGwLiSrJTOE8/z248DSoDIQlIJ65W0jv/qWy64ApIJxNozS7PyjNPiiykrfbl0wZNNzreAf0Ar92RQwwmOsEXXfczjuOS8fonCmeu8zDLoSVJ+VqKL1IH5ahJqe6k2COXfiXM2cYfe1bkGBQmA6uy4jRCW2Ms0Ze7y0sc8g3PKUQgCXDiZeup+686YpFiMdkXVxqsgiaOcnn5+g+1eZUci72zqY6tiXhQne0cmxAItXkfllfhvL6IRlkoA0Fl/Rqp4P4VHoIbTBWqTnL+Fy+l7T5U5avt8nUYgumhFmuxrju/QgjIYvf3HIHqVUsxiG/JOxI5VTc97T+Pj6CXW1OCyQd4Cz546aeVpIh7hYbDBMKLCWeCu8MaDVmEZwvXDJVzkaXf6tjId+1j+buGsd3sWxEnwgVDkL39hVhWCuHeAur6cis/Oflzo1T61w6sXMpb0wkJhkls=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR21MB1510.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(136003)(39860400002)(376002)(346002)(366004)(33430700001)(33656002)(110136005)(26005)(66556008)(82950400001)(66446008)(66476007)(6506007)(64756008)(33440700001)(8936002)(66574014)(82960400001)(2906002)(8990500004)(66946007)(186003)(76116006)(53546011)(316002)(4326008)(478600001)(7696005)(55016002)(71200400001)(10290500003)(83280400001)(8676002)(86362001)(83320400001)(5660300002)(9686003)(83300400001)(83290400001)(83310400001)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Ztu6uxOO0T60QjwliCBwTMwLEZQ6pPZWTRuP0PwkPMrsHDUlqUyk5PSgOGwxzKeytN0di0wAZRKAitaaWpFoZVz+sy/+lTHIp6kK78ujrrZsOV+UY5G04rTshTuw5lc67z9beELq72g/mOf9h+MHfFaQOf0Wu3T3xpaFGQDdxA8Rl1KHsIVblFRu/1QfZFjLEr4U62iG85x8LJreB1mDHSj1fR8AQyQevWBfnBFWHEBKLOMf+MGWZSfUu36CwIsUs7mf7dmnhfXtpyKYbOWlNPpIpim3rQIAYLhQ/pL5zuRZk992og0X8ejGrfXsWwyILf4mosNPneOxypF9Op+rOEH2pXDXrz1/2udvp80ex2dRmhA6pTGaXacdCTwQ1JiiJCjjJ+9jAKJqdG9vv08oPJe9/qhxtQxz0qosk+6V748FhdPq9KzSlft7E2Ew9afzNfrU6eTjsA2HlNE1cwzwOLElpDlsAxkupNdstyIIZI+aVoKx4Po7vx/RCcAdkQhA5pF88iRrv+zQWM4/E8BsOpyiATtfgaO9qxK0aTbMRYlg+lCmi9ofUymAkA6gXcUNtSJBEDQdNflhCrIPxCFYqnRx0EgopQGpzFOm21UupofvlQY8IA2Ra1tyDqlBJSbC6A+xGSISBOpKk3BjPCgqhUkSvZjh+npLtJh2dz2/SghvngfUYrAwuhFJevC0RYnEz3BBWaAwfVYIqSX9alyiua8yD7+kyRUbu8F6FW52i1PSz0CIYgfd8jME2ZSQf5o2kjTvJJVwxRfC0+cDRFmyLrQ+nVII2xmyisUnnBBYoIc=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b8039fe-8f88-4c3f-b02b-08d7f25eabbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2020 08:14:31.7192 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vCzNgjOTABmtLPnTux3rNw8dbcvsvLslXZaCDCn53VE8n9VC9mbFuWXwStslQhPh5L+ii2MXs6SNNJzaFUfF8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR21MB1462
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgWmJ5c3playwgDQoNCkp1c3QgYSBiYXNpYyBxdWVzdGlvbiwgT25jZSBibWN3ZWIgaXMgY29u
ZmlndXJlZCB3aXRoIC1EQk1DV0VCX0VOQUJMRV9NVVRVQUxfVExTX0FVVEhFTlRJQ0FUSU9OLCBj
YW4gaXQgd29yayB3aXRob3V0IGNsaWVudCBjZXJ0Pw0KDQpJdCB3aWxsIGJlIGdvb2QgdG8gZG9j
dW1lbnQgY3VybCBBUElzIHRvIGVuYWJsZSB0aGlzIGZlYXR1cmUgYW5kIHRlc3QgZW5kIHRvIGVu
ZCBmbG93cy4gDQoNClRoYW5rcw0KTmVlcmFqDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQpGcm9tOiBvcGVuYm1jIDxvcGVuYm1jLWJvdW5jZXMrbmVsYWRrPW1pY3Jvc29mdC5jb21AbGlz
dHMub3psYWJzLm9yZz4gT24gQmVoYWxmIE9mIFpieXN6ZWsNClNlbnQ6IFRodXJzZGF5LCBNYXkg
NywgMjAyMCAxMjo0OSBBTQ0KVG86IFpoZW5mZWkgVGFpIDx6dGFpQGdvb2dsZS5jb20+DQpDYzog
T3BlbkJNQyBNYWlsbGlzdCA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0KU3ViamVjdDogW0VY
VEVSTkFMXSBSZTogW2JtY3dlYl0gbVRMUyBjbGllbnQgYXV0aGVudGljYXRpb24gYWx3YXlzIHN1
Y2NlZWRzDQoNCsWbci4sIDYgbWFqIDIwMjAgbyAyMDoxOSBaaGVuZmVpIFRhaSA8enRhaUBnb29n
bGUuY29tPiBuYXBpc2HFgihhKToNCj4NCj4gSGkgWmJ5c3playwNCj4NCj4gVGhhbmtzIGZvciB5
b3VyIHJlcGx5LiBJIGxvb2sgZm9yd2FyZCB0byB0aGUgb2ZmaWNpYWwgZG9jdW1lbnRhdGlvbi4N
Cj4NCj4gVGhlIGNhbGxiYWNrIGZ1bmN0aW9uIHJldHVybnMgdHJ1ZSB3aGVuIHByZXZlcmlmaWVk
ID09IGZhbHNlLiBOb3Qgc3VyZSB3aHkgaXQgc2hvdWxkIGFsd2F5cyByZXR1cm4gdHJ1ZSwgd2hp
Y2ggYWNjZXB0cyBhbnkgY2xpZW50IGNlcnRpZmljYXRlLg0KDQpZZXMsIGFsd2F5cyByZXR1cm5p
bmcgdHJ1ZSB3ZSBkbyBub3QgYnJlYWsgdGhlIHRscyBoYW5kc2hha2UgYWxsb3dpbmcgZm9yIGNv
bm5lY3Rpb24uDQpCdXQgdXNlciB3aWxsIG5vdCBiZSBhdXRoZW50aWNhdGVkIGFueXdheSBiZWNh
dXNlIGl0cyBuYW1lIHdpbGwgbm90IGJlIGV4dHJhY3RlZCBmcm9tIHRoZSBjZXJ0aWZpY2F0ZS4N
CkluIHN1Y2ggY2FzZSB1c2VyIHNob3VsZCByZWNlaXZlIHByb3BlciBodHRwIGVycm9yIGNvZGUg
dGVsbGluZyBoZSBpcyBub3QgYXV0aGVudGljYXRlZC4NCg0KPg0KPiAvLyBXZSBhbHdheXMgcmV0
dXJuIHRydWUgdG8gYWxsb3cgZnVsbCBhdXRoIGZsb3cgaWYgKCFwcmV2ZXJpZmllZCkgeyANCj4g
Qk1DV0VCX0xPR19ERUJVRyA8PCB0aGlzIDw8ICIgVExTIHByZXZlcmlmaWNhdGlvbiBmYWlsZWQu
IjsgcmV0dXJuIA0KPiB0cnVlOyB9DQo+DQo+IFRoYW5rcywNCj4gWmhlbmZlaQ0KPg0KPiBPbiBX
ZWQsIE1heSA2LCAyMDIwIGF0IDQ6MjIgQU0gWmJ5c3playA8emJpZ25pZXdrdUBnbWFpbC5jb20+
IHdyb3RlOg0KPj4NCj4+IHB0LiwgMSBtYWogMjAyMCBvIDAyOjA3IFpoZW5mZWkgVGFpIDx6dGFp
QGdvb2dsZS5jb20+IG5hcGlzYcWCKGEpOg0KPj4gPg0KPj4gPiBIaSwNCj4+ID4NCj4+ID4gSSd2
ZSBiZWVuIHRlc3RpbmcgYm1jd2ViIG1UTFMgZm9yIGEgd2hpbGUgYW5kIGZvdW5kIHRoZSB1c2Vy
IA0KPj4gPiBkZWZpbmVkIHZlcmlmeSBjYWxsYmFjayBmdW5jdGlvbiByZXR1cm5zIHRydWUgaW4g
YWxsIGNhc2VzLiANCj4+ID4gKGh0dHBzOi8vbmFtMDYuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0
bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRg0KPj4gPiBnaXRodWIuY29tJTJGb3BlbmJtYyUy
RmJtY3dlYiUyRmJsb2IlMkZtYXN0ZXIlMkZodHRwJTJGaHR0cF9jb25uZWN0DQo+PiA+IGlvbi5o
JTIzTDI4NyZhbXA7ZGF0YT0wMiU3QzAxJTdDbmVsYWRrJTQwbWljcm9zb2Z0LmNvbSU3QzhmNWZm
NjEyNWUNCj4+ID4gZGI0YjczNGMzZTA4ZDdmMjViMmI2OCU3QzcyZjk4OGJmODZmMTQxYWY5MWFi
MmQ3Y2QwMTFkYjQ3JTdDMSU3QzAlNw0KPj4gPiBDNjM3MjQ0MzQ1Njk1MTU3NTc1JmFtcDtzZGF0
YT0zRSUyRiUyRmR4U3VSNVNGbzlaSUklMkZaQUE3aDYlMkZEZHMxDQo+PiA+IGxIZVphQ25iaW1j
aUx3JTNEJmFtcDtyZXNlcnZlZD0wKQ0KPj4gPg0KPj4gPiBJZiBjbGllbnQgYXV0aGVudGljYXRp
b24gaXMgZW5hYmxlZCBpbiBibWN3ZWIsIHNob3VsZCBpdCByZWplY3QgaWYgY2xpZW50IGNlcnRp
ZmljYXRlIGlzIGJhZD8NCj4+DQo+PiBObywgcHVycG9zZSBvZiB0aGlzIGNhbGxiYWNrIGlzIHRv
IG9ubHkgZXh0cmFjdCB0aGUgdXNlciBuYW1lIGZyb20gDQo+PiB0aGUgY2VydGlmaWNhdGUgYW5k
IHRoZW4gYWxsb3cgdG8gcHJvY2VlZCB3aXRoIGRlZmF1bHQgT3BlblNTTCANCj4+IHZlcmlmaWNh
dGlvbiBmbG93IHdoaWNoIHNob3VsZCBmaW5hbGx5IGZhaWwgaWYgc29tZXRoaW5nIGlzIHdyb25n
IA0KPj4gd2l0aCB0aGUgY2VydGlmaWNhdGUgbm8gbWF0dGVyIHdoYXQgdGhpcyBmdW5jdGlvbiBy
ZXR1cm5lZC4NCj4+IFRoZSAnc2V0X3ZlcmlmeV9jYWxsYmFjaycgZG9lc24ndCByZXBsYWNlIHRo
ZSB3aG9sZSB2ZXJpZmljYXRpb24gDQo+PiBwcm9jZWR1cmUsIGl0IG9ubHkgYWRkcyBhIGNhbGxi
YWNrIHRoYXQgaXMgY2FsbGVkIHdoZW4gdGhlIGRlZmF1bHQgDQo+PiB2YWxpZGF0b3IgY2hlY2tz
IGVhY2ggY2VydGlmaWNhdGUuIFRoZSAncHJldmVyaWZpZWQnIHBhcmFtZXRlciwgDQo+PiBwYXNz
ZWQgdG8gaXQgaW5kaWNhdGVzIGlmIHZlcmlmaWNhdGlvbiBvZiB0aGUgY2VydGlmaWNhdGUgc3Vj
Y2VlZGVkIG9yIG5vdC4NCj4+IFlvdSBzaG91bGQgYmUgYWJsZSB0byBzZWUgaXQgaW4gYm1jd2Vi
IGxvZ3MuDQo+Pg0KPj4gPg0KPj4gPiBUaGFua3MsDQo+PiA+IFpoZW5mZWkNCg==
