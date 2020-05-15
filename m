Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDB61D5B30
	for <lists+openbmc@lfdr.de>; Fri, 15 May 2020 23:08:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49P1H045B3zDr5D
	for <lists+openbmc@lfdr.de>; Sat, 16 May 2020 07:08:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=2404b589be=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=qCNIev0A; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=Ih1M/VQV; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49P1G21QcqzDr2P
 for <openbmc@lists.ozlabs.org>; Sat, 16 May 2020 07:07:44 +1000 (AEST)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04FL7NWG028708; Fri, 15 May 2020 14:07:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=0uKs8aHiqkxZWLEmh3zYXm79lUafauSsiqAOc2fm+Qg=;
 b=qCNIev0AVcDgwVrQE7Jijp7jyOxRTtE2/X5KIkNGFvdueJ38SFRcGTQyM8VbYN+0R3YD
 tZK/0JKArKsSphjSgB12oMgPmWB9K8FOU+QKWt8qeqLmbmy9Rc8PgonHojmDI4ArCWcV
 AhzPergk5rXFPBbq/b56jZualSNOyeHDB7E= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 3100x7c25j-16
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 15 May 2020 14:07:39 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.101) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Fri, 15 May 2020 14:07:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kqrRQfGfRaFdzPwsspvABGKZcPE7fCUKIrGa5xTcJvEoy/rx8Ukc5ajF234NpA9b9Xq/zU5H0uWTpu17Hd5iuYmwkHHjoj0QvjoyuOEhix8OUAM5pQJ6C+tVu+4syCL6tIxCIu4KPiMOPANp9UX0IcEQbJAjX+UzzUe5yDjRFWykCEe+g5PteYBPAyZ4VYH4mc5S2++n9fweMdhMFKny+quXkHiauPk/u2lGt/FReT6ZwBQ+rCuq+OSTCiKCtdL8OVYFiNE3k6pGWI1MjoZmfs04Ri60ye7/JVeCeOW9CcTSWfXqAWltRBArgpw0AYxsQRF6oQuqOi2NsuGsGCuo0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0uKs8aHiqkxZWLEmh3zYXm79lUafauSsiqAOc2fm+Qg=;
 b=Gg+0UMPVWfkLCvW1YqfaS8/5mKG8GNawGrIRUPH3aWwFfCnXUOa9DUIW5k0X0A6rYSdTJC7fZu6I6XcwE5Ef7qHR+OkISme3bQT4Sv/4+SA04jGeeYyo7f1DjIQLSd3rUDUXmSuHJxSk5w3jsAi4COx6guXTkWMm7EzqnIvls3lBmE2gQtrgJCh+MI6ekUxn/Xb+tfkshMOrgyhyGgC6OJhO59ftgZ/ip8PViLaTDFSSEvyRVHahSg/cuPPrLSVOw9QL5/GN4ID071KAY1tebYp1YjL8S5w6dHBoHAsDh3GW/SQdH0xOWixGy/jtOCU+WxwGxpeF75IS1q37lyt66g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0uKs8aHiqkxZWLEmh3zYXm79lUafauSsiqAOc2fm+Qg=;
 b=Ih1M/VQVFxbWFT/cZg2hSMhKMfI2EIlXY1SNeSOK+Eig8E7EnoGqkCDwzEFORZAQighsfO7+GRtY/KmtbCBO/oyTK76ThIJjuxJxn5wGmZzON8QHow+A3IolvmqCoqod8GIYVk+cOP9pzIMIoG9fWfPwyoANOLx+j6yFW36j55o=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2309.namprd15.prod.outlook.com (2603:10b6:a02:8b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25; Fri, 15 May
 2020 21:07:36 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4%3]) with mapi id 15.20.2979.033; Fri, 15 May 2020
 21:07:36 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Reducing fragmentation in OpenBMC
Thread-Topic: Reducing fragmentation in OpenBMC
Thread-Index: AQHWKpfmQmc+x22kJUKQm6NZEvNYU6io9tYAgAB+RoD//7oSAA==
Date: Fri, 15 May 2020 21:07:36 +0000
Message-ID: <9F8556C2-731B-4E41-AA2A-18D962BD1B8A@fb.com>
References: <d7da4861c449609d2cf1b1b1434c653e9a27a805.camel@ozlabs.org>
 <e70889bcbee171b407f64392704c417cf7c0856a.camel@ozlabs.org>
 <35b7ea09-f09d-c0ac-e014-468c822358f8@linux.intel.com>
In-Reply-To: <35b7ea09-f09d-c0ac-e014-468c822358f8@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:3d17]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 68dd1a21-c62a-442a-83ab-08d7f913feb2
x-ms-traffictypediagnostic: BYAPR15MB2309:
x-microsoft-antispam-prvs: <BYAPR15MB2309FE1B93C6E96DD27BB90DDDBD0@BYAPR15MB2309.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 04041A2886
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TfFLmXb96vFksMuTzy4t22Eu5INzqFa+ezLm3xCX8voiqNNmXcWRiwRs5Hh2DTc42OvF0NPLRCxgzR/ns7Jrx8RVMb1kgqDWMJCwHkJRa4oLkgOdmK3O3VoUJ4KtYxOXuQtShK3cMJpxZOefLHpgf2r9CbSIWfnN/13hc3QPvpo7vFWdHUJljR3PYiQeg5WyTMoAy7RD+peHvJfO1gl4EHTnBj8kTPNyUigKBIXbL8DGSArRXSJNXFHl9MYS2Zo76Tkm/0Su6LdRoWMroCfdq8J5zFZdMbiLegQ+CdwGP/Yi9AbZvSJslNRDBH6qwyLoG053cgwK7uWVCr/M0n7yW0x+Gj1FZr0g3BAozD1sTPfkCkVc0RVuHPlOje9eo1swB3zzSXeFmO9Q72++yU17Hgyam6fkJWl1as2SVFr4pnz+iE7ZHhGjKA1l47A6cNIJiUmHW2SPVMjVWsOQmqAPQrSQekAOjNbUJfDAUmnCL4+Uzou03tULZLDfXMtG+79BJTqC5DD/2LTwTicCxLhcjg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(376002)(366004)(346002)(396003)(136003)(478600001)(33656002)(6512007)(3480700007)(71200400001)(2906002)(6486002)(86362001)(966005)(8676002)(5660300002)(8936002)(66446008)(76116006)(186003)(316002)(6506007)(36756003)(66556008)(2616005)(66946007)(64756008)(66476007)(53546011)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: U52Qx4uAoskXi3EJsv3cVSgnSvtrRK9KYc898hlEO/GBprTiGbYJYCrSxJfpZKF6uf7H5QGrK5eXPxebW1reEYxWFnZi6LqZWmGL9/wp2LVLCqLm4RWs7KuHeI/s3ficpNPp38N636T8inniido0wF+eDzDgN+4sf5dtP0xvW4gCZEKsnYOceGLncMc9+256dGIp75bOgCS8eUZ8+E42YFGDqYrtM9DsC208ebxHa2A4zygjk7EP9iu5xICPoNBl1BHcb4QP2Jw/3S7Sm6bVmyoZO5DqxHhS8gW4oOfku1IyKHojuo0YKebhMRAGe19H+0QLiwQmQYGqvyoKoGbLkYtD7WZvgo3WVrc/cxH0fX3csAVklGzWQMOetaUcPxkP0aBTfwlmFoklYvbPZ8GbS0nHAJLMNszjgWu/GsMb8/rU2XnDOmeXfqHmn3fJNFzNkLyqpgJaWEY2LRwhv4dd1iSYkQFj+zEfPlmcUYah29ti3SVWQFnPKsWxMwZHRbIrCAwKAxHyRazUVtIw0HDWMw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <9D0DF3C18FBEB442A46A4847FD16288F@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 68dd1a21-c62a-442a-83ab-08d7f913feb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2020 21:07:36.8611 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QbHZZ4qtLL2AKEXYOEPbaxc+dlT/2AkOtd7N3L5Yj5vk9A0RqWPL9Djz0+N8VoQq+DCT5JjmV+2OFeCxmKZSgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2309
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-15_07:2020-05-15,
 2020-05-15 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0
 cotscore=-2147483648 lowpriorityscore=0 spamscore=0 adultscore=0
 impostorscore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0
 clxscore=1011 malwarescore=0 mlxscore=0 suspectscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005150176
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

DQoNCu+7v09uIDUvMTUvMjAsIDExOjE5IEFNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgSmFlIEh5
dW4gWW9vIiA8b3BlbmJtYy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxhYnMu
b3JnIG9uIGJlaGFsZiBvZiBqYWUuaHl1bi55b29AbGludXguaW50ZWwuY29tPiB3cm90ZToNCg0K
ICAgIEhpIEplcmVteSwNCiAgICANCiAgICBPbiA1LzE1LzIwMjAgMzo0NSBBTSwgSmVyZW15IEtl
cnIgd3JvdGU6DQogICAgPiBIaSBhbGwsDQogICAgPiANCiAgICA+PiAgIC0gS2VlcCBwdXNoaW5n
IG9uIHVwc3RyZWFtLiBTb21ldGltZXMgdGhpcyBjYW4gZGVsYXkgdGhpbmdzLCBidXQgSQ0KICAg
ID4+IHJlYWxseSB0aGluayB0aGF0J3MgYWxtb3N0IGFsd2F5cyBmYWxzZSBlY29ub215OyB0aGUg
b3V0LW9mLXRyZWUNCiAgICA+PiBwYXRjaGVzIHdpbGwgaGF2ZSB0byBiZSBhZGRyZXNzZWQgYXQg
c29tZSBwb2ludCwgYW5kIHRoYXQgam9iIGp1c3QNCiAgICA+PiBnZXRzIG1vcmUgaW52b2x2ZWQg
YXMgdGltZSBwYXNzZXMuDQogICAgPiANCiAgICA+IE9uZSBvZiB0aGUgbGFnZ2luZyBpdGVtcyBo
ZXJlIGlzIHRoZSBhbW91bnQgb2Yga2VybmVsIHBhdGNoZXMgcGVuZGluZw0KICAgID4gaW46DQog
ICAgPiANCiAgICA+ICAgDQogICAgPiBodHRwczovL2dpdGh1Yi5jb20vSW50ZWwtQk1DL29wZW5i
bWMvdHJlZS9pbnRlbC9tZXRhLW9wZW5ibWMtbW9kcy9tZXRhLWNvbW1vbi9yZWNpcGVzLWtlcm5l
bC9saW51eC9saW51eC1hc3BlZWQNCiAgICA+IA0KICAgID4gSW50ZWwgZm9sa3M6IGFueSBvYmpl
Y3Rpb25zIGlmIEkgZ3JhYiBzZWxlY3QgcGF0Y2hlcyBmcm9tIHRoZXJlIGFuZA0KICAgID4gd29y
ayBvbiB0aGUgdXBzdHJlYW1pbmcgcHJvY2Vzcz8gT3IgYXJlIHlvdSBhbHJlYWR5IHdvcmtpbmcg
b24gdGhpcz8NCiAgICA+IA0KICAgIA0KICAgIEZpcnN0IG9mIGFsbCwgdGhhbmsgeW91IGZvciB5
b3VyIGluaXRpYXRpbmcgdGhpcyBkaXNjdXNzaW9uLiBPYnZpb3VzbHksDQogICAgaXQgc2hvdWxk
IGJlIGRvbmUgYnV0IEkgY291bGRuJ3QgcHV0IGVub3VnaCB0aW1lIHRvIG1ha2UgaXQuDQogICAg
DQogICAgSSBkb24ndCBoYXZlIGFueSBvYmplY3Rpb24gb24gdGhhdC4gSXQgd291bGQgYmUgcmVh
bGx5IGhlbHBmdWwgaWYgeW91DQogICAgZ3JhYiBwYXRjaGVzIGZyb20gdGhlcmUgZm9yIHVwc3Ry
ZWFtaW5nLiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgeW91IG5lZWQNCiAgICBhbnkgaGVscCBvciBj
bGFyaWZpY2F0aW9uIGZyb20gbWUgb3IgZnJvbSBJbnRlbCBkdXJpbmcgdGhlIHVwc3RyZWFtaW5n
Lg0KICAgIA0KICAgIFRoYW5rcywNCiAgICANCiAgICBKYWUNCiAgICANCklmIHRoZXJlIGFyZSBh
bnkgb3RoZXIgZmVhdHVyZSBwYXRjaGVzIGF2YWlsYWJsZSBpbiBJbnRlbC1CTUMgdHJlZSB3aGlj
aCBjYW4gYmUgDQp1cHN0cmVhbWVkIHRvIG9wZW5ibWMgcmVwbywgcGxlYXNlIGxldCBjb21tdW5p
dHkga25vdyBzbyBhbnlvbmUgd2hvIGhhcw0KYmFuZHdpZHRoIGNhbiBncmFiIHRob3NlIHBhdGNo
ZXMgYW5kIHVwc3RyZWFtIGl0IHJhdGhlciB0aGFuIG1ha2luZyBhIGNvcHkNCnRvIHRoZWlyIGxv
Y2FsIHJlcG8uDQoNCg==
