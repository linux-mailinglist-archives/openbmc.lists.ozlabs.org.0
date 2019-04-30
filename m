Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D4410222
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 00:01:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44twTm1PD3zDqTF
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 08:01:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=0023ab73f8=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="prRkYjxy"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="U89aEDNB"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44twSj6vdVzDqSN
 for <openbmc@lists.ozlabs.org>; Wed,  1 May 2019 08:00:35 +1000 (AEST)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3ULx8OX019697; Tue, 30 Apr 2019 15:00:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=7lr4DBWa4NzW3AkfcMQuoXRAd5vfBhtlWda4qGwFb1c=;
 b=prRkYjxythdJFjtD4HB/LitdYkBIkvCFALNz9+iusCauzBb8F6aer3TjK/f9xJLVXiAb
 YcAYGvuY6aEcqSpWd3A6nYSlyCZWLoIJ9yb4xL507KYOytGX4MqkeyeHy4I7kK2ZtOds
 LOMf1OWTbwfXx6AleFLNYXGgiFvgKGCGdWk= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2s6xj301fc-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 30 Apr 2019 15:00:31 -0700
Received: from prn-hub04.TheFacebook.com (2620:10d:c081:35::128) by
 prn-hub02.TheFacebook.com (2620:10d:c081:35::126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 30 Apr 2019 15:00:30 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Tue, 30 Apr 2019 15:00:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7lr4DBWa4NzW3AkfcMQuoXRAd5vfBhtlWda4qGwFb1c=;
 b=U89aEDNB0bxDEIaXj3totJH7QIXMSMswVbvsC0hiwszP3CiVXxlGbqeoS1bDd0yE1q03B9sushIr4KsLAtm38eAuh9hu+pxXoxGtBTEmcXmivR+Lsw6aeJduQdfpYSJuxlMOadwcOCU2eJ5Hld9QJ9qkIGSZh8/4J679Q9g/L5A=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1254.namprd15.prod.outlook.com (10.172.180.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Tue, 30 Apr 2019 22:00:29 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::1039:c5b1:f43e:14e9]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::1039:c5b1:f43e:14e9%3]) with mapi id 15.20.1835.010; Tue, 30 Apr 2019
 22:00:28 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Ed Tanous <ed.tanous@intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Phosphor pid control
Thread-Topic: Phosphor pid control
Thread-Index: AQHU/4KY0BYzgrKEY0CYtw90dRuDdKZVBrOA//+Nf4CAAHrEgP//kDKAgAAUEwCAAIyqgP//i/sA
Date: Tue, 30 Apr 2019 22:00:28 +0000
Message-ID: <B337527D-440D-4C88-A0BA-D8ABAE6EBCEE@fb.com>
References: <303477D5-BB35-4FC8-98FB-9C59A188064C@fb.com>
 <CAO=notzKTpC-6zAGODatyDJL5p1Y3+mW5-LbxRh7qtg1hNmufQ@mail.gmail.com>
 <AF2ED931-7FB2-4AFE-AFCE-D0AEC3646A44@fb.com>
 <CAO=notyhSG=E6kwv63ODRQQz7SD3rindmtAYxa=OuFvSv=mELg@mail.gmail.com>
 <71BFF33B-20DA-428A-979F-A896011142AE@fb.com>
 <59D3A2C1-2E74-4055-B33A-6FF746E62FD2@fb.com>
 <a388c5ac-9384-9c03-74e4-9cb0c8bcb4b6@intel.com>
In-Reply-To: <a388c5ac-9384-9c03-74e4-9cb0c8bcb4b6@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::c9a8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 87d071ac-38ad-4ab2-33df-08d6cdb74202
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:CY4PR15MB1254; 
x-ms-traffictypediagnostic: CY4PR15MB1254:
x-microsoft-antispam-prvs: <CY4PR15MB12549F707152001A63C05CCBDD3A0@CY4PR15MB1254.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(39860400002)(366004)(396003)(136003)(376002)(189003)(199004)(316002)(33656002)(14444005)(71200400001)(256004)(25786009)(110136005)(71190400001)(14454004)(2501003)(11346002)(66556008)(3480700005)(478600001)(2616005)(66476007)(73956011)(46003)(76116006)(91956017)(64756008)(66946007)(486006)(446003)(86362001)(476003)(82746002)(66446008)(99286004)(68736007)(36756003)(76176011)(6486002)(7116003)(5660300002)(2906002)(6512007)(4744005)(186003)(83716004)(7736002)(8676002)(102836004)(305945005)(6436002)(229853002)(53546011)(6116002)(6506007)(8936002)(81166006)(81156014)(6246003)(53936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1254;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Wk9TIRmNsQNvFhHQFFEd87p7hRUIHXgCIYfYweaatY14he6t11h8DkiPgT5cP6lXFf9fxJ5Km66KCN5cQx8L+80ljxKnztr8KRKzDxewWcpbrqs1C2zUv79jOuMomNdudZLYNYb4UKpIKhBcdAC2TR7YrRa3UXwuTc2uBE9NuatgUSLaiktp31XoZmM4bcFTgzpgmWgwMwffneJOEt3qAunywc5sa2c2iT3wzQCNIKHXSLrN47hzr9opDU3ub4ZxJVvISqv1CRBGJZgU1jzUQduzGy49UTAHpLrYeR3xzv28/VDobB8nqt0q3h/lgFGiutQj59sAnr02zmSA260LOiA2H4lCk5ZEoFl6toXdFKNxqnRxOH/TDajMbaDRQ8RcTstqrmG92ZBpKAz5vXzfZWY4IHwVTOXEtni23qFVTMM=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D6EEB37677D63345A2EAA5A83A2C7C50@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 87d071ac-38ad-4ab2-33df-08d6cdb74202
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 22:00:28.7932 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1254
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-30_12:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
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

T24gNC8zMC8xOSwgMjo1NiBQTSwgIkVkIFRhbm91cyIgPGVkLnRhbm91c0BpbnRlbC5jb20+IHdy
b3RlOg0KDQogICAgT24gNC8zMC8xOSAxOjMyIFBNLCBWaWpheSBLaGVta2Egd3JvdGU6DQogICAg
PiB0ZXJtaW5hdGUgY2FsbGVkIGFmdGVyIHRocm93aW5nIGFuIGluc3RhbmNlIG9mICdzdGQ6OnJ1
bnRpbWVfZXJyb3InDQogICAgPiAgIHdoYXQoKTogIEJhaWxpbmcgZHVyaW5nIGxvYWQsIG1pc3Np
bmcgWm9uZSBDb25maWd1cmF0aW9uDQogICAgDQogICAgRGlkIHlvdSBjb25maWd1cmUgYXQgbGVh
c3Qgb25lIGZhbiB6b25lLCBhbmQgZG9lcyB0aGUgbmFtZSBvZiB0aGUgem9uZQ0KICAgIG1hdGNo
IHdoYXQgeW91IGhhdmUgaW4geW91ciBQSUQgY29uZmlndXJhdGlvbj8NClllcyBJIGRpZCBjb25m
aWd1cmUgaXQsIHRoYXQncyBob3cgSSBjb3VsZCBnZXQgcmlkIG9mIHByZXZpb3VzIGVycm9yLiBJ
IGhhdmUgY2hhbmdlZCBab25lIG5hbWVzIHRvIExlZnQgZnJvbSBQaWQgMSBhcyBwZXIgaW50ZWwg
ZW50aXR5IG1hbmFnZXIgY29uZmlndXJhdGlvbi4gSSBhbSBzdGlsbCBkZWJ1Z2dpbmcsIEkgZ3Vl
c3MgSSBhbSBtaXNzaW5nIHNvbWUgdHJpdmlhbCBjb25maWd1cmF0aW9ucy4NCg0KQWxzbyBvbmNl
IHRoaXMgaXMgZml4ZWQsIGhvdyBkbyBJIHRlc3QgdGhpcyBpZiBmYW4gY29udHJvbGxlciBpcyBr
aWNraW5nIGJhc2VkIG9uIHRlbXBlcmF0dXJlIGNoYW5nZS4NCg0KUmVnYXJkcw0KLVZpamF5ICAg
IA0KDQo=
