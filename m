Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5291B6575
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 22:34:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497TYM4vRgzDr5Z
	for <lists+openbmc@lfdr.de>; Fri, 24 Apr 2020 06:34:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=1382a73f5b=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=FZ9gMoxr; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=Dmve/TJS; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497TXZ5xLCzDqrs
 for <openbmc@lists.ozlabs.org>; Fri, 24 Apr 2020 06:33:32 +1000 (AEST)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03NIsCQ0012986
 for <openbmc@lists.ozlabs.org>; Thu, 23 Apr 2020 12:08:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=NdG70NuIFwP0U+4mvVCy/1FvIc0mfBggiEHOnZd2uWc=;
 b=FZ9gMoxrYkmfE6pJj5tg+oYDY4HnQrakuBvvY4Qe6tu0Cjr3ohdbTHQxCIo40NMrKXJ9
 crYcEYgSvWIgy9i+PyfPjBRXvs/jFe/QLHTCd8vLmrDxdsE8QPjTWrSjDwxCLH1Y8Ayb
 5t7SHW/lI9lAqE/UeTnz4TqVSFuCYxdO6BY= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 30jtc5qdp1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 23 Apr 2020 12:08:16 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.103) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Thu, 23 Apr 2020 12:08:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0lICctqo8fAl0vvvJGBxi0nA9MhDrGpsf7egsvs2YQlSWgbjCRwBI7MvO0D0dH7Bwsf2kslpgPMlz6HB6jBJ9t2AC3dLEbLeUZfs1pYpe5KWZwYsqukwAX2KE4DtHeGRlpxHrOt6qgRsmh+v+j/u2vXcJoxUmqFu25faAGJCxdBmCDE7D8nv4NKTO7XjwWQkWvJlhZLd2NDFZYXoHqHi5xvdWfL6gX3GxjFAk77Fq4fO+/1chty17ES6EHaRDQjnvCr64/9cIQeiMSN17+ZvqwhXO90+uKZRcl0vw4VN0jya3yU3/u+CyKNeEykEJ4SvBQ9PTbEJP+V5fRQjmF9sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdG70NuIFwP0U+4mvVCy/1FvIc0mfBggiEHOnZd2uWc=;
 b=XWmlwqc8qBqdwe9mZ7FsRVpnXOz2e+k/fu99FSRhnXhrsEgQn/QugE0ro2l5uQYUSaAcqyQ/0D12p1cjJh/4ouYJvawADCKcpiRUkfKb0YKLw/CSUgWBejMvjLGfrQFidC+/MiP8W2Ouk/ypZO5KHXgPpUJP/KWOCC13lM5z54AWdb8HEWW0AyED8naEW9Ubz/yNJFq1tXl+YM8eeIMtLUUOntQxqEnvNrRtrStDvtSi7+RJpYbkCWprYGj26g3LHEEoJq+KVzrlgJ8GWztdHq9jv5BY+x7G3C/y1gEYI+XOL4rjPQHZosDVG/C7+tirErxw7/6hV+BhCVx8Qmu83Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdG70NuIFwP0U+4mvVCy/1FvIc0mfBggiEHOnZd2uWc=;
 b=Dmve/TJSITtpJ4B58sMA+qRiZ/diS5RVuoxaDpEfoUaDJYw/FFF4LQDRtcRKuj0PVQVn6P1H/plNSMwAeQkYzsnfl1A4SKEXKJ+J9B4mz6kNAuoTnrI0irmuUBiXcj2gGRPlbilZ9Ue0fKFQgAXTl/xGSoKzgOvGpvE3NFt0cc4=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2693.namprd15.prod.outlook.com (2603:10b6:a03:155::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.27; Thu, 23 Apr
 2020 19:08:14 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4%3]) with mapi id 15.20.2921.030; Thu, 23 Apr 2020
 19:08:14 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Pulling some patch to openbmc
Thread-Topic: Pulling some patch to openbmc
Thread-Index: AQHWGaKKFbK4KEuxdEWAvSUobrQvbg==
Date: Thu, 23 Apr 2020 19:08:14 +0000
Message-ID: <9AA023EE-D6BB-4385-B29A-675968E66B5C@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:6774]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae8ef8ea-4569-41b3-8b90-08d7e7b9ac92
x-ms-traffictypediagnostic: BYAPR15MB2693:
x-microsoft-antispam-prvs: <BYAPR15MB26935D33892EE3EC893408BEDDD30@BYAPR15MB2693.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 03827AF76E
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(396003)(376002)(39860400002)(346002)(366004)(136003)(81156014)(186003)(8676002)(316002)(91956017)(66476007)(33656002)(2616005)(36756003)(8936002)(66556008)(86362001)(64756008)(66446008)(6506007)(6916009)(2906002)(4744005)(478600001)(6512007)(9326002)(76116006)(71200400001)(5660300002)(6486002)(66946007);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G2Ig0BWB9MV1vZAvTAKkxypKZ0PlK+jk+zBRM7ijbat8DiHbDPVYRH63IqAJJaDTk2Tpql6knRZtilMZazFhJE5AfnVGrZpYc+8/LrWqy/fgJifeKz7o4YbssCynXyrO637n4nQlyTf5mfud9r3YG6/GVsmaZ9wROANxgfHPley+TFUsg8sqQPUC1lG9xESfgZCjOKfvLTqBqWU93T7LjKbKidQ3YgCjmpTzgWQ9OPvMfmx6guDmMkKT14QAH2wiLkI4qvn8Zn7iCoxHGrRgekqAWIWLJGMJSu5oJzBGXCKbU2CSMbpIeaxwv7gqA3LB5tGAPgOHofHZDWC8CPUBARxUHNjhFIa914p7FYbI0bnKhWAzzVzOvwita372gwfH/U6I/I204PlMSFiuhwwxKUMvfOO5c03n+Pbq6XMb861qSNLSs3e87NQXUbesSrEo
x-ms-exchange-antispam-messagedata: 2OnIHGcDJPfTd382FE5J4tDAce5bbiK9TfStA4Gl+nd1nCYAZNz3ET6JPY1moOO8NryD0N+1QdcXj2gMZaQCjmToXMgtswN2UxcNktP5u7QEAvt1vA9kwyQarWezcvuD1g7dbgVPjXeGrcHlOOZyMnAwYlyorDtFMqlMegJXEISy+kS8NLE7b48e0BRyyUk5
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_9AA023EED6BB4385B29A675968E66B5Cfbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ae8ef8ea-4569-41b3-8b90-08d7e7b9ac92
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2020 19:08:14.5796 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 11NGYJiBS801uSJowAbh4f6revsxUL6IDLxiPptEfFw6aBhmvVgKkwG6kFjGjbqzPABv6zPaUTLBwxk+tnlVpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2693
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-23_13:2020-04-23,
 2020-04-23 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004230145
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

--_000_9AA023EED6BB4385B29A675968E66B5Cfbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgSm9lbCwNCkNhbiB5b3UgcGxlYXNlIHB1bGwgYmVsb3cgMiBwYXRjaGVzIHRvIG9wZW5ibWMv
bGludXguDQoNCg0KY29tbWl0IDVjMWEwYzNkYjhhNDc1N2EwMDBjNzRhNThjMTYyOGRlNmRhMDNl
NWENCg0KQXV0aG9yOiBWaWpheSBLaGVta2EgPHZpamF5a2hlbWthQGZiLmNvbT4NCg0KRGF0ZTog
ICBNb24gSmFuIDI3IDE3OjE4OjE3IDIwMjAgLTA4MDANCg0KDQoNCiAgICBBUk06IGR0czogYXNw
ZWVkOiB0aW9nYXBhc3M6IEFkZCBncGlvIGxpbmUgbmFtZXMNCg0KDQoNCiAgICBBZGRlZCBHUElP
IGxpbmUgbmFtZXMgZm9yIGFsbCBncGlvIHVzZWQgaW4gdGlvZ2FwYXNzIHBsYXRmb3JtLA0KDQog
ICAgdGhlc2UgbGluZSBuYW1lcyB3aWxsIGJlIHVzZWQgYnkgbGliZ3Bpb2QgdG8gY29udHJvbCBH
UElPcw0KDQoNCg0KICAgIFNpZ25lZC1vZmYtYnk6IFZpamF5IEtoZW1rYSA8dmlqYXlraGVta2FA
ZmIuY29tPg0KDQogICAgUmV2aWV3ZWQtYnk6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+
DQoNCiAgICBTaWduZWQtb2ZmLWJ5OiBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1Pg0KDQoN
Cg0KY29tbWl0IDg0ZjIzOGMyNzQwNmM1NWYxODBjZTNkOTNhN2RlZmM0ZjA0NDI4OWUNCg0KQXV0
aG9yOiBWaWpheSBLaGVta2EgPHZpamF5a2hlbWthQGZiLmNvbT4NCg0KRGF0ZTogICBNb24gSmFu
IDI3IDE3OjE3OjI4IDIwMjAgLTA4MDANCg0KDQoNCiAgICBBUk06IGR0czogYXNwZWVkOiB0aW9n
YXBhc3M6IEFkZCBJUE1CIGRldmljZQ0KDQoNCg0KICAgIEFkZGluZyBJUE1CIGRldmljZXMgZm9y
IGZhY2Vib29rIHRpb2dhcGFzcyBwbGF0Zm9ybS4NCg0KDQoNCiAgICBTaWduZWQtb2ZmLWJ5OiBW
aWpheSBLaGVta2EgPHZpamF5a2hlbWthQGZiLmNvbT4NCg0KICAgIFJldmlld2VkLWJ5OiBKb2Vs
IFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1Pg0KDQogICAgU2lnbmVkLW9mZi1ieTogSm9lbCBTdGFu
bGV5IDxqb2VsQGptcy5pZC5hdT4NCg0KUmVnYXJkcw0KLVZpamF5DQo=

--_000_9AA023EED6BB4385B29A675968E66B5Cfbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <644B061118148A49BF920E2DF1965487@namprd15.prod.outlook.com>
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
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5Ok1lbmxvOw0K
CXBhbm9zZS0xOjIgMTEgNiA5IDMgOCA0IDIgMiA0O30NCi8qIFN0eWxlIERlZmluaXRpb25zICov
DQpwLk1zb05vcm1hbCwgbGkuTXNvTm9ybWFsLCBkaXYuTXNvTm9ybWFsDQoJe21hcmdpbjowaW47
DQoJbWFyZ2luLWJvdHRvbTouMDAwMXB0Ow0KCWZvbnQtc2l6ZToxMi4wcHQ7DQoJZm9udC1mYW1p
bHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0Kc3Bhbi5FbWFpbFN0eWxlMTcNCgl7bXNvLXN0eWxl
LXR5cGU6cGVyc29uYWwtY29tcG9zZTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJp
ZjsNCgljb2xvcjp3aW5kb3d0ZXh0O30NCnAucDEsIGxpLnAxLCBkaXYucDENCgl7bXNvLXN0eWxl
LW5hbWU6cDE7DQoJbWFyZ2luOjBpbjsNCgltYXJnaW4tYm90dG9tOi4wMDAxcHQ7DQoJZm9udC1z
aXplOjguNXB0Ow0KCWZvbnQtZmFtaWx5Ok1lbmxvOw0KCWNvbG9yOiNBQUFCMjU7fQ0KcC5wMiwg
bGkucDIsIGRpdi5wMg0KCXttc28tc3R5bGUtbmFtZTpwMjsNCgltYXJnaW46MGluOw0KCW1hcmdp
bi1ib3R0b206LjAwMDFwdDsNCglmb250LXNpemU6OC41cHQ7DQoJZm9udC1mYW1pbHk6TWVubG87
DQoJY29sb3I6YmxhY2s7fQ0KcC5wMywgbGkucDMsIGRpdi5wMw0KCXttc28tc3R5bGUtbmFtZTpw
MzsNCgltYXJnaW46MGluOw0KCW1hcmdpbi1ib3R0b206LjAwMDFwdDsNCglmb250LXNpemU6OC41
cHQ7DQoJZm9udC1mYW1pbHk6TWVubG87DQoJY29sb3I6YmxhY2s7fQ0Kc3Bhbi5zMQ0KCXttc28t
c3R5bGUtbmFtZTpzMTt9DQpzcGFuLmFwcGxlLWNvbnZlcnRlZC1zcGFjZQ0KCXttc28tc3R5bGUt
bmFtZTphcHBsZS1jb252ZXJ0ZWQtc3BhY2U7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxl
LXR5cGU6ZXhwb3J0LW9ubHk7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0K
QHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41aW4gMTEuMGluOw0KCW1hcmdpbjoxLjBpbiAx
LjBpbiAxLjBpbiAxLjBpbjt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6V29yZFNlY3Rpb24x
O30NCi0tPjwvc3R5bGU+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJFTi1VUyIgbGluaz0iIzA1NjND
MSIgdmxpbms9IiM5NTRGNzIiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNz
PSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5IaSBKb2VsLDxvOnA+
PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250
LXNpemU6MTEuMHB0Ij5DYW4geW91IHBsZWFzZSBwdWxsIGJlbG93IDIgcGF0Y2hlcyB0byBvcGVu
Ym1jL2xpbnV4LjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxz
cGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+
DQo8cCBjbGFzcz0icDEiPjxzcGFuIGNsYXNzPSJzMSI+Y29tbWl0IDVjMWEwYzNkYjhhNDc1N2Ew
MDBjNzRhNThjMTYyOGRlNmRhMDNlNWE8L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0i
cDIiPjxzcGFuIGNsYXNzPSJzMSI+QXV0aG9yOiBWaWpheSBLaGVta2EgJmx0O3ZpamF5a2hlbWth
QGZiLmNvbSZndDs8L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0icDIiPjxzcGFuIGNs
YXNzPSJzMSI+RGF0ZTogPC9zcGFuPjxzcGFuIGNsYXNzPSJhcHBsZS1jb252ZXJ0ZWQtc3BhY2Ui
PiZuYnNwOw0KPC9zcGFuPjxzcGFuIGNsYXNzPSJzMSI+TW9uIEphbiAyNyAxNzoxODoxNyAyMDIw
IC0wODAwPC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9InAzIj48bzpwPiZuYnNwOzwv
bzpwPjwvcD4NCjxwIGNsYXNzPSJwMiI+PHNwYW4gY2xhc3M9ImFwcGxlLWNvbnZlcnRlZC1zcGFj
ZSI+Jm5ic3A7ICZuYnNwOyA8L3NwYW4+PHNwYW4gY2xhc3M9InMxIj5BUk06IGR0czogYXNwZWVk
OiB0aW9nYXBhc3M6IEFkZCBncGlvIGxpbmUgbmFtZXM8L3NwYW4+PG86cD48L286cD48L3A+DQo8
cCBjbGFzcz0icDMiPjxzcGFuIGNsYXNzPSJhcHBsZS1jb252ZXJ0ZWQtc3BhY2UiPiZuYnNwOyZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOzwvc3Bhbj48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNz
PSJwMiI+PHNwYW4gY2xhc3M9ImFwcGxlLWNvbnZlcnRlZC1zcGFjZSI+Jm5ic3A7ICZuYnNwOyA8
L3NwYW4+PHNwYW4gY2xhc3M9InMxIj5BZGRlZCBHUElPIGxpbmUgbmFtZXMgZm9yIGFsbCBncGlv
IHVzZWQgaW4gdGlvZ2FwYXNzIHBsYXRmb3JtLDwvc3Bhbj48bzpwPjwvbzpwPjwvcD4NCjxwIGNs
YXNzPSJwMiI+PHNwYW4gY2xhc3M9ImFwcGxlLWNvbnZlcnRlZC1zcGFjZSI+Jm5ic3A7ICZuYnNw
OyA8L3NwYW4+PHNwYW4gY2xhc3M9InMxIj50aGVzZSBsaW5lIG5hbWVzIHdpbGwgYmUgdXNlZCBi
eSBsaWJncGlvZCB0byBjb250cm9sIEdQSU9zPC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xh
c3M9InAzIj48c3BhbiBjbGFzcz0iYXBwbGUtY29udmVydGVkLXNwYWNlIj4mbmJzcDsmbmJzcDsg
Jm5ic3A7PC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9InAyIj48c3BhbiBjbGFzcz0i
YXBwbGUtY29udmVydGVkLXNwYWNlIj4mbmJzcDsgJm5ic3A7IDwvc3Bhbj48c3BhbiBjbGFzcz0i
czEiPlNpZ25lZC1vZmYtYnk6IFZpamF5IEtoZW1rYSAmbHQ7dmlqYXlraGVta2FAZmIuY29tJmd0
Ozwvc3Bhbj48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJwMiI+PHNwYW4gY2xhc3M9ImFwcGxl
LWNvbnZlcnRlZC1zcGFjZSI+Jm5ic3A7ICZuYnNwOyA8L3NwYW4+PHNwYW4gY2xhc3M9InMxIj5S
ZXZpZXdlZC1ieTogSm9lbCBTdGFubGV5ICZsdDtqb2VsQGptcy5pZC5hdSZndDs8L3NwYW4+PG86
cD48L286cD48L3A+DQo8cCBjbGFzcz0icDIiPjxzcGFuIGNsYXNzPSJhcHBsZS1jb252ZXJ0ZWQt
c3BhY2UiPiZuYnNwOyAmbmJzcDsgPC9zcGFuPjxzcGFuIGNsYXNzPSJzMSI+U2lnbmVkLW9mZi1i
eTogSm9lbCBTdGFubGV5ICZsdDtqb2VsQGptcy5pZC5hdSZndDs8L3NwYW4+PG86cD48L286cD48
L3A+DQo8cCBjbGFzcz0icDMiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9InAxIj48
c3BhbiBjbGFzcz0iczEiPmNvbW1pdCA4NGYyMzhjMjc0MDZjNTVmMTgwY2UzZDkzYTdkZWZjNGYw
NDQyODllPC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9InAyIj48c3BhbiBjbGFzcz0i
czEiPkF1dGhvcjogVmlqYXkgS2hlbWthICZsdDt2aWpheWtoZW1rYUBmYi5jb20mZ3Q7PC9zcGFu
PjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9InAyIj48c3BhbiBjbGFzcz0iczEiPkRhdGU6IDwv
c3Bhbj48c3BhbiBjbGFzcz0iYXBwbGUtY29udmVydGVkLXNwYWNlIj4mbmJzcDsNCjwvc3Bhbj48
c3BhbiBjbGFzcz0iczEiPk1vbiBKYW4gMjcgMTc6MTc6MjggMjAyMCAtMDgwMDwvc3Bhbj48bzpw
PjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJwMyI+PHNwYW4gY2xhc3M9ImFwcGxlLWNvbnZlcnRlZC1z
cGFjZSI+Jm5ic3A7Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7PC9zcGFuPjxvOnA+PC9vOnA+
PC9wPg0KPHAgY2xhc3M9InAyIj48c3BhbiBjbGFzcz0iYXBwbGUtY29udmVydGVkLXNwYWNlIj4m
bmJzcDsgJm5ic3A7IDwvc3Bhbj48c3BhbiBjbGFzcz0iczEiPkFSTTogZHRzOiBhc3BlZWQ6IHRp
b2dhcGFzczogQWRkIElQTUIgZGV2aWNlPC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9
InAzIj48c3BhbiBjbGFzcz0iYXBwbGUtY29udmVydGVkLXNwYWNlIj4mbmJzcDsmbmJzcDsgJm5i
c3A7ICZuYnNwOzwvc3Bhbj48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJwMiI+PHNwYW4gY2xh
c3M9ImFwcGxlLWNvbnZlcnRlZC1zcGFjZSI+Jm5ic3A7ICZuYnNwOyA8L3NwYW4+PHNwYW4gY2xh
c3M9InMxIj5BZGRpbmcgSVBNQiBkZXZpY2VzIGZvciBmYWNlYm9vayB0aW9nYXBhc3MgcGxhdGZv
cm0uPC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9InAzIj48c3BhbiBjbGFzcz0iYXBw
bGUtY29udmVydGVkLXNwYWNlIj4mbmJzcDsmbmJzcDsgJm5ic3A7PC9zcGFuPjxvOnA+PC9vOnA+
PC9wPg0KPHAgY2xhc3M9InAyIj48c3BhbiBjbGFzcz0iYXBwbGUtY29udmVydGVkLXNwYWNlIj4m
bmJzcDsgJm5ic3A7IDwvc3Bhbj48c3BhbiBjbGFzcz0iczEiPlNpZ25lZC1vZmYtYnk6IFZpamF5
IEtoZW1rYSAmbHQ7dmlqYXlraGVta2FAZmIuY29tJmd0Ozwvc3Bhbj48bzpwPjwvbzpwPjwvcD4N
CjxwIGNsYXNzPSJwMiI+PHNwYW4gY2xhc3M9ImFwcGxlLWNvbnZlcnRlZC1zcGFjZSI+Jm5ic3A7
ICZuYnNwOyA8L3NwYW4+PHNwYW4gY2xhc3M9InMxIj5SZXZpZXdlZC1ieTogSm9lbCBTdGFubGV5
ICZsdDtqb2VsQGptcy5pZC5hdSZndDs8L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0i
cDIiPjxzcGFuIGNsYXNzPSJhcHBsZS1jb252ZXJ0ZWQtc3BhY2UiPiZuYnNwOyAmbmJzcDsgPC9z
cGFuPjxzcGFuIGNsYXNzPSJzMSI+U2lnbmVkLW9mZi1ieTogSm9lbCBTdGFubGV5ICZsdDtqb2Vs
QGptcy5pZC5hdSZndDs8L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQi
PlJlZ2FyZHM8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3Bh
biBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+LVZpamF5PG86cD48L286cD48L3NwYW4+PC9wPg0K
PC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_9AA023EED6BB4385B29A675968E66B5Cfbcom_--
