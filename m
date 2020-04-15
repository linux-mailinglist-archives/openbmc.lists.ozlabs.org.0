Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 288F71AA013
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 14:29:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492M9W1fVszDr0X
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 22:29:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=1374acb622=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=FkwtAj4c; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=hrldleiw; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492LhW17cpzDqwC
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 22:07:37 +1000 (AEST)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03FC5MQQ015866; Wed, 15 Apr 2020 05:07:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : mime-version; s=facebook;
 bh=ov7AWh0wwdewdujF1D0yaqdM+4FUH2ZzwThJOAQXrnY=;
 b=FkwtAj4cg/i73aOm3LMa/AsFFWYQ5aha3TOS+mDn2y5qnqkMzJ30aHj8PH7EX2ggrawl
 lqQzLfEQ9dwGo5nuLZxbtNDeDlWRclskUG+MMJJcuTv6yQ+bhQsDNdvHnelyiRcpCXk6
 gUqYXOxi7hP5A1pV2oIvm6YKdfukC7UpF+I= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 30dn8355bc-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 15 Apr 2020 05:07:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.101) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Wed, 15 Apr 2020 05:07:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M7rJMXpqJEV/qoEY08pp+OTxxE0tLDjI+2C3LHZPjXdWg49ots6lcZT/fZjUicfSCdvAtAnvtPHULZCTSt5zSbhOdHpAPiA9jDeCGj18tLYmRX6BoazSKuJ5qLcNNUVEtxtaK1edV9wcPeRT0duOIBlhEcE7FEvULUe7fRK7AfcDcy4eWV8qEG/2ckZLDqMGTJc3prdYC1lTEyN7C66dZp+gpanyvh69Rs8Gs85KADpmKnoFvpW7DeGApyQ8Es8gBbOfZHdUeE6UXKipeVzaAYPef+IiXoMT0rx5R6eH8NPjm6ADjA0X7jlckV6qtCJyq7BV4jEbPSJJ1aPjUyPqGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ov7AWh0wwdewdujF1D0yaqdM+4FUH2ZzwThJOAQXrnY=;
 b=Dd4VSIeNDaT1R7IXEX7hH6w1o+7oqHFP6fBLMQiFYCk1vL7/qRj4QR3NSv8PxzRU5PpvUN5BZjTIdA+FGvp9oPNpaP7bfCTVnJqHTF/ImyaG37se6O1KXERrIk5LFLYTZl48cFpYToI48g7tZ6RXPlw/UZjBx6/cru9Vz5xdLxyxv0fbWOl2qd/XhFLQ/uWEKSZ/LTFISDjMXV+J+3IlUkrOM+bXTDJvlB6QNj0Il8qzJ9gfbgzkiwMalQy1hQwB3wN9BkgRJyuDo9QtuXKnMT5P/nBkyJi1XwcxG0thlHVMmixuQCDuhz7uKJhJQu69OYbS6S9xx/GBtJv89bU0JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ov7AWh0wwdewdujF1D0yaqdM+4FUH2ZzwThJOAQXrnY=;
 b=hrldleiwfkcZtPXO/pez+dlUpqj0BW7oBXGzHrbYrasQ6dUas96wDvnxkVjA60DhBmCKd+wlS4gmcPJW/whH7YkfoXxYLeLeOn+r292sCVmhBLbh0bwBfz/iqgPHgimNThoKdOWu72Fayf9e4olu7MTkSq7YM60xS99XYmp1R6A=
Received: from MW3PR15MB3947.namprd15.prod.outlook.com (2603:10b6:303:49::9)
 by MW3PR15MB4025.namprd15.prod.outlook.com (2603:10b6:303:46::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.26; Wed, 15 Apr
 2020 12:07:22 +0000
Received: from MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::950:594c:b2fc:be8]) by MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::950:594c:b2fc:be8%4]) with mapi id 15.20.2921.024; Wed, 15 Apr 2020
 12:07:22 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "james.feist@linux.intel.com" <james.feist@linux.intel.com>
Subject: nvme sensors
Thread-Topic: nvme sensors
Thread-Index: AQHWEx5rEqsJqc4WEEC8M3OzxbfV7w==
Date: Wed, 15 Apr 2020 12:07:22 +0000
Message-ID: <0F332F74-FF51-4239-8B52-2EBA770AE6CC@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:6ff6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0be3939e-6b2a-4f6e-4681-08d7e1358dd5
x-ms-traffictypediagnostic: MW3PR15MB4025:
x-microsoft-antispam-prvs: <MW3PR15MB4025C06C86ED3BACE115F320DDDB0@MW3PR15MB4025.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0374433C81
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR15MB3947.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(39860400002)(346002)(396003)(136003)(366004)(376002)(8676002)(2906002)(8936002)(316002)(6916009)(66556008)(6512007)(66476007)(4326008)(6506007)(64756008)(33656002)(81156014)(9326002)(6486002)(86362001)(71200400001)(36756003)(66446008)(558084003)(478600001)(2616005)(66946007)(76116006)(3480700007)(186003)(5660300002)(7116003);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WpNTkn7btjJTzfc33TDq6lq93aFRQDgSfdFWxRyCZL0XLDyBUBPygwmePDdOp6dDwGzN/swD65BEQoZ7XxPN51Q0JdDHWb85cTOqsYaNKWrnOFV+rePK+jtYquhwdBMu6T9L3qEe4lHJ3nlV+09LZ3xJF8o28/OOYD7Yz6SljmMI7v5UMoTiGbp6yjJgb5pfXd2aBi6DtA8LOhKL1wCSyt0TUIpQhrid+mRMp2+Hx0j0AQG4u2cO7+RRPmp8udj8BlHjxF3oqhJvU+61846It1AokpSKe3R1hnhdTTnFtOEVf7nD4E0IAZ9yL0asNoHFmiSS155fIrGEKU1eRV+H7csCzcML/fbfnPZMBdbscz7cS8ME1io+IL4HGsZGkVypcQM25LMR+73kQEGVqtqLK1wIk72Jfg5evr/XtLwEYG8ex8BgDX/kIHUmeDEafOt8
x-ms-exchange-antispam-messagedata: 9QLdY+zgJdFvjFQPtvvNm3DeP+YhLPv4KP+PMaDnhOre4KkasXy1ir4xM7dtucfXmPoamx26GkoGNXpn3pHMhHQcw9Rj8L/yjDQl8lBMqe+ILU7PPsyAqsJONpO8nTU1fcJQAnwuRupoiMu34zg/W6OR03bWrss6tlfGw3dkXV0EeKIyoNNOJ7h26s8KyW5B
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_0F332F74FF5142398B522EBA770AE6CCfbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be3939e-6b2a-4f6e-4681-08d7e1358dd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2020 12:07:22.3423 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZUKyW+AW08BOou2oB0SIecXiZeUQk+aekwLIzlfnSJ9Vz/5CtfRXEDN14LiGlZ18y10UyG7kumNg5iLiEvlkqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB4025
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-15_03:2020-04-14,
 2020-04-15 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 mlxlogscore=589
 mlxscore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004150092
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_0F332F74FF5142398B522EBA770AE6CCfbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgSmFtZXMsDQpEbyB3ZSBoYXZlIHN1cHBvcnQgZm9yIE5WTUUgc2Vuc29ycyBpbiBkYnVzIHNl
bnNvcnM/IEkgc2VlIHBob3NwaG9yLW52bWUgcmVwbyB3aGljaCBuZWVkcyBjb25maWd1cmF0aW9u
IGZyb20geWFtbCBmaWxlLCBpcyBpdCBwb3NzaWJsZSB0byBpbnRlZ3JhdGUgdGhpcyB3aXRoIGVu
dGl0eSBtYW5hZ2VyPw0KDQpSZWdhcmRzDQotVmlqYXkNCg==

--_000_0F332F74FF5142398B522EBA770AE6CCfbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <32EF0BFF334B68408B8A462D622C2E91@namprd15.prod.outlook.com>
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
IixzYW5zLXNlcmlmO30NCnNwYW4uRW1haWxTdHlsZTE3DQoJe21zby1zdHlsZS10eXBlOnBlcnNv
bmFsLWNvbXBvc2U7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7DQoJY29sb3I6
d2luZG93dGV4dDt9DQouTXNvQ2hwRGVmYXVsdA0KCXttc28tc3R5bGUtdHlwZTpleHBvcnQtb25s
eTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQpAcGFnZSBXb3JkU2VjdGlv
bjENCgl7c2l6ZTo4LjVpbiAxMS4waW47DQoJbWFyZ2luOjEuMGluIDEuMGluIDEuMGluIDEuMGlu
O30NCmRpdi5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT4N
CjwvaGVhZD4NCjxib2R5IGxhbmc9IkVOLVVTIiBsaW5rPSIjMDU2M0MxIiB2bGluaz0iIzk1NEY3
MiI+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkhpIEphbWVzLDxvOnA+PC9vOnA+PC9zcGFuPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5E
byB3ZSBoYXZlIHN1cHBvcnQgZm9yIE5WTUUgc2Vuc29ycyBpbiBkYnVzIHNlbnNvcnM/IEkgc2Vl
IHBob3NwaG9yLW52bWUgcmVwbyB3aGljaCBuZWVkcyBjb25maWd1cmF0aW9uIGZyb20geWFtbCBm
aWxlLCBpcyBpdCBwb3NzaWJsZSB0byBpbnRlZ3JhdGUgdGhpcyB3aXRoIGVudGl0eSBtYW5hZ2Vy
PzxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxl
PSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+UmVnYXJkczxvOnA+
PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250
LXNpemU6MTEuMHB0Ij4tVmlqYXk8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjwvYm9k
eT4NCjwvaHRtbD4NCg==

--_000_0F332F74FF5142398B522EBA770AE6CCfbcom_--
