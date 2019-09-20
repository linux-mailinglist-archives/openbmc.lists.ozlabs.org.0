Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED35B974F
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 20:37:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZjBq4Q9NzF3m1
	for <lists+openbmc@lfdr.de>; Sat, 21 Sep 2019 04:37:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=4166e25665=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="QPVor7u7"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="WyLvXQLU"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZjBC466vzF3hj
 for <openbmc@lists.ozlabs.org>; Sat, 21 Sep 2019 04:37:22 +1000 (AEST)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.42/8.16.0.42) with SMTP id x8KIbHNo002746
 for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2019 11:37:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=facebook;
 bh=stK1p3X8QbrU4399EuJtoYaqJ4/DQxPRXnVyQlIQ+AY=;
 b=QPVor7u7w4AiCdQwbyWwJQcqQ63YVK1/9u5gw/M+3keoc5qJVAh0jf+2fEwxDibvnZSx
 X6F0i4uu8s2TUm8QjFHJoKdJpUftj1eM69K9ORJl+PDM9A81ZWOu307rLlcvdgM9QJOE
 Efr/qxxdHl1Ewi3aX2pJpMtUUSnbGQQr4Ys= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by m0001303.ppops.net with ESMTP id 2v51ecrv6k-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2019 11:37:20 -0700
Received: from prn-hub03.TheFacebook.com (2620:10d:c081:35::127) by
 prn-hub02.TheFacebook.com (2620:10d:c081:35::126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Fri, 20 Sep 2019 11:36:59 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Fri, 20 Sep 2019 11:36:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fOVDDjUQA4H2WGM75DvqZOHwmmADpBOib3NAp+SinG3794rTnr9GR2ro6jCQThDD4XzTUVuDvWt4cjfIwKwEIK0oolF30l3Yb5rKmgfUAMfbC7JHXdtu639E//gPW0u0Hg4lpnfpORj3yJf6xYLVZGHxhO+Fr5yE6jqMR2qOa667IeJWrPpSNPBeJpK4UuT3aSYDcpYw8wH5eAW5VSk9E/KL9F1ulxYy7DPvy3xrRnwc4pwKxh4+d/dH/Q70YxcTXGABAccUJVeFi9wQHCUV4FQZ4DFNmsAkwBm/r3X/pcAoHToDHWndtcpXn1VyPbMVH3lzbKhQBeKjXmNjnoO2TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=stK1p3X8QbrU4399EuJtoYaqJ4/DQxPRXnVyQlIQ+AY=;
 b=E/PW+vkDNI53Pv/Ddah/IJ65/NMWiw3K5sG7vUNnvOBWVopuGpJbJ7GJvJJUT+tK/wcNgKlwLOwZKjpPHRMiYbkPWigQtUL6ZunHlV4T/dgxEQa2cHWmJu/4ecKuh0o3o114s45uvppX7AwtozP4iG9SX32CRh5yK1PAKV9R2w2JAF0T8Lu8y1R0HhveANh6MS/ZCM+foFvycqRXJLnhVVr5nqFhfbtlW5BUrKN6Dd2qPoLTw4ZO9lp9/TlHYmPMkvNRvbHrmE7j36/uSwe+YI7ID4ZYPQKxsBrBEOu90ZU9wvnmbAPgrVQrrFw/lMEdkaop52e1kYYo6AJvZvijqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=stK1p3X8QbrU4399EuJtoYaqJ4/DQxPRXnVyQlIQ+AY=;
 b=WyLvXQLUKNx59VvtTUcg5siNsj93NA+qaHIugGderMEBlFoL7HyvupwUQrdNw3Q1r6CS26hoV4I+UwgnMaVJ6UsoN8tqTcZf0dPOd5UlIX9W1OueVZI1FypibtkXRmWWYW5FlKdnxsFzr2ZlTP2yHsELZ+LYPKkd8PMLvD+c4vc=
Received: from BY5PR15MB3636.namprd15.prod.outlook.com (52.133.252.91) by
 BY5PR15MB3619.namprd15.prod.outlook.com (52.133.253.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Fri, 20 Sep 2019 18:36:44 +0000
Received: from BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::bc3e:c80f:b59e:98aa]) by BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::bc3e:c80f:b59e:98aa%6]) with mapi id 15.20.2284.023; Fri, 20 Sep 2019
 18:36:44 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Wilfred Smith <wilfredsmith@fb.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: [Potential Spoof] Utility Error Output
Thread-Topic: [Potential Spoof] Utility Error Output
Thread-Index: AQHVb+Ja7owlKn8/SEyQFJMSqRmz8Q==
Date: Fri, 20 Sep 2019 18:36:44 +0000
Message-ID: <95F192E7-9726-486D-8191-8780F4D7E7CA@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:153b]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 00408530-ea8b-4c1f-9e20-08d73df97ce2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR15MB3619; 
x-ms-traffictypediagnostic: BY5PR15MB3619:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR15MB3619D2BAEE394B20CBF20E4ADD880@BY5PR15MB3619.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1824;
x-forefront-prvs: 0166B75B74
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39860400002)(376002)(396003)(346002)(136003)(189003)(199004)(305945005)(6116002)(2501003)(71190400001)(86362001)(7736002)(486006)(71200400001)(102836004)(2616005)(14454004)(478600001)(6506007)(186003)(36756003)(25786009)(256004)(476003)(99286004)(46003)(6246003)(81156014)(33656002)(81166006)(8676002)(4744005)(91956017)(76116006)(8936002)(5660300002)(66946007)(316002)(110136005)(64756008)(6436002)(6486002)(229853002)(2906002)(66446008)(66556008)(66476007)(6512007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR15MB3619;
 H:BY5PR15MB3636.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iukk08ul1Jhn1lefQhRGY8V2/iv9a+2GzzxLWH7ARehdlzOJn0t2jVVv1/jc8h4Uv6HU26lFk6GWF/5DYBSaGUSVK8BNCu1ZbLgkQqm+HATEOFARysk9Hi+A04seSEbUI7+KiUVvyKcLy+u8p13LiLLNb40JdXK0d2AEA/vvzUhY3b6Hf+EdcS/YZjSFf+p8PidiDGNSi+Os6eK2qD1BnpXfHZen0MqAXCkWwRdlF79W0s+k3qinsik/b2ZA9o6EcsdHF7cEEv9rU8yjHIbH6IWHs9jL0CeSXWDaRNf2jYQspxcV3CZ6DRNrzSQkXSGyRbw8sqU/FxMi+n5X0/RxeJFNu/oUnfRBrTkQJcmo85jWzCNiOxd4c2qiSAJYuRqQPFz71f7vj/Hoj6Xmn9UQeetUkGWduJZgAdLhDfDIF9k=
Content-Type: text/plain; charset="utf-8"
Content-ID: <26DD4E20CD854E46A41BD3BCF0797474@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 00408530-ea8b-4c1f-9e20-08d73df97ce2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2019 18:36:44.5743 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z3MIaVdwblcBwaVWSYLf/SNGIfpWKsV/dA1jDHWVMbJtUa1r1Y2cxWrf5pz6fbi4b/Q0dIyo+fbJui0eLhkzqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3619
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-20_06:2019-09-20,2019-09-20 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 bulkscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1909200153
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

DQoNCu+7v09uIDkvMjAvMTksIDExOjE1IEFNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgV2lsZnJl
ZCBTbWl0aCIgPG9wZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMub3psYWJz
Lm9yZyBvbiBiZWhhbGYgb2Ygd2lsZnJlZHNtaXRoQGZiLmNvbT4gd3JvdGU6DQoNCiAgICBPbmUg
b2YgdGhlIGNvZGUgcmV2aWV3IGNvbW1lbnRzIGZvciBteSBGUlUgZHVtcCB1dGlsaXR5IHdhcyB0
aGF0IEkgc2hvdWxkIHdyaXRlIHRoZSByZXN1bHRzIHRvIHBob3NwaG9yIGxvZy4NCiAgICANCiAg
ICBTaG91bGQgdGhlIG91dHB1dCBvZiBhIHV0aWxpdHkgdGhhdCBpcyBiZWluZyB1c2VkIGZyb20g
YSBzaGVsbCBwcm9tcHQgYmUgZGlzcGxheWVkIG9uIHRoZSBjb25zb2xlIG9yIHNlbnQgdG8gdGhl
IHBob3NwaG9yIGxvZyBkZXN0aW5hdGlvbj8NCiAgICANCiAgICBJ4oCZbSB0aGlua2luZyB0aGF0
IGl04oCZcyBiZXN0IHRvIHJvdXRlIGl0IHNvbGVseSB0byB0aGUgY29uc29sZSBmb3IgdGhyZWUg
cmVhc29uczoNCiAgICAJLSBpZiB0aGVyZeKAmXMgc29tZXRoaW5nIHdyb25nIHdpdGggbG9nZ2lu
ZywgdGhlIHV0aWxpdHkgYmVjb21lcyB3b3J0aGxlc3MNCiAgICAJLSBXaGVuIEnigJltIGludGVy
YWN0aXZlbHkgcnVubmluZyBhIHV0aWxpdHksIGl0IHNlZW1zIHN0cmFuZ2UgdG8gZ28gdGhlIGxv
ZyBmb3IgdGhlIHJlc3VsdCBvZiB3aGF0IEkganVzdCBkaWQuDQogICAgCS0gVGhlIG91dHB1dCBv
ZiB0aGUgdXRpbGl0eSB3aWxsIG9mdGVuIGJlIHVzZWZ1bCBmb3IgbG9naWMgd2l0aGluIGEgc2Ny
aXB0LiBEaWdnaW5nIHRoZSBpbmZvcm1hdGlvbiBvdXQgb2YgdGhlIGxvZyBjb21wbGljYXRlcyB0
aGF0Lg0KICAgIA0KICAgIENvbW1lbnRzIGFwcHJlY2lhdGVkLA0KDQpZb3Ugc2hvdWxkIGhhdmUg
YWxsIGVycm9yIGFuZCBpbmZvcm1hdGlvbiBsb2cgc2hvdWxkIGdvIHRvIHBob3NwaG9yIGxvZy4g
QW5kIG91dHB1dCByZXN1bHQgc2hvdWxkIGdvIHRvIGNvbnNvbGUuDQogICAgDQogICAgV2lsZnJl
ZA0KDQo=
