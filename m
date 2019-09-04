Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BB3A952C
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2019 23:34:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Nxsx68J5zDqt3
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 07:34:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=4150651e40=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Y1TVyXrk"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="EmcZfonH"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NxsB0HzszDqfj
 for <openbmc@lists.ozlabs.org>; Thu,  5 Sep 2019 07:33:44 +1000 (AEST)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.42/8.16.0.42) with SMTP id x84LMr87030894;
 Wed, 4 Sep 2019 14:33:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=facebook;
 bh=xZp5xT5VPdTu1av8DHmVWFDfQy9JNOz7X+qPcQSBsqQ=;
 b=Y1TVyXrk32MX4wNLgvDp6jFghM0BGOC1SsImT7LAzy0coi1DGebyqrBisZs6OL9TDa96
 lPFLuZ5pCXskXOH4sZ+9ljUWd9Aqdn9sfIY7MjpSCs0V6MybFSkoGR2KOHFNtdqhNYF6
 k9lMH9nugA/Tn3SxRcsYQCZNlKDzZP75Acg= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0001303.ppops.net with ESMTP id 2ut43acewr-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 04 Sep 2019 14:33:36 -0700
Received: from ash-exopmbx201.TheFacebook.com (2620:10d:c0a8:83::8) by
 ash-exhub103.TheFacebook.com (2620:10d:c0a8:82::c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 4 Sep 2019 14:33:34 -0700
Received: from ash-exhub104.TheFacebook.com (2620:10d:c0a8:82::d) by
 ash-exopmbx201.TheFacebook.com (2620:10d:c0a8:83::8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 4 Sep 2019 14:33:34 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.175) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 4 Sep 2019 14:33:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=frg90YYRptoYXCvDYBfLiLA0cfOUYhuyOHG0isROvsHx81WaHpW3VfUUve3ysLPCR9bTu4qX9g0SFwOfaj8fg+qwnaMgeDtLlXYEWEHYSUTRsjQ01rTtyfZD7Vfdn6yzIaktpdGs6kWmBEtzOF95l5rQsRijkXzBPogiHZdpE01MomVW86yELBwVDSNiQM+PKvnXIZqHZuhLiUSCgOgOi6MRVjowMDKlkU8xgdu9rwb3kdc23KEJ7HGIO7S9/Uxtv3+oZM1eF3tiRGeOcXkbcx64KntcmbrjSXjaj8nxdcQ/xKkfVyvlG96lMrO5P+NAsjHLvSTay/FKOqhGMdwylw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZp5xT5VPdTu1av8DHmVWFDfQy9JNOz7X+qPcQSBsqQ=;
 b=WODwR/5W629zGNboRvOGDSIvmUuUTMB4LPzMTyuhzMy+TgPvVT1uCwP22tHOueX79i5+7fxoje4Rx4d8BYZ8F3ket4a1b2Mxr78xiJVV0SbQE4CG9Bx2sPqsuhi9Yzvf0I/An4kWu8pR2ROHNdATNFK9il+u+PnKMAyCxbGEali9IWdxHUrK7qNMA0OMMu61AvbdVe/NrUnkLDy1TWsm/Gxn3togmxYoHiHAXuXSRPFwy//NUa9J2xPohuf4MCGL6v/lIhL9PLrAB60LckVj57L0mGnWxAaaTkXKtJMJFSjyfDTu1HbLWNHd9HuMCvjqvmU62mhvLhWMm/HPDfykHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZp5xT5VPdTu1av8DHmVWFDfQy9JNOz7X+qPcQSBsqQ=;
 b=EmcZfonHxguNd3qY7ZwFAV7wSyu4kak56otisSc2MI/AVjVVbKN7svvrjtp4EMgRXnSDRcPJCLowWICGXg82C5W9TjvAjz0Qr2mUwVcKFuWoP0wacrfBUfgduDtTrhopcWe8wxxBOGZQv90f52GA52p3AbDkPNGQtTI2oDb4vkw=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1165.namprd15.prod.outlook.com (10.175.3.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.21; Wed, 4 Sep 2019 21:33:32 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::94f6:ca02:596c:801]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::94f6:ca02:596c:801%9]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 21:33:32 +0000
From: Tao Ren <taoren@fb.com>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>, Jeremy Kerr <jk@ozlabs.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: net/ncsi: BMC gets incorrect ipv6 link-local address
Thread-Topic: net/ncsi: BMC gets incorrect ipv6 link-local address
Thread-Index: AQHVY2hm1IBug8pXl06yhf+uB/36pQ==
Date: Wed, 4 Sep 2019 21:33:32 +0000
Message-ID: <18e1fb68-1607-0e01-5b21-171a83f94bd9@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR0201CA0022.namprd02.prod.outlook.com
 (2603:10b6:301:74::35) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::2:fd50]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23ed3faf-e66e-477c-8681-08d7317f88dd
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1165; 
x-ms-traffictypediagnostic: MWHPR15MB1165:
x-microsoft-antispam-prvs: <MWHPR15MB1165A51B461214CF688F5942B2B80@MWHPR15MB1165.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(39860400002)(366004)(396003)(136003)(199004)(189003)(316002)(58126008)(52116002)(6512007)(2906002)(478600001)(6116002)(65806001)(6436002)(81156014)(81166006)(66946007)(31686004)(386003)(65956001)(110136005)(53936002)(6506007)(186003)(102836004)(8936002)(6486002)(99286004)(2616005)(25786009)(14444005)(256004)(305945005)(71200400001)(4744005)(36756003)(71190400001)(66476007)(66556008)(64756008)(66446008)(31696002)(476003)(486006)(5660300002)(86362001)(7736002)(46003)(8676002)(14454004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1165;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pwW7C+918nWseVPaK70P9BB7tbhW7i0MjfIkBBXXG8HI2pCuzIThyDulYadM0MecuX5cG8s0wzQ2aR0B0AGVgmTPSqILwXN6t3ghZkA7XXrEorpWteoSr0v4BuaxZryDgcVaSmr1rlAey1DjOPyQlxAICC8wtCHl6GnJ1PWo9lyXzUkukm6US5oW4pbEm6dc5uHcaOQSHbP+0TppvpcJAIq/8mKFelsdSQf56f2+Bhb0+Z4kcGrBstAPGdqUEpboPcQYj+VVAyth+WngE69fWqCIwnrz/sbyi24ZJre+/zRmk1uuEoRUe89ZxyJQy2eBxoglQHgumuDpSqvCS76hrR1EgtmnqYHixr6wJsU0s+CbevB31QJ71nCI3umIxcBLdWzx8tqgmfG/IiqtPd1+xdjfW1JwWJrILydr5SqT3M0=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <5C3A25CA7F301344AA07E2C6CCE0D12E@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 23ed3faf-e66e-477c-8681-08d7317f88dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 21:33:32.6709 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OXdXOVgXRGksPAeZkRL1CU+itPM2O0CXuLSEayjDQcHVyjAITxStWBsQEtBOkx/t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1165
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-04_05:2019-09-04,2019-09-04 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 mlxscore=0 clxscore=1015 phishscore=0 adultscore=0 mlxlogscore=583
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1909040210
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

SGksDQoNCkkgZW5hYmxlZCBOQ1NJX09FTV9DTURfR0VUX01BQyBvbiBteSBZYW1wIEJNQyB0byB1
cGRhdGUgQk1DJ3MgTUFDIGFkZHJlc3Mgd2hpbGUgYnJpbmdpbmcgdXAgZXRoMCwgYnV0IEkgbm90
aWNlIEJNQydzIGlwdjYtbGluay1sb2NhbCBhZGRyZXNzIG1heSBiZSBkZXJpdmVkIGZyb20gdGhl
IG9sZCBNQUMgYWRkcmVzcywgd2hpY2ggbGVhZHMgdG8gREhDUCBmYWlsdXJlIHdoZW4gREhDUHY2
IHNlcnZlciBhc3NpZ25zIElQIGJhc2VkIG9uIGlwdjYgbGluayBsb2NhbCBhZGRyZXNzLg0KDQpD
dXJyZW50bHkgSSB3b3JrYXJvdW5kIHRoZSBpc3N1ZSBieSByZXN0YXJ0aW5nIEJNQydzIGV0aDAg
aW50ZXJmYWNlICh3aGljaCByZWZyZXNoZXMgaXB2NiBsaW5rIGxvY2FsIGFkZHJlc3MgYmFzZWQg
b24gdGhlIG5ldyBNQUMpLCBidXQgSSdtIGxvb2tpbmcgZm9yIGFuICJvZmZpY2lhbCIgZml4LiBG
b3IgZXhhbXBsZSwgc2hhbGwgd2Ugbm90aWZ5IG5ldHdvcmsgbGF5ZXIgd2hlbiBCTUMgTUFDIGFk
ZHJlc3MgaXMgdXBkYXRlZD8NCg0KDQpUaGFua3MsDQoNClRhbw0K
