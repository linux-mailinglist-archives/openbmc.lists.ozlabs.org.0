Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C95E6757BE
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2019 21:20:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vhrC06myzDqQP
	for <lists+openbmc@lfdr.de>; Fri, 26 Jul 2019 05:20:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=2109d0fdfc=wilfredsmith@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="oKY/eAH7"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="Ji02HtNF"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vhqT5QcyzDqPn
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jul 2019 05:19:45 +1000 (AEST)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6PJHftd013230; Thu, 25 Jul 2019 12:19:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=antVaV8OoGAg9URcctFbvoYuwQd/81+MhTzUOqMTtP0=;
 b=oKY/eAH7B4ms8xGEES8fSM6qfkBS2qrE/n1K583Rf7hWjr8omK4uXLPS6xfFcsHRYPpA
 1jbC1vix6bL2jmJkAluU2Anh5yBE2HxdIDIYx0NJhjzyLWEn8Bhr1Ycmb2EkfOVW+hW2
 qLsfGuSPIoezpRx5fPAttKt4VoesqIxBGxI= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2tyg980tgp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 25 Jul 2019 12:19:35 -0700
Received: from prn-hub01.TheFacebook.com (2620:10d:c081:35::125) by
 prn-hub02.TheFacebook.com (2620:10d:c081:35::126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Thu, 25 Jul 2019 12:19:35 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Thu, 25 Jul 2019 12:19:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BfONykeOuAUn0dd0A8HEzsfWZRklLeMk2BoLvUgo2k6GdYpaWc9rUaEPPrdc1XGQNrHIjdAZha3gAf/66YBmd5rLoeqH69/49Zi5HjKyhQ9aT5SwiWfD7lht9fWUJqyWAHNz0g2rPVs22nzI+aLifveI4de+cVWhMCwfgwg+ZSXat4iFgMkH3a7huyZqK66J0WRVJQvhh8SEDsAHs9hPMX822wXRlIvBNrF+pjtief2bD/mqw1dwOs1uYjo3ULcEhcC8NuQx21E/QNdu+xGEvQ1hL94l2t77swicMtZHc8+w+kV1RA5pjkdsTlySLLDBXBYsjUS9hkVcq5v+zEi/EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=antVaV8OoGAg9URcctFbvoYuwQd/81+MhTzUOqMTtP0=;
 b=Ja9oXqaeorf7AsS+gS/GDG0JaBgToSTbc/B4xhdt5ztK0fBOHEinXnP1Y6w/W4DLQ5kaweAJrD2sPW6rT9rk6HtVhytBzeFcY9FKrRT4ZOfcdkaMqqxdx+ktZsf/iwEx5TMu5uwYwI6h558zG1ZX6jEezeFHd5YcaJ3L/qc4BRS3SUnXtCikKwHO73QVV6V2ZoIUCEbh3tuMoMYxs7vnU40S/MZwO3se4DdwYHEaogzg0NH8UXmgwC1cbmTeETonPP2ALdmcQpVL8mwSwxvhYZd7U2mW1P3v6RTcZX4Zs3Rc4GbflQKc3ieobNV+cCGv88w56yVJN0GA2FCn01mXIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=fb.com;dmarc=pass action=none header.from=fb.com;dkim=pass
 header.d=fb.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=antVaV8OoGAg9URcctFbvoYuwQd/81+MhTzUOqMTtP0=;
 b=Ji02HtNFNWfUZSLqxxi5Ega19tSnYBWVqLTtTU5m4UqRP2T3Nk2/kXu0mVw/DuGskzqm/X6QxSvxvlcSffRiyLU7GkbvqdE7lVHCs2e6J0g17VvrK0XrawzV8ehANXSa+BkR3mX/hiAiWm705/arwS9K+0//hzoWOn0Zdle8fDQ=
Received: from MN2PR15MB3680.namprd15.prod.outlook.com (52.132.173.209) by
 MN2PR15MB2653.namprd15.prod.outlook.com (20.179.144.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Thu, 25 Jul 2019 19:19:33 +0000
Received: from MN2PR15MB3680.namprd15.prod.outlook.com
 ([fe80::85cb:7a62:4c8f:116a]) by MN2PR15MB3680.namprd15.prod.outlook.com
 ([fe80::85cb:7a62:4c8f:116a%5]) with mapi id 15.20.2115.005; Thu, 25 Jul 2019
 19:19:33 +0000
From: Wilfred Smith <wilfredsmith@fb.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: CLI Tools
Thread-Topic: CLI Tools
Thread-Index: AQHVQaTlrUxs1y7ZuEudkvEzdm/lfqbaj2aAgAAO2QCAAAgcgIABEiKA
Date: Thu, 25 Jul 2019 19:19:33 +0000
Message-ID: <7AF31809-55BF-4F0A-B2C4-A56A21BE1F5F@fb.com>
References: <904952B3-C01C-489C-BDD6-AB96F6734201@fb.com>
 <dd457a99-5202-415c-abb6-b4fad030e9ee@www.fastmail.com>
 <20190725022922.dqwkb2g4djsnobnw@thinkpad.dyn.fuzziesquirrel.com>
 <51140097-5a0b-4f5a-a198-c2c76b1013b9@www.fastmail.com>
In-Reply-To: <51140097-5a0b-4f5a-a198-c2c76b1013b9@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:15eb]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 40e4cca4-3ad1-4cdf-464c-08d7113506b2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR15MB2653; 
x-ms-traffictypediagnostic: MN2PR15MB2653:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR15MB2653BDD8E5AD72C06AC644B1BDC10@MN2PR15MB2653.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(136003)(366004)(376002)(346002)(39860400002)(51914003)(199004)(189003)(966005)(53936002)(76116006)(91956017)(6436002)(6506007)(102836004)(7116003)(86362001)(478600001)(229853002)(64756008)(4326008)(5660300002)(53546011)(11346002)(25786009)(2906002)(6306002)(66946007)(6512007)(221733001)(14454004)(6486002)(66446008)(66556008)(66476007)(486006)(3480700005)(99286004)(14444005)(76176011)(33656002)(6246003)(2616005)(7736002)(316002)(6116002)(54906003)(8676002)(6916009)(81156014)(81166006)(46003)(68736007)(8936002)(71200400001)(256004)(71190400001)(186003)(476003)(36756003)(305945005)(446003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR15MB2653;
 H:MN2PR15MB3680.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tO66OBsNN6BDqSsxK190CewAXqgS2UaApwRKmZLXjCyvnsGthI5P2EYD4Bkz/G2c5Z+nMgPZQAhmJTPRC7eslD1kyRuvv9GIrxFuIqGcUaL0TwqaFeVL0T0ZlzxdyS7DcDr33iQkjaqzvl6hZyVTyb3OlZTpM97EOeFkNOy+fwpgIR6pvylmqqYxYkocHo2Z6rtq4dJae69u8xi6uO6igqzDzXxC8Z2P/gHRnZsm/0klWwjdfv4/7kmQpKT4ZMSywFyy3oTmkBku4I883zTt2bLWdif6ZckxgMvZukFdoI8yb8JcaAODQElp7CTsA5erWkc6QnVKYzhLHtd0NO7sZ1xeoZsdpDTyBnRjZE+JbmXqMGhz0voj/6d+uc4zavfQuldgS20AKEqDp7Eqm+TRu7E6gPdVy0LFhm5yNRgAL6g=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E81986E7078FCA4481DF5D08234FC0DB@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 40e4cca4-3ad1-4cdf-464c-08d7113506b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 19:19:33.8320 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wilfredsmith@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR15MB2653
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-25_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907250229
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

QWxsLA0KDQpJ4oCZbSBub3Qgc3VyZSB3aGF0IE9wZW5CTUPigJlzIG9yIEZhY2Vib29r4oCZcyBv
ZmZpY2lhbCBzdGFuY2Ugb24gQ0xJIGlzLCBzbyBjb25zaWRlciB0aGlzIGNvbW1lbnQgdG8gYmUg
YSDigJxzaG90IGZyb20gdGhlIGhpcOKAnSBvZiBzb21lb25lIHdobyBtZWFucyB3ZWxsLg0KDQpJ
dCBzZWVtcyB0byBtZSB0aGF0IGF0IGxlYXN0IHRocmVlIGJ1enp3b3JkcyByZXF1aXJlIGludm9j
YXRpb246IGNvbnNpc3RlbmN5LCBkaXNjb3ZlcmFiaWxpdHkgYW5kIGF1dG9tYXRpb24uIE9idmlv
dXNseSBhbnkgZGV2ZWxvcGVyIHdobyBjYXJlcyBlbm91Z2ggdG8gcGx1bWIgdGhlIGJvd2VscyBv
ZiBhIHZlbmRvcuKAmXMgRC1idXMgaW1wbGVtZW50YXRpb24gY2FuIHdyaXRlIGhpcyBvd24gdXRp
bGl0aWVzIGFuZCBoYXMgbWFueSBtZWFucyBvZiBhY2NvbXBsaXNoaW5nIGhpcyBvYmplY3RpdmVz
LiBCdXQgdGhvc2UgYXJlYXMgYXJlIGNyaXRpY2FsIGZvciB0aGUgZGV2b3Agd2hvIGp1c3QgbmVl
ZHMgdG8gZ2V0IGEgdGFzayBkb25lIGFuZCBjYXJlcyBsaXR0bGUgYWJvdXQgYSBwYXJ0aWN1bGFy
IHZlbmRvcuKAmXMgaW1wbGVtZW50YXRpb24uDQoNCjEuIEl0IHdvdWxkIGJlIGdvb2QgdG8gYWdy
ZWUgb24gYSBzZXQgb2YgY29tbW9uLCBzaW1wbGlmaWVkIGNvbW1hbmRzIGZvciBrZXkgb3BlcmF0
aW9ucyB0aGF0IGRvIG5vdCBpbXBvc2UgYSBzdGVlcCBsZWFybmluZyBjdXJ2ZS4gKENvbW1pdHRp
bmcg4oCcZGlzYWJsZSBhdXRvLXJlYm9vdOKAnSB0byBtZW1vcnkgaXMgcmVhc29uYWJsZTsgY29t
bWl0dGluZyDigJxidXNjdGwg4oCmbG9uZyBoaWVyYXJjaGljYWwgcGF0aOKApjE1IHBhcmFtZXRl
cnPigJ0gaXMgbm90KQ0KMi4gSXQgd291bGQgYmUgZ29vZCB0byBoYXZlIGEgY29tbW9uIG1lYW5z
IG9mIGRpc2NvdmVyaW5nIHRoZSBhdmFpbGFibGUgdG9vbChzKSwgdGhlaXIgbW9zdCBjb21tb24g
dXNhZ2VzIGFuZCBhZGFwdGF0aW9ucy4g4oCmcG9zc2libHkgYXMgc2ltcGxlIGFzIGhhdmluZyBh
IGdvb2QgYmFzZSDigJxtYW7igJ0gcGFnZSB0aGF0IHZlbmRvcnMgY2FuIGFkYXB0LiAoaXTigJlz
IDMgQU0sIHRoZXJl4oCZcyBhIHBvd2VyIGdyaWQgZmFpbHVyZSBhbmQgeW91IG5lZWQgdG8gcmVj
b3ZlciBmcm9tIGEgY2x1c3RlciBmYXVsdCB3aXRob3V0IGRvaW5nIGEgR29vZ2xlIHNlYXJjaOKA
pmNhbiB5b3UgZmlndXJlIGl0IG91dCwgZXZlbiBpZiB5b3XigJl2ZSBuZXZlciBkb25lIGl0IGJl
Zm9yZT8pDQozLiBUbyBlbmFibGUgYXV0b21hdGlvbiBpbiBwcm9kdWN0aW9uLCB0aGUgY29tbWFu
ZHMgc2hvdWxkIGJlIHNjcmlwdGFibGUgYW5kIHRoZSBtZWFucyBvZiBjYXRjaGluZyBhbmQgaGFu
ZGxpbmcgZXJyb3JzIHNob3VsZCBiZSB3ZWxsLWRlZmluZWQuIChUaGFua3MgZm9yIHRoZSBleGl0
IGNvZGUgMSwgSSBrbm93IOKAnHNvbWV0aGluZ+KAnSBpcyB3cm9uZ+KApmxldCBtZSBkZXRlcm1p
bmUg4oCcWW91IGNhbuKAmXQgcmVjb25maWd1cmUgdGhlIEZDb0UgY29ubmVjdGlvbiBiZWNhdXNl
IHRoZSBOSUMgaXMgb2ZmbGluZeKAnSBhbmQgYWxsb3cgYSBzY3JpcHQgdG8gZGV0ZWN0IHRoYXQs
IGVuYWJsZSB0aGUgTklDIGFuZCBjYXJyeSBvbikuDQo0LiBGdXJ0aGVyLCBJIHRoaW5rIG9ibWN1
dGlsIHNob3VsZCBiZSBleHRlbnNpYmxlIGluIGEgbWFubmVyIGNvbXBhdGlibGUgd2l0aCBCaXRi
YWtlIGxheWVycy4gVGhpcyBtYXkgYXZlcnQgdGhlIHByb2xpZmVyYXRpb24gb2YgdmVuZG9yLXNw
ZWNpZmljLCBpbmNvbXBhdGlibGUsIGZ1bmN0aW9uYWxseSBkaWZmZXJpbmcgdG9vbHMuIEl0IHNo
b3VsZCBiZSBhIGZyYW1ld29yayB0aGF0IG1ha2VzIGl0IGVhc2llciB0byBkZXZlbG9wIGFuZCBl
eHRlbmQgY29tcGxpYW50IHRvb2xzIHRoYW4gdG8gcm9sbCDigJxBbmR5LWRiZy1udm1lLWNmZ+KA
nQ0KDQpXaWxmcmVkIA0KDQoNCg0KPiBPbiBKdWwgMjQsIDIwMTksIGF0IDc6NTggUE0sIEFuZHJl
dyBKZWZmZXJ5IDxhbmRyZXdAYWouaWQuYXU+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiBUaHUs
IDI1IEp1bCAyMDE5LCBhdCAxMTo1OCwgQnJhZCBCaXNob3Agd3JvdGU6DQo+PiBPbiBUaHUsIEp1
bCAyNSwgMjAxOSBhdCAxMTowNjoxM0FNICswOTMwLCBBbmRyZXcgSmVmZmVyeSB3cm90ZToNCj4+
PiBIaSBXaWxmcmVkLA0KPj4+IA0KPj4+IE9uIFdlZCwgMjQgSnVsIDIwMTksIGF0IDE0OjA0LCBX
aWxmcmVkIFNtaXRoIHdyb3RlOg0KPj4+PiBUaGVyZSB3YXMgYSBkaXNjdXNzaW9uIGEgd2hpbGUg
YmFjayAoMiB5ZWFycyBhZ28/IEluDQo+Pj4+IGh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50
LmNvbS92Mi91cmw/dT1odHRwcy0zQV9fbGlzdHMub3psYWJzLm9yZ19waXBlcm1haWxfb3BlbmJt
Y18yMDE2LTJETm92ZW1iZXJfMDA1MzA3Lmh0bWwmZD1Ed0lGYVEmYz01VkQwUlR0TmxUaDN5Y2Q0
MWIzTVV3JnI9LWVrdFQtdEQ5emYycmZVaXNFNjNScWlEYWdHeWhHZXkyaGJFR2EtNDdrYyZtPXow
RUVJcG82azR5UXhWdFQxNHZoa3F4SERweXl5bXdqNFU4cDVncE8xNDAmcz1LcjJuQW4yeGxYZkVj
MFdGYWVtbURtZTY2bnlWMkZISTZrZzlXUnJtZHNjJmU9ICkNCj4+Pj4gd2hlcmUgdGhlIE9QIChQ
YXRyaWNrIFdpbGxpYW1zKSBleHByZXNzZWQgY29uY2VybiBvdmVyIHRoZQ0KPj4+PiBwcm9saWZl
cmF0aW9uIG9mIGNvbW1hbmQgbGluZSB0b29scy4gUGF0cmlja+KAmXMgaW50ZXJlc3QgaW52b2x2
ZWQgaG93IHRvDQo+Pj4+IGludGVncmF0ZSBpb3Rvb2xzLiBPdGhlcnMgY2hpbWVkIGluIHF1ZXN0
aW9uaW5nIHdoZXRoZXIgaXTigJlzIGJldHRlciB0bw0KPj4+PiBwcm92aWRlIGNvbXBhY3QgY29t
bWFuZHMgZm9yIGNvbW1vbiBuZWVkcyBvciBlbmNvdXJhZ2UgZXhwbG9yYXRpb24gYnkNCj4+Pj4g
cmVxdWlyaW5nIGxvbmdoYW5kLiBQYXRyaWNrIGlucXVpcmVkIGFib3V0IHRoZSB0YXJnZXQgYXVk
aWVuY2UgZm9yIHRoZQ0KPj4+PiB0b29scy4NCj4+PiANCj4+PiBJJ20gYWxsIGZvciBoZWxwZXJz
IGZvciBjb21tb24gdGFza3MuIElmIHdlIGNhbiBpbnRlZ3JhdGUgdGhlbSBpbnRvIG9ibWN1dGls
DQo+Pj4gdGhhdCB3b3VsZCBiZSBpZGVhbC4gVGhlIGFsdGVybmF0aXZlIGlzIHRoYXQgd2UgcmVx
dWlyZSBwZW9wbGUgd3JpdGUgdGhpbmdzIGxpa2U6DQo+Pj4gDQo+Pj4gIyBidXNjdGwgc2V0LXBy
b3BlcnR5IGBtYXBwZXIgZ2V0LXNlcnZpY2UgL3h5ei9vcGVuYm1jX3Byb2plY3QvY29udHJvbC9o
b3N0MC9hdXRvX3JlYm9vdGAgL3h5ei9vcGVuYm1jX3Byb2plY3QvY29udHJvbC9ob3N0MC9hdXRv
X3JlYm9vdCB4eXoub3BlbmJtY19wcm9qZWN0LkNvbnRyb2wuQm9vdC5SZWJvb3RQb2xpY3kgQXV0
b1JlYm9vdCBiIGZhbHNlDQo+Pj4gDQo+Pj4gdG8gZGlzYWJsZSBhdXRvLXJlYm9vdCBvcg0KPj4+
IA0KPj4+ICMgYnVzY3RsIHNldC1wcm9wZXJ0eSB4eXoub3BlbmJtY19wcm9qZWN0Lk5ldHdvcmsg
L3h5ei9vcGVuYm1jX3Byb2plY3QvbmV0d29yay9ldGgwIHh5ei5vcGVuYm1jX3Byb2plY3QuTmV0
d29yay5FdGhlcm5ldEludGVyZmFjZSBESENQRW5hYmxlZCBiIDENCj4+PiANCj4+PiB0byBzd2l0
Y2ggREhDUCBvbi4gUXVpdGUgZnJhbmtseSB0aGF0J3MgYSByaWRpY3Vsb3VzIHJlcXVpcmVtZW50
IHRvIGZvcmNlIG9uDQo+Pj4gZXZlcnlvbmUuDQo+PiANCj4+IFllYXJzIGFnbyB3aGVuIFBhdHJp
Y2sgd3JvdGUgdGhlIHJlZmVyZW5jZWQgbm90ZSwgdGhlIGJlbGllZiB3YXMgdGhhdCANCj4+IHRo
ZSBPcGVuQk1DIERCdXMgQVBJIHdvdWxkIGJlIHN0YWJsZS4gIEJ1dCB0aGF0IHRoaW5raW5nIGhh
cyBsb25nIHNpbmNlIA0KPj4gYmVlbiByZWplY3RlZCAtIHRoZSBPcGVuQk1DIERCdXMgaXMgbm90
IHN0YWJsZSBhbmQgYXMgc3VjaCBpdCBwcm9iYWJseSANCj4+IGRvZXNuJ3QgbWFrZSBzZW5zZSB0
byBiZSBzaGFyaW5nIGl0ICh2aWEgYnVzY3RsIGNvbW1hbmRzKSB3aXRoIG91ciANCj4+IHVzZXJz
Pw0KPiANCj4gWWVhaCwgbGlmdGluZyBhbiBvYm1jdXRpbCBpbnRlcmZhY2UgdG8gcmVwcmVzZW50
IHNvbWV0aGluZyB1c2VycyB3YW50IHRvDQo+IGFjaGlldmUgKGBvYm1jdXRpbCBkaGNwIGVuYWJs
ZWApIHJhdGhlciB0aGFuIGV4cG9zaW5nIGltcGxlbWVudGF0aW9uDQo+IGRldGFpbHMgd291bGQg
YmUgYSB3aW4uDQo+IA0KPj4gDQo+Pj4gDQo+Pj4gSGF2aW5nIHNhaWQgdGhhdCBzb21lIG9mIHRo
ZXNlIGFscmVhZHkgaGF2ZSBzaG9ydGN1dHMsIHN1Y2ggYXMNCj4+PiANCj4+PiAjIHN5c3RlbWN0
bCBzdG9wIGhvc3QtZmFpbHVyZS1yZWJvb3RzQDANCj4+IA0KPj4gSXQgbWlnaHQgYWxyZWFkeSBi
ZSB0b28gbGF0ZSwgYnV0IHdlIHByb2JhYmx5IHNob3VsZCBub3QgaGF2ZSBwcmVzZW50ZWQgDQo+
PiBzeXN0ZW1jdGwgY29tbWFuZHMgYXMgc3RhYmxlIGludGVyZmFjZXMgZm9yIG91ciB1c2VycyBl
aXRoZXIsIGZvciB0aGUgDQo+PiBzYW1lIHJlYXNvbnMgYXMgSSd2ZSBtZW50aW9uZWQgYWJvdmUu
DQo+IA0KPiBSaWdodC4NCj4gDQo+IEFuZHJldw0KDQo=
