Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E33A8250BFA
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 00:59:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bb6xk3Fs7zDqQf
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 08:59:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=550569eddf=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=P715ICbU; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=O4djTbkN; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bb6x00BgKzDqGt
 for <openbmc@lists.ozlabs.org>; Tue, 25 Aug 2020 08:58:26 +1000 (AEST)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07OMp0b6002377; Mon, 24 Aug 2020 15:58:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=uqB0NEqRSKDnINU0fBgtoOmMqakjyYey073L8vKEj6s=;
 b=P715ICbUjUVMs3p/G79dFbixtlS6xycb88gF9dL6QLwNCqgApyAlabg+rF9A2/1NMdgd
 F47/cFiLFfCU5t2hkL08GZ3Z5bKYVZuZasXJ4d+6Eo/JD3vyAdaI+mBGgjlobVs9asK4
 2ubaWWOgaAesEKyZ43rBtwojQceUlNzaERU= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 333jv9qnaf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 24 Aug 2020 15:58:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.175) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 24 Aug 2020 15:58:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aq4g2aFERplmxq6qLIBZHiQqu9A8CTl7/ocNfKgz+AyGq3SJ9y1EYKmQEHdoBAuAd2N//wkYyh73RPRcFNXGgjGxlUXx4tls2xtI5Ph2nQxX/B3Q44d0aiac0fEnb+UAtR3FxWUurBry0aRXZ/AHjRXzv94Cb97X9900112VVN6gM9EJhbn49Q0y1sWz2lZORe8W/0X3jwzDHgQ7fN3lej+7D2Hjqx8Yx3eC6OGc5Ap9fpxvu0POUmy8S5dc4cAv45yyudjhLTq6VdKYNVgSW2SdSll2PlVAznpeXXs5OUCGRstKyJ4Zey+EpSnzH50LwvSzmD9JkCMoiZBDh1M3Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqB0NEqRSKDnINU0fBgtoOmMqakjyYey073L8vKEj6s=;
 b=NJXc0cPW0CN6vRZVYeOOJT8FziJSWWGsZ1yzXcvJlGB7O1UVZ3woJRCs1Iy4fIuzveHvfsi7UIt+QeGOk9MliqNxdOfZwfQHZ6Zwcvf/ailzqsebxd/+wB7jVi3zvW7XNKPxC6qZq8OxdzYi2ghPguGWWV0uIqwuVk1tjG3skFWjURMijEa5gKhuQh0g7YP7T25tIU8cL6wknC6VLTT/se6Md6/+m1liCElykbmnFYxRmZUw76m6ED36FhaKJNlKTvckH3x6WLgRTi6m8oqdZjaMkmSZHD43H2O+jT/FaXNstgasaKObSQ3KozSMl4dXC/3AJgYRE9mFrjAH49fsMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqB0NEqRSKDnINU0fBgtoOmMqakjyYey073L8vKEj6s=;
 b=O4djTbkNF3v7TVSvL9x4HhfqQVeJ74zvBDesw45OP3l7p6ZGeQm7/2GFbip6cIwV8XHGsT6onn1jNkbVHKavD4vzNJRoH8x1FhwZoaV8krZsV11iy+hi2NGRER+Saoo461WlJHw3hQB1BgjiRwXZRnh+a4mcRxRly5vW2CVAPMI=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB3048.namprd15.prod.outlook.com (2603:10b6:a03:fc::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Mon, 24 Aug
 2020 22:58:22 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::2908:ebc2:73a5:45b3]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::2908:ebc2:73a5:45b3%5]) with mapi id 15.20.3305.026; Mon, 24 Aug 2020
 22:58:15 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Neil Bradley <Neil_Bradley@phoenix.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Tioga Pass OpenBMC 2.8
Thread-Topic: Tioga Pass OpenBMC 2.8
Thread-Index: AdZ4G9/pZ44Ttxs7TiCWRTJU7JTTHQCA72kAAA7UvED//6jeAA==
Date: Mon, 24 Aug 2020 22:58:15 +0000
Message-ID: <C502135A-6D7F-4796-8161-9D99FFB8643C@fb.com>
References: <c27c916296c14b7a973ce10ce462a574@SCL-EXCHMB-13.phoenix.com>
 <5F804DFD-B91D-4293-A410-62ED737423A7@fb.com>
 <6bc3d9da57d44f55ad66179e74a51bd1@SCL-EXCHMB-13.phoenix.com>
In-Reply-To: <6bc3d9da57d44f55ad66179e74a51bd1@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: phoenix.com; dkim=none (message not signed)
 header.d=none;phoenix.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2601:647:4b00:fd70:18e2:66b5:5e3d:3d1a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad883c54-2e94-44d3-14ad-08d848812f3e
x-ms-traffictypediagnostic: BYAPR15MB3048:
x-microsoft-antispam-prvs: <BYAPR15MB30487CD2532CF74A1D8BC624DD560@BYAPR15MB3048.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xLtgiy2gIa39sYlGG/RAe8p/qwzkA+7FlKI+AlTSRZGgeqbYV0/cPb8IHj+djjPtxvPWg61/YRQUZXxP5uwybRdv5HDKoFkTNmQXPwT2erASSgvTeGzN1yWzzBZV3AUDC0tROwUKvs3E8n7eyAkGVppqZ13j6q9sN9Oxvspekgh5bfrfyy4yqvl33JTltd3B8I6MHE4K5mpXGcY9LVKjQb5jWyX7In6XSXeiDflVPkko8FGjNQPBlkJlRkccZR9Q3EUdvkQJezKDNZejA27y6CY1N1G91BmAd215W2tqHUlysAsAW2pt3h79JTdUKBSo5NJ0nZPnlsK8rSEDVINA6/XAOU6b+bLS0EBcTyEHi5ryCDKrG4p6vwI0ZskCZ4+cBrGPqTeaU8EOJP1tEfPqIQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(376002)(396003)(39860400002)(346002)(8936002)(110136005)(2906002)(36756003)(186003)(7116003)(6512007)(66556008)(66476007)(76116006)(2616005)(6486002)(6506007)(71200400001)(33656002)(86362001)(53546011)(8676002)(5660300002)(166002)(66446008)(66946007)(478600001)(64756008)(316002)(83380400001)(966005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: hRdGtvFXP8R5X/ztFCo/FNfPISPgwfozsE7OeMBQpgEJ+K+tuVAjC2QKCf4Ui2Ajqzij+OGRDW8qqMDyzwG8XRpF/iNyJZVBCcYwpLNJGgHLYDBdWG7aCOkBXWbNNz8ENsJa/WNkswzwBoXoAfZbfMLmKU3+c9C40nYFmjReZUphw1e4+oHhW+Q3bIU8NoAfi5Sq9kQW9iZT2hnqYvR027wvbq0vEk6ktsz9eIirBdr3ZDc4GBE3/uc0S/+Dx2P9pIz8qTcUptAclp5CM+1zrTQsqezcstW0Nk390an0gZFjDVLb5ee5K64riU8+TPIHJTHy4U9Sd4XylNEAibtqwMP8UvfLnw+EVETrDd8GyXAL4dXSuvu0fqfl+d41FisD5D2w3YkITVE49Vr7XZmAI3DkMiqNyf8wwE/w3dFpwEGnMBDJOBoJAvwywCC0uizvZ2R80av5CLWOGl3lg2rBHnm2y2K+YXP7YcyMdRsGQGxLyqUMFRPAtfbu9LEGpUgklNMTIw81UntjraGvcLfrpRzcPsJ+P4YatcsOzeDz7yalJA9Mhgq0/A+oPR1FHfZ8VKNNOOVSqp1mAP9qx/3rEAnNZG9wgOTQao0OU1ApSU5NX9+itpdChkoK8inDWMLP7HS0I1QAN3n8jcAXql7uhv3eNTzQPfrYAqAyUD9WTLSjYwl+aVpsfa8z0/ycgvBG+Xfhu8kf00+gKJbWRSST9A==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_C502135A6D7F479681619D99FFB8643Cfbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad883c54-2e94-44d3-14ad-08d848812f3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2020 22:58:15.2244 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JGrasRCo344W/zQi6BJyntzYosLsblwMumXnePXmEGtAus8I4q2ICW0jqm2sYFSalCESQTDrewHArhIXuBkBCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3048
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-24_12:2020-08-24,
 2020-08-24 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 clxscore=1015 mlxscore=0
 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008240180
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

--_000_C502135A6D7F479681619D99FFB8643Cfbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UGxlYXNlIGlnbm9yZSBiZWxvdyBOQ1NJIG1lc3NhZ2UsIEkgYW0gYXNzdW1pbmcgdGhhdCB5b3Ug
aGF2ZSBpbWFnZSBib290IHVwIHRvIGxvZ2luIHByb21wdC4gWW91IGNhbiB1c2UgcG93ZXItdXRp
bCB0byBwb3dlciBvbiBvciBvZmYgaG9zdCBzeXN0ZW0uIFllcyB5b3UgbmVlZCBNRSBzdXBwb3J0
IGluIHlvdXIgVUVGSSBpbWFnZSwgYXMgd2hlbiB5b3UgcG93ZXIgb24gc3lzdGVtIEJNQyByZWFk
cyBhbmQgbW9uaXRvciBNRSBzZW5zb3IgdmlhIElQTUIgYnV0IGlmIE1FIGlzIG5vdCBhdmFpbGFi
bGUgdGhlbiBpcG1iIHdpbGwgdGhyb3cgZXJyb3IuDQoNClBsZWFzZSBsZXQgbWUga25vdyBhbnkg
b3RoZXIgaXNzdWVzIHlvdSBhcmUgZ2V0dGluZywgSSB3aWxsIHRyeSB0byByZXNvbHZlIHRoYXQu
DQoNCkZyb206IG9wZW5ibWMgPG9wZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlz
dHMub3psYWJzLm9yZz4gb24gYmVoYWxmIG9mIE5laWwgQnJhZGxleSA8TmVpbF9CcmFkbGV5QHBo
b2VuaXguY29tPg0KRGF0ZTogTW9uZGF5LCBBdWd1c3QgMjQsIDIwMjAgYXQgMjoxOSBQTQ0KVG86
ICJvcGVuYm1jQGxpc3RzLm96bGFicy5vcmciIDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQpT
dWJqZWN0OiBSRTogVGlvZ2EgUGFzcyBPcGVuQk1DIDIuOA0KDQpUaGFua3MgZm9yIHRoZSByZXBs
eSwgVmlqYXkhIFRoZSBwYXJ0IHdhcyBwcm9ncmFtZWQgZGlyZWN0bHkgd2l0aCBhIGRlZGlwcm9n
LiBIZXkgQnJ1Y2UsIGNhbiB5b3UgcG9zdCB0aGUgZnVsbCBib290IGxvZyBvZiB0aGF0IFRQIHN5
c3RlbT8gVmlqYXksIEJydWNlIChpbiBhbm90aGVyIHRocmVhZCkgZGlkIHNlZSB0aGlzIG9uIHRo
ZSBib290IGxvZywgYnV0IEnigJlsbCB3b3JrIHRvIGdldCB5b3UgdGhlIGZ1bGwgYm9vdCBjb25z
b2xlOg0KDQoNClsgICAgMS44NTQ5MzldIGZ0Z21hYzEwMCAxZTY2MDAwMC5ldGhlcm5ldDogVXNp
bmcgTkNTSSBpbnRlcmZhY2UNCg0KWyAgIDE3LjgzMTgyN10gZnRnbWFjMTAwIDFlNjYwMDAwLmV0
aGVybmV0IGV0aDA6IE5DU0k6IEhhbmRsZXIgZm9yIHBhY2tldCB0eXBlIDB4ODIgcmV0dXJuZWQg
LTE5DQoNClsgICAzMy41MjY5NTBdIGZ0Z21hYzEwMCAxZTY2MDAwMC5ldGhlcm5ldCBldGgwOiBO
Q1NJOiAnYmFkJyBwYWNrZXQgaWdub3JlZCBmb3IgdHlwZSAweDhiDQoNClsgICAzMy41MzU1NjRd
IGZ0Z21hYzEwMCAxZTY2MDAwMC5ldGhlcm5ldCBldGgwOiBOQ1NJOiAnYmFkJyBwYWNrZXQgaWdu
b3JlZCBmb3IgdHlwZSAweDhiDQoNClsgICAzMy41NDM4MTNdIGZ0Z21hYzEwMCAxZTY2MDAwMC5l
dGhlcm5ldCBldGgwOiBOQ1NJOiAnYmFkJyBwYWNrZXQgaWdub3JlZCBmb3IgdHlwZSAweDhiDQoN
ClsgICAzMy41NTQzNDVdIGZ0Z21hYzEwMCAxZTY2MDAwMC5ldGhlcm5ldCBldGgwOiBOQ1NJOiAn
YmFkJyBwYWNrZXQgaWdub3JlZCBmb3IgdHlwZSAweDhiDQoNClsgICAzMy41NjI1OThdIGZ0Z21h
YzEwMCAxZTY2MDAwMC5ldGhlcm5ldCBldGgwOiBOQ1NJOiAnYmFkJyBwYWNrZXQgaWdub3JlZCBm
b3IgdHlwZSAweDhiDQoNClsgICAzMy41NzA5NThdIGZ0Z21hYzEwMCAxZTY2MDAwMC5ldGhlcm5l
dCBldGgwOiBOQ1NJOiAnYmFkJyBwYWNrZXQgaWdub3JlZCBmb3IgdHlwZSAweDhiDQoNClsgICAz
My42MTI5MzZdIGZ0Z21hYzEwMCAxZTY2MDAwMC5ldGhlcm5ldCBldGgwOiBOQ1NJOiAnYmFkJyBw
YWNrZXQgaWdub3JlZCBmb3IgdHlwZSAweDhiDQoNClsgICAzMy42MjkzMThdIGZ0Z21hYzEwMCAx
ZTY2MDAwMC5ldGhlcm5ldCBldGgwOiBOQ1NJOiAnYmFkJyBwYWNrZXQgaWdub3JlZCBmb3IgdHlw
ZSAweDhiDQoNClsgICAzMy42Mzg2ODNdIGZ0Z21hYzEwMCAxZTY2MDAwMC5ldGhlcm5ldCBldGgw
OiBOQ1NJOiAnYmFkJyBwYWNrZXQgaWdub3JlZCBmb3IgdHlwZSAweDhiDQoNClsgICAzMy42NDc5
NzhdIGZ0Z21hYzEwMCAxZTY2MDAwMC5ldGhlcm5ldCBldGgwOiBOQ1NJOiAnYmFkJyBwYWNrZXQg
aWdub3JlZCBmb3IgdHlwZSAweDhiDQoNClsgICAzMy42NTcyOTFdIGZ0Z21hYzEwMCAxZTY2MDAw
MC5ldGhlcm5ldCBldGgwOiBOQ1NJOiAnYmFkJyBwYWNrZXQgaWdub3JlZCBmb3IgdHlwZSAweDhi
DQoNClsgICAzMy42NjU2OTBdIGZ0Z21hYzEwMCAxZTY2MDAwMC5ldGhlcm5ldCBldGgwOiBOQ1NJ
OiAnYmFkJyBwYWNrZXQgaWdub3JlZCBmb3IgdHlwZSAweDhiDQoNClsgICAzMy42NzM5NTZdIGZ0
Z21hYzEwMCAxZTY2MDAwMC5ldGhlcm5ldCBldGgwOiBOQ1NJOiAnYmFkJyBwYWNrZXQgaWdub3Jl
ZCBmb3IgdHlwZSAweDhiDQoNClsgICAzMy42ODIzODFdIGZ0Z21hYzEwMCAxZTY2MDAwMC5ldGhl
cm5ldCBldGgwOiBOQ1NJOiAnYmFkJyBwYWNrZXQgaWdub3JlZCBmb3IgdHlwZSAweDhiDQoNClsg
ICAzMy42OTA3OTJdIGZ0Z21hYzEwMCAxZTY2MDAwMC5ldGhlcm5ldCBldGgwOiBOQ1NJOiAnYmFk
JyBwYWNrZXQgaWdub3JlZCBmb3IgdHlwZSAweDhiDQoNClRoaXMgaXMgdGhlIGltYWdlIHdlIHVz
ZWQ6DQoNCi1ydy1yLS1yLS0gMiBicnVjZSBicnVjZSAzMzU1NDQzMiBBdWcgMjEgMTc6NTAgb2Jt
Yy1waG9zcGhvci1pbWFnZS10aW9nYXBhc3MtMjAyMDA4MjExNzAxMzIuc3RhdGljLm10ZA0KDQpX
ZSBhcmUgYWxzbyB3b25kZXJpbmcgYWJvdXQgcG93ZXIgY29udHJvbC4gV2UgZ2V0IGFuIElQTUIg
ZXJyb3Igd2hlbmV2ZXIgd2UgZG8gYW55IHBvd2VyIGNvbnRyb2wgdmlhIElQTUkgaW5zdHJ1Y3Rp
b25zIChwb3dlciBidXR0b24gd29ya3MgaG93ZXZlcikgYW5kIGl0IGxvb2tzIGxpa2UgaXTigJlz
IHRhbGtpbmcgdG8gdGhlIE1FLiBBcmUgeW91IGZhbWlsaWFyIHdpdGggdGhlIE1F4oCZcyByb2xl
IGluIHBvd2VyIGNvbnRyb2wvc3RhdHVzPyBJIGNvdWxkbuKAmXQgZmluZCBhbnkgbWVudGlvbiBv
ZiB0aGUgTUUgaW4gdGhlIFRpb2dhIFBhc3Mgc3BlYywgc28gcGVyaGFwcyBJIG1pc3NlZCBpdC4g
SeKAmW0gc3VzcGVjdGluZyB0aGF0IG91ciBVRUZJIGltYWdlIGRvZXNu4oCZdCBoYXZlIHRoZSBy
aWdodCBNRSBpbWFnZSB0byBtYXRlIHVwIHdpdGggVGlvZ2EgUGFzcy4NCg0KVGhhbmsgeW91IQ0K
DQotLT5OZWlsDQoNCkZyb206IFZpamF5IEtoZW1rYSA8dmlqYXlraGVta2FAZmIuY29tPg0KU2Vu
dDogTW9uZGF5LCBBdWd1c3QgMjQsIDIwMjAgMjowNSBQTQ0KVG86IE5laWwgQnJhZGxleSA8TmVp
bF9CcmFkbGV5QHBob2VuaXguY29tPjsgb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQpDYzogUGF0
cmljayBWb2Vsa2VyIDxQYXRyaWNrX1ZvZWxrZXJAcGhvZW5peC5jb20+OyBCcnVjZSBNaXRjaGVs
bCA8QnJ1Y2VfTWl0Y2hlbGxAcGhvZW5peC5jb20+DQpTdWJqZWN0OiBSZTogVGlvZ2EgUGFzcyBP
cGVuQk1DIDIuOA0KDQpIaSBOZWlsLA0KSG93IGRpZCB5b3UgY29weSBpbWFnZSB0byB0YXJnZXQs
IEkgbWVhbiB3aGF0IGZpbGUgbmFtZSB5b3UgaGF2ZSBjb3BpZWQgYW5kIHdoYXQgd2FzIHNpemUu
DQpUaGVyZSBpcyBubyBpc3N1ZSBpbiBhdmFpbGFibGUgaW1hZ2UgZm9yIHRpb2dhcGFzcyBidWls
ZCBhbmQgaXQgc2hvdWxkIHdvcmsgc2VhbWxlc3NseS4NCg0KUGxlYXNlIHNoYXJlIGNvbnNvbGUg
Ym9vdCBsb2cgaWYgeW91IGhhdmUsIGRvIHlvdSBrbm93IHdoYXQgbmV0d29yayBjYXJkIHlvdSBz
eXN0ZW0gaGF2ZS4NCg0KUmVnYXJkcw0KLVZpamF5DQoNCkZyb206IG9wZW5ibWMgPG9wZW5ibWMt
Ym91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMub3psYWJzLm9yZzxtYWlsdG86b3BlbmJt
Yy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxhYnMub3JnPj4gb24gYmVoYWxm
IG9mIE5laWwgQnJhZGxleSA8TmVpbF9CcmFkbGV5QHBob2VuaXguY29tPG1haWx0bzpOZWlsX0Jy
YWRsZXlAcGhvZW5peC5jb20+Pg0KRGF0ZTogRnJpZGF5LCBBdWd1c3QgMjEsIDIwMjAgYXQgMTA6
NDAgUE0NClRvOiAib3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPG1haWx0bzpvcGVuYm1jQGxpc3Rz
Lm96bGFicy5vcmc+IiA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPG1haWx0bzpvcGVuYm1jQGxp
c3RzLm96bGFicy5vcmc+Pg0KQ2M6IFBhdHJpY2sgVm9lbGtlciA8UGF0cmlja19Wb2Vsa2VyQHBo
b2VuaXguY29tPG1haWx0bzpQYXRyaWNrX1ZvZWxrZXJAcGhvZW5peC5jb20+PiwgQnJ1Y2UgTWl0
Y2hlbGwgPEJydWNlX01pdGNoZWxsQHBob2VuaXguY29tPG1haWx0bzpCcnVjZV9NaXRjaGVsbEBw
aG9lbml4LmNvbT4+DQpTdWJqZWN0OiBUaW9nYSBQYXNzIE9wZW5CTUMgMi44DQoNCkdyZWV0aW5n
cyBmZWxsb3cgQk1DIGZvbGsg4oCTIEnigJltIE5laWwgQnJhZGxleSwgUGhvZW5peCBUZWNobm9s
b2dpZXPigJkgQk1DIGFyY2hpdGVjdCBhbmQgaGF2ZSBhIHF1ZXN0aW9uIGZvciB0aGUgZ3JvdXAu
DQoNCldlIGFyZSBhdHRlbXB0aW5nIHRvIGxvYWQgT3BlbkJNQyAyLjggb24gYSBUaW9nYSBQYXNz
LiBUaGlzIGlzIHdoYXQgd2UgZGlkOg0KDQpta2RpciB0aW9nYXBhc3MNCmNkIHRpb2dhcGFzcw0K
Z2l0IGNsb25lIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL29wZW5ibWMuZ2l0DQpjZCBvcGVu
Ym1jDQpnaXQgY2hlY2tvdXQgMzVhNzc0MjAwOTk5YWMyZmNhNDg2OTNjMWMxNjliZjk5ZDJmNjNl
YQ0KZXhwb3J0IFRFTVBMQVRFQ09ORj1tZXRhLWZhY2Vib29rL21ldGEtdGlvZ2FwYXNzL2NvbmYN
CnNvdXJjZSBvcGVuYm1jLWVudg0KYml0YmFrZSBvYm1jLXBob3NwaG9yLWltYWdlDQoNClRoZSBC
TUMgZG9lcyBib290IGZ1bGx5LCBob3dldmVyIHRoZXJlIGFyZSB0d28gbWFqb3IgcHJvYmxlbXMg
d2XigJl2ZSBlbmNvdW50ZXJlZDoNCg0KDQogIDEuICBIb3N0IHdpbGwgbm90IHBvd2VyIG9uIHZp
YSB0aGUgZnJvbnQgcGFuZWwgcG93ZXIgYnV0dG9uDQogIDIuICBCTUMgV2lsbCBub3Qgb2J0YWlu
IG9yIHRyeSBESENQIGV2ZW4gdGhvdWdoIGl0cyBzZXQgZW5hYmxlZCBmb3IgdGhlIHByaW1hcnkg
TEFOIGNoYW5uZWwNCg0KSSBoYXZlIGEgY291cGxlIG9mIHF1ZXN0aW9uczoNCg0KDQogIDEuICBX
YXMgdGhpcyBidWlsdC9kb25lIGNvcnJlY3RseT8gSW4gb3RoZXIgd29yZHMsIGRpZCBJIGRvIHNv
bWV0aGluZyB3cm9uZyBpbiB0aGlzIHByb2Nlc3M/DQogIDIuICBEb2VzIGFueW9uZSBrbm93IHRo
ZSBjdXJyZW50IHN0YXRlIG9mIFRpb2dhIFBhc3Mgc3VwcG9ydCBpbiAyLjggb3IgdGhlIGdlbmVy
YWwgaGVhbHRoIHRoZXJlaW4/DQoNCldl4oCZcmUgY29taW5nIHVwIHRvIHNwZWVkIG9uIHRoaXMg
cXVpY2tseSwgc28gYXBvbG9naWVzIGlmIHRoZXNlIGFyZSBzdHVwaWQgcXVlc3Rpb25zLiBBbmQg
Z3JlZXRpbmdzIQ0KDQotLT5OZWlsDQo=

--_000_C502135A6D7F479681619D99FFB8643Cfbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <A17E65E8E562B54DAFA7A163CF6C86AB@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseTpXaW5nZGluZ3M7DQoJcGFub3NlLTE6NSAwIDAgMCAwIDAgMCAwIDAg
MDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OiJDYW1icmlhIE1hdGgiOw0KCXBhbm9zZS0x
OjIgNCA1IDMgNSA0IDYgMyAyIDQ7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWlseTpDYWxpYnJp
Ow0KCXBhbm9zZS0xOjIgMTUgNSAyIDIgMiA0IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1m
YW1pbHk6Q29uc29sYXM7DQoJcGFub3NlLTE6MiAxMSA2IDkgMiAyIDQgMyAyIDQ7fQ0KLyogU3R5
bGUgRGVmaW5pdGlvbnMgKi8NCnAuTXNvTm9ybWFsLCBsaS5Nc29Ob3JtYWwsIGRpdi5Nc29Ob3Jt
YWwNCgl7bWFyZ2luOjBpbjsNCglmb250LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxp
YnJpIixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxl
LXByaW9yaXR5Ojk5Ow0KCWNvbG9yOmJsdWU7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9
DQpwLk1zb1BsYWluVGV4dCwgbGkuTXNvUGxhaW5UZXh0LCBkaXYuTXNvUGxhaW5UZXh0DQoJe21z
by1zdHlsZS1wcmlvcml0eTo5OTsNCgltc28tc3R5bGUtbGluazoiUGxhaW4gVGV4dCBDaGFyIjsN
CgltYXJnaW46MGluOw0KCWZvbnQtc2l6ZToxMS4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGlicmki
LHNhbnMtc2VyaWY7fQ0KcC5Nc29MaXN0UGFyYWdyYXBoLCBsaS5Nc29MaXN0UGFyYWdyYXBoLCBk
aXYuTXNvTGlzdFBhcmFncmFwaA0KCXttc28tc3R5bGUtcHJpb3JpdHk6MzQ7DQoJbWFyZ2luLXRv
cDowaW47DQoJbWFyZ2luLXJpZ2h0OjBpbjsNCgltYXJnaW4tYm90dG9tOjBpbjsNCgltYXJnaW4t
bGVmdDouNWluOw0KCWZvbnQtc2l6ZToxMS4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNh
bnMtc2VyaWY7fQ0Kc3Bhbi5QbGFpblRleHRDaGFyDQoJe21zby1zdHlsZS1uYW1lOiJQbGFpbiBU
ZXh0IENoYXIiOw0KCW1zby1zdHlsZS1wcmlvcml0eTo5OTsNCgltc28tc3R5bGUtbGluazoiUGxh
aW4gVGV4dCI7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0Kc3Bhbi5FbWFp
bFN0eWxlMjENCgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWwtcmVwbHk7DQoJZm9udC1mYW1pbHk6
IkNhbGlicmkiLHNhbnMtc2VyaWY7DQoJY29sb3I6d2luZG93dGV4dDt9DQouTXNvQ2hwRGVmYXVs
dA0KCXttc28tc3R5bGUtdHlwZTpleHBvcnQtb25seTsNCglmb250LXNpemU6MTAuMHB0O30NCkBw
YWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBpbjsNCgltYXJnaW46MS4waW4gMS4w
aW4gMS4waW4gMS4waW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9uMTt9
DQovKiBMaXN0IERlZmluaXRpb25zICovDQpAbGlzdCBsMA0KCXttc28tbGlzdC1pZDozOTk2NDM3
NDc7DQoJbXNvLWxpc3QtdGVtcGxhdGUtaWRzOi0xMjQzNzA4MDEwO30NCkBsaXN0IGwxDQoJe21z
by1saXN0LWlkOjc0MDc1NDcxMTsNCgltc28tbGlzdC10eXBlOmh5YnJpZDsNCgltc28tbGlzdC10
ZW1wbGF0ZS1pZHM6MjAzNDkzODIxMiA2NzY5ODcwNSA2NzY5ODcxMyA2NzY5ODcxNSA2NzY5ODcw
MyA2NzY5ODcxMyA2NzY5ODcxNSA2NzY5ODcwMyA2NzY5ODcxMyA2NzY5ODcxNTt9DQpAbGlzdCBs
MTpsZXZlbDENCgl7bXNvLWxldmVsLXRleHQ6IiUxXCkiOw0KCW1zby1sZXZlbC10YWItc3RvcDpu
b25lOw0KCW1zby1sZXZlbC1udW1iZXItcG9zaXRpb246bGVmdDsNCgl0ZXh0LWluZGVudDotLjI1
aW47fQ0KQGxpc3QgbDE6bGV2ZWwyDQoJe21zby1sZXZlbC1udW1iZXItZm9ybWF0OmFscGhhLWxv
d2VyOw0KCW1zby1sZXZlbC10YWItc3RvcDpub25lOw0KCW1zby1sZXZlbC1udW1iZXItcG9zaXRp
b246bGVmdDsNCgl0ZXh0LWluZGVudDotLjI1aW47fQ0KQGxpc3QgbDE6bGV2ZWwzDQoJe21zby1s
ZXZlbC1udW1iZXItZm9ybWF0OnJvbWFuLWxvd2VyOw0KCW1zby1sZXZlbC10YWItc3RvcDpub25l
Ow0KCW1zby1sZXZlbC1udW1iZXItcG9zaXRpb246cmlnaHQ7DQoJdGV4dC1pbmRlbnQ6LTkuMHB0
O30NCkBsaXN0IGwxOmxldmVsNA0KCXttc28tbGV2ZWwtdGFiLXN0b3A6bm9uZTsNCgltc28tbGV2
ZWwtbnVtYmVyLXBvc2l0aW9uOmxlZnQ7DQoJdGV4dC1pbmRlbnQ6LS4yNWluO30NCkBsaXN0IGwx
OmxldmVsNQ0KCXttc28tbGV2ZWwtbnVtYmVyLWZvcm1hdDphbHBoYS1sb3dlcjsNCgltc28tbGV2
ZWwtdGFiLXN0b3A6bm9uZTsNCgltc28tbGV2ZWwtbnVtYmVyLXBvc2l0aW9uOmxlZnQ7DQoJdGV4
dC1pbmRlbnQ6LS4yNWluO30NCkBsaXN0IGwxOmxldmVsNg0KCXttc28tbGV2ZWwtbnVtYmVyLWZv
cm1hdDpyb21hbi1sb3dlcjsNCgltc28tbGV2ZWwtdGFiLXN0b3A6bm9uZTsNCgltc28tbGV2ZWwt
bnVtYmVyLXBvc2l0aW9uOnJpZ2h0Ow0KCXRleHQtaW5kZW50Oi05LjBwdDt9DQpAbGlzdCBsMTps
ZXZlbDcNCgl7bXNvLWxldmVsLXRhYi1zdG9wOm5vbmU7DQoJbXNvLWxldmVsLW51bWJlci1wb3Np
dGlvbjpsZWZ0Ow0KCXRleHQtaW5kZW50Oi0uMjVpbjt9DQpAbGlzdCBsMTpsZXZlbDgNCgl7bXNv
LWxldmVsLW51bWJlci1mb3JtYXQ6YWxwaGEtbG93ZXI7DQoJbXNvLWxldmVsLXRhYi1zdG9wOm5v
bmU7DQoJbXNvLWxldmVsLW51bWJlci1wb3NpdGlvbjpsZWZ0Ow0KCXRleHQtaW5kZW50Oi0uMjVp
bjt9DQpAbGlzdCBsMTpsZXZlbDkNCgl7bXNvLWxldmVsLW51bWJlci1mb3JtYXQ6cm9tYW4tbG93
ZXI7DQoJbXNvLWxldmVsLXRhYi1zdG9wOm5vbmU7DQoJbXNvLWxldmVsLW51bWJlci1wb3NpdGlv
bjpyaWdodDsNCgl0ZXh0LWluZGVudDotOS4wcHQ7fQ0KQGxpc3QgbDINCgl7bXNvLWxpc3QtaWQ6
MTY1MDQ3NDc3NzsNCgltc28tbGlzdC10ZW1wbGF0ZS1pZHM6LTY4MTk2MzUyNDt9DQpAbGlzdCBs
Mw0KCXttc28tbGlzdC1pZDoxNzA2MzI0MzI1Ow0KCW1zby1saXN0LXR5cGU6aHlicmlkOw0KCW1z
by1saXN0LXRlbXBsYXRlLWlkczoxNzU2OTU5MjIgNjc2OTg3MDUgNjc2OTg3MTMgNjc2OTg3MTUg
Njc2OTg3MDMgNjc2OTg3MTMgNjc2OTg3MTUgNjc2OTg3MDMgNjc2OTg3MTMgNjc2OTg3MTU7fQ0K
QGxpc3QgbDM6bGV2ZWwxDQoJe21zby1sZXZlbC10ZXh0OiIlMVwpIjsNCgltc28tbGV2ZWwtdGFi
LXN0b3A6bm9uZTsNCgltc28tbGV2ZWwtbnVtYmVyLXBvc2l0aW9uOmxlZnQ7DQoJdGV4dC1pbmRl
bnQ6LS4yNWluO30NCkBsaXN0IGwzOmxldmVsMg0KCXttc28tbGV2ZWwtbnVtYmVyLWZvcm1hdDph
bHBoYS1sb3dlcjsNCgltc28tbGV2ZWwtdGFiLXN0b3A6bm9uZTsNCgltc28tbGV2ZWwtbnVtYmVy
LXBvc2l0aW9uOmxlZnQ7DQoJdGV4dC1pbmRlbnQ6LS4yNWluO30NCkBsaXN0IGwzOmxldmVsMw0K
CXttc28tbGV2ZWwtbnVtYmVyLWZvcm1hdDpyb21hbi1sb3dlcjsNCgltc28tbGV2ZWwtdGFiLXN0
b3A6bm9uZTsNCgltc28tbGV2ZWwtbnVtYmVyLXBvc2l0aW9uOnJpZ2h0Ow0KCXRleHQtaW5kZW50
Oi05LjBwdDt9DQpAbGlzdCBsMzpsZXZlbDQNCgl7bXNvLWxldmVsLXRhYi1zdG9wOm5vbmU7DQoJ
bXNvLWxldmVsLW51bWJlci1wb3NpdGlvbjpsZWZ0Ow0KCXRleHQtaW5kZW50Oi0uMjVpbjt9DQpA
bGlzdCBsMzpsZXZlbDUNCgl7bXNvLWxldmVsLW51bWJlci1mb3JtYXQ6YWxwaGEtbG93ZXI7DQoJ
bXNvLWxldmVsLXRhYi1zdG9wOm5vbmU7DQoJbXNvLWxldmVsLW51bWJlci1wb3NpdGlvbjpsZWZ0
Ow0KCXRleHQtaW5kZW50Oi0uMjVpbjt9DQpAbGlzdCBsMzpsZXZlbDYNCgl7bXNvLWxldmVsLW51
bWJlci1mb3JtYXQ6cm9tYW4tbG93ZXI7DQoJbXNvLWxldmVsLXRhYi1zdG9wOm5vbmU7DQoJbXNv
LWxldmVsLW51bWJlci1wb3NpdGlvbjpyaWdodDsNCgl0ZXh0LWluZGVudDotOS4wcHQ7fQ0KQGxp
c3QgbDM6bGV2ZWw3DQoJe21zby1sZXZlbC10YWItc3RvcDpub25lOw0KCW1zby1sZXZlbC1udW1i
ZXItcG9zaXRpb246bGVmdDsNCgl0ZXh0LWluZGVudDotLjI1aW47fQ0KQGxpc3QgbDM6bGV2ZWw4
DQoJe21zby1sZXZlbC1udW1iZXItZm9ybWF0OmFscGhhLWxvd2VyOw0KCW1zby1sZXZlbC10YWIt
c3RvcDpub25lOw0KCW1zby1sZXZlbC1udW1iZXItcG9zaXRpb246bGVmdDsNCgl0ZXh0LWluZGVu
dDotLjI1aW47fQ0KQGxpc3QgbDM6bGV2ZWw5DQoJe21zby1sZXZlbC1udW1iZXItZm9ybWF0OnJv
bWFuLWxvd2VyOw0KCW1zby1sZXZlbC10YWItc3RvcDpub25lOw0KCW1zby1sZXZlbC1udW1iZXIt
cG9zaXRpb246cmlnaHQ7DQoJdGV4dC1pbmRlbnQ6LTkuMHB0O30NCm9sDQoJe21hcmdpbi1ib3R0
b206MGluO30NCnVsDQoJe21hcmdpbi1ib3R0b206MGluO30NCi0tPjwvc3R5bGU+DQo8L2hlYWQ+
DQo8Ym9keSBsYW5nPSJFTi1VUyIgbGluaz0iYmx1ZSIgdmxpbms9InB1cnBsZSI+DQo8ZGl2IGNs
YXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+UGxlYXNlIGlnbm9yZSBi
ZWxvdyBOQ1NJIG1lc3NhZ2UsIEkgYW0gYXNzdW1pbmcgdGhhdCB5b3UgaGF2ZSBpbWFnZSBib290
IHVwIHRvIGxvZ2luIHByb21wdC4gWW91IGNhbiB1c2UgcG93ZXItdXRpbCB0byBwb3dlciBvbiBv
ciBvZmYgaG9zdCBzeXN0ZW0uIFllcyB5b3UgbmVlZCBNRSBzdXBwb3J0IGluIHlvdXIgVUVGSSBp
bWFnZSwgYXMgd2hlbiB5b3UgcG93ZXIgb24gc3lzdGVtIEJNQyByZWFkcyBhbmQgbW9uaXRvcg0K
IE1FIHNlbnNvciB2aWEgSVBNQiBidXQgaWYgTUUgaXMgbm90IGF2YWlsYWJsZSB0aGVuIGlwbWIg
d2lsbCB0aHJvdyBlcnJvci4gPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48
bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlBsZWFzZSBsZXQgbWUg
a25vdyBhbnkgb3RoZXIgaXNzdWVzIHlvdSBhcmUgZ2V0dGluZywgSSB3aWxsIHRyeSB0byByZXNv
bHZlIHRoYXQuPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNw
OzwvbzpwPjwvcD4NCjxkaXYgc3R5bGU9ImJvcmRlcjpub25lO2JvcmRlci10b3A6c29saWQgI0I1
QzRERiAxLjBwdDtwYWRkaW5nOjMuMHB0IDBpbiAwaW4gMGluIj4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPjxiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj5Gcm9tOiA8
L3NwYW4+PC9iPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj5vcGVu
Ym1jICZsdDtvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFicy5v
cmcmZ3Q7IG9uIGJlaGFsZiBvZiBOZWlsIEJyYWRsZXkgJmx0O05laWxfQnJhZGxleUBwaG9lbml4
LmNvbSZndDs8YnI+DQo8Yj5EYXRlOiA8L2I+TW9uZGF5LCBBdWd1c3QgMjQsIDIwMjAgYXQgMjox
OSBQTTxicj4NCjxiPlRvOiA8L2I+JnF1b3Q7b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnJnF1b3Q7
ICZsdDtvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcmZ3Q7PGJyPg0KPGI+U3ViamVjdDogPC9iPlJF
OiBUaW9nYSBQYXNzIE9wZW5CTUMgMi44PG86cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8
ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8L2Rpdj4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPlRoYW5rcyBmb3IgdGhlIHJlcGx5LCBWaWpheSEgVGhlIHBh
cnQgd2FzIHByb2dyYW1lZCBkaXJlY3RseSB3aXRoIGEgZGVkaXByb2cuIEhleSBCcnVjZSwgY2Fu
IHlvdSBwb3N0IHRoZSBmdWxsIGJvb3QgbG9nIG9mIHRoYXQgVFAgc3lzdGVtPyBWaWpheSwgQnJ1
Y2UgKGluIGFub3RoZXIgdGhyZWFkKSBkaWQgc2VlIHRoaXMgb24gdGhlIGJvb3QgbG9nLCBidXQg
SeKAmWxsIHdvcmsgdG8gZ2V0IHlvdSB0aGUgZnVsbA0KIGJvb3QgY29uc29sZTo8bzpwPjwvbzpw
PjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZuYnNwOzxvOnA+PC9vOnA+PC9wPg0KPHAgY2xh
c3M9Ik1zb1BsYWluVGV4dCI+WyZuYnNwOyZuYnNwOyZuYnNwOyAxLjg1NDkzOV0gZnRnbWFjMTAw
IDFlNjYwMDAwLmV0aGVybmV0OiBVc2luZyBOQ1NJIGludGVyZmFjZTxvOnA+PC9vOnA+PC9wPg0K
PHAgY2xhc3M9Ik1zb1BsYWluVGV4dCI+WyZuYnNwOyZuYnNwOyAxNy44MzE4MjddIGZ0Z21hYzEw
MCAxZTY2MDAwMC5ldGhlcm5ldCBldGgwOiBOQ1NJOiBIYW5kbGVyIGZvciBwYWNrZXQgdHlwZSAw
eDgyIHJldHVybmVkIC0xOTxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb1BsYWluVGV4dCI+
WyZuYnNwOyZuYnNwOyAzMy41MjY5NTBdIGZ0Z21hYzEwMCAxZTY2MDAwMC5ldGhlcm5ldCBldGgw
OiBOQ1NJOiAnYmFkJyBwYWNrZXQgaWdub3JlZCBmb3IgdHlwZSAweDhiPG86cD48L286cD48L3A+
DQo8cCBjbGFzcz0iTXNvUGxhaW5UZXh0Ij5bJm5ic3A7Jm5ic3A7IDMzLjUzNTU2NF0gZnRnbWFj
MTAwIDFlNjYwMDAwLmV0aGVybmV0IGV0aDA6IE5DU0k6ICdiYWQnIHBhY2tldCBpZ25vcmVkIGZv
ciB0eXBlIDB4OGI8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29QbGFpblRleHQiPlsmbmJz
cDsmbmJzcDsgMzMuNTQzODEzXSBmdGdtYWMxMDAgMWU2NjAwMDAuZXRoZXJuZXQgZXRoMDogTkNT
STogJ2JhZCcgcGFja2V0IGlnbm9yZWQgZm9yIHR5cGUgMHg4YjxvOnA+PC9vOnA+PC9wPg0KPHAg
Y2xhc3M9Ik1zb1BsYWluVGV4dCI+WyZuYnNwOyZuYnNwOyAzMy41NTQzNDVdIGZ0Z21hYzEwMCAx
ZTY2MDAwMC5ldGhlcm5ldCBldGgwOiBOQ1NJOiAnYmFkJyBwYWNrZXQgaWdub3JlZCBmb3IgdHlw
ZSAweDhiPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvUGxhaW5UZXh0Ij5bJm5ic3A7Jm5i
c3A7IDMzLjU2MjU5OF0gZnRnbWFjMTAwIDFlNjYwMDAwLmV0aGVybmV0IGV0aDA6IE5DU0k6ICdi
YWQnIHBhY2tldCBpZ25vcmVkIGZvciB0eXBlIDB4OGI8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNz
PSJNc29QbGFpblRleHQiPlsmbmJzcDsmbmJzcDsgMzMuNTcwOTU4XSBmdGdtYWMxMDAgMWU2NjAw
MDAuZXRoZXJuZXQgZXRoMDogTkNTSTogJ2JhZCcgcGFja2V0IGlnbm9yZWQgZm9yIHR5cGUgMHg4
YjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb1BsYWluVGV4dCI+WyZuYnNwOyZuYnNwOyAz
My42MTI5MzZdIGZ0Z21hYzEwMCAxZTY2MDAwMC5ldGhlcm5ldCBldGgwOiBOQ1NJOiAnYmFkJyBw
YWNrZXQgaWdub3JlZCBmb3IgdHlwZSAweDhiPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNv
UGxhaW5UZXh0Ij5bJm5ic3A7Jm5ic3A7IDMzLjYyOTMxOF0gZnRnbWFjMTAwIDFlNjYwMDAwLmV0
aGVybmV0IGV0aDA6IE5DU0k6ICdiYWQnIHBhY2tldCBpZ25vcmVkIGZvciB0eXBlIDB4OGI8bzpw
PjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29QbGFpblRleHQiPlsmbmJzcDsmbmJzcDsgMzMuNjM4
NjgzXSBmdGdtYWMxMDAgMWU2NjAwMDAuZXRoZXJuZXQgZXRoMDogTkNTSTogJ2JhZCcgcGFja2V0
IGlnbm9yZWQgZm9yIHR5cGUgMHg4YjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb1BsYWlu
VGV4dCI+WyZuYnNwOyZuYnNwOyAzMy42NDc5NzhdIGZ0Z21hYzEwMCAxZTY2MDAwMC5ldGhlcm5l
dCBldGgwOiBOQ1NJOiAnYmFkJyBwYWNrZXQgaWdub3JlZCBmb3IgdHlwZSAweDhiPG86cD48L286
cD48L3A+DQo8cCBjbGFzcz0iTXNvUGxhaW5UZXh0Ij5bJm5ic3A7Jm5ic3A7IDMzLjY1NzI5MV0g
ZnRnbWFjMTAwIDFlNjYwMDAwLmV0aGVybmV0IGV0aDA6IE5DU0k6ICdiYWQnIHBhY2tldCBpZ25v
cmVkIGZvciB0eXBlIDB4OGI8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29QbGFpblRleHQi
PlsmbmJzcDsmbmJzcDsgMzMuNjY1NjkwXSBmdGdtYWMxMDAgMWU2NjAwMDAuZXRoZXJuZXQgZXRo
MDogTkNTSTogJ2JhZCcgcGFja2V0IGlnbm9yZWQgZm9yIHR5cGUgMHg4YjxvOnA+PC9vOnA+PC9w
Pg0KPHAgY2xhc3M9Ik1zb1BsYWluVGV4dCI+WyZuYnNwOyZuYnNwOyAzMy42NzM5NTZdIGZ0Z21h
YzEwMCAxZTY2MDAwMC5ldGhlcm5ldCBldGgwOiBOQ1NJOiAnYmFkJyBwYWNrZXQgaWdub3JlZCBm
b3IgdHlwZSAweDhiPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvUGxhaW5UZXh0Ij5bJm5i
c3A7Jm5ic3A7IDMzLjY4MjM4MV0gZnRnbWFjMTAwIDFlNjYwMDAwLmV0aGVybmV0IGV0aDA6IE5D
U0k6ICdiYWQnIHBhY2tldCBpZ25vcmVkIGZvciB0eXBlIDB4OGI8bzpwPjwvbzpwPjwvcD4NCjxw
IGNsYXNzPSJNc29QbGFpblRleHQiPlsmbmJzcDsmbmJzcDsgMzMuNjkwNzkyXSBmdGdtYWMxMDAg
MWU2NjAwMDAuZXRoZXJuZXQgZXRoMDogTkNTSTogJ2JhZCcgcGFja2V0IGlnbm9yZWQgZm9yIHR5
cGUgMHg4YjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7PG86cD48
L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5UaGlzIGlzIHRoZSBpbWFnZSB3ZSB1c2Vk
OjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7PG86cD48L286cD48
L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luLWxlZnQ6LjVpbiI+PGI+PHNw
YW4gc3R5bGU9ImZvbnQtZmFtaWx5OkNvbnNvbGFzO2NvbG9yOmJsYWNrO2JhY2tncm91bmQ6eWVs
bG93O21zby1oaWdobGlnaHQ6eWVsbG93Ij4tcnctci0tci0tIDIgYnJ1Y2UgYnJ1Y2UgMzM1NTQ0
MzIgQXVnIDIxIDE3OjUwIG9ibWMtcGhvc3Bob3ItaW1hZ2UtdGlvZ2FwYXNzLTIwMjAwODIxMTcw
MTMyLnN0YXRpYy5tdGQ8L3NwYW4+PC9iPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+Jm5ic3A7PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5XZSBhcmUg
YWxzbyB3b25kZXJpbmcgYWJvdXQgcG93ZXIgY29udHJvbC4gV2UgZ2V0IGFuIElQTUIgZXJyb3Ig
d2hlbmV2ZXIgd2UgZG8gYW55IHBvd2VyIGNvbnRyb2wgdmlhIElQTUkgaW5zdHJ1Y3Rpb25zIChw
b3dlciBidXR0b24gd29ya3MgaG93ZXZlcikgYW5kIGl0IGxvb2tzIGxpa2UgaXTigJlzIHRhbGtp
bmcgdG8gdGhlIE1FLiBBcmUgeW91IGZhbWlsaWFyIHdpdGggdGhlIE1F4oCZcyByb2xlIGluIHBv
d2VyIGNvbnRyb2wvc3RhdHVzPw0KIEkgY291bGRu4oCZdCBmaW5kIGFueSBtZW50aW9uIG9mIHRo
ZSBNRSBpbiB0aGUgVGlvZ2EgUGFzcyBzcGVjLCBzbyBwZXJoYXBzIEkgbWlzc2VkIGl0LiBJ4oCZ
bSBzdXNwZWN0aW5nIHRoYXQgb3VyIFVFRkkgaW1hZ2UgZG9lc27igJl0IGhhdmUgdGhlIHJpZ2h0
IE1FIGltYWdlIHRvIG1hdGUgdXAgd2l0aCBUaW9nYSBQYXNzLjxvOnA+PC9vOnA+PC9wPg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj5UaGFuayB5b3UhPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJz
cDs8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250
LWZhbWlseTpXaW5nZGluZ3MiPsOgPC9zcGFuPk5laWw8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNz
PSJNc29Ob3JtYWwiPiZuYnNwOzxvOnA+PC9vOnA+PC9wPg0KPGRpdj4NCjxkaXYgc3R5bGU9ImJv
cmRlcjpub25lO2JvcmRlci10b3A6c29saWQgI0UxRTFFMSAxLjBwdDtwYWRkaW5nOjMuMHB0IDBp
biAwaW4gMGluIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxiPkZyb206PC9iPiBWaWpheSBLaGVt
a2EgJmx0O3ZpamF5a2hlbWthQGZiLmNvbSZndDsgPGJyPg0KPGI+U2VudDo8L2I+IE1vbmRheSwg
QXVndXN0IDI0LCAyMDIwIDI6MDUgUE08YnI+DQo8Yj5Ubzo8L2I+IE5laWwgQnJhZGxleSAmbHQ7
TmVpbF9CcmFkbGV5QHBob2VuaXguY29tJmd0Ozsgb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPGJy
Pg0KPGI+Q2M6PC9iPiBQYXRyaWNrIFZvZWxrZXIgJmx0O1BhdHJpY2tfVm9lbGtlckBwaG9lbml4
LmNvbSZndDs7IEJydWNlIE1pdGNoZWxsICZsdDtCcnVjZV9NaXRjaGVsbEBwaG9lbml4LmNvbSZn
dDs8YnI+DQo8Yj5TdWJqZWN0OjwvYj4gUmU6IFRpb2dhIFBhc3MgT3BlbkJNQyAyLjg8bzpwPjwv
bzpwPjwvcD4NCjwvZGl2Pg0KPC9kaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDs8bzpw
PjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkhpIE5laWwsPG86cD48L286cD48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5Ib3cgZGlkIHlvdSBjb3B5IGltYWdlIHRvIHRhcmdldCwg
SSBtZWFuIHdoYXQgZmlsZSBuYW1lIHlvdSBoYXZlIGNvcGllZCBhbmQgd2hhdCB3YXMgc2l6ZS4N
CjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+VGhlcmUgaXMgbm8gaXNzdWUg
aW4gYXZhaWxhYmxlIGltYWdlIGZvciB0aW9nYXBhc3MgYnVpbGQgYW5kIGl0IHNob3VsZCB3b3Jr
IHNlYW1sZXNzbHkuPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDs8
bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlBsZWFzZSBzaGFyZSBjb25zb2xl
IGJvb3QgbG9nIGlmIHlvdSBoYXZlLCBkbyB5b3Uga25vdyB3aGF0IG5ldHdvcmsgY2FyZCB5b3Ug
c3lzdGVtIGhhdmUuPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDs8
bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlJlZ2FyZHM8bzpwPjwvbzpwPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPi1WaWpheTxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+Jm5ic3A7PG86cD48L286cD48L3A+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9u
ZTtib3JkZXItdG9wOnNvbGlkICNCNUM0REYgMS4wcHQ7cGFkZGluZzozLjBwdCAwaW4gMGluIDBp
biI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48Yj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBw
dDtjb2xvcjpibGFjayI+RnJvbTogPC9zcGFuPjwvYj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEy
LjBwdDtjb2xvcjpibGFjayI+b3BlbmJtYyAmbHQ7PC9zcGFuPjxhIGhyZWY9Im1haWx0bzpvcGVu
Ym1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFicy5vcmciPjxzcGFuIHN0
eWxlPSJmb250LXNpemU6MTIuMHB0Ij5vcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29t
QGxpc3RzLm96bGFicy5vcmc8L3NwYW4+PC9hPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0
O2NvbG9yOmJsYWNrIj4mZ3Q7DQogb24gYmVoYWxmIG9mIE5laWwgQnJhZGxleSAmbHQ7PC9zcGFu
PjxhIGhyZWY9Im1haWx0bzpOZWlsX0JyYWRsZXlAcGhvZW5peC5jb20iPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6MTIuMHB0Ij5OZWlsX0JyYWRsZXlAcGhvZW5peC5jb208L3NwYW4+PC9hPjxzcGFu
IHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj4mZ3Q7PGJyPg0KPGI+RGF0ZTog
PC9iPkZyaWRheSwgQXVndXN0IDIxLCAyMDIwIGF0IDEwOjQwIFBNPGJyPg0KPGI+VG86IDwvYj4m
cXVvdDs8L3NwYW4+PGEgaHJlZj0ibWFpbHRvOm9wZW5ibWNAbGlzdHMub3psYWJzLm9yZyI+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQiPm9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzwvc3Bh
bj48L2E+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPiZxdW90OyAm
bHQ7PC9zcGFuPjxhIGhyZWY9Im1haWx0bzpvcGVuYm1jQGxpc3RzLm96bGFicy5vcmciPjxzcGFu
IHN0eWxlPSJmb250LXNpemU6MTIuMHB0Ij5vcGVuYm1jQGxpc3RzLm96bGFicy5vcmc8L3NwYW4+
PC9hPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj4mZ3Q7PGJyPg0K
PGI+Q2M6IDwvYj5QYXRyaWNrIFZvZWxrZXIgJmx0Ozwvc3Bhbj48YSBocmVmPSJtYWlsdG86UGF0
cmlja19Wb2Vsa2VyQHBob2VuaXguY29tIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdCI+
UGF0cmlja19Wb2Vsa2VyQHBob2VuaXguY29tPC9zcGFuPjwvYT48c3BhbiBzdHlsZT0iZm9udC1z
aXplOjEyLjBwdDtjb2xvcjpibGFjayI+Jmd0OywgQnJ1Y2UgTWl0Y2hlbGwgJmx0Ozwvc3Bhbj48
YSBocmVmPSJtYWlsdG86QnJ1Y2VfTWl0Y2hlbGxAcGhvZW5peC5jb20iPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6MTIuMHB0Ij5CcnVjZV9NaXRjaGVsbEBwaG9lbml4LmNvbTwvc3Bhbj48L2E+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPiZndDs8YnI+DQo8Yj5TdWJq
ZWN0OiA8L2I+VGlvZ2EgUGFzcyBPcGVuQk1DIDIuODwvc3Bhbj48bzpwPjwvbzpwPjwvcD4NCjwv
ZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZuYnNwOzxvOnA+PC9vOnA+PC9wPg0K
PC9kaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5HcmVldGluZ3MgZmVsbG93IEJNQyBmb2xrIOKA
kyBJ4oCZbSBOZWlsIEJyYWRsZXksIFBob2VuaXggVGVjaG5vbG9naWVz4oCZIEJNQyBhcmNoaXRl
Y3QgYW5kIGhhdmUgYSBxdWVzdGlvbiBmb3IgdGhlIGdyb3VwLjxvOnA+PC9vOnA+PC9wPg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj5XZSBhcmUgYXR0ZW1wdGluZyB0byBsb2FkIE9wZW5CTUMgMi44IG9uIGEgVGlvZ2EgUGFz
cy4gVGhpcyBpcyB3aGF0IHdlIGRpZDo8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPiZuYnNwOzxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1h
cmdpbi1sZWZ0Oi41aW4iPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTpDb25zb2xhcztjb2xvcjoj
MUY0OTdEIj5ta2RpciB0aW9nYXBhc3M8L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luLWxlZnQ6LjVpbiI+PHNwYW4gc3R5bGU9ImZvbnQtZmFt
aWx5OkNvbnNvbGFzO2NvbG9yOiMxRjQ5N0QiPmNkIHRpb2dhcGFzczwvc3Bhbj48bzpwPjwvbzpw
PjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW4tbGVmdDouNWluIj48c3Bh
biBzdHlsZT0iZm9udC1mYW1pbHk6Q29uc29sYXM7Y29sb3I6IzFGNDk3RCI+Z2l0IGNsb25lDQo8
L3NwYW4+PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvb3BlbmJtYy5naXQiPjxz
cGFuIHN0eWxlPSJmb250LWZhbWlseTpDb25zb2xhcyI+aHR0cHM6Ly9naXRodWIuY29tL29wZW5i
bWMvb3BlbmJtYy5naXQ8L3NwYW4+PC9hPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCIgc3R5bGU9Im1hcmdpbi1sZWZ0Oi41aW4iPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTpD
b25zb2xhcztjb2xvcjojMUY0OTdEIj5jZCBvcGVuYm1jPC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbi1sZWZ0Oi41aW4iPjxzcGFuIHN0eWxl
PSJmb250LWZhbWlseTpDb25zb2xhcztjb2xvcjojMUY0OTdEIj5naXQgY2hlY2tvdXQgMzVhNzc0
MjAwOTk5YWMyZmNhNDg2OTNjMWMxNjliZjk5ZDJmNjNlYTwvc3Bhbj48bzpwPjwvbzpwPjwvcD4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW4tbGVmdDouNWluIj48c3BhbiBzdHls
ZT0iZm9udC1mYW1pbHk6Q29uc29sYXM7Y29sb3I6IzFGNDk3RCI+ZXhwb3J0IFRFTVBMQVRFQ09O
Rj1tZXRhLWZhY2Vib29rL21ldGEtdGlvZ2FwYXNzL2NvbmY8L3NwYW4+PG86cD48L286cD48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luLWxlZnQ6LjVpbiI+PHNwYW4gc3R5
bGU9ImZvbnQtZmFtaWx5OkNvbnNvbGFzO2NvbG9yOiMxRjQ5N0QiPnNvdXJjZSBvcGVuYm1jLWVu
djwvc3Bhbj48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJn
aW4tbGVmdDouNWluIj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6Q29uc29sYXM7Y29sb3I6IzFG
NDk3RCI+Yml0YmFrZSBvYm1jLXBob3NwaG9yLWltYWdlPC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj5UaGUgQk1DIGRvZXMgYm9vdCBmdWxseSwgaG93ZXZlciB0aGVyZSBhcmUgdHdvIG1h
am9yIHByb2JsZW1zIHdl4oCZdmUgZW5jb3VudGVyZWQ6PG86cD48L286cD48L3A+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj4mbmJzcDs8bzpwPjwvbzpwPjwvcD4NCjxvbCBzdHlsZT0ibWFyZ2luLXRv
cDowaW4iIHN0YXJ0PSIxIiB0eXBlPSIxIj4NCjxsaSBjbGFzcz0iTXNvTGlzdFBhcmFncmFwaCIg
c3R5bGU9Im1hcmdpbi1sZWZ0OjBpbjttc28tbGlzdDpsMSBsZXZlbDEgbGZvMyI+SG9zdCB3aWxs
IG5vdCBwb3dlciBvbiB2aWEgdGhlIGZyb250IHBhbmVsIHBvd2VyIGJ1dHRvbjxvOnA+PC9vOnA+
PC9saT48bGkgY2xhc3M9Ik1zb0xpc3RQYXJhZ3JhcGgiIHN0eWxlPSJtYXJnaW4tbGVmdDowaW47
bXNvLWxpc3Q6bDEgbGV2ZWwxIGxmbzMiPkJNQyBXaWxsIG5vdCBvYnRhaW4gb3IgdHJ5IERIQ1Ag
ZXZlbiB0aG91Z2ggaXRzIHNldCBlbmFibGVkIGZvciB0aGUgcHJpbWFyeSBMQU4gY2hhbm5lbDxv
OnA+PC9vOnA+PC9saT48L29sPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7PG86cD48L286
cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5JIGhhdmUgYSBjb3VwbGUgb2YgcXVlc3Rpb25z
OjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7PG86cD48L286cD48
L3A+DQo8b2wgc3R5bGU9Im1hcmdpbi10b3A6MGluIiBzdGFydD0iMSIgdHlwZT0iMSI+DQo8bGkg
Y2xhc3M9Ik1zb0xpc3RQYXJhZ3JhcGgiIHN0eWxlPSJtYXJnaW4tbGVmdDowaW47bXNvLWxpc3Q6
bDMgbGV2ZWwxIGxmbzYiPldhcyB0aGlzIGJ1aWx0L2RvbmUgY29ycmVjdGx5PyBJbiBvdGhlciB3
b3JkcywgZGlkIEkgZG8gc29tZXRoaW5nIHdyb25nIGluIHRoaXMgcHJvY2Vzcz88bzpwPjwvbzpw
PjwvbGk+PGxpIGNsYXNzPSJNc29MaXN0UGFyYWdyYXBoIiBzdHlsZT0ibWFyZ2luLWxlZnQ6MGlu
O21zby1saXN0OmwzIGxldmVsMSBsZm82Ij5Eb2VzIGFueW9uZSBrbm93IHRoZSBjdXJyZW50IHN0
YXRlIG9mIFRpb2dhIFBhc3Mgc3VwcG9ydCBpbiAyLjggb3IgdGhlIGdlbmVyYWwgaGVhbHRoIHRo
ZXJlaW4/PG86cD48L286cD48L2xpPjwvb2w+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDs8
bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPldl4oCZcmUgY29taW5nIHVwIHRv
IHNwZWVkIG9uIHRoaXMgcXVpY2tseSwgc28gYXBvbG9naWVzIGlmIHRoZXNlIGFyZSBzdHVwaWQg
cXVlc3Rpb25zLiBBbmQgZ3JlZXRpbmdzITxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+Jm5ic3A7PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBz
dHlsZT0iZm9udC1mYW1pbHk6V2luZ2RpbmdzIj7DoDwvc3Bhbj5OZWlsPG86cD48L286cD48L3A+
DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_C502135A6D7F479681619D99FFB8643Cfbcom_--
