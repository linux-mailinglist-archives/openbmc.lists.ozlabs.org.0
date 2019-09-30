Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7508AC2675
	for <lists+openbmc@lfdr.de>; Mon, 30 Sep 2019 22:22:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hv2k5N75zDqDr
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2019 06:22:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=40.107.77.134; helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="Y/mtuaec"; dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770134.outbound.protection.outlook.com [40.107.77.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hv1x6H0rzDqP6
 for <openbmc@lists.ozlabs.org>; Tue,  1 Oct 2019 06:21:39 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WjHIX4I0iSlUooXmBetzOfuYLU+R+NgpYXCKuj6NZ2axtjLu1mzRYmH2IvgUASJd6PKpXlDJi7sZnBpq5W1JEleDSONA+cJgqlNis6pVVRKV00+5asTOqNieWUEovZLoztvNLtIgNyCBoUev7GPS2Zeoa/UxorHSUMVJubCuq1xJtG15uIMxsdukGQFCJ1nm0OPkjc1nNQptL/llY4bydsrArimwg3wVazdoTG39gEUhpydStFzDHW6vqqjh8Hw9snLyvTVd3htBW03DYmAgt13S6bb7fENgPbVdW4QqIvrVtBsekpNxdIxhBq/O5ji7SKxiIny1Kx01ySCIf5jT4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jd7cwhzVLj+gCCSQwUte2kD/UqaLRiO+NQViofjU8sw=;
 b=dQmvVxnDQqDeBKqw/eEPLICV7KohHAdR9x8v7DLY3Iq2OYElIZJts2OLEHU9u76GVyqeHqCWmoY6EPrwfuFcFfEh/lVefVLMhWmbAG2vpuatuZWYzayEf28SUOqVW4927R/Yyvo0LeTBJODsxy2ryMpIqoMtFxirEb7E6ffIdA2W2wbGVd9IZs8HF9yVFNBs6Ns6iO2tXnvyoJ8U/oQ9DPrEQo47wDFNLIH+M9y6vq2OoauCyfLg1+RFnFV1JbK2SE9KSe2Ta4o8wEqEsqYfLyf9a3gnJUzoG/dIM/TJNgwD9rcU2l9sZLjeMrc+L9EGj0lOvkWR91H7Z1f3ukSeJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jd7cwhzVLj+gCCSQwUte2kD/UqaLRiO+NQViofjU8sw=;
 b=Y/mtuaecbte5e+7F2HuL9eHVOPZeH5ncKcbOS5YTaNUh2qTsmceIsjYwfwfmqltR5Cw/61Ao2O+o43lVj8iL/HQLywlI2bVheQFsLEeyRaBtCS+g5AfkSQrD7Zpfm18YyuBe48nE/KzesWMcVlHgmuZhvpoTCDoTbZ8lNam9xtU=
Received: from BYAPR21MB1191.namprd21.prod.outlook.com (20.179.56.209) by
 BYAPR21MB1238.namprd21.prod.outlook.com (20.179.57.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.6; Mon, 30 Sep 2019 20:21:34 +0000
Received: from BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::20e7:c182:6e68:28db]) by BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::20e7:c182:6e68:28db%2]) with mapi id 15.20.2327.009; Mon, 30 Sep 2019
 20:21:34 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: Kun Yi <kunyi@google.com>, Yong Li <yong.b.li@linux.intel.com>
Subject: RE: Accessing kernel panic information without BMC console?
Thread-Topic: Accessing kernel panic information without BMC console?
Thread-Index: AQHVdX+ZU3rmnvwZykmBOG2x281jRqdAGsGAgAIukwCAAj+4AIAAJJCg
Date: Mon, 30 Sep 2019 20:21:33 +0000
Message-ID: <BYAPR21MB1191BD47741276675EE4DAEFC8820@BYAPR21MB1191.namprd21.prod.outlook.com>
References: <CAGMNF6XaNL1HGf7=zKeJrO7CBH_1Y+yhUJi9FQRQ--2V9U+KUA@mail.gmail.com>
 <E6FDE343-5FC6-4493-9D53-BE6317525DB7@fb.com>
 <000201d5769a$2b91bc30$82b53490$@linux.intel.com>
 <CAGMNF6VnX_VyxHQ9FwnV11YqKqmLtb5KSp1YxgDaRy9QNn6bQA@mail.gmail.com>
In-Reply-To: <CAGMNF6VnX_VyxHQ9FwnV11YqKqmLtb5KSp1YxgDaRy9QNn6bQA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=neladk@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-09-30T20:21:32.6131515Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=117975de-35c4-435a-9803-249ea3a177cd;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [2001:4898:80e8:2:89e9:3624:1fc3:6484]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 12a89a04-2746-4f46-97da-08d745e3c9d7
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BYAPR21MB1238:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <BYAPR21MB1238507C8500C110E5D75D3DC8820@BYAPR21MB1238.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(396003)(366004)(376002)(39860400002)(136003)(13464003)(199004)(189003)(966005)(7736002)(71190400001)(74316002)(4326008)(186003)(10090500001)(71200400001)(6116002)(305945005)(8990500004)(476003)(486006)(446003)(10290500003)(25786009)(9686003)(6306002)(256004)(55016002)(14454004)(54906003)(66476007)(66446008)(6246003)(316002)(66946007)(64756008)(110136005)(52536014)(8936002)(229853002)(8676002)(99286004)(46003)(102836004)(76176011)(6436002)(11346002)(478600001)(2906002)(66556008)(81156014)(76116006)(86362001)(5660300002)(33656002)(7696005)(53546011)(81166006)(6506007)(22452003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR21MB1238;
 H:BYAPR21MB1191.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +AlIsXDxQ+cVfzEEx+53JrKcufXhSVmNe1lwXW6gFOpCrC67Lx2H5YmvtwcCv/Ws2W4B2D5V2pP8j2RLKUG3lbv9WERVvwHDwhqdRW3Cdb2kfITlMPwt5p3+QweSKjt2j0nMiGi9EYup/YCa9nZfIgz3P5Z6GtB+8AxOd127LfMHtA0ngMrFkCjiTL2unKsSmndkYdy6A7Ev9/yS/nGSvuncJVe74nPY8c0ekKhzTfxCVuYfS/O2hUq6eyL8xszBXpoZin8HaEiz7sY/OUD8Y6zs0rCgDvVLt9KAxYnZw59d019uGFICGAmrASR485ugOL3erbkIU+Y7Pbgj3YA9ea+dJU8985wn7ccaN8S27J6eUVR2xTfq74PsWyPOJZuPwZkkhzR6ZgHr6A6SGAsGhkeF97gfs7prk3RHIFD1srfY0gAiLRflqCqUbbPPVj+1BXg566X+bLSSbFHBGwsYFA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12a89a04-2746-4f46-97da-08d745e3c9d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 20:21:34.1507 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: At7nAIO66xyBYdjHaD9VPAY7IhuvknVsO5PQmiDzaTlX1xCleSIoblfdixbvsn9fTFBQHDCXmgiLr5JhUPWbNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR21MB1238
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

QW55IGRhdGEgb24gaG93IGhlYXZ5IGlzIFJhbU9vcHMgKCB3LnIudCBtZW1vcnkgKSA/IA0KDQpt
ZW09MTI4TSByYW1vb3BzLm1lbV9hZGRyZXNzPTB4ODAwMDAwMCByYW1vb3BzLmVjYz0xDQoNCk5l
ZXJhag0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogb3BlbmJtYyA8b3BlbmJt
Yy1ib3VuY2VzK25lbGFkaz1taWNyb3NvZnQuY29tQGxpc3RzLm96bGFicy5vcmc+IE9uIEJlaGFs
ZiBPZiBLdW4gWWkNClNlbnQ6IE1vbmRheSwgU2VwdGVtYmVyIDMwLCAyMDE5IDExOjA4IEFNDQpU
bzogWW9uZyBMaSA8eW9uZy5iLmxpQGxpbnV4LmludGVsLmNvbT4NCkNjOiBBbmRyZXcgSmVmZmVy
eSA8YW5kcmV3QGFqLmlkLmF1PjsgT3BlbkJNQyBNYWlsbGlzdCA8b3BlbmJtY0BsaXN0cy5vemxh
YnMub3JnPjsgVmlqYXkgS2hlbWthIDx2aWpheWtoZW1rYUBmYi5jb20+DQpTdWJqZWN0OiBSZTog
QWNjZXNzaW5nIGtlcm5lbCBwYW5pYyBpbmZvcm1hdGlvbiB3aXRob3V0IEJNQyBjb25zb2xlPw0K
DQpPbiBTdW4sIFNlcCAyOSwgMjAxOSBhdCAxMjo0NyBBTSBZb25nIExpIDx5b25nLmIubGlAbGlu
dXguaW50ZWwuY29tPiB3cm90ZToNCj4NCj4gSSBhbSB3b3JraW5nIG9uIHRoaXMgcmFtb29wcyBm
ZWF0dXJlIHRvbywgYW5kIGl0IHdvcmtzIG9uIGFzdDI1MDAsIGp1c3QgZW5hYmxlIHNvbWUga2Vy
bmVsIGNvbmZpZyBhbmQgbW9kaWZ5IHRoZSBkdHMuDQoNClRoYW5rcyBmb3Igc2hhcmluZywgWW9u
ZyBMaS4gSSBoYXZlIHlldCB0byBsb29rIGludG8gdGhpcyBvcHRpb24uDQpXb3VsZCB5b3UgYmUg
YWJsZSB0byBzaGFyZSBob3cgbXVjaCBSQU0geW91IGFyZSB1c2luZyBhbmQgaG93IHlvdSBzb2x2
ZSB0aGUgcGVyc2lzdGVudCBSQU0gcHJvYmxlbT8NCg0KPg0KPiBJIHdpbGwgc2VuZCBvdXQgYSBw
YXRjaCBhYm91dCB0aGlzIGNoYW5nZSBsYXRlci4NCj4NCj4gVGhhbmtzLA0KPiBZb25nDQo+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IG9wZW5ibWMgDQo+IDxvcGVuYm1jLWJv
dW5jZXMreW9uZy5iLmxpPWxpbnV4LmludGVsLmNvbUBsaXN0cy5vemxhYnMub3JnPiBPbiBCZWhh
bGYgDQo+IE9mIFZpamF5IEtoZW1rYQ0KPiBTZW50OiBTYXR1cmRheSwgU2VwdGVtYmVyIDI4LCAy
MDE5IDY6MjggQU0NCj4gVG86IEt1biBZaSA8a3VueWlAZ29vZ2xlLmNvbT47IEpvZWwgU3Rhbmxl
eSA8am9lbEBqbXMuaWQuYXU+OyBBbmRyZXcgDQo+IEplZmZlcnkgPGFuZHJld0Bhai5pZC5hdT47
IE9wZW5CTUMgTWFpbGxpc3QgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NCj4gU3ViamVjdDog
UmU6IEFjY2Vzc2luZyBrZXJuZWwgcGFuaWMgaW5mb3JtYXRpb24gd2l0aG91dCBCTUMgY29uc29s
ZT8NCj4NCj4NCj4NCj4g77u/T24gOS8yNy8xOSwgMzowNSBQTSwgIm9wZW5ibWMgb24gYmVoYWxm
IG9mIEt1biBZaSIgPG9wZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMub3ps
YWJzLm9yZyBvbiBiZWhhbGYgb2Yga3VueWlAZ29vZ2xlLmNvbT4gd3JvdGU6DQo+DQo+ICAgICBI
ZWxsbyB0aGVyZSwNCj4NCj4gICAgIFdvbmRlciB3aGV0aGVyIGFueW9uZSBoYXMgaGFkIGV4cGVy
aWVuY2UgcGVyc2lzdGluZyBrZXJuZWwgcGFuaWMNCj4gICAgIGluZm9ybWF0aW9uIG9yIHNlbmRp
bmcgdGhlbSB0aHJvdWdoIG5ldHdvcms/IEZvciBhIGxvdCBvZiBvdXIgZGV2aWNlcw0KPiAgICAg
dGhlIGNvbnNvbGUgaXMgZWl0aGVyIHVuY29ubmVjdGVkIG9yIHNlcnZlZCBieSBvYm1jLWNvbnNv
bGUtY2xpZW50DQo+ICAgICBvbmx5LCB3aGljaCB3b3VsZG4ndCBiZSBhYmxlIHRvIGNhcHR1cmUg
a2VybmVsIG9vcHMuDQo+DQo+ICAgICBXZSBhcmUgc3RhcnRpbmcgdG8gbG9vayBpbnRvIHRoZXNl
IHRvb2xzOg0KPg0KPiAgICAgaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC92NS4zL2Fk
bWluLWd1aWRlL3JhbW9vcHMuaHRtbA0KPiAgICAgUmFtb29wcyBzYXlzIGl0IHJlcXVpcmVzIHBl
cnNpc3RlbnQgUkFNLi4gV2hpY2ggbWF5IG1ha2UgaXQgaW5mZWFzaWJsZQ0KPiAgICAgc2luY2Ug
d2UgZG9uJ3QgcGVyc2lzdCBtZW1vcnkgKG9yLCB3ZSB0cnkgbm90IHRvKS4NCj4NCj4gICAgIGh0
dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwcy0zQV9fbGludXgu
ZGllLm5ldF9tYW5fOF9uZXRkdW1wJmQ9RHdJQmFRJmM9NVZEMFJUdE5sVGgzeWNkNDFiM01VdyZy
PXY5TVUwS2k5cFduVFhDV3dqSFBWZ3BuQ1I4MHZYa2tjcklhcVU3VVNsNWcmbT0wSDZZZjBpZ3Zp
SENPU0hBYk9QUXh4TS1fQjBMaDFFeVptNGRwZE1xZTJnJnM9SDNuNTdGUlp3VjB6X3dPSHFtYWlS
YS1rUTZoM2RvV2c3MTJTVjRlei1HVSZlPQ0KPiAgICAgbmV0ZHVtcCBzZWVtcyBwcm9taXNpbmcu
DQo+DQo+ICAgICBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL3Y1LjMvYWRtaW4tZ3Vp
ZGUva2R1bXAva2R1bXAuaHRtbA0KPiAgICAgSXQgc2VlbXMgd2UgbmVlZCBtb3JlIHBpZWNlcyB0
byBnZXQga2R1bXAgd29ya2luZy4gSGF2ZSBhbnlvbmUgdHJpZWQNCj4gICAgIGtleGVjL2tkdW1w
IG9uIHRoZWlyIHBsYXRmb3Jtcz8NCj4NCj4gSSBoYXZlIHVzZWQga2R1bXAgaW4gcGFzdCB3YXMg
dmVyeSBoYXBweSB3aXRoIGl0LiBZZXMsIGl0IG5lZWRzIGxvdCBtb3JlIHBpZWNlcyB0byBtYWtl
IGl0IHdvcmsuDQo+DQo+DQo+DQo+ICAgICBSZWdhcmRzLA0KPiAgICAgS3VuDQo+DQo+DQo+DQoN
Cg0KLS0NClJlZ2FyZHMsDQpLdW4NCg==
