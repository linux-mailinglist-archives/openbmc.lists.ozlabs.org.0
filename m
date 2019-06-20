Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97ED94C933
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 10:16:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Tvlw6SzszDrC0
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 18:16:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=10748cf007=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="lrGKbH6y"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="QwMLrZFo"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tvjn0tC6zDr0C;
 Thu, 20 Jun 2019 18:14:19 +1000 (AEST)
Received: from pps.filterd (m0001255.ppops.net [127.0.0.1])
 by mx0b-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5K8Ck6q022125; Thu, 20 Jun 2019 01:14:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=PTeG8r4X+BCl2HeeRUWzqOvMIOdO8nDfaT9DPMPtAB0=;
 b=lrGKbH6yLNeoxyhlqwU4hgUoVjn4GIbgEycxayszCGXgXLA398iWncusZo6rdMNaqkF0
 iYMsY+dzM4jlkc36APluPK6TIbK70aRv5bq4tagbQfGNRX8tCvPBehsRwuXw1KXLsrS4
 yUdTg3Lu6Ky19B/so2B+ZMOeCF0wjV1zjAY= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0b-00082601.pphosted.com with ESMTP id 2t7rex2qdk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 20 Jun 2019 01:14:03 -0700
Received: from ash-exhub101.TheFacebook.com (2620:10d:c0a8:82::e) by
 ash-exhub102.TheFacebook.com (2620:10d:c0a8:82::f) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 20 Jun 2019 01:14:00 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.173) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 20 Jun 2019 01:14:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTeG8r4X+BCl2HeeRUWzqOvMIOdO8nDfaT9DPMPtAB0=;
 b=QwMLrZFoeSnyeoxRlpCVaC6bzlAhxujWICnXQmxYCYwBPpZEN2WTWSrEj3t30zhJs/1g0UtEF4cFHmqWEVkr0DL7zNxSftWnGDCAiFgdsqL4qdktImTdyjgsSCexqhSsghTprsJ0/4EJ6ozvTP+7tqyKR5FWjWoWQPps2V8aBg4=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1422.namprd15.prod.outlook.com (10.173.234.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.13; Thu, 20 Jun 2019 08:13:59 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::d51f:8f19:e2b5:3ae8]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::d51f:8f19:e2b5:3ae8%6]) with mapi id 15.20.1987.014; Thu, 20 Jun 2019
 08:13:59 +0000
From: Tao Ren <taoren@fb.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Brendan Higgins
 <brendanhiggins@google.com>
Subject: Re: [PATCH 1/2] i2c: aspeed: allow to customize base clock divisor
Thread-Topic: [PATCH 1/2] i2c: aspeed: allow to customize base clock divisor
Thread-Index: AQHVJuIcteG+E70PmUey9PLXreYJ5KajfUSAgAASwwCAAJYbgIAAB62AgAABSgCAAANYAA==
Date: Thu, 20 Jun 2019 08:13:59 +0000
Message-ID: <56ff5fa8-091a-2cbc-dfa3-b912cf328695@fb.com>
References: <20190619205009.4176588-1-taoren@fb.com>
 <CAFd5g45TMtXcuqONdkpN_K+c0O+wUw8wkGzcQfV+sO8p5Krc9w@mail.gmail.com>
 <18565fcf-3dc1-b671-f826-e4417e4ad284@fb.com>
 <c610ecede7494c189a92a9a3f6d0fd16@TWMBX02.aspeed.com>
 <bdd53adb-6987-1b91-adde-298839b2c066@fb.com>
 <195bb56028d04001bbaf835cc17e032e@TWMBX02.aspeed.com>
In-Reply-To: <195bb56028d04001bbaf835cc17e032e@TWMBX02.aspeed.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MW2PR2101CA0025.namprd21.prod.outlook.com
 (2603:10b6:302:1::38) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:180::1:56ae]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f54f7fd-6526-49d0-91ca-08d6f5573f31
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1422; 
x-ms-traffictypediagnostic: MWHPR15MB1422:
x-microsoft-antispam-prvs: <MWHPR15MB14221E2E6B210AA6FE8F33F8B2E40@MWHPR15MB1422.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(376002)(39860400002)(136003)(396003)(189003)(199004)(14454004)(7736002)(305945005)(7416002)(4326008)(14444005)(53546011)(66946007)(66556008)(256004)(6506007)(386003)(31686004)(66446008)(64756008)(66476007)(478600001)(73956011)(6512007)(229853002)(110136005)(25786009)(54906003)(36756003)(58126008)(316002)(31696002)(86362001)(6246003)(71200400001)(71190400001)(65826007)(81156014)(6486002)(81166006)(8936002)(52116002)(446003)(4744005)(476003)(76176011)(6116002)(99286004)(2616005)(11346002)(64126003)(486006)(68736007)(5660300002)(6436002)(46003)(102836004)(65806001)(65956001)(2906002)(186003)(53936002)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1422;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Vlpo+x+lsH6HgRrgw7iM35NSF9+4nbtjJgSAsUnjAK8AHdM69/fxMllVl0H1VtB5s6SForlK30ZGgiXfRX6//gm2DaWcMAvx0GyzL4+be/tpMVp0azFLiffhTO1a4k2Y3aAGfPVLrUjy62z9Kq+6dXCP7ZiZ6YYGtJUIDPwXXcvdEVaHvnFWqUUJWbR3cLUKUNssPjDRN3V+jv4w2YQB/K39nockZumTeeFLrUcOGJ96ObVKuvIXCCw4+M1D+TligFf7zSJbEKU0nzIKtf+E3Kgwwu1lPQuOsAM5yJMqpun0XM5ib8bRAr2273GlXSFZ2q+r0AxPzT4GXBEqcQdzwQINuxSyKz9MXtalkWT9ShApP8qZTnDtYSWpBgB0rjw6dgLdICb0th2usrUSs2zxM+x24VTeSw/u5gQEkfaKvz8=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C26BC355B528F04297AFB94D467A3AFA@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f54f7fd-6526-49d0-91ca-08d6f5573f31
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 08:13:59.4590 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: taoren@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1422
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-20_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906200064
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
 devicetree <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gNi8yMC8xOSAxOjAxIEFNLCBSeWFuIENoZW4gd3JvdGU6DQo+IEhlbGxvIFRhbywNCj4gCUxl
dCBtZSBtb3JlIGNsZWFyLiBXaGVuIHlvdSBzZXQgKDMsIDE1LCAxNCkgdGhlIGRldmljZSBzb21l
dGltZXMgcmVzcG9uc2UgbmFjay4gDQo+IAlidXQgd2hlbiB5b3Ugc2V0ICg0LCA3LCA3KSwgdGhl
IGRldmljZSBhbHdheXMgYWNrLiBBbSBJIHJpZ2h0PyANCj4gUnlhbg0KDQpIZWxsbyBSeWFuLA0K
DQpJdCdzIGNvcnJlY3QuIFdlIGhhdmUgc2VlbiB0aGUgcHJvYmxlbSBvbiAyIEZhY2Vib29rIEJN
QyBwbGF0Zm9ybXMgc28gZmFyLiBHaXZlbiB0aGUgb3RoZXIgfjEwIEZhY2Vib29rIEJNQyBwbGF0
Zm9ybXMgYXJlIHN0aWxsIHJ1bm5pbmcga2VybmVsIDQuMSAod2l0aCAoNCwgNywgNykgc2V0dGlu
Z3MpLCBJJ2QgYXNzdW1lIG1vcmUgcGxhdGZvcm1zIHdpbGwgYmUgaW1wYWN0ZWQgYWZ0ZXIgdXBn
cmFkaW5nIHRvIHRoZSBsYXRlc3Qga2VybmVsLg0KDQpUaGFuayB5b3UgZm9yIHNwZW5kaW5nIHRp
bWUgb24gdGhpcyENCg0KDQpDaGVlcnMsDQoNClRhbw0K
