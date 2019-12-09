Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D184117960
	for <lists+openbmc@lfdr.de>; Mon,  9 Dec 2019 23:32:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47WycZ37kmzDqRs
	for <lists+openbmc@lfdr.de>; Tue, 10 Dec 2019 09:32:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=72461f3461=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="gP0XOLDr"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="V6mvsxWg"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Wybj3NTqzDqRq
 for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2019 09:31:43 +1100 (AEDT)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id xB9MUExW005693;
 Mon, 9 Dec 2019 14:31:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : mime-version; s=facebook;
 bh=3y8+MVLUfoL9dNXCGVc9dwwcx0QBJxkwG1r+UPN3KXM=;
 b=gP0XOLDrXbzmCNLwC6e0MtMLbCc5ruPP+sQxj6guIwuF0sEghciOIfWRzdCgWvzmTYrc
 QOKB+EAIah1Dk1hHeYP7bkd2GPP7P6ZmnOJd8VRScr/HaX2+ZTElkuf/cXJDan/u6h+8
 Vm3Qi1PtQcnFT4gOCUb8x+zzReQZ2vpVr7s= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by m0089730.ppops.net with ESMTP id 2wrvdyfhjq-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 09 Dec 2019 14:31:39 -0800
Received: from prn-mbx05.TheFacebook.com (2620:10d:c081:6::19) by
 prn-hub01.TheFacebook.com (2620:10d:c081:35::125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 9 Dec 2019 14:31:37 -0800
Received: from prn-hub01.TheFacebook.com (2620:10d:c081:35::125) by
 prn-mbx05.TheFacebook.com (2620:10d:c081:6::19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 9 Dec 2019 14:31:37 -0800
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Mon, 9 Dec 2019 14:31:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FnSZjsaYx3cKKDWxOKNgGYPypIqKIU6Az+hEDbsttHUyfowDsoCA9niwnX7T8Vt5ppJgq1jcIrE2OV9etCQSvFRvW9ECzhh96FJ7x7YMJwlPBerAKRyL7TXYBj1tvJz2LSo8GRGA46m+GRwlIvYDTAK3i4wYX2uYz9Q/G1txg/8Ks/N41moOK516UgErgTUsXX6GJNJ25+/7NfbgCzD/LNpTfK+eBvj1ZZhXERRbtIrGVk5OaZIu002ranJ3LVS5BJhoZmgtdqiFSy+LtcHWxp001fLrm/hrQIFG+uhfC1FXGzXWcxFfPfIU3S7+rnxKvFoSXVZosL/4+mD4wjvqjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3y8+MVLUfoL9dNXCGVc9dwwcx0QBJxkwG1r+UPN3KXM=;
 b=JvJLAROCH6fyfCjFVDwZjoP5/A5scE048UF+YwpZMrCgKKsxQpCeM6YLMORrfLFOj5t+38NzVQBJnFw/Zpbn1roNmP8sBtA3mpUC785iRhmOX9l/KcqQjbMIJh+t/Aa7tYnebr4uzUp0cJ70iskJnz4o6lkVEE8JllZl5iZpPkwYWh1oJnvhmgsRsmIJPMbFkLDIfPjgh/GCkQ3zAyAU+bn002SaX6x7vBI1B9eUuwMYGUALNpzsIiRwXdLtikA0gnNlG5XNKxUnPo2u7y27ofLcjyY/1E3xtP2m1i+4SRMzE0P4vbNgm0LKye94C/1tx1bIegL1dV0QuLKL7mRRkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3y8+MVLUfoL9dNXCGVc9dwwcx0QBJxkwG1r+UPN3KXM=;
 b=V6mvsxWg6ZzGI/g9wMJqP8DI1sxQCYXHnAbjcMX9jm9D5jP1JDy0yJ2LQV1gjcktaKP/wOE6Ri1DSVsb0kLdbeheVvNTAYFI6Dl7yGvIQgSSiNHfde+ovxIWM47ABSYAmCUY9lp8W/t5lSylHAe5M/vl1JJJW843dNvMKgVJR54=
Received: from MWHPR15MB1597.namprd15.prod.outlook.com (10.173.234.137) by
 MWHPR15MB1165.namprd15.prod.outlook.com (10.175.3.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.13; Mon, 9 Dec 2019 22:31:36 +0000
Received: from MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2]) by MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2%8]) with mapi id 15.20.2516.018; Mon, 9 Dec 2019
 22:31:36 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Joel Stanley <joel@jms.id.au>
Subject: IPMB patches
Thread-Topic: IPMB patches
Thread-Index: AQHVruBqvCK8kK3X30SslesFphGVvA==
Date: Mon, 9 Dec 2019 22:31:36 +0000
Message-ID: <C951B965-12B4-4D69-B13F-B463FC3986C7@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::8c7e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2fa3ac9d-c203-4355-b446-08d77cf78d2e
x-ms-traffictypediagnostic: MWHPR15MB1165:
x-microsoft-antispam-prvs: <MWHPR15MB1165503A0EE021DA383AA6BADD580@MWHPR15MB1165.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 02462830BE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(376002)(39860400002)(136003)(346002)(189003)(199004)(64756008)(66446008)(66556008)(86362001)(6512007)(4326008)(76116006)(66946007)(66476007)(558084003)(36756003)(6916009)(5660300002)(6486002)(9326002)(966005)(6506007)(478600001)(8936002)(33656002)(8676002)(221733001)(81166006)(2616005)(186003)(7116003)(71190400001)(316002)(3480700005)(81156014)(71200400001)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1165;
 H:MWHPR15MB1597.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bgG6Xe1RqAZ4msX2dHJa1XdOlAdhcM90/DVNhpg0qi6K+S3B2CuhwyrW+ym9cQMMS+tdne8Pjdz12EKYzCuSb95q0hfBCQeo20+yKfLQUW7A2Sk8HVxQ4lK9VD/2dIFbwdGoiWogG0qqDAuYdBcvby7khNRdefdpH2JVeDZ2Pog85gVpd2/phkceVAAPBcxv+5SwOZ4LTABh5mMhdcbR25f+ULgyAFC7MQbzmfnQau0lRJB0iECD6ZO8wA/ltxl+XyRK5zwRCwjpmmlnBMm39kYWLtWsHix4d9nY/EGtjWdZbbNVb/OunN7jAl1pVVwhdPd+ZGLtVsJgGp9Ok5kygADe/yXk+wyh7107b4pJzyvrSJ+XqtFmOGxuLVWpnc2ZxFccb5FKO5re7DQsl/39+AbQNi6c6gv6qXgwQYwRPrjHdeTvwsxhamzYbaCJAFL5QwZr/mAKbt0YDK/2GKh1jGpVLAC1FNSXYR5AkLJfYHc=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_C951B96512B44D69B13FB463FC3986C7fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa3ac9d-c203-4355-b446-08d77cf78d2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2019 22:31:36.1590 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JQVR4c2zQiZBy6MOz7R6xZoTeFQTLbRHTrWWmkL/MsrvgXsKJwt12RoRRMJfQeJBoCsFwjvgHGpH35i2AvwhzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1165
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-09_05:2019-12-09,2019-12-09 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 lowpriorityscore=0
 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=537 spamscore=0 impostorscore=0 adultscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912090178
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_C951B96512B44D69B13FB463FC3986C7fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgSm9lbCwNCkNhbiB5b3UgcGxlYXNlIHB1bGwgYmVsb3cgMyBJUE1CIHBhdGNoZXMgdG8gTEYg
b3BlbmJtYyBrZXJuZWwgdHJlZS4NCg0KaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wYXRj
aC8xMTk1MjM2LzxodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0
cHMtM0FfX2V1cjAzLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tXy0zRnVybC0zRGh0
dHBzLTI1M0EtMjUyRi0yNTJGcGF0Y2h3b3JrLm96bGFicy5vcmctMjUyRnBhdGNoLTI1MkYxMTk1
MjM2LTI1MkYtMjZkYXRhLTNEMDItMjU3QzAxLTI1N0NBc21hYS0yNTQwbWVsbGFub3guY29tLTI1
N0NmMzU0YjRiYTIzYzM0NzNjMmFmNzA4ZDc2ZDFhMjQzMi0yNTdDYTY1Mjk3MWM3ZDJlNGQ5YmE2
YTRkMTQ5MjU2ZjQ2MWItMjU3QzAtMjU3QzAtMjU3QzYzNzA5NzgzMTM1MTk5NjkyNS0yNnNkYXRh
LTNEZ0hGTGxVRUdXYmJXS0MwZTRmV2VadXBTOHJTdXlXWjVURFNIbXlEZXlDUS0yNTNELTI2cmVz
ZXJ2ZWQtM0QwJmQ9RHdNR2FRJmM9NVZEMFJUdE5sVGgzeWNkNDFiM01VdyZyPXY5TVUwS2k5cFdu
VFhDV3dqSFBWZ3BuQ1I4MHZYa2tjcklhcVU3VVNsNWcmbT1vb2hXRDZIQlVWUWl2ZlZMbF9raUpV
alM0bVh4ZGRiNTF0VEFzdXAtYnVFJnM9d0QzRTBJY0VhQ3JuNGFUMl9qWW5QOVM5NU9FbEJSS3FU
TTBTZXNKTFhxRSZlPT4NCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcGF0Y2gvMTE5MDYw
My88aHR0cHM6Ly91cmxkZWZlbnNlLnByb29mcG9pbnQuY29tL3YyL3VybD91PWh0dHBzLTNBX19l
dXIwMy5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbV8tM0Z1cmwtM0RodHRwcy0yNTNB
LTI1MkYtMjUyRnBhdGNod29yay5vemxhYnMub3JnLTI1MkZwYXRjaC0yNTJGMTE5MDYwMy0yNTJG
LTI2ZGF0YS0zRDAyLTI1N0MwMS0yNTdDQXNtYWEtMjU0MG1lbGxhbm94LmNvbS0yNTdDZjM1NGI0
YmEyM2MzNDczYzJhZjcwOGQ3NmQxYTI0MzItMjU3Q2E2NTI5NzFjN2QyZTRkOWJhNmE0ZDE0OTI1
NmY0NjFiLTI1N0MwLTI1N0MwLTI1N0M2MzcwOTc4MzEzNTE5OTY5MjUtMjZzZGF0YS0zRC0yNTJG
Zi0yNTJCZDR0cWt2RjdoUnd2TTc1VFp5bUp2RDlYSVJCNjliRkt2cjF0b2R6US0yNTNELTI2cmVz
ZXJ2ZWQtM0QwJmQ9RHdNR2FRJmM9NVZEMFJUdE5sVGgzeWNkNDFiM01VdyZyPXY5TVUwS2k5cFdu
VFhDV3dqSFBWZ3BuQ1I4MHZYa2tjcklhcVU3VVNsNWcmbT1vb2hXRDZIQlVWUWl2ZlZMbF9raUpV
alM0bVh4ZGRiNTF0VEFzdXAtYnVFJnM9Ung0M19vUU1RbmVScWNuVC1idVdKZ3pOZkpQV0kzZFJ0
QTRIelZWSzFYTSZlPT4NCg0KaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wYXRjaC8xMTkz
Mjk5LzxodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cHMtM0Ff
X2V1cjAzLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tXy0zRnVybC0zRGh0dHBzLTI1
M0EtMjUyRi0yNTJGcGF0Y2h3b3JrLm96bGFicy5vcmctMjUyRnBhdGNoLTI1MkYxMTkzMjk5LTI1
MkYtMjZkYXRhLTNEMDItMjU3QzAxLTI1N0NBc21hYS0yNTQwbWVsbGFub3guY29tLTI1N0NmMzU0
YjRiYTIzYzM0NzNjMmFmNzA4ZDc2ZDFhMjQzMi0yNTdDYTY1Mjk3MWM3ZDJlNGQ5YmE2YTRkMTQ5
MjU2ZjQ2MWItMjU3QzAtMjU3QzAtMjU3QzYzNzA5NzgzMTM1MjAwNjkyMC0yNnNkYXRhLTNEMklL
VUdmQndkeVljSHJoN2lVSkVBTGpra2ktMjUyQldJY3JibGZINkZSRmRJbTQtMjUzRC0yNnJlc2Vy
dmVkLTNEMCZkPUR3TUdhUSZjPTVWRDBSVHRObFRoM3ljZDQxYjNNVXcmcj12OU1VMEtpOXBXblRY
Q1d3akhQVmdwbkNSODB2WGtrY3JJYXFVN1VTbDVnJm09b29oV0Q2SEJVVlFpdmZWTGxfa2lKVWpT
NG1YeGRkYjUxdFRBc3VwLWJ1RSZzPUF0TENqYmFJZU4tX3VlQzBQZldkWmVtcFhLSDFWanRFOFlI
bVB1TzFoVEEmZT0+DQoNClJlZ2FyZHMNCi1WaWpheQ0K

--_000_C951B96512B44D69B13FB463FC3986C7fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <C098A9D24FE6694C8242FB0A73520181@namprd15.prod.outlook.com>
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
emU6MTEuMHB0Ij5IaSBKb2VsLDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5DYW4geW91IHBsZWFzZSBwdWxs
IGJlbG93IDMgSVBNQiBwYXRjaGVzIHRvIExGIG9wZW5ibWMga2VybmVsIHRyZWUuPG86cD48L286
cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6
ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPjxzcGFuIHN0eWxlPSJjb2xvcjpibGFjayI+PGEgaHJlZj0iaHR0cHM6Ly91cmxkZWZlbnNl
LnByb29mcG9pbnQuY29tL3YyL3VybD91PWh0dHBzLTNBX19ldXIwMy5zYWZlbGlua3MucHJvdGVj
dGlvbi5vdXRsb29rLmNvbV8tM0Z1cmwtM0RodHRwcy0yNTNBLTI1MkYtMjUyRnBhdGNod29yay5v
emxhYnMub3JnLTI1MkZwYXRjaC0yNTJGMTE5NTIzNi0yNTJGLTI2ZGF0YS0zRDAyLTI1N0MwMS0y
NTdDQXNtYWEtMjU0MG1lbGxhbm94LmNvbS0yNTdDZjM1NGI0YmEyM2MzNDczYzJhZjcwOGQ3NmQx
YTI0MzItMjU3Q2E2NTI5NzFjN2QyZTRkOWJhNmE0ZDE0OTI1NmY0NjFiLTI1N0MwLTI1N0MwLTI1
N0M2MzcwOTc4MzEzNTE5OTY5MjUtMjZzZGF0YS0zRGdIRkxsVUVHV2JiV0tDMGU0ZldlWnVwUzhy
U3V5V1o1VERTSG15RGV5Q1EtMjUzRC0yNnJlc2VydmVkLTNEMCZhbXA7ZD1Ed01HYVEmYW1wO2M9
NVZEMFJUdE5sVGgzeWNkNDFiM01VdyZhbXA7cj12OU1VMEtpOXBXblRYQ1d3akhQVmdwbkNSODB2
WGtrY3JJYXFVN1VTbDVnJmFtcDttPW9vaFdENkhCVVZRaXZmVkxsX2tpSlVqUzRtWHhkZGI1MXRU
QXN1cC1idUUmYW1wO3M9d0QzRTBJY0VhQ3JuNGFUMl9qWW5QOVM5NU9FbEJSS3FUTTBTZXNKTFhx
RSZhbXA7ZT0iPjxzcGFuIHN0eWxlPSJjb2xvcjojMDQ0QTkxIj5odHRwczovL3BhdGNod29yay5v
emxhYnMub3JnL3BhdGNoLzExOTUyMzYvPC9zcGFuPjwvYT48bzpwPjwvbzpwPjwvc3Bhbj48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0iY2FyZXQtY29sb3I6IHJnYigwLCAwLCAwKTtm
b250LXZhcmlhbnQtY2Fwczogbm9ybWFsO29ycGhhbnM6IGF1dG87dGV4dC1hbGlnbjpzdGFydDt3
aWRvd3M6IGF1dG87LXdlYmtpdC10ZXh0LXNpemUtYWRqdXN0OiBhdXRvOy13ZWJraXQtdGV4dC1z
dHJva2Utd2lkdGg6IDBweDt3b3JkLXNwYWNpbmc6MHB4Ij4NCjxzcGFuIHN0eWxlPSJjb2xvcjpi
bGFjayI+PGEgaHJlZj0iaHR0cHM6Ly91cmxkZWZlbnNlLnByb29mcG9pbnQuY29tL3YyL3VybD91
PWh0dHBzLTNBX19ldXIwMy5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbV8tM0Z1cmwt
M0RodHRwcy0yNTNBLTI1MkYtMjUyRnBhdGNod29yay5vemxhYnMub3JnLTI1MkZwYXRjaC0yNTJG
MTE5MDYwMy0yNTJGLTI2ZGF0YS0zRDAyLTI1N0MwMS0yNTdDQXNtYWEtMjU0MG1lbGxhbm94LmNv
bS0yNTdDZjM1NGI0YmEyM2MzNDczYzJhZjcwOGQ3NmQxYTI0MzItMjU3Q2E2NTI5NzFjN2QyZTRk
OWJhNmE0ZDE0OTI1NmY0NjFiLTI1N0MwLTI1N0MwLTI1N0M2MzcwOTc4MzEzNTE5OTY5MjUtMjZz
ZGF0YS0zRC0yNTJGZi0yNTJCZDR0cWt2RjdoUnd2TTc1VFp5bUp2RDlYSVJCNjliRkt2cjF0b2R6
US0yNTNELTI2cmVzZXJ2ZWQtM0QwJmFtcDtkPUR3TUdhUSZhbXA7Yz01VkQwUlR0TmxUaDN5Y2Q0
MWIzTVV3JmFtcDtyPXY5TVUwS2k5cFduVFhDV3dqSFBWZ3BuQ1I4MHZYa2tjcklhcVU3VVNsNWcm
YW1wO209b29oV0Q2SEJVVlFpdmZWTGxfa2lKVWpTNG1YeGRkYjUxdFRBc3VwLWJ1RSZhbXA7cz1S
eDQzX29RTVFuZVJxY25ULWJ1V0pnek5mSlBXSTNkUnRBNEh6VlZLMVhNJmFtcDtlPSI+PHNwYW4g
c3R5bGU9ImNvbG9yOiMwNDRBOTEiPmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcGF0Y2gv
MTE5MDYwMy88L3NwYW4+PC9hPjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiIHN0eWxlPSJjYXJldC1jb2xvcjogcmdiKDAsIDAsIDApO2ZvbnQtdmFyaWFudC1jYXBz
OiBub3JtYWw7b3JwaGFuczogYXV0bzt0ZXh0LWFsaWduOnN0YXJ0O3dpZG93czogYXV0bzstd2Vi
a2l0LXRleHQtc2l6ZS1hZGp1c3Q6IGF1dG87LXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4
O3dvcmQtc3BhY2luZzowcHgiPg0KPHNwYW4gc3R5bGU9ImNvbG9yOmJsYWNrIj4mbmJzcDs8bzpw
PjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0iY2FyZXQtY29s
b3I6IHJnYigwLCAwLCAwKTtmb250LXZhcmlhbnQtY2Fwczogbm9ybWFsO29ycGhhbnM6IGF1dG87
dGV4dC1hbGlnbjpzdGFydDt3aWRvd3M6IGF1dG87LXdlYmtpdC10ZXh0LXNpemUtYWRqdXN0OiBh
dXRvOy13ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6IDBweDt3b3JkLXNwYWNpbmc6MHB4Ij4NCjxz
cGFuIHN0eWxlPSJjb2xvcjpibGFjayI+PGEgaHJlZj0iaHR0cHM6Ly91cmxkZWZlbnNlLnByb29m
cG9pbnQuY29tL3YyL3VybD91PWh0dHBzLTNBX19ldXIwMy5zYWZlbGlua3MucHJvdGVjdGlvbi5v
dXRsb29rLmNvbV8tM0Z1cmwtM0RodHRwcy0yNTNBLTI1MkYtMjUyRnBhdGNod29yay5vemxhYnMu
b3JnLTI1MkZwYXRjaC0yNTJGMTE5MzI5OS0yNTJGLTI2ZGF0YS0zRDAyLTI1N0MwMS0yNTdDQXNt
YWEtMjU0MG1lbGxhbm94LmNvbS0yNTdDZjM1NGI0YmEyM2MzNDczYzJhZjcwOGQ3NmQxYTI0MzIt
MjU3Q2E2NTI5NzFjN2QyZTRkOWJhNmE0ZDE0OTI1NmY0NjFiLTI1N0MwLTI1N0MwLTI1N0M2Mzcw
OTc4MzEzNTIwMDY5MjAtMjZzZGF0YS0zRDJJS1VHZkJ3ZHlZY0hyaDdpVUpFQUxqa2tpLTI1MkJX
SWNyYmxmSDZGUkZkSW00LTI1M0QtMjZyZXNlcnZlZC0zRDAmYW1wO2Q9RHdNR2FRJmFtcDtjPTVW
RDBSVHRObFRoM3ljZDQxYjNNVXcmYW1wO3I9djlNVTBLaTlwV25UWENXd2pIUFZncG5DUjgwdlhr
a2NySWFxVTdVU2w1ZyZhbXA7bT1vb2hXRDZIQlVWUWl2ZlZMbF9raUpValM0bVh4ZGRiNTF0VEFz
dXAtYnVFJmFtcDtzPUF0TENqYmFJZU4tX3VlQzBQZldkWmVtcFhLSDFWanRFOFlIbVB1TzFoVEEm
YW1wO2U9Ij48c3BhbiBzdHlsZT0iY29sb3I6IzA0NEE5MSI+aHR0cHM6Ly9wYXRjaHdvcmsub3ps
YWJzLm9yZy9wYXRjaC8xMTkzMjk5Lzwvc3Bhbj48L2E+PG86cD48L286cD48L3NwYW4+PC9wPg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+
Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxl
PSJmb250LXNpemU6MTEuMHB0Ij5SZWdhcmRzPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPi1WaWpheTxvOnA+
PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_C951B96512B44D69B13FB463FC3986C7fbcom_--
