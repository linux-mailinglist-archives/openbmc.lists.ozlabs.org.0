Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6657DAB0AC
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2019 04:36:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PhWY5zdtzDr5N
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2019 12:36:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=41527672ed=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="JUfDovjA"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="JCK+7VnU"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PhVt6rygzDr4d
 for <openbmc@lists.ozlabs.org>; Fri,  6 Sep 2019 12:35:32 +1000 (AEST)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x862Y4pd012113; Thu, 5 Sep 2019 19:35:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=oE2ARl2eUyiaLsYIn3CvI2tsZb7PxyN/b1NANoTkQPg=;
 b=JUfDovjAAWHDiE99vu5sO2T9Dl5X2CFdBjTLfLq+n+wvKNUhdPL66rs+b+lYohvtfwsP
 fe0M8ETOozWsMe/FZYp4ndlVNYdg40+Wa50h8xHsAcfmMeDmFrN2IxyCBCdb5zrkZ2R7
 ShFHQ738on6204/d5r51uaZCJ98K+Ch8xY0= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2utqxfnhp0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 05 Sep 2019 19:35:16 -0700
Received: from prn-hub03.TheFacebook.com (2620:10d:c081:35::127) by
 prn-hub04.TheFacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Thu, 5 Sep 2019 19:35:15 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Thu, 5 Sep 2019 19:35:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z8LbMmy0reLJfJtHPrgZbQFIFqPrgKYNwhxGKuqG3sHC7eMEkZ65HdhAJ9zZZ5aPUvN6vhbel/K0qljpixuAO/0uXrk7pnzvsRhE5cotKmynmAWyWrBpNlmUmbksasnVnHIw4vs2YEsMjpOkpwsZS+tq+6ER11mz/zjGHKBmzWXZD7GFM617BP05EuN3bazJqowNLGyrhmA93ePpMxwhqpO6GEkWpT3jDDkeyFJxcJxfN2sXOOWa7VLDP9SHns6xc9lpAU9609fKzh4CLMKvWjWNolF2+tzwZKCv5kCzIUTAllUfzuGH2VIkg0pA5eu9GLGJytiWLsJ0DKr85BtliA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oE2ARl2eUyiaLsYIn3CvI2tsZb7PxyN/b1NANoTkQPg=;
 b=ELWZo4WOwPa4REIc7kAHrt3cVHF8pt3tKqkX4NNpinQbY4Va5ZEROpIcj1o4B5bhInvBzas5E+jWnwYPWTjb7eH/MiutT3YsPpk0z2AGhj0ddMzW+idgXEcxVrhA/ADPEWLRjOG/zBA7jdHPHa3VVLThSkeoRxb1DuU9+Cn1OM/9CvZ5xdGe+r33aiD6MFHYWZF6PRkImY83ApqQpGoItZcgfYqIZGwKjMySQqQz730FzvMJdxmF8uKdCAx2SOGs07NkOAZENEAKMXaSVlCQnkZFB6we+CT4Hw/P1AmR6N5TbKepWFeqTFF5a+cMapJvgL/U4DbYDyY454XEHNnj6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oE2ARl2eUyiaLsYIn3CvI2tsZb7PxyN/b1NANoTkQPg=;
 b=JCK+7VnUaEp1odP6Os094fVCzz48XBUvMAaIN5bBrK8b0U0EzKIyQm10EjlXFlRlPrtLedo0QeYWfDL7B78geKMas2uHsR4kGSl8SSSCaFZbOQYHkvIdTkz2ysW9vHzSrHU0YoCLE8oTFvleJVCYElplXxOXBUlTL0w7Sbdtezc=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1117.namprd15.prod.outlook.com (10.175.9.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.19; Fri, 6 Sep 2019 02:35:14 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::94f6:ca02:596c:801]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::94f6:ca02:596c:801%9]) with mapi id 15.20.2220.022; Fri, 6 Sep 2019
 02:35:14 +0000
From: Tao Ren <taoren@fb.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Brendan Higgins
 <brendanhiggins@google.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH dev-5.2 2/2] i2c: aspeed: add slave inactive timeout
 support
Thread-Topic: [PATCH dev-5.2 2/2] i2c: aspeed: add slave inactive timeout
 support
Thread-Index: AQHVZFu2oPsLLPUkiEeycU/c08ziUw==
Date: Fri, 6 Sep 2019 02:35:13 +0000
Message-ID: <5b97e83a-4bac-8a44-05f3-298951afdd36@fb.com>
References: <20190904200758.5420-1-jae.hyun.yoo@linux.intel.com>
 <20190904200758.5420-3-jae.hyun.yoo@linux.intel.com>
 <f0f1a11c-4e0a-0ac0-b1dd-d05931bf5b4e@fb.com>
 <438748a7-2952-d4b9-ea60-9090bf9e9aaa@linux.intel.com>
 <073a63d8-bea6-4c91-a6a8-0486abeb6027@fb.com>
 <7ea704e7-22d4-047b-7b1c-65ccc9b61817@linux.intel.com>
 <0acba616-1c3c-53fc-cbc1-2bc19e48b4dc@fb.com>
 <f6f5d927-7c04-fe6b-dd5a-b930c77153e8@fb.com>
In-Reply-To: <f6f5d927-7c04-fe6b-dd5a-b930c77153e8@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CO2PR04CA0121.namprd04.prod.outlook.com
 (2603:10b6:104:7::23) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::2:a3c]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a5f3bdb-3cd0-486b-77f8-08d73272d882
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1117; 
x-ms-traffictypediagnostic: MWHPR15MB1117:
x-microsoft-antispam-prvs: <MWHPR15MB11176711C5189FD6AD9C5368B2BA0@MWHPR15MB1117.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0152EBA40F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(376002)(366004)(396003)(136003)(346002)(199004)(189003)(6512007)(5660300002)(31696002)(7736002)(6486002)(446003)(486006)(2906002)(52116002)(305945005)(11346002)(476003)(2616005)(86362001)(14454004)(64756008)(102836004)(4326008)(386003)(6506007)(53546011)(65956001)(65806001)(186003)(66446008)(66946007)(36756003)(66556008)(66476007)(46003)(110136005)(8936002)(99286004)(53936002)(478600001)(31686004)(25786009)(58126008)(6246003)(6116002)(81156014)(71200400001)(256004)(8676002)(81166006)(6436002)(229853002)(76176011)(14444005)(71190400001)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1117;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 160syp4DtObUTZUPtVOj8noZ/jREvKYmPodvRzTceE78tF50QDLZqZppEX9RKp4bq9E97bd39yrGMKmYgFIrlUq1PX03bDUitCXh6aPdmfQ6Mnou/8Bmy6Mj6CEsHxDxCr9gTBmdMOARBSH77jf6bPBEkoVcTbXAZ35vNsVrmBD91djs/AFZE6t+KrujyMU04p92603/NrDM1x1avBsgmFn/8vwLbDnPa753ufbnqeHT8u2ExRbaiYxGVZPN1FzTccCJu8RHy1vh39Gwx4dGILxTo1w8wD1kfvAWk1QDPTxCcrLCviKzvPnidoq7Qtt3XAfWDmAiovNch+MkgIdbafI4yMD4HKUU9VMtO49YpD4i8tfnCEoKbkdQ+kz/ghVL5DjVfH8F8RJ3ffBcfMgiI5yqq95NcMdnT8HpyNU8ROY=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <D045DAB5D518974CB091987B056318F4@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a5f3bdb-3cd0-486b-77f8-08d73272d882
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2019 02:35:13.9832 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NIvBMUVfwNkcALKbERp/RJKxVC71RzVThipKiPNjDuaGqq9E06fc8TwjOAfA4eSa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1117
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-06_01:2019-09-04,2019-09-06 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxlogscore=999
 spamscore=0 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1909060027
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

SGkgSmFlLA0KDQpPbiA5LzUvMTkgNjo1NiBQTSwgVGFvIFJlbiB3cm90ZToNCj4gT24gOS81LzE5
IDY6MTYgUE0sIFRhbyBSZW4gd3JvdGU6DQo+PiBIaSBKYWUsDQo+Pg0KPj4gT24gOS81LzE5IDQ6
MzUgUE0sIEphZSBIeXVuIFlvbyB3cm90ZToNCj4+PiBPbiA5LzUvMjAxOSA0OjE5IFBNLCBUYW8g
UmVuIHdyb3RlOg0KPj4+PiBPbiA5LzUvMTkgMzo0OCBQTSwgSmFlIEh5dW4gWW9vIHdyb3RlOg0K
Pj4+Pj4gSGkgVGFvLA0KPj4+Pj4NCj4+Pj4+IE9uIDkvNS8yMDE5IDM6MjggUE0sIFRhbyBSZW4g
d3JvdGU6DQo+Pj4+Pj4gSGkgSmFlLA0KPj4+Pj4+DQo+Pj4+Pj4gT24gOS80LzE5IDE6MDcgUE0s
IEphZSBIeXVuIFlvbyB3cm90ZToNCj4+Pj4+Pj4gSW4gY2FzZSBvZiBtdWx0aS1tYXN0ZXIgZW52
aXJvbm1lbnQsIGlmIGEgcGVlciBtYXN0ZXIgaW5jb3JyZWN0bHkgaGFuZGxlcw0KPj4+Pj4+PiBh
IGJ1cyBpbiB0aGUgbWlkZGxlIG9mIGEgdHJhbnNhY3Rpb24sIEkyQyBoYXJkd2FyZSBoYW5ncyBp
biBzbGF2ZSBzdGF0ZQ0KPj4+Pj4+PiBhbmQgaXQgY2FuJ3QgZXNjYXBlIGZyb20gdGhlIHNsYXZl
IHN0YXRlLCBzbyB0aGlzIGNvbW1pdCBhZGRzIHNsYXZlDQo+Pj4+Pj4+IGluYWN0aXZlIHRpbWVv
dXQgc3VwcG9ydCB0byByZWNvdmVyIHRoZSBidXMgaW4gdGhlIGNhc2UuDQo+Pj4+Pj4+DQo+Pj4+
Pj4+IFNpZ25lZC1vZmYtYnk6IEphZSBIeXVuIFlvbyA8amFlLmh5dW4ueW9vQGxpbnV4LmludGVs
LmNvbT4NCj4+Pj4+Pg0KPj4+Pj4+IEkgaGF2ZSBhIGdlbmVyaWMgcXVlc3Rpb24gb24gdGhlIHBh
dGNoOiBpcyBpdCBnb29kIGVub3VnaCB0byBqdXN0IGVuYWJsZSBzbGF2ZV9pbmFjdGl2ZV90aW1l
b3V0IGFuZCBhY2tub3dsZWRnZSB0aGUgaW50ZXJydXB0IHdoZW4gaXQgaGFwcGVucz8gT3IgZG8g
d2UgbmVlZCB0byByZXNldCB0aGUgaTJjIGNvbnRyb2xsZXIgdG8gYnJpbmcgaXQgb3V0IG9mIHNs
YXZlIHN0YXRlPw0KPj4+Pj4+DQo+Pj4+Pj4gSSdtIGFza2luZyB0aGlzIGJlY2F1c2UgSSBoaXQg
YW4gaXNzdWUgb24gbXkgTWluaXBhY2sgQk1DIHdoZXJlIHRoZSBzbGF2ZV9pbmFjdGl2ZV90aW1l
b3V0IGludGVycnVwdCB3YXMgZ2VuZXJhdGVkIG9uY2UgZXZlcnkgfjAuMSBzZWNvbmRzIChJIHNl
dCBhc3BlZWQsaHctdGltZW91dC1tcyB0byAxMDAwKSwgYW5kIGEgZmV3IHNlY29uZHMgbGF0ZXIg
bXkgQk1DIHdhcyByZWJvb3RlZCAoSSBndWVzcyB3YXRjaGRvZyB0aW1lZCBvdXQpLiBHaXZlbiB0
aGUgaXNzdWUgaGFwcGVuZWQgb25seSBvbmNlLCBJIGRvbid0IGhhdmUgY2hhbmNlIHRvIGNvbGxl
Y3QgbW9yZSBpbmZvcm1hdGlvbiAoc3VjaCBhcyB3aHkgdGhlIHJlcGV0aXRpdmUgaW50ZXJydXB0
IHdhcyBnZW5lcmF0ZWQsIHdoeSBCTUMgcmVib290ZWQsIGFuZCBldGMuKS4gV2lsbCBzaGFyZSBt
b3JlIGlmIEkgbWV0IHRoZSBwcm9ibGVtIGFnYWluLg0KPj4+Pj4NCj4+Pj4+IEJhc2ljIGNvbmNl
cHQgb2YgdGhpcyBpbXBsZW1lbnRhdGlvbiBpcyBzZXR0aW5nIHRoZSBzbGF2ZSBzdGF0ZSBvZg0K
Pj4+Pj4gZHJpdmVyIHRvIEFTUEVFRF9JMkNfU0xBVkVfSU5BQ1RJVkUgdG8gYXZvaWQgY2FsbGlu
ZyBvZg0KPj4+Pj4gYXNwZWVkX2kyY19yZXNldCgpIGRpcmVjdGx5IGZyb20gaW50ZXJydXB0IGNv
bnRleHQuIEluc3RlYWQsIHdoZW4gYQ0KPj4+Pj4gbWFzdGVyIHhmZXIgaGFwcGVucyBhZnRlciB0
aGF0LCBpdCB3aWxsIHRyeSBidXMgcmVjb3ZlcnkNCj4+Pj4+IHRocm91Z2ggYXNwZWVkX2kyY19y
ZWNvdmVyX2J1cygpIGFuZCBpdCB3aWxsIGNhbGwgYXNwZWVkX2kyY19yZXNldCgpDQo+Pj4+PiBp
ZiBuZWVkZWQuDQo+Pj4+Pg0KPj4+Pj4gSWYgdGhpcyBwYXRjaCBkb2Vzbid0IHdvcmsgaW4geW91
ciBjYXNlLCB0ZXN0IGl0IGFnYWluIGFmdGVyIGFkZGluZw0KPj4+Pj4gb25lIGxpbmUgY29kZSBp
bnRvIHRoaXMgZHJpdmVyLiBTZWUgYmVsb3cuDQo+Pj4+DQo+Pj4+IElmIGJ1c19yZXNldCBpcyBy
ZWFsbHkgbmVlZGVkIGluIHRoaXMgY2FzZSwgdGhlbiBJJ2QgcHJlZmVyIHRvIGRvIGl0IGltbWVk
aWF0ZWx5IG9yIGluIGEgdGhyZWFkZWRfaXJxX2hhbmRsZXIgaWYgaXQncyBiYWQgaWRlYSB0byBj
YWxsIGFzcGVlZF9pMmNfcmVzZXQoKSBpbiBoYXJkd2FyZSBpbnRlcnJ1cHQgY29udGV4dC4gVGhl
IHJlYXNvbnMgYmVpbmc6DQo+Pj4+DQo+Pj4+IDEpIHdlIGRvbid0IGtub3cgd2hlbiB1c2Vyc3Bh
Y2Ugc3RhcnRzIG5leHQgbWFzdGVyIHRyYW5zZmVyLg0KPj4+PiAyKSBhc3BlZWRfaTJjX3JlY292
ZXJfYnVzKCkgaXMgbm90IHRyaWdnZXJlZCBpbiBhc3BlZWRfaTJjX21hc3Rlcl94ZmVyKCkgaW4g
bXkgZW52aXJvbm1lbnQgYmVjYXVzZSBidXMgaXMgImlkbGUiIChJMkNEMTRbMTZdID09IDApLg0K
Pj4+Pg0KPj4+DQo+Pj4gT2gsIHNvIHRvIHN1cHBvcnQgdGhlIGNhc2UgYXMgd2VsbCwgcHJvYmFi
bHkgd2UgbmVlZCB0byBhZGQgYSBmbGFnIGZvcg0KPj4+IGluZGljYXRpbmcgcmVjb3ZlcnkgbmVl
ZHMgd2hlbiBhIG1hc3RlciB4ZmVyIGNvbWVzIHRoZW4gaXQgY291bGQNCj4+PiBmb3JjaWJseSBy
ZWNvdmVyIGFuZCByZXNldCB0aGUgYnVzIGV2ZW4gaWYgdGhlIGJ1cyBpcyBpZGxlLiBDYW4geW91
DQo+Pj4gcGxlYXNlIHRlc3QgdGhhdCB3aXRoIG1ha2luZyBjb2RlIGNoYW5nZXM/IFVuZm9ydHVu
YXRlbHksIEkgY2FuJ3QNCj4+PiByZXByb2R1Y2UgdGhlIGNhc2UgaW4gbXkgc3lzdGVtLg0KPj4N
Cj4+IE5vdCBzdXJlIGlmIEkgdW5kZXJzdGFuZCBpdCBjb3JyZWN0bHksIGJ1dCBnaXZlbiB3ZSBh
bHJlYWR5IHJlc2V0IHRoZSBidXMgaW4gaW50ZXJydXB0IGhhbmRsZXIsIHRoZSBleHRyYSBmbGFn
IHNob3VsZCBub3QgYmUgbmVlZGVkPw0KPiANCj4gT25lIG9mIG15IGNvbGxlYWd1ZXMgcmVtaW5k
ZWQgbWUgdG8gZW5hYmxlIGJ1cyBhdXRvIHJlbGVhc2UgKEkyQ0QwMFsxN10pIHdoaWNoIGNvdWxk
IGF2b2lkIGV4cGxpY2l0IGJ1cyByZXNldCBpbiBpbnRlcnJ1cHQgaGFuZGxlci4NCj4gDQo+IExl
dCBtZSB0cnkgYW5kIHdpbGwgdXBkYXRlIGJhY2sgc29vbi4NCg0KTGV0IG1lIHN1bW1hcml6ZSBt
eSB0ZXN0aW5nIHJlc3VsdCBvbiBNaW5pcGFjayBCTUM6DQoNCkJNQyBpMmMgY29udHJvbGxlciBj
YW5ub3QgZXhpdCBzbGF2ZSBzdGF0ZSBieSBlbmFibGluZyBzbGF2ZV9pbmFjdGl2ZV90aW1lb3V0
IGludGVycnVwdCBvbmx5OiBpbiB0aGlzIGNhc2UsIGkyYyBjb250cm9sbGVyIHN0YXlzIGluIFNS
WEQgc3RhdGUgYW5kIHNsYXZlX2luYWN0aXZlX3RpbWVvdXQgaW50ZXJydXB0IHdpbGwgYmUgZ2Vu
ZXJhdGVkIGFnYWluIGFuZCBhZ2FpbiB1bnRpbCBidXMgaXMgZXhwbGljaXRseSByZXNldC4NCg0K
SSd2ZSB0cmllZCBiZWxvdyAyIGFwcHJvYWNoZXMgYW5kIGJvdGggd29ya3Mgb24gbXkgcGxhdGZv
cm06DQogIC0gY2FsbGluZyBhc3BlZWRfaTJjX3Jlc2V0KCkgaW4gaW50ZXJydXB0IGhhbmRsZXIg
d2hlbiBzbGF2ZV9pbmFjaXZlX3RpbWVvdXQgaW50ZXJydXB0IGlzIGRlbGl2ZXJlZC4NCiAgLSBl
bmFibGluZyBidXMgYXV0byByZWxlYXNlIGZlYXR1cmUgKEkyQ0QwMFsxN10pIGluIHByb2JlIGZ1
bmN0aW9uLg0KDQoNCkNoZWVycywNCg0KVGFvDQoNCg==
