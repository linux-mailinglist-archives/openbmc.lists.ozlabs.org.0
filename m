Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E288F422
	for <lists+openbmc@lfdr.de>; Thu, 15 Aug 2019 21:09:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468bbd6nj6zDr7L
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 05:09:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=3130bab55c=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="ork/Zq0M"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="C6H6M4B2"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468bYf2467zDr7J
 for <openbmc@lists.ozlabs.org>; Fri, 16 Aug 2019 05:07:32 +1000 (AEST)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7FJ4gWB023358; Thu, 15 Aug 2019 12:07:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=goL676kIZHpo7NfT2LmalD/NkB8y7EQgidZ6qmTtXs0=;
 b=ork/Zq0Msn2NzKS3eniT7L0dRY1Tg+Ueqp7ul0jQ0lnqu0RJ7Jt/Q82vcDJwYLbk/muL
 SZqip8D+NQZLpH4tDAeYH4Zm89n3MginFwnDdWpvILpKrj62KM5UQaRTimL0i1u8CcVn
 CfQ6KJ9TSi281P2qExeJ0FwJOjN9PlPRXUc= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2udagjrtk4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 15 Aug 2019 12:07:28 -0700
Received: from ash-exhub201.TheFacebook.com (2620:10d:c0a8:83::7) by
 ash-exhub103.TheFacebook.com (2620:10d:c0a8:82::c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 15 Aug 2019 12:07:27 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.101) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 15 Aug 2019 12:07:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bt/NUZX2aYyA1RyIzUwSHr07tq200quvJt2UQE4YKQJ5b+5fBs8fih5iNovvHWjiHrxtYe412jfz5fqsFHwKxy+m0sIW4FxdHvuehY+EeWVBy86AqSyFc4L4RoBX4X1/JA7I1hgys6uGfjrQrjvC9QATZD19nncCecgaMagjLnehH/xwlQnuDe9mNGFp3Fy+MrgBxhljkRNTi54HGoWJumEXkeaJjA04hyxF1hl1RIHXY8zbyNCKUB0z0C+wzKtENhgAS6nA3v06AakE49XZyywIuySMtwKA4dyh2gc0JwLX/RSHCAY+fpsGBUUbe8UClCBmYkLmEKLWg29QmqFezA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=goL676kIZHpo7NfT2LmalD/NkB8y7EQgidZ6qmTtXs0=;
 b=MLh9K/CY0ecBES0iL27ONG/pk5t0mBLJ0aB4rgNEnRwcBfRXNbXycOdi28AefGAsY9HWBZ4ZZH9ShtfRp+Xe8c4H9M18KeR7oLdVFRmz3jtKmqfcupVy3wqBpUxpEdYcHb+PPP1SD3vnxuQ2ROTMHsu0zGIU9ZD2Qx+YnBIoIx9Zw8DvzovcZNaozSy7yMm8lXzWBjDRwNE70xFb5m8SmulOPbKU6JEtJ0+46IsVkK6sANAF4mXIMYMgKoA550vTCv5G9aDMu9dP3sC01l8VQwIOmr3sOUML/5w6VgR27hErHQ1uUC2C8OBG6t+5X8UQ4n18Q5bhGMCbsmk80fwC9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=goL676kIZHpo7NfT2LmalD/NkB8y7EQgidZ6qmTtXs0=;
 b=C6H6M4B2EPeB3SKFn2W2U2pOCaSsC7NT0TlBo7I5UvYZf8d+oMvNtdEgJDDuhlP5C9ugWIPNJWgc0CSG6zG2AURAnAZw9js4PA/W+bjXeqV0uIAFW/uV3b6zcaxQdw+0viWJEY4qW2uSJvwWM+hPfbpVgyJH/p9cocJVhuvcB+E=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1847.namprd15.prod.outlook.com (10.172.76.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.20; Thu, 15 Aug 2019 19:07:26 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::8c93:f913:124:8dd0]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::8c93:f913:124:8dd0%8]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 19:07:26 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Andrew Geissler <geissonator@gmail.com>, Wilfred Smith
 <wilfredsmith@fb.com>
Subject: Re: Policy on Tools Posting
Thread-Topic: Policy on Tools Posting
Thread-Index: AQHVUXIgTlE2HlJMUEWTgBCXN5lVV6b8LnUA///yqAA=
Date: Thu, 15 Aug 2019 19:07:26 +0000
Message-ID: <68929B76-8826-4DAD-A29E-DF7A119D00C5@fb.com>
References: <6BC2AA78-97AF-4D38-A876-F9E50BADE98E@fb.com>
 <CALLMt=p9KvdX3-fneG5JdJNK6viHo0Hny=90MTj=tqUu1SQ=Zw@mail.gmail.com>
In-Reply-To: <CALLMt=p9KvdX3-fneG5JdJNK6viHo0Hny=90MTj=tqUu1SQ=Zw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::aa3f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47a423d7-6690-458b-c6f6-08d721b3cff2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:CY4PR15MB1847; 
x-ms-traffictypediagnostic: CY4PR15MB1847:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR15MB18475F8F23D1C88E82372218DDAC0@CY4PR15MB1847.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(346002)(39860400002)(396003)(376002)(189003)(199004)(51874003)(6486002)(14454004)(478600001)(91956017)(5660300002)(66446008)(66556008)(6636002)(64756008)(66476007)(316002)(486006)(66946007)(110136005)(229853002)(76116006)(71190400001)(8936002)(305945005)(7736002)(6436002)(71200400001)(6306002)(2616005)(11346002)(446003)(6116002)(2906002)(102836004)(76176011)(46003)(81156014)(8676002)(6246003)(53936002)(476003)(33656002)(25786009)(99286004)(3480700005)(86362001)(6512007)(186003)(4326008)(6506007)(53546011)(14444005)(256004)(81166006)(36756003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1847;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rL6sjoYXyvILC+xSDYCwJBACoRSzBxwaD3dLY56viJ3MP2Nhe+sNdJOmy6tacnFTnWgldnQiNPM0C0EzxnbbWUh+jYQW5+cyfDI+UzXyY/7JnZcQIA/tQm3Bwq0gDmHvuHPMKjiQnlS5dEUiTzcSWvnHTu2WbEq8xsmyLI3S5PNOl81VOCL1v+9lhu31nRrmlEA+FoFfz0z3Vpy6vvIOqkTOVv6tfQFXqevh+R3fEU4JsvbN64VHyrQRdRfb/MY6Z6Px8/U/Z8GyF7TzyUjosv7cqkZ0d1VLFrIobytN6ftfU+pUg/bz92V4uVhaa2bU1GzZtYlMGHtFJOCy+dPIW2s842O3jkYj4g/JXsD881WkVaJfuTHfC9KMq+EDdFRscOKt+7N2Fp+aHxOljg3GlsN7gDFY7InwrVEcody11WU=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F216F77E026569448052AE678BA1222D@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 47a423d7-6690-458b-c6f6-08d721b3cff2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 19:07:26.6362 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NT5LdVYtI5pp1IF0BHrtijedlR+FLUAmvkVj0C1DTotJ2Nlq0wVpJhopy2UjaV/7kVWJxUubiiUixNgBXUfDqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1847
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-15_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908150180
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

DQoNCu+7v09uIDgvMTUvMTksIDU6NTkgQU0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBBbmRyZXcg
R2Vpc3NsZXIiIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFi
cy5vcmcgb24gYmVoYWxmIG9mIGdlaXNzb25hdG9yQGdtYWlsLmNvbT4gd3JvdGU6DQoNCiAgICBP
biBNb24sIEF1ZyAxMiwgMjAxOSBhdCA3OjU4IFBNIFdpbGZyZWQgU21pdGggPHdpbGZyZWRzbWl0
aEBmYi5jb20+IHdyb3RlOg0KICAgID4NCiAgICA+DQogICAgPiAxLiBBcmUgdGhlcmUgZ3VpZGVs
aW5lcy9wcm9jZWR1cmVzIHNwZWNpZmljIHRvIHN1Ym1pdHRpbmcgY29tbWFuZCBsaW5lIHRvb2xz
IGFuZCB1dGlsaXRpZXM/IEkgaGF2ZSBoZWFyZCB0aGF0IHRoZXJlIG1heSBiZSBhIHJlcG9zaXRv
cnkgYW5kL29yIHBhdGggZGVkaWNhdGVkIHRvIENMSSB0b29scy4NCiAgICANCiAgICBUaGUgY29t
bXVuaXR5IGhhcyBkZWZpbml0ZWx5IHRlbmRlZCB0byBsaW1pdCB3cmFwcGVyIHRvb2xzIHdpdGhp
bg0KICAgIE9wZW5CTUMuIFdlIGhhZCBhIGRpc2N1c3Npb24gYSB3aGlsZSBiYWNrIHRoYXQgd2Un
cmUgb3BlbiB0byBzb21lIGJ1dA0KICAgIHRoZSBBUEkncyB0byB0aGVtIHJlYWxseSBuZWVkIHRv
IGJlIHRob3VnaHQgb3V0IGFuZCByZXZpZXdlZCBiZWNhdXNlDQogICAgY29tbWFuZCBsaW5lIHRv
b2xzIGJlY29tZSBjdXN0b21lciBBUEkncyAoaS5lLiBwZW9wbGUgc3RhcnQgd3JpdGluZw0KICAg
IHNjcmlwdHMgb24gdG9wIG9mIHRoZXNlIHRvb2xzIHRoYXQgdGhlbiBiZWNvbWUga2V5IHRvIHRo
ZQ0KICAgIG1hbnVmYWN0dXJpbmcgcHJvY2VzcyBvciBzb21lIG90aGVyIGNyaXRpY2FsIGFyZWEp
Lg0KICAgIA0KICAgIEFueXRoaW5nIHRoYXQgZ29lcyBpbnRvIE9wZW5CTUMgbmVlZHMgdG8gc3Vw
cG9ydCBPcGVuQk1DIGludGVyZmFjZXMuDQogICAgRm9yIGV4YW1wbGUsIEknbSBub3QgZmFtaWxp
YXIgd2l0aCBmcnVpZC11dGlsJ3MgRC1idXMgc2VydmljZQ0KICAgIHh5ei5vcGVuYm1jX3Byb2pl
Y3QuRnJ1RGV2aWNlLiBBICJidXNjdGwgdHJlZQ0KICAgIHh5ei5vcGVuYm1jX3Byb2plY3QuSW52
ZW50b3J5Lk1hbmFnZXIgfCBjYXQiIHNob3dzIHRoZSBpbnZlbnRvcnkgaXRlbXMNCiAgICBvbiBP
cGVuQk1DLg0KICAgIA0KICAgIE9uZSBpc3N1ZSB3ZSBoYXZlIHdpdGhpbiBPcGVuQk1DIGlzIHRo
ZXJlIG1heSBiZSBkaWZmZXJlbnQNCiAgICBpbXBsZW1lbnRhdGlvbnMgb2YgdGhlIEQtYnVzIEFQ
SSdzIGZvciBhIGdpdmVuIGFyZWEuIEZvciBleGFtcGxlLA0KICAgIEludmVudG9yeSBoYXMgZGlm
ZmVyZW50IGltcGxlbWVudGF0aW9ucyBzbyBJJ20gbm90IHN1cmUgd2hpY2ggcmVwbw0KICAgIHdv
dWxkIGJlc3QgZml0IHlvdXIgdG9vbC4gVGhhdCB0eXBlIG9mIGlzc3VlIGxlYWRzIG1lIHRvIHdv
bmRlciBpZiB3ZQ0KICAgIHNob3VsZCBwdXQgdGhlIHRvb2xzIHdpdGggdGhlIGludGVyZmFjZSBk
ZWZpbml0aW9ucyBpbg0KICAgIG9wZW5ibWMvcGhvc3Bob3ItZGJ1cy1pbnRlcmZhY2VzPyBPciBt
YXliZSBhIHNlcGFyYXRlIHBob3NwaG9yLXRvb2xzDQogICAgcmVwbyB3b3VsZCBiZSBtb3JlIGxv
Z2ljYWwgZm9yIHRoZXNlLg0KQW5kcmV3LCBJIGxpa2UgdGhlIGlkZWEgb2YgaGF2aW5nIHBob3Nw
aG9yLXRvb2xzIHdoaWNoIGNhbiBiZSBhIHBsYWNlaG9sZGVyIA0KZm9yIGFueSBjb21tYW5kbGlu
ZSB0b29scyBhbmQgY2FuIGdyb3cgYXMgcGVyIHJlcXVpcmVtZW50LiBDdXJyZW50bHkNCml0IGNh
biBzdGFydCB3aXRoIDMgcHJvcG9zZWQgdG9vbHMuIA0KDQogICAgRWl0aGVyIHdheSwgSSB0aGlu
ayBjb21tYW5kIGxpbmUgdG9vbHMgc2hvdWxkIGVhY2ggZ2V0IHRoZWlyIG93bg0KICAgIG1pbmkt
ZGVzaWduIGRvYw0KICAgIChodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9kb2NzL2Jsb2IvbWFz
dGVyL2Rlc2lnbnMvZGVzaWduLXRlbXBsYXRlLm1kKQ0KV2lsZnJlZCwgQ2FuIHlvdSBwbGVhc2Ug
Y3JlYXRlIGEgZG9jdW1lbnQgYXMgcGVyIHRoaXMgZGVzaWduIHRlbXBsYXRlIGFuZCBzdWJtaXQg
Zm9yIHJldmlldy4NCg0KICAgIHdpdGggcmVxdWlyZW1lbnRzIGFuZCBpbnRlcmZhY2VzIGNsZWFy
bHkgZGVmaW5lZCBmb3IgcmV2aWV3IGJ5IHRoZQ0KICAgIGNvbW11bml0eS4gSWYgd2UgY2FuIGZp
bmQgYSBnZW5lcmljIHRvb2wgdGhhdCBtdWx0aXBsZSBwZW9wbGUgZmluZA0KICAgIHVzZWZ1bCwg
d2UgY2FuIHRoZW4gZmluZCBhIHBsYWNlIHRvIHB1dCBpdC4gT3RoZXJ3aXNlLCB5b3UgY291bGQg
aG9zdA0KICAgIHlvdXIgdG9vbHMgb3V0c2lkZSBvZiBvcGVuYm1jLyBnaXRodWIgYW5kIGp1c3Qg
cHVsbCB0aGVtIGludG8gcmVjaXBlcw0KICAgIGZyb20gd2l0aGluIHlvdXIgbWV0YS1mYWNlYm9v
ayBsYXllci4NCiAgICANCiAgICA+IFRoYW5rcyBpbiBhZHZhbmNlLA0KICAgID4NCiAgICA+IFdp
bGZyZWQNCiAgICANCg0K
