Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D8619B4B9
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 19:34:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48stby6zmxzDr8H
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 04:34:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=1360369fbe=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=fOX/9oUV; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=XiCbwvRE; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48stZg2SzlzDr3D;
 Thu,  2 Apr 2020 04:33:13 +1100 (AEDT)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 031HUx20031105; Wed, 1 Apr 2020 10:33:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=HwNU+ct4u0SQ+XlDd7iDo6HAs5Z7jJc7zCpud1nC5gM=;
 b=fOX/9oUV9sVJ705bKjRemsWz2FQw2KIRuj+gaSkFagGeheZBlGh4a8LJ8Zl2g6zL4ELW
 k7zAg57II+taYhziI6fUg3SBxO+KydDcjMdifTWpw/aiAh/bWYwjDnFp7XWeh4s4x1rD
 smyLny82N24OTwmYMq4qipWGpHUnjvZSOGA= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 303d0j8005-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 01 Apr 2020 10:33:03 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.102) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Wed, 1 Apr 2020 10:33:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iG8B3p2j0KqFg9fF1ApA9D52G8Ie7g8dR+cZeol7FOEghoH9BqXtFYm8elHNHxLsMwjS2Pct3yeHboJDhYIUJB7F4LVjMjAzt128sfImKlsp48V9p/Lgsp1ze4XM2jMRwXhhRRIozVv7tmibRMVsBBMM4dcwIlGhUfkLXoV4GeDCEC2pPhdd8GWISyW8iHHXgbXV9BiTDST3PnXjCkukEFi6CHYWjYLpui13orWjqL5jhvOFAz/tRHLDbLc2SDL3rsiVBZ2SavHvDEXXCDs1O99AXha4TCjGlLtYiBIXVF2L+WzDcwVG/y6FVmrCWY3Vv7pGk9fkzLh6A1sTLOGODw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HwNU+ct4u0SQ+XlDd7iDo6HAs5Z7jJc7zCpud1nC5gM=;
 b=Q8Lm4XPrbka7qU3twqEjvZps0SqPAnG0obY5V2tsp19vFMob7xyPHw2bRlnbytRR9WTwFX7VoKDznrQw98WgEJrSi6OEDqABkIKnKiPcfbB5zmNdeg0EVAXUJC9FwWfJWrNX9MOwMfGOrbQo6h/0RJyQwxdpNaHRLeGAhX/czPnqnRpSscVGo0CeYdXg4e/+3OuVjlLhRir2Xsq0G3o/km4rpY4/vRrxM0UwV9X6X/hE1WNUGGJYMreFoTidq4Xb33FLJtg0gVUopxgR9Gc0Zgv3Jqzu7q0IW66OOXqAUneYAAO6FE3jFUfNzp7vBlZ1SvqUqHdik+A4hSmZENwTQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HwNU+ct4u0SQ+XlDd7iDo6HAs5Z7jJc7zCpud1nC5gM=;
 b=XiCbwvRENJAjIamBai8XhZazZrTHovoleaCdZ76Ntyf0Gq8IPrHTfoVP7c90XU3A0QFko35IRlGae6ihh1LF6TNlyHf0dS6brUqZJfM977STmNMEw03uR4C4wMUJ2JWgh9J2+FK3r4r92PBg6Nlv/OjFshakyctLbj/J4I26EFI=
Received: from MW3PR15MB3947.namprd15.prod.outlook.com (2603:10b6:303:49::9)
 by MW3PR15MB4060.namprd15.prod.outlook.com (2603:10b6:303:4e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15; Wed, 1 Apr
 2020 17:33:01 +0000
Received: from MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936]) by MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936%4]) with mapi id 15.20.2856.019; Wed, 1 Apr 2020
 17:33:01 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>, "andrew@aj.id.au"
 <andrew@aj.id.au>, "joel@jms.id.au" <joel@jms.id.au>
Subject: Re: [PATCH v7] ARM: dts: aspeed: Adding Facebook Yosemite V2 BMC
Thread-Topic: [PATCH v7] ARM: dts: aspeed: Adding Facebook Yosemite V2 BMC
Thread-Index: AQHWCBpeweWL8h/MFEyTethCsbGKaahkEZ0A
Date: Wed, 1 Apr 2020 17:33:01 +0000
Message-ID: <7C091D02-98E8-4617-AA58-9714A8FC4EB0@fb.com>
References: <20200401114023.GA29180@cnn>
In-Reply-To: <20200401114023.GA29180@cnn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:9e22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f365ba4c-b739-4db2-03ed-08d7d662ba20
x-ms-traffictypediagnostic: MW3PR15MB4060:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW3PR15MB406046A76C23D48D9077C2C5DDC90@MW3PR15MB4060.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 03607C04F0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR15MB3947.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(346002)(396003)(136003)(39860400002)(376002)(366004)(47680400002)(6486002)(66476007)(186003)(316002)(2616005)(5660300002)(71200400001)(66946007)(66446008)(54906003)(81166006)(81156014)(4326008)(76116006)(8676002)(2906002)(6506007)(8936002)(86362001)(36756003)(6512007)(64756008)(478600001)(66556008)(33656002)(110136005);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: twT7HcOYm7lFPrR++TlxlhqJBrnMAliJH/ttFs3sMOSxJ3KgfpVwiJZvgaL0wU5484ju/i1F7WEX3s8vCErWJ4AcSEOcPErRXW1T2WbaJZSfM6YcTgLVZBNfhWJOMumf1Hl6Io0Lp4xNtIBelRY5grliSoIT2eKeShLL8sam9p4zT9ZDW2BnLuMzozhzvD4FUDS7JsQz1h59sK44s716qUo2l/SR05FJtOkk7sgqy7ibnO7YwBohd7NpGqpQWLc/tGw2n9hOsei+oYZ1s7KHpfSMx4oHb0Wc+okGyuosw7G7ZI95ulc8Ak/RHXepwlu4S2nLj/XI4mrWF9WqNOCOIrFMeInyVuqA/vNupeinnNiTQo78xrYiQCip+TatPzYFpESEAP0+nGWFv3lhzgq10/VJQMXLTkyiGYVKnumjG1CTLiDzMRYfB+Mz2IKz9qUB
x-ms-exchange-antispam-messagedata: JC+ZkNPLuoRQmNMV0lkvnYWVZdRN47vXS0nO2kFVsp/RJWiZTKwLNnq4Uo0BzH7Wk6gI609UGKWqBr6qg/DR1Zd0gGfo93y7F/lhWUgqJud08DloVLlQ4k+BTC1Mym2uJnDGVInVT4YIqnawu1tMLN6Yyj6EKWcr9M+b7Y1Lm66SQhoEqLdHGlqFbCHgwqad
Content-Type: text/plain; charset="utf-8"
Content-ID: <88CC0F16F768E447BA152357D17F3650@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f365ba4c-b739-4db2-03ed-08d7d662ba20
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2020 17:33:01.2789 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kI0Spob906jHnVJFTc1iPZkEzMQ+Ur09R0uu1Ln/O9XRpHd4dpOvbLKJB+80BOg3KKcu+oXc17Blxcz8tleSGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB4060
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-01_03:2020-03-31,
 2020-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxlogscore=999
 priorityscore=1501 clxscore=1011 lowpriorityscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004010148
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
 "manikandan.e@hcl.com" <manikandan.e@hcl.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDQvMS8yMCwgNDo0MCBBTSwgIk1hbmlrYW5kYW4gRWx1bWFsYWkiIDxtYW5pa2Fu
ZGFuLmhjbC5lcnMuZXBsQGdtYWlsLmNvbT4gd3JvdGU6DQoNCiAgICBUaGUgWW9zZW1pdGUgVjIg
aXMgYSBmYWNlYm9vayBtdWx0aS1ub2RlIHNlcnZlcg0KICAgIHBsYXRmb3JtIHRoYXQgaG9zdCBm
b3VyIE9DUCBzZXJ2ZXIuIFRoZSBCTUMNCiAgICBpbiB0aGUgWW9zZW1pdGUgVjIgcGxhdGZvcm0g
YmFzZWQgb24gQVNUMjUwMCBTb0MuDQogICAgDQogICAgVGhpcyBwYXRjaCBhZGRzIGxpbnV4IGRl
dmljZSB0cmVlIGVudHJ5IHJlbGF0ZWQgdG8NCiAgICBZb3NlbWl0ZSBWMiBzcGVjaWZpYyBkZXZp
Y2VzIGNvbm5lY3RlZCB0byBCTUMgU29DLg0KICAgIA0KICAgIFNpZ25lZC1vZmYtYnk6IE1hbmlr
YW5kYW4gRWx1bWFsYWkgPG1hbmlrYW5kYW4uaGNsLmVycy5lcGxAZ21haWwuY29tPg0KICAgIEFj
a2VkLWJ5ICAgICA6IEFuZHJldyBKZWZmZXJ5IDxhbmRyZXdAYWouaWQuYXU+DQogICAgUmV2aWV3
ZWQtYnkgIDogVmlqYXkgS2hlbWthIDx2a2hlbWthQGZiLmNvbT4NCiAgICAtLS0NCiAgICAtLS0g
ICAgICB2NyAtIEFkZGVkIG11bHRpLWhvc3QgU09MIGZlYXR1cmUuDQpDYW4geW91IHBsZWFzZSBh
bHNvIGFkZCBpcG1iIGJyaWRnZSBkZXZpY2UgZGV0YWlscyBoZXJlLg0KICAgIC0tLSAgICAgIHY2
IC0gQWRkZWQgZGV2aWNlIHRyZWUgcHJvcGVydHkgZm9yIG11bHRpLWhvc3QgTWVsbGFub3ggTklD
IGluIHRoZSBuY3NpIGRyaXZlci4NCiAgICAtLS0gICAgICB2NSAtIFNwZWxsIGFuZCBjb250cmli
dXRvciBuYW1lIGNvcnJlY3Rpb24uDQogICAgLS0tICAgICAgICAgICAtIExpY2Vuc2UgaWRlbnRp
ZmllciBjaGFuZ2VkIHRvIEdQTC0yLjAtb3ItbGF0ZXIuDQogICAgLS0tICAgICAgICAgICAtIGFz
cGVlZC1ncGlvLmggcmVtb3ZlZC4NCiAgICAtLS0gICAgICAgICAgIC0gRkFOMiB0YWNobyBjaGFu
bmVsIGNoYW5nZWQuDQogICAgLS0tICAgICAgdjQgLSBCb290YXJncyByZW1vdmVkLg0KICAgIC0t
LSAgICAgIHYzIC0gVWFydDEgRGVidWcgcmVtb3ZlZCAuDQogICAgLS0tICAgICAgdjIgLSBMUEMg
YW5kIFZVQVJUIHJlbW92ZWQgLg0KICAgIC0tLSAgICAgIHYxIC0gSW5pdGlhbCBkcmFmdC4NCiAg
ICAtLS0NCiAgICAtLS0NCiAgICAgLi4uL2Jvb3QvZHRzL2FzcGVlZC1ibWMtZmFjZWJvb2steW9z
ZW1pdGV2Mi5kdHMgICAgfCAxODYgKysrKysrKysrKysrKysrKysrKysrDQogICAgIDEgZmlsZSBj
aGFuZ2VkLCAxODYgaW5zZXJ0aW9ucygrKQ0KICAgICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9h
cm0vYm9vdC9kdHMvYXNwZWVkLWJtYy1mYWNlYm9vay15b3NlbWl0ZXYyLmR0cw0KICAgIA0KICAg
IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtYm1jLWZhY2Vib29rLXlvc2Vt
aXRldjIuZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWJtYy1mYWNlYm9vay15b3NlbWl0
ZXYyLmR0cw0KICAgIG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQogICAgaW5kZXggMDAwMDAwMC4uYmM4
MzkwMQ0KICAgIC0tLSAvZGV2L251bGwNCiAgICArKysgYi9hcmNoL2FybS9ib290L2R0cy9hc3Bl
ZWQtYm1jLWZhY2Vib29rLXlvc2VtaXRldjIuZHRzDQogICAgQEAgLTAsMCArMSwxODYgQEANCiAg
ICArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXINCiAgICArLy8g
Q29weXJpZ2h0IChjKSAyMDE4IEZhY2Vib29rIEluYy4NCiAgICArL2R0cy12MS87DQogICAgKyNp
bmNsdWRlICJhc3BlZWQtZzUuZHRzaSINCiAgICArDQogICAgKy8gew0KICAgICsJbW9kZWwgPSAi
RmFjZWJvb2sgWW9zZW1pdGV2MiBCTUMiOw0KICAgICsJY29tcGF0aWJsZSA9ICJmYWNlYm9vayx5
b3NlbWl0ZXYyLWJtYyIsICJhc3BlZWQsYXN0MjUwMCI7DQogICAgKwlhbGlhc2VzIHsNCiAgICAr
CQlzZXJpYWw0ID0gJnVhcnQ1Ow0KICAgICsJfTsNCiAgICArCWNob3NlbiB7DQogICAgKwkJc3Rk
b3V0LXBhdGggPSAmdWFydDU7DQogICAgKwl9Ow0KICAgICsNCiAgICArCW1lbW9yeUA4MDAwMDAw
MCB7DQogICAgKwkJcmVnID0gPDB4ODAwMDAwMDAgMHgyMDAwMDAwMD47DQogICAgKwl9Ow0KICAg
ICsNCiAgICArCWlpby1od21vbiB7DQogICAgKwkJLy8gVk9MQVRBR0UgU0VOU09SDQogICAgKwkJ
Y29tcGF0aWJsZSA9ICJpaW8taHdtb24iOw0KICAgICsJCWlvLWNoYW5uZWxzID0gPCZhZGMgMD4g
LCA8JmFkYyAxPiAsIDwmYWRjIDI+ICwgIDwmYWRjIDM+ICwNCiAgICArCQk8JmFkYyA0PiAsIDwm
YWRjIDU+ICwgPCZhZGMgNj4gLCAgPCZhZGMgNz4gLA0KICAgICsJCTwmYWRjIDg+ICwgPCZhZGMg
OT4gLCA8JmFkYyAxMD4sIDwmYWRjIDExPiAsDQogICAgKwkJPCZhZGMgMTI+ICwgPCZhZGMgMTM+
ICwgPCZhZGMgMTQ+ICwgPCZhZGMgMTU+IDsNCiAgICArCX07DQogICAgK307DQogICAgKw0KICAg
ICsmZm1jIHsNCiAgICArCXN0YXR1cyA9ICJva2F5IjsNCiAgICArCWZsYXNoQDAgew0KICAgICsJ
CXN0YXR1cyA9ICJva2F5IjsNCiAgICArCQltMjVwLGZhc3QtcmVhZDsNCiAgICArI2luY2x1ZGUg
Im9wZW5ibWMtZmxhc2gtbGF5b3V0LmR0c2kiDQogICAgKwl9Ow0KICAgICt9Ow0KICAgICsNCiAg
ICArJnNwaTEgew0KICAgICsJc3RhdHVzID0gIm9rYXkiOw0KICAgICsJcGluY3RybC1uYW1lcyA9
ICJkZWZhdWx0IjsNCiAgICArCXBpbmN0cmwtMCA9IDwmcGluY3RybF9zcGkxX2RlZmF1bHQ+Ow0K
ICAgICsJZmxhc2hAMCB7DQogICAgKwkJc3RhdHVzID0gIm9rYXkiOw0KICAgICsJCW0yNXAsZmFz
dC1yZWFkOw0KICAgICsJCWxhYmVsID0gInBub3IiOw0KICAgICsJfTsNCiAgICArfTsNCiAgICAr
JnVhcnQxIHsNCiAgICArCS8vIEhvc3QxIENvbnNvbGUNCiAgICArCXN0YXR1cyA9ICJva2F5IjsN
CiAgICArCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQogICAgKwlwaW5jdHJsLTAgPSA8JnBp
bmN0cmxfdHhkMV9kZWZhdWx0DQogICAgKwkJICAgICAmcGluY3RybF9yeGQxX2RlZmF1bHQ+Ow0K
ICAgICt9Ow0KICAgICsNCiAgICArJnVhcnQyIHsNCiAgICArCS8vIEhvc3QyIENvbnNvbGUNCiAg
ICArCXN0YXR1cyA9ICJva2F5IjsNCiAgICArCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQog
ICAgKwlwaW5jdHJsLTAgPSA8JnBpbmN0cmxfdHhkMl9kZWZhdWx0DQogICAgKwkJICAgICAmcGlu
Y3RybF9yeGQyX2RlZmF1bHQ+Ow0KICAgICsNCiAgICArfTsNCiAgICArDQogICAgKyZ1YXJ0MyB7
DQogICAgKwkvLyBIb3N0MyBDb25zb2xlDQogICAgKwlzdGF0dXMgPSAib2theSI7DQogICAgKwlw
aW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KICAgICsJcGluY3RybC0wID0gPCZwaW5jdHJsX3R4
ZDNfZGVmYXVsdA0KICAgICsJCSAgICAgJnBpbmN0cmxfcnhkM19kZWZhdWx0PjsNCiAgICArfTsN
CiAgICArDQogICAgKyZ1YXJ0NCB7DQogICAgKwkvLyBIb3N0NCBDb25zb2xlDQogICAgKwlzdGF0
dXMgPSAib2theSI7DQogICAgKwlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KICAgICsJcGlu
Y3RybC0wID0gPCZwaW5jdHJsX3R4ZDRfZGVmYXVsdA0KICAgICsJCSAgICAgJnBpbmN0cmxfcnhk
NF9kZWZhdWx0PjsNCiAgICArfTsNCiAgICArDQogICAgKyZ1YXJ0NSB7DQogICAgKwkvLyBCTUMg
Q29uc29sZQ0KICAgICsJc3RhdHVzID0gIm9rYXkiOw0KICAgICt9Ow0KICAgICsNCiAgICArJnZ1
YXJ0IHsNCiAgICArCS8vIFZpcnR1YWwgVUFSVA0KICAgICsJc3RhdHVzID0gIm9rYXkiOw0KICAg
ICt9Ow0KICAgICsNCiAgICArJm1hYzAgew0KICAgICsJc3RhdHVzID0gIm9rYXkiOw0KICAgICsJ
cGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCiAgICArCXBpbmN0cmwtMCA9IDwmcGluY3RybF9y
bWlpMV9kZWZhdWx0PjsNCiAgICArCXVzZS1uY3NpOw0KICAgICsJbWx4LG11bHRpLWhvc3Q7DQog
ICAgK307DQogICAgKw0KICAgICsmYWRjIHsNCiAgICArCXN0YXR1cyA9ICJva2F5IjsNCiAgICAr
CXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQogICAgKwlwaW5jdHJsLTAgPSA8JnBpbmN0cmxf
YWRjMF9kZWZhdWx0DQogICAgKwkJCSZwaW5jdHJsX2FkYzFfZGVmYXVsdA0KICAgICsJCQkmcGlu
Y3RybF9hZGMyX2RlZmF1bHQNCiAgICArCQkJJnBpbmN0cmxfYWRjM19kZWZhdWx0DQogICAgKwkJ
CSZwaW5jdHJsX2FkYzRfZGVmYXVsdA0KICAgICsJCQkmcGluY3RybF9hZGM1X2RlZmF1bHQNCiAg
ICArCQkJJnBpbmN0cmxfYWRjNl9kZWZhdWx0DQogICAgKwkJCSZwaW5jdHJsX2FkYzdfZGVmYXVs
dA0KICAgICsJCQkmcGluY3RybF9hZGM4X2RlZmF1bHQNCiAgICArCQkJJnBpbmN0cmxfYWRjOV9k
ZWZhdWx0DQogICAgKwkJCSZwaW5jdHJsX2FkYzEwX2RlZmF1bHQNCiAgICArCQkJJnBpbmN0cmxf
YWRjMTFfZGVmYXVsdA0KICAgICsJCQkmcGluY3RybF9hZGMxMl9kZWZhdWx0DQogICAgKwkJCSZw
aW5jdHJsX2FkYzEzX2RlZmF1bHQNCiAgICArCQkJJnBpbmN0cmxfYWRjMTRfZGVmYXVsdA0KICAg
ICsJCQkmcGluY3RybF9hZGMxNV9kZWZhdWx0PjsNCiAgICArfTsNCiAgICArDQogICAgKyZpMmM4
IHsNCiAgICArCXN0YXR1cyA9ICJva2F5IjsNCiAgICArCS8vRlJVIEVFUFJPTQ0KICAgICsJZWVw
cm9tQDUxIHsNCiAgICArCQljb21wYXRpYmxlID0gImF0bWVsLDI0YzY0IjsNCiAgICArCQlyZWcg
PSA8MHg1MT47DQogICAgKwkJcGFnZXNpemUgPSA8MzI+Ow0KICAgICsJfTsNCiAgICArfTsNCiAg
ICArDQogICAgKyZpMmM5IHsNCiAgICArCXN0YXR1cyA9ICJva2F5IjsNCiAgICArCXRtcDQyMUA0
ZSB7DQogICAgKwkvL0lOTEVUIFRFTVANCiAgICArCQljb21wYXRpYmxlID0gInRpLHRtcDQyMSI7
DQogICAgKwkJcmVnID0gPDB4NGU+Ow0KICAgICsJfTsNCiAgICArCS8vT1VUTEVUIFRFTVANCiAg
ICArCXRtcDQyMUA0ZiB7DQogICAgKwkJY29tcGF0aWJsZSA9ICJ0aSx0bXA0MjEiOw0KICAgICsJ
CXJlZyA9IDwweDRmPjsNCiAgICArCX07DQogICAgK307DQogICAgKw0KICAgICsmaTJjMTAgew0K
ICAgICsJc3RhdHVzID0gIm9rYXkiOw0KICAgICsJLy9IU0MNCiAgICArCWFkbTEyNzhANDAgew0K
ICAgICsJCWNvbXBhdGlibGUgPSAiYWRpLGFkbTEyNzgiOw0KICAgICsJCXJlZyA9IDwweDQwPjsN
CiAgICArCX07DQogICAgK307DQogICAgKw0KICAgICsmaTJjMTEgew0KICAgICsJc3RhdHVzID0g
Im9rYXkiOw0KICAgICsJLy9NRVpaX1RFTVBfU0VOU09SDQogICAgKwl0bXA0MjFAMWYgew0KICAg
ICsJCWNvbXBhdGlibGUgPSAidGksdG1wNDIxIjsNCiAgICArCQlyZWcgPSA8MHgxZj47DQogICAg
Kwl9Ow0KICAgICt9Ow0KICAgICsNCiAgICArJmkyYzEyIHsNCiAgICArCXN0YXR1cyA9ICJva2F5
IjsNCiAgICArCS8vTUVaWl9GUlUNCiAgICArCWVlcHJvbUA1MSB7DQogICAgKwkJY29tcGF0aWJs
ZSA9ICJhdG1lbCwyNGM2NCI7DQogICAgKwkJcmVnID0gPDB4NTE+Ow0KICAgICsJCXBhZ2VzaXpl
ID0gPDMyPjsNCiAgICArCX07DQogICAgK307DQogICAgKw0KICAgICsmcHdtX3RhY2hvIHsNCiAg
ICArCXN0YXR1cyA9ICJva2F5IjsNCiAgICArCS8vRlNDDQogICAgKwlwaW5jdHJsLW5hbWVzID0g
ImRlZmF1bHQiOw0KICAgICsJcGluY3RybC0wID0gPCZwaW5jdHJsX3B3bTBfZGVmYXVsdCAmcGlu
Y3RybF9wd20xX2RlZmF1bHQ+Ow0KICAgICsJZmFuQDAgew0KICAgICsJCXJlZyA9IDwweDAwPjsN
CiAgICArCQlhc3BlZWQsZmFuLXRhY2gtY2ggPSAvYml0cy8gOCA8MHgwMD47DQogICAgKwl9Ow0K
ICAgICsJZmFuQDEgew0KICAgICsJCXJlZyA9IDwweDAxPjsNCiAgICArCQlhc3BlZWQsZmFuLXRh
Y2gtY2ggPSAvYml0cy8gOCA8MHgwMT47DQogICAgKwl9Ow0KICAgICt9Ow0KICAgIC0tIA0KICAg
IDIuNy40DQogICAgDQogICAgDQoNCg==
