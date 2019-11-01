Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 509FDEC8F5
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 20:19:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474X7k0HPlzF7J3
	for <lists+openbmc@lfdr.de>; Sat,  2 Nov 2019 06:19:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=6208c0c36a=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="o6jYSss1"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="WfaQeRv5"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474X7217pMzF71G
 for <openbmc@lists.ozlabs.org>; Sat,  2 Nov 2019 06:19:07 +1100 (AEDT)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA1JIu6D017022; Fri, 1 Nov 2019 12:19:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=mGXZWte4/rLZdqRXclR65tXn9Oz7t39odGyqMiRKao8=;
 b=o6jYSss1E/7L/8vbT21Z5G39yH4UBk8OnlHvENkkc5n+cHybCr2nhjOCRJMK3X8g0AB+
 5tYjiQ76wC3PSSQiwhNulIU/OqKBCwbEs7u5YIsUVfXdNQkh8CLIUcQi0EhplDD5IbFP
 6FekeszZ/cPzqfFEZOje8spnKGo52ybKHxc= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2w0rsq8q5a-11
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 01 Nov 2019 12:19:01 -0700
Received: from prn-hub04.TheFacebook.com (2620:10d:c081:35::128) by
 prn-hub04.TheFacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Fri, 1 Nov 2019 12:18:56 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Fri, 1 Nov 2019 12:18:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQMcr91qxX9SW50X4RBVGRg7FWOCgDsZde/EjDMf+TnpwAbhyLn/a9f086ohK9X/aAAjP77XEMNS/j1IEntx8yuiuIdV8KsgAt1aIyuy7M2iZd6T0wncBrouEoT/915NC2XQY2m1xTcVLbDlnlHaVQxNTPrhqPV5LKpaHRuePhi/L8aDWSogV+yDsU+JoKY2dDQE9taeMhOs607Z7SUBVjzfdXp4t4GYU1coEt/NA8Zqomi3FlYWum6mxf4rgHnaQpsBZzCCcMVGLsMQfnyBVcbChWQ8qNgwxGLlMy7NlmCCMOJl6m+A112O7NuyXFyrxJLpIgJ6F9wA/sMA/yGhtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mGXZWte4/rLZdqRXclR65tXn9Oz7t39odGyqMiRKao8=;
 b=M28IXBb5gB/3afzAWMDVfoRfOTIUR1LkezSWwyWo68cVU4S5N+LPhQ4sWhDd9ItiQCnRGyBfgKvuzQoXvQF+W36H1HgeH+5nYPXKopZ09bq9J+u7b+dUwjfpg25yHGWUdTgAsDDVJ5xaC21vhHvNj8787h6bxmR7JPPf9NK9r/hc93vIz6FwHtj/RXhv+iyQ7+3flVLsw/zWFSUXU+7EVrbiIo+70RE5gS4qNqXgSkrRkY/KOvN4Z0su7oqlGsY8q6qJt3fmGVbRQPaaI1LiN7VL2NMvimJHhiEcUwhYnms9YHmkySM9n7ohs50QJbNXWYJNbo6wzt25+SyOFHlsLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mGXZWte4/rLZdqRXclR65tXn9Oz7t39odGyqMiRKao8=;
 b=WfaQeRv57mIWJhK6VKBUZ5vBtqLb7nAKifTvfETsSsCcBk9AYLhB3tECGJpRe0+IsbHz32PM5bYW4rX9vGmLVUhcpZ+28jNXxmli8Bt14Snoyc7V2vWu6uAeLiXL9wUVy+0X2+jtSOnUU9R9QLljpG40pWZj3bCZlbQKlyGdlZQ=
Received: from BY5PR15MB3636.namprd15.prod.outlook.com (52.133.252.91) by
 BY5PR15MB3620.namprd15.prod.outlook.com (52.133.252.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.24; Fri, 1 Nov 2019 19:18:55 +0000
Received: from BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::71db:9d2a:500c:d92b]) by BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::71db:9d2a:500c:d92b%4]) with mapi id 15.20.2408.018; Fri, 1 Nov 2019
 19:18:55 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>
Subject: 2 patch dependency
Thread-Topic: 2 patch dependency
Thread-Index: AQHVkOk0ybapz6luSEWB9d43XeZ28w==
Date: Fri, 1 Nov 2019 19:18:55 +0000
Message-ID: <EACBC95B-0761-4667-A622-E1C0EA6EF1ED@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:92df]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 48b3a39a-ec66-4fc1-312a-08d75f0056e6
x-ms-traffictypediagnostic: BY5PR15MB3620:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BY5PR15MB36209BC240B5BF57D7970DA0DD620@BY5PR15MB3620.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:331;
x-forefront-prvs: 020877E0CB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(396003)(39860400002)(136003)(366004)(376002)(189003)(199004)(76116006)(86362001)(478600001)(2616005)(5660300002)(486006)(558084003)(71200400001)(6512007)(476003)(14454004)(1730700003)(966005)(6486002)(4326008)(91956017)(5640700003)(36756003)(8676002)(6306002)(6436002)(2906002)(2501003)(6116002)(7116003)(46003)(6506007)(66446008)(66946007)(99286004)(6916009)(102836004)(81156014)(71190400001)(316002)(66476007)(7736002)(66556008)(64756008)(256004)(305945005)(8936002)(2351001)(186003)(33656002)(25786009)(81166006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR15MB3620;
 H:BY5PR15MB3636.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: orUOD7memgV9GBXChsSZ1aTYt7bGOHtnhsY/QOTC1SgAjcNsSpfGphbbfYzJHGzeYag3d4ZRgj3KniLMxkko6ndMFETxipKY0v59M+tUrUca0lSPnt/dVW88YTcAfrI4eYBtjD8hsVjdTDbBBOINosQYjHD0udZKMJ+Wx455rR/Q0yuEF1tkJfuxEBq5yOM8baj1mqYYX580naXzso9Zv0GssNkY4HWKM30Z9CStXmPzP6IoMCIiX9W7xZr5nP3QMez7fO9TKqNdHHkvjDYtH9uvlgsBu/Ywg6MrVpvt2NhkBrcX0OBzCjMnWuTxkrKX6vzqDlw9e2ZFQLHghL+ubIVqc84Ul4+hiE1gfRFb+JGs6JnIpH54tzFh7kSzkCaKQ2kLtM6IVRfBttqUAM4Zr+bcWvSitjrlLsnPHoYUtWy+up+fSZIjwlTB1jbYB17ZWk849KwZ7UU6yPo7WYv/JHsDRVsNhD5EkMLy2Py3+e0=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB252CC6C055D94D9B44A8CB7EF62FC9@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 48b3a39a-ec66-4fc1-312a-08d75f0056e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2019 19:18:55.7250 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SQEiKel7asgLp5VXRNYX4RiTEpNIbig3dQIgtIJLU8c9k1hXZiFIKWBO8lKkgKBSIhu9LkDdZBhVB0oTLThl1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3620
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-11-01_07:2019-11-01,2019-11-01 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxlogscore=651
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1911010176
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

SGkgQnJhZCwNCldlIGhhdmUgaXNzdWUgb2YgbWVyZ2luZyAyIGNvbW1pdCB3aGljaCBhcmUgZGVw
ZW5kZW50IHRvIGVhY2ggb3RoZXIuIEkgYW0gbm90IHN1cmUgaG93IGFyZSB3ZSBnb2luZyBhZGRy
ZXNzIHRoaXMuIA0KaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei8jL2Mvb3BlbmJt
Yy9tZXRhLWZhY2Vib29rLysvMjY2MjkvIGFuZCANCmh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJv
amVjdC54eXovIy9jL29wZW5ibWMvbWV0YS1waG9zcGhvci8rLzI1NjUxLw0KDQpSZWdhcmRzDQot
VmlqYXkNCg0K
