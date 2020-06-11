Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 779ED1F6427
	for <lists+openbmc@lfdr.de>; Thu, 11 Jun 2020 11:00:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jHqy6zK2zDqqD
	for <lists+openbmc@lfdr.de>; Thu, 11 Jun 2020 19:00:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex.com (client-ip=185.132.180.100;
 helo=mx07-002d6701.pphosted.com; envelope-from=solon.fan@flex.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=flex.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256
 header.s=dkim header.b=DsYqmj1c; dkim-atps=neutral
Received: from mx07-002d6701.pphosted.com (mx07-002d6701.pphosted.com
 [185.132.180.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jHpl3d3VzDqjW
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jun 2020 18:59:08 +1000 (AEST)
Received: from pps.filterd (m0132503.ppops.net [127.0.0.1])
 by mx07-002d6701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05B8x43x021559; Thu, 11 Jun 2020 08:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flex.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to :
 content-transfer-encoding : mime-version : content-type; s=dkim;
 bh=uuvXHGGGWwlFvOI6n0dvrBS7eP5HMWHQ3GoTdksPkU0=;
 b=DsYqmj1cAGdHnZLrBAvyWyLMBqod2lU2qabUhCFBPbHm//AhNhO+HVeek/Nz36Hhpw5b
 D7EpDt6+RBi8V/vi68O16F1yXHBIT1zBalcSpxzakJq7tFJ1EMquElFt4BkqsQqp13mM
 l/Mra1eg/Sb5rQD4S/ioRsrHGrSLNPyVYRo4ulR1hQbs9JVdKNbCEerd6YP1N+/KccV0
 fUudE4X+JtvPJ3DWjmEMpHW0//V6jjmytwbtQVcYrlnKXYOc1id7Y1Kq3poMckPVFJH9
 W5W7Qis+ALYZ+ESGd5/42LDOCEFpFtknEK3iCNCMIlGQ+H1xDIOk8oFqmmfaXDJkji4t XQ== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
 by mx07-002d6701.pphosted.com with ESMTP id 31je008rmm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Jun 2020 08:59:04 +0000
Received: from DM5PR20CA0019.namprd20.prod.outlook.com (2603:10b6:3:93::29) by
 BN7PR08MB4899.namprd08.prod.outlook.com (2603:10b6:408:30::32) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.18; Thu, 11 Jun 2020 08:59:02 +0000
Received: from DM3NAM03FT050.eop-NAM03.prod.protection.outlook.com
 (2603:10b6:3:93:cafe::2c) by DM5PR20CA0019.outlook.office365.com
 (2603:10b6:3:93::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend
 Transport; Thu, 11 Jun 2020 08:59:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 18.237.140.178)
 smtp.mailfrom=flex.com; jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=pass action=none header.from=flex.com;
Received-SPF: Pass (protection.outlook.com: domain of flex.com designates
 18.237.140.178 as permitted sender) receiver=protection.outlook.com;
 client-ip=18.237.140.178; helo=mail.ds.dlp.protect.symantec.com;
Received: from mail.ds.dlp.protect.symantec.com (18.237.140.178) by
 DM3NAM03FT050.mail.protection.outlook.com (10.152.82.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18 via Frontend Transport; Thu, 11 Jun 2020 08:59:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTRd0oUlst2u7xHqWt/bAyTODAZwxjR3wA94lfNBWEL25Lr83dNqXZi0SUoqgtr/W312CFU6PhxX71Rpc8nhmY97IJOQbvQb2/e9E5iAJc9Myhz65NfMiPaWc9kzurko/zzrDr2OzSZWLPW562/sG4OMto5YDAwXZsfY3Fqx++Jn7JMipiVJkGSHjO8XeXZtTLuL7NAYL8+YT+T2PKcNjhPQJanoenN6WY+CCnqaTtbNwXMK5k8VLzm63esRozhfEzmzelDPGi77A9/KY2ywJLIeQ2yytbx7K4A06B8as1OSCgrSSKDMcOpt6Gr9b1kpgVD12SQ5YfoDUuy2YQWIQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xcU3TitGNC3FbwL6TRZZR8c6ZBxbUoUGMjnK1GiyXmk=;
 b=Vt4hh2YLMHiLE0r8kfLF4c3ICeQ5Dr/faWyL2wm01/XFR7aqBw/a4Dbw6l2iaShdmj28Iaj9gsg2I231lxiXxQte3RN2hOqyksmjS+oL9MFKJxpyjM3gcdUb8OJ+GOc4kECm8y1KLBoydGGlmc4KUsmhBIYQNc02ANiAMF2C9v55OpO+mI2LIeicCSRRSnFHXHHI6vcYhVlHSinBAS7jb7G+7SbGcDVRqLvv9c+Ggt/TcKd3bZfE7kehd+olsIhNz2meGDWKYHNGXSrfkyzjkQpVgL3+Sjh6IboEquJFkFeyMqj8+LEJXosDTlS+81vwN1tMLO/zvWZH6vZ5tMnlSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flex.com; dmarc=pass action=none header.from=flex.com;
 dkim=pass header.d=flex.com; arc=none
Received: from BN6PR08MB2563.namprd08.prod.outlook.com (2603:10b6:404:bd::21)
 by BN7PR08MB3907.namprd08.prod.outlook.com (2603:10b6:406:8e::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Thu, 11 Jun
 2020 08:58:59 +0000
Received: from BN6PR08MB2563.namprd08.prod.outlook.com
 ([fe80::9910:d4be:2edc:7889]) by BN6PR08MB2563.namprd08.prod.outlook.com
 ([fe80::9910:d4be:2edc:7889%11]) with mapi id 15.20.3088.018; Thu, 11 Jun
 2020 08:58:59 +0000
From: Solon Fan <Solon.Fan@flex.com>
To: Joel Stanley <joel@jms.id.au>
Subject: RE: [OPENBMC] Bitbake error:Nothing
 RPROVIDES'virtual=p9-vcs-workaround'
Thread-Topic: [OPENBMC] Bitbake error:Nothing
 RPROVIDES'virtual=p9-vcs-workaround'
Thread-Index: AdY+2T7dsb56v3InSBGCK2enJax5cQAuYC7QAAFnUwAAC0ZqUAAAXdIAAAGhTNA=
Date: Thu, 11 Jun 2020 08:58:59 +0000
Message-ID: <BN6PR08MB2563628CBB61D4667C4D099194800@BN6PR08MB2563.namprd08.prod.outlook.com>
References: <BN6PR08MB25631071D6E7B9C868D4417194830@BN6PR08MB2563.namprd08.prod.outlook.com>
 <BN6PR08MB25631A343FBF33C46F74324B94800@BN6PR08MB2563.namprd08.prod.outlook.com>
 <CACPK8XfkyfOCHQ-gqrSJXn5LUP9x6F0WAFT-gsBsLejVY=XbEQ@mail.gmail.com>
 <BN6PR08MB2563011EFD8DE16180A9637994800@BN6PR08MB2563.namprd08.prod.outlook.com>
 <CACPK8XeE=wMEaETV-SENztgLbMdWPDkR9=p3Y65r+yvRdMhvRw@mail.gmail.com>
In-Reply-To: <CACPK8XeE=wMEaETV-SENztgLbMdWPDkR9=p3Y65r+yvRdMhvRw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=flex.com;
x-originating-ip: [158.116.214.207]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1c96e1b5-c399-48b1-3aba-08d80de5afe4
x-ms-traffictypediagnostic: BN7PR08MB3907:|BN7PR08MB4899:
X-Microsoft-Antispam-PRVS: <BN7PR08MB4899AC92EC60059A40FED5F494800@BN7PR08MB4899.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
x-forefront-prvs: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 8b4Q5bbmGaJ/Nf0RR/LKulZX2nvGet+DXcfCfg0DP4Sb+OJOa+2eyXWo+D0yoq0dDw2bPbaVCcdV+IQrx5T2FPq1UsZ4fsg01wlDAmwOKXU5qKlovOcXqqa7736MKHCPHBG4qQfFKAaF/vKi7xBE+QOKXt2jdquwtNyD0y22oc7JD+J4dtfuxNmoNR/nlPbFddabYia1BSRj70J7R1cvUaohzTmVcX1rvFCGHHd2TrCqkgTmkxHFG4uFaGdk3rWtjo5P3723E0H/vr4V0qkSyT+VejIGyujKo9NBQ11Ub5caKYBlmmlHXy0Si9DamN9yGs3orKMpxz2YZBnfh693tfEI4+L4HgvO2pZ4a+Ir4/I6Zn5m0/H8d0YfsUYFhpitUgle8T00OjqsFGqBJVx6l7swyf24uEKqDgDVJlRGFwSbr02SDheuwTNUrKrVB89EKJ3QE1HEE97w4rCCv49ZQQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:BN6PR08MB2563.namprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(366004)(346002)(376002)(39860400002)(396003)(136003)(6916009)(8936002)(4326008)(966005)(8676002)(478600001)(9686003)(55016002)(316002)(76116006)(52536014)(66946007)(64756008)(66476007)(83380400001)(66556008)(66446008)(2906002)(86362001)(53546011)(33656002)(71200400001)(186003)(6506007)(26005)(7696005)(5660300002)(151773002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: HiY71xpHP2N9d2wuVByZCIKAumwlMVzkP9WF/6rB2KFIS2wOyzM/HsQFNWKrBCrKUsskacBMYU2qWH6ymRrPZivpWcJ84I3XdPd/mxd8GSn+dYU8/xoVi6VP9m4xNJf11c9u4qbOdwvYsRJ/bfp0GDZ4mZftKASbdA6Hdy+4pCFkaz9o9qsm5/toYkASBr354RqVyW7IEC5TFoENxWg3v6pz/y+k2lk69yaVtyKrw+sLnT/tgsvP8nGmxcGM/ZXYaTw53Q/9Bu32nPZEH6eVwrAQ14ks7oqCLi0s1DmOD7d/0/H7sLrd0H5UicMqIjIQdKM1AGPh7mW4nlUbGrJmBz75Efev8mmabinSt977jr/wP7WIF/sca2zcKakPVsVItDAGG0/fyefFYJMj8jOW5ogusP66QiV2tH6zskfSt3/3waxUBY5bINnzIjHJdY9h3euR7+5LxR4nYChjUokEaeZ+aI9Z8T+WQ0ttGUc5blEBBWDyLa1BNTqZ/8OlvBBg
x-ms-exchange-transport-forked: True
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR08MB3907
X-CFilter-Loop: Reflected
X-DetectorID-Processed: db4f4c5a-5dd2-4f21-956c-7ab15d947193
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DM3NAM03FT050.eop-NAM03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:18.237.140.178; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.ds.dlp.protect.symantec.com;
 PTR:p01c.mail.dlp.protect.symantec.com; CAT:NONE; SFTY:;
 SFS:(39860400002)(376002)(136003)(396003)(346002)(46966005)(316002)(70586007)(86362001)(6916009)(82740400003)(52536014)(9686003)(70206006)(55016002)(478600001)(82310400002)(5660300002)(47076004)(356005)(966005)(33656002)(36906005)(83380400001)(7636003)(186003)(53546011)(8676002)(336012)(4326008)(2906002)(8936002)(7696005)(6506007)(26005)(151773002);
 DIR:OUT; SFP:1102; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: ad75c6cf-6890-4dd9-7bc5-08d80de5ae67
X-Forefront-PRVS: 0431F981D8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gbRQOMD5VTgC7maHdaXNa7/bWhn6ajS3AedchBW/G6iHr2hnz2eNiGc2sFBjfNLEzZn61dSw5Gk1zrYDz5IgG9zcC0nTWJwqWmm+//E5Oq0IEtNlYf0hQ8cxr+YAXfG4LJDg3TbgAfsSKhBQeQBR7UMlneFKlRrtDXQrg6DRTveTVyjEnTL7ldJYDf73qFxxX8j20l2R6j7JRA+4WYl1wvFgLBznaww2f4JHWzfRlq83eRvvcuS4QBBm0zRHA2oo0bQUlJfFSDaetiUJoTX4C9cThIEduWXJNvxDByz79ltbYgHUa4VEO/FKkEuuHlmdEpuy7MIss684yghMYz5vbB/GssOAKW43q3IEmy1c1uN9sZUHSpBWABYf7QAuteRqYU/uCZVjLbC8jcuhu1BJqh5k927ASwNf8h6ff4IO9nnUNp8vmo8og9j3Pl5QwSebk4VKsdVsBsdAUFC1OQwFwuppunX9AFPSC4J6qITHNcbxxeOqAHK8wq8Qo/LoEvTf
X-OriginatorOrg: flex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 08:59:01.8069 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c96e1b5-c399-48b1-3aba-08d80de5afe4
X-MS-Exchange-CrossTenant-Id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3f0e69e0-eb38-4eb2-b4ee-52919719d31e; Ip=[18.237.140.178];
 Helo=[mail.ds.dlp.protect.symantec.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR08MB4899
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-11_07:2020-06-10,
 2020-06-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 bulkscore=0 clxscore=1015 mlxlogscore=953 malwarescore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 cotscore=-2147483648
 adultscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006110070
Content-Type: text/plain; charset="utf-8"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGksSm9lbCENCg0KSSBzYXcgdGhpcy5Zb3UgYXJlIHJpZ2h0IQ0KDQpBcHByZWNpYXRlIGZvciB5
b3VyIGluZm8uIEkgd2lsbCB1cGRhdGUgbXkgc291cmNlIHRvIHRoZSBsYXRlc3QgbGF0ZXIuDQoN
Cmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL29wZW5ibWMvY29tbWl0LzM4OWE3MDQ2ZGZmZDcw
ZWY5Y2UxYTViMGE3ZjViZTMzNzFjNjQ2YTINCg0KS2luZCBSZWdhcmRzDQoNClNvbG9uIEZhbg0K
Q0NTIERlc2lnbiBCTUMNCg0KNEYsIEJsZGcuIDEwLCBOby4gMzAwMCBMb25nZG9uZyBBdmUuLA0K
UHVkb25nIE5ldyBEaXN0cmljdCwgU2hhbmdoYWkgMjAxMjAzLCBDaGluYQ0KZGlyZWN0OiArODYg
MDIxIDIwODIxNjAwIEV4dCAxNDAyDQptb2JpbGU6ICs4NiAxODYwNjIyMDg4NQ0KDQrCoMKgwqAg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpG
cm9tOiBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1PiANClNlbnQ6IDIwMjDlubQ25pyIMTHm
l6UgMTY6MDQNClRvOiBTb2xvbiBGYW4gPFNvbG9uLkZhbkBmbGV4LmNvbT4NCkNjOiBvcGVuYm1j
QGxpc3RzLm96bGFicy5vcmcNClN1YmplY3Q6IFJlOiBbT1BFTkJNQ10gQml0YmFrZSBlcnJvcjpO
b3RoaW5nIFJQUk9WSURFUyd2aXJ0dWFsPXA5LXZjcy13b3JrYXJvdW5kJw0KDQpPbiBUaHUsIDEx
IEp1biAyMDIwIGF0IDA3OjU5LCBTb2xvbiBGYW4gPFNvbG9uLkZhbkBmbGV4LmNvbT4gd3JvdGU6
DQoNCj4gSSBtb2RpZmllZCBiZWxvdyBmaWxlLCB0aGUgYnVpbGQgZXJyb3Igbm90IG9jY3VycyBh
Z2Fpbi4tW0VSUk9SOiBOb3RoaW5nIFJQUk9WSURFUyAndmlydHVhbC1wOS12Y3Mtd29ya2Fyb3Vu
ZCddLGZvciB5b3VyIHJlZmVyZW5jZS4NCj4NCj4gfi9tZXRhLXJvbXVsdXMtcHJpbWUvcmVjaXBl
cy1waG9zcGhvci9ob3N0L3A5LWhvc3Qtc3RhcnQuYmJhcHBlbmQNCj4NCj4gQ2hhbmdlDQo+IFJE
RVBFTkRTXyR7UE59cmVtb3ZlX3JvbXVsdXMgPSAicDktdmNzLXdvcmthcm91bmQiDQo+IHRvDQo+
IFJERVBFTkRTJHtQTn1yZW1vdmVfcm9tdWx1cy1wcmltZSA9ICJwOS12Y3Mtd29ya2Fyb3VuZCIN
Cg0KWW91IHNob3VsZG4ndCBuZWVkIHRoaXMgY29kZSBhdCBhbGwsIGFzIHRoZSB2Y3Mgd29ya2Fy
b3VuZCB3YXMgcmVtb3ZlZCBmcm9tIHRoZSB0cmVlLiBJZiB5b3UgcmViYXNlIHlvdXIgY2hhbmdl
cyBvbiB0aGUgbGF0ZXN0IG1hc3RlciB5b3Ugc2hvdWxkIG5vdGljZSB0aGUgZXJyb3IgZ29lcyBh
d2F5Lg0KDQpSZWdhcmRsZXNzLCBJJ20gZ2xhZCB5b3UgZ290IGl0IHdvcmtpbmcuDQoNCkNoZWVy
cywNCg0KSm9lbA0KCkxlZ2FsIERpc2NsYWltZXIgOgpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVk
IGluIHRoaXMgbWVzc2FnZSBtYXkgYmUgcHJpdmlsZWdlZCBhbmQgY29uZmlkZW50aWFsLiAKSXQg
aXMgaW50ZW5kZWQgdG8gYmUgcmVhZCBvbmx5IGJ5IHRoZSBpbmRpdmlkdWFsIG9yIGVudGl0eSB0
byB3aG9tIGl0IGlzIGFkZHJlc3NlZCAKb3IgYnkgdGhlaXIgZGVzaWduZWUuIElmIHRoZSByZWFk
ZXIgb2YgdGhpcyBtZXNzYWdlIGlzIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCAKeW91IGFy
ZSBvbiBub3RpY2UgdGhhdCBhbnkgZGlzdHJpYnV0aW9uIG9mIHRoaXMgbWVzc2FnZSwgaW4gYW55
IGZvcm0sIAppcyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlz
IG1lc3NhZ2UgaW4gZXJyb3IsIApwbGVhc2UgaW1tZWRpYXRlbHkgbm90aWZ5IHRoZSBzZW5kZXIg
YW5kIGRlbGV0ZSBvciBkZXN0cm95IGFueSBjb3B5IG9mIHRoaXMgbWVzc2FnZSEK
