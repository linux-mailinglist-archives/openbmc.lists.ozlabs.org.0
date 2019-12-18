Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D6875124038
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 08:21:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47d5zj0ld9zDqc9
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 18:21:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=40.107.77.103;
 helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="UNvGjDpI"; dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770103.outbound.protection.outlook.com [40.107.77.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47d5w401VVzDqVr
 for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2019 18:18:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPQ/K1E3eLkI0U8nHwyxWLHDMjV8C/HphkNAj11UF/Q2QOcRHSsK8OkdBPyR+2A+TFe+sY8tF3Yq25U8oLJmm5DQcg5Zkx4pbgaAY3N0Npw0E0WrV+xQ1KjMtRCdaCJIzIOcBJytAlU371GPqUMQ8HVk4HpWSYtSfndBWD+pf9GFk4XGLNdyN25IfPx7MUASDtnxalItUIcTaaxqIE+XobHlqi+wyh+Pd2CG3miC7iZ5HoYe5tnFIREBaYM57cIGYbqcmPo982jfEoY4wfM7wL+lrK35cu7hBrJORb1vROJswlK+MaGue1sCos0mQ9i1aLl9pO0V7sqSnuaqQYs2UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b00mMngnBYGgUqjFBPdbsvP997ubjYs769lQG0fUkxo=;
 b=NsTelvXODr7DOvq3+XuivvvTsI2gySvugwgitaR1FE0BUsSKZh7JkPCQzzYwWgRPE7liYVBV7MouhVFg8cL+P6zG5dKWtCO+7Ywq3WdWDdUDTzhqF2B9KvrcX4N7DQT2FUUbm8a4MWdT4RcbCge7fbEISE6XPVSOXeVcqWGf7eT0dqWSYK9FvGVI/ZlQ5wIBfBWbazIIy6emNrlWjzWxFFsMORFyXJQMnc+iiAkR02pS5WFe48nOwuP+HLbo5rhv+ygbTBNr9YN8JTQpKFrJ6pLGzhacrSwQGWRQHtK4UiwH9iCXYVIgEwWA9jVK/kGawtUgxcAbt4+u1F+BEayMXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b00mMngnBYGgUqjFBPdbsvP997ubjYs769lQG0fUkxo=;
 b=UNvGjDpIBeLYnxV2VkoKkQCAReR9ahHAYNyNDQjAqdVpgCuxYWOx5i2TB8bsw7GOFUPr6p/HJQj3baxxPQY9zEb8hOVn/ha5QUkpXcZ/i2Ymq8F4pCfT72l33+lk+/BVqdz46BcSSpgDHn7MeX841EPL/v1BseaXVlo8owfTICU=
Received: from DM6PR21MB1388.namprd21.prod.outlook.com (20.180.21.213) by
 DM6SPR01MB0102.namprd21.prod.outlook.com (20.180.57.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.4; Wed, 18 Dec 2019 07:18:37 +0000
Received: from DM6PR21MB1388.namprd21.prod.outlook.com
 ([fe80::b49e:1e60:52e0:69cf]) by DM6PR21MB1388.namprd21.prod.outlook.com
 ([fe80::b49e:1e60:52e0:69cf%6]) with mapi id 15.20.2581.001; Wed, 18 Dec 2019
 07:18:37 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: RE: [EXTERNAL] how to get pci config space
Thread-Topic: [EXTERNAL] how to get pci config space
Thread-Index: AQHVtPhoFm1LEaTOGUCqyx7AUYNegKe+tCuwgAA63gCAAImDUA==
Date: Wed, 18 Dec 2019 07:18:36 +0000
Message-ID: <DM6PR21MB138892F44E5B77CCE63F83D4C8530@DM6PR21MB1388.namprd21.prod.outlook.com>
References: <584F7181-73DB-4090-93D7-87E0E7408F20@fuzziesquirrel.com>
 <DM6PR21MB1388CB8A990972BA09EB5163C8500@DM6PR21MB1388.namprd21.prod.outlook.com>
 <3718EF06-C5DE-4D3D-B2B1-548FEF5A1919@fuzziesquirrel.com>
In-Reply-To: <3718EF06-C5DE-4D3D-B2B1-548FEF5A1919@fuzziesquirrel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=neladk@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-12-18T07:18:35.2958841Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=17d48560-7d7c-471e-89d7-82b56289c3b9;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [50.35.81.9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a5a7f42e-47de-4a71-ddf5-08d7838a7fdf
x-ms-traffictypediagnostic: DM6SPR01MB0102:
x-microsoft-antispam-prvs: <DM6SPR01MB0102EACB86CF935DD0750D35C8530@DM6SPR01MB0102.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0255DF69B9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(396003)(39860400002)(136003)(376002)(366004)(13464003)(51914003)(199004)(189003)(186003)(66946007)(64756008)(66556008)(10290500003)(66446008)(5660300002)(81156014)(7696005)(8676002)(66476007)(8936002)(76116006)(81166006)(26005)(4326008)(53546011)(6506007)(8990500004)(9686003)(55016002)(66574012)(71200400001)(478600001)(2906002)(6916009)(86362001)(316002)(52536014)(33656002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6SPR01MB0102;
 H:DM6PR21MB1388.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S7LrvVYWmz1PaWRj2PBLJZ7tjNizwuscyVkDUiej7nJdoG9aBAJVgXLrNElPwqSYNSm+jnYMWLUEULRLGObsPXZ2o1Jexh4KPJgQnY0r2oLAQ+zN6KRL7S3LKQeDsLIimQr9N3O+rtY5e32JMVaMDYhJW1Cwq7incRnkYwX9gd+ADYOjjU0IwWvC/WvTHS+/+Z3WT09TnCR3VhzspHhzs9L6t86EfbZf7Qg5mzLZosiwLlIZfgNDMNw9OmeGiHvZ5ZBotZMPxqQ8FDMFWfqeyTcE8gxMTyBzNLZsFBBeoDPEYXvi4enjPcbhcplEQ49Gwqu0fIx7qCcx4gsVUzBzHuSt1wUEuPqbZO+KeTIlxhKlabHlTkeWhdUn9Ma/ei1k9y21fjzeQuWroWJt0IsrMY9fApsPHVZO3Vtvg3EBQW5haa2qelzR2WnMleoMwyTp9jywDYbPKh3yFIzjp3+lCXvynLUV9zZYgkB1i/HJefKyUqN47OkU1+H4Qx4aQb9iBQHwDrwwRw4u9zuEqnZxiQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5a7f42e-47de-4a71-ddf5-08d7838a7fdf
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2019 07:18:37.0019 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5XG/OGaQi/OE/YUeMdpbP3oW3dNo9jPlz8DM6cTz6BXZ/dAOhcEhxdVinYagZE25sDz9DMiLITz7HS/QDC34mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6SPR01MB0102
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

SU1PLCB3ZSBvbmx5IG5lZWQgRGV2aWNlSUQgYW5kIFZlbmRvcklEIGZpZWxkcyBmcm9tIFBDSWUg
Q29uZmlnIHNwYWNlIGFuZCB3ZSBjYW4gbGV0IHN5c3RlbSBmaXJtd2FyZSBzZW5kIHRoaXMgaW5m
b3JtYXRpb24gZHVyaW5nIGJvb3Qgb3IgcHJlcHJvZ3JhbSB0aGUgaW5mb3JtYXRpb24gdG8gQk1D
IHVzaW5nIEVudGl0eU1hbmFnZXIuIA0KDQpSZWdhcmRpbmcgQk1DLUNQVSh2aWEgUEVDSSksIEJN
QyBuZWVkcyB0byBzZW5kIFBFQ0kgY29tbWFuZCB0byBDUFUuIENQVSBzaG91bGQgc3VwcG9ydCBS
ZFBDSUNmZyBhcyBzdXBwb3J0ZWQgUEVDSSBjb21tYW5kIGFuZCB0aHVzIHJlc3BvbmQgd2l0aCBk
YXRhLg0KDQpOZWVyYWoNCg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQnJh
ZCBCaXNob3AgPGJyYWRsZXliQGZ1enppZXNxdWlycmVsLmNvbT4gDQpTZW50OiBUdWVzZGF5LCBE
ZWNlbWJlciAxNywgMjAxOSAyOjUxIFBNDQpUbzogTmVlcmFqIExhZGthbmkgPG5lbGFka0BtaWNy
b3NvZnQuY29tPg0KQ2M6IE9wZW5CTUMgTWFpbGxpc3QgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9y
Zz4NClN1YmplY3Q6IFJlOiBbRVhURVJOQUxdIGhvdyB0byBnZXQgcGNpIGNvbmZpZyBzcGFjZQ0K
DQpUaGFua3MgZm9yIHRoZSByZXBseSBOZWVyYWohDQoNCj4gT24gRGVjIDE3LCAyMDE5LCBhdCA0
OjE1IFBNLCBOZWVyYWogTGFka2FuaSA8bmVsYWRrQG1pY3Jvc29mdC5jb20+IHdyb3RlOg0KPiAN
Cj4gSXMgdGhlcmUgYW55IGJyb2FkZXIgdXNlIGNhc2UgZm9yIHRoaXM/DQoNCkkgd2FudCB0byBy
ZXBvcnQgbWZnL21vZGVsL3BuL3NuIGZvciBwY2llIGRldmljZXMgdmlhIHRoZSBwY2llZGV2aWNl
IFJlZGZpc2ggc2NoZW1hLiAgSSBhc3N1bWVkIHRoZSBjb25maWcgc3BhY2UgaXMgd2hlcmUgdGhp
cyBpbmZvcm1hdGlvbiB3b3VsZCBvcmlnaW5hdGUuICBHb29kIGFzc3VtcHRpb24/DQoNCknigJlt
IGFsc28gYXdhcmUgb2YgYSBuZWVkIHRvIGR5bmFtaWNhbGx5IHR1bmUgZmFuIGNvbnRyb2wgcGFy
YW1ldGVycyB3aGVuIGNhcmRzIHRoYXQgYXJlIGtub3duIHRvIHJ1biBob3QgYXJlIGluc3RhbGxl
ZC4gIEFyZSB0aGVyZSBiZXR0ZXIgd2F5cyB0byBkbyBzb21ldGhpbmcgbGlrZSB0aGlzPw0KDQo+
IEkgYW0gbm90IHN1cmUgb24gUG93ZXINCg0KU2ltaWxhciB0byBQRUNJIHdlIGhhdmUgc29tZXRo
aW5nIGNhbGxlZCBGU0kuDQoNCj4gYnV0IG9uIHg4NiBpdCByZWFsbHkgZGVwZW5kcyBvbiBob3cg
dGhlIENQVSBQRUNJIGlzIHJvdXRlciB0byBCTUMuIElmIGl0cyB3aXJlZCB0byBNRSB0aGVuIEJN
Qy0+TUUtPkNQVSggdmlhIFBFQ0kgb3ZlciBETUkgb3Igc2VyaWFsIFBFQ0kpIGJ1dCBpZiBpdHMg
d2lyZWQgdG8gQ1BVIHRoZW4gQk1DLT5DUFUoIHZpYSBzZXJpYWwgUEVDSSkuIA0KDQpUaGlzIGhl
bHBzLCB0aGFua3MuICBJZiB3ZSBhc3N1bWUgdGhlIHNlY29uZCBjYXNlIGZvciBhIG1vbWVudCAt
IGlzIHRoZSBlbnRpcmUgcGF0aCBpbiBoYXJkd2FyZT8gLSBlLmcuIGRvZXMgUEVDSSBnaXZlIHRo
ZSBCTUMgZGlyZWN0IGFjY2VzcyB0byB0aGUgYWRkcmVzcyBzcGFjZSBhbmQgdGhlIEJNQyBqdXN0
IHJlYWRzIGl0PyAgT3IgaXMgdGhlcmUgYSBtZXNzYWdlIHBhc3NpbmcgaW50ZXJmYWNlPw0KDQp0
aHggLSBicmFkDQo=
