Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD931B7D2C
	for <lists+openbmc@lfdr.de>; Fri, 24 Apr 2020 19:42:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4981hV0J7ZzDr86
	for <lists+openbmc@lfdr.de>; Sat, 25 Apr 2020 03:42:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=1383c36895=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=jFrCEiDn; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=T24/NOQw; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4981gZ3LknzDqht
 for <openbmc@lists.ozlabs.org>; Sat, 25 Apr 2020 03:41:22 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id 03OHfAMN018629;
 Fri, 24 Apr 2020 10:41:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=aJQ6LyB3uMw1iDKqU23U6uzXY1WdhBjvExKris6wKwQ=;
 b=jFrCEiDn1Dpq3sNeRkp0tBaDhYXEyjG8tHFlyVh7wP62qQiECXUN5CtEGYSIB+cMNMrt
 ZneWm8CZ1g1EdKJ1O9nmV3MoGVk7CKE3wnDGsa/xwD/Pq/kZ7ke7SXS1gblsqG1mQiVS
 lKhgF0pVFHgyrYiU5pDkOtzFYc/u1zXqtXI= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0089730.ppops.net with ESMTP id 30k1hgv2gn-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 24 Apr 2020 10:41:18 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Fri, 24 Apr 2020 10:41:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tv2hdu7GIkrAqrP3WI+cUmKM9Q65tf1XVnHA1iK4Jr6BMQ2wEYIXKBwxFLT5TtI6AAp3Tp1LGbIgTkI3IXhEkirwyBaIt9mgnOZ0CxSFlOu9F4AHejoU+UsRcC28Dov8vKxOzpe0bQXvdUurcGgsvDGRoeFX5DXQHZ7DbkdJZuVefWYqbBgj1ceX0Mhd0FQiMqhbens12MmS+eLkCVj8p/06SMJ67RscO8tTGvoiEPqoaIbs7xyotryuF+bpcGpT2Jxzl+EqiYp7V5MwIIjW/SN7Ipe/idFcRqTHF51HW8LecRiT2SZKgb2Pj+OpH96RjDL144PmIj57tn9eGgXHOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJQ6LyB3uMw1iDKqU23U6uzXY1WdhBjvExKris6wKwQ=;
 b=hZsMQU17S9cleaTw3rB4/AYP41gfjep9wA12Ndxm6ymMefnTzPGAnsYVakVBz/QAz1RwqeGoxpeGOBdEn2xpk7FaK+C1NonVBPK1XK6KGI1TiPGPnMdSK2NNLTgC+kvscMPSpcJVJ0krvs7o7O4UTl1tuayVScZa2iIy8VSPi5h6hEK0G0qvvVhIaW7XEoxJHE82Ca0qMRlI6N0wYIxhVGwW/YD5kvM71uE0WaDiCHzBjUCJYOccYyIq6J0feoktYJxFtqnSPnGiFsvZFmH0iaF0nDDUuG0ZEY6mmpYxbtsR1ci5f+BbN79SZ6jvv2klzTSVHG+VriHSOWkqOLhz2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJQ6LyB3uMw1iDKqU23U6uzXY1WdhBjvExKris6wKwQ=;
 b=T24/NOQwP8ueUGAMb3b7vmJt+mc9MWyYtp4frznH44AjZBKjFyTxzhBc7B9P5g+f/OjntivgLir+UPKwAFrSOyne2lP09ccl8ayJqgSYnatMeaveCB3bphHQYIa0JjSG0GIO4is40LZoV3BAEHbNQyOCirmSUn0TKaDQjlF8diU=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2357.namprd15.prod.outlook.com (2603:10b6:a02:82::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Fri, 24 Apr
 2020 17:41:17 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4%3]) with mapi id 15.20.2921.030; Fri, 24 Apr 2020
 17:41:17 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Matthew Barth <msbarth@linux.ibm.com>, Patrick Voelker
 <Patrick_Voelker@phoenix.com>, "OpenBMC (openbmc@lists.ozlabs.org)"
 <openbmc@lists.ozlabs.org>
Subject: Re: Intel-BMC: Fan control
Thread-Topic: Intel-BMC: Fan control
Thread-Index: AdYZyY7P3PIB+VYAQwqoWDNCiBKcFwAf+5uA//+2xYA=
Date: Fri, 24 Apr 2020 17:41:16 +0000
Message-ID: <FF397713-D6F3-4E6A-BA22-34EEA5C07236@fb.com>
References: <e3297385bee9483989607bce1e9837d9@SCL-EXCHMB-13.phoenix.com>
 <e05f77ca-b69c-0e8a-3b4d-3e20a2f87b02@linux.ibm.com>
In-Reply-To: <e05f77ca-b69c-0e8a-3b4d-3e20a2f87b02@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:5929]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: db56664d-3328-403d-e957-08d7e876b111
x-ms-traffictypediagnostic: BYAPR15MB2357:
x-microsoft-antispam-prvs: <BYAPR15MB2357BFCF830BE2678930A9A4DDD00@BYAPR15MB2357.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 03838E948C
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(376002)(39860400002)(346002)(366004)(396003)(71200400001)(316002)(478600001)(5660300002)(6506007)(53546011)(76116006)(6512007)(91956017)(64756008)(2906002)(66446008)(6486002)(66476007)(66556008)(66946007)(2616005)(8936002)(33656002)(4744005)(110136005)(81156014)(36756003)(8676002)(86362001)(186003);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ncfsm9DtzRvZA/yKSX/qEFW90Qv0Mc9LQ07gfTfPWkX+QdH6uOWvbEZeDy5c4ZlENnp9loutpnDtBLWwZH8wt9OXUwIZnqU0168iuldSlgHv3B8iZVQwXA2AXxONDFrZdnZLHa9e6y7Pg20bfweFO0vmP9SLSG7ToTOaZrDAT1p2qDU9YCoLXHu8i+rTXJpQ585mjeQ1CDaxF3g4bXKogZyJ2gXhk3JVdLZYETHdbIdRxmMzbtWY/WIO9/KKzepeiP3sCZHuVWTKfqvmCc8xLPlpEbahiUMgSc0q0aylT47ayDSgjW+qH4zCcrVlbjPTZw8l+2cThgx7q9jTzJRimoNywra7y3Dp7bnPCdGk5hzkuF44oebqQnmExsBTQPvBIAS9G5EbAGN1FYqVsh/ZdJCh/6lM5PIaWwXkTZsOzxZSRny9oX+/NMHMgVQm1AaL
x-ms-exchange-antispam-messagedata: y/vVgCzjbFLkiZ1Qj7qnJC4NWgOLyPpyOMf9Oer+Ol7+5718RprJnhqxZHWj4O98B2pbHzkhXjRRjU0B0nSvf5JqqSxbC5/nT4XKLfLNL17rYnI3fNMNgx8rmPI1xAFet38mU6kbgkZAW3J07gEj7AJXvNRgYl1hkZhO1UCM5CnjS3xT69vNhNRl2f973LUd
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_FF397713D6F34E6ABA2234EEA5C07236fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: db56664d-3328-403d-e957-08d7e876b111
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2020 17:41:16.9171 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O5l/uPhT82CknP9b9Tr7mp8b1i6bckcvQv9wIosXcXf3U7sZoiSHu9BySzJI4/rDXaf2ANO9XTOKm4dmbXlqXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2357
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-24_09:2020-04-24,
 2020-04-24 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 adultscore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1011 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004240135
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

--_000_FF397713D6F34E6ABA2234EEA5C07236fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSBjYW7igJl0IGNvbW1lbnQgZm9yIEludGVsLWJtYyBidXQgaW4gb3BlbmJtYywgZW50aXR5IG1h
bmFnZXIgc3VwcG9ydHMgZm9yIHBob3NwaG9yLWZhbi1jb250cm9sIGFuZCB5YW1sIGNvbmZpZyBp
cyBub3QgcmVxdWlyZWQgaWYgdGhlcmUgaXMgRU0gY29uZmlnIGF2YWlsYWJsZS4NCg0KRnJvbTog
b3BlbmJtYyA8b3BlbmJtYy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxhYnMu
b3JnPiBvbiBiZWhhbGYgb2YgTWF0dGhldyBCYXJ0aCA8bXNiYXJ0aEBsaW51eC5pYm0uY29tPg0K
RGF0ZTogRnJpZGF5LCBBcHJpbCAyNCwgMjAyMCBhdCA4OjA4IEFNDQpUbzogUGF0cmljayBWb2Vs
a2VyIDxQYXRyaWNrX1ZvZWxrZXJAcGhvZW5peC5jb20+LCAiT3BlbkJNQyAob3BlbmJtY0BsaXN0
cy5vemxhYnMub3JnKSIgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NClN1YmplY3Q6IFJlOiBJ
bnRlbC1CTUM6IEZhbiBjb250cm9sDQoNCg0KTm8sIHBob3NwaG9yLWZhbi1jb250cm9sIGlzIGN1
cnJlbnRseSBkcml2ZW4gYnkgeWFtbCBjb25maWdzIGF0IGJ1aWxkIHRpbWUuIFRoZXJlIGlzIHdv
cmsgc2xhdGVkIHRvIGVuYWJsZSB1c2Ugb2YgcnVudGltZSBqc29uIGNvbmZpZ3MgZm9yIHBob3Nw
aG9yLWZhbi1jb250cm9sLg0KDQpJIGJlbGlldmUgZW50aXR5LW1hbmFnZXIgY2FuIGJlIHVzZWQg
dG8gcHJvdmlkZSBjb25maWcgZGF0YSB0byB0aGUgcGhvc3Bob3ItcGlkLWNvbnRyb2wgZmFuIGNv
bnRyb2wgYXBwbGljYXRpb24gdGhvdWdoLg0KT24gNC8yMy8yMCA2OjQ4IFBNLCBQYXRyaWNrIFZv
ZWxrZXIgd3JvdGU6DQpGYW4gY29udHJvbCByZWxhdGVkIHF1ZXN0aW9uIGZvciBJbnRlbC1CTUM6
IERvIHRoZSBlbnRpdHktbWFuYWdlciB0YWNocywgUFdNcywgYW5kIHpvbmVzIGluZm9ybSBwaG9z
cGhvci1mYW4tY29udHJvbD8gT3IgaXMgcGhvc3Bob3ItZmFuLWNvbnRyb2wgZHJpdmVuIHB1cmVs
eSBmcm9tIHRoZSB5YW1sIGNvbmZpZ3VyYXRpb25zIGF0IGJ1aWxkIHRpbWU/DQo=

--_000_FF397713D6F34E6ABA2234EEA5C07236fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <DC05480CE55ECB43802ADC70F48D72C8@namprd15.prod.outlook.com>
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
b3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmO30NCnNwYW4uRW1haWxTdHlsZTIwDQoJe21zby1zdHlsZS10eXBlOnBlcnNv
bmFsLXJlcGx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndp
bmRvd3RleHQ7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7
DQoJZm9udC1zaXplOjEwLjBwdDt9DQpAcGFnZSBXb3JkU2VjdGlvbjENCgl7c2l6ZTo4LjVpbiAx
MS4waW47DQoJbWFyZ2luOjEuMGluIDEuMGluIDEuMGluIDEuMGluO30NCmRpdi5Xb3JkU2VjdGlv
bjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT4NCjwvaGVhZD4NCjxib2R5IGxh
bmc9IkVOLVVTIiBsaW5rPSJibHVlIiB2bGluaz0icHVycGxlIj4NCjxkaXYgY2xhc3M9IldvcmRT
ZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5JIGNhbuKAmXQgY29tbWVudCBmb3IgSW50
ZWwtYm1jIGJ1dCBpbiBvcGVuYm1jLCBlbnRpdHkgbWFuYWdlciBzdXBwb3J0cyBmb3IgcGhvc3Bo
b3ItZmFuLWNvbnRyb2wgYW5kIHlhbWwgY29uZmlnIGlzIG5vdCByZXF1aXJlZCBpZiB0aGVyZSBp
cyBFTSBjb25maWcgYXZhaWxhYmxlLjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXIt
dG9wOnNvbGlkICNCNUM0REYgMS4wcHQ7cGFkZGluZzozLjBwdCAwaW4gMGluIDBpbiI+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48Yj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpi
bGFjayI+RnJvbTogPC9zcGFuPjwvYj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xv
cjpibGFjayI+b3BlbmJtYyAmbHQ7b3BlbmJtYy1ib3VuY2VzJiM0Mzt2aWpheWtoZW1rYT1mYi5j
b21AbGlzdHMub3psYWJzLm9yZyZndDsgb24gYmVoYWxmIG9mIE1hdHRoZXcgQmFydGggJmx0O21z
YmFydGhAbGludXguaWJtLmNvbSZndDs8YnI+DQo8Yj5EYXRlOiA8L2I+RnJpZGF5LCBBcHJpbCAy
NCwgMjAyMCBhdCA4OjA4IEFNPGJyPg0KPGI+VG86IDwvYj5QYXRyaWNrIFZvZWxrZXIgJmx0O1Bh
dHJpY2tfVm9lbGtlckBwaG9lbml4LmNvbSZndDssICZxdW90O09wZW5CTUMgKG9wZW5ibWNAbGlz
dHMub3psYWJzLm9yZykmcXVvdDsgJmx0O29wZW5ibWNAbGlzdHMub3psYWJzLm9yZyZndDs8YnI+
DQo8Yj5TdWJqZWN0OiA8L2I+UmU6IEludGVsLUJNQzogRmFuIGNvbnRyb2w8bzpwPjwvbzpwPjwv
c3Bhbj48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNw
OzwvbzpwPjwvcD4NCjwvZGl2Pg0KPHA+Tm8sIHBob3NwaG9yLWZhbi1jb250cm9sIGlzIGN1cnJl
bnRseSBkcml2ZW4gYnkgeWFtbCBjb25maWdzIGF0IGJ1aWxkIHRpbWUuIFRoZXJlIGlzIHdvcmsg
c2xhdGVkIHRvIGVuYWJsZSB1c2Ugb2YgcnVudGltZSBqc29uIGNvbmZpZ3MgZm9yIHBob3NwaG9y
LWZhbi1jb250cm9sLjxvOnA+PC9vOnA+PC9wPg0KPHA+SSBiZWxpZXZlIGVudGl0eS1tYW5hZ2Vy
IGNhbiBiZSB1c2VkIHRvIHByb3ZpZGUgY29uZmlnIGRhdGEgdG8gdGhlIHBob3NwaG9yLXBpZC1j
b250cm9sIGZhbiBjb250cm9sIGFwcGxpY2F0aW9uIHRob3VnaC48bzpwPjwvbzpwPjwvcD4NCjxk
aXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5PbiA0LzIzLzIwIDY6NDggUE0sIFBhdHJpY2sgVm9l
bGtlciB3cm90ZTo8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGJsb2NrcXVvdGUgc3R5bGU9Im1h
cmdpbi10b3A6NS4wcHQ7bWFyZ2luLWJvdHRvbTo1LjBwdCI+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij5GYW4gY29udHJvbCByZWxhdGVkIHF1ZXN0aW9uIGZvciBJbnRlbC1CTUM6IERvIHRoZSBlbnRp
dHktbWFuYWdlciB0YWNocywgUFdNcywgYW5kIHpvbmVzIGluZm9ybSBwaG9zcGhvci1mYW4tY29u
dHJvbD8gT3IgaXMgcGhvc3Bob3ItZmFuLWNvbnRyb2wgZHJpdmVuIHB1cmVseSBmcm9tIHRoZSB5
YW1sIGNvbmZpZ3VyYXRpb25zIGF0IGJ1aWxkIHRpbWU/PG86cD48L286cD48L3A+DQo8L2Jsb2Nr
cXVvdGU+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_FF397713D6F34E6ABA2234EEA5C07236fbcom_--
