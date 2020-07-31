Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3094223493F
	for <lists+openbmc@lfdr.de>; Fri, 31 Jul 2020 18:34:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BJCY63NrtzDqdX
	for <lists+openbmc@lfdr.de>; Sat,  1 Aug 2020 02:34:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=5481e85f78=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=BVBTTx0z; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=k9Yc70YU; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BJCTB4S4LzDqcx
 for <openbmc@lists.ozlabs.org>; Sat,  1 Aug 2020 02:31:01 +1000 (AEST)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06VGOgFm017086; Fri, 31 Jul 2020 09:30:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=XFqiEtez5HKRqldL0OiW3ivL/a/26VbjH4YJKPGTZWk=;
 b=BVBTTx0ztaw8i6wjYx+B4gPfilKocPw7ba89x6jK5ZIoxKBsG9MMpl0PXeNlCUW8svjm
 zuWl0Ib5j2D8aZmgleqSgaPSRUuzRX/CouLhO6Mrz+GZ96KEEs3SWcbyVLgqRVXE9vuj
 A43OLs+XeFYijOHfZJ4QjolERleZNejyaQY= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 32m35fcy4y-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 31 Jul 2020 09:30:56 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.172) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 31 Jul 2020 09:30:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zw1rltVWfW7c5kFEaKJiwEaFfAkKFLNHpy4DuQsEjUOcdA89NjGjA/IhApUW6Jlgvl49/fkidnxj4rqSK3jvzptcu92vwMFaPXuLQG6TW8IV/4YPXNh7GuY/0gAAoJ55ldayOPPQJopouSEUGZjkuhgR10VOtNBL53A6kJGMuZK+4wnIHyTWroIJ8/cgHIpvNUnuJFqoeycw5NS6FBNCuV4H87Wacay+4wH4gZ2iYPmROBvryerZZzuCOlPQY2adHOsR+jUqYf/I1fCdUbZgeMNts0yJeQVOv028Z2PwLhb3FH5RhqC/5gubZjRnPkz4C5wDc6kFTE4XdXwg8Qdq/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFqiEtez5HKRqldL0OiW3ivL/a/26VbjH4YJKPGTZWk=;
 b=LEq5zUfTm9xd9oL0aCBTIQ1JUAiiyIRJ+V/JJan23gl3sWYbvsExhFnrNlevbOBRdyfM/yJiygzQd7letvv8kgOj1p2uTZvLbZaqtItEpbjCT8pr5omETFll00eUaJT35fTopEdJIbTT4CRzh3mFseUmEJaUTwYIAZPZvWCCM1nGZCtrRPU+A/qK9vsoZ/NRQJPkqS1QMn903tmkt4yZA8k81dH4w02a+3EaqEZ7wPqrFfaY42td5wSYSzjwmJwUXxiFJ2tJn03ka4K49UcbTCwAX2gseKxXF57v/PmMBoyWIWtCKAg8LJzX8VpIJQgUXXH3Dew01UJ5i6BdH4gKiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFqiEtez5HKRqldL0OiW3ivL/a/26VbjH4YJKPGTZWk=;
 b=k9Yc70YU2f+EA1Mhj3c8ufos3urc2jIFBtYHyDmGODX9IoXU3Y0uMtaTJuYvIByksAVVL/bRAkvjeezseyqK1DCSeFYrBufUr6kLZRVMRhNJ7X7mRYX0bpKw1LtWnJWleMuwzgzFW/9VP6WeXp+SNwYm6tqtTUeiZg54Zm1mbDg=
Received: from DM6PR15MB2378.namprd15.prod.outlook.com (2603:10b6:5:8c::23) by
 DM6PR15MB3420.namprd15.prod.outlook.com (2603:10b6:5:172::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.18; Fri, 31 Jul 2020 16:30:53 +0000
Received: from DM6PR15MB2378.namprd15.prod.outlook.com
 ([fe80::340f:8080:19ee:d547]) by DM6PR15MB2378.namprd15.prod.outlook.com
 ([fe80::340f:8080:19ee:d547%5]) with mapi id 15.20.3239.019; Fri, 31 Jul 2020
 16:30:53 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: using third party library
Thread-Topic: using third party library
Thread-Index: AQHWZeGP6ggmurFi9kuRanD6Bgh33qke+xiAgAEkwACAAYunAP//w0+A
Date: Fri, 31 Jul 2020 16:30:53 +0000
Message-ID: <7542623B-7D86-44CD-83BD-A4A8392D6759@fb.com>
References: <80EB1AD4-61FB-489C-8D6B-5FDDF7F46ED3@fb.com>
 <CADfYTpG3HBX2FPMwa4oQ8p_C6bv4Vno-LiJyRzf6dnRhBx15XA@mail.gmail.com>
 <A698A001-88FC-464E-9D56-E7EFB69624DE@fb.com>
 <20200731130806.GS3922@heinlein>
In-Reply-To: <20200731130806.GS3922@heinlein>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: stwcx.xyz; dkim=none (message not signed)
 header.d=none;stwcx.xyz; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2601:647:4b00:fd70:18e2:66b5:5e3d:3d1a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7009674d-8442-4a14-f035-08d8356f1833
x-ms-traffictypediagnostic: DM6PR15MB3420:
x-microsoft-antispam-prvs: <DM6PR15MB3420A7C8F6ECDBD36471CB9FDD4E0@DM6PR15MB3420.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VGWsiFtswb2UdIgLyCERi0DgmVv8B9V4m+jqXXZ0y05LcjIldMFTRr0pDUWc3BEBqBqzkh/QD6U4++U93BoHXGkfNYAMMzu/z2YYCrSIbznIiNhb0A/pt2sROIdnO6qrCG852kO4nmlwQ2mM/JtV1OAu0MAA60KoHlNouxa7WxyVd+PwYTY9o6IMR64QFKI8IivEZTOHyYEFJrMQD6qnB5tmpcwWPasNFsqmQathpjfDEenVp3x/6ETbzgIReA/ewVbNwbnkvM6Vndgk3j2VY1w6AqzY4eXiEgB2iZPszXqGuB2IQqQi4uUc0Ln02cSRrByfj3N1ekwHpbdUhZLJosj1WdneQlbLbE9MRDvMWc7nZNATuC4pS4sbRV67SGj1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR15MB2378.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(396003)(346002)(376002)(39860400002)(136003)(64756008)(66556008)(66446008)(66476007)(66946007)(76116006)(8676002)(2906002)(5660300002)(6506007)(4326008)(33656002)(6512007)(478600001)(36756003)(2616005)(91956017)(86362001)(83380400001)(71200400001)(6486002)(3480700007)(186003)(54906003)(8936002)(6916009)(316002)(547064002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: c10rmkDJc9QZAK1484CsnFGRl8uvzf7DfDWMBBh3OUuYAEZ6EWivBtORDO+kxu06mir9p1yP2PYrasWV4oQH/79/TKDYHu9De1dbqby7GVMPXedxTBzNFljyDOWdVHUHSINe1rVrYn5ljfBL5uMLTEw1EaKwWAaAdvYjCnOuN0LgglM6qjTuXVCWthVNvVUiuk38/o6QPjgUuCgkiC5avDFIm88YBwPrDzSKGkJ0SQshY60SBcWUhsbttfoLIlaQHjNs3cB7/lcNKuOf9540rN/0qZmXx28WGiT1GFhBlcP82zVzmdoc48FOfzbaUsKf1Eqbd6pXrszHmfFWb/OPZfsjBEoNVEcXkpbKIGc64LauxMcP7Uu3MXXw2z8GoVU9GyFQNzIelWoQOBO04RBM4sfbv9BzeLXOmZRhdS8zffQf1tWKmcQLu03daDdbLIc+kPRljN4F5jrxZ0SBsRUE+9JSHTMSo2epGCx+8vcuNE1oFIcdjflpy5EQikpl2LauAY/LVZIBodAegd0VNHMc11Ac/jsuSy6Hnwp08RtyUMuMvnsTTcm29NSzGXS63uf81IsNNcQvE5kxBrmqsTU6SmLn05Cuak3KOy14PEzLX+sxBy3PlPlD98+2BzSuuEKsRas/lOOz1kpm3r5VTMn1BIlKlCEBrCYP2vYBGEcnOX/OT5kQCr/Wx6t2Q02w1BWkWhbZhojuhdCcj/43IX2cKg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <DD52FF0B22BB7F4B857703821F11DC77@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR15MB2378.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7009674d-8442-4a14-f035-08d8356f1833
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2020 16:30:53.5664 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0APYxyecJmBwiZseuXIIlq3jDWWLhV7+/2Hos6luVUWejK2Kq8fD/DJCRsI9IDJAITKZDgD7/Nhv/y3LkIlEMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR15MB3420
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_06:2020-07-31,
 2020-07-31 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 malwarescore=0
 spamscore=0 mlxscore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007310123
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

VGhhbmtzIFBhdHJpY2ssDQpJIGxpa2UgdGhlIGlkZWEgdG8gaGF2ZSBzZXBhcmF0ZSByZWNpcGUg
aW4gb3BlbmVtYmVkZGVkLCBsZXQgbWUgbG9vayBmb3IgaW5jbHVkaW5nIHRoaXMgcmVjaXBlIGlu
IG9wZW5lbWJlZGRlZC4NCg0KUmVnYXJkcw0KLVZpamF5DQoNCu+7v09uIDcvMzEvMjAsIDY6MDgg
QU0sICJQYXRyaWNrIFdpbGxpYW1zIiA8cGF0cmlja0BzdHdjeC54eXo+IHdyb3RlOg0KDQogICAg
T24gVGh1LCBKdWwgMzAsIDIwMjAgYXQgMDg6MzI6MDBQTSArMDAwMCwgVmlqYXkgS2hlbWthIHdy
b3RlOg0KICAgID4gVGhlcmUgaXMgbm8gcmVjaXBlIGF2YWlsYWJsZS4gSXQgaXMganVzdCBhIGdp
dGh1YiBwcm9qZWN0IGFuZCBlaXRoZXIgd2UgY2FuIGFkZCBhcyBhIFNSQ19VUkkrIGludG8gb3Vy
IHJlY2lwZSBvciB3cml0ZSBhIG5ldyByZWNpcGUgdG8gYnVpbGQgYSBwYWNrYWdlLiBUaGlzIGlz
IGhlYWRlciBvbmx5IGxpYnJhcnksIGFsbCBzb3VyY2VzIGFyZSBpbiBoZWFkZXIgZmlsZSBpdHNl
bGYuIFNvIHdlIHNob3VsZCBiZSBhYmxlIHRvIGp1c3QgYWRkIGFzIFNSQ19VUkkuIEkgaGF2ZSBu
byBpZGVhIGFib3V0IGhvdyBsaWNlbnNpbmcgd2lsbCB3b3JrIGhlcmUuDQogICAgPiANCg0KICAg
IEkgZG9uJ3QgdGhpbmsgeW91IHNob3VsZCBhZGQgYW4gYWRkaXRpb25hbCBTUkNfVVJJIG9udG8g
eW91ciBwYWNrYWdlIGluDQogICAgb3JkZXIgdG8gZ2V0IHRoaXMgZGVwZW5kZW5jeSBldmVuIHRo
b3VnaCBpdCBpcyBoZWFkZXItb25seS4gIFRoZXJlIGFyZQ0KICAgIG90aGVyIGhlYWRlci1vbmx5
IHJlcG9zaXRvcmllcyB0aGF0IGhhdmUgcmVjaXBlcywgc3VjaCBhcyBubG9obWFubi1qc29uLg0K
DQogICAgSWYgeW91IHdlcmUgdG8gYWRkIHRoaXMgYXMgYW4gU1JDX1VSSSBpdCB3b3VsZCBjb21w
bGljYXRlIHRoZSBMSUNFTlNFDQogICAgc2V0dGluZyBpbiB5b3VyIHJlY2lwZSBiZWNhdXNlIHlv
dXIgY29kZSBpcyBBcGFjaGUgYnV0IHlvdSdyZSBhbHNvDQogICAgaW5jbHVkaW5nIGFuIE1JVCBj
b21wb25lbnQuICBJdCBpcyBjbGVhcmVyIHRvIHNpbXBseSBoYXZlIGFub3RoZXIgcmVjaXBlDQog
ICAgdGhhdCBpcyBNSVQgbGljZW5zZWQsIGFzIGFwcHJvcHJpYXRlLg0KDQogICAgVGhlIHJlY29t
bWVuZGF0aW9uIHRoYXQgInRoaXMgYmVsb25ncyBpbiBvcGVuZW1iZWRkZWQiIG1lYW5zIHdlIHBy
b2JhYmx5DQogICAgc2hvdWxkbid0IGJlIGNhcnJ5aW5nIGFyb3VuZCB0aGUgcmVjaXBlIGZvciBp
dCBvdXJzZWx2ZXMgc2luY2UgaXQgaGFzDQogICAgcG90ZW50aWFsbHkgd2lkZXIgYXBwbGljYWJp
bGl0eSB0aGFuIE9wZW5CTUMuICBXZSBbeW91XSBjYW4gY29udHJpYnV0ZQ0KICAgIHRoZSByZWNp
cGUgdXBzdHJlYW0gdG8gT0UgYW5kIHdlJ2xsIGdldCBpdCBpbmRpcmVjdGx5IHRoYXQgd2F5LiAg
V2UNCiAgICBzaW1pbGFybGx5IGRpZCB0aGlzIGZvciAnbGlibWltZXRpYycgcmVjZW50bHkuDQoN
CiAgICAtLSANCiAgICBQYXRyaWNrIFdpbGxpYW1zDQoNCg==
