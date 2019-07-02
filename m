Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 210575D690
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2019 21:05:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dYbH3Y9nzDqWb
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2019 05:05:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=208674a22d=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="WZpXcvqX"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="gMdWG9l2"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dYZj4rNxzDqVv
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jul 2019 05:04:43 +1000 (AEST)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x62IVbwa006462; Tue, 2 Jul 2019 11:34:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=eQbkMaYiBlhp4s72mgPspeGD1eDUTIAhxz7KmdrsIvI=;
 b=WZpXcvqXC25QhC55pjxIAPitdXlEUFPzzcaDNoOWQjwP8nYwQ4UgiNIPMYxCJB16sd/J
 He0RYwldakkHPPxwUfiiFhRhR/aRMlPsz9VxFEREKa9BTIYIfqtr3AGkny2WC3gAMeV4
 Hr0zo3IY9yGRhHNvNUT7UOk1Vmu3UwjaaM8= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2tgafggksu-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 02 Jul 2019 11:34:22 -0700
Received: from ash-exopmbx201.TheFacebook.com (2620:10d:c0a8:83::8) by
 ash-exhub101.TheFacebook.com (2620:10d:c0a8:82::e) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 2 Jul 2019 11:34:17 -0700
Received: from ash-exhub203.TheFacebook.com (2620:10d:c0a8:83::5) by
 ash-exopmbx201.TheFacebook.com (2620:10d:c0a8:83::8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 2 Jul 2019 11:34:05 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.102) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 2 Jul 2019 11:34:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQbkMaYiBlhp4s72mgPspeGD1eDUTIAhxz7KmdrsIvI=;
 b=gMdWG9l2Cy2Vo4BF2TQuAKV/eF2JzjB+iS/dwHlaFALzAwU8z+7ZFcOJ9fhnnzpn+MKIjXh8zk2Sxn9vyzthdFp12Rqh2zfHmQ1z4xaCKsurjAeMJsxGrLM1CdkB4ETl4Oa4QX9VGkSAiI1lXcqdJNo9NMHgNBf7PvylNNCv63M=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1141.namprd15.prod.outlook.com (10.172.176.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Tue, 2 Jul 2019 18:34:04 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::2869:360d:bfc4:de68]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::2869:360d:bfc4:de68%7]) with mapi id 15.20.2032.019; Tue, 2 Jul 2019
 18:34:04 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Artem Senichev <artemsen@gmail.com>
Subject: Re: obmc console history
Thread-Topic: obmc console history
Thread-Index: AQHVLFdLPkq8+/IBqkCiQwjkzhHXQKauacyAgAcrLwCAAWNfgIAAQxCA
Date: Tue, 2 Jul 2019 18:34:04 +0000
Message-ID: <87A122C1-6026-40C7-92F3-2A8054EF9B11@fb.com>
References: <BB3AF06A-F1A5-4999-8D8F-BD58F39D68D3@fb.com>
 <0949cd7146560649af469c88e0e38c18@linux.vnet.ibm.com>
 <6975825B-D712-4004-94A9-2E70DE34F5DE@fb.com>
 <CAHsrh9KjVJQi3hmNsMMBhq8dVa0c_js4wysPBi37x9oV65QCKw@mail.gmail.com>
In-Reply-To: <CAHsrh9KjVJQi3hmNsMMBhq8dVa0c_js4wysPBi37x9oV65QCKw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::1:9af6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5822d4b6-035f-466f-7ba5-08d6ff1bdc27
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CY4PR15MB1141; 
x-ms-traffictypediagnostic: CY4PR15MB1141:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <CY4PR15MB114155364A8928E281B46E45DDF80@CY4PR15MB1141.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(39860400002)(136003)(346002)(396003)(45914002)(199004)(189003)(46003)(186003)(68736007)(229853002)(102836004)(6486002)(5660300002)(256004)(486006)(4744005)(54906003)(64756008)(6506007)(66476007)(3480700005)(81166006)(966005)(316002)(81156014)(73956011)(71200400001)(71190400001)(14454004)(305945005)(91956017)(66556008)(53546011)(8936002)(76116006)(8676002)(25786009)(7736002)(66946007)(2906002)(6916009)(1411001)(7116003)(53936002)(36756003)(6436002)(6512007)(6306002)(66446008)(6246003)(76176011)(6116002)(4326008)(446003)(476003)(2616005)(478600001)(11346002)(86362001)(99286004)(33656002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1141;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lRFpnsLhgYxGN6q5Jzfj5YO9bMwkE92A8sGppqIneyZmjKdPW2PaEfN9avJpsiJ/ADtXr4muhlHjtUX9PXJZZhrUvTl4m32NKPRjgaergYsLNYdokNKugRIlfJ9ET9aataqo32a3JTPWOIDgi6Xztj2+suJz1hpRmdBrrjcLe1y5e2laBTmEkG9UKaUSgVgA+YJE3s5hsw6yd2Dx/uwWJFDCbrFYwHCOUjea540k7BRO7FS8aOVKODVHzy2bF2zoM8cXQ8enOq/wbjALIv9XWpVSa0stzTpXvtM59LPw3HNbYcKS8vepR0bV82CK5CKbdXuqXZkRzpkihEUJc7C+Y3B3zUPsarWiu0TxkIlIH4L5pS1rncwAZJacZJinhXOydyjk+PUQBPWhjxHpoGtLBkAH8/usWGkM2HaNO6jawjs=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB481D308153254E848C330F799D5470@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5822d4b6-035f-466f-7ba5-08d6ff1bdc27
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 18:34:04.0877 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vijaykhemka@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1141
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-02_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907020203
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 openbmc <openbmc-bounces+jrey=linux.ibm.com@lists.ozlabs.org>,
 Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDcvMi8xOSwgMTI6MzQgQU0sICJBcnRlbSBTZW5pY2hldiIgPGFydGVtc2VuQGdt
YWlsLmNvbT4gd3JvdGU6DQoNCiAgICBUaGVyZSBpcyBubyBhbnkgY29uZmlnIGZpbGVzIHVzZWQg
aW4gcnVudGltZSwgeW91IG1heSBzZXQgb3B0aW9ucyB2aWENCiAgICBjb21tYW5kIGFyZ3VtZW50
cyBvciBjb25maWd1cmF0aW9uIHBhcmFtZXRlcnMgZHVyaW5nIGJ1aWxkLg0KICAgIE1ha2Ugc3Vy
ZSB5b3UgaGF2ZSB1bml4IGRvbWFpbiBzb2NrZXQgZmlsZSBkZWZpbmVkIGhlcmU6DQogICAgaHR0
cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3ItaG9zdGxvZ2dlci9ibG9iL2I4Y2YyNmZl
OTMzYzdmMDIwZjUxOTViOTU3NWY1OTZiOWNiMjM3MTkvc3JjL2xvZ19tYW5hZ2VyLmNwcCNMMzgN
CiAgICBUaGlzIHNvY2tldCBmaWxlIGlzIGNyZWF0ZWQgYnkgb2JtYy1jb25zb2xlLXNlcnZlci4N
Cg0KVGhhbmtzDQogICAgDQogICAgLS0NCiAgICBCZXN0IHJlZ2FyZHMsDQogICAgQXJ0ZW0gU2Vu
aWNoZXYNCiAgICANCiAgICBPbiBNb24sIEp1bCAxLCAyMDE5IGF0IDg6MjMgUE0gVmlqYXkgS2hl
bWthIDx2aWpheWtoZW1rYUBmYi5jb20+IHdyb3RlOg0KICAgID4NCiAgICA+DQogICAgPg0KICAg
ID4gT24gNi8yNi8xOSwgMTo1MiBQTSwgIkpvc2VwaCBSZXlub2xkcyIgPGpyZXlAbGludXguaWJt
LmNvbT4gd3JvdGU6DQogICAgPg0KICAgID4gICAgIE9uIDIwMTktMDYtMjYgMTQ6NDIsIFZpamF5
IEtoZW1rYSB3cm90ZToNCiAgICA+ICAgICA+IEhpLA0KICAgID4gICAgID4NCiAgICA+ICAgICA+
IERvIHdlIGhhdmUgb3B0aW9uIG9mIHN0b3Jpbmcgb2JtYyBjb25zb2xlIGhpc3Rvcnkgc29tZXdo
ZXJlIHdoaWNoIGNhbg0KICAgID4gICAgID4gYmUgcmVmZXJyZWQgbGF0ZXIgb24uDQogICAgPg0K
ICAgID4gICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bob3NwaG9yLWhvc3Rsb2dnZXIN
CiAgICA+DQogICAgPiBJIGFtIHNlZWluZyBmb2xsb3dpbmcgZXJyb3IsIGlzIHRoZXJlIGFueSBj
b25maWcgcmVxdWlyZW1lbnQgZm9yIHJ1bm5pbmcgdGhpcy4NCiAgICA+DQogICAgPiBVbmFibGUg
dG8gY29ubmVjdCB0byBob3N0IGxvZyBzb2NrZXQ6IGVycm9yIFsxMTFdIENvbm5lY3Rpb24gcmVm
dXNlZA0KICAgID4NCiAgICA+DQogICAgPiAgICAgPiBSZWdhcmRzDQogICAgPiAgICAgPg0KICAg
ID4gICAgID4gLVZpamF5DQogICAgPg0KICAgID4NCiAgICANCg0K
