Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4AE254D3D
	for <lists+openbmc@lfdr.de>; Thu, 27 Aug 2020 20:43:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bcs7D3ZS1zDqlR
	for <lists+openbmc@lfdr.de>; Fri, 28 Aug 2020 04:43:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=5508e0cde0=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=GBYYvfcP; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=Fl/nmxMu; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bcs6H0nlzzDqgq
 for <openbmc@lists.ozlabs.org>; Fri, 28 Aug 2020 04:42:28 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id 07RIdfPG016404;
 Thu, 27 Aug 2020 11:42:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=8GoCv0uK2+gP7ImNGpD7WEMx5Wd7KJTYilXeAn8A7zE=;
 b=GBYYvfcPdDeLzpIBD/T1PhvthU4qyh41IdO6rDj5NEewT1YV408wqcDY13kXAWX/+LlK
 YYukwcvJso1Mt0wgmxElNebvd+GlG/iNhOizq0XjOaZNMt0E2d7ny92PHhI5YQJLhSsX
 bYXwcua99u/g0+2XBHAjYvJaaCY2lPij+WA= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0089730.ppops.net with ESMTP id 335up6xvx8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 27 Aug 2020 11:42:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.175) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 27 Aug 2020 11:42:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mw/rZ2NZk5zRnDrvnGBg94Mbp+5LcIVOns0xX2XQitv4dnthVLOuV7ngeNARxYpH6I+KyHF6baOTMisKTLCWNFod6t5djAGm8lA3swNr/GuiMG2U9mEO8ykTWYng1x6NsrzI4sF4nrXDQX0IHRWbB3z6ZvdrzwidJRBBElOJML/bH9jQ0QOKDJc5753MeK/rPb6GhnvOZwTwFLlBhzJaHrsaEM45eFvSm9cCX4N562bP1EThZZ+jBTpEFvOWNa7+c7YPWUKoxnSEdLqvdCRmWeABc/lr5VP1vORcWi97t+mFUP3orUjJOHB0wv0GeWo2a7m3pPFbzpTBandiaEvcJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8GoCv0uK2+gP7ImNGpD7WEMx5Wd7KJTYilXeAn8A7zE=;
 b=BMl934Fg58rvYFQfANWs++MfA2fVi4GousBEkkYjpyTcvMt/otV9sY1cduAHhSq7dTEaDWLsqkSV7la0yLcyprERnK3pdb1/XZ1cZsbB+rB7aQYb9WK1yf6B/vepZq4xPJSk9w2OO1DZe3M4AGDAu19yFrUt1MNhCP21B5VxuvbnBUrjqbK5ooYrO58AWaGJFlee4rJzF0FyXHZqDlqQD90pkijuCBlR1x5BX57Z/0vgjEy1yvn2Xq78cGeQOA2UXca69hgBPgkJM4M6G7LWFK9KBl/VbMBbXE+yAs2bAqmldoN2nAcIvdjUB6NG9cnw4AkS09iEBYjqzCFbAyrmJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8GoCv0uK2+gP7ImNGpD7WEMx5Wd7KJTYilXeAn8A7zE=;
 b=Fl/nmxMugoBeZt1neCJz2KPnhbaziTn6UO67pBE/2CW6xdU8kIj6XIVFWIq2g1lTzuZH00iTqswYW7nBPUdTMrRN8spADRNDEvDOZPyIMzSzm+1RZd3QQ4cyGERXntR9AWveQL4QnsiurLvm/x/88mJbtAh2yXz4V8WH1eM6MFE=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Thu, 27 Aug
 2020 18:42:23 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::2908:ebc2:73a5:45b3]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::2908:ebc2:73a5:45b3%5]) with mapi id 15.20.3305.032; Thu, 27 Aug 2020
 18:42:23 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Neil Bradley <Neil_Bradley@phoenix.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Tioga Pass OpenBMC 2.8
Thread-Topic: Tioga Pass OpenBMC 2.8
Thread-Index: AdZ4G9/pZ44Ttxs7TiCWRTJU7JTTHQCA72kAAA7UvEAAALC0EP//pIUA//+ESKCAAIvbAP/+FToQgASWKQD//4oO4AAPAmyA//83aBD//mFVgP/8P4nQ//jwJQD/8Lm7oP/h0XgA
Date: Thu, 27 Aug 2020 18:42:23 +0000
Message-ID: <1B902FE1-006C-4199-B2C1-04F70459205C@fb.com>
References: <c27c916296c14b7a973ce10ce462a574@SCL-EXCHMB-13.phoenix.com>
 <5F804DFD-B91D-4293-A410-62ED737423A7@fb.com>
 <6bc3d9da57d44f55ad66179e74a51bd1@SCL-EXCHMB-13.phoenix.com>
 <a5e34d90e0c34849a672189f8adf9cd7@SCL-EXCHMB-13.phoenix.com>
 <AA3AD0B7-CC74-4B6C-927D-101A3E721004@fb.com>
 <b62681c4a4c148b58cdd9ff1e614d400@SCL-EXCHMB-13.phoenix.com>
 <22D145E2-1328-428F-9AAF-54E138797994@fb.com>
 <ba0c0f989f1045f98a5186a57917c4b6@SCL-EXCHMB-13.phoenix.com>
 <E2ECF617-0F2B-4526-A2F9-20F343F317A3@fb.com>
 <b6891a4662b04509ae5ed0f8c54777ce@SCL-EXCHMB-13.phoenix.com>
 <868F639F-7878-4B90-8CAE-7C95EB57B26E@fb.com>
 <9b4d083d50ad4feba14f5c8848540ade@SCL-EXCHMB-13.phoenix.com>
 <58DA7165-A3A6-4939-B580-53A5AFD7C9C5@fb.com>
 <588c033deaf143059c0ebab0775ed071@SCL-EXCHMB-13.phoenix.com>
 <15B14938-4BE1-4BD3-82A4-3B33743A74F0@fb.com>
 <aa7ea5b45d664e1a99a53a81b6f7e2d8@SCL-EXCHMB-13.phoenix.com>
In-Reply-To: <aa7ea5b45d664e1a99a53a81b6f7e2d8@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: phoenix.com; dkim=none (message not signed)
 header.d=none;phoenix.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2601:647:4b00:fd70:18e2:66b5:5e3d:3d1a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 283d3deb-c70a-4aa8-217d-08d84ab8efed
x-ms-traffictypediagnostic: BY5PR15MB3667:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR15MB3667991B586F9BD649754ED5DD550@BY5PR15MB3667.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: txIMVqrAxflHvhPc1tJVZAHmLIh1DXILpyO+1C/fh0rqVfcRKp71p1FRHmOvkiYpl3ZGmRs0Ri8sfm5eeBMkD9fkzXkjlkC/uNlJLc8vMktrzcunjkHPw0nE6wXZCccAPg9C73vvCTjeUjlp6VmuX0eCx2tPHp1cXB10KVb3VQp+V3OEO5OoKYW/fvV2Z9TPEURlJC9thQfLaRg/DcIwKx2ytvUXw0vzkj9/uP/NmO7xbsrHPW3/BgTb8Q5MXX6SUBolnIK5yR0Dyj/ySntCLdjmRyD+ZyF7KdzYTb6j6hhLtvpiVQ2EDvU9FH5dH8uMV7epXSF5d31+pZusohUMjjipgwrwpcxJ7Zm+3gIzseqM12CbuF1hQap0x3OTGyDD4/REyEzSaNFZgM6AeESGHw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(39860400002)(376002)(136003)(346002)(86362001)(53546011)(83380400001)(6506007)(2906002)(64756008)(76116006)(66556008)(66476007)(66946007)(2616005)(186003)(66446008)(6486002)(36756003)(6512007)(8676002)(33656002)(4326008)(8936002)(166002)(316002)(71200400001)(5660300002)(110136005)(478600001)(7116003)(966005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: z4D59xDetHditbqqCYUmWoUyHKFk59N4LmXd9tgk75ozAiZ3MXNxCnID4mW7/IFf28AUPHk17JHP8Ocgm8NeUEAsqIrqWHAbp59S/sobCjhP4Or3BnHTRs4zwUHG5o5UTrU7dYN981AhW6UinI9PRZjZSkHOwsCoSlAeYg745mJqHyNm9m/6RKP9EAEzKHqNGPkntf6R9Qzz1TujauVwQI4Dogm52uMec8liFRD2bGREiURyUC4hxGvBnnS2mJ6ckpisLDoZRr0zwcl3kZAhFsgLBTZUy43QoDtSSHlddOY1x9EzUNN+iIgUXa4KKd3R/fqwgInIBypecmeoACpDfi/KX5dfzxB8+AE8aHclnfMM8AVJueJbdFqlRiil4+nOsFdmbGV8AcjsDNtOGp22npewkuzKo0mMiS8DQfAADNx4QmR/5sf5YAs4skZ8UTOq4vTZ+YmSDQm8DeFJECQehYReaUmQxUtTkfR39o+Lywz2raclv3AGU+MwCLTrIA72kawReKTd31eEKRilw7qSeCnGnMN2gbRZ9msfXUHjQ76SSP6jtfrwP0Vh0g7fVpI6dd5KnGrBT87+iwiBvJ13eHS7Ie7O3laY3J6o3D1RpSLOAKtOcs40VrD4+VuZ8wVKhiQQ4gj/A9T5AvsvuzTRRUzRRh/h/+lE0ZarCZLnbDVym7UcncnFOhhilhLaLtn7PTm5+yLJ/VJqTSisUa3Rrg==
Content-Type: multipart/alternative;
 boundary="_000_1B902FE1006C4199B2C104F70459205Cfbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 283d3deb-c70a-4aa8-217d-08d84ab8efed
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2020 18:42:23.0849 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: etygPFqhJG1WvQ62SEAP4jZY2Kp5GTsksx3ni0lA9Y1R1p2qrJVRHPf40ZqjOn49jKvY/E46lmjKYx8GkenTAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3667
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-27_10:2020-08-27,
 2020-08-27 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 adultscore=0
 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 clxscore=1015 spamscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008270139
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
Cc: Amithash Prasad <amithash@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_1B902FE1006C4199B2C104F70459205Cfbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

aHR0cHM6Ly9naXRodWIuY29tL2ZhY2Vib29rL29wZW5ibWMvICBpcyBzZXBhcmF0ZSBGQiBpbnRl
cm5hbCByZXBvIGZvciBGQiBwbGF0Zm9ybXMgYW5kIGl0IGlzIG5vdCBhIHBhcnQgb2YgTEYgb3Bl
bmJtYy4NCg0KRnJvbTogb3BlbmJtYyA8b3BlbmJtYy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNv
bUBsaXN0cy5vemxhYnMub3JnPiBvbiBiZWhhbGYgb2YgTmVpbCBCcmFkbGV5IDxOZWlsX0JyYWRs
ZXlAcGhvZW5peC5jb20+DQpEYXRlOiBUaHVyc2RheSwgQXVndXN0IDI3LCAyMDIwIGF0IDEwOjIy
IEFNDQpUbzogVmlqYXkgS2hlbWthIDx2aWpheWtoZW1rYUBmYi5jb20+LCAib3BlbmJtY0BsaXN0
cy5vemxhYnMub3JnIiA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0KQ2M6IEFtaXRoYXNoIFBy
YXNhZCA8YW1pdGhhc2hAZmIuY29tPg0KU3ViamVjdDogUkU6IFRpb2dhIFBhc3MgT3BlbkJNQyAy
LjgNCg0KQXMgYW4gYXNpZGUsIHdoYXQgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiBPcGVuQk1D
IHByb3BlciBhbmQgdGhlIHJlcG8gYXQgaHR0cHM6Ly9naXRodWIuY29tL2ZhY2Vib29rL29wZW5i
bWMvID8NCg0KVGhhbmtzIGFnYWluISBXZeKAmWxsIHJ1biBvdXIgdGVzdHMgb24gdGhlIGxhdGVz
dCB0b2RheS4NCg0KLS0+TmVpbA0KDQpGcm9tOiBWaWpheSBLaGVta2EgPHZpamF5a2hlbWthQGZi
LmNvbT4NClNlbnQ6IFdlZG5lc2RheSwgQXVndXN0IDI2LCAyMDIwIDExOjQ1IFBNDQpUbzogTmVp
bCBCcmFkbGV5IDxOZWlsX0JyYWRsZXlAcGhvZW5peC5jb20+OyBvcGVuYm1jQGxpc3RzLm96bGFi
cy5vcmcNCkNjOiBBbWl0aGFzaCBQcmFzYWQgPGFtaXRoYXNoQGZiLmNvbT47IFNhaSBEYXNhcmkg
PHNkYXNhcmlAZmIuY29tPg0KU3ViamVjdDogUmU6IFRpb2dhIFBhc3MgT3BlbkJNQyAyLjgNCg0K
Tm8sIHlvdSBjYW4gc2F5IHRoYXQgcG93ZXIgY29udHJvbCBmb3IgdGlvZ2FwYXNzIHdhcyBhdmFp
bGFibGUgZnJvbSBrZXJuZWwgNS43IG9ubHkuDQoNCkZyb206IE5laWwgQnJhZGxleSA8TmVpbF9C
cmFkbGV5QHBob2VuaXguY29tPG1haWx0bzpOZWlsX0JyYWRsZXlAcGhvZW5peC5jb20+Pg0KRGF0
ZTogV2VkbmVzZGF5LCBBdWd1c3QgMjYsIDIwMjAgYXQgMTE6MjkgUE0NClRvOiBWaWpheSBLaGVt
a2EgPHZpamF5a2hlbWthQGZiLmNvbTxtYWlsdG86dmlqYXlraGVta2FAZmIuY29tPj4sICJvcGVu
Ym1jQGxpc3RzLm96bGFicy5vcmc8bWFpbHRvOm9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4iIDxv
cGVuYm1jQGxpc3RzLm96bGFicy5vcmc8bWFpbHRvOm9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4+
DQpDYzogQW1pdGhhc2ggUHJhc2FkIDxhbWl0aGFzaEBmYi5jb208bWFpbHRvOmFtaXRoYXNoQGZi
LmNvbT4+LCBTYWkgRGFzYXJpIDxzZGFzYXJpQGZiLmNvbTxtYWlsdG86c2Rhc2FyaUBmYi5jb20+
Pg0KU3ViamVjdDogUkU6IFRpb2dhIFBhc3MgT3BlbkJNQyAyLjgNCg0KRG9lcyB0aGlzIG1lYW4g
dGhlIG9mZmljaWFsIDIuOCByZWxlYXNlIHdhcyBicm9rZW4gaW4gdGhpcyByZWdhcmQ/IFdlIGFy
ZW7igJl0IHVzaW5nIHRoZSBsYXRlc3QgJiBncmVhdGVzdCwgYnV0IGl04oCZcyB3b3J0aCBhIHNo
b3QuIFdpbGwgZG8gdG9tb3Jyb3chDQoNCi0tPk5laWwNCg0KRnJvbTogVmlqYXkgS2hlbWthIDx2
aWpheWtoZW1rYUBmYi5jb208bWFpbHRvOnZpamF5a2hlbWthQGZiLmNvbT4+DQpTZW50OiBXZWRu
ZXNkYXksIEF1Z3VzdCAyNiwgMjAyMCAxMDo0MCBQTQ0KVG86IE5laWwgQnJhZGxleSA8TmVpbF9C
cmFkbGV5QHBob2VuaXguY29tPG1haWx0bzpOZWlsX0JyYWRsZXlAcGhvZW5peC5jb20+Pjsgb3Bl
bmJtY0BsaXN0cy5vemxhYnMub3JnPG1haWx0bzpvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQpD
YzogQW1pdGhhc2ggUHJhc2FkIDxhbWl0aGFzaEBmYi5jb208bWFpbHRvOmFtaXRoYXNoQGZiLmNv
bT4+OyBTYWkgRGFzYXJpIDxzZGFzYXJpQGZiLmNvbTxtYWlsdG86c2Rhc2FyaUBmYi5jb20+Pg0K
U3ViamVjdDogUmU6IFRpb2dhIFBhc3MgT3BlbkJNQyAyLjgNCg0KTmVpbCwNClRoaXMgbWVhbnMg
dGhhdCBwb3dlciBjb250cm9sIGFwcGxpY2F0aW9uIGlzIG5vdCBydW5uaW5nLiBBbiBJIGtub3cg
d2h5IGJlY2F1c2Ugd2UgbmVlZCBrZXJuZWwgZGV2aWNlIHRyZWUgZnJvbSA1LjcrIGtlcm5lbCB0
byBzdXBwb3J0IHByb3BlciBncGlvIHBpbnMgYWRkaXRpb24gaW4gZGV2aWNlICB0cmVlLg0KDQpT
byBwbGVhc2UgZG93bmxvYWQgbGF0ZXN0IG9wZW5ibWMgaW1hZ2UsIHlvdXIgYWxsIHByb2JsZW0g
Zm9yIGlwbWIgYW5kIHBvd2VyIGNvbnRyb2wgd2lsbCBiZSByZXNvbHZlZC4NCg0KUmVnYXJkcw0K
LVZpamF5DQoNCg0KRnJvbTogTmVpbCBCcmFkbGV5IDxOZWlsX0JyYWRsZXlAcGhvZW5peC5jb208
bWFpbHRvOk5laWxfQnJhZGxleUBwaG9lbml4LmNvbT4+DQpEYXRlOiBXZWRuZXNkYXksIEF1Z3Vz
dCAyNiwgMjAyMCBhdCAyOjUzIFBNDQpUbzogVmlqYXkgS2hlbWthIDx2aWpheWtoZW1rYUBmYi5j
b208bWFpbHRvOnZpamF5a2hlbWthQGZiLmNvbT4+LCAib3BlbmJtY0BsaXN0cy5vemxhYnMub3Jn
PG1haWx0bzpvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+IiA8b3BlbmJtY0BsaXN0cy5vemxhYnMu
b3JnPG1haWx0bzpvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+Pg0KQ2M6IEFtaXRoYXNoIFByYXNh
ZCA8YW1pdGhhc2hAZmIuY29tPG1haWx0bzphbWl0aGFzaEBmYi5jb20+PiwgU2FpIERhc2FyaSA8
c2Rhc2FyaUBmYi5jb208bWFpbHRvOnNkYXNhcmlAZmIuY29tPj4NClN1YmplY3Q6IFJFOiBUaW9n
YSBQYXNzIE9wZW5CTUMgMi44DQoNCkEgYml0IG1vcmUgaW5mbyDigJMgZG9lcyB0aGlzIG1lYW4g
dGhlIGRidXMgaW50ZXJmYWNlIGZvciBjaGFzc2lzIGNvbnRyb2wgaXMgbWlzc2luZz8NCg0Kcm9v
dEB0aW9nYXBhc3M6L2RldiMgcG93ZXItdXRpbCBtYiBzdGF0dXMNCkZhaWxlZCB0byBnZXQgcHJv
cGVydHkgQ3VycmVudFBvd2VyU3RhdGUgb24gaW50ZXJmYWNlIHh5ei5vcGVuYm1jX3Byb2plY3Qu
U3RhdGUuQ2hhc3NpczogVGhlIG5hbWUgaXMgbm90IGFjdGl2YXRhYmxlIG9mZg0Kcm9vdEB0aW9n
YXBhc3M6L2RldiMgcG93ZXItdXRpbCBtYiBvbg0KRmFpbGVkIHRvIGdldCBwcm9wZXJ0eSBDdXJy
ZW50UG93ZXJTdGF0ZSBvbiBpbnRlcmZhY2UgeHl6Lm9wZW5ibWNfcHJvamVjdC5TdGF0ZS5DaGFz
c2lzOiBUaGUgbmFtZSBpcyBub3QgYWN0aXZhdGFibGUNClBvd2VyaW5nIG9uIFNlcnZlcg0KRmFp
bGVkIHRvIHNldCBwcm9wZXJ0eSBSZXF1ZXN0ZWRQb3dlclRyYW5zaXRpb24gb24gaW50ZXJmYWNl
IHh5ei5vcGVuYm1jX3Byb2plY3QuU3RhdGUuQ2hhc3NpczogVGhlIG5hbWUgaXMgbm90IGFjdGl2
YXRhYmxlDQpyb290QHRpb2dhcGFzczovZGV2IyBwb3dlci11dGlsIG1iIG9mZg0KRmFpbGVkIHRv
IGdldCBwcm9wZXJ0eSBDdXJyZW50UG93ZXJTdGF0ZSBvbiBpbnRlcmZhY2UgeHl6Lm9wZW5ibWNf
cHJvamVjdC5TdGF0ZS5DaGFzc2lzOiBUaGUgbmFtZSBpcyBub3QgYWN0aXZhdGFibGUNCnJvb3RA
dGlvZ2FwYXNzOi9kZXYjDQoNCi0tPk5laWwNCg0K

--_000_1B902FE1006C4199B2C104F70459205Cfbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <4E6BFFA678DAC447987E53DAAA7DA1B9@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseTpXaW5nZGluZ3M7DQoJcGFub3NlLTE6NSAwIDAgMCAwIDAgMCAwIDAg
MDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OiJDYW1icmlhIE1hdGgiOw0KCXBhbm9zZS0x
OjIgNCA1IDMgNSA0IDYgMyAyIDQ7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWlseTpDYWxpYnJp
Ow0KCXBhbm9zZS0xOjIgMTUgNSAyIDIgMiA0IDMgMiA0O30NCi8qIFN0eWxlIERlZmluaXRpb25z
ICovDQpwLk1zb05vcm1hbCwgbGkuTXNvTm9ybWFsLCBkaXYuTXNvTm9ybWFsDQoJe21hcmdpbjow
aW47DQoJZm9udC1zaXplOjExLjBwdDsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJp
Zjt9DQphOmxpbmssIHNwYW4uTXNvSHlwZXJsaW5rDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsN
Cgljb2xvcjpibHVlOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0Kc3Bhbi5FbWFpbFN0
eWxlMTgNCgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWwtcmVwbHk7DQoJZm9udC1mYW1pbHk6IkNh
bGlicmkiLHNhbnMtc2VyaWY7DQoJY29sb3I6d2luZG93dGV4dDt9DQouTXNvQ2hwRGVmYXVsdA0K
CXttc28tc3R5bGUtdHlwZTpleHBvcnQtb25seTsNCglmb250LXNpemU6MTAuMHB0O30NCkBwYWdl
IFdvcmRTZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBpbjsNCgltYXJnaW46MS4waW4gMS4waW4g
MS4waW4gMS4waW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9uMTt9DQot
LT48L3N0eWxlPg0KPC9oZWFkPg0KPGJvZHkgbGFuZz0iRU4tVVMiIGxpbms9ImJsdWUiIHZsaW5r
PSJwdXJwbGUiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPjxzcGFuIHN0eWxlPSJjb2xvcjojMUY0OTdEIj48YSBocmVmPSJodHRwczovL2dpdGh1Yi5j
b20vZmFjZWJvb2svb3BlbmJtYy8iPmh0dHBzOi8vZ2l0aHViLmNvbS9mYWNlYm9vay9vcGVuYm1j
LzwvYT4gJm5ic3A7aXMgc2VwYXJhdGUgRkIgaW50ZXJuYWwgcmVwbyBmb3IgRkIgcGxhdGZvcm1z
IGFuZCBpdCBpcyBub3QgYSBwYXJ0IG9mIExGIG9wZW5ibWMuPC9zcGFuPjxvOnA+PC9vOnA+PC9w
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8ZGl2IHN0eWxl
PSJib3JkZXI6bm9uZTtib3JkZXItdG9wOnNvbGlkICNCNUM0REYgMS4wcHQ7cGFkZGluZzozLjBw
dCAwaW4gMGluIDBpbiI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48Yj48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+RnJvbTogPC9zcGFuPjwvYj48c3BhbiBzdHlsZT0i
Zm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+b3BlbmJtYyAmbHQ7b3BlbmJtYy1ib3VuY2Vz
K3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxhYnMub3JnJmd0OyBvbiBiZWhhbGYgb2YgTmVp
bCBCcmFkbGV5ICZsdDtOZWlsX0JyYWRsZXlAcGhvZW5peC5jb20mZ3Q7PGJyPg0KPGI+RGF0ZTog
PC9iPlRodXJzZGF5LCBBdWd1c3QgMjcsIDIwMjAgYXQgMTA6MjIgQU08YnI+DQo8Yj5UbzogPC9i
PlZpamF5IEtoZW1rYSAmbHQ7dmlqYXlraGVta2FAZmIuY29tJmd0OywgJnF1b3Q7b3BlbmJtY0Bs
aXN0cy5vemxhYnMub3JnJnF1b3Q7ICZsdDtvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcmZ3Q7PGJy
Pg0KPGI+Q2M6IDwvYj5BbWl0aGFzaCBQcmFzYWQgJmx0O2FtaXRoYXNoQGZiLmNvbSZndDs8YnI+
DQo8Yj5TdWJqZWN0OiA8L2I+UkU6IFRpb2dhIFBhc3MgT3BlbkJNQyAyLjg8bzpwPjwvbzpwPjwv
c3Bhbj48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNw
OzwvbzpwPjwvcD4NCjwvZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+QXMgYW4gYXNpZGUsIHdo
YXQgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiBPcGVuQk1DIHByb3BlciBhbmQgdGhlIHJlcG8g
YXQNCjxzcGFuIHN0eWxlPSJjb2xvcjojMUY0OTdEIj48YSBocmVmPSJodHRwczovL2dpdGh1Yi5j
b20vZmFjZWJvb2svb3BlbmJtYy8iPmh0dHBzOi8vZ2l0aHViLmNvbS9mYWNlYm9vay9vcGVuYm1j
LzwvYT4gPw0KPC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5i
c3A7PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5UaGFua3MgYWdhaW4hIFdl
4oCZbGwgcnVuIG91ciB0ZXN0cyBvbiB0aGUgbGF0ZXN0IHRvZGF5LjxvOnA+PC9vOnA+PC9wPg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6V2luZ2RpbmdzIj7DoDwvc3Bhbj5OZWls
PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDs8bzpwPjwvbzpwPjwv
cD4NCjxkaXY+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItdG9wOnNvbGlkICNFMUUx
RTEgMS4wcHQ7cGFkZGluZzozLjBwdCAwaW4gMGluIDBpbiI+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij48Yj5Gcm9tOjwvYj4gVmlqYXkgS2hlbWthICZsdDt2aWpheWtoZW1rYUBmYi5jb20mZ3Q7IDxi
cj4NCjxiPlNlbnQ6PC9iPiBXZWRuZXNkYXksIEF1Z3VzdCAyNiwgMjAyMCAxMTo0NSBQTTxicj4N
CjxiPlRvOjwvYj4gTmVpbCBCcmFkbGV5ICZsdDtOZWlsX0JyYWRsZXlAcGhvZW5peC5jb20mZ3Q7
OyBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc8YnI+DQo8Yj5DYzo8L2I+IEFtaXRoYXNoIFByYXNh
ZCAmbHQ7YW1pdGhhc2hAZmIuY29tJmd0OzsgU2FpIERhc2FyaSAmbHQ7c2Rhc2FyaUBmYi5jb20m
Z3Q7PGJyPg0KPGI+U3ViamVjdDo8L2I+IFJlOiBUaW9nYSBQYXNzIE9wZW5CTUMgMi44PG86cD48
L286cD48L3A+DQo8L2Rpdj4NCjwvZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7PG86
cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5ObywgeW91IGNhbiBzYXkgdGhhdCBw
b3dlciBjb250cm9sIGZvciB0aW9nYXBhc3Mgd2FzIGF2YWlsYWJsZSBmcm9tIGtlcm5lbCA1Ljcg
b25seS48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZuYnNwOzxvOnA+PC9v
OnA+PC9wPg0KPGRpdiBzdHlsZT0iYm9yZGVyOm5vbmU7Ym9yZGVyLXRvcDpzb2xpZCAjQjVDNERG
IDEuMHB0O3BhZGRpbmc6My4wcHQgMGluIDBpbiAwaW4iPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
PGI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPkZyb206IDwvc3Bh
bj48L2I+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPk5laWwgQnJh
ZGxleSAmbHQ7PC9zcGFuPjxhIGhyZWY9Im1haWx0bzpOZWlsX0JyYWRsZXlAcGhvZW5peC5jb20i
PjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0Ij5OZWlsX0JyYWRsZXlAcGhvZW5peC5jb208
L3NwYW4+PC9hPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj4mZ3Q7
PGJyPg0KPGI+RGF0ZTogPC9iPldlZG5lc2RheSwgQXVndXN0IDI2LCAyMDIwIGF0IDExOjI5IFBN
PGJyPg0KPGI+VG86IDwvYj5WaWpheSBLaGVta2EgJmx0Ozwvc3Bhbj48YSBocmVmPSJtYWlsdG86
dmlqYXlraGVta2FAZmIuY29tIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdCI+dmlqYXlr
aGVta2FAZmIuY29tPC9zcGFuPjwvYT48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xv
cjpibGFjayI+Jmd0OywgJnF1b3Q7PC9zcGFuPjxhIGhyZWY9Im1haWx0bzpvcGVuYm1jQGxpc3Rz
Lm96bGFicy5vcmciPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0Ij5vcGVuYm1jQGxpc3Rz
Lm96bGFicy5vcmc8L3NwYW4+PC9hPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9y
OmJsYWNrIj4mcXVvdDsNCiAmbHQ7PC9zcGFuPjxhIGhyZWY9Im1haWx0bzpvcGVuYm1jQGxpc3Rz
Lm96bGFicy5vcmciPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0Ij5vcGVuYm1jQGxpc3Rz
Lm96bGFicy5vcmc8L3NwYW4+PC9hPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9y
OmJsYWNrIj4mZ3Q7PGJyPg0KPGI+Q2M6IDwvYj5BbWl0aGFzaCBQcmFzYWQgJmx0Ozwvc3Bhbj48
YSBocmVmPSJtYWlsdG86YW1pdGhhc2hAZmIuY29tIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEy
LjBwdCI+YW1pdGhhc2hAZmIuY29tPC9zcGFuPjwvYT48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEy
LjBwdDtjb2xvcjpibGFjayI+Jmd0OywgU2FpIERhc2FyaSAmbHQ7PC9zcGFuPjxhIGhyZWY9Im1h
aWx0bzpzZGFzYXJpQGZiLmNvbSI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQiPnNkYXNh
cmlAZmIuY29tPC9zcGFuPjwvYT48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpi
bGFjayI+Jmd0Ozxicj4NCjxiPlN1YmplY3Q6IDwvYj5SRTogVGlvZ2EgUGFzcyBPcGVuQk1DIDIu
ODwvc3Bhbj48bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPiZuYnNwOzxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5E
b2VzIHRoaXMgbWVhbiB0aGUgb2ZmaWNpYWwgMi44IHJlbGVhc2Ugd2FzIGJyb2tlbiBpbiB0aGlz
IHJlZ2FyZD8gV2UgYXJlbuKAmXQgdXNpbmcgdGhlIGxhdGVzdCAmYW1wOyBncmVhdGVzdCwgYnV0
IGl04oCZcyB3b3J0aCBhIHNob3QuIFdpbGwgZG8gdG9tb3Jyb3chPG86cD48L286cD48L3A+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDs8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTpXaW5nZGluZ3MiPsOgPC9zcGFuPk5laWw8
bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZuYnNwOzxvOnA+PC9vOnA+PC9w
Pg0KPGRpdj4NCjxkaXYgc3R5bGU9ImJvcmRlcjpub25lO2JvcmRlci10b3A6c29saWQgI0UxRTFF
MSAxLjBwdDtwYWRkaW5nOjMuMHB0IDBpbiAwaW4gMGluIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PjxiPkZyb206PC9iPiBWaWpheSBLaGVta2EgJmx0OzxhIGhyZWY9Im1haWx0bzp2aWpheWtoZW1r
YUBmYi5jb20iPnZpamF5a2hlbWthQGZiLmNvbTwvYT4mZ3Q7DQo8YnI+DQo8Yj5TZW50OjwvYj4g
V2VkbmVzZGF5LCBBdWd1c3QgMjYsIDIwMjAgMTA6NDAgUE08YnI+DQo8Yj5Ubzo8L2I+IE5laWwg
QnJhZGxleSAmbHQ7PGEgaHJlZj0ibWFpbHRvOk5laWxfQnJhZGxleUBwaG9lbml4LmNvbSI+TmVp
bF9CcmFkbGV5QHBob2VuaXguY29tPC9hPiZndDs7DQo8YSBocmVmPSJtYWlsdG86b3BlbmJtY0Bs
aXN0cy5vemxhYnMub3JnIj5vcGVuYm1jQGxpc3RzLm96bGFicy5vcmc8L2E+PGJyPg0KPGI+Q2M6
PC9iPiBBbWl0aGFzaCBQcmFzYWQgJmx0OzxhIGhyZWY9Im1haWx0bzphbWl0aGFzaEBmYi5jb20i
PmFtaXRoYXNoQGZiLmNvbTwvYT4mZ3Q7OyBTYWkgRGFzYXJpICZsdDs8YSBocmVmPSJtYWlsdG86
c2Rhc2FyaUBmYi5jb20iPnNkYXNhcmlAZmIuY29tPC9hPiZndDs8YnI+DQo8Yj5TdWJqZWN0Ojwv
Yj4gUmU6IFRpb2dhIFBhc3MgT3BlbkJNQyAyLjg8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPC9k
aXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDs8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNz
PSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJjb2xvcjpibGFjayI+TmVpbCw8L3NwYW4+PG86cD48
L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iY29sb3I6YmxhY2si
PlRoaXMgbWVhbnMgdGhhdCBwb3dlciBjb250cm9sIGFwcGxpY2F0aW9uIGlzIG5vdCBydW5uaW5n
LiBBbiBJIGtub3cgd2h5IGJlY2F1c2Ugd2UgbmVlZCBrZXJuZWwgZGV2aWNlIHRyZWUgZnJvbSA1
LjcrIGtlcm5lbCB0byBzdXBwb3J0IHByb3BlciBncGlvIHBpbnMgYWRkaXRpb24gaW4gZGV2aWNl
Jm5ic3A7IHRyZWUuPC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
PHNwYW4gc3R5bGU9ImNvbG9yOmJsYWNrIj4mbmJzcDs8L3NwYW4+PG86cD48L286cD48L3A+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iY29sb3I6YmxhY2siPlNvIHBsZWFzZSBk
b3dubG9hZCBsYXRlc3Qgb3BlbmJtYyBpbWFnZSwgeW91ciBhbGwgcHJvYmxlbSBmb3IgaXBtYiBh
bmQgcG93ZXIgY29udHJvbCB3aWxsIGJlIHJlc29sdmVkLjwvc3Bhbj48bzpwPjwvbzpwPjwvcD4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJjb2xvcjpibGFjayI+Jm5ic3A7PC9z
cGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImNv
bG9yOmJsYWNrIj5SZWdhcmRzPC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+PHNwYW4gc3R5bGU9ImNvbG9yOmJsYWNrIj4tVmlqYXk8L3NwYW4+PG86cD48L286cD48
L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDs8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNz
PSJNc29Ob3JtYWwiPiZuYnNwOzxvOnA+PC9vOnA+PC9wPg0KPGRpdiBzdHlsZT0iYm9yZGVyOm5v
bmU7Ym9yZGVyLXRvcDpzb2xpZCAjQjVDNERGIDEuMHB0O3BhZGRpbmc6My4wcHQgMGluIDBpbiAw
aW4iPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PGI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4w
cHQ7Y29sb3I6YmxhY2siPkZyb206IDwvc3Bhbj48L2I+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTox
Mi4wcHQ7Y29sb3I6YmxhY2siPk5laWwgQnJhZGxleSAmbHQ7PC9zcGFuPjxhIGhyZWY9Im1haWx0
bzpOZWlsX0JyYWRsZXlAcGhvZW5peC5jb20iPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0
Ij5OZWlsX0JyYWRsZXlAcGhvZW5peC5jb208L3NwYW4+PC9hPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6MTIuMHB0O2NvbG9yOmJsYWNrIj4mZ3Q7PGJyPg0KPGI+RGF0ZTogPC9iPldlZG5lc2RheSwg
QXVndXN0IDI2LCAyMDIwIGF0IDI6NTMgUE08YnI+DQo8Yj5UbzogPC9iPlZpamF5IEtoZW1rYSAm
bHQ7PC9zcGFuPjxhIGhyZWY9Im1haWx0bzp2aWpheWtoZW1rYUBmYi5jb20iPjxzcGFuIHN0eWxl
PSJmb250LXNpemU6MTIuMHB0Ij52aWpheWtoZW1rYUBmYi5jb208L3NwYW4+PC9hPjxzcGFuIHN0
eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj4mZ3Q7LCAmcXVvdDs8L3NwYW4+PGEg
aHJlZj0ibWFpbHRvOm9wZW5ibWNAbGlzdHMub3psYWJzLm9yZyI+PHNwYW4gc3R5bGU9ImZvbnQt
c2l6ZToxMi4wcHQiPm9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzwvc3Bhbj48L2E+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPiZxdW90Ow0KICZsdDs8L3NwYW4+PGEg
aHJlZj0ibWFpbHRvOm9wZW5ibWNAbGlzdHMub3psYWJzLm9yZyI+PHNwYW4gc3R5bGU9ImZvbnQt
c2l6ZToxMi4wcHQiPm9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzwvc3Bhbj48L2E+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPiZndDs8YnI+DQo8Yj5DYzogPC9iPkFt
aXRoYXNoIFByYXNhZCAmbHQ7PC9zcGFuPjxhIGhyZWY9Im1haWx0bzphbWl0aGFzaEBmYi5jb20i
PjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0Ij5hbWl0aGFzaEBmYi5jb208L3NwYW4+PC9h
PjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj4mZ3Q7LCBTYWkgRGFz
YXJpICZsdDs8L3NwYW4+PGEgaHJlZj0ibWFpbHRvOnNkYXNhcmlAZmIuY29tIj48c3BhbiBzdHls
ZT0iZm9udC1zaXplOjEyLjBwdCI+c2Rhc2FyaUBmYi5jb208L3NwYW4+PC9hPjxzcGFuIHN0eWxl
PSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj4mZ3Q7PGJyPg0KPGI+U3ViamVjdDogPC9i
PlJFOiBUaW9nYSBQYXNzIE9wZW5CTUMgMi44PC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+
DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7PG86cD48L286cD48L3A+DQo8L2Rp
dj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkEgYml0IG1vcmUgaW5mbyDigJMgZG9lcyB0aGlzIG1l
YW4gdGhlIGRidXMgaW50ZXJmYWNlIGZvciBjaGFzc2lzIGNvbnRyb2wgaXMgbWlzc2luZz88bzpw
PjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZuYnNwOzxvOnA+PC9vOnA+PC9wPg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiZxdW90O0NvdXJp
ZXIgTmV3JnF1b3Q7Ij5yb290QHRpb2dhcGFzczovZGV2IyBwb3dlci11dGlsIG1iIHN0YXR1czwv
c3Bhbj48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJm
b250LWZhbWlseTomcXVvdDtDb3VyaWVyIE5ldyZxdW90OyI+RmFpbGVkIHRvIGdldCBwcm9wZXJ0
eSBDdXJyZW50UG93ZXJTdGF0ZSBvbiBpbnRlcmZhY2UgeHl6Lm9wZW5ibWNfcHJvamVjdC5TdGF0
ZS5DaGFzc2lzOiBUaGUgbmFtZSBpcyBub3QgYWN0aXZhdGFibGUgb2ZmPC9zcGFuPjxvOnA+PC9v
OnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiZx
dW90O0NvdXJpZXIgTmV3JnF1b3Q7Ij5yb290QHRpb2dhcGFzczovZGV2IyBwb3dlci11dGlsIG1i
IG9uPC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5
bGU9ImZvbnQtZmFtaWx5OiZxdW90O0NvdXJpZXIgTmV3JnF1b3Q7Ij5GYWlsZWQgdG8gZ2V0IHBy
b3BlcnR5IEN1cnJlbnRQb3dlclN0YXRlIG9uIGludGVyZmFjZSB4eXoub3BlbmJtY19wcm9qZWN0
LlN0YXRlLkNoYXNzaXM6IFRoZSBuYW1lIGlzIG5vdCBhY3RpdmF0YWJsZTwvc3Bhbj48bzpwPjwv
bzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTom
cXVvdDtDb3VyaWVyIE5ldyZxdW90OyI+UG93ZXJpbmcgb24gU2VydmVyPC9zcGFuPjxvOnA+PC9v
OnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiZx
dW90O0NvdXJpZXIgTmV3JnF1b3Q7Ij5GYWlsZWQgdG8gc2V0IHByb3BlcnR5IFJlcXVlc3RlZFBv
d2VyVHJhbnNpdGlvbiBvbiBpbnRlcmZhY2UgeHl6Lm9wZW5ibWNfcHJvamVjdC5TdGF0ZS5DaGFz
c2lzOiBUaGUgbmFtZSBpcyBub3QgYWN0aXZhdGFibGU8L3NwYW4+PG86cD48L286cD48L3A+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6JnF1b3Q7Q291cmll
ciBOZXcmcXVvdDsiPnJvb3RAdGlvZ2FwYXNzOi9kZXYjIHBvd2VyLXV0aWwgbWIgb2ZmPC9zcGFu
PjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQt
ZmFtaWx5OiZxdW90O0NvdXJpZXIgTmV3JnF1b3Q7Ij5GYWlsZWQgdG8gZ2V0IHByb3BlcnR5IEN1
cnJlbnRQb3dlclN0YXRlIG9uIGludGVyZmFjZSB4eXoub3BlbmJtY19wcm9qZWN0LlN0YXRlLkNo
YXNzaXM6IFRoZSBuYW1lIGlzIG5vdCBhY3RpdmF0YWJsZTwvc3Bhbj48bzpwPjwvbzpwPjwvcD4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTomcXVvdDtDb3Vy
aWVyIE5ldyZxdW90OyI+cm9vdEB0aW9nYXBhc3M6L2RldiM8L3NwYW4+PG86cD48L286cD48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDs8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTpXaW5nZGluZ3MiPsOgPC9zcGFuPk5l
aWw8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZuYnNwOzxvOnA+PC9vOnA+
PC9wPg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_1B902FE1006C4199B2C104F70459205Cfbcom_--
