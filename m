Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79610148DD8
	for <lists+openbmc@lfdr.de>; Fri, 24 Jan 2020 19:34:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48478z4hXrzDqgD
	for <lists+openbmc@lfdr.de>; Sat, 25 Jan 2020 05:34:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=82929cf7d0=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=E58GQmBP; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=P9/O7Dea; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48478L2f6GzDqfH
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jan 2020 05:34:09 +1100 (AEDT)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00OIN3oV032421; Fri, 24 Jan 2020 10:34:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=EZzBFhS7CT9YJKpC/7i3VnMF3IU4bxXIVnTKKA5Kmhk=;
 b=E58GQmBPYM/iHyLtwreuPHhHGvwowrLIwGkowtJiQLkW9aiW0/SkiMbPplfP7luHwRaD
 wrqtY8+HFM1JkT0T4YM3mo8lWAzIIlkDpcxNkEHYVjB3v/cKjlxyFdWU0/toZBXnxZIR
 VOZaws7ObBC+Wk4u5qR4e8bShX3eooJCd64= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 2xqq25bavp-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 24 Jan 2020 10:34:04 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Fri, 24 Jan 2020 10:34:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HEXbs3r4Mz7L1J5NeOk+hrw+KQmrq43ph88E9LsNcMeTAGJDUdfqiIJM46Il8W6mUqLk59eazEn2qLl8+Fch3J3QZNfrlgtJ/+IdGWnCn+lNeiMtQYjaB1gqYmPI4Px0BsggkX1oRZ6Wl2ab1liWQ1sGkCHbEAqqWx181JjxWvE4d0S2uOBeuiwx2m/UGYmn4agaLb9F4QEMnMiium6ixviTpzMxRrNdhxMlcDAaBsvslvM5LBdyV9fTP1eAcTprkwjT9dV0WVVJHptBl9St7GBQtBMIfa0d9wv6COEoF5Vs7GAT5LSWnkpqYjBENjc7pm4TBSAwiuKWTX92yLSyCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZzBFhS7CT9YJKpC/7i3VnMF3IU4bxXIVnTKKA5Kmhk=;
 b=At5e9pIWfZejf5YvDAbYs9M1ldHBpWsjxZERBA4+s0w/g4HaWrf2Nto/QOTPbZPMMdnpCe1wUIZ1hk849gXCPFJWrLGJTjopUJbQ4P9eGDpneYDM69ovnERLn0OAs9QMPn6ZHN6tRldXxWG2x/3eNIKgS60OXGTVI4+/oiAlo0toyRVxTK99xuxA/+x+BFyHYhHNUc4/5ej5rFn9ZLm7rFZqEQN7idHrsz1ZQMOuvjO/ZhO+PKJYtl1TX4D/12Qx2wsNBHuu57q3yET8Mcx2fuxnez5/9gLhhOgs0+cK7eg9/gtOCkkn0sjLadW76kp0Qi1hk2BYHsGcmdXUH86Idw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZzBFhS7CT9YJKpC/7i3VnMF3IU4bxXIVnTKKA5Kmhk=;
 b=P9/O7Deaz5DCCQG+/yTtRGubTnrINtYc+6VRF1cgHavDKyo+22qw1k+NF2fAuLzNXW8NrelHRt+cqm7kTzne2roi9U8OKOJero+eW6Lj1RrX7tceJNjUbQcKE30uCkDCWOGe1ud2/4hmZhuhfkxKG8AjqFhbAFGHt4LA/S6TLwY=
Received: from MWHPR15MB1597.namprd15.prod.outlook.com (10.173.234.137) by
 MWHPR15MB1566.namprd15.prod.outlook.com (10.173.234.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.18; Fri, 24 Jan 2020 18:33:59 +0000
Received: from MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2]) by MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2%8]) with mapi id 15.20.2644.028; Fri, 24 Jan 2020
 18:33:59 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: James Feist <james.feist@linux.intel.com>, "Bills, Jason M"
 <jason.m.bills@linux.intel.com>
Subject: Re: x86 power control for multi host
Thread-Topic: x86 power control for multi host
Thread-Index: AQHV0K1XX03zkNGXPUaqdZ+5RqCG9af1PNaAgANc5wD//6lUAIAB0dUA//+NUQA=
Date: Fri, 24 Jan 2020 18:33:59 +0000
Message-ID: <410B9CE9-C802-4EC2-8AB6-87B2EF2A8667@fb.com>
References: <E8A81BD0-04D4-4ED5-91E3-F4CA85DC8CAE@fb.com>
 <C1AA3F44-5589-4751-B023-8A28CC5ACC19@fb.com>
 <ee4b29ec-561c-72de-1da0-57e9a5f9958b@linux.intel.com>
 <040595EA-2283-4FD6-B89D-DB6C9B93610D@fb.com>
 <641686af-cc02-df5a-7fdb-912ead566b06@linux.intel.com>
In-Reply-To: <641686af-cc02-df5a-7fdb-912ead566b06@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:8efa]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3377d5e3-13c9-462b-46d7-08d7a0fbfa9a
x-ms-traffictypediagnostic: MWHPR15MB1566:
x-microsoft-antispam-prvs: <MWHPR15MB1566038AAA68F088D81C8751DD0E0@MWHPR15MB1566.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 02929ECF07
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(39860400002)(346002)(376002)(136003)(199004)(189003)(2616005)(4326008)(81166006)(8936002)(8676002)(2906002)(6512007)(5660300002)(64756008)(66446008)(66476007)(81156014)(33656002)(36756003)(76116006)(66946007)(66556008)(316002)(53546011)(6486002)(186003)(6506007)(110136005)(478600001)(71200400001)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1566;
 H:MWHPR15MB1597.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m69cWAXHMIXp8tDEbGO+qGPUnHNE62BNwl+MjzijhskgxJkCmCkN46Aey9FSSvwLTFvw8rwLO1WJ7w96jZXmm9CCBzoBb0gFk3cWCt7W+SflzufW/7q9NuhBAqp0chisIfya2oF8ircCKu9Ia3VcfeK7MBfqGDKzNh7TfdoSw48Qlr0tRDaVze3JPEXzXLefQYj8T+kgMdPiMjwMHC6Kr21eswP+52Y05UHjYsNZNlZjsMs02in/ssmhAA1x7MFgQLfHJAPJazyobNiXdiYR0hDhS+3IMpIo2Q10fvQqPGJu4gn8TNw91uEeo4n/MasHRRgVZ0gq7X/vnXlPx5KzlCGirzOG/ucZu7iEnMiGfOqZebElJP/9xG6s7odlzub4xoGFJAsF5pjKvh4rhG28EpfGFrbFDCEtTkubUiVhmGtE21tlDjoA7ScslswXnTS4
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <4BD223CA94643845AB386BBC7601F435@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3377d5e3-13c9-462b-46d7-08d7a0fbfa9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2020 18:33:59.5945 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1XmOskTFR9TXcHmFdzBa5OGHojqzUvb2vvbp9yeCqOTsBCFTMygCbfCPTSR8+bx7Hyc/PVzgKJViWdceJ4IHpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1566
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-24_06:2020-01-24,
 2020-01-24 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001240150
X-FB-Internal: deliver
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

DQoNCu+7v09uIDEvMjQvMjAsIDk6MjQgQU0sICJKYW1lcyBGZWlzdCIgPGphbWVzLmZlaXN0QGxp
bnV4LmludGVsLmNvbT4gd3JvdGU6DQoNCiAgICBPbiAxLzIzLzIwIDE6MzcgUE0sIFZpamF5IEto
ZW1rYSB3cm90ZToNCiAgICA+IFRoYW5rcyBKYXNvbiBmb3IgcXVpY2sgcmVzcG9uc2UuDQogICAg
PiBOb3cgbXkgYW5vdGhlciBxdWVzdGlvbiBpcyBjYW4gSSBnZXQgdGhpcyBjb25maWd1cmF0aW9u
IGZyb20gZW50aXR5IG1hbmFnZXIgZm9yIGdwaW8gbGluZXMgb3Igc2hvdWxkIEkgaGF2ZSBhIHNl
cGFyYXRlIGNvbmZpZy5qc29uIGZpbGU/DQogICAgDQogICAgVXNpbmcgRU0gaW4gdGhpcyBjb250
ZXh0IHdvdWxkIGFsbG93IGEgc2luZ2xlIGltYWdlIHRvIHN1cHBvcnQgYm90aCBhIA0KICAgIG11
bHRpLWhvc3Qgc3lzdGVtIGFuZCBzaW5nbGUgaG9zdCBzeXN0ZW0uIElmIHRoYXQncyBwb3NzaWJs
ZSBJJ2QgdGhpbmsgDQogICAgdGhhdCB3b3VsZCBiZSBiZXR0ZXIuIEkgZ3Vlc3MgdGhlIHF1ZXN0
aW9uIGJlY29tZXMgaWYgeW91IGhhdmUgc29tZSB3YXkgDQogICAgdG8gZHluYW1pY2FsbHkgZGV0
ZWN0IGEgbXVsdGktaG9zdCBzeXN0ZW0sIHRoYXQnZCBiZSBiZXR0ZXIuIElmIHRoYXQncyANCiAg
ICBub3QgcG9zc2libGUsIHRoZW4geW91IG1pZ2h0IGJlIHN0dWNrIHdpdGggYSBoYXJkY29kZWQg
ZmlsZS4NCg0KSmFtZXMsIA0KSSBhZ3JlZSB0aGF0IGl0IHdvdWxkIGJlIGdyZWF0IHRvIGRldGVj
dCBtdWx0aSBob3N0IGR5bmFtaWNhbGx5LiBCdXQgd2Ugc3RpbGwgbmVlZCB0byBrbm93IGRpZmZl
cmVudCBHUElPIGxpbmUgbmFtZSBvciBudW1iZXIgZm9yIGVhY2ggaG9zdCB0byBtb25pdG9yLiBU
aGF0J3Mgd2h5IHdlIG5lZWQgdGhpcyBHUElPIGNvbmZpZ3VyYXRpb24uIEl0IGlzIGdvaW5nIHRv
IGJlIHJ1bnRpbWUgYXMgdXNlciBqdXN0IG5lZWQgdG8gY2hhbmdlIGVudHJpZXMgaW4gRU0ganNv
biBjb25maWcuIFdlIG1heSBlbmhhbmNlIHRoaXMgbGF0ZXIgb24uDQogICAgDQogICAgPiANCiAg
ICA+IE9uIDEvMjMvMjAsIDEwOjQ4IEFNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgQmlsbHMsIEph
c29uIE0iIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFicy5v
cmcgb24gYmVoYWxmIG9mIGphc29uLm0uYmlsbHNAbGludXguaW50ZWwuY29tPiB3cm90ZToNCiAg
ICA+IA0KICAgID4gICAgICBPbiAxLzIxLzIwMjAgMzoyNiBQTSwgVmlqYXkgS2hlbWthIHdyb3Rl
Og0KICAgID4gICAgICA+IFNvcnJ5LCBtaXNzZWQgdG8gYWRkIG1haWxpbmcgbGlzdC4NCiAgICA+
ICAgICAgPg0KICAgID4gICAgICA+ICpGcm9tOiAqVmlqYXkgS2hlbWthIDx2aWpheWtoZW1rYUBm
Yi5jb20+DQogICAgPiAgICAgID4gKkRhdGU6ICpUdWVzZGF5LCBKYW51YXJ5IDIxLCAyMDIwIGF0
IDI6NTEgUE0NCiAgICA+ICAgICAgPiAqVG86ICpKYW1lcyBGZWlzdCA8amFtZXMuZmVpc3RAbGlu
dXguaW50ZWwuY29tPiwNCiAgICA+ICAgICAgPiAiamFzb24ubS5iaWxsc0BsaW51eC5pbnRlbC5j
b20iIDxqYXNvbi5tLmJpbGxzQGxpbnV4LmludGVsLmNvbT4NCiAgICA+ICAgICAgPiAqU3ViamVj
dDogKng4NiBwb3dlciBjb250cm9sIGZvciBtdWx0aSBob3N0DQogICAgPiAgICAgID4NCiAgICA+
ICAgICAgPiBIaSBKYW1lcy9KYXNvbiwNCiAgICA+ICAgICAgPg0KICAgID4gICAgICA+IEkgYW0g
cGxhbm5pbmcgdG8gbW9kaWZ5IHg4NiBwb3dlciBjb250cm9sIGZvciBtdWx0aXBsZSBob3N0IHN1
cHBvcnQuIEFzDQogICAgPiAgICAgID4gaXQgaGFzIGhhcmRjb2RlZCBuYW1lIGhvc3QwIGJ1dCB3
ZSB3YW50IHRvIHN1cHBvcnQgZm9yIG11bHRpcGxlIG51bWJlcg0KICAgID4gICAgICA+IG9mIGhv
c3RzIGJhc2VkIG9uIGNvbmZpZ3VyYXRpb24uIEkgYW0gdGhpbmtpbmcgb2YgcmVhZGluZyBkaWZm
ZXJlbnQgR1BJTw0KICAgID4gICAgICA+IGxpbmVzIGZvciBlYWNoIGhvc3QgZnJvbSBhIGNvbmZp
Zy5qc29uIGZpbGUgYW5kIHRoZW4gbW9uaXRvciBkaWZmZXJlbnQNCiAgICA+ICAgICAgPiBncGlv
cy4gUGxlYXNlIHN1Z2dlc3QgdGhhdCBpZiB0aGVzZSBjb25maWd1cmF0aW9uLCBJIHNob3VsZCBy
ZWFkIGZyb20NCiAgICA+ICAgICAgPiBlbnRpdHktbWFuYWdlciA+DQogICAgPiAgICAgID4gQWxz
byBsb29raW5nIGZvcndhcmQgdG8geW91ciB0aG91Z2h0IG9mIHRoaXMgZmVhdHVyZSBhZGRpdGlv
biBpbg0KICAgID4gICAgICA+IGV4aXN0aW5nIGRhZW1vbiBvciBzaG91bGQgSSBoYXZlIHNlcGFy
YXRlIHJlcG8gaXRzZWxmPw0KICAgID4gICAgICBJZiBpdCdzIGNvbmZpZ3VyYWJsZSwgdGhlbiBJ
IGRvbid0IHNlZSBhbnkgcmVhc29uIG5vdCB0byBoYXZlIGl0IGluIHRoZQ0KICAgID4gICAgICBl
eGlzdGluZyByZXBvLiAgSXMgaXQgb2theSB0byBzdGFydCB0aGVyZSBhbmQgc2VlIGhvdyBiaWcg
dGhlIGltcGFjdCBpcw0KICAgID4gICAgICBiZWZvcmUgZGVjaWRpbmcgb24gYSBzZXBhcmF0ZSBy
ZXBvPw0KICAgID4gICAgICANCiAgICA+ICAgICAgPg0KICAgID4gICAgICA+IFJlZ2FyZHMNCiAg
ICA+ICAgICAgPg0KICAgID4gICAgICA+IC1WaWpheQ0KICAgID4gICAgICA+DQogICAgPiAgICAg
IA0KICAgID4gDQogICAgDQoNCg==
