Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C26DD34A2
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2019 01:51:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46q7Bn4Q3LzDqRy
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2019 10:50:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=5186784b43=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="K12C3ZqT"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="DilQiDbC"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46q79x6kR3zDqQc;
 Fri, 11 Oct 2019 10:50:12 +1100 (AEDT)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9ANmggV006589; Thu, 10 Oct 2019 16:49:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=iFAHsVfn3pUeDUQPqNvFrqJImlpOxx1bkt5LLzdbhjM=;
 b=K12C3ZqTRx6olDBEYGm6tNOhgORDhHn+ffKWh5Yk0gyDzmB0d7K69tgnqxbGmCpO5D/g
 Uvl986s6HGzQiu+5S+KYWDCKMhDD5T/XMnEvmHWqXnNHW0KcG4ZJQUsqbPWTWR1KXiFw
 uws8rbAL8xegKhf9BRzZiYj4wHv99mdUVNI= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2vhm0uf3mj-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 10 Oct 2019 16:49:44 -0700
Received: from prn-hub04.TheFacebook.com (2620:10d:c081:35::128) by
 prn-hub04.TheFacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Thu, 10 Oct 2019 16:29:05 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Thu, 10 Oct 2019 16:29:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jhHGkY5Wt4aaYJS3jxoe22DeTAmFfMcyeXYZF22JSA/dCY/7p+GiTwL8o5pGJNm9w5tn4X8fS928Iov44inM5T0ywnMXjyYHJ+Zpa6+vhSSBaPViuOYZFb/pvmBNCEjXkotaW4WrA1Wj7DOBoAsBLn3Z5dYAOH1HREgFZGLKhBwXjjGUADCDIbMHuia8v6Xc6tz2o6wYukvXwg4P9IfT1uI8muaKaXZv0K3QLleAiuUsYnlayPiIW82UXkZDZpblz0QlN5D3mFU9XZ8F5dVnIUD4G7xrBeHJ0kZLRzLmNFjhUNWTnd2WCME644XB6LRqw2r5iIcDdJnotwmwLR35tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iFAHsVfn3pUeDUQPqNvFrqJImlpOxx1bkt5LLzdbhjM=;
 b=hxjFyIFHVpvlq98QqPfzte8FF4/xWDkU0BsRq8qCzDpsY3zI6VLJMlgfuyieC807IEd5pw4kNc4kl/hKKLXudJRq2ziUP9WBNJJTWZ5S3LNeKo66UK7uYUsPH+6DSo55qQT6afoQFzAxhgKE1aUAbRm/wLA7R779Uyv2i7WZw43AbBiAVIpfgtr6PkT2piXj74WYvOKeLMPUJrxEHJWjUN+an1xunsRJd83Olp6AIR/QHMMF6F8qCJCTrlWgE0dx2g8qjD8mZ0shnNztNcnkLJSRdz8VAReLtJCfUfusGhq+SG14X4d5kiMEi6gNzKTYcXZxA858Rvb2mV1tSpYljw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iFAHsVfn3pUeDUQPqNvFrqJImlpOxx1bkt5LLzdbhjM=;
 b=DilQiDbCak4E2vB+PRC/ZFOS+rJ7GzadiqsAliwcpBrWp9Q7yNRSgxT7yE6y/hUsFAfQJtv+WsHXJ1PUsgeP9x4vyx4hs3pXrctvbnWmvp4rPgMd5wi3qPi3O5BkKaQ0m1HnFx/9ZvrwSZVh9XvoCL2k54kBNZallcU7KJrKUYY=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1534.namprd15.prod.outlook.com (10.173.235.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Thu, 10 Oct 2019 23:29:04 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::24c9:a1ce:eeeb:9246]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::24c9:a1ce:eeeb:9246%10]) with mapi id 15.20.2347.016; Thu, 10 Oct
 2019 23:29:04 +0000
From: Tao Ren <taoren@fb.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Brendan Higgins
 <brendanhiggins@google.com>, Wolfram Sang <wsa@the-dreams.de>, "Benjamin
 Herrenschmidt" <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, "Rob Herring" <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "Andrew Jeffery" <andrew@aj.id.au>, Cedric Le Goater <clg@kaod.org>
Subject: Re: [PATCH] i2c: aspeed: fix master pending state handling
Thread-Topic: [PATCH] i2c: aspeed: fix master pending state handling
Thread-Index: AQHVfud35WuTlVbA0UqacW6NAtrttKdUhy+A
Date: Thu, 10 Oct 2019 23:29:04 +0000
Message-ID: <49244d71-cbc3-f2ae-97ac-74b5f68a4816@fb.com>
References: <20191009212034.20325-1-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20191009212034.20325-1-jae.hyun.yoo@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MW2PR16CA0035.namprd16.prod.outlook.com (2603:10b6:907::48)
 To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::1:a83d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f0395ed9-026b-473f-6209-08d74dd9a346
x-ms-traffictypediagnostic: MWHPR15MB1534:
x-microsoft-antispam-prvs: <MWHPR15MB15343EA3E2DDAF6F1E5DBBF9B2940@MWHPR15MB1534.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 018632C080
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(136003)(346002)(376002)(366004)(396003)(199004)(189003)(71190400001)(305945005)(7736002)(71200400001)(478600001)(58126008)(6116002)(8676002)(54906003)(110136005)(316002)(6246003)(2906002)(7416002)(25786009)(4744005)(64756008)(66446008)(186003)(66946007)(66476007)(66556008)(6436002)(229853002)(86362001)(52116002)(5660300002)(6506007)(53546011)(386003)(11346002)(102836004)(8936002)(2616005)(486006)(446003)(76176011)(6486002)(4326008)(476003)(31696002)(6512007)(99286004)(36756003)(256004)(14444005)(14454004)(31686004)(81156014)(81166006)(65806001)(46003)(65956001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1534;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jY8KYe3q0A3gQPdrrLbuIwTEJykHlpUie1bIwbAv4qe2zLmjW3xag+mcrfHf+JtXr4wkyadGoWtycgj2VIGkL6eXSX5GRYqtk6xZuiCL34IJOuCmv4255fJc3aU1Q9Vje0yA+6XVFlUbu2XP4YnuhNSTm/kjd/gDRAyfXRdEoqKypsJmtuoRMfHhmbIhEDlmSE4H5rpIcPMh5l8qsum5nqMXPz96ekxdDOCfIbF+Qabqtpm0NCuS9+6fviE/leUOftEpC8i28m9zVqrlrv8b6625F4sYHh1aCYUNVngk+Y5T7QZIBlldK5e4p6ol1qGXijfS7QT/m5VPeTWI4cNpqE0XvxVxZtu02efYZdFG4PvxQ0lpEfFGez3iCMuhhmaQTzJzUulik5hLJ7tgKyWZoXAQA8BARnbq9hfHPJykUnM=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <E79784B537921D40A3923439E52E2764@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f0395ed9-026b-473f-6209-08d74dd9a346
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2019 23:29:04.2453 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pU+wJUFfFWbGgcBeQe9YNVr50DCi4SnTGo2WSeWh8RI7O0+vzO16f15U9UDcaJVz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1534
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-10_09:2019-10-10,2019-10-10 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 malwarescore=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910100209
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
b29AbGludXguaW50ZWwuY29tPg0KDQpUZXN0ZWQtYnk6IFRhbyBSZW4gPHRhb3JlbkBmYi5jb20+
DQoNClRlc3RlZCB0aGUgcGF0Y2ggb24gRmFjZWJvb2sgTWluaXBhY2sgQk1DIChtdWx0aS1tYXN0
ZXIgaTJjLTAgZW52aXJvbm1lbnQpIGFuZA0KZXZlcnl0aGluZyBsb29rcyBnb29kIHRvIG1lLg0K
DQoNCkNoZWVycywNCg0KVGFvDQo=
