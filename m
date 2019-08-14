Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5B08E114
	for <lists+openbmc@lfdr.de>; Thu, 15 Aug 2019 01:05:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4684th2sFKzDqw2
	for <lists+openbmc@lfdr.de>; Thu, 15 Aug 2019 09:05:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=3129636cf0=wilfredsmith@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="WttqZ4go"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="bWDz6/bK"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4684sw671KzDqrV
 for <openbmc@lists.ozlabs.org>; Thu, 15 Aug 2019 09:04:50 +1000 (AEST)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7EN3Dkc019031
 for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2019 16:04:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=facebook;
 bh=ZeJN8DcC9+0jn3R6Nm/8SL82SaNTSeBiL4WQdahPH8M=;
 b=WttqZ4go/zM0pejehJakkL2/VP40e5VsR5AMGctWXz2980cQAUdpnct0+cgsFq6ImGvC
 uxhDxg2Nb2VgFGfcsqfVLGI2bMBYqcqlqDtOGtI5Ov+uH1mbQpkzRAIplxyJ0h8Y8BHI
 AXQCIu/HVaAC1SzlVrWqFezMQx7QdaAoWKU= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2ucqsg8xb9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2019 16:04:47 -0700
Received: from prn-mbx02.TheFacebook.com (2620:10d:c081:6::16) by
 prn-hub05.TheFacebook.com (2620:10d:c081:35::129) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Wed, 14 Aug 2019 16:04:42 -0700
Received: from prn-hub01.TheFacebook.com (2620:10d:c081:35::125) by
 prn-mbx02.TheFacebook.com (2620:10d:c081:6::16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Wed, 14 Aug 2019 16:04:42 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Wed, 14 Aug 2019 16:04:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zn67hAgPfr02VFnjVniIkMDi7bQiShVdZauvFFny8PeyvlAxWUnRCHxf0Z7ijTUmV1VeiLxkswdLyNqxKWCJ5y4LP/NvOBoK+kABGx1bku2EOlyWeMHwy46+ONPct4/zcp5iMJ0MXEFGXToxLjT4ziR/e3AEZVB2GriRdMNmhBom0wWoPA72/GdT3RBZHrFN1qdSD8VcR2ymd1pB/YORnQoBybvCbWZ+zrqGI0Q+8nDQQZ+3bqjnDoSSigKNIpqqMxvJlfMijxJCnmRiZs594fLOLx77jvZIjV2XYMvToAsYtNPimYgmxvM0hmeY4S4XOCUuqhvNTFTJsvOD4f+OXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZeJN8DcC9+0jn3R6Nm/8SL82SaNTSeBiL4WQdahPH8M=;
 b=YWe/CxJZOzjID+/nxE1hHtfhgpV+PR9otsND6NzachbNeUNRdUX+7kzcqpOJFZGxz7fG2MKudo13+Vu/1/H7H1G/YI7ZUn05x5JNuVAHY/5GNebP42FfAn9lPUuX4+d0DkAMTS/umtn/M3LSj7YlU7JIS2v3mosSI5ltMxjzJdBzAkpQwUJ4qSVLENxhgkofCMfOY6kzYbKqxByZ8i8+K1Wd5arUx828H5BF8KIgpzIns4VQK/NlChsFMglwBqTts8xhvjGRldYGQw5yGsHOMunxFtKUUaWcPmQkiEGvSbl3lDlB1jWeihBG52tQRY4fp7oMR1QLDqVcAPzADqoNxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZeJN8DcC9+0jn3R6Nm/8SL82SaNTSeBiL4WQdahPH8M=;
 b=bWDz6/bK9/N5axP4bAMtuIzP/v8Wofkmo1MdWa627m6NHpYtUAdmQ/3SHXt7M9/hO28XuL49I0rzrNa1tbwhOIC2oBpqdmeSm63/egAhZJLJJMxi8Cgewh58AUhvhbO0hND5gxk4LGR62ntcvRMlFHTHzSbfEZkm1CQlvQCc4/o=
Received: from MN2PR15MB3680.namprd15.prod.outlook.com (52.132.173.209) by
 MN2PR15MB3630.namprd15.prod.outlook.com (52.132.173.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.20; Wed, 14 Aug 2019 23:04:41 +0000
Received: from MN2PR15MB3680.namprd15.prod.outlook.com
 ([fe80::b9ff:f089:c837:4a20]) by MN2PR15MB3680.namprd15.prod.outlook.com
 ([fe80::b9ff:f089:c837:4a20%5]) with mapi id 15.20.2157.022; Wed, 14 Aug 2019
 23:04:41 +0000
From: Wilfred Smith <wilfredsmith@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Historical Sensor Information
Thread-Topic: Historical Sensor Information
Thread-Index: AQHVUvSne8GbWhmryU+sUmnsPTWC5Q==
Date: Wed, 14 Aug 2019 23:04:41 +0000
Message-ID: <FB0EDEFC-F92E-4F6E-B6BC-B0C5E7AD6E73@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::7c14]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c54029c1-114f-4534-51be-08d7210bca17
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR15MB3630; 
x-ms-traffictypediagnostic: MN2PR15MB3630:
x-microsoft-antispam-prvs: <MN2PR15MB3630E67E01D4E92BE4C823C8BDAD0@MN2PR15MB3630.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(396003)(39860400002)(346002)(366004)(136003)(189003)(199004)(305945005)(36756003)(8936002)(25786009)(8676002)(186003)(71190400001)(71200400001)(6116002)(81156014)(5640700003)(6916009)(99286004)(6436002)(46003)(316002)(81166006)(6486002)(7116003)(33656002)(53936002)(14454004)(2501003)(5660300002)(4744005)(2616005)(64756008)(478600001)(86362001)(1730700003)(476003)(76116006)(91956017)(3480700005)(66476007)(102836004)(2351001)(486006)(6512007)(66946007)(2906002)(66446008)(256004)(7736002)(6506007)(66556008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR15MB3630;
 H:MN2PR15MB3680.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9UD7Gl3htDyMbkG33bWL2fn8Kd52MRlppW6NkjNL9vRymJ5v0P/2zBJCf7eJFKLSnTbHT0iTy7rOL/DiEbGzmBfL2dRFoB07+b7AQ4kzhQH9eYn7bfxoZmiWR8+9KKwhMzh3cmELUJlj7R9T+hWGCiKOIsjDuYJ6L7nx5AV7joZtDnHSgx8uL4pxy+L89Ay6HE8bCEfKctzrJSJgU2Fl3KVwm/O1DU1asMf3TPHNYebjL3dd2+70U5mImetx8RJ7aa8Amz0bBNlg6PMclxKDobLe9LCl0QoVsRrbtsjQJtPXNu/kQU+PP2AZ9GuDArmJoeCE65+/5lo9/aQ9EMqyQ8g9SE30b6DTopdZfGRsA6abDvojqQtjyPKgIf4u5t8qUBbwP6wo/aTvjvLNJHrpJEXSfuYr/HhTAJau1Eacepk=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B2A4AB525C0484BBF2B5762877A2512@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c54029c1-114f-4534-51be-08d7210bca17
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 23:04:41.3368 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ri4mxn+1TTU/zzC4P6xWZmDkdbN8SeI+hZhHe4EY/DKawkZYpiwKvE24v29oDXY3oO8SoBoYT5P0/n7xZeO1wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR15MB3630
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-14_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=529 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908140210
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

SSBwcmVzdW1lIG1vc3QgdmVuZG9ycyBkZXNpcmUgdGhlIGFiaWxpdHkgdG8gcXVlcnkgaGlzdG9y
aWNhbCBzZW5zb3IgaW5mb3JtYXRpb24gZnJvbSB0aGUgQk1DLg0KCUhhcyB0aGlzIGZlYXR1cmUg
YmVlbiBpbXBsZW1lbnRlZCBhbHJlYWR5PyBJZiBzbywgcGxlYXNlIGRpcmVjdCBtZS4NCglJZiBu
b3QsIGhhcyBzb21lb25lIGFscmVhZHkgYmVndW4gZGV2ZWxvcG1lbnQ/DQoJSXMgdGhlcmUgYW4g
ZXhpc3Rpbmcgc3BlY2lmaWNhdGlvbiBvciB3cml0ZS11cD8NCglBbnkg4oCYZHJ1dGhlcnMgb3Ig
cHJlZmVyZW5jZXMgb24gaG93IEkgbWlnaHQgcHJvY2VlZCBzdWNoIHRoYXQgbXkgZWZmb3J0IGJl
bmVmaXRzIHRoZSB3aWRlciBjb21tdW5pdHk/DQoNCldpbGZyZWQ=
