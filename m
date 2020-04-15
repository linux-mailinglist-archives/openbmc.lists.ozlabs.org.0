Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F551AA395
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 15:12:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492N7j4jh0zDqLn
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 23:12:49 +1000 (AEST)
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
 header.s=facebook header.b=KJQqi6Jz; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=bJVOB5mK; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492MLQ51KVzDr0m
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 22:37:01 +1000 (AEST)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03FBpYGJ024042; Wed, 15 Apr 2020 04:59:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : mime-version; s=facebook;
 bh=GPuW7+wvR5nniWjcg6KCfLDU3cHfAUbGgwtaBTtR/sU=;
 b=KJQqi6JzaXCCVABMhfupM12OGpxXRb7CW1yMGhiGQoM3b76aPYNR6Bx+vR3uOzJWIoYF
 cVo/vayKJtQZZ5XxI7YzXbnFwkp4ySIrO1JRK/NF/H56mxWiiOnubXFnrq1BACoS03SQ
 DCBBAPR3snJAE2pyJHLgh+7tyRZDlzpRMPM= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 30dn82n409-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 15 Apr 2020 04:59:24 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Wed, 15 Apr 2020 04:59:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jl/uvC8Hz1tUjl+d1jneoTJvJSFYWHoGvWOg4e4cYRQMPzN3t+Nhqtv9GabB8FLXq+br0dhix1WleqYYpO+/aKWlM7bCb20cEuRK8cfxXE3dzzUXnUpFLb+zOZZp6m6y9IUxCkRL642cKRz93mZoABpuy3JaFIJ6rluOgowu6Ws9ZDvVleSZFZ9+NWt8IjjJ0fjVHu889VFRyXwiAIOuornaO25mjiwWaq8h+pR0vwa24S8pnsqDLngfBvsU50ulEs7wHgSyVhCoPIW90X8oe+DUON2dfFWVltxsXMZXz7Ky0MCIVbEOUQzS3WDxv61PAr5Xl35cegIbEwAB/btDvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPuW7+wvR5nniWjcg6KCfLDU3cHfAUbGgwtaBTtR/sU=;
 b=jGu92KGnzB19FVo4oANAhvM2kEu7fVTkVWqBH2oW6eWrKATZpOmtypP7Fzjga5U1blBbL2VwK379ejowI2nV/a0WOVRuvMipulyx9SGSGr2cdjUqVDfNlpNF5+sP1RP1oVn8vL9oTPSWx0d3pvWCWChWIneDfmu9uo/JK2xegEjAVyl3tZ0lxQYrCXXA2w+ega4HCdT8hlmSaiRgMKPxwNqoFOTcUyxjehZD67BAKoRKn6AH6xOgRkFHeEjRKxFH4R/x/WkZSRVDztpG4qSLnKIRfD0kCBEZEL39t6Fd3zTEqRXMNXlZV7hMqWywiL9wYRyX/OVsjddwczelyZRo5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPuW7+wvR5nniWjcg6KCfLDU3cHfAUbGgwtaBTtR/sU=;
 b=bJVOB5mK5V/Jw/9L/ilOuaLD6KL8MfjlMRyeYAG/2WhdxzBebIaKi9iOWo5izjxX8c25NaRENUM7lJtOa5FgDY71Xh1e4k1i2iMUm6jsChiLnWpKoBdFA+VpvMwtQVRBTqeVapCxMUXuQx0eGAOGtGOijev1hQXXm8+WBVEinUg=
Received: from MW3PR15MB3947.namprd15.prod.outlook.com (2603:10b6:303:49::9)
 by MW3PR15MB3753.namprd15.prod.outlook.com (2603:10b6:303:50::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.20; Wed, 15 Apr
 2020 11:59:23 +0000
Received: from MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::950:594c:b2fc:be8]) by MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::950:594c:b2fc:be8%4]) with mapi id 15.20.2921.024; Wed, 15 Apr 2020
 11:59:23 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Andrew Geissler <geissonator@gmail.com>
Subject: Chassis Sled reset
Thread-Topic: Chassis Sled reset
Thread-Index: AQHWEx1Nq8Vl1IY2BESqkGrXECxe6w==
Date: Wed, 15 Apr 2020 11:59:22 +0000
Message-ID: <F4D84483-A256-471F-B094-DB0618401E4E@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:6ff6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82241f13-a6d7-4d77-0baa-08d7e1347012
x-ms-traffictypediagnostic: MW3PR15MB3753:
x-microsoft-antispam-prvs: <MW3PR15MB3753A80CF4372158727F4255DDDB0@MW3PR15MB3753.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0374433C81
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR15MB3947.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(136003)(366004)(376002)(39860400002)(396003)(346002)(2616005)(86362001)(316002)(6512007)(76116006)(4326008)(8936002)(186003)(6506007)(81156014)(9326002)(66946007)(8676002)(6486002)(7116003)(33656002)(478600001)(36756003)(3480700007)(66446008)(5660300002)(64756008)(66556008)(66476007)(558084003)(6916009)(2906002)(71200400001);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LYKjWRIR4/kRXpKb9pQXBmmMKhhg/+juT/6hjMPjeX24e6iPph0pvX82ChAV+bUjMySHfK+JbPPQgaMdMZI5sRVX6LxvO3V2WvoKhWANPAIj60m0PJD9xnwK4+wxj4VssOyBZw+ls1zDsfMMLDO0uFU8SitIFk3EKrJnz0TjXJ3WKmv+4hdxuJcexAzq35WJShsN2fabVgwGSZjNokIePhAXSM1yqvnPxeAi78yeICHgcDYPvXKKPPaeMLMjT7FDFh6phk1I9f+T7O3IpVPJVkbGJZ9f3tkpkMkqghHPHoqOIs+8y+bBBweSGTm7hdh53ErNR4fmZo10S3y0g58G6gbqApclS0sca7W5jg9RRMD9H0vsM8+IrlAO/MXWCJAw2W+HZDVrBgPCY0b5B/cxVDAY+a8DVJXZH3vvM9+H9V2M9J7Hxfu/Igyr5pTWMWLt
x-ms-exchange-antispam-messagedata: W/INssFa+Nd3cq/IoCR5MyH4jOwhbkGMFaFLA+SY80o3deDYMqsEmCINoe85y3p2Eccbi54heOTQF8hcoPhHOSQZz9Wq1HNB5vaZTlGibYBA95oXODhMc9iZyAGbBGEnOE5qBSfgX2Q7Uws51xXhg47kGt/VmcsKsAmsFrq4Z59t3ZMDFUBnVEBP+p97d96h
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_F4D84483A256471FB094DB0618401E4Efbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 82241f13-a6d7-4d77-0baa-08d7e1347012
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2020 11:59:22.8375 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tU0yeHyrpNzVuaBV4VyMFf2QmafVjP1YG7GiJLznSAHMT1xSEWcatU/CVgfffsBuMQABYG1/cGQFVuSlLt9fFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3753
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-15_03:2020-04-14,
 2020-04-15 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 mlxscore=0 lowpriorityscore=0 adultscore=0 clxscore=1011 impostorscore=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 mlxlogscore=741
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004150090
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

--_000_F4D84483A256471FB094DB0618401E4Efbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQW5kcmV3LA0KSSBoYXZlIGxvb2tlZCBhdCBzZXZlcmFsIGRidXMgaW50ZXJmYWNlIGRlZmlu
aXRpb24gYW5kIGZvdW5kIHRoYXQgbW9zdCBzdWl0YWJsZSBwbGFjZSBmb3IgdGhpcyBTTEVEIHJl
c2V0IGlzICDigJx4eXovb3BlbmJtY19wcm9qZWN0L0NoYXNzaXMvQ29udHJvbC9Qb3dlci5pbnRl
cmZhY2UueWFtbOKAnS4gUGxlYXNlIHN1Z2dlc3QgaWYgSSBjYW4gYWRkIGEgbWV0aG9kIHRvIFNs
ZWQgcmVzZXQgY2hhc3NpcyBoZXJlLg0KDQpSZWdhcmRzDQotVmlqYXkNCg0K

--_000_F4D84483A256471FB094DB0618401E4Efbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <FC67F18B7C79084D937B048F3BCAF2A9@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1m
YWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7DQoJcGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAy
IDQ7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWlseTpNZW5sbzsNCglwYW5vc2UtMToyIDExIDYg
OSAzIDggNCAyIDIgNDt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3JtYWwsIGxp
Lk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCW1hcmdpbi1ib3R0b206
LjAwMDFwdDsNCglmb250LXNpemU6MTIuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5z
LXNlcmlmO30NCnNwYW4uRW1haWxTdHlsZTE3DQoJe21zby1zdHlsZS10eXBlOnBlcnNvbmFsLWNv
bXBvc2U7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7DQoJY29sb3I6d2luZG93
dGV4dDt9DQpzcGFuLnMxDQoJe21zby1zdHlsZS1uYW1lOnMxO30NCi5Nc29DaHBEZWZhdWx0DQoJ
e21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5O30NCkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXpl
OjguNWluIDExLjBpbjsNCgltYXJnaW46MS4waW4gMS4waW4gMS4waW4gMS4waW47fQ0KZGl2Lldv
cmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9uMTt9DQotLT48L3N0eWxlPjwhLS1baWYgZ3Rl
IG1zbyA5XT48eG1sPg0KPG86c2hhcGVkZWZhdWx0cyB2OmV4dD0iZWRpdCIgc3BpZG1heD0iMTAy
NiIgLz4NCjwveG1sPjwhW2VuZGlmXS0tPjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86c2hh
cGVsYXlvdXQgdjpleHQ9ImVkaXQiPg0KPG86aWRtYXAgdjpleHQ9ImVkaXQiIGRhdGE9IjEiIC8+
DQo8L286c2hhcGVsYXlvdXQ+PC94bWw+PCFbZW5kaWZdLS0+DQo8L2hlYWQ+DQo8Ym9keSBsYW5n
PSJFTi1VUyIgbGluaz0iIzA1NjNDMSIgdmxpbms9IiM5NTRGNzIiPg0KPGRpdiBjbGFzcz0iV29y
ZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6
MTEuMHB0Ij5IaSBBbmRyZXcsPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkkgaGF2ZSBsb29rZWQgYXQgc2V2
ZXJhbCBkYnVzIGludGVyZmFjZSBkZWZpbml0aW9uIGFuZCBmb3VuZCB0aGF0IG1vc3Qgc3VpdGFi
bGUgcGxhY2UgZm9yIHRoaXMgU0xFRCByZXNldCBpcyAmbmJzcDvigJw8L3NwYW4+PHNwYW4gY2xh
c3M9InMxIj54eXovb3BlbmJtY19wcm9qZWN0L0NoYXNzaXMvQ29udHJvbC9Qb3dlci5pbnRlcmZh
Y2UueWFtbOKAnS4gUGxlYXNlIHN1Z2dlc3QNCiBpZiBJIGNhbiBhZGQgYSBtZXRob2QgdG8gU2xl
ZCByZXNldCBjaGFzc2lzIGhlcmUuPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+PHNwYW4gY2xhc3M9InMxIj48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBjbGFzcz0iczEiPlJlZ2FyZHM8bzpwPjwvbzpwPjwv
c3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBjbGFzcz0iczEiPi1WaWpheTwv
c3Bhbj48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjwv
Ym9keT4NCjwvaHRtbD4NCg==

--_000_F4D84483A256471FB094DB0618401E4Efbcom_--
