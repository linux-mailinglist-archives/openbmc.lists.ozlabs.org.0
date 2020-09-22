Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DD6274A3E
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 22:41:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwtW95s4JzDqTQ
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 06:41:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=6534d30414=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=jsx4h9vf; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=RF1IPI1d; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwtVK6x3lzDqMv
 for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2020 06:40:23 +1000 (AEST)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08MKbeWg011512; Tue, 22 Sep 2020 13:40:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=+VdLrDN2ZurU1qJxOSgKNgoz+obu8n7BM7YnuyJx8uM=;
 b=jsx4h9vfE4SMTaDGzSP2duxrNEPCzzuGlitXeZPlKYCA8ghTHFGAyhag2jL8+uhb0P2c
 BDuJvd1amwSy2cdyOOJKMyCk1BJCwNaaKwaT14U2FuC7fSb2hLZy4JGEpm2WQdTGX9y/
 b+HWOHHhH5CmuE85BEKbIKdCjteN+Y7mJbg= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 33p1ftd5r2-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 22 Sep 2020 13:40:20 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.101) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 22 Sep 2020 13:40:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SvDVZmXR6Cuz8dyKzIB3ranLs0ZCVtd7Ad9jztAzsOiZB7NfwLpEIMIdUEtvtbVRq/V93KILUst8sBqK4n6Kd+GpqrG1q2UHZ16zltfFV5A7T43u6YiyBv0YKFR17IwFPCfGwgomSpb81kIEjCOUJSQ3H3y9MuTdO83xwW0NU0ZNDSSybGfPG2Jgt7KF65SnQWvuuG561CqTkBoQ01vCA2kLFjjSzriufTLUmXYGLqVEm4HNDIFr5BwEh6OHK3quPVYNt+DmbLGvJE1OSi6gfbgyxvR9TgJSa3YaKwLJ1wxvraAMnexym9mOQAWFU9T8ddxRWNMDN8mrcPiKNQ/h1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+VdLrDN2ZurU1qJxOSgKNgoz+obu8n7BM7YnuyJx8uM=;
 b=eRBx/TXmDfqeDBakUP16rQPgom0CLXUcvuhJikFenrtPygy7BZ2db4Jtmyj8MKhv1rCGcryERKI0NfODws0d6ebOWv0SI3qa1TWnfxBO26dpwlHoWiT+qFtU3z9yQGdUhFY1RP4TP7FXko2700FBCDHdXOKaqCRTvU2ErPgoLA+55YViWrtJ+U5FJDIOeiFGWRCEbsqfQ6uVIWk8Ij0ANyVOpUHP50pHiWM2H3dY3eOsllFlmKz59Za11QbRZ/2eFPrsXqOKO4yM6Y5+ppNVUxuHwJIkapk3sShxqea3m1ppnp3bGYj6JIv6Gcetbfd5GqVAWFDvVkFcQplQBgtepg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+VdLrDN2ZurU1qJxOSgKNgoz+obu8n7BM7YnuyJx8uM=;
 b=RF1IPI1dxF9AzNjtiq03+czms62e+f0Ev9NSQ4peYkcIC+3UlozTB5DZvLGWP9j2ioZZhBrF3LHYZ85lst7vHLTFLICKyRPvdAjpQSR9VHodajzVUIYN3AT+c6D1PSBhgdcmTs5T6oko9cvf1WM7E1SZYz1XMMi7EDtGJMF/hJg=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2696.namprd15.prod.outlook.com (2603:10b6:a03:156::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Tue, 22 Sep
 2020 20:40:18 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4%7]) with mapi id 15.20.3391.027; Tue, 22 Sep 2020
 20:40:18 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, Ed Tanous <ed@tanous.net>
Subject: Re: interest in a minimal image recipe
Thread-Topic: interest in a minimal image recipe
Thread-Index: AQHWi58zEOwKc47hCUe0SSUl2C7L4altUs8AgAXC9gCAADGrAIAAIUGAgAFL4IA=
Date: Tue, 22 Sep 2020 20:40:18 +0000
Message-ID: <DB1605BB-81F4-4297-9BC0-BC1B054BAAEB@fb.com>
References: <20200915202832.rq3os62pdj7mzaco@thinkpad.fuzziesquirrel.com>
 <CACWQX80tELWA-EW0A8-DnJGFmJyMxDC04YTq4B+--bRaoV8rOQ@mail.gmail.com>
 <20200921125540.4d6amvus3wt57igg@thinkpad.fuzziesquirrel.com>
 <CACWQX82i4k+PADJkOjDQEeUAQJtve+pySLRQVcqR7XayG5cJCw@mail.gmail.com>
 <20200921175227.zmdjbmixbwvstd4m@thinkpad.fuzziesquirrel.com>
In-Reply-To: <20200921175227.zmdjbmixbwvstd4m@thinkpad.fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fuzziesquirrel.com; dkim=none (message not signed)
 header.d=none;fuzziesquirrel.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:a5f3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 42779612-b56d-4dc8-4924-08d85f37b7ab
x-ms-traffictypediagnostic: BYAPR15MB2696:
x-microsoft-antispam-prvs: <BYAPR15MB269629FC700B2BD0BEAF3FDDDD3B0@BYAPR15MB2696.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RoSgPja2SSwWyKRchyjYDU4wM4jZtiWQ4kpDEYYjsgddNrkFc69pd+tjAklafL0yD2DyuaEQhQCvYOjhvMA0HJJOHjX+t2lR3i96ek/FOgsdnpgqhkbH93ySL+XfgCoUfiRaDVp+w4P+W3Csu5jP2+E5GLw8ltQtjt3DrztNU3Y10PklfWMBD1Qi1A8aqDG+O9X2ivAb1QN+gEo6UGtTCzz/YtPK/PDfFsPa4tKP9/afncJrO9Kq/nEC5eJYrQapQlMeZbsFRjoh75n+AuFYrQJgjvMKVyKjM83+BdN4JaepDjKp+WOMIv3MJAeSyxWl2e/8C2nqnmAFL5w3REx0dKqD8h93nk8D1BidrOVz56vRZV4UPnLw05g4pVRiDiry
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(39860400002)(136003)(376002)(346002)(36756003)(5660300002)(91956017)(186003)(2906002)(83380400001)(86362001)(6512007)(76116006)(4326008)(66946007)(66476007)(66556008)(64756008)(66446008)(478600001)(316002)(6506007)(8936002)(6486002)(110136005)(2616005)(8676002)(33656002)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: VxLWnnPXvF988LFJdEfcUKRPSvfMRqjWqReZR6HrRDPeaYpumwpsDZE5qxpricmEC+PmlEWibrJPYoiG8aFpcGARKxzM2EQTtI2luvvYkcekIsB6RWdF4Mziv7MG2K0DIdR/UTfQCVtJxfhnaOlyodTKbRWi4fReww4XPmLLXdDh8Mq1gOYupLGcmexQ7b1oWN4jdvv1uHcDbodQ8YUlmwYKGbX+lWaRWiRhOOXp/KUxRp6th9ATu25bkc6Pss0Hrdr9W5mVLQ6su1SfbzkP4ppbyrDWXjJBUzwLcTkg/Hr+dj58u4tXh1Ql/0ojGuEGtexWXG2ALawH581Wxei6h/UHtQN+47KrDvUXX7e89GK2z3GksHYlnOl/HD2wadQHhwP5ql37g2g63VwSgSn7ZDKe91TWq3R7UWtRyLJJZ9siJQcwFM4K9Mn+jfnlTbqr7gyMLshd0111uAcXbZlMdDEn0brX6ILi4bjAA8HufHZvuXEGQjjjZ3nWeRF2FdZ6VdDpUS2ZubiEX5PBKC2h/R6EP0fPy6a2ay6JrjzN6aSaPuF8J44DkTxDBZDts1eC1KQheAK1yF9gbQXcjWaxm8l+Xp0bEWkAD7KaG3kPWITEmhCmnn6oe8PJbu3H/CvPRRZG1nwpX2UGBomPjKokhmLdwEVDP5DthjW4j0aKzMSZNE3SpRJaXVYalZBYrfrt
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <0FBD3FDC4F909E48AFF2C0195540D1C6@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42779612-b56d-4dc8-4924-08d85f37b7ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2020 20:40:18.1671 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1c+nBsLOEg9ONELbwpPXq/ZT04VID34oQoKsmY3XC5o8LiNAunjTRbT9BA7h96cQhgZhrEb9gIE8N3U0oAhSnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2696
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-22_18:2020-09-21,
 2020-09-22 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 adultscore=0 mlxscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009220161
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

DQoNCu+7v09uIDkvMjEvMjAsIDEwOjU3IEFNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgQnJhZCBC
aXNob3AiIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFicy5v
cmcgb24gYmVoYWxmIG9mIGJyYWRsZXliQGZ1enppZXNxdWlycmVsLmNvbT4gd3JvdGU6DQoNCiAg
ICBPbiBNb24sIFNlcCAyMSwgMjAyMCBhdCAwODo1MzoyNkFNIC0wNzAwLCBFZCBUYW5vdXMgd3Jv
dGU6DQogICAgPk9uIE1vbiwgU2VwIDIxLCAyMDIwIGF0IDU6NTUgQU0gQnJhZCBCaXNob3AgPGJy
YWRsZXliQGZ1enppZXNxdWlycmVsLmNvbT4gd3JvdGU6DQogICAgPj4NCiAgICA+PiBJbiB3aGF0
IHdheSBkb2VzIEVNIHJlcXVpcmUgaW50ZWwtaXBtaS1vZW0/ICBJIGFtIHVzaW5nIEVNIHdpdGhv
dXQNCiAgICA+PiBpbnRlbC1pcG1pLW9lbSB3aXRob3V0IChJIHRob3VnaHQgYW55d2F5KSBpc3N1
ZS4NCiAgICA+DQogICAgPllvdSdyZSBydW5uaW5nIEVudGl0eSBNYW5hZ2VyLCB3aXRob3V0IGlu
dGVsLWlwbWktb2VtLCBhbmQgeW91IGNhbiBydW4NCiAgICA+YSBzdWNjZXNzZnVsICJpcG1pdG9v
bCBzZW5zb3IgbGlzdCIgb3IgImlwbWl0b29sIGZydSBwcmludCIgY29tbWFuZCwNCiAgICA+YW5k
IGhhdmUgaXQgcmV0dXJuIHRoZSBlbnRpdHkgbWFuYWdlci9kYnVzLXNlbnNvcnMvRnJ1RGV2aWNl
IHJlc3VsdHM/DQoNCiAgICBBaCwgbm93IEkgdW5kZXJzdGFuZC4gIE5vLCBJIGNhbid0IGRvIHRo
YXQuICBCdXQgSSBkb24ndCBuZWVkIHRvIGJlY2F1c2UgDQogICAgdGhlIGRlZmF1bHQgSVBNSSBo
YW5kbGVyIGltcGxlbWVudGF0aW9ucyBpbiBwaG9zcGhvci1ob3N0LWlwbWlkIHdvcmsgZm9yIA0K
ICAgIG1lICh0aGUgWUFNTCBiYXNlZCBvbmVzKSwgYW5kIHRob3NlIGRvbid0IG5lZWQgZW50aXR5
LW1hbmFnZXIuICBJJ20gDQogICAgdXNpbmcgZW50aXR5LW1hbmFnZXIgZm9yIG90aGVyIHJlYXNv
bnMuDQoNCiAgICBBcyBhbiBhc2lkZSAtIEkgdGhpbmsgYSBtYWpvcml0eSBhcmUgdXNpbmcgdGhl
IGludGVsLWlwbWktb2VtIGhhbmRsZXJzIA0KICAgIG5vdyBzbyBJJ2Qgc3VwcG9ydCBtb3Zpbmcg
dGhvc2UgaW50byBwaG9zcGhvci1ob3N0LWlwbWlkIGFuZCB1c2luZyB0aGVtIA0KICAgIGFzIHRo
ZSBkZWZhdWx0cy4gIEJ1dCB0aGF0IG11c3Qgbm90IGJlIGVhc3ksIG90aGVyd2lzZSBJbnRlbCB3
b3VsZCBoYXZlIA0KICAgIGp1c3QgZG9uZSB0aGF0IHJhdGhlciB0aGFuIGZvcmtpbmcgdGhlIGhh
bmRsZXJzIGluIGludGVsLWlwbWktb2VtIGluIHRoZSANCiAgICBmaXJzdCBwbGFjZS4NCkkgc3Vw
cG9ydCBtb3ZpbmcgbWFueSBzdGFuZGFyZCBjb21tYW5kcyBmcm9tIGludGVsLWlwbWktb2VtIHRv
DQpwaG9zcGhvci1ob3N0LWlwbWlkLiAgRW50aXR5IG1hbmFnZXIgaXMgcmVxdWlyZWQgb25seSBm
b3IgZnJ1IGFuZA0Kc2Vuc29yIFNEUiBpcG1pIGNvbW1hbmQgYnV0IHRoZXJlIGFyZSBtYW55IG90
aGVyIGNvbW1hbmRzDQp3aGljaCBhcmUgdXNlZnVsIGFuZCBjYW4gYmUgbW92ZWQuDQoNCiAgICBC
dXQgaW4gYW55IGNhc2UsIGludGVsLWlwbWktb2VtIHJlcXVpcmVzIGVudGl0eS1tYW5hZ2VyLCBu
b3QgdGhlIG90aGVyIA0KICAgIHdheSBhcm91bmQgcmlnaHQ/ICBUaGUgImZlYXR1cmUiIGJlaW5n
IHNlbGVjdGVkIGhlcmUgaXMgdGhlIEludGVsIElQTUkgDQogICAgaGFuZGxlciBmb3JrcywgYW5k
IHRoYXQgd291bGQgc2ltcGx5IGRlcGVuZCBvbiBlbnRpdHktbWFuYWdlci4gIEEgDQogICAgc3Ry
YXdtYW46DQoNCiAgICBvYm1jLXBob3NwaG9yLWltYWdlLmJiY2xhc3M6DQogICAgRkVBVFVSRV9Q
QUNLQUdFU19pbnRlbC1pcG1pLWhhbmRsZXItZm9ya3MgPSAicGFja2FnZWdyb3VwLWludGVsLWlw
bWktaGFuZGxlci1mb3JrcyINCg0KICAgIHBhY2thZ2Vncm91cC1vYm1jLWFwcHMuYmI6DQogICAg
UkRFUEVORFNfcGFja2FnZWdyb3VwLW9ibWMtYXBwcy1pbnRlbC1pcG1pLWhhbmRsZXItZm9ya3Mg
PSAiaW50ZWwtaXBtaS1vZW0iDQoNCiAgICBpbnRlbC1pcG1pLW9lbS5iYjoNCiAgICBSREVQRU5E
U18ke1BOfSA9ICJlbnRpdHktbWFuYWdlciINCg0KICAgIE9uZSBwcmVyZXF1aXNpdGUgdG8gdGhp
cyBpcyB0aGF0IHRoZSBpbnRlbC1pcG1pLW9lbSByZWNpcGUgd291bGQgbmVlZCB0byANCiAgICBt
b3ZlIHRvIG1ldGEtcGhvc3Bob3IuICBQZXJoYXBzIGl0cyB0aW1lIGZvciB0aGUgcmVwbyB0byBi
ZSByZW5hbWVkIGludG8gDQogICAgc29tZXRoaW5nIGVsc2UuDQpXZSBtYXkgaGF2ZSB0byBzcGxp
dCBhbmQgbG9vayBmb3Igd2hhdCB3ZSBuZWVkIGZyb20gaW50ZWwtaXBtaS1vZW0uIFRoZXJlDQph
cmUgbG90cyBvZiBpbnRlbCBvZW0gc3BlY2lmaWMgY29tbWFuZCBpbiB0aGlzIHdoaWNoIGFyZSBu
b3QgdXNlZnVsIGZvcg0KbWFueSBvdGhlciBwbGF0Zm9ybXMgYW5kIGFyZSBvdmVycmlkZGVuIGJ5
IHRoZWlyIG93biB4eC1pcG1pLW9lbS4NCg0KV2Ugc2hvdWxkIHNpbXBseSBwb3J0IHN0YW5kYXJk
IGlwbWkgY29tbWFuZCBmcm9tIGludGVsLWlwbWktb2VtIHRvDQpQaG9zcGhvci1ob3N0LWlwbWlk
Lg0KDQogICAgPkluIG15IHVuZGVyc3RhbmRpbmcsIHRoaXMgc2hvdWxkbid0IHdvcmssIGFuZCB3
ZSd2ZSBoYWQgbWFueSByZXBvcnRzDQogICAgPm9mICJJIGVuYWJsZWQgZW50aXR5IG1hbmFnZXIs
IGFuZCBteSBzZW5zb3JzIGRvbid0IHNob3cgdXAgaW4gSVBNSSIuDQogICAgSSBkb24ndCB0aGlu
ayB0aGUgYW5zd2VyIHRvICJob3cgZG8gSSBlbmFibGUgSVBNSSBzZW5zb3JzIiB3YXMgZXZlciAN
CiAgICAiZW5hYmxlIGVudGl0eSBtYW5hZ2VyIiB3YXMgaXQ/ICBUbyBlbmFibGUgSVBNSSwgeW91
IGhhdmUgYWx3YXlzIG5lZWRlZCANCiAgICB0byBlbmFibGUgZWl0aGVyIHRoZSBvcmlnaW5hbCBZ
QU1MIGJhc2VkIGhhbmRsZXJzIG9yIHRoZSBpbnRlbC1pcG1pLW9lbSANCiAgICBmb3Jrcy4NCg0K
V2Ugc2hvdWxkIGZpeCB0aGlzIGluIGhvc3QtaXBtaWQsIGFzIGFsbCBzZW5zb3JzIGFyZSBhZGRl
ZCB0byBzdGFuZGFyZCBkYnVzDQpJbnRlcmZhY2UgYW5kIGlmIGl0IGlzIG5vdCBkaXNjb3ZlcmFi
bGUgYnkgbWFwcGVyIG9yIG9iamVjdCBtYW5hZ2VyIHRoZW4gd2UNCnNob3VsZCBmaXggaXQgc28g
dGhhdCBhbiBTRFIgY2FuIGJlIGJ1aWx0IGluZGVwZW5kZW50IG9mIHNlbnNvciBpbXBsZW1lbnRh
dGlvbi4NCg0K
