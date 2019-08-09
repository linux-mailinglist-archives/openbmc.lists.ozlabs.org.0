Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CC188468
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2019 23:09:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464yXZ4LvrzDrNJ
	for <lists+openbmc@lfdr.de>; Sat, 10 Aug 2019 07:09:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=3124fcab13=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="SDyvt7o2"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="KBAc+GGL"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464yWr05GMzDr8g
 for <openbmc@lists.ozlabs.org>; Sat, 10 Aug 2019 07:08:23 +1000 (AEST)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x79L48FB031379
 for <openbmc@lists.ozlabs.org>; Fri, 9 Aug 2019 14:08:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=qRvPr27ZruhDM99Lbv9rb82XLR3npQ28ZenveUV2kjI=;
 b=SDyvt7o270VLU6H0N0wDve23QYVDkZNCZxCVEHhc3BkcFgCpAPPat84QwDcUY4g5qFhZ
 uL35ZC9PxOXyyfK2VhzXQebbz4rZTB5jKxsdBSfs1SDiYL3JSNqbNgTgV6pXCcgdzv9Y
 RBxJchMXiGv5DxJtmY1YwLuXQfpB50Ugwhw= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2u96vgtk15-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 09 Aug 2019 14:08:20 -0700
Received: from prn-hub02.TheFacebook.com (2620:10d:c081:35::126) by
 prn-hub06.TheFacebook.com (2620:10d:c081:35::130) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Fri, 9 Aug 2019 14:08:19 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Fri, 9 Aug 2019 14:08:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ptc8D3CyJKQ2IU36r421J75agFhGPBkZg7v5cr3I5/UdW/fd15ol9TZ6btUqRLVIgexOtSQAhqdgAgamcMejwxAhBbmlmDQ8EESxQ+u30CxfFoBYc5i55eWq30bgDd+bRAzJXEE1wcaMfXbkRKyfMFJFhhiOd9DWAwa/ipL1c1YxYgPK6luLEzCq5/50NyxOF6oqSyFM9RzqEAK1Mk+CmrdZsuHs/eTQx6mmTEodzvdtWiXZbn93lhVMmtcy+gLbiUUjSFYlfZmiqAtXbXimu1i+nqVkbmn99bp73Fi8uTqDlkVOGl5bKywaF/7WHj4Nmvo++3WqqM/U43ZL585w1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qRvPr27ZruhDM99Lbv9rb82XLR3npQ28ZenveUV2kjI=;
 b=WGVHg31UYNcSYRF2+SxI0fh0FmXynULQCKnCHwGw1/GTVovs6nmeSi/ONhk8MCIoAwsuWM1bHlioP1HhdF5+X85QC24O9TypRknuE8/uQqvOpFcmgeSHQaMF/6qsb1jWI/V1LWJJm6+SwPDabi+y09WV36RoBiox31ZPTupBwdGr0eJqA5bPa6pNqoNwxy59ek+SW6e9jL9alaPAdDM4knDa3nNZfxbDwGdah5Uh3OZG6DkxkFzrkN6wjW55vH6MPH3HqXb1eqRhsIK//Ksd9d+amz2UhD+wTOrIFTHK7fjYksFtIGZSQToU8FsI5faxwgyS61CmVqqPmiXzSXuA3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qRvPr27ZruhDM99Lbv9rb82XLR3npQ28ZenveUV2kjI=;
 b=KBAc+GGL1cbK7vXbefk8pSt9pEQTWMZi0mxzrqHlBBbwOSOeIxRxDp81Ib4BxUrn0CWWLfmRHkFGSnc7B04UgDQBiWr3k18IORG3Xrs7497e3aV5DKVkWi0rD8sl8XKfehKBohuFT3BmXRBknNsl2Fvgo8yJT4FOVEOxBgQFJ4I=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1421.namprd15.prod.outlook.com (10.173.235.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.13; Fri, 9 Aug 2019 21:08:18 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::2971:619a:860e:b6cc]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::2971:619a:860e:b6cc%2]) with mapi id 15.20.2157.020; Fri, 9 Aug 2019
 21:08:18 +0000
From: Tao Ren <taoren@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [Potential Spoof] Re: [PATCH net-next v6 3/3] net: phy: broadcom:
 add 1000Base-X support for BCM54616S
Thread-Topic: [Potential Spoof] Re: [PATCH net-next v6 3/3] net: phy:
 broadcom: add 1000Base-X support for BCM54616S
Thread-Index: AQHVTnXbR0omRCjy/0G0ZEtUvAlu56bzQySAgAAJTACAAAPEAA==
Date: Fri, 9 Aug 2019 21:08:18 +0000
Message-ID: <04d51cab-b243-804a-7937-864c3f0af3af@fb.com>
References: <20190809054411.1015962-1-taoren@fb.com>
 <97cd059c-d98e-1392-c814-f3bd628e6366@gmail.com>
 <e556dd17-ef85-3c61-bc08-17db02d9a5dc@fb.com>
In-Reply-To: <e556dd17-ef85-3c61-bc08-17db02d9a5dc@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CO2PR18CA0056.namprd18.prod.outlook.com
 (2603:10b6:104:2::24) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::2:f2f1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d7878ef-f52e-4f6a-47df-08d71d0db3b1
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1421; 
x-ms-traffictypediagnostic: MWHPR15MB1421:
x-microsoft-antispam-prvs: <MWHPR15MB14217DA9FC9DC0CF60AABCDDB2D60@MWHPR15MB1421.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(346002)(136003)(396003)(366004)(376002)(189003)(199004)(316002)(65806001)(8676002)(476003)(2616005)(14454004)(6512007)(99286004)(31696002)(64126003)(5640700003)(86362001)(5660300002)(58126008)(65956001)(71190400001)(7736002)(71200400001)(305945005)(229853002)(66556008)(478600001)(66446008)(64756008)(25786009)(66946007)(6116002)(2906002)(6436002)(6246003)(66476007)(65826007)(6486002)(386003)(6506007)(53936002)(53546011)(36756003)(186003)(486006)(46003)(8936002)(14444005)(256004)(11346002)(446003)(2501003)(6916009)(31686004)(81156014)(81166006)(2351001)(1730700003)(52116002)(76176011)(102836004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1421;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1q7Qe/IV0EOgEvy/td2mFZa9RtV9be8VUaS4WqBA2LaCXSSJgDg3cRTZ822OaHKq90EI/POJ7X3mMQSSNtGZ/TCb9p9jLc1K5xrbQBOcXa2VH2XSTEtMRsTREf3oyTnjjF+G+dpKTNxCpIfmhjRnRTum9sO1Hg91XGay5NATS2z8LojYwXuaa5i9cMHGEDewW0xRjKLQ1MMUWpikknqTgUwjZo7FHG4qnrEsoFG1wjHmlS49dnftjCNekc4fESPcDw36bQm3vpHR3fuwH0dgQR/jqrAhw56mk6ixO6JcS3KFHd5du7EclFNU8f/MlKNGKg/Ij+A+FFXh2S1cHwhLYwc7DJy9SsvGFes6EHxwyfSefWrJhW/e18cHmsdXBCtYuZndg2smIBUY29sEPoIeaPvjxfBWc9nlpiq2e+Dzl7o=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <11CF120196D6A74AB15358C1DAF9CD68@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d7878ef-f52e-4f6a-47df-08d71d0db3b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 21:08:18.4334 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tES3l7cxJGwKNiKAzSRy0ol+W54LuMga8IAweJw0Auo2EVUU3jQxoC5q9RSuJdq2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1421
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-09_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=960 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908090206
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gOC85LzE5IDE6NTQgUE0sIFRhbyBSZW4gd3JvdGU6DQo+IEhpIEhlaW5lciwNCj4gDQo+IE9u
IDgvOS8xOSAxOjIxIFBNLCBIZWluZXIgS2FsbHdlaXQgd3JvdGU6DQo+PiBPbiAwOS4wOC4yMDE5
IDA3OjQ0LCBUYW8gUmVuIHdyb3RlOg0KPj4+IFRoZSBCQ001NDYxNlMgUEhZIGNhbm5vdCB3b3Jr
IHByb3Blcmx5IGluIFJHTUlJLT4xMDAwQmFzZS1LWCBtb2RlIChmb3INCj4+PiBleGFtcGxlLCBv
biBGYWNlYm9vayBDTU0gQk1DIHBsYXRmb3JtKSwgbWFpbmx5IGJlY2F1c2UgZ2VucGh5IGZ1bmN0
aW9ucw0KPj4+IGFyZSBkZXNpZ25lZCBmb3IgY29wcGVyIGxpbmtzLCBhbmQgMTAwMEJhc2UtWCAo
Y2xhdXNlIDM3KSBhdXRvIG5lZ290aWF0aW9uDQo+Pj4gbmVlZHMgdG8gYmUgaGFuZGxlZCBkaWZm
ZXJlbnRseS4NCj4+Pg0KPj4+IFRoaXMgcGF0Y2ggZW5hYmxlcyAxMDAwQmFzZS1YIHN1cHBvcnQg
Zm9yIEJDTTU0NjE2UyBieSBjdXN0b21pemluZyAzDQo+Pj4gZHJpdmVyIGNhbGxiYWNrczoNCj4+
Pg0KPj4+ICAgLSBwcm9iZTogcHJvYmUgY2FsbGJhY2sgZGV0ZWN0cyBQSFkncyBvcGVyYXRpb24g
bW9kZSBiYXNlZCBvbg0KPj4+ICAgICBJTlRFUkZfU0VMWzE6MF0gcGlucyBhbmQgMTAwMFgvMTAw
Rlggc2VsZWN0aW9uIGJpdCBpbiBTZXJERVMgMTAwLUZYDQo+Pj4gICAgIENvbnRyb2wgcmVnaXN0
ZXIuDQo+Pj4NCj4+PiAgIC0gY29uZmlnX2FuZWc6IGNhbGxzIGdlbnBoeV9jMzdfY29uZmlnX2Fu
ZWcgd2hlbiB0aGUgUEhZIGlzIHJ1bm5pbmcgaW4NCj4+PiAgICAgMTAwMEJhc2UtWCBtb2RlOyBv
dGhlcndpc2UsIGdlbnBoeV9jb25maWdfYW5lZyB3aWxsIGJlIGNhbGxlZC4NCj4+Pg0KPj4+ICAg
LSByZWFkX3N0YXR1czogY2FsbHMgZ2VucGh5X2MzN19yZWFkX3N0YXR1cyB3aGVuIHRoZSBQSFkg
aXMgcnVubmluZyBpbg0KPj4+ICAgICAxMDAwQmFzZS1YIG1vZGU7IG90aGVyd2lzZSwgZ2VucGh5
X3JlYWRfc3RhdHVzIHdpbGwgYmUgY2FsbGVkLg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogVGFv
IFJlbiA8dGFvcmVuQGZiLmNvbT4NCj4+PiAtLS0NCj4+PiAgQ2hhbmdlcyBpbiB2NjoNCj4+PiAg
IC0gbm90aGluZyBjaGFuZ2VkLg0KPj4+ICBDaGFuZ2VzIGluIHY1Og0KPj4+ICAgLSBpbmNsdWRl
IEhlaW5lcidzIHBhdGNoICJuZXQ6IHBoeTogYWRkIHN1cHBvcnQgZm9yIGNsYXVzZSAzNw0KPj4+
ICAgICBhdXRvLW5lZ290aWF0aW9uIiBpbnRvIHRoZSBzZXJpZXMuDQo+Pj4gICAtIHVzZSBnZW5w
aHlfYzM3X2NvbmZpZ19hbmVnIGFuZCBnZW5waHlfYzM3X3JlYWRfc3RhdHVzIGluIEJDTTU0NjE2
Uw0KPj4+ICAgICBQSFkgZHJpdmVyJ3MgY2FsbGJhY2sgd2hlbiB0aGUgUEhZIGlzIHJ1bm5pbmcg
aW4gMTAwMEJhc2UtWCBtb2RlLg0KPj4+ICBDaGFuZ2VzIGluIHY0Og0KPj4+ICAgLSBhZGQgYmNt
NTQ2MTZzX2NvbmZpZ19hbmVnXzEwMDBieCgpIHRvIGRlYWwgd2l0aCBhdXRvIG5lZ290aWF0aW9u
IGluDQo+Pj4gICAgIDEwMDBCYXNlLVggbW9kZS4NCj4+PiAgQ2hhbmdlcyBpbiB2MzoNCj4+PiAg
IC0gcmVuYW1lIGJjbTU0ODJfcmVhZF9zdGF0dXMgdG8gYmNtNTR4eF9yZWFkX3N0YXR1cyBzbyB0
aGUgY2FsbGJhY2sgY2FuDQo+Pj4gICAgIGJlIHNoYXJlZCBieSBCQ001NDgyIGFuZCBCQ001NDYx
NlMuDQo+Pj4gIENoYW5nZXMgaW4gdjI6DQo+Pj4gICAtIEF1dG8tZGV0ZWN0IFBIWSBvcGVyYXRp
b24gbW9kZSBpbnN0ZWFkIG9mIHBhc3NpbmcgRFQgbm9kZS4NCj4+PiAgIC0gbW92ZSBQSFkgbW9k
ZSBhdXRvLWRldGVjdCBsb2dpYyBmcm9tIGNvbmZpZ19pbml0IHRvIHByb2JlIGNhbGxiYWNrLg0K
Pj4+ICAgLSBvbmx5IHNldCBzcGVlZCAobm90IGluY2x1ZGluZyBkdXBsZXgpIGluIHJlYWRfc3Rh
dHVzIGNhbGxiYWNrLg0KPj4+ICAgLSB1cGRhdGUgcGF0Y2ggZGVzY3JpcHRpb24gd2l0aCBtb3Jl
IGJhY2tncm91bmQgdG8gYXZvaWQgY29uZnVzaW9uLg0KPj4+ICAgLSBwYXRjaCAjMSBpbiB0aGUg
c2VyaWVzICgibmV0OiBwaHk6IGJyb2FkY29tOiBzZXQgZmVhdHVyZXMgZXhwbGljaXRseQ0KPj4+
ICAgICBmb3IgQkNNNTQ2MTYiKSBpcyBkcm9wcGVkOiB0aGUgZml4IHNob3VsZCBnbyB0byBnZXRf
ZmVhdHVyZXMgY2FsbGJhY2sNCj4+PiAgICAgd2hpY2ggbWF5IHBvdGVudGlhbGx5IGRlcGVuZCBv
biB0aGlzIHBhdGNoLg0KPj4+DQo+Pj4gIGRyaXZlcnMvbmV0L3BoeS9icm9hZGNvbS5jIHwgNTQg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0NCj4+PiAgaW5jbHVkZS9saW51
eC9icmNtcGh5LmggICAgfCAxMCArKysrKy0tDQo+Pj4gIDIgZmlsZXMgY2hhbmdlZCwgNTggaW5z
ZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L25ldC9waHkvYnJvYWRjb20uYyBiL2RyaXZlcnMvbmV0L3BoeS9icm9hZGNvbS5jDQo+Pj4gaW5k
ZXggOTM3ZDAwNTllOGFjLi5mYmQ3NmEzMWMxNDIgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9u
ZXQvcGh5L2Jyb2FkY29tLmMNCj4+PiArKysgYi9kcml2ZXJzL25ldC9waHkvYnJvYWRjb20uYw0K
Pj4+IEBAIC0zODMsOSArMzgzLDkgQEAgc3RhdGljIGludCBiY201NDgyX2NvbmZpZ19pbml0KHN0
cnVjdCBwaHlfZGV2aWNlICpwaHlkZXYpDQo+Pj4gIAkJLyoNCj4+PiAgCQkgKiBTZWxlY3QgMTAw
MEJBU0UtWCByZWdpc3RlciBzZXQgKHByaW1hcnkgU2VyRGVzKQ0KPj4+ICAJCSAqLw0KPj4+IC0J
CXJlZyA9IGJjbV9waHlfcmVhZF9zaGFkb3cocGh5ZGV2LCBCQ001NDgyX1NIRF9NT0RFKTsNCj4+
PiAtCQliY21fcGh5X3dyaXRlX3NoYWRvdyhwaHlkZXYsIEJDTTU0ODJfU0hEX01PREUsDQo+Pj4g
LQkJCQkgICAgIHJlZyB8IEJDTTU0ODJfU0hEX01PREVfMTAwMEJYKTsNCj4+PiArCQlyZWcgPSBi
Y21fcGh5X3JlYWRfc2hhZG93KHBoeWRldiwgQkNNNTRYWF9TSERfTU9ERSk7DQo+Pj4gKwkJYmNt
X3BoeV93cml0ZV9zaGFkb3cocGh5ZGV2LCBCQ001NFhYX1NIRF9NT0RFLA0KPj4+ICsJCQkJICAg
ICByZWcgfCBCQ001NFhYX1NIRF9NT0RFXzEwMDBCWCk7DQo+Pj4gIA0KPj4+ICAJCS8qDQo+Pj4g
IAkJICogTEVEMT1BQ1RJVklUWUxFRCwgTEVEMz1MSU5LU1BEWzJdDQo+Pj4gQEAgLTQ1MSwxMiAr
NDUxLDQ0IEBAIHN0YXRpYyBpbnQgYmNtNTQ4MV9jb25maWdfYW5lZyhzdHJ1Y3QgcGh5X2Rldmlj
ZSAqcGh5ZGV2KQ0KPj4+ICAJcmV0dXJuIHJldDsNCj4+PiAgfQ0KPj4+ICANCj4+PiArc3RhdGlj
IGludCBiY201NDYxNnNfcHJvYmUoc3RydWN0IHBoeV9kZXZpY2UgKnBoeWRldikNCj4+PiArew0K
Pj4+ICsJaW50IHZhbCwgaW50Zl9zZWw7DQo+Pj4gKw0KPj4+ICsJdmFsID0gYmNtX3BoeV9yZWFk
X3NoYWRvdyhwaHlkZXYsIEJDTTU0WFhfU0hEX01PREUpOw0KPj4+ICsJaWYgKHZhbCA8IDApDQo+
Pj4gKwkJcmV0dXJuIHZhbDsNCj4+PiArDQo+Pj4gKwkvKiBUaGUgUEhZIGlzIHN0cmFwcGVkIGlu
IFJHTUlJIHRvIGZpYmVyIG1vZGUgd2hlbiBJTlRFUkZfU0VMWzE6MF0NCj4+PiArCSAqIGlzIDAx
Yi4NCj4+PiArCSAqLw0KPj4+ICsJaW50Zl9zZWwgPSAodmFsICYgQkNNNTRYWF9TSERfSU5URl9T
RUxfTUFTSykgPj4gMTsNCj4+PiArCWlmIChpbnRmX3NlbCA9PSAxKSB7DQo+Pj4gKwkJdmFsID0g
YmNtX3BoeV9yZWFkX3NoYWRvdyhwaHlkZXYsIEJDTTU0NjE2U19TSERfMTAwRlhfQ1RSTCk7DQo+
Pj4gKwkJaWYgKHZhbCA8IDApDQo+Pj4gKwkJCXJldHVybiB2YWw7DQo+Pj4gKw0KPj4+ICsJCS8q
IEJpdCAwIG9mIHRoZSBTZXJEZXMgMTAwLUZYIENvbnRyb2wgcmVnaXN0ZXIsIHdoZW4gc2V0DQo+
Pj4gKwkJICogdG8gMSwgc2V0cyB0aGUgTUlJL1JHTUlJIC0+IDEwMEJBU0UtRlggY29uZmlndXJh
dGlvbi4NCj4+PiArCQkgKiBXaGVuIHRoaXMgYml0IGlzIHNldCB0byAwLCBpdCBzZXRzIHRoZSBH
TUlJL1JHTUlJIC0+DQo+Pj4gKwkJICogMTAwMEJBU0UtWCBjb25maWd1cmF0aW9uLg0KPj4+ICsJ
CSAqLw0KPj4+ICsJCWlmICghKHZhbCAmIEJDTTU0NjE2U18xMDBGWF9NT0RFKSkNCj4+PiArCQkJ
cGh5ZGV2LT5kZXZfZmxhZ3MgfD0gUEhZX0JDTV9GTEFHU19NT0RFXzEwMDBCWDsNCj4+PiArCX0N
Cj4+PiArDQo+Pj4gKwlyZXR1cm4gMDsNCj4+PiArfQ0KPj4+ICsNCj4+PiAgc3RhdGljIGludCBi
Y201NDYxNnNfY29uZmlnX2FuZWcoc3RydWN0IHBoeV9kZXZpY2UgKnBoeWRldikNCj4+PiAgew0K
Pj4+ICAJaW50IHJldDsNCj4+PiAgDQo+Pj4gIAkvKiBBbmVnIGZpcnNseS4gKi8NCj4+PiAtCXJl
dCA9IGdlbnBoeV9jb25maWdfYW5lZyhwaHlkZXYpOw0KPj4+ICsJaWYgKHBoeWRldi0+ZGV2X2Zs
YWdzICYgUEhZX0JDTV9GTEFHU19NT0RFXzEwMDBCWCkNCj4+PiArCQlyZXQgPSBnZW5waHlfYzM3
X2NvbmZpZ19hbmVnKHBoeWRldik7DQo+Pj4gKwllbHNlDQo+Pj4gKwkJcmV0ID0gZ2VucGh5X2Nv
bmZpZ19hbmVnKHBoeWRldik7DQo+Pj4gIA0KPj4NCj4+IEknbSBqdXN0IHdvbmRlcmluZyB3aGV0
aGVyIGl0IG5lZWRzIHRvIGJlIGNvbnNpZGVyZWQgdGhhdCAxMDBiYXNlLUZYDQo+PiBkb2Vzbid0
IHN1cHBvcnQgYXV0by1uZWdvdGlhdGlvbi4gSSBzdXBwb3NlIEJNU1IgcmVwb3J0cyBhbmVnIGFz
DQo+PiBzdXBwb3J0ZWQsIHRoZXJlZm9yZSBwaHlsaWIgd2lsbCB1c2UgYW5lZyBwZXIgZGVmYXVs
dC4NCj4+IE5vdCBzdXJlIHdobyBjb3VsZCBzZXQgMTAwQmFzZS1GWCBtb2RlIHdoZW4sIGJ1dCBt
YXliZSBhdCB0aGF0IHBsYWNlDQo+PiBhbHNvIHBoeWRldi0+YXV0b25lZyBuZWVkcyB0byBiZSBj
bGVhcmVkLiBEaWQgeW91IHRlc3QgMTAwQmFzZS1GWCBtb2RlPw0KPiANCj4gSSdtIGRvdWJ0aW5n
IGlmIDEwMEJhc2UtRlggd29ya3MuIEJlc2lkZXMgYXV0by1uZWdvdGlhdGlvbiwgMTAwQmFzZS1G
WCBDb250cm9sL1N0YXR1cyByZWdpc3RlcnMgYXJlIGRlZmluZWQgaW4gc2hhZG93IHJlZ2lzdGVy
IGluc3RlYWQgb2YgTUlJX0JNQ1IgYW5kIE1JSV9CTVNSLg0KPiANCj4gVW5mb3J0dW5hdGVseSBJ
IGRvbid0IGhhdmUgZW52aXJvbm1lbnQgdG8gdGVzdCAxMDBCYXNlLUZYIGFuZCB0aGF0J3Mgd2h5
IEkgb25seSBtYWtlIGNoYW5nZXMgd2hlbiB0aGUgUEhZIGlzIHdvcmtpbmcgaW4gMTAwMFggbW9k
ZS4NCg0KSSBjYW4gcHJlcGFyZSBhIHBhdGNoIGZvciAxMDBCYXNlLUZYIGJhc2VkIG9uIG15IHVu
ZGVyc3RhbmRpbmcgb2YgYmNtNTQ2MTZzIGRhdGFzaGVldCwgYnV0IHRoZSBwYXRjaCB3b3VsZCBi
ZSBqdXN0IGNvbXBpbGUtdGVzdGVkIDopDQoNCg0KVGhhbmtzLA0KDQpUYW8NCg==
