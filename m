Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DF2148DCA
	for <lists+openbmc@lfdr.de>; Fri, 24 Jan 2020 19:30:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48474N6lxNzDqgk
	for <lists+openbmc@lfdr.de>; Sat, 25 Jan 2020 05:30:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=82929cf7d0=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=RUqVVvBE; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=lcxnyKom; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48473c2dTHzDqdD
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jan 2020 05:30:02 +1100 (AEDT)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00OINZ3T012044; Fri, 24 Jan 2020 10:29:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=jds/dDrdZJQlieod+ArXrT2Ejfbwf2IsmXGemkNWARg=;
 b=RUqVVvBEmZHKnYfHhoXQ8yeKSIfE9ZoKmgXmqoTwY14nZTp0O88FfahBHE7LKIKzM03R
 8F5K2GKRwHjilRDTlZGZ0A6fxrgrs5sbbsdJg3rPabZrIMyWhilElkNtSCatLIy0BL5u
 gpxOLQFPn3d0D9eXtLxeYzEZIIk0kNX+B7I= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 2xr4280k1d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 24 Jan 2020 10:29:56 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.230) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Fri, 24 Jan 2020 10:29:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YiK6sJQnWeXir9OWw9P8oLpteLJ4IB4U591PzQYw+aJPwyg6PtIs9tfZmh7QWWI6IHq+Bwuqv934zf/bSX5pjFpaqirSETczs97C7hD6ympjW4WpWpz7SlS5v6jNAcyc3TDOsqFeCUtlmdKg21O4TvDt1BWysQMNJeUnc2t8CaYMq4Xgbv64JFULuCMSgWpkEZ1jc3IvK+sLkrdNTglAuuV7e8o/kaEE61Lvwt+f3YxgTCFTm/ksJUaY4plqJXIuu2JZ6dfubgLyGuKzWBLQwOgyMdmoPU0UFruJQPEZj6Gg4fMoZ0lMDoFAGvyGjk0BL5VGm82oDWCGQjma8+d1OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jds/dDrdZJQlieod+ArXrT2Ejfbwf2IsmXGemkNWARg=;
 b=Quj/TTBqrXIHfvrzPCTMIlkXETt/CvtVL6bVXpVPePs1TBwNzCQVgQYTS/iAmBkyQ32AeX6aTyaQupQ29g1J/TheVd0rL8CpTUaukxsIswi7ZTCGRuJMPLAY8xpgoZJn2etlHVX0UmIsSw8S2uSEvd7JpJNF2PlK+vfwWUEBMOLfcoo6oS1pnKsZR4ujTtBJvfE7lmXJBPgyMtNQ8BijcWRtB2KlIyUGDqEkpXKcqsKo0rf9CinCeQBDkmXfdCnsIbZuyCYTlVD+ECz6iJEwMv8GLl1CauIKroAf1jf6Rm10GE/H52AO3Qx2Yj1jyQU7jkx+2Ts0YDetOI7O0Uc2IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jds/dDrdZJQlieod+ArXrT2Ejfbwf2IsmXGemkNWARg=;
 b=lcxnyKomO3d/uCWEdzTvLNA4MoibJCKwRxM11mXmXvvXPlCh1CTcsdpRggHeNxfPiUW0zGHFcinJozAY4T50F7eb2YEMTDbxxG8eooOQN4r3Ga7KSTzZAERzQyQXNf/bUBXb34NtFHbMcQi7HwHfaXQ2et+h7mJNtxRBWYiCW3A=
Received: from MWHPR15MB1597.namprd15.prod.outlook.com (10.173.234.137) by
 MWHPR15MB1566.namprd15.prod.outlook.com (10.173.234.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.18; Fri, 24 Jan 2020 18:29:55 +0000
Received: from MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2]) by MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2%8]) with mapi id 15.20.2644.028; Fri, 24 Jan 2020
 18:29:55 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>, James Feist
 <james.feist@linux.intel.com>
Subject: Re: power button override
Thread-Topic: power button override
Thread-Index: AQHV0ksr3xkr2xM5GUmL71a8unTXDaf49/wAgACl3AA=
Date: Fri, 24 Jan 2020 18:29:54 +0000
Message-ID: <0017A7FA-E86C-4524-B53B-9129A968C7DB@fb.com>
References: <98EE6AEE-9440-4AA5-971A-833EA0342226@fb.com>
 <d01cf897-0c23-35dc-5f81-aca67d31b98a@linux.intel.com>
In-Reply-To: <d01cf897-0c23-35dc-5f81-aca67d31b98a@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:8efa]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af1e1d09-3a25-4243-e7ad-08d7a0fb68b8
x-ms-traffictypediagnostic: MWHPR15MB1566:
x-microsoft-antispam-prvs: <MWHPR15MB156645A4AB642859BA94DDABDD0E0@MWHPR15MB1566.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 02929ECF07
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(39860400002)(346002)(376002)(136003)(199004)(189003)(2616005)(4326008)(81166006)(8936002)(8676002)(2906002)(6512007)(5660300002)(3480700007)(64756008)(66446008)(66476007)(81156014)(33656002)(36756003)(4744005)(76116006)(7116003)(66946007)(66556008)(316002)(966005)(53546011)(6486002)(186003)(6506007)(110136005)(478600001)(71200400001)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1566;
 H:MWHPR15MB1597.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +CBIoDjALUFLwbJHI5hz41wj5h/byCq1rI5quwKViRKAttF0AOVyPca5qxm3U6mCfSPqQgp41NCQ4J5Xn+J5n5TYcJxIsT7PgCcdPqJ70wHwJBBqph2zAvBEgVL/a9BOxGr10FqLvZTQkPNQ4PSkmRCY1/pj0mVxfn30D6eHu3pc9318QbXm2rqUb3ufmi0wQfO7YDbExT5uO/rMhI3HA+JwI08ms19nG5EHIvvq2WisjPHsTiDte1Uz2S/XvTqj1jHwfyrndjBh2PtDVKehGj6K6Ci2mWM3807l/Z8OvSS9E83Xe3MYrSU9ntXPnn8OkqCbKac/mgq5NAy6tqOXflQ09FwKjH97X7JKQhd3p25soOpUlBjZBScEmR/OAhbEl6AbAX1h+1Uc4vMcnTV+HgJTKZ4L/BSWXjGAIQbe+hufI5fFg9/LLgbzPAR+CbT63P9CAsUlA1vAHWqabJTfap2R1Fed6ZBd1idNTI3aDoE=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <D3D601D9A9889F4EA9B0D48E5536D0B1@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: af1e1d09-3a25-4243-e7ad-08d7a0fb68b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2020 18:29:54.9069 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pjy9kEjX4ohatBHHX1ocFc729WTjWzZnW3VLFXypl5K+YsyS6++u65SiXoO0CYPvncm10dr+DFwkjQa5ceY26w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1566
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-24_06:2020-01-24,
 2020-01-24 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxlogscore=838
 spamscore=0 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

DQoNCu+7v09uIDEvMjMvMjAsIDQ6MzYgUE0sICJCaWxscywgSmFzb24gTSIgPGphc29uLm0uYmls
bHNAbGludXguaW50ZWwuY29tPiB3cm90ZToNCg0KICAgIA0KICAgIA0KICAgIE9uIDEvMjMvMjAy
MCA0OjEzIFBNLCBWaWpheSBLaGVta2Egd3JvdGU6DQogICAgPiBIaSBKYXNvbiwNCiAgICA+IA0K
ICAgID4gV2UgaGF2ZSBhIHJlcXVpcmVtZW50IG9mIHBvd2VyIGJ1dHRvbiBvdmVycmlkZS4gSSBk
b27igJl0IHNlZSB4ODYtcG93ZXIgDQogICAgPiBjb250cm9sIGRvZXNu4oCZdCBzdXBwb3J0IHRo
aXMgY3VycmVudGx5LiBEbyB5b3UgbmVlZCB0aGlzIGZlYXR1cmVzIG9yIGRvIA0KICAgID4geW91
IGhhdmUgYW55IGxvY2FsIHBhdGNoIGZvciB0aGlzLg0KICAgIEhpIFZpamF5LA0KICAgIA0KICAg
IHBvd2VyIGJ1dHRvbiBvdmVycmlkZSBpcyB1c2VkIGZvciB0aGUgIkZvcmNlIE9mZiIgYWN0aW9u
cyBpbiBwb3dlciBjb250cm9sOg0KICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3g4Ni1w
b3dlci1jb250cm9sL2Jsb2IvbWFzdGVyL3Bvd2VyLWNvbnRyb2wteDg2L3NyYy9wb3dlcl9jb250
cm9sLmNwcCNMNTAuDQoNClRoaXMgd2lsbCBub3Qgd29yayBpZiBjdXJyZW50IHN0YXR1cyBpcyBv
ZmYuIFRoaXMgc2hvdWxkIGp1c3Qgc2VuZCBwdWxzZSBpbiBhbnkgc3RhdHVzIG9uL29mZi4NCiAg
ICA+IA0KICAgID4gUmVnYXJkcw0KICAgID4gDQogICAgPiAtVmlqYXkNCiAgICA+IA0KICAgIA0K
DQo=
