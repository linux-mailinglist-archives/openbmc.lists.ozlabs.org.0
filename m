Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7986A10EF4
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 00:24:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vXxW01CvzDqQ1
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 08:24:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=00246b06a9=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="iOgai+aE"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="Eze9Cz+z"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vXwb4QsCzDqMt;
 Thu,  2 May 2019 08:23:22 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.27/8.16.0.27) with SMTP id x41MIVLC022812;
 Wed, 1 May 2019 15:23:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=MeD0z7nSNAiPX7xglTMuxpGvHQqFrooIDgaIP6EVFPM=;
 b=iOgai+aEsl8rDux6W/GgEUW8s7NcQJ37eW0daxCauNk0uUZQUMdLq9QbrbEjlOHU2mGi
 EHZigX3g9LjqFGlNP35TkMf+7OChz3gjWMPt3npZpacPRBQZUD/KeNwrKtA+/7ffRrTf
 Ms73myFO4BqQd1O4IYHtnLsWJDJxpRpzem0= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0089730.ppops.net with ESMTP id 2s7d0q1k9w-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 01 May 2019 15:23:02 -0700
Received: from ash-exhub102.TheFacebook.com (2620:10d:c0a8:82::f) by
 ash-exhub101.TheFacebook.com (2620:10d:c0a8:82::e) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 1 May 2019 15:23:01 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.172) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 1 May 2019 15:23:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MeD0z7nSNAiPX7xglTMuxpGvHQqFrooIDgaIP6EVFPM=;
 b=Eze9Cz+z7obd1ewMXFCMKYw/o4/kvnsWkoVzrV9m5G/Qhp8dZ+hRsBgIK+R1iiXB6K7O8nFLbPyFLKiceqBxovGjDWiVFlnXIJz0Q8MWYWkCuY19mPBUy9YIsUCGQ48kI5qKJ4QzvjTobxPGceoD7NFeaQ0Ow5nvoT6kClqOTWU=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1800.namprd15.prod.outlook.com (10.174.52.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Wed, 1 May 2019 22:22:59 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::1039:c5b1:f43e:14e9]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::1039:c5b1:f43e:14e9%3]) with mapi id 15.20.1835.010; Wed, 1 May 2019
 22:22:59 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joel Stanley
 <joel@jms.id.au>
Subject: Re: [PATCH v2] misc: aspeed-lpc-ctrl: make parameter optional
Thread-Topic: [PATCH v2] misc: aspeed-lpc-ctrl: make parameter optional
Thread-Index: AQHUrecp120UxlsdUUK9uZiXf1PR66W0eREAgAB5LwCAoXbNgIAADfIAgACQt4A=
Date: Wed, 1 May 2019 22:22:59 +0000
Message-ID: <3CEAC0C9-9B7A-4329-B719-B08A1951F12F@fb.com>
References: <20190116220154.1026171-1-vijaykhemka@fb.com>
 <1547787502.2061444.1637712576.1F1E21B4@webmail.messagingengine.com>
 <DCD8D2E5-DB18-427C-AA8F-18289E9AB0AB@fb.com>
 <CACPK8Xdgv1YVgeykf0grSpR3LXTGa45hoBwZVq+zWgR0anhmTg@mail.gmail.com>
 <20190501064501.GA20816@kroah.com>
In-Reply-To: <20190501064501.GA20816@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::1:4686]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ff9dbae-41a7-4906-70f4-08d6ce839184
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:CY4PR15MB1800; 
x-ms-traffictypediagnostic: CY4PR15MB1800:
x-microsoft-antispam-prvs: <CY4PR15MB1800916A122AA4DB389F53E0DD3B0@CY4PR15MB1800.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 00246AB517
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(136003)(39860400002)(366004)(396003)(376002)(199004)(189003)(36756003)(6486002)(446003)(99286004)(6436002)(68736007)(256004)(46003)(6116002)(33656002)(486006)(66446008)(186003)(64756008)(66556008)(66476007)(11346002)(476003)(229853002)(76116006)(91956017)(6506007)(2906002)(102836004)(66946007)(73956011)(76176011)(82746002)(2616005)(5660300002)(7736002)(478600001)(316002)(4326008)(305945005)(25786009)(4744005)(86362001)(53936002)(6246003)(14454004)(110136005)(71190400001)(8676002)(8936002)(83716004)(71200400001)(6512007)(81156014)(54906003)(81166006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1800;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6YSt5i7TEzPUsr/LcIDVOf7T8iqfpXpaImfaYB32v8fdL+NQfkOpCLQ5GBE1cRt8nTSl+xdAeoZp/zUgdqTGrYCrjrdKbJmE3NFLCISHgnnK7Pnjm486/c5K5dmwGQdsK0imppCr37RFHwAzoo3vFjGMzdOwyOoPpujnlf7+0lrwMfq6IVnUBEcCAShBZSbfWDRzpUQwiksGFlIaJIPETHNV9JnVNa1AjPpL7W9IS630ycu/jnA0nF7u9LPyeeLvD6Rkpovu7Aeq6NLRzx9W+FQdEwftLSkI4lELkWWBoqYlIsrieKQ8LZJ9722uKAZcO9gmBPjMHLCqqJDRh/N62zhkynu5UrR9IL15bXw9lzNXV8+8uoebfRPrmswlnKniEnmWBzZxrB6QtE+P9dtwHJqLB45rUY3KWR/J9hyzhtY=
Content-Type: text/plain; charset="utf-8"
Content-ID: <35AE8DEDA36D6048987B73B2DAEB4D24@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ff9dbae-41a7-4906-70f4-08d6ce839184
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2019 22:22:59.5666 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1800
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-01_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=902 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905010137
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

TGV0IG1lIHNlbmQgYm90aCBwYXRjaGVzLg0KDQrvu79PbiA0LzMwLzE5LCAxMTo0NSBQTSwgIkdy
ZWcgS3JvYWgtSGFydG1hbiIgPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToNCg0K
ICAgIE9uIFdlZCwgTWF5IDAxLCAyMDE5IGF0IDA1OjU1OjA3QU0gKzAwMDAsIEpvZWwgU3Rhbmxl
eSB3cm90ZToNCiAgICA+IE9uIEZyaSwgMTggSmFuIDIwMTkgYXQgMjA6MTIsIFZpamF5IEtoZW1r
YSA8dmlqYXlraGVta2FAZmIuY29tPiB3cm90ZToNCiAgICA+ID4NCiAgICA+ID4gSGkgQW5kcmV3
LA0KICAgID4gPiBUaGFua3MgZm9yIHRoaXMgcmV2aWV3LCBJIHdpbGwgaGF2ZSBhIGZvbGxvdyB1
cCBwYXRjaCBmb3IgdGhpcyByZXR1cm4gdmFsdWVzLg0KICAgID4gDQogICAgPiBEaWQgeW91IHNl
bmQgYSBmb2xsb3cgdXAgcGF0Y2ggdG8gZml4IHRoZSByZXR1cm4gdmFsdWVzPw0KICAgID4gDQog
ICAgPiBHcmVnLCBpcyB0aGVyZSBhbnkgcmVhc29uIHdoeSB5b3UgZGlkIG5vdCBtZXJnZSB0aGlz
IG9uZT8gNS4yIHdpbGwNCiAgICA+IGhhdmUgZGV2aWNlIHRyZWVzIHRoYXQgZGVwZW5kIG9uIHRo
aXMgcGF0Y2gncyBiZWhhdmlvci4NCiAgICANCiAgICBObyBpZGVhLCBpZiBpdCBuZWVkcyB0byBi
ZSBhcHBsaWVkLCBwbGVhc2UgcmVzZW5kLg0KICAgIA0KICAgIHRoYW5rcywNCiAgICANCiAgICBn
cmVnIGstaA0KICAgIA0KDQo=
