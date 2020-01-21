Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6F4143749
	for <lists+openbmc@lfdr.de>; Tue, 21 Jan 2020 07:54:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481zmp5w04zDqMx
	for <lists+openbmc@lfdr.de>; Tue, 21 Jan 2020 17:54:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=40.107.244.129;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.a=rsa-sha256 header.s=selector2 header.b=ECIK0Z6a; 
 dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2129.outbound.protection.outlook.com [40.107.244.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 481zlY2pQkzDqGY
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jan 2020 17:53:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H+VA3RhOnkkjbKRH+3bKhMU5qap97sqaZCYPC3+znU3OqBJ35PZ8nvOk1OhMAoYQqOh4l7RPDUD7QoSB4/Q1PLg+jvX2a2oh8cuKG/upY2Z8EtzcJAHfi1eRzh1iHKo5ZqTuqeMO0rtLKNBW9fSpmLxqrNN3WqeGSPqVw4Y/yZKuq3DjYvLNYx0ctRshRTXIQB+plG8bgGIHTngBoDyYEVDrxGUz1pMoITkI7pEI/KDunl/Wo6No6hBou51dfZPFCVol26IiGFUUpFOvR5yyGH/KrbiQrGhPw3B9UBQtcPs16EkRWwoexfapiDLJiiAY2ktpDKmq4IwU3YAg+gx76Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nODpwKiY1NE9iK9UEqOKrvMCGaQGHgt1mZhWX6zICV8=;
 b=DzR7fEWs1V2R9h/7TfK/98y1nB3iYO5UKacojplnyt0hctlxaAtOMY19TmJ2HVjmeTXT+ygiUDED+u6UbAE+9w4q+GcybvhvBuS0xqC123NNS2Y9JVsMWyr74WB41In2YgOu/fO8CE15TKcZL7Gx/YViwzS3Bns1uF+uj0555L2zjqfkRbtHMyMgEiaChchUUud8H8hvrgSuBVLola03cmgs+/GLzJKNriknluupZs1PI9dD7HdqU2MHeHqm3PCmGSg+DK1PYxc/+YjWdgl/AFwDFg1Yl+fvHFW+emy3W+Lr154GN+/ZD7cYaMf8eTsiQSOdSlluEUPLVYFWqrYXaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nODpwKiY1NE9iK9UEqOKrvMCGaQGHgt1mZhWX6zICV8=;
 b=ECIK0Z6aiWE910NKWeuSczvUkvcI0VzqAPQClUFAU+a7WDL+zH5ymVROPawhj7u00pFoYdZJhDncTR537u5/cV6EeS1Mtgn/LEcnL09ydMsO4VW/0hYOnktxGEbDLVDBgryjX5oX1H04F/4PCgH5u3h+tKcEvD3q7c3VvaQkZvw=
Received: from CH2PR21MB1510.namprd21.prod.outlook.com (20.180.12.7) by
 CH2PR21MB1415.namprd21.prod.outlook.com (10.141.57.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.9; Tue, 21 Jan 2020 06:53:38 +0000
Received: from CH2PR21MB1510.namprd21.prod.outlook.com
 ([fe80::3479:604d:610:e546]) by CH2PR21MB1510.namprd21.prod.outlook.com
 ([fe80::3479:604d:610:e546%10]) with mapi id 15.20.2665.017; Tue, 21 Jan 2020
 06:53:38 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: "Lawniczak, Maciej" <maciej.lawniczak@intel.com>, CS20 CTCchien
 <CTCCHIEN@nuvoton.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, Vijay Khemka <vijaykhemka@fb.com>
Subject: RE: Bios upgrade from BMC
Thread-Topic: Bios upgrade from BMC
Thread-Index: AQHVzWj+/fCWvtojz0ygzOBgRdR4d6fyxkbggABfJ9CAAASioIABiWJg
Date: Tue, 21 Jan 2020 06:53:38 +0000
Message-ID: <CH2PR21MB1510B787B3B07F41ABD6DDDAC80D0@CH2PR21MB1510.namprd21.prod.outlook.com>
References: <8AA9282E-0D5B-4B99-BAC6-0F9E84CC5A85@fb.com>
 <HK0PR03MB4068EAA62EDF7CE6C1866306AE320@HK0PR03MB4068.apcprd03.prod.outlook.com>
 <HK0PR03MB512308F0575110E4A0FEC5C2DF320@HK0PR03MB5123.apcprd03.prod.outlook.com>
 <DM5PR1101MB233234E1A586D2870AF10EF286320@DM5PR1101MB2332.namprd11.prod.outlook.com>
In-Reply-To: <DM5PR1101MB233234E1A586D2870AF10EF286320@DM5PR1101MB2332.namprd11.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=neladk@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2020-01-21T06:53:35.1977203Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=56e7adb4-ff28-4ad8-8482-f83948658e18;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [50.35.81.9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 58346591-6a76-43d8-b2d1-08d79e3ea4ab
x-ms-traffictypediagnostic: CH2PR21MB1415:
x-microsoft-antispam-prvs: <CH2PR21MB1415CE83539BFCC5234E9CE2C80D0@CH2PR21MB1415.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0289B6431E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(199004)(189003)(8990500004)(76116006)(52536014)(66476007)(66556008)(64756008)(66446008)(66946007)(5660300002)(66574012)(316002)(2906002)(110136005)(9686003)(966005)(8676002)(81156014)(10290500003)(81166006)(55016002)(8936002)(3480700007)(33656002)(86362001)(71200400001)(186003)(478600001)(53546011)(6506007)(7696005)(26005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR21MB1415;
 H:CH2PR21MB1510.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X9CijYeLIghkSpJFqg/bnLsekvf3hD4hnI9UvhDPnWU8T51ooGJkPFbFZmb3USxtGRmAdJD/rvtA9PcZmzPIZ4S7+8fWZyCcwZ1sN9EbnfG6XEXJDW/xnbkBHDnhDl1Tp7zbOEkFQ74PKSQwfREM+ASsBoQ6M6A44JjPOa26hA3Xo1lxuDmhxl2Sc0jpj3HvJwtBfOWsk5nLzrfN3KhHXX4vNXgK80klWCmr7Aamgrpv7ZNu6GoqepTdkICihPSK8RQfNhnTIApsNgUmstGARGoJ00j47Rf2mFhg/RwE2gkMAP9RItSDHGN2EDLpBlRFWK8ZRLdAaw8oroQsVm1KrLDadEgu3jzb8ObwmjvGNHkUNP9B+yEQtLJpfr5ahAdUlJiuUGRErVLFP8KhvlzuTjDrI26x+imnK52LgSBTPOPB00y+j6zrLvGUP8MKcAb78BdWGMxxsY+oSOG+CkzKrJhNJeP2RugbJ4ett9xygaEzk8IEuLiKA5J9mBCYAoZOVNU1tr75OJ1BEm9hJMOMgA==
x-ms-exchange-antispam-messagedata: +PVMRZKKCr0mH3fXPM29Sj87pQ4s8bwIgyqMYMg1PwMLhJnpZbAJmDOTMUwx9CU0PKMZzHky7vdhsK3is0PoLb0D9Eo00QhQ4shuLrb0RQIDA7mOiqkd4uunkVn1fUYubek3dig91iut5zLamOASsQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58346591-6a76-43d8-b2d1-08d79e3ea4ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2020 06:53:38.3464 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FPm7bMs6CdoGNMsNcjr71coG5f5Mpd9XtBgrNl2ifll8a2k5A+myqZbg35CPycIbc4kjQoiJK8MrcW3DmeFmiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR21MB1415
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

VmlqYXksIA0KDQotIEhvdyBhcmUgeW91IGFibGUgdG8gZGV0ZXJtaW5lIGZsYXNoIHJhbmdlcyB1
c2VkIGJ5IFVFRkkgaW4gY2FzZSB3ZSBtYXkgbm90IHdhbnQgdG8gdXBkYXRlIE1FIGJ1dCBvbmx5
IFVFRkkgcmVnaW9ucz8gIA0KLSBIb3cgaXMgdGhpcyBpbnRlcmZhY2VkIGZyb20gcmVkZmlzaC9J
UE1JID8gDQoNCklzIHRoZXJlIGFueSBkZXNpZ24gZG9jdW1lbnQgZm9yIHRoaXMgZmVhdHVyZSB0
aGF0IHdlIGNhbiByZXZpZXc/IA0KDQpOZWVyYWoNCg0KDQpGcm9tOiBvcGVuYm1jIDxvcGVuYm1j
LWJvdW5jZXMrbmVsYWRrPW1pY3Jvc29mdC5jb21AbGlzdHMub3psYWJzLm9yZz4gT24gQmVoYWxm
IE9mIExhd25pY3phaywgTWFjaWVqDQpTZW50OiBTdW5kYXksIEphbnVhcnkgMTksIDIwMjAgMTE6
MzUgUE0NClRvOiBDUzIwIENUQ2NoaWVuIDxDVENDSElFTkBudXZvdG9uLmNvbT47IG9wZW5ibWNA
bGlzdHMub3psYWJzLm9yZzsgVmlqYXkgS2hlbWthIDx2aWpheWtoZW1rYUBmYi5jb20+DQpTdWJq
ZWN0OiBbRVhURVJOQUxdIFJFOiBCaW9zIHVwZ3JhZGUgZnJvbSBCTUMNCg0KSGkgTWVkYWQsDQoN
ClRvIHNldCB1cCBNRSBpbiBSZWNvdmVyeSBtb2RlIHVzZSBJUE1JIGNvbW1hbmQg4oCcRm9yY2Ug
TUUgUmVjb3ZlcnnigJ0g4oCTIERGaCAoYnl0ZTQ9MDFoKQ0KVG8gc2V0IHVwIE1FIGluIE9wZXJh
dGlvbmFsIGFnYWluIHVzZSBJUE1JIOKAnENvbGQgUmVzZXTigJ0gY29tbWFuZOKAnSDigJMgMDJo
DQoNCkZvciBtb3JlIGRldGFpbHMgY2hlY2s6IGh0dHBzOi8vbmFtMDYuc2FmZWxpbmtzLnByb3Rl
Y3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRnd3dy5pbnRlbC5jb20lMkZjb250
ZW50JTJGZGFtJTJGd3d3JTJGcHVibGljJTJGdXMlMkZlbiUyRmRvY3VtZW50cyUyRnRlY2huaWNh
bC1zcGVjaWZpY2F0aW9ucyUyRmludGVsLXBvd2VyLW5vZGUtbWFuYWdlci12My1zcGVjLnBkZiZk
YXRhPTAyJTdDMDElN0NuZWxhZGslNDBtaWNyb3NvZnQuY29tJTdDYWRjMTVjZjAxNDhlNDMyMTEw
YjUwOGQ3OWQ3YjZhMzglN0M3MmY5ODhiZjg2ZjE0MWFmOTFhYjJkN2NkMDExZGI0NyU3QzElN0Mw
JTdDNjM3MTUxMDI2Mjg5MTI2OTQ1JnNkYXRhPTJUTEh3Q3NYTUsydmclMkZmQk1yS0lQeU5vUFVH
NTJSallxMzNwcnA5eHBzYyUzRCZyZXNlcnZlZD0wDQoNClJlZ2FyZHMsDQpNYWNpZWoNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCkhpIFZpamF5LA0KDQpJIHRyeSB0
byB1cGdyYWRlIEJJT1MgZnJvbSBCTUMsIGJ1dCBJIGRvIG5vdCBrbm93IGhvdyB0byBzZXQgdGhl
IG1vZGUgb2YgwqBNRS9OTS4NCkNhbiB5b3Ugc2hhcmUgdGhlIHByb2Nlc3MgaG93IHlvdSBzZXQg
TUUvTk0gdG8gcmVjb3ZlcnkgbW9kZSBhbmQgb3BlcmF0aW9uIG1vZGU/DQoNClRoYW5rcy4NCg0K
Qi5SLg0KTWVkYWQNCg0KRnJvbTogVmlqYXkgS2hlbWthIDxtYWlsdG86dmlqYXlraGVta2FAZmIu
Y29tPg0KVG86IE9wZW5CTUMgTWFpbGxpc3QgPG1haWx0bzpvcGVuYm1jQGxpc3RzLm96bGFicy5v
cmc+DQpTdWJqZWN0OiBCaW9zIHVwZ3JhZGUgZnJvbSBCTUMNCg0KSGksDQpJIGFtIHdyaXRpbmcg
YW4gYXBwbGljYXRpb24gZm9yIEJpb3MgdXBncmFkZS4gQ3VycmVudGx5IEkgaGF2ZSBjcmVhdGVk
IGEgaG9vayB0byBvdXIgYm1jIHVwZGF0ZXIgd2hpY2ggZXhwZWN0cyBhIHN5c3RlbWQgdW5pdCBm
aWxlIHRvIGJlIHJ1biBhdCB0aGUgdGltZSBvZiBhY3RpdmF0aW5nIHVwZGF0ZS4gQnV0IEkgYW0g
dGhpbmtpbmcgb2YgYWRkaW5nIHNvbWUgb2YgdGhpcyB1bml0IGZpbGUgZnVuY3Rpb25hbGl0eSBp
biB1cGRhdGVyIGl0c2VsZiBhbmQgd2FudGVkIHRvIHJ1biBieSB5b3UgYWxsIGlmIGl0IGlzIGNv
bW1vbiBwcm9jZWR1cmUgdXNlZCBieSBldmVyeSBwbGF0Zm9ybS4gQmVsb3cgYXJlIHRoZSBwcm9j
ZXNzIHdlIHVzZSBpbiBvdXIgcGxhdGZvcm0gYXMgYSBwYXJ0IG9mIGJpb3MgdXBncmFkZS4NCg0K
MS4gUG93ZXIgb2ZmIGhvc3Qgc2VydmVyLg0KMi4gU2V0IE1FL05NIChNYW5hZ2VtZW50IGVuZ2lu
ZSBvciBOb2RlIG1hbmFnZXIgaW4geDg2KSB0byByZWNvdmVyeSBtb2RlDQozLiBGbGlwIEdQSU8g
dG8gYWNjZXNzIFNQSSBmbGFzaCB1c2VkIGJ5IGhvc3QuDQo0LiBCaW5kIHNwaSBkcml2ZXIgdG8g
YWNjZXNzIGZsYXNoDQo1LiBGbGFzaGNwIGltYWdlIHRvIGRldmljZS4NCjYuIFVuYmluZCBzcGkg
ZHJpdmVyDQo3LiBGbGlwIEdQSU8gYmFjayBmb3IgaG9zdCB0byBhY2Nlc3MgU1BJIGZsYXNoDQo4
LiBTZXQgTUUvTk0gdG8gb3BlcmF0aW9uYWwgbW9kZQ0KOS4gUG93ZXIgb24gc2VydmVyLg0KDQpJ
IGNhbiBoYXZlIHNvbWUgZmxleGliaWxpdHkgaW4gdGhpcyBzZXF1ZW5jZSBiYXNlZCBvbiBlYWNo
IHBsYXRmb3JtIGNvbmZpZ3VyYXRpb24uIExvb2tpbmcgZm9yd2FyZCB0byB5b3VyIHN1Z2dlc3Rp
b25zLg0KDQpSZWdhcmRzDQotVmlqYXkNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18NClRoZSBwcml2aWxlZ2VkIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlvbiBjb250YWlu
ZWQgaW4gdGhpcyBlbWFpbCBpcyBpbnRlbmRlZCBmb3IgdXNlIG9ubHkgYnkgdGhlIGFkZHJlc3Nl
ZXMgYXMgaW5kaWNhdGVkIGJ5IHRoZSBvcmlnaW5hbCBzZW5kZXIgb2YgdGhpcyBlbWFpbC4gSWYg
eW91IGFyZSBub3QgdGhlIGFkZHJlc3NlZSBpbmRpY2F0ZWQgaW4gdGhpcyBlbWFpbCBvciBhcmUg
bm90IHJlc3BvbnNpYmxlIGZvciBkZWxpdmVyeSBvZiB0aGUgZW1haWwgdG8gc3VjaCBhIHBlcnNv
biwgcGxlYXNlIGtpbmRseSByZXBseSB0byB0aGUgc2VuZGVyIGluZGljYXRpbmcgdGhpcyBmYWN0
IGFuZCBkZWxldGUgYWxsIGNvcGllcyBvZiBpdCBmcm9tIHlvdXIgY29tcHV0ZXIgYW5kIG5ldHdv
cmsgc2VydmVyIGltbWVkaWF0ZWx5LiBZb3VyIGNvb3BlcmF0aW9uIGlzIGhpZ2hseSBhcHByZWNp
YXRlZC4gSXQgaXMgYWR2aXNlZCB0aGF0IGFueSB1bmF1dGhvcml6ZWQgdXNlIG9mIGNvbmZpZGVu
dGlhbCBpbmZvcm1hdGlvbiBvZiBOdXZvdG9uIGlzIHN0cmljdGx5IHByb2hpYml0ZWQ7IGFuZCBh
bnkgaW5mb3JtYXRpb24gaW4gdGhpcyBlbWFpbCBpcnJlbGV2YW50IHRvIHRoZSBvZmZpY2lhbCBi
dXNpbmVzcyBvZiBOdXZvdG9uIHNoYWxsIGJlIGRlZW1lZCBhcyBuZWl0aGVyIGdpdmVuIG5vciBl
bmRvcnNlZCBieSBOdXZvdG9uLiANCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KSW50ZWwgVGVjaG5vbG9neSBQb2xh
bmQgc3AuIHogby5vLg0KdWwuIFPFgm93YWNraWVnbyAxNzMgfCA4MC0yOTggR2RhxYRzayB8IFPE
hWQgUmVqb25vd3kgR2RhxYRzayBQw7PFgm5vYyB8IFZJSSBXeWR6aWHFgiBHb3Nwb2RhcmN6eSBL
cmFqb3dlZ28gUmVqZXN0cnUgU8SFZG93ZWdvIC0gS1JTIDEwMTg4MiB8IE5JUCA5NTctMDctNTIt
MzE2IHwgS2FwaXRhxYIgemFrxYJhZG93eSAyMDAuMDAwIFBMTi4NClRhIHdpYWRvbW/Fm8SHIHdy
YXogeiB6YcWCxIVjem5pa2FtaSBqZXN0IHByemV6bmFjem9uYSBkbGEgb2tyZcWbbG9uZWdvIGFk
cmVzYXRhIGkgbW/FvGUgemF3aWVyYcSHIGluZm9ybWFjamUgcG91Zm5lLiBXIHJhemllIHByenlw
YWRrb3dlZ28gb3RyenltYW5pYSB0ZWogd2lhZG9tb8WbY2ksIHByb3NpbXkgbyBwb3dpYWRvbWll
bmllIG5hZGF3Y3kgb3JheiB0cndhxYJlIGplaiB1c3VuacSZY2llOyBqYWtpZWtvbHdpZWsgcHJ6
ZWdsxIVkYW5pZSBsdWIgcm96cG93c3plY2huaWFuaWUgamVzdCB6YWJyb25pb25lLg0KVGhpcyBl
LW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgbWF0ZXJp
YWwgZm9yIHRoZSBzb2xlIHVzZSBvZiB0aGUgaW50ZW5kZWQgcmVjaXBpZW50KHMpLiBJZiB5b3Ug
YXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2UgY29udGFjdCB0aGUgc2VuZGVy
IGFuZCBkZWxldGUgYWxsIGNvcGllczsgYW55IHJldmlldyBvciBkaXN0cmlidXRpb24gYnkgb3Ro
ZXJzIGlzIHN0cmljdGx5IHByb2hpYml0ZWQuDQoNCg==
