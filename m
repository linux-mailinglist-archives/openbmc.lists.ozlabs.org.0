Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DC6EC8D3
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 20:04:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474WnZ03JtzF6jV
	for <lists+openbmc@lfdr.de>; Sat,  2 Nov 2019 06:04:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=6208c0c36a=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="AdHuM6E0"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="CIOuxJWs"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474Wml0g9HzF6Zy
 for <openbmc@lists.ozlabs.org>; Sat,  2 Nov 2019 06:03:16 +1100 (AEDT)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id xA1FeweF008492;
 Fri, 1 Nov 2019 12:03:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=R0EkTJIbOMFAVIxfqrCvGYU48tq8nKW6HHhTpMoiGDE=;
 b=AdHuM6E0kEZVD8vxm31V/V3+ONjxP3guTJLc+CBwchQQqHJcOq/BGpQcZ9czmI6bEhOu
 cJWQp4OOGDCMVCjYg7oihy0NKhUCAPGOTfwkoWWjYtjQPDjCMXQXuKmMguAJzD0qx2MM
 XfxqIcfvVn27Fc5MNF5N4LvuqynDPi8eO+k= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by m0089730.ppops.net with ESMTP id 2w0c4v49p7-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 01 Nov 2019 12:03:09 -0700
Received: from prn-mbx04.TheFacebook.com (2620:10d:c081:6::18) by
 prn-hub04.TheFacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Fri, 1 Nov 2019 12:02:57 -0700
Received: from prn-hub03.TheFacebook.com (2620:10d:c081:35::127) by
 prn-mbx04.TheFacebook.com (2620:10d:c081:6::18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Fri, 1 Nov 2019 12:02:57 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Fri, 1 Nov 2019 12:02:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMRIb/eNaNMqPWn+z3nlQQdnCSNbY3mEWUNYyfkvHB+UPuMIZunIB7QQor/9y2GYt6adt0thbuzQhOIFKhIQ6lTuHiGb22CFtgT6JLAl6DjE3UYMYUjaTM9g3XFjFSv9MvxQ54SmZKDbyIkGVAkt/MI15HgMUU43zP0AMnykojSMlUrU0Me8tFxcpUFP28VVhQ2urN2F/X0oOKTvmZRepbfUVN6617A2z24MyBuo1soEt8ZqATui+qJFlHocJ1l6ikK1gHT7qvXIz8+4jun4DAmKoIVJVAK9NwUlvzVHr1ll18MmmdccngODkVfnG/VYcUNmV3zCvWtG7/9fFkQDvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R0EkTJIbOMFAVIxfqrCvGYU48tq8nKW6HHhTpMoiGDE=;
 b=Qts0xkS28aB8idF9AnKGPZp3/d5lrCJWCKOBGtE+5u5+RCdIZmOdjvOWzWGeOj7SsfmXfxaAb+5rnHzQVNw+5mNhNdpiQlXTuCOzo31dcWyEuAjCTyry+ezcWzfq++UlnXVuFADj7+2aUALM3uYSnBTAUdfADFhy5wfoaPT+k0pJK7dIKaqUmY+EA+usVm1Gb1UK/3UFTgkIUPw5A/0DoVIyZR4KohR8oS96s1F2vLH7VinWq9fAexn2HBPWKkHOZC35juvYFb1BeUaPP6eHnFTYRneANr7mTX580QGJ7HyMOtBaKKID72vqOXQHqzH4iug5yzsfejACN4t+x5oZgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R0EkTJIbOMFAVIxfqrCvGYU48tq8nKW6HHhTpMoiGDE=;
 b=CIOuxJWsZLzGY23dzMoK+VqkkTciGO1B0W1xIk4QTQo0KHWU0elp3oyxzlppNj1I6GYz2rxEZrVGe0p/rMKjimFZ6wKOjHZUGf/7+Tis+SislQAbeI2lcQ6hKexy0MWeLyqXodPhl6L/eqjfy6CUEFgq5uDDAZErL1tEOUXfCbs=
Received: from BY5PR15MB3636.namprd15.prod.outlook.com (52.133.252.91) by
 BY5PR15MB3553.namprd15.prod.outlook.com (10.255.245.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Fri, 1 Nov 2019 19:02:54 +0000
Received: from BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::71db:9d2a:500c:d92b]) by BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::71db:9d2a:500c:d92b%4]) with mapi id 15.20.2408.018; Fri, 1 Nov 2019
 19:02:54 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: kernel patch pull for IPV6
Thread-Topic: kernel patch pull for IPV6
Thread-Index: AQHVkFBjJJRSJCw2LkGpdAU+nnKGP6d1iPuAgACu+IA=
Date: Fri, 1 Nov 2019 19:02:54 +0000
Message-ID: <D1C02E74-A3B5-428F-BD66-04AB9F87C3FD@fb.com>
References: <06422EF3-4D9D-4880-99EA-513C41215F37@fb.com>
 <CACPK8Xf50ud_K-OMNGDQp9NBxNF4GtG9cRRKhDPA6N1z6XBvpg@mail.gmail.com>
In-Reply-To: <CACPK8Xf50ud_K-OMNGDQp9NBxNF4GtG9cRRKhDPA6N1z6XBvpg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:92df]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 937f574c-efbe-48f2-6aa2-08d75efe19cd
x-ms-traffictypediagnostic: BY5PR15MB3553:
x-microsoft-antispam-prvs: <BY5PR15MB35538B53E3E4E92F2CF329D8DD620@BY5PR15MB3553.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 020877E0CB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(366004)(396003)(136003)(376002)(39860400002)(199004)(189003)(102836004)(46003)(6506007)(86362001)(186003)(2906002)(8936002)(7736002)(305945005)(81156014)(229853002)(81166006)(446003)(76176011)(316002)(2616005)(8676002)(99286004)(486006)(5660300002)(33656002)(6116002)(6436002)(6486002)(6246003)(36756003)(6512007)(11346002)(476003)(256004)(71190400001)(71200400001)(66556008)(66476007)(66446008)(91956017)(64756008)(76116006)(66946007)(4326008)(478600001)(14454004)(6916009)(25786009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR15MB3553;
 H:BY5PR15MB3636.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0vkt1PRkrqrDT7wOKQyY1CXQ3lp9wMmXmvfLbcCNyjoDn9P5E5ns453py8uBhJ9IWNSOG5lcjTMJUrlhodzgYHUtItthApEgDk3BfuEYrGdR7Y6WfoJc3iQoT+CzV/Ge55aCwyJSFgR7P7Y9Y8aWpi5c8ggQtqI6hvcFKcF3GhZK42AgQ4kealwQET2XWpMkt+MjdOUbnmGvQB7n/bRiRIr6SQifnG7a/37NZy+VpNu8D8Z69+V2MmEft29pL7igsZ7fn8JG9/o/k366Qrkdneon5BKisNXfgtCQVRRHzLR3GnPGylFYvzcYgPjWsI1A//jyRQUjIRwB1SOkkjY1a3WmOHZX1Olre4ops8M32QxyOR4qb3p42vv+5FPB/Tcyp/1K+ipDNJyz5TxhEm+MoQlyJ8UtWXqcvw4ApfJbA0u6AlSrOdGkCjI0kNJ9uUnW
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <DBA295A165F8D940B8A4B161EED2AB49@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 937f574c-efbe-48f2-6aa2-08d75efe19cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2019 19:02:54.2212 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wIy88F6TZ/DewfjRYJm/TndV7y5HbtWXfisHotAuIPC6g6Dg3zoDKRQmL9dQAVi1yMPGLYShOzZt/W6hEl+AOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3553
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-31_08:2019-10-30,2019-10-31 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxlogscore=999
 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015 mlxscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1911010024
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

DQoNCu+7v09uIDEwLzMxLzE5LCA2OjM2IFBNLCAiSm9lbCBTdGFubGV5IiA8am9lbEBqbXMuaWQu
YXU+IHdyb3RlOg0KDQogICAgSGkgVmlqYXksDQogICAgDQogICAgUGxlYXNlIHR1cm4gb2ZmIEhU
TUwgZW1haWwgd2hlbiBwb3N0aW5nIHRvIHRoZSBsaXN0LiBUaGFua3MhDQogICAgDQogICAgT24g
RnJpLCAxIE5vdiAyMDE5IGF0IDAxOjA1LCBWaWpheSBLaGVta2EgPHZpamF5a2hlbWthQGZiLmNv
bT4gd3JvdGU6DQogICAgPg0KICAgID4gSGkgSm9lbCwNCiAgICA+DQogICAgPiBDYW4geW91IHBs
ZWFzZSBwdWxsIGZvbGxvd2luZyBwYXRjaCB0byBvdXIgb3BlbmJtYyBrZXJuZWwgZnJvbSBsaW51
eC1uZXh0IHJlcG9zaXRvcnkuDQogICAgPg0KICAgID4gY29tbWl0IGNmMGViYTMzNDI2ODU2MzE1
MmU0YThiYzlhYjg2NWQwMDM3YTc5NDgNCiAgICA+IEF1dGhvcjogVmlqYXkgS2hlbWthIDx2aWph
eWtoZW1rYUBmYi5jb20+DQogICAgPiBEYXRlOiAgIFRodSBTZXAgMTIgMTI6MDQ6NTAgMjAxOSAt
MDcwMA0KICAgID4NCiAgICA+ICAgICBuZXQvbmNzaTogRGlzYWJsZSBnbG9iYWwgbXVsdGljYXN0
IGZpbHRlcg0KICAgIA0KICAgIERvIHdlIHN0aWxsIG5lZWQgdGhpcyBub3cgdGhhdCBCZW4gaGFz
IGZpeGVkIGNoZWNrc3VtbWluZz8NCg0KWWVzIHdlIG5lZWQgdGhpcywgdGhpcyBpcyBub3QgcmVs
YXRlZCB0byBjaGVja3N1bW1pbmcuIEl0IGlzIGZvciBtdWx0aWNhc3QgZmlsdGVyaW5nLg0KTXkg
cGF0Y2ggZm9yIGNoZWNrc3VtIGluIGZ0Z21hYyBkcml2ZXIgaXMgbm90IHJlcXVpcmVkIHdoaWNo
IHdhcyBub3QgZXZlbiANCkFjY2VwdGVkLg0KICAgIA0KICAgIERpZCB5b3UgdHJ5IHRlc3Rpbmcg
d2l0aCB0aGUgY2hlY2tzdW1taW5nIHBhdGNoIGFwcGxpZWQgYW5kIHRoZQ0KICAgIG11bHRpY2Fz
dCBvbmUgcmV2ZXJ0ZWQ/DQogICAgDQogICAgPg0KICAgID4NCiAgICA+IGNvbW1pdCA4ODgyNGUz
YmYyOWEyZmNhY2ZkOWViYmZlMDMwNjM2NDlmMGYzMjU0DQogICAgPiBBdXRob3I6IEJlbmphbWlu
IEhlcnJlbnNjaG1pZHQgPGJlbmhAa2VybmVsLmNyYXNoaW5nLm9yZz4NCiAgICA+IERhdGU6ICAg
RnJpIE9jdCAyNSAxMzo0NzoyNCAyMDE5ICsxMTAwDQogICAgPg0KICAgID4gICAgIG5ldDogZXRo
ZXJuZXQ6IGZ0Z21hYzEwMDogRml4IERNQSBjb2hlcmVuY3kgaXNzdWUgd2l0aCBTVyBjaGVja3N1
bQ0KICAgIA0KICAgIEkndmUgYXBwbGllZCB0aGlzIG9uZS4NClRoYW5rcyBmb3IgYXBwbHlpbmcg
dGhpcy4gICAgDQoNCiAgICBDaGVlcnMsDQogICAgDQogICAgSm9lbA0KICAgIA0KDQo=
