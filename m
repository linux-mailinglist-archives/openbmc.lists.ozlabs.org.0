Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4880C33F1D
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 08:44:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45J2Sw64JBzDqW4
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 16:44:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=40.107.77.92; helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="jshW7Qo3"; dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770092.outbound.protection.outlook.com [40.107.77.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45J2SM2RJ7zDqQg
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jun 2019 16:43:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=wckws5FvaZsIjZAEiyOA/V5qt3SZotEzTkX7qSPG97AsL90QWQCE6Jrbwyy6Lz2Vs+GdKUKn4fsMgNbvpFgrMXAr76xKdXzOAH3+ePwRiCaHdmlQo5TW8rBL0tK3J9xq13dBzrLk/cVBtHDBfK0QKWyEd0t7J7+GjT2yzctKLL4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lsT17JER88SPvuXKjgP18bY5twGC9LEzqyJ7byPhSkc=;
 b=BWhNctkHj7CWAQLgJEpULxC0Ptoeayar+qyD1RJifrq06F0Ft1jBQnVlRz14tEE7cjW9OHFfm6wncNSTf10z8HGgZe1sCqnXWUkdgZ2eQwT87uEFuwAP77ssoMpoHS2pzJR47jflNfAE9z+FoDfaH++oXbK4ieMSDyaEZuB+9Jo=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lsT17JER88SPvuXKjgP18bY5twGC9LEzqyJ7byPhSkc=;
 b=jshW7Qo3vgQLvUjl7/g/eKD46IZLxcxS7jMsQn+9r66C030yn6Bina583hIjhkbgdcpRoOESVTTiH96W8dzBC5JvPm0W0hSj7KskjdGxBTo3TxQM7OwC48MbmOEcr42jdrwb+hFpdDp354YRNXzezu3HU4nzzsR6eZN47pge7WQ=
Received: from BL0PR2101MB0932.namprd21.prod.outlook.com
 (2603:10b6:207:30::20) by BL0PR2101MB0962.namprd21.prod.outlook.com
 (2603:10b6:207:30::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1987.2; Tue, 4 Jun
 2019 06:43:25 +0000
Received: from BL0PR2101MB0932.namprd21.prod.outlook.com
 ([fe80::1072:430b:60ef:aaae]) by BL0PR2101MB0932.namprd21.prod.outlook.com
 ([fe80::1072:430b:60ef:aaae%4]) with mapi id 15.20.1987.003; Tue, 4 Jun 2019
 06:43:25 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: Lei YU <mine260309@gmail.com>
Subject: RE: [Design] PSU firmware update
Thread-Topic: [Design] PSU firmware update
Thread-Index: AQHVGeoAPR6UDQTsDUiPZ/ien9Yqe6aJ7ZyAgAA1nrCAAKuwgIAAPDzw
Date: Tue, 4 Jun 2019 06:43:25 +0000
Message-ID: <BL0PR2101MB09326C07D2FFA072FB19CEC7C8150@BL0PR2101MB0932.namprd21.prod.outlook.com>
References: <CAARXrt=6mZtVuwdTxamjUWXJk5RXNKaNM9aVZE5nEyTjowVjEQ@mail.gmail.com>
 <CALLMt=pdm=Nk5sCZvZBORb+N5suT7-FK0xbvWUy3Qxg5KcttKA@mail.gmail.com>
 <BL0PR2101MB09320BD7856E280C04852CB1C8140@BL0PR2101MB0932.namprd21.prod.outlook.com>
 <CAARXrtnJ1SsSVb2Y=5tvVVQtOouUpmZR4XoY4p=vhgizHmh4hA@mail.gmail.com>
In-Reply-To: <CAARXrtnJ1SsSVb2Y=5tvVVQtOouUpmZR4XoY4p=vhgizHmh4hA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=neladk@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-06-04T06:43:22.1439572Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=8586b48b-6ae5-458f-af82-b9d96f6641ca;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [50.47.128.230]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f59423f5-6c9c-47ae-655d-08d6e8b7f1e1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BL0PR2101MB0962; 
x-ms-traffictypediagnostic: BL0PR2101MB0962:
x-microsoft-antispam-prvs: <BL0PR2101MB0962678709AC7FD7F0F98595C8150@BL0PR2101MB0962.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(376002)(396003)(136003)(39860400002)(189003)(199004)(13464003)(14444005)(256004)(53936002)(2906002)(6916009)(33656002)(10090500001)(68736007)(55016002)(15650500001)(71200400001)(229853002)(7736002)(1411001)(3846002)(6116002)(8936002)(74316002)(9686003)(66946007)(66476007)(66556008)(64756008)(66446008)(73956011)(305945005)(76116006)(446003)(71190400001)(476003)(102836004)(81166006)(66066001)(486006)(54906003)(26005)(99286004)(186003)(4326008)(8990500004)(53546011)(6506007)(14454004)(11346002)(478600001)(86362001)(52396003)(76176011)(7696005)(6436002)(5660300002)(81156014)(52536014)(8676002)(22452003)(6246003)(316002)(25786009)(10290500003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BL0PR2101MB0962;
 H:BL0PR2101MB0932.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nYdP+4EcXLD10AMWbI2I5HkeVZ9t/xVL5MHN6+qu5hW0cFZXA3BL0YitOZ6LV8om2Di099Pnl0BK8BX/MVMSWRUgta/ayfKybpglG97ho2df5aTwtn7kwjwf4I0LqUbBk31sxH/SX2A8HZazK8UbLOx3mJljRl1glNtyiThQmDMd/RLJbCxbrIzZtUOG9+NLmLHArLCeCPk/LeHt5kGY2j4MGhJT1txfr4m78UI+gphEoagIpCa1Ve1rOM6Haz7JXlxM/UnpWPxbbW0mjeZR4FpMN/6nIZRBOdMWi06lm+6Rd7HYqvc97I19j11NbatHzYjfc4nhKjywfMOmqrTFSGwcGDFoggnDQG+U8F459tFlbKNgB82mpGbqixsnQFODzkcMBBAJ/uVsiy1Fi5yYO0wydNOmnBFD95yjXHuOP5w=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f59423f5-6c9c-47ae-655d-08d6e8b7f1e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 06:43:25.2174 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: neladk@microsoft.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR2101MB0962
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

QXJlIHlvdSBwcm9wb3NpbmcgdGhhdCBpZiBQU1UgRlcgaXMgYXR0ZW1wdGVkIGFuZCBpZiBzeXN0
ZW0gaXMgcG93ZXJlZCBvbiwgdGhlIEZXIHVwZGF0ZSB3aWxsIG5vdCBzdGFydD8gV2Ugc2hvdWxk
IG5vdCB0aWUgZnJhbWV3b3JrIHdpdGggdGhlc2UgcmVxdWlyZW1lbnRzLiAgSWYgdGhpcyBpcyBy
ZWFsbHkgcmVxdWlyZWQgZm9yIGEgcGFydGljdWxhciBwbGF0Zm9ybSBkZXNpZ24gdGhlbiB2ZW5k
b3Igc3BlY2lmaWMgdG9vbCBjYW4gaGF2ZSByaWdodCBjaGVja3MgYmVmb3JlIHRyaWdnZXJpbmcg
dGhlIHVwZGF0ZS4gDQoNCkFsc28gaG93IGRvIHdlIHRpZSB0aGlzIHdpdGggSVBNST8gIEhvdyBk
b2VzIHRoZSBwYXlsb2FkIHJlYWNoIEJNQyBhbmQgSG93IGRvIHdlIGtub3cgcHJvZ3Jlc3Mgb2Yg
RlcgdXBkYXRlID8NCg0KVGhhbmtzDQpOZWVyYWoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCkZyb206IExlaSBZVSA8bWluZTI2MDMwOUBnbWFpbC5jb20+IA0KU2VudDogTW9uZGF5LCBK
dW5lIDMsIDIwMTkgNzo1OCBQTQ0KVG86IE5lZXJhaiBMYWRrYW5pIDxuZWxhZGtAbWljcm9zb2Z0
LmNvbT4NCkNjOiBBbmRyZXcgR2Vpc3NsZXIgPGdlaXNzb25hdG9yQGdtYWlsLmNvbT47IE9wZW5C
TUMgTWFpbGxpc3QgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NClN1YmplY3Q6IFJlOiBbRGVz
aWduXSBQU1UgZmlybXdhcmUgdXBkYXRlDQoNCk9uIFR1ZSwgSnVuIDQsIDIwMTkgYXQgMToyMyBB
TSBOZWVyYWogTGFka2FuaSA8bmVsYWRrQG1pY3Jvc29mdC5jb20+IHdyb3RlOg0KPg0KPiAxLiBX
aHkgaG9zdCBwb3dlciBvZmYgaXMgYSBwcmUtY29uZGl0aW9uPyBXZSBzaG91bGQgYWRkIHRoaXMg
YSBQU1UgcHJlLXJlcXVpc2l0ZSB0byBzdXBwb3J0IExpdmUgdXBncmFkZSBhbmQgYWN0aXZhdGlv
bi4NCg0KDQpEZXJlaydzIHJlcGx5IGV4cGxhaW5zIHRoZSByZWFzb24gd2h5IHdlIHdhbnQgdG8g
dGhlIGhvc3QgcG93ZXIgb2ZmIGFzIHByZS1jb25kaXRpb24uDQoNCj4gMi4gSG93IHNob3VsZCBQ
U1UgdXBkYXRlIGltcGFjdCBQU1UgYW5kIGJhdHRlcnkgbW9uaXRvcmluZyA/IHNob3VsZCB0aGVy
ZSBiZSBjb29yZGluYXRpb24gYmV0d2VlbiBzZW5zb3IgbW9uaXRvcmluZyB0YXNrIGR1cmluZyB1
cGRhdGUgPw0KDQpUaGlzIGlzIGEgZ29vZCBwb2ludC4gRHVyaW5nIFBTVSB1cGRhdGUsIHRoZSBk
cml2ZXIgcHJvYmFibHkgc2hvdWxkIGJlIHVuYmluZCwgYW5kIGFmdGVyIHRoZSB1cGRhdGUgaXMg
b25lLCByZWJpbmQgdGhlIGRyaXZlci4NCkRvZXMgdGhhdCBzb3VuZHMgT0s/DQoNCj4gMy4gUFNV
IG1heSBoYXZlIG11bHRpcGxlIHJlZ2lvbnMgbGlrZSBib290bG9hZGVyLCBhY3RpdmUgcmVnaW9u
IGFuZCBpbmFjdGl2ZSByZWdpb24uIFdlIHNob3VsZCBkZXNpZ24gdG8gc3VwcG9ydCBtdWx0aXBs
ZSByZWdpb24gdXBkYXRlLg0KDQpJIGRvIG5vdCBoYXZlIGRldGFpbGVkIGluZm9ybWF0aW9uIGFi
b3V0IHRoaXMsIHdoaWNoIGlzIG1vcmUgc3VpdGFibGUgdG8gbGV0IHRoZSB2ZW5kb3Itc3BlY2lm
aWMgdG9vbCB0byBoYW5kbGUgdGhlIG11bHRpcGxlIHJlZ2lvbnMuDQpXaGF0IGRvIHlvdSB0aGlu
az8NCg0KPiA0LiBDYW4geW91IHByb3Bvc2UgcmVxdWlyZWQgU0VMIGxvZ3MgYW5kIHRlbGVtZXRy
eSByZXF1aXJlbWVudHMgYXMgd2VsbCA/DQoNCldoaWxlIEkgd2FzIHdyaXRpbmcgdGhpcyBkZXNp
Z24gZG9jLCBJIHdhcyBub3QgdGhpbmtpbmcgYWJvdXQgdGhlIGRldGFpbGVkIFNFTCBsb2dzLg0K
V2lsbCBuZWVkIHNvbWUgdGltZSB0byBkaXNjdXNzIHRoaXMgYW5kIHNlZSBpZiBpdCBzaGFsbCBi
ZSBjb3ZlcmVkIGluIHRoaXMgZG9jIG9yIG5vdC4NCg==
