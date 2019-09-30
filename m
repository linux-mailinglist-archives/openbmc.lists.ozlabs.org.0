Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37414C2AC5
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2019 01:22:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hz2Y4KbczDqB2
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2019 09:22:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=51761429b3=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="S1tsB7PE"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="DohfcP7d"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hz1y53ZDzDqLD
 for <openbmc@lists.ozlabs.org>; Tue,  1 Oct 2019 09:21:53 +1000 (AEST)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8UNKUfI032459
 for <openbmc@lists.ozlabs.org>; Mon, 30 Sep 2019 16:21:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=os066kDjV5hs4/Y4N6/q9/UdyB1U/VuQmlk6zzpQoPk=;
 b=S1tsB7PE9FTU6KcOUjVHYDcRM5WCS6nxS2JcZy5cK8FWh7a+TxcbZBkqCZ58/KD4L3wV
 FFdoA8zVSfQQ2MXPHKhl86DLYedFKIyguZTND87O7JWXXR/LjBZ1kdvfS5Je39ylD64Q
 AHGfZCgSSGNavlGycJENyukviwU9ieq+UbA= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2vaq9pg0uv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 30 Sep 2019 16:21:50 -0700
Received: from prn-mbx05.TheFacebook.com (2620:10d:c081:6::19) by
 prn-hub03.TheFacebook.com (2620:10d:c081:35::127) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 30 Sep 2019 16:21:49 -0700
Received: from prn-hub06.TheFacebook.com (2620:10d:c081:35::130) by
 prn-mbx05.TheFacebook.com (2620:10d:c081:6::19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 30 Sep 2019 16:21:49 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Mon, 30 Sep 2019 16:21:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gpdILp/+qD+NHH/VDnoA50cmJA1e4yGKSsCSWO1RJ1EWt0KVlu5Ku6NdQAw1RMQ1u+fvAGS0REEGDMBAYy6I47g4FjtnMl+LnQpdCgPF58tgD0j0mcjDQgPeDvW5YGUI8qS5Hm/Mn6KF8h2cmpYBaJfVNSsr5L2NC/8cNxfZ2VKtjxM2gSKFgs9Qv9Es5ksEWX6ixsWslrTe2dkqq6KgJFGy/AL808onT4vTSl4ymTSnSmf5IvOFW/jxW7bU08MAEjR2fWA2F7fQrEvE5pvtOUw1nR7Of4iBp9PBz9ljFQ5Su6UTROddhpm1gMWJyO5OCJGVcuMS3ie3VuTpj/BjVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=os066kDjV5hs4/Y4N6/q9/UdyB1U/VuQmlk6zzpQoPk=;
 b=D8JFfyCN3U9ZnA9+8QGnR9yyuqreCTzhISyRQb0OIStDxiHY86Rv+K9z8NhuKTXbNs3EnMqbn+jhDwMCa10Q72tBwaLTgzjIRQick9I9WNwbflvZeal0sWXqRJMqDJE5HoDI/gKOGYRb7sH1tHdaUAF0bIORppDPeOT0q+TIMLkKlbUyFt+s5AEF1JHDI4IsZL4OkIwDu8Mj8oGlI9UGKmIpKv99vfEm1Ou761uMiYBhSDh2Or6YXSA+MEkNkbFPVBmXMXYykBr16/9pgJV5WoeliY/6525cibhNbfYfiYzwvuPJw2FUlvuv9Gc+BlmfnF81TTk5XlwLyytmDgLsOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=os066kDjV5hs4/Y4N6/q9/UdyB1U/VuQmlk6zzpQoPk=;
 b=DohfcP7dLfHMEcVrJVM/LMYVyL9lAOnhjFM0f5pOshniKY1bgiwm2WExSPWrhO601xqskptIWoNYqctoa9pBZ11dIGLgRrusp6lFwsQqNGrsHIaMf217nVfDgs+KNOkJ8h1pP2SIIVvh0bO6+ma4JyE/ERn1qkW6+NIqhyfBKQA=
Received: from BY5PR15MB3636.namprd15.prod.outlook.com (52.133.252.91) by
 BY5PR15MB3684.namprd15.prod.outlook.com (52.133.254.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 23:21:48 +0000
Received: from BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::7887:4f9c:70df:285c]) by BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::7887:4f9c:70df:285c%4]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 23:21:48 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: phosphor-gpis-monitor
Thread-Topic: phosphor-gpis-monitor
Thread-Index: AQHVd+XVoQyGmm4d/E2j2PMNwqDKzA==
Date: Mon, 30 Sep 2019 23:21:48 +0000
Message-ID: <C0D5C720-5853-4934-A314-726C255BC77D@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:5d6f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e5defe7-6955-476f-fd7f-08d745fcf7a5
x-ms-traffictypediagnostic: BY5PR15MB3684:
x-microsoft-antispam-prvs: <BY5PR15MB3684E3B08FD7F90889F6FF77DD820@BY5PR15MB3684.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(366004)(136003)(39860400002)(396003)(376002)(199004)(189003)(54896002)(33656002)(4744005)(6306002)(6512007)(86362001)(14454004)(99286004)(2906002)(478600001)(3480700005)(9326002)(8936002)(81156014)(81166006)(8676002)(6116002)(2616005)(6436002)(46003)(102836004)(25786009)(66446008)(66556008)(66476007)(316002)(186003)(6506007)(486006)(76116006)(6486002)(64756008)(476003)(91956017)(7736002)(71200400001)(71190400001)(36756003)(5660300002)(256004)(66946007)(6916009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR15MB3684;
 H:BY5PR15MB3636.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RPnPIjJYEB4Axs0Xdph3Rv05x1/dGJKXLYAo4Sn5V/7kfx4txXcTgKkyViNtxcNhWDSQkQOKNqO35y/a3bGlRYqtutUVIhHTdEo4xnN5Zv+fq8OjVTHfb8LL9sO2G2zLZobZY6M7Yki9oSmN0RW3M0bi/331pG4lcIZS+w9+X5FpfazuYhCcUT1RtS7NubVYwO9ZE5f9LMjtxlkUivePVPWzRsBZL4+itqCd37ElNY0WMGZv1iJXC2fsC7dNngenUWdBzwlC8F4i2Fj5/6uvLDk9Lq7Qu0WE8e9KkJ55j/Y3SdZSb+X/uTs8H6hoG1oCJp84VmApUbCH/OQpj9souGfI8RJnrKSndSLvka7r8UiUb9+whADFXJkf/54vTlsXqxf6Eup4C/zHiDURa83h5vyYLAMSLQ4AIIHnFe2/Ic0=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_C0D5C72058534934A314726C255BC77Dfbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e5defe7-6955-476f-fd7f-08d745fcf7a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 23:21:48.2791 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +gfWD9Ru1lJ6fixhRaKPC1P5KW88bZA3Kxjyh4tubBBWcJgV35a+gACv54RplMN+eus29Bp75zUyCKAsEmW21g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3684
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-09-30_13:2019-09-30,2019-09-30 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=815 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1908290000 definitions=main-1909300192
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

--_000_C0D5C72058534934A314726C255BC77Dfbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQpJIGFtIHRyeWluZyB0byB1c2UgcGhvc3Bob3ItZ3Bpby1tb25pdG9yIGFuZCB3YXMgd29u
ZGVyaW5nIHdoYXQgaXMgdGhlIHBhcmFtZXRlciBERVZQQVRIPeKAneKAnSBuZWVkcyB0byBiZSBw
YXNzZWQuIEkgdGhvdWdodCBpdCBpcyAvZGV2L2dwaW9jaGlwMCBidXQgd2l0aCB0aGlzIEkgYW0g
Z2V0dGluZyBlcnJvciBpbiBpbml0X2V2ZW50Lg0KUGxlYXNlIGxldCBtZSBrbm93IGlmIGFueW9u
ZSB1c2VkIHRoaXMgYW5kIGhvdyBkbyBJIGRlZmluZSBwYXRoIGZvciB0aGlzLiBEbyBJIG5lZWQg
YW55dGhpbmcgaW4ga2VybmVsIHRvIGJ1aWxkLg0KDQpSZWdhcmRzDQotVmlqYXkNCg==

--_000_C0D5C72058534934A314726C255BC77Dfbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <2B732FB303B94C49A722038C58C6CA02@namprd15.prod.outlook.com>
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
Ij48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+SSBhbSB0cnlpbmcgdG8gdXNlIHBob3Nw
aG9yLWdwaW8tbW9uaXRvciBhbmQgd2FzIHdvbmRlcmluZyB3aGF0IGlzIHRoZSBwYXJhbWV0ZXIg
REVWUEFUSD3igJ3igJ0gbmVlZHMgdG8gYmUgcGFzc2VkLiBJIHRob3VnaHQgaXQgaXMgL2Rldi9n
cGlvY2hpcDAgYnV0IHdpdGggdGhpcyBJIGFtIGdldHRpbmcgZXJyb3IgaW4gaW5pdF9ldmVudC48
bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0i
Zm9udC1zaXplOjExLjBwdCI+UGxlYXNlIGxldCBtZSBrbm93IGlmIGFueW9uZSB1c2VkIHRoaXMg
YW5kIGhvdyBkbyBJIGRlZmluZSBwYXRoIGZvciB0aGlzLiBEbyBJIG5lZWQgYW55dGhpbmcgaW4g
a2VybmVsIHRvIGJ1aWxkLjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bh
bj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBw
dCI+UmVnYXJkczxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxz
cGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij4tVmlqYXk8bzpwPjwvbzpwPjwvc3Bhbj48L3A+
DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_C0D5C72058534934A314726C255BC77Dfbcom_--
