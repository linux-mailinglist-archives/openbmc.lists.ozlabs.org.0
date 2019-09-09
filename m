Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C410AE189
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 01:41:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46S4SG4RGwzDqNr
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 09:41:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=4155b2ef1b=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="HELXxxN8"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="ZTHtp1sa"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46S4RX2ntVzDqK3
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 09:40:53 +1000 (AEST)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x89NSkQC031975; Mon, 9 Sep 2019 16:40:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=otMbKfOvgPcN/6v2hzeIi42IPXq0T+KLcpIhlaYYJJM=;
 b=HELXxxN8Oin8ut2P/FIBZkFne2sX9GoKwYC2FOr5Y1xxCc+5VOVo0GcjEC6AlmpMag7o
 T7QVV9evwggGQxhoNOBG/2QlD9ffZhHY+7rn57M1yTohHaw6UJR3iXobOF/TR7td2VhM
 3lCXoL8OrKpccOSFODLvvpeQTD1lLw1HoS4= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2uva9nhnfq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 09 Sep 2019 16:40:35 -0700
Received: from ash-exhub102.TheFacebook.com (2620:10d:c0a8:82::f) by
 ash-exhub201.TheFacebook.com (2620:10d:c0a8:83::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 9 Sep 2019 16:40:34 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.172) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 9 Sep 2019 16:40:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZF9er7nxb7ClqafpsGaEjOJyljNFjzwNmBExtsjoILw6banQU2NSbkhPJKIKIxp1mhyA2+VznrsTy87x7EqkcVjWxdxoxDoslDyiGfGEWxX+EDdfwzOYi3ujHzZCOnFV5I83YLhrkczkriku0BY1h4uiPnTEe4Z5CLWvn+McI3LLlmOAWBN/1QOL6lOyCSB6lxVz9hK9tdX1CbN3kMVWer9wp5fmI91l9QUp1B5ih8n4PZya6Ho4GpsyvDKWxge/gMFxjT7I5HxY1885r8EtCA+sskhgbXWYN6q2P5DneH7DexQIXpq6YGEzjwE36K8JkKnOS/8x6/0jsb4o9Vifg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=otMbKfOvgPcN/6v2hzeIi42IPXq0T+KLcpIhlaYYJJM=;
 b=DJZuVoGRjhi1Iv/fPcdt35BK64ScoU3l5C64gRwC6ketshbJFd46Kr3jhQfSp6TieTaurD1S6/gJYeo1KRepKn5CTa96m3aM5RJuin9h25VKlwai5jiF96auRaxsIhr1Ed3c0miPHlzgqP3JfutAUCQKUGwCOmjkQUQJY3WbWYftwCcdHrPAZ7afE7T+PIyutcp/Q8AWGFdt2CJlcJmp4bR1Sn/04oQheGoslG0Af4UBYe8s3Kvgn1+akfRF6GgNJPqIkbJZ2PzvZ/Aodq4DK8P6qX3aPFtzhSludSJMJBO8IuZmmMMB3N394o9qgAdDnqVzmIPXMMerHtlbxSGe6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=otMbKfOvgPcN/6v2hzeIi42IPXq0T+KLcpIhlaYYJJM=;
 b=ZTHtp1sa/z3I5KMR1PD25AmIDUdnXEKQQJFPOPB9YRTFoOj4CqcGBV8uGAWUwFj9IBzbXktRLRuQwSyooiVEb7ht9UF8LC7CiuK7tI1jSQvu/VtrUEs2Pqr//xhDsPoceAubOmYJfOf40qgZBwLGdK2Ur56xw6XohbZsQBhQsOk=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1391.namprd15.prod.outlook.com (10.173.234.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Mon, 9 Sep 2019 23:40:33 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::2980:5c7f:8dde:174a]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::2980:5c7f:8dde:174a%9]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 23:40:33 +0000
From: Tao Ren <taoren@fb.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Brendan Higgins
 <brendanhiggins@google.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v3 dev-5.2 2/2] i2c: aspeed: add slave inactive timeout
 support
Thread-Topic: [PATCH v3 dev-5.2 2/2] i2c: aspeed: add slave inactive timeout
 support
Thread-Index: AQHVZ12ridDO9B/HVk+nt889H4WszKckATOA
Date: Mon, 9 Sep 2019 23:40:33 +0000
Message-ID: <cf2fb890-ffeb-2946-61f7-27c1c7bd8e22@fb.com>
References: <20190909222634.26146-1-jae.hyun.yoo@linux.intel.com>
 <20190909222634.26146-3-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20190909222634.26146-3-jae.hyun.yoo@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR0201CA0042.namprd02.prod.outlook.com
 (2603:10b6:301:73::19) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::c6a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ab1929b-2938-4df2-36cd-08d7357f1b4a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MWHPR15MB1391; 
x-ms-traffictypediagnostic: MWHPR15MB1391:
x-microsoft-antispam-prvs: <MWHPR15MB13915032C2666835A7CAAFC6B2B70@MWHPR15MB1391.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:843;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(346002)(39860400002)(136003)(396003)(366004)(199004)(189003)(71190400001)(229853002)(186003)(6506007)(53546011)(14454004)(81166006)(36756003)(65806001)(386003)(8936002)(478600001)(8676002)(53936002)(11346002)(305945005)(6512007)(6436002)(14444005)(256004)(6246003)(46003)(86362001)(446003)(31696002)(6116002)(65956001)(81156014)(7736002)(4326008)(66946007)(2906002)(66476007)(66556008)(64756008)(25786009)(66446008)(486006)(476003)(2616005)(71200400001)(99286004)(102836004)(6486002)(31686004)(5660300002)(316002)(52116002)(110136005)(76176011)(58126008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1391;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 71Y6Pkb2yYIUhcxFL1+yaYUlwaiAi7n9vA27e+xdJLkoDYHJxOtyZKsESjD6xEFXeuUgDJAwL7VuxZgyW0tpqn1vyoimTUPt7KbLk32ooBrqBnnueutKbPY8PCSzIdwHFhaf8NAw3bzhnwtuSlTduPAO5Z05/bagI9ds9SnrsbvFUrh92arhkNvIId+iqPqxSiAjSNWZa4hTX77eqCRJthsecDC9M9zf9SGeVGAMhZOW4xpE+mWEkILDk/3agzNKR4WH5bDLRa+FSFD7r2XNSARMCLZlBbr5lPSKqmoBAh4DyyztRm2+xk4c+kJoU1YkUg8lzuX73zb2eNc1l3C7xT7u/DsD7LoNV/zpgh8mqUtke33p7lYej0eUmoiE2tn5RhMxyRNFzOyk9Jeex8o33m8TSYgbI8G7G/5xu89b6iU=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <7BAD3C550B042345BE18175D512A992F@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab1929b-2938-4df2-36cd-08d7357f1b4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 23:40:33.3300 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hXjWCT5ZoG2+Ix6LeeMXjouob1T+I78qWayq7VyaL6Zw3h9jlDjz4c4lZOVWRnrk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1391
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-09_09:2019-09-09,2019-09-09 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0
 bulkscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1909090222
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

T24gOS85LzE5IDM6MjYgUE0sIEphZSBIeXVuIFlvbyB3cm90ZToNCj4gSW4gY2FzZSBvZiBtdWx0
aS1tYXN0ZXIgZW52aXJvbm1lbnQsIGlmIGEgcGVlciBtYXN0ZXIgaW5jb3JyZWN0bHkgaGFuZGxl
cw0KPiBhIGJ1cyBpbiB0aGUgbWlkZGxlIG9mIGEgdHJhbnNhY3Rpb24sIEkyQyBoYXJkd2FyZSBo
YW5ncyBpbiBzbGF2ZSBzdGF0ZQ0KPiBhbmQgaXQgY2FuJ3QgZXNjYXBlIGZyb20gdGhlIHNsYXZl
IHN0YXRlLCBzbyB0aGlzIGNvbW1pdCBhZGRzIHNsYXZlDQo+IGluYWN0aXZlIHRpbWVvdXQgc3Vw
cG9ydCB0byByZWNvdmVyIHRoZSBidXMgaW4gdGhlIGNhc2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBKYWUgSHl1biBZb28gPGphZS5oeXVuLnlvb0BsaW51eC5pbnRlbC5jb20+DQoNClRoZSBwYXRj
aCBsb29rcyBnb29kIHRvIG1lLiBUaGFuayB5b3UgSmFlIGZvciBtYWtpbmcgdGhlIGNoYW5nZXMu
DQoNClJldmlld2VkLWJ5OiBUYW8gUmVuIDx0YW9yZW5AZmIuY29tPg0KDQpDaGVlcnMsDQoNClRh
bw0KPiAtLS0NCj4gQ2hhbmdlcyBzaW5jZSB2MjoNCj4gIC0gTW92ZWQgJ2FzcGVlZCxody10aW1l
b3V0LW1zJyBwcm9wZXJ0eSBwYXJzaW5nIGxvZ2ljIHRvIG1ha2UgaXQgY2FuDQo+ICAgIGJlIGRv
bmUgYmVmb3JlIGFzcGVlZF9pMmNfaW5pdF9jbGsuDQo+IA0KPiBDaGFuZ2VzIHNpbmNlIHYxOg0K
PiAgLSBNYWRlIGl0IHVzZSBidXMgYXV0byByZWNvdmVyeSBmZWF0dXJlIHNvIHRoYXQgYnVzIGNh
biByZWNvdmVyIGl0c2VsZg0KPiAgICBhdXRvbWF0aWNhbGx5Lg0KPiANCj4gIGRyaXZlcnMvaTJj
L2J1c3Nlcy9pMmMtYXNwZWVkLmMgfCA4MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKyst
LS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA3NiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXNwZWVkLmMgYi9kcml2
ZXJzL2kyYy9idXNzZXMvaTJjLWFzcGVlZC5jDQo+IGluZGV4IDg5MzE3OTI5YmVlNC4uYzY2ZWNh
OWEwMGY0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWFzcGVlZC5jDQo+
ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXNwZWVkLmMNCj4gQEAgLTU1LDYgKzU1LDcg
QEANCj4gIC8qIERldmljZSBSZWdpc3RlciBEZWZpbml0aW9uICovDQo+ICAvKiAweDAwIDogSTJD
RCBGdW5jdGlvbiBDb250cm9sIFJlZ2lzdGVyICAqLw0KPiAgI2RlZmluZSBBU1BFRURfSTJDRF9C
VUZGRVJfUEFHRV9TRUxfTUFTSwkJR0VOTUFTSygyMiwgMjApDQo+ICsjZGVmaW5lIEFTUEVFRF9J
MkNEX0JVU19BVVRPX1JFQ09WRVJZX0VOCQlCSVQoMTcpDQo+ICAjZGVmaW5lIEFTUEVFRF9JMkNE
X01VTFRJX01BU1RFUl9ESVMJCQlCSVQoMTUpDQo+ICAjZGVmaW5lIEFTUEVFRF9JMkNEX1NEQV9E
UklWRV8xVF9FTgkJCUJJVCg4KQ0KPiAgI2RlZmluZSBBU1BFRURfSTJDRF9NX1NEQV9EUklWRV8x
VF9FTgkJCUJJVCg3KQ0KPiBAQCAtNzAsMTAgKzcxLDE0IEBADQo+ICAjZGVmaW5lIEFTUEVFRF9J
MkNEX1RJTUVfU0NMX0hJR0hfTUFTSwkJCUdFTk1BU0soMTksIDE2KQ0KPiAgI2RlZmluZSBBU1BF
RURfSTJDRF9USU1FX1NDTF9MT1dfU0hJRlQJCQkxMg0KPiAgI2RlZmluZSBBU1BFRURfSTJDRF9U
SU1FX1NDTF9MT1dfTUFTSwkJCUdFTk1BU0soMTUsIDEyKQ0KPiArI2RlZmluZSBBU1BFRURfSTJD
RF9USU1FX1RJTUVPVVRfQkFTRV9ESVZJU09SX1NISUZUCTgNCj4gKyNkZWZpbmUgQVNQRUVEX0ky
Q0RfVElNRV9USU1FT1VUX0JBU0VfRElWSVNPUl9NQVNLCUdFTk1BU0soOSwgOCkNCj4gICNkZWZp
bmUgQVNQRUVEX0kyQ0RfVElNRV9CQVNFX0RJVklTT1JfTUFTSwkJR0VOTUFTSygzLCAwKQ0KPiAg
I2RlZmluZSBBU1BFRURfSTJDRF9USU1FX1NDTF9SRUdfTUFYCQkJR0VOTUFTSygzLCAwKQ0KPiAr
DQo+ICAvKiAweDA4IDogSTJDRCBDbG9jayBhbmQgQUMgVGltaW5nIENvbnRyb2wgUmVnaXN0ZXIg
IzIgKi8NCj4gLSNkZWZpbmUgQVNQRUVEX05PX1RJTUVPVVRfQ1RSTAkJCQkwDQo+ICsjZGVmaW5l
IEFTUEVFRF9JMkNEX1RJTUVPVVRfQ1lDTEVTX1NISUZUCQkwDQo+ICsjZGVmaW5lIEFTUEVFRF9J
MkNEX1RJTUVPVVRfQ1lDTEVTX01BU0sJCQlHRU5NQVNLKDQsIDApDQo+ICANCj4gIC8qIDB4MGMg
OiBJMkNEIEludGVycnVwdCBDb250cm9sIFJlZ2lzdGVyICYNCj4gICAqIDB4MTAgOiBJMkNEIElu
dGVycnVwdCBTdGF0dXMgUmVnaXN0ZXINCj4gQEAgLTgxLDYgKzg2LDcgQEANCj4gICAqIFRoZXNl
IHNoYXJlIGJpdCBkZWZpbml0aW9ucywgc28gdXNlIHRoZSBzYW1lIHZhbHVlcyBmb3IgdGhlIGVu
YWJsZSAmDQo+ICAgKiBzdGF0dXMgYml0cy4NCj4gICAqLw0KPiArI2RlZmluZSBBU1BFRURfSTJD
RF9JTlRSX1NMQVZFX0lOQUNUSVZFX1RJTUVPVVQJCUJJVCgxNSkNCj4gICNkZWZpbmUgQVNQRUVE
X0kyQ0RfSU5UUl9TREFfRExfVElNRU9VVAkJCUJJVCgxNCkNCj4gICNkZWZpbmUgQVNQRUVEX0ky
Q0RfSU5UUl9CVVNfUkVDT1ZFUl9ET05FCQlCSVQoMTMpDQo+ICAjZGVmaW5lIEFTUEVFRF9JMkNE
X0lOVFJfU0xBVkVfTUFUQ0gJCQlCSVQoNykNCj4gQEAgLTk2LDggKzEwMiwxMSBAQA0KPiAgCQkg
QVNQRUVEX0kyQ0RfSU5UUl9TQ0xfVElNRU9VVCB8CQkJCSAgICAgICBcDQo+ICAJCSBBU1BFRURf
STJDRF9JTlRSX0FCTk9STUFMIHwJCQkJICAgICAgIFwNCj4gIAkJIEFTUEVFRF9JMkNEX0lOVFJf
QVJCSVRfTE9TUykNCj4gKyNkZWZpbmUgQVNQRUVEX0kyQ0RfSU5UUl9TTEFWRV9FUlJPUlMJCQkJ
CSAgICAgICBcDQo+ICsJCUFTUEVFRF9JMkNEX0lOVFJfU0xBVkVfSU5BQ1RJVkVfVElNRU9VVA0K
PiAgI2RlZmluZSBBU1BFRURfSTJDRF9JTlRSX0FMTAkJCQkJCSAgICAgICBcDQo+IC0JCShBU1BF
RURfSTJDRF9JTlRSX1NEQV9ETF9USU1FT1VUIHwJCQkgICAgICAgXA0KPiArCQkoQVNQRUVEX0ky
Q0RfSU5UUl9TTEFWRV9JTkFDVElWRV9USU1FT1VUIHwJCSAgICAgICBcDQo+ICsJCSBBU1BFRURf
STJDRF9JTlRSX1NEQV9ETF9USU1FT1VUIHwJCQkgICAgICAgXA0KPiAgCQkgQVNQRUVEX0kyQ0Rf
SU5UUl9CVVNfUkVDT1ZFUl9ET05FIHwJCQkgICAgICAgXA0KPiAgCQkgQVNQRUVEX0kyQ0RfSU5U
Ul9TQ0xfVElNRU9VVCB8CQkJCSAgICAgICBcDQo+ICAJCSBBU1BFRURfSTJDRF9JTlRSX0FCTk9S
TUFMIHwJCQkJICAgICAgIFwNCj4gQEAgLTE3Niw2ICsxODUsNyBAQCBzdHJ1Y3QgYXNwZWVkX2ky
Y19idXMgew0KPiAgCQkJCQkJCSAgIHUzMiBkaXZpc29yKTsNCj4gIAl1bnNpZ25lZCBsb25nCQkJ
cGFyZW50X2Nsa19mcmVxdWVuY3k7DQo+ICAJdTMyCQkJCWJ1c19mcmVxdWVuY3k7DQo+ICsJdTMy
CQkJCWh3X3RpbWVvdXRfbXM7DQo+ICAJLyogVHJhbnNhY3Rpb24gc3RhdGUuICovDQo+ICAJZW51
bSBhc3BlZWRfaTJjX21hc3Rlcl9zdGF0ZQltYXN0ZXJfc3RhdGU7DQo+ICAJc3RydWN0IGkyY19t
c2cJCQkqbXNnczsNCj4gQEAgLTI3Niw2ICsyODYsMTQgQEAgc3RhdGljIGludCBhc3BlZWRfaTJj
X3JlY292ZXJfYnVzKHN0cnVjdCBhc3BlZWRfaTJjX2J1cyAqYnVzKQ0KPiAgfQ0KPiAgDQo+ICAj
aWYgSVNfRU5BQkxFRChDT05GSUdfSTJDX1NMQVZFKQ0KPiArc3RhdGljIGludCBhc3BlZWRfaTJj
X2NoZWNrX3NsYXZlX2Vycm9yKHUzMiBpcnFfc3RhdHVzKQ0KPiArew0KPiArCWlmIChpcnFfc3Rh
dHVzICYgQVNQRUVEX0kyQ0RfSU5UUl9TTEFWRV9JTkFDVElWRV9USU1FT1VUKQ0KPiArCQlyZXR1
cm4gLUVJTzsNCj4gKw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArDQo+ICBzdGF0aWMgdTMyIGFz
cGVlZF9pMmNfc2xhdmVfaXJxKHN0cnVjdCBhc3BlZWRfaTJjX2J1cyAqYnVzLCB1MzIgaXJxX3N0
YXR1cykNCj4gIHsNCj4gIAl1MzIgY29tbWFuZCwgaXJxX2hhbmRsZWQgPSAwOw0KPiBAQCAtMjg2
LDYgKzMwNCwxNCBAQCBzdGF0aWMgdTMyIGFzcGVlZF9pMmNfc2xhdmVfaXJxKHN0cnVjdCBhc3Bl
ZWRfaTJjX2J1cyAqYnVzLCB1MzIgaXJxX3N0YXR1cykNCj4gIAlpZiAoIXNsYXZlKQ0KPiAgCQly
ZXR1cm4gMDsNCj4gIA0KPiArCWlmIChhc3BlZWRfaTJjX2NoZWNrX3NsYXZlX2Vycm9yKGlycV9z
dGF0dXMpKSB7DQo+ICsJCWRldl9kYmcoYnVzLT5kZXYsICJyZWNlaXZlZCBzbGF2ZSBlcnJvciBp
bnRlcnJ1cHQ6IDB4JTA4eFxuIiwNCj4gKwkJCWlycV9zdGF0dXMpOw0KPiArCQlpcnFfaGFuZGxl
ZCB8PSAoaXJxX3N0YXR1cyAmIEFTUEVFRF9JMkNEX0lOVFJfU0xBVkVfRVJST1JTKTsNCj4gKwkJ
YnVzLT5zbGF2ZV9zdGF0ZSA9IEFTUEVFRF9JMkNfU0xBVkVfSU5BQ1RJVkU7DQo+ICsJCXJldHVy
biBpcnFfaGFuZGxlZDsNCj4gKwl9DQo+ICsNCj4gIAljb21tYW5kID0gcmVhZGwoYnVzLT5iYXNl
ICsgQVNQRUVEX0kyQ19DTURfUkVHKTsNCj4gIA0KPiAgCS8qIFNsYXZlIHdhcyByZXF1ZXN0ZWQs
IHJlc3RhcnQgc3RhdGUgbWFjaGluZS4gKi8NCj4gQEAgLTYwMiw3ICs2MjgsNyBAQCBzdGF0aWMg
dm9pZCBhc3BlZWRfaTJjX25leHRfbXNnX29yX3N0b3Aoc3RydWN0IGFzcGVlZF9pMmNfYnVzICpi
dXMpDQo+ICAJfQ0KPiAgfQ0KPiAgDQo+IC1zdGF0aWMgaW50IGFzcGVlZF9pMmNfaXNfaXJxX2Vy
cm9yKHUzMiBpcnFfc3RhdHVzKQ0KPiArc3RhdGljIGludCBhc3BlZWRfaTJjX2NoZWNrX21hc3Rl
cl9lcnJvcih1MzIgaXJxX3N0YXR1cykNCj4gIHsNCj4gIAlpZiAoaXJxX3N0YXR1cyAmIEFTUEVF
RF9JMkNEX0lOVFJfQVJCSVRfTE9TUykNCj4gIAkJcmV0dXJuIC1FQUdBSU47DQo+IEBAIC02MzMs
OSArNjU5LDkgQEAgc3RhdGljIHUzMiBhc3BlZWRfaTJjX21hc3Rlcl9pcnEoc3RydWN0IGFzcGVl
ZF9pMmNfYnVzICpidXMsIHUzMiBpcnFfc3RhdHVzKQ0KPiAgCSAqIHNob3VsZCBjbGVhciB0aGUg
Y29tbWFuZCBxdWV1ZSBlZmZlY3RpdmVseSB0YWtpbmcgdXMgYmFjayB0byB0aGUNCj4gIAkgKiBJ
TkFDVElWRSBzdGF0ZS4NCj4gIAkgKi8NCj4gLQlyZXQgPSBhc3BlZWRfaTJjX2lzX2lycV9lcnJv
cihpcnFfc3RhdHVzKTsNCj4gKwlyZXQgPSBhc3BlZWRfaTJjX2NoZWNrX21hc3Rlcl9lcnJvcihp
cnFfc3RhdHVzKTsNCj4gIAlpZiAocmV0KSB7DQo+IC0JCWRldl9kYmcoYnVzLT5kZXYsICJyZWNl
aXZlZCBlcnJvciBpbnRlcnJ1cHQ6IDB4JTA4eFxuIiwNCj4gKwkJZGV2X2RiZyhidXMtPmRldiwg
InJlY2VpdmVkIG1hc3RlciBlcnJvciBpbnRlcnJ1cHQ6IDB4JTA4eFxuIiwNCj4gIAkJCWlycV9z
dGF0dXMpOw0KPiAgCQlpcnFfaGFuZGxlZCB8PSAoaXJxX3N0YXR1cyAmIEFTUEVFRF9JMkNEX0lO
VFJfTUFTVEVSX0VSUk9SUyk7DQo+ICAJCWlmIChidXMtPm1hc3Rlcl9zdGF0ZSAhPSBBU1BFRURf
STJDX01BU1RFUl9JTkFDVElWRSkgew0KPiBAQCAtMTE5NCw2ICsxMjIwLDcgQEAgc3RhdGljIHUz
MiBhc3BlZWRfaTJjXzI1eHhfZ2V0X2Nsa19yZWdfdmFsKHN0cnVjdCBkZXZpY2UgKmRldiwgdTMy
IGRpdmlzb3IpDQo+ICAvKiBwcmVjb25kaXRpb246IGJ1cy5sb2NrIGhhcyBiZWVuIGFjcXVpcmVk
LiAqLw0KPiAgc3RhdGljIGludCBhc3BlZWRfaTJjX2luaXRfY2xrKHN0cnVjdCBhc3BlZWRfaTJj
X2J1cyAqYnVzKQ0KPiAgew0KPiArCXUzMiB0aW1lb3V0X2Jhc2VfZGl2aXNvciwgdGltZW91dF90
aWNrX3VzLCB0aW1lb3V0X2N5Y2xlczsNCj4gIAl1MzIgZGl2aXNvciwgY2xrX3JlZ192YWw7DQo+
ICANCj4gIAlkaXZpc29yID0gRElWX1JPVU5EX1VQKGJ1cy0+cGFyZW50X2Nsa19mcmVxdWVuY3ks
IGJ1cy0+YnVzX2ZyZXF1ZW5jeSk7DQo+IEBAIC0xMjAyLDggKzEyMjksNDYgQEAgc3RhdGljIGlu
dCBhc3BlZWRfaTJjX2luaXRfY2xrKHN0cnVjdCBhc3BlZWRfaTJjX2J1cyAqYnVzKQ0KPiAgCQkJ
QVNQRUVEX0kyQ0RfVElNRV9USERTVEFfTUFTSyB8DQo+ICAJCQlBU1BFRURfSTJDRF9USU1FX1RB
Q1NUX01BU0spOw0KPiAgCWNsa19yZWdfdmFsIHw9IGJ1cy0+Z2V0X2Nsa19yZWdfdmFsKGJ1cy0+
ZGV2LCBkaXZpc29yKTsNCj4gKw0KPiArCWlmIChidXMtPmh3X3RpbWVvdXRfbXMpIHsNCj4gKwkJ
dTggZGl2X21heCA9IEFTUEVFRF9JMkNEX1RJTUVfVElNRU9VVF9CQVNFX0RJVklTT1JfTUFTSyA+
Pg0KPiArCQkJICAgICBBU1BFRURfSTJDRF9USU1FX1RJTUVPVVRfQkFTRV9ESVZJU09SX1NISUZU
Ow0KPiArCQl1OCBjeWNsZXNfbWF4ID0gQVNQRUVEX0kyQ0RfVElNRU9VVF9DWUNMRVNfTUFTSyA+
Pg0KPiArCQkJCUFTUEVFRF9JMkNEX1RJTUVPVVRfQ1lDTEVTX1NISUZUOw0KPiArDQo+ICsJCXRp
bWVvdXRfYmFzZV9kaXZpc29yID0gMDsNCj4gKw0KPiArCQlkbyB7DQo+ICsJCQl0aW1lb3V0X3Rp
Y2tfdXMgPSAxMDAwICogKDE2Mzg0IDw8DQo+ICsJCQkJCQkgICh0aW1lb3V0X2Jhc2VfZGl2aXNv
ciA8PCAxKSkgLw0KPiArCQkJCQkgIChidXMtPnBhcmVudF9jbGtfZnJlcXVlbmN5IC8gMTAwMCk7
DQo+ICsNCj4gKwkJCWlmICh0aW1lb3V0X2Jhc2VfZGl2aXNvciA9PSBkaXZfbWF4IHx8DQo+ICsJ
CQkgICAgdGltZW91dF90aWNrX3VzICogQVNQRUVEX0kyQ0RfVElNRU9VVF9DWUNMRVNfTUFTSyA+
PQ0KPiArCQkJICAgIGJ1cy0+aHdfdGltZW91dF9tcyAqIDEwMDApDQo+ICsJCQkJYnJlYWs7DQo+
ICsJCX0gd2hpbGUgKHRpbWVvdXRfYmFzZV9kaXZpc29yKysgPCBkaXZfbWF4KTsNCj4gKw0KPiAr
CQlpZiAodGltZW91dF90aWNrX3VzKSB7DQo+ICsJCQl0aW1lb3V0X2N5Y2xlcyA9IERJVl9ST1VO
RF9VUChidXMtPmh3X3RpbWVvdXRfbXMgKiAxMDAwLA0KPiArCQkJCQkJICAgICAgdGltZW91dF90
aWNrX3VzKTsNCj4gKwkJCWlmICh0aW1lb3V0X2N5Y2xlcyA9PSAwKQ0KPiArCQkJCXRpbWVvdXRf
Y3ljbGVzID0gMTsNCj4gKwkJCWVsc2UgaWYgKHRpbWVvdXRfY3ljbGVzID4gY3ljbGVzX21heCkN
Cj4gKwkJCQl0aW1lb3V0X2N5Y2xlcyA9IGN5Y2xlc19tYXg7DQo+ICsJCX0gZWxzZSB7DQo+ICsJ
CQl0aW1lb3V0X2N5Y2xlcyA9IDA7DQo+ICsJCX0NCj4gKwl9IGVsc2Ugew0KPiArCQl0aW1lb3V0
X2Jhc2VfZGl2aXNvciA9IDA7DQo+ICsJCXRpbWVvdXRfY3ljbGVzID0gMDsNCj4gKwl9DQo+ICsN
Cj4gKwljbGtfcmVnX3ZhbCB8PSBGSUVMRF9QUkVQKEFTUEVFRF9JMkNEX1RJTUVfVElNRU9VVF9C
QVNFX0RJVklTT1JfTUFTSywNCj4gKwkJCQkgIHRpbWVvdXRfYmFzZV9kaXZpc29yKTsNCj4gKw0K
PiAgCXdyaXRlbChjbGtfcmVnX3ZhbCwgYnVzLT5iYXNlICsgQVNQRUVEX0kyQ19BQ19USU1JTkdf
UkVHMSk7DQo+IC0Jd3JpdGVsKEFTUEVFRF9OT19USU1FT1VUX0NUUkwsIGJ1cy0+YmFzZSArIEFT
UEVFRF9JMkNfQUNfVElNSU5HX1JFRzIpOw0KPiArCXdyaXRlbCh0aW1lb3V0X2N5Y2xlcywgYnVz
LT5iYXNlICsgQVNQRUVEX0kyQ19BQ19USU1JTkdfUkVHMik7DQo+ICANCj4gIAlyZXR1cm4gMDsN
Cj4gIH0NCj4gQEAgLTEyMTgsNiArMTI4MywxMSBAQCBzdGF0aWMgaW50IGFzcGVlZF9pMmNfaW5p
dChzdHJ1Y3QgYXNwZWVkX2kyY19idXMgKmJ1cywNCj4gIAkvKiBEaXNhYmxlIGV2ZXJ5dGhpbmcu
ICovDQo+ICAJd3JpdGVsKDAsIGJ1cy0+YmFzZSArIEFTUEVFRF9JMkNfRlVOX0NUUkxfUkVHKTsN
Cj4gIA0KPiArCWRldmljZV9wcm9wZXJ0eV9yZWFkX3UzMigmcGRldi0+ZGV2LCAiYXNwZWVkLGh3
LXRpbWVvdXQtbXMiLA0KPiArCQkJCSAmYnVzLT5od190aW1lb3V0X21zKTsNCj4gKwlpZiAoYnVz
LT5od190aW1lb3V0X21zKQ0KPiArCQlmdW5fY3RybF9yZWcgfD0gQVNQRUVEX0kyQ0RfQlVTX0FV
VE9fUkVDT1ZFUllfRU47DQo+ICsNCj4gIAlyZXQgPSBhc3BlZWRfaTJjX2luaXRfY2xrKGJ1cyk7
DQo+ICAJaWYgKHJldCA8IDApDQo+ICAJCXJldHVybiByZXQ7DQo+IA0K
