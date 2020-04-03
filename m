Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E3C19E070
	for <lists+openbmc@lfdr.de>; Fri,  3 Apr 2020 23:40:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48vCyh1BTnzDsTQ
	for <lists+openbmc@lfdr.de>; Sat,  4 Apr 2020 08:40:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=13624f9dcf=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=ox+8xW30; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=PpvGcUVt; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48vCxt3JxJzDsNM
 for <openbmc@lists.ozlabs.org>; Sat,  4 Apr 2020 08:39:19 +1100 (AEDT)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 033LSLKR020215; Fri, 3 Apr 2020 14:39:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : mime-version; s=facebook;
 bh=nze8d4W90jV1SE/3SEjdz0WrYddJ1tpTxzgHzYcCLt4=;
 b=ox+8xW30VhS+om1ZXbz/5WqY/eFPBkbolBB8GvatkKXScQ35q9g2OW2EKoHwgtaXpnoA
 i2XhvE/bHUWEycl9xekOu3+tZoht6PzLiXFOOSPmdypdwFuFpwjCFkOdSI7/x7T++BoC
 znTFAaS2Og8py7ajt+q0jyvg84o0ikjBe5A= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 306b100mwg-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 03 Apr 2020 14:39:13 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.173) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Fri, 3 Apr 2020 14:39:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iAunWn8MRQ8ieiRIYC+kl/P+WInCDLWs/N65hFT+QsufXZYWYlkqhPXZ2TVonSzbMGJ69yY7Tl2/jY0/umXwN3yHv5/wmiq3Ns+OzXlQ0A/it6H7zFu9YEZZ6qT5s8P/ylBHkawEF491+bOUpkEhuY1PlVZ3cHSLEVg+JdlQ7wRisg5M1RinizWP6lIx7g+fxwQuKY7YvzZfpq/iqcAB++W73MqJ4u3xw4cDaXFt1D4xgW2mVWIWAYzDHidq10+bu/A/iv4tMmY9BydJA2RxANk8a/4KjDB8tykRMoZ0ug7+5WFYtO0THLeO3fgzHqv3O/iBN+BI+OkHZXWiT+8Sog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nze8d4W90jV1SE/3SEjdz0WrYddJ1tpTxzgHzYcCLt4=;
 b=NXTiNJhl+vfzomkeufnY4AQW1KvYA08JrL7ue7kfmosFiqFe2CBpUWQDbJGu6IwasO3Ehw7Mp4Hx2NezFGVKZ7fWZ86b6Att1ju7FkRmKmKeetoyEoE5eWlshHvMCDdkB0RKhe3QgrQe1v6rxxQhkDQ29DNCm+jAOQes/vKhrtHp9XMHR25qX4z1tG4by2ueoXOn8o337yYcRm9jqvCqN+0xkSJOOp6XwGQtcYjHLssZeU1ucYuY+Ebz/c9UhNL8gAGKdc95Ykhu0dBNB761llKq4D0g6HKQSskszNH5mr/2xePeqWSNRxx0FM5wCD8hGd2fXNiW/2iCcS1/G/2woQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nze8d4W90jV1SE/3SEjdz0WrYddJ1tpTxzgHzYcCLt4=;
 b=PpvGcUVtmC9TacGn+8RaD5vLc/ovmRTNfiZqzhbfiFj9t56/d1Ugx/YFW6DZEQwfCkJvrD6Hxu6rSbzws8518OPh5qy3NSplWEnRw3KfWPdZrdVTlazymLZ+SlKCC6bPM+KRPzZqJ/BqyXtd6RDYS8jggW6tA+1xSrilMSHSaXY=
Received: from MW3PR15MB3947.namprd15.prod.outlook.com (2603:10b6:303:49::9)
 by MW3PR15MB4025.namprd15.prod.outlook.com (2603:10b6:303:46::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16; Fri, 3 Apr
 2020 21:39:10 +0000
Received: from MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936]) by MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936%4]) with mapi id 15.20.2878.016; Fri, 3 Apr 2020
 21:39:10 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: objc console new design
Thread-Topic: objc console new design
Thread-Index: AQHWCgBPwdBJh2WrEU2ViFQA6gD9zg==
Date: Fri, 3 Apr 2020 21:39:10 +0000
Message-ID: <73161AF5-F6B6-40C6-AE70-5FCF5A530B82@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:ae69]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 925a0743-89cd-4153-1f33-08d7d8177222
x-ms-traffictypediagnostic: MW3PR15MB4025:
x-microsoft-antispam-prvs: <MW3PR15MB402515EA3352705649D5364FDDC70@MW3PR15MB4025.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0362BF9FDB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR15MB3947.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(366004)(376002)(346002)(136003)(39860400002)(396003)(8676002)(478600001)(66446008)(6506007)(66556008)(8936002)(71200400001)(81156014)(64756008)(4744005)(81166006)(76116006)(66946007)(66476007)(5660300002)(33656002)(36756003)(186003)(6916009)(316002)(6512007)(2906002)(4326008)(86362001)(9326002)(2616005)(3480700007)(6486002);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QXYn2nrbHFw/gyX308rIhxhqERhRCMWcscFG8lLKWo3w41Wc8Ojqgd8JNhlnenmHLzr6y/6PvxdScZyZD7vG5aRtBQQJteGOnSlk9eb2PSye6WdhuVid6ayfKBSIpAXGRNUJle8HZv5shrHJVcMED7eeVbBuPTSH/V4KOP9qllEwceLa76cDYGTL3ZZGliQ6TO9Xvyd36PUbTt/71BjmuU/nma+glOukjZy5qXv3bCmGXLVNUhSawIgJzWUBphg768I2t7KanV5Mq0YdFi1UnnkFkKmKvcSMl+9dwrt5NK/au9Nx3sovZavuun8GLmM+za4aOGb+owEBWVJD72JPDBVgIAIkVkv8yr9p7jYl6FhwtbEhxGytvHmn1FG/9MzMIhwv+LXRLszBkzdidzhVKmvYE3e9zVckUUjn6eNWXSbNdXDWqNBACEClo5SZB+6Q
x-ms-exchange-antispam-messagedata: 5nIip6vG8jZc9+01lIoBuFmNditwvYsMnylfPa+X1uU4PJnwJEjRcyREz6E1kcD5f9W9UUBKrpWe/VAKpbl0ByfrnQoe3gtewQ8wLghbxBNlF4ndAqejqGkc+SPWCJ0hPSDSdjdv6KPYMELZUFkwvJvw1SFq0ja9rBmfA1JUljMmlMpJ2tKg/CQ6916kxQW9
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_73161AF5F6B640C6AE705FCF5A530B82fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 925a0743-89cd-4153-1f33-08d7d8177222
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2020 21:39:10.4740 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yernDPu57V8nuNyBr7QFiBNfxaSK6pF1cGDgLGmeRTdkNU2+1lfleTrfvM2/2obyH9N2rur+wERTDKaZcKyeBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB4025
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-03_18:2020-04-03,
 2020-04-03 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 clxscore=1015 adultscore=0 mlxlogscore=918 spamscore=0 mlxscore=0
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004030168
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

--_000_73161AF5F6B640C6AE705FCF5A530B82fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQW5kcmV3LA0KSG93IGlzIHNlcnZlciBsYXVuY2hlZCBhcyBwZXIgbmV3IGRlc2lnbiBjb2Rl
LiBXaXRoIGxhdGVzdCB1cGRhdGUsIGNvbnNvbGUgc2VydmVyIGlzIG5vdCBsYXVuY2hpbmcgaW4g
b3VyIHBsYXRmb3JtLiBJIHNhdyBjb25maWcgb3B0aW9uIOKAnE9CTUNfQ09OU09MRV9IT1NUX1RU
WSA/PSAidHR5VlVBUlQwIiDigJwgaGFzIGJlZW4gcmVtb3ZlZCBmcm9tIGJiIGZpbGUgYW5kIGFs
c28gdGhlcmUgaXMgbm8gdHJpZ2dlcmluZyBwb2ludCBpbiBvYm1jLWNvbnNvbGUtc3NoIHNvY2tl
dCBhbmQgc2VydmljZSBsaWtlIGVhcmxpZXIgV2FudHM9b2JtYy1jb25zb2xlQHtPQk1DX0NPTlNP
TEVfSE9TVF9UVFl9LnNlcnZpY2U8bWFpbHRvOldhbnRzPW9ibWMtY29uc29sZUAlN2JPQk1DX0NP
TlNPTEVfSE9TVF9UVFklN2Quc2VydmljZT4uDQoNCkkgc2VlIHVkZXYgcnVsZXMgYWRkZWQgaW4g
bGF0ZXN0IHBhdGNoIGZvciBsYXVuY2hpbmcgc2VydmVyIHdoaWNoIG5lZWRzIGNvbmZpZyBkZWZp
bml0aW9uIG9mIHVkZXYsIGRvIHdlIG5lZWQgdGhpcyBmb3IgbGF1bmNoaW5nLCBwbGVhc2UgYWR2
aXNlLg0KDQpSZWdhcmRzDQotVmlqYXkNCg0KDQo=

--_000_73161AF5F6B640C6AE705FCF5A530B82fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <1187BD6C18EACB4986ADBC1514F1EDE5@namprd15.prod.outlook.com>
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
LXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXByaW9yaXR5
Ojk5Ow0KCWNvbG9yOiMwNTYzQzE7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpzcGFu
LkVtYWlsU3R5bGUxNw0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1jb21wb3NlOw0KCWZvbnQt
ZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0Kc3Bhbi5z
MQ0KCXttc28tc3R5bGUtbmFtZTpzMTt9DQouTXNvQ2hwRGVmYXVsdA0KCXttc28tc3R5bGUtdHlw
ZTpleHBvcnQtb25seTt9DQpAcGFnZSBXb3JkU2VjdGlvbjENCgl7c2l6ZTo4LjVpbiAxMS4waW47
DQoJbWFyZ2luOjEuMGluIDEuMGluIDEuMGluIDEuMGluO30NCmRpdi5Xb3JkU2VjdGlvbjENCgl7
cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT48IS0tW2lmIGd0ZSBtc28gOV0+PHhtbD4N
CjxvOnNoYXBlZGVmYXVsdHMgdjpleHQ9ImVkaXQiIHNwaWRtYXg9IjEwMjYiIC8+DQo8L3htbD48
IVtlbmRpZl0tLT48IS0tW2lmIGd0ZSBtc28gOV0+PHhtbD4NCjxvOnNoYXBlbGF5b3V0IHY6ZXh0
PSJlZGl0Ij4NCjxvOmlkbWFwIHY6ZXh0PSJlZGl0IiBkYXRhPSIxIiAvPg0KPC9vOnNoYXBlbGF5
b3V0PjwveG1sPjwhW2VuZGlmXS0tPg0KPC9oZWFkPg0KPGJvZHkgbGFuZz0iRU4tVVMiIGxpbms9
IiMwNTYzQzEiIHZsaW5rPSIjOTU0RjcyIj4NCjxkaXYgY2xhc3M9IldvcmRTZWN0aW9uMSI+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+SGkgQW5k
cmV3LDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0
eWxlPSJmb250LXNpemU6MTEuMHB0Ij5Ib3cgaXMgc2VydmVyIGxhdW5jaGVkIGFzIHBlciBuZXcg
ZGVzaWduIGNvZGUuIFdpdGggbGF0ZXN0IHVwZGF0ZSwgY29uc29sZSBzZXJ2ZXIgaXMgbm90IGxh
dW5jaGluZyBpbiBvdXIgcGxhdGZvcm0uIEkgc2F3IGNvbmZpZyBvcHRpb24g4oCcPC9zcGFuPjxz
cGFuIGNsYXNzPSJzMSI+T0JNQ19DT05TT0xFX0hPU1RfVFRZID89ICZxdW90O3R0eVZVQVJUMCZx
dW90OyDigJwgaGFzIGJlZW4NCiByZW1vdmVkIGZyb20gYmIgZmlsZSBhbmQgYWxzbyB0aGVyZSBp
cyBubyB0cmlnZ2VyaW5nIHBvaW50IGluIG9ibWMtY29uc29sZS1zc2ggc29ja2V0IGFuZCBzZXJ2
aWNlIGxpa2UgZWFybGllcg0KPGEgaHJlZj0ibWFpbHRvOldhbnRzPW9ibWMtY29uc29sZUAlN2JP
Qk1DX0NPTlNPTEVfSE9TVF9UVFklN2Quc2VydmljZSI+V2FudHM9b2JtYy1jb25zb2xlQHtPQk1D
X0NPTlNPTEVfSE9TVF9UVFl9LnNlcnZpY2U8L2E+LjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIGNsYXNzPSJzMSI+PG86cD4mbmJzcDs8L286cD48L3Nw
YW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gY2xhc3M9InMxIj5JIHNlZSB1ZGV2
IHJ1bGVzIGFkZGVkIGluIGxhdGVzdCBwYXRjaCBmb3IgbGF1bmNoaW5nIHNlcnZlciB3aGljaCBu
ZWVkcyBjb25maWcgZGVmaW5pdGlvbiBvZiB1ZGV2LCBkbyB3ZSBuZWVkIHRoaXMgZm9yIGxhdW5j
aGluZywgcGxlYXNlIGFkdmlzZS48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj48c3BhbiBjbGFzcz0iczEiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIGNsYXNzPSJzMSI+UmVnYXJkczxvOnA+PC9vOnA+PC9z
cGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIGNsYXNzPSJzMSI+LVZpamF5PC9z
cGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286
cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBw
dCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+
DQo=

--_000_73161AF5F6B640C6AE705FCF5A530B82fbcom_--
