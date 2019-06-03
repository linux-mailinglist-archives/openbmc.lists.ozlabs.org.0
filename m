Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E831533681
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2019 19:24:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HhkP3psQzDqSM
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 03:24:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=40.107.72.137; helo=nam05-co1-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="SX5gThMC"; dkim-atps=neutral
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720137.outbound.protection.outlook.com [40.107.72.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Hhjp1z7GzDqMN
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jun 2019 03:23:56 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=sPAOMMg9eR67v8VNP4TVWKWbZkycGF2FhVGuIQnocJKfCJH2avbyHoIdGQK+6H8cFk9ErU7w5DhVpytUvrRWhHV5XuML1QwSCl+ye55vdXJLQS+6RQpJCuidg+3IZevYsKl6+WVOSi9sCpJ1VDsXQbfPoc9ADfb2PPYqDC7cmww=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3IGHoO607naPzU8iuTsnBC6yz0TeCBsxlzdUDHwXbk=;
 b=qXpruk96StCMk42HP3lPOoEEM3N9eHC3Xf3DY+jxEsfyTtDt9iUuoEfIxyATjqa5EPhJ9JEVKi5dmI03kFbD23h4D1aUzqGn1mE/mKR1i7X0iXyfaBsMb8YLYkz6AfE8FRatuIrY/KMs4Vn7HafaOhSYrx9jtTcAci4hMOfUgUk=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3IGHoO607naPzU8iuTsnBC6yz0TeCBsxlzdUDHwXbk=;
 b=SX5gThMC79Xlkzu72HHdKon60k1OnPoBO14iIN/Z6pCcYJ/WJorj5xjAOZeHP0mAMcbIybzgGd1npEShBQTubE18abUHRvMFVWTxRD9nEFPHndwALyR+zpaKk4gemdhu3bX5+m+NVe55OPIb0LX0ESwrojQ+GRcMXeaU674nSs0=
Received: from BL0PR2101MB0932.namprd21.prod.outlook.com
 (2603:10b6:207:30::20) by BL0PR2101MB1042.namprd21.prod.outlook.com
 (2603:10b6:207:37::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1987.2; Mon, 3 Jun
 2019 17:23:52 +0000
Received: from BL0PR2101MB0932.namprd21.prod.outlook.com
 ([fe80::1072:430b:60ef:aaae]) by BL0PR2101MB0932.namprd21.prod.outlook.com
 ([fe80::1072:430b:60ef:aaae%4]) with mapi id 15.20.1987.003; Mon, 3 Jun 2019
 17:23:52 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: Andrew Geissler <geissonator@gmail.com>, Lei YU <mine260309@gmail.com>
Subject: RE: [Design] PSU firmware update
Thread-Topic: [Design] PSU firmware update
Thread-Index: AQHVGeoAPR6UDQTsDUiPZ/ien9Yqe6aJ7ZyAgAA1nrA=
Date: Mon, 3 Jun 2019 17:23:52 +0000
Message-ID: <BL0PR2101MB09320BD7856E280C04852CB1C8140@BL0PR2101MB0932.namprd21.prod.outlook.com>
References: <CAARXrt=6mZtVuwdTxamjUWXJk5RXNKaNM9aVZE5nEyTjowVjEQ@mail.gmail.com>
 <CALLMt=pdm=Nk5sCZvZBORb+N5suT7-FK0xbvWUy3Qxg5KcttKA@mail.gmail.com>
In-Reply-To: <CALLMt=pdm=Nk5sCZvZBORb+N5suT7-FK0xbvWUy3Qxg5KcttKA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=neladk@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-06-03T17:23:50.3867722Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=de23392c-288b-4634-840e-ebf93ad0b079;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [2001:4898:80e8:9:a93e:9b44:7311:4c6e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f728ee32-2d5c-402c-c785-08d6e8483fb7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR2101MB1042; 
x-ms-traffictypediagnostic: BL0PR2101MB1042:
x-microsoft-antispam-prvs: <BL0PR2101MB1042C1216E5150F723EDD353C8140@BL0PR2101MB1042.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(376002)(366004)(396003)(39860400002)(346002)(53754006)(13464003)(189003)(199004)(229853002)(6116002)(66446008)(64756008)(110136005)(66476007)(66556008)(446003)(71200400001)(71190400001)(316002)(7736002)(66946007)(53936002)(10290500003)(22452003)(46003)(305945005)(33656002)(8990500004)(55016002)(14444005)(6436002)(2906002)(256004)(73956011)(9686003)(11346002)(476003)(99286004)(25786009)(486006)(10090500001)(6506007)(76176011)(15650500001)(86362001)(74316002)(102836004)(4326008)(8676002)(81156014)(81166006)(8936002)(6246003)(478600001)(76116006)(5660300002)(53546011)(52536014)(52396003)(68736007)(186003)(7696005)(14454004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BL0PR2101MB1042;
 H:BL0PR2101MB0932.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: r1fSgGOI0gdx8YGsCCGMnnZgHUZu8OGiT3zEvEErhCaK36nlsXKzcQ9zy4Y+42b4ZrMcX72U4cDvW7O2KYusCOgpx8pZ40HbQNmUufmL5k0TfUOKv0zPNyDE6tKGfan56AxbW3n6eli/xRPlGuQRd+SwwB8axNFGWeqV9+Zu8p+K/HPL5QPc9qgd8FPhmLFwX96Y8w42oX4Ru35YwahYqhkTc++BYuzgcKmusmYgBXmTiEMM5P45UmlYy1FtC112zqNirtQj9CTNF/N9eRm5Kqo+S/MIj53YhESru1Gq4DLBPhBjq9LhTQrAd86Nq02iW8jdfrMJZiUdCm6Ik0bEAOeIqIvn/FsC+jnidFDrCxbsxxRKgZnE7A+rDBQqkwh2YfqS1asPbdtrfQQi5Td0gZJbe4KS88S8dAyz4dys80Q=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f728ee32-2d5c-402c-c785-08d6e8483fb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 17:23:52.2102 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: neladk@microsoft.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR2101MB1042
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

MS4gV2h5IGhvc3QgcG93ZXIgb2ZmIGlzIGEgcHJlLWNvbmRpdGlvbj8gV2Ugc2hvdWxkIGFkZCB0
aGlzIGEgUFNVIHByZS1yZXF1aXNpdGUgdG8gc3VwcG9ydCBMaXZlIHVwZ3JhZGUgYW5kIGFjdGl2
YXRpb24uIA0KMi4gSG93IHNob3VsZCBQU1UgdXBkYXRlIGltcGFjdCBQU1UgYW5kIGJhdHRlcnkg
bW9uaXRvcmluZyA/IHNob3VsZCB0aGVyZSBiZSBjb29yZGluYXRpb24gYmV0d2VlbiBzZW5zb3Ig
bW9uaXRvcmluZyB0YXNrIGR1cmluZyB1cGRhdGUgPw0KMy4gUFNVIG1heSBoYXZlIG11bHRpcGxl
IHJlZ2lvbnMgbGlrZSBib290bG9hZGVyLCBhY3RpdmUgcmVnaW9uIGFuZCBpbmFjdGl2ZSByZWdp
b24uIFdlIHNob3VsZCBkZXNpZ24gdG8gc3VwcG9ydCBtdWx0aXBsZSByZWdpb24gdXBkYXRlLiAN
CjQuIENhbiB5b3UgcHJvcG9zZSByZXF1aXJlZCBTRUwgbG9ncyBhbmQgdGVsZW1ldHJ5IHJlcXVp
cmVtZW50cyBhcyB3ZWxsID8NCg0KVGhhbmtzIA0KTmVlcmFqDQoNCi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQpGcm9tOiBvcGVuYm1jIDxvcGVuYm1jLWJvdW5jZXMrbmVsYWRrPW1pY3Jvc29m
dC5jb21AbGlzdHMub3psYWJzLm9yZz4gT24gQmVoYWxmIE9mIEFuZHJldyBHZWlzc2xlcg0KU2Vu
dDogTW9uZGF5LCBKdW5lIDMsIDIwMTkgNjozMiBBTQ0KVG86IExlaSBZVSA8bWluZTI2MDMwOUBn
bWFpbC5jb20+DQpDYzogT3BlbkJNQyBNYWlsbGlzdCA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3Jn
Pg0KU3ViamVjdDogUmU6IFtEZXNpZ25dIFBTVSBmaXJtd2FyZSB1cGRhdGUNCg0KT24gTW9uLCBK
dW4gMywgMjAxOSBhdCAzOjU0IEFNIExlaSBZVSA8bWluZTI2MDMwOUBnbWFpbC5jb20+IHdyb3Rl
Og0KPg0KPiBIaSBBbGwsDQo+DQo+IFRoaXMgaXMgYSBwcm9wb3NlZCBkZXNpZ24gb2YgUFNVIGZp
cm13YXJlIHVwZGF0ZS4NCj4gSXQgd2lsbCBiZSBwb3N0ZWQgdG8gZ2Vycml0IGZvciByZXZpZXcg
YWZ0ZXIgd2UgaGF2ZSByZXNvbHZlZCBjb21tZW50cw0KPiBpbiB0aGUgbWFpbGluZyBsaXN0Lg0K
Pg0KPiAjIFBTVSBmaXJtd2FyZSB1cGRhdGUNCj4NCj4gQXV0aG9yOg0KPiAgICBMZWkgWVUgPG1p
bmUyNjAzMDlAZ21haWwuY29tPiA8TGVpWVU+DQo+IFByaW1hcnkgYXNzaWduZWU6DQo+ICAgIE5v
bmUNCj4gT3RoZXIgY29udHJpYnV0b3JzOg0KPiAgICBTdSBYaWFvIDxzdXhpYW9AaW5zcHVyLmNv
bT4NCj4gICAgRGVyZWsgSG93YXJkIDxkZXJla2hAdXMuaWJtLmNvbT4NCj4gQ3JlYXRlZDoNCj4g
ICAgMjAxOS0wNi0wMw0KPg0KPg0KPiAjIyBQcm9ibGVtIERlc2NyaXB0aW9uDQo+DQo+IFRoZXJl
IGlzIG5vIHN1cHBvcnQgaW4gT3BlbkJNQyB0byB1cGRhdGUgdGhlIGZpcm13YXJlIGZvciBQU1Vz
Lg0KPg0KPg0KPiAjIyBCYWNrZ3JvdW5kIGFuZCBSZWZlcmVuY2VzDQo+DQo+IEluIE9wZW5CTUMs
IHRoZXJlIGlzIGFuIGV4aXN0aW5nIGludGVyZmFjZSBmb3IgW3NvZnR3YXJlIHVwZGF0ZV1bMV0u
DQo+DQo+IFRoZSB1cGRhdGUgcHJvY2VzcyBjb25zaXN0cyBvZjoNCj4gMS4gVXBsb2FkaW5nIGFu
IGltYWdlIHRvIEJNQzsNCj4gMi4gUHJvY2Vzc2luZyB0aGUgaW1hZ2UgdG8gY2hlY2sgdGhlIHZl
cnNpb24gYW5kIHB1cnBvc2Ugb2YgdGhlIGltYWdlOw0KPiAzLiBWZXJpZnlpbmcgYW5kIGFjdGl2
YXRpbmcgdGhlIGltYWdlLg0KPg0KPiBDdXJyZW50bHksIEJNQyBhbmQgUE5PUiBmaXJtd2FyZSB1
cGRhdGUgYXJlIHN1cHBvcnRlZDoNCj4gKiBbcGhvc3Bob3ItYm1jLWNvZGUtbWdtdF1bMl0gaW1w
bGVtZW50cyBCTUMgY29kZSB1cGRhdGUsIGFuZCBpdCBzdXBwb3J0cyBhbGwNCj4gICB0aGUgYWJv
dmUgMyBwcm9jZXNzZXMuDQo+ICogW29wZW5wb3dlci1wbm9yLWNvZGUtbWdtdF1bM10gaW1wbGVt
ZW50cyBQTk9SIGNvZGUgdXBkYXRlLCBhbmQgaXQgb25seQ0KPiAgIGltcGxlbWVudHMgInZlcmlm
eWluZyBhbmQgYWN0aXZhdGluZyIgdGhlIGltYWdlLiBJdCBzaGFyZXMgdGhlIGZ1bmN0aW9uIG9m
DQo+ICAgdGhlIGFib3ZlIDEgJiAyIHByb2Nlc3Nlcy4NCj4NCj4gRm9yIFBTVSBmaXJtd2FyZSBj
b2RlIHVwZGF0ZSwgaXQgaXMgcHJlZmVycmVkIHRvIHJlLXVzZSB0aGUgc2FtZSBmdW5jdGlvbiBm
b3INCj4gdGhlIGFib3ZlIDEgJiAyLg0KPg0KPg0KPiAjIyBSZXF1aXJlbWVudHMNCj4NCj4gVG8g
bWl0aWdhdGUgdGhlIHJpc2sgb2YgcG93ZXIgbG9zcywgdGhlIFBTVSBmaXJtd2FyZSBjb2RlIHVw
ZGF0ZSBzaGFsbCBtZWV0DQo+IHByZS1jb25kaXRpb25zOg0KPiAxLiBUaGUgaG9zdCBpcyBwb3dl
cmVkIG9mZjsNCj4gMi4gVGhlIHJlZHVuZGFudCBQU1VzIGFyZSBhbGwgY29ubmVjdGVkOw0KPiAz
LiBUaGUgQUMgaW5wdXQgYW5kIERDIHN0YW5kYnkgb3V0cHV0IHNoYWxsIGJlIE9LIG9uIGFsbCB0
aGUgUFNVczsNCj4NCj4gQW5kIGR1cmluZyB1cGRhdGluZzoNCj4gNC4gQWZ0ZXIgdGhlIHVwZGF0
ZSBpcyBkb25lIG9uIGEgUFNVLCB0aGUgQUMgaW5wdXQgYW5kIERDIHN0YW5kYnkgb3V0cHV0IHNo
YWxsDQo+IGJlIGNoZWNrZWQuDQoNCldoYXQgaGFwcGVucyBpZiB0aGlzIGZhaWw/IEF1dG8gcm9s
bCBiYWNrIG9yIGp1c3QgYW4gZXJyb3IgbG9nPw0KDQo+DQo+DQo+ICMjIFByb3Bvc2VkIERlc2ln
bg0KPg0KPiBUaGUgUFNVIGZpcm13YXJlIGNvZGUgdXBkYXRlIHdpbGwgcmUtdXNlIHRoZSBjdXJy
ZW50IGludGVyZmFjZXMgdG8gdXBsb2FkLA0KPiB2ZXJpZnksIGFuZCBhY3RpdmF0ZSB0aGUgaW1h
Z2UuDQoNClllcywgdGhpcyBlbnN1cmVzIHRoZSBleGlzdGluZyBSZWRmaXNoIGZpcm13YXJlIHVw
ZGF0ZSBBUEkncyBpbXBsZW1lbnRlZA0Kd2l0aGluIGJtY3dlYiB3aWxsIGFsc28gd29yayBmb3Ig
dGhpcyB3aXRob3V0IGFueSBjaGFuZ2VzIHJlcXVpcmVkLg0KDQo+DQo+IDEuIFRoZSAiVmVyc2lv
biIgaW50ZXJmYWNlIG5lZWRzIHRvIGJlIGV4dGVuZGVkOg0KPiAgICAqIEFkZCBhIG5ldyBbVmVy
c2lvblB1cnBvc2VdWzRdIGZvciBQU1U7DQo+ICAgICogUmUtdXNlIHRoZSBleGlzdGluZyBFeHRl
bmRlZFZlcnNpb24gYXMgYW4gYWRkaXRpb25hbCBzdHJpbmcgZm9yDQo+ICAgICAgdmVuZG9yLXNw
ZWNpZmljIHB1cnBvc2UsIGUuZy4gdG8gaW5kaWNhdGUgdGhlIFBTVSBtb2RlbC4NCj4gMi4gUmUt
dXNlIHRoZSBleGlzdGluZyBmdW5jdGlvbnMgaW1wbGVtZW50ZWQgYnkgW3Bob3NwaG9yLWJtYy1j
b2RlLW1nbXRdWzJdIGZvcg0KPiB1cGxvYWRpbmcgYW5kIHByb2Nlc3NpbmcgdGhlIGltYWdlLg0K
PiAgICAqIFRoZSBQU1UgdXBkYXRlIGltYWdlIHNoYWxsIGJlIGEgdGFyYmFsbCBjb25zaXN0cyBv
ZiBhIE1BTklGRVNULCBpbWFnZXMsDQo+ICAgICAgYW5kIHNpZ25hdHVyZXMNCj4gMy4gVGhlcmUg
d2lsbCBiZSBhIG5ldyBzZXJ2aWNlIHRoYXQgaW1wbGVtZW50cyB0aGUgW0FjdGl2YXRpb25dWzVd
IGludGVyZmFjZSB0bw0KPiB1cGRhdGUgdGhlIFBTVSBmaXJtd2FyZS4NCj4gICAgKiBJdCBzaGFs
bCBydW4gYWxsIHRoZSBjaGVja3MgZGVzY3JpYmVkIGluIFtSZXF1aXJlbWVudHNdIGJlZm9yZSBw
ZXJmb3JtaW5nDQo+ICAgICAgdGhlIGNvZGUgdXBkYXRlOw0KPiAgICAqIEl0IHNoYWxsIHJ1biB0
aGUgY2hlY2tzIGFmdGVyIGVhY2ggUFNVIGNvZGUgdXBkYXRlIGlzIGRvbmUuDQo+ICAgICogVGhl
IHNlcnZpY2Ugd2lsbCB2ZXJpZnkgdGhlIHNpZ25hdHVyZSBvZiB0aGUgaW1hZ2U7DQo+ICAgICog
VGhlIHNlcnZpY2Ugc2hhbGwgY2hlY2sgdGhlIEV4dGVuZGVkVmVyc2lvbiB0byBtYWtlIHN1cmUg
dGhlIGltYWdlIG1hdGNoZXMNCj4gICAgICB0aGUgUFNVIG1vZGVsLg0KPiAgICAqIFRoZSBzZXJ2
aWNlIHdpbGwgY2FsbCBhIGNvbmZpZ3VyYWJsZSBhbmQgdmVuZG9yLXNwZWNpZmljIHRvb2wgdG8g
cGVyZm9ybQ0KPiAgICAgIHRoZSBjb2RlIHVwZGF0ZS4NCj4gICAgKiBXaGVuIGVhY2ggY2hlY2sg
ZmFpbHMsIG9yIHRoZSB2ZW5kb3Itc3BlY2lmaWMgdG9vbCByZXR1cm5zIGVycm9ycywgdGhlIFBT
VQ0KPiAgICAgIGNvZGUgdXBkYXRlIHdpbGwgYmUgYWJvcnRlZCBhbmQgYW4gZXJyb3IgZXZlbnQg
bG9nIHNoYWxsIGJlIGNyZWF0ZWQuDQo+ICAgICogV2hlbiB0aGUgUFNVIGNvZGUgdXBkYXRlIGlz
IGNvbXBsZXRlZCwgYW4gaW5mb3JtYXRpb25hbCBldmVudCBsb2cgc2hhbGwgYmUNCj4gICAgICBj
cmVhdGVkLg0KSXMgdGhpcyBhIG5vcm1hbCByZXF1aXJlbWVudCB3aGVuIGl0IGNvbWVzIHRvIFBT
VSdzPyBXZSBkb24ndCBkbyB0aGlzIGZvciBCTUMNCm9yIFBOT1IuDQoNCj4NCj4NCjxzbmlwPg0K
