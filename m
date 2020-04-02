Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBB719CCC1
	for <lists+openbmc@lfdr.de>; Fri,  3 Apr 2020 00:21:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tcwf5cRdzDrc1
	for <lists+openbmc@lfdr.de>; Fri,  3 Apr 2020 09:21:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=136150da4c=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=MwM0xpJ5; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=QUUvd+Jy; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tcvv3TtNzDrWQ
 for <openbmc@lists.ozlabs.org>; Fri,  3 Apr 2020 09:20:39 +1100 (AEDT)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 032MKAJG026402; Thu, 2 Apr 2020 15:20:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=iUfxxVIjELumVLSK256Kjel8osJYIcNL28Dzxlx6AvQ=;
 b=MwM0xpJ5gfaq3qTJ4GriuwDJJSampJTM2TkygBEot9tWcvOOTWSOJPLHUOSErg/ON4BA
 zDmNxzTim65mXpNqj9sjfky+juah/atA7DhxLOIUhMAU/Yoa0Sb7nmEcfoqqh6ylY4mf
 j1cVZfshV6igQwPSi572UdkadrJwYCPzoTs= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 305jfrt7h8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 02 Apr 2020 15:20:30 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.228) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Thu, 2 Apr 2020 15:20:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PyKf8FnXil1+wFfmcsIXsinIk8XJKOgIfJsWVj64OZv+n2yuyTKtf2FWsY89QTzRJSoqIOcBhSpUnq6NhADic+3QsYACBZsq4XS8PNbUu7c+Y0QY5ygVzravqniEP7+wlbqpm6oahlR0T/ywKzqFbfH/pHsmSE1pPtc1B1vgTcYY1r5x5EELMYOh8mLxGGn3NduCucEPkAmuY7k+cqSQ2T9KGCQmZIjON2ekttEjrSIw6PsWL508Tv0baOudrVmFe4BdW/6Zmo7vTGteX3NmC5yxdEkxt/7veT4S2X9CabGicLnL9hqDVb08CaInOz3Oe12EgafX3VukCRXRbg9u3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUfxxVIjELumVLSK256Kjel8osJYIcNL28Dzxlx6AvQ=;
 b=LlkU0hfmnAcqRFqLLByZ8BXb/9QN+YADAOdB2lyfh588hkY5JsY+6O2MZ+aS9ZKsZ1zFFM4X86HKoRifgFkC/Qhm9EmSQY7OK4QLBfeiSp+86SU7TBDZppFO4vajqEgmRq0WPSTUX+g/MqnvJLs0RXiGB8mBDooxjX2RS0BOMumfm8ZWomsdrB0Wp57GWI+EvUnKW/QGcfIoeQUY0SVr6Nq5I/tMEUea+yGv1OAqt5vVy5fktB7BbtJkv9QSelvZVfrSa/R4JH0YI/Wt7eLwwEBPWvvTSY3ES03nOfbTJcRgWAmKA4YfzG+NVspdYerETtjfWeHjo9WfRPS854Hg6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUfxxVIjELumVLSK256Kjel8osJYIcNL28Dzxlx6AvQ=;
 b=QUUvd+Jyh6ofboaKs8d1yostYIbLsBtleGb0s6JMo/DQIHf0DJvln9776S61EcrMfaqUGNXAFE8yjMwe+xj3ZjDAYOFtLFeLgNOp+MPlHMVXieARGwhqsSOMOdUc8UPtM0ciRG1GS1MZdiyhdmLzIdCzAFZXHhYOtiLP7iZ7LKY=
Received: from MW3PR15MB3947.namprd15.prod.outlook.com (2603:10b6:303:49::9)
 by MW3PR15MB3867.namprd15.prod.outlook.com (2603:10b6:303:45::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15; Thu, 2 Apr
 2020 22:20:28 +0000
Received: from MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936]) by MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936%4]) with mapi id 15.20.2878.016; Thu, 2 Apr 2020
 22:20:28 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: power policy restore
Thread-Topic: power policy restore
Thread-Index: AQHWCRf3b0zT45fpmk+NqEh4rhzsWKhmU3cA//+e0QA=
Date: Thu, 2 Apr 2020 22:20:27 +0000
Message-ID: <42227707-E8B9-4E83-9D4A-30496CE19AB3@fb.com>
References: <420CA5B5-8C0F-4ACD-84E8-8FD374B7F1C7@fb.com>
 <549a530c-cc7f-287e-d4b6-8c97eef9194f@linux.intel.com>
In-Reply-To: <549a530c-cc7f-287e-d4b6-8c97eef9194f@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:5d2c]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bedab816-a2ab-4ed7-90a1-08d7d7540c53
x-ms-traffictypediagnostic: MW3PR15MB3867:
x-microsoft-antispam-prvs: <MW3PR15MB3867838ADB382ECDBFC31892DDC60@MW3PR15MB3867.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0361212EA8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR15MB3947.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(396003)(136003)(346002)(39860400002)(376002)(366004)(316002)(7116003)(6512007)(110136005)(3480700007)(81166006)(81156014)(86362001)(2616005)(2906002)(8936002)(36756003)(66476007)(66556008)(33656002)(6506007)(53546011)(478600001)(66946007)(76116006)(71200400001)(186003)(6486002)(66446008)(8676002)(64756008)(5660300002);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZWGChgoEr7RzCRItYpNqKiBUjgHZOel48omivuXLQ6cE24MI4iWqTEPhHqDzBTwaAmKCYpx/MQmxXYlslQQTqDUKw3N3e5Uofe8yZJ5K2GLKvvdfGmpeKk+cIRJ3cVbnqvtX7DiI64NaajErRVM2TAd8pOJkfnYPNKFWXtjCfEQRKslbgOlv23/Q1Vyp6jGNgU4t1iEEufV70TnWC6LtG/rNH2+XfL6RnEZBFDOVpfeGBr12uyDpn6yGiYlDlAEkp9A7osd8qt+EM6P4YApTa3OmxsgbQVdjm/7/qM6ufqUAnH+3OHW1EnKTbQ2u+DSMVT70E8g+6e+N9YBj2x2vpYw1L0VMPj5Gk+UYslCJrnusDMTVgOKwtzjVwmi7l4Ivug56erEGl4bVmgxBOE6X8kU7qDczowKHDi33paZK7meFGarVAer9lRiJTk14DpP5
x-ms-exchange-antispam-messagedata: Gp3ZHGRKfpuYnzAbbOj8Gvf/Tm+WJuwxvVnF5GZ+OnLinbmTORUren3cCOX8g0+Tm0PY19FHXMylNjdvOq+GdmizivuSL1XMRQoDbbQgGGPrNwyr/KAlTmxxHBORqZXJpOgPbcsnEiTPmpd4rTFCOcQEWHRRLPGlItnkAF0xYmi7VtczfZzevrYf3WYDDBAL
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <E868556F30735947B5335A0BE2F2D0B0@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bedab816-a2ab-4ed7-90a1-08d7d7540c53
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2020 22:20:27.8360 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /ZO4CRHUX2XXmFuN7gOFeUNFXNxfao+v8DP883iUEggn0XYQc7l07hXUdaIzN1ENVB7tAgWcHjbTL3wR0CMYNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3867
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-02_12:2020-04-02,
 2020-04-02 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 adultscore=0
 mlxlogscore=734 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 phishscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004020165
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDQvMi8yMCwgMjowOSBQTSwgIm9wZW5ibWMgb24gYmVoYWxmIG9mIEJpbGxzLCBK
YXNvbiBNIiA8b3BlbmJtYy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxhYnMu
b3JnIG9uIGJlaGFsZiBvZiBqYXNvbi5tLmJpbGxzQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6DQoN
CiAgICANCiAgICANCiAgICBPbiA0LzIvMjAyMCAxMDo1NSBBTSwgVmlqYXkgS2hlbWthIHdyb3Rl
Og0KICAgID4gSGkgSmFzb24sDQogICAgPiANCiAgICA+IEkgc2VlIHBvd2VyIHBvbGljeSByZXN0
b3JlIGlzIGltcGxlbWVudGVkIGluIGNoYXNzaXMgaGFuZGxlciBvZiBtYWluIA0KICAgID4gaXBt
aWQgZGFlbW9uLiBBbmQgSSBkb27igJl0IHNlZSBhbnkgaW1wbGVtZW50YXRpb24gb2YgYWNfYm9v
dCBkYnVzIA0KICAgID4gaW50ZXJmYWNlIGFkZGl0aW9uIHdoaWNoIGlzIHJlcXVpcmVkIGJ5IHg4
Ni1wb3dlci1jb250cm9sIHRvIHN0YXJ0IA0KICAgID4gcmVzdG9yZVBvd2VyUG9saWN5LiBJIGRv
IHNlZSB0aGF0IHRoaXMgaW50ZXJmYWNlIGlzIGJlaW5nIGFkZGVkIGluIA0KICAgID4gaW50ZWwt
aXBtaS1vZW0uIERvZXMgaXQgbWVhbiB0aGF0IHBob3NwaG9yLWhvc3QtaXBtaWQgaGFzIGluY29t
cGxldGUgDQogICAgPiBpbXBsZW1lbnRhdGlvbiwgYW5kIGlmIGl0IGlzIGluY29tcGxldGUgYnkg
aXBtaSBzdGFuZGFyZCB0aGVuIGNhbiB3ZSBhZGQgDQogICAgPiBjb2RlIGluIGlwbWlkLg0KICAg
IFRoZSBJUE1JIG1haW50YWluZXJzIHdpbGwgbmVlZCB0byBjb21tZW50LCBidXQgdGhlIElQTUkg
c3BlYyBzdGF0ZXMgIlRoZSANCiAgICBwb3dlciByZXN0b3JlIHBvbGljeSBkZXRlcm1pbmVzIGhv
dyB0aGUgc3lzdGVtIG9yIGNoYXNzaXMgYmVoYXZlcyB3aGVuIA0KICAgIEFDIHBvd2VyIHJldHVy
bnMgYWZ0ZXIgYW4gQUMgcG93ZXIgbG9zcy4iDQogICAgDQogICAgT24gb3VyIHN5c3RlbXMsIHRo
ZSBCTUMgYWxzbyBsb3NlcyBwb3dlciBvbiBBQyBsb3NzLCBzbyB3ZSBhZGRlZCB0aGUgDQogICAg
QUNCb290IHByb3BlcnR5IHRvIGRldGVybWluZSBpZiB0aGUgQk1DIGlzIGJvb3RpbmcgZHVlIHRv
IEFDIGxvc3MgYW5kIA0KICAgIGNhbiBhcHBseSB0aGUgcG93ZXIgcmVzdG9yZSBwb2xpY3kuDQog
ICAgDQogICAgSSBkb24ndCBrbm93IGlmIGlwbWlkIGlzIHRoZSByaWdodCBwbGFjZSB0byBkZXRl
cm1pbmUgaWYgdGhlIHN5c3RlbSBpcyANCiAgICByZXR1cm5pbmcgZnJvbSBhbiBBQyBwb3dlciBs
b3NzLCBidXQgaWYgaXQgY291bGQgYmUgc3RhbmRhcmRpemVkIHRoYXQgDQogICAgd291bGQgYmUg
Z3JlYXQuDQoNClRvIG1ha2UgdXNlIG9mIHBvd2VyIHJlc3RvcmUgcG9saWN5IGZlYXR1cmUgZnJv
bSB4ODYtcG93ZXItY29udHJvbCwgbG9va3MgbGlrZQ0KV2UgbmVlZCB0byBpbXBsZW1lbnQgYWNf
Ym9vdCBhbmQgZGVsYXkgaW50ZXJmYWNlIHRoZSB3YXkgaW50ZWwtaXBtaS1vZW0gDQppbXBsZW1l
bnRlZC4gSSBkb24ndCBzZWUgdGhlcmUgaXMgYW55IG90aGVyIHdheSB0byB1c2UgdGhpcyBmZWF0
dXJlLg0KDQpJIHdvdWxkIHJlcXVlc3QgSVBNSUQgbWFpbnRhaW5lciB0byBjb21tZW50IGhlcmUg
c28gdGhhdCBJIGNhbiBwcm9jZWVkIHdpdGggDQpGdXJ0aGVyIGltcGxlbWVudGF0aW9uLg0KICAg
IA0KICAgID4gDQogICAgPiBJcyB0aGVyZSBhbnkgb3RoZXIgcGxhdGZvcm0gdXNpbmcgcmVzdG9y
ZVBvd2VyUG9saWN5IGZlYXR1cmVzIHdpdGhvdXQgDQogICAgPiBhY19ib290IGZlYXR1cmVzPw0K
ICAgID4gDQogICAgPiBSZWdhcmRzDQogICAgPiANCiAgICA+IC1WaWpheQ0KICAgID4gDQogICAg
DQoNCg==
