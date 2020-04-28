Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BFC1BCD47
	for <lists+openbmc@lfdr.de>; Tue, 28 Apr 2020 22:18:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BXz13fJ0zDqtK
	for <lists+openbmc@lfdr.de>; Wed, 29 Apr 2020 06:18:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=2387508ca5=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=U6uu4A3K; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=Hco1Nr6S; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BXy34LkKzDqHY
 for <openbmc@lists.ozlabs.org>; Wed, 29 Apr 2020 06:17:45 +1000 (AEST)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03SKDsc8006294
 for <openbmc@lists.ozlabs.org>; Tue, 28 Apr 2020 13:17:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=Gh3OWpjbboNnM5yDZVgHjs6musSIFzWOj6BXsmnPhLg=;
 b=U6uu4A3K7mbm/0Eq2FTmv2Ibw6ca5qLCh3lgKHo39Hz7uF9PAHtXBtPcesrzCdbJifjv
 /nhyZGe4O4zzu7hF5eo/qarstuHon8rdp116vJ4CamcHi6X7CDHiW1PeOMkI7yl67IHP
 kx3wWid9kCl7dYvbRSn0+8qg8lgLMIdP6DQ= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 30mk1gn7q2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 28 Apr 2020 13:17:41 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.173) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Tue, 28 Apr 2020 13:17:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SA53ekfm7jJeXPpu8Jhzq/QUBgJ/tU/+l5UaD2y1jXGE7Ci/YvYux6I/VfubTM/2dtYhkGpyCh5YlvjBMnFxnuV9XUlPrYeePfno6PI+gz1/ZEDXClhOXqVeHHhY//M+D2U0V3rAyUun6fqYXK5FyS7GT0Ha8YJj2PjxNCuXRJnn2n0/LT/lh+E6vJP0FzSgAIVAwHkNjs82btbw+0IWhHURN45LgPFTP1OcDmBDDRxLcZC46h7kgI2zEZBS2W7uiGkpO/tHZOANIq6BMaKUr/bKS0h+tawyTmk9Y/QnG0afR7Aqt3T2pEGEluO6AIIRJEiyXjr9uUguVcaWM1sPhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gh3OWpjbboNnM5yDZVgHjs6musSIFzWOj6BXsmnPhLg=;
 b=cllQrhPDSvs6cT9Mlu2RYe2yottbxKwyxQM3C8UQCzFH1+DZwrylNKXsILIY7vO69Xs7q8oe+wd454FC+q9plE8Gj8weHFvvGa/ipXNkhitpKmV1am4FXZMlHJyQPS2JR8GYc1LBrUgWROIjsnlxhtc+6/5VZY2JsKcWMKpsGg4Nv9PGWnxassZ7v/93D3qanOiPPdPUOfHfWdo3hEYtgePuL/4BGg1z+/O2xSKzmjmqODJKIQz1m3jiSDcsGga7fvzU81c51qvlgg/nMF7m8iosnR+/6SuiCc4FHbdEH6FVVFHW6FmAeAjR4HApOzqkRTx2dN3xhVm0qgsmHtTREA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gh3OWpjbboNnM5yDZVgHjs6musSIFzWOj6BXsmnPhLg=;
 b=Hco1Nr6SzxzB1TFsssB+SOzsrsKd8n18J0Nhc3X7bMcyNhX8uvpqROzFflEcJE5Q/qqSM6PikK+crxDzl8WpiEgmn9VYhFjV846o8N/mW4sfNLDQtGyQ7WMRKqPuFbEA52olgkRbzz60vfzyl8XEBC+FOyRGmcMCpCc0lDYvlCw=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2341.namprd15.prod.outlook.com (2603:10b6:a02:81::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Tue, 28 Apr
 2020 20:17:33 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4%3]) with mapi id 15.20.2937.023; Tue, 28 Apr 2020
 20:17:33 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: BMC health monitoring
Thread-Topic: BMC health monitoring
Thread-Index: AQHWHZoNPPIrPI4zmk+NLoquzxBZzA==
Date: Tue, 28 Apr 2020 20:17:33 +0000
Message-ID: <D823D4AF-9C24-4DFC-8AC8-5284C4167B30@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:125d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef5a2f6d-127d-422f-97ca-08d7ebb12fa2
x-ms-traffictypediagnostic: BYAPR15MB2341:
x-microsoft-antispam-prvs: <BYAPR15MB2341A67E02D5423EDE868F9BDDAC0@BYAPR15MB2341.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0387D64A71
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(39860400002)(396003)(136003)(376002)(346002)(6506007)(36756003)(7116003)(478600001)(4744005)(76116006)(8676002)(33656002)(3480700007)(71200400001)(186003)(5660300002)(66556008)(64756008)(66946007)(86362001)(91956017)(66446008)(66476007)(8936002)(316002)(6916009)(6512007)(2616005)(6486002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /8lINYaiD36XVUqqRf8c9mtSMNBK3DkufnIjKnOj1F3hm0sIcDHXn4GK7I3c8V1ZMjPSeMgRETqHkpWB8ZwyJKcrlV/g0Y+q1LAjtXXtZ1/cYYh4dJPG8dWtW4ow4AmhBmCn/59HOZAnGOXf2aWzy3b5mt5s7xjqFXRHkSoqAio2V6SnzN0yXUPsZqKgz7phBxKfdYLHcfrjyOE7qs9FOqMR5Q1gycnQxg8FkLkPv6wbLatNE0CzbmEuqEk/LJpe6MSajEUVwcXPik+iP2aE8+ZxakenfrpoZ7AhO8xN86QeIF4+8r+s83gtv2jT6DTdQ52Z+E+lHqUpyfZKIZyv9i1b+qQyebzVwLB8bUXRy+vuYibJb57hsJinOLPegxG7mddtPoHMQVyfFqC618CzgbEJF4tCDwek07NYv/kz2Vm0GVPnwZamAoSZc1m+zg0D
x-ms-exchange-antispam-messagedata: /6WksYEuDKJtqWg9VuJvQmBpaeAW4zbjo5ya0LMU4lhQNsy6xNVcCd3px2ViLe35OWptTjTvy8D8JkwXtYcwt69uW+jIRbRA4bO1I+pW3WI8xYXUr4GO7bLKJRc4tlJRdAM65RrY4e5VlX1A1bISKbogiprHjtALIUvRG9it9D0SPTYqxAl94sLp+QZR3xAcIGg4YW5Y6jYCR6z0yglN1UBDJc4fhmzm+tUthtFx0imox5JSpsNpzKq+i9CP0KXep1N/EaR9oF5QYuFCgVr/EEzfZ++9+2bdUrFJmTVc7i0RFEAfrhu7e4QP2ynvhNAXbS95R2+WDI1JJQDO7wwgypjCwbN7B1gsvlnbpzrWO49+/K7Vr/E/BLW2FDqX2z/+a4yEa/+s0zvU87lBDoJ4AfCF8PNOo8oWn5eesHAPqnS4GxBVV3G1NjKHuSCyJBOdxCEASHkPRIofFYRb3dHGpTrpOto5xtSNgplbk54ziH4v1sG1CLfyej6BVARFMOkKuRmVjpSCNPrODqPsVWwY1GiW7bW/YElDhOK8/CFKDsz9MTTlUy6oduihT/CpY889ayJCMC7E2CoyA+9ME2ocVJWdKn12ccxMMjoSNkEaZQk1/Skf4HzIrJCur0PKvUwVI30/YHLgdeA5Kd+9PeKhpz2xsLFTOJIsXW5FAubf2xn56KQlO7TYfHJ5n/3CPc/FLvKRYJYgeFMnEwjJo9FbYgZYGkyQc4ipyZ2ZyzKstyrWFLPgSfRILaTZutFBcw8bGThAU1hUIIMX2fVTRj8ePcfD+my0FuL7ELZ54j/J6FyPzeI+TMal1y7p0NivNO+BkHZ0jjLMt864Dt394xzvXw==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_D823D4AF9C244DFC8AC85284C4167B30fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ef5a2f6d-127d-422f-97ca-08d7ebb12fa2
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2020 20:17:33.4999 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5G+szkyQqfujsR5Lmg7Y/we1ejkk638UqYhlCxqiUUiLqIrG6CMHNq/O8lBeF2U/Yiu1LjlLZQkVuKTmVD2GbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2341
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-28_12:2020-04-28,
 2020-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 impostorscore=0
 suspectscore=0 mlxlogscore=713 priorityscore=1501 lowpriorityscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004280158
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

--_000_D823D4AF9C244DFC8AC85284C4167B30fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SXMgdGhlcmUgYW55IG1vZHVsZSB3aGljaCBkb2VzIGhlYWx0aCBtb25pdG9yaW5nIGZvciBCTUMg
aGVhbHRoLiBJZiB0aGVyZSBpcyBub25lIHRoZW4gSSBhbSBwcm9wb3NpbmcgYSBwaG9zcGhvci1i
bWMtaGVhbHRoIHdoaWNoIHdpbGwgbW9uaXRvciBmb2xsb3dpbmcgY29tcG9uZW50IHRvIHN0YXJ0
IHdpdGggYW5kIGNhbiBiZSBleHRlbmRlZCBmb3IgbW9yZSBjb21wb25lbnRzLg0KDQogIDEuICBD
UFUgdXRpbGl6YXRpb24NCiAgMi4gIE1lbW9yeSB1dGlsaXphdGlvbg0KDQpJdCB3aWxsIHRha2Ug
cHJvcGVyIGFjdGlvbiBsaWtlIHJlcG9ydCBhbGVydCBvciByZWJvb3Qgc3lzdGVtIHdoZW4gdGhl
c2UgZGF0YSB3aWxsIGNyb3NzIGl04oCZcyB0aHJlc2hvbGQgdmFsdWUgd2hpY2ggd2FzIGNvbmZp
Z3VyZWQuDQoNClJlZ2FyZHMNCi1WaWpheQ0K

--_000_D823D4AF9C244DFC8AC85284C4167B30fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <59016A040AF8FD4994F3AB068D7E5453@namprd15.prod.outlook.com>
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
IixzYW5zLXNlcmlmO30NCnAuTXNvTGlzdFBhcmFncmFwaCwgbGkuTXNvTGlzdFBhcmFncmFwaCwg
ZGl2Lk1zb0xpc3RQYXJhZ3JhcGgNCgl7bXNvLXN0eWxlLXByaW9yaXR5OjM0Ow0KCW1hcmdpbi10
b3A6MGluOw0KCW1hcmdpbi1yaWdodDowaW47DQoJbWFyZ2luLWJvdHRvbTowaW47DQoJbWFyZ2lu
LWxlZnQ6LjVpbjsNCgltYXJnaW4tYm90dG9tOi4wMDAxcHQ7DQoJZm9udC1zaXplOjEyLjBwdDsN
Cglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQpzcGFuLkVtYWlsU3R5bGUxNw0K
CXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1jb21wb3NlOw0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNv
LXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2Vy
aWY7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41aW4gMTEuMGluOw0KCW1hcmdpbjox
LjBpbiAxLjBpbiAxLjBpbiAxLjBpbjt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6V29yZFNl
Y3Rpb24xO30NCi8qIExpc3QgRGVmaW5pdGlvbnMgKi8NCkBsaXN0IGwwDQoJe21zby1saXN0LWlk
OjE5NTI3NDAxMTY7DQoJbXNvLWxpc3QtdHlwZTpoeWJyaWQ7DQoJbXNvLWxpc3QtdGVtcGxhdGUt
aWRzOjYxNTk0NzEzMiA2NzY5ODcwMyA2NzY5ODcxMyA2NzY5ODcxNSA2NzY5ODcwMyA2NzY5ODcx
MyA2NzY5ODcxNSA2NzY5ODcwMyA2NzY5ODcxMyA2NzY5ODcxNTt9DQpAbGlzdCBsMDpsZXZlbDEN
Cgl7bXNvLWxldmVsLXRhYi1zdG9wOm5vbmU7DQoJbXNvLWxldmVsLW51bWJlci1wb3NpdGlvbjps
ZWZ0Ow0KCXRleHQtaW5kZW50Oi0uMjVpbjt9DQpAbGlzdCBsMDpsZXZlbDINCgl7bXNvLWxldmVs
LW51bWJlci1mb3JtYXQ6YWxwaGEtbG93ZXI7DQoJbXNvLWxldmVsLXRhYi1zdG9wOm5vbmU7DQoJ
bXNvLWxldmVsLW51bWJlci1wb3NpdGlvbjpsZWZ0Ow0KCXRleHQtaW5kZW50Oi0uMjVpbjt9DQpA
bGlzdCBsMDpsZXZlbDMNCgl7bXNvLWxldmVsLW51bWJlci1mb3JtYXQ6cm9tYW4tbG93ZXI7DQoJ
bXNvLWxldmVsLXRhYi1zdG9wOm5vbmU7DQoJbXNvLWxldmVsLW51bWJlci1wb3NpdGlvbjpyaWdo
dDsNCgl0ZXh0LWluZGVudDotOS4wcHQ7fQ0KQGxpc3QgbDA6bGV2ZWw0DQoJe21zby1sZXZlbC10
YWItc3RvcDpub25lOw0KCW1zby1sZXZlbC1udW1iZXItcG9zaXRpb246bGVmdDsNCgl0ZXh0LWlu
ZGVudDotLjI1aW47fQ0KQGxpc3QgbDA6bGV2ZWw1DQoJe21zby1sZXZlbC1udW1iZXItZm9ybWF0
OmFscGhhLWxvd2VyOw0KCW1zby1sZXZlbC10YWItc3RvcDpub25lOw0KCW1zby1sZXZlbC1udW1i
ZXItcG9zaXRpb246bGVmdDsNCgl0ZXh0LWluZGVudDotLjI1aW47fQ0KQGxpc3QgbDA6bGV2ZWw2
DQoJe21zby1sZXZlbC1udW1iZXItZm9ybWF0OnJvbWFuLWxvd2VyOw0KCW1zby1sZXZlbC10YWIt
c3RvcDpub25lOw0KCW1zby1sZXZlbC1udW1iZXItcG9zaXRpb246cmlnaHQ7DQoJdGV4dC1pbmRl
bnQ6LTkuMHB0O30NCkBsaXN0IGwwOmxldmVsNw0KCXttc28tbGV2ZWwtdGFiLXN0b3A6bm9uZTsN
Cgltc28tbGV2ZWwtbnVtYmVyLXBvc2l0aW9uOmxlZnQ7DQoJdGV4dC1pbmRlbnQ6LS4yNWluO30N
CkBsaXN0IGwwOmxldmVsOA0KCXttc28tbGV2ZWwtbnVtYmVyLWZvcm1hdDphbHBoYS1sb3dlcjsN
Cgltc28tbGV2ZWwtdGFiLXN0b3A6bm9uZTsNCgltc28tbGV2ZWwtbnVtYmVyLXBvc2l0aW9uOmxl
ZnQ7DQoJdGV4dC1pbmRlbnQ6LS4yNWluO30NCkBsaXN0IGwwOmxldmVsOQ0KCXttc28tbGV2ZWwt
bnVtYmVyLWZvcm1hdDpyb21hbi1sb3dlcjsNCgltc28tbGV2ZWwtdGFiLXN0b3A6bm9uZTsNCglt
c28tbGV2ZWwtbnVtYmVyLXBvc2l0aW9uOnJpZ2h0Ow0KCXRleHQtaW5kZW50Oi05LjBwdDt9DQpv
bA0KCXttYXJnaW4tYm90dG9tOjBpbjt9DQp1bA0KCXttYXJnaW4tYm90dG9tOjBpbjt9DQotLT48
L3N0eWxlPg0KPC9oZWFkPg0KPGJvZHkgbGFuZz0iRU4tVVMiIGxpbms9IiMwNTYzQzEiIHZsaW5r
PSIjOTU0RjcyIj4NCjxkaXYgY2xhc3M9IldvcmRTZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+SXMgdGhlcmUgYW55IG1vZHVsZSB3
aGljaCBkb2VzIGhlYWx0aCBtb25pdG9yaW5nIGZvciBCTUMgaGVhbHRoLiBJZiB0aGVyZSBpcyBu
b25lIHRoZW4gSSBhbSBwcm9wb3NpbmcgYSBwaG9zcGhvci1ibWMtaGVhbHRoIHdoaWNoIHdpbGwg
bW9uaXRvciBmb2xsb3dpbmcgY29tcG9uZW50IHRvIHN0YXJ0IHdpdGggYW5kIGNhbiBiZSBleHRl
bmRlZCBmb3IgbW9yZQ0KIGNvbXBvbmVudHMuPG86cD48L286cD48L3NwYW4+PC9wPg0KPG9sIHN0
eWxlPSJtYXJnaW4tdG9wOjBpbiIgc3RhcnQ9IjEiIHR5cGU9IjEiPg0KPGxpIGNsYXNzPSJNc29M
aXN0UGFyYWdyYXBoIiBzdHlsZT0ibWFyZ2luLWxlZnQ6MGluO21zby1saXN0OmwwIGxldmVsMSBs
Zm8xIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+Q1BVIHV0aWxpemF0aW9uPG86cD48
L286cD48L3NwYW4+PC9saT48bGkgY2xhc3M9Ik1zb0xpc3RQYXJhZ3JhcGgiIHN0eWxlPSJtYXJn
aW4tbGVmdDowaW47bXNvLWxpc3Q6bDAgbGV2ZWwxIGxmbzEiPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6MTEuMHB0Ij5NZW1vcnkgdXRpbGl6YXRpb248bzpwPjwvbzpwPjwvc3Bhbj48L2xpPjwvb2w+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86
cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkl0IHdpbGwgdGFrZSBwcm9wZXIgYWN0aW9uIGxpa2UgcmVw
b3J0IGFsZXJ0IG9yIHJlYm9vdCBzeXN0ZW0gd2hlbiB0aGVzZSBkYXRhIHdpbGwgY3Jvc3MgaXTi
gJlzIHRocmVzaG9sZCB2YWx1ZSB3aGljaCB3YXMgY29uZmlndXJlZC48bzpwPjwvbzpwPjwvc3Bh
bj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBw
dCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPlJlZ2FyZHM8bzpwPjwvbzpwPjwvc3Bhbj48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+LVZp
amF5PG86cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_D823D4AF9C244DFC8AC85284C4167B30fbcom_--
