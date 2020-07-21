Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C55D922883A
	for <lists+openbmc@lfdr.de>; Tue, 21 Jul 2020 20:29:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BB6Zr2qYQzDqTQ
	for <lists+openbmc@lfdr.de>; Wed, 22 Jul 2020 04:29:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=44718ddf25=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=P2mRM7XU; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=ObrJAkVt; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BB6Yt5xdlzDqCY
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jul 2020 04:29:01 +1000 (AEST)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.42/8.16.0.42) with SMTP id 06LICB3L028788;
 Tue, 21 Jul 2020 11:28:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=yU8gHrJf2HpaCli6m8fcOk1J2f8e2GX5SxalNvwk/1Q=;
 b=P2mRM7XUmFnPXHIvsP4OsOZiu/e4stpAlkRublw6Q30jKFl233+Cgj2a2ra1ba1rlPSv
 eY4us75ucDjghNaAOqHXXO95YHqM/E3jYJjq9HoEDVsO8GFLAqCt68hJDZ0nMN0+HUdd
 +MA+uvQnoyh0cq02AG/AlBO5t1BgL4QQHX0= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0001303.ppops.net with ESMTP id 32bvrnnp2b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 21 Jul 2020 11:28:47 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.228) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 21 Jul 2020 11:28:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jNKpOj3tmGfuT4Qmc8pJ3l351tZrzcGqBnMC8DzOoSZSVAyMFNO7IfvKRt/llFv2HRbF7um4LEYrnzeAhoDjZtZJlSBkJujNNlPVD50NLoOuiKzirm5Fuut53mWuaMwegkuSD+Z6hzP2JQwIe2cODlNi1+jJG6y1jtt2StV/zy7p3tXvZOa+fdfp3pct5LDID2hhe9Y4bzLyn/RnWuaZmSwBd6L2CXiRVLS8iiEwf5ymVn8fdFDFvi+QO+m7YIOUDUmAXGzMQW+qVNIQFXXLhKxqffduyxMK7JapB18RAWaGVF+1aCQRcIESVhZHAeCE+5/1ysPSxRuduYIUusxovA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yU8gHrJf2HpaCli6m8fcOk1J2f8e2GX5SxalNvwk/1Q=;
 b=BaPh8lr/8ataMyTxY3g15BEESXkNJIX5+nN3Fqf9XQRm+F0vu9ZrStEN/NE8lSqvTK/hx1NIKlQXR8b9zFT0f7zCwgH+8wGNUWigG0WNkbKCKTi20MEF7Ua64MVqwZ3aNF+L7dUyw7BwILH65aU/J+c0NR48rQp47lKZor1Fz/+fiLcI5kohKD9YGObhFxJMcFFsT3oRlkSwE2s6YdFW6mzcbyktfcLwCsllKfLu842c7TQ7apeFhgc1OGFhGNXD9gDlO3pADsvnownbIh4oWsM3X+HMuSVzp5eK5HIzEPczC8zz5EhajfBZDYtwP3eqdAWlKHzOVaFDttpvVX1ldQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yU8gHrJf2HpaCli6m8fcOk1J2f8e2GX5SxalNvwk/1Q=;
 b=ObrJAkVtD4oB8zvte1HfXVec8hFE29BHTuK+jNj1w+82D0izR4HYPtxFoOYy+2eXLzT26rFu5yRubqsE/XBwxPAxOvpt9znnEFiYkBzkZte3IS7UucuRLTkrQH1RxpTytvjTQwpSr3ZDVB0xNB4t7+KvzdKEawKUEJ/2V5/e+rA=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2952.namprd15.prod.outlook.com (2603:10b6:a03:f9::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Tue, 21 Jul
 2020 18:28:45 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::2908:ebc2:73a5:45b3]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::2908:ebc2:73a5:45b3%5]) with mapi id 15.20.3195.026; Tue, 21 Jul 2020
 18:28:45 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "Ren, Zhikui" <zhikui.ren@intel.com>, Manikandan
 <manikandan.hcl.ers.epl@gmail.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: add multi-host support in the phosphor-post-code-manager
Thread-Topic: add multi-host support in the phosphor-post-code-manager
Thread-Index: AQHWXq+R4q9C/XB5C0iv/Svsf5AAaakSRi0A//+gogA=
Date: Tue, 21 Jul 2020 18:28:44 +0000
Message-ID: <2EFB6403-DA2F-434F-87CE-B9EA917A2BE4@fb.com>
References: <20200720160013.GB17117@cnn>
 <DM6PR11MB441079DE8A76ECF6C35E185094780@DM6PR11MB4410.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB441079DE8A76ECF6C35E185094780@DM6PR11MB4410.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:d1c9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9021ff5f-7152-4a5a-1421-08d82da3e6f5
x-ms-traffictypediagnostic: BYAPR15MB2952:
x-microsoft-antispam-prvs: <BYAPR15MB2952C4453D16597AA8F559C4DD780@BYAPR15MB2952.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kb58ppHutZs/UBCySAF1XEfpqdUV2ScRCU2RYjhN3j8odYOZEYQJCrxOcFsOEk1O7tMK2yXASJ6IRMZAsw8aYRVQlTtTrqgqZd6jNSKQ7+MGRpc58rPDoAvoplLCBByX9uQG5rcoLewiMQwkjPINkUAcR5hUc0/eciluD+DLJM1E7kfqCahLAN+c+X4eQmfjiiuanwSuY5pWkWyhPz76eQiufzXv+JtYYljWxLlR8+8x3ourU3JJGBzcmD2L5eSMNsaiSwF9nhNiE8vnr6V361///jFRWTo2mMsJCQ2YDO27Mbxd1ER/4/E7QVav+mrf6dKtFulmmwlhdgGSiZZA6g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(2906002)(498600001)(86362001)(36756003)(8936002)(54906003)(110136005)(6506007)(53546011)(6486002)(4326008)(6512007)(186003)(83380400001)(71200400001)(5660300002)(64756008)(66476007)(66556008)(76116006)(66446008)(33656002)(2616005)(19627235002)(66946007)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: GfDs/zkUvF/ggKPEVk0+7rXYT801dXCJAIWr1RXRErQpAk5NO9TJGiCULpjhMcnSCok93FrY464n202QlfnS2GhC8U5MTTGqYQUGGezAigPJJQp7NM7ytz2Xh9imEb3fjtGea+Iz4LGAWcZEQreDxMaSZssLw+F3+gx/hSrILuh0VFjDZRr23g8D53WOQYrKInR0ueaybbi8sMePFPKxX3ERdzRoehFaEWdrL6oAsLkavQwHVcwcKUOlbuyoKYDaohwdt8sWoPqDEZQU/b0bkBx5jjRoYciF/5V/q3hmBAoYAnAqT1nZrNDXBKDJi0D5IDlEfBiW55Fi5dKVG6/T/qfPC/mDOBQXHtSt4Fpyv7TzCxHi5HOz5xwQTVOuyjVq0Y7wCKmrkMu5TE3K7goPpzbj7T43uje5hinXFHYXaJvc3xuZHzfwvzy3tYiHsMZnz9G0cdPjKbsZyAh4lVgYvf/mUutyld2KmAgpLA8ZzYuI9hKBrNFu2E0pGH09bubyqFx/I+bzZZqazmaiKWUNyg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <FB35FF39288FB248A7B892F0AEA3E8F2@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9021ff5f-7152-4a5a-1421-08d82da3e6f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2020 18:28:44.8946 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sQT/jJojkDaay8+Ord9ykERFfnHF9F2SLlbYm052HrTY40+am9GornhE98Sh4wZbqeFmaMuo+Vpo4Gi2M1cPlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2952
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-21_12:2020-07-21,
 2020-07-21 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 suspectscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1011 mlxscore=0 adultscore=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007210122
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
Cc: "Wang, Kuiying" <kuiying.wang@intel.com>,
 "velumanit@hcl.com" <velumanit@hcl.com>,
 "manikandan.e@hcl.com" <manikandan.e@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SSB3b3VsZCBhbHNvIHByZWZlciBzaW5nbGUgcHJvY2VzcyBkZXNpZ24gYnV0IGFzIFBhdHJpY2sg
bWVudGlvbmVkIGFib3V0IGhvdCBwbHVnZ2FibGUgDQpIb3N0LCBlaXRoZXIgd2UgY2FuIHByZWRl
ZmluZSBtYXhpbXVtIGFsbG93ZWQgaG9zdCBwZXIgcGxhdGZvcm0gb3IgZ28gZm9yIG11bHRpDQpw
cm9jZXNzICBhcHByb2FjaCBmb3IgY29tcGxldGUgZHluYW1pYyBwbHVnZ2FibGUgaG9zdC4NCg0K
V2UgcmVhbGx5IG5lZWQgdG8gYXNzZXNzIHdoYXQgaXMgdGhlIGRpc2FkdmFudGFnZSBpbiBwcmVk
ZWZpbmluZyBtYXhpbXVtIG51bWJlciBvZiBob3N0cw0KV2l0aCBzaW5nbGUgcHJvY2VzcyBiZWNh
dXNlIHRoZXJlIHdpbGwgYmUgbGltaXRlZCBzbG90cyBhdmFpbGFibGUgcGVyIHBsYXRmb3JtLg0K
DQrvu79PbiA3LzIxLzIwLCAxMDoxMiBBTSwgIm9wZW5ibWMgb24gYmVoYWxmIG9mIFJlbiwgWmhp
a3VpIiA8b3BlbmJtYy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxhYnMub3Jn
IG9uIGJlaGFsZiBvZiB6aGlrdWkucmVuQGludGVsLmNvbT4gd3JvdGU6DQoNCiAgICBJIHdvdWxk
IHRoaW5rIHRoYXQgb25lIHByb2Nlc3MgdG8gaGFuZGxlIGFsbCBwb3N0LWNvZGUgaXMgYSBjbGVh
bmVyIGRlc2lnbi4gDQoNCiAgICAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KICAgIEZyb206
IG9wZW5ibWMgPG9wZW5ibWMtYm91bmNlcyt6aGlrdWkucmVuPWludGVsLmNvbUBsaXN0cy5vemxh
YnMub3JnPiBPbiBCZWhhbGYgT2YgTWFuaWthbmRhbg0KICAgIFNlbnQ6IE1vbmRheSwgSnVseSAy
MCwgMjAyMCA5OjAwIEFNDQogICAgVG86IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KICAgIENj
OiBXYW5nLCBLdWl5aW5nIDxrdWl5aW5nLndhbmdAaW50ZWwuY29tPjsgdmVsdW1hbml0QGhjbC5j
b207IG1hbmlrYW5kYW4uZUBoY2wuY29tDQogICAgU3ViamVjdDogYWRkIG11bHRpLWhvc3Qgc3Vw
cG9ydCBpbiB0aGUgcGhvc3Bob3ItcG9zdC1jb2RlLW1hbmFnZXINCg0KICAgIEhpIEFsbCwNCg0K
ICAgICBXZSB3b3VrbGQgbGlrZSB0byBnZXQgb3Bpb24gb24gYmVsb3cgbXVsdGktaG9zdCBzdXBw
b3J0IGFwcHJvYWNoZXMuDQoNCiAgICBCYWNrZ3JvdW5kIDoNCiAgICAtLS0tLS0tLS0tLS0NCiAg
ICAgIFRoZSBQaG9zcGhvci1wb3N0LWNvZGUtbWFuYWdlciBzdXBwb3J0cyBvbmx5IGhvc3QgdG8g
c3RvcmUvcmV0cmlldmUgdGhlIGhvc3QgcG9zdGNvZGUgaGlzdG9yeS4NCg0KICAgIEFwcHJvYWNo
ZXM6DQogICAgLS0tLS0tLS0tLS0NCiAgICBBcHByb2FjaCAxOiA8PCBydW4gdGhlIG11bHRpcGxl
IHByb2Nlc3MgPj4NCg0KICAgIENyZWF0ZSBhbmQgcnVuIHRoZSBtdWx0aXBsZSBwaG9zcGhvci1w
b3N0LWNvZGUtbWFuYWdlciBwcm9jZXNzIHRvIGhhbmRsZSBlYWNoIGhvc3QgcG9zdGNvZGUgaGlz
dG9yeS4NCg0KICAgICAgIHh5ei5vcGVuYm1jX3Byb2plY3QuU3RhdGUuSG9zdDAuQm9vdC5Qb3N0
Q29kZQ0KICAgICAgIHh5ei5vcGVuYm1jX3Byb2plY3QuU3RhdGUuSG9zdDEuQm9vdC5Qb3N0Q29k
ZQ0KICAgICAgIHh5ei5vcGVuYm1jX3Byb2plY3QuU3RhdGUuSG9zdDIuQm9vdC5Qb3N0Q29kZQ0K
ICAgICAgIHh5ei5vcGVuYm1jX3Byb2plY3QuU3RhdGUuSG9zdDMuQm9vdC5Qb3N0Q29kZQ0KDQog
ICAgQXBwcm9hY2ggMjogPDwgcGFzcyBudW1iZXIgb2YgaG9zdCB0byBzaW5nbGUgcHJvY2VzcyA+
Pg0KDQogICAgUGFzcyBudW1iZXIgb2YgaG9zdCB0byBzaW5nbGUgcHJvY2VzcyBwaG9zcGhvci1w
b3N0LWNvZGUtbWFuYWdlciB0byByZWdpc3RlciBkYnVzIG9iamVjdCBhbmQgaGFuZGxlIGVhY2gg
aG9zdCBwb3N0Y29kZS4NCg0KICAgICAgIHh5ei5vcGVuYm1jX3Byb2plY3QuU3RhdGUuSG9zdDAu
Qm9vdC5Qb3N0Q29kZQ0KICAgICAgIHh5ei5vcGVuYm1jX3Byb2plY3QuU3RhdGUuSG9zdDEuQm9v
dC5Qb3N0Q29kZQ0KICAgICAgIHh5ei5vcGVuYm1jX3Byb2plY3QuU3RhdGUuSG9zdDIuQm9vdC5Q
b3N0Q29kZQ0KICAgICAgIHh5ei5vcGVuYm1jX3Byb2plY3QuU3RhdGUuSG9zdDMuQm9vdC5Qb3N0
Q29kZQ0KDQoNCiAgICBUaGFua3MNCiAgICBNYW5pLkUNCg0K
