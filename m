Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1A2B6F66
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 00:39:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YZfv0tdFzF4mS
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 08:39:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=4164fb3d32=wilfredsmith@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="InpqeCn4"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="ZJlhEm4i"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YZfC5rzczF3ZZ
 for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2019 08:39:14 +1000 (AEST)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8IMc63i003504; Wed, 18 Sep 2019 15:39:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=+YNDDKFAMX41z3mdGXO3gKsiCu5Io730mut89uXMRCE=;
 b=InpqeCn4+FVf5dBVHSuTw41WxlSPkHWg9j947Qxf9v9stk7fzt39Pi/C0AOYLBB8JJHO
 SJiuErmaDcctPsxlh/F0wH3mV4KuWimJvx54KakMdWfMk94laxr40uicinQ4oROIGIiV
 8WmclTTy6Gx2lRPXcCf6LjxJu2d9LudoZmA= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2v3vay8avr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 18 Sep 2019 15:39:10 -0700
Received: from prn-hub02.TheFacebook.com (2620:10d:c081:35::126) by
 prn-hub02.TheFacebook.com (2620:10d:c081:35::126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Wed, 18 Sep 2019 15:39:10 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Wed, 18 Sep 2019 15:39:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZIx5ghuifGI+TdfQpgkDxoe94rtTDSQ86qAbiQBiKcYsBPibflobNNtncZFxfmP6OAKwuZgcEQbHtVx7bp3YZdZwPWG03HKZEREctf7atsXs7Du6nsgnljYIa8EPhGA139ARluUxI8rsudRoJbMx1QScApb/ESha6lIR9Jy5spT1eXYVNN+Ac9gmu/KSIpzBTaPvhI2lUIbH3I1bvUcEkGnCoyJWu2EAGV64JC/Xvg1WAgoiJboYXhQk29RJQ054vbjFBtsJKVu40549o9ZrQKFih5eyUQKZ2ykGasMprXX3OvoJVA4gja8IVkmxy4WXVCwKmGZITThYyo6bkC3LKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+YNDDKFAMX41z3mdGXO3gKsiCu5Io730mut89uXMRCE=;
 b=nLjWo4maprUsigxEKbKP01fY6CexU9zlMqPNZC3ZC5vvXzhsyOXqkXxEYYf69bIKX9hPb2Nx5nVLjms9okzZkY3bph9OEpmpAVsvgruqOEzbhMcqiB2Dpgap8T+hnD/y7nT67ItQvfsK9M761XfN8JFu3kfZDVIH2x0J3anILHKW1OsUjwlURGwMjq57R/0ZxyboOswAzhHWqti/BIEi4wCOcquSw5xjEfs9mR5ICLWTXy34onixQH4KCLKWZ7JLQMcvxVnMO52MH76Jhmx/IWHcQm0BVV75wao6sIZgohsLrPtleF2GLCDiu+8VRWpsi17ZpVHCiMgCAbbT/PICdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+YNDDKFAMX41z3mdGXO3gKsiCu5Io730mut89uXMRCE=;
 b=ZJlhEm4ihwasvwYr+cKyuR6/hcw5G104AYVOy2K0Lw73rX8DDwhVYUo/qpYYXvSY7y5iPrH/5OcN74FSynVSxytRzNhrBjwKi7aqqRPzlxpe1wthutaTj2SjdeswTmubWYj2iUWfjVA25K+OELtzCpn1e86zAJmwCesGDF0n9qw=
Received: from MWHPR15MB1823.namprd15.prod.outlook.com (10.174.254.147) by
 MWHPR15MB1678.namprd15.prod.outlook.com (10.175.137.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Wed, 18 Sep 2019 22:39:09 +0000
Received: from MWHPR15MB1823.namprd15.prod.outlook.com
 ([fe80::c938:1e2c:dc9f:6432]) by MWHPR15MB1823.namprd15.prod.outlook.com
 ([fe80::c938:1e2c:dc9f:6432%6]) with mapi id 15.20.2284.009; Wed, 18 Sep 2019
 22:39:09 +0000
From: Wilfred Smith <wilfredsmith@fb.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: Some Recipes Randomly Fail
Thread-Topic: Some Recipes Randomly Fail
Thread-Index: AQHVbmrOZEN1YldwhE6gGpzaQDskqqcx/3sAgAAHcwA=
Date: Wed, 18 Sep 2019 22:39:09 +0000
Message-ID: <3EACE35D-7F22-4B2D-952C-7B9390C9BA3C@fb.com>
References: <857927E9-F872-4F90-A938-1B0635FB230D@fb.com>
 <D675A182-7304-4991-A5A5-261FEDAB62CA@fuzziesquirrel.com>
In-Reply-To: <D675A182-7304-4991-A5A5-261FEDAB62CA@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:9834]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4172f245-c699-4c2e-c2af-08d73c890562
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MWHPR15MB1678; 
x-ms-traffictypediagnostic: MWHPR15MB1678:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MWHPR15MB16780E7AC3BF7250E810E5F2BD8E0@MWHPR15MB1678.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(39860400002)(136003)(396003)(346002)(366004)(199004)(189003)(71200400001)(4326008)(6246003)(5660300002)(64756008)(66556008)(606006)(3480700005)(446003)(66946007)(66476007)(25786009)(53546011)(6486002)(6436002)(102836004)(46003)(33656002)(99286004)(76176011)(229853002)(186003)(66446008)(6306002)(54896002)(2906002)(6512007)(236005)(6506007)(6116002)(316002)(6916009)(8676002)(7736002)(966005)(71190400001)(4744005)(8936002)(81166006)(81156014)(86362001)(476003)(11346002)(76116006)(256004)(14454004)(486006)(36756003)(478600001)(14444005)(2616005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1678;
 H:MWHPR15MB1823.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: L9N0wW3ABBoR3hvKZIshm/cqwKm1FH7apN2EUcEggl8bA1KmyrIug5b692ZgyAnECfDAkkN5Nc43DK+6u9ITSdcWgjqkTi1VQZZmJHKCa7YYYtvrFKwcPSQ+VNU9znoYpBD4phjw+pujBxZM9dxkob+l5GmYpQ1pmlqQLB/NY2WU+vI/4+PpgeqMZSRt5ekryUvMccn/WYV6NfxDMEpHdA8NI/9sQwkd+PPgWP0mB1RLO6eFOOJbZF9k8+i4L8KNu4WGDrPrTpPpYC8MBfOj+KoJb9hqyizfk3MtBLZKQ55wKEra/cZYcwrcpk3lbnS6AXb41xk3+avAy9FwFTsaS+JxeM78/Ke69vomvctErKkP9zWRULZzGeZwdTtXZ+o03MOVZqevvOKTFCPOIe9J1Pgoie5ptCKfD3+pCgGytL0=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_3EACE35D7F224B2D952C7B9390C9BA3Cfbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4172f245-c699-4c2e-c2af-08d73c890562
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 22:39:09.3149 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AIVlsCaChmFziY6m3GiY9BGI/Rks/5Z6bOQPTfFBLpTMr9g5QV4cgunAAVOpX2opla/WYarHKEE+09Y4rhYuaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1678
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-18_10:2019-09-18,2019-09-18 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxlogscore=603
 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 mlxscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1909180190
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

--_000_3EACE35D7F224B2D952C7B9390C9BA3Cfbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QnJhZCwNCg0KSGVyZeKAmXMgYSBHaXN0IG9mIG15IGNvbnNvbGUgZnJvbSBhIGJpdCBlYXJsaWVy
IHRvZGF5LiBJbmZpbml0ZSBzY3JvbGwgYnVmZmVyIGlzIHZlcnkgY29udmVuaWVudCBzb21ldGlt
ZXMhDQoNCmh0dHBzOi8vZ2lzdC5naXRodWIuY29tL3dpbGZyZWRzbWl0aGF0ZmIvNmRjY2M5MDAy
MGRkNTBlMTM5MDM2ZmU4NWJkOTE5NjkNCg0KT24gdGhpcyBwYXJ0aWN1bGFyIG9jY2FzaW9uLCB0
aGUgQ0xJMTEgcmVjaXBlIGZhaWxlZCwgd2hpY2ggSSBkb27igJl0IHJlbWVtYmVyIGhhcHBlbmlu
ZyBiZWZvcmUuDQoNCldoYXQgeW914oCZbGwgc2VlIGhlcmUgaXMgdGhhdCBDTEkxMSBmYWlscywg
c28gSSBidWlsZCBqdXN0IHRoYXQgcmVjaXBlLiBUaGVuIEkgdHJ5IHRvIGRvIGFuIGltYWdlIGFu
ZCBibWN3ZWIgYW5kIGVudGl0eS1tYW5hZ2VyIGZhaWwuIFRoZW4gSSBidWlsZCB0aGUgaW1hZ2Ug
YW5kIGl0IHdvcmtzLiBBbGwgdGhpcyBoYXBwZW5zIHdpdGhvdXQgbWUgYWN0dWFsbHkgY2hhbmdp
bmcgYSBsaW5lIG9mIHNvdXJjZSBjb2RlLg0KDQpXaWxmcmVkDQoNCk9uIFNlcCAxOCwgMjAxOSwg
YXQgMzoxMiBQTSwgQnJhZCBCaXNob3AgPGJyYWRsZXliQGZ1enppZXNxdWlycmVsLmNvbTxtYWls
dG86YnJhZGxleWJAZnV6emllc3F1aXJyZWwuY29tPj4gd3JvdGU6DQoNCmF0IDU6NDggUE0sIFdp
bGZyZWQgU21pdGggPHdpbGZyZWRzbWl0aEBmYi5jb208bWFpbHRvOndpbGZyZWRzbWl0aEBmYi5j
b20+PiB3cm90ZToNCg0KYSDigJxCaXRiYWtlIG9ibWMtcGhvc3Bob3ItaW1hZ2XigJ0gd2lsbCBv
ZnRlbiBmYWlsIGEgcmVjaXBlIHdpdGggY29tcGlsYXRpb24gZXJyb3JzIHRoYXQgZ28gYXdheSBp
ZiBJIHJlYnVpbGQgdGhhdCBwYXJ0aWN1bGFyIHJlY2lwZS4NCg0KTmV4dCB0aW1lIGl0IGhhcHBl
bnMgc2VuZCB0aGUgZmFpbHVyZSB0aGF0IGlzIHByaW50ZWQgdG8gdGhlIHNjcmVlbiBhbG9uZyBh
bmQgd2XigJlsbCBzZWUgaWYgd2UgY2FuIGZpZ3VyZSBpdCBvdXQuDQoNCi1icmFkDQoNCg==

--_000_3EACE35D7F224B2D952C7B9390C9BA3Cfbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <954089C80307A54E81FF9C945A931924@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHN0eWxlPSJ3b3JkLXdy
YXA6IGJyZWFrLXdvcmQ7IC13ZWJraXQtbmJzcC1tb2RlOiBzcGFjZTsgbGluZS1icmVhazogYWZ0
ZXItd2hpdGUtc3BhY2U7IiBjbGFzcz0iIj4NCkJyYWQsDQo8ZGl2IGNsYXNzPSIiPjxiciBjbGFz
cz0iIj4NCjwvZGl2Pg0KPGRpdiBjbGFzcz0iIj5IZXJl4oCZcyBhIEdpc3Qgb2YgbXkgY29uc29s
ZSBmcm9tIGEgYml0IGVhcmxpZXIgdG9kYXkuIEluZmluaXRlIHNjcm9sbCBidWZmZXIgaXMgdmVy
eSBjb252ZW5pZW50IHNvbWV0aW1lcyE8L2Rpdj4NCjxkaXYgY2xhc3M9IiI+PGJyIGNsYXNzPSIi
Pg0KPC9kaXY+DQo8ZGl2IGNsYXNzPSIiPjxhIGhyZWY9Imh0dHBzOi8vZ2lzdC5naXRodWIuY29t
L3dpbGZyZWRzbWl0aGF0ZmIvNmRjY2M5MDAyMGRkNTBlMTM5MDM2ZmU4NWJkOTE5NjkiIGNsYXNz
PSIiPmh0dHBzOi8vZ2lzdC5naXRodWIuY29tL3dpbGZyZWRzbWl0aGF0ZmIvNmRjY2M5MDAyMGRk
NTBlMTM5MDM2ZmU4NWJkOTE5Njk8L2E+PC9kaXY+DQo8ZGl2IGNsYXNzPSIiPjxiciBjbGFzcz0i
Ij4NCjwvZGl2Pg0KPGRpdiBjbGFzcz0iIj5PbiB0aGlzIHBhcnRpY3VsYXIgb2NjYXNpb24sIHRo
ZSBDTEkxMSByZWNpcGUgZmFpbGVkLCB3aGljaCBJIGRvbuKAmXQgcmVtZW1iZXIgaGFwcGVuaW5n
IGJlZm9yZS4mbmJzcDs8L2Rpdj4NCjxkaXYgY2xhc3M9IiI+PGJyIGNsYXNzPSIiPg0KPC9kaXY+
DQo8ZGl2IGNsYXNzPSIiPldoYXQgeW914oCZbGwgc2VlIGhlcmUgaXMgdGhhdCBDTEkxMSBmYWls
cywgc28gSSBidWlsZCBqdXN0IHRoYXQgcmVjaXBlLiBUaGVuIEkgdHJ5IHRvIGRvIGFuIGltYWdl
IGFuZCBibWN3ZWIgYW5kIGVudGl0eS1tYW5hZ2VyIGZhaWwuIFRoZW4gSSBidWlsZCB0aGUgaW1h
Z2UgYW5kIGl0IHdvcmtzLiBBbGwgdGhpcyBoYXBwZW5zIHdpdGhvdXQgbWUgYWN0dWFsbHkgY2hh
bmdpbmcgYSBsaW5lIG9mIHNvdXJjZSBjb2RlLjwvZGl2Pg0KPGRpdiBjbGFzcz0iIj48YnIgY2xh
c3M9IiI+DQo8L2Rpdj4NCjxkaXYgY2xhc3M9IiI+V2lsZnJlZCZuYnNwOzxiciBjbGFzcz0iIj4N
CjxkaXY+PGJyIGNsYXNzPSIiPg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2xhc3M9IiI+DQo8
ZGl2IGNsYXNzPSIiPk9uIFNlcCAxOCwgMjAxOSwgYXQgMzoxMiBQTSwgQnJhZCBCaXNob3AgJmx0
OzxhIGhyZWY9Im1haWx0bzpicmFkbGV5YkBmdXp6aWVzcXVpcnJlbC5jb20iIGNsYXNzPSIiPmJy
YWRsZXliQGZ1enppZXNxdWlycmVsLmNvbTwvYT4mZ3Q7IHdyb3RlOjwvZGl2Pg0KPGJyIGNsYXNz
PSJBcHBsZS1pbnRlcmNoYW5nZS1uZXdsaW5lIj4NCjxkaXYgY2xhc3M9IiI+DQo8ZGl2IGNsYXNz
PSIiPmF0IDU6NDggUE0sIFdpbGZyZWQgU21pdGggJmx0OzxhIGhyZWY9Im1haWx0bzp3aWxmcmVk
c21pdGhAZmIuY29tIiBjbGFzcz0iIj53aWxmcmVkc21pdGhAZmIuY29tPC9hPiZndDsgd3JvdGU6
PGJyIGNsYXNzPSIiPg0KPGJyIGNsYXNzPSIiPg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2xh
c3M9IiI+YSDigJxCaXRiYWtlIG9ibWMtcGhvc3Bob3ItaW1hZ2XigJ0gd2lsbCBvZnRlbiBmYWls
IGEgcmVjaXBlIHdpdGggY29tcGlsYXRpb24gZXJyb3JzIHRoYXQgZ28gYXdheSBpZiBJIHJlYnVp
bGQgdGhhdCBwYXJ0aWN1bGFyIHJlY2lwZS48YnIgY2xhc3M9IiI+DQo8L2Jsb2NrcXVvdGU+DQo8
YnIgY2xhc3M9IiI+DQpOZXh0IHRpbWUgaXQgaGFwcGVucyBzZW5kIHRoZSBmYWlsdXJlIHRoYXQg
aXMgcHJpbnRlZCB0byB0aGUgc2NyZWVuIGFsb25nIGFuZCB3ZeKAmWxsIHNlZSBpZiB3ZSBjYW4g
ZmlndXJlIGl0IG91dC48YnIgY2xhc3M9IiI+DQo8YnIgY2xhc3M9IiI+DQotYnJhZDxiciBjbGFz
cz0iIj4NCjwvZGl2Pg0KPC9kaXY+DQo8L2Jsb2NrcXVvdGU+DQo8L2Rpdj4NCjxiciBjbGFzcz0i
Ij4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_3EACE35D7F224B2D952C7B9390C9BA3Cfbcom_--
