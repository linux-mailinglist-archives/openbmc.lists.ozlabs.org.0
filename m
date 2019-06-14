Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 56ADC467F4
	for <lists+openbmc@lfdr.de>; Fri, 14 Jun 2019 21:00:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QVKt6LnLzDqw1
	for <lists+openbmc@lfdr.de>; Sat, 15 Jun 2019 05:00:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=40.107.81.128; helo=nam01-by2-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="CnWh41Hu"; dkim-atps=neutral
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810128.outbound.protection.outlook.com [40.107.81.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45QVKF5xS1zDqq5
 for <openbmc@lists.ozlabs.org>; Sat, 15 Jun 2019 04:59:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=rsK4jIpMYWDByIKyUDu/5oXMO0JWHcqi6m426movhlPv/Q1r6Qzs7WH7GjYyZ+FHDBgtdWJrAVWPo3n9hfxwioQWspfhXYjJFvSuyH46jKoUdkNMeyfK1ie51rq0krngRD387A59pjq0mFSEeAUO+hqw/ffkYy7XUD/zdFKdSrI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kl7q3KM/XWCzjIfh9oUBsuQkZz3Uz/Zz3/lkpi5TS4=;
 b=hzKdwjNv0ETa2zHADrFl2GOiYoMm/lIJ2DJPdYcIDROLt5qjEhVkKMeoVihwIuSXnaeQW9U14pHIR9qmw32UjYKItrOA5KzSQHkMibF2ZkfuqR0E3pX/1pTdv+Uv7Z1RIaiu9XP7uG+6XQ3gGAexlzCQzQFTgJygSdWqTpKs3X4=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kl7q3KM/XWCzjIfh9oUBsuQkZz3Uz/Zz3/lkpi5TS4=;
 b=CnWh41Huhnq8eYOorhw22UwISZJN+1np+R5yMSjONIAbjDN1P6MBsNOiFFdsvMIzri0uFiCBm4+jThCNHLykwSUJrSBaQKYo1FBy722Y4hU15xM++tPh9KjCxy5ZIzXLaJScBRApHuW8z7OmC+GMUCNEPjyG1TcH0EhaJ8XX1KQ=
Received: from BL0PR2101MB0932.namprd21.prod.outlook.com
 (2603:10b6:207:30::20) by BL0PR2101MB0961.namprd21.prod.outlook.com
 (2603:10b6:207:30::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2008.0; Fri, 14 Jun
 2019 18:59:39 +0000
Received: from BL0PR2101MB0932.namprd21.prod.outlook.com
 ([fe80::1072:430b:60ef:aaae]) by BL0PR2101MB0932.namprd21.prod.outlook.com
 ([fe80::1072:430b:60ef:aaae%4]) with mapi id 15.20.2008.002; Fri, 14 Jun 2019
 18:59:39 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: Ed Tanous <ed.tanous@intel.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: RE: Platform Inventory for redfish
Thread-Topic: Platform Inventory for redfish
Thread-Index: AdUiY/+aKZsM/MRORKSmi2eCldLAJgAeVUAAAAFmHEA=
Date: Fri, 14 Jun 2019 18:59:39 +0000
Message-ID: <BL0PR2101MB09324B77299D04601CF25C41C8EE0@BL0PR2101MB0932.namprd21.prod.outlook.com>
References: <BL0PR2101MB0932DF0B72012340CADF3E90C8EE0@BL0PR2101MB0932.namprd21.prod.outlook.com>
 <131e8559-b80d-076e-8870-8c419d416596@intel.com>
In-Reply-To: <131e8559-b80d-076e-8870-8c419d416596@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=neladk@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-06-14T18:59:37.6095699Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=9c6877cd-0d46-4de8-a046-5e5b5f7529e0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [131.107.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 126a6860-058b-440b-f3b2-08d6f0fa73bb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BL0PR2101MB0961; 
x-ms-traffictypediagnostic: BL0PR2101MB0961:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BL0PR2101MB0961EA7174CE754620B5AEFEC8EE0@BL0PR2101MB0961.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0068C7E410
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(39860400002)(396003)(366004)(346002)(136003)(13464003)(189003)(199004)(53754006)(229853002)(10290500003)(110136005)(186003)(26005)(5660300002)(6506007)(6246003)(53936002)(53546011)(102836004)(86362001)(486006)(316002)(66946007)(8676002)(76116006)(8990500004)(6436002)(66446008)(64756008)(66556008)(73956011)(66476007)(81166006)(66066001)(6306002)(33656002)(9686003)(81156014)(478600001)(8936002)(52536014)(966005)(55016002)(22452003)(10090500001)(476003)(7736002)(68736007)(446003)(11346002)(14454004)(305945005)(52396003)(25786009)(2906002)(3480700005)(14444005)(76176011)(74316002)(7696005)(256004)(71190400001)(6116002)(99286004)(3846002)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BL0PR2101MB0961;
 H:BL0PR2101MB0932.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fQFeiTOdn3hfOut/dJpXlPp0zBAx7PJ2IKHRZDQpLgMECF/I/i8E6Peli5Cj/a4npglnlK2xBtptpgW7SZdciQNFlCR7gol2OJD8Udh3vNtAJbcacP5f92fRju1u02IgjNxX6cdXNZlvC4CP90X4/AQzzhfb24KMlqqrGMGPIORjd8jnep2ERGBIH8080C5kjIMyd6ao0mHGtJXGPB8XfnqfGpBzgA20BQBMz/VJO0xsffoeZRaVKeixlfSkfasWzv9t4vWLzULzNdSa1UE88T6wCEwsD++sDTo2nmx++uDaJCkeirWHbfGxIESkxrsEqR/opPVUXYuuaghB4xqljarJ69S9BJO9Ck82y89jQfhn6aexw9h31vqliLgbUFOCSxTKhK7mnORNLN+zBqV2SpdYTmW7Y6VbK+SY8yesqwE=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 126a6860-058b-440b-f3b2-08d6f0fa73bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2019 18:59:39.2472 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: neladk@microsoft.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR2101MB0961
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

VGhhbmtzIEVkLA0KDQoxLiBIb3cgZG9lcyBCTUMgcmVhZHMgU01CSU9TIHRhYmxlcyBhcyB0aGV5
IGFyZSBtYW5hZ2VkIGJ5IEhPU1Q/IA0KMi4gUENJZSBkZXZpY2VzIGFyZSB1c3VhbGx5IG5vdCBw
b3dlcmVkIG9uIHN0YW5kIGJ5IHJhaWxzIHNvIGlmIEJNQyBuZWVkIHRvIGVuYWJsZS9kaXNhYmxl
IHNlbnNvcnMgYmFzZWQgb24gY2VydGFpbiBQQ0llIGNhcmQsIGl0IHdvdWxkIG5lZWQgdG8gd2Fp
dCB0aWxsIHRoZSBwbGF0Zm9ybSBpcyBwb3dlcmVkLiBUaGlzIGNyZWF0ZXMgYSBsb3Qgb2YgcHJv
YmxlbXMgc3BlY2lhbGx5IGlmIHdlIGFyZSBidWlsZGluZyBwbGF0Zm9ybSBTS1VzIHVzaW5nIGEg
Y29tbW9uIGJ1aWxkaW5nIGJsb2NrLg0KMy4gSSB0aGluayB3ZSBuZWVkIG9mIGEgZmVhdHVyZSB3
aGVyZSB3ZSBjYW4gc3BlY2lmeSBwbGF0Zm9ybSBpbnZlbnRvcnkgaW4gSlNPTiBmaWxlIHRoYXQg
Z2V0IHBpY2tlZCB1cCBieSAicHJvYmUiIC4uIGZvciBleGFtcGxlIHRvIGRldGVjdCBhIE0uMiAu
LiB3ZSBjb3VsZCB1c2Ugc29tZXRoaW5nIGxpa2UgdGhpcy4uLg0KDQp7DQogICAgICAgICAgICAi
QmVoaW5kU3dpdGNoIjogZmFsc2UsDQogICAgICAgICAgICAiRGV2aWNlQ2xhc3MiOiAiTWFzc1N0
b3JhZ2VDb250cm9sbGVyIiwNCiAgICAgICAgICAgICJEZXZpY2VOYW1lIjogIlBNOTgzIiwNCiAg
ICAgICAgICAgICJJZCI6IDYsDQogICAgICAgICAgICAiUGh5c2ljYWxMb2NhdGlvbiI6IHsNCiAg
ICAgICAgICAgICAgICAiTG9jYXRpb25PcmRpbmFsVmFsdWUiOiA1LA0KICAgICAgICAgICAgICAg
ICJMb2NhdGlvblR5cGUiOiAiU2xvdCINCiAgICAgICAgICAgIH0sDQogICAgICAgICAgICAiU01C
dXNDb3VudCI6IDEsDQogICAgICAgICAgICAiU01CdXNJbmZvIjogWw0KICAgICAgICAgICAgICAg
IHsNCiAgICAgICAgICAgICAgICAgICAgIkJ1c051bWJlciI6IDYsDQogICAgICAgICAgICAgICAg
ICAgICJEZXZpY2VUeXBlIjogIk5WTUUiLA0KICAgICAgICAgICAgICAgICAgICAiSWQiOiAxLA0K
ICAgICAgICAgICAgICAgICAgICAiTXVsdGlNYXN0ZXIiOiBmYWxzZSwNCiAgICAgICAgICAgICAg
ICAgICAgIk11eENvdW50IjogMiwNCiAgICAgICAgICAgICAgICAgICAgIk11eEluZm8iOiBbDQog
ICAgICAgICAgICAgICAgICAgICAgICB7DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgIkNo
YW5uZWwiOiAxLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICJJZCI6IDEsDQogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIlNsYXZlQWRkciI6ICIweEUyIg0KICAgICAgICAgICAgICAg
ICAgICAgICAgfSwNCiAgICAgICAgICAgICAgICAgICAgICAgIHsNCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAiQ2hhbm5lbCI6IDAsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgIklk
IjogMiwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAiU2xhdmVBZGRyIjogIjB4RTYiDQog
ICAgICAgICAgICAgICAgICAgICAgICB9DQogICAgICAgICAgICAgICAgICAgIF0sDQogICAgICAg
ICAgICAgICAgICAgICJQcm90b2NvbCI6ICJDU0kiLA0KICAgICAgICAgICAgICAgICAgICAiU2xh
dmVBZGRyIjogIjB4RDQiDQogICAgICAgICAgICAgICAgfQ0KICAgICAgICAgICAgXSwNCiAgICAg
ICAgICAgICJTbG90VHlwZSI6ICJGdWxsTGVuZ3RoIg0KICAgICAgICB9LA0KDQpUaGFua3MNCk5l
ZXJhag0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogRWQgVGFub3VzIDxlZC50
YW5vdXNAaW50ZWwuY29tPiANClNlbnQ6IEZyaWRheSwgSnVuZSAxNCwgMjAxOSAxMToxNyBBTQ0K
VG86IE5lZXJhaiBMYWRrYW5pIDxuZWxhZGtAbWljcm9zb2Z0LmNvbT47IE9wZW5CTUMgTWFpbGxp
c3QgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NClN1YmplY3Q6IFJlOiBQbGF0Zm9ybSBJbnZl
bnRvcnkgZm9yIHJlZGZpc2gNCg0KT24gNi8xMy8xOSA4OjQ4IFBNLCBOZWVyYWogTGFka2FuaSB3
cm90ZToNCj4gSEkgQWxsLA0KPiANCj4gSG93IGRvZXMgd2UgbWFuYWdlIHBsYXRmb3JtIGludmVu
dG9yeSBsaWtlIENQVSwgbWVtb3J5IGFuZCBQQ0llIGRldmljZXMgc2luY2UgQk1DIG1heSBub3Qg
YWx3YXlzIGhhdmUgcHJlc2VuY2UgcGlucyBmb3IgYWxsIGNvbXBvbmVudHMuICBGb3IgSVBNSSAs
IHdlIGhhdmUgU0RScyB0aGF0IGNhbiBiZSBwcm9ncmFtbWVkIHdpdGggY29ycmVjdCBTS1UgY29u
ZmlndXJhdGlvbnMuIEkgYW0gd29uZGVyaW5nIHdoYXQgaXMgc29sdXRpb24gZm9yIHJlZGZpc2gg
KGV4Y2VwdCBCSU9TIHNlbmRpbmcgaW52ZW50b3J5IG9uIFVTQiBldGhlcm5ldCB1c2luZyByZWRm
aXNoKS4NClRoaXMgdmFyaWVzIHdpZGVseSBkZXBlbmRlbnQgb24gdGhlIGFyY2hpdGVjdHVyZS4g
IEkgY2FuIGFuc3dlciB0aGUgc3BlY2lmaWNzIGZvciB4ODYgc2VydmVycyBhbmQgc3lzdGVtcyB1
c2luZyBlbnRpdHktbWFuYWdlciwgYnV0IGluIHNob3J0LCB3aGF0ZXZlciBleGlzdHMgaW4gRGJ1
cyB3aXRoIHRoZSBjb3JyZWN0IGludGVyZmFjZXMgaXMgcG9wdWxhdGVkIGluIFJlZGZpc2guDQoN
Cj4gDQo+IFBsYXRmb3JtIGludmVudG9yeSBpbmNsdWRlcw0KPiANCj4gMS4gTnVtYmVyIG9mIGhv
c3QgQ1BVcyBhbmQgdHlwZSBvZiBDUFVzDQoNClRoaXMgaXMgbWFuYWdlZCBvdmVyIGEgY29tYmlu
YXRpb24gb2YgUEVDSSBhbmQgU01CSU9TL01EUiB0YWJsZXMuICBQRUNJIGNhbiBpbnRlcnJvZ2F0
ZSB0aGUgQ1BVIGRpcmVjdGx5LiAgU01CSU9TIGhhcyBtb3JlIGRldGFpbGVkIGluZm9ybWF0aW9u
Lg0KDQo+IDIuIE51bWJlciBvZiBtZW1vcnkgYW5kIHR5cGVzIG9mIG1lbW9yeQ0KU2FtZSBhbnN3
ZXIgYXMgQ1BVLiAgUEVDSSBhbGxvd3MgdXMgdG8gZ2V0IGludmVudG9yeSBjb3VudHMsIHByZXNl
bmNlLCBhbmQgdGVtcGVyYXR1cmVzLiAgU01CSU9TIGFsbG93cyB1cyB0byBnZXQgbW9yZSBkZXRh
aWxlZCBpbmZvcm1hdGlvbiBvbiB0eXBlcywgdGltaW5ncywgYW5kIGludmVudG9yeSBpbmZvcm1h
dGlvbi4NCg0KPiAzLiBJTyBleHBhbmRlciBjYXJkcw0KVGhpcyBpcyBkb25lIG92ZXIgU21idXMu
ICBPbiBXb2xmIFBhc3MsIHdlIHVzZSB0aGUgRnJ1RGV2aWNlIGFwcGxpY2F0aW9uIGhlcmUsIHdo
aWNoIHNjYW5zIGFsbCBidXNzZXMgZm9yIHZhbGlkIEZSVXMuDQpodHRwczovL25hbTA2LnNhZmVs
aW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZnaXRodWIuY29t
JTJGb3BlbmJtYyUyRmVudGl0eS1tYW5hZ2VyJTJGYmxvYiUyRm1hc3RlciUyRnNyYyUyRkZydURl
dmljZS5jcHAmYW1wO2RhdGE9MDIlN0MwMSU3Q25lbGFkayU0MG1pY3Jvc29mdC5jb20lN0NmOTQz
N2NlY2Y4MWM0OWQ0NzM1YzA4ZDZmMGY0NzgxOCU3QzcyZjk4OGJmODZmMTQxYWY5MWFiMmQ3Y2Qw
MTFkYjQ3JTdDMSU3QzAlN0M2MzY5NjEzMzAxMTI4MDMzMDMmYW1wO3NkYXRhPWhvZ3A0diUyRjNl
NTJjbDRMOW9FZiUyRmRpOUN0d2FqUEQ4dFdXU25nakVjUTA4JTNEJmFtcDtyZXNlcnZlZD0wDQoN
Cj4gNC4gU01CVVMgZGV2aWNlcyBvbiBQQ0kgY2FyZHMNCg0KU2FtZSBhbnN3ZXIgYXMgSU8gZXhw
YW5kZXJzLiAgV2UgY2hlY2sgZm9yIGEgdmFsaWQgRlJVLCBvbmNlIHdlIGZpbmQgaXQsIHdlIGNo
ZWNrIHRvIHNlZSBpZiBpdCdzIGEgY2FyZCB3ZSB1bmRlcnN0YW5kIHRoZSB0b3BvbG9neSBvZiwg
YnkgaW5zdGFudGlhdGluZyBhbiBpbnN0YW5jZSBvZiBhIGNvbmZpZyBmaWxlIGxpa2UgdGhpczoN
Cmh0dHBzOi8vbmFtMDYuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRw
cyUzQSUyRiUyRmdpdGh1Yi5jb20lMkZvcGVuYm1jJTJGZW50aXR5LW1hbmFnZXIlMkZibG9iJTJG
bWFzdGVyJTJGY29uZmlndXJhdGlvbnMlMkZBWFgxUDEwMEhTU0lfQUlDLmpzb24mYW1wO2RhdGE9
MDIlN0MwMSU3Q25lbGFkayU0MG1pY3Jvc29mdC5jb20lN0NmOTQzN2NlY2Y4MWM0OWQ0NzM1YzA4
ZDZmMGY0NzgxOCU3QzcyZjk4OGJmODZmMTQxYWY5MWFiMmQ3Y2QwMTFkYjQ3JTdDMSU3QzAlN0M2
MzY5NjEzMzAxMTI4MDMzMDMmYW1wO3NkYXRhPXFtVGhXV0o3UDFFNEpraUpQbUxFS2pac21hTmpQ
JTJGektvbUdFdnV0M2g5MCUzRCZhbXA7cmVzZXJ2ZWQ9MA0KDQpNb3N0IGNhcmRzIGtleSBvZmYg
dGhlIHByb2R1Y3QgbmFtZSBmaWVsZCBpbiB0aGUgYm9hcmQgc2VjdGlvbiwgYnV0IHRoZXJlIGFy
ZSB3YXlzIHRvIGtleSBvZmYgb2Ygb3RoZXIgZmllbGRzIGFzIHdlbGwuDQoNCkF0IHRoZSBlbmQg
b2YgdGhlIGRheSB0aGUgInByb2JlIiBzdGF0ZW1lbnQgaW4gZW50aXR5IG1hbmFnZXIgaXMganVz
dCBhIGRidXMgbWF0Y2gsIHNvIGlmIHlvdXIgcGxhdGZvcm0gaGFzIGEgZGlmZmVyZW50IHdheSB0
byBpZGVudGlmeWluZyBhICJjYXJkIGlzIHByZXNlbnQiIGp1c3QgbWFrZSB0aGF0IGRhdGEgYXZh
aWxhYmxlIG9uIGRidXMsIGFuZCBhZGQgYW4gYXBwcm9wcmlhdGUgbWF0Y2ggdG8gZW50aXR5IG1h
bmFnZXIuDQoNCj4gDQo+IFRoYW5rcw0KPiBOZWVyYWoNCj4gDQo=
