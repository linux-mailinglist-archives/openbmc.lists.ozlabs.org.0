Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F79121F57
	for <lists+openbmc@lfdr.de>; Tue, 17 Dec 2019 01:17:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cJc31WhfzDqX3
	for <lists+openbmc@lfdr.de>; Tue, 17 Dec 2019 11:17:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=72547cb5ad=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Ixq4CWg1"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="GoKJweVA"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47cJbK5W9DzDqVK
 for <openbmc@lists.ozlabs.org>; Tue, 17 Dec 2019 11:16:23 +1100 (AEDT)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.42/8.16.0.42) with SMTP id xBH0DkTp009802
 for <openbmc@lists.ozlabs.org>; Mon, 16 Dec 2019 16:16:19 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=eklq010Bw3on2vFxn4Mb1DHj0OxNgp/wXBqqlbaczck=;
 b=Ixq4CWg1KMsbhbDmTLY8nr57NgVf+p0cB8//pgaw6eKqmU1D2aGnI3mI1I5JesY5ORn2
 LCHLHMtA0fHCsNxZwhIDMnmzop5rAzqH5p0mtmqyunM3Gj4bWVsCWl54Rh2oc16S6Y7I
 KVyAkyRV1Xg159CEQ7vmWYhxv58WlxPxSZM= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0001303.ppops.net with ESMTP id 2wxfr09bhv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 16 Dec 2019 16:16:19 -0800
Received: from ash-exopmbx201.TheFacebook.com (2620:10d:c0a8:83::8) by
 ash-exhub103.TheFacebook.com (2620:10d:c0a8:82::c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 16 Dec 2019 16:16:19 -0800
Received: from ash-exhub104.TheFacebook.com (2620:10d:c0a8:82::d) by
 ash-exopmbx201.TheFacebook.com (2620:10d:c0a8:83::8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 16 Dec 2019 16:16:18 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.175) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 16 Dec 2019 16:16:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/j/cXgBX8FZcxNEQa2HnSJ2t8OLHejC4hIWn5++fXjaivYctY+xXJWaP1QYhOdfmdr4RSBMJRK6TkJpbkHf+8m6BPBG2+dDaeW+s9awGG3MgFUmnR3+cqKi1LiQEulUd1waKFjVSWPBJ6XTG1Xct7G0WCGupl1vtYcFF5IW/Yc5PxtSzGvXWjVgNn4eaLy2pdqFL0f/KGMAxrzt84VuzmDKe+udaRRhMWB6P5l9J/2/+nXtl4AAJjw5/ThHHre2A+PvWq6zh8g1QIeeRBibqLdTLX+JJ8iSTKfCkXx7nt5avbaGt9U7dwTYvJsw/I6L4IDm7zsnUu4Wh50n53ICrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eklq010Bw3on2vFxn4Mb1DHj0OxNgp/wXBqqlbaczck=;
 b=SMAO308C0/rqDAwUOzo+AtcChbKynCSDkG3l9w/ureSxot0bIr8cbg8cCtaBo0n9ew+fIVNM+6tpE8MdHnoG7PKhqWjmvnlJF2cyoVGvLFcOD2HRNyDMo1Me6ve7J4wMaEpdovpgLd6Q3pN4k45dESa9FDNFRj9WKC85JqVzTZZr7C2Xfa/E0HqAJ0+KDu8s8KMSWGTGsMt9b3eh1dq/kOlB0eyxbrnrk4Oqawfu145BvoLZ/j0Xotgsh4adxmO6+9WzlPryykgFlujXEbFhDhSALGDPiMtoNrqqW80Xh/6AOmdf8eaIRzFDRpf2NIuK1hJ0dW/X3BmO9HDy3K9iNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eklq010Bw3on2vFxn4Mb1DHj0OxNgp/wXBqqlbaczck=;
 b=GoKJweVAdzbdqbcx2cFm2hKIdK+sLllkgkxSj4R64JGzyPdY1CgkMhUWqYKMgMY6Y9U9JePemOWX2yVb/GKDADDozA0hNcmJcK9WCzIF0sHIr/hrrNrc2RcdD2fWwqYwH2wn8X7oCEdWznV90Uio9fZCyhQLwo+pdItBlnk3TPQ=
Received: from MWHPR15MB1597.namprd15.prod.outlook.com (10.173.234.137) by
 MWHPR15MB1422.namprd15.prod.outlook.com (10.173.234.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.18; Tue, 17 Dec 2019 00:16:18 +0000
Received: from MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2]) by MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2%8]) with mapi id 15.20.2538.019; Tue, 17 Dec 2019
 00:16:18 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Bios upgrade
Thread-Topic: Bios upgrade
Thread-Index: AQHVtG8zzZSN22TSJ0iUXEHUijApIw==
Date: Tue, 17 Dec 2019 00:16:17 +0000
Message-ID: <95F85EE0-7D7A-41CD-A9B3-69ACC271087C@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:dbc5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 995da83a-c429-44d5-093d-08d782865664
x-ms-traffictypediagnostic: MWHPR15MB1422:
x-microsoft-antispam-prvs: <MWHPR15MB142281D2518608D0D928E434DD500@MWHPR15MB1422.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 02543CD7CD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(346002)(39860400002)(366004)(396003)(199004)(189003)(6506007)(478600001)(81156014)(7116003)(81166006)(2906002)(6916009)(36756003)(6486002)(71200400001)(66556008)(76116006)(5660300002)(64756008)(66946007)(66446008)(86362001)(66476007)(3480700005)(186003)(6512007)(8936002)(316002)(4744005)(9326002)(8676002)(33656002)(2616005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1422;
 H:MWHPR15MB1597.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GKxLeHBqw0to+ceqVScgSn3/xDdih/vYpZyAVgzBmF3GuwVemQFHAjF/eN8oilfJ2mfQHwSGrCX1lRR59YLJM5gSfjtQPWEl27e0SPzjOryydOBIciKEOFoAZkzRe5pS4HTI/Cv1jradLjIlz64EkV6XkAwa+lhzdFV1dzYVDRFc4j0tDUdH0sVzlgNeP6dsTijxFO+6rkssX2G8vGK4ycjGtHvfA+q08OAR6ti5iIp9z/57DT5fpQkKMroNo2lwYhZSdoo0eAnBMYJUuWKmSZxnQUDfRoXG1lfFwKwEbRJ6Eq+kFgXr2Z8a7IXVjAJiji1/19auo3EKt1YVpDw3Itn00FXE2SVu8xErQ3G7Gu36n0s2oJKqRlorEX4M+BYB2eYktnTtYW8LBaXabLzzYejJCpVlGIq17rzJ73zZxGJY3ez/gFEH3maIo50hDIbJ
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_95F85EE07D7A41CDA9B369ACC271087Cfbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 995da83a-c429-44d5-093d-08d782865664
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2019 00:16:18.0490 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lfX5r6aEO/ARYqeTdd+FDHY4bppvD532L2zHMeNFepPQJz1TRRhNQ5T1Uw2dbfYkn8yzdzPecZ86fGzcU1yp6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1422
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-16_07:2019-12-16,2019-12-16 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=2
 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 mlxscore=2 phishscore=0 spamscore=2 mlxlogscore=170
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1912170000
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

--_000_95F85EE07D7A41CDA9B369ACC271087Cfbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQpJIGFtIGxvb2tpbmcgZm9yIGJpb3MgdXBncmFkZSBmcm9tIEJNQy4gSSBsb29rZWQgYXQg
cGhvc3Bob3ItaXBtaS1mbGFzaCBidXQNCmNvdWxkbuKAmXQgZmlndXJlIG91dCBob3cgdG8gdXNl
IHRoaXMgZm9yIGJpb3MgdXBncmFkZS4gSSBjaGVja2VkIGZldyBvbGQgbWFpbHMNCndoZXJlIG9z
a2FyIHdhcyBhc2tpbmcgYWJvdXQgdXNpbmcgdXNlciBzcGFjZSBhcHBsaWNhdGlvbiBpbnN0ZWFk
IG9mIGtlcm5lbC4NCkNhbiBhbnlvbmUgcGxlYXNlIGdpdmUgc3RlcHMgdG8gdXNlIGFueSBleGlz
dGluZyBrZXJuZWwgZHJpdmVyIG9yIHVzZXIgc3BhY2UNCkFwcGxpY2F0aW9uIGZvciB1cGdyYWRp
bmcgaG9zdCBmaXJtd2FyZS4NCg0KUmVnYXJkcw0KLVZpamF5DQo=

--_000_95F85EE07D7A41CDA9B369ACC271087Cfbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <11CCC2AA2EA07F439E748958DEB7EBAF@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToy
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3Jt
YWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCW1hcmdpbi1i
b3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTIuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXBy
aW9yaXR5Ojk5Ow0KCWNvbG9yOiMwNTYzQzE7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9
DQphOnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5rRm9sbG93ZWQNCgl7bXNvLXN0eWxlLXByaW9y
aXR5Ojk5Ow0KCWNvbG9yOiM5NTRGNzI7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpz
cGFuLkVtYWlsU3R5bGUxNw0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1jb21wb3NlOw0KCWZv
bnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0KLk1z
b0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7DQoJZm9udC1mYW1pbHk6
IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41aW4g
MTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjBpbiAxLjBpbiAxLjBpbjt9DQpkaXYuV29yZFNlY3Rp
b24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+DQo8L2hlYWQ+DQo8Ym9keSBs
YW5nPSJFTi1VUyIgbGluaz0iIzA1NjNDMSIgdmxpbms9IiM5NTRGNzIiPg0KPGRpdiBjbGFzcz0i
V29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6MTEuMHB0Ij5IaSw8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+SSBhbSBsb29raW5nIGZvciBiaW9zIHVw
Z3JhZGUgZnJvbSBCTUMuIEkgbG9va2VkIGF0IHBob3NwaG9yLWlwbWktZmxhc2ggYnV0DQo8bzpw
PjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOjExLjBwdCI+Y291bGRu4oCZdCBmaWd1cmUgb3V0IGhvdyB0byB1c2UgdGhpcyBmb3Ig
YmlvcyB1cGdyYWRlLiBJIGNoZWNrZWQgZmV3IG9sZCBtYWlscw0KPG86cD48L286cD48L3NwYW4+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQi
PndoZXJlIG9za2FyIHdhcyBhc2tpbmcgYWJvdXQgdXNpbmcgdXNlciBzcGFjZSBhcHBsaWNhdGlv
biBpbnN0ZWFkIG9mIGtlcm5lbC48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+Q2FuIGFueW9uZSBwbGVhc2Ug
Z2l2ZSBzdGVwcyB0byB1c2UgYW55IGV4aXN0aW5nIGtlcm5lbCBkcml2ZXIgb3IgdXNlciBzcGFj
ZQ0KPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkFwcGxpY2F0aW9uIGZvciB1cGdyYWRpbmcgaG9zdCBmaXJt
d2FyZS48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBz
dHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPlJlZ2FyZHM8
bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0i
Zm9udC1zaXplOjExLjBwdCI+LVZpamF5PG86cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8
L2JvZHk+DQo8L2h0bWw+DQo=

--_000_95F85EE07D7A41CDA9B369ACC271087Cfbcom_--
