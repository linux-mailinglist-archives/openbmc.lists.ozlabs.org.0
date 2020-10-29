Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B371229F77A
	for <lists+openbmc@lfdr.de>; Thu, 29 Oct 2020 23:12:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMfnP2dGpzDqcT
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 09:12:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=85713010a6=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=mSnrq4o4; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=bLMa0AMK; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMflN1fwpzDqcD
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2020 09:10:37 +1100 (AEDT)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09TMAT5B011858; Thu, 29 Oct 2020 15:10:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=3cLto//c6l9Pmimqwvh63vj5aedJn+e+L+8TqrWMnaA=;
 b=mSnrq4o4pf1RRwleM1peyH/f5dzcvB78CdqTKBwTbDXSme6OjIu/3FsaPF/Q/aQRPn6R
 OO0FJB0bV4MGUBMfFTEKwanLR6liMA1WYAjVyzSl+9Ul+qSYpmP0fJSSKJI1a/OBlp1t
 0pwmtEU8ptDmej4AxSlriXqoQVjqLMlDu58= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 34er6e6n58-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 29 Oct 2020 15:10:32 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 29 Oct 2020 15:10:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OT9Ip+oEY4eX6B+ZV4hPt56mZz0C3G5CZ3rC3njRFpUbKqbhmw0UUzIIjwfrocUTY/n+rQ4OXfJM57TcY6TcBn0NuWrB89v3zQ/HlG7akbqhm7WHI6juSlu1l3Q+lNDZD4pJ6ovOLDluhG55g9JavkIKPP6xCVTgITyp12o2ug1HCjJPwKDtJp7u4xwsC0X9eYKl0HslUNRb9eY3iFAyfvxnwRoOPCJPimQwuPg7rVBi6srJ7xQLYpcDUpE8OMxxTBoq4ltMGUnSbRDQg4E3MH3cPa8t9YOJ1pP6tsogYh61WylHAHO7gwSzhpbCiiddBXeErXSMhMi0+EDSbEsiUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3cLto//c6l9Pmimqwvh63vj5aedJn+e+L+8TqrWMnaA=;
 b=fs0lGvjlzNNmkAt4mk6/jlY+HfPiZ4cVyZZWsJmB0/bQI2IuaO6YssnAp6tR6jIyDscPN5IZWdUJHQ1UlUnGWxrfeMnV94Ur/uku9uF5v2BztV43g9B0bws0ScpD+EMStVdElHAzsPRANv8jeICEkGJcBLiSeUzGkN8fJTKhpa9tqPjaY5TUtNNhLHpr/LVaBShUz5Z6jjYXGZrXx355pyl3LkjOVRLpeyU7lOt6cqANUBTcjxY/7mwjLjOHc8xyr4vv5Rh5nHiZ9/6g1zZPyyo3gjQUVscXwVCnMNUIpru27ezefAQ7yY5iELyhACpxdE5av46bbQF6qVn5jOLsWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3cLto//c6l9Pmimqwvh63vj5aedJn+e+L+8TqrWMnaA=;
 b=bLMa0AMKwgBdH7BZdjZMF30DIlFCSQZmpAwejjvPo+x8jixcWK2CkbsiG8gONT3cfMhWiuU3EBfR401J6ZQ3F9n6TD+6wP1k7M0Q0V859HgVaxhOPeO5njRmUdNXlnS84iekLd7MYAjwMHrF+p2aEuhvnIUuxRWqaur7OpHGo3Y=
Received: from BY5PR15MB3537.namprd15.prod.outlook.com (2603:10b6:a03:1f5::20)
 by BYAPR15MB2551.namprd15.prod.outlook.com (2603:10b6:a03:14e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Thu, 29 Oct
 2020 22:10:16 +0000
Received: from BY5PR15MB3537.namprd15.prod.outlook.com
 ([fe80::5cb9:7809:838b:488a]) by BY5PR15MB3537.namprd15.prod.outlook.com
 ([fe80::5cb9:7809:838b:488a%5]) with mapi id 15.20.3477.029; Thu, 29 Oct 2020
 22:10:16 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Patrick Voelker <Patrick_Voelker@phoenix.com>, "OpenBMC
 (openbmc@lists.ozlabs.org)" <openbmc@lists.ozlabs.org>
Subject: Re: Using local git repo for recipe development
Thread-Topic: Using local git repo for recipe development
Thread-Index: AdauFs6ToZT99Bk/To2jUGwd1837nv//sAwA//9nhrCAAMYGgA==
Date: Thu, 29 Oct 2020 22:10:16 +0000
Message-ID: <FA7A7193-3946-44AC-BF2E-6A5071D35690@fb.com>
References: <0bf9e810dbce40bf90d96a4d39e55d68@SCL-EXCHMB-13.phoenix.com>
 <42E14EF0-5851-4223-A3A5-07DC8837EF29@fb.com>
 <20cf0460e28a4950b0b3429d77da276c@SCL-EXCHMB-13.phoenix.com>
In-Reply-To: <20cf0460e28a4950b0b3429d77da276c@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: phoenix.com; dkim=none (message not signed)
 header.d=none;phoenix.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:92f7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f1c0ba3-2758-44fc-a44f-08d87c576acb
x-ms-traffictypediagnostic: BYAPR15MB2551:
x-microsoft-antispam-prvs: <BYAPR15MB25517F29A65126759081655ADD140@BYAPR15MB2551.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:1051;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H4Zk9q5kpwTB+iTty5h0+eyppLqCZuSQ51A8CK+fk2t42/iqKWidtD89Z+8fcwPUC9YR6+0kcEx3t4Xd0b+o+xf8mf05dNYSgBxkK/zc+ZTnQGnNgzShYMzAwjub4sH6ksir77JKIWuf41OF8CjF0/cbauXLEiphbXqvzE/cg/7k5+bRl+fNQAuD+vnWO9dPUGsc78xv9+9dAixuqbWXzqpe5Ax64eq9D9b6NL1YfoP2FRC4Ep2utF8h5CLKXHhoUKCKBAkCfqPkMetw7XefNzGCjHEdvJvJ71wtIuLAnhPBdDdWoReR7rNYJhlyRMldA+X0n7z99Gocb0RMnZsehw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3537.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(396003)(366004)(346002)(39860400002)(36756003)(2906002)(5660300002)(83380400001)(6506007)(53546011)(86362001)(186003)(6512007)(110136005)(33656002)(316002)(71200400001)(64756008)(8936002)(66446008)(66556008)(66476007)(2616005)(66946007)(6486002)(8676002)(478600001)(91956017)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: KkFDQ53PeuULt62b9QlKvWmeOs2yb5DUYi8SvpcODNZX/H1fcz2QzG0/cWU0MPLOYqAMaFqn/rRxCRQ7Jt9M2YXPuH2g2cIMA9/AD4W+N664bykbUluPgedil+ytBFcJ/x1lnM7H2p3iKJvQNe+NQkTy2aHgSBTa/aEHNGJVKv/aD7xpXeCofYioCrmj77qNLbhk8lqhQs7thKpusuAgmssZ0OnfRW69oziMmRy+qd9qCsOgq3acWJs7rU2QnUL80y2u8J/AJIyCDQOnRbskHkfzQGvjNjU2cYgmEdL3dBGf194JfJ8PhA3UV8HN/oPWY26LLZfmk0pYTN+o5P8q7OElKk5vxhBo629nBljsxbS6WS1E62lSA5hWWBf/B0mFuie5Pf3mNgoVKb3RMSwshcUVULclnurLddg34KmTdo54IvVQXPM9x3PdO6CZ+QENeXst7VDxl7E01s3mOFjPgXHBaajHnT/E3oULG2R2KTWTOsY6eOxvLHyS5e7rAJx8I4u71vqyGDxNWcpcgKWrn/eDY7EI34booa+3qBprtsP0vdveEZfPI9hMx7zugzaXpOnigIh6aOXgUASZy6Ee18EM8ktx/Sg4g1FMeOrTzZtOu0VD8yZAL+TU92QEuJu3kKIQ8e883ijSr84Qd+0BAmFUHvLlct08wvQziusV2/5hSVkII0L6bN2EXFKQokz4
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <CE3BFA5B97B16E4FA95FD698E89EB65E@namprd15.prod.outlook.com>
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3537.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f1c0ba3-2758-44fc-a44f-08d87c576acb
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2020 22:10:16.7835 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MnlpXT1FKuhCkN7ZXjoN7WSlleSgxqHBephOFpb8n+fjCB9WrHiHGDzGMaoar1hcAwRM7nhwq0KwfTDPtfwLCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2551
X-OriginatorOrg: fb.com
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-29_12:2020-10-29,
 2020-10-29 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 lowpriorityscore=0
 suspectscore=0 adultscore=0 spamscore=0 mlxlogscore=999 clxscore=1011
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010290151
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

V2hhdCBhcmUgeW91IHRyeWluZyB0byBhY2hpZXZlIGhlcmUsIGRldnRvb2wgaXMgZm9yIGxvY2Fs
IHNvdXJjZSBhbmQgeW91IA0KYWxyZWFkeSBoYXZlIGxvY2FsIHNvdXJjZSwganVzdCBidWlsZCBp
dCBmcm9tIHRoZXJlLg0KDQrvu79PbiAxMC8yOS8yMCwgMjozMyBQTSwgIlBhdHJpY2sgVm9lbGtl
ciIgPFBhdHJpY2tfVm9lbGtlckBwaG9lbml4LmNvbT4gd3JvdGU6DQoNCiAgICBWaWpheSwgdGhh
dCBkaWRuJ3QgbWFrZSBhbnkgZGlmZmVyZW5jZS4gIEkgZ2V0IHRoZSBzYW1lIHJlc3VsdC4NCg0K
ICAgID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCiAgICA+IEZyb206IFZpamF5IEtoZW1r
YSBbbWFpbHRvOnZpamF5a2hlbWthQGZiLmNvbV0NCiAgICA+IFNlbnQ6IFRodXJzZGF5LCBPY3Rv
YmVyIDI5LCAyMDIwIDEyOjI3IFBNDQogICAgPiBUbzogUGF0cmljayBWb2Vsa2VyOyBPcGVuQk1D
IChvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcpDQogICAgPiBTdWJqZWN0OiBSZTogVXNpbmcgbG9j
YWwgZ2l0IHJlcG8gZm9yIHJlY2lwZSBkZXZlbG9wbWVudA0KICAgID4gDQogICAgPiANCiAgICA+
IA0KICAgID4gT24gMTAvMjkvMjAsIDEwOjE3IEFNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgUGF0
cmljayBWb2Vsa2VyIiA8b3BlbmJtYy0NCiAgICA+IGJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29t
QGxpc3RzLm96bGFicy5vcmcgb24gYmVoYWxmIG9mDQogICAgPiBQYXRyaWNrX1ZvZWxrZXJAcGhv
ZW5peC5jb20+IHdyb3RlOg0KICAgID4gDQogICAgPiAgICAgSSdtIGNyZWF0aW5nIGEgbmV3IHJl
Y2lwZSBmb3IgbG9jYWwgZGV2ZWxvcG1lbnQgYnV0IHdoZW4gSSBkbyBhICdkZXZ0b29sDQogICAg
PiBtb2RpZnkgPHJlY2lwZT4nIGl0IGFsd2F5cyBzZWVtcyB0byBtYWtlIGFuIGVtcHR5IGRpcmVj
dG9yeSAodGhhdCBjb250YWlucw0KICAgID4gb25seSAuZ2l0LikNCiAgICA+IA0KICAgID4gICAg
IEhlcmUncyB0aGUgcmVsZXZhbnQgbGluZXMgZnJvbSBteSAuYmIgZmlsZToNCiAgICA+ICAgICBT
UkNfVVJJID0gImdpdDovLy9ob21lL3B2b2Vsa2VyL2JtYy9kZXYvb2VtO3Byb3RvY29sPWZpbGUi
DQogICAgPiANCiAgICA+IEkgYW0gbm90IHRvbyBzdXJlIGJ1dCB0aGlzIHNob3VsZCBiZSBmaWxl
Oi8vLCBZb3UgbWF5IGhhdmUgdG8gZml4IGFib3ZlIGxpbmUuDQogICAgPiANCiAgICA+ICAgICBT
UkNSRVYgPSAiNGRiMTdmNDgyYjBiZGNkY2Y1NjU4YzdkMzIzY2M1NjNlYjc4NTU2YSINCiAgICA+
ICAgICBpbmhlcml0IGF1dG90b29scw0KICAgID4gDQogICAgPiAgICAgSGVyZSdzIHRoZSB3YXJu
aW5nIGZyb20gJ2RldnRvb2wgbW9kaWZ5JzoNCiAgICA+ICAgICBXQVJOSU5HOiBObyBzb3VyY2Ug
dW5wYWNrZWQgdG8gUyAtIGVpdGhlciB0aGUgcGhvZW5peC1vZW0gcmVjaXBlDQogICAgPiBkb2Vz
bid0IHVzZSBhbnkgc291cmNlIG9yIHRoZSBjb3JyZWN0IHNvdXJjZSBkaXJlY3RvcnkgY291bGQg
bm90IGJlDQogICAgPiBkZXRlcm1pbmVkDQogICAgPiANCiAgICA+ICAgICBJZiBJIGNoYW5nZSBl
aXRoZXIgdGhlIFNSQ19VUkkgb3IgdGhlIFNSQ1JFViB0byBiZSBpbnZhbGlkLCBJIGdldCBhbiBl
cnJvcg0KICAgID4gaW5zdGVhZCBvZiBhIHdhcm5pbmcgc28gaXQncyBkZWZpbml0ZWx5IGZpbmRp
bmcgdGhlIGxvY2FsIHJlcG8uDQogICAgPiANCiAgICA+ICAgICBJIGNhbid0IGZpZ3VyZSBvdXQg
d2h5IG5vbmUgb2YgdGhlIGZpbGVzIGluIG15IGNvbW1pdCBhcmUgbWFraW5nIGl0IGludG8gdGhl
DQogICAgPiB1bnBhY2sgZGlyZWN0b3J5LiAgQW55IGlkZWFzIG9yIHRpcHMgb24gZGVidWdnaW5n
PyAgSSBhbHNvIHRyaWVkIHVzaW5nICBhIC50YXIuZ3oNCiAgICA+IGZpbGUgaW5zdGVhZCBvZiBh
IGxvY2FsIGdpdCByZXBvIGFuZCBoYWQgdGhlIHNhbWUgcmVzdWx0Lg0KICAgID4gDQoNCg0K
