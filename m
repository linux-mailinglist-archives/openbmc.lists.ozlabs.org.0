Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FE750439
	for <lists+openbmc@lfdr.de>; Mon, 24 Jun 2019 10:07:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45XMMs3tWhzDqSC
	for <lists+openbmc@lfdr.de>; Mon, 24 Jun 2019 18:07:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=40.107.70.121; helo=nam04-sn1-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="GJCXWn47"; dkim-atps=neutral
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700121.outbound.protection.outlook.com [40.107.70.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45XMM44Ym8zDqD2
 for <openbmc@lists.ozlabs.org>; Mon, 24 Jun 2019 18:06:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3cYQJpie4cZXHnyXUp6shmxqAZxWLGfJ/IichQV3ct2ajjkbHDzruUzMDY2qTsD6siaLMmTICaOxZA8Nk9MuqTfcWaXM6uVndKucs0rA/EP8BDyy1Eq3d6Vba11PlsCZ1whlVVEyCwS5siMRQJ7q5Q3bjxclhS3+/m3xo6NMTCzrx8j7Y9yKUIpoOucOemi9acJzMAIkdQV0Raz/p4XXgVnrF1Ge8kB1rhzloYUMlwo7i3/6r70kDgXhe9XpEEIQMMNQeylqAHsTKnU0n/4Ipu7CmyhdrXn5L+U9N/bc7ldJBByAlL6Y+EiM06Ub1ZUPamjsAlzXGvDJLfixZW2/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xD0EWQqUCIcOlndjRVoHWE64rpE0aWpk2Zzqp11Ah4Q=;
 b=oK51g1s61OMpu0zgcUs31N+9SUmYGpdS8nwts88ZuDx0IQ42FXPxE2R70bxI6mP53+ucvhiFqZYWS9NMEUar4vqAd6Up/zsSb5gefkfRt85th4rx4wuFiLFAKrN4GxORGpypBdX/szpQcQzt+ADvGBRrd5VuoLPvUklVmd81nlMUQ2VykuGCENkwNYE9CFmZb1L9H1V9SnxOR5jeTkWDRsilm619ARBDd25aNNnXJXiimcfBqgVoi+3lTiLhnIpbP1A6u7Gy1dX7rjL04ZS9imZOnImzUNnSBY8eQOnwvpZyK1gCPZ/U7p1GBhMjTOpMXXhuzeN8O1JyP1AYN7GkFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=microsoft.com;dmarc=pass action=none
 header.from=microsoft.com;dkim=pass header.d=microsoft.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xD0EWQqUCIcOlndjRVoHWE64rpE0aWpk2Zzqp11Ah4Q=;
 b=GJCXWn47Tf3BPqDDt0J7I2IuiNuqYinbU6fuTxntesjPOvrSEBuNhLRExFMQM2wBLi+nQL7Uyki3Hj2chq/oJOpNbwBPKArUpBP6LtR+i0sgrtEmMBd6rM+9nMIoIeTSzl5UbQHGbBop9UpggDn6uhH3vckW/RoMBqm2T6B7Eow=
Received: from BN8PR21MB1185.namprd21.prod.outlook.com (20.179.73.77) by
 BN8PR21MB1218.namprd21.prod.outlook.com (20.179.73.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.9; Mon, 24 Jun 2019 08:06:32 +0000
Received: from BN8PR21MB1185.namprd21.prod.outlook.com
 ([fe80::c00f:cb4a:6f13:d762]) by BN8PR21MB1185.namprd21.prod.outlook.com
 ([fe80::c00f:cb4a:6f13:d762%3]) with mapi id 15.20.2032.005; Mon, 24 Jun 2019
 08:06:32 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: Chris Wood <cwood2@lenovo.com>, "Srikishen Pondicherry Shanmugam (kishan)"
 <kishan@cisco.com>, Sumeet Kochar <skochar@lenovo.com>, vishwa
 <vishwa@linux.vnet.ibm.com>, srinivas k <srinuklge@gmail.com>, Ofer Yehielli
 <ofery@google.com>, Kun Yi <kunyi@google.com>
Subject: RE: Platform telemetry and health monitoring 
Thread-Topic: Platform telemetry and health monitoring 
Thread-Index: AdUapExp5UuG+XQ0Qk+0liU5b4GipwPvwxOw
Date: Mon, 24 Jun 2019 08:06:31 +0000
Message-ID: <BN8PR21MB1185164BABEA17A3DBE80F17C8E00@BN8PR21MB1185.namprd21.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=neladk@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-05-20T20:24:51.7634725Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=7ad7e3a0-0fda-4efe-b5af-bd9df99a438a;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [50.47.128.230]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f4c79b16-747a-4fd7-dce1-08d6f87adea0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR21MB1218; 
x-ms-traffictypediagnostic: BN8PR21MB1218:
x-ms-exchange-purlcount: 8
x-ld-processed: 72f988bf-86f1-41af-91ab-2d7cd011db47,ExtAddr
x-microsoft-antispam-prvs: <BN8PR21MB1218C333046632E11BBFC3B0C8E00@BN8PR21MB1218.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(396003)(346002)(376002)(366004)(39860400002)(136003)(53754006)(497574002)(199004)(189003)(53936002)(6306002)(33656002)(790700001)(9686003)(71190400001)(71200400001)(81166006)(81156014)(14454004)(66946007)(73956011)(66446008)(6116002)(256004)(8936002)(10090500001)(606006)(8990500004)(8676002)(476003)(6246003)(2906002)(55016002)(74316002)(53546011)(6506007)(4326008)(7696005)(236005)(22452003)(7736002)(5660300002)(54896002)(10290500003)(4743002)(64756008)(76116006)(66556008)(66476007)(3846002)(25786009)(6436002)(316002)(68736007)(52536014)(7416002)(478600001)(186003)(110136005)(54906003)(66066001)(26005)(99286004)(229853002)(102836004)(86362001)(486006)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BN8PR21MB1218;
 H:BN8PR21MB1185.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bhzoGo/+cf5Ww3TYVM3K8h0pMUaZfINRcZ+kXJlhrVksbpih3BPyWzJutRA7q45bkPBd0+ZgcCby70OCgFJJCWJ5n5n1j0yg5zaErX8djUwRb9cx5955M71CnBO1yOK4GKkTr2Qd7htEso/g0LODxom3VfMxFd25/1lzT+79J38CnpBnR2IY2ljZn9NitNoNIOjEYK8l6C9+b2pfL7RO2dZR3nhvDaVHJDISjrN2epmvNSuoKHrvAZuScmvHDfWAAqZtajJ31K0SeNeBIf2L8tzZ/61/GB3j9D7xwbQZ4sGARUJY5qeokcGa1JxZ+Iq1JsBJ93i73JK06h1dcMNns5bqPFzDwk0jlMssEFt5cQyZZgDN1eaeZB/ZyXFi22HHvtIq/6zVDk386/ehREqcUEuRqpRihckEJHVknlvwhJ0=
Content-Type: multipart/alternative;
 boundary="_000_BN8PR21MB1185164BABEA17A3DBE80F17C8E00BN8PR21MB1185namp_"
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c79b16-747a-4fd7-dce1-08d6f87adea0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 08:06:32.0894 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: neladk@microsoft.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR21MB1218
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
Cc: =?ks_c_5601-1987?B?V2lsbCBMaWFuZyAo1dnntfroKQ==?=
 <Will.Liang@quantatw.com>, Dick Wilkins <Dick_Wilkins@phoenix.com>,
 Tom Sand <trsand@us.ibm.com>, "Tanous, Ed" <ed.tanous@intel.com>,
 Michael Lim <youhour@us.ibm.com>, Reed B Frandsen <rfrandse@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Sagar Dharia <Sagar.Dharia@microsoft.com>, Amithash Prasad <amithash@fb.com>,
 Saqib Khan <khansa@us.ibm.com>, Joe P Mulholland <jpmulhol@us.ibm.com>,
 =?ks_c_5601-1987?B?QnVkZHkgSHVhbmcgKPzc9Lj7+Ck=?= <Buddy.Huang@quantatw.com>,
 Dong Wei <Dong.Wei@arm.com>, Vijay Khemka <vijaykhemka@fb.com>,
 Luke Chen <luke_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_BN8PR21MB1185164BABEA17A3DBE80F17C8E00BN8PR21MB1185namp_
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: base64

SSByZWNlaXZlZCBmZXcgcmVxdWVzdHMgdG8ga2VlcCB0b21vcnJvd6GvcyBtZWV0aW5nIGF0IG9y
aWdpbmFsIHRpbWUuIFdlIGNhbiBjaGFuZ2UgdGhlIHRpbWUgZnJvbSBuZXh0IG1lZXRpbmcgb253
YXJkcy4gIFNlZSB5b3UgdG9tb3Jyb3cgYXQgKDYvMjQgLSAgIDkgUE0gUFNUKQ0KDQpOZWVyYWoN
Cg0KLS0tLS1PcmlnaW5hbCBBcHBvaW50bWVudC0tLS0tDQpGcm9tOiBOZWVyYWogTGFka2FuaQ0K
U2VudDogVHVlc2RheSwgSnVuZSA0LCAyMDE5IDEyOjA5IEFNDQpUbzogTmVlcmFqIExhZGthbmk7
IENocmlzIFdvb2Q7IFNyaWtpc2hlbiBQb25kaWNoZXJyeSBTaGFubXVnYW0gKGtpc2hhbik7IFN1
bWVldCBLb2NoYXI7IHZpc2h3YTsgc3Jpbml2YXMgazsgT2ZlciBZZWhpZWxsaTsgS3VuIFlpDQpD
YzogT3BlbkJNQyBNYWlsbGlzdDsgWWkgVFogTGk7IEx1a2UgQ2hlbjsgQnVkZHkgSHVhbmcgKPzc
9Lj7+Ck7IERvbmcgV2VpOyBUb20gU2FuZDsgU2FxaWIgS2hhbjsgTWljaGFlbCBMaW07IGdlaXNz
b25hdG9yQGdtYWlsLmNvbTsgSm9lIFAgTXVsaG9sbGFuZDsgUmVlZCBCIEZyYW5kc2VuOyBBbWl0
aGFzaCBQcmFzYWQ7IFRhbm91cywgRWQ7IFdpbGwgTGlhbmcgKNXZ57X66Ck7IERpY2sgV2lsa2lu
czsgU2FnYXIgRGhhcmlhOyBWaWpheSBLaGVta2E7IENocmlzIEF1c3Rlbg0KU3ViamVjdDogUGxh
dGZvcm0gdGVsZW1ldHJ5IGFuZCBoZWFsdGggbW9uaXRvcmluZw0KV2hlbjogTW9uZGF5LCBKdW5l
IDI0LCAyMDE5IDk6MDAgUE0tMTA6MDAgUE0gKFVUQy0wODowMCkgUGFjaWZpYyBUaW1lIChVUyAm
IENhbmFkYSkuDQpXaGVyZTogTWljcm9zb2Z0IFRlYW1zIE1lZXRpbmcNCg0KQmFzZWQgb24gaW50
ZXJlc3RzIHNvIGZhciwgd2Ugd2lsbCBtZWV0IGJpLXdlZWtseSBNb25kYXkgOSBQTSBQU1QuICBX
ZSBjYW4gYWxzbyByb3RhdGUgdGhlIG1lZXRpbmcgdGltZXMgaWYgcmVxdWlyZWQuDQpBZ2VuZGE6
DQoNCiAgMS4gIERlZmluZSByZXF1aXJlbWVudHMgZm9yIHBsYXRmb3JtIHRlbGVtZXRyeSBhbmQg
aGVhbHRoIG1vbml0b3JpbmcNCg0KSm9pbiBNaWNyb3NvZnQgVGVhbXMgTWVldGluZzxodHRwczov
L3RlYW1zLm1pY3Jvc29mdC5jb20vbC9tZWV0dXAtam9pbi8xOSUzYW1lZXRpbmdfTURVMU5ETTJZ
MkV0T1Raa1l5MDBaakk1TFRrek1EY3RNak14WkRZeU56bGhOalF5JTQwdGhyZWFkLnYyLzA/Y29u
dGV4dD0lN2IlMjJUaWQlMjIlM2ElMjI3MmY5ODhiZi04NmYxLTQxYWYtOTFhYi0yZDdjZDAxMWRi
NDclMjIlMmMlMjJPaWQlMjIlM2ElMjIxYzI5YzJmNy1kMzg2LTRjNWEtYTNiYy0wZWUxM2I0OGJj
NjUlMjIlN2Q+DQorMSAzMjMtODQ5LTQ4NzQ8dGVsOisxJTIwMzIzLTg0OS00ODc0LCw3MzU3Mjg0
MiM+ICAgVW5pdGVkIFN0YXRlcywgTG9zIEFuZ2VsZXMgKFRvbGwpDQooODY2KSA2NzktOTk5NTx0
ZWw6KDg2NiklMjA2NzktOTk5NSwsNzM1NzI4NDIjPiAgIChUb2xsLWZyZWUpDQpDb25mZXJlbmNl
IElEOiA3MzUgNzI4IDQyIw0KTG9jYWwgbnVtYmVyczxodHRwczovL2RpYWxpbi50ZWFtcy5taWNy
b3NvZnQuY29tLzg1NTFmNGMxLWJlYTMtNDQxYS04NzM4LTY5YWE1MTdhOTFjNT9pZD03MzU3Mjg0
Mj4gfCBSZXNldCBQSU48aHR0cHM6Ly9teXNldHRpbmdzLmx5bmMuY29tL3BzdG5jb25mZXJlbmNp
bmc+IHwgTGVhcm4gbW9yZSBhYm91dCBUZWFtczxodHRwczovL2dvLm1pY3Jvc29mdC5jb20vZnds
aW5rLz9saW5raWQ9ODU3MjUwPiB8IE1lZXRpbmcgb3B0aW9uczxodHRwczovL3RlYW1zLm1pY3Jv
c29mdC5jb20vbWVldGluZ09wdGlvbnMvP29yZ2FuaXplcklkPTFjMjljMmY3LWQzODYtNGM1YS1h
M2JjLTBlZTEzYjQ4YmM2NSZ0ZW5hbnRJZD03MmY5ODhiZi04NmYxLTQxYWYtOTFhYi0yZDdjZDAx
MWRiNDcmdGhyZWFkSWQ9MTlfbWVldGluZ19NRFUxTkRNMlkyRXRPVFprWXkwMFpqSTVMVGt6TURj
dE1qTXhaRFl5TnpsaE5qUXlAdGhyZWFkLnYyJm1lc3NhZ2VJZD0wJmxhbmd1YWdlPWVuLVVTPg0K
Sm9pbiB3aXRoIGEgdmlkZW8gY29uZmVyZW5jaW5nIGRldmljZQ0KODEzODc4ODk2QHQucGxjbS52
YyBWVEMgQ29uZmVyZW5jZSBJRDogMDE3OTIwNjg0DQpBbHRlcm5hdGUgVlRDIGRpYWxpbmcgaW5z
dHJ1Y3Rpb25zPGh0dHBzOi8vZGlhbGluLnBsY20udmMvdGVhbXMvP2tleT04MTM4Nzg4OTYmY29u
Zj0wMTc5MjA2ODQ+DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXw0KRnJvbTogb3BlbmJtYyA8b3BlbmJtYy1ib3VuY2VzK25lbGFkaz1taWNyb3NvZnQuY29t
QGxpc3RzLm96bGFicy5vcmc+IE9uIEJlaGFsZiBPZiBOZWVyYWogTGFka2FuaQ0KU2VudDogTW9u
ZGF5LCBNYXkgMjAsIDIwMTkgMToyNSBQTQ0KVG86IE9wZW5CTUMgTWFpbGxpc3QgPG9wZW5ibWNA
bGlzdHMub3psYWJzLm9yZz4NClN1YmplY3Q6IFBsYXRmb3JtIHRlbGVtZXRyeSBhbmQgaGVhbHRo
IG1vbml0b3JpbmcNCg0KSGkgQWxsLA0KDQpBcyB3ZSBkaXNjdXNzZWQgaGF2aW5nIGEgZm9jdXNl
ZCB3b3Jrc3RyZWFtIGZvciChsFBsYXRmb3JtIHRlbGVtZXRyeSBhbmQgaGVhbHRoIG1vbml0b3Jp
bmehsSBpbiBvbmUgb2YgZW1haWwgdGhyZWFkLCBQbGVhc2UgbGV0IG1lIGtub3cgaWYgeW91IHdv
dWxkIGxpa2UgdG8gam9pbiB0aGlzIHdvcmsgc3RyZWFtLiBJdCB3b3VsZCBiZSBncmVhdCB0byBo
YXZlIHBhcnRpY2lwYXRpb24gZnJvbSBTaWxpY29uIHBhcnRuZXJzLyBtYWluYm9hcmQgZGVzaWdu
IGFuZCBtZmcgcGFydG5lcnMvIE1lbW9yeS8gTklDcy8gRmlybXdhcmUgYW5kIG90aGVyIGNvbXBv
bmVudHMuDQoNCk5hbWUNClByZWZlcnJlZCBUaW1pbmdzDQpBZ2VuZGEgLyBDb250cmlidXRpb24g
QXJlYXMNCg0KDQoNCg0KDQoNCg0KDQoNCg0KT25jZSB3ZSBoYXZlIGVub3VnaCBxdW9ydW0sIHdl
IHdpbGwgcHV0IHRvZ2V0aGVyIGJpLXdlZWtseSBjYWxsIHRvIGJyYWluc3Rvcm0gdmFyaW91cyBp
ZGVhcyBhbmQgcHJvcG9zYWxzLg0KDQpUaGFua3MNCk5lZXJhag0KDQo=

--_000_BN8PR21MB1185164BABEA17A3DBE80F17C8E00BN8PR21MB1185namp_
Content-Type: text/html; charset="ks_c_5601-1987"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dks_c_5601=
-1987">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Gulim;
	panose-1:2 11 6 0 0 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
@font-face
	{font-family:"Segoe UI Semibold";
	panose-1:2 11 7 2 4 2 4 2 2 3;}
@font-face
	{font-family:"\@Gulim";
	panose-1:2 11 6 0 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:KO;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:KO;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:KO;}
span.EmailStyle19
	{mso-style-type:personal;
	color:#2F5496;
	font-weight:normal;
	font-style:normal;}
span.EmailStyle20
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle21
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:135028022;
	mso-list-type:hybrid;
	mso-list-template-ids:-1410585410 67698703 67698713 67698715 67698703 6769=
8713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1
	{mso-list-id:699739503;
	mso-list-template-ids:1633839650;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">I receive=
d few requests to keep tomorrow=A1=AFs meeting at original time. We can cha=
nge the time from next meeting onwards. &nbsp;See you tomorrow at (6/24 -&n=
bsp; &nbsp;9 PM PST)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">Neeraj<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<div>
<p class=3D"MsoNormal">-----Original Appointment-----<br>
<b>From:</b> Neeraj Ladkani <br>
<b>Sent:</b> Tuesday, June 4, 2019 12:09 AM<br>
<b>To:</b> Neeraj Ladkani; Chris Wood; Srikishen Pondicherry Shanmugam (kis=
han); Sumeet Kochar; vishwa; srinivas k; Ofer Yehielli; Kun Yi<br>
<b>Cc:</b> OpenBMC Maillist; Yi TZ Li; Luke Chen; Buddy Huang (<span lang=
=3D"KO" style=3D"font-family:&quot;Gulim&quot;,sans-serif">=FC=DC=F4=B8=FB=
=F8</span>); Dong Wei; Tom Sand; Saqib Khan; Michael Lim; geissonator@gmail=
.com; Joe P Mulholland; Reed B Frandsen; Amithash Prasad; Tanous,
 Ed; Will Liang (<span lang=3D"KO" style=3D"font-family:&quot;Gulim&quot;,s=
ans-serif">=D5=D9=E7=B5=FA=E8</span>); Dick Wilkins; Sagar Dharia; Vijay Kh=
emka; Chris Austen<br>
<b>Subject:</b> Platform telemetry and health monitoring <br>
<b>When:</b> Monday, June 24, 2019 9:00 PM-10:00 PM (UTC-08:00) Pacific Tim=
e (US &amp; Canada).<br>
<b>Where:</b> Microsoft Teams Meeting<o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Based on interests so far, we will meet bi-weekly Mo=
nday 9 PM PST. &nbsp;We can also rotate the meeting times if required.
<o:p></o:p></p>
<div>
<div>
<div style=3D"margin-top:.25in;margin-bottom:7.5pt">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424">Agenda:<o:p></o:p></span></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"color:#252424;margin-top:.25in;marg=
in-bottom:7.5pt;margin-left:0in;mso-list:l0 level1 lfo3">
<span style=3D"font-family:&quot;Segoe UI&quot;,sans-serif">Define requirem=
ents for platform telemetry and health monitoring
<o:p></o:p></span></li></ol>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"https://teams.microsoft.com/l/meetup-join/=
19%3ameeting_MDU1NDM2Y2EtOTZkYy00ZjI5LTkzMDctMjMxZDYyNzlhNjQy%40thread.v2/0=
?context=3D%7b%22Tid%22%3a%2272f988bf-86f1-41af-91ab-2d7cd011db47%22%2c%22O=
id%22%3a%221c29c2f7-d386-4c5a-a3bc-0ee13b48bc65%22%7d" target=3D"_blank"><s=
pan style=3D"font-size:13.5pt;font-family:&quot;Segoe UI Semibold&quot;,san=
s-serif;color:#6264A7">Join
 Microsoft Teams Meeting</span></a> <o:p></o:p></span></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"tel:&#43;1%20323-849-4874,,73572842# " tar=
get=3D"_blank"><span style=3D"font-size:10.5pt;color:#6264A7;text-decoratio=
n:none">&#43;1 323-849-4874</span></a>
</span><span style=3D"font-size:9.0pt;font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424">&nbsp; United States, Los Angeles (Toll)
</span><span style=3D"font-family:&quot;Segoe UI&quot;,sans-serif;color:#25=
2424"><o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:3.0pt">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"tel:(866)%20679-9995,,73572842# " target=
=3D"_blank"><span style=3D"font-size:10.5pt;color:#6264A7;text-decoration:n=
one">(866) 679-9995</span></a>
</span><span style=3D"font-size:9.0pt;font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424">&nbsp; (Toll-free)
</span><span style=3D"font-family:&quot;Segoe UI&quot;,sans-serif;color:#25=
2424"><o:p></o:p></span></p>
</div>
</div>
<div style=3D"margin-top:7.5pt;margin-bottom:15.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Seg=
oe UI&quot;,sans-serif;color:#252424">Conference ID:
</span><span style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,san=
s-serif;color:#252424">735 728 42#
</span><span style=3D"font-family:&quot;Segoe UI&quot;,sans-serif;color:#25=
2424"><o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:.25in">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"https://dialin.teams.microsoft.com/8551f4c=
1-bea3-441a-8738-69aa517a91c5?id=3D73572842" target=3D"_blank"><span style=
=3D"font-size:9.0pt;color:#6264A7;text-decoration:none">Local
 numbers</span></a> | <a href=3D"https://mysettings.lync.com/pstnconferenci=
ng" target=3D"_blank">
<span style=3D"font-size:9.0pt;color:#6264A7;text-decoration:none">Reset PI=
N</span></a> |
<a href=3D"https://go.microsoft.com/fwlink/?linkid=3D857250" target=3D"_bla=
nk"><span style=3D"font-size:9.0pt;color:#6264A7;text-decoration:none">Lear=
n more about Teams</span></a> |
<a href=3D"https://teams.microsoft.com/meetingOptions/?organizerId=3D1c29c2=
f7-d386-4c5a-a3bc-0ee13b48bc65&amp;tenantId=3D72f988bf-86f1-41af-91ab-2d7cd=
011db47&amp;threadId=3D19_meeting_MDU1NDM2Y2EtOTZkYy00ZjI5LTkzMDctMjMxZDYyN=
zlhNjQy@thread.v2&amp;messageId=3D0&amp;language=3Den-US" target=3D"_blank"=
>
<span style=3D"font-size:9.0pt;color:#6264A7;text-decoration:none">Meeting =
options</span></a>
<o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:3.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif;color:#252424">Join with a video conferencing devic=
e
<o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:3.0pt">
<p class=3D"MsoNormal"><span class=3D"MsoHyperlink"><span style=3D"font-siz=
e:9.0pt;font-family:&quot;Segoe UI&quot;,sans-serif;color:#6264A7;text-deco=
ration:none">813878896@t.plcm.vc</span></span><span style=3D"font-size:9.0p=
t;font-family:&quot;Segoe UI&quot;,sans-serif;color:#252424">
 VTC Conference ID: 017920684 <o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:15.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Seg=
oe UI&quot;,sans-serif;color:#252424"><a href=3D"https://dialin.plcm.vc/tea=
ms/?key=3D813878896&amp;conf=3D017920684"><span style=3D"color:#6264A7;text=
-decoration:none">Alternate VTC dialing instructions</span></a>
<o:p></o:p></span></p>
</div>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">_____________________________________________<br>
<b>From:</b> openbmc &lt;openbmc-bounces&#43;neladk=3Dmicrosoft.com@lists.o=
zlabs.org&gt; <b>On Behalf Of
</b>Neeraj Ladkani<br>
<b>Sent:</b> Monday, May 20, 2019 1:25 PM<br>
<b>To:</b> OpenBMC Maillist &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>Subject:</b> Platform telemetry and health monitoring <o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#2F5496">Hi All, <o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#2F5496">As we discussed having=
 a focused workstream for =A1=B0<i>Platform telemetry and health monitoring=
</i>=A1=B1 in one of email thread, Please let me know if you would like to =
join this work stream. It would be great to have
 participation from Silicon partners/ mainboard design and mfg partners/ Me=
mory/ NICs/ Firmware and other components.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" style=3D"border-collapse:collapse">
<tbody>
<tr>
<td width=3D"208" valign=3D"top" style=3D"width:155.8pt;border:solid window=
text 1.0pt;padding:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal"><span style=3D"color:#2F5496">Name<o:p></o:p></span>=
</p>
</td>
<td width=3D"208" valign=3D"top" style=3D"width:155.85pt;border:solid windo=
wtext 1.0pt;border-left:none;padding:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal"><span style=3D"color:#2F5496">Preferred Timings<o:p>=
</o:p></span></p>
</td>
<td width=3D"208" valign=3D"top" style=3D"width:155.85pt;border:solid windo=
wtext 1.0pt;border-left:none;padding:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal"><span style=3D"color:#2F5496">Agenda / Contribution =
Areas<o:p></o:p></span></p>
</td>
</tr>
<tr>
<td width=3D"208" valign=3D"top" style=3D"width:155.8pt;border:solid window=
text 1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
</td>
<td width=3D"208" valign=3D"top" style=3D"width:155.85pt;border-top:none;bo=
rder-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid wind=
owtext 1.0pt;padding:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
</td>
<td width=3D"208" valign=3D"top" style=3D"width:155.85pt;border-top:none;bo=
rder-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid wind=
owtext 1.0pt;padding:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
</td>
</tr>
<tr>
<td width=3D"208" valign=3D"top" style=3D"width:155.8pt;border:solid window=
text 1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
</td>
<td width=3D"208" valign=3D"top" style=3D"width:155.85pt;border-top:none;bo=
rder-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid wind=
owtext 1.0pt;padding:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
</td>
<td width=3D"208" valign=3D"top" style=3D"width:155.85pt;border-top:none;bo=
rder-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid wind=
owtext 1.0pt;padding:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
</td>
</tr>
<tr>
<td width=3D"208" valign=3D"top" style=3D"width:155.8pt;border:solid window=
text 1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
</td>
<td width=3D"208" valign=3D"top" style=3D"width:155.85pt;border-top:none;bo=
rder-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid wind=
owtext 1.0pt;padding:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
</td>
<td width=3D"208" valign=3D"top" style=3D"width:155.85pt;border-top:none;bo=
rder-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid wind=
owtext 1.0pt;padding:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#2F5496">Once we have enough qu=
orum, we will put together bi-weekly call to brainstorm various ideas and p=
roposals.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#2F5496">Thanks <o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:#2F5496">Neeraj<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BN8PR21MB1185164BABEA17A3DBE80F17C8E00BN8PR21MB1185namp_--
