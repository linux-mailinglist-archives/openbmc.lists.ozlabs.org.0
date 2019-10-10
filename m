Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 530D0D3344
	for <lists+openbmc@lfdr.de>; Thu, 10 Oct 2019 23:23:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46q3wG4hktzDqSK
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2019 08:23:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=5186784b43=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="qsjJvFMD"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="VtgNsq6V"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46q3vY3YjmzDqQq;
 Fri, 11 Oct 2019 08:22:31 +1100 (AEDT)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9ALFYRh029405; Thu, 10 Oct 2019 14:21:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=y78Czm1x9bfyRxlNHwf2RE2JgReMlA8xZbpff7ElI7o=;
 b=qsjJvFMDT68k3tEke6xFhO0hI6oHFDdeKlA0/2ZQ4/lHUzpiW8O693dxo00Dn9WGJsTt
 Keclyqt4dHTLhi45VjwgTzKuDiLI0qvSJB4e0MLqOeb4G8R52MQRboeNJngFM0KM3yyW
 142zC4CVWb0ATwo/g1ChC2IC6rg1oc1GM14= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2vj65eadym-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 10 Oct 2019 14:21:00 -0700
Received: from ash-exhub103.TheFacebook.com (2620:10d:c0a8:82::c) by
 ash-exhub203.TheFacebook.com (2620:10d:c0a8:83::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 10 Oct 2019 14:20:57 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.174) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 10 Oct 2019 14:20:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EtG9CJhnu54Rz+JtiPtS6Mf8auMH5rN38PBc62qEkLFh/90ncIChN7TE/rjR+65UMU4IV+feet/chl6bJnmd2XKZLfaP7TCUBG/OBLP2QqbDWZ4oJp8r2qFJ9cUUA/dk0pa0D159vaLTaYOpVt84+DY7Jiqm5E62bBQxbhXqtpSWQuJ5Y8JiPuc/WxkScXyEvBrLeGNIV5WwU4QRZ2wchRewLB7hzG6ochnQVo/+SR51hOIWEFUxB0YA/5nud7X7ssI8U2Wc/kxPqgbIuRHVHteYPVHbAU20c1fh4wgYuBCSSmxizKcgE0AxxbWJS3YIX5QqcArehXcDcw/Xv90Zdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y78Czm1x9bfyRxlNHwf2RE2JgReMlA8xZbpff7ElI7o=;
 b=lmUWnignFXNlFHGjdPAXvrhIERYLmE95OoaazAqYaQz2T7JwSanr9fR/njdaos62PDj3kRlz+PPlGcFUyYbMwpUY2i9crsgFFPkymrcI26VeEeHbSt8tsUFFp8ZMm5cfZQ091iqm9OC6m9AYTKcEMjBt9LAOv6Zu2YTX+t7x2Kn8KctFaqkVb+uT/C7T5Nkk7XmlaCtyarfa0o9MrVxaMCNxufdeEBmg7b42EFiUVJWR2uvy5311ZWLrEAPxt5KhEuAEbV08M9A7A+tF22ZVd7YoDlkEKtIJR+Vm+2XbEUjZ9Kvyj+j6cfQa1km8w9CKvLigJwfvfICkHp6HT2xR/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y78Czm1x9bfyRxlNHwf2RE2JgReMlA8xZbpff7ElI7o=;
 b=VtgNsq6Va2FxXhV1iPeG3HcR0d+ZS8ONZH32VCurHoQrdTzEcCRtP24ToQfnRTxAB30qyl2Jm3nANJPNsQM3ywPKc+yLzCWjHpMFw05q1z4KNflGkHcj0SlSLRbrCv904dmlQrYbeoWKwv+666RDRtD61Bxzbom78omXOJ91qL4=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1344.namprd15.prod.outlook.com (10.175.2.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Thu, 10 Oct 2019 21:20:57 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::24c9:a1ce:eeeb:9246]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::24c9:a1ce:eeeb:9246%10]) with mapi id 15.20.2347.016; Thu, 10 Oct
 2019 21:20:57 +0000
From: Tao Ren <taoren@fb.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Brendan Higgins
 <brendanhiggins@google.com>, Wolfram Sang <wsa@the-dreams.de>, "Benjamin
 Herrenschmidt" <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, "Rob Herring" <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "Andrew Jeffery" <andrew@aj.id.au>, Cedric Le Goater <clg@kaod.org>
Subject: Re: [PATCH] i2c: aspeed: fix master pending state handling
Thread-Topic: [PATCH] i2c: aspeed: fix master pending state handling
Thread-Index: AQHVfud35WuTlVbA0UqacW6NAtrttKdUY2MA
Date: Thu, 10 Oct 2019 21:20:56 +0000
Message-ID: <3ea1c0d5-47f1-bf8c-6b2d-2ea8d3f93471@fb.com>
References: <20191009212034.20325-1-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20191009212034.20325-1-jae.hyun.yoo@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR1401CA0012.namprd14.prod.outlook.com
 (2603:10b6:301:4b::22) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::2:1271]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56a53730-77d8-45a3-2904-08d74dc7bd51
x-ms-traffictypediagnostic: MWHPR15MB1344:
x-microsoft-antispam-prvs: <MWHPR15MB1344916908FEF7E4DEA1B9BAB2940@MWHPR15MB1344.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 018632C080
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(346002)(39860400002)(366004)(396003)(376002)(199004)(189003)(7736002)(11346002)(8936002)(6506007)(52116002)(64756008)(76176011)(5660300002)(386003)(316002)(102836004)(53546011)(66446008)(478600001)(14454004)(305945005)(66476007)(66556008)(66946007)(6246003)(2616005)(446003)(46003)(256004)(476003)(486006)(71200400001)(4326008)(71190400001)(25786009)(6512007)(6116002)(6486002)(31696002)(229853002)(36756003)(2906002)(86362001)(6436002)(186003)(58126008)(8676002)(14444005)(7416002)(31686004)(54906003)(81156014)(81166006)(99286004)(65806001)(110136005)(65956001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1344;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zfqAk/vAlnH0Ch3xKFcTggHsX8I96mesnHcEaSU/w/BJlPdugesKtKFZc3MDpcwP+SHi4UNyTUiPDsQUZv6Sx72v+kTjHZ6LArsLMQPaWZC2F4mcQ4DyO2EyiV27vkXm87ljc85wFEx0as1+Zk/1BOtpetsa9n3Qe/kK8vi6KQXvRa+j+0Xrg4z8iHqgJs5zlw9zLzvhdn7VG9uEp1MnQUrnvY/8LfitEKqe2Do2kr5u06j5pLKRQ6TG6YXqwmboiZBz2SvuQgiOsUEVx46PuEbw4e2O2WMoDPVQDbvumJfWFzfP6RfIYfmjoI0PZQJUKiXfNXsK6xTcetdgxfjVxjQ8+0C79pM/LExoj1nqhK8dLGl8xjGoThZO8qpKdbcNeKOmZbPJQfKZbOpk6LNBquvji167DuKc8NccOiJzuYU=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <A053BE086CCCF6439AB4C13CF4C23ADE@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a53730-77d8-45a3-2904-08d74dc7bd51
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2019 21:20:56.8406 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /60/uixXVNWlJDSaSZYU/qCi3oyJF6vWHVt4Rui1vYdsYqBdndFFMn5YyQPyvPe9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1344
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-10_07:2019-10-10,2019-10-10 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910100182
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gMTAvOS8xOSAyOjIwIFBNLCBKYWUgSHl1biBZb28gd3JvdGU6DQo+IEluIGNhc2Ugb2YgbWFz
dGVyIHBlbmRpbmcgc3RhdGUsIGl0IHNob3VsZCBub3QgdHJpZ2dlciBhIG1hc3Rlcg0KPiBjb21t
YW5kLCBvdGhlcndpc2UgZGF0YSBjb3VsZCBiZSBjb3JydXB0ZWQgYmVjYXVzZSB0aGlzIEgvVyBz
aGFyZXMNCj4gdGhlIHNhbWUgZGF0YSBidWZmZXIgZm9yIHNsYXZlIGFuZCBtYXN0ZXIgb3BlcmF0
aW9ucy4gSXQgYWxzbyBtZWFucw0KPiB0aGF0IEgvVyBjb21tYW5kIHF1ZXVlIGhhbmRsaW5nIGlz
IHVucmVsaWFibGUgYmVjYXVzZSBvZiB0aGUgYnVmZmVyDQo+IHNoYXJpbmcgaXNzdWUuIFRvIGZp
eCB0aGlzIGlzc3VlLCBpdCBjbGVhcnMgY29tbWFuZCBxdWV1ZSBpZiBhDQo+IG1hc3RlciBjb21t
YW5kIGlzIHF1ZXVlZCBpbiBwZW5kaW5nIHN0YXRlIHRvIHVzZSBTL1cgc29sdXRpb24NCj4gaW5z
dGVhZCBvZiBIL1cgY29tbWFuZCBxdWV1ZSBoYW5kbGluZy4gQWxzbywgaXQgcmVmaW5lcyByZXN0
YXJ0aW5nDQo+IG1lY2hhbmlzbSBvZiB0aGUgcGVuZGluZyBtYXN0ZXIgY29tbWFuZC4NCj4gDQo+
IEZpeGVzOiAyZTU3YjdjZWJiOTggKCJpMmM6IGFzcGVlZDogQWRkIG11bHRpLW1hc3RlciB1c2Ug
Y2FzZSBzdXBwb3J0IikNCj4gU2lnbmVkLW9mZi1ieTogSmFlIEh5dW4gWW9vIDxqYWUuaHl1bi55
b29AbGludXguaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXNw
ZWVkLmMgfCA1NCArKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBj
aGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWFzcGVlZC5jIGIvZHJpdmVycy9pMmMvYnVzc2Vz
L2kyYy1hc3BlZWQuYw0KPiBpbmRleCBmYTY2OTUxYjA1ZDAuLjdiMDk4ZmY1ZjVkZCAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hc3BlZWQuYw0KPiArKysgYi9kcml2ZXJz
L2kyYy9idXNzZXMvaTJjLWFzcGVlZC5jDQo+IEBAIC0xMDgsNiArMTA4LDEyIEBADQo+ICAjZGVm
aW5lIEFTUEVFRF9JMkNEX1NfVFhfQ01ECQkJCUJJVCgyKQ0KPiAgI2RlZmluZSBBU1BFRURfSTJD
RF9NX1RYX0NNRAkJCQlCSVQoMSkNCj4gICNkZWZpbmUgQVNQRUVEX0kyQ0RfTV9TVEFSVF9DTUQJ
CQkJQklUKDApDQo+ICsjZGVmaW5lIEFTUEVFRF9JMkNEX01BU1RFUl9DTURTX01BU0sJCQkJCSAg
ICAgICBcDQo+ICsJCShBU1BFRURfSTJDRF9NX1NUT1BfQ01EIHwJCQkJICAgICAgIFwNCj4gKwkJ
IEFTUEVFRF9JMkNEX01fU19SWF9DTURfTEFTVCB8CQkJCSAgICAgICBcDQo+ICsJCSBBU1BFRURf
STJDRF9NX1JYX0NNRCB8CQkJCQkgICAgICAgXA0KPiArCQkgQVNQRUVEX0kyQ0RfTV9UWF9DTUQg
fAkJCQkJICAgICAgIFwNCj4gKwkJIEFTUEVFRF9JMkNEX01fU1RBUlRfQ01EKQ0KPiAgDQo+ICAv
KiAweDE4IDogSTJDRCBTbGF2ZSBEZXZpY2UgQWRkcmVzcyBSZWdpc3RlciAgICovDQo+ICAjZGVm
aW5lIEFTUEVFRF9JMkNEX0RFVl9BRERSX01BU0sJCQlHRU5NQVNLKDYsIDApDQo+IEBAIC0zMzYs
MTggKzM0MiwxOSBAQCBzdGF0aWMgdm9pZCBhc3BlZWRfaTJjX2RvX3N0YXJ0KHN0cnVjdCBhc3Bl
ZWRfaTJjX2J1cyAqYnVzKQ0KPiAgCXN0cnVjdCBpMmNfbXNnICptc2cgPSAmYnVzLT5tc2dzW2J1
cy0+bXNnc19pbmRleF07DQo+ICAJdTggc2xhdmVfYWRkciA9IGkyY184Yml0X2FkZHJfZnJvbV9t
c2cobXNnKTsNCj4gIA0KPiAtCWJ1cy0+bWFzdGVyX3N0YXRlID0gQVNQRUVEX0kyQ19NQVNURVJf
U1RBUlQ7DQo+IC0NCj4gICNpZiBJU19FTkFCTEVEKENPTkZJR19JMkNfU0xBVkUpDQo+ICAJLyoN
Cj4gIAkgKiBJZiBpdCdzIHJlcXVlc3RlZCBpbiB0aGUgbWlkZGxlIG9mIGEgc2xhdmUgc2Vzc2lv
biwgc2V0IHRoZSBtYXN0ZXINCj4gIAkgKiBzdGF0ZSB0byAncGVuZGluZycgdGhlbiBIL1cgd2ls
bCBjb250aW51ZSBoYW5kbGluZyB0aGlzIG1hc3Rlcg0KPiAgCSAqIGNvbW1hbmQgd2hlbiB0aGUg
YnVzIGNvbWVzIGJhY2sgdG8gdGhlIGlkbGUgc3RhdGUuDQo+ICAJICovDQo+IC0JaWYgKGJ1cy0+
c2xhdmVfc3RhdGUgIT0gQVNQRUVEX0kyQ19TTEFWRV9JTkFDVElWRSkNCj4gKwlpZiAoYnVzLT5z
bGF2ZV9zdGF0ZSAhPSBBU1BFRURfSTJDX1NMQVZFX0lOQUNUSVZFKSB7DQo+ICAJCWJ1cy0+bWFz
dGVyX3N0YXRlID0gQVNQRUVEX0kyQ19NQVNURVJfUEVORElORzsNCj4gKwkJcmV0dXJuOw0KPiAr
CX0NCj4gICNlbmRpZiAvKiBDT05GSUdfSTJDX1NMQVZFICovDQo+ICANCj4gKwlidXMtPm1hc3Rl
cl9zdGF0ZSA9IEFTUEVFRF9JMkNfTUFTVEVSX1NUQVJUOw0KPiAgCWJ1cy0+YnVmX2luZGV4ID0g
MDsNCj4gIA0KPiAgCWlmIChtc2ctPmZsYWdzICYgSTJDX01fUkQpIHsNCj4gQEAgLTQyMiwyMCAr
NDI5LDYgQEAgc3RhdGljIHUzMiBhc3BlZWRfaTJjX21hc3Rlcl9pcnEoc3RydWN0IGFzcGVlZF9p
MmNfYnVzICpidXMsIHUzMiBpcnFfc3RhdHVzKQ0KPiAgCQl9DQo+ICAJfQ0KPiAgDQo+IC0jaWYg
SVNfRU5BQkxFRChDT05GSUdfSTJDX1NMQVZFKQ0KPiAtCS8qDQo+IC0JICogQSBwZW5kaW5nIG1h
c3RlciBjb21tYW5kIHdpbGwgYmUgc3RhcnRlZCBieSBIL1cgd2hlbiB0aGUgYnVzIGNvbWVzDQo+
IC0JICogYmFjayB0byBpZGxlIHN0YXRlIGFmdGVyIGNvbXBsZXRpbmcgYSBzbGF2ZSBvcGVyYXRp
b24gc28gY2hhbmdlIHRoZQ0KPiAtCSAqIG1hc3RlciBzdGF0ZSBmcm9tICdwZW5kaW5nJyB0byAn
c3RhcnQnIGF0IGhlcmUgaWYgc2xhdmUgaXMgaW5hY3RpdmUuDQo+IC0JICovDQo+IC0JaWYgKGJ1
cy0+bWFzdGVyX3N0YXRlID09IEFTUEVFRF9JMkNfTUFTVEVSX1BFTkRJTkcpIHsNCj4gLQkJaWYg
KGJ1cy0+c2xhdmVfc3RhdGUgIT0gQVNQRUVEX0kyQ19TTEFWRV9JTkFDVElWRSkNCj4gLQkJCWdv
dG8gb3V0X25vX2NvbXBsZXRlOw0KPiAtDQo+IC0JCWJ1cy0+bWFzdGVyX3N0YXRlID0gQVNQRUVE
X0kyQ19NQVNURVJfU1RBUlQ7DQo+IC0JfQ0KPiAtI2VuZGlmIC8qIENPTkZJR19JMkNfU0xBVkUg
Ki8NCj4gLQ0KPiAgCS8qIE1hc3RlciBpcyBub3QgY3VycmVudGx5IGFjdGl2ZSwgaXJxIHdhcyBm
b3Igc29tZW9uZSBlbHNlLiAqLw0KPiAgCWlmIChidXMtPm1hc3Rlcl9zdGF0ZSA9PSBBU1BFRURf
STJDX01BU1RFUl9JTkFDVElWRSB8fA0KPiAgCSAgICBidXMtPm1hc3Rlcl9zdGF0ZSA9PSBBU1BF
RURfSTJDX01BU1RFUl9QRU5ESU5HKQ0KPiBAQCAtNDYyLDExICs0NTUsMTUgQEAgc3RhdGljIHUz
MiBhc3BlZWRfaTJjX21hc3Rlcl9pcnEoc3RydWN0IGFzcGVlZF9pMmNfYnVzICpidXMsIHUzMiBp
cnFfc3RhdHVzKQ0KPiAgI2lmIElTX0VOQUJMRUQoQ09ORklHX0kyQ19TTEFWRSkNCj4gIAkJLyoN
Cj4gIAkJICogSWYgYSBwZWVyIG1hc3RlciBzdGFydHMgYSB4ZmVyIGltbWVkaWF0ZWx5IGFmdGVy
IGl0IHF1ZXVlcyBhDQo+IC0JCSAqIG1hc3RlciBjb21tYW5kLCBjaGFuZ2UgaXRzIHN0YXRlIHRv
ICdwZW5kaW5nJyB0aGVuIEgvVyB3aWxsDQo+IC0JCSAqIGNvbnRpbnVlIHRoZSBxdWV1ZWQgbWFz
dGVyIHhmZXIganVzdCBhZnRlciBjb21wbGV0aW5nIHRoZQ0KPiAtCQkgKiBzbGF2ZSBtb2RlIHNl
c3Npb24uDQo+ICsJCSAqIG1hc3RlciBjb21tYW5kLCBjbGVhciB0aGUgcXVldWVkIG1hc3RlciBj
b21tYW5kIGFuZCBjaGFuZ2UNCj4gKwkJICogaXRzIHN0YXRlIHRvICdwZW5kaW5nJy4gVG8gc2lt
cGxpZnkgaGFuZGxpbmcgb2YgcGVuZGluZw0KPiArCQkgKiBjYXNlcywgaXQgdXNlcyBTL1cgc29s
dXRpb24gaW5zdGVhZCBvZiBIL1cgY29tbWFuZCBxdWV1ZQ0KPiArCQkgKiBoYW5kbGluZy4NCj4g
IAkJICovDQo+ICAJCWlmICh1bmxpa2VseShpcnFfc3RhdHVzICYgQVNQRUVEX0kyQ0RfSU5UUl9T
TEFWRV9NQVRDSCkpIHsNCj4gKwkJCXdyaXRlbChyZWFkbChidXMtPmJhc2UgKyBBU1BFRURfSTJD
X0NNRF9SRUcpICYNCj4gKwkJCQl+QVNQRUVEX0kyQ0RfTUFTVEVSX0NNRFNfTUFTSywNCj4gKwkJ
CSAgICAgICBidXMtPmJhc2UgKyBBU1BFRURfSTJDX0NNRF9SRUcpOw0KDQpTb3JyeSBmb3IgdGhl
IGxhdGUgY29tbWVudHMgKGp1c3Qgbm90aWNlZCB0aGlzIGxpbmUgd2hpbGUgdGVzdGluZyB0aGUg
cGF0Y2gpOg0KDQpJIGFzc3VtZSB0aGlzIGxpbmUgaXMgYWltZWQgYXQgc3RvcHBpbmcgdGhlIHJ1
bm5pbmcgbWFzdGVyIGNvbW1hbmRzLCBidXQgYXMgcGVyDQpBU1QyNTAwIGRhdGFzaGVldCwgaXQn
cyBOT1AgdG8gd3JpdGUgMCB0byBNQVNURVJfU1RPUC9NQVNURVJfUlgvTUFTVEVSX1RYIGJpdHMu
DQpNYXliZSBhbGwgd2UgbmVlZCBpcyB3cml0aW5nIDEgdG8gTUFTVEVSX1NUT1AgZmllbGQ/DQoN
Cg0KQ2hlZXJzLA0KDQpUYW8gDQoNCj4gIAkJCWJ1cy0+bWFzdGVyX3N0YXRlID0gQVNQRUVEX0ky
Q19NQVNURVJfUEVORElORzsNCj4gIAkJCWRldl9kYmcoYnVzLT5kZXYsDQo+ICAJCQkJIm1hc3Rl
ciBnb2VzIHBlbmRpbmcgZHVlIHRvIGEgc2xhdmUgc3RhcnRcbiIpOw0KPiBAQCAtNjI5LDYgKzYy
NiwxNCBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgYXNwZWVkX2kyY19idXNfaXJxKGludCBpcnEsIHZv
aWQgKmRldl9pZCkNCj4gIAkJCWlycV9oYW5kbGVkIHw9IGFzcGVlZF9pMmNfbWFzdGVyX2lycShi
dXMsDQo+ICAJCQkJCQkJICAgICBpcnFfcmVtYWluaW5nKTsNCj4gIAl9DQo+ICsNCj4gKwkvKg0K
PiArCSAqIFN0YXJ0IGEgcGVuZGluZyBtYXN0ZXIgY29tbWFuZCBhdCBoZXJlIGlmIGEgc2xhdmUg
b3BlcmF0aW9uIGlzDQo+ICsJICogY29tcGxldGVkLg0KPiArCSAqLw0KPiArCWlmIChidXMtPm1h
c3Rlcl9zdGF0ZSA9PSBBU1BFRURfSTJDX01BU1RFUl9QRU5ESU5HICYmDQo+ICsJICAgIGJ1cy0+
c2xhdmVfc3RhdGUgPT0gQVNQRUVEX0kyQ19TTEFWRV9JTkFDVElWRSkNCj4gKwkJYXNwZWVkX2ky
Y19kb19zdGFydChidXMpOw0KPiAgI2Vsc2UNCj4gIAlpcnFfaGFuZGxlZCA9IGFzcGVlZF9pMmNf
bWFzdGVyX2lycShidXMsIGlycV9yZW1haW5pbmcpOw0KPiAgI2VuZGlmIC8qIENPTkZJR19JMkNf
U0xBVkUgKi8NCj4gQEAgLTY5MSw2ICs2OTYsMTUgQEAgc3RhdGljIGludCBhc3BlZWRfaTJjX21h
c3Rlcl94ZmVyKHN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcCwNCj4gIAkJICAgICBBU1BFRURfSTJD
RF9CVVNfQlVTWV9TVFMpKQ0KPiAgCQkJYXNwZWVkX2kyY19yZWNvdmVyX2J1cyhidXMpOw0KPiAg
DQo+ICsJCS8qDQo+ICsJCSAqIElmIHRpbWVkIG91dCBhbmQgdGhlIHN0YXRlIGlzIHN0aWxsIHBl
bmRpbmcsIGRyb3AgdGhlIHBlbmRpbmcNCj4gKwkJICogbWFzdGVyIGNvbW1hbmQuDQo+ICsJCSAq
Lw0KPiArCQlzcGluX2xvY2tfaXJxc2F2ZSgmYnVzLT5sb2NrLCBmbGFncyk7DQo+ICsJCWlmIChi
dXMtPm1hc3Rlcl9zdGF0ZSA9PSBBU1BFRURfSTJDX01BU1RFUl9QRU5ESU5HKQ0KPiArCQkJYnVz
LT5tYXN0ZXJfc3RhdGUgPSBBU1BFRURfSTJDX01BU1RFUl9JTkFDVElWRTsNCj4gKwkJc3Bpbl91
bmxvY2tfaXJxcmVzdG9yZSgmYnVzLT5sb2NrLCBmbGFncyk7DQo+ICsNCj4gIAkJcmV0dXJuIC1F
VElNRURPVVQ7DQo+ICAJfQ0KPiAgDQo+IA0K
