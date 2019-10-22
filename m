Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD51DFA0D
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 03:16:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xwZJ4pbfzDqJc
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 12:16:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=51984423fe=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="qkEntR0q"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="Y/n5ADlM"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46xwYQ2y3HzDqJc
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 12:15:30 +1100 (AEDT)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9M19NUB015013; Mon, 21 Oct 2019 18:15:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=dFGK9V4QIicDiIbv5HMZanhE7XA/+AOvH7VTSO7glt0=;
 b=qkEntR0qXCECHfOUWbYmuLd8F2HnXA+khC+pifqXHYd2jR7jRSh8a8oTrTu1nyssorY+
 0Gr1f41gLpfI0nYpKvX0S5MZe6YNpsTmnYRUXwdI94naX0uUrhLxyiNKnRxU7eo8ZswR
 xPXTt8FLwSbPdt4EK+sq/HZbc3AMtmBhWGE= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2vshwr9jx0-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 21 Oct 2019 18:15:24 -0700
Received: from ash-exhub201.TheFacebook.com (2620:10d:c0a8:83::7) by
 ash-exhub102.TheFacebook.com (2620:10d:c0a8:82::f) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 21 Oct 2019 18:15:24 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.101) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 21 Oct 2019 18:15:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AoDXDrwl98SzYmEqRKz3imKBafRRbYayBrHpykrHDe/MnUZAwDmqC5DQIbd+IdrvWztt9KpjlX/zyPocbnw969vA+ATOKH7cjCfqEY7GE7QlXn4+GqbtsqBLYo+urAM9fo9PlxtU4tKoYdnLnMa47+2EMpkIOBlDS1m3Z1BBbUjoEfk3kcx/fZJueZs+dsPjlcd3stV0h8sLfNseSkVRJ+rtMUhPipICz6Qa3580nlBiTkY2OwTgTZkCwj8ASFcxDqhDJnebvoC67o7cgeSxhGWranczSTfav97X/9mrJoJPlo4FPLtqLn4uw0R+odIVBE7WIqfzTOiDJ46Qymifpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFGK9V4QIicDiIbv5HMZanhE7XA/+AOvH7VTSO7glt0=;
 b=QqAsCVdBXwa2fguXRM8gFi/uzfAD0C6PyLIehqORVqnS2vnynC/4Ydv/2iGURw4/zzZw6xk86j8ysCjjnNXyT5JmE/4X3C7GTIsVEvnrJQUNqeLvqPoXNPucDulCG6G+ZLkVdmix5CZ78RNknBRXfEIIvcb2+JLsC2bFUateAGqEZL7jbEA+qncGlRlHRXk2AVmc8/Ae20KlRxFgN6/1QxTEZHXpxPdKXzixVo3ofyMmvUeUGDYdmwuqsxwQKEt1NNwRwpdZQTb3HZ/VmR+auTszlxBGR/fkzR2mYP17Zj+TwrlcyzuHpJ9rGrcrUR8+rGOqZ7duHSIt4CiNttsYRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFGK9V4QIicDiIbv5HMZanhE7XA/+AOvH7VTSO7glt0=;
 b=Y/n5ADlMW4I2E/ZQXj8km/y4jzc3fnV705uCGqFKmksSGQw5scRzDrOBYxMOp3VXRb1dhdLnqvRwbg44kcbWR3sHYh7Nf7TQ64fNtc4pogUFYhguZ1CDndiCjs/YUGswr62TT2c0IOYwCoLrB0FAZDqEVuQsugNX1WD30GFK1ts=
Received: from BY5PR15MB3636.namprd15.prod.outlook.com (52.133.252.91) by
 BY5PR15MB3665.namprd15.prod.outlook.com (52.133.252.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.20; Tue, 22 Oct 2019 01:15:23 +0000
Received: from BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::7887:4f9c:70df:285c]) by BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::7887:4f9c:70df:285c%4]) with mapi id 15.20.2347.029; Tue, 22 Oct 2019
 01:15:22 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: x86-power-control
Thread-Topic: x86-power-control
Thread-Index: AQHVhIgk7/7PtKOKbUeMJf/8spu+0qde/1mA///3sgCAAIQ8gP//kgqAgAGlawD//9+wgAClgtMA//+vbgA=
Date: Tue, 22 Oct 2019 01:15:22 +0000
Message-ID: <6DA89556-AD25-4BEE-AF40-9D7A129B7CB9@fb.com>
References: <EA590716-271A-4F5C-9B36-80260B7F35B6@fb.com>
 <66afaaab-baee-fc02-371b-2ef4a9f0d1ee@linux.intel.com>
 <37843B68-8D1C-48EB-B4B6-64CBC8F62F77@fb.com>
 <79190494-f452-286b-e304-7a901a3db26c@linux.intel.com>
 <8F55F038-A6E7-46A4-8C27-93C738AFEBDC@fb.com>
 <5d43146c-b8b9-164e-ed54-33df4bae6dce@linux.intel.com>
 <F590F665-9327-4C8D-8C23-C317DA71D7F0@fb.com>
 <54c375be-e45e-fc2a-dd31-6c9d61158169@linux.intel.com>
In-Reply-To: <54c375be-e45e-fc2a-dd31-6c9d61158169@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::1:f6a1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 51d476b3-2625-44bc-116f-08d7568d500f
x-ms-traffictypediagnostic: BY5PR15MB3665:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BY5PR15MB3665DDDB8E2D46F78E0D28E8DD680@BY5PR15MB3665.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(39860400002)(376002)(396003)(346002)(189003)(199004)(71190400001)(71200400001)(6306002)(6512007)(6436002)(11346002)(5660300002)(446003)(102836004)(486006)(86362001)(476003)(2616005)(46003)(186003)(14444005)(256004)(99286004)(6486002)(53546011)(6506007)(229853002)(76176011)(110136005)(2906002)(966005)(6246003)(14454004)(6116002)(305945005)(36756003)(66946007)(66556008)(64756008)(66446008)(76116006)(66476007)(25786009)(7736002)(478600001)(81166006)(81156014)(8676002)(8936002)(316002)(2501003)(33656002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR15MB3665;
 H:BY5PR15MB3636.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kJJ1zIrvKl57OiW52704k5d+axdddd6so7ruN7LWiEedZh8xqE6UFlmB+jLRZdmHRtDIlBfQhJsJZMsXB5r6ON4VbzaFtjuqQXjZ0ZKfsyK/DPKbekY/D9y+72ONZBqHsbfNBiVqNGd5zqGE51PEPjrfjFIYTivzoCVTOZbOXZjTaJ+Mjz8BXQ3VewFY4DtIqcM+GcYkxVhdCwX8OYFrhHS0hhhs6NkDjdDhUnUOWNCB+0O/X8uYh3xMATHUwE+UTQB7hgFyERfjNdiLx41PKqDxlumlwuvDTJdaEzGVn0jUDnYVwW5b+PrAgNLrAtRZSP5mR3vRjaB+GbjH/P7BlSYX/xvLkNBieSq1BFVVWiMdhLc10R5/JMYy+vsq/QEp/sFgWIp/6CDqskHXI9s9CfdRjdFWhICGIC0ZZw3IJjIvS+L7imY5jthZYWFdPVSSLi+AsBX+rLLsdeOTcl2Jb6X4/9I3JoBfTJ6ZIuEF9O4=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB14D5AA7EE294469BE44013AE58CA85@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 51d476b3-2625-44bc-116f-08d7568d500f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 01:15:22.8287 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hZcyh/NlJ+4cHo5qxdWtbMKbjAlz21HUHYS/7CkAKBcCXjcLmBqeWwfdMtCCAd6PywMr14tsAvTcyMI6h3BDgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3665
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-21_07:2019-10-21,2019-10-21 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxlogscore=999
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0 mlxscore=0
 spamscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1908290000 definitions=main-1910220009
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

DQoNCu+7v09uIDEwLzIxLzE5LCA0OjA0IFBNLCAiQmlsbHMsIEphc29uIE0iIDxqYXNvbi5tLmJp
bGxzQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6DQoNCiAgICANCiAgICANCiAgICBPbiAxMC8xOC8y
MDE5IDQ6MDQgUE0sIFZpamF5IEtoZW1rYSB3cm90ZToNCiAgICA+IA0KICAgID4gDQogICAgPiBP
biAxMC8xOC8xOSwgMTE6MDIgQU0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBCaWxscywgSmFzb24g
TSIgPG9wZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMub3psYWJzLm9yZyBv
biBiZWhhbGYgb2YgamFzb24ubS5iaWxsc0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOg0KICAgID4g
DQogICAgPiAgICAgIA0KICAgID4gICAgICANCiAgICA+ICAgICAgT24gMTAvMTcvMjAxOSA0OjUy
IFBNLCBWaWpheSBLaGVta2Egd3JvdGU6DQogICAgPiAgICAgID4NCiAgICA+ICAgICAgPg0KICAg
ID4gICAgICA+IE9uIDEwLzE3LzE5LCA0OjI3IFBNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgQmls
bHMsIEphc29uIE0iIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96
bGFicy5vcmcgb24gYmVoYWxmIG9mIGphc29uLm0uYmlsbHNAbGludXguaW50ZWwuY29tPiB3cm90
ZToNCiAgICA+ICAgICAgPg0KICAgID4gICAgICA+DQogICAgPiAgICAgID4NCiAgICA+ICAgICAg
PiAgICAgIE9uIDEwLzE3LzIwMTkgMzozMiBQTSwgVmlqYXkgS2hlbWthIHdyb3RlOg0KICAgID4g
ICAgICA+ICAgICAgPg0KICAgID4gICAgICA+ICAgICAgPiBPbiAxMC8xNy8xOSwgOTowMyBBTSwg
Im9wZW5ibWMgb24gYmVoYWxmIG9mIEJpbGxzLCBKYXNvbiBNIiA8b3BlbmJtYy1ib3VuY2VzK3Zp
amF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxhYnMub3JnIG9uIGJlaGFsZiBvZiBqYXNvbi5tLmJp
bGxzQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6DQogICAgPiAgICAgID4gICAgICA+DQogICAgPiAg
ICAgID4gICAgICA+ICAgICAgSGkgVmlqYXkNCiAgICA+ICAgICAgPiAgICAgID4NCiAgICA+ICAg
ICAgPiAgICAgID4gICAgICBPbiAxMC8xNi8yMDE5IDY6MTMgUE0sIFZpamF5IEtoZW1rYSB3cm90
ZToNCiAgICA+ICAgICAgPiAgICAgID4gICAgICA+IE9uZSBtb3JlIHF1ZXN0aW9uIG9uIGNvZGUs
IEkgc2VlIGZvbGxvd2luZyBjb2RlIHJlcXVpcmVzIHBvd2VyQnV0dG9uTWFzaw0KICAgID4gICAg
ICA+ICAgICAgPiAgICAgID4gdG8gYmUgc2V0IGJlZm9yZSBhcXVpcmluZyBHUElPIGxpbmUuIFBs
ZWFzZSBsZXQgbWUga25vdyB3aG8gc2V0cyB0aGlzDQogICAgPiAgICAgID4gICAgICA+ICAgICAg
PiBwb3dlckJ1dHRvbk1hc2sgdG8gdHJ1ZS4gSSBrbm93IHRoaXMgaXMgcmVsYXRlZCB0byBHUElP
IHBhc3N0aHJvdWdoIGJ1dA0KICAgID4gICAgICA+ICAgICAgPiAgICAgID4gc3RpbGwgY291bGRu
4oCZdCB1bmRlcnN0YW5kIHdoZXJlIGluIGNvZGUgaXQgZ2V0cyBzZXQgdW50aWwgc29tZW9uZSBj
YWxsDQogICAgPiAgICAgID4gICAgICA+ICAgICAgPiBzZXQtcHJvcGVydHkgb2YgZGJ1cy4NCiAg
ICA+ICAgICAgPiAgICAgID4NCiAgICA+ICAgICAgPiAgICAgID4gICAgICBwb3dlckJ1dHRvbk1h
c2sgaXMgYSBncGlvZDo6bGluZSBvYmplY3QgdGhhdCByZXR1cm5zIHRydWUgaWYgaXQNCiAgICA+
ICAgICAgPiAgICAgID4gICAgICByZWZlcmVuY2VzIGEgR1BJTyBsaW5lIGFuZCBmYWxzZSBvdGhl
cndpc2UuDQogICAgPiAgICAgID4gICAgICA+DQogICAgPiAgICAgID4gICAgICA+IEkgdW5kZXJz
dG9vZCBjb2RlIGJ1dCBteSBwb2ludCBoZXJlIGlzIHRoZXJlIHdpbGwgbm90IGJlIGFueQ0KICAg
ID4gICAgICA+ICAgICAgPiBncGlvZDo6bGluZSBvYmplY3QgaWYgcG93ZXJCdXR0b25NYXNrIGlz
IGRlZmluZWQgYXMgZmFsc2UuIEFuZA0KICAgID4gICAgICA+ICAgICAgPiBpbml0aWFsbHkgaXQg
aXMgZGVmaW5lZCBhcyBmYWxzZSBtZWFucyB0ZWhyZSB3aWxsIG5vdCBiZSBhbnkgbGluZQ0KICAg
ID4gICAgICA+ICAgICAgPiBvYmplY3QgY3JlYXRlZCB1bnRpbCBzb21lb25lIHNldHMgaXQgdG8g
dHJ1ZS4gQW5kIEkgZG9uJ3Qgc2VlIGl0DQogICAgPiAgICAgID4gICAgICA+IGFueSB3YXkgdG8g
c2V0IGl0IHRydWUgb3RoZXIgdGhhbiBzZXQtcHJvcGVydHkgdGhyb3VnaCBkYnVzLg0KICAgID4g
ICAgICA+DQogICAgPiAgICAgID4gICAgICBUaGF0J3MgY29ycmVjdC4gIE1hc2tpbmcgdGhlIHBv
d2VyIGJ1dHRvbiBpcyBzb21ldGhpbmcgdGhhdCBpcyBkb25lIGJ5DQogICAgPiAgICAgID4gICAg
ICBzb21lIGNvbXBvbmVudCBvdXRzaWRlIG9mIHBvd2VyLWNvbnRyb2wuDQogICAgPiAgICAgID4N
CiAgICA+ICAgICAgPiAgICAgIEZvciBleGFtcGxlLCB3ZSBjdXJyZW50bHkgdXNlIGl0IHdpdGgg
dGhlIFNldCBGcm9udCBQYW5lbCBCdXR0b24gRW5hYmxlcw0KICAgID4gICAgICA+ICAgICAgSVBN
SSBjb21tYW5kIHRvIGVuYWJsZS9kaXNhYmxlIHRoZSBwb3dlciBidXR0b24uICBTbywgaXQgaXMg
b25seSBtYXNrZWQNCiAgICA+ICAgICAgPiAgICAgIHdoZW4gcmVxdWVzdGVkLg0KICAgID4gICAg
ICA+IFNvIHRvIHVzZSB4LTg2LXBvd2VyLWNvbnRyb2wsIGVpdGhlciB3ZSBuZWVkIHRvIGhhdmUg
SVBNSSBjb21tYW5kIHRvIGVuYWJsZQ0KICAgID4gICAgICA+IHRoaXMgb3Igc29tZSBvdGhlciBk
YWVtb24gaGFzIHRvIHNldCB0aGlzIHByb3BlcnR5LiBDYW4gd2UgaGF2ZSB0aGlzIGZlYXR1cmUN
CiAgICA+ICAgICAgPiBvcHRpb25hbC4gSSBndWVzcyB0aGlzIGlzIGEgcHJ0IG9nIEdQSU8gcGFz
c3Rocm91Z2guDQogICAgPiAgICAgIA0KICAgID4gICAgICBZZXMsIHRoaXMgaXMgcGFydCBvZiBH
UElPIHBhc3N0aHJvdWdoLiAgV2hlbiB0aGUgR1BJTyBpcyByZXF1ZXN0ZWQsDQogICAgPiAgICAg
IHBhc3N0aHJvdWdoIGlzIGRpc2FibGVkIGluIHRoZSBwaW5jdHJsIGRyaXZlci4gIFNvLCB0byBt
YXNrIHRoZSBwb3dlcg0KICAgID4gICAgICBidXR0b24gKGRpc2FibGUgcGFzc3Rocm91Z2gpLCBw
b3dlci1jb250cm9sIHJlcXVlc3RzIGFuZCBob2xkcyB0aGUNCiAgICA+ICAgICAgIlBPV0VSX09V
VCIgR1BJTyBsaW5lLg0KICAgID4gICAgICANCiAgICA+ICAgICAgSXQgc2hvdWxkIGJlaGF2ZSBu
b3JtYWxseSB3aXRob3V0IHRoaXMgcHJvcGVydHkgZXZlciBnZXR0aW5nIHNldC4NCiAgICA+ICAg
ICAgDQogICAgPiAgICAgID4NCiAgICA+ICAgICAgPiAgICAgIFRoZSBhY3R1YWwgIlBPV0VSX09V
VCIgbGluZSBmb3IgcG93ZXItY29udHJvbCBpcyBub3QgcGVybWFuZW50bHkNCiAgICA+ICAgICAg
PiAgICAgIGNyZWF0ZWQsIGJ1dCBpcyBhc3NlcnRlZCB1c2luZyB0ZW1wb3JhcnkgY2FsbHMgbGlr
ZSB0aGlzIG9uZToNCiAgICA+ICAgICAgPiAgICAgIHNldEdQSU9PdXRwdXRGb3JNcygiUE9XRVJf
T1VUIiwgMCwgcG93ZXJQdWxzZVRpbWVNcyk7DQogICAgPiAgICAgID4NCiAgICA+ICAgICAgPiBU
aGlzIGZ1bmN0aW9uIHdpbGwgbm90IHJ1biBwb3dlciBvbi9vZmYgc2VxdWVuY2UgdW50aWwgYnV0
dG9uIG1hc2sgaXMgc2V0LiBJdA0KICAgID4gICAgICA+IFdpbGwgb25seSBzZXQgR1BJTyB2YWx1
ZSB3aGljaCBpcyBub3QgZW5vdWdoIGZvciBwb3dlcmluZyBvbi9vZmYuDQogICAgPiAgICAgIA0K
ICAgID4gICAgICBTb21ldGhpbmcgZWxzZSBpcyBnb2luZyBvbiwgaGVyZS4gIFRoZSBwb3dlckJ1
dHRvbk1hc2sgaXMgYSBzZXBhcmF0ZQ0KICAgID4gICAgICBmZWF0dXJlIGZyb20gZHJpdmluZyB0
aGUgIlBPV0VSX09VVCIgcGluLiAgSWYgcG93ZXJCdXR0b25NYXNrIGlzIG5vdA0KICAgID4gICAg
ICBzZXQsIHRoZW4gdGhlIHBvd2VyIG9uL29mZiBzaG91bGQgZnVuY3Rpb24gbm9ybWFsbHkuICBU
aGVyZSBpcyBhIHNwZWNpYWwNCiAgICA+ICAgICAgY2FzZSBpbiB0aGUgc2V0R1BJT091dHB1dEZv
ck1zKCkgY29kZSB0byBoYW5kbGUgd2hlbiAiUE9XRVJfT1VUIiBpcw0KICAgID4gICAgICBkcml2
ZW4gd2hpbGUgcG93ZXJCdXR0b25NYXNrIGlzIHRydWU6DQogICAgPiAgICAgIA0KICAgID4gICAg
ICAgICAgIC8vIElmIHRoZSByZXF1ZXN0ZWQgR1BJTyBpcyBtYXNrZWQsIHVzZSB0aGUgbWFzayBs
aW5lIHRvIHNldCB0aGUgb3V0cHV0DQogICAgPiAgICAgICAgICAgaWYgKHBvd2VyQnV0dG9uTWFz
ayAmJiBuYW1lID09ICJQT1dFUl9PVVQiKQ0KICAgID4gICAgICAgICAgIHsNCiAgICA+ICAgICAg
ICAgICAgICAgcmV0dXJuIHNldE1hc2tlZEdQSU9PdXRwdXRGb3JNcyhwb3dlckJ1dHRvbk1hc2ss
IG5hbWUsIHZhbHVlLA0KICAgID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGR1cmF0aW9uTXMpOw0KICAgID4gICAgICAgICAgIH0NCiAgICA+ICAgICAgICAg
ICAuLi4NCiAgICA+ICAgICAgICAgICAvLyBObyBtYXNrIHNldCwgc28gcmVxdWVzdCBhbmQgc2V0
IHRoZSBHUElPIG5vcm1hbGx5DQogICAgPiAgICAgIA0KICAgID4gICAgICBTbywgIlBPV0VSX09V
VCIgc2hvdWxkIHdvcmsgZWl0aGVyIHdheSwgYnV0IHRoZSBkZWZhdWx0IGJlaGF2aW9yIGlzIHRv
DQogICAgPiAgICAgIGZ1bmN0aW9uIHdpdGhvdXQgcG93ZXJCdXR0b25NYXNrIHNldC4gIEFyZSB5
b3Ugc2VlaW5nIGZhaWx1cmVzIG9uIHlvdXINCiAgICA+ICAgICAgcGxhdGZvcm0gd2hlbiBwb3dl
ckJ1dHRvbk1hc2sgaXMgZmFsc2U/DQogICAgPiANCiAgICA+IE5vLCBJdCBpcyBub3Qgd29ya2lu
ZyBiZWNhdXNlIGl0IHNpbXBscHkgc2V0cyBwb3dlcl9vdXQgdG8gJzAnLiBCdXQgdG8gcG93ZXIg
b24NCiAgICA+IGl0IHNob3VsZCBnb3QgZG93biBhcyAwIGFuZCBjb21lIGJhY2sgdG8gMSBhZnRl
ciBhIGRlbGF5LiBXaGljaCBoYXBwZW5zIG9ubHkNCiAgICA+IGluIGNhc2Ugb2YgcG93ZXJCdXR0
b25NYXNrIHNldCB0byB0cnVlLiBJIGd1ZXNzIHdlIG1heSBuZWVkIHRvIGZpeCB0aGlzLg0KICAg
IA0KICAgIEFoaCwgb2theS4gIEkgdGhpbmsgSSBzZWUgdGhlIGlzc3VlIG5vdy4NCiAgICANCiAg
ICBUaGUgaXNzdWUgaXMgdGhhdCBiZWNhdXNlIHJlbGVhc2luZyB0aGUgR1BJTyBvbiBhIHN5c3Rl
bSB3aXRoIA0KICAgIHBhc3MtdGhyb3VnaCwgc2V0cyB0aGUgcG93ZXIgYnV0dG9uIGJhY2sgdG8g
dGhlIGhhcmR3YXJlIGRlZmF1bHQgDQogICAgYXV0b21hdGljYWxseSwgdGhlIHNvZnR3YXJlIHNl
dHRpbmcgZG9lc24ndCBtYXR0ZXIsIHNvIGl0IGlzIGxlZnQgYXQgMC4NCiAgICANCiAgICBJZiB5
b3UgZG9uJ3QgbmVlZCB0byBrZWVwIGhvbGRpbmcgdGhlIEdQSU8gbGluZSBmb3IgUE9XRVJfT1VU
LCBJIHRoaW5rIA0KICAgIHlvdSBjYW4ganVzdCBhZGQgdGhlIGNvZGUgdG8gcmV2ZXJ0IHRoZSBQ
T1dFUl9PVVQgdmFsdWUgd2hlbiB0aGUgdGltZXIgDQogICAgZXhwaXJlcy4NCiAgICANCiAgICBU
YWtlIHRoaXMgbGluZToNCiAgICAgICAgICAgICAgICAgLy8gU2V0IHRoZSBtYXNrZWQgR1BJTyBs
aW5lIGJhY2sgdG8gdGhlIG9wcG9zaXRlIHZhbHVlDQogICAgICAgICAgICAgICAgIG1hc2tlZEdQ
SU9MaW5lLnNldF92YWx1ZSghdmFsdWUpOw0KICAgICBGcm9tIGhlcmU6IA0KICAgIGh0dHBzOi8v
Z2l0aHViLmNvbS9vcGVuYm1jL3g4Ni1wb3dlci1jb250cm9sL2Jsb2IvbWFzdGVyL3Bvd2VyLWNv
bnRyb2wteDg2L3NyYy9wb3dlcl9jb250cm9sLmNwcCNMODkxDQogICAgDQogICAgQW5kIGFkZCBp
dCBoZXJlOiANCiAgICBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy94ODYtcG93ZXItY29udHJv
bC9ibG9iL21hc3Rlci9wb3dlci1jb250cm9sLXg4Ni9zcmMvcG93ZXJfY29udHJvbC5jcHAjTDkz
Mg0KDQpJIGFscmVhZHkgZGlkIHRoYXQgYXMgYSB3b3JrIGFyb3VuZCwgdGVzdGluZyBkaWZmZXJl
bnQgc2NlbmFyaW8uIFdpbGwgc2VuZCBwYXRjaCBvbmNlIEkgc2VlIGl0IHdvcmtpbmcuDQoNCkkg
YWxzbyB3YW50IHRvIG1ha2UgdGhlc2UgdGltZW91dCB2YWx1ZXMgYXMgY29uZmlndXJhYmxlLCBl
aXRoZXIgSSBjYW4gYWRkIHRoZXNlIGFzIGEgcHJvcGVydHkgaW4gZGJ1cyBpbnRlcmZhY2Ugb3Ig
DQpFbnRpdHktbWFuYWdlciBvciBoYXZlIGEgc2VwYXJhdGUgY29uZmlnIGpzb24gZmlsZS4gV2hh
dCB3b3VsZCB5b3UgcHJlZmVyLg0KDQogICAgDQogICAgPiAgICAgIA0KICAgID4gDQogICAgDQoN
Cg==
