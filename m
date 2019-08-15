Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5008E462
	for <lists+openbmc@lfdr.de>; Thu, 15 Aug 2019 07:11:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468F0x4xTrzDqLN
	for <lists+openbmc@lfdr.de>; Thu, 15 Aug 2019 15:11:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=3130004482=wilfredsmith@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="VFqL77W4"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="LTg9ofll"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468F076MRlzDqD9
 for <openbmc@lists.ozlabs.org>; Thu, 15 Aug 2019 15:10:42 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.27/8.16.0.27) with SMTP id x7F59eLZ024440;
 Wed, 14 Aug 2019 22:10:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=1AUjqLTSkYikam5ss9c7M6Nccz3wgCMFd+so/uPMsOo=;
 b=VFqL77W4I/lOANV5Uvq9y6xzprjNBa5Y7o6u7VWAMToWMdYP57UMFnHRFnwlkrnZz/Eg
 +IMcgehRyEwkcRHuPN32RHENLbWwJ1U3VhRl4YIHjlRCs+W9/hzy/qSOy0WkCSyhFnum
 CEd6N9mB0+Hmr8VWmM5AmYV+BacArlOUGfw= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0089730.ppops.net with ESMTP id 2ud0ff8534-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 14 Aug 2019 22:10:38 -0700
Received: from ash-exopmbx201.TheFacebook.com (2620:10d:c0a8:83::8) by
 ash-exhub103.TheFacebook.com (2620:10d:c0a8:82::c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 14 Aug 2019 22:10:37 -0700
Received: from ash-exhub204.TheFacebook.com (2620:10d:c0a8:83::4) by
 ash-exopmbx201.TheFacebook.com (2620:10d:c0a8:83::8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 14 Aug 2019 22:10:05 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.100) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 14 Aug 2019 22:10:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FmSmVv3mUhNQnIUMfxrtapDSsg3j08tyk3MUndXjk0fiqcFTC/RC9zgzDO71STJrqKSE0zRK1GcTP3G5L+toohQhOvIL3AbXah7fFBo9r74grCOgbxNnfvwsvnU28d/ArpBrIUSMut7kQhRU5HpUYnGEpf+DUBQb3cJU5lccEQBoVmQAdoNEASDIM7dec8ji+rgqAl/pACE93WJuKEENsKHY0RLhlsXkBqKCqtPwbfc6Heaz8x0dGSwF+0KoxSnNuhwuX8D+xquVq0urubdAk76GcRNb6ZtTP0rWrvTHXSgUz0EyvOtjo2VIqW1KsELlzg3siusZg0JRJCNj8mhSBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1AUjqLTSkYikam5ss9c7M6Nccz3wgCMFd+so/uPMsOo=;
 b=NrGUgKg4H5R7icUjN7LI1FTlNpkhsZtO1/hlYeYKxhWXN/zQjHsnYEv2qAfsiD5Ld6FIVb3LntTlBVATSS3a6TkLrcyAVKIEje5dq7t7HqcR/aXozrliVOONBateoddXhLQgUtvFdfZ5YXzeizf4e9dZCAGaBelnUsxg3erS74gJBQfc+Kz3udk3jxu2qU6fBBmc8O0wvwB0Fg+VREBtXoDbC4ADxvNbKMQdtP+Zt/pM51cKUyC8uETgMLJZoIp4QrzKGSJ6cJfOLcOloV1SKgQIUWK7Lt91E4sOxkNGpNBUfPpJA0mHiWpuuvU05TsBGdmeLuiTpfZbyreX2wvQng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1AUjqLTSkYikam5ss9c7M6Nccz3wgCMFd+so/uPMsOo=;
 b=LTg9oflle8ugc5PMDv7LehkrJ0jcyOg/jPa1EHtjWIvYXBKtWxb+ak2G9QLyiQmBmiHjAHuwZtEesEDKE2Nz7FS90OjqEmpLH/mL5rWUPZOH1qdeE10qeI7Q8DHbhFHM7+0FNvxjuLDpbQM9kb01q5g150PZ8Wn0T4E95YcOg6k=
Received: from MN2PR15MB3680.namprd15.prod.outlook.com (52.132.173.209) by
 MN2PR15MB2831.namprd15.prod.outlook.com (20.179.148.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.20; Thu, 15 Aug 2019 05:10:03 +0000
Received: from MN2PR15MB3680.namprd15.prod.outlook.com
 ([fe80::b9ff:f089:c837:4a20]) by MN2PR15MB3680.namprd15.prod.outlook.com
 ([fe80::b9ff:f089:c837:4a20%5]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 05:10:03 +0000
From: Wilfred Smith <wilfredsmith@fb.com>
To: Emily Shaffer <emilyshaffer@google.com>
Subject: Re: Historical Sensor Information
Thread-Topic: Historical Sensor Information
Thread-Index: AQHVUvSnCUL8h6OlREa1Ga5JzQ1Uc6b7gsyAgAAmrQA=
Date: Thu, 15 Aug 2019 05:10:03 +0000
Message-ID: <CF903FDC-3D9E-4FB9-8A3E-34ABB5BDD6B8@fb.com>
References: <FB0EDEFC-F92E-4F6E-B6BC-B0C5E7AD6E73@fb.com>
 <CAJoAoZm9QpFgRdCsxoaNuCu1YONm_CFUp1fhdFj+h5uZhuCzAw@mail.gmail.com>
In-Reply-To: <CAJoAoZm9QpFgRdCsxoaNuCu1YONm_CFUp1fhdFj+h5uZhuCzAw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [24.4.169.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 48f74a53-bb1d-4d10-b064-08d7213ed4a6
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR15MB2831; 
x-ms-traffictypediagnostic: MN2PR15MB2831:
x-microsoft-antispam-prvs: <MN2PR15MB2831A885B9BCE0422E8CC47DBDAC0@MN2PR15MB2831.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(396003)(376002)(366004)(136003)(346002)(189003)(199004)(51444003)(86362001)(102836004)(26005)(8936002)(186003)(66476007)(66556008)(64756008)(66446008)(76176011)(6506007)(7116003)(53546011)(91956017)(76116006)(66946007)(6512007)(33656002)(66066001)(2616005)(11346002)(486006)(476003)(446003)(2906002)(229853002)(6486002)(6436002)(6916009)(3480700005)(5660300002)(478600001)(3846002)(36756003)(6116002)(256004)(8676002)(81156014)(81166006)(99286004)(71190400001)(71200400001)(305945005)(7736002)(316002)(14454004)(53936002)(6246003)(25786009)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR15MB2831;
 H:MN2PR15MB3680.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hr/Si/tdSYHvDqY7MMDhEtE9GrFy/O4x9O3iwym4+f7wu5mtKLhlx94PXugpCeQjfvjRoYC8rVTrlRwcD1vjH1+IOZV9LbsK304rWZFLLH6mmEEBO9bkTTR/1r1WvEBstF2MRILbcwgT4+kLJKHqGcxGWT7ygj1y8j8sdVLiiTzlRbZ0CeITlK530GWbUmzS5O1EgLUhCDPOxtu6/qfTJUcFqOiDmZEuZn+Axt/Ate1MKa0CYLVyFzSb0wX9g+kSeWp9mlUaDYD3G7F7HMpgQPdLWNMYhIOrpbQf//r4yyLMZJRVFi95Zf1DE8zrl0VQtO+gAjY16InoQN39Rgs56I/k5C78CkJg5JQPfNsgKT/zhtQuouwlwaxX0wf1M7rEAxrY4SE+Bj38rxG4KK0xl1z//hzmRfdS52J/BRQNe1I=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C520225482B9114AACD672D9309C66EB@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f74a53-bb1d-4d10-b064-08d7213ed4a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 05:10:03.3668 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QYqezgECpSHgavptATZUcr6tTTIovvLkdkR5CWx2cM2T/kMdLbx0djrkLiKGZSYrIEzyhxDHDUf/x7bBCs4VpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR15MB2831
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-15_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908150054
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

RW1pbHksDQoNCknigJlsbCBuZWVkIHRvIGNoZWNrIHdpdGggbXkgY29tcGF0cmlvdHMgaGVyZSBh
dCBGYWNlYm9vayBmb3Igb3VyIHNwZWNpZmljIHVzZSBjYXNlcy4NCg0KQ2FuIHlvdSBwb2ludCBt
ZSB0byB0aGUgZGlzY3Vzc2lvbiBvbiBtZXRyaWNzIHJlcG9ydGluZz8NCg0KV2lsZnJlZA0KIA0K
DQo+IE9uIEF1ZyAxNCwgMjAxOSwgYXQgNzo1MSBQTSwgRW1pbHkgU2hhZmZlciA8ZW1pbHlzaGFm
ZmVyQGdvb2dsZS5jb20+IHdyb3RlOg0KPiANCj4gT24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgNDow
NSBQTSBXaWxmcmVkIFNtaXRoIDx3aWxmcmVkc21pdGhAZmIuY29tPiB3cm90ZToNCj4+IA0KPj4g
SSBwcmVzdW1lIG1vc3QgdmVuZG9ycyBkZXNpcmUgdGhlIGFiaWxpdHkgdG8gcXVlcnkgaGlzdG9y
aWNhbCBzZW5zb3IgaW5mb3JtYXRpb24gZnJvbSB0aGUgQk1DLg0KPj4gICAgICAgIEhhcyB0aGlz
IGZlYXR1cmUgYmVlbiBpbXBsZW1lbnRlZCBhbHJlYWR5PyBJZiBzbywgcGxlYXNlIGRpcmVjdCBt
ZS4NCj4+ICAgICAgICBJZiBub3QsIGhhcyBzb21lb25lIGFscmVhZHkgYmVndW4gZGV2ZWxvcG1l
bnQ/DQo+PiAgICAgICAgSXMgdGhlcmUgYW4gZXhpc3Rpbmcgc3BlY2lmaWNhdGlvbiBvciB3cml0
ZS11cD8NCj4+ICAgICAgICBBbnkg4oCYZHJ1dGhlcnMgb3IgcHJlZmVyZW5jZXMgb24gaG93IEkg
bWlnaHQgcHJvY2VlZCBzdWNoIHRoYXQgbXkgZWZmb3J0IGJlbmVmaXRzIHRoZSB3aWRlciBjb21t
dW5pdHk/DQo+PiANCj4+IFdpbGZyZWQNCj4gDQo+IEkgdGhpbmsgdGhhdCB0aGUgc3BhY2UgY29u
c3RyaWN0aW9uIG9uIG1hbnkgQk1DcyBoYXMgbGVmdCBmb2xrcyB0bw0KPiBpbnN0ZWFkIHF1ZXJ5
IG92ZXIgSVBNSS9SZWRmaXNoIGFuZCBjb21waWxlIGhpc3RvcmljYWwgaW5mb3JtYXRpb24NCj4g
ZWxzZXdoZXJlLiBDYW4geW91IHRlbGwgYSBsaXR0bGUgbW9yZSBhYm91dCB0aGUgdXNlIGNhc2Ug
YW5kIGluZGljYXRlDQo+IHdoeSB5b3Ugd291bGQgcmF0aGVyIHNhdmUgaGlzdG9yeSBvbiB0aGUg
Qk1DIHRoYW4gb2ZmIHRoZSBCTUM/DQo+IA0KPiBBIHJlbGF0ZWQgdG9waWMgd2hpY2ggLSBhcyBJ
IHJlY2FsbCAtIHdhcyBkaXNjdXNzZWQgYW5kIG5ldmVyDQo+IGltcGxlbWVudGVkIGlzIHRoZSB0
b3BpYyBvZiBtZXRyaWNzIHJlcG9ydGluZy4gSXQncyBwb3NzaWJsZSB0aGF0IHRoZQ0KPiBjb21t
dW5pdHkgaGFzIG1vdmVkIGZ1cnRoZXIgb24gdGhlc2UgdG9waWNzIHRoYW4gSSByZW1lbWJlciwg
dGhvdWdoLA0KPiBhcyBJJ3ZlIGJlZW4gZmFpcmx5IG91dCBvZiB0aGUgbG9vcCBsYXRlbHkuDQo+
IC0gRW1pbHkNCg0K
