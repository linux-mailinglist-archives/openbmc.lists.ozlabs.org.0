Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B64AE015
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2019 22:57:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46S0pJ61D5zDqR1
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 06:56:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=4155b2ef1b=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="AB4mOmqr"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="av4S98mI"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46S0nm1jhLzDqD9
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 06:56:26 +1000 (AEST)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x89KqtNk013764; Mon, 9 Sep 2019 13:56:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=9gMUBIpxFT/UlXClyym8B8znDWZ4Fu9Q6TaSXvurUIA=;
 b=AB4mOmqr6cMi/EOneWnmYwkzqSsTelKaSHW+yCLn8ZWYGNUApxCPxgVgYE11vqhQw0DZ
 fw/0rE7G1kDKI7ixvQ8hoEqIv0GxjhIEg6JVcoG2JpgpbH4uHCrOJB7ELdNvBPXINOui
 g+xs4mgSQKgjn7Bo6mOz14sTS0Zhke1dEZ4= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2uwrsb9nvc-12
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 09 Sep 2019 13:56:08 -0700
Received: from prn-hub05.TheFacebook.com (2620:10d:c081:35::129) by
 prn-hub03.TheFacebook.com (2620:10d:c081:35::127) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 9 Sep 2019 13:55:42 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Mon, 9 Sep 2019 13:55:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cOoNQKZPWxNE+z8+j0DJc1rZ4KSYmIqzQ5AgAWLq9ZQXq1dR0JfxnKSgGq7OMWB+tdUXYwW8xh7GlPDDxK7baU/71OsKuRJt2z+h/R7au9wKGwqxIZXhF66YW5ebLmQgqP7C67mszAtqwPd349dfrAYIKCJm/6URj6foaJtXQopgFnrJSg8JX1HLqdBmLGSD0NKzCNDz8KpcXiomWbrQtv/eescqCBmxaFx5OU+q2TtTQaZekILNJ1V81i8JYfPI+eCgCeZtKVnIoCLjt2TMv5eeDOxyf8NemRL5IyWefCGwxDI9y/k77RVX1ZOaAgi1GynJgON7btQzs65VK8jWYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9gMUBIpxFT/UlXClyym8B8znDWZ4Fu9Q6TaSXvurUIA=;
 b=lQMTMubVTeXcZzwg6SCz903puS88kIV/qL4G4aGSqV3E6mc2mof7n14rHxK2WwQ4S31Eeo7Crup4PADpjd+oUKdnwM2AKgoxApu7ZCDJDlFJuD2IQFObhrxIwNQZlRit7DVtB2L2FKLIbTdfYeGx7QyMMO7LSMXB73a47zAjwItH1POeB1ThQIJ/HUxzUzmmKVNFlH5kTQWj3wwU8tou7bbrYIUPgV5UUxJUTvHm+xd8l7+kIx1bu3MEZU/R4z10qn183eu2WipCAnPtmGloRNiJdyXEX1rcJIIwRguqa64CXkhmHryMQrkPv3RvDkYq1/sLBVfEN5aPn5uzJQZGDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9gMUBIpxFT/UlXClyym8B8znDWZ4Fu9Q6TaSXvurUIA=;
 b=av4S98mIv4+sezdgIJi97iv8WEajoVt1LPaCXdKMri7iI4IJF0hYjqVjgm3hZoBRD6ejRmU+H5rHNAN9hwvU4yGiELvee8jS5uF6DaLSS3RKQDya1S4JQgqSVUiPZGkAcaDcUFV5pHG7wdgekGWGMOlgB5VhRp5Zl+vjJkojg6U=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1597.namprd15.prod.outlook.com (10.173.234.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Mon, 9 Sep 2019 20:55:41 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::2980:5c7f:8dde:174a]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::2980:5c7f:8dde:174a%9]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 20:55:41 +0000
From: Tao Ren <taoren@fb.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Brendan Higgins
 <brendanhiggins@google.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v2 dev-5.2 2/2] i2c: aspeed: add slave inactive timeout
 support
Thread-Topic: [PATCH v2 dev-5.2 2/2] i2c: aspeed: add slave inactive timeout
 support
Thread-Index: AQHVZO/xkD+BwhAQ60SphP0WsdYUh6cj1/+A
Date: Mon, 9 Sep 2019 20:55:40 +0000
Message-ID: <fd59cb8b-00f2-1708-f8fb-d02d32660cce@fb.com>
References: <20190906201605.14540-1-jae.hyun.yoo@linux.intel.com>
 <20190906201605.14540-3-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20190906201605.14540-3-jae.hyun.yoo@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR21CA0070.namprd21.prod.outlook.com
 (2603:10b6:300:db::32) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::2:24c9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: beaa9127-e9cd-4047-82c7-08d7356812fd
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1597; 
x-ms-traffictypediagnostic: MWHPR15MB1597:
x-microsoft-antispam-prvs: <MWHPR15MB1597EA4F408B767660E68428B2B70@MWHPR15MB1597.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:569;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(366004)(376002)(396003)(136003)(39860400002)(189003)(199004)(86362001)(8676002)(5660300002)(4326008)(14454004)(6116002)(71200400001)(71190400001)(25786009)(110136005)(8936002)(81156014)(81166006)(102836004)(58126008)(186003)(64756008)(66446008)(66556008)(66476007)(66946007)(53936002)(65806001)(65956001)(14444005)(486006)(76176011)(31686004)(99286004)(6436002)(7736002)(305945005)(476003)(256004)(6512007)(6486002)(6246003)(46003)(6506007)(53546011)(386003)(316002)(36756003)(31696002)(52116002)(478600001)(2906002)(446003)(229853002)(11346002)(2616005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1597;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qHEBDOiYlu6TwuDi47fTN8DfX+vB4ZVTyqgEv8zIaCIqC1f6WuZzGpRxEr73JC1IGP1WyNZV1LdJFkTk09885OHpuvans5Fu1GFn/jJIVFUC7snuktEJr0GOTOTR5Pysi/pRtLhrEIIX8pG9iF2WC1XypEVhbtLbJOM9aHQwVbzorNK3f9tTXg4NspiDfp+ls5n09X5EZWdLn3psKHeORO42qUnBT8S1Ut5PtfaQ/mgIbZCIvZlKsCUsZnNLAq2ueVieOcQ8irBQ1Bl880PNcAKRB6oAkna5oQRV9+PsjethJ1XWk9Xqplly7fKULxgf8gTSQFXyLxmbexiWih9jc5uYGyofTeu6w8WEwviTxxyyR0XxuDYMoAUC87gVUul0NOFHJeOrvK15p+4tTSGX2dT+Hu68upc4mgyE+WyjR/U=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD13D8301B619043988F40B6AE3BDD46@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: beaa9127-e9cd-4047-82c7-08d7356812fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 20:55:40.9418 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bURdIFAQXZC+MmeYXLJ4q6bl1g6sAN3OK8jEZDMn522sCthzeG/pNH1RJIxBV6SJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1597
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-09_07:2019-09-09,2019-09-09 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 malwarescore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1906280000 definitions=main-1909090205
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

SGkgSmFlLA0KDQpPbiA5LzYvMTkgMToxNiBQTSwgSmFlIEh5dW4gWW9vIHdyb3RlOg0KPiBJbiBj
YXNlIG9mIG11bHRpLW1hc3RlciBlbnZpcm9ubWVudCwgaWYgYSBwZWVyIG1hc3RlciBpbmNvcnJl
Y3RseSBoYW5kbGVzDQo+IGEgYnVzIGluIHRoZSBtaWRkbGUgb2YgYSB0cmFuc2FjdGlvbiwgSTJD
IGhhcmR3YXJlIGhhbmdzIGluIHNsYXZlIHN0YXRlDQo+IGFuZCBpdCBjYW4ndCBlc2NhcGUgZnJv
bSB0aGUgc2xhdmUgc3RhdGUsIHNvIHRoaXMgY29tbWl0IGFkZHMgc2xhdmUNCj4gaW5hY3RpdmUg
dGltZW91dCBzdXBwb3J0IHRvIHJlY292ZXIgdGhlIGJ1cyBpbiB0aGUgY2FzZS4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEphZSBIeXVuIFlvbyA8amFlLmh5dW4ueW9vQGxpbnV4LmludGVsLmNvbT4N
Cj4gLS0tDQo+IENoYW5nZXMgc2luY2UgdjE6DQo+ICAtIE1hZGUgaXQgdXNlIGJ1cyBhdXRvIHJl
Y292ZXJ5IGZlYXR1cmUgc28gdGhhdCBidXMgY2FuIHJlY292ZXIgaXRzZWxmDQo+ICAgIGF1dG9t
YXRpY2FsbHkuDQo+IA0KPiAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hc3BlZWQuYyB8IDgyICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDc2IGlu
c2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9p
MmMvYnVzc2VzL2kyYy1hc3BlZWQuYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXNwZWVkLmMN
Cj4gaW5kZXggODkzMTc5MjliZWU0Li40YWY4YWQ4ZjU5ZTYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvaTJjL2J1c3Nlcy9pMmMtYXNwZWVkLmMNCj4gKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2ky
Yy1hc3BlZWQuYw0KPiBAQCAtNTUsNiArNTUsNyBAQA0KPiAgLyogRGV2aWNlIFJlZ2lzdGVyIERl
ZmluaXRpb24gKi8NCj4gIC8qIDB4MDAgOiBJMkNEIEZ1bmN0aW9uIENvbnRyb2wgUmVnaXN0ZXIg
ICovDQo+ICAjZGVmaW5lIEFTUEVFRF9JMkNEX0JVRkZFUl9QQUdFX1NFTF9NQVNLCQlHRU5NQVNL
KDIyLCAyMCkNCj4gKyNkZWZpbmUgQVNQRUVEX0kyQ0RfQlVTX0FVVE9fUkVDT1ZFUllfRU4JCUJJ
VCgxNykNCj4gICNkZWZpbmUgQVNQRUVEX0kyQ0RfTVVMVElfTUFTVEVSX0RJUwkJCUJJVCgxNSkN
Cj4gICNkZWZpbmUgQVNQRUVEX0kyQ0RfU0RBX0RSSVZFXzFUX0VOCQkJQklUKDgpDQo+ICAjZGVm
aW5lIEFTUEVFRF9JMkNEX01fU0RBX0RSSVZFXzFUX0VOCQkJQklUKDcpDQo+IEBAIC03MCwxMCAr
NzEsMTQgQEANCj4gICNkZWZpbmUgQVNQRUVEX0kyQ0RfVElNRV9TQ0xfSElHSF9NQVNLCQkJR0VO
TUFTSygxOSwgMTYpDQo+ICAjZGVmaW5lIEFTUEVFRF9JMkNEX1RJTUVfU0NMX0xPV19TSElGVAkJ
CTEyDQo+ICAjZGVmaW5lIEFTUEVFRF9JMkNEX1RJTUVfU0NMX0xPV19NQVNLCQkJR0VOTUFTSygx
NSwgMTIpDQo+ICsjZGVmaW5lIEFTUEVFRF9JMkNEX1RJTUVfVElNRU9VVF9CQVNFX0RJVklTT1Jf
U0hJRlQJOA0KPiArI2RlZmluZSBBU1BFRURfSTJDRF9USU1FX1RJTUVPVVRfQkFTRV9ESVZJU09S
X01BU0sJR0VOTUFTSyg5LCA4KQ0KPiAgI2RlZmluZSBBU1BFRURfSTJDRF9USU1FX0JBU0VfRElW
SVNPUl9NQVNLCQlHRU5NQVNLKDMsIDApDQo+ICAjZGVmaW5lIEFTUEVFRF9JMkNEX1RJTUVfU0NM
X1JFR19NQVgJCQlHRU5NQVNLKDMsIDApDQo+ICsNCj4gIC8qIDB4MDggOiBJMkNEIENsb2NrIGFu
ZCBBQyBUaW1pbmcgQ29udHJvbCBSZWdpc3RlciAjMiAqLw0KPiAtI2RlZmluZSBBU1BFRURfTk9f
VElNRU9VVF9DVFJMCQkJCTANCj4gKyNkZWZpbmUgQVNQRUVEX0kyQ0RfVElNRU9VVF9DWUNMRVNf
U0hJRlQJCTANCj4gKyNkZWZpbmUgQVNQRUVEX0kyQ0RfVElNRU9VVF9DWUNMRVNfTUFTSwkJCUdF
Tk1BU0soNCwgMCkNCj4gIA0KPiAgLyogMHgwYyA6IEkyQ0QgSW50ZXJydXB0IENvbnRyb2wgUmVn
aXN0ZXIgJg0KPiAgICogMHgxMCA6IEkyQ0QgSW50ZXJydXB0IFN0YXR1cyBSZWdpc3Rlcg0KPiBA
QCAtODEsNiArODYsNyBAQA0KPiAgICogVGhlc2Ugc2hhcmUgYml0IGRlZmluaXRpb25zLCBzbyB1
c2UgdGhlIHNhbWUgdmFsdWVzIGZvciB0aGUgZW5hYmxlICYNCj4gICAqIHN0YXR1cyBiaXRzLg0K
PiAgICovDQo+ICsjZGVmaW5lIEFTUEVFRF9JMkNEX0lOVFJfU0xBVkVfSU5BQ1RJVkVfVElNRU9V
VAkJQklUKDE1KQ0KPiAgI2RlZmluZSBBU1BFRURfSTJDRF9JTlRSX1NEQV9ETF9USU1FT1VUCQkJ
QklUKDE0KQ0KPiAgI2RlZmluZSBBU1BFRURfSTJDRF9JTlRSX0JVU19SRUNPVkVSX0RPTkUJCUJJ
VCgxMykNCj4gICNkZWZpbmUgQVNQRUVEX0kyQ0RfSU5UUl9TTEFWRV9NQVRDSAkJCUJJVCg3KQ0K
PiBAQCAtOTYsOCArMTAyLDExIEBADQo+ICAJCSBBU1BFRURfSTJDRF9JTlRSX1NDTF9USU1FT1VU
IHwJCQkJICAgICAgIFwNCj4gIAkJIEFTUEVFRF9JMkNEX0lOVFJfQUJOT1JNQUwgfAkJCQkgICAg
ICAgXA0KPiAgCQkgQVNQRUVEX0kyQ0RfSU5UUl9BUkJJVF9MT1NTKQ0KPiArI2RlZmluZSBBU1BF
RURfSTJDRF9JTlRSX1NMQVZFX0VSUk9SUwkJCQkJICAgICAgIFwNCj4gKwkJQVNQRUVEX0kyQ0Rf
SU5UUl9TTEFWRV9JTkFDVElWRV9USU1FT1VUDQo+ICAjZGVmaW5lIEFTUEVFRF9JMkNEX0lOVFJf
QUxMCQkJCQkJICAgICAgIFwNCj4gLQkJKEFTUEVFRF9JMkNEX0lOVFJfU0RBX0RMX1RJTUVPVVQg
fAkJCSAgICAgICBcDQo+ICsJCShBU1BFRURfSTJDRF9JTlRSX1NMQVZFX0lOQUNUSVZFX1RJTUVP
VVQgfAkJICAgICAgIFwNCj4gKwkJIEFTUEVFRF9JMkNEX0lOVFJfU0RBX0RMX1RJTUVPVVQgfAkJ
CSAgICAgICBcDQo+ICAJCSBBU1BFRURfSTJDRF9JTlRSX0JVU19SRUNPVkVSX0RPTkUgfAkJCSAg
ICAgICBcDQo+ICAJCSBBU1BFRURfSTJDRF9JTlRSX1NDTF9USU1FT1VUIHwJCQkJICAgICAgIFwN
Cj4gIAkJIEFTUEVFRF9JMkNEX0lOVFJfQUJOT1JNQUwgfAkJCQkgICAgICAgXA0KPiBAQCAtMTc2
LDYgKzE4NSw3IEBAIHN0cnVjdCBhc3BlZWRfaTJjX2J1cyB7DQo+ICAJCQkJCQkJICAgdTMyIGRp
dmlzb3IpOw0KPiAgCXVuc2lnbmVkIGxvbmcJCQlwYXJlbnRfY2xrX2ZyZXF1ZW5jeTsNCj4gIAl1
MzIJCQkJYnVzX2ZyZXF1ZW5jeTsNCj4gKwl1MzIJCQkJaHdfdGltZW91dF9tczsNCj4gIAkvKiBU
cmFuc2FjdGlvbiBzdGF0ZS4gKi8NCj4gIAllbnVtIGFzcGVlZF9pMmNfbWFzdGVyX3N0YXRlCW1h
c3Rlcl9zdGF0ZTsNCj4gIAlzdHJ1Y3QgaTJjX21zZwkJCSptc2dzOw0KPiBAQCAtMjc2LDYgKzI4
NiwxNCBAQCBzdGF0aWMgaW50IGFzcGVlZF9pMmNfcmVjb3Zlcl9idXMoc3RydWN0IGFzcGVlZF9p
MmNfYnVzICpidXMpDQo+ICB9DQo+ICANCj4gICNpZiBJU19FTkFCTEVEKENPTkZJR19JMkNfU0xB
VkUpDQo+ICtzdGF0aWMgaW50IGFzcGVlZF9pMmNfY2hlY2tfc2xhdmVfZXJyb3IodTMyIGlycV9z
dGF0dXMpDQo+ICt7DQo+ICsJaWYgKGlycV9zdGF0dXMgJiBBU1BFRURfSTJDRF9JTlRSX1NMQVZF
X0lOQUNUSVZFX1RJTUVPVVQpDQo+ICsJCXJldHVybiAtRUlPOw0KPiArDQo+ICsJcmV0dXJuIDA7
DQo+ICt9DQo+ICsNCj4gIHN0YXRpYyB1MzIgYXNwZWVkX2kyY19zbGF2ZV9pcnEoc3RydWN0IGFz
cGVlZF9pMmNfYnVzICpidXMsIHUzMiBpcnFfc3RhdHVzKQ0KPiAgew0KPiAgCXUzMiBjb21tYW5k
LCBpcnFfaGFuZGxlZCA9IDA7DQo+IEBAIC0yODYsNiArMzA0LDE0IEBAIHN0YXRpYyB1MzIgYXNw
ZWVkX2kyY19zbGF2ZV9pcnEoc3RydWN0IGFzcGVlZF9pMmNfYnVzICpidXMsIHUzMiBpcnFfc3Rh
dHVzKQ0KPiAgCWlmICghc2xhdmUpDQo+ICAJCXJldHVybiAwOw0KPiAgDQo+ICsJaWYgKGFzcGVl
ZF9pMmNfY2hlY2tfc2xhdmVfZXJyb3IoaXJxX3N0YXR1cykpIHsNCj4gKwkJZGV2X2RiZyhidXMt
PmRldiwgInJlY2VpdmVkIHNsYXZlIGVycm9yIGludGVycnVwdDogMHglMDh4XG4iLA0KPiArCQkJ
aXJxX3N0YXR1cyk7DQo+ICsJCWlycV9oYW5kbGVkIHw9IChpcnFfc3RhdHVzICYgQVNQRUVEX0ky
Q0RfSU5UUl9TTEFWRV9FUlJPUlMpOw0KPiArCQlidXMtPnNsYXZlX3N0YXRlID0gQVNQRUVEX0ky
Q19TTEFWRV9JTkFDVElWRTsNCj4gKwkJcmV0dXJuIGlycV9oYW5kbGVkOw0KPiArCX0NCj4gKw0K
PiAgCWNvbW1hbmQgPSByZWFkbChidXMtPmJhc2UgKyBBU1BFRURfSTJDX0NNRF9SRUcpOw0KPiAg
DQo+ICAJLyogU2xhdmUgd2FzIHJlcXVlc3RlZCwgcmVzdGFydCBzdGF0ZSBtYWNoaW5lLiAqLw0K
PiBAQCAtNjAyLDcgKzYyOCw3IEBAIHN0YXRpYyB2b2lkIGFzcGVlZF9pMmNfbmV4dF9tc2dfb3Jf
c3RvcChzdHJ1Y3QgYXNwZWVkX2kyY19idXMgKmJ1cykNCj4gIAl9DQo+ICB9DQo+ICANCj4gLXN0
YXRpYyBpbnQgYXNwZWVkX2kyY19pc19pcnFfZXJyb3IodTMyIGlycV9zdGF0dXMpDQo+ICtzdGF0
aWMgaW50IGFzcGVlZF9pMmNfY2hlY2tfbWFzdGVyX2Vycm9yKHUzMiBpcnFfc3RhdHVzKQ0KPiAg
ew0KPiAgCWlmIChpcnFfc3RhdHVzICYgQVNQRUVEX0kyQ0RfSU5UUl9BUkJJVF9MT1NTKQ0KPiAg
CQlyZXR1cm4gLUVBR0FJTjsNCj4gQEAgLTYzMyw5ICs2NTksOSBAQCBzdGF0aWMgdTMyIGFzcGVl
ZF9pMmNfbWFzdGVyX2lycShzdHJ1Y3QgYXNwZWVkX2kyY19idXMgKmJ1cywgdTMyIGlycV9zdGF0
dXMpDQo+ICAJICogc2hvdWxkIGNsZWFyIHRoZSBjb21tYW5kIHF1ZXVlIGVmZmVjdGl2ZWx5IHRh
a2luZyB1cyBiYWNrIHRvIHRoZQ0KPiAgCSAqIElOQUNUSVZFIHN0YXRlLg0KPiAgCSAqLw0KPiAt
CXJldCA9IGFzcGVlZF9pMmNfaXNfaXJxX2Vycm9yKGlycV9zdGF0dXMpOw0KPiArCXJldCA9IGFz
cGVlZF9pMmNfY2hlY2tfbWFzdGVyX2Vycm9yKGlycV9zdGF0dXMpOw0KPiAgCWlmIChyZXQpIHsN
Cj4gLQkJZGV2X2RiZyhidXMtPmRldiwgInJlY2VpdmVkIGVycm9yIGludGVycnVwdDogMHglMDh4
XG4iLA0KPiArCQlkZXZfZGJnKGJ1cy0+ZGV2LCAicmVjZWl2ZWQgbWFzdGVyIGVycm9yIGludGVy
cnVwdDogMHglMDh4XG4iLA0KPiAgCQkJaXJxX3N0YXR1cyk7DQo+ICAJCWlycV9oYW5kbGVkIHw9
IChpcnFfc3RhdHVzICYgQVNQRUVEX0kyQ0RfSU5UUl9NQVNURVJfRVJST1JTKTsNCj4gIAkJaWYg
KGJ1cy0+bWFzdGVyX3N0YXRlICE9IEFTUEVFRF9JMkNfTUFTVEVSX0lOQUNUSVZFKSB7DQo+IEBA
IC0xMTk0LDYgKzEyMjAsNyBAQCBzdGF0aWMgdTMyIGFzcGVlZF9pMmNfMjV4eF9nZXRfY2xrX3Jl
Z192YWwoc3RydWN0IGRldmljZSAqZGV2LCB1MzIgZGl2aXNvcikNCj4gIC8qIHByZWNvbmRpdGlv
bjogYnVzLmxvY2sgaGFzIGJlZW4gYWNxdWlyZWQuICovDQo+ICBzdGF0aWMgaW50IGFzcGVlZF9p
MmNfaW5pdF9jbGsoc3RydWN0IGFzcGVlZF9pMmNfYnVzICpidXMpDQo+ICB7DQo+ICsJdTMyIHRp
bWVvdXRfYmFzZV9kaXZpc29yLCB0aW1lb3V0X3RpY2tfdXMsIHRpbWVvdXRfY3ljbGVzOw0KPiAg
CXUzMiBkaXZpc29yLCBjbGtfcmVnX3ZhbDsNCj4gIA0KPiAgCWRpdmlzb3IgPSBESVZfUk9VTkRf
VVAoYnVzLT5wYXJlbnRfY2xrX2ZyZXF1ZW5jeSwgYnVzLT5idXNfZnJlcXVlbmN5KTsNCj4gQEAg
LTEyMDIsOCArMTIyOSw0NiBAQCBzdGF0aWMgaW50IGFzcGVlZF9pMmNfaW5pdF9jbGsoc3RydWN0
IGFzcGVlZF9pMmNfYnVzICpidXMpDQo+ICAJCQlBU1BFRURfSTJDRF9USU1FX1RIRFNUQV9NQVNL
IHwNCj4gIAkJCUFTUEVFRF9JMkNEX1RJTUVfVEFDU1RfTUFTSyk7DQo+ICAJY2xrX3JlZ192YWwg
fD0gYnVzLT5nZXRfY2xrX3JlZ192YWwoYnVzLT5kZXYsIGRpdmlzb3IpOw0KPiArDQo+ICsJaWYg
KGJ1cy0+aHdfdGltZW91dF9tcykgew0KPiArCQl1OCBkaXZfbWF4ID0gQVNQRUVEX0kyQ0RfVElN
RV9USU1FT1VUX0JBU0VfRElWSVNPUl9NQVNLID4+DQo+ICsJCQkgICAgIEFTUEVFRF9JMkNEX1RJ
TUVfVElNRU9VVF9CQVNFX0RJVklTT1JfU0hJRlQ7DQo+ICsJCXU4IGN5Y2xlc19tYXggPSBBU1BF
RURfSTJDRF9USU1FT1VUX0NZQ0xFU19NQVNLID4+DQo+ICsJCQkJQVNQRUVEX0kyQ0RfVElNRU9V
VF9DWUNMRVNfU0hJRlQ7DQo+ICsNCj4gKwkJdGltZW91dF9iYXNlX2Rpdmlzb3IgPSAwOw0KPiAr
DQo+ICsJCWRvIHsNCj4gKwkJCXRpbWVvdXRfdGlja191cyA9IDEwMDAgKiAoMTYzODQgPDwNCj4g
KwkJCQkJCSAgKHRpbWVvdXRfYmFzZV9kaXZpc29yIDw8IDEpKSAvDQo+ICsJCQkJCSAgKGJ1cy0+
cGFyZW50X2Nsa19mcmVxdWVuY3kgLyAxMDAwKTsNCj4gKw0KPiArCQkJaWYgKHRpbWVvdXRfYmFz
ZV9kaXZpc29yID09IGRpdl9tYXggfHwNCj4gKwkJCSAgICB0aW1lb3V0X3RpY2tfdXMgKiBBU1BF
RURfSTJDRF9USU1FT1VUX0NZQ0xFU19NQVNLID49DQo+ICsJCQkgICAgYnVzLT5od190aW1lb3V0
X21zICogMTAwMCkNCj4gKwkJCQlicmVhazsNCj4gKwkJfSB3aGlsZSAodGltZW91dF9iYXNlX2Rp
dmlzb3IrKyA8IGRpdl9tYXgpOw0KPiArDQo+ICsJCWlmICh0aW1lb3V0X3RpY2tfdXMpIHsNCj4g
KwkJCXRpbWVvdXRfY3ljbGVzID0gRElWX1JPVU5EX1VQKGJ1cy0+aHdfdGltZW91dF9tcyAqIDEw
MDAsDQo+ICsJCQkJCQkgICAgICB0aW1lb3V0X3RpY2tfdXMpOw0KPiArCQkJaWYgKHRpbWVvdXRf
Y3ljbGVzID09IDApDQo+ICsJCQkJdGltZW91dF9jeWNsZXMgPSAxOw0KPiArCQkJZWxzZSBpZiAo
dGltZW91dF9jeWNsZXMgPiBjeWNsZXNfbWF4KQ0KPiArCQkJCXRpbWVvdXRfY3ljbGVzID0gY3lj
bGVzX21heDsNCj4gKwkJfSBlbHNlIHsNCj4gKwkJCXRpbWVvdXRfY3ljbGVzID0gMDsNCj4gKwkJ
fQ0KPiArCX0gZWxzZSB7DQo+ICsJCXRpbWVvdXRfYmFzZV9kaXZpc29yID0gMDsNCj4gKwkJdGlt
ZW91dF9jeWNsZXMgPSAwOw0KPiArCX0NCj4gKw0KPiArCWNsa19yZWdfdmFsIHw9IEZJRUxEX1BS
RVAoQVNQRUVEX0kyQ0RfVElNRV9USU1FT1VUX0JBU0VfRElWSVNPUl9NQVNLLA0KPiArCQkJCSAg
dGltZW91dF9iYXNlX2Rpdmlzb3IpOw0KPiArDQo+ICAJd3JpdGVsKGNsa19yZWdfdmFsLCBidXMt
PmJhc2UgKyBBU1BFRURfSTJDX0FDX1RJTUlOR19SRUcxKTsNCj4gLQl3cml0ZWwoQVNQRUVEX05P
X1RJTUVPVVRfQ1RSTCwgYnVzLT5iYXNlICsgQVNQRUVEX0kyQ19BQ19USU1JTkdfUkVHMik7DQo+
ICsJd3JpdGVsKHRpbWVvdXRfY3ljbGVzLCBidXMtPmJhc2UgKyBBU1BFRURfSTJDX0FDX1RJTUlO
R19SRUcyKTsNCj4gIA0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiBAQCAtMTIzMCw2ICsxMjk1LDEx
IEBAIHN0YXRpYyBpbnQgYXNwZWVkX2kyY19pbml0KHN0cnVjdCBhc3BlZWRfaTJjX2J1cyAqYnVz
LA0KPiAgCWVsc2UNCj4gIAkJZnVuX2N0cmxfcmVnIHw9IEFTUEVFRF9JMkNEX01VTFRJX01BU1RF
Ul9ESVM7DQo+ICANCj4gKwlkZXZpY2VfcHJvcGVydHlfcmVhZF91MzIoJnBkZXYtPmRldiwgImFz
cGVlZCxody10aW1lb3V0LW1zIiwNCj4gKwkJCQkgJmJ1cy0+aHdfdGltZW91dF9tcyk7DQoNCiJh
c3BlZWQsaHctdGltZW91dC1tcyIgbmVlZHMgdG8gYmUgcGFyc2VkIGJlZm9yZSBjYWxsaW5nIGFz
cGVlZF9pMmNfaW5pdF9jbGsoKS4NCg0KT3RoZXJzIGxvb2sgZ29vZCB0byBtZSwgYW5kIHRoZSBw
YXRjaCBpcyBhbHNvIHRlc3RlZCBvbiBNaW5pcGFjayBCTUMuDQoNCg0KQ2hlZXJzLA0KDQpUYW8N
Cg0KPiArCWlmIChidXMtPmh3X3RpbWVvdXRfbXMpDQo+ICsJCWZ1bl9jdHJsX3JlZyB8PSBBU1BF
RURfSTJDRF9CVVNfQVVUT19SRUNPVkVSWV9FTjsNCj4gKw0KPiAgCS8qIEVuYWJsZSBNYXN0ZXIg
TW9kZSAqLw0KPiAgCXdyaXRlbChyZWFkbChidXMtPmJhc2UgKyBBU1BFRURfSTJDX0ZVTl9DVFJM
X1JFRykgfCBmdW5fY3RybF9yZWcsDQo+ICAJICAgICAgIGJ1cy0+YmFzZSArIEFTUEVFRF9JMkNf
RlVOX0NUUkxfUkVHKTsNCj4gDQo=
