Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC79BDB9C4
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 00:34:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vP8t1N5yzDqf0
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 09:34:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=51932c9067=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Li+U7mkC"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="QQH+SMyL"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vP850Hk2zDqGF
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 09:33:23 +1100 (AEDT)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9HMUO44003276; Thu, 17 Oct 2019 15:32:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=YlpM9JiRD84Nmo/1WPcts7ElZJiDptJIPV59bUeOCYs=;
 b=Li+U7mkC4+ITaUVGJ/GHuDcUGx88OGc5yvGtI94OCuqOHQpxlyA0V1mrSN7XCBcHbxD5
 Lyiljb3Nl0RzFM5ZP5Si5DfOZuDSDPTZVMaMXOk2oOBn/Cxyhz4AnhGDAOfoFcqDAevz
 +KM0E8QIAw+lxgP2uXmOc2Qut+LA7aOcLd8= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2vpcs15aas-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 17 Oct 2019 15:32:19 -0700
Received: from ash-exhub203.TheFacebook.com (2620:10d:c0a8:83::5) by
 ash-exhub101.TheFacebook.com (2620:10d:c0a8:82::e) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 17 Oct 2019 15:32:17 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.102) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 17 Oct 2019 15:32:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BGJrGE+wBkEbAeCv9iYvBokWbhFOyRGAxflzoQ3FhJWaaWS1tEO+nItn6x8Vt8KUy2j0RohjLd/CMnwjx0+NLjNmsPtLoUr+bccZwwJ3UHP8uEkGitn4sCoof+NuABGQyktFlMJhr291R8oo7ZiPCW2ZLSTMeTSx5RkmOfIT83lV8n9hobyrWKQ1U6ctks+7kqBUyvLzJB6gK7bWSz/ANcXpQ02bLLcGMsK9rje8iEREBrsQYiN571MBuuzdycb4qpDwaqBIhCvPUlBSZBQNOFrrZpNcmooo/X9ypR7nNum8EeVcBvRj9NStp1Q/zk6UdManL7w+1h+oiYOcUoeYsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YlpM9JiRD84Nmo/1WPcts7ElZJiDptJIPV59bUeOCYs=;
 b=FqEKJ7f3wdm4NMyXS/RI3hwlHyC5BSlJKbPsMj/uyDncI1smCqfYaH9xa4Qy+Yezc+UWHFk3N7yKCsI+VhBSfoZJ3LdLzuSQ2s/q4udXNAqRv4iWx4ImTShwq5XM6hX5E94wXqpFRNm9c3zCtNXNin8HdIearb1FgnO46R4MZrLFfqgme88m0VRVXxIleSAvkFa+3J5A4WtIBdu5YcW4U8H5Uai7qeahhBdFJyoaZx09AHcZujvgxvUiVd7uAMTKNYcOObFlsYNI6i2Ki9NnoTi7EH1NjeSzwSJBya1JhkDMKtpcsfoL5Llqk2hcQPoG/1mLAFR9h0F2SJlMyc1C8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YlpM9JiRD84Nmo/1WPcts7ElZJiDptJIPV59bUeOCYs=;
 b=QQH+SMyL91FpoNe7njldrWU7oOOYrAL3x126Eox0AiZG3IczRSqle5VgJLsksAXlQ+vROOB/cL8AbY2ehEfJPa74umraALG1toZBCojV2pH42QD9ADWeOFPcINxZKbUFDB/KyK/gF1dAhVqBewSTeVkZrv90XhXGc4laIlyL5E0=
Received: from BY5PR15MB3636.namprd15.prod.outlook.com (52.133.252.91) by
 BY5PR15MB3683.namprd15.prod.outlook.com (52.133.255.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Thu, 17 Oct 2019 22:32:16 +0000
Received: from BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::7887:4f9c:70df:285c]) by BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::7887:4f9c:70df:285c%4]) with mapi id 15.20.2347.023; Thu, 17 Oct 2019
 22:32:16 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: x86-power-control
Thread-Topic: x86-power-control
Thread-Index: AQHVhIgk7/7PtKOKbUeMJf/8spu+0qde/1mA///3sgA=
Date: Thu, 17 Oct 2019 22:32:16 +0000
Message-ID: <37843B68-8D1C-48EB-B4B6-64CBC8F62F77@fb.com>
References: <EA590716-271A-4F5C-9B36-80260B7F35B6@fb.com>
 <66afaaab-baee-fc02-371b-2ef4a9f0d1ee@linux.intel.com>
In-Reply-To: <66afaaab-baee-fc02-371b-2ef4a9f0d1ee@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:f653]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d6e983f-d94b-4177-9c43-08d75351dd5d
x-ms-traffictypediagnostic: BY5PR15MB3683:
x-microsoft-antispam-prvs: <BY5PR15MB368365F23752377DBB6B6456DD6D0@BY5PR15MB3683.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(376002)(346002)(366004)(396003)(39860400002)(199004)(189003)(53546011)(186003)(316002)(6116002)(14444005)(256004)(305945005)(102836004)(446003)(478600001)(476003)(2616005)(7736002)(14454004)(110136005)(6506007)(486006)(2906002)(8936002)(99286004)(33656002)(5660300002)(11346002)(229853002)(76176011)(6246003)(2501003)(6486002)(25786009)(86362001)(8676002)(46003)(66556008)(64756008)(66446008)(36756003)(81166006)(66476007)(71200400001)(76116006)(6436002)(66946007)(71190400001)(6512007)(91956017)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR15MB3683;
 H:BY5PR15MB3636.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iHdVDlnRmJplhfuUKW5q4CXgX7eK3mLNKNSMF3Lap8Ro1y24WwZZ1cTEQveEkZBzrXCpMo6sAm+KP/4Hc8IG4LtQjJvbyVBTD2XAuLqyQf8LcBDQaopH5e2A4Nl2ACPKpIE/YwZeSjvcXimakuK5AiaUgi4Y+1c2hpGKjcViUxfBoklTifh0YqNYd8r17CtO6QEv/+nGsdPZxv6Ol6DMXlqiBbm9kW7YCFAx/W0MDo2ecFyrj+aJJouNmYQuZTEqmw8zcmjNNRrG6kRPsl/NzYCi29Nf/y5JoOwxeOBWHS0Q88YJkqJ1TcR+3ICMeD0gOL9vI0AxE6BQbFf0+dAvH1352BW2z6HS2h5rgmbDCnFm9mCf8+9M7eWUNEytDu5LgoIlmuGSNFjKE2WMInQUJdunWKT9xqVjrPRGQAEO5CQ=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <6FD3282CCA24A8468E178B123AC95669@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d6e983f-d94b-4177-9c43-08d75351dd5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 22:32:16.6141 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oM88v6TDIkI1j659ANF7x6qdg+s97Z9HJzO4quTY0sYbqMxsBBylud4bPdw5gTabAEbAOLspOOqWexjr8PgfcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3683
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-17_06:2019-10-17,2019-10-17 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 lowpriorityscore=0
 clxscore=1011 impostorscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0 adultscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910170198
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

DQrvu79PbiAxMC8xNy8xOSwgOTowMyBBTSwgIm9wZW5ibWMgb24gYmVoYWxmIG9mIEJpbGxzLCBK
YXNvbiBNIiA8b3BlbmJtYy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxhYnMu
b3JnIG9uIGJlaGFsZiBvZiBqYXNvbi5tLmJpbGxzQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6DQoN
CiAgICBIaSBWaWpheQ0KICAgIA0KICAgIE9uIDEwLzE2LzIwMTkgNjoxMyBQTSwgVmlqYXkgS2hl
bWthIHdyb3RlOg0KICAgID4gT25lIG1vcmUgcXVlc3Rpb24gb24gY29kZSwgSSBzZWUgZm9sbG93
aW5nIGNvZGUgcmVxdWlyZXMgcG93ZXJCdXR0b25NYXNrIA0KICAgID4gdG8gYmUgc2V0IGJlZm9y
ZSBhcXVpcmluZyBHUElPIGxpbmUuIFBsZWFzZSBsZXQgbWUga25vdyB3aG8gc2V0cyB0aGlzIA0K
ICAgID4gcG93ZXJCdXR0b25NYXNrIHRvIHRydWUuIEkga25vdyB0aGlzIGlzIHJlbGF0ZWQgdG8g
R1BJTyBwYXNzdGhyb3VnaCBidXQgDQogICAgPiBzdGlsbCBjb3VsZG7igJl0IHVuZGVyc3RhbmQg
d2hlcmUgaW4gY29kZSBpdCBnZXRzIHNldCB1bnRpbCBzb21lb25lIGNhbGwgDQogICAgPiBzZXQt
cHJvcGVydHkgb2YgZGJ1cy4NCiAgICANCiAgICBwb3dlckJ1dHRvbk1hc2sgaXMgYSBncGlvZDo6
bGluZSBvYmplY3QgdGhhdCByZXR1cm5zIHRydWUgaWYgaXQgDQogICAgcmVmZXJlbmNlcyBhIEdQ
SU8gbGluZSBhbmQgZmFsc2Ugb3RoZXJ3aXNlLg0KDQpJIHVuZGVyc3Rvb2QgY29kZSBidXQgbXkg
cG9pbnQgaGVyZSBpcyB0aGVyZSB3aWxsIG5vdCBiZSBhbnkgDQpncGlvZDo6bGluZSBvYmplY3Qg
aWYgcG93ZXJCdXR0b25NYXNrIGlzIGRlZmluZWQgYXMgZmFsc2UuIEFuZCANCmluaXRpYWxseSBp
dCBpcyBkZWZpbmVkIGFzIGZhbHNlIG1lYW5zIHRlaHJlIHdpbGwgbm90IGJlIGFueSBsaW5lIA0K
b2JqZWN0IGNyZWF0ZWQgdW50aWwgc29tZW9uZSBzZXRzIGl0IHRvIHRydWUuIEFuZCBJIGRvbid0
IHNlZSBpdCANCmFueSB3YXkgdG8gc2V0IGl0IHRydWUgb3RoZXIgdGhhbiBzZXQtcHJvcGVydHkg
dGhyb3VnaCBkYnVzLg0KICAgIA0KICAgID4gDQogICAgPiBwb3dlcl9jb250cm9sOjpwb3dlckJ1
dHRvbklmYWNlLT5yZWdpc3Rlcl9wcm9wZXJ0eSgNCiAgICA+IA0KICAgID4gIkJ1dHRvbk1hc2tl
ZCIsIGZhbHNlLCBbXShjb25zdGJvb2xyZXF1ZXN0ZWQsIGJvb2wmIGN1cnJlbnQpIHsNCiAgICA+
IA0KICAgID4gaWYocmVxdWVzdGVkKQ0KICAgID4gDQogICAgPiB7DQogICAgPiANCiAgICA+IGlm
KHBvd2VyX2NvbnRyb2w6OnBvd2VyQnV0dG9uTWFzaykNCiAgICA+IA0KICAgID4gew0KICAgIFRo
aXMgd2lsbCByZXR1cm4gaWYgcG93ZXJCdXR0b25NYXNrIGFscmVhZHkgcmVmZXJlbmNlcyBhIEdQ
SU8uDQogICAgDQogICAgPiANCiAgICA+IHJldHVybjE7DQogICAgPiANCiAgICA+IH0NCiAgICA+
IA0KICAgID4gaWYoIXBvd2VyX2NvbnRyb2w6OnNldEdQSU9PdXRwdXQoDQogICAgPiANCiAgICA+
ICJQT1dFUl9PVVQiLCAxLCBwb3dlcl9jb250cm9sOjpwb3dlckJ1dHRvbk1hc2spKQ0KICAgIE90
aGVyd2lzZSwgdGhpcyB3aWxsIHJlcXVlc3QgdGhlICJQT1dFUl9PVVQiIEdQSU8gYW5kIGFzc2ln
biBpdCB0byANCiAgICBwb3dlckJ1dHRvbk1hc2sgKHdoaWNoIHdpbGwgbWFrZSBpdCByZXR1cm4g
dHJ1ZSkuDQogICAgDQogICAgPiANCiAgICA+IHsNCiAgICA+IA0KICAgID4gdGhyb3dzdGQ6OnJ1
bnRpbWVfZXJyb3IoIkZhaWxlZCB0byByZXF1ZXN0IEdQSU8iKTsNCiAgICA+IA0KICAgID4gcmV0
dXJuMDsNCiAgICA+IA0KICAgID4gfQ0KICAgID4gDQogICAgPiBzdGQ6OmNlcnIgPDwgIlBvd2Vy
IEJ1dHRvbiBNYXNrZWQuXG4iOw0KICAgID4gDQogICAgPiB9DQogICAgPiANCiAgICA+IGVsc2UN
CiAgICA+IA0KICAgID4gew0KICAgID4gDQogICAgPiBpZighcG93ZXJfY29udHJvbDo6cG93ZXJC
dXR0b25NYXNrKQ0KICAgID4gDQogICAgPiB7DQogICAgVGhpcyB3aWxsIHJldHVybiBpZiBwb3dl
ckJ1dHRvbk1hc2sgZG9lcyBub3QgcmVmZXJlbmNlIGEgR1BJTyBsaW5lLg0KICAgIA0KICAgID4g
DQogICAgPiByZXR1cm4xOw0KICAgID4gDQogICAgPiB9DQogICAgPiANCiAgICA+IHN0ZDo6Y2Vy
ciA8PCAiUG93ZXIgQnV0dG9uIFVuLW1hc2tlZFxuIjsNCiAgICA+IA0KICAgID4gcG93ZXJfY29u
dHJvbDo6cG93ZXJCdXR0b25NYXNrLnJlc2V0KCk7DQogICAgT3RoZXJ3aXNlIHRoaXMgd2lsbCBy
ZXNldCBwb3dlckJ1dHRvbk1hc2sgdG8gcmVsZWFzZSB0aGUgIlBPV0VSX09VVCIgDQogICAgR1BJ
TyAod2hpY2ggd2lsbCBtYWtlIGl0IHJldHVybiBmYWxzZSkuDQogICAgDQogICAgPiANCiAgICA+
IH0NCiAgICA+IA0KICAgID4gUmVnYXJkcw0KICAgID4gDQogICAgPiAtVmlqYXkNCiAgICA+IA0K
ICAgIA0KDQo=
