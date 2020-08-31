Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63718258433
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 00:49:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgQPX3gf4zDqWF
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 08:49:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=651215578a=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=iOdXAcyB; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=g//Mjjsi; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgQNd2lQQzDq63
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 08:48:44 +1000 (AEST)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07VMZd48019988; Mon, 31 Aug 2020 15:48:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=/ivcwevV0UWNEil1owyPZ9hGHBowL1q0m7N31h3a6Ns=;
 b=iOdXAcyB4+Uwl8Uw+y+4vv/8b2kH6ZTy49Zrm+5J+ZWbpGBPmfB2HvP4DEVgqCWT4xra
 75jk6fX8CNqQDDsSZGL9cWHjXOkl8hZpPAAzMjjesG1N4Sk1n69ozhF0EwhMZlYp3u0W
 cSUbvzonmxPFEW3QU153ywfcbg8auqNVCP4= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 3386gt7fe3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 31 Aug 2020 15:48:41 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.100) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 31 Aug 2020 15:48:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QxvuIrFvhXjuwa3zyv+rtC2241Oiz+66dVby9MXZXqIr/DeHKtPPFiIUKrHUTFmNFJEJg+ofbAmL5/4FULDFO9i/f9owIz7YJglBThCv21kJ2IDeuQJ4fpgocMeZzFqAl7iHYQK2HXQgU8qcNciUIfYYA4LX06vyGkGwdKtCvfCtsq8J/lQso4Nk2vHs9LgA0/1tGatiwEse3qLCQUXPePuMdrOG8PiRSdRCQtZV3T4vAdJHLutu6DYnVd6eKRnKfrToSUhGEqvjCYz4XcAPZlgfx9TlHU7cccs4gP1+juXiU/IL68IP5FD5dFywyu58Qgxkk5IFTl58IhdBWToWuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ivcwevV0UWNEil1owyPZ9hGHBowL1q0m7N31h3a6Ns=;
 b=RxfBLdRYLYpqq6RkYiMZz6DPtdPECU5Kbtj4LKvyiJ2E2wijcSVrXYfRtDLH2ryr70cAwjkGvrYQdguEmLPrLJkVO2qcsL8HdmlpzgFm0gFIoBpt3qDEtdYUaySfrL9BX2LZAcRXFSkAGAcL6FcOHRKM8r/IKGLegJI2oziTsPvNOrLUu8NcMPr28lXtu0kyzebi8Ru+3y6wQymt6uY/KUBWVkDcYr/QvFesnaDaB2XbyLcEouvCgAaUlr5jGWU4AIiXyjoCjsbIsLbhp3gCCUjizWqryaGO7hfmMcMMhlrF7pAzYWG8zuSnQcXPvTzyHiVlpNnhfkYVNvKgkZ0mMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ivcwevV0UWNEil1owyPZ9hGHBowL1q0m7N31h3a6Ns=;
 b=g//Mjjsi1HHOiARmzC07H3T6YZ0VgFevmlemwkc1gKkFcWlc69xHMnOXyfkLVTZLVTZ297BhE3Iajcjv67mpyXWxRdFVSY9a4yl74YX3m0Z5QkvZNE/+9uuLVVlBRjSZUD+oiOmOr6Oe5qbUhbMK//taM9sEk1O7xQiLyEEuqWI=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2488.namprd15.prod.outlook.com (2603:10b6:a02:90::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Mon, 31 Aug
 2020 22:48:39 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::2908:ebc2:73a5:45b3]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::2908:ebc2:73a5:45b3%5]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 22:48:38 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Bruce Mitchell <Bruce_Mitchell@phoenix.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: When building OpenBMC . . . ?
Thread-Topic: When building OpenBMC . . . ?
Thread-Index: AdZ/GJ+lFWuwSqbeSoqGTbguwoelIQAlZGEA
Date: Mon, 31 Aug 2020 22:48:38 +0000
Message-ID: <A951892D-226B-45F4-97C1-963AB8E4B2BD@fb.com>
References: <c9737b1c67174a4fa9666b1d8afde380@SCL-EXCHMB-13.phoenix.com>
In-Reply-To: <c9737b1c67174a4fa9666b1d8afde380@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: phoenix.com; dkim=none (message not signed)
 header.d=none;phoenix.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [73.223.116.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2505622d-a25a-44fb-d388-08d84e000099
x-ms-traffictypediagnostic: BYAPR15MB2488:
x-microsoft-antispam-prvs: <BYAPR15MB248804BEE5ACF21C7CD2CA45DD510@BYAPR15MB2488.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K6MQzBXunImZ01s/i6V0MQpWl7u8y2mdkZYJh72DHVVwQj2B8RP7eFJoWu3QSPTxG3q6V28cAV17Wr5Wr/CJvHsT9LZYiLiOdk7kjDY/9gD6fqPc324va7tsibgojelRszkU5R9O+RrQq3413Vc0V85S5kXIQKEOsV/8r9c1E2iNGzNlBslYtmomvMkVw9+UVy0UAbEQP0sEbo0msATBFoyy0wCEi1kwOMcfGUOnflCxPRi+d7mrMoKLjOGpZEFmJz3b8Un1qsdJj+wYT3QXXve5ljwELJup/zAYwDmr+HkTP99OV1GBOMEfknntxNB5LPcsz7v/zAel2PaCBg5ZLR7n2rfwGRxmRXuJ80uG1tvU+fc0HD5Aac0MmrG2QQaqXyova0aO53ccXCpkcJkU6A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(136003)(396003)(346002)(376002)(366004)(6486002)(8676002)(66556008)(66476007)(4744005)(86362001)(8936002)(7116003)(66946007)(36756003)(2906002)(76116006)(3480700007)(64756008)(33656002)(110136005)(66446008)(6506007)(26005)(186003)(966005)(2616005)(71200400001)(316002)(5660300002)(6512007)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: xIJgpqTt0KN2cRlDhwo+CosSHFQuJfVzuAJTSixtEJQ5LvVVV9Bwh2dEsyHZa1TXHJ8kz2LIkdi4oG7qwMHlWr3AS1ZO7psuroNh+G+ZSQtiK33gnl0hmYLPaVFMvZDRN3XjNy9nNuXz5bGpvAdb3NDBhe9y4a490l9BgZ2X0zg9tcXDRRN6oUpLYUzvCX7CbaekpvkkQPH5fRdQlhFIgH6GKJiSLFgOY3LILGKvw2HjPMQN0dbSnpOVtOyLRqbURWA9JgZbjrbpjh5Rzsd8pM0KI6bbnYmACFVW63UN59SVEYL3FRRugFYVFTgZOzV+jjVrsfv3OxSs8zWvNCDxXChyblAGzH46j9A3Hil0ztqnxFY6j6iZr3OXIAyg+xBnpHGotTI+PGRUC4AAwqrVwNoIh5jCyuTAgy234m7ELVnR5jKsKUSHwitHxd1x/3ZQYVAJvXC0CK8QIO4WORFrdGPR/rhJds54oe+WoDF4k+1rLDCqyf2ONBCu+DraykIMk85JI0nB3NagU7SHi8k9tvOe0dj3c5ij7nmUjH5hk5GWdnPYJMsN+nd3OysLMqn/DiSbcEj+/GYf8tn9WaLbNkWhJfnQtmQ/Va0MDmoQ9jLybeqNoX+baF1WdGLVr9lpBdC6WfruUyeOyEzwhd7qpQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB56E1A5B10C4744AEE3635483E21A5E@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2505622d-a25a-44fb-d388-08d84e000099
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2020 22:48:38.8513 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y/APKd9jQ4zEGlSU9aR5LbQlUtbJhVSjW92qRB41+ULmE3gMkcXB8OqzNazzafm9cEm+8a0g+pwjIztkcdbBpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2488
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-31_10:2020-08-31,
 2020-08-31 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 spamscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008310134
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

DQoNCu+7v09uIDgvMzAvMjAsIDM6MDQgUE0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBCcnVjZSBN
aXRjaGVsbCIgPG9wZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMub3psYWJz
Lm9yZyBvbiBiZWhhbGYgb2YgQnJ1Y2VfTWl0Y2hlbGxAcGhvZW5peC5jb20+IHdyb3RlOg0KDQog
ICAgV2hlbiBzZWxlY3RpbmcgVGFyZ2V0IGhhcmR3YXJlIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVu
Ym1jL29wZW5ibWMjMy10YXJnZXQteW91ci1oYXJkd2FyZQ0KICAgIHRvIGJ1aWxkIGZvciB0aGUg
aXMgYSB0aW9nYXBhc3MsIG5vdyBpZiBJIGFkZCBhIG1ldGEtcGhvZW5peC9tZXRhLXRpb2dhcGFz
cy9jb25mICBob3cgZG9lcw0KICAgIAlzb3VyY2Ugc2V0dXAgdGlvZ2FwYXNzIGJ1aWxkDQogICAg
a25vdyB3aGljaCB0aW9nYXBhc3MgdG8gYnVpbGQ/DQpUaGVyZSBpcyBvbmx5IG9uZSB0aW9nYXBh
c3MgaW4gdGhlIHN5c3RlbSBhbmQgaXQga2Jvd3Mgd2hlcmUgdG8gYnVpbGQgZnJvbS4NCg0KICAg
IE9yIGFtIEkgbm90IHN1cHBvc2VkIHRvIGNob29zZSBhIG5hbWUgKGkuZS4gdGlvZ2FwYXNzIGlu
IHRoaXMgZXhhbXBsZSkgdGhhdCBpcyBhbHJlYWR5IGluIHRoZSBsaXN0DQogICAgd2hlbiBJIG5l
ZWQgdG8gY3JlYXRlIGEgbmV3IG1ldGEtcGhvZW5peC9tZXRhLTxtYWNoaW5lPi9jb25mPw0KDQog
ICAgVGhhbmtzIQ0KDQogICAgLS0gDQogICAgQnJ1Y2UNCg0KDQo=
