Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 927A222CC6E
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 19:42:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCxNs60xzzF1RZ
	for <lists+openbmc@lfdr.de>; Sat, 25 Jul 2020 03:42:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=447423b922=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=gmVib+fN; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=jKnWxZ97; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCxMX0YrrzF1Hr
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jul 2020 03:41:24 +1000 (AEST)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06OH0n2D028634
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jul 2020 10:05:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=+c4bUqNteCNulBAWrT5aaJhtkpCmmskLrLA/EjhWoJw=;
 b=gmVib+fNVwj4ABrSn2RYVAMPPs8L5Va+xmP/cJ0mtqZ0WCDuCZnbpVcnK3tBYgCbUvZZ
 uBDR++a2eV/9LGi3MkeeKOIwSg3USh3sr0fUAAdqdf7Wn07HQIZL+EvlHKLhoRHKrT7u
 nvs8mDTJyqBO4fDumGMI8tCngN5vX7hawpM= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 32etmwjkuw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jul 2020 10:05:28 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 24 Jul 2020 10:05:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+xZ5b+QWkjk5goeXNhcojahMQ/U0nQoGeaZZ820E1kYHrNoAYhHqr6ZlLgMDhiHbP5sjXztiodJatFw4t1KiFGsy1pfrC20C9i2ffYI7A5mTXh+5zrCqJ822/6Fqqg/Juj17QtL8l39fcLTZn4qADwq+1HcQR6sUZ0GhXWOVgL52FHPFN66q+996fzVibghfOP9tuilapa/HpBIqI5mpvOgmUGVQCAA+s69iqePlPnTuJ0Chf6hQwviG0iM3UERehvB9jIGx4aNlcS3DctKexjv394DW8rJnceAEw7DZZkwzViksKtKgTHW9i3QgY871L5bv57r/px7798DqIHxsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+c4bUqNteCNulBAWrT5aaJhtkpCmmskLrLA/EjhWoJw=;
 b=DkaYUXZtjqGcXDFmdfxEoKnaARa+CIsQlcjHZ9Ij20T94GBcv8/j9l6lP5J49J3VyN1yRwmp5vksSwxu26BZfKDsqnpWL2dl0j89qm/tPYvk5bgB9PaiQVewlV/Bg3c6um9htGWSkTWDpq5urZe4SrzNjwfgURHk2YHnKZXg3wqTxQMDCJlZ1xS8InUOIwG5E5vpY85yHz9e0C6Kysm7FNUkoqeTgHSxh8A7xwqiElCioEvhcSu2MtNpcf8q2YczInfIRPGCl5lj0xfYzFcU/MLcEtexbDkduTx+8LoPQhMHZAf68wMga5xGAX2My0ePrid2xuLk8fj9LTw1ed0Pww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+c4bUqNteCNulBAWrT5aaJhtkpCmmskLrLA/EjhWoJw=;
 b=jKnWxZ97B87AIjAdLE33spSbY0pmqe9JfOO7hLBQKGM7H7EFJAGoHVJgmxf3ix/TGPmUsObKEAHWMt/z0QHi6a3h9hY0lwHVGZTsGmYWEfSpDd1Kp82memgHEtVd8rdqkkQv7bvDSJAwMHsCTPQzje8ZzYauNgajTTF4jTzK+WY=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BY5PR15MB3665.namprd15.prod.outlook.com (2603:10b6:a03:1f7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Fri, 24 Jul
 2020 17:05:26 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::2908:ebc2:73a5:45b3]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::2908:ebc2:73a5:45b3%5]) with mapi id 15.20.3216.024; Fri, 24 Jul 2020
 17:05:26 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: CPU utilization
Thread-Topic: CPU utilization
Thread-Index: AQHWYdyg+RWahH3Y1UKOkvnp0nWTvg==
Date: Fri, 24 Jul 2020 17:05:26 +0000
Message-ID: <B0EC058F-D2E2-40BE-932C-E8532585580A@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2601:647:4b00:fd70:18e2:66b5:5e3d:3d1a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc77351d-dfd8-498c-ebf1-08d82ff3c2f1
x-ms-traffictypediagnostic: BY5PR15MB3665:
x-microsoft-antispam-prvs: <BY5PR15MB3665A2CB6033224464C79FE4DD770@BY5PR15MB3665.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nN7FgsrIJfdFtuv0RcV4nIaIAWIDSpzApP/0rseizyGp9GMAb9z7hfA4ICL2duTEwY0NKKdQD5X5SGkMwrWhvNwks1xBvacfMHaoDhpVzNk42oL31ivp8ET1HUyIPkzo/IUVbZLROPNGRcgjZk94BZAVP3R7x2/cKQ13JpbAzybrIqIK1MMgiW36luCLQqNNS8WJgaiNLVBSyU77m13+4gtthQRCVWDOVcz3PVHwS7wEr1PYds6WxFtfDUgoRwrHsUVP+ZmPWqMawExidSYhCOAVY3Xo83ochq/tYUk2nz6OChKu6Cw7yc3SH1RJeG+gJEu61xx6Jif4/MVs0M+umA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(346002)(376002)(136003)(366004)(396003)(6506007)(86362001)(71200400001)(6486002)(186003)(478600001)(36756003)(2906002)(7116003)(66946007)(3480700007)(5660300002)(8676002)(8936002)(2616005)(4744005)(316002)(6916009)(33656002)(66556008)(66476007)(66446008)(6512007)(76116006)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 82+WNyxMCmx3KMtVLgkOmzbMTp40mG0h0FJjz6sDn7WFI8tve7kY7n5DyNxl5FcBjs75Ny6LF04JNAaoVIPkHj4tSIScC9uA5RmhgcmhriFN95nkwQ034yXJmeu8WEgLLyqVLFMQcZKfn7fuX9k6VEkn+LWMmWxoEvUtiWPiHWE1ML3boURWrB18dabtrATbdvE5iOfyr/tWPKRtI++mVcQ9ONIANrc1emShLvsweY9HoP00GZ3mK7ZC8/fryndOxZtob/R4W50/dhaEdxchRNgAoXLMppO48xYbJdoZkJziKO1wnkBkxZ1brh7b+/vQiWyb0RG6lQcdpxifhfbroT2lwLsq6rLQbLEVHQ52GpIKNWUnS7VmkekaDCVxR3uRjJp7D8TeWGC+bCDUMJE56jYt7SpCj7Du2SoYkK8ox7UyNCLfTQfjrJ7YsLJ2+feSqZ83jASaF9Y0/epOE8fKsn3Q/qUj6BD7fwRPnoVJE0ibvagFKX0/yYnOKzv1UxfytY6yWL9ZFUyzDd0aEXpEtavZkWtlQtmGuAOJSchS1gnU5ssNpC29TroUEFNnpOqx
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_B0EC058FD2E240BE932CE8532585580Afbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc77351d-dfd8-498c-ebf1-08d82ff3c2f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2020 17:05:26.6788 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n02ltzYBfhlprcruu7I9xX73oV4lkBWuMMv6yPQ0zMxeoMIoPwkdlwQTd5Fd4g2hOI3MYY3OYA+w9Z5rckRZCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3665
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-24_07:2020-07-24,
 2020-07-24 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 lowpriorityscore=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=627 priorityscore=1501
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007240131
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

--_000_B0EC058FD2E240BE932CE8532585580Afbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGVhbSwNCkkgYW0gZ2V0dGluZyB2ZXJ5IGhpZ2ggdmFsdWVzIG9mIGNwdSB1c2FnZSBhbmQgdmVy
eSBsZXNzIENQVSBpZGxlIHRpbWUuIEZvbGxvd2luZyBpcyB0aGUgb3V0cHV0IG9mIC9wcm9jL3N0
YXQgaHdlcmUgY3B1IGlkbGUgdGltZSBpcyAxNjcgd2hpY2ggaXMgbGVzcyB0aGFuIGEgMSUgb2Yg
dG90YWwgY3B1IHRpbWUuIFBsZWFzZSBsb29rIGF0IHlvdXIgc3lzdGVtIGFuZCBwYXN0ZSB5b3Vy
IG91dHB1dC4NCnJvb3RAdGlvZ2FwYXNzOn4jIGNhdCAvcHJvYy9zdGF0IGNwdSAxNjg5MzMwMiA5
OTk2MzUgNjgyMzY1MCAxNjcgMCAwIDU2OTUwIDAgMCAwDQoNCkRvZXMgYW55b25lIGtub3cgb2Yg
dGhpcyBpc3N1ZSBvciBhbSBJIG1pc3NpbmcgYW55IGtlcm5lbCBjb25maWd1cmF0aW9uPw0KDQpS
ZWdhcmRzDQotVmlqYXkNCg==

--_000_B0EC058FD2E240BE932CE8532585580Afbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <C56A57B2DEE4C844A81590FD9D259C38@namprd15.prod.outlook.com>
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
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OiJBcHBsZSBD
b2xvciBFbW9qaSI7DQoJcGFub3NlLTE6MCAwIDAgMCAwIDAgMCAwIDAgMDt9DQovKiBTdHlsZSBE
ZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3JtYWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0K
CXttYXJnaW46MGluOw0KCWZvbnQtc2l6ZToxMi4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGlicmki
LHNhbnMtc2VyaWY7fQ0Kc3Bhbi5FbWFpbFN0eWxlMTcNCgl7bXNvLXN0eWxlLXR5cGU6cGVyc29u
YWwtY29tcG9zZTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjsNCgljb2xvcjp3
aW5kb3d0ZXh0O30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5
Ow0KCWZvbnQtc2l6ZToxMi4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7
fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41aW4gMTEuMGluOw0KCW1hcmdpbjoxLjBp
biAxLjBpbiAxLjBpbiAxLjBpbjt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6V29yZFNlY3Rp
b24xO30NCi0tPjwvc3R5bGU+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJFTi1VUyIgbGluaz0iIzA1
NjNDMSIgdmxpbms9IiM5NTRGNzIiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5UZWFtLDxvOnA+
PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250
LXNpemU6MTEuMHB0Ij5JIGFtIGdldHRpbmcgdmVyeSBoaWdoIHZhbHVlcyBvZiBjcHUgdXNhZ2Ug
YW5kIHZlcnkgbGVzcyBDUFUgaWRsZSB0aW1lLiBGb2xsb3dpbmcgaXMgdGhlIG91dHB1dCBvZiAv
cHJvYy9zdGF0IGh3ZXJlIGNwdSBpZGxlIHRpbWUgaXMgMTY3IHdoaWNoIGlzIGxlc3MgdGhhbiBh
IDElIG9mIHRvdGFsIGNwdSB0aW1lLiBQbGVhc2UgbG9vayBhdCB5b3VyIHN5c3RlbQ0KIGFuZCBw
YXN0ZSB5b3VyIG91dHB1dC4gPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS41cHQ7Zm9udC1mYW1pbHk6JnF1b3Q7QXBw
bGUgQ29sb3IgRW1vamkmcXVvdDs7Y29sb3I6d2hpdGU7YmFja2dyb3VuZDojMzczRTRDIj5yb290
QHRpb2dhcGFzczp+IyBjYXQgL3Byb2Mvc3RhdCBjcHUgMTY4OTMzMDIgOTk5NjM1IDY4MjM2NTAg
MTY3IDAgMCA1Njk1MCAwIDAgMDwvc3Bhbj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+
PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9
ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNz
PSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5Eb2VzIGFueW9uZSBr
bm93IG9mIHRoaXMgaXNzdWUgb3IgYW0gSSBtaXNzaW5nIGFueSBrZXJuZWwgY29uZmlndXJhdGlv
bj88bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHls
ZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPlJlZ2FyZHM8bzpw
PjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOjExLjBwdCI+LVZpamF5PG86cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8L2Jv
ZHk+DQo8L2h0bWw+DQo=

--_000_B0EC058FD2E240BE932CE8532585580Afbcom_--
