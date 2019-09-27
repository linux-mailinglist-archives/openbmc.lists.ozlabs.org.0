Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5172AC0E08
	for <lists+openbmc@lfdr.de>; Sat, 28 Sep 2019 00:29:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46g61401DmzDqYj
	for <lists+openbmc@lfdr.de>; Sat, 28 Sep 2019 08:29:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=41734e475f=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Fn36kobw"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="EOs37bJS"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46g60Q3DQlzDqwh
 for <openbmc@lists.ozlabs.org>; Sat, 28 Sep 2019 08:29:05 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id x8RMStmB001196;
 Fri, 27 Sep 2019 15:28:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=iGpXV+x2iIIGzM8U23hSINEMnYdyECWVwaYNo50tVeU=;
 b=Fn36kobwEmGp5y8ze3nl02NxcAkYKs2MUyvmw+rOZb6SAExvQ2GtBucAdaQCjK4gV1Ti
 9ia+SPIcaECzHJ8Ah84s8h4WDZn1VGNmFyh6sZ0OWWko4DGwYTPeeH7QDH7CXmkjJrQ7
 kT71/d3M9CYzVLoCRaqViSj3M3KDuxVuQ/c= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by m0089730.ppops.net with ESMTP id 2v9pk81g5m-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 27 Sep 2019 15:28:56 -0700
Received: from prn-hub06.TheFacebook.com (2620:10d:c081:35::130) by
 prn-hub02.TheFacebook.com (2620:10d:c081:35::126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Fri, 27 Sep 2019 15:28:43 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Fri, 27 Sep 2019 15:28:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XIHB2ElTTMor726Ukv5VK7EeP1nZBHhuwrPO+XTsGmIRvWvuIv0xc36IYzGRoqr/vdU7A6Ti6Lnm1GwSCUCkHDfPyRl3melycJAMcrs8uNwHBC3RF0znDgDi1yGxpPioYVmxu0XFjTKOf+b6RG/plJuIWNC4HdNw5ADjerBq6sxIopQC5h1KAq+FqGc+EWYDfWlrcqyJAeHuUiRW84E4AhBZCKWdURKIJ9/sQel0anT8TRab1kldt5xKoFLG5gfumXnVvqU9QfT+uE7BDXTmOS8nLJFZi44+p7GDJfTCyMab0MiqqiRkkcEs1Vm5WNzdG1f80Bb/PL2+8MQxnMOCug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGpXV+x2iIIGzM8U23hSINEMnYdyECWVwaYNo50tVeU=;
 b=Ik2vgadQsCS8Uk8CVIUQg8VrOIAsDxvEyLm44VUocizp5DalsN95tX+A1kLqte+xqWLwrOx21wM4pqaOPyeOaW9ZUJB2wmdkyWeFQj/tRKCnwyA8Sle5pm0UCNUJtEkt1SdNT0f4jYSWXaz7+qJWSKyu9gaz0q2cWFSgQq37AB5BP29QF4+c18EXhJqQ6JgxGr3sIGKF6AlCT09xDHpHwhOo2TJlVDAoGMylWXI1GHNYoTJSO0D7GfiVlAdVvafsQ7Kn9zbyp5ZemQ8abS+Xf0km8eiqWKIITNYQ3fYxR679iw/OCCik3b5Ahsmwmhn1G5N1TBm6CatLywy/ihLyvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGpXV+x2iIIGzM8U23hSINEMnYdyECWVwaYNo50tVeU=;
 b=EOs37bJSagaQAW3Ay2cYoOBnlUt2J58/ndChNe7YqgbsPSQtgS5H5EUrX+ycEXH/gScEo8GvR6Woqa+PcaLZhsRw5PErBoN+OK586uekr/KRIzG4qlGBzqjra98H1p/ca+OEPO8EucBkVdnhnIvq6rc50e3zfvuxlLV1+U9UXgc=
Received: from MN2PR15MB3648.namprd15.prod.outlook.com (52.132.173.89) by
 MN2PR15MB3422.namprd15.prod.outlook.com (20.179.22.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Fri, 27 Sep 2019 22:28:25 +0000
Received: from MN2PR15MB3648.namprd15.prod.outlook.com
 ([fe80::4802:c73a:1af7:9c41]) by MN2PR15MB3648.namprd15.prod.outlook.com
 ([fe80::4802:c73a:1af7:9c41%4]) with mapi id 15.20.2305.017; Fri, 27 Sep 2019
 22:28:25 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Kun Yi <kunyi@google.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Accessing kernel panic information without BMC console?
Thread-Topic: Accessing kernel panic information without BMC console?
Thread-Index: AQHVdX+2hVWG+J3nxkiRWpYYSRT8Zac/pWiA
Date: Fri, 27 Sep 2019 22:28:25 +0000
Message-ID: <E6FDE343-5FC6-4493-9D53-BE6317525DB7@fb.com>
References: <CAGMNF6XaNL1HGf7=zKeJrO7CBH_1Y+yhUJi9FQRQ--2V9U+KUA@mail.gmail.com>
In-Reply-To: <CAGMNF6XaNL1HGf7=zKeJrO7CBH_1Y+yhUJi9FQRQ--2V9U+KUA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:5880]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 22cd10ae-4c25-4018-a4d4-08d7439a035c
x-ms-traffictypediagnostic: MN2PR15MB3422:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <MN2PR15MB3422D3E464F99205AF131201DD810@MN2PR15MB3422.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(39860400002)(136003)(346002)(376002)(199004)(189003)(66946007)(91956017)(6436002)(7736002)(76116006)(64756008)(66446008)(256004)(6116002)(66556008)(66476007)(8936002)(81166006)(81156014)(8676002)(11346002)(33656002)(186003)(229853002)(305945005)(102836004)(6506007)(76176011)(99286004)(46003)(36756003)(966005)(478600001)(446003)(110136005)(14454004)(316002)(71200400001)(71190400001)(2906002)(86362001)(2616005)(486006)(476003)(25786009)(6246003)(5660300002)(6512007)(6306002)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR15MB3422;
 H:MN2PR15MB3648.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F3VsHciXlEMww3nwQO5ufhSCkK1Nhf3u/w6G2p8RTEU4YzKUphtmvQiTNfJ0hDjz3pF0puNlB14li72dwvmUF8zOyFzCgv7LAZB3gY9x9SBAKoj+GosINfC7NY/kCIKe82MQJ3bkS052WPIoxzN+KXmU/BgYLUI1kC5jzn9baWUWG3WE7ciykMQ/z4il2J+Gd5Ulf+OUZRY7AGXiSqaZvm/9TOSIjuYUddbdX3S0S6118WFLFB9Psk0Me+rPXHK2bYejbwvXoO6rsiN/1deVGx12tkv6VPRpPiWX4UY2AO0wlBA8KQI3qhGAVu04VIWWRdCMmiATFczEuIa5lpTeozBEpM7KqjGYOjfOd50NpIQovfsLd7PZKYdcau0J2laFENWmoNg0YzrrKCbw+LBQUfQTSxecH073w03V32G8qiaCT2XiQL4G+b5FHmgOQJNVV5LFS0P+Iy6sso+WpnlP/A==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <CBE31E98C091AE45907E770EC53CA67B@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 22cd10ae-4c25-4018-a4d4-08d7439a035c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 22:28:25.5702 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cYz4hGuNtS9QLJKFwSiIK2xyxcuzTr54rGt+YbUzUhzegQjiwqTFiPTi1GO2zfO1u3FINIR+WNVTDRd4mmas2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR15MB3422
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-09-27_09:2019-09-25,2019-09-27 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 mlxscore=0 adultscore=0 clxscore=1015 mlxlogscore=752 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1909270192
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

DQoNCu+7v09uIDkvMjcvMTksIDM6MDUgUE0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBLdW4gWWki
IDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFicy5vcmcgb24g
YmVoYWxmIG9mIGt1bnlpQGdvb2dsZS5jb20+IHdyb3RlOg0KDQogICAgSGVsbG8gdGhlcmUsDQog
ICAgDQogICAgV29uZGVyIHdoZXRoZXIgYW55b25lIGhhcyBoYWQgZXhwZXJpZW5jZSBwZXJzaXN0
aW5nIGtlcm5lbCBwYW5pYw0KICAgIGluZm9ybWF0aW9uIG9yIHNlbmRpbmcgdGhlbSB0aHJvdWdo
IG5ldHdvcms/IEZvciBhIGxvdCBvZiBvdXIgZGV2aWNlcw0KICAgIHRoZSBjb25zb2xlIGlzIGVp
dGhlciB1bmNvbm5lY3RlZCBvciBzZXJ2ZWQgYnkgb2JtYy1jb25zb2xlLWNsaWVudA0KICAgIG9u
bHksIHdoaWNoIHdvdWxkbid0IGJlIGFibGUgdG8gY2FwdHVyZSBrZXJuZWwgb29wcy4NCiAgICAN
CiAgICBXZSBhcmUgc3RhcnRpbmcgdG8gbG9vayBpbnRvIHRoZXNlIHRvb2xzOg0KICAgIA0KICAg
IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvdjUuMy9hZG1pbi1ndWlkZS9yYW1vb3Bz
Lmh0bWwNCiAgICBSYW1vb3BzIHNheXMgaXQgcmVxdWlyZXMgcGVyc2lzdGVudCBSQU0uLiBXaGlj
aCBtYXkgbWFrZSBpdCBpbmZlYXNpYmxlDQogICAgc2luY2Ugd2UgZG9uJ3QgcGVyc2lzdCBtZW1v
cnkgKG9yLCB3ZSB0cnkgbm90IHRvKS4NCiAgICANCiAgICBodHRwczovL3VybGRlZmVuc2UucHJv
b2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cHMtM0FfX2xpbnV4LmRpZS5uZXRfbWFuXzhfbmV0ZHVt
cCZkPUR3SUJhUSZjPTVWRDBSVHRObFRoM3ljZDQxYjNNVXcmcj12OU1VMEtpOXBXblRYQ1d3akhQ
VmdwbkNSODB2WGtrY3JJYXFVN1VTbDVnJm09MEg2WWYwaWd2aUhDT1NIQWJPUFF4eE0tX0IwTGgx
RXlabTRkcGRNcWUyZyZzPUgzbjU3RlJad1Ywel93T0hxbWFpUmEta1E2aDNkb1dnNzEyU1Y0ZXot
R1UmZT0gDQogICAgbmV0ZHVtcCBzZWVtcyBwcm9taXNpbmcuDQogICAgDQogICAgaHR0cHM6Ly93
d3cua2VybmVsLm9yZy9kb2MvaHRtbC92NS4zL2FkbWluLWd1aWRlL2tkdW1wL2tkdW1wLmh0bWwN
CiAgICBJdCBzZWVtcyB3ZSBuZWVkIG1vcmUgcGllY2VzIHRvIGdldCBrZHVtcCB3b3JraW5nLiBI
YXZlIGFueW9uZSB0cmllZA0KICAgIGtleGVjL2tkdW1wIG9uIHRoZWlyIHBsYXRmb3Jtcz8NCg0K
SSBoYXZlIHVzZWQga2R1bXAgaW4gcGFzdCB3YXMgdmVyeSBoYXBweSB3aXRoIGl0LiBZZXMsIGl0
IG5lZWRzIGxvdCBtb3JlIA0KcGllY2VzIHRvIG1ha2UgaXQgd29yay4NCiAgICANCiAgICANCiAg
ICANCiAgICBSZWdhcmRzLA0KICAgIEt1bg0KICAgIA0KDQo=
