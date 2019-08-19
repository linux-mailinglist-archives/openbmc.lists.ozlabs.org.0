Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7034995029
	for <lists+openbmc@lfdr.de>; Mon, 19 Aug 2019 23:52:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46C72P6kj7zDqsW
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 07:52:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=3134769992=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="TM/5eBvg"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="e2d+ANZI"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46C71V3Wp1zDqQN
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 07:51:57 +1000 (AEST)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7JLhEnE010334
 for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2019 14:51:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=d4uGoktR62ANupY7//AkSDdUpAu2eAH9zozbWCP1pvk=;
 b=TM/5eBvgJL34HLrs26BTpcVZSwBnmg54jkx7HWHBVNarvefnizW5W0LJfpAIXupmlk42
 UYr44XIPIS8vyvEqiA8xF+r/u9mIxlawHIBh2tFfHQu6+RNJLcJcQ9r/sGvbqsDNW7mf
 GxWdXrCZ1eP0a82ICIAAO1WbNJfBPiZnLFg= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2ug2tu0bmf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2019 14:51:52 -0700
Received: from prn-hub05.TheFacebook.com (2620:10d:c081:35::129) by
 prn-hub03.TheFacebook.com (2620:10d:c081:35::127) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 19 Aug 2019 14:51:51 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Mon, 19 Aug 2019 14:51:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KMcfMo+MFgYYKCoImf1NInrGlntCtrmCo7rBZChIjUkfzPbhZGCkiJTWwpL/0zMNKn99QXBhE0VGl8YJM2uTaulDFkbPfWQgScNHGlLXjFI4H6dvAWixU9nt3ltjePiAFFfOdFn/Ft0CdyRv8krspvIwF1BXvUeLxC4XDSax1KN/D1oUHCIVwRW8uBiAehLfHVDbWayeBk+A5SGD0PmunT1cDoK6C21yO7s+OHEQI0WeF84wTpz9tpch6P6zZQKML8ZjapknzEL40p5ReWn3rcVaM/EEx7xpWMQRUiuBvbA9e+wvRcKupRPkRhUirDXqIPNIh4He3jH74Yhnm5CKfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4uGoktR62ANupY7//AkSDdUpAu2eAH9zozbWCP1pvk=;
 b=UbMTSKqK8nG6MGJYnFZu4bvpeK67iBs6fs8QBsYl2Y15BovAKONx1AH1XHv7nUuWVSq7/eFiVsv/UDUIAwgp8wR6uA/kRT8Ii6kCsSdJnbIt3vVFM5xUOj9zO3XLfAEIvPttAQ8UMJWp5+ipPktOX7jfbLlFLoNGN2nxM8deRiEPAQFiMikBggzzP5Xy7UiSRooiC9WOYxx9q3qpwOEza6UAnfvsRND4dRWp8jrcDuaKTNPWXft0UP2w+FVhjjtY/094z/L3nVEvZTp1AspKt5JM7pfqSX/0LxyudHKpNq9YK6kZz5mHViVeBsCwx9nKlIzMP70fJsG9528v0yqPQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4uGoktR62ANupY7//AkSDdUpAu2eAH9zozbWCP1pvk=;
 b=e2d+ANZIVZIEtkSWSpfbugC6BKW7PDO+fwPoQf4EQ94AcomL4x5PvvQR6UjJJiuASlgeNk7ikg16opcjIdORvVCB0+EDSj5BR6MdqXq70jwpQGM19rVVxdTvt70j4ASRk06np167WEnxYVX6yksCGMTMvcjtpmlGhPl3yKQHgbI=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1286.namprd15.prod.outlook.com (10.172.178.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 19 Aug 2019 21:51:50 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::8c93:f913:124:8dd0]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::8c93:f913:124:8dd0%8]) with mapi id 15.20.2178.018; Mon, 19 Aug 2019
 21:51:50 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: persistent storage and bcc upgrade
Thread-Topic: persistent storage and bcc upgrade
Thread-Index: AQHVVthOE4jXPEYR0E6eRyOjHV9V4w==
Date: Mon, 19 Aug 2019 21:51:50 +0000
Message-ID: <3F27A9B8-86A5-48DB-AAAD-211F8364FEF7@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::1:2b1d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1bc194b5-10b0-4ff3-3652-08d724ef70e9
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CY4PR15MB1286; 
x-ms-traffictypediagnostic: CY4PR15MB1286:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <CY4PR15MB12861B88E08C281DFAC89EC9DDA80@CY4PR15MB1286.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(396003)(39860400002)(346002)(366004)(136003)(189003)(199004)(66446008)(316002)(99286004)(7736002)(478600001)(2501003)(6306002)(54896002)(91956017)(86362001)(71190400001)(71200400001)(6116002)(2906002)(5660300002)(36756003)(186003)(4744005)(102836004)(256004)(6506007)(14444005)(46003)(6486002)(6436002)(25786009)(14454004)(5640700003)(81166006)(8936002)(6916009)(53936002)(81156014)(33656002)(1730700003)(486006)(76116006)(2351001)(64756008)(66556008)(66476007)(8676002)(6512007)(66946007)(2616005)(476003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1286;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yhgGEs8iZf5nxbI/0rsVgeEe2/JGq/ALutTdrwPBmQt9XpcQSckEssQwyJKqFf9fVIPstevCM99H6se1wbd6C5ftbSWsBYA1e3ajtpQSbTAEL6gPipxZxxy6tjTGsnb6DHqbsbwQCSnL0nOsEhaZ0i6UigfnpgX+WKN/L5l+9b64QyUBNm3x8nxeMqCySyX8L1oaz9VgIPSiXOj4UIg5M23WnENFEavjnztTr7HaUUGGyQzvTGdhHUFRfImjzEd+5RxOfvWWLGSt+kAy/TwyIJhzocOGb5gJAzi/j/h5hTqHQImF6BTYivA88k3Kww2iWp0pZ6rV/UMBR0OXBsvhAaPo5nO0hw6y2QWlYTXtDcNjBJdsu3Wi7ZAv5DBY2DsS31w7XktNcv0GGssTrRi8ZNWKoMYl33vy3o2vysaU0/s=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_3F27A9B886A548DBAAAD211F8364FEF7fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc194b5-10b0-4ff3-3652-08d724ef70e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 21:51:50.5470 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dp6ES+gho5EOEydbcIW9Do+PxL+ge8t6MGxdtyRsYA+1tyfb6sVzKl780vTMGEb+OtijLKyqNMY8z1ufx2iL4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1286
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-19_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=639 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908190217
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

--_000_3F27A9B886A548DBAAAD211F8364FEF7fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGVhbSwNCkkgaGF2ZSBhIGZvbGxvd2luZyBxdWVzdGlvbg0KDQogIDEuICB3aGF0IGFyZSBkaXJl
Y3RvcmllcyBtb3VudGVkIGFzIHJ3IGFuZCBrZXB0IGFzIHBlcnNpc3RlbnQgYWNyb3NzIHJlYm9v
dD8NCiAgMi4gIEhvdyBhcmUgd2UgdXBkYXRpbmcgQk1DIGltYWdlIGFuZCB3aGF0IGhhcHBlbnMg
dG8gcGVyc2lzdGVudCBzdG9yYWdlIGFmdGVyIHVwZ3JhZGUuIEkgYW0gdXNpbmcg4oCcZmxhc2hj
cOKAnSB3aGljaCBjb3BpZXMgY29tcGxldGUgMzIgbWIgaW1hZ2Ugd2hpY2ggbWVhbnMgaXQgd2lw
ZXMgb3V0IGV2ZXJ5dGhpbmcgc3RvcmVkIGN1cnJlbnRseS4NCg0KUmVnYXJkcw0KLVZpamF5DQoN
Cg==

--_000_3F27A9B886A548DBAAAD211F8364FEF7fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <2A1604EF9FEC5945A9854C0909BB8F04@namprd15.prod.outlook.com>
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
IERlZmluaXRpb25zICovDQpAbGlzdCBsMA0KCXttc28tbGlzdC1pZDo2ODI3MDI3MzY7DQoJbXNv
LWxpc3QtdHlwZTpoeWJyaWQ7DQoJbXNvLWxpc3QtdGVtcGxhdGUtaWRzOjEzNjg5NTAxNTQgNjc2
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
ImZvbnQtc2l6ZToxMS4wcHQiPlRlYW0sPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkkgaGF2ZSBhIGZvbGxv
d2luZyBxdWVzdGlvbjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxvbCBzdHlsZT0ibWFyZ2luLXRv
cDowaW4iIHN0YXJ0PSIxIiB0eXBlPSIxIj4NCjxsaSBjbGFzcz0iTXNvTGlzdFBhcmFncmFwaCIg
c3R5bGU9Im1hcmdpbi1sZWZ0OjBpbjttc28tbGlzdDpsMCBsZXZlbDEgbGZvMSI+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMS4wcHQiPndoYXQgYXJlIGRpcmVjdG9yaWVzIG1vdW50ZWQgYXMgcncg
YW5kIGtlcHQgYXMgcGVyc2lzdGVudCBhY3Jvc3MgcmVib290PzxvOnA+PC9vOnA+PC9zcGFuPjwv
bGk+PGxpIGNsYXNzPSJNc29MaXN0UGFyYWdyYXBoIiBzdHlsZT0ibWFyZ2luLWxlZnQ6MGluO21z
by1saXN0OmwwIGxldmVsMSBsZm8xIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+SG93
IGFyZSB3ZSB1cGRhdGluZyBCTUMgaW1hZ2UgYW5kIHdoYXQgaGFwcGVucyB0byBwZXJzaXN0ZW50
IHN0b3JhZ2UgYWZ0ZXIgdXBncmFkZS4gSSBhbSB1c2luZyDigJxmbGFzaGNw4oCdIHdoaWNoIGNv
cGllcyBjb21wbGV0ZSAzMiBtYiBpbWFnZSB3aGljaCBtZWFucw0KIGl0IHdpcGVzIG91dCBldmVy
eXRoaW5nIHN0b3JlZCBjdXJyZW50bHkuPG86cD48L286cD48L3NwYW4+PC9saT48L29sPg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5i
c3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6MTEuMHB0Ij5SZWdhcmRzPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPi1WaWpheTxvOnA+PC9v
OnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjwvYm9keT4N
CjwvaHRtbD4NCg==

--_000_3F27A9B886A548DBAAAD211F8364FEF7fbcom_--
