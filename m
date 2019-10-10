Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9816DD1E04
	for <lists+openbmc@lfdr.de>; Thu, 10 Oct 2019 03:29:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pYQj0GVVzDqby
	for <lists+openbmc@lfdr.de>; Thu, 10 Oct 2019 12:29:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=5186784b43=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="flC9cBsh"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="al6ceIMG"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pYPq0WT8zDqYC;
 Thu, 10 Oct 2019 12:28:23 +1100 (AEDT)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9A1IJE4011219; Wed, 9 Oct 2019 18:26:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=zd3aZvwzJYk15BUYctpAmmc/25qqoMu0W19HM5Xbm3g=;
 b=flC9cBshTcwUJs9/sFTcv78BMG1ZJ4XMUTZFyahcGgckoN3100+jyEjD5vqZhTT7XTJ5
 onsqWd2Lg7F9U20/Z4AmsMWIbFeDnF3/7A1ZHtQp8QYRQGIJUjuFuLcgLAELVemM/4Fz
 Sg9Z4mBXHekmMuC/df/xHTGt3C0cdYH18sA= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2vgpq9tgm8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 09 Oct 2019 18:26:53 -0700
Received: from ash-exhub202.TheFacebook.com (2620:10d:c0a8:83::6) by
 ash-exhub102.TheFacebook.com (2620:10d:c0a8:82::f) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 9 Oct 2019 18:26:52 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.103) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 9 Oct 2019 18:26:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NfEld6QuwLdkFO1edUxMMvEAFjCFAoKjvoUeGlljLclr7jCatlZUOiQ66dqTcv8YCaJNu7RkMcS/UrTsxooiUDzr6vdsJuOtjyouZsFvSjDO9AZO9SDjTDky9eFJbwx1i6ROmBFq6I2eEij0gahbQFVfyUzG7BYfPymHpQMWy0wbs8U7Nl01vdBjZdj6GswXt7ojWF9GiepkHqLtHEZGfkSnhduRr2Sf3ho9Ejsm60vd/SP8NeoLK7YzXZlspeuaHkpUaeMcj9Y0S/Qfxrn8d2sB/KHfFpoWNZfCz4AhGCdFfotv70CGG/aU6wW8fsbA2CvlQtzQrp95/qf1QD7u9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zd3aZvwzJYk15BUYctpAmmc/25qqoMu0W19HM5Xbm3g=;
 b=OVw1XNduZGdfy13c8lzT/IQEZSXgpfnHcf9RbxWst/zFicHp8uzEHf8xSPtvLjFui9J34w2up76zozSdb2wPvIReXAXUS8SZw6/TnCuNjemnVGNGQ9zuc0SsuC/ifCLRd6T6FOZxtgvh0/wkBaQNm+4PdGu+Jet2qBT4abAQMI7BdigAUCxWaKoyFZfSBwylOzYYOB/adbzkJdGmLNp6GGzNbSyCFlhMihcXwAPy+LTbU1zTilzXY6yhydiamMFH70iR9eEfwRywKVWalB6qSwTIBVdGlH3zIZ88jNCZoc3GobXPkbh3oKTnHR+R0V7lWFqkXho6oWzoTM2AD2vuxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zd3aZvwzJYk15BUYctpAmmc/25qqoMu0W19HM5Xbm3g=;
 b=al6ceIMGbwpGZetnkvf7EEro3QSPqoEZ/bV08/F6ktBYRayg1KnBhaIWI7U1OTNGjt1tAXkeobkPCNNn+eQECuoZY/SJbkrvw/ymrgrLFUdrrqk03U/EUpg6RY+WPfUddp7Q1e4e93euXlv1RtLtZVVJVckluk2rDaRfxX6qKKU=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1375.namprd15.prod.outlook.com (10.173.233.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Thu, 10 Oct 2019 01:26:50 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::24c9:a1ce:eeeb:9246]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::24c9:a1ce:eeeb:9246%10]) with mapi id 15.20.2347.016; Thu, 10 Oct
 2019 01:26:49 +0000
From: Tao Ren <taoren@fb.com>
To: Brendan Higgins <brendanhiggins@google.com>, Jae Hyun Yoo
 <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH] i2c: aspeed: fix master pending state handling
Thread-Topic: [PATCH] i2c: aspeed: fix master pending state handling
Thread-Index: AQHVfud35WuTlVbA0UqacW6NAtrttKdTBpsAgAAPJoA=
Date: Thu, 10 Oct 2019 01:26:49 +0000
Message-ID: <43ab0316-78dd-b7b0-c04e-e039d38c3d45@fb.com>
References: <20191009212034.20325-1-jae.hyun.yoo@linux.intel.com>
 <20191010003234.GA12710@google.com>
In-Reply-To: <20191010003234.GA12710@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CO1PR15CA0045.namprd15.prod.outlook.com
 (2603:10b6:101:1f::13) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::2:8309]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b2305e0f-9df1-4636-1ec6-08d74d20ec26
x-ms-traffictypediagnostic: MWHPR15MB1375:
x-microsoft-antispam-prvs: <MWHPR15MB1375A85B19041D02320E947DB2940@MWHPR15MB1375.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 018632C080
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(376002)(39860400002)(396003)(136003)(346002)(189003)(199004)(229853002)(54906003)(81166006)(65806001)(65956001)(81156014)(7736002)(7416002)(6486002)(102836004)(110136005)(36756003)(58126008)(14444005)(256004)(8936002)(305945005)(71200400001)(71190400001)(8676002)(5660300002)(316002)(11346002)(46003)(14454004)(478600001)(52116002)(99286004)(66946007)(486006)(76176011)(446003)(476003)(86362001)(6246003)(2906002)(6512007)(186003)(386003)(6436002)(6506007)(2616005)(31686004)(53546011)(31696002)(25786009)(6116002)(66556008)(64756008)(66446008)(66476007)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1375;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rT2XYrovIIpFfK/FOI3M/V27xRgRs1mXhiR5PctkgC3y3VmsvQ6K/qGIRUY2D94uesFvIRwPJGS8UMc5Z40+45E9P8Gev+XJf65U1sDZ1MzlrFLvxKu1X/4hdyIhldxzh+6y533KZprDVw+Mq5+bQ96ALYCMQePQlVdNGPZsZ6+GPWNYaANTDH4t3RmLZhOgLWy3f87QdQVByw3yuQRAtAtedgx/KWByBufF24cyGFwv6N+Wi+DmKPGS7f/ue0/SXvL3KZQwFhcFUlz6n5d7T1iUWicSTz3dkn+lqta2qkD5WMTfxRlX2R6TKw0a/g/cHXfJ650sI2yltAe1Jf1SkGjh3gM6aTZpgtL/VFkPinj4/5eCCsrvjwMw8ifAeMUJNRTKEbeDc2NSjMTL7yfyEeoYYw8DSH99UjLPEp0hoIQ=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <3DC2428602E08C4F8C65A1DA359F1D88@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b2305e0f-9df1-4636-1ec6-08d74d20ec26
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2019 01:26:49.7065 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yu1Cy0BajlyJG7nG6o1JHgDSvsESl++VzcYTjSofT5W9+T3u7uvFx9C/B7ogeHTA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1375
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-09_11:2019-10-08,2019-10-09 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxlogscore=999
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1011 adultscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910100010
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Wolfram Sang <wsa@the-dreams.de>, Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Cedric Le Goater <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gMTAvOS8xOSA1OjMyIFBNLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6DQo+IE9uIFdlZCwgT2N0
IDA5LCAyMDE5IGF0IDAyOjIwOjM0UE0gLTA3MDAsIEphZSBIeXVuIFlvbyB3cm90ZToNCj4+IElu
IGNhc2Ugb2YgbWFzdGVyIHBlbmRpbmcgc3RhdGUsIGl0IHNob3VsZCBub3QgdHJpZ2dlciBhIG1h
c3Rlcg0KPj4gY29tbWFuZCwgb3RoZXJ3aXNlIGRhdGEgY291bGQgYmUgY29ycnVwdGVkIGJlY2F1
c2UgdGhpcyBIL1cgc2hhcmVzDQo+PiB0aGUgc2FtZSBkYXRhIGJ1ZmZlciBmb3Igc2xhdmUgYW5k
IG1hc3RlciBvcGVyYXRpb25zLiBJdCBhbHNvIG1lYW5zDQo+PiB0aGF0IEgvVyBjb21tYW5kIHF1
ZXVlIGhhbmRsaW5nIGlzIHVucmVsaWFibGUgYmVjYXVzZSBvZiB0aGUgYnVmZmVyDQo+PiBzaGFy
aW5nIGlzc3VlLiBUbyBmaXggdGhpcyBpc3N1ZSwgaXQgY2xlYXJzIGNvbW1hbmQgcXVldWUgaWYg
YQ0KPj4gbWFzdGVyIGNvbW1hbmQgaXMgcXVldWVkIGluIHBlbmRpbmcgc3RhdGUgdG8gdXNlIFMv
VyBzb2x1dGlvbg0KPj4gaW5zdGVhZCBvZiBIL1cgY29tbWFuZCBxdWV1ZSBoYW5kbGluZy4gQWxz
bywgaXQgcmVmaW5lcyByZXN0YXJ0aW5nDQo+PiBtZWNoYW5pc20gb2YgdGhlIHBlbmRpbmcgbWFz
dGVyIGNvbW1hbmQuDQo+Pg0KPj4gRml4ZXM6IDJlNTdiN2NlYmI5OCAoImkyYzogYXNwZWVkOiBB
ZGQgbXVsdGktbWFzdGVyIHVzZSBjYXNlIHN1cHBvcnQiKQ0KPj4gU2lnbmVkLW9mZi1ieTogSmFl
IEh5dW4gWW9vIDxqYWUuaHl1bi55b29AbGludXguaW50ZWwuY29tPg0KPiANCj4gUmV2aWV3ZWQt
Ynk6IEJyZW5kYW4gSGlnZ2lucyA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4NCj4gDQo+IFdl
IGRvbid0IGhhdmUgYW55IG11bHRpLW1hc3RlciBzZXR1cHMsIGNhbiB3ZSBnZXQgYSBUZXN0ZWQt
Ynk/DQoNCkkndmUgYXBwbGllZCB0aGUgcGF0Y2ggdG8gbXkgdHJlZSBhbmQgSSdtIGxvb2tpbmcg
Zm9yIGEgbWluaXBhY2sgQk1DDQoobWlsdGktbWFzdGVyKSB0byB0ZXN0IHRoZSBwYXRjaC4gV2ls
bCBjb21lIGJhY2sgd2l0aCByZXN1bHRzIHRvbW9ycm93Lg0KDQoNCkNoZWVycywNCg0KVGFvDQoN
Cj4gV29sZnJhbSwgc2luY2UgdGhpcyBpcyBhIGJ1Z2ZpeCwgY2FuIHdlIGdldCB0aGlzIGluIDUu
ND8NCj4gDQo+IFRoYW5rcyENCj4gDQo=
