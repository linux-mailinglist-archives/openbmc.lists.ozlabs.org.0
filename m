Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E18047006
	for <lists+openbmc@lfdr.de>; Sat, 15 Jun 2019 14:46:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Qxzg6ybhzDrcV
	for <lists+openbmc@lfdr.de>; Sat, 15 Jun 2019 22:46:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=1069b662dd=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="cmyAcU02"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="UUEFLInX"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Qxyp389gzDrcK
 for <openbmc@lists.ozlabs.org>; Sat, 15 Jun 2019 22:45:20 +1000 (AEST)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5FChWGi025322; Sat, 15 Jun 2019 05:45:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=uq5tR2B884tjb9juVD6/TY0vzkg2lx6hi0cuctJWMEQ=;
 b=cmyAcU02k9Jp3DWCMczELZZGPT2yOD1i5ZvNpFlNI0CWGJM7ga3af+QXwAklAGirJPo7
 El7Pm7WaE50tVaekaMNN/vTDpNZZUnLzIGtX6vrfxa5UEE1gT3j5CCaUOWVk63Ne5tpU
 xK9nMfuGT2Q8Jj/jgKfCtx5litn/R/7eIMA= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2t4xdfg9ck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Sat, 15 Jun 2019 05:45:11 -0700
Received: from prn-hub02.TheFacebook.com (2620:10d:c081:35::126) by
 prn-hub03.TheFacebook.com (2620:10d:c081:35::127) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Sat, 15 Jun 2019 05:45:10 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Sat, 15 Jun 2019 05:45:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uq5tR2B884tjb9juVD6/TY0vzkg2lx6hi0cuctJWMEQ=;
 b=UUEFLInXYX/vRSpiWNmJHbId05CBWEsMkEComzR2XExKb5u61igWfbmpUnSijP0uDWMw5UUcSh3lWMUdbVkEI86T1M6PXhNP3no7kqJGUPcGNZ8CXh5QOvngDG9hxpCCq2FdzADquUF7sNpKHMdMfOoGR4aH5EONrLYHkNFoFu8=
Received: from MWHPR15MB1789.namprd15.prod.outlook.com (10.174.96.8) by
 MWHPR15MB1613.namprd15.prod.outlook.com (10.175.139.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Sat, 15 Jun 2019 12:44:54 +0000
Received: from MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::d1ad:4e40:2764:10e6]) by MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::d1ad:4e40:2764:10e6%5]) with mapi id 15.20.1987.010; Sat, 15 Jun 2019
 12:44:54 +0000
From: Sai Dasari <sdasari@fb.com>
To: Andrew Luke Nesbit <ullbeking@andrewnesbit.org>, Openbmc
 <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC@OCP Technology Day(s)
Thread-Topic: OpenBMC@OCP Technology Day(s)
Thread-Index: AQHVBRSeFNSC0pTGjkajhriKEqYcdqacYWwAgAB8roD//5KkAA==
Date: Sat, 15 Jun 2019 12:44:54 +0000
Message-ID: <227E4CDF-3202-43E4-A1AA-40C81B5667E0@fb.com>
References: <2B4BC3EA-95BD-41E6-98DB-8BA5408598B8@fb.com>
 <59F9D3A0-DDC7-491D-95EB-B745E065E857@fb.com>
 <6a3a3ba9-33cd-69ca-311c-f86bd25bd363@andrewnesbit.org>
In-Reply-To: <6a3a3ba9-33cd-69ca-311c-f86bd25bd363@andrewnesbit.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [115.110.136.4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0305ab0e-02aa-4b61-79e0-08d6f18f4431
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1613; 
x-ms-traffictypediagnostic: MWHPR15MB1613:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <MWHPR15MB16134AD8947A4058BA5F4939CEE90@MWHPR15MB1613.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0069246B74
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(136003)(366004)(39860400002)(376002)(346002)(13624006)(199004)(189003)(11346002)(2616005)(478600001)(14454004)(81156014)(68736007)(86362001)(316002)(66446008)(8676002)(99286004)(25786009)(110136005)(81166006)(229853002)(6436002)(6486002)(64756008)(66476007)(73956011)(91956017)(3846002)(8936002)(6116002)(66556008)(66946007)(36756003)(33656002)(6506007)(71190400001)(71200400001)(102836004)(2906002)(53546011)(186003)(6246003)(256004)(5660300002)(53936002)(486006)(6306002)(76116006)(7736002)(305945005)(6512007)(76176011)(66066001)(26005)(446003)(476003)(220923002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1613;
 H:MWHPR15MB1789.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sSHZZdm8+s4i6MZbN4vfo9cjZGzRwYbz9akMGW4LxII4t7uUezZhE1fePhY1YTHOF9ODnlA8z3yD/QUJK+oJCtvnvXwr/3cmyyGZ2bxBGsA78WUPbZPsxnp4TpSwbRNot1s3WbTinsS7gH8tXeA96Hhga95p4FLy3SGUJjqelCj9zC4zZg/MR59D50aPfeIyT9oxYketkwUNmMPuwG6L32H/ZB5EwUQJvQlG5+9XOAQXBBhglI6HUsbFt3zquAU1cdBy3McKNBkKgLI/qTAHFAHNOVN5HMbNRdOrzULzCGVrJ6s8uWGwaZG2rOI9sOmTcuMNYWaPInBeVzonTRw3TXef2YzO+2BqXSt5xMBj2TyxijDLEcFPFyqFnpBSOPyXOaYhXWZC9evaC0smeLsa0bykeLrC2Sc4yNLih2abS1Y=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ADBA69455D6B56498D1987D2BA0B6220@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0305ab0e-02aa-4b61-79e0-08d6f18f4431
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2019 12:44:54.5103 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sdasari@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1613
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-15_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906150118
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

SGkgQW5kcmV3LA0KDQpPQ1AgVGVjaG5vbG9neSBEYXlzIGFyZSBiZWluZyBob3N0ZWQvc3BvbnNv
cmVkIGJ5IHZhcmlvdXMgbWVtYmVyIGNvbXBhbmllcyB3b3JraW5nIGFjcm9zcyBnbG9iZSAoZS5n
LiBUYWl3YW4sIEluZGlhLCBDaGluYSwgSmFwYW4pLiBJZiB3ZSBmaW5kIGEgVUsgYmFzZWQgY29t
cGFueSB0byBzcG9uc29yIE9DUCBldmVudCwgd2UgY2FuIGNoZWNrIHdpdGggT0NQIGZvdW5kYXRp
b24gdG8gZ2V0IHRoaXMgcGxhbm5lZC9zY2hlZHVsZWQuIA0KDQpJbiBhZGRpdGlvbiwgT0NQIGhv
c3RzIHR3byBtYWpvciBzdW1taXRzOiBHbG9iYWwgU3VtbWl0IGluIFNhbkpvc2UvVVNBIChNYXJj
aCkgYW5kIFJlZ2lvbmFsIFN1bW1pdCBpbiBBbXN0ZXJkYW0vRXVyb3BlIChTZXB0ZW1iZXIpIGFu
ZCBJIHN0cm9uZ2x5IGVuY291cmFnZSBjb21wYW5pZXMgYXJvdW5kIFVLL0V1cm9wZSB0byBqb2lu
IHVwY29taW5nIFJlZ2lvbmFsIFN1bW1pdCBpbiBTZXB0ZW1iZXIgMjYtMjcgKGh0dHBzOi8vd3d3
Lm9wZW5jb21wdXRlLm9yZy9zdW1taXQvcmVnaW9uYWwtc3VtbWl0KS4gU29tZSBvZiB0aGUgT3Bl
bkJNQyBwcm9qZWN0IG1lbWJlcnMgcGFydGljaXBhdGVzIGluIHRoZXNlIGV2ZW50cyB0byBzaGFy
ZSBvbmdvaW5nIHdvcmsgd2l0aCBPQ1AgY29tbXVuaXR5IGFuZCBtZWV0dXAgZmFjZSB0byBmYWNl
IGR1cmluZyB0aGVzZSBldmVudHMuDQoNCldlIGFsc28gYXJlIGhhdmluZyBPcGVuQk1DIHByb2pl
Y3Qgc3BlY2lmaWMgbWVldHVwL2hhY2thdGhvbnMgd2hpY2ggYXJlIGhvc3RlZCBieSB2b2x1bnRl
ZXIgY29tcGFuaWVzIGUuZy4gR29vZ2xlLCBJbnRlbC4gVGhpcyB5ZWFyLCB3ZSBhcmUgY29sbGFi
b3JhdGluZyB3aXRoIE9wZW4gU3lzdGVtIEZpcm13YXJlIENvbmZlcmVuY2UgKGh0dHBzOi8vb3Nm
Yy5pby8pIGFuZCBhcmUgcGxhbm5pbmcgdG8gaGF2ZSBhIDItZGF5IG1lZXR1cCBmb2xsb3dlZCBi
eSAyLWRheSBoYWNrYXRob24gaW4gVVMuIEZZSSwgbGFzdCB5ZWFyIHRoaXMgT1NGQyBjb25mZXJl
bmNlIHdhcyBoZWxkIGluIEdlcm1hbnkvRXVyb3BlLiANCg0KQWxsIG9mIHRoZXNlIGV2ZW50cyBh
cmUgYWR2ZXJ0aXNlZCBvciBkaXNjdXNzZWQgb24gdGhpcyBtYWlsaW5nIGxpc3QgYW5kIHRoZXJl
IGlzIG5vIG90aGVyIHVub2ZmaWNpYWwgaW50ZXJlc3QgZ3JvdXAgZm9yIGZpbmRpbmcgc3VjaCBl
dmVudHMuDQoNClRoYW5rcywNClNhaS4NCg0KT24gNi8xNS8xOSwgNToxNiBBTSwgIkFuZHJldyBM
dWtlIE5lc2JpdCIgPHVsbGJla2luZ0BhbmRyZXduZXNiaXQub3JnPiB3cm90ZToNCg0KICAgIE9u
IDE1LzA2LzIwMTkgMTI6NTAsIFNhaSBEYXNhcmkgd3JvdGU6DQogICAgPiBJdCB3YXMgZ3JlYXQg
bWVldHVwIG9mIG91ciBwcm9qZWN0IHRvZGF5IGF0IE9DUCBUZWNobm9sb2d5IERheUBJbmRpYQ0K
ICAgID4gKFRoYW5rcyB0byBGbGlwa2FydCEpDQogICAgDQogICAgSSBoYXZlIGxvb2tlZCBpbnRv
IE9DUCBldmVudCBsb2NhdGlvbnMgb24gYSBjb3VwbGUgb2Ygb2NjYXNpb25zLiAgSXMNCiAgICB0
aGVyZSBtdWNoIG9mIGFuIE9DUCBwcmVzZW5jZSBpbiB0aGUgVUs/DQogICAgDQogICAgRWl0aGVy
IG9mZmljaWFsbHksIG9yIHNvbWUgc29ydCBvZiB1bm9mZmljaWFsIGludGVyZXN0IGdyb3VwPw0K
ICAgIEVzcGVjaWFsbHkgZm9yIHRoaW5ncyBsaWtlIE9wZW5CTUMgYW5kIE9wZW5QT1dFUi4NCiAg
ICANCiAgICBLaW5kIHJlZ2FyZHMsDQogICAgDQogICAgQW5kcmV3DQogICAgLS0gDQogICAgT3Bl
blBHUCBrZXk6IEVCMjggMDMzOCAyOEI3IDE5REEgREFCMCAgQjE5MyBEMjFEIDk5NkUgODgzQiBF
NUI5DQogICAgDQoNCg==
