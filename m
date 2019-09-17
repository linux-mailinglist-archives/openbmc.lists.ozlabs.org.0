Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AE7B5489
	for <lists+openbmc@lfdr.de>; Tue, 17 Sep 2019 19:46:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XrBw4Ly8zF3xx
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 03:46:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=41638c232b=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="rK+tlIvh"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="XTbMGPg9"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XrB86XfSzF3Lg
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 03:45:50 +1000 (AEST)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8HHjhUb019081; Tue, 17 Sep 2019 10:45:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=cERTMO6zMI2LAQ1KyAmaafA3FI0AApD580wXkB6XuCA=;
 b=rK+tlIvhUwuBcjcdMD5NvvyIu1oeyqYAy0ODJn4uITEIlkM9NBWFcfZFYwKypo5/FHZ4
 z+LqotG4bxYuCGXHo+ZztK0AZ0oyubloYLDXkKMqMrA3WhjP+s4ArjxXgWwX82cLOLPs
 ca/suxRDvGQKei0jvbqyXc2TS1z+B9d86dA= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2v2bum6797-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 17 Sep 2019 10:45:45 -0700
Received: from ash-exopmbx101.TheFacebook.com (2620:10d:c0a8:82::b) by
 ash-exhub101.TheFacebook.com (2620:10d:c0a8:82::e) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 17 Sep 2019 10:45:41 -0700
Received: from ash-exhub201.TheFacebook.com (2620:10d:c0a8:83::7) by
 ash-exopmbx101.TheFacebook.com (2620:10d:c0a8:82::b) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 17 Sep 2019 10:45:41 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.101) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 17 Sep 2019 10:45:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iziW+wUw15YSXs9dFWq4gEf2DICfjAINbcen2kYXJH/WwMcgCO7NJtbM+SxDDdguedd4B4LILCx7IUBjJN4TfdGJD5YkfXYjypiMnZp8UrT/VmB8PsuYEhW9PEli8W9y956qjZNia6BCDSJlx0aSR/AA2XKr5uaLvcxe98NvdMDfP6AOoNM1fUYEMciTPa7mOwAw4U2o0tGhFKlGtKRzeFyZptc4xx6xqpvw0DK5ybE6ndHFl0TzeydB3xhIYwUkylm/NJt27wHsn8cEUgWvtYybCAzhCYgEE2shdGv9bk9ZJtMUWK4Tc5uI9mbesZwbHd9LoxVRvqW7Krroqk5Wrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cERTMO6zMI2LAQ1KyAmaafA3FI0AApD580wXkB6XuCA=;
 b=KbOevR1jM4uNgC31WZ7ZcuH91slTbp9VQZv0j8ayl/XN2l1+VtlwEWW2Mumb2vZ1hu3MNJdO4FGdNzZY0oXZJiGmSQpgZuFrcq3eXOIUpOd6p6BKrksGPMPqWoYqVoAgM/+pqT6NMRHoq+/0mJ78kjQ4BnZ4JNDFIJeuoEIWeCI9Awm5ouNI4aIgQLXhsmnmuaEzdlD/dN11SzUiEmj69GyNbHGpjOCokULZGIum4ZZf65VhvkF4ADKgA8ZffR2CEpi/KLMTP6rxrT4wYuCOLXCm7/+soPZKGrpzAqH4ygXfZUJg2rsfDOcTdIG6qbEN1ZGMBNiiUYPexnZVfFQ18w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cERTMO6zMI2LAQ1KyAmaafA3FI0AApD580wXkB6XuCA=;
 b=XTbMGPg9nlHxwdprYXOOd14K829xt2h/kJGo393CYE/CcZjTtylG1qAuVYdw2EX+gxtCMDaBkOmiCBYcmg+qzi0HocBZvhN/UaQKko9wJuM9y1Br93NQ0VHziY2gUQW+VaxrMxLbuwTFT7Xg/efMhYgdWzDVuAEWtW1nE/0kQa0=
Received: from BY5PR15MB3636.namprd15.prod.outlook.com (52.133.252.91) by
 BY5PR15MB3651.namprd15.prod.outlook.com (52.133.252.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.23; Tue, 17 Sep 2019 17:45:39 +0000
Received: from BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::bc3e:c80f:b59e:98aa]) by BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::bc3e:c80f:b59e:98aa%6]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 17:45:39 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Lei YU <mine260309@gmail.com>
Subject: Re: Phosphor code updater
Thread-Topic: Phosphor code updater
Thread-Index: AQHVbQBO2otkMK5gZEWDb9BQ71D0cKcvKcsAgACGSgA=
Date: Tue, 17 Sep 2019 17:45:39 +0000
Message-ID: <2D4BCEA9-A10E-4B06-8D0C-34E8A6746F5B@fb.com>
References: <05C62CB4-950C-42F4-9C17-41C91E54D9B4@fb.com>
 <CAARXrtnDnsq9BQEftaeymEF1W9ehKCwuzUZLkKbkcXJ3a60RnQ@mail.gmail.com>
In-Reply-To: <CAARXrtnDnsq9BQEftaeymEF1W9ehKCwuzUZLkKbkcXJ3a60RnQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:850b]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb2f0ce4-2e7a-4873-2143-08d73b96dabd
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR15MB3651; 
x-ms-traffictypediagnostic: BY5PR15MB3651:
x-microsoft-antispam-prvs: <BY5PR15MB36519A2EA03C98DBD95D851CDD8F0@BY5PR15MB3651.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(396003)(376002)(346002)(39860400002)(189003)(199004)(2616005)(486006)(53546011)(2906002)(6436002)(1411001)(5660300002)(99286004)(8936002)(4326008)(71200400001)(71190400001)(6116002)(66446008)(76116006)(305945005)(36756003)(66946007)(91956017)(7116003)(14444005)(66476007)(66556008)(7736002)(6512007)(256004)(64756008)(6246003)(25786009)(6916009)(15650500001)(476003)(561944003)(54906003)(86362001)(6486002)(478600001)(11346002)(33656002)(14454004)(186003)(46003)(316002)(81156014)(3480700005)(102836004)(446003)(6506007)(229853002)(81166006)(8676002)(76176011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR15MB3651;
 H:BY5PR15MB3636.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: aruIhM5CxlkZ7sAzV9T4eD6veTvXk2oFgT5NXn/yKSi4mQIspNm0QDj1eH/kveSlaBOsAqLddgHl6j4niWFJTJZysZ4DAF1xQmj0+SoFo5xd3QYRdpaYGnCuB6TBvSD5Jic+KysOBySpDv/Jn9PBnYqFOR1aXvw1Ddp93y42jC/cF9VEsSTQciY7701MuXAlY+7dkS3nLqt7SuBvig9PGveFHkVqjR0g+JtVJWpIEF/9aKxR1SNkYMGlwT8BlxycZckf19h1HW30jglx1Z5DFs9Q0wHUi8HVwnN39RGUN3rFbkEo6y0Tgczkg6L7E1lWNyslMWt4plVxBEig5WtOL6JmHTvdeAaxu23HfStNkp68ukfowlqoTfGdzGQ/gYb21yf4LJ1meQYw/gR50hbuFU6Oi4NB78Vi5UBQXFpNmrE=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <9AD34C71ACC5CD4AB6986589986BD73E@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fb2f0ce4-2e7a-4873-2143-08d73b96dabd
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 17:45:39.4767 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6GTe91NoTaCPLUI4iUHM73nle18FQM9AJKbjv6Ve0OPcKse72Fzoj+uNMs3AP8oKMac5lXVHoYXKXwK+8Ow4hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3651
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-17_09:2019-09-17,2019-09-17 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 clxscore=1015 spamscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 mlxlogscore=671
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1909170171
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
Cc: "openbmc @ lists . ozlabs .
 org" <openbmc@lists.ozlabs.org>, Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDkvMTYvMTksIDc6NDUgUE0sICJMZWkgWVUiIDxtaW5lMjYwMzA5QGdtYWlsLmNv
bT4gd3JvdGU6DQoNCiAgICBPbiBUdWUsIFNlcCAxNywgMjAxOSBhdCAxMDozNCBBTSBWaWpheSBL
aGVta2EgPHZpamF5a2hlbWthQGZiLmNvbT4gd3JvdGU6DQogICAgPg0KICAgID4gSGkgQnJhZCwN
CiAgICA+DQogICAgPiBJIGxvb2tlZCBpbnRvIGNvZGUgdXBkYXRlciBmcm9tIHBob3NwaG9yLXNv
ZnR3YXJlLW1hbmFnZXIgYXMgeW91IHN1Z2dlc3RlZCBsYXN0IHdlZWsuIEFzIHBlciBjdXJyZW50
IGltcGxlbWVudGF0aW9uLCBpdCBpcyBjb3B5aW5nIGFsbCA0IHBhcnRpdGlvbiB1Ym9vdCwga2Vy
bmVsLCByb290ZnMgYW5kIHJ3ZnMuIEkgd2FudGVkIHRvIG1ha2Ugc29tZSBtb2RpZmljYXRpb24g
dG8gYWxsb3cgdXNlciB0byBjaG9vc2Ugd2hldGhlciB0byB1cGdyYWRlIHJ3ZnMgb3Igbm90LiBU
aGlzIHdheSwgYWxsIHBlcnNpc3RlbnQgc3RvcmFnZSBjYW4gYmUgcmV0YWluZWQgYWZ0ZXIgdXBn
cmFkZSBhcyB3ZWxsLg0KICAgIA0KICAgIEJ5IGRlZmF1bHQsIGltYWdlLXJ3ZnMgaXMgYW4gZW1w
dHkgaW1hZ2Ugd2l0aCBzaXplIDAsIGFuZCB0aHVzIGl0IHdpbGwgTk9UIGJlDQogICAgdXBkYXRl
ZCB0byByd2ZzIHBhcnRpdGlvbi4gU28gYnkgZGVmYXVsdCByd2ZzIGlzIHByZXNlcnZlZCBkdXJp
bmcgY29kZSB1cGRhdGUuDQpUaGVuIGhvdyB3aWxsIHdlIGdldCBhIGNsZWFuIGluc3RhbGwuIElm
IHdlIHdhbnQgdG8gaGF2ZSBjb21wbGV0ZSBmYWN0b3J5IHJlc2V0IHdpdGggZW1wdHkgcncuDQoN
CkFsc28gaG93IGNhbiB3ZSBhZGQgbWFjaGluZSBuYW1lIHRvIG1hbmlmZXN0IGZpbGUgd2hpY2gg
Y2FuIGJlIHVzZWQgdG8gdmVyaWZ5IGlmIHRoZSBpbWFnZSBpcyBiZWluZyBidWlsdCBmb3Igc2Ft
ZSB0YXJnZXQuDQoNCiAgICANCiAgICA+DQogICAgPg0KICAgID4NCiAgICA+IEluIG15IHByb3Bv
c2FsLCBJIHdpbGwgYWRkIGFub3RoZXIgcHJvcGVydHkgbmFtZWQgRmFjdG9yeUltYWdlSW5zdGFs
bCB3aGljaCBjYW4gYmUgc2V0IGFzIDEuIOKAnXRydWXigJ0gbWVhbnMgd2hvbGUgaW1hZ2Ugd291
bGQgYmUgaW5zdGFsbGVkIGluY2x1ZGluZyByd2ZzIGFuZCAyLiDigJxmYWxzZeKAnSBtZWFucyBl
dmVyeXRoaW5nIHdpbGwgYmUgaW5zdGFsbGVkIGV4Y2VwdCByd2ZzIHBhcnRpdGlvbi4gVGhpcyB3
YXksIG9sZCByd2ZzIHBhcnRpdGlvbiB3aWxsIGJlIHJldGFpbmVkLiBUaGlzIHByb3BlcnR5IHdp
bGwgYmUgdW5kZXIgIHh5ei5vcGVuYm1jX3Byb2plY3QuU29mdHdhcmUuQWN0aXZhdGlvbiAgaW50
ZXJmYWNlLg0KICAgID4NCiAgICA+DQogICAgPg0KICAgID4gUGxlYXNlIHByb3ZpZGUgeW91ciBv
cGluaW9uLiBJIHdpbGwgc2VuZCBwYXRjaCBzb29uLg0KICAgID4NCiAgICA+DQogICAgPg0KICAg
ID4gUmVnYXJkcw0KICAgID4NCiAgICA+IC1WaWpheQ0KICAgIA0KDQo=
