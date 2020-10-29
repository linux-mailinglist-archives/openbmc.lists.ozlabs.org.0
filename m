Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD67D29F59E
	for <lists+openbmc@lfdr.de>; Thu, 29 Oct 2020 20:54:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMbjf638tzDqWX
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 06:53:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=85713010a6=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=Z8kBgx/4; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=Qk5WmIM8; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMbhq5r9vzDqWT
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2020 06:53:13 +1100 (AEDT)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09TJktIL020730
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2020 12:53:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=JV/bntSJOQOZRHSmPmbSSntaAkdKKULv74Q7BmG6mno=;
 b=Z8kBgx/47SQxEz8uW9dnUlLb2pGQR3plJDzchmwMBqrTcN3HAG15DjQ65nKGsviLDyAe
 imgLrJgBQ5y0eZZ/X4ndIY2vdDUGLn/qp2YWqheHohJOdE/AHSWopqB/1KnwbQihNIop
 qEKCYWCNe+VLgxVG0HchlC3Tz6j9BYNO+hM= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 34f0qc2w2u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2020 12:53:11 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 29 Oct 2020 12:53:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FVukpQOPWnVNl/F3Wm5rNta7ojITcjF6PWBWB3N4TpKlFEO+FlZTEt+Im2Y+0rzoA9f61XlyP0L4FvCFTMswh4t8LjtlqOnrmr8cXbwhNZNg6Cimxhl6zUR7RPHhBq+ShE/cHOyMcm8t4K4YBVNLxEX8cm9EJirkLyDIuJ06FGChLxFDGSzxeLTttOGK4vK2amAY1f0gLkYL39INtnvWqAloUPrwkcc1mq5MilGJhqbXY+v3ewrbv01MWjCjTDg3Ce6w/xBqqUdQlQwvRl+UtkO+J9otJPOv0BWgjP0gf5/D1V+5sHaCbZFuDA0PGXtr08uCUsCExTKPpaI81yvyqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JV/bntSJOQOZRHSmPmbSSntaAkdKKULv74Q7BmG6mno=;
 b=JD4ZJ3HWDaP3gJTwanW18UC7o+NTTlLCM5Jaon9ssyr4AP01w288eBrIVBA2cjqdCfP/Mff6grQewQm/lKO5YSRCGlWV7OHy4s0YT2x8I9riZC1FGLcH0nQDGtgHTlRth4tC+Bt3vg3wl0n/AVc9sYG6wlf49FCaJ5ZIjh8+CeHbfiFpAn9DslCEq8Z+1tYI/dfdUhNNBsGQnRBws4Gvp0eZaxJKNrsqwXlIklmw8fUN+A4GPVffj4qmzdRdeBFVS0qy0HwTRyJ734ET+DtqYUKZKXN56rDnI331U3HHrsNZdo1QmvV5Pqsm4BnX1SnScECaeG/AVRpld8+dnTZhXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JV/bntSJOQOZRHSmPmbSSntaAkdKKULv74Q7BmG6mno=;
 b=Qk5WmIM8yi8fk4lAPC+hY9B2LvJBfQQjjEDlyGo3k/wYhlPEkBD10qmW6i0A7sRGBLSOenT2yyYoKoeu0CisTwzc8CP8SA/5PIjMeKAoB20fZP5urURkEDL2faaw+WGTidPTYHDYsX1fQIowD0QUGiQgikSXU63x0YOamImrXHY=
Received: from BY5PR15MB3537.namprd15.prod.outlook.com (2603:10b6:a03:1f5::20)
 by SJ0PR15MB4220.namprd15.prod.outlook.com (2603:10b6:a03:2cb::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 29 Oct
 2020 19:53:10 +0000
Received: from BY5PR15MB3537.namprd15.prod.outlook.com
 ([fe80::5cb9:7809:838b:488a]) by BY5PR15MB3537.namprd15.prod.outlook.com
 ([fe80::5cb9:7809:838b:488a%5]) with mapi id 15.20.3477.029; Thu, 29 Oct 2020
 19:53:10 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "OpenBMC (openbmc@lists.ozlabs.org)" <openbmc@lists.ozlabs.org>
Subject: bmcweb upgrade blocking
Thread-Topic: bmcweb upgrade blocking
Thread-Index: AQHWri0gxDTH5bErekWSqjF7v/avnA==
Date: Thu, 29 Oct 2020 19:53:10 +0000
Message-ID: <282BE4C0-9C7F-4CC9-850D-729C95B137A3@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:92f7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df1dff44-5557-4978-0ea3-08d87c444367
x-ms-traffictypediagnostic: SJ0PR15MB4220:
x-microsoft-antispam-prvs: <SJ0PR15MB42208C90B2DE8E3972EB5864DD140@SJ0PR15MB4220.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: An7407qfqXA0oyv7ycT3Zgwou12fVActDiqdVS671QYRoeJYxFPEEqkOqqv0FHy8kG19hsPHfx2KN2rtgRoeckwdj6KEWiVyVjCujGjsovkvsGs1R3FaGog/jOne5C/6nZui9WJyxrzSqYfNrtNoBD3xWx6noYxzGJR+TQtvhhkbKTS5w4LvQhFOly9LBba2DMqMEDg0t44qoli+JVIDzdlWDiF/tk9bQ5UTLBcgG6EJ5Uxz+HWK/OrJuxt9msc+uOjxYo6bco11XAp6lbsBEGzqhJVqDqoc7BTzFyU12H2rHRhbU8ARbzABm2AiA+Vn6buy4bMlwfvSund2QjjDB55BCWGdZJqovb+mQb91E9bdU+AFjNnVPUBdGuB8ssGp
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3537.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(346002)(136003)(376002)(39860400002)(2616005)(6512007)(186003)(478600001)(6916009)(8676002)(966005)(8936002)(2906002)(7116003)(6506007)(4744005)(66476007)(6486002)(316002)(66446008)(64756008)(76116006)(66946007)(5660300002)(71200400001)(86362001)(83380400001)(3480700007)(36756003)(91956017)(33656002)(66556008)(133083001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: MsEnUghJegVtsVz47ebrTV9LXzQXC8kz8hbfwYGhF8Btd3ctaBZ8uAD2cAbbwf16g2gH4oy4SoXWNVWHnlYGMgE0fYKQkZ3kKvvDYGq9EIffQhg8v5K+u0y6y8U/lAtVA7mTTLDUjpVrX0TlCy+C5y7oTipJbnvrOV3zjtqEKvwO4StH5QOel3W7k6uJoS5k96Ks8axkklJb4dtrf1ZKSlvQh5Zc1QOBEFp9tHzoW79RR/IauR7EIlG19j1AtfHuqgVWclIlPlMsSNN/qL9G0Nwe/xlvYEIZORmzPIKuXk+as4t/dHlC20cG1SeoBV1NRivwTk0vjvcPLenG/qXA68LkYSG+eA+rz0TxZ8l8Zdvr7UzF4GglEmxWS+7VVdEEtLe9lODHHCOZcaLyOD3V5j5OaGFswhaASyJiNJhoRGhPbBpR7Prz+ql45D48wBefBC6DsNYU4vo/irl+r4K8FGz9/xUDhDJItmMPFCnpVlSXlAEcvYKFoq9dJx6HtL64p2WxvPaO28k91b7qSWP+i2UncwVmbnPzfHSu0XfiF6Dz/zssyMY9GcMVxU5XDrLsiXVoh5mRUUTbn/jko2/PinMO5Q6eJJn18nKHOYBfh0DHEnSLOO+7jLnEmNFhsMC0v1q353csCN0Ym3pleOQJqsw0kvJctgTrMZcbvVNupJXSsIH/zXiup7CI2aGP2dfr
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_282BE4C09C7F4CC9850D729C95B137A3fbcom_"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3537.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df1dff44-5557-4978-0ea3-08d87c444367
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2020 19:53:10.2583 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0QNUGdwqipYHEH32+BIzUpRwMnvRX0dvKb2u967V1koHV2dOMZ6BX/ve5ppp0EFHWhAlsUXF4x5+ldhQpmfx8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR15MB4220
X-OriginatorOrg: fb.com
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-29_12:2020-10-29,
 2020-10-29 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=907 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010290136
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

--_000_282BE4C09C7F4CC9850D729C95B137A3fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGVhbSwNCkkgYW0gbm90IHN1cmUgaWYgaXQgaXMgYSBrbm93biBpc3N1ZSBidXQgSSBhbSBzZWVp
bmcgYm1jd2ViIHVwZ3JhZGUgaXMgYmxvY2tpbmcgZm9yIGZldyBtaW51dGVzIGFuZCByZXR1cm5p
bmcgZW1wdHkgcmVzcG9uc2UuIEkgc2VlIGltYWdlIGlzIGdldHRpbmcgY29waWVkIGFuZCBnZXRz
IGFjdGl2YXRlZCBidXQgaHR0cCByZXNwb25zZSBpcyBub3QgY29taW5nIGJhY2suDQoNCg0KY3Vy
bCAtayAtSCAiWC1BdXRoLVRva2VuOiAkdG9rZW4iIC1IICJDb250ZW50LVR5cGU6IGFwcGxpY2F0
aW9uL29jdGV0LXN0cmVhbSIgLVggUE9TVCAtVCB0Z3Atb2N0MTMubXRkLnRhciBodHRwczovLyR7
Ym1jfS9yZWRmaXNoL3YxL1VwZGF0ZVNlcnZpY2UNCg0KY3VybDogKDUyKSBFbXB0eSByZXBseSBm
cm9tIHNlcnZlcg0KDQpSZWdhcmRzDQotVmlqYXkNCg==

--_000_282BE4C09C7F4CC9850D729C95B137A3fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <09EBC983E3F68F4AA8D2F018AD3BE25A@namprd15.prod.outlook.com>
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
DQoJZm9udC1zaXplOjEyLjBwdDsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9
DQpzcGFuLkVtYWlsU3R5bGUxNw0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1jb21wb3NlOw0K
CWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0K
cC5wMSwgbGkucDEsIGRpdi5wMQ0KCXttc28tc3R5bGUtbmFtZTpwMTsNCgltYXJnaW46MGluOw0K
CWZvbnQtc2l6ZTo4LjVwdDsNCglmb250LWZhbWlseTpNZW5sbzsNCgljb2xvcjpibGFjazt9DQpz
cGFuLnMxDQoJe21zby1zdHlsZS1uYW1lOnMxO30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHls
ZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtc2l6ZToxMi4wcHQ7DQoJZm9udC1mYW1pbHk6IkNh
bGlicmkiLHNhbnMtc2VyaWY7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41aW4gMTEu
MGluOw0KCW1hcmdpbjoxLjBpbiAxLjBpbiAxLjBpbiAxLjBpbjt9DQpkaXYuV29yZFNlY3Rpb24x
DQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+DQo8L2hlYWQ+DQo8Ym9keSBsYW5n
PSJFTi1VUyIgbGluaz0iIzA1NjNDMSIgdmxpbms9IiM5NTRGNzIiIHN0eWxlPSJ3b3JkLXdyYXA6
YnJlYWstd29yZCI+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPlRlYW0sPG86cD48L286cD48L3Nw
YW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4w
cHQiPkkgYW0gbm90IHN1cmUgaWYgaXQgaXMgYSBrbm93biBpc3N1ZSBidXQgSSBhbSBzZWVpbmcg
Ym1jd2ViIHVwZ3JhZGUgaXMgYmxvY2tpbmcgZm9yIGZldyBtaW51dGVzIGFuZCByZXR1cm5pbmcg
ZW1wdHkgcmVzcG9uc2UuIEkgc2VlIGltYWdlIGlzIGdldHRpbmcgY29waWVkIGFuZCBnZXRzIGFj
dGl2YXRlZCBidXQgaHR0cCByZXNwb25zZSBpcyBub3QgY29taW5nDQogYmFjay48bzpwPjwvbzpw
Pjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXpl
OjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9InAxIj48c3Bh
biBjbGFzcz0iczEiPmN1cmwgLWsgLUggJnF1b3Q7WC1BdXRoLVRva2VuOiAkdG9rZW4mcXVvdDsg
LUggJnF1b3Q7Q29udGVudC1UeXBlOiBhcHBsaWNhdGlvbi9vY3RldC1zdHJlYW0mcXVvdDsgLVgg
UE9TVCAtVCB0Z3Atb2N0MTMubXRkLnRhciBodHRwczovLyR7Ym1jfS9yZWRmaXNoL3YxL1VwZGF0
ZVNlcnZpY2U8L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0icDEiPjxzcGFuIGNsYXNz
PSJzMSI+Y3VybDogKDUyKSBFbXB0eSByZXBseSBmcm9tIHNlcnZlcjwvc3Bhbj48bzpwPjwvbzpw
PjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEu
MHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L2I+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PGI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPlJlZ2FyZHM8bzpwPjwvbzpwPjwv
c3Bhbj48L2I+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PGI+PHNwYW4gc3R5bGU9ImZvbnQt
c2l6ZToxMS4wcHQiPi1WaWpheTxvOnA+PC9vOnA+PC9zcGFuPjwvYj48L3A+DQo8L2Rpdj4NCjwv
Ym9keT4NCjwvaHRtbD4NCg==

--_000_282BE4C09C7F4CC9850D729C95B137A3fbcom_--
