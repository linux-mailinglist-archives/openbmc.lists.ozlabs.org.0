Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4451D94B8F
	for <lists+openbmc@lfdr.de>; Mon, 19 Aug 2019 19:24:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46C14W4hr2zDqcK
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 03:24:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=3134769992=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="KEVKclPG"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="Hg9nCbnq"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46C13s53PbzDqYM
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 03:23:32 +1000 (AEST)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7JHJm6C015871; Mon, 19 Aug 2019 10:23:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=eLrEgHO9XjU9fL6iOeX2abSvaqNueR9SaVdrQWpK6KI=;
 b=KEVKclPGGDXrQP8r+WAORZo2Fvddhi66nhQ8vuwTvfX8WHxQz2cosi2SjyK63dbxLIW5
 kaBx+PgC68bdOochbrJo+mAOzUWhIwj75FYDM7fy6FnJeFPl5CsgwXLzEEh5ulGt+h3e
 bqYcei2hsmUF6KFvsTeSAHvhb/SdN6hOJ+4= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2ufwbmgtpw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 19 Aug 2019 10:23:28 -0700
Received: from ash-exhub204.TheFacebook.com (2620:10d:c0a8:83::4) by
 ash-exhub104.TheFacebook.com (2620:10d:c0a8:82::d) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 19 Aug 2019 10:23:27 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.100) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 19 Aug 2019 10:23:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K8p8OpJuuFB2N4DXJh5rQPdCcFbzurQ3iHZY9/fFxjWThubDtS4kGL6t51s55n33WmCdCKRQ3imG3ZdY8C5wwqdgv74zowTWSgc1XSGBICP/p/C0f0Hn5Ho1Qja5/al2/rlnQPVpDDiVLi2yjym9HBTOTsaTLfJJH9/x2qAI25MiL9j0MoJukuZ3RE1xO9I7sXdjrU7OX/yAt0igbr+HaxIjXW/ZpGUusrSc8wCpad+MonyjLAXy2rNA5VA4Tu83Jg/v3NCQ1uMP0w6kP0KM0TNDkJwSYLLndY6/yd7FuSyN/CrVtykaE/FlRGs0gKIkljSBT6qEkeQ29o9+PN/qxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eLrEgHO9XjU9fL6iOeX2abSvaqNueR9SaVdrQWpK6KI=;
 b=jXxcnxTP275EoJPj5w4fdiAZwJBCwj4b1CXHa5ZXw4tdrkmTUwwMESvDc/EzT5+x4HcajS/j4Gx2zWWTdvQu3HPNONFi5d7puK5fB4r+lRFjIefriFSNmFWSHiLwzbXYDcdVOck+4y/Bom40e2CNjoqhZIhuI8/JzLQaYw9RvsEscjnjRGDCpcAv3ZKUAlig65wxekXORKoOn+aJg3dn2UL7qcY2nfYYE3hEgakpT/Qfzg3Nmgbq3jXkG+5BwBuFAOUrEpaYr6CH5NBfF1lZbtggK6fYVBfCF20ZoK6TKo2588syQGLEus6CTA05tllDpQTNwcmxROs4hGL/z0ek8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eLrEgHO9XjU9fL6iOeX2abSvaqNueR9SaVdrQWpK6KI=;
 b=Hg9nCbnqdG4NpBBMhuM0GXUn99W0doJeux0VcQYUK01kerQcG0tB8rvh85RanEZ3ZC+vCa1ZRR88dlfI1PaDx2K/tJ/PELSBXCQ17O3fJYIaGXS2J0z0VZ9das/vRRBeZTOxlBVIdTZEtlOCnvDb00Ro234EAgDVUScd+qRFFJI=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1894.namprd15.prod.outlook.com (10.174.54.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 19 Aug 2019 17:23:25 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::8c93:f913:124:8dd0]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::8c93:f913:124:8dd0%8]) with mapi id 15.20.2178.018; Mon, 19 Aug 2019
 17:23:25 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Andrew Geissler <geissonator@gmail.com>, Joseph Reynolds
 <jrey@linux.ibm.com>
Subject: Re: Policy on Tools Posting
Thread-Topic: Policy on Tools Posting
Thread-Index: AQHVU7RiWQHA4bRjuEKw0KCleEnMmqb805UAgAFdxgCABBd/AA==
Date: Mon, 19 Aug 2019 17:23:25 +0000
Message-ID: <A19C8F35-A512-45CF-9986-0F97FCE7B81D@fb.com>
References: <mailman.545.1565898074.372.openbmc@lists.ozlabs.org>
 <A586CD10-BC88-4316-B900-E3F0874B0910@fb.com>
 <c20c680c-45af-7b5f-129a-00b053516ed5@linux.ibm.com>
 <CALLMt=quLfszM2bu-tN2GaPaz9YZr3h2HOG0UTGgdV2Bb9xrTQ@mail.gmail.com>
In-Reply-To: <CALLMt=quLfszM2bu-tN2GaPaz9YZr3h2HOG0UTGgdV2Bb9xrTQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::1:2b1d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: deb6becc-2791-47e1-ca92-08d724c9f170
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CY4PR15MB1894; 
x-ms-traffictypediagnostic: CY4PR15MB1894:
x-ms-exchange-purlcount: 3
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR15MB1894CE5B25E0917AC22721FFDDA80@CY4PR15MB1894.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(366004)(376002)(136003)(396003)(39860400002)(51874003)(27574002)(189003)(199004)(81156014)(6506007)(2616005)(486006)(53546011)(8936002)(102836004)(11346002)(186003)(86362001)(305945005)(446003)(476003)(46003)(6512007)(33656002)(99286004)(91956017)(3480700005)(5660300002)(6306002)(7736002)(6436002)(229853002)(6246003)(53936002)(14454004)(4326008)(478600001)(966005)(36756003)(76176011)(110136005)(14444005)(71190400001)(71200400001)(256004)(316002)(54906003)(25786009)(8676002)(64756008)(66556008)(66476007)(76116006)(66446008)(66946007)(2906002)(6486002)(81166006)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1894;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0XaWMcPxcZdDIdn3ip9D+7CL0x7OaAnZdAl6czlMZd6Vof40uPaft6gfBbBwj6CSw7PiGdPYzTANaupU10/jwoiEgxRcWWw58pNhVIhywFVCA5LeYIiLSLCLZXdmV97EtyMkJn1dByhtEHge5CUH1u90Dj+jMJlve8ZVENkOHgciEJNurGnsIFsL9GHK3SdDQa504s9LyRot/FdYt7Jlbmhg9+85pJcuLV7xxGXL6ArYCtKchss+HbQTKREk34UAbUYdFY/8hVn2uCyQsFrjMl9KUOr2UkCeiS2mrfZIvf2exbbm9/4aZIh4YByrJZ4VDEzSeBRZmyaR6OpgheY0w2vrp7FjfeuQNFBHTYDOAY0jvhs9M6eL6y/mGSabnRufJrVHsd8f4VgeiJPU38Hej5/TaDorMFu6cep/WlyaFT4=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C4E2D1EE6CE804DADAB6B3A76390400@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: deb6becc-2791-47e1-ca92-08d724c9f170
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 17:23:25.2372 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 957AXp0Rt3nvXxr+Xj9OxSflqOJCX3C3aEy7j+jwmtTLLe8QfeBSXFNSvuZnTiiGq9qxdTKF2ErcJxRBzkJk9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1894
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-19_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908190184
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Wilfred Smith <wilfredsmith@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDgvMTYvMTksIDEyOjU4IFBNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgQW5kcmV3
IEdlaXNzbGVyIiA8b3BlbmJtYy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxh
YnMub3JnIG9uIGJlaGFsZiBvZiBnZWlzc29uYXRvckBnbWFpbC5jb20+IHdyb3RlOg0KDQogICAg
T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgNjowMyBQTSBKb3NlcGggUmV5bm9sZHMgPGpyZXlAbGlu
dXguaWJtLmNvbT4gd3JvdGU6DQogICAgPg0KICAgID4NCiAgICA+IE9uIDgvMTUvMTkgNDo1NyBQ
TSwgV2lsZnJlZCBTbWl0aCB3cm90ZToNCiAgICA+ID4gTXkgbWFuYWdlciAoU2FpKSBpcyBhc2tp
bmcgd2hldGhlciB0aGVyZSBpcyBwcmVjZWRlbmNlIGZvciBoYXZpbmcgdXRpbGl0aWVzIHBvc3Rl
ZCBvdXRzaWRlIHRoZSBPcGVuQk1DIHJlcG9zaXRvcnkuIERvIHdlIHdhbnQgMTAwIE9wZW5CTUMg
dG9vbHMgcmVwb3NpdG9yaWVzLCBlYWNoIG1hbmFnZWQgZGlmZmVyZW50bHkgb3IgMSBoYXJtb25p
emVkIHJlcG9zaXRvcnk/DQogICAgPiA+DQogICAgPiA+IFNlcGFyYXRlbHksIGlzIHRoZXJlIGFu
eSBlZmZvcnQgdG8gY3JlYXRlIGEg4oCcY29tbW9uIGNvcmXigJ0gZm9yIE9wZW5CTUMgc3VjaCB0
aGF0IGFuIGVmZm9ydCBha2luIHRvIFBPU0lYIG9yIHRoZSBTaW5nbGUgVU5JWCBTcGVjaWZpY2F0
aW9uIGlzbuKAmXQgbmVlZGVkIHRlbiB5ZWFycyBmcm9tIG5vdz8gV2l0aG91dCBzdGFuZGFyZCBB
UEkgKG9yIGF0IGxlYXN0IGFic3RyYWN0ZWQgdG9vbHMpIGZvciB0aGluZ3MgbGlrZSB3aGVyZSBG
UlUgaW5mb3JtYXRpb24gaXMgbG9jYXRlZCBvciBzZW5kaW5nIElQTUIgY29tbWFuZHMsIGlzbuKA
mXQgdGhlIG1hcmtldCBmb3IgaW5ub3ZhdGl2ZSBzb2Z0d2FyZSBzdGlmbGVkIChBbmRyb2lkIHNv
ZnR3YXJlIG1hcmtldCB2cyBpT1MsIG9yIGV2ZW4gTGludXggdnMgV2luZG93cyk/DQogICAgPg0K
ICAgID4gTXkgdmlldyBpcyB0byBmb2N1cyBvbiBlbmhhbmNpbmcgdGhlIFJlZGZpc2ggZnVuY3Rp
b25zIHNvIHRoYXQgdXNlcnMgb2YNCiAgICA+IE9wZW5CTUMgc3lzdGVtcyBjYW4gZG8gZXZlcnl0
aGluZyB0aGV5IG5lZWQgdG8gd2l0aG91dCBoYXZpbmcgdXNlIFNlY3VyZQ0KICAgID4gU2hlbGwg
KHNzaCkgb3IgYW55IG9mIHRoZSBjb21tYW5kIGxpbmUgdXRpbGl0aWVzIHNzaCBjYW4gYWNjZXNz
IChzdWNoIGFzDQogICAgPiBzeXN0ZW1jdGwsIGJ1c2N0bCwgb3Igb2JtY3Rvb2wpLiAgU2VlIHNv
bWUgcHVibGljbHktcmVhZGFibGUgSUJNDQogICAgPiBkaXNjdXNzaW9uIG9uIHRoaXMgdG9waWMg
aGVyZTogaHR0cHM6Ly9naXRodWIuY29tL2libS1vcGVuYm1jL2Rldi9pc3N1ZXMvNjEyDQogICAg
DQogICAgT25jZSBhIHN5c3RlbSBoYXMgc2hpcHBlZCB0byBhIGN1c3RvbWVyLCBlbnN1cmluZyA5
OSUgb2Ygd2hhdCB0aGV5IG5lZWQNCiAgICB0byB1c2UgdGhhdCBzZXJ2ZXIgaXMgYXZhaWxhYmxl
IHZpYSBSZWRmaXNoIGRlZmluaXRlbHkgbWFrZXMgc2Vuc2UgdG8gbWUuDQogICAgDQogICAgPiBN
ZWFud2hpbGUsIHdoZW4gdXMgZGV2ZWxvcGVycyBuZWVkIHRvIGFjY2VzcyB0aGUgQk1DIHZpYSBz
c2gsIHdlIGFyZQ0KICAgID4gaGFwcHkgdG8gdXNlIHRoZSBleGlzdGluZyBjb21tYW5kIGxpbmUg
dXRpbGl0aWVzIGFuZCBkb24ndCBzZWUgdGhlIG5lZWQNCiAgICA+IGZvciBhbnkgbW9yZS4NCiAg
ICANCiAgICBIbW0sIEkgZG9uJ3QgdGhpbmsgSSBhZ3JlZSB3aXRoIHRoaXMuIEkgdGhpbmsgb2Jt
Y3V0aWwgaGFzIHByb3ZpZGVkIGENCiAgICBsb3Qgb2YgdXNlZnVsDQogICAgYWJzdHJhY3Rpb24g
Zm9yIGRldmVsb3BlcnMgYW5kIHVzZXJzIG9mIE9wZW5CTUMgKGxpa2Ugb3VyIGxhYiB0ZWFtKS4N
CiAgICBObyBvbmUgcmVhbGx5IHdhbnRzIHRvIHJlbWVtYmVyIHNvbWUgb2YgdGhlIGxvbmcgY3Vt
YmVyc29tZSBjb21tYW5kcw0KICAgIGRvbmUgYnkgb2JtY3V0aWwsIG5vciBkbyB0aGV5IHdhbnQg
dG8gZGVhbCB3aXRoIHNpdHVhdGlvbnMgd2hlcmUgd2UgY2hhbmdlDQogICAgdGhlIHVuZGVybHlp
bmcgRC1idXMgQVBJIGluIGEgY2VydGFpbiB2ZXJzaW9uIG9mIGZpcm13YXJlLiBvYm1jdXRpbCBw
cm92aWRlcyBhDQogICAgbmljZSBhYnN0cmFjdGlvbiB0byB0aGF0IGFuZCBJIGNvdWxkIHNlZSB0
b29scyB0aGF0IHByb3ZpZGUgYWJzdHJhY3Rpb25zIGZvcg0KICAgIGxvb2tpbmcgYXQgZXJyb3Ig
bG9ncyBvciBsaXN0aW5nIHN5c3RlbSBpbnZlbnRvcnkgY291bGQgYWxzbyBiZSB1c2VmdWwuIEkg
ZG9uJ3QNCiAgICB0aGluayB0aGVzZSB0b29scyBzaG91bGQgZXZlciBiZSB0aGluZ3MgcGVvcGxl
IHB1cmNoYXNpbmcgT3BlbkJNQyBiYXNlZA0KICAgIHByb2R1Y3RzIGNvdW50IG9uIHVzaW5nIChi
dXQgdGhleSBjb3VsZCBzdGlsbCBiZSB0aGVyZSBpZiB0aGV5IHdhbnRlZCkuDQoNCkkgYWdyZWUg
d2l0aCBBbmRyZXcgaGVyZS4gVGhlcmUgYXJlIG1hbnkgaW5zdGFuY2VzIHdoZXJlIHNpbXBsZSBj
b21tYW5kbGluZSANCnV0aWxpdHkgaGVscHMgaW4gZGVidWdnaW5nIGFuZCBxdWlja2x5IHRlc3Rp
bmcgcmF0aGVyIHRoYW4gc2VhcmNoaW5nIHRocm91Z2ggYWxsIGxvbmcgDQpjb21tYW5kcy4NCg0K
SSB3b3VsZCBwcmVmZXIgdG8gaGF2ZSB0aGVzZSBpcG1iLCBmcnUgYW5kIHNlbnNvciB1dGlscyB0
byBiZSBob3N0ZWQgaW4gdGhlIHJlcG8gDQpXaGVyZSBvYm1jdXRpbCBhcmUuIEkgY291bGRuJ3Qg
ZmluZCByZXBvIGZvciBvYm1jdXRpbC4NCiAgICANCiAgICA+DQogICAgPiBJIHdvdWxkIHByZWZl
ciB0byBzZWUgb3VyIGVuZXJneSBmb2N1c2VkIG9uIGVuaGFuY2VtZW50cyB0byBSZWRmaXNoIGFu
ZA0KICAgID4gb24gdXRpbGl0aWVzIHdoaWNoIHVzZSB0aGUgUmVkZmlzaCBBUElzIChha2luIHRv
IHJlZGZpc2h0b29sKS4NCiAgICA+DQogICAgPiAtIEpvc2VwaA0KICAgID4NCiAgICA+ID4NCiAg
ICA+ID4gV2lsZnJlZA0KICAgID4gPg0KICAgID4gPj4gT24gQXVnIDE1LCAyMDE5LCBhdCAxMjo0
MSBQTSwgb3BlbmJtYy1yZXF1ZXN0QGxpc3RzLm96bGFicy5vcmcgd3JvdGU6DQogICAgPiA+Pg0K
ICAgID4gPj4gU2VuZCBvcGVuYm1jIG1haWxpbmcgbGlzdCBzdWJtaXNzaW9ucyB0bw0KICAgID4g
Pj4gICAgICBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNCiAgICA+ID4+DQogICAgPiA+PiBUbyBz
dWJzY3JpYmUgb3IgdW5zdWJzY3JpYmUgdmlhIHRoZSBXb3JsZCBXaWRlIFdlYiwgdmlzaXQNCiAg
ICA+ID4+ICAgICAgaHR0cHM6Ly91cmxkZWZlbnNlLnByb29mcG9pbnQuY29tL3YyL3VybD91PWh0
dHBzLTNBX19saXN0cy5vemxhYnMub3JnX2xpc3RpbmZvX29wZW5ibWMmZD1Ed0lDQWcmYz01VkQw
UlR0TmxUaDN5Y2Q0MWIzTVV3JnI9LWVrdFQtdEQ5emYycmZVaXNFNjNScWlEYWdHeWhHZXkyaGJF
R2EtNDdrYyZtPUNzWElxRExDXzlaWXJWU3dObGxjSG83R2pxQUc5bWoyUzZOeW1QUVRibGsmcz1f
UnJZbW1NZi02WFU2cjVMc1hzV0xqOEcwS19xYVd5bzZLMnlEVTVKR3U4JmU9DQogICAgPiA+PiBv
ciwgdmlhIGVtYWlsLCBzZW5kIGEgbWVzc2FnZSB3aXRoIHN1YmplY3Qgb3IgYm9keSAnaGVscCcg
dG8NCiAgICA+ID4+ICAgICAgb3BlbmJtYy1yZXF1ZXN0QGxpc3RzLm96bGFicy5vcmcNCiAgICA+
ID4+DQogICAgPiA+PiBZb3UgY2FuIHJlYWNoIHRoZSBwZXJzb24gbWFuYWdpbmcgdGhlIGxpc3Qg
YXQNCiAgICA+ID4+ICAgICAgb3BlbmJtYy1vd25lckBsaXN0cy5vemxhYnMub3JnDQogICAgPiA+
Pg0KICAgID4gPj4gV2hlbiByZXBseWluZywgcGxlYXNlIGVkaXQgeW91ciBTdWJqZWN0IGxpbmUg
c28gaXQgaXMgbW9yZSBzcGVjaWZpYw0KICAgID4gPj4gdGhhbiAiUmU6IENvbnRlbnRzIG9mIG9w
ZW5ibWMgZGlnZXN0Li4uIg0KICAgID4gPj4NCiAgICA+ID4+DQogICAgPiA+PiBUb2RheSdzIFRv
cGljczoNCiAgICA+ID4+DQogICAgPiA+PiAgICAxLiBSZTogUG9saWN5IG9uIFRvb2xzIFBvc3Rp
bmcgKFZpamF5IEtoZW1rYSkNCiAgICA+ID4+ICAgIDIuIFtQQVRDSCBkZXYtNS4yXSBmc2k6IHNj
b206IERvbid0IGFib3J0IG9wZXJhdGlvbnMgZm9yIG1pbm9yDQogICAgPiA+PiAgICAgICBlcnJv
cnMgKEVkZGllIEphbWVzKQ0KICAgID4gPj4gICAgMy4gUmU6IFtQQVRDSF0gbmV0L25jc2k6IEVu
c3VyZSAzMi1iaXQgYm91bmRhcnkgZm9yIGRhdGEgY2tzdW0NCiAgICA+ID4+ICAgICAgIChEYXZp
ZCBNaWxsZXIpDQogICAgPiA+PiAgICA0LiBSZTogW1BBVENIIHY0IDIvMl0gaHdtb246IHBtYnVz
OiBBZGQgSW5zcHVyIFBvd2VyIFN5c3RlbQ0KICAgID4gPj4gICAgICAgcG93ZXIgc3VwcGx5IGRy
aXZlciAoR3VlbnRlciBSb2VjaykNCiAgICA+ID4+DQogICAgPiA+Pg0KICAgID4gPj4gLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQ0KICAgID4gPj4NCiAgICA+ID4+IE1lc3NhZ2U6IDENCiAgICA+ID4+IERhdGU6IFRo
dSwgMTUgQXVnIDIwMTkgMTk6MDc6MjYgKzAwMDANCiAgICA+ID4+IEZyb206IFZpamF5IEtoZW1r
YSA8dmlqYXlraGVta2FAZmIuY29tPg0KICAgID4gPj4gVG86IEFuZHJldyBHZWlzc2xlciA8Z2Vp
c3NvbmF0b3JAZ21haWwuY29tPiwgV2lsZnJlZCBTbWl0aA0KICAgID4gPj4gICAgICA8d2lsZnJl
ZHNtaXRoQGZiLmNvbT4NCiAgICA+ID4+IENjOiAib3BlbmJtY0BsaXN0cy5vemxhYnMub3JnIiA8
b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0KICAgID4gPj4gU3ViamVjdDogUmU6IFBvbGljeSBv
biBUb29scyBQb3N0aW5nDQogICAgPiA+PiBNZXNzYWdlLUlEOiA8Njg5MjlCNzYtODgyNi00REFE
LUEyOUUtREY3QTExOUQwMEM1QGZiLmNvbT4NCiAgICA+ID4+IENvbnRlbnQtVHlwZTogdGV4dC9w
bGFpbjsgY2hhcnNldD0idXRmLTgiDQogICAgPiA+Pg0KICAgID4gPj4NCiAgICA+ID4+DQogICAg
PiA+PiA/T24gOC8xNS8xOSwgNTo1OSBBTSwgIm9wZW5ibWMgb24gYmVoYWxmIG9mIEFuZHJldyBH
ZWlzc2xlciIgPG9wZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMub3psYWJz
Lm9yZyBvbiBiZWhhbGYgb2YgZ2Vpc3NvbmF0b3JAZ21haWwuY29tPiB3cm90ZToNCiAgICA+ID4+
DQogICAgPiA+PiAgICAgT24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgNzo1OCBQTSBXaWxmcmVkIFNt
aXRoIDx3aWxmcmVkc21pdGhAZmIuY29tPiB3cm90ZToNCiAgICA+ID4+Pg0KICAgID4gPj4+IDEu
IEFyZSB0aGVyZSBndWlkZWxpbmVzL3Byb2NlZHVyZXMgc3BlY2lmaWMgdG8gc3VibWl0dGluZyBj
b21tYW5kIGxpbmUgdG9vbHMgYW5kIHV0aWxpdGllcz8gSSBoYXZlIGhlYXJkIHRoYXQgdGhlcmUg
bWF5IGJlIGEgcmVwb3NpdG9yeSBhbmQvb3IgcGF0aCBkZWRpY2F0ZWQgdG8gQ0xJIHRvb2xzLg0K
ICAgID4gPj4gICAgIFRoZSBjb21tdW5pdHkgaGFzIGRlZmluaXRlbHkgdGVuZGVkIHRvIGxpbWl0
IHdyYXBwZXIgdG9vbHMgd2l0aGluDQogICAgPiA+PiAgICAgT3BlbkJNQy4gV2UgaGFkIGEgZGlz
Y3Vzc2lvbiBhIHdoaWxlIGJhY2sgdGhhdCB3ZSdyZSBvcGVuIHRvIHNvbWUgYnV0DQogICAgPiA+
PiAgICAgdGhlIEFQSSdzIHRvIHRoZW0gcmVhbGx5IG5lZWQgdG8gYmUgdGhvdWdodCBvdXQgYW5k
IHJldmlld2VkIGJlY2F1c2UNCiAgICA+ID4+ICAgICBjb21tYW5kIGxpbmUgdG9vbHMgYmVjb21l
IGN1c3RvbWVyIEFQSSdzIChpLmUuIHBlb3BsZSBzdGFydCB3cml0aW5nDQogICAgPiA+PiAgICAg
c2NyaXB0cyBvbiB0b3Agb2YgdGhlc2UgdG9vbHMgdGhhdCB0aGVuIGJlY29tZSBrZXkgdG8gdGhl
DQogICAgPiA+PiAgICAgbWFudWZhY3R1cmluZyBwcm9jZXNzIG9yIHNvbWUgb3RoZXIgY3JpdGlj
YWwgYXJlYSkuDQogICAgPiA+Pg0KICAgID4gPj4gICAgIEFueXRoaW5nIHRoYXQgZ29lcyBpbnRv
IE9wZW5CTUMgbmVlZHMgdG8gc3VwcG9ydCBPcGVuQk1DIGludGVyZmFjZXMuDQogICAgPiA+PiAg
ICAgRm9yIGV4YW1wbGUsIEknbSBub3QgZmFtaWxpYXIgd2l0aCBmcnVpZC11dGlsJ3MgRC1idXMg
c2VydmljZQ0KICAgID4gPj4gICAgIHh5ei5vcGVuYm1jX3Byb2plY3QuRnJ1RGV2aWNlLiBBICJi
dXNjdGwgdHJlZQ0KICAgID4gPj4gICAgIHh5ei5vcGVuYm1jX3Byb2plY3QuSW52ZW50b3J5Lk1h
bmFnZXIgfCBjYXQiIHNob3dzIHRoZSBpbnZlbnRvcnkgaXRlbXMNCiAgICA+ID4+ICAgICBvbiBP
cGVuQk1DLg0KICAgID4gPj4NCiAgICA+ID4+ICAgICBPbmUgaXNzdWUgd2UgaGF2ZSB3aXRoaW4g
T3BlbkJNQyBpcyB0aGVyZSBtYXkgYmUgZGlmZmVyZW50DQogICAgPiA+PiAgICAgaW1wbGVtZW50
YXRpb25zIG9mIHRoZSBELWJ1cyBBUEkncyBmb3IgYSBnaXZlbiBhcmVhLiBGb3IgZXhhbXBsZSwN
CiAgICA+ID4+ICAgICBJbnZlbnRvcnkgaGFzIGRpZmZlcmVudCBpbXBsZW1lbnRhdGlvbnMgc28g
SSdtIG5vdCBzdXJlIHdoaWNoIHJlcG8NCiAgICA+ID4+ICAgICB3b3VsZCBiZXN0IGZpdCB5b3Vy
IHRvb2wuIFRoYXQgdHlwZSBvZiBpc3N1ZSBsZWFkcyBtZSB0byB3b25kZXIgaWYgd2UNCiAgICA+
ID4+ICAgICBzaG91bGQgcHV0IHRoZSB0b29scyB3aXRoIHRoZSBpbnRlcmZhY2UgZGVmaW5pdGlv
bnMgaW4NCiAgICA+ID4+ICAgICBvcGVuYm1jL3Bob3NwaG9yLWRidXMtaW50ZXJmYWNlcz8gT3Ig
bWF5YmUgYSBzZXBhcmF0ZSBwaG9zcGhvci10b29scw0KICAgID4gPj4gICAgIHJlcG8gd291bGQg
YmUgbW9yZSBsb2dpY2FsIGZvciB0aGVzZS4NCiAgICA+ID4+IEFuZHJldywgSSBsaWtlIHRoZSBp
ZGVhIG9mIGhhdmluZyBwaG9zcGhvci10b29scyB3aGljaCBjYW4gYmUgYSBwbGFjZWhvbGRlcg0K
ICAgID4gPj4gZm9yIGFueSBjb21tYW5kbGluZSB0b29scyBhbmQgY2FuIGdyb3cgYXMgcGVyIHJl
cXVpcmVtZW50LiBDdXJyZW50bHkNCiAgICA+ID4+IGl0IGNhbiBzdGFydCB3aXRoIDMgcHJvcG9z
ZWQgdG9vbHMuDQogICAgPiA+Pg0KICAgID4gPj4gICAgIEVpdGhlciB3YXksIEkgdGhpbmsgY29t
bWFuZCBsaW5lIHRvb2xzIHNob3VsZCBlYWNoIGdldCB0aGVpciBvd24NCiAgICA+ID4+ICAgICBt
aW5pLWRlc2lnbiBkb2MNCiAgICA+ID4+ICAgICAoaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMv
ZG9jcy9ibG9iL21hc3Rlci9kZXNpZ25zL2Rlc2lnbi10ZW1wbGF0ZS5tZCkNCiAgICA+ID4+IFdp
bGZyZWQsIENhbiB5b3UgcGxlYXNlIGNyZWF0ZSBhIGRvY3VtZW50IGFzIHBlciB0aGlzIGRlc2ln
biB0ZW1wbGF0ZSBhbmQgc3VibWl0IGZvciByZXZpZXcuDQogICAgPiA+Pg0KICAgID4gPj4gICAg
IHdpdGggcmVxdWlyZW1lbnRzIGFuZCBpbnRlcmZhY2VzIGNsZWFybHkgZGVmaW5lZCBmb3IgcmV2
aWV3IGJ5IHRoZQ0KICAgID4gPj4gICAgIGNvbW11bml0eS4gSWYgd2UgY2FuIGZpbmQgYSBnZW5l
cmljIHRvb2wgdGhhdCBtdWx0aXBsZSBwZW9wbGUgZmluZA0KICAgID4gPj4gICAgIHVzZWZ1bCwg
d2UgY2FuIHRoZW4gZmluZCBhIHBsYWNlIHRvIHB1dCBpdC4gT3RoZXJ3aXNlLCB5b3UgY291bGQg
aG9zdA0KICAgID4gPj4gICAgIHlvdXIgdG9vbHMgb3V0c2lkZSBvZiBvcGVuYm1jLyBnaXRodWIg
YW5kIGp1c3QgcHVsbCB0aGVtIGludG8gcmVjaXBlcw0KICAgID4gPj4gICAgIGZyb20gd2l0aGlu
IHlvdXIgbWV0YS1mYWNlYm9vayBsYXllci4NCiAgICA+ID4+DQogICAgPiA+Pj4gVGhhbmtzIGlu
IGFkdmFuY2UsDQogICAgPiA+Pj4NCiAgICA+ID4+PiBXaWxmcmVkDQogICAgPiA+DQogICAgPiAu
Li5zbmlwLi4uDQogICAgPg0KICAgIA0KDQo=
