Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3409510C413
	for <lists+openbmc@lfdr.de>; Thu, 28 Nov 2019 07:42:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Np3f5hXTzDqwp
	for <lists+openbmc@lfdr.de>; Thu, 28 Nov 2019 17:42:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vertiv.com (client-ip=40.107.70.64;
 helo=nam04-sn1-obe.outbound.protection.outlook.com;
 envelope-from=troy.lee@vertiv.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=vertiv.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=vertivco.onmicrosoft.com
 header.i=@vertivco.onmicrosoft.com header.b="OUXOCHzc"; 
 dkim-atps=neutral
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700064.outbound.protection.outlook.com [40.107.70.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Np2p1gHSzDqsX
 for <openbmc@lists.ozlabs.org>; Thu, 28 Nov 2019 17:41:51 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dJWrSvLJ/iUdiggU+psKDe6cQA5QZLQ0eR0c/f+MMNRWbNvunvSXA9YdBGTTAMBz2VnLGNmk8Tpf9TOfkGEndUOH6Hc4/vRVdIFvVDe8tm8yK7ZwQJvDYEEkEjrFgDmEBwL+q70GgDiRIyFVqOJ4AGB4Ygrnm/eYsGj+Ei5nkqc/p4kGfBGdGCpAvMUV/Jb4FPPKaetP+KFLLuu2f7YVWZffK0JSMcsjJaMLimXDghRav+VLhy0cL0684PCqSyLA9LBeTNPkkB3zZLOl3nOf+ZWNoO3HhQjioNsmCAMt5ZibssTz5qmvGY3cbelEQqC0B28vrc7mBDtW0ZIyAqq/YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xm2ZwN+dkinp1zJSjE2ohNyafLcJ1+aktZIJjDx38J4=;
 b=lVvhGo/jggTxQmntNqpuCjyDJVm3khBo0ylFvZMuKQWLFH7OHX4PWZ3a9781k/OvOrmTRpnB00nXUyVHEbsrido6mSSBaQKs8T9qbQMEw6rRaEh7FC/8z13mjSq/Aik7sFIW44pG0VVU+fADfGDkwjsk3faYCi0v0eFVtBAWiZKYoaLUX6BDSNlq8iBu/YLEdtFz+vfyBYJJlVjlfphL0vPJfWpt0h9u6b5seJAHWPn1NoLZnKBHumgaKuXijLBqOTdhPqkUK2Axhv7jP45I96K0feFSt+P0CNf+vTNBmUaG3UR+Rm6oV+Isbs98C+kJxwvQ+wG+f7UAIXMYKOt0Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vertiv.com; dmarc=pass action=none header.from=vertiv.com;
 dkim=pass header.d=vertiv.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vertivco.onmicrosoft.com; s=selector2-vertivco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xm2ZwN+dkinp1zJSjE2ohNyafLcJ1+aktZIJjDx38J4=;
 b=OUXOCHzc/It5CHbaEiAH7JbwC7dESHzXO/Oh32Z9/VmQQ3hFxBSxvpFHqqKJqSEuwAsEVC5CkULSDaBVvXLdGNrG7pAWI2x21IU0ioTpWeWJKoYtjngelPfuJ8qg87QUNVX6eZYfmvQEgmr/goIKteJEagwCXniqYnj09OC3JlI=
Received: from MWHPR13MB1360.namprd13.prod.outlook.com (10.173.120.8) by
 MWHPR13MB1757.namprd13.prod.outlook.com (10.171.146.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.12; Thu, 28 Nov 2019 06:41:46 +0000
Received: from MWHPR13MB1360.namprd13.prod.outlook.com
 ([fe80::69c2:8f3:259c:3fd5]) by MWHPR13MB1360.namprd13.prod.outlook.com
 ([fe80::69c2:8f3:259c:3fd5%11]) with mapi id 15.20.2495.014; Thu, 28 Nov 2019
 06:41:46 +0000
From: "Troy.Lee@vertiv.com" <Troy.Lee@vertiv.com>
To: James Feist <james.feist@linux.intel.com>, Brad Bishop
 <bradleyb@fuzziesquirrel.com>
Subject: RE: [ExternalEmail] Re: guidelines on new entity-manager classes
Thread-Topic: [ExternalEmail] Re: guidelines on new entity-manager classes
Thread-Index: AQHVpH8DigESCsy/pU2gby9fbp2VpKegI1EA
Date: Thu, 28 Nov 2019 06:41:45 +0000
Message-ID: <MWHPR13MB136077B46142D54C6B036A60ED470@MWHPR13MB1360.namprd13.prod.outlook.com>
References: <FB1DE03E-092D-41CB-A655-56EFCE849E47@fuzziesquirrel.com>
 <4e265913-0704-8438-3f37-389063b235b9@linux.intel.com>
In-Reply-To: <4e265913-0704-8438-3f37-389063b235b9@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Troy.Lee@vertiv.com; 
x-originating-ip: [103.83.160.36]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b55f3db-29a4-42a9-f770-08d773ce09d6
x-ms-traffictypediagnostic: MWHPR13MB1757:
x-microsoft-antispam-prvs: <MWHPR13MB1757AF1D252014A8630D38F8ED470@MWHPR13MB1757.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0235CBE7D0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(346002)(366004)(136003)(376002)(13464003)(189003)(199004)(11346002)(66066001)(4326008)(26005)(55016002)(9686003)(6306002)(6436002)(6246003)(446003)(256004)(14444005)(186003)(229853002)(6506007)(53546011)(102836004)(76176011)(7696005)(2906002)(7736002)(86362001)(305945005)(71200400001)(71190400001)(3846002)(52536014)(5660300002)(99286004)(33656002)(6116002)(316002)(110136005)(54906003)(66556008)(66946007)(66476007)(478600001)(66446008)(74316002)(64756008)(76116006)(8936002)(8676002)(25786009)(81156014)(81166006)(966005)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR13MB1757;
 H:MWHPR13MB1360.namprd13.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vertiv.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3cTKmjQ6Wvwv++lsF65KDZYbYBw5p6NhXzdBJCyFW7T2ipNhgPok4v1wt8ynpJOEBRHaC3DNlWM2UONmvi3MHb9TrUqUqLYyzzykwfsyLBxZCy/ihf6oGmM/sA68Fglnp+DadRCuZoJeqcP3z9dBjWxMz8mBpG1s8ZFiG4vpZ3XaU3S6HaQNnUfmOyxkp6J268L5MWjgl0mGQk+FMBo8Z06qto6c6wDoBVReuARAn+q3c22qtPk6BGceMl9T7vYBgx+6HwuSK+KMPsFauidi7vjJlkzxvumYJW0DqX1509fdB/W5fXaptaGmMHkWM8QPB9MpL+FLk+nKbpR2KW6IOz0oj8RMQ2SpsSHfasLKkciqTGlP7MgQaZZEBXHD1eyK1SjA/raUip0UYA3l+YftGchiKAFIDRZ35ioDQ8LubdG+/cwJM713oDyDFqiXg7m7X5uvebE5PhXj8ApTeldhGvOpEbr9VC0MNK2r2og8wHA=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vertiv.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b55f3db-29a4-42a9-f770-08d773ce09d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2019 06:41:45.7206 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 74fe92c5-ef57-4d1a-a0e7-9451117d9272
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T5vaNpPjqyN/EBnYwSF95w7kOZmjOjqLooCcvwE+/RroGGETFPLwnGLGLco2xFs4eGpr3Wgz85K8iI4zaNx55Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR13MB1757
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
Cc: Shawn McCarney <shawnmm@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgSmFtZXMsDQoNCklzIHRoZXJlIGEgY21ha2Ugb3B0aW9uIHRvIE5PVCBpbnN0YWxsIGVudGl0
eS1tYW5hZ2VyL2NvbmZpZ3VyYXRpb25zPw0KSXQgd291bGQgYmUgZWFzaWVyIGZvciB2ZW5kb3Jz
IHRvIGluc3RhbGwgdGhlaXIgb3duIGNvbmZpZ3VyYXRpb25zLg0KDQpUaGFua3MsDQpUcm95IExl
ZQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogb3BlbmJtYyA8b3BlbmJtYy1i
b3VuY2VzK3Ryb3kubGVlPXZlcnRpdi5jb21AbGlzdHMub3psYWJzLm9yZz4gT24gQmVoYWxmIE9m
IEphbWVzIEZlaXN0DQpTZW50OiBXZWRuZXNkYXksIE5vdmVtYmVyIDI3LCAyMDE5IDE6MjkgQU0N
ClRvOiBCcmFkIEJpc2hvcCA8YnJhZGxleWJAZnV6emllc3F1aXJyZWwuY29tPg0KQ2M6IFNoYXdu
IE1jQ2FybmV5IDxzaGF3bm1tQGxpbnV4LnZuZXQuaWJtLmNvbT47IE9wZW5CTUMgTWFpbGxpc3Qg
PG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NClN1YmplY3Q6IFtFeHRlcm5hbEVtYWlsXSBSZTog
Z3VpZGVsaW5lcyBvbiBuZXcgZW50aXR5LW1hbmFnZXIgY2xhc3Nlcw0KDQpPbiAxMS8yNS8xOSA1
OjAyIFBNLCBCcmFkIEJpc2hvcCB3cm90ZToNCj4gSGkgSmFtZXMNCj4NCj4gYW5vdGhlciBFTSBx
dWVzdGlvbiBmb3IgeW91Li4uDQo+DQo+IEFyZSB0aGVyZSBhbnkgZ3VpZGVsaW5lcyBvciBiZXN0
IHByYWN0aWNlcyBvbiB1cHN0cmVhbWluZyBFTSBjb25maWd1cmF0aW9ucz8gIFB1dCBhbm90aGVy
IHdheSwgaWYgSSB3YW50ZWQgdG8gZW5zdXJlIHRoYXQgeW91IHdvdWxkIGFjY2VwdCBteSBjb25m
aWd1cmF0aW9ucyB3aXRoIG5ldyB0eXBlcyBvciBjbGFzc2VzIChlLmcuIFBpZCwgQURDLCBldGMu
LiksIHdoYXQgd291bGQgSSBuZWVkIHRvIGRvIHVwIGZyb250IHRvIG1ha2UgdGhhdCBwcm9jZXNz
IGFzIHNtb290aCBhcyBpdCBjYW4gYmU/DQoNCkVNIGNvbmZpZ3VyYXRpb25zIGFyZSBtZWFudCB0
byBiZSBmbGV4aWJsZSwgYW5kIGFzIGxvbmcgYXMgdGhlIGRhZW1vbiB1bmRlcnN0YW5kcyBpdCwg
YW5kIHRoZSBUeXBlIGlzIHVuaXF1ZSwgdGhlcmUgc2hvdWxkbid0IGJlIGFueSBpc3N1ZXMuDQpU
aGVyZSBpcyBhIHNjcmlwdCBoZXJlIHRvIG1ha2UgaXQgYSBiaXQgbW9yZSBwcmV0dHkgdGhhdCBD
SSB3aWxsIGZhaWwgaWYgaXQgaXMgbm90IHJhbiBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9l
bnRpdHktbWFuYWdlci9ibG9iL21hc3Rlci9zY3JpcHRzL2F1dG9qc29uLnB5Lg0KVGhlIG9ubHkg
cmVhbCB0aGluZ3MgdGhhdCBibG9jayBjb25maWd1cmF0aW9uIHJldmlld3MgYXJlIHRoaW5ncyB0
aGF0IGNhbiBtYWtlIHRoZW0gc2hvcnRlciAodXNpbmcgdGhlIHRlbXBsYXRlIHN0dWZmIHdoZW4g
cG9zc2libGUpLiBCdXQgYXMgdGhleSBhcmUgcGVyIHZlbmRvciwgSSBub3JtYWxseSBsZXQgZWFj
aCB2ZW5kb3Igb3duIHRoZWlyIG93biBkZXN0aW55IHdpdGggdGhlIGZpbGVzLg0KDQpUaGVyZSBp
cyBhIGpzb24gc2NoZW1hDQpodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9lbnRpdHktbWFuYWdl
ci9ibG9iL21hc3Rlci9zY2hlbWFzL2dsb2JhbC5qc29uDQp0aGF0IEkgZXZlbnR1YWxseSBoYXZl
IHRoZSBkcmVhbSBvZiBjcmVhdGluZyBhIHNjcmlwdCB0byBnZW5lcmF0ZSBhIHNjaGVtYSBmb3Ig
ZXZlcnkgY2hlY2tlZC1pbiBUeXBlLCBidXQgSSdtIG5vdCB0aGVyZSB5ZXQuDQoNCi1KYW1lcw0K
DQo+DQo+IHRoeCAtIGJyYWQNCj4NCkNPTkZJREVOVElBTElUWSBOT1RJQ0U6IFRoaXMgZS1tYWls
IGFuZCBhbnkgZmlsZXMgdHJhbnNtaXR0ZWQgd2l0aCBpdCBhcmUgaW50ZW5kZWQgc29sZWx5IGZv
ciB0aGUgdXNlIG9mIHRoZSBpbmRpdmlkdWFsIG9yIGVudGl0eSB0byB3aG9tIHRoZXkgYXJlIGFk
ZHJlc3NlZCBhbmQgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIGFuZCBwcml2aWxlZ2VkIGluZm9y
bWF0aW9uIHByb3RlY3RlZCBieSBsYXcuIElmIHlvdSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBl
cnJvciwgYW55IHJldmlldywgdXNlLCBkaXNzZW1pbmF0aW9uLCBkaXN0cmlidXRpb24sIG9yIGNv
cHlpbmcgb2YgdGhlIGUtbWFpbCBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLiBQbGVhc2Ugbm90aWZ5
IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYnkgcmV0dXJuIGUtbWFpbCBhbmQgZGVsZXRlIGFsbCBj
b3BpZXMgZnJvbSB5b3VyIHN5c3RlbS4NCg==
