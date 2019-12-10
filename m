Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7779F11903B
	for <lists+openbmc@lfdr.de>; Tue, 10 Dec 2019 19:59:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47XTqs4V7ZzDqZx
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2019 05:59:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=40.107.93.121;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="Lht9T4xm"; dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2121.outbound.protection.outlook.com [40.107.93.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XTpy1qfDzDqZD
 for <openbmc@lists.ozlabs.org>; Wed, 11 Dec 2019 05:58:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0pPoLV+8F5lgKgDRky3/6l/UIvT+klEm2v4G8+gaVX1wRX4WskbbkzMLW8/oTLzXlBWIxLD/5Y4UMtTQA+N1JAEnEQvG6i9ALJhoOk1rAKtpe4o/Ty53UFU5mJIdrOrufA6SL4KQUzX5ZX3MwQiu4zWJl/UVE8+s8RkEtXqY9AOUc7wqFiFBh0vAEppg0j7DCRs+GucNDhC+OOfihhAwyoPBpvTdVJJIoBLu5xm0dM67ybyXE0Oq6Nvov8x7ttzmtOPKYjDjSrbRP9iIxnUNLrlcGRP7dylqttxo8YLqlxq5tSG5nPYyBmDnYohGVUNcvlLodDt4/Lq4coCZCaWTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtUZLt20EhuH9r2JEaUhnJZLYc8VqA2QAWa0rCEzBJ8=;
 b=izQdqE5ZsqMJz4dwSEwLCYf4eSxO0RWYjAzcmt3Fc1Sw6jHmNdxWGHT3unTiWU7fYv52iLJb+/QQ0U1p5IG2YspX6I1tlq5NlNvot06CIaXwLTwbkOR5kLlQc49KgWMSVSwT2jNeHSXfwQ5lHHR4CoyZgWmE2LL52uOOtP+oo4g1ibWiFxgxE67HZvYRhanmjStbF8wTgxmFKStcbVqo5SYp5wQhlELOrLr5KWtkI3lgOdzR8VbjR/8VUd0+JmiE5DQ7Cu5G3OfgTLUkDMadlS2z6GaDOYZ/hv69P6Xl+207I9OHYc14kyEZXFBSZVqJKFtqeRf5uDIzswJQbpW7eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtUZLt20EhuH9r2JEaUhnJZLYc8VqA2QAWa0rCEzBJ8=;
 b=Lht9T4xmFTGxjG+7dCUyxQ3bbqNR6rlCetGe9DoykNDa0iqejZRfbdAN/KUjEW604ybMtwpcHDngOCJSXlHTKKhB4JJxJ2QZngMWsxTnDJ1Uf8pPy5rw4ePfn7rm19uhYyKpm1VuNFE90PTlJVVgZNWwajqU5CMSIUmE4IKk6Cg=
Received: from DM6PR21MB1388.namprd21.prod.outlook.com (20.180.21.213) by
 DM6PR21MB1146.namprd21.prod.outlook.com (20.179.50.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.3; Tue, 10 Dec 2019 18:58:10 +0000
Received: from DM6PR21MB1388.namprd21.prod.outlook.com
 ([fe80::a4df:ed8e:9432:60d]) by DM6PR21MB1388.namprd21.prod.outlook.com
 ([fe80::a4df:ed8e:9432:60d%3]) with mapi id 15.20.2538.012; Tue, 10 Dec 2019
 18:58:10 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: Joseph Reynolds <jrey@linux.ibm.com>, Alexander Tereschenko
 <aleksandr.v.tereschenko@linux.intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, Patrick Venture <venture@google.com>
Subject: RE: [EXTERNAL] Re: BMC update via TFTP
Thread-Topic: [EXTERNAL] Re: BMC update via TFTP
Thread-Index: AQHVqfSSAjzz6VCO+EyPfV04Tl2MsKeopL4AgAAuf4CAAU0HAIAAYbIAgADh3QCAAMFRAIABAtSAgACT1oCABEWaAIAAm/gAgAElraA=
Date: Tue, 10 Dec 2019 18:58:10 +0000
Message-ID: <DM6PR21MB1388F87CA03203F0C5F9F331C85B0@DM6PR21MB1388.namprd21.prod.outlook.com>
References: <q7_GhCRdlxUNHfFX0Y4tW7FPq5Md7qwdFWbwd39V_S5zxrSBYtoXtvlNpQdZchvPB27edbJ3-QKFyZ97kzXoeH3Bby8IIHSWhxle9jzteKA=@protonmail.com>
 <5747d991-27b7-4bb1-8a25-f46d1de832e1@linux.vnet.ibm.com>
 <f778ce0c-f395-7528-ed05-cec194707a14@linux.vnet.ibm.com>
 <9e0303e5beb34b9bb50b050cd56e35d8@linux.vnet.ibm.com>
 <ed917fd0-61e1-3ff8-05f9-863d3e451c93@linux.ibm.com>
 <20191204213650.GB9613@mauery.jf.intel.com>
 <94b297b5-81d1-1e07-498f-155a9160cb1d@linux.intel.com>
 <20191205223708.GC9613@mauery.jf.intel.com>
 <1c75671d-904e-8a06-07f5-c93fcf0e5e50@linux.intel.com>
 <d6b4685e-5834-7bfb-609e-c53159a54176@linux.ibm.com>
 <f6254181-64e8-e923-8d60-9f7632a899e5@linux.intel.com>
 <3231c302-27a9-3437-849a-767850d12fd0@linux.ibm.com>
In-Reply-To: <3231c302-27a9-3437-849a-767850d12fd0@linux.ibm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=neladk@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-12-10T18:58:09.4328353Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=30134c66-7d25-479f-aeb3-ca69e607bfc8;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [2001:4898:80e8:0:9985:2b7:2117:ac6f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ebfcf82c-c551-4a72-3723-08d77da2e6ea
x-ms-traffictypediagnostic: DM6PR21MB1146:
x-microsoft-antispam-prvs: <DM6PR21MB11463DC2D3FA61B5E16CD6B7C85B0@DM6PR21MB1146.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02475B2A01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(366004)(376002)(396003)(39860400002)(136003)(199004)(189003)(13464003)(2906002)(55016002)(9686003)(8676002)(81166006)(81156014)(966005)(8936002)(71200400001)(478600001)(52536014)(186003)(7696005)(10290500003)(8990500004)(66446008)(5660300002)(53546011)(86362001)(66556008)(110136005)(6506007)(33656002)(15650500001)(64756008)(76116006)(66946007)(316002)(66476007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR21MB1146;
 H:DM6PR21MB1388.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g57NCbE0v016pQjSRAZZxxea/2jU3ri89+ayVFRaycGHt93U/KQfZnUgeqIURHJj/U6xDaCHn7WJIIDtEMj5Xt0fcYOiiM1r+q2aS2r/p4Yku9YXMtOFvi9Hi+FmH2jeIeviCng8iu34I3DaPMEB3rfNygxZAy6CpMvtAUVJgjIzTHjdiChcRth/hyq3D4ynk/HZXdKkA/K13v4Oco5PL+kgjqxxLJjV2CVGuBYhWb5Y5bODtXoR185BDHJZ8EtQZMgFLpvFZpiUp1JkiHXk750KWciRkUTVCCa4Rxo120gDaCMbEh6TdkLgqOD29qCn18M/LBGEEAvtPnzT/O9Dhh1983dPLFZO+t8/h2lQdE7HsOUkDG0DEE0fRnSEQpQ2XL+DUoOYmXe7ZvfxXO4FPh8M7NMsDwTYvxTwY0pmx++Oi8hI76oCrAR8vSNmCYy1wmPJy8olnmVRO6f53KeS5e+WCqeTKPfS3c0h841zlo3xXUWliVx6v9/RUihXogQq
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebfcf82c-c551-4a72-3723-08d77da2e6ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2019 18:58:10.7422 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vtTz3h85hq2u7dv7yEcn3bglcrIGQ2C7CgkNguZZB7CpedGJ3xM0YtfJ67o3HFx2vj77L9FhVVwj97s8qXGUiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR21MB1146
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

QXJlIHRoZXJlIGFueSB0aG91Z2h0cyB0byBnZXQgcmlkIG9mIEJNQyByZXNldCB0byB0cmlnZ2Vy
IEZXIHVwZGF0ZT8gSSB1bmRlcnN0YW5kIEZXIHJlc2V0IGlzIHJlcXVpcmVkIGFmdGVyIHRoZSB1
cGRhdGUuIA0KDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBvcGVuYm1jIDxv
cGVuYm1jLWJvdW5jZXMrbmVsYWRrPW1pY3Jvc29mdC5jb21AbGlzdHMub3psYWJzLm9yZz4gT24g
QmVoYWxmIE9mIEpvc2VwaCBSZXlub2xkcw0KU2VudDogTW9uZGF5LCBEZWNlbWJlciA5LCAyMDE5
IDU6MjUgUE0NClRvOiBBbGV4YW5kZXIgVGVyZXNjaGVua28gPGFsZWtzYW5kci52LnRlcmVzY2hl
bmtvQGxpbnV4LmludGVsLmNvbT47IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KU3ViamVjdDog
W0VYVEVSTkFMXSBSZTogQk1DIHVwZGF0ZSB2aWEgVEZUUA0KDQpPbiAxMi85LzE5IDEwOjA2IEFN
LCBBbGV4YW5kZXIgVGVyZXNjaGVua28gd3JvdGU6DQo+IE9uIDA2LURlYy0xOSAyMzo1MiwgSm9z
ZXBoIFJleW5vbGRzIHdyb3RlOg0KPj4gSSB3YXMgdGhpbmtpbmcgYWxvbmcgdGhlIGxpbmVzIG9m
IGFkZGluZyBbU0ZUUF1bXSAob3IgU0NQKSBzdXBwb3J0IA0KPj4gYW5kIHRoZW4gbWlncmF0aW5n
IGV4aXN0aW5nIFRGVFAgdXNlcnMgdG8gdGhlIG5ldyBzZWN1cmUgc29sdXRpb24uDQo+Pg0KPj4g
VGhhdCBpcywgdGhlIEJNQyBhZG1pbiBwZXJmb3JtaW5nIFtjb2RlIHVwZGF0ZV1bXSBjYW4gY3Vy
cmVudGx5IGdldCBhIA0KPj4gZmlybXdhcmUgaW1hZ2UgdmlhIFBPU1QgRG93bmxvYWRWaWFURlRQ
IHRvIFVSSSANCj4+IC94eXovb3BlbmJtY19wcm9qZWN0L3NvZnR3YXJlLg0KPj4gTXkgaWRlYSBp
cyB0byBvZmZlciBhIERvd25sb2FkVmlhU0ZUUCBtZXRob2QgKG9yIHByZWZlcmFibHkgYSBSZWRm
aXNoDQo+PiBBUEkpIGZvciB0aGlzLsKgIE5vdGUgdGhhdCB0aGUgVEZUUCBkb3dubG9hZCBpcyBk
aXNhYmxlZCBieSBkZWZhdWx0IA0KPj4gcGVyIFtibWN3ZWIgY29uZmlnXVtdLg0KPj4NCj4+IE9u
Y2UgT3BlbkJNQyBzdXBwb3J0cyBkb3dubG9hZGluZyBmaXJtd2FyZSB2aWEgU0ZUUCwgd2UgY2Fu
IGVuY291cmFnZSANCj4+IG91ciB1c2VycyB0byBzZXQgdXAgdGhlaXIgU0ZUUCBzZXJ2ZXJzIGFu
ZCB0YWtlIGRvd24gdGhlaXIgVEZUUCANCj4+IHNlcnZlcnMuwqAgSSByZWFsaXplIHRoYXQgc291
bmRzIGVhc3ksIGJ1dCBJIGRvbid0IGhhdmUgYSBmZWVsaW5nIGhvdyANCj4+IGRpZmZpY3VsdCB0
aGF0IHdvdWxkIGJlIGluIHByYWN0aWNlLg0KPj4NCj4+IERvZXMgdGhhdCBzb3VuZCBmZWFzaWJs
ZT8NCj4+DQo+PiAtIEpvc2VwaA0KPj4NCj4+IFtTRlRQXTogDQo+PiBodHRwczovL25hbTA2LnNh
ZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZtYW4NCj4+
IC5vcGVuYnNkLm9yZyUyRnNmdHAtc2VydmVyJmFtcDtkYXRhPTAyJTdDMDElN0NuZWxhZGslNDBt
aWNyb3NvZnQuY29tJQ0KPj4gN0M5Y2M3MWYzM2EzMDE0MjYwZTM2ZjA4ZDc3ZDBmZTExYiU3Qzcy
Zjk4OGJmODZmMTQxYWY5MWFiMmQ3Y2QwMTFkYjQ3DQo+PiAlN0MxJTdDMCU3QzYzNzExNTM3OTQ2
OTA1Mjg3NiZhbXA7c2RhdGE9WmolMkJqQWxhWGx5ZUJrVHNsN012dGJQb1NlSDcNCj4+IGF6JTJG
QUpTMVV4WGVDeTBQYyUzRCZhbXA7cmVzZXJ2ZWQ9MA0KPj4gW2NvZGUgdXBkYXRlXTogDQo+PiBo
dHRwczovL25hbTA2LnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMl
M0ElMkYlMkZnaXQNCj4+IGh1Yi5jb20lMkZvcGVuYm1jJTJGZG9jcyUyRmJsb2IlMkZtYXN0ZXIl
MkZjb2RlLXVwZGF0ZSUyRmNvZGUtdXBkYXRlLg0KPj4gbWQmYW1wO2RhdGE9MDIlN0MwMSU3Q25l
bGFkayU0MG1pY3Jvc29mdC5jb20lN0M5Y2M3MWYzM2EzMDE0MjYwZTM2ZjA4DQo+PiBkNzdkMGZl
MTFiJTdDNzJmOTg4YmY4NmYxNDFhZjkxYWIyZDdjZDAxMWRiNDclN0MxJTdDMCU3QzYzNzExNTM3
OTQ2OTANCj4+IDUyODc2JmFtcDtzZGF0YT1TY1YxNHl0Y1BDWW4lMkJsSSUyQjlsUGdrZ0tZNHlW
aCUyQnJ3TVZnZGJuQjBoNXo0JTNEJg0KPj4gYW1wO3Jlc2VydmVkPTANCj4+IFtibWN3ZWIgY29u
ZmlnXTogDQo+PiBodHRwczovL25hbTA2LnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29t
Lz91cmw9aHR0cHMlM0ElMkYlMkZnaXQNCj4+IGh1Yi5jb20lMkZvcGVuYm1jJTJGYm1jd2ViJTJG
YmxvYiUyRjQxZDFkMTgzM2Y0NzY3NjZmODhjZmI2MjRlNjZlZWY3OQ0KPj4gMDZiZGY4YyUyRkNN
YWtlTGlzdHMudHh0JTIzTDk4JmFtcDtkYXRhPTAyJTdDMDElN0NuZWxhZGslNDBtaWNyb3NvZnQu
DQo+PiBjb20lN0M5Y2M3MWYzM2EzMDE0MjYwZTM2ZjA4ZDc3ZDBmZTExYiU3QzcyZjk4OGJmODZm
MTQxYWY5MWFiMmQ3Y2QwMTENCj4+IGRiNDclN0MxJTdDMCU3QzYzNzExNTM3OTQ2OTA1Mjg3NiZh
bXA7c2RhdGE9d2tWOHg2Q2UxQTBXZiUyRk1OJTJGJTJCOQ0KPj4gRkRTWXdROXo0N1lJNmJjNlJ3
cXJUY0VnJTNEJmFtcDtyZXNlcnZlZD0wDQo+DQo+IFllcywgdGhhdCBjb3VsZCBiZSBhIHNvbHV0
aW9uIGZvciB0aGUgcHJvYmxlbSB3ZSBkaXNjdXNzLCBwcm92aWRpbmcgDQo+IGJvdGggaW50ZWdy
aXR5IGFuZCBjb25maWRlbnRpYWxpdHksIHdpdGhvdXQgYW55IG1ham9yIE9wZW5CTUMgDQo+IGRl
dmVsb3BtZW50IG5lY2Vzc2FyeSAtIGJ1dCBpdCB3b3VsZCBtZWFuIG1vcmUgb3BlcmF0aW9uYWwg
YnVyZGVuIGZvciANCj4gQk1DIGFkbWlucy4gVGhlIHByb2JsZW0gd2l0aCBTQ1AvU0ZUUCBpbiB0
aGlzIGNvbnRleHQgaXMgdGhhdCBmb3IgdGhpcyANCj4gdG8gd29yayBpbiB0aGUgc2FtZSBtYW5u
ZXIgYXMgVEZUUCwgdGhlIEJNQyBtdXN0IGJlIGFuIFNTSCBjbGllbnQgLSANCj4gaS5lLiBoYXZl
IHNvbWUgc29ydCBvZiBpZGVudGl0eS9jcmVkZW50aWFscyBmb3IgdGhlIFNDUC9TRlRQIHNlcnZl
ciANCj4gcHJvdmlzaW9uZWQgZmlyc3QuIFRoYXQgbWlnaHQgbm90IGJlIHRoZSBlYXNpZXN0IHNv
bHV0aW9uIHRvIHNldHVwLCANCj4gYnV0IGl0J3Mgb2YgY291cnNlIHBvc3NpYmxlIGFuZCBjYW4g
YmUgYXV0b21hdGVkIGlmIE9wZW5CTUMgcHJvdmlkZXMgDQo+IHJlc3BlY3RpdmUgY29uZmlnIGtu
b2JzLg0KPg0KPiBFeGlzdGluZyB3YXlzIHdlIGhhdmUgaW4gY29kZS11cGRhdGUubWQgZWl0aGVy
IGRvbid0IHJlcXVpcmUgDQo+IGNyZWRlbnRpYWxzIChURlRQKSwgc28gYmVpbmcgYSBjbGllbnQg
aXMgZWFzeSwgb3IgYXJlIG5vdCBtYWtpbmcgYSANCj4gImNsaWVudCIgZnJvbSBCTUMsIGl0J3Mg
dGhlIGFkbWluIHdobyB1cGxvYWRzIHN0dWZmIChTQ1AvUkVTVCkuDQoNClllcywgdGhhdCdzIHdo
YXQgSSB3YXMgdGhpbmtpbmcuwqAgKEFuZCBubywgSSBhbSBub3QgZ29pbmcgdG8gcmVjb21tZW5k
IHNldHRpbmcgdXAgYSBTQ1Agb3IgU0ZUUCBzZXJ2ZXIgdGhhdCBhbGxvd3MgYW5vbnltb3VzIGFj
Y2Vzcy4pDQoNClRoaXMgaGlnaGxpZ2h0IHRoZSBuZWVkIGZvciBPcGVuQk1DIHRvIHB1dCB0b2dl
dGhlciBhIGd1aWRlIHRvIHByb3Zpc2lvbmluZyB5b3VyIEJNQy7CoMKgwqAgU3VjaCBhcyBndWlk
ZSB3b3VsZCBnaXZlIHVzIGEgcGxhY2UgdG8gdGFsayBhYm91dCB1cGxvYWRpbmcgdG8gdGhlIEJN
QyBTU0ggY2xpZW50IGNlcnRpZmljYXRlcyBuZWVkZWQgdG8gYWNjZXNzIGFuZCBkb3dubG9hZCB0
aGUgZmlybXdhcmUgaW1hZ2VzLg0KDQotIEpvc2VwaA0KDQo+DQo+IHJlZ2FyZHMsDQo+IEFsZXhh
bmRlcg0KPg0KDQo=
