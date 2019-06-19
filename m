Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 374B94C3BA
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 00:34:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TfrM1xllzDqRF
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 08:34:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=107391e0c1=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="gFiu/ghP"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="MMSr3wji"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TfqK2VgszDqMV;
 Thu, 20 Jun 2019 08:33:15 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.27/8.16.0.27) with SMTP id x5JMQYfq010356;
 Wed, 19 Jun 2019 15:32:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=5JRfY6IAs61MAa/z2JPZ2R7kQHhNH3FbQBo5vBJHFXo=;
 b=gFiu/ghPun3dca0kecrT2yE0UrGZW+7WF6RwmA7QAD0Lh4gTAzApYwC1VWDvg467Pql4
 FdvQ9H871rdSPKNkGL97zWmRUqTUoPGpCPgPo4E9/fIMRrjtjnPNdN+eZFz8vkQocf7j
 FDaUoEVEfK8ZApnL/zSvj2Jzf+0+TKXttbw= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0089730.ppops.net with ESMTP id 2t7s8xh25y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 19 Jun 2019 15:32:45 -0700
Received: from ash-exhub102.TheFacebook.com (2620:10d:c0a8:82::f) by
 ash-exhub102.TheFacebook.com (2620:10d:c0a8:82::f) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 19 Jun 2019 15:32:43 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.172) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 19 Jun 2019 15:32:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5JRfY6IAs61MAa/z2JPZ2R7kQHhNH3FbQBo5vBJHFXo=;
 b=MMSr3wjiJqzyOP+0XrZQ1q9sGmCSAqGYnzLfrvEVHUFWtseSPdjaOXCyU1h35s2r3I35o0fIfmJCW0TpghmzGay/0CoBcmh807eHrqebKy7pNX38gr4OlDSvPnUu2MGbB5ECtWI/dNTivlTqGQFFgcA1rD3Sdlyq4Ufb/TtEh0Y=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1454.namprd15.prod.outlook.com (10.173.235.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.10; Wed, 19 Jun 2019 22:32:42 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::d51f:8f19:e2b5:3ae8]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::d51f:8f19:e2b5:3ae8%6]) with mapi id 15.20.1987.014; Wed, 19 Jun 2019
 22:32:42 +0000
From: Tao Ren <taoren@fb.com>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH 1/2] i2c: aspeed: allow to customize base clock divisor
Thread-Topic: [PATCH 1/2] i2c: aspeed: allow to customize base clock divisor
Thread-Index: AQHVJuIcteG+E70PmUey9PLXreYJ5KajfUSAgAASwwA=
Date: Wed, 19 Jun 2019 22:32:42 +0000
Message-ID: <18565fcf-3dc1-b671-f826-e4417e4ad284@fb.com>
References: <20190619205009.4176588-1-taoren@fb.com>
 <CAFd5g45TMtXcuqONdkpN_K+c0O+wUw8wkGzcQfV+sO8p5Krc9w@mail.gmail.com>
In-Reply-To: <CAFd5g45TMtXcuqONdkpN_K+c0O+wUw8wkGzcQfV+sO8p5Krc9w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR02CA0034.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::47) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::3:2141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed9c44b7-e67a-482a-b909-08d6f5060ae2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1454; 
x-ms-traffictypediagnostic: MWHPR15MB1454:
x-microsoft-antispam-prvs: <MWHPR15MB1454A9550E09D75CAD496527B2E50@MWHPR15MB1454.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(396003)(346002)(39860400002)(136003)(366004)(189003)(199004)(256004)(58126008)(5660300002)(73956011)(25786009)(316002)(54906003)(476003)(305945005)(76176011)(6916009)(81166006)(186003)(7736002)(446003)(6486002)(8936002)(68736007)(11346002)(229853002)(36756003)(81156014)(64126003)(52116002)(4326008)(6436002)(478600001)(2906002)(99286004)(14454004)(6116002)(65826007)(53546011)(6506007)(6512007)(46003)(386003)(66446008)(486006)(65956001)(6246003)(7416002)(64756008)(65806001)(66946007)(66556008)(31696002)(71190400001)(53936002)(31686004)(66476007)(71200400001)(102836004)(2616005)(8676002)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1454;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Xw4pntFvQtrt9M+1t7gOdMqqrrsTemfi39bL3c7j55gcojkwn/Bxf8X9+B9Y3QLKPpIDcEY1Zo9WUjGRXEm7apthyVOXKkqTQMgd59Q8+kIEfNkFzWyBlLpzjrzogZCHoky/EgyWrwBwhbYDCDyg4RSIBSnhk6TKAPQMUoIQLtp2l41ggP8WZHokc5+n9Tic4/INiYO238rIC8LMvct4YqO8m8BSsDLLadbotRb6ra+/4HXzYuakl0g5j/pEyUt97Km5y9H9DaX0fNPVS25hhv8xeonWfKjZMXRe1Wu29QKzhoaD2Wokvq2/a8N+ZtFtaUx5+0qzZsP4n/7FxP7AdE7d1sQYzN4qdLrkS0VZatLjTPJBp1Nq5yhhhCxjS0SxBBx6iBYIxgo6zdyJlz7tjV+sR5Gjbacf6GJske1avhU=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7A954D46C2698146AB155AC71B775D65@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ed9c44b7-e67a-482a-b909-08d6f5060ae2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 22:32:42.5317 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: taoren@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1454
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-19_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906190184
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
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gNi8xOS8xOSAyOjI1IFBNLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6DQo+IE9uIFdlZCwgSnVu
IDE5LCAyMDE5IGF0IDI6MDAgUE0gVGFvIFJlbiA8dGFvcmVuQGZiLmNvbT4gd3JvdGU6DQo+Pg0K
Pj4gU29tZSBpbnRlcm1pdHRlbnQgSTJDIHRyYW5zYWN0aW9uIGZhaWx1cmVzIGFyZSBvYnNlcnZl
ZCBvbiBGYWNlYm9vayBDTU0gYW5kDQo+PiBNaW5pcGFjayAoYXN0MjUwMCkgQk1DIHBsYXRmb3Jt
cywgYmVjYXVzZSBzbGF2ZSBkZXZpY2VzIChzdWNoIGFzIENQTEQsIEJJQw0KPj4gYW5kIGV0Yy4p
IE5BQ0sgdGhlIGFkZHJlc3MgYnl0ZSBzb21ldGltZXMuIFRoZSBpc3N1ZSBjYW4gYmUgcmVzb2x2
ZWQgYnkNCj4+IGluY3JlYXNpbmcgYmFzZSBjbG9jayBkaXZpc29yIHdoaWNoIGFmZmVjdHMgQVNQ
RUVEIEkyQyBDb250cm9sbGVyJ3MgYmFzZQ0KPj4gY2xvY2sgYW5kIG90aGVyIEFDIHRpbWluZyBw
YXJhbWV0ZXJzLg0KPj4NCj4+IFRoaXMgcGF0Y2ggYWxsb3dzIHRvIGN1c3RvbWl6ZSBBU1BFRUQg
STJDIENvbnRyb2xsZXIncyBiYXNlIGNsb2NrIGRpdmlzb3INCj4+IGluIGRldmljZSB0cmVlLg0K
PiANCj4gRmlyc3Qgb2ZmLCBhcmUgeW91IHN1cmUgeW91IGFjdHVhbGx5IG5lZWQgdGhpcz8NCj4g
DQo+IFlvdSBzaG91bGQgYmUgYWJsZSB0byBhY2hpZXZlIGFuIGVmZmVjdGl2ZWx5IGVxdWl2YWxl
bnQgcmVzdWx0IGJ5IGp1c3QNCj4gbG93ZXJpbmcgdGhlIGBidXMtZnJlcXVlbmN5YCBwcm9wZXJ0
eSBzcGVjaWZpZWQgaW4gdGhlIERULiBUaGUNCj4gYGJ1cy1mcmVxdWVuY3lgIHByb3BlcnR5IHVs
dGltYXRlbHkgZGV0ZXJtaW5lcyBhbGwgdGhlIHJlZ2lzdGVyDQo+IHZhbHVlcywgYW5kIHlvdSBz
aG91bGQgYmUgYWJsZSB0byBzZXQgaXQgdG8gd2hhdGV2ZXIgeW91IHdhbnQgYnkNCj4gcmVmZXJp
bmcgdG8gdGhlIEFzcGVlZCBkb2N1bWVudGF0aW9uLg0KPiANCj4gTmV2ZXJ0aGVsZXNzLCB0aGUg
Y29kZSB0aGF0IGRldGVybWluZXMgdGhlIGNvcnJlY3QgZGl2aWRlcnMgZnJvbSB0aGUNCj4gZnJl
cXVlbmN5IGlzIGJhc2VkIG9uIHRoZSB0YWJsZXMgaW4gdGhlIEFzcGVlZCBkb2N1bWVudGF0aW9u
LiBJIGRvbid0DQo+IHRoaW5rIHRoZSBlcXVhdGlvbiBtYWtlcyBzZW5zZSB3aGVuIHRoZSBiYXNl
X2Nsa19kaXZpc29yIGlzIGZpeGVkOyBJDQo+IG1lYW4gaXQgd2lsbCBwcm9iYWJseSBqdXN0IHNl
dCB0aGUgb3RoZXIgZGl2aXNvciB0byBtYXggb3IgbWluDQo+IGRlcGVuZGluZyBvbiB0aGUgdmFs
dWVzIGNob3Nlbi4gSSB0aGluayBpZiBzb21lb25lIHJlYWxseSB3YW50cyB0bw0KPiBwcm9ncmFt
IHRoaXMgcGFyYW1ldGVyIG1hbnVhbGx5LCB0aGV5IHByb2JhYmx5IHdhbnQgdG8gc2V0IHRoZSBv
dGhlcg0KPiBwYXJhbWV0ZXJzIG1hbnVhbGx5IHRvby4NClRoYW5rIHlvdSBmb3IgdGhlIHF1aWNr
IHJlc3BvbnNlLCBCcmVuZGFuLg0KDQpBc3BlZWQgSTJDIGJ1cyBmcmVxdWVuY3kgaXMgZGVmaW5l
ZCBieSAzIHBhcmFtZXRlcnMgKGJhc2VfY2xrX2Rpdmlzb3IsIGNsa19oaWdoX3dpZHRoLCBjbGtf
bG93X3dpZHRoKSwgYW5kIEkgY2hvb3NlIGJhc2VfY2xrX2Rpdmlzb3IgYmVjYXVzZSBpdCBjb250
cm9scyBhbGwgdGhlIEFzcGVlZCBJMkMgdGltaW5ncyAoc3VjaCBhcyBzZXR1cCB0aW1lIGFuZCBo
b2xkIHRpbWUpLiBPbmNlIGJhc2VfY2xrX2Rpdmlzb3IgaXMgZGVjaWRlZCAoZWl0aGVyIGJ5IHRo
ZSBjdXJyZW50IGxvZ2ljIGluIGkyYy1hc3BlZWQgZHJpdmVyIG9yIG1hbnVhbGx5IHNldCBpbiBk
ZXZpY2UgdHJlZSksIGNsa19oaWdoX3dpZHRoIGFuZCBjbGtfbG93X3dpZHRoIHdpbGwgYmUgY2Fs
Y3VsYXRlZCBieSBpMmMtYXNwZWVkIGRyaXZlciB0byBtZWV0IHRoZSBzcGVjaWZpZWQgSTJDIGJ1
cyBzcGVlZC4NCg0KRm9yIGV4YW1wbGUsIGJ5IHNldHRpbmcgSTJDIGJ1cyBmcmVxdWVuY3kgdG8g
MTAwS0h6IG9uIEFTVDI1MDAgcGxhdGZvcm0sIChiYXNlX2Nsb2NrX2Rpdmlzb3IsIGNsa19oaWdo
X3dpZHRoLCBjbGtfbG93X3dpZHRoKSBpcyBzZXQgdG8gKDMsIDE1LCAxNCkgYnkgb3VyIGRyaXZl
ci4gQnV0IHNvbWUgc2xhdmUgZGV2aWNlcyAob24gQ01NIGkyYy04IGFuZCBNaW5pcGFjayBpMmMt
MCkgTkFDSyBieXRlIHRyYW5zYWN0aW9ucyB3aXRoIHRoZSBkZWZhdWx0IHRpbWluZyBzZXR0aW5n
OiB0aGUgaXNzdWUgY2FuIGJlIHJlc29sdmVkIGJ5IHNldHRpbmcgYmFzZV9jbGtfZGl2aXNvciB0
byA0LCBhbmQgKGNsa19oaWdoX3dpZHRoLCBjbGtfbG93X3dpZHRoKSB3aWxsIGJlIHNldCB0byAo
NywgNykgYnkgb3VyIGkyYy1hc3BlZWQgZHJpdmVyIHRvIGFjaGlldmUgc2ltaWxhciBJMkMgYnVz
IHNwZWVkLg0KDQpOb3Qgc3VyZSBpZiBteSBhbnN3ZXIgaGVscHMgdG8gYWRkcmVzcyB5b3VyIGNv
bmNlcm5zLCBidXQga2luZGx5IGxldCBtZSBrbm93IGlmIHlvdSBoYXZlIGZ1cnRoZXIgcXVlc3Rp
b25zL3N1Z2dlc3Rpb25zLg0KDQoNClRoYW5rcywNCg0KVGFvDQo=
