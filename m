Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF27B4587
	for <lists+openbmc@lfdr.de>; Tue, 17 Sep 2019 04:34:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XRyh0mwxzF3lR
	for <lists+openbmc@lfdr.de>; Tue, 17 Sep 2019 12:34:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=41638c232b=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="g4TYBEmi"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="klVajgyF"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XRxp68NHzDwND
 for <openbmc@lists.ozlabs.org>; Tue, 17 Sep 2019 12:33:46 +1000 (AEST)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8H2XKSm026168; Mon, 16 Sep 2019 19:33:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : mime-version; s=facebook;
 bh=a7CNmbzoYmPRQqQA6sgxn2IIs5FdUyZ0pLiVqFask58=;
 b=g4TYBEmibBGvJ+ZFjhrxS5vnZyH6elrC+4xvmaBQKmpWZEHOBvO1jptvYCty9NNey6yM
 enci2fLZm0UIMisWuPovmAYgnWsb6EGK/NMt/bBRzd5ZoXIU5Y90Uh5y7FIVijO8RXCz
 S2aOs+P6NBetx5vBDluI7xCFXn+F08Nf5eM= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2v2hs5h63x-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 16 Sep 2019 19:33:39 -0700
Received: from prn-mbx07.TheFacebook.com (2620:10d:c081:6::21) by
 prn-hub02.TheFacebook.com (2620:10d:c081:35::126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 16 Sep 2019 19:33:38 -0700
Received: from prn-hub01.TheFacebook.com (2620:10d:c081:35::125) by
 prn-mbx07.TheFacebook.com (2620:10d:c081:6::21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 16 Sep 2019 19:33:38 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Mon, 16 Sep 2019 19:33:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=chI48QqL+bFWi7Lcv1Ml/P9p/Less5IJRwOocTmGXk94fDhlNNiO8/sjzQAIMAQO6tvHgv3VuRFFMREB2UKrm7vYKAwBDLlBsCWCwN++cmAeBBXdb5vXTWMZHlNrjRvr09VKFIjtviNn2HiCR5DWHfuxN3bnU8T9uQDBAoQHs7T+1J1apgED8svVgbABD69NWmGNBo9gcLRsaaa4P2DIW7wYdzqBccQ67l3ogQ4SUCLa4OtBEEmixIwuu8vwKB/gI975ad3xFJP8qk4wvoE5R8qqY9W57JHP5ja47Y9Vsp7fK8kTRQOutL/+uPglava+nTIi9qlyS8NdJW96a7WgwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a7CNmbzoYmPRQqQA6sgxn2IIs5FdUyZ0pLiVqFask58=;
 b=CmyHtQEUwsxs7tAZYMuWknN5QLQrlbvCwEfjwElpfdD12zimEBZ/PG+gS1N6K25O6bIjeGa85ombSBPf8mLn8NpeBH+9Yi2H7vzefCjf2xX0ohSqAVvGgcrK43/m3g7ZnmXaz4PvhWqUXoh09g20tIkRuwXR9gLRFZp6sKNnFevW3lveOY+K9sFJc/nr0y40JCLnxmjwrq2dTwrgNzKo3hcuvpamJrr3hLcWp6JU8Ih2ijrXc2nsLDXdleW+BoQbEpWNNS/WJETiCX79o3zdQ/2ix3/n4hyxVGezHXJrKoPFr2LCPfPIcc+jvq1jZ+tS5In073QbDnuLUWbJFEU94A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a7CNmbzoYmPRQqQA6sgxn2IIs5FdUyZ0pLiVqFask58=;
 b=klVajgyFd1+qMCdqGgE01Nk1jWxlI55sz1eb3U62kN15SaQZE3t6oXWNuf/rHUMD1AWaJy6nWZgXbAyHRV4R0AAG88vnKP9EZc+81+66g1aSW6McYi9Yjl5egHm1XikhpSg0cuiLS2YMCaWO4ckFU88HBIC4r2Zecxu/PFAKiq8=
Received: from BY5PR15MB3636.namprd15.prod.outlook.com (52.133.252.91) by
 BY5PR15MB3619.namprd15.prod.outlook.com (52.133.253.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.23; Tue, 17 Sep 2019 02:33:37 +0000
Received: from BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::bc3e:c80f:b59e:98aa]) by BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::bc3e:c80f:b59e:98aa%6]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 02:33:36 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Phosphor code updater
Thread-Topic: Phosphor code updater
Thread-Index: AQHVbQBO2otkMK5gZEWDb9BQ71D0cA==
Date: Tue, 17 Sep 2019 02:33:36 +0000
Message-ID: <05C62CB4-950C-42F4-9C17-41C91E54D9B4@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:306b]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 83f5f528-4ea5-48a9-d490-08d73b17716d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BY5PR15MB3619; 
x-ms-traffictypediagnostic: BY5PR15MB3619:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BY5PR15MB361921B7E21047B5122D23D1DD8F0@BY5PR15MB3619.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39860400002)(396003)(136003)(346002)(376002)(199004)(189003)(6116002)(2906002)(9326002)(86362001)(76116006)(2616005)(91956017)(66946007)(561944003)(478600001)(46003)(54896002)(6306002)(186003)(6512007)(7116003)(36756003)(4326008)(99286004)(316002)(33656002)(3480700005)(25786009)(64756008)(7736002)(71200400001)(71190400001)(256004)(14444005)(8676002)(81166006)(81156014)(8936002)(4744005)(102836004)(6916009)(66446008)(66556008)(66476007)(14454004)(6486002)(5660300002)(486006)(6506007)(2420400007)(7110500001)(476003)(6436002)(15650500001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR15MB3619;
 H:BY5PR15MB3636.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6e3m3tW2ws5TzUrNcatDYs/j6meu+NO0brDMJ0wuwoIwfcCiE3nsogv5ge03BL+NlgJMykh6LsQNfp3NPfdpN31FZvht5m5aCru3xkcg9jo4WdycHn6+52mOjTMkMTyugy2eBssQZNVGpWJEc8uUoKf8EGOYPb+OguDL4aMq1U83DWyqkDqdrg338C37E/n4FxNCuTp+x1iog+WCuLLJrBXyU9mVXOo85bqJmr2n0aBw6eKcC7FeNsmjopcJwlHsm9AjQ1hLKtJG2MugdErrumoQTNvSxInwGNjdRdVL3b2kcThDuTTGZgLsa+pFUeCQDcjdaYsCrQt5nNCMOzCo8QbOQrLw5crt4j7AZK5Z1UtT2MXfUQoLhvg/s1Ro3hZ8mnyiYpHsEKOVAVkULmvtcCveacKtMxXoQv4oEmcF8gU=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_05C62CB4950C42F49C1741C91E54D9B4fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 83f5f528-4ea5-48a9-d490-08d73b17716d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 02:33:36.8265 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WEKAnHqU3i08Ch60W21eehinWAovxO4pNLgxP/ZZ9s4ZvlDObgqw3ZzRAVXgGM2cRBTMwjw459xLzBLCHvcEGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3619
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-17_01:2019-09-11,2019-09-17 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=453 clxscore=1015
 malwarescore=0 lowpriorityscore=0 spamscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1908290000 definitions=main-1909170027
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
Cc: "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_05C62CB4950C42F49C1741C91E54D9B4fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQnJhZCwNCkkgbG9va2VkIGludG8gY29kZSB1cGRhdGVyIGZyb20gcGhvc3Bob3Itc29mdHdh
cmUtbWFuYWdlciBhcyB5b3Ugc3VnZ2VzdGVkIGxhc3Qgd2Vlay4gQXMgcGVyIGN1cnJlbnQgaW1w
bGVtZW50YXRpb24sIGl0IGlzIGNvcHlpbmcgYWxsIDQgcGFydGl0aW9uIHVib290LCBrZXJuZWws
IHJvb3RmcyBhbmQgcndmcy4gSSB3YW50ZWQgdG8gbWFrZSBzb21lIG1vZGlmaWNhdGlvbiB0byBh
bGxvdyB1c2VyIHRvIGNob29zZSB3aGV0aGVyIHRvIHVwZ3JhZGUgcndmcyBvciBub3QuIFRoaXMg
d2F5LCBhbGwgcGVyc2lzdGVudCBzdG9yYWdlIGNhbiBiZSByZXRhaW5lZCBhZnRlciB1cGdyYWRl
IGFzIHdlbGwuDQoNCkluIG15IHByb3Bvc2FsLCBJIHdpbGwgYWRkIGFub3RoZXIgcHJvcGVydHkg
bmFtZWQgRmFjdG9yeUltYWdlSW5zdGFsbCB3aGljaCBjYW4gYmUgc2V0IGFzIDEuIOKAnXRydWXi
gJ0gbWVhbnMgd2hvbGUgaW1hZ2Ugd291bGQgYmUgaW5zdGFsbGVkIGluY2x1ZGluZyByd2ZzIGFu
ZCAyLiDigJxmYWxzZeKAnSBtZWFucyBldmVyeXRoaW5nIHdpbGwgYmUgaW5zdGFsbGVkIGV4Y2Vw
dCByd2ZzIHBhcnRpdGlvbi4gVGhpcyB3YXksIG9sZCByd2ZzIHBhcnRpdGlvbiB3aWxsIGJlIHJl
dGFpbmVkLiBUaGlzIHByb3BlcnR5IHdpbGwgYmUgdW5kZXIgIHh5ei5vcGVuYm1jX3Byb2plY3Qu
U29mdHdhcmUuQWN0aXZhdGlvbiAgaW50ZXJmYWNlLg0KDQpQbGVhc2UgcHJvdmlkZSB5b3VyIG9w
aW5pb24uIEkgd2lsbCBzZW5kIHBhdGNoIHNvb24uDQoNClJlZ2FyZHMNCi1WaWpheQ0K

--_000_05C62CB4950C42F49C1741C91E54D9B4fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <A457107C573F2943AD403FE2BAF7421E@namprd15.prod.outlook.com>
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
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5Ok1lbmxvOw0K
CXBhbm9zZS0xOjIgMTEgNiA5IDMgOCA0IDIgMiA0O30NCi8qIFN0eWxlIERlZmluaXRpb25zICov
DQpwLk1zb05vcm1hbCwgbGkuTXNvTm9ybWFsLCBkaXYuTXNvTm9ybWFsDQoJe21hcmdpbjowaW47
DQoJbWFyZ2luLWJvdHRvbTouMDAwMXB0Ow0KCWZvbnQtc2l6ZToxMi4wcHQ7DQoJZm9udC1mYW1p
bHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KYTpsaW5rLCBzcGFuLk1zb0h5cGVybGluaw0KCXtt
c28tc3R5bGUtcHJpb3JpdHk6OTk7DQoJY29sb3I6IzA1NjNDMTsNCgl0ZXh0LWRlY29yYXRpb246
dW5kZXJsaW5lO30NCmE6dmlzaXRlZCwgc3Bhbi5Nc29IeXBlcmxpbmtGb2xsb3dlZA0KCXttc28t
c3R5bGUtcHJpb3JpdHk6OTk7DQoJY29sb3I6Izk1NEY3MjsNCgl0ZXh0LWRlY29yYXRpb246dW5k
ZXJsaW5lO30NCnNwYW4uRW1haWxTdHlsZTE3DQoJe21zby1zdHlsZS10eXBlOnBlcnNvbmFsLWNv
bXBvc2U7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7DQoJY29sb3I6d2luZG93
dGV4dDt9DQpwLnAxLCBsaS5wMSwgZGl2LnAxDQoJe21zby1zdHlsZS1uYW1lOnAxOw0KCW1hcmdp
bjowaW47DQoJbWFyZ2luLWJvdHRvbTouMDAwMXB0Ow0KCWZvbnQtc2l6ZTo4LjVwdDsNCglmb250
LWZhbWlseTpNZW5sbzsNCgljb2xvcjpibGFjazt9DQpzcGFuLnMxDQoJe21zby1zdHlsZS1uYW1l
OnMxO30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5O30NCkBw
YWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBpbjsNCgltYXJnaW46MS4waW4gMS4w
aW4gMS4waW4gMS4waW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9uMTt9
DQotLT48L3N0eWxlPg0KPC9oZWFkPg0KPGJvZHkgbGFuZz0iRU4tVVMiIGxpbms9IiMwNTYzQzEi
IHZsaW5rPSIjOTU0RjcyIj4NCjxkaXYgY2xhc3M9IldvcmRTZWN0aW9uMSI+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+SGkgQnJhZCw8bzpwPjwv
bzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1z
aXplOjExLjBwdCI+SSBsb29rZWQgaW50byBjb2RlIHVwZGF0ZXIgZnJvbSBwaG9zcGhvci1zb2Z0
d2FyZS1tYW5hZ2VyIGFzIHlvdSBzdWdnZXN0ZWQgbGFzdCB3ZWVrLiBBcyBwZXIgY3VycmVudCBp
bXBsZW1lbnRhdGlvbiwgaXQgaXMgY29weWluZyBhbGwgNCBwYXJ0aXRpb24gdWJvb3QsIGtlcm5l
bCwgcm9vdGZzIGFuZCByd2ZzLiBJIHdhbnRlZCB0byBtYWtlIHNvbWUgbW9kaWZpY2F0aW9uDQog
dG8gYWxsb3cgdXNlciB0byBjaG9vc2Ugd2hldGhlciB0byB1cGdyYWRlIHJ3ZnMgb3Igbm90LiBU
aGlzIHdheSwgYWxsIHBlcnNpc3RlbnQgc3RvcmFnZSBjYW4gYmUgcmV0YWluZWQgYWZ0ZXIgdXBn
cmFkZSBhcyB3ZWxsLjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48
L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+
SW4gbXkgcHJvcG9zYWwsIEkgd2lsbCBhZGQgYW5vdGhlciBwcm9wZXJ0eSBuYW1lZCBGYWN0b3J5
SW1hZ2VJbnN0YWxsIHdoaWNoIGNhbiBiZSBzZXQgYXMgMS4g4oCddHJ1ZeKAnSBtZWFucyB3aG9s
ZSBpbWFnZSB3b3VsZCBiZSBpbnN0YWxsZWQgaW5jbHVkaW5nIHJ3ZnMgYW5kIDIuIOKAnGZhbHNl
4oCdIG1lYW5zIGV2ZXJ5dGhpbmcgd2lsbCBiZSBpbnN0YWxsZWQgZXhjZXB0DQogcndmcyBwYXJ0
aXRpb24uIFRoaXMgd2F5LCBvbGQgcndmcyBwYXJ0aXRpb24gd2lsbCBiZSByZXRhaW5lZC4gVGhp
cyBwcm9wZXJ0eSB3aWxsIGJlIHVuZGVyICZuYnNwOzwvc3Bhbj48c3BhbiBjbGFzcz0iczEiPnh5
ei5vcGVuYm1jX3Byb2plY3QuU29mdHdhcmUuQWN0aXZhdGlvbjwvc3Bhbj48c3BhbiBzdHlsZT0i
Zm9udC1zaXplOjExLjBwdCI+ICZuYnNwO2ludGVyZmFjZS48bzpwPjwvbzpwPjwvc3Bhbj48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86
cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMS4wcHQiPlBsZWFzZSBwcm92aWRlIHlvdXIgb3Bpbmlvbi4gSSB3aWxs
IHNlbmQgcGF0Y2ggc29vbi48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3Nw
YW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4w
cHQiPlJlZ2FyZHM8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48
c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+LVZpamF5PG86cD48L286cD48L3NwYW4+PC9w
Pg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_05C62CB4950C42F49C1741C91E54D9B4fbcom_--
