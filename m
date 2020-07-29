Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 368E22325AB
	for <lists+openbmc@lfdr.de>; Wed, 29 Jul 2020 21:52:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BH41n5JzgzDqkR
	for <lists+openbmc@lfdr.de>; Thu, 30 Jul 2020 05:51:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=5479e35701=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=h27fEp6I; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=V1s0iJS0; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BH40l59NlzDqkR
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jul 2020 05:50:54 +1000 (AEST)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06TJVWiO024968
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2020 12:50:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=4PfuImh0KR16nJx/a98/llI7J/ewgPV2ZB8J86OzY+k=;
 b=h27fEp6IeUiTPhQ4PgMPM70xrea9z5zAF0tyWf0gQsShWRf0xJ9AjbYqZXn0THdCi08p
 A2eeKrGdbqCDISHYOw6/Q2R9nGUuqspvUU0wvUp9KjXf2sxw+UCR/mKNnSomVLj6s6IV
 MoaRB5qp9FS2NHrQtqA1U12ifrfad/XnIio= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 32kcbus3e9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2020 12:50:52 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.230) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 29 Jul 2020 12:50:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kMknp3vzKbbNB+YcBXFSl/kGDkb4ed7TQTV17lUjVinbKWCXLRVp7gM+IFfQV6hxZ3fOSA8tmyyCGqZE84nDvvQ5UUEr+te505mTGsSrd9PIFaLTK/4FXW9yF+YtlpFuLkvjqyHq+85bclWv1cB9SfKhw9UaWMnqKrgr4FUd3O6f3AlFJtF09/Itm9HK0msaXFstTaZ6UGOfovcQ1lVZ0iPO0wxI/VA/M6PHhPdETq3u3elB8wqnj9Yr3IGD0tcGRp/XHcucVeJJyj9qYpEP2OEJ5ohy8BWZ/xGWV/+Yj6PRAoKOMSByVhj/iCfmyFQV93AAw9qzciF1+uhmeBj/Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PfuImh0KR16nJx/a98/llI7J/ewgPV2ZB8J86OzY+k=;
 b=HV+nQr6+G02eFLhRuWAs+Rmq1ljceFo1DLlVQDCQEQ6Ljx7Ny6VkOjF8AxwlXqS7+uuDMHed/t3SviMJiR4Tgd1gXgFjwVYp21l0ZYOyk0Sp++7eyML8jeCuqzKm1VeqnQQD6F1uV9V03uQlHme3TaPauxPDoonPcBp35SVo5bcn0pugAWrtruG2nPzEgErzFXEtKTps05mROejmUV9rFVMnbSkvEGT6WkxcNreUJ4XmmQimDqPKo4e9Zi1FbUZFAq94SKafI7+alRsk5xq0MMlb1oQuYagYQudnaJmIVRLd7XJ1qRfJDr53h5rrutCl5nSX2hOiSc4hK9XLh6RhsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PfuImh0KR16nJx/a98/llI7J/ewgPV2ZB8J86OzY+k=;
 b=V1s0iJS04OUE8XyrnEQ8JERzDyneRSDYepKzZJ5IPCGn9AVWy63S0cUSd6Ug2TY54bGpIs4x4sBHfYvYFXzJRR+fOz+ssWzZ/7j8R7IIkTtUyMzMhLoVeusFjRvgMLwz+eff9xhyhE9Xhdz4Llo45PjCyIz3LLkPChtXStdQX7U=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2246.namprd15.prod.outlook.com (2603:10b6:a02:8d::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Wed, 29 Jul
 2020 19:50:50 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::2908:ebc2:73a5:45b3]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::2908:ebc2:73a5:45b3%5]) with mapi id 15.20.3216.033; Wed, 29 Jul 2020
 19:50:50 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: using third party library
Thread-Topic: using third party library
Thread-Index: AQHWZeGP6ggmurFi9kuRanD6Bgh33g==
Date: Wed, 29 Jul 2020 19:50:50 +0000
Message-ID: <80EB1AD4-61FB-489C-8D6B-5FDDF7F46ED3@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:5963]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b8bd4559-90c5-4d53-5244-08d833f8b227
x-ms-traffictypediagnostic: BYAPR15MB2246:
x-microsoft-antispam-prvs: <BYAPR15MB2246D74D9264D86C08CA8323DD700@BYAPR15MB2246.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vjyRNjMYr/Kmj0ccqIC+LR2+LRPqhpF+qJiTFktY/zUhRdB5JNLwd7e8+QzZOmkPrOkhGHvNMEeKg9kH6gRspPqj0UK5pltxs8K5E28egA5SDVEtd8/knlbGABTXJKbSchCEziPe3EbbVRHXBeeWXc6vtkqPhfIWqo+mdccdvS9/mPUw/hVAKd6a1ceWZcPxGHEEo1+9fuVke6R25BVFHAqPIacLeDm7fHSi5tqf8kjfzpn1oIGJtd85hqQLc0NcCvzpp4GEMNPV4KqnPVRInxWi4GXDUVLXcZNP8Nki/UvTLMxzdXHxZnSIyybOSSJwTa7k6luKgo9R+mD1mL6np4mgFJmmVC5oZq9e7uoaiJf6DUTHi09FTypIqc+AbqPYcjlJ78fKhAvDJKwXpTkmiAHLY12IFVtw2KUaJFvf2YWGc8iSrcEWZZfzZFObe3MhjScN1oPz2LylmamUiyJtQQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(39860400002)(366004)(396003)(376002)(136003)(4744005)(76116006)(36756003)(66946007)(86362001)(478600001)(6916009)(3480700007)(316002)(166002)(966005)(71200400001)(8676002)(6512007)(2906002)(5660300002)(186003)(6486002)(64756008)(66446008)(66556008)(6506007)(8936002)(66476007)(9326002)(2616005)(33656002)(158833001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: dtyrboT/QCsdhFa8tsd77lggoZsj63J6Z86ZapimQt1K7yEhcY0Cgh/yHP67a4XZzUpOnqsWUUvvlYW65ojlLB3izyZADeLu/ZFFTeBo17tpAT/p9XLbICh0LfCPcj0nnneEVAFt+Zqr6/7qZBPAwWpR1LynAmRV+bdQBkw3BYVUJEX6UnVg9r5hK8M9heoEmNcN4WZMMZxXQ0n/R/UYY89Nd6CE/B0hUBa2D5fwxxhD/0CYDRHPGQ8j4eVM/BbNGJbaKoxm7kNZCtkTsSdGJHnQOu4C531xAm0zmBSn2FeCjdE3/W0RBxYVgJkpwnKY58Ty5+2F/H+vlItuShphNHl8+s4tbVApj/wHMQAJ47H2AuscmdZB5PhS6w9XuLHSy1HjABp+8IA4V3Lp9BapVFzwyhphdNCMAOb+chSFj94cAv0b9G5LY4qACVlMcj49ORI32E/sHDryno4Tl4IPrAiXPvb4zcDItPokZnpLxVYvUjy4thRqZg/sLq1brZjmKxLAhPTyPT+WJbK3nqtcdA==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_80EB1AD461FB489C8D6B5FDDF7F46ED3fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8bd4559-90c5-4d53-5244-08d833f8b227
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2020 19:50:50.4663 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h1Zu8nO8KYkUWuWXgPtYTtUmdV0+wPiB2gpYpQXW3ZQfoSzkS8R63hbq/FCmuLMEw8oUIwB2yp/ZbHjtDvypPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2246
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-29_14:2020-07-29,
 2020-07-29 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxlogscore=747
 bulkscore=0 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007290132
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

--_000_80EB1AD461FB489C8D6B5FDDF7F46ED3fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQpJIHdhbnQgdG8gdXNlIGZvbGxvd2luZyBsaWJyYXJ5IGZyb20gb3BlbiBzb3VyY2Ugd2hp
Y2ggaXMgdW5kZXIgTUlUIGxpY2Vuc2UsIHBsZWFzZSBsZXQgbWUga25vdyBpZiB0aGVyZSBpcyBh
bnkgcmVzdHJpY3Rpb24gdG8gdXNlIHRoaXMgaW4gb3VyIG9wZW5ibWMgcGFja2FnZS4NCmh0dHBz
Oi8vZ2l0aHViLmNvbS9BcmFzaFBhcnRvdy9leHBydGsvDQoNCkFsc28gSSBuZWVkIHRvIHdyaXRl
IHNpbXBsZSByZWNpcGUgdG8gaW5jbHVkZSB0aGlzIHNvIHBsZWFzZSBsZXQgbWUga25vdyB3aGF0
IGlzIHRoZSBiZXN0IGxvY2F0aW9uIHRvIHB1dCB0aGlzIHJlY2lwZSBhcyB3ZWxsLiBBcyBJIGFt
IHRoaW5raW5nIG9mIHVzaW5nIHRoaXMgZm9yIHZpcnR1YWwgc2Vuc29ycyB0aGVuIEkgY2FuIHB1
dCB1bmRlciBTZW5zb3JzIG9yIGlmIHRoZXJlIGlzIGJldHRlciBwbGFjZSB0byBwdXQgdGhpcyB0
aGVuIHBsZWFzZSBhZHZpc2UuDQoNClJlZ2FyZHMNCi1WaWpheQ0K

--_000_80EB1AD461FB489C8D6B5FDDF7F46ED3fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <821DBBF9F178D74EA75C637BEA266441@namprd15.prod.outlook.com>
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
YWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCWZvbnQtc2l6
ZToxMi4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KYTpsaW5rLCBz
cGFuLk1zb0h5cGVybGluaw0KCXttc28tc3R5bGUtcHJpb3JpdHk6OTk7DQoJY29sb3I6IzA1NjND
MTsNCgl0ZXh0LWRlY29yYXRpb246dW5kZXJsaW5lO30NCnNwYW4uRW1haWxTdHlsZTE3DQoJe21z
by1zdHlsZS10eXBlOnBlcnNvbmFsLWNvbXBvc2U7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNh
bnMtc2VyaWY7DQoJY29sb3I6d2luZG93dGV4dDt9DQouTXNvQ2hwRGVmYXVsdA0KCXttc28tc3R5
bGUtdHlwZTpleHBvcnQtb25seTsNCglmb250LXNpemU6MTIuMHB0Ow0KCWZvbnQtZmFtaWx5OiJD
YWxpYnJpIixzYW5zLXNlcmlmO30NCkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjguNWluIDEx
LjBpbjsNCgltYXJnaW46MS4waW4gMS4waW4gMS4waW4gMS4waW47fQ0KZGl2LldvcmRTZWN0aW9u
MQ0KCXtwYWdlOldvcmRTZWN0aW9uMTt9DQotLT48L3N0eWxlPg0KPC9oZWFkPg0KPGJvZHkgbGFu
Zz0iRU4tVVMiIGxpbms9IiMwNTYzQzEiIHZsaW5rPSIjOTU0RjcyIj4NCjxkaXYgY2xhc3M9Ildv
cmRTZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXpl
OjExLjBwdCI+SGksPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkkgd2FudCB0byB1c2UgZm9sbG93aW5nIGxp
YnJhcnkgZnJvbSBvcGVuIHNvdXJjZSB3aGljaCBpcyB1bmRlciBNSVQgbGljZW5zZSwgcGxlYXNl
IGxldCBtZSBrbm93IGlmIHRoZXJlIGlzIGFueSByZXN0cmljdGlvbiB0byB1c2UgdGhpcyBpbiBv
dXIgb3BlbmJtYyBwYWNrYWdlLjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPjxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9BcmFzaFBhcnRvdy9leHBydGsvIj5o
dHRwczovL2dpdGh1Yi5jb20vQXJhc2hQYXJ0b3cvZXhwcnRrLzwvYT48bzpwPjwvbzpwPjwvcD4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpw
PiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHls
ZT0iZm9udC1zaXplOjExLjBwdCI+QWxzbyBJIG5lZWQgdG8gd3JpdGUgc2ltcGxlIHJlY2lwZSB0
byBpbmNsdWRlIHRoaXMgc28gcGxlYXNlIGxldCBtZSBrbm93IHdoYXQgaXMgdGhlIGJlc3QgbG9j
YXRpb24gdG8gcHV0IHRoaXMgcmVjaXBlIGFzIHdlbGwuIEFzIEkgYW0gdGhpbmtpbmcgb2YgdXNp
bmcgdGhpcyBmb3IgdmlydHVhbCBzZW5zb3JzIHRoZW4gSSBjYW4gcHV0IHVuZGVyIFNlbnNvcnMN
CiBvciBpZiB0aGVyZSBpcyBiZXR0ZXIgcGxhY2UgdG8gcHV0IHRoaXMgdGhlbiBwbGVhc2UgYWR2
aXNlLjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0
eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+UmVnYXJkczxv
OnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6MTEuMHB0Ij4tVmlqYXk8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjwv
Ym9keT4NCjwvaHRtbD4NCg==

--_000_80EB1AD461FB489C8D6B5FDDF7F46ED3fbcom_--
