Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 155021BE9B1
	for <lists+openbmc@lfdr.de>; Wed, 29 Apr 2020 23:16:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CBCH398bzDrBB
	for <lists+openbmc@lfdr.de>; Thu, 30 Apr 2020 07:16:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=2388b7be44=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=Is40QujT; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=gb98ZL0U; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CBBN4LfQzDr9S
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 07:15:29 +1000 (AEST)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03TLEJjL005745; Wed, 29 Apr 2020 14:15:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=anYrGM0Rq6zX//iAr0HwSFM3/X5m3VugB6vm18ODMfA=;
 b=Is40QujTorA8l4Cs5Xv1xlUtgNLlpBbp23Oj+afRdx0uV0x37Em9wrjyjNDBAbyPDI+2
 cLILRqe4NnAvCZnKYfbaHaii7LrHAkx3pxNFCTRJj/wfe6D7QXCBRfEAGGVfJH94Smv6
 Kv4S3GXs8XFm6FiXUmOrqAuzGAHIqaKnWDk= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 30qd20hq8f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 29 Apr 2020 14:15:26 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Wed, 29 Apr 2020 14:15:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XHtZ6C1HbdWySzbu/fWFCNUj4HrkURB6vehVSJ2SYtYYAoktOKCahz4BWbjp5QV6E1TT1gsEqIY/ukvhHGnzuHojqCAnVVdadLqpBXeGSE1sVGY16pbdi72o5mfoT5dHsoTAOvAKTXNk5czKpT1yi0+kxI0Q4/kE5bxH2NMNrF/yymH765crLL8BZh/buk2NOxnK9lq4SwQAxuaSouQ2kvyv33QtUxhHsaNc/faNlj2GuuLGsQbDcB+8OlMTPiKcPIl30RiacIQ2nJi5MaJuvMHV9q5mU6XfUKIyAOLNyr89OxVJPi3BScZjn8u5MqOEmNmI9BjV7d380mMB3CLPHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=anYrGM0Rq6zX//iAr0HwSFM3/X5m3VugB6vm18ODMfA=;
 b=dqZa0Iut1pFuqxRumbERRyLWn6P7qLVG2cScG8tLpscS7PGVWBTAgBT9+xoIeXWYtEZhIwuMb3TvzxFPEusct0ksT48DD79zIl04DwDF+QAXbqAaOeoZ+d9bKPeSwcqJDsp+qDYG2XaHHeeAuoPZcHVhYCI3HKzQ8fxasd6f4AI/DUiBW82g7H7mH8ENVq06Qd89twYLSUGo1VxGzI11Jnx7HlNURZcJ5qhaDD9PgimMtMH5DLLizy7ChhLeNB/QUvu73fHMrM7sqiY1MvPzsjZxPgaQ3nSBCHxbD5uvpRXDd4TWvxOlqkkuIRrx2cTb3o+LyVEjr8EIcC/z0enAyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=anYrGM0Rq6zX//iAr0HwSFM3/X5m3VugB6vm18ODMfA=;
 b=gb98ZL0UXiBibZqtiPERCA2FVonZwVdU2NZZGtZTP/OlReV3P5696ovLWSv6AJQlNGUJHwahjfJ0NaVMvOa22O5YukNDwFLDWHuH1jcVovd6uXiLRgu56/NavXweGovAWzZSXqEetWvi1L2y0r2aVk0/h82o0oDhQmuooKTQ8WM=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB3352.namprd15.prod.outlook.com (2603:10b6:a03:111::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Wed, 29 Apr
 2020 21:15:23 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4%3]) with mapi id 15.20.2937.023; Wed, 29 Apr 2020
 21:15:23 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Sui Chen <suichen6@gmail.com>
Subject: Re: BMC health monitoring
Thread-Topic: BMC health monitoring
Thread-Index: AQHWHZoNPPIrPI4zmk+NLoquzxBZzKiPTl2AgADXqwA=
Date: Wed, 29 Apr 2020 21:15:23 +0000
Message-ID: <12BE27FF-718C-4DFF-AD8F-94F2609165ED@fb.com>
References: <D823D4AF-9C24-4DFC-8AC8-5284C4167B30@fb.com>
 <CAFaEeaHd_8+GCvFzmMdX01g5qQM5Z3oH8zd-g6LKpLO5-vs1pw@mail.gmail.com>
In-Reply-To: <CAFaEeaHd_8+GCvFzmMdX01g5qQM5Z3oH8zd-g6LKpLO5-vs1pw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:76e2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0bb66779-b760-4b34-b3ba-08d7ec826e3a
x-ms-traffictypediagnostic: BYAPR15MB3352:
x-microsoft-antispam-prvs: <BYAPR15MB335221D85AC30D42C0E6AF67DDAD0@BYAPR15MB3352.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 03883BD916
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wDj7IJ7dKsm7J5gafxWEjiidKizfem9ByR1jbeisYyqCzlMbBNnzHmM6w+ijtwTvT8LrgOns1OamuqUXqIcY92rKnnYr31cvaGWKFdzYRYG4LHqoky4Wav18/d1toBToUUl7Wu5Yh0KYzXhTQFwI+9MMlG3zURTAyTrqzBCooHhnsKP/H5Dy/dk4vlYZZVUX3sHnv4QEHX3HmIxVX9ZI5DiHeyM3xzfUHYrlVCEK+rx/gl1fYoV5FwZ5jUOJ0st9pOx4uvF1vCwv9pQWI9VSbRBXHnLR/KixQEBd3vEMFEjYPaFRQCyuuyVOIhX+sQDNlVLDOkURQR+vxJiaMQtkS/xxDerFwmPTxFpIDM8CSSIl/lV34sa3XUfd9tr+rfWorUQ9ex5Qsr7F6WZ45mbkjJ7JPVdZHYL8B1rmxGGJdON+f8oreht9EeYoTKedvn6T
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(396003)(366004)(376002)(136003)(346002)(7116003)(2906002)(3480700007)(4326008)(5660300002)(6916009)(53546011)(6506007)(91956017)(76116006)(186003)(8936002)(66946007)(64756008)(36756003)(66446008)(66476007)(8676002)(66556008)(6512007)(33656002)(2616005)(86362001)(71200400001)(6486002)(316002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Du4vnbx65CB48FS8q6M0acbRKPGV7mpGldXB//uBYQ2FqtkE9zm+JhRSKFYKaG66c6JDUucDMHDpgsZaHNMq5eFPZoTWalMNjNCpoWue1WCmoeYot4pElaili1/9L+ZEqHAC93vxSbeGvmWeQNGR6HQsdDJcSX+9F/jDUiXQkUfVCbhoPRP8CwT0raxqcmAVwPoAh9AFl14eY/9E80DDnroQT9JZHEdPKllvU5oLAc/MOFDy2L6f0a/Gyl2ptxHW2v+C/Jc39OlEyjbe8fJPczMoY9merWhXwpOgdJr0/bNN1TRz2MgMo8luTm9vFoCsKkgC3HUxq4NG/KpBlUaoRGCRFgZlfYgE32BOpvjBqYMzL9yeLoqnqQlIjJu7sXOaS/3/rUgy2qgoMMiIeaez++lJb+DGyzl3fkqbeR5X5e+IH56b1wVKLfKbdowWkuP5FAQDlZ/3zg8tnMSILddkDrb7DbLRgjuDiOOCq4XGzltZb75AVqNhuq/6qdWkxItT2O/dqQjyZ9otCb9cbDuUitjY8/jzMnRSaqBjl6Iw313qGDTpcTMgNvuh8aoao+VGW/6jZEDbb+hlac0XZb7okJJDsYWswOnTxOfkyjOR4PjxtArpskgDCNJAzrRKUx7aTX+wu8Mzv3sduM2BbHSPZ7Lwx0MggFc7QSIIKq+/gtGO/i+EOba572d7oo8UVF1RaniUsXaK/vzN7Gb4zySF9iLuB+MVVqAe2yC3avLmLtYC0dxpTtxFGU+xgJNlpKQaVfMsq+BL3LG0ND0ahvlsIK26+drYMBBE2BX/11QBKUrA3aBT4fDExuwOzJ+strCtEPBeC5/cssj+CtU2ZiEbMg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD0352CEAA348544B064D297DEFF86AC@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bb66779-b760-4b34-b3ba-08d7ec826e3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2020 21:15:23.3939 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yVhuXVbhE/jUwi3O9YEf1XoiXnE4Z4DCepWK5+MQGhAx6OBJ0DJkOn2ojp8Aoje8NeY7lUfxB0URbTod3hrAXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3352
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-29_11:2020-04-29,
 2020-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 clxscore=1011
 impostorscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0 adultscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004290153
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDQvMjgvMjAsIDY6MjMgUE0sICJTdWkgQ2hlbiIgPHN1aWNoZW42QGdtYWlsLmNv
bT4gd3JvdGU6DQoNCiAgICBIZWxsbyBWaWpheSwNCiAgICANCiAgICBJJ20gbm90IGF3YXJlIG9m
IGFuIEJNQyBoZWFsdGggbW9uaXRvcmluZyBwYWNrYWdlIHRoYXQgaXMgcmVhZHkgdG8gdXNlDQog
ICAgb3V0IG9mIHRoZSBib3gsIGJ1dCBpdCBhcHBlYXJzIHdlJ3JlIHRoaW5raW5nIG9mIHNpbWls
YXIgdGhpbmdzIC0tDQogICAgbW9uaXRvciB0aGUgQk1DIGhlYWx0aC4NCiAgICBJIGd1ZXNzIHRo
ZXJlIG1heSBiZSBtdWx0aXBsZSBwYXJ0cyB0byB0aGlzOg0KICAgIDEpIEhvdyBkb2VzIHRoZSBC
TUMgY29sbGVjdCBoZWFsdGggbWV0cmljczsgdGhpcyBtYXkgYmUgc2ltaWxhciB0bw0KICAgIHBy
b2ZpbGluZyBhIHJlZ3VsYXIgTGludXggc3lzdGVtOyBhY3R1YWxseSB0aGUgbGlzdCBvZiBtZXRy
aWNzIG1heSBiZQ0KICAgIGV4cGFuZGVkIHRvIGFueXRoaW5nIHRoYXQgbWF5IGJlIG9idGFpbmVk
IHRocm91Z2ggTGludXggcHJvZmlsZXJzLCBidXQNCiAgICB0aGUgc2V0IG9mIG1ldHJpY3MgdGhh
dCBhcmUgbW9zdCBpbXBvcnRhbnQgbWlnaHQgdmFyeSBpbiBkaWZmZXJlbnQNCiAgICBzaXR1YXRp
b25zLg0KV2UgY2FuIGFkZCBhbGwgY29tcG9uZW50IG9mIG1ldHJpY3MgdG8gYSBkYnVzIGludGVy
ZmFjZSBhbmQgZnJlcXVlbmN5IG9mIA0KUG9sbGluZyB0aGVzZSBkYXRhIGNhbiBiZSBkZWZpbmVk
IGJ5IGNvbmZpZyBmaWxlIGFzIHdlbGwgYXMgYWN0aW9uLg0KICAgIDIpIEhvdyB0byBnZXQgdGhl
IG1ldHJpYyBkYXRhIG91dCBvZiB0aGUgQk1DIHRvIHRoZSBob3N0IG9yIHNvbWUNCiAgICBtb25p
dG9yaW5nIGVudGl0eSB0aGF0IG92ZXJzZWVzIGEgbGFyZ2UgbnVtYmVyIG9mIG1hY2hpbmVzOyBk
ZXBlbmRpbmcNCiAgICBvbiB0aGUgY29ubmVjdGl2aXR5IG9mIHRoZSBCTUMgaXQgbWF5IHVzZSBk
aWZmZXJlbnQgbWV0aG9kcy4NCg0KUmVzdCBvciByZWRmaXNoIGNhbiB0YWtlIHRoZXNlIGRhdGEg
b3V0IG9mIEJNQyB2aWEgYm1jd2ViLg0KICAgIA0KICAgIFRoYW5rcywNCiAgICBTdWkNCiAgICAN
CiAgICBPbiBUdWUsIEFwciAyOCwgMjAyMCBhdCAxOjE5IFBNIFZpamF5IEtoZW1rYSA8dmlqYXlr
aGVta2FAZmIuY29tPiB3cm90ZToNCiAgICA+DQogICAgPiBJcyB0aGVyZSBhbnkgbW9kdWxlIHdo
aWNoIGRvZXMgaGVhbHRoIG1vbml0b3JpbmcgZm9yIEJNQyBoZWFsdGguIElmIHRoZXJlIGlzIG5v
bmUgdGhlbiBJIGFtIHByb3Bvc2luZyBhIHBob3NwaG9yLWJtYy1oZWFsdGggd2hpY2ggd2lsbCBt
b25pdG9yIGZvbGxvd2luZyBjb21wb25lbnQgdG8gc3RhcnQgd2l0aCBhbmQgY2FuIGJlIGV4dGVu
ZGVkIGZvciBtb3JlIGNvbXBvbmVudHMuDQogICAgPg0KICAgID4gQ1BVIHV0aWxpemF0aW9uDQog
ICAgPiBNZW1vcnkgdXRpbGl6YXRpb24NCiAgICA+DQogICAgPg0KICAgID4NCiAgICA+IEl0IHdp
bGwgdGFrZSBwcm9wZXIgYWN0aW9uIGxpa2UgcmVwb3J0IGFsZXJ0IG9yIHJlYm9vdCBzeXN0ZW0g
d2hlbiB0aGVzZSBkYXRhIHdpbGwgY3Jvc3MgaXTigJlzIHRocmVzaG9sZCB2YWx1ZSB3aGljaCB3
YXMgY29uZmlndXJlZC4NCiAgICA+DQogICAgPg0KICAgID4NCiAgICA+IFJlZ2FyZHMNCiAgICA+
DQogICAgPiAtVmlqYXkNCiAgICANCg0K
