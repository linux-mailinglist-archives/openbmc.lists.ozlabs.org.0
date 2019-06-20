Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE32D4C571
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 04:29:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Tm3q71PYzDqvg
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 12:29:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=10748cf007=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="rOX/9m6l"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="Zg+9Wvx2"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tm335txwzDqsM;
 Thu, 20 Jun 2019 12:28:43 +1000 (AEST)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5K2DA1I000522; Wed, 19 Jun 2019 19:28:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=U7QIe/oedTOCkkD3V2c/L4NT3fkYvZQFGhmGvyB0oy0=;
 b=rOX/9m6lwdo5sFF6ntlgJbg9pK7xDD5NCuAepllr1oQBIs2eRKhrxGIZm1dUs4xgi/qj
 hJwbI7G7Fx3kuM29/u618PVd63pwBINvtFLgZJM4hjt41qJD1Eycvm4xKgc2aZa91Bmd
 Ml3AZ2KMH+HkOqEyWu8flPSmQQ4R0aEwRFg= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2t7wwcgn09-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 19 Jun 2019 19:28:08 -0700
Received: from prn-mbx03.TheFacebook.com (2620:10d:c081:6::17) by
 prn-hub03.TheFacebook.com (2620:10d:c081:35::127) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Wed, 19 Jun 2019 19:28:07 -0700
Received: from prn-hub01.TheFacebook.com (2620:10d:c081:35::125) by
 prn-mbx03.TheFacebook.com (2620:10d:c081:6::17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Wed, 19 Jun 2019 19:28:07 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Wed, 19 Jun 2019 19:28:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7QIe/oedTOCkkD3V2c/L4NT3fkYvZQFGhmGvyB0oy0=;
 b=Zg+9Wvx2ZDh8OFUmlhf1eHKzgZdRdbYF5hp4X9BvW6q7Qb8OGjaBOc6YXdFBb30URImUL1ZbsXnRvhb/NrEnIvu+v8ElYkA0P+OO67O0LGpMITTzd4xTmx5ORfP9c3R4e/WI68cXpxqN4qjPAEJGTMUggCOdcte0NrnYSdGJssI=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1342.namprd15.prod.outlook.com (10.175.2.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.13; Thu, 20 Jun 2019 02:28:06 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::d51f:8f19:e2b5:3ae8]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::d51f:8f19:e2b5:3ae8%6]) with mapi id 15.20.1987.014; Thu, 20 Jun 2019
 02:28:06 +0000
From: Tao Ren <taoren@fb.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Brendan Higgins
 <brendanhiggins@google.com>
Subject: Re: [PATCH 1/2] i2c: aspeed: allow to customize base clock divisor
Thread-Topic: [PATCH 1/2] i2c: aspeed: allow to customize base clock divisor
Thread-Index: AQHVJuIcteG+E70PmUey9PLXreYJ5KajfUSAgAASwwCAAAhQgIAAOXUA
Date: Thu, 20 Jun 2019 02:28:06 +0000
Message-ID: <aefd4de2-31b4-1332-7cc0-92cc04fea045@fb.com>
References: <20190619205009.4176588-1-taoren@fb.com>
 <CAFd5g45TMtXcuqONdkpN_K+c0O+wUw8wkGzcQfV+sO8p5Krc9w@mail.gmail.com>
 <18565fcf-3dc1-b671-f826-e4417e4ad284@fb.com>
 <4c8b9ca5e84db7db67ad552d8fdbaa17d11b6432.camel@kernel.crashing.org>
In-Reply-To: <4c8b9ca5e84db7db67ad552d8fdbaa17d11b6432.camel@kernel.crashing.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CO2PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:102:2::12) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::3:2141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e7b35a4-cbae-4293-2c53-08d6f526ed1b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1342; 
x-ms-traffictypediagnostic: MWHPR15MB1342:
x-microsoft-antispam-prvs: <MWHPR15MB134285666109EE5373AC1952B2E40@MWHPR15MB1342.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(396003)(346002)(39860400002)(376002)(366004)(189003)(199004)(256004)(52116002)(8676002)(99286004)(64756008)(36756003)(68736007)(66476007)(66446008)(11346002)(478600001)(6512007)(66556008)(65826007)(25786009)(46003)(53936002)(305945005)(6246003)(53546011)(31686004)(7416002)(4326008)(476003)(14454004)(71190400001)(7736002)(71200400001)(6116002)(2616005)(486006)(14444005)(31696002)(446003)(65956001)(316002)(64126003)(81166006)(66946007)(2906002)(73956011)(102836004)(86362001)(76176011)(6436002)(229853002)(386003)(6506007)(54906003)(8936002)(58126008)(65806001)(110136005)(81156014)(5660300002)(6486002)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1342;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: teF2a2zJwfvQAcieCDNmss28ILqu6fJHTLbuBkH+MpEjpkCsKdQ9gO/FkKNzhmad92HmbuH3Am9WbWrnfa8ouL3J78anFTkAogAytEpzX7wkvfC7tkXKnEbZiPCmxT9h56zAExqJU417oZ6hfwiHdsZv9O5NdMPCW9hDBrhrP3CDfTxkjaelZIxXqIoXlsD0d8SikONN7Vk25Fam5mW7mdbS0La8G2oTLNTgDBI/oEx1yRAp20LpAz3oByQnMSzYmkMf3fDeC/TDhZCYMCkDS2rzJyTp7E1TzJVSA7mzWeGjcg6j4JTB51QluvGr7U05fa+zHvN4kE93uPXjI1gJmyB9/O6qYBUpqzwoWwm9mZKcTGAm6rTULUj64ZIPaobLyCl8ipJjtrYOHVnB7gumN6Ly8qJNox+Kov8rW5Y4fTY=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8840564E23F9E849A053530EEF97466C@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e7b35a4-cbae-4293-2c53-08d6f526ed1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 02:28:06.1252 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: taoren@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1342
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-20_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906200016
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
 "ryan_chen@aspeedtech.com" <ryan_chen@aspeedtech.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC
 Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gNi8xOS8xOSA0OjAyIFBNLCBCZW5qYW1pbiBIZXJyZW5zY2htaWR0IHdyb3RlOg0KPiBPbiBX
ZWQsIDIwMTktMDYtMTkgYXQgMjI6MzIgKzAwMDAsIFRhbyBSZW4gd3JvdGU6DQo+PiBUaGFuayB5
b3UgZm9yIHRoZSBxdWljayByZXNwb25zZSwgQnJlbmRhbi4NCj4+DQo+PiBBc3BlZWQgSTJDIGJ1
cyBmcmVxdWVuY3kgaXMgZGVmaW5lZCBieSAzIHBhcmFtZXRlcnMNCj4+IChiYXNlX2Nsa19kaXZp
c29yLCBjbGtfaGlnaF93aWR0aCwgY2xrX2xvd193aWR0aCksIGFuZCBJIGNob29zZQ0KPj4gYmFz
ZV9jbGtfZGl2aXNvciBiZWNhdXNlIGl0IGNvbnRyb2xzIGFsbCB0aGUgQXNwZWVkIEkyQyB0aW1p
bmdzIChzdWNoDQo+PiBhcyBzZXR1cCB0aW1lIGFuZCBob2xkIHRpbWUpLiBPbmNlIGJhc2VfY2xr
X2Rpdmlzb3IgaXMgZGVjaWRlZA0KPj4gKGVpdGhlciBieSB0aGUgY3VycmVudCBsb2dpYyBpbiBp
MmMtYXNwZWVkIGRyaXZlciBvciBtYW51YWxseSBzZXQgaW4NCj4+IGRldmljZSB0cmVlKSwgY2xr
X2hpZ2hfd2lkdGggYW5kIGNsa19sb3dfd2lkdGggd2lsbCBiZSBjYWxjdWxhdGVkIGJ5DQo+PiBp
MmMtYXNwZWVkIGRyaXZlciB0byBtZWV0IHRoZSBzcGVjaWZpZWQgSTJDIGJ1cyBzcGVlZC4NCj4+
DQo+PiBGb3IgZXhhbXBsZSwgYnkgc2V0dGluZyBJMkMgYnVzIGZyZXF1ZW5jeSB0byAxMDBLSHog
b24gQVNUMjUwMA0KPj4gcGxhdGZvcm0sIChiYXNlX2Nsb2NrX2Rpdmlzb3IsIGNsa19oaWdoX3dp
ZHRoLCBjbGtfbG93X3dpZHRoKSBpcyBzZXQNCj4+IHRvICgzLCAxNSwgMTQpIGJ5IG91ciBkcml2
ZXIuIEJ1dCBzb21lIHNsYXZlIGRldmljZXMgKG9uIENNTSBpMmMtOA0KPj4gYW5kIE1pbmlwYWNr
IGkyYy0wKSBOQUNLIGJ5dGUgdHJhbnNhY3Rpb25zIHdpdGggdGhlIGRlZmF1bHQgdGltaW5nDQo+
PiBzZXR0aW5nOiB0aGUgaXNzdWUgY2FuIGJlIHJlc29sdmVkIGJ5IHNldHRpbmcgYmFzZV9jbGtf
ZGl2aXNvciB0byA0LA0KPj4gYW5kIChjbGtfaGlnaF93aWR0aCwgY2xrX2xvd193aWR0aCkgd2ls
bCBiZSBzZXQgdG8gKDcsIDcpIGJ5IG91ciBpMmMtDQo+PiBhc3BlZWQgZHJpdmVyIHRvIGFjaGll
dmUgc2ltaWxhciBJMkMgYnVzIHNwZWVkLg0KPj4NCj4+IE5vdCBzdXJlIGlmIG15IGFuc3dlciBo
ZWxwcyB0byBhZGRyZXNzIHlvdXIgY29uY2VybnMsIGJ1dCBraW5kbHkgbGV0DQo+PiBtZSBrbm93
IGlmIHlvdSBoYXZlIGZ1cnRoZXIgcXVlc3Rpb25zL3N1Z2dlc3Rpb25zLg0KPiANCj4gRGlkIHlv
dSBsb29rIGF0IHRoZSByZXN1bHRpbmcgb3V0cHV0IG9uIGEgc2NvcGUgPyBJJ20gY3VyaW91cyB3
aGF0DQo+IG1pZ2h0IGJlIHdyb25nLi4uLiANCj4gDQo+IENDaW5nIFJ5YW4gZnJvbSBBc3BlZWQs
IGhlIG1pZ2h0IGhhdmUgc29tZSBpZGVhLg0KPiANCj4gQ291bGQgaXQgYmUgdGhhdCB3aXRoIHNv
bWUgc3BlY2lmaWMgZGl2aWRlcnMgeW91IGhhdmUgbW9yZSBqaXR0ZXIgPw0KPiBTdGlsbCwgaTJj
IGRldmljZXMgdGVuZCB0byBiZSByYXRoZXIgcm9idXN0IHZzIGNyYXBweSBjbG9ja3MgdW5sZXNz
IHlvdQ0KPiBhcmUgbWFzc2l2ZWx5IG91dCBvZiBib3VuZHMsIHdoaWNoIG1ha2VzIG1lIHdvbmRl
ciB3aGV0aGVyIHNvbWV0aGluZw0KPiBlbHNlIG1pZ2h0IGJlIHdyb25nIGluIHlvdXIgc2V0dXAu
DQo+IA0KPiBDaGVlcnMsDQo+IEJlbi4NCg0KSSd2ZSByZWFjaGVkIG91dCB0byBoYXJkd2FyZSB0
ZWFtIHRvIHNlZSBpZiB0aGV5IGNhbiBwcm92aWRlIG1vcmUgaW5wdXRzIChzdWNoIGFzIHByb3Rv
Y29sIGRlY29kZXIgb3V0cHV0KSBidXQgc28gZmFyIEkgZG9uJ3QgaGF2ZSBzdWNoIGRhdGEuIEkn
bSBzdXNwZWN0aW5nIGl0J3MgY2F1c2VkIGJ5IEkyQyB0aW1pbmcgbWFpbmx5IGJlY2F1c2U6DQoN
CjEpIHRoZSBpbnRlcm1pdHRlbnQgaTJjIHRyYW5zYWN0aW9uIGZhaWx1cmVzIGFsd2F5cyBoYXBw
ZW4gdG8gc2xhdmUgZGV2aWNlcyB3aGljaCBhcmUgZnVydGhlc3QgYXdheSBmcm9tIEFTUEVFRCBj
aGlwLg0KDQoyKSBBcyB0aGUgaTJjLWFzcGVlZCBkcml2ZXIgaW4gbXkga2VybmVsIDQuMSB0cmVl
IChkZXJpdmVkIGZyb20gQVNQRUVEIFNESykgd29ya3MgcHJvcGVybHksIGFuZCBJIGNvcGllZCBJ
MkNEMDQgKENsb2NrIGFuZCBBQyBUaW1pbmcgQ29udHJvbCkgcmVnaXN0ZXIgdmFsdWUgZnJvbSBr
ZXJuZWwgNC4xIGFuZCBhcHBsaWVkIHRvIHRoZSBsYXRlc3QgdXBzdHJlYW0gZHJpdmVyOiB0aGUg
dHJhbnNhY3Rpb24gZmFpbHVyZSBpcyBmaXhlZCA6KQ0KDQpUaGFuayB5b3UgQmVuIGZvciBsb29r
aW5nIGludG8gdGhlIGlzc3VlIGFuZCBpbnZvbHZpbmcgbW9yZSBleHBlcnRzIChSeWFuKSBmb3Ig
ZGlzY3Vzc2lvbi4gSSBoYXZlIGJlZW4gc3VmZmVyaW5nIGZyb20gdGhlIHByb2JsZW0gZm9yIHNl
dmVyYWwgbW9udGhzIGFuZCBJJ20gbG9va2luZyBmb3J3YXJkIGZvciBwcm9wZXIvcmlnaHQgc29s
dXRpb25zLg0KDQoNCkNoZWVycywNCg0KVGFvDQoNCg0K
