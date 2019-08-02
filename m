Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2533C7EBE4
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2019 07:21:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460Frr3QrXzDqZX
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2019 15:21:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=31170bfc9b=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Rp25KIx3"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="cfHNTQPa"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460Fqy05CvzDqW4;
 Fri,  2 Aug 2019 15:20:59 +1000 (AEST)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.27/8.16.0.27) with SMTP id x725Hw3a004680;
 Thu, 1 Aug 2019 22:20:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=7YRtrjjEZQx1hFHzZ7Rzbx68eQ50VUzRxqGu1B3Fwas=;
 b=Rp25KIx3eqZQ12clgKPLWtVZZZfI5GUdIISB3Q9P2tmh2TWw+zQmCOVAYFGwZZQwdrXC
 OwWBCYvmqCGViO+ZxlxzuWmPzL1nT/toldys7JxBhQAjEE4Ejvfa0nv6Sftq8x/tbxBg
 Ur0UfGR/U+SwDwYioUT4OqX0KvKI5CpiIJo= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0001303.ppops.net with ESMTP id 2u449gj30c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 01 Aug 2019 22:20:44 -0700
Received: from ash-exhub103.TheFacebook.com (2620:10d:c0a8:82::c) by
 ash-exhub203.TheFacebook.com (2620:10d:c0a8:83::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 1 Aug 2019 22:20:43 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.174) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 1 Aug 2019 22:20:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kx5KGRhjI75s7tqh4jELuvf6XniWcfbFsTA3DAgHs0QNd3xmNk8zAIcjXd+i2JZ+yKyVtHn+PkvX3AoR2WgtgNsFy5eHlol17DQJDFRpP2NRB215N5OLIO3uQzAZ7pCw5u8JTiD7izpgEVq5aHtM2N7JBRRksNK7ta2SHiVZn552+PLu2KgOC3qUkZPeGdvWVdYAR8fgkbgxrmmxyYlJzFvSQ3b+EMRDpsaBWdT6Q+k0C1OPne2aWPTuiFNs7xaWqCnEPGhED5XxqqaVT72HO3iYpVmgAMInaafuZSqhX8mQNglsBAn5sUOrji29+A2YhzBgybXt9YiE0vni4HaEFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7YRtrjjEZQx1hFHzZ7Rzbx68eQ50VUzRxqGu1B3Fwas=;
 b=GanocCAop9em2dAxvKFvsDIex+Yo9xV0wMlSi2/wwb00qO2OhXyTAYH61v/NNPrMGo4mLkd/dX0B896fmRZCHKkxww3R3dVjcE3RXcks3wSyr7pw00/Mt58oRnCzJ8+ks6nJhwRAgACc/OrtvI9YKdb6eOZoK4mX41K6jxjayv8T48/C0PNiSLrSXUNvRVRZ5HNlFKdroUbfXHpMJb/EjlLLPYOeHeVv5Bm+1laYgZyEmt3HkFMNQyjMf0Dkg9SuCqj+5ErjZ+DcWEm8I28UyPMY7qkcCYl+HIE6XnV4jwgyPxnnkTT4gwI/3atdsO8WBfK03LktmHu+2RZPPYE+Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=fb.com;dmarc=pass action=none header.from=fb.com;dkim=pass
 header.d=fb.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7YRtrjjEZQx1hFHzZ7Rzbx68eQ50VUzRxqGu1B3Fwas=;
 b=cfHNTQPaKy+iyCmP9MW3wppJcBOL97I0fTf8ovOJvHClIIudNgWk+RjpGwkdbKU5pc2SLTON+Tt539yvb1CFrlyqmDLA4LasdQU9SvwZO9pTLkv70sR2e0u33xd58lBKsz431vG2X26k8bG3EVj5H2sVY3Ow2gQZmWeWJKioyEw=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1197.namprd15.prod.outlook.com (10.175.7.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Fri, 2 Aug 2019 05:20:42 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::c66:6d60:f6e5:773c]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::c66:6d60:f6e5:773c%8]) with mapi id 15.20.2136.010; Fri, 2 Aug 2019
 05:20:42 +0000
From: Tao Ren <taoren@fb.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Add Facebook Wedge100 BMC
Thread-Topic: [PATCH v2] ARM: dts: aspeed: Add Facebook Wedge100 BMC
Thread-Index: AQHVSOg2lZoVHrZ29U2XlvDXnsufaKbnQZOA//+bUYA=
Date: Fri, 2 Aug 2019 05:20:41 +0000
Message-ID: <606273F4-E021-4AAF-9F59-F363E4FFF92A@fb.com>
References: <20190802041010.1234178-1-taoren@fb.com>
 <CACPK8XcuwNE3aBrsgn-paTZt-EtF6pc6WwYBQef5xc7157bk2g@mail.gmail.com>
In-Reply-To: <CACPK8XcuwNE3aBrsgn-paTZt-EtF6pc6WwYBQef5xc7157bk2g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.1a.0.190609
x-originating-ip: [2620:10d:c090:180::1:94d1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d9f0837-79c0-47a0-c8d2-08d7170929de
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1197; 
x-ms-traffictypediagnostic: MWHPR15MB1197:
x-microsoft-antispam-prvs: <MWHPR15MB1197AD2CD9BE3D4676210120B2D90@MWHPR15MB1197.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(346002)(136003)(396003)(39860400002)(366004)(47680400002)(43544003)(199004)(189003)(6506007)(33656002)(5660300002)(76116006)(14454004)(66476007)(66556008)(64756008)(53936002)(66946007)(66446008)(478600001)(81166006)(486006)(68736007)(4326008)(36756003)(11346002)(476003)(446003)(46003)(81156014)(2616005)(71190400001)(6512007)(71200400001)(25786009)(8676002)(305945005)(316002)(186003)(54906003)(86362001)(8936002)(7736002)(6116002)(256004)(2906002)(229853002)(58126008)(6436002)(53546011)(76176011)(6486002)(6916009)(102836004)(6246003)(99286004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1197;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qu2vQKv/PweLZWEe/h/0DGEeIRhLt9jTD6F+1UM3YtYZjjw5pR/uC4cXF1HYbD9cODX8AnyA3S1cRc1fcXEL0ZYWIP1VLMb4GTRO3FtRm4LFOk7TxBONqteGug2wVN5HIvRA9MisWNgruWyPrp2QMhoyjaJinEiv5dcFLVcj6g4xnUvVj+YgOlYPVEQcy98KNOf8oJIuyiQRE8j5QaXrzKQ8sYuoY/txWjrJWweXJTCNRF2ymEthCy0Ah1rGNdnQbwk6ndsQs7mcSmSTYMEPkas9UAc1rprPYrxtJTVinp9B2Hpe5ZKKcJ3Mxxojnt/nMpdkJptvHUIgBrbb+AvOH5y94v+FNtZ/99P75YOkWhcdrDUE/FsbhKuL/I2QRAf7jGiiTgguLwKvcCkKj7acceJqw2zkYbByYZFdArFZcQs=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FA155B7D2FF44B408295ED3794A270FC@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d9f0837-79c0-47a0-c8d2-08d7170929de
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 05:20:41.9574 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: taoren@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1197
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-02_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908020056
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
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gOC8xLzE5LCA5OjIxIFBNLCAiSm9lbCBTdGFubGV5IiA8am9lbEBqbXMuaWQuYXU+IHdyb3Rl
Og0KDQo+ICBPbiBGcmksIDIgQXVnIDIwMTkgYXQgMDQ6MTAsIFRhbyBSZW4gPHRhb3JlbkBmYi5j
b20+IHdyb3RlOg0KPj4NCj4+IEFkZCBpbml0aWFsIHZlcnNpb24gb2YgZGV2aWNlIHRyZWUgZm9y
IEZhY2Vib29rIFdlZGdlMTAwIEFTVDI0MDAgQk1DDQo+PiBwbGF0Zm9ybS4NCj4+DQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBUYW8gUmVuIDx0YW9yZW5AZmIuY29tPg0KPj4gUmV2aWV3ZWQtYnk6IEFuZHJl
dyBKZWZmZXJ5IDxhbmRyZXdAYWouaWQuYXU+DQo+PiAtLS0NCj4+ICBDaGFuZ2VzIGluIHYyOg0K
Pj4gIC0gcmVtb3ZlICJkZWJ1ZyIgZnJvbSBib290YXJncy4NCj4gICAgDQo+IFRoYW5rcy4gSSBh
cHBsaWVkIHdlZGdlNDAgYW5kIHRoZW4gdGhpcyBvbmUgZmFpbHMgdG8gYXBwbHkgZHVlIHRvDQo+
IGNvbmZsaWN0cyBpbiB0aGUgTWFrZWZpbGUuIE5leHQgdGltZSB5b3UgaGF2ZSB0d28gcGF0Y2hl
cywgc2VuZCB0aGVtDQo+IGFzIGEgc2VyaWVzIHRoZXkgYXBwbHkgb25lIGF0b3AgdGhlIG90aGVy
Lg0KDQpJIHRob3VnaHQgYWJvdXQgYXNraW5nIHlvdSBpZiBJIHNob3VsZCBzZW5kIHRoZW0gYXMg
YSBzZXJpZXMgYWx0aG91Z2ggdGhleSBhcmUgbG9naWNhbGx5IGluZGVwZW5kZW50IHBhdGNoZXMu
Lg0KU29ycnkgYWJvdXQgdGhhdCBhbmQgSSB3aWxsIGRvIHNvIGZvciBmdXR1cmUgcGF0Y2hlcy4N
Cg0KPiAgVGhlIG5hbWluZyBvZiB0aGVzZSB0d28gZmlsZXMgc3VnZ2VzdHMgdGhleSBjb21lIGZy
b20gYSBmYW1pbHkuIEkNCj4gIG5vdGljZWQgdGhlcmUncyB2ZXJ5IG1pbm9yIGRpZmZlcmVuY2Vz
LCBhIHBjYTk1NDggc3dpdGNoIGFuZCB0aGUgdXNlDQo+ICBvZiBhIHdhdGNoZG9nLg0KPiAgDQo+
ICBBcmUgdGhlc2UgZGV2aWNlIHRyZWVzIGNvbXBsZXRlPyBJZiB5ZXMsIGRvIHlvdSB0aGluayBp
dCdzIHdvcnRod2hpbGUNCj4gIHRvIGhhdmUgYSBjb21tb24gd2VkZ2UgZGVzY3JpcHRpb24gaW4g
ZWcuDQo+ICBhc3BlZWQtYm1jLWZhY2Vib29rLXdlZGdlLmR0c2ksIGFuZCBwdXQgdGhlIHVuaXF1
ZSBkZXNjcmlwdGlvbiBpbg0KPiAgcmVzcGVjdGl2ZSBkdHMgYm9hcmQgZmlsZXM/DQo+ICAgDQo+
ICBUaGUgdXBzaWRlIG9mIHRoaXMgaXMgcmVkdWNlZCBkdXBsaWNhdGlvbi4NCj4gIA0KPiAgSWYg
eW91IGhhdmUgYSByZWFzb24gbm90IHRvLCB0aGVuIHRoYXQgaXMgb2theSBhbmQgd2UgY2FuIGxl
YXZlIGl0IGFzDQo+ICB5b3Ugc3VibWl0dGVkIHRoZW0uDQoNClRoYW5rIHlvdSBmb3IgdGhlIHN1
Z2dlc3Rpb24uIEknbSBhbHNvIGNvbnNpZGVyaW5nIG1vdmluZyBjb21tb24gc3R1ZmYgaW50byAi
ZHRzaSIgZmlsZSwgYnV0IGxldCBtZSB0YWtlIGNhcmUgb2YgaXQgaW4gYSBzZXBhcmF0ZSBwYXRj
aCwgbWFpbmx5IGJlY2F1c2U6DQogIDEpIEkgaGF2ZSBvbmUgbW9yZSBCTUMgcGxhdGZvcm0gKGdh
bGF4eTEwMCkgd2hpY2ggaXMgYWxzbyBzaW1pbGFyIHRvIHdlZGdlLg0KICAgICAgSSBoYXZlbid0
IHN0YXJ0ZWQgdGhlIHBsYXRmb3JtLCBidXQgb25jZSBJIGhhdmUgZ2FsYXh5MTAwIGRldmljZSB0
cmVlIHJlYWR5LCBpdCB3b3VsZCBiZSBlYXNpZXIgZm9yIG1lIHRvIGV4dHJhY3QgY29tbW9uIHBh
cnQuDQogIDIpIHRoZSBkZXZpY2UgdHJlZSBpcyBub3QgY29tcGxldGUgeWV0Lg0KICAgICAgRm9y
IGV4YW1wbGUsIGFsbCB0aGUgaTJjIGRldmljZXMgYXJlIHN0aWxsIGNyZWF0ZWQgZnJvbSB1c2Vy
c3BhY2UuDQogICAgICBJJ20gdHJ5aW5nIHRvIG1vdmUgdGhlIGxvZ2ljIGZyb20gdXNlcnNwYWNl
IHRvIGRldmljZSB0cmVlIGJ1dCBJIGhhdmVuJ3QgZGVjaWRlZCB3aGF0IHRvIGRvIHdpdGggdGhv
c2UgY3BsZC9mcGdhIGRldmljZXMuDQoNCg0KQ2hlZXJzLA0KDQpUYW8NCg0K
