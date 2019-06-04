Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD52333FF3
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 09:21:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45J3Hw2zwrzDqRX
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 17:21:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=40.107.68.114; helo=nam04-bn3-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="jyb9lKh8"; dkim-atps=neutral
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680114.outbound.protection.outlook.com [40.107.68.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45J3HP6L0vzDqMn
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jun 2019 17:20:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=aMkLFV28zmgCcGwAknGUFPAU3UP+Ju8RY5d707RqxRXQRDvvqCY3RiXpl3uWeIoD7jAUHq7NEYqQ4rJwsZwXpit4InmSRLhC+015DYUeaeQ40CeYDqb9E/8C3pXIxh3SZMLgh8fa5TyGsEf8fdiJJbsLYgVsE/oQ+uWzQ8uTCTc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PoUx7IVbHjMU7KWzeYDwfN0ZoBjYBZf37gG7wADMWG4=;
 b=JArglu1uSjYsfSNn3uZd8Sek0CCjwtkQieDotwwEWcb5Q1+xTFpH6d9kLmUyslCKDOQDJtmeMtqenxcotxaKKogcVIcgnNU4+gc73kULePScizgz0vf1gcT7FJ2jNaKbU1m0w0+ayoYivUt+GTRoshvNZNjPevmH9SsYpMERM04=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PoUx7IVbHjMU7KWzeYDwfN0ZoBjYBZf37gG7wADMWG4=;
 b=jyb9lKh8f2e2t23EJxYK9Z+YwP4WlBryQkyFd6s66WcKctDyT7DPmFZuGfC2+Yfk7rhtVDdPegiyeLpEmx6DdYnPovvm+p61Ma2SBS8CIBmNAcABRbmgNtz2I68GZjPBDOt5/LGCaV1H6Vc63AN6VXeeBGgLGEw9RtjKECmstEc=
Received: from BL0PR2101MB0932.namprd21.prod.outlook.com
 (2603:10b6:207:30::20) by BL0PR2101MB0963.namprd21.prod.outlook.com
 (2603:10b6:207:30::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1987.2; Tue, 4 Jun
 2019 07:20:42 +0000
Received: from BL0PR2101MB0932.namprd21.prod.outlook.com
 ([fe80::1072:430b:60ef:aaae]) by BL0PR2101MB0932.namprd21.prod.outlook.com
 ([fe80::1072:430b:60ef:aaae%4]) with mapi id 15.20.1987.003; Tue, 4 Jun 2019
 07:20:42 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: Lei YU <mine260309@gmail.com>
Subject: RE: [Design] PSU firmware update
Thread-Topic: [Design] PSU firmware update
Thread-Index: AQHVGeoAPR6UDQTsDUiPZ/ien9Yqe6aJ7ZyAgAA1nrCAAKuwgIAAPDzwgAAH6YCAAAPv4A==
Date: Tue, 4 Jun 2019 07:20:42 +0000
Message-ID: <BL0PR2101MB093290620CCB70D2911D6407C8150@BL0PR2101MB0932.namprd21.prod.outlook.com>
References: <CAARXrt=6mZtVuwdTxamjUWXJk5RXNKaNM9aVZE5nEyTjowVjEQ@mail.gmail.com>
 <CALLMt=pdm=Nk5sCZvZBORb+N5suT7-FK0xbvWUy3Qxg5KcttKA@mail.gmail.com>
 <BL0PR2101MB09320BD7856E280C04852CB1C8140@BL0PR2101MB0932.namprd21.prod.outlook.com>
 <CAARXrtnJ1SsSVb2Y=5tvVVQtOouUpmZR4XoY4p=vhgizHmh4hA@mail.gmail.com>
 <BL0PR2101MB09326C07D2FFA072FB19CEC7C8150@BL0PR2101MB0932.namprd21.prod.outlook.com>
 <CAARXrtmyU41PvzuqM91f+N-YTaovy_MP4aDY=+W=P6Be2n=-EQ@mail.gmail.com>
In-Reply-To: <CAARXrtmyU41PvzuqM91f+N-YTaovy_MP4aDY=+W=P6Be2n=-EQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=neladk@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-06-04T07:20:40.3911484Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=d062da80-3bf3-4eae-9866-6a2823e5f9a3;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [50.47.128.230]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fbb7fc7f-316a-4e38-04f8-08d6e8bd2750
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR2101MB0963; 
x-ms-traffictypediagnostic: BL0PR2101MB0963:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BL0PR2101MB0963004BA92C844E57DC6D68C8150@BL0PR2101MB0963.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(39860400002)(346002)(376002)(396003)(366004)(189003)(199004)(13464003)(55016002)(26005)(316002)(476003)(52396003)(2906002)(186003)(6306002)(54906003)(7696005)(446003)(22452003)(15650500001)(99286004)(6506007)(53546011)(9686003)(486006)(33656002)(74316002)(102836004)(11346002)(76176011)(66066001)(256004)(14444005)(71190400001)(71200400001)(6116002)(229853002)(3846002)(305945005)(7736002)(6436002)(53936002)(10090500001)(6246003)(8936002)(6916009)(14454004)(86362001)(5660300002)(68736007)(76116006)(81156014)(8990500004)(52536014)(81166006)(73956011)(66946007)(66556008)(64756008)(66446008)(66476007)(8676002)(478600001)(10290500003)(25786009)(1411001)(966005)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BL0PR2101MB0963;
 H:BL0PR2101MB0932.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4OR++Sht97co7cwKfJZHBqXEOML0LPJMIJ1mN5tAkQ5cu+fPm8ve6HSNb7ehUC1opiq7iIkC1sO/Rx5fpw8j/9uchxoGcj3GAYbP3J6O8c5zYvreh9YQ3zgcqfIXuDP73gVI2Ji+Mwlc83GZOCCeTUbYPB1Bm+Oyl8Fp8xkxRTDg6kFMQz0O98fDr2k2j53zRXdWol1NYrW9iBQ/IyaAAWIA9j28FiCatEvhgbOgenREdx7ETF3KFDLqR6aJ/u75Hu/INQM3CuoaWZFa787KfRwAyC8lnr3sTzwUwdxS/N/i854Joj7KwLr3uOYhPiZjdpbdCIE9XmTxdx+FvVvs5Rmp765zf98DKIN0URs9jH48b2DFFO8crh33noh9yTmR/m9i1wIpn5DyhjP3Wkg28RG6NQNCiTK2idwXYX4PP1I=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbb7fc7f-316a-4e38-04f8-08d6e8bd2750
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 07:20:42.3823 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: neladk@microsoft.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR2101MB0963
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

WWVzLCBmb3IgQ2xvdWQgSW5mcmEgdXNlIGNhc2VzLCBhbGwgZmlybXdhcmUgdXBkYXRlcyBuZWVk
cyB0byBiZSBsaXZlIGFuZCBpbXBhY3QgbGVzcy4gQW55IHRob3VnaHRzIG9uIGhvdyB0aGlzIGNh
biBiZSBleHRlbmRlZCB0byBJUE1JID8gDQoNCk5lZXJhag0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogTGVpIFlVIDxtaW5lMjYwMzA5QGdtYWlsLmNvbT4gDQpTZW50OiBUdWVz
ZGF5LCBKdW5lIDQsIDIwMTkgMTI6MDIgQU0NClRvOiBOZWVyYWogTGFka2FuaSA8bmVsYWRrQG1p
Y3Jvc29mdC5jb20+DQpDYzogQW5kcmV3IEdlaXNzbGVyIDxnZWlzc29uYXRvckBnbWFpbC5jb20+
OyBPcGVuQk1DIE1haWxsaXN0IDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQpTdWJqZWN0OiBS
ZTogW0Rlc2lnbl0gUFNVIGZpcm13YXJlIHVwZGF0ZQ0KDQpPbiBUdWUsIEp1biA0LCAyMDE5IGF0
IDI6NDMgUE0gTmVlcmFqIExhZGthbmkgPG5lbGFka0BtaWNyb3NvZnQuY29tPiB3cm90ZToNCj4N
Cj4gQXJlIHlvdSBwcm9wb3NpbmcgdGhhdCBpZiBQU1UgRlcgaXMgYXR0ZW1wdGVkIGFuZCBpZiBz
eXN0ZW0gaXMgcG93ZXJlZCBvbiwgdGhlIEZXIHVwZGF0ZSB3aWxsIG5vdCBzdGFydD8NCg0KWWVz
LCBkbyBub3QgcGVyZm9ybSBQU1UgRlcgdXBkYXRlIHdoZW4gdGhlIHN5c3RlbSBpcyBwb3dlcmVk
IG9uLCBvdGhlcndpc2UsIGl0IGlzIGNvbnNpZGVyZWQgcmlza3kuDQoNCj4gV2Ugc2hvdWxkIG5v
dCB0aWUgZnJhbWV3b3JrIHdpdGggdGhlc2UgcmVxdWlyZW1lbnRzLiAgSWYgdGhpcyBpcyByZWFs
bHkgcmVxdWlyZWQgZm9yIGEgcGFydGljdWxhciBwbGF0Zm9ybSBkZXNpZ24gdGhlbiB2ZW5kb3Ig
c3BlY2lmaWMgdG9vbCBjYW4gaGF2ZSByaWdodCBjaGVja3MgYmVmb3JlIHRyaWdnZXJpbmcgdGhl
IHVwZGF0ZS4NCg0KVGhpcyBpcyBhIGdvb2QgcG9pbnQsIEkgd291bGQgbGlrZSB0byBrbm93IGlm
IHRoZXJlIGFyZSBjYXNlcyB0aGF0IHRoZSBQU1UgY291bGQgYmUgdXBkYXRlZCBzYWZlbHkgd2hp
bGUgdGhlIHN5c3RlbSBpcyBwb3dlcmVkIHVwLg0KSWYgdGhlcmUgYXJlIHJlYWxseSBzdWNoIGNh
c2VzLCB0aGVuIGl0J3MgdHJ1ZSB0aGUgZnJhbWV3b3JrIHNob3VsZCBub3QgcmVxdWlyZSB0aGlz
LCBhbmQgbGVhdmUgaXQgdG8gdmVuZG9yLXNwZWNpZmljIHRvb2xzLg0KDQo+IEFsc28gaG93IGRv
IHdlIHRpZSB0aGlzIHdpdGggSVBNST8gIEhvdyBkb2VzIHRoZSBwYXlsb2FkIHJlYWNoIEJNQyBh
bmQgSG93IGRvIHdlIGtub3cgcHJvZ3Jlc3Mgb2YgRlcgdXBkYXRlID8NCg0KVGhpcyBkZXNpZ24g
ZG9lcyBub3QgaW52b2x2ZSBJUE1JIGF0IGFsbC4gVGhlIHBheWxvYWQgaXMgdXBsb2FkZWQsIHBy
b2Nlc3NlZCwgYW5kIGFjdGl2YXRlZCBieSB0aGUgc2FtZSBpbnRlcmZhY2UgYXMgQk1DIGNvZGUg
dXBkYXRlLg0KU2VlIGRvYyBoZXJlOiBodHRwczovL25hbTA2LnNhZmVsaW5rcy5wcm90ZWN0aW9u
Lm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZnaXRodWIuY29tJTJGb3BlbmJtYyUyRmRv
Y3MlMkZibG9iJTJGbWFzdGVyJTJGY29kZS11cGRhdGUlMkZjb2RlLXVwZGF0ZS5tZCZhbXA7ZGF0
YT0wMiU3QzAxJTdDbmVsYWRrJTQwbWljcm9zb2Z0LmNvbSU3QzhjNTcwZGU1YWY5MzQ3ODZlNjVk
MDhkNmU4YmE5YzAyJTdDNzJmOTg4YmY4NmYxNDFhZjkxYWIyZDdjZDAxMWRiNDclN0MxJTdDMCU3
QzYzNjk1MjI4NTUxMDA5NDkyMSZhbXA7c2RhdGE9SDJ2OTg4JTJGZ3A1JTJGU2JwbjMzTEE3ZU9m
RTU1VDVkdU4lMkJBbDN5RHRjZktScyUzRCZhbXA7cmVzZXJ2ZWQ9MA0KU28geW91IGNvdWxkIHVz
ZSBSRVNUIEFQSXMgb3IgUmVkZmlzaCB0byBkbyB0aGUgUFNVIGNvZGUgdXBkYXRlLg0K
