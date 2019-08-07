Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C318540F
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2019 21:46:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463hnl52SxzDqws
	for <lists+openbmc@lfdr.de>; Thu,  8 Aug 2019 05:46:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=3122a9fb6d=wilfredsmith@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="qqtYyI31"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="dfbEcWH3"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463hmv0XY7zDqnn
 for <openbmc@lists.ozlabs.org>; Thu,  8 Aug 2019 05:45:10 +1000 (AEST)
Received: from pps.filterd (m0001255.ppops.net [127.0.0.1])
 by mx0b-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x77JgAZK028898
 for <openbmc@lists.ozlabs.org>; Wed, 7 Aug 2019 12:45:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=KBT3oCBpYqyOvxzXEHGPXEx6lR1UxDVcUbCsickNiAw=;
 b=qqtYyI31gRHFxHHNJP8mLklZgOhc3KCSRXpjhPMM8eNV7Jyg+kC6itaJL7ZUhbvMQ+Dq
 N3m4/eefS4/LSjlV17ZlZ45o9MOpr1dbWzd3mYdybfSqIXHgXGgebX+3RTTpfLhChb2u
 ljzxsD+X+xSjGFcWdwAy67Ue0eCmzqf12m0= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0b-00082601.pphosted.com with ESMTP id 2u80f8s5bw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 07 Aug 2019 12:45:06 -0700
Received: from ash-exhub204.TheFacebook.com (2620:10d:c0a8:83::4) by
 ash-exhub204.TheFacebook.com (2620:10d:c0a8:83::4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 7 Aug 2019 12:45:05 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.100) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 7 Aug 2019 12:45:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A0x2Rc6gB6q7u+bTcmq337a56+z0bF6+aG9P46GPR4GmD1niVO0yvVBD5hQHZCSx/QpN6ZmrGLQCUvJfPelXU+QE62jCeN2B+TaWnV4JgWjMEJL0w9iEvyqz/B9LfPtD3Jj3g7uZSYn91wBXxMmVREZoIKdwIH/4Mc/JrqAPeg7PqMxwD6PZ7TSFXcEyxm6ZnxCbWPRzR8ZAPXyxA1BoehfaL3lojDLGeTL76B6HM/mcZXyYLqzWdP/+eH4x2MQbo6qaFeQ9BQgTUMx0PBRCsqoB5018DAngqLIlQZn+gFdn4WJarRvrb16pAg21UZIrkwZ6iuc0m2KLM0IHxt/e5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBT3oCBpYqyOvxzXEHGPXEx6lR1UxDVcUbCsickNiAw=;
 b=HQJoKA/XpeMrnkwqu7wBQQT8LPAttGx3CjmCl/vy9usrlN4LehDFz25MhFBq9JXm5nYWwZykH6cHkJ+0PjPsURyN4OG5dSpynz+edf0+7wk3LlkQjYS1w+kXqIQnGLlVZF/82/u+YnflBqcYlYL1eRtVxk2N3WQJG07292fvuTKa/EdbQ9XpZfzu7tKGPuZG+Zt+d6P99NlpB+5u3pOJveK4qL9js+52HmELviL9fg/by0EkrO88Tnva+Rz0lWl02IR+EjltO0JjdSX+OiWnZG1gIlOnEInnLaISautTsnUgzC91E/53YRppnu6uny/+FiS1FFtr5va+w81P9CvV0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=fb.com;dmarc=pass action=none header.from=fb.com;dkim=pass
 header.d=fb.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBT3oCBpYqyOvxzXEHGPXEx6lR1UxDVcUbCsickNiAw=;
 b=dfbEcWH35qb5ATFTr9WxSw62FAqNu++YxxM18+Prx+4Z2vu8qr6YFMWAWr2kmmSL1Nv59+62nrE/c2l0yMrigstlF4HNUynQusB+Aro5e2E9iv3wQEsiETv5cIDiwel1w4z5W01FxQGcyMmNRoVVLzV0BjFmrCRT+XYlLqhKzHk=
Received: from MN2PR15MB3680.namprd15.prod.outlook.com (52.132.173.209) by
 MN2PR15MB3040.namprd15.prod.outlook.com (20.178.253.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.14; Wed, 7 Aug 2019 19:45:04 +0000
Received: from MN2PR15MB3680.namprd15.prod.outlook.com
 ([fe80::85cb:7a62:4c8f:116a]) by MN2PR15MB3680.namprd15.prod.outlook.com
 ([fe80::85cb:7a62:4c8f:116a%5]) with mapi id 15.20.2136.018; Wed, 7 Aug 2019
 19:45:04 +0000
From: Wilfred Smith <wilfredsmith@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Unit Tests, Documentation and Mocks (oh my!)
Thread-Topic: Unit Tests, Documentation and Mocks (oh my!)
Thread-Index: AQHVTViborZOJmPG4kGpwqmpLxGniQ==
Date: Wed, 7 Aug 2019 19:45:04 +0000
Message-ID: <932AC0A3-C535-4C66-B28B-350ECABBDA5E@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::1:34e1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aec32bf6-f13e-4e64-724c-08d71b6fbe60
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR15MB3040; 
x-ms-traffictypediagnostic: MN2PR15MB3040:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <MN2PR15MB304070AFA3CE550234531182BDD40@MN2PR15MB3040.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(346002)(396003)(136003)(366004)(376002)(189003)(199004)(51874003)(6916009)(2351001)(25786009)(53936002)(66556008)(53386004)(86362001)(256004)(2616005)(606006)(76116006)(36756003)(66946007)(7736002)(66446008)(64756008)(91956017)(66476007)(486006)(6506007)(14454004)(6436002)(1730700003)(5660300002)(81156014)(102836004)(5640700003)(99286004)(186003)(71190400001)(6486002)(316002)(8676002)(2906002)(81166006)(33656002)(54896002)(8936002)(6512007)(476003)(6116002)(236005)(2501003)(71200400001)(6306002)(4744005)(478600001)(46003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR15MB3040;
 H:MN2PR15MB3680.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: C1tChkKRpUZ2SnN8EYK2+L2mH1dymOdSIZZxI6ZXKUqOuiddRswEXW6vhRn4DgjIy93C6qMfmt61+FstsgIE1naF1cCe3kXkwLHChUZpNzOGkCKHABYxzuZOs2DZcX0ILW8GiHWAkEicw4Nl5z7k1d8Aeh39FRDA8mz+YfZFBkcH3dFwkGV5277xpLycF+pkK5OaWu6fpFDmAjdDSVbBgUKCqDnh3GvcxnAPtDj8Om7JwGIdLVqhOfeD3x9APiUT5+Zl3mkKDtGlvdq6mrh+jjBQ3dliwU9trEtw5W6wZ684oZiT8Pp17P2G7OVUst5nYe2Yp/Xv79uYikbLc+iLrWYMd4qjfq43v3dtkhMIYDojSagdbpYCTjOC0Pty+FjdLB++LCLd4D0czv85EBPXYKF+hTQ5F9u0FZNosttgiYU=
Content-Type: multipart/alternative;
 boundary="_000_932AC0A3C5354C66B28B350ECABBDA5Efbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: aec32bf6-f13e-4e64-724c-08d71b6fbe60
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 19:45:04.3857 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wilfredsmith@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR15MB3040
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-07_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908070176
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

--_000_932AC0A3C5354C66B28B350ECABBDA5Efbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UGxlYXNlIHBhcmRvbiBteSBpZ25vcmFuY2UsIGJ1dCBJ4oCZdmUgc2VhcmNoZWQgYW5kIGNvbWUg
dXAgZW1wdHktaGFuZGVkLiBBIFVSTCB3b3VsZCBiZSBncmVhdGx5IGFwcHJlY2lhdGVkLg0KDQpX
aGVyZSBhcmUgdGhlIHVuaXQgdGVzdHMsIHRoZSBpbnRlcmZhY2UgZG9jdW1lbnRhdGlvbiAocGFy
dGljdWxhcmx5IGZvciB0aGUgZHJpdmVyIGFuZCBELUJ1cyBjb21wb25lbnRzKSBhbmQgdGhlIG1v
Y2sgY2xhc3NlcyBmb3IgdmVyaWZ5aW5nIHRoYXQgc3R1ZmYgd29ya3MgYXMgZXhwZWN0ZWQ/DQoN
CkFsc28sIHNob3VsZCBJIHByZXN1bWUgdGhhdCB0aGlzIGNvZGUgYmFzZSBpcyBub3QgaW50ZW5k
ZWQgdG8gc3VwcG9ydCBtdWx0aS1jb3JlIEJNQ+KAmXMgKGUuZy4gUGlsb3Q0KS4NCg0KSeKAmW0g
c3VyZSBFZCBvciBBbmRyZXcgd2lsbCByZXNwb25kIHdpdGgg4oCcWW91IGRvb2Z1cywgaXTigJlz
IGFsbCBhdCB1bml0LXRlc3Qub3BlbmJtYy5vcmc8aHR0cDovL3VuaXQtdGVzdC5vcGVuYm1jLm9y
Zz4gYW5kIHdlIGhhdmUgYSBkYXNoYm9hcmQgZm9yIG91ciBjb2RlIHF1YWxpdHkgbWV0cmljcyBv
biBibGl0aGVyc3BvdC5jb208aHR0cDovL2JsaXRoZXJzcG90LmNvbT7igJ0gaW4gM+KApjLigKYx
4oCmDQoNClRoYW5rcyBpbiBhZHZhbmNlLA0KDQpXaWxmcmVkDQo=

--_000_932AC0A3C5354C66B28B350ECABBDA5Efbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <9E7F507049B41645AB05B580B53EA037@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHN0eWxlPSJ3b3JkLXdy
YXA6IGJyZWFrLXdvcmQ7IC13ZWJraXQtbmJzcC1tb2RlOiBzcGFjZTsgbGluZS1icmVhazogYWZ0
ZXItd2hpdGUtc3BhY2U7IiBjbGFzcz0iIj4NCjxkaXYgY2xhc3M9IiI+UGxlYXNlIHBhcmRvbiBt
eSBpZ25vcmFuY2UsIGJ1dCBJ4oCZdmUgc2VhcmNoZWQgYW5kIGNvbWUgdXAgZW1wdHktaGFuZGVk
LiBBIFVSTCB3b3VsZCBiZSBncmVhdGx5IGFwcHJlY2lhdGVkLjwvZGl2Pg0KPGRpdiBjbGFzcz0i
Ij48YnIgY2xhc3M9IiI+DQo8L2Rpdj4NCjxkaXYgY2xhc3M9IiI+V2hlcmUgYXJlIHRoZSB1bml0
IHRlc3RzLCB0aGUgaW50ZXJmYWNlIGRvY3VtZW50YXRpb24gKHBhcnRpY3VsYXJseSBmb3IgdGhl
IGRyaXZlciBhbmQgRC1CdXMgY29tcG9uZW50cykgYW5kIHRoZSBtb2NrIGNsYXNzZXMgZm9yIHZl
cmlmeWluZyB0aGF0IHN0dWZmIHdvcmtzIGFzIGV4cGVjdGVkPzwvZGl2Pg0KPGRpdiBjbGFzcz0i
Ij48YnIgY2xhc3M9IiI+DQo8L2Rpdj4NCjxkaXYgY2xhc3M9IiI+QWxzbywgc2hvdWxkIEkgcHJl
c3VtZSB0aGF0IHRoaXMgY29kZSBiYXNlIGlzIG5vdCBpbnRlbmRlZCB0byBzdXBwb3J0IG11bHRp
LWNvcmUgQk1D4oCZcyAoZS5nLiBQaWxvdDQpLjwvZGl2Pg0KPGRpdiBjbGFzcz0iIj48YnIgY2xh
c3M9IiI+DQo8L2Rpdj4NCjxkaXYgY2xhc3M9IiI+SeKAmW0gc3VyZSBFZCBvciBBbmRyZXcgd2ls
bCByZXNwb25kIHdpdGgg4oCcWW91IGRvb2Z1cywgaXTigJlzIGFsbCBhdCA8YSBocmVmPSJodHRw
Oi8vdW5pdC10ZXN0Lm9wZW5ibWMub3JnIiBjbGFzcz0iIj4NCnVuaXQtdGVzdC5vcGVuYm1jLm9y
ZzwvYT4mbmJzcDthbmQgd2UgaGF2ZSBhIGRhc2hib2FyZCBmb3Igb3VyIGNvZGUgcXVhbGl0eSBt
ZXRyaWNzIG9uDQo8YSBocmVmPSJodHRwOi8vYmxpdGhlcnNwb3QuY29tIiBjbGFzcz0iIj5ibGl0
aGVyc3BvdC5jb208L2E+4oCdIGluIDPigKYy4oCmMeKApjwvZGl2Pg0KPGRpdiBjbGFzcz0iIj48
YnIgY2xhc3M9IiI+DQo8L2Rpdj4NCjxkaXYgY2xhc3M9IiI+VGhhbmtzIGluIGFkdmFuY2UsPC9k
aXY+DQo8ZGl2IGNsYXNzPSIiPjxiciBjbGFzcz0iIj4NCjwvZGl2Pg0KPGRpdiBjbGFzcz0iIj5X
aWxmcmVkPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_932AC0A3C5354C66B28B350ECABBDA5Efbcom_--
