Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 305C42749A5
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 21:58:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwsYw46JtzDqVq
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 05:58:28 +1000 (AEST)
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
 header.s=facebook header.b=PqZITYvh; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=S9mRXCMF; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwsY61B6zzDqSw
 for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2020 05:57:44 +1000 (AEST)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08MJuYFb010549; Tue, 22 Sep 2020 12:57:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=4zCa2eWtkltncbT/LVzgnTb+ydSiP8Db/HCmx5wOjrU=;
 b=PqZITYvhhZT6HBMV5WbSjYmiAAf7dG3cLpbAsDBjjr2c1CeeaRJ0T9C8vumrPunYZ6Ji
 u7ArSFBAlYmuapnC1wDrrS4gK11gA2To0erEHK/ck3UKgUu7+94QhcvKQA9+D7eF7sLg
 x0SAryTqErxyw5X6gaQpofo9JSCksE+7y5A= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 33p1g9vy86-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 22 Sep 2020 12:57:37 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.174) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 22 Sep 2020 12:57:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+FNZ5P9A7PGNxS+d6ql3BNMjk8ymhuuhiIlFI7CLymSq666NF1/AnZ3F5L+ZGV5sLLq3+pXvIym9bwrm5McAtUNar7WqSpcKq73hcJNoCgwd9idL+M5R7D8hrLhsqVkKRirHu2YCKwbg/NTdD9muh/hd/PRTqSRm7ATG9wLwz6VYhrxeoHXPKM+WllmZod8x4oZ5uY2k2LTutZr9+oeu+OIGkWK8zPFmCMIHj5JOvoiRP3kx3IeldlfNhTV/6PVXX+yEU/8a3SzbTh/eQy2XuivhjAQKO9LIvpkRzGFXeWaRzqlu8YdDMpDx5SfQrtKQGT0YT3wNPlcUxn98zezdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zCa2eWtkltncbT/LVzgnTb+ydSiP8Db/HCmx5wOjrU=;
 b=etBEDvpUIQhQe1IIeWqS/9f7MH+ek+UmM6Z4EX0Jis+HqVFjusZB3D6N7b9BzBFSMrRqJY9tcswGQ9Lh5ayedlgctuoiqZAnT9zTcv08+30ahERECEb9HIatEaFQMU89XA9W4B3Wgb6m2bDVpk7NaeFGgexKtmXCyzxI6RHjOBWYCuqzTF1I3DsCcRupPuIAsEa31NsLQz60Eguo7JhrINpi9OSJs/0Cag7GUDU6GlcynGXSnOcSBvxplbDHbedZMLFbBEZEgo72MG76Wifpnm2GPnem7DHPSwG4v9qfZ7Qexiez08OI10w17gT/KzVf1jv3nWg169ogmCIyZ3klgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zCa2eWtkltncbT/LVzgnTb+ydSiP8Db/HCmx5wOjrU=;
 b=S9mRXCMF2bD1Z+fInATYOICXgNmy2waFlXmZctmJH5GQEL8HdbLXk4kh7wabqAqVXrqXT2i05ooeajYf2thnO5oHWuLBPRWFkdi1R51Y0TX2WF4Oelg2TBlBZyK/H8o/pnm/cbZQAfj4WxsZjgdtTneOC0lXXGqHfrrrXAbHAZI=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2407.namprd15.prod.outlook.com (2603:10b6:a02:8d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Tue, 22 Sep
 2020 19:57:35 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4%7]) with mapi id 15.20.3391.027; Tue, 22 Sep 2020
 19:57:35 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Kumar Thangavel <thangavel.k@hcl.com>, Ed Tanous <ed@tanous.net>
Subject: Re: Read FRU of host through ipmi in Entity manager.
Thread-Topic: Read FRU of host through ipmi in Entity manager.
Thread-Index: AdaKtjzUbcfxCnsRS1m0flxOovD9XQABka8AACeJKwABMecIAAAvawUA
Date: Tue, 22 Sep 2020 19:57:34 +0000
Message-ID: <3858C398-1F6C-40AC-AD7D-B266646BE3EF@fb.com>
References: <HK0PR04MB2964FFC6D5EF008F106FFC13FD230@HK0PR04MB2964.apcprd04.prod.outlook.com>
 <CACWQX80fpcLGEjuvUnj4JpinY=SS6eXbHR0i6wdEtjNpMsAHMg@mail.gmail.com>
 <3D149923-0A95-4CE6-82EF-8338677EF831@fb.com>
 <HK0PR04MB29649824A0F904C61F35152AFD3A0@HK0PR04MB2964.apcprd04.prod.outlook.com>
In-Reply-To: <HK0PR04MB29649824A0F904C61F35152AFD3A0@HK0PR04MB2964.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: hcl.com; dkim=none (message not signed)
 header.d=none;hcl.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:a5f3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1015218a-08d6-4627-5b8a-08d85f31bffe
x-ms-traffictypediagnostic: BYAPR15MB2407:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB2407E903502E5F0719B78ED6DD3B0@BYAPR15MB2407.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zRzg/FlVBd4FbcJTt2tyd8PkRZ4ktpemnH6sOI+PGCAU6N+eYY5ser90DfIHyZq0q4n7ii0N2Cc3V0mciUljTveaxFwNLYh0SqtK5QrEIuhWXpUpTg3rqumAbaYaj9KQJECwdkmSFLuxcWz7Euiub4hQ9iGRNXKX0sQyxxJP262rU+u+syhYwOhP/avd7jztOhXZFKzt4wk2Fe0zjlDtqfpTwjcfJLhtKDnBIwOuhMuixpL3c+hufD8sf7Dc+1IcbpTzwLitJxk736ziqu+ZZtZXSlZ3t6pZA3x+2IQSBv3wpCYTpDMLUqsCI3AP3GL/tVnfXa6UN4aZbPKgBDrVxWck/4joVf2PZJQ/2a44Bk4PjvrbhravGF5eh+m7wLxtXHhi+vaQRLnH/KOM3U3TZA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(39860400002)(346002)(136003)(376002)(316002)(6486002)(966005)(91956017)(64756008)(8676002)(54906003)(2616005)(5660300002)(478600001)(76116006)(6512007)(45080400002)(110136005)(66476007)(66446008)(66556008)(33656002)(36756003)(86362001)(83380400001)(71200400001)(66946007)(8936002)(53546011)(2906002)(4326008)(186003)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 1mXE9z5/ICBzQc19uKai+X/7vXKckT9rqw8BhqcY+YGiV/WxkG9Eb4gQjXpgiK8QQ1Qis47e302VOB2lC/L8vIvV5meQb+WTDHTzeT2IHuU1IECAPDb/Nbm6gc6e/dttMLJUZmCm8zOXnp0b/l6yJhuXHFkcXAL784c25DJBVnyiiK2ELelvlo5thsdm2SF4JuGsjuLIFKti0DpGOKkTgSQ7A8lVsL5BOfFYsUSuVUrqIUasA1t1/xSW8g3P5gXEHPtVyaPUJmii9iVXHtpuzUcAK57rFBuCKxEPwD4kSxRgo+4JWEA7rCd9WkqQSgtdW+LF74N9UmFrndf3J2r52n1enhcQI5ulytzq4VAGze/DNuhlEjRvvIHelZjUfDUQc6T3yukmfw8lCWS5JmgcaJYsfMspA3oeEbSS1k/LT7nao7kTxtd3DDcKS/S9ZugSRu5A5DWy0XVmjodEXMugyte8m9T0cXznUov2E0jT5+O5jQYln30WKWbXya8MyHzw1bPuUc6G3tKmZTweafiZsEZyqsv0KIkXDGxO1De1SRAOby4hJLdV3vdvZK7oHiwBn5AXOSyroAnRqmM1Rizq5ooCFfpo2+H12FpHx49E0cfHJVMv/1Ove0dm6JQFpnnEf9uI5etTRY5uXdNF1xoKe+sVsyuBQuFp7zY3LeqjhoDCiSVooOKJCIiTzOkgEsl7
Content-Type: text/plain; charset="utf-8"
Content-ID: <F56E9AC6DB92554393CEDF079659143E@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1015218a-08d6-4627-5b8a-08d85f31bffe
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2020 19:57:35.0210 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kyVuPxI0ONbl0DbcyPCTaKXOI/iXae7YeB7mtRjL5KHIM3azWV6IEqp8gzr3uNjcuftZFgRwZM14MoKOSvenUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2407
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-22_17:2020-09-21,
 2020-09-22 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 spamscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 phishscore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009220154
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>, Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDkvMjEvMjAsIDk6NDUgQU0sICJLdW1hciBUaGFuZ2F2ZWwiIDx0aGFuZ2F2ZWwu
a0BoY2wuY29tPiB3cm90ZToNCg0KICAgIENsYXNzaWZpY2F0aW9uOiBIQ0wgSW50ZXJuYWwNCg0K
ICAgIEhpIEFsbCwNCg0KICAgICAgICAgICAgICAgIFRoYW5rcyBmb3IgeW91ciBjb21tZW50cyBh
bmQgc3VnZ2VzdGlvbnMuDQoNCiAgICAgICAgICAgICAgICBBcyBzdWdnZXN0ZWQsIHdlIGFyZSBw
bGFubmluZyB0byBpbXBsZW1lbnQgYSBuZXcgcHJvY2Vzcy9zZXJ2aWNlIGxpa2UgIHh5ei5vcGVu
Ym1jX3Byb2plY3QuSVBNQi5GcnVEZXZpY2UgaW4gZW50aXR5IG1hbmFnZXIgbW9kdWxlIHRvIHN1
cHBvcnQgSG9zdCBGUlUgdGhyb3VnaCBpcG1iIHJhdGhlciB0aGFuIHVzaW5nIGRidXMtc2Vuc29y
cy9pcG1ic2Vuc29ycyBmaWxlLg0KDQogICAgICAgICAgICAgICAgRm9sbG93aW5nIGFyZSB0aGUg
YWR2YW50YWdlcywgaWYgaG9zdCBGUlUgaGFuZGxpbmcgaW4gZW50aXR5IG1hbmFnZXIgcmVwby4N
Cg0KICAgICAgICAgICAgICAgIDEuIEFsbCB0aGUgRlJVIGluZm9ybWF0aW9uIGlzIGhhbmRsaW5n
IGluIHRoZSBzYW1lIHJlcG8uDQogICAgICAgICAgICAgICAgMi4gRW50aXR5IG1hbmFnZXIgUHJv
YmUgY2FuIHdvcmsuDQogICAgICAgICAgICAgICAgMy4gQWxsIHRoZSBGUlUgRnVuY3Rpb25zIGFy
ZSBpbiB0aGUgc2FtZSByZXBvLiBXZSBjYW4gdHJ5IHRvIHJldXNlIG1vc3Qgb2YgdGhlIGZ1bmN0
aW9ucy4NCiAgICAgICAgICAgICAgICA0LiBBZGRpbmcgRnJ1IG9iamVjdCB0byBkYnVzIGhhbmRs
aW5nIGFyZSBkb25lLg0KICAgICAgICAgICAgICAgIDUuIEFsbCBGUlUgdmFsaWRhdGlvbnMgYXJl
IGRvbmUgaGVyZSBsaWtlIEZvcm1hdCBmcnUsIHVwZGF0ZSBmcnUgcHJvcGVydHksIHZhbGlkYXRl
IGhlYWRlciwgRnJ1IEFyZWFMZW4gYW5kIGNoZWNrc3VtLiBXZSBjYW4gdHJ5IHRvIHJldXNlIHRo
b3NlIHZhbGlkYXRpb25zLg0KDQpXaGF0IHdpbGwgaGFwcGVuIGlmIHVzZXIgaXMgbm90IHVzaW5n
IGZydS1kZXZpY2UgZnJvbSBlbnRpdHkgbWFuYWdlciwgcmF0aGVyIGNob29zZSB0byB1c2UgcGhv
c3Bob3ItaXBtaS1mcnUuIEhlcmUgeW91IGFyZSByZXN0cmljdGluZyB1c2VyIHRvIHVzZSBmcnUt
ZGV2aWNlIG9ubHkuIA0KDQogICAgICAgICAgICAgICAgRm9yIHNjYW5uaW5nIHRoZSAvZGV2L2lw
bWktKiBub2Rlcywgd2UgYXJlIHRoaW5raW5nIHRvIHVzZSBpcG1iLWNoYW5uZWxzLmpzb24gY29m
aWcgZW50cmllcyBpbiBlbnRpdHkgbWFuYWdlciByZXBvIHNpbmNlIHRoaXMgY29uZmlnIGZpbGUg
aGFzIHZhbGlkIHNsYXZlIHBhdGggYW5kIGJ1cyBhZGRyZXNzLiANCg0KICAgICAgICAgICAgICAg
IFBsZWFzZSBzaGFyZSB5b3VyIGNvbW1lbnRzIGlmIGFueS4gDQoNCiAgICBUaGFua3MsDQogICAg
S3VtYXIuDQoNCg0KDQoNCg0KDQoNCiAgICAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KICAg
IEZyb206IFZpamF5IEtoZW1rYSA8dmlqYXlraGVta2FAZmIuY29tPiANCiAgICBTZW50OiBXZWRu
ZXNkYXksIFNlcHRlbWJlciAxNiwgMjAyMCAxMjo1MSBBTQ0KICAgIFRvOiBFZCBUYW5vdXMgPGVk
QHRhbm91cy5uZXQ+OyBLdW1hciBUaGFuZ2F2ZWwgPHRoYW5nYXZlbC5rQGhjbC5jb20+DQogICAg
Q2M6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzsgSmFlIEh5dW4gWW9vIDxqYWUuaHl1bi55b29A
bGludXguaW50ZWwuY29tPjsgVmVybm9uIE1hdWVyeSA8dmVybm9uLm1hdWVyeUBsaW51eC5pbnRl
bC5jb20+OyBKYW1lcyBGZWlzdCA8amFtZXMuZmVpc3RAbGludXguaW50ZWwuY29tPjsgVmVsdW1h
bmkgVC1FUlMsSENMVGVjaCA8dmVsdW1hbml0QGhjbC5jb20+OyBQYXRyaWNrIFdpbGxpYW1zIDxw
YXRyaWNrdzNAZmIuY29tPg0KICAgIFN1YmplY3Q6IFJlOiBSZWFkIEZSVSBvZiBob3N0IHRocm91
Z2ggaXBtaSBpbiBFbnRpdHkgbWFuYWdlci4NCg0KICAgIFtDQVVUSU9OOiBUaGlzIEVtYWlsIGlz
IGZyb20gb3V0c2lkZSB0aGUgT3JnYW5pemF0aW9uLiBVbmxlc3MgeW91IHRydXN0IHRoZSBzZW5k
ZXIsIERvbuKAmXQgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyBhcyBpdCBtYXkgYmUg
YSBQaGlzaGluZyBlbWFpbCwgd2hpY2ggY2FuIHN0ZWFsIHlvdXIgSW5mb3JtYXRpb24gYW5kIGNv
bXByb21pc2UgeW91ciBDb21wdXRlci5dDQoNCiAgICBPbiA5LzE0LzIwLCAxMDoyOSBBTSwgIkVk
IFRhbm91cyIgPGVkQHRhbm91cy5uZXQ+IHdyb3RlOg0KDQogICAgICAgIE9uIE1vbiwgU2VwIDE0
LCAyMDIwIGF0IDk6NTcgQU0gS3VtYXIgVGhhbmdhdmVsIDx0aGFuZ2F2ZWwua0BoY2wuY29tPiB3
cm90ZToNCiAgICAgICAgPg0KICAgICAgICA+IENsYXNzaWZpY2F0aW9uOiBIQ0wgSW50ZXJuYWwN
CiAgICAgICAgPg0KICAgICAgICA+IEhpIEFsbCwNCiAgICAgICAgPg0KICAgICAgICA+DQogICAg
ICAgID4NCiAgICAgICAgPiAgICAgICAgICBXZSBhcmUgd29ya2luZyBvbiB0aGUgUGxhdGZvcm0g
d2hpY2ggaGFzIG11bHRpIGhvc3QgYW5kIHRoZSBob3N0IGFyZSBGUlVzLiAgVGhlIGhvc3QgYW5k
IEJNQyBjb21tdW5pY2F0aW9uIGlzIGJhc2VkIG9uIElQTUIuIFdlIGhhdmUgZWFjaCBob3N0IGlz
IGNvbm5lY3RlZCBpbiBzZXBhcmF0ZSBpcG1iIGJ1cy4NCiAgICAgICAgPg0KICAgICAgICA+ICAg
ICAgICAgIEV4aXN0aW5nIEVudGl0eSBtYW5hZ2VyIGhhcyB0aGUgRlJVIHJlYWQgaW5mbyBmcm9t
IEVFUFJPTSAoSTJDKWluIHRoZSBmb3JtIG9mIGJpbiBmaWxlLg0KICAgICAgICA+ICAgICAgICAg
IFdlIHVuZGVyc3RhbmQgdGhhdCBlbnRpdHkgbWFuYWdlciBkb2VzIG5vdCBzdXBwb3J0IGlwbWIg
YmFzZWQgaG9zdCBmcnUuDQoNCiAgICAgICAgTWlub3IgYWRqdXN0bWVudC4gIEZydURldmljZSBo
YXMgdGhpcyBjYXBhYmlsaXR5LCBub3QgRW50aXR5IE1hbmFnZXIuDQoNCiAgICAgICAgPg0KICAg
ICAgICA+DQogICAgICAgID4NCiAgICAgICAgPiAgICAgICAgICBTbywgd2UgYXJlIHByb3Bvc2lu
ZyB0aGUgZGVzaWduIHRvIHN1cHBvcnQgaXBtYiBiYXNlZCBGUlUgaW4gZW50aXR5IG1hbmFnZXIu
DQogICAgICAgID4gICAgICAgICAgRnJvbSBFbnRpdHkgbWFuYWdlciwgd2Ugd2lsbCBzZW5kIHRo
ZSBnZW5lcmljICJyZWFkIGhvc3QgZnJ1IiBjb21tYW5kIHJlcXVlc3QgdG8gaXBtYmJyaWdlIHRv
IHJlYWQgdGhlIGhvc3QgRlJVLg0KICAgICAgICA+DQogICAgICAgID4gICAgICAgICAgVGhlbiwg
c3RvcmUgdGhlIGhvc3QgZnJ1IGluZm8gaW4gdGhlIGJpbiBmaWxlIHRvIHByb2Nlc3MgYW5kIGNy
ZWF0aW5nIGRidXMgb2JqZWN0cyBpbiB0aGUgZW50aXR5IG1hbmFnZXIuDQoNCiAgICAgICAgTWlu
b3IgYW1lbmRtZW50IGFnYWluLiAgSSdkIG11Y2ggcmF0aGVyIHRoZSBJUE1CU2Vuc29yIGRhZW1v
biBzaW1wbHkNCiAgICAgICAgY3JlYXRlIHRoZSBzYW1lIGludGVyZmFjZSB0aGF0IGZydSBkZXZp
Y2UgZG9lcywgcmF0aGVyIHRoYW4gYWRkaW5nDQogICAgICAgIElQTUIgbG9naWMgdG8gRnJ1RGV2
aWNlLiAgSW4gdGhpcyB3YXksIHBsYXRmb3JtcyB0aGF0IGRvbid0IGhhdmUgSVBNQg0KICAgICAg
ICBkb24ndCBuZWVkIHRvIGluY2x1ZGUgdGhlIGZlYXR1cmUgYXQgYWxsLiAgQWxzbywgYWxsIHRo
ZSBJTyBjYW4gYmUNCiAgICAgICAgbWFuYWdlZCBpbiBvbmUgcGxhY2UuDQogICAgICAgIGh0dHBz
Oi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwcy0zQV9fYXBjMDEuc2Fm
ZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb21fLTNGdXJsLTNEaHR0cHMtMjUzQS0yNTJGLTI1
MkZnaXRodWIuY29tLTI1MkZvcGVuYm1jLTI1MkZkYnVzLTJEc2Vuc29ycy0yNTJGYmxvYi0yNTJG
bWFzdGVyLTI1MkZzcmMtMjUyRklwbWJTZW5zb3IuY3BwLTI2YW1wLTNCZGF0YS0zRDAyLTI1N0Mw
MS0yNTdDdGhhbmdhdmVsLmstMjU0MGhjbC5jb20tMjU3QzJkNzZlMWZlOTljZDQ5YTkyNzRjMDhk
ODU5YWM3YWZiLTI1N0MxODlkZTczN2M5M2E0ZjVhOGI2ODZmNGNhOTk0MTkxMi0yNTdDMC0yNTdD
MC0yNTdDNjM3MzU3OTQ0NjMwNDY4MDU3LTI2YW1wLTNCc2RhdGEtM0RpMnltd3FZNEFOMFllTVNN
YkpSZWdCeTktMjUyQnJ3MWFnaUJYeGliRlpZTVA5Yy0yNTNELTI2YW1wLTNCcmVzZXJ2ZWQtM0Qw
JmQ9RHdJR2FRJmM9NVZEMFJUdE5sVGgzeWNkNDFiM01VdyZyPXY5TVUwS2k5cFduVFhDV3dqSFBW
Z3BuQ1I4MHZYa2tjcklhcVU3VVNsNWcmbT1RVlNXbHUtbUV0RzZTbGQwTmVZaFh2QVVjcE94VjZi
VmtTTnNsbEtMa3FBJnM9Q1hkS2pVZzZBVHA1SlhYOE91LWJsbm1nSkR6VVBPUDNhaTluYTJ5VDdU
MCZlPSANCiAgICAgICAgSWRlYWxseSwgeW91ciBJUE1CIGRldmljZSB3b3VsZCBhbHNvIGhhdmUg
YW4gU0RSIHRoYXQgZGV0YWlscyB3aGF0DQogICAgICAgIEZSVXMgYW5kIHNlbnNvcnMgZXhpc3Qs
IHNvIHRoYXQgdGhlIGludmVudG9yeSBjYW4gYmUgcmVhZCBhbmQgcG9zdGVkDQogICAgICAgIHRv
IERCdXMgYXQgc3RhcnR1cC4gIElmIHRoZXkgZG9uJ3QgdGhlbiB3ZSBtaWdodCBuZWVkIGEgc3Rh
dGljIG1hcHBpbmcNCiAgICAgICAgZnJvbSBhbiBFTSBjb25maWcgb25jZSB0aGUgZGV2aWNlIG9u
IHRoZSBvdGhlciBlbmQgaXMgZGV0ZWN0ZWQgdmlhIGdldA0KICAgICAgICBkZXZpY2UgSUQuDQoN
CiAgICBJIGFncmVlIHdpdGggRWQgaGVyZSwgYWxsIGlwbWIgcmVsYXRlZCBpbnRlcmZhY2VzIHNo
b3VsZCBiZSBpbXBsZW1lbnRlZCBoZXJlLg0KDQoNCiAgICAgICAgPg0KICAgICAgICA+DQogICAg
ICAgID4NCiAgICAgICAgPiAgICAgICAgICBQbGVhc2UgbGV0IHVzIGtub3cgeW91ciBjb21tZW50
cyBvbiB0aGlzLg0KICAgICAgICA+DQogICAgICAgID4NCiAgICAgICAgPg0KICAgICAgICA+IFRo
YW5rcywNCiAgICAgICAgPg0KICAgICAgICA+IEt1bWFyLg0KICAgICAgICA+DQogICAgICAgID4N
CiAgICAgICAgPg0KICAgICAgICA+DQogICAgICAgID4NCiAgICAgICAgPg0KICAgICAgICA+DQog
ICAgICAgID4gOjpESVNDTEFJTUVSOjoNCiAgICAgICAgPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXw0KICAgICAgICA+IFRoZSBjb250ZW50cyBvZiB0aGlzIGUtbWFpbCBhbmQgYW55
IGF0dGFjaG1lbnQocykgYXJlIGNvbmZpZGVudGlhbCBhbmQgaW50ZW5kZWQgZm9yIHRoZSBuYW1l
ZCByZWNpcGllbnQocykgb25seS4gRS1tYWlsIHRyYW5zbWlzc2lvbiBpcyBub3QgZ3VhcmFudGVl
ZCB0byBiZSBzZWN1cmUgb3IgZXJyb3ItZnJlZSBhcyBpbmZvcm1hdGlvbiBjb3VsZCBiZSBpbnRl
cmNlcHRlZCwgY29ycnVwdGVkLCBsb3N0LCBkZXN0cm95ZWQsIGFycml2ZSBsYXRlIG9yIGluY29t
cGxldGUsIG9yIG1heSBjb250YWluIHZpcnVzZXMgaW4gdHJhbnNtaXNzaW9uLiBUaGUgZSBtYWls
IGFuZCBpdHMgY29udGVudHMgKHdpdGggb3Igd2l0aG91dCByZWZlcnJlZCBlcnJvcnMpIHNoYWxs
IHRoZXJlZm9yZSBub3QgYXR0YWNoIGFueSBsaWFiaWxpdHkgb24gdGhlIG9yaWdpbmF0b3Igb3Ig
SENMIG9yIGl0cyBhZmZpbGlhdGVzLiBWaWV3cyBvciBvcGluaW9ucywgaWYgYW55LCBwcmVzZW50
ZWQgaW4gdGhpcyBlbWFpbCBhcmUgc29sZWx5IHRob3NlIG9mIHRoZSBhdXRob3IgYW5kIG1heSBu
b3QgbmVjZXNzYXJpbHkgcmVmbGVjdCB0aGUgdmlld3Mgb3Igb3BpbmlvbnMgb2YgSENMIG9yIGl0
cyBhZmZpbGlhdGVzLiBBbnkgZm9ybSBvZiByZXByb2R1Y3Rpb24sIGRpc3NlbWluYXRpb24sIGNv
cHlpbmcsIGRpc2Nsb3N1cmUsIG1vZGlmaWNhdGlvbiwgZGlzdHJpYnV0aW9uIGFuZCAvIG9yIHB1
YmxpY2F0aW9uIG9mIHRoaXMgbWVzc2FnZSB3aXRob3V0IHRoZSBwcmlvciB3cml0dGVuIGNvbnNl
bnQgb2YgYXV0aG9yaXplZCByZXByZXNlbnRhdGl2ZSBvZiBIQ0wgaXMgc3RyaWN0bHkgcHJvaGli
aXRlZC4gSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlbWFpbCBpbiBlcnJvciBwbGVhc2UgZGVs
ZXRlIGl0IGFuZCBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseS4gQmVmb3JlIG9wZW5pbmcg
YW55IGVtYWlsIGFuZC9vciBhdHRhY2htZW50cywgcGxlYXNlIGNoZWNrIHRoZW0gZm9yIHZpcnVz
ZXMgYW5kIG90aGVyIGRlZmVjdHMuDQogICAgICAgID4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18NCg0KDQo=
