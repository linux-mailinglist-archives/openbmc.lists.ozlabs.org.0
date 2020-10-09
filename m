Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B2ABA28918E
	for <lists+openbmc@lfdr.de>; Fri,  9 Oct 2020 21:08:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C7Hfc6NhZzDqcq
	for <lists+openbmc@lfdr.de>; Sat, 10 Oct 2020 06:08:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=75514c584f=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=Cnfcm95e; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=LvfN4hue; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C7Hdh2YZBzDqZp
 for <openbmc@lists.ozlabs.org>; Sat, 10 Oct 2020 06:07:44 +1100 (AEDT)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 099J0Kfl010210; Fri, 9 Oct 2020 12:07:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-id : mime-version :
 content-type : content-transfer-encoding; s=facebook;
 bh=Z1dGp7v7wS4fmGWiveEn6t575ZuXPJd8HEH+jTO2gZg=;
 b=Cnfcm95evgo5kAgWndDVrBIMe5/04oJOUHdyNKQM24zCIKL6RjLC4D20ltamabkZfgI6
 xWterxAnNuZ1sedm/OQaZSDpGFlNunU0J0hsZBJhEnImjjiv6UJoUjXB4lWBTWwlI+Vf
 9Yom3Bnwh2AYn+EwNeGNGOJ8QI61wL/94yw= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 3429h8ncgf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 09 Oct 2020 12:07:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.100) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 9 Oct 2020 12:07:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iG2Y+YNqwPKBZdXat5r9Akl8q9zkjeATEJcbwGB94COwT9Im3zhdDYy+/Xrla2CvtBSwoCY50y+mcuGfepDqmDxOFBvSdIePJ06wjs+xCu9ZV6XP9MxqHa82aF2RXpglQYX/yVs5lrIeoxHkuOsUyD2yPKdocD6GmXk1wtQ4j5GpdbVen62JFzr0/hh/h57H7qGjAW4MqcTeTg53RN6f7ac5qyQLfi5vWIH7lvo6agk58SJl2dIaYWbWIuzyyxNscGC7oS6w3nRh8WJhzhnATiw4lfPV59Hp5mLrOvY0eThqAAr8U56K4bRjypfRp47P2siR+rN1vyMuCf3LCF6iww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1dGp7v7wS4fmGWiveEn6t575ZuXPJd8HEH+jTO2gZg=;
 b=XYGGgLgQDh+YCnf3wgFLVJF12WmK4EKDdwyHWn46tnnSF3VLY5Qs/k5tyF4qAx/09tFkCrIsqPcaW/jRn3UWDHpHTxaKvDd3g1LlKp3wCzl1erWkiiandTes9a8L/XiKYGJVQihCV1NEbQ/7WCoIMhLgdl02L/dqPRjGLvWacohr6rWcYQVu+IqZw+y6SID+XVU/ABRqV6A1+Oml7Qmx2XqCcPZhcUhcrm8pWxlRYPuT1tNPR7rGCyyxO6Mvl2YW4WKMkq7ZoOs5ig8MHMhdRmeXDsHsKcb/DQ3x87v3MDn21AtLh7+s/7U8gei0ufjSV70m+1up1gfyRpqKH1XwzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1dGp7v7wS4fmGWiveEn6t575ZuXPJd8HEH+jTO2gZg=;
 b=LvfN4hueoi2M3HOzYewKNcBAJE7V+902Zht5qaC9nKk8K7LyTNWOcQQqAyzN2EQLIVPsnmBAxynn0j+IHkb8I0tH6f7U5mHbTsJlcd5jSDyp635iaAkgzXRUa8xEEYOEde0iS7UcNszKqGRY9sG82Avl7SP0+yrMq/O1VAC3mes=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2886.namprd15.prod.outlook.com (2603:10b6:a03:f7::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Fri, 9 Oct
 2020 19:07:37 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::89a4:31b:4b4e:8819]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::89a4:31b:4b4e:8819%6]) with mapi id 15.20.3433.045; Fri, 9 Oct 2020
 19:07:37 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: James Feist <james.feist@linux.intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Heading out
Thread-Topic: Heading out
Thread-Index: AQHWnOMR4e5b6dUiS0COKlBYi0uRT6mPL8YA
Date: Fri, 9 Oct 2020 19:07:37 +0000
Message-ID: <B6502271-DF54-44FC-8D5A-6AF2393DCE45@fb.com>
References: <9ca9dd09-b381-d0e9-bd63-9a23496c97e1@linux.intel.com>
In-Reply-To: <9ca9dd09-b381-d0e9-bd63-9a23496c97e1@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:790d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e22c4688-d803-44f0-9e08-08d86c869669
x-ms-traffictypediagnostic: BYAPR15MB2886:
x-microsoft-antispam-prvs: <BYAPR15MB288620B8B1F1863E8BA823BEDD080@BYAPR15MB2886.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wQlkpSzw/JYh7LIEblJpp2eKLqFedbYD5X78qxfgkq2MTOjbnjQed6G7C8sWvYtIR/p/jir5rRr5X72vNFe4pzgUAcGNuppufI5fYMUQ2uuSwdecNnX2e5kkKZbjHCn6ASBE99p6D9C4FRjMKpet39jK+HZ4FQhYL77kZci4MIQhMhvN3YWX23LJIkWmXYE3XaOdsKzfi/1Zbca8JuQjMrwWhHnFhcQZlCrKTUQqMvSlmW4F80yz/8ORsri21IOEZ12BKpNsNy93gfy5YsxAX1tdJEYXrfl8kU2/EE9wt78RtKcLa3iSWvWd+aMk+Xu57g/jv4sxgvXIuZ2AGAXWLQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(136003)(366004)(396003)(346002)(6506007)(66946007)(5660300002)(71200400001)(76116006)(91956017)(66476007)(66446008)(64756008)(66556008)(33656002)(2616005)(4744005)(3480700007)(8676002)(6512007)(2906002)(86362001)(8936002)(186003)(7116003)(6486002)(110136005)(478600001)(316002)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: CaDL+rK9RXxvqVxxoMkgi1AX6AQsHmm3Wso8h9aVyfn9k6Xna+0BDbe/vGgmRI2RGbPKO6Z+fWRrgLInXs5xmoG4vFWylRKqWED2s24RsU2roDUMy4of9cmYLK1PFI8JhN0ZOWYbezqsO8xxq1CHXdorLG+kPN3EGXbVUU7084Oj5Tfws0mH8JE8PZniYCIVzLoBp3aoypJ3fYtKa3JRdNH7OuUoQ4KZ5TbRqPp/A76azgXU2u+jBpTsmS1W6zpPiKUVVHaMPjiiU46hLFmQL374v719cl+Fui9r6q1yY+KME2oPvoIpGoyzbjmZ8gIevMjrkG7+2v5xHuUbuREpeCxVrhjwf1AwspOZoBw7VM6828+Jn1Sk9EOVZAiZwqJkJWxYDsWlhhETWD1kEaH41CJNz32gikxRh6KdXQfVopk4RRzMm+zSsLZoQ6yhdgnGyO3Q286E3d/l17iMJ9jNnovfViiC7LH6JepzOGDCDCa99vf6f4+W5rEvYTcn8GMGocGm1cq9s/cKWt8u2oybiMS5vZGI0+bsU5uwqmJyRVqKm4bcF/CQbb+4CjnU85Bw07GHsUPseK0rkJfd/xmlLyeKCj/HqYUkLCEHeGu74nHLFoT8hqY8B3z66gWQ3TCX5/jXD9fprUGtocdnHN2K/bLj0B5SWxdqmzrr29gTTnWdv74c51iMduYjHi/VPGd+
x-ms-exchange-transport-forked: True
Content-ID: <B791CB3D20D1554F9D6C90594DA10160@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e22c4688-d803-44f0-9e08-08d86c869669
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2020 19:07:37.7566 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XrY5BC6W3ZqjmheOjr0pSoAPJXM4azkILBlQR+Bq3w5t6lQsny/uidgNxZ0jMEKXXFXuF+JE25hMG+wNqdZhZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2886
X-OriginatorOrg: fb.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-09_12:2020-10-09,
 2020-10-09 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0
 clxscore=1031 impostorscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2010090137
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

DQoNCu+7v09uIDEwLzcvMjAsIDEyOjUwIFBNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgSmFtZXMg
RmVpc3QiIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFicy5v
cmcgb24gYmVoYWxmIG9mIGphbWVzLmZlaXN0QGxpbnV4LmludGVsLmNvbT4gd3JvdGU6DQoNCiAg
ICBIaSBldmVyeW9uZSwNCg0KICAgIFRoaXMgd2lsbCBiZSBteSBsYXN0IHdlZWsgb24gdGhlIE9w
ZW5CTUMgcHJvamVjdC4gSSdsbCBiZSBtb3Zpbmcgb24gdG8gDQogICAgc29tZXRoaW5nIHVucmVs
YXRlZCB0byBPcGVuQk1DLiBJdCdzIGJlZW4gZ3JlYXQgd29ya2luZyB3aXRoIHlvdSBhbGwuIA0K
ICAgIEFsbCB0aGUgcmVwb3MgSSBtYWludGFpbiBoYXZlIGFkZGl0aW9uYWwgbWFpbnRhaW5lcnMg
d2hvIHdpbGwgY29udGludWUgDQogICAgdG8gbWFpbnRhaW4gdGhvc2UgcHJvamVjdHMuIEknbGwg
YmVnaW4gcmVtb3ZpbmcgbXlzZWxmIGZyb20gdGhlIA0KICAgIG1haW50YWluZXJzIGxpc3RzIHNo
b3J0bHkuDQoNCiAgICBCZXN0IG9mIGx1Y2sgd2l0aCB0aGUgcHJvamVjdCwNCg0KQWxsIHRoZSBi
ZXN0IGZvciB5b3VyIG5ldyBhZHZlbnR1cmUsIHRoYW5rcyBhIGxvdCBmb3Igc2lnbmlmaWNhbnQg
Y29udHJpYnV0aW9uIHRvIG9wZW5ibWMuDQoNCiAgICAtSmFtZXMNCg0KICAgIGZlaXN0ampAZ21h
aWwuY29tDQoNCg==
