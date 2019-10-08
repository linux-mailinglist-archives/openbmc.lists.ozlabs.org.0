Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4193CD032F
	for <lists+openbmc@lfdr.de>; Wed,  9 Oct 2019 00:02:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nrt54hc2zDqQH
	for <lists+openbmc@lfdr.de>; Wed,  9 Oct 2019 09:02:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=5184daeaff=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="H2g3HLFd"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="goRwdHFM"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nrsG3PfJzDqL8;
 Wed,  9 Oct 2019 09:01:17 +1100 (AEDT)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id x98Lxjcg002325;
 Tue, 8 Oct 2019 15:00:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=ABOZZdkqLm1L0q8tsiyHSpdiPstIbm3G9W6AzYXAqmY=;
 b=H2g3HLFdOujbXud5GohDzpy4rjcVCKHxxIciYQyRRE6th0eOoSLw9sGtSbnTTWB9TX18
 lYAtoHBowTNiwNLkkowK22DPUpuyL9qC+6W9RlNmdzhDboXFo3ioooKe1E4z2x+HVgim
 fby+V51cYEHvvzZOhbbv9w81Kn6n85SRsrk= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0089730.ppops.net with ESMTP id 2vgprk3xyq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 08 Oct 2019 15:00:48 -0700
Received: from ash-exhub203.TheFacebook.com (2620:10d:c0a8:83::5) by
 ash-exhub204.TheFacebook.com (2620:10d:c0a8:83::4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 8 Oct 2019 15:00:47 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.102) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 8 Oct 2019 15:00:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FXhiTsw4tP7XV5JzVYkN6ps45zyiEC6SkDu15zFdkHxjp2pGTi8Spd2cSepZ7d0IItkW/L7oEcLLd/B2iu6DR1VpQQuAR4sbCPUhEDx+GIDsQE0s9Y4lufPZJIVhEh7XhCj8Ywpuj+9ksAvf5HIh6MVEUl/TC2fFiJSAVfZYxGqybehUiD8Th3DhWMAUhXZNVtRQrXPtdMtQPztq7K9ow0gQa/ULAQ60dA5bp3EXGYPlDie6LOiBIB2FkzgH0ihjKp7syZX94SnyCqdn5+vN2CRHgOXa8fWOu+7UQFbHMejdGaiM+QoaYWsba5Iv0mTUPRmM2wI/DsUzBDFUJJFd1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABOZZdkqLm1L0q8tsiyHSpdiPstIbm3G9W6AzYXAqmY=;
 b=HyHeXxisZBEVHBSY0dgGS6eWO+lIN1WSnGzj9FSDQQAHtqVhP4LlCZZ5qd8cJc1pH5gQT8f6Nc9UfPRNvw/vVd+i/xnCqudb39hLwOzVe7eIGcf/7lg/tUclWyadm4ena/oi4tBO+XfFa7/gKWgjCFoKhDe8JgXMV4mshvSdsKMp2rjh0tVqQ1eaRcl1JWJkgeZ22mvUmks80pdVXH+Rc5bS6YBAJKVQgX23JGXNWr0LqwZpCp7cOiOLUOYRISOb61uK3aTAqOdiTywElp1vC2DXdKZ37kIKj4wlN2wCq4+q/Oi2ryliHg8NvNxyilCeBgHW5r3t69fgoBrbc9djug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABOZZdkqLm1L0q8tsiyHSpdiPstIbm3G9W6AzYXAqmY=;
 b=goRwdHFMuU6gEWmXYRJ47oqKAPz5RMh2THQASX7iWFNwCqkI3ZggsDkI9/g47talx88XwJnTL0MNjjAUMqSojp76UXYbpUYyQNzKW3+0vJlCCi5dXeVJ+KUo/ZT5qP+LbVNcSOtvLEPyneyg83vorIrAT4JqTGpFsU21kMod7e0=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1535.namprd15.prod.outlook.com (10.173.234.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Tue, 8 Oct 2019 22:00:46 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::24c9:a1ce:eeeb:9246]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::24c9:a1ce:eeeb:9246%10]) with mapi id 15.20.2327.026; Tue, 8 Oct 2019
 22:00:46 +0000
From: Tao Ren <taoren@fb.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Brendan Higgins
 <brendanhiggins@google.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Jeffery
 <andrew@aj.id.au>
Subject: Re: [PATCH 3/5] i2c: aspeed: fix master pending state handling
Thread-Topic: [PATCH 3/5] i2c: aspeed: fix master pending state handling
Thread-Index: AQHVfWTbblC7pbX04kW4ywPkkt70vadRTOAA
Date: Tue, 8 Oct 2019 22:00:46 +0000
Message-ID: <422eea61-7cb9-e471-83fb-3f554ff5e079@fb.com>
References: <20191007231313.4700-1-jae.hyun.yoo@linux.intel.com>
 <20191007231313.4700-4-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20191007231313.4700-4-jae.hyun.yoo@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MW2PR2101CA0027.namprd21.prod.outlook.com
 (2603:10b6:302:1::40) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::3:5686]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 858c3dd0-e475-4058-b31b-08d74c3af8e5
x-ms-traffictypediagnostic: MWHPR15MB1535:
x-microsoft-antispam-prvs: <MWHPR15MB153571D3D7344177BBA0174AB29A0@MWHPR15MB1535.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:568;
x-forefront-prvs: 01842C458A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(346002)(376002)(396003)(39860400002)(189003)(199004)(6116002)(316002)(8676002)(31696002)(5660300002)(110136005)(7416002)(6486002)(52116002)(65956001)(71200400001)(71190400001)(65806001)(186003)(8936002)(81156014)(81166006)(66476007)(229853002)(86362001)(31686004)(76176011)(58126008)(102836004)(54906003)(66556008)(64756008)(66446008)(66946007)(6246003)(6512007)(53546011)(6506007)(386003)(99286004)(6436002)(36756003)(46003)(486006)(7736002)(14454004)(25786009)(2616005)(476003)(14444005)(11346002)(4326008)(2906002)(256004)(478600001)(305945005)(446003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1535;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vy4JP0gszCjoyrF+27kDDVgGKcZE/snOAvP7KFxqS/7O3vLSfEk24Ddw0N/IwO1iy/sX+fxHTwnY7fFbnCl7fylIwTShqVVi+pwUVHOIM2mfQW720C4BlTIeDdvX9fW3t/eDwSG0NaxIZjXXSstv5s8Hcokzem1k7HAECLgjeCXj9cP0jsg3h6UtN2ls+8jMFWe6Z03C/77VLC6WbxFAeCklIqLNJDcb49uTJ0rGhPzr8hfuiUYUkt2zXxB94iPKbag1glRwxEbSJRjAo9kIB8CG9ECF31XaHJXHKlynf5c9OgrVQt2dwGBew1FLYndRdBmDaiolt/2xaTfHlBqWVPWFD5MwvT7kJizGKAz4fMw9+zeQ1xCJqVEw8AreNbx94d7zJpTPDgAtRzex+1MvbwYT6GECjp3ORvFF48/8XTY=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <F304E12DA9821C4995799DE8ABF9051C@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 858c3dd0-e475-4058-b31b-08d74c3af8e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2019 22:00:46.7660 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bmRhZBzQJGZDYMGQHqejoolpcUM5mjVyzpfdWA7kqRoW7X4z+k+C9ozzRt0crWQQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1535
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-08_08:2019-10-08,2019-10-08 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 bulkscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 clxscore=1011 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910080171
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

T24gMTAvNy8xOSA0OjEzIFBNLCBKYWUgSHl1biBZb28gd3JvdGU6DQo+IEluIGNhc2Ugb2YgbWFz
dGVyIHBlbmRpbmcgc3RhdGUsIGl0IHNob3VsZCBub3QgdHJpZ2dlciB0aGUgbWFzdGVyDQo+IGNv
bW1hbmQgYmVjYXVzZSB0aGlzIEgvVyBpcyBzaGFyaW5nIHRoZSBzYW1lIGRhdGEgYnVmZmVyIGZv
ciBzbGF2ZQ0KPiBhbmQgbWFzdGVyIG9wZXJhdGlvbnMsIHNvIHRoaXMgY29tbWl0IGZpeGVzIHRo
ZSBpc3N1ZSB3aXRoIG1ha2luZw0KPiB0aGUgbWFzdGVyIGNvbW1hbmQgdHJpZ2dlcmluZyBoYXBw
ZW4gd2hlbiB0aGUgc3RhdGUgZ29lcyB0byBhY3RpdmUNCj4gc3RhdGUuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBKYWUgSHl1biBZb28gPGphZS5oeXVuLnlvb0BsaW51eC5pbnRlbC5jb20+DQo+IC0t
LQ0KPiAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hc3BlZWQuYyB8IDkgKysrKystLS0tDQo+ICAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXNwZWVkLmMgYi9kcml2ZXJzL2kyYy9i
dXNzZXMvaTJjLWFzcGVlZC5jDQo+IGluZGV4IGZhNjY5NTFiMDVkMC4uNDBmNmNmOThkMzJlIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWFzcGVlZC5jDQo+ICsrKyBiL2Ry
aXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXNwZWVkLmMNCj4gQEAgLTMzNiwxOCArMzM2LDE5IEBAIHN0
YXRpYyB2b2lkIGFzcGVlZF9pMmNfZG9fc3RhcnQoc3RydWN0IGFzcGVlZF9pMmNfYnVzICpidXMp
DQo+ICAJc3RydWN0IGkyY19tc2cgKm1zZyA9ICZidXMtPm1zZ3NbYnVzLT5tc2dzX2luZGV4XTsN
Cj4gIAl1OCBzbGF2ZV9hZGRyID0gaTJjXzhiaXRfYWRkcl9mcm9tX21zZyhtc2cpOw0KPiAgDQo+
IC0JYnVzLT5tYXN0ZXJfc3RhdGUgPSBBU1BFRURfSTJDX01BU1RFUl9TVEFSVDsNCj4gLQ0KPiAg
I2lmIElTX0VOQUJMRUQoQ09ORklHX0kyQ19TTEFWRSkNCj4gIAkvKg0KPiAgCSAqIElmIGl0J3Mg
cmVxdWVzdGVkIGluIHRoZSBtaWRkbGUgb2YgYSBzbGF2ZSBzZXNzaW9uLCBzZXQgdGhlIG1hc3Rl
cg0KPiAgCSAqIHN0YXRlIHRvICdwZW5kaW5nJyB0aGVuIEgvVyB3aWxsIGNvbnRpbnVlIGhhbmRs
aW5nIHRoaXMgbWFzdGVyDQo+ICAJICogY29tbWFuZCB3aGVuIHRoZSBidXMgY29tZXMgYmFjayB0
byB0aGUgaWRsZSBzdGF0ZS4NCj4gIAkgKi8NCj4gLQlpZiAoYnVzLT5zbGF2ZV9zdGF0ZSAhPSBB
U1BFRURfSTJDX1NMQVZFX0lOQUNUSVZFKQ0KPiArCWlmIChidXMtPnNsYXZlX3N0YXRlICE9IEFT
UEVFRF9JMkNfU0xBVkVfSU5BQ1RJVkUpIHsNCj4gIAkJYnVzLT5tYXN0ZXJfc3RhdGUgPSBBU1BF
RURfSTJDX01BU1RFUl9QRU5ESU5HOw0KPiArCQlyZXR1cm47DQo+ICsJfQ0KPiAgI2VuZGlmIC8q
IENPTkZJR19JMkNfU0xBVkUgKi8NCj4gIA0KPiArCWJ1cy0+bWFzdGVyX3N0YXRlID0gQVNQRUVE
X0kyQ19NQVNURVJfU1RBUlQ7DQo+ICAJYnVzLT5idWZfaW5kZXggPSAwOw0KPiAgDQo+ICAJaWYg
KG1zZy0+ZmxhZ3MgJiBJMkNfTV9SRCkgew0KPiBAQCAtNDMyLDcgKzQzMyw3IEBAIHN0YXRpYyB1
MzIgYXNwZWVkX2kyY19tYXN0ZXJfaXJxKHN0cnVjdCBhc3BlZWRfaTJjX2J1cyAqYnVzLCB1MzIg
aXJxX3N0YXR1cykNCj4gIAkJaWYgKGJ1cy0+c2xhdmVfc3RhdGUgIT0gQVNQRUVEX0kyQ19TTEFW
RV9JTkFDVElWRSkNCj4gIAkJCWdvdG8gb3V0X25vX2NvbXBsZXRlOw0KPiAgDQo+IC0JCWJ1cy0+
bWFzdGVyX3N0YXRlID0gQVNQRUVEX0kyQ19NQVNURVJfU1RBUlQ7DQo+ICsJCWFzcGVlZF9pMmNf
ZG9fc3RhcnQoYnVzKTsNCj4gIAl9DQoNClNoYWxsIHdlIG1vdmUgdGhlIHJlc3RhcnQtbWFzdGVy
IGxvZ2ljIGZyb20gbWFzdGVyX2lycSB0byBidXNfaXJxPyBUaGUgcmVhc29uIGJlaW5nOg0KbWFz
dGVyIHRyYW5zYWN0aW9uIGNhbm5vdCBiZSByZXN0YXJ0ZWQgd2hlbiBhc3BlZWQtaTJjIGlzIHJ1
bm5pbmcgaW4gc2xhdmUgc3RhdGUgYW5kDQpyZWNlaXZlcyBTVE9QIGludGVycnVwdCwgYmVjYXVz
ZSBhc3BlZWRfaTJjX21hc3Rlcl9pcnEgd29uJ3QgYmUgY2FsbGVkIGluIHRoaXMgY2FzZS4NCg0K
DQpDaGVlcnMsDQoNClRhbw0K
