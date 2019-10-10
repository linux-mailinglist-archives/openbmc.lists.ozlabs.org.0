Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E812D3432
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2019 01:12:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46q6Lw5KtTzDqRf
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2019 10:12:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=5186784b43=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="kRD/cZs1"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="LRk0+NrP"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46q6L636szzDqLV;
 Fri, 11 Oct 2019 10:12:12 +1100 (AEDT)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id x9AN9Pei010474;
 Thu, 10 Oct 2019 16:11:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=swbnN9wD8tMb58nZiK9T71Ps+tnemBhWgashToDG4Ek=;
 b=kRD/cZs1f4P7/LW1zq9vkWs0NQDlq5QNFNQUlSwi/dadCNY1zeMgL9HRLAQaiRE1edxk
 t1wVkHv4Rjf8qj4SAOZl0EXXDl7M5BBKF5Ucg2TONoVrArjXzUgSXt28+pLW15s/tEil
 kLHjbUqkcW8Q1gG7l8BROXpRJ3mn1DwZW6o= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0089730.ppops.net with ESMTP id 2vhgwp7xrh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 10 Oct 2019 16:11:39 -0700
Received: from ash-exhub101.TheFacebook.com (2620:10d:c0a8:82::e) by
 ash-exhub201.TheFacebook.com (2620:10d:c0a8:83::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 10 Oct 2019 16:11:38 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.173) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 10 Oct 2019 16:11:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cYQ4CPf+u74j4B3mWTC9cWv9v87JcRnmSS46t/wEgzrHaBIrLgbZI4qEPjbRgn/xXu07rl9Rqwrl7XAO39IiIt8yHDzw5hH003Rirjhq3sR5ag3iUY4QtziD2e/q6bmbT6bFqyOLAsktwqiFVNJDIhN1Kp97VQW5aWRRoaCIR7WppuS2BVitFKfSk74m4F5xXHkPkYUANquqM4sgZa3TPUFeEFOfr1qRy84MlmgcdYIgyDyM3dIKCSjiYsWnIOrBUHPhed53dClbQYul5df331g5aIOhdDtRZxzAcMlliB+Z3jJ/EuSPMbbZGyHnhDhAoEAqtlmBLlYHjz5aV/f8Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swbnN9wD8tMb58nZiK9T71Ps+tnemBhWgashToDG4Ek=;
 b=f5lQAjlNbArQgR+vmNdNCwTiOb7oEw1a7gkPgkYqSdjsfRUZkwRYMTj7KRn2X3olpXB2UQcZXyrtwKrNj4wFRC9MXpWVDPsHAf0vekfEiAORw1Xrwp+ogyRJ6EbRlE4DluNWHGtw3SL2+M6Eu+HBSaiFrGFA+EoPoltl/cAg5hsofBy/WvqJsd0d+rhcrl0+qufdus0DBcpGDhsh+gIlZZ5OBtoOTQ3MwsFFtVPN1QeMg1ulVaGQ9TZYObvRm350b115yqLzoBTo7/xnPZ7E3JuX3q+jFrGo1ms2bV5moA1ShXRYaXezGs/uaQiYvcWqH1wSw2Q6aZJasB+uopr4og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swbnN9wD8tMb58nZiK9T71Ps+tnemBhWgashToDG4Ek=;
 b=LRk0+NrPqP2FG1CwN8nVXYNVcZpvlKZno2FeTxlqVTN4fMYM7ueU3Tn3vxpjQug8xdaBtxsvgPISTaliVJjLiukyN4LwdWTys+RjWj+ENSOY8iHZttxcRI2WXFS+hZ/KLMXSe/p9vffSCRku4WvnoBaBnYQFVcsnI7J5hV9J1dE=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1246.namprd15.prod.outlook.com (10.175.3.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Thu, 10 Oct 2019 23:11:37 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::24c9:a1ce:eeeb:9246]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::24c9:a1ce:eeeb:9246%10]) with mapi id 15.20.2347.016; Thu, 10 Oct
 2019 23:11:37 +0000
From: Tao Ren <taoren@fb.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Brendan Higgins
 <brendanhiggins@google.com>, Wolfram Sang <wsa@the-dreams.de>, "Benjamin
 Herrenschmidt" <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, "Rob Herring" <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "Andrew Jeffery" <andrew@aj.id.au>, Cedric Le Goater <clg@kaod.org>
Subject: Re: [PATCH] i2c: aspeed: fix master pending state handling
Thread-Topic: [PATCH] i2c: aspeed: fix master pending state handling
Thread-Index: AQHVfud35WuTlVbA0UqacW6NAtrttKdT7goAgACBZACAABLhAA==
Date: Thu, 10 Oct 2019 23:11:36 +0000
Message-ID: <5ce20a28-21ed-ff0c-9e31-bcac3cd7a5fb@fb.com>
References: <20191009212034.20325-1-jae.hyun.yoo@linux.intel.com>
 <3ea1c0d5-47f1-bf8c-6b2d-2ea8d3f93471@fb.com>
 <637d4b8b-5113-b07b-f99f-ce66dbe6948c@linux.intel.com>
In-Reply-To: <637d4b8b-5113-b07b-f99f-ce66dbe6948c@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MW2PR16CA0042.namprd16.prod.outlook.com
 (2603:10b6:907:1::19) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::1:a83d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f81f01a6-7d5a-496e-aa91-08d74dd73324
x-ms-traffictypediagnostic: MWHPR15MB1246:
x-microsoft-antispam-prvs: <MWHPR15MB1246F45C5E3A881011FD2061B2940@MWHPR15MB1246.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 018632C080
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(136003)(346002)(39860400002)(376002)(189003)(199004)(51914003)(7736002)(14454004)(71190400001)(6116002)(7416002)(6512007)(4326008)(305945005)(478600001)(256004)(71200400001)(8936002)(8676002)(54906003)(316002)(58126008)(2906002)(110136005)(81156014)(14444005)(81166006)(76176011)(53546011)(386003)(6506007)(186003)(102836004)(6486002)(86362001)(52116002)(2616005)(476003)(486006)(99286004)(65956001)(46003)(25786009)(6436002)(31686004)(66446008)(66946007)(64756008)(66476007)(66556008)(229853002)(5660300002)(31696002)(36756003)(6246003)(11346002)(446003)(65806001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1246;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: suGRuFDYT7CJAyEDWfY3sgKScw77hfI5/6XaiMV9JBuguXE3NtSsi9hOOVaPiM3BKp4NtEUh1NwuZvoOAwPNnfmShN0HsZaJMlwlLrZa/EYSbsGbJo28WMoqXH5CGxbgKv0Re8pRPsBEQkx1B1VJNEkYBXlJw7Uc9U3KtxTGl1t070r13pNbOWi2ujHP1R/GB3PU52zHtu4Svu5daLkNuLfTyH8LUdF0ZJTmuSPtowJZeDcWOu7fJeTeobF6WOh8a/zR5HXcsbsM2iGzso+VJ1teNGd1nBQ29sZVUqUL3sbw6MCSNMfU13naUxZRzUg24hdwve9y3q4vPv15n9U3fX0hHjmSn5P6y09iy9jCTS8l7iayyeLpMg92G5+oXyaulaQOGv1ZulLyeU3kKx8qqAStsf2svOACdabHyKiAYyc=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C338BE9931280B43BAD1D95B370EAE61@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f81f01a6-7d5a-496e-aa91-08d74dd73324
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2019 23:11:37.0121 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +oIDx2liCPw9sfl8S6KWGN8FBEqqgDdsI4xuhH5IHsmIwNRALq9XLVSAFqSYtMG/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1246
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-10_09:2019-10-10,2019-10-10 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 suspectscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1908290000 definitions=main-1910100201
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

T24gMTAvMTAvMTkgMzowNCBQTSwgSmFlIEh5dW4gWW9vIHdyb3RlOg0KPiBPbiAxMC8xMC8yMDE5
IDI6MjAgUE0sIFRhbyBSZW4gd3JvdGU6DQo+PiBPbiAxMC85LzE5IDI6MjAgUE0sIEphZSBIeXVu
IFlvbyB3cm90ZToNCj4gWy4uLl0NCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgLyoNCj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAqIElmIGEgcGVlciBtYXN0ZXIgc3RhcnRzIGEgeGZlciBpbW1lZGlh
dGVseSBhZnRlciBpdCBxdWV1ZXMgYQ0KPj4+IC3CoMKgwqDCoMKgwqDCoMKgICogbWFzdGVyIGNv
bW1hbmQsIGNoYW5nZSBpdHMgc3RhdGUgdG8gJ3BlbmRpbmcnIHRoZW4gSC9XIHdpbGwNCj4+PiAt
wqDCoMKgwqDCoMKgwqDCoCAqIGNvbnRpbnVlIHRoZSBxdWV1ZWQgbWFzdGVyIHhmZXIganVzdCBh
ZnRlciBjb21wbGV0aW5nIHRoZQ0KPj4+IC3CoMKgwqDCoMKgwqDCoMKgICogc2xhdmUgbW9kZSBz
ZXNzaW9uLg0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgICogbWFzdGVyIGNvbW1hbmQsIGNsZWFyIHRo
ZSBxdWV1ZWQgbWFzdGVyIGNvbW1hbmQgYW5kIGNoYW5nZQ0KPj4+ICvCoMKgwqDCoMKgwqDCoMKg
ICogaXRzIHN0YXRlIHRvICdwZW5kaW5nJy4gVG8gc2ltcGxpZnkgaGFuZGxpbmcgb2YgcGVuZGlu
Zw0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgICogY2FzZXMsIGl0IHVzZXMgUy9XIHNvbHV0aW9uIGlu
c3RlYWQgb2YgSC9XIGNvbW1hbmQgcXVldWUNCj4+PiArwqDCoMKgwqDCoMKgwqDCoCAqIGhhbmRs
aW5nLg0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgICovDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
IGlmICh1bmxpa2VseShpcnFfc3RhdHVzICYgQVNQRUVEX0kyQ0RfSU5UUl9TTEFWRV9NQVRDSCkp
IHsNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB3cml0ZWwocmVhZGwoYnVzLT5iYXNlICsg
QVNQRUVEX0kyQ19DTURfUkVHKSAmDQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB+QVNQRUVEX0kyQ0RfTUFTVEVSX0NNRFNfTUFTSywNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGJ1cy0+YmFzZSArIEFTUEVFRF9JMkNfQ01EX1JFRyk7DQo+Pg0K
Pj4gU29ycnkgZm9yIHRoZSBsYXRlIGNvbW1lbnRzIChqdXN0IG5vdGljZWQgdGhpcyBsaW5lIHdo
aWxlIHRlc3RpbmcgdGhlIHBhdGNoKToNCj4+DQo+PiBJIGFzc3VtZSB0aGlzIGxpbmUgaXMgYWlt
ZWQgYXQgc3RvcHBpbmcgdGhlIHJ1bm5pbmcgbWFzdGVyIGNvbW1hbmRzLCBidXQgYXMgcGVyDQo+
PiBBU1QyNTAwIGRhdGFzaGVldCwgaXQncyBOT1AgdG8gd3JpdGUgMCB0byBNQVNURVJfU1RPUC9N
QVNURVJfUlgvTUFTVEVSX1RYIGJpdHMuDQo+PiBNYXliZSBhbGwgd2UgbmVlZCBpcyB3cml0aW5n
IDEgdG8gTUFTVEVSX1NUT1AgZmllbGQ/DQo+IA0KPiBUaGVyZSBjb3VsZCBiZSB0d28gcGVuZGlu
ZyBjYXNlczoNCj4gMS4gTWFzdGVyIGdvZXMgdG8gcGVuZGluZyBiZWZvcmUgaXQgdHJpZ2dlcnMg
YSBjb21tYW5kIGlmIGEgc2xhdmUNCj4gwqDCoCBvcGVyYXRpb24gaXMgYWxyZWFkeSBpbml0aWF0
ZWQuDQo+IDIuIE1hc3RlciBnb2VzIHRvIHBlbmRpbmcgYWZ0ZXIgaXQgdHJpZ2dlcmVkIGEgY29t
bWFuZCBpZiBhIHBlZXINCj4gwqDCoCBtYXN0ZXIgaW1tZWRpYXRlbHkgc2VuZHMgc29tZXRoaW5n
IGp1c3QgYWZ0ZXIgdGhlIG1hc3RlciBjb21tYW5kDQo+IMKgwqAgdHJpZ2dlcmluZy4NCj4gDQo+
IEFib3ZlIGNvZGUgaXMgZm9yIHRoZSBsYXR0ZXIgY2FzZS4gSC9XIGhhbmRsZXMgdGhlIGNhc2Ug
cHJpb3JpdHkgYmFzZWQNCj4gc28gdGhlIHNsYXZlIGV2ZW50IHdpbGwgYmUgaGFuZGxlZCBmaXJz
dCwgYW5kIHRoZW4gdGhlIG1hc3RlciBjb21tYW5kDQo+IHdpbGwgYmUgaGFuZGxlZCB3aGVuIHRo
ZSBzbGF2ZSBvcGVyYXRpb24gaXMgY29tcGxldGVkLiBQcm9ibGVtIGlzLA0KPiB0aGlzIEgvVyBz
aGFyZXMgdGhlIHNhbWUgYnVmZmVyIGZvciBtYXN0ZXIgYW5kIHNsYXZlIG9wZXJhdGlvbnMgc28N
Cj4gaXQncyB1bnJlbGlhYmxlLiBBYm92ZSBjb2RlIGp1c3QgcmVtb3ZlcyB0aGUgbWFzdGVyIGNv
bW1hbmQgZnJvbSB0aGUNCj4gY29tbWFuZCByZWdpc3RlciB0byBwcmV2ZW50IHRoaXMgSC9XIGNv
bW1hbmQgaGFuZGxpbmcgb2YgcGVuZGluZyBldmVudHMuDQo+IEluc3RlYWQsIGl0IHJlc3RhcnRz
IHRoZSBtYXN0ZXIgY29tbWFuZCB1c2luZyBhIGNhbGwgb2YgYXNwZWVkX2kyY19kb19zdGFydCB3
aGVuIHRoZSBzbGF2ZSBvcGVyYXRpb24gaXMgY29tcGxldGVkLg0KDQpUaGFua3MgZm9yIHRoZSBj
bGFyaWZ5LCBKYWUuIEkgbWVhbiBjbGVhcmluZyB0aGVzZSBiaXRzIGhhcyBubyBlZmZlY3QgdG8N
CmhhcmR3YXJlIGFjY29yZGluZyB0byBhc3BlZWQgZGF0YXNoZWV0OyBpbiBvdGhlciB3b3JkLCBt
YXN0ZXIgY29tbWFuZCBjYW5ub3QNCmJlIHJlbW92ZWQgZnJvbSBjb21tYW5kIHJlZ2lzdGVyIGJ5
IHRoaXMgc3RhdGVtZW50Lg0KDQpGb3IgZXhhbXBsZSwgYmVsb3cgaXMgdGhlIGRlc2NyaXB0aW9u
IGZvciBNQVNURVJfU1RPUF9DTUQoSTJDRDE0LCBiaXQgNSk6DQoNCiAgMDogTk9QDQogIDE6IElz
c3VlIE1hc3RlciBTdG9wIENvbW1hbmQNCiAgVGhpcyByZWdpc3RlciB3aWxsIGJlIGF1dG9tYXRp
Y2FsbHkgY2xlYXJlZCBieSBIL1cgd2hlbiBTdG9wIENvbW1hbmQgaGFzDQogIGJlZW4gaXNzdWVz
Lg0KDQoNCkNoZWVycywNCg0KVGFvDQo=
