Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E523E64F23
	for <lists+openbmc@lfdr.de>; Thu, 11 Jul 2019 01:14:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kZlT3hbszDqRL
	for <lists+openbmc@lfdr.de>; Thu, 11 Jul 2019 09:14:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=amperecomputing.com
 (client-ip=2a01:111:f400:fe49::715;
 helo=nam03-dm3-obe.outbound.protection.outlook.com;
 envelope-from=singham@amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=amperecomputing.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amperecomputing.com header.i=@amperecomputing.com
 header.b="ofzUPFCM"; dkim-atps=neutral
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on0715.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::715])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kS3Z6Z3pzDqgF
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jul 2019 04:13:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amperecomputing.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6l7nIwYg7Tw91qc3HvKPBCE6w9pnV0v/9vPfT77whMg=;
 b=ofzUPFCMZJ4zurffQig3OYyT7KUUB22QERoru+L5PtxbkpewXUzhgnVEg2zepiiUlGcu+d4OWSXiPxZqo3XSI2qEW1d1SgUT1OH1hWhudl8D2Pz/B0eyAdOMTcN7bfMp1mPk/l3TL2XbQSY1Ar30wof5Fj7W1Vvfslqf7w0Jrlc=
Received: from BN8PR01MB5362.prod.exchangelabs.com (20.179.78.24) by
 BN8PR01MB5443.prod.exchangelabs.com (20.179.79.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Wed, 10 Jul 2019 18:13:04 +0000
Received: from BN8PR01MB5362.prod.exchangelabs.com
 ([fe80::383d:c3c1:3ad4:cf04]) by BN8PR01MB5362.prod.exchangelabs.com
 ([fe80::383d:c3c1:3ad4:cf04%5]) with mapi id 15.20.2052.020; Wed, 10 Jul 2019
 18:13:04 +0000
From: Scott Ingham <singham@amperecomputing.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Adding to CLA
Thread-Topic: Adding to CLA
Thread-Index: AQHVN0set+FiznT1WkKvbDi98zmsxA==
Date: Wed, 10 Jul 2019 18:13:04 +0000
Message-ID: <663E1F51-B36B-4E0C-820E-8F57A9C16C30@amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=singham@amperecomputing.com; 
x-originating-ip: [108.169.132.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb77fd38-4196-45c7-39c9-08d705624093
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN8PR01MB5443; 
x-ms-traffictypediagnostic: BN8PR01MB5443:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BN8PR01MB54439E7764F2F70D2E94990DBCF00@BN8PR01MB5443.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(396003)(346002)(39840400004)(376002)(366004)(189003)(199004)(256004)(2616005)(53936002)(8936002)(66066001)(486006)(99286004)(6116002)(476003)(25786009)(68736007)(316002)(2906002)(3846002)(33656002)(9326002)(5640700003)(6436002)(6306002)(6512007)(54896002)(478600001)(1730700003)(102836004)(86362001)(558084003)(5660300002)(7116003)(186003)(14454004)(36756003)(6916009)(3480700005)(71200400001)(71190400001)(8676002)(91956017)(2501003)(7736002)(2351001)(76116006)(66556008)(66446008)(6506007)(64756008)(66476007)(66946007)(26005)(81156014)(81166006)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BN8PR01MB5443;
 H:BN8PR01MB5362.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amperecomputing.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RGU4+YUN5nt9IqK+KawAGlHcPoXqMNslaVVuzt6cuK4qsho20UucP9JfdGURvTrp0CK+b2hhlUeQQiO8DxrQkKYrnyKezGeNqqMESsjLlgRoDxsaz02dx6LzfdeMEQwa+nukbYMh4TBrfq65d8aHqOtSWFKvZuyBGPojuDxFyozFC/vP+FuNGM/lPKZ+t+CFDkQjoOQiPoQ41fljZwyJhHaOL1taP8lx2LDDpZZNOZW4dpf70IELJLOe3nZGfu7koH9sufl0Zl+PMHIJ4YOMbVN/i3Bb/WzwL+m1uLmk+/5vcGErDOyvRlwvLSq+MzdRaspcXQ7X94tTmovI/I1N3aYWYQpvmnrh3UDChwI/PrcjnAeeUrUsomK5ORCTLu5HFfjvIpfx/7DaCoftK15lo4pKJk6PxNwpDSpBja2h/l0=
Content-Type: multipart/alternative;
 boundary="_000_663E1F51B36B4E0C820E8F57A9C16C30amperecomputingcom_"
MIME-Version: 1.0
X-OriginatorOrg: amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb77fd38-4196-45c7-39c9-08d705624093
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2019 18:13:04.3179 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: singham@amperecomputing.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR01MB5443
X-Mailman-Approved-At: Thu, 11 Jul 2019 09:08:05 +1000
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

--_000_663E1F51B36B4E0C820E8F57A9C16C30amperecomputingcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNCkhvdyBkbyBJIGdvIGFib3V0IGdldHRpbmcgZm9sa3MgYWRkZWQgdG8gb3VyIE9wZW5C
TUMgQ0xBPyBJIHNlZSB0aGUgZXhpc3RpbmcgYWdyZWVtZW50IGJ1dCBJIGRvbuKAmXQga25vdyBo
b3cgdG8gYWRkIG5ldyBwZW9wbGUsDQoNClRoYW5rcywNClNjb3R0IEluZ2hhbQ0KQW1wZXJlIENv
bXB1dGluZw0KDQo=

--_000_663E1F51B36B4E0C820E8F57A9C16C30amperecomputingcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <F9838C67C0FB31488407E8229AABFD02@prod.exchangelabs.com>
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
Ij48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQi
PkhvdyBkbyBJIGdvIGFib3V0IGdldHRpbmcgZm9sa3MgYWRkZWQgdG8gb3VyIE9wZW5CTUMgQ0xB
PyBJIHNlZSB0aGUgZXhpc3RpbmcgYWdyZWVtZW50IGJ1dCBJIGRvbuKAmXQga25vdyBob3cgdG8g
YWRkIG5ldyBwZW9wbGUsPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFu
PjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0
Ij5UaGFua3MsPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPlNjb3R0IEluZ2hhbTxvOnA+PC9vOnA+PC9zcGFu
PjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0
Ij5BbXBlcmUgQ29tcHV0aW5nPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_663E1F51B36B4E0C820E8F57A9C16C30amperecomputingcom_--
