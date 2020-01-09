Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A98451362D4
	for <lists+openbmc@lfdr.de>; Thu,  9 Jan 2020 22:52:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47v0Fk6bdkzDqbm
	for <lists+openbmc@lfdr.de>; Fri, 10 Jan 2020 08:52:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=8277dfb138=zhdaniel@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=EMgSCZj5; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=CWmR5XpR; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47v0Dv4stRzDqZy
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jan 2020 08:51:19 +1100 (AEDT)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 009Ld5m9007257; Thu, 9 Jan 2020 13:51:13 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=facebook; bh=lHNqJSXL1oYbuNK/AL0HvAPELDaBOJEiUpRswOi2gnk=;
 b=EMgSCZj5XjjbA4dQKBBVMnCBS9J9gXE8Ir6a6wL42anpR5XanYRfHYEvpfzKfRBtexZt
 k4CrZg2ZE0i78kFnkTAbO7xz4pu5/+eImDTMQZzPhDmLRNv2mKJls1wY+5W6ouunfcXO
 +/VMzZ4EbP0o5LeeIfnR98/8nu0bL/5E3zQ= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2xe7ub9ry8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 09 Jan 2020 13:51:13 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.175) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 9 Jan 2020 13:51:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QCOp3NK/SxTLda+vACdM6W/+THxC/Mn+IEoUpjKUCUdqcfb770DJY8sa7WzgYdP+vYspUEF9nGW//HIgJVoJFKOYNbUpUEVb/tMzC3ban6/00Y3QaRstnbfOWgYHL2TCH+SaRFfEvJvi/uH5X7F0qth1w1AaJQR7ZOBroCiTm4blUBczdiBTlw8iutmAHWQZoiuW7XI2wYeH/W7vvukRnbYMSA/sM0lNeRRrdvybFXOoylORxd22Fo9rj+Ye/o3YEFjTU2FJVgwxgkt+SOTHBN45400UrPKTgegAPOS/9PljKI5BaQOKXu4C99RrmpCfsfQnVupsW6+u91V9LzonGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHNqJSXL1oYbuNK/AL0HvAPELDaBOJEiUpRswOi2gnk=;
 b=QEEKnGcdRbtwPqctmyaZU3R73B8buaVIaQG2Y/jHwuKBPynbP+lu1sPya0E3FUHPR65n3tgZBNS1FKRBr82M6dCLL4F+3hkBgQ31I8fj+e4LDPobNfnDiLyRWJCW6NRsr/c1ewFt5gz8pT06fHU0vcmMg3RHC+/h/LM9cvpj6QQ7NDB7toHv/CVCeKVd9q4UdUtjYTpf2wHaKQSbfdCmpv/guAkqnabowk+pEC+2Io64zqcHA4BR0WY4qOvtMmjK99/0gGLvawZ5b9uREybHbUjBNLVKM2m24OqgfHZ9zu+3F0uOQMeS7ksjhYDzMrvlpGrZIwRI0sGn2WKWyd+YKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHNqJSXL1oYbuNK/AL0HvAPELDaBOJEiUpRswOi2gnk=;
 b=CWmR5XpRfRnmvsW/hvOqYuh+8a7eVkIdsm36xB9rrHNYkBRvYZ2Ci2Z6uYBT0HOqLxHESuLERvzGZUAUi3DpuhzuUoGCyto7itteyfWpfff3REwCSADyPkUBRpBOQrgk8g0bb98NatK8XJp0l+pMSUdXzAppsDy1z5+UvB4BwIw=
Received: from MWHPR15MB1549.namprd15.prod.outlook.com (10.173.235.22) by
 MWHPR15MB1471.namprd15.prod.outlook.com (10.173.233.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.15; Thu, 9 Jan 2020 21:51:11 +0000
Received: from MWHPR15MB1549.namprd15.prod.outlook.com
 ([fe80::7123:feb5:8cee:5ac4]) by MWHPR15MB1549.namprd15.prod.outlook.com
 ([fe80::7123:feb5:8cee:5ac4%5]) with mapi id 15.20.2623.008; Thu, 9 Jan 2020
 21:51:11 +0000
From: Dan Zhang <zhdaniel@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: U-Boot upstream, patch and maintain model and plan for OpenBMC 
Thread-Topic: U-Boot upstream, patch and maintain model and plan for OpenBMC 
Thread-Index: AdXHNhf5EgApGSb3T+yH5WiidBR37Q==
Date: Thu, 9 Jan 2020 21:51:10 +0000
Message-ID: <MWHPR15MB154906E39EEC026958D2EB42A8390@MWHPR15MB1549.namprd15.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::1:1baa]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae5b387e-ed3e-4d96-d537-08d7954e0a6b
x-ms-traffictypediagnostic: MWHPR15MB1471:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR15MB14718EDA2A14CDF5F8C0B431A8390@MWHPR15MB1471.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 02778BF158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(396003)(346002)(366004)(39860400002)(199004)(189003)(76116006)(54906003)(66476007)(4743002)(66946007)(66556008)(478600001)(64756008)(66446008)(8676002)(71200400001)(86362001)(316002)(966005)(186003)(52536014)(9686003)(6916009)(4326008)(81166006)(81156014)(55016002)(7696005)(5660300002)(8936002)(2906002)(6506007)(33656002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1471;
 H:MWHPR15MB1549.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /ltorCdomjUOr/WTA5hFAKGTzGHq8uI3hpeviIWKXigEl9HiKLIobcp2XcXGJ1HpbKy5DkD+F1rdgTKIk5hQ0OGn98ff2xBpwob6BoMVwPcmv90LyNF/FSC/AGiycsx9Gu53JVnnPQ//TwtDXxXnGhgXQ+/j5qqOnV53ojr1AeCiQYBaanYmvT9U81hamBNsy/v25e87S7PDMw+d8h6MDoCcb/ZtSpMvcy9h7KKksa+L1eFg0vy0tDLK9LWw+LX2sTRY1f62pC29/YusIPcT4KvUenu6viLja8JCYdAMntKQUquEtBeRvvMj4hwUosJ55/Jn6AUGBYKkP2ZbsoJ4zUjrIafwmHhBJlo9lGYkg45QOqtR2sg837dYmWp1rA96GbzwuGEZiLu57O6VUjj64G/Ojtbs3ujc1IUnWVHfqvggYOhBXESWhSNPPKBStTt4rNU1WnXbK0fUrKJu/bUxfo63ixGYw3JX2uhVhJMS4rAjFqdudIwLhrqttuvqcOdxydBYoY8h0clNhL8OeVlTaQ==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ae5b387e-ed3e-4d96-d537-08d7954e0a6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2020 21:51:10.8982 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2TGoAF0dPLftIuRKeBq/qomWfoaSuh1RSo/HFUK55NUip/3SyrHczNcsDX+oFCbm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1471
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-09_05:2020-01-09,
 2020-01-09 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 bulkscore=0 clxscore=1011
 impostorscore=0 suspectscore=0 adultscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=580
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001090179
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
Cc: Andrew Jeffery <andrew@aj.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I am writing to see how can I align and contribute to the U-Boot developmen=
t for OpenBMC.=20

OpenBMC supported platforms ( IBM witherspoon: tacoma and rainier) are usin=
g new Aspeed SDK (https://github.com/AspeedTech-BMC/u-boot/tree/aspeed-dev-=
v2019.04).=20
In my new project, I am planning to use this SDK also.=20
I believe it will be benefit to align with and contribute to OpenBMC commun=
ity regarding upstream, patch and maintain this new SDK.

Thus, I have some open questions about OpenBMC communities' u-boot developi=
ng model and/or plan:
1. Will U-Boot also follow Kernel's developing model for OpenBMC?=20
Kernel developing model ( my understanding )
individual contributor actively aligned with OpenBMC about the kernel patch=
 upstreaming plan and status,=20
and OpenBMC kernel maintainers will pull-in and/or backports the accepted p=
atches to all supported kernel versions.
All supported kernel versions will be maintained on corresponding branches =
in https://github.com/openbmc/linux =A0OpenBMC fork.

2. Will, eventually, u-boot code of OpenBMC be maintained in https://github=
.com/openbmc/u-boot OpenBMC fork? or kept in BSP/SDK vendor's u-boot fork?

BRs
Dan Zhang
