Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A31F2102D41
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2019 21:09:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HcNv4n62zDqd3
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 07:09:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=62266bf8b7=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="aYLeFMxM"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="UJs5/+2P"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HcN90MqXzDqcq
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 07:08:49 +1100 (AEDT)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.42/8.16.0.42) with SMTP id xAJK87XY002616;
 Tue, 19 Nov 2019 12:08:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : mime-version; s=facebook;
 bh=vAxN6kr3OmyR5QjyD0E9BFAoGxWjJZ1d+2WxwGWhU48=;
 b=aYLeFMxMBv8kmWLDJlLCz3TH8iy2KGphkURFZdqddK9aSlbAXsvbgsUfvAShKwMqL42l
 UZ+4PDzmUgM+caKeSAlWuYLX1bNNupoZ2M6ps9PThQpa5w2aHYOFUoFzVJsV7Vdi4iK4
 X403F5lWJDOm/qacdyXZQ8YyDSssZLHKd+M= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0001303.ppops.net with ESMTP id 2wchf71w2q-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 19 Nov 2019 12:08:42 -0800
Received: from ash-exhub103.TheFacebook.com (2620:10d:c0a8:82::c) by
 ash-exhub103.TheFacebook.com (2620:10d:c0a8:82::c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 19 Nov 2019 12:08:29 -0800
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.174) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 19 Nov 2019 12:08:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JhGnDpcu2o7SDLVvUgRR/ETH1xPY7IeOYVJr3VfyP1FSR0mYsaShS2x4fumGjafBd6UrdpdE7JaEc1ATPnS3MTUFTuAU/ezbcmQhR5Kaetih9nVVri1rvbqwJahzDMJzZCCPmL0g/hCsSQJAICZaLBw6FQS9zs3AA2ZHAdEUWSh/Z8bHC0OqEm93jisGObXaikbotJDorU6OeNXSQp9u3mAopESqXkmgu0CV+DSxMjwMgaETVerbX0uW/VC882UXniGMmcPkj4f/hu9qjCTYrhgvjY9O7/bc2bEvkKKsHO5nTvIF5G4WL1PJLc5AmzssWhlxJsYNrwBaoWmSKOggXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vAxN6kr3OmyR5QjyD0E9BFAoGxWjJZ1d+2WxwGWhU48=;
 b=GH3TuG0GRvNbQlW/QrUhPe8zNSumpWUsh+6LKMc00ptyTJfXvGS2rK1fQZ4tZvMB9cPHvKCeuw8rKbD0NSUBHUe/R/LbYV8Av2CQyry6gMsU6HqC+Iot+wwPXWjjzy1mZoNkmVByDYYvLF6tJPPpwluJHFuSXWrQIt8AtD0R0pdMHM/ZrcHhJaCk7W/q3hYKply7Zr0B2cvdTA0/r3HAHYsw0st38108SC+y7bOffGw76J4ITmrlNXFs/xChwc16ppwqn902ad5a2A2BzpbsaDIypgzPmnrqNmfguQaPhaGi44shG/HvFjqH3bgEEKnu1X+H0YEqEoX435gf7mrS1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vAxN6kr3OmyR5QjyD0E9BFAoGxWjJZ1d+2WxwGWhU48=;
 b=UJs5/+2Pp8kMnaN1YrT1Z3zuIi1HzMx6aP1/geYnU/UFcTeWti8LZBroO8lK+DXvQJkVeer/7JUDj1rxQuHAxafxsk5a4u4ihPlnvNiCD33FTD9XX9Ob+KWT6+vk7+2Y6QOooO9sRycZRaW07tlEO9yLQBrIk9J8rA9osB9ASMw=
Received: from MN2PR15MB3648.namprd15.prod.outlook.com (52.132.175.75) by
 MN2PR15MB3566.namprd15.prod.outlook.com (52.132.175.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Tue, 19 Nov 2019 20:08:28 +0000
Received: from MN2PR15MB3648.namprd15.prod.outlook.com
 ([fe80::41d3:4588:e4a4:3882]) by MN2PR15MB3648.namprd15.prod.outlook.com
 ([fe80::41d3:4588:e4a4:3882%6]) with mapi id 15.20.2451.031; Tue, 19 Nov 2019
 20:08:28 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: James Feist <james.feist@linux.intel.com>, "jason.m.bills@linux.intel.com"
 <jason.m.bills@linux.intel.com>
Subject: phosphor watchdog for intel platform
Thread-Topic: phosphor watchdog for intel platform
Thread-Index: AQHVnxUb/23TiP8U1U6PsH5UMbH54Q==
Date: Tue, 19 Nov 2019 20:08:28 +0000
Message-ID: <2432F395-A8D9-4026-8E74-E14B00799DAA@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:edba]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f235509-62fb-43f0-8f20-08d76d2c3df0
x-ms-traffictypediagnostic: MN2PR15MB3566:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR15MB35669C8E5D88E24356DEBCA8DD4C0@MN2PR15MB3566.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 022649CC2C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(396003)(136003)(346002)(366004)(376002)(199004)(189003)(8676002)(2906002)(6306002)(54896002)(6512007)(478600001)(86362001)(6486002)(8936002)(81166006)(2501003)(2616005)(66446008)(256004)(486006)(66556008)(64756008)(25786009)(36756003)(66946007)(476003)(66476007)(91956017)(33656002)(54906003)(558084003)(76116006)(6116002)(102836004)(110136005)(7736002)(99286004)(316002)(81156014)(6506007)(6436002)(186003)(71190400001)(5660300002)(14454004)(4326008)(46003)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR15MB3566;
 H:MN2PR15MB3648.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p77XYfidI3in1oAcmxgwz9VEmPLozmUCqbuvS2LA1axZXeYHDoaxVRVhMPxVJDrAxNUKEuWUwwp3N5XGw2XZ2oAu/EzE/Anc+AA6rByaQMlmWy5faSIzCJpyG1h9yZ4eusiwVJV1AywNoZhclarO6mwUVoVLlDe2y2KR8c6QKdL+a87efAXgzC2B5IGeHdRG5V3Virz7KCcWjM+ntEOW06ZKPc2XGoMErbfK7ShQ60BFnvhQMeqk+cE+PntL35css/itU+qG5PgWIJrnQvFq1kfVqI8s7/WmqHS48BJMPnrwKsrxtu4+ab/2RMB4RKKP0g503Xonm74glWzvUeeC4qqLSGA5wHhDqXGtsk41MaXJ3BEVDh42ckhijbt6X+/W6XzdSgbP/wA5AsU84VevzsgXJdVzCXrb0M+zOfxyJ4gQl36mf0G1636JmeHm7RHi
Content-Type: multipart/alternative;
 boundary="_000_2432F395A8D940268E74E14B00799DAAfbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f235509-62fb-43f0-8f20-08d76d2c3df0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2019 20:08:28.0499 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4pEEmYcPSyWcZXGg0g0yVXTJsJnSsL3lbqAVVenUezv3HMQSmF6lAvYN1k5Gxjmf0obEy+BNHEPdgFtUH9RCbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR15MB3566
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-19_07:2019-11-15,2019-11-19 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 impostorscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 mlxlogscore=924 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911190165
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Amithash Prasad <amithash@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_2432F395A8D940268E74E14B00799DAAfbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgSmFtZXMvSmFzb24sDQpJIHNlZSBzb21lIHBhdGNoZXMgaW4gSW50ZWwtQk1DIHJlcG8gZm9y
IHBob3NwaG9yLXdhdGNoZG9nLCB3aGF0IGlzIHBsYW4gb2YgdXBzdHJlYW1pbmcgdGhvc2UgcGF0
Y2hlcyBpbiByZXNwZWN0aXZlIHJlcG9zLg0KDQpSZWdhcmRzDQotVmlqYXkNCg==

--_000_2432F395A8D940268E74E14B00799DAAfbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <555F53999F59464FA4808238CB0708F0@namprd15.prod.outlook.com>
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
emU6MTEuMHB0Ij5IaSBKYW1lcy9KYXNvbiw8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+SSBzZWUgc29tZSBw
YXRjaGVzIGluIEludGVsLUJNQyByZXBvIGZvciBwaG9zcGhvci13YXRjaGRvZywgd2hhdCBpcyBw
bGFuIG9mIHVwc3RyZWFtaW5nIHRob3NlIHBhdGNoZXMgaW4gcmVzcGVjdGl2ZSByZXBvcy4NCjxv
OnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+UmVnYXJkczxvOnA+PC9v
OnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6MTEuMHB0Ij4tVmlqYXk8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjwvYm9keT4N
CjwvaHRtbD4NCg==

--_000_2432F395A8D940268E74E14B00799DAAfbcom_--
