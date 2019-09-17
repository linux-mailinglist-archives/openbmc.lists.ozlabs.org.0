Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 63260B559A
	for <lists+openbmc@lfdr.de>; Tue, 17 Sep 2019 20:48:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XsZp0VFdzF3P4
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 04:48:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=41638c232b=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="pgldZJU8"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="UYiHPW3U"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XsYn5cQ9zF3h0
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 04:47:56 +1000 (AEST)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8HIissu009686; Tue, 17 Sep 2019 11:47:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=AVX5MgpdwUBP3mkQLBGWEdS69Df+mmRwaZV35GffKPo=;
 b=pgldZJU8LvUJWsRkrQFeS+IErigBgwIWR77lp8cwkOqh/7tBnDthxws8V/kV+jIDhliC
 eMxspGI+FIdP2nMk1XOYPUh45t1Z2Uwc9T+tqsuY+yE2vO17jz3XKLgHRXBIV7JFG/0H
 3vNTOz/tW0yVZGBUil7zKnkQ+oG0UYIIqyY= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2v2bum6gkf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 17 Sep 2019 11:47:51 -0700
Received: from ash-exhub102.TheFacebook.com (2620:10d:c0a8:82::f) by
 ash-exhub203.TheFacebook.com (2620:10d:c0a8:83::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 17 Sep 2019 11:47:49 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.172) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 17 Sep 2019 11:47:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WMRYoeG5AplD5O/tN1eHIpDUSvNLmRUtYM37kw3oFukIVzNq/6D9zHKJv2z/s9M0GU9vwAS8UFd0HAw/qDTVrNd7Wl3FRtKHI3D3i7VcbmoS6yMpZcUZIfbrV9qCMSuqmuZTYl5pfTLfwBqf4RZdPuk8tHNE9Z7RCaQpBJrDux45pqOHEaz6XOcGVXTYyFR+5d6ZcJW8KHqkVViGmxT5vL0eFrDaXLeb8fdFp/KP+hqT8JVNz3LJqJpqEIK1mHhb5T+h5QNEtk73C1E+joCKO87Rczfmc0kE3+Yb9U9IcNvV2woIrm9OMeiVwYIi4YnPQV6Ng5lBn7O642pWKYwSGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AVX5MgpdwUBP3mkQLBGWEdS69Df+mmRwaZV35GffKPo=;
 b=gq/4AGpa3F+Nz9GZY+m0V4CDdh85lMQaLHCUolni1aVKLju2eGUMSKBbYJgsS6cPK7tJSMF0mkaxy3kttlbmLiZS0josT8NP3jtPo/UQUel32M57XomWmZuO3g1DsAI2iMyY3b46kjfm9zFQzu+UW7k9xw1+qigM0s+xL3+qhVsPRGnXOVPoXfDbhvO1emdONdWBpt8CuzcYGq3jd7fnXelTWRGIhqgSi+bFOLqP2g2Bxx9by0+S+ehNV0waF4KOep3k7UtMJcDC3xRnqBG/wN0RWTE6NtwbxQqmjhHvhK46piAPTKD73iVTWSChc0zjvMzmLrBEhsi5Nej/rG4qQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AVX5MgpdwUBP3mkQLBGWEdS69Df+mmRwaZV35GffKPo=;
 b=UYiHPW3UjFcFndq7m+G9B9lneIF7G90GQXejVqdxBM8vqIz9DeD/d7Jv6bFdXrkwjCfCXCWBor3zzx4aRAPTRdz6SUFPxTB3JBHwnmuo5CyB/j8KvfLykku+PeiyE+bYj/4+padqNX3tSvm1mkKq0KYezJaIEy0mdGTdTjcA+jU=
Received: from BY5PR15MB3636.namprd15.prod.outlook.com (52.133.252.91) by
 BY5PR15MB3634.namprd15.prod.outlook.com (52.133.255.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Tue, 17 Sep 2019 18:47:49 +0000
Received: from BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::bc3e:c80f:b59e:98aa]) by BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::bc3e:c80f:b59e:98aa%6]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 18:47:48 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Moving kernel to Linux 5.3
Thread-Topic: Moving kernel to Linux 5.3
Thread-Index: AQHVbHd8xT5PMdtntk+SyLpENLGi+KcvwoUA
Date: Tue, 17 Sep 2019 18:47:48 +0000
Message-ID: <A00B39C6-4368-4A4D-9CEE-DC6CF29EC0E4@fb.com>
References: <CACPK8XcVoi7KmWaBz3KoEcv2mGJSmMGm2Rxu66jWU+BC8pOrqw@mail.gmail.com>
In-Reply-To: <CACPK8XcVoi7KmWaBz3KoEcv2mGJSmMGm2Rxu66jWU+BC8pOrqw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:850b]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c69d7512-e459-4925-cad9-08d73b9f898b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BY5PR15MB3634; 
x-ms-traffictypediagnostic: BY5PR15MB3634:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BY5PR15MB36341C45D79D54DC6B089C0BDD8F0@BY5PR15MB3634.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(39860400002)(396003)(366004)(346002)(136003)(189003)(199004)(110136005)(316002)(8936002)(76176011)(14454004)(2906002)(476003)(305945005)(7736002)(86362001)(11346002)(446003)(486006)(46003)(6116002)(256004)(2616005)(5660300002)(99286004)(186003)(71190400001)(6506007)(71200400001)(36756003)(25786009)(6306002)(6246003)(33656002)(102836004)(478600001)(6486002)(6436002)(6512007)(66476007)(66946007)(8676002)(66556008)(66446008)(76116006)(81166006)(91956017)(64756008)(229853002)(966005)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR15MB3634;
 H:BY5PR15MB3636.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GJWI4N942uWNVCYbT6JKtVYoaLOYvUKN3ZbsuoRxTMNcC9o5IE6An/q+y5Vr7BeczV7s056nP7S7F5SpThZ/GpBpiCcluoxbXa9QupkHPSQNnSB/2NXqKO2SovMyGdL+OY6adbVqVMeid4sXzaqU35iA4wM2xBw6D6zJmaannpAI1F+LdHyqcIegIit+/2WsGZxLR1Hccx+Rki744EKZAFB3YWOA189zv+MmK1tWOFgZNAY4x9SXPVreOaI+C1CDpARu6REbkjIGJNwFhnsAfAtWE7ANUa7FOWpmGvhAc5S4tICD+nSchte2/XM+XTviW/WQNXrYZTSfMWLhADg8i5NRHhBRHkVy2UJfcsdP8AHMewyi6USdjdYtWN+luvtBNbkSz6xiYjnrUT6rvfOMbWhQn6vBPYfWhIyoRrOyHS0=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <53CFE851BCAC07469D7B82BB5CA83E51@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c69d7512-e459-4925-cad9-08d73b9f898b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 18:47:48.8044 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0O2tea/ZDYPal1fYhWwqR5v0g/S4XCZwCelSRsgAlHDdCfJ11E+gV2tMcgOeHsJV5eVI4NU0cFq1SFJez1JeFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3634
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-17_10:2019-09-17,2019-09-17 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 clxscore=1015 spamscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1909170178
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

DQoNCu+7v09uIDkvMTYvMTksIDM6MTQgQU0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBKb2VsIFN0
YW5sZXkiIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFicy5v
cmcgb24gYmVoYWxmIG9mIGpvZWxAam1zLmlkLmF1PiB3cm90ZToNCg0KICAgIFdpdGggTGludXgg
djUuMyB0YWdnZWQgdG9kYXkgSSd2ZSBjcmVhdGVkIGFuIG9wZW5ibWMgdHJlZSBiYXNlZCBvbiB0
aGlzIHJlbGVhc2UuDQogICAgDQogICAgV2UgaGF2ZSAxMjAgcGF0Y2hlcyBpbiBkZXYtNS4zLiBP
ZiB0aGVzZSwgNTYgYXJlIGJhY2twb3J0ZWQgZnJvbQ0KICAgIHVwc3RyZWFtLCBsZWF2aW5nIDY0
IG91dCBvZiB0cmVlIHBhdGNoZXMuIFRoZXNlIG91dCBvZiB0cmVlIHBhdGNoZXMNCiAgICBpbmNs
dWRlIGxvbmcgc3RhbmRpbmcgbXRkIGFuZCBmYW4gY29udHJvbGxlciBjaGFuZ2VzLCB0aGUgYWdp
bmcgUEVDSQ0KICAgIHBhdGNoIHNldCwgYW5kIGEgZmV3IE51dm90b24gZHJpdmVycy4NCiAgICAN
CiAgICBNb3N0IG9mIHRoZSBwYXRjaGVzIGZyb20gZGV2LTUuMiBhcmUgY2FycmllZCBvdmVyLiBP
bmUgZXhjZXB0aW9uIGlzDQogICAgdGhlIGFzcGVlZCBpMmMgZXhwZXJpbWVudHMsIHdoaWNoIEkg
aGF2ZSBhc2tlZCBKYWUgdG8gcG9zdCB1cHN0cmVhbQ0KICAgIGZvciByZXZpZXcgYmVmb3JlIHdl
IGluY2x1ZGUgdGhlbSBhZ2Fpbi4NCg0KVGhhbmtzIEpvZWwsIEkgaGF2ZSB0ZXN0ZWQgaXQgZm9y
IG91ciB0aW9nYXBhc3MgcGxhdGZvcm0gYW5kIGl0IHdvcmtzIHBlcmZlY3RseSBmaW5lLg0KICAg
IA0KICAgIFRoaXMgdHJlZSBjb250YWlucyBzdXBwb3J0IGZvciB0aGUgYXN0MjYwMCB0aGF0IHdh
cyBtZXJnZWQgaW4gNS40Lg0KICAgIA0KICAgIEkgaGF2ZSB0ZXN0ZWQgb24gYXN0MjQwMCAocGFs
bWV0dG8pLCBhc3QyNTAwIChyb211bHVzKSwgYXN0MjYwMA0KICAgIChwYWxtZXR0byksIGJvdGgg
aGFyZHdhcmUgYW5kIHFlbXUgKGFzcGVlZC00LjIgYnJhbmNoKS4gRnVydGhlcg0KICAgIHRlc3Rp
bmcgYW5kIGEgKzEgb2YgdGhpcyByZXZpZXcgd291bGQgYmUgYXBwcmVjaWF0ZWQ6DQogICAgDQog
ICAgIGh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwcy0zQV9f
Z2Vycml0Lm9wZW5ibWMtMkRwcm9qZWN0Lnh5el9jX29wZW5ibWNfbWV0YS0yRGFzcGVlZF8tMkJf
MjUyMTMmZD1Ed0lCYVEmYz01VkQwUlR0TmxUaDN5Y2Q0MWIzTVV3JnI9djlNVTBLaTlwV25UWENX
d2pIUFZncG5DUjgwdlhra2NySWFxVTdVU2w1ZyZtPVl3M1VrZWNteV9qSkprcUlDaWQ3RHo3Smdw
LTJLODItcnFTTTF1ejQ5SWsmcz11QkJPeEhnYkpEWWpuNnlXRk5OZzljWElwQUZ2UFF6Q2laQ252
cWR6a2dBJmU9IA0KICAgIA0KICAgIENoZWVycywNCiAgICANCiAgICBKb2VsDQogICAgDQoNCg==
