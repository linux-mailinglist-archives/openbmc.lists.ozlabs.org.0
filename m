Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 282AFB6F46
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 00:15:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YZ6D4TbkzF4pd
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 08:15:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=4164fb3d32=wilfredsmith@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="GUru37pw"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="km0A9wgW"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YZ5Y1sC8zF4k3
 for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2019 08:14:24 +1000 (AEST)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.42/8.16.0.42) with SMTP id x8IMC5E4019892;
 Wed, 18 Sep 2019 15:14:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=02VeEX8zxPIEIs7+0eTlXv3YW1ZUjYdQqwni1KX9IJw=;
 b=GUru37pwj4+BKfLqjAWVO8PZ4GbOvhtsxib3UYDv+P6ZkC+47rVnU/Q5ZiotSYHure7u
 MBwENzKJzxPxbkX8wtUZT8MI981vWUPoF83YXczcexbLtIDHOAUf8x7La6eGtZapMdej
 Ku8D4UltKLxgOEqbVy2xteCkk8gSjt+1sIA= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0001303.ppops.net with ESMTP id 2v3vae87ww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 18 Sep 2019 15:14:19 -0700
Received: from ash-exopmbx101.TheFacebook.com (2620:10d:c0a8:82::b) by
 ash-exhub201.TheFacebook.com (2620:10d:c0a8:83::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 18 Sep 2019 15:14:18 -0700
Received: from ash-exhub204.TheFacebook.com (2620:10d:c0a8:83::4) by
 ash-exopmbx101.TheFacebook.com (2620:10d:c0a8:82::b) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 18 Sep 2019 15:14:18 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.100) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 18 Sep 2019 15:14:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j1Ht10xfrEkHN979wFJkMh+4QJFPidDyxN/uRFDGk5Qd60DBIVYJpSJSlX7rMme3nlSF0koJeLX2gLo92LHaIj7Dh7cWOx2KiXtAVKhJ6nMuXU67o0kgEOnZLAQLWjicXcaef13Uuy0n5G6zL8/xKGx+oHi2+HX76IDFqUiDqVcttuUEfKTGdzUTRnLT8puZPushBaxCeHBo9UWHKIm3TqGBiioK62dDR8tcFjB57Cs2WWZNuAVPvcfqUY7bTFak5cH1cde1Zzh/CLTotS0SZCCbKEi2uiQZz6dGZXRmv3+WbmxkRvqsBXLTtbk0lvTLZW1zCJ10U7PEYvzFudrEyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02VeEX8zxPIEIs7+0eTlXv3YW1ZUjYdQqwni1KX9IJw=;
 b=aB+y0nYX3yJyLGqDuFEUASChUrvkuFITIg/0urzvCAsnXWnYLTZL5Ym+L8GN5gZBs6vuBXrqpKV8ZZhBfaRnVbwYQfrLhaduQMUKtKltBltU9CRv969rE4606cxz6EK/5oUveuPFkXTXYj7J/rnXAhAkt/XeUteh2sjN/+xEpC6B7xL9Sj0nbKBTnBjD6WPZif5xPqRLfvo4s+Sy0m+YEgCGRoPf6b7lLBZDAgQgWVt+qV55psb7DEuJg9yLUpDYdhpeb1s9LFoepe0Kr2rEAvfigiHmm3afEWshjfm5rI0BmAKuSaQM8xwdJuf1z2XMlSH5MGyjYIENSML6wEOm1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02VeEX8zxPIEIs7+0eTlXv3YW1ZUjYdQqwni1KX9IJw=;
 b=km0A9wgW/zTpyZXCI0zleepFtgITFZp42l/RM3U/XGik0lZTCqo0OAkZLhEx7zFj4lFmfYI62baq0/sTi9M66PTPcMih637rmQNIhkcpOXc8nHx5qoYGa1ZWNgYcWIqLXQi/uu2U5lSeOXUFi1btZ5muveZdSzegdYtvCYVu+yQ=
Received: from MWHPR15MB1823.namprd15.prod.outlook.com (10.174.254.147) by
 MWHPR15MB1453.namprd15.prod.outlook.com (10.173.234.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.13; Wed, 18 Sep 2019 22:14:17 +0000
Received: from MWHPR15MB1823.namprd15.prod.outlook.com
 ([fe80::c938:1e2c:dc9f:6432]) by MWHPR15MB1823.namprd15.prod.outlook.com
 ([fe80::c938:1e2c:dc9f:6432%6]) with mapi id 15.20.2284.009; Wed, 18 Sep 2019
 22:14:17 +0000
From: Wilfred Smith <wilfredsmith@fb.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: Some Recipes Randomly Fail
Thread-Topic: Some Recipes Randomly Fail
Thread-Index: AQHVbmrOZEN1YldwhE6gGpzaQDskqqcx/3sAgAAAgAA=
Date: Wed, 18 Sep 2019 22:14:16 +0000
Message-ID: <2F5D7E85-CE4F-467D-A944-67DE1E5C0467@fb.com>
References: <857927E9-F872-4F90-A938-1B0635FB230D@fb.com>
 <D675A182-7304-4991-A5A5-261FEDAB62CA@fuzziesquirrel.com>
In-Reply-To: <D675A182-7304-4991-A5A5-261FEDAB62CA@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:9834]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f6a4b3c-4e94-478b-eeb9-08d73c858bd8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MWHPR15MB1453; 
x-ms-traffictypediagnostic: MWHPR15MB1453:
x-microsoft-antispam-prvs: <MWHPR15MB1453319FA177795D11584EA2BD8E0@MWHPR15MB1453.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(376002)(396003)(39860400002)(346002)(136003)(199004)(189003)(3480700005)(6436002)(486006)(66946007)(81156014)(186003)(71200400001)(81166006)(8676002)(71190400001)(6246003)(66446008)(66476007)(66556008)(33656002)(446003)(6512007)(76116006)(8936002)(4326008)(2616005)(64756008)(478600001)(46003)(25786009)(6506007)(14444005)(5660300002)(36756003)(4744005)(86362001)(6116002)(11346002)(476003)(305945005)(7736002)(229853002)(6486002)(76176011)(6916009)(102836004)(2906002)(53546011)(99286004)(256004)(316002)(14454004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1453;
 H:MWHPR15MB1823.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RzXJ7IbTWN8ZTPtIz+VNz88ESMmCtWBIZXrlDJ0WOCfKPR73xr7L9H7QatT5Ur2SWmspjS/2wvGGmaygNOjSfce79noMP52n29zyHJ7Zt8kvxK5uJ4xDHdMTMUd770ZzfIHvSbEIMMdIkmykaTF/C4ZQZRI3w5y4fqDyBX4/p5BK9I0/SIxgpvMAGfxcyucicfkYdkf773M8NK8WeYwU4L0MESk0yaQiqm2541v6xe1JVDD4AtU9FjyYb8OE3hSGhMU+yIAE+a9KRM6xfxXltRfvbobifubcUDkohjkZJZK8Jia39gUzBGhc5uLSQQXcDLw+91nNKxxfkTkpl6VeV9n5AvBPg2O6adN/AxTNY1ordDSDHwu4hkquQdQS7AwQTIRuloFYTWaLhs2poOD2vD4bqkj0IBYbfqHML+zm9jk=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C27680C733B7F4EAFB6E027A2EAF958@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f6a4b3c-4e94-478b-eeb9-08d73c858bd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 22:14:17.0021 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ywo/1uMZKQu0fH7sKqhQNXRpYONv1wOxKKUhf+g+J/PBlQTIIlUIQgaG2pg/LX5eUj7XHciW/BiK3j8pIptcjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1453
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-18_10:2019-09-18,2019-09-18 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0
 mlxlogscore=361 bulkscore=0 malwarescore=0 mlxscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1909180187
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

VGhhbmtzLiBXaWxsIGRvLiBJIHByZXN1bWUgdGhhdCBtZWFucyB0aGlzIGlzIG5vdCBzb21ldGhp
bmcgYW55b25lIGVsc2UgaXMgc2VlaW5nLi4uDQoNCldpbGZyZWQNCg0KPiBPbiBTZXAgMTgsIDIw
MTksIGF0IDM6MTIgUE0sIEJyYWQgQmlzaG9wIDxicmFkbGV5YkBmdXp6aWVzcXVpcnJlbC5jb20+
IHdyb3RlOg0KPiANCj4gYXQgNTo0OCBQTSwgV2lsZnJlZCBTbWl0aCA8d2lsZnJlZHNtaXRoQGZi
LmNvbT4gd3JvdGU6DQo+IA0KPj4gYSDigJxCaXRiYWtlIG9ibWMtcGhvc3Bob3ItaW1hZ2XigJ0g
d2lsbCBvZnRlbiBmYWlsIGEgcmVjaXBlIHdpdGggY29tcGlsYXRpb24gZXJyb3JzIHRoYXQgZ28g
YXdheSBpZiBJIHJlYnVpbGQgdGhhdCBwYXJ0aWN1bGFyIHJlY2lwZS4NCj4gDQo+IE5leHQgdGlt
ZSBpdCBoYXBwZW5zIHNlbmQgdGhlIGZhaWx1cmUgdGhhdCBpcyBwcmludGVkIHRvIHRoZSBzY3Jl
ZW4gYWxvbmcgYW5kIHdl4oCZbGwgc2VlIGlmIHdlIGNhbiBmaWd1cmUgaXQgb3V0Lg0KPiANCj4g
LWJyYWQNCg0K
