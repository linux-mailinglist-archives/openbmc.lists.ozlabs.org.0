Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D5F137AE9
	for <lists+openbmc@lfdr.de>; Sat, 11 Jan 2020 02:30:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47vj2t3YFBzDqfY
	for <lists+openbmc@lfdr.de>; Sat, 11 Jan 2020 12:30:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=8279e5572e=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=jlPxpr+r; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=DhQprMmU; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47vj2B62b8zDqfB
 for <openbmc@lists.ozlabs.org>; Sat, 11 Jan 2020 12:29:36 +1100 (AEDT)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00B1SOeS000695; Fri, 10 Jan 2020 17:29:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : mime-version; s=facebook;
 bh=RghriQ7SwblLE2/D00CWUd102ZK1vW2t+G54qaC+7XY=;
 b=jlPxpr+rsIydpuFLKzstFoedLbPwX5RmzjrD/XNJfiI0EAvV7zY36AMEf9YalX+r9usA
 EKMvx+IUTdy1c6FVHdUzJkq39bOZO0zEHfgbm/NaqazVt+n5f8pLo4uZEM0LAJ08LzUa
 MpgRG+kW2d+sAIV1y4y++mYYRj3Dn8pp0dE= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2xe9eeh36p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 10 Jan 2020 17:29:33 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.101) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 10 Jan 2020 17:29:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dXQSbZp5OKsGHGM6c4uA4M8hZ0LqErk3+33bLHSjAIqHtUXYZ0NB7qiNRjHGRL0kYmnHaQB0YbT7SPbxqySADntlL85vBseI/kDS0o6Dqimw9CpE9Y4B0P+NT/6y42nDdAWjcd4judI1cgDYzjnFowziiD1fTHEJ44ntnuXrUfGNSqRNnSDbCi5t21nfjBSJ0+MZoWZOkeZpmQ8r5dlJBjNd1Ph9BK8SHKfbID+JqUbipWgPiJapWVLiTXk3GZQbqUkVvnizaGTUZjVDw/npLfSWmHBEhjJm9Tc4BYvR1JpQMzwtvTkp9DZQlzLuGLMDczDA/4cswEbC8Fbz1Rf4GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RghriQ7SwblLE2/D00CWUd102ZK1vW2t+G54qaC+7XY=;
 b=MuakozyHQxAQyXlwFWkckkhTkqc6KMqo2XsHVKkjRRsMFMjqwREKZGYhTrgDmGW6e0do2xn4tdG2l6AmfILV0NMLM03cqWE6s14mgisIxH8Ei3tFjOMrWwjPiw7mvjGN5vPJCCDYQ0KLaHoqoqkBSX9tFD5Cr6k5waISjkEFbIMp9FqkO19zC9B8DytwuXN5HBt37GI0jlrmYntuxAS6BfF4nxogtJ5BRo0ZHR1r6BfFsFvMFXRCXTO8i/nK3VM4u/SisRuK5YFCccCFiF9M80dIEABUXYXPoTsXiN2RwWAwdgE8fRxGBqStWkZFzteSzgUDBFWmlPMzpmC2Q72WSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RghriQ7SwblLE2/D00CWUd102ZK1vW2t+G54qaC+7XY=;
 b=DhQprMmU4EAdyVdCnD+XZwCwEeWTNmoZX5hjjyQ6DSgtuGc6EaFEYAtJlv2modA7W8tUgLRQedaKmtwiq3VD9GqW/fVWy4c5CVD9N+4QgYRB++D7ph3gsWVKPeDZ9F9PgFtPKwKzzX++G1len3iJXyyBWHTvHGTLpZP+jeTA3HA=
Received: from MWHPR15MB1597.namprd15.prod.outlook.com (10.173.234.137) by
 MWHPR15MB1616.namprd15.prod.outlook.com (10.175.142.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.15; Sat, 11 Jan 2020 01:29:31 +0000
Received: from MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2]) by MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2%8]) with mapi id 15.20.2623.011; Sat, 11 Jan 2020
 01:29:31 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "joel@jms.id.au" <joel@jms.id.au>
Subject: NCSI patch
Thread-Topic: NCSI patch
Thread-Index: AQHVyB6Spfw+444ipEqcxS39grCmKA==
Date: Sat, 11 Jan 2020 01:29:31 +0000
Message-ID: <FD218540-EDC0-48C7-99A0-CC33C6E1ACE1@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:70aa]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad26edbc-8800-46dd-2c3d-08d79635b554
x-ms-traffictypediagnostic: MWHPR15MB1616:
x-microsoft-antispam-prvs: <MWHPR15MB1616D6A416A72A5BE63FDDF1DD3B0@MWHPR15MB1616.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0279B3DD0D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(396003)(39860400002)(376002)(136003)(199004)(189003)(6486002)(66476007)(66946007)(64756008)(66556008)(71200400001)(4326008)(478600001)(76116006)(6506007)(8936002)(2616005)(316002)(186003)(33656002)(66446008)(6916009)(4744005)(6512007)(8676002)(966005)(81156014)(7116003)(36756003)(3480700007)(81166006)(5660300002)(2906002)(86362001)(9326002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1616;
 H:MWHPR15MB1597.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r8gS2EwTBFy6CyxxtXcovZsazaIN5NokCM1Iaac4WBXHA9PNpXV1DB8Lmzj8sKod8jjzsjK9wDJaQBSoDvJUn4yprsFZM9PFEzrbt4c9Ffezrg9oC4evq2s9n5AkRdE1Q9h5LQ852ny4gxaPsfNBcOtKfsPSW77Du+9T0NCBFiud95Toc0RfyxLhfbR28+9xoeNL1oHX7M+5CLj33LckNo8RSBKNWY8gGYc+5WxWASFYkPegZGMa7A3fqgV6S2SI9m7DhH+Ya/QymQJ+vhkplBvXWxnkoKYJBEq2YfGQKlVUGJ/FkLORs6KJGbkVXQ25eDSZdjiS/ueYUgr40qUQoaFT80li13rVTqIYyiUUjwSa2HNq8WeEyslHSoo6HgMSUIRpZGBBkjDEDLULIMVq/yayUpFQUOMZacZ3KOz0Dr/CX71RkwYQbmodwahBu+cWlgcWlJA69lXIvZyDnaZXdnM+vhYzYvJTDxk2YPDWNGg=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_FD218540EDC048C799A0CC33C6E1ACE1fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ad26edbc-8800-46dd-2c3d-08d79635b554
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2020 01:29:31.4460 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0nF5VhMuyUKd4FSzUDAg/i4NYQKGYuOyYXNjotsOQZXSmJEJPmr1W0jZI1gV+PUKKVpvC7Ay7ZnMI+NXSrDPxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1616
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-10_04:2020-01-10,
 2020-01-10 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=582 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001110009
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

--_000_FD218540EDC048C799A0CC33C6E1ACE1fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgSm9lbCwNCkNhbiB5b3UgcGxlYXNlIHB1bGwgZm9sbG93aW5nIDMgcGF0Y2hlcyB0byBvcGVu
Ym1jIGtlcm5lbCBmcm9tIGxpbnV4IG5ldC1uZXh0IHJlcG8uDQoNCiAgMS4gIGh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25ldGRldi9uZXQtbmV4dC5naXQv
Y29tbWl0Lz9pZD05ZTg2MDk0N2Q4ZDdhMTUwNDQ3NmFjNDlhYmZjZTkwYTRjZTYwMGYzDQogIDIu
ICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXRkZXYv
bmV0LW5leHQuZ2l0L2NvbW1pdC8/aWQ9N2M3YjU4ZDQ2Yjc2MzZmZjNjZmIwMWNjNjMzZGRhODUy
ZmRhNzBjOA0KICAzLiAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvbmV0ZGV2L25ldC1uZXh0LmdpdC9jb21taXQvP2lkPTVlMGZjYzE2ZTVjNTYzZmQ4ZjE2
NzM4ZWZlYzk3NGY4MWUwYTVlYTANCg0KUmVnYXJkcw0KLVZpamF5DQo=

--_000_FD218540EDC048C799A0CC33C6E1ACE1fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <94A039333ED51D4F9994304F7477EB6F@namprd15.prod.outlook.com>
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
b3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTIuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXBy
aW9yaXR5Ojk5Ow0KCWNvbG9yOiMwNTYzQzE7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9
DQphOnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5rRm9sbG93ZWQNCgl7bXNvLXN0eWxlLXByaW9y
aXR5Ojk5Ow0KCWNvbG9yOiM5NTRGNzI7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpw
Lk1zb0xpc3RQYXJhZ3JhcGgsIGxpLk1zb0xpc3RQYXJhZ3JhcGgsIGRpdi5Nc29MaXN0UGFyYWdy
YXBoDQoJe21zby1zdHlsZS1wcmlvcml0eTozNDsNCgltYXJnaW4tdG9wOjBpbjsNCgltYXJnaW4t
cmlnaHQ6MGluOw0KCW1hcmdpbi1ib3R0b206MGluOw0KCW1hcmdpbi1sZWZ0Oi41aW47DQoJbWFy
Z2luLWJvdHRvbTouMDAwMXB0Ow0KCWZvbnQtc2l6ZToxMi4wcHQ7DQoJZm9udC1mYW1pbHk6IkNh
bGlicmkiLHNhbnMtc2VyaWY7fQ0Kc3Bhbi5FbWFpbFN0eWxlMTcNCgl7bXNvLXN0eWxlLXR5cGU6
cGVyc29uYWwtY29tcG9zZTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjsNCglj
b2xvcjp3aW5kb3d0ZXh0O30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9y
dC1vbmx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCkBwYWdlIFdvcmRT
ZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBpbjsNCgltYXJnaW46MS4waW4gMS4waW4gMS4waW4g
MS4waW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9uMTt9DQovKiBMaXN0
IERlZmluaXRpb25zICovDQpAbGlzdCBsMA0KCXttc28tbGlzdC1pZDoxNjg4NjA0NTQ4Ow0KCW1z
by1saXN0LXR5cGU6aHlicmlkOw0KCW1zby1saXN0LXRlbXBsYXRlLWlkczo2NTg0Mjk1NzIgNjc2
OTg3MDMgNjc2OTg3MTMgNjc2OTg3MTUgNjc2OTg3MDMgNjc2OTg3MTMgNjc2OTg3MTUgNjc2OTg3
MDMgNjc2OTg3MTMgNjc2OTg3MTU7fQ0KQGxpc3QgbDA6bGV2ZWwxDQoJe21zby1sZXZlbC10YWIt
c3RvcDpub25lOw0KCW1zby1sZXZlbC1udW1iZXItcG9zaXRpb246bGVmdDsNCgl0ZXh0LWluZGVu
dDotLjI1aW47fQ0KQGxpc3QgbDA6bGV2ZWwyDQoJe21zby1sZXZlbC1udW1iZXItZm9ybWF0OmFs
cGhhLWxvd2VyOw0KCW1zby1sZXZlbC10YWItc3RvcDpub25lOw0KCW1zby1sZXZlbC1udW1iZXIt
cG9zaXRpb246bGVmdDsNCgl0ZXh0LWluZGVudDotLjI1aW47fQ0KQGxpc3QgbDA6bGV2ZWwzDQoJ
e21zby1sZXZlbC1udW1iZXItZm9ybWF0OnJvbWFuLWxvd2VyOw0KCW1zby1sZXZlbC10YWItc3Rv
cDpub25lOw0KCW1zby1sZXZlbC1udW1iZXItcG9zaXRpb246cmlnaHQ7DQoJdGV4dC1pbmRlbnQ6
LTkuMHB0O30NCkBsaXN0IGwwOmxldmVsNA0KCXttc28tbGV2ZWwtdGFiLXN0b3A6bm9uZTsNCglt
c28tbGV2ZWwtbnVtYmVyLXBvc2l0aW9uOmxlZnQ7DQoJdGV4dC1pbmRlbnQ6LS4yNWluO30NCkBs
aXN0IGwwOmxldmVsNQ0KCXttc28tbGV2ZWwtbnVtYmVyLWZvcm1hdDphbHBoYS1sb3dlcjsNCglt
c28tbGV2ZWwtdGFiLXN0b3A6bm9uZTsNCgltc28tbGV2ZWwtbnVtYmVyLXBvc2l0aW9uOmxlZnQ7
DQoJdGV4dC1pbmRlbnQ6LS4yNWluO30NCkBsaXN0IGwwOmxldmVsNg0KCXttc28tbGV2ZWwtbnVt
YmVyLWZvcm1hdDpyb21hbi1sb3dlcjsNCgltc28tbGV2ZWwtdGFiLXN0b3A6bm9uZTsNCgltc28t
bGV2ZWwtbnVtYmVyLXBvc2l0aW9uOnJpZ2h0Ow0KCXRleHQtaW5kZW50Oi05LjBwdDt9DQpAbGlz
dCBsMDpsZXZlbDcNCgl7bXNvLWxldmVsLXRhYi1zdG9wOm5vbmU7DQoJbXNvLWxldmVsLW51bWJl
ci1wb3NpdGlvbjpsZWZ0Ow0KCXRleHQtaW5kZW50Oi0uMjVpbjt9DQpAbGlzdCBsMDpsZXZlbDgN
Cgl7bXNvLWxldmVsLW51bWJlci1mb3JtYXQ6YWxwaGEtbG93ZXI7DQoJbXNvLWxldmVsLXRhYi1z
dG9wOm5vbmU7DQoJbXNvLWxldmVsLW51bWJlci1wb3NpdGlvbjpsZWZ0Ow0KCXRleHQtaW5kZW50
Oi0uMjVpbjt9DQpAbGlzdCBsMDpsZXZlbDkNCgl7bXNvLWxldmVsLW51bWJlci1mb3JtYXQ6cm9t
YW4tbG93ZXI7DQoJbXNvLWxldmVsLXRhYi1zdG9wOm5vbmU7DQoJbXNvLWxldmVsLW51bWJlci1w
b3NpdGlvbjpyaWdodDsNCgl0ZXh0LWluZGVudDotOS4wcHQ7fQ0Kb2wNCgl7bWFyZ2luLWJvdHRv
bTowaW47fQ0KdWwNCgl7bWFyZ2luLWJvdHRvbTowaW47fQ0KLS0+PC9zdHlsZT4NCjwvaGVhZD4N
Cjxib2R5IGxhbmc9IkVOLVVTIiBsaW5rPSIjMDU2M0MxIiB2bGluaz0iIzk1NEY3MiI+DQo8ZGl2
IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9
ImZvbnQtc2l6ZToxMS4wcHQiPkhpIEpvZWwsPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkNhbiB5b3UgcGxl
YXNlIHB1bGwgZm9sbG93aW5nIDMgcGF0Y2hlcyB0byBvcGVuYm1jIGtlcm5lbCBmcm9tIGxpbnV4
IG5ldC1uZXh0IHJlcG8uPG86cD48L286cD48L3NwYW4+PC9wPg0KPG9sIHN0eWxlPSJtYXJnaW4t
dG9wOjBpbiIgc3RhcnQ9IjEiIHR5cGU9IjEiPg0KPGxpIGNsYXNzPSJNc29MaXN0UGFyYWdyYXBo
IiBzdHlsZT0ibWFyZ2luLWxlZnQ6MGluO21zby1saXN0OmwwIGxldmVsMSBsZm8xIj48YSBocmVm
PSJodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXRkZXYv
bmV0LW5leHQuZ2l0L2NvbW1pdC8/aWQ9OWU4NjA5NDdkOGQ3YTE1MDQ0NzZhYzQ5YWJmY2U5MGE0
Y2U2MDBmMyI+aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
bmV0ZGV2L25ldC1uZXh0LmdpdC9jb21taXQvP2lkPTllODYwOTQ3ZDhkN2ExNTA0NDc2YWM0OWFi
ZmNlOTBhNGNlNjAwZjM8L2E+PG86cD48L286cD48L2xpPjxsaSBjbGFzcz0iTXNvTGlzdFBhcmFn
cmFwaCIgc3R5bGU9Im1hcmdpbi1sZWZ0OjBpbjttc28tbGlzdDpsMCBsZXZlbDEgbGZvMSI+PGEg
aHJlZj0iaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV0
ZGV2L25ldC1uZXh0LmdpdC9jb21taXQvP2lkPTdjN2I1OGQ0NmI3NjM2ZmYzY2ZiMDFjYzYzM2Rk
YTg1MmZkYTcwYzgiPmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L25ldGRldi9uZXQtbmV4dC5naXQvY29tbWl0Lz9pZD03YzdiNThkNDZiNzYzNmZmM2NmYjAx
Y2M2MzNkZGE4NTJmZGE3MGM4PC9hPjxvOnA+PC9vOnA+PC9saT48bGkgY2xhc3M9Ik1zb0xpc3RQ
YXJhZ3JhcGgiIHN0eWxlPSJtYXJnaW4tbGVmdDowaW47bXNvLWxpc3Q6bDAgbGV2ZWwxIGxmbzEi
PjxhIGhyZWY9Imh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L25ldGRldi9uZXQtbmV4dC5naXQvY29tbWl0Lz9pZD01ZTBmY2MxNmU1YzU2M2ZkOGYxNjczOGVm
ZWM5NzRmODFlMGE1ZWEwIj5odHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC9uZXRkZXYvbmV0LW5leHQuZ2l0L2NvbW1pdC8/aWQ9NWUwZmNjMTZlNWM1NjNmZDhm
MTY3MzhlZmVjOTc0ZjgxZTBhNWVhMDwvYT48bzpwPjwvbzpwPjwvbGk+PC9vbD4NCjxwIGNsYXNz
PSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwv
bzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1z
aXplOjExLjBwdCI+UmVnYXJkczxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij4tVmlqYXk8bzpwPjwvbzpwPjwv
c3Bhbj48L3A+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_FD218540EDC048C799A0CC33C6E1ACE1fbcom_--
