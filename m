Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1534C17652F
	for <lists+openbmc@lfdr.de>; Mon,  2 Mar 2020 21:42:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WXBt1PlzzDqZD
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 07:42:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=0330746486=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=qS00WeJI; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=CWwZga5B; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WXB25kRKzDqYX
 for <openbmc@lists.ozlabs.org>; Tue,  3 Mar 2020 07:41:40 +1100 (AEDT)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.42/8.16.0.42) with SMTP id 022Kd2Yv020964;
 Mon, 2 Mar 2020 12:41:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=6gr6eZArsW+tCBx1rW84N+A8vrfvlXOzH6yZ5/tSoUU=;
 b=qS00WeJIFoMe8e34R6YdcI2r2wPqsCWJFdCkryC8S+iGYXyREm60D+OHGfhJa84K6MF1
 erm7k+A0jz2D++qkrMAzLnjTPFWfPOHUhQNm07b7g4qHF7ITGKL/y9OuttfZOIDw9Fop
 lscvHyhNsWqWWttgnTH3k4NX2aFWed1QLnA= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0001303.ppops.net with ESMTP id 2yfmgut5tb-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 02 Mar 2020 12:41:38 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.228) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Mon, 2 Mar 2020 12:41:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+sr8WSdlUZKHS2ksLM3eJIarXi/9nVlaW/5uhrNOY1hhjcR+ZPa1tNDEz668ajyBjUFhYOkUUEbb7CRDO58CUmNMsSJYbVta690tcX/eiq+kHdjmiXxrFgFzi3yBwEAaMrfKkyNkmKnHqxzyyVttafVRbbNmkT0vDrkrt75oF+lxd41qlkyXNJI+wA1mxqyz59/et0FUFWG0AjZeP8tSGLGfqp4gcPkoWuf4NSscAMbMUI3KiIvjyEBWKek72P/0SUT59t+6iwvyTB9p5Mt+nMHdoFT0n9M/u9+PxunZmSZ0NzGLSgRcpP29IGf79CwMtP9cr0ihYac4jCWEevk9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gr6eZArsW+tCBx1rW84N+A8vrfvlXOzH6yZ5/tSoUU=;
 b=QDWDzNLIroEO5R7/Obqkk08emPPHeWnCPPL4G1e2B6PNs8WTBdNdM1TXB/71xDnYyMWsGnBiuM1nWwoK/SjEGUeu21dyT38v5MEzpbMWTnW7ivhqtOMHIdQIHObQ8yFllESXrPzQ2bIBVMDhNLlzruC7Y0zBJedR57NJWF24mcRFVmq+pDUIrWl7WddZ1YnbDsuUN9p9xrjZnVtHGmUEwaAOZ8Q91gCuo+oZvessfi+16DYexN09DxxGvmWAR0UK1cMh4gWAt8vrul8dZSf3zhy120tdle24F9PXtigOgRi2HbRgdn/Mgyoe9DIs1PPGUeM89xvs7Yy/nS+tOCtIvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gr6eZArsW+tCBx1rW84N+A8vrfvlXOzH6yZ5/tSoUU=;
 b=CWwZga5BVGr+lAyDqQTbibeghBz9687koFQVV2AUlTK9P6e97KtBjDcND3FWlyvsdEwZqmuGrWi+09PCJLTyM/lxnBHocJ4J38FURpFqn9JKMhiLfcTnwI0UIXSgMOJT++uzG48tcMkloaACfxMQ2B09lpXbqKQWWn0xUigBXvU=
Received: from MW3PR15MB3947.namprd15.prod.outlook.com (2603:10b6:303:49::9)
 by MW3PR15MB3964.namprd15.prod.outlook.com (2603:10b6:303:43::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.14; Mon, 2 Mar
 2020 20:41:12 +0000
Received: from MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936]) by MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936%4]) with mapi id 15.20.2772.019; Mon, 2 Mar 2020
 20:41:12 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: =?utf-8?B?5Y2X6YeO44Og44Or44K344Ko44Op44K0?= <1181052146@qq.com>, openbmc
 <openbmc@lists.ozlabs.org>
Subject: Re: What does openbmc system do after update BMC Firmware and taps
 reboot?
Thread-Topic: What does openbmc system do after update BMC Firmware and taps
 reboot?
Thread-Index: AQHV8GSCZwGDgmijDkm8HDRBp4tx3Kg1PuuA
Date: Mon, 2 Mar 2020 20:41:11 +0000
Message-ID: <98E446FD-0DC1-4E37-B63E-7CB92AFDA6B8@fb.com>
References: <tencent_50CE0F4E75A8AC62FF7879B0299213180707@qq.com>
In-Reply-To: <tencent_50CE0F4E75A8AC62FF7879B0299213180707@qq.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:500::4:9514]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1bf32e04-a5cc-4bb9-ad6c-08d7beea0b7a
x-ms-traffictypediagnostic: MW3PR15MB3964:
x-microsoft-antispam-prvs: <MW3PR15MB39647FEABA32688756B3CC82DDE70@MW3PR15MB3964.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 033054F29A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10001)(10019020)(366004)(346002)(136003)(376002)(396003)(39860400002)(189003)(199004)(6486002)(36756003)(86362001)(6512007)(8676002)(8936002)(15650500001)(81156014)(81166006)(71200400001)(478600001)(2616005)(66946007)(64756008)(66556008)(66476007)(76116006)(110136005)(316002)(6506007)(53546011)(2906002)(66446008)(5660300002)(33656002)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MW3PR15MB3964;
 H:MW3PR15MB3947.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iI/RQNegIrCkcJCq3Uqf7s6tvTtzmRTywnEO95oH5gkrLzBTgrf696hiduU4qdcG500Mlz6/A1lpVPjGNw8KXP8tf0NCjJQQnFLP2WRGp3P9Zc6iD5ZJLLKFZZ51ME0gj15LMxOUZ7eWcqcxpMoOSgMWHyQ5cBSKeWzDq2I9xA9TMXBoWq4enqKHivnE09ohsPHGxMD+MjfvEmSCna680MAnFwV3C4zX5n1uJKgOSPaSm1iplNgsI4OL0S5HofZWhpdFRJkGfQcv6XHPpPcb4O1jZLmwLGFjPkFqDs+xzsAvSEBt+4BKWzjo9EMX+g9ZhbIlilrJ42PUSuMWsdGtRzt6cYBQ/5URHLOuslWWFh7KFJIe5zc521D3HNpWIc1vTVx9w3L7fR/kvww49bP3CahfPEbeVycCm2Qks1he3gFyaee6yszl8Ie3YwxB/qOIHTS8p72l60yIwoLjImTSk232MaK9aCXLnQFJkoMvVW55Dd8DievjBmTBRCAh5m397qDVV2NV095q3YmJ5uGxKXONBuVpfkHHBwKLAu95dg66bKPSGwBRKwkIKGrFaYQtQDH5gmIszsXiiEoEyHgPXw==
x-ms-exchange-antispam-messagedata: 4gHaE3Yx/iPd7jZJVyxLHquCphn1UJ8L1ebXMGeNOfK7Egj5TG1Kk0TPTC/CIVDHNgTe+p9g7lU2o88COG1A90MmGBOjEODWcbEhbvGbapGsWFvWXZ88MYrzn16hUTXL4OwHsWPzGVJn6Fqcs/1EUwswVZiOHr2xfXB8TRx9UKFVxmq30iP3hS5aU87LR1lj
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_98E446FD0DC14E37B63E7CB92AFDA6B8fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bf32e04-a5cc-4bb9-ad6c-08d7beea0b7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2020 20:41:11.8576 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9wSNcgt3jTVkbTCZeo4uaMLscf6OuSgeV4j/5kGi/j/0OmcA1p1/5nCSAngviFsA73iMOYTB8Tf1zLXTwcFNYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3964
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-02_08:2020-03-02,
 2020-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 clxscore=1011 malwarescore=0 suspectscore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003020136
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

--_000_98E446FD0DC14E37B63E7CB92AFDA6B8fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

RHVyaW5nIHJlYm9vdCwgc2h1dGRvd24gc2NyaXB0cyBjaGVjayBmb3IgYW55IGltYWdlcyBpbiBp
bml0cmFtZnMgYW5kIGl0IG92ZXJ3cml0ZXMgdG8gaXRzIHByZWRlZmluZWQgcGFydGl0aW9uIHZp
YSB1cGRhdGUgc2NyaXB0cy4NCg0KRnJvbTogb3BlbmJtYyA8b3BlbmJtYy1ib3VuY2VzK3ZpamF5
a2hlbWthPWZiLmNvbUBsaXN0cy5vemxhYnMub3JnPiBvbiBiZWhhbGYgb2Yg5Y2X6YeO44Og44Or
44K344Ko44Op44K0IDwxMTgxMDUyMTQ2QHFxLmNvbT4NCkRhdGU6IFN1bmRheSwgTWFyY2ggMSwg
MjAyMCBhdCAxMTozMCBQTQ0KVG86IG9wZW5ibWMgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4N
ClN1YmplY3Q6IFdoYXQgZG9lcyBvcGVuYm1jIHN5c3RlbSBkbyBhZnRlciB1cGRhdGUgQk1DIEZp
cm13YXJlIGFuZCB0YXBzIHJlYm9vdD8NCg0KR3JlZXRpbmdzOg0KDQpJIGFtIGxlYXJuaW5nIGhv
dyBvcGVuYm1jIHVwZGF0ZSBCTUMgZmlybXdhcmUuIEkgYW0gZm9sbG93aW5nIHRoZSBndWlkZSAi
aHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvZG9jcy9ibG9iL21hc3Rlci9jb2RlLXVwZGF0ZS9j
b2RlLXVwZGF0ZS5tZCIgdG8gdXBkYXRlIEJNQyBGaXJtd2FyZS4gSXQgd29ya3Mgd2VsbCBmb3Ig
bWUuDQpCdXQgSSBzdGlsbCBkbyBub3Qga25vdywgd2h5IGluIHN0ZXAgNyBzaG91bGQgSSByZWJv
b3QsIGFuZCB3aGF0IHJlYm9vdCBkbz8NCkxhdGVyIEkgZm91bmQgaW4gImh0dHBzOi8vZ2l0aHVi
LmNvbS9vcGVuYm1jL2RvY3MvYmxvYi9tYXN0ZXIvY29kZS11cGRhdGUvY29kZS11cGRhdGUtZGlh
Z3JhbXMubWQiLCB3aGljaCB0ZWxscyB0aGF0Og0KICAgICAgICBbKl0gSW4gYSBzdGF0aWMgbGF5
b3V0IGNvbmZpZ3VyYXRpb24sIHRoZSBpbWFnZXMgYXJlIHN0b3JlZCBpbiBSQU0gYW5kIHRoZSBj
b250ZW50IGlzIHdyaXR0ZW4gdG8gZmxhc2ggZHVyaW5nIEJNQyByZWJvb3QuDQogICAgICAgIFJl
ZmVyZW5jZSB0aGUgdXBkYXRlIGFuZCBzaHV0ZG93biBzY3JpcHRzIHByb3ZpZGVkIGJ5IGluaXRy
ZHNjcmlwdHM8aHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvb3BlbmJtYy90cmVlL21hc3Rlci9t
ZXRhLXBob3NwaG9yL3JlY2lwZXMtcGhvc3Bob3IvaW5pdHJkc2NyaXB0cz4NCkkgYW0gdXNpbmcg
YSBzdGF0aWMgbGF5b3V0LiBBbmQgSSBmb3VuZCB0d28gc2NyaXB0cyBuYW1lZCAic2h1dGRvd24i
IGFuZCAidXBkYXRlIiBpbiAiL3J1bi9pbml0cmFtZnMvIi4gU28gSSB0aG91Z2h0IGl0IGlzIHRo
YXQsIHRoZSB1cGRhdGUgYXBwbGljYXRpb25zIHB1dCB0aGUgZmlybXdhcmUgaW1hZ2UgaW4gL3J1
bi9pbml0cmFtZnMvIGFuZCB3aGVuIEkgdGFwIHJlYm9vdCwgYnkgc29tZSBtZWFucyB0aGUgInVw
ZGF0ZSIgc2NyaXB0IHJ1bnMgYW5kIHRoZSAidXBkYXRlIiBzY3JpcHQgdXNpbmcgImZsYXNoY3Ai
IGNvbW1hbmQgdG8gd3JpdGUgdGhlIGZpcm13YXJlIGltYWdlIHRvIHRoZSAvZGV2L210ZC4gSXMg
dGhhdCByaWdodD8NCldoYXQgaGFwcGVucyBhZnRlciBJIHRhcCAicmVib290IiwgYW5kIHdobyBj
YWxscyB0aGUgInVwZGF0ZSIgc2NyaXB0LCBhbmQgaG93IGl0IGNhbGxzIHRoZSAidXBkYXRlIiBz
Y3JpcHRzPw0KQ2FuIHNvbWVvbmUgdGVsbCBtZT8gVGhhbmtzIGEgbG90IQ0KDQpCZXN0IFJlZ2Fy
ZHMhDQpMaXUgSG9uZ3dlaQ0KDQo=

--_000_98E446FD0DC14E37B63E7CB92AFDA6B8fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <335CE5F2DD72DE4A8869035173626D51@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiTVMgR290aGljIjsNCglwYW5vc2UtMToyIDExIDYgOSA3IDIgNSA4
IDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OiJDYW1icmlhIE1hdGgiOw0KCXBhbm9z
ZS0xOjIgNCA1IDMgNSA0IDYgMyAyIDQ7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWlseTpDYWxp
YnJpOw0KCXBhbm9zZS0xOjIgMTUgNSAyIDIgMiA0IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9u
dC1mYW1pbHk6IlxATVMgR290aGljIjsNCglwYW5vc2UtMToyIDExIDYgOSA3IDIgNSA4IDIgNDt9
DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3JtYWwsIGxpLk1zb05vcm1hbCwgZGl2
Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCW1hcmdpbi1ib3R0b206LjAwMDFwdDsNCglmb250
LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCmE6bGlu
aywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXByaW9yaXR5Ojk5Ow0KCWNvbG9yOmJs
dWU7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpzcGFuLkVtYWlsU3R5bGUxOA0KCXtt
c28tc3R5bGUtdHlwZTpwZXJzb25hbC1yZXBseTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fu
cy1zZXJpZjsNCgljb2xvcjp3aW5kb3d0ZXh0O30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHls
ZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtc2l6ZToxMC4wcHQ7fQ0KQHBhZ2UgV29yZFNlY3Rp
b24xDQoJe3NpemU6OC41aW4gMTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjBpbiAxLjBpbiAxLjBp
bjt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+
DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJFTi1VUyIgbGluaz0iYmx1ZSIgdmxpbms9InB1cnBsZSI+
DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+RHVyaW5n
IHJlYm9vdCwgc2h1dGRvd24gc2NyaXB0cyBjaGVjayBmb3IgYW55IGltYWdlcyBpbiBpbml0cmFt
ZnMgYW5kIGl0IG92ZXJ3cml0ZXMgdG8gaXRzIHByZWRlZmluZWQgcGFydGl0aW9uIHZpYSB1cGRh
dGUgc2NyaXB0cy48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5i
c3A7PC9vOnA+PC9wPg0KPGRpdiBzdHlsZT0iYm9yZGVyOm5vbmU7Ym9yZGVyLXRvcDpzb2xpZCAj
QjVDNERGIDEuMHB0O3BhZGRpbmc6My4wcHQgMGluIDBpbiAwaW4iPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+PGI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPkZyb206
IDwvc3Bhbj48L2I+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPm9w
ZW5ibWMgJmx0O29wZW5ibWMtYm91bmNlcyYjNDM7dmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96
bGFicy5vcmcmZ3Q7IG9uIGJlaGFsZiBvZg0KPC9zcGFuPjxzcGFuIHN0eWxlPSJmb250LXNpemU6
MTIuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O01TIEdvdGhpYyZxdW90Oztjb2xvcjpibGFjayI+5Y2X
6YeO44Og44Or44K344Ko44Op44K0PC9zcGFuPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0
O2NvbG9yOmJsYWNrIj4gJmx0OzExODEwNTIxNDZAcXEuY29tJmd0Ozxicj4NCjxiPkRhdGU6IDwv
Yj5TdW5kYXksIE1hcmNoIDEsIDIwMjAgYXQgMTE6MzAgUE08YnI+DQo8Yj5UbzogPC9iPm9wZW5i
bWMgJmx0O29wZW5ibWNAbGlzdHMub3psYWJzLm9yZyZndDs8YnI+DQo8Yj5TdWJqZWN0OiA8L2I+
V2hhdCBkb2VzIG9wZW5ibWMgc3lzdGVtIGRvIGFmdGVyIHVwZGF0ZSBCTUMgRmlybXdhcmUgYW5k
IHRhcHMgcmVib290PzxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPC9kaXY+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIj5HcmVldGluZ3M6PGJyPg0KPGJyPg0KSSBhbSBsZWFybmluZyBob3cgb3BlbmJt
YyB1cGRhdGUgQk1DIGZpcm13YXJlLiBJIGFtIGZvbGxvd2luZyB0aGUgZ3VpZGUgJnF1b3Q7aHR0
cHM6Ly9naXRodWIuY29tL29wZW5ibWMvZG9jcy9ibG9iL21hc3Rlci9jb2RlLXVwZGF0ZS9jb2Rl
LXVwZGF0ZS5tZCZxdW90OyB0byB1cGRhdGUgQk1DIEZpcm13YXJlLiBJdCB3b3JrcyB3ZWxsIGZv
ciBtZS48YnI+DQpCdXQgSSBzdGlsbCBkbyBub3Qga25vdywgd2h5IGluIHN0ZXAgNyBzaG91bGQg
SSByZWJvb3QsIGFuZCB3aGF0IHJlYm9vdCBkbz88YnI+DQpMYXRlciBJIGZvdW5kIGluICZxdW90
O2h0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2RvY3MvYmxvYi9tYXN0ZXIvY29kZS11cGRhdGUv
Y29kZS11cGRhdGUtZGlhZ3JhbXMubWQmcXVvdDssIHdoaWNoIHRlbGxzIHRoYXQ6PGJyPg0KJm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IFsqXSBJbiBhIHN0YXRpYyBs
YXlvdXQgY29uZmlndXJhdGlvbiwgdGhlIGltYWdlcyBhcmUgc3RvcmVkIGluIFJBTSBhbmQgdGhl
IGNvbnRlbnQgaXMgd3JpdHRlbiB0byBmbGFzaCBkdXJpbmcgQk1DIHJlYm9vdC4NCjxicj4NCiZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBSZWZlcmVuY2UgdGhlIHVw
ZGF0ZSBhbmQgc2h1dGRvd24gc2NyaXB0cyBwcm92aWRlZCBieSA8YSBocmVmPSJodHRwczovL2dp
dGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1jL3RyZWUvbWFzdGVyL21ldGEtcGhvc3Bob3IvcmVjaXBl
cy1waG9zcGhvci9pbml0cmRzY3JpcHRzIj4NCmluaXRyZHNjcmlwdHM8L2E+PGJyPg0KSSBhbSB1
c2luZyBhIHN0YXRpYyBsYXlvdXQuIEFuZCBJIGZvdW5kIHR3byBzY3JpcHRzIG5hbWVkICZxdW90
O3NodXRkb3duJnF1b3Q7IGFuZCAmcXVvdDt1cGRhdGUmcXVvdDsgaW4gJnF1b3Q7L3J1bi9pbml0
cmFtZnMvJnF1b3Q7LiBTbyBJIHRob3VnaHQgaXQgaXMgdGhhdCwgdGhlIHVwZGF0ZSBhcHBsaWNh
dGlvbnMgcHV0IHRoZSBmaXJtd2FyZSBpbWFnZSBpbiAvcnVuL2luaXRyYW1mcy8gYW5kIHdoZW4g
SSB0YXAgcmVib290LCBieSBzb21lIG1lYW5zIHRoZSAmcXVvdDt1cGRhdGUmcXVvdDsgc2NyaXB0
IHJ1bnMNCiBhbmQgdGhlICZxdW90O3VwZGF0ZSZxdW90OyBzY3JpcHQgdXNpbmcgJnF1b3Q7Zmxh
c2hjcCZxdW90OyBjb21tYW5kIHRvIHdyaXRlIHRoZSBmaXJtd2FyZSBpbWFnZSB0byB0aGUgL2Rl
di9tdGQuIElzIHRoYXQgcmlnaHQ/PGJyPg0KV2hhdCBoYXBwZW5zIGFmdGVyIEkgdGFwICZxdW90
O3JlYm9vdCZxdW90OywgYW5kIHdobyBjYWxscyB0aGUgJnF1b3Q7dXBkYXRlJnF1b3Q7IHNjcmlw
dCwgYW5kIGhvdyBpdCBjYWxscyB0aGUgJnF1b3Q7dXBkYXRlJnF1b3Q7IHNjcmlwdHM/PGJyPg0K
Q2FuIHNvbWVvbmUgdGVsbCBtZT8gVGhhbmtzIGEgbG90ITxicj4NCjxicj4NCkJlc3QgUmVnYXJk
cyE8YnI+DQpMaXUgSG9uZ3dlaTxicj4NCjxicj4NCjxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8
L2JvZHk+DQo8L2h0bWw+DQo=

--_000_98E446FD0DC14E37B63E7CB92AFDA6B8fbcom_--
