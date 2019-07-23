Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F38FA726AD
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 06:34:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tjDK6DW2zDq8B
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 14:34:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=210706f9e7=wilfredsmith@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="OMwmSOd9"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="k/jXnSgn"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tXxb4jzBzDqB5
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 08:21:02 +1000 (AEST)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6NMKZQT016583
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jul 2019 15:20:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=facebook;
 bh=WazaW6w1m3A5LMdf7JK17bvkMVtTXFkCcra++jv0lKU=;
 b=OMwmSOd9R13rX9UhsAbP0syviwsDQf6wLisoog+9B3Rlsc5kIyKyLugRvBC/JqhDihdb
 jUHYyF58D0NQBDVXVpjo7AjHLHoYmdUKhD+IUcHO77MY56tlXP4Fg2YlyMiA0IWA9XBd
 dFeD7uEgUaVr1gwHxpx4RHGpew8mElJLRtc= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2txakj82mu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jul 2019 15:20:58 -0700
Received: from ash-exhub204.TheFacebook.com (2620:10d:c0a8:83::4) by
 ash-exhub201.TheFacebook.com (2620:10d:c0a8:83::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 23 Jul 2019 15:20:56 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.100) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 23 Jul 2019 15:20:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=leaCN15JcyL7O2dMgdTVE2GbLQdLCsij7e17KcLxewnO6MC1aXOKVF2DA0hKHeZHyESRr2tkSwV4R1MZZmCJ+cEOeEKg/ow1GK2uGlMZwzT+0bny8M3lCXRYanDW7deHoE9f5s2Fm8d+5tPdysleq0okS+HxEm2JtM5Hjpy6tf9RZpTnUfEkPISnUKLIEaB0jteQyNvYZvlZMI93Pu98PQaug8UjVmcrUVeRMaV5d3KCoLFgRpSCzNV7p+FJohY7UgEChGd25xSYfbLC+PM6S+VVbsO+Q4c0rVBQXi0tFasyAH7FltUzEZcaDUbzIRac6hJmSVscx5SI7E9SUsssAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WazaW6w1m3A5LMdf7JK17bvkMVtTXFkCcra++jv0lKU=;
 b=ToB1TYApwkQ/MsM9Qk2CTAXB7r2HVKjhdR12AE4KQs3pSIJ0ASjWSu1qY2ol1FcpsNCMcR++Nj/OV+CiGlABiXysrtL53jztwPlLUKMzAJcrzubMhfEfN5wlgTbldmn4fB4f7bUmsDQh7T1sUP+zxBO7iJFWG14exEQOfkhextRVHhBzs6CWntZuN+qpkzTv91UNzMBOTD9olCQu8lV9OYa1r+PrTyFJ0GI5qzcbi+fKRyuZE8wDyS97M054Ms9GlOkJvDsx1iQgcmHoztzEMN2Df1Gns4P3OpBtvv83aSarwL9oYLAD2zitgAX1NSBzmv9z1eT4dW1G9Jh9IDjxaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=fb.com;dmarc=pass action=none header.from=fb.com;dkim=pass
 header.d=fb.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WazaW6w1m3A5LMdf7JK17bvkMVtTXFkCcra++jv0lKU=;
 b=k/jXnSgnDQ9gDY552qMOPkjntKKy+AgfL4X46kViBDbzbrg4EmsGAX/J0rSWU0t0HfyPl5/vaYJvPiaNoQXqWFaxavWjIIPT8YOnFPBukx5zjqHVs5iLNv1V7C+lWq1ju/VEKj6NChiSF/4pGzrFK7a+glfihZRY+Tb+DHbLNVQ=
Received: from DM6PR15MB3675.namprd15.prod.outlook.com (10.141.166.85) by
 DM6PR15MB3004.namprd15.prod.outlook.com (20.178.231.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Tue, 23 Jul 2019 22:20:55 +0000
Received: from DM6PR15MB3675.namprd15.prod.outlook.com
 ([fe80::ed47:49c2:ffc4:1233]) by DM6PR15MB3675.namprd15.prod.outlook.com
 ([fe80::ed47:49c2:ffc4:1233%6]) with mapi id 15.20.2094.017; Tue, 23 Jul 2019
 22:20:55 +0000
From: Wilfred Smith <wilfredsmith@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: CLI Tools
Thread-Topic: CLI Tools
Thread-Index: AQHVQaTl81j33I0gDUWPzgUEWIYnzw==
Date: Tue, 23 Jul 2019 22:20:55 +0000
Message-ID: <904952B3-C01C-489C-BDD6-AB96F6734201@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::1:583a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9bf4d052-2272-4561-bc26-08d70fbc078a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR15MB3004; 
x-ms-traffictypediagnostic: DM6PR15MB3004:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR15MB30045BE35F0D2A0D5FD37A25BDC70@DM6PR15MB3004.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(136003)(346002)(376002)(366004)(396003)(199004)(189003)(5660300002)(64756008)(36756003)(8676002)(46003)(71200400001)(71190400001)(316002)(7736002)(966005)(8936002)(81166006)(33656002)(81156014)(6116002)(2906002)(486006)(305945005)(4744005)(1730700003)(2616005)(186003)(68736007)(6506007)(3480700005)(256004)(99286004)(102836004)(6486002)(25786009)(6306002)(6916009)(2501003)(221733001)(478600001)(5640700003)(6436002)(476003)(2351001)(7116003)(86362001)(53936002)(66946007)(66476007)(66556008)(66446008)(76116006)(91956017)(6512007)(14454004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR15MB3004;
 H:DM6PR15MB3675.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: I4Bt8UGYoDsw1kTGo7/HN5li1C2hdy3UMbDC7GeYq7W/QHd9HpDjq4RiIvXa59uxTh5Wi0kaJv905lZ9oFUReWd96DkBb8DB3NHPK+rwbITP6JBMF+MSIH1kIJMH2ZWUGkYAR/8YGpAsQM2ynQiZrPqsFgDEf0mKTG22i4GKWYeYwHTVCxpAPdgBIsJFMAGU4eYVCpvdFhAImJHT4kqrCbK6v4nfUpWpy7tAPcWwpMmuO4P5Iq94FVphb/FCyZaRpWWTlWw/ywk+kUigUZKkCrn+Sc021RPUJxB25EB1CMeUknVIXHJ98flr1VeJVuDjAis54YIg0eXs0bK9C1i36wHvNq8KLHbsgnTkgGBjTgifuhuEkkMI+8b7LnmG4S3K9eP8MlVA4IAtHDslrNf8PNSKHr0+S3kcm0PLT7owu9o=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2D0F0207E31A7548BB9F4A84C34693C8@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bf4d052-2272-4561-bc26-08d70fbc078a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 22:20:55.0335 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wilfredsmith@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR15MB3004
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-23_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=715 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907230227
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

VGhlcmUgd2FzIGEgZGlzY3Vzc2lvbiBhIHdoaWxlIGJhY2sgKDIgeWVhcnMgYWdvPyBJbiBodHRw
czovL2xpc3RzLm96bGFicy5vcmcvcGlwZXJtYWlsL29wZW5ibWMvMjAxNi1Ob3ZlbWJlci8wMDUz
MDcuaHRtbCkgd2hlcmUgdGhlIE9QIChQYXRyaWNrIFdpbGxpYW1zKSBleHByZXNzZWQgY29uY2Vy
biBvdmVyIHRoZSBwcm9saWZlcmF0aW9uIG9mIGNvbW1hbmQgbGluZSB0b29scy4gUGF0cmlja+KA
mXMgaW50ZXJlc3QgaW52b2x2ZWQgaG93IHRvIGludGVncmF0ZSBpb3Rvb2xzLiBPdGhlcnMgY2hp
bWVkIGluIHF1ZXN0aW9uaW5nIHdoZXRoZXIgaXTigJlzIGJldHRlciB0byBwcm92aWRlIGNvbXBh
Y3QgY29tbWFuZHMgZm9yIGNvbW1vbiBuZWVkcyBvciBlbmNvdXJhZ2UgZXhwbG9yYXRpb24gYnkg
cmVxdWlyaW5nIGxvbmdoYW5kLiBQYXRyaWNrIGlucXVpcmVkIGFib3V0IHRoZSB0YXJnZXQgYXVk
aWVuY2UgZm9yIHRoZSB0b29scy4NCg0KV2FzIHRoZXJlIGZ1cnRoZXIgZGlzY3Vzc2lvbiBhbG9u
ZyB0aGVzZSBsaW5lcz8gSGFzIGEgcG9saWN5IGJlZW4gZXN0YWJsaXNoZWQgcmVnYXJkaW5nIGNv
bW1hbmQgbGluZSB1dGlsaXRpZXMgYW5kIGJlc3QgcHJhY3RpY2VzIGZvciBpbnZvbHZpbmcgc3Vj
aCB1dGlsaXRpZXMgd2l0aCBPcGVuQk1DPw0KDQpXaWxmcmVk
