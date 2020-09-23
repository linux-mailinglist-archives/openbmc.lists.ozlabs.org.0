Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C61275070
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 07:46:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bx6cj265gzDqRX
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 15:46:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=65350707bb=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=VORL+NT5; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=NBPHGYRb; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bx6bt6RpbzDqKD
 for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2020 15:46:01 +1000 (AEST)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08N5h6ib015107; Tue, 22 Sep 2020 22:45:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=tA3GPS8V4RXTD+T6JlS+vN85Anq8FcGjRXIBbWHsHII=;
 b=VORL+NT5Bwd2RMAlm830yFA4sWDBBFNb2l2r2GpJaEip2h4RV/teUb0oZYfD0v7ET4f5
 gPvD2nJ4hCMO4h4ASs+FDaOMCD6cnI3QvAjKvLr80+qyMXaYscOwYHgHzZf3uW5IQ17u
 xNzQE/eXGWArXvnSzgolO3qE3pi/1h0dDfc= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 33qsp4ss8n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 22 Sep 2020 22:45:59 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.103) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 22 Sep 2020 22:45:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FrjMsvltnv1wMyAGdko+gyAB451cgZ4jbiFWuubNdIt5BDSzPQKhF2FpQ7klmHH09esu/dnlb3KFuAfV/qITb/ZvrYPFuC02bZtJ7WTvpp0sWzcMOjvVyoAC3N4M4De9i+ZIbNtbrlH3Qpik1MO5U/IgaVN56BSN1W2HJnchBKXhHELCDUosrrhQRW09AKeb/GGaoWdPWNtfeOoCv6mgi6bqkR/DjtVDWNct47vssWqWt5HRO8JKoHlj3nLsw/0w+biZvjUc51C7Z67f12VkXuZeiLX4AemDf2aTbpfpTjbEJLVA1MeFd33XB1cExWFp+kJZdK5w7KYjDUsFQo6haA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tA3GPS8V4RXTD+T6JlS+vN85Anq8FcGjRXIBbWHsHII=;
 b=GGXyPh06uz/UmKUSYaXBozB+iUTDyEe65+4/fNLML2A6HvmtL02pbVgRCTS+2MQKC/IhLo4dW5PNk4vzTqqWMBWW/QqMjM3+Gu8drvuLdIOyf/0/SEQArxzOmBInoS1IvYeghG5Jz5kjri8sAW8CxK5w6F72vmaf53q9B45XngI7rAQE0+sZuox5qGgVTqf48lc1uH+mmEWgZ/EXJfKFmBY0UJSNDHrPjVJXk0iO8jatnw2AjcMOzThh/LWibWXFzJqYk0y8S4d1L7UHSJWG8wT0XRrz+tcilw7LoSlc02qjI9dbUkUdgRTC+Hh3CoSHW5GRfB8udNQJoLAzBo1dSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tA3GPS8V4RXTD+T6JlS+vN85Anq8FcGjRXIBbWHsHII=;
 b=NBPHGYRbZjUQt6Zkc9z+1aD2hJ6OCK7qdg2gWLsqmO8OjYEXGTpqAo9JuA+A4jq1TCB90NaCey/9UkZLb72ZzOoCOtwwcrrV4oeSL0cVDpi2vOxrULinBrPgu+gQNurMpdTHCgFWqFDpsnioWAqVDjhzHAtIrbLB42msfpiz85Q=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB3415.namprd15.prod.outlook.com (2603:10b6:a03:112::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Wed, 23 Sep
 2020 05:45:51 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4%7]) with mapi id 15.20.3391.027; Wed, 23 Sep 2020
 05:45:51 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Ed Tanous <ed@tanous.net>
Subject: Re: Chassis reset
Thread-Topic: Chassis reset
Thread-Index: AQHWjfT7lWI0BIvUr06gDFlShL1iFqlu7CYA//+pggCAAILigIAFf+wAgADJeID//+ZlAA==
Date: Wed, 23 Sep 2020 05:45:51 +0000
Message-ID: <F46D657F-D4DA-49BD-B78D-CDD420768728@fb.com>
References: <46F3C05C-7CEC-42FD-A9B7-8E55AE56FE3F@fb.com>
 <CACWQX802HpRT20Zj2YFEnVE7XXBOJXx66-8B1E7TEZdCNwPbsQ@mail.gmail.com>
 <9EC0D657-2D58-4544-BA9E-65D3C4148A81@fb.com>
 <CACWQX80SivNLLE3gAUk+Ao=0eHf_ooezumXGmkkkVhVPFyyNSA@mail.gmail.com>
 <C6292DFD-EAF1-4658-85A7-F81941B12D5A@fb.com>
 <CACWQX83GJ9V9--5WGmVjvacYnw2=fr7URhqOcwkSq4C8GpFoiQ@mail.gmail.com>
In-Reply-To: <CACWQX83GJ9V9--5WGmVjvacYnw2=fr7URhqOcwkSq4C8GpFoiQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: tanous.net; dkim=none (message not signed)
 header.d=none;tanous.net; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:7daf]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b98a70bd-e4db-4b80-5cd9-08d85f83ee7c
x-ms-traffictypediagnostic: BYAPR15MB3415:
x-microsoft-antispam-prvs: <BYAPR15MB341584AF16C1476ADFE35AFBDD380@BYAPR15MB3415.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v6osGow08ZvwTwKxBcyyVnDgrCYk4G2W1A4/6Rk4EFWODvURLw1N4bUa+ToIoBBcovoNpcVu5Gc3H9vKN8Iyotx7cslu8m2ejnLVS9uFA2yt2i/vbNiLm1uGBzbtHwIND2MIoAmk/p/R/lIAeHSN70NlkcBXQ+u9XY3fqax8PHXEvY/dcvomkbHSiJ6vRZ+qLysGPWXBdMEiBgeatz6ctx24UZX//03/7e5m2ZzMb1h2AF71pKIleHqgGJpQSPhzg4neefcqyAXQBmeNEwRziBrdsZw6qV31g6yzTB6AnajNwGOxbJemOJdOHl6x6+fApTngTpA7XrbbfcyRpcFcafuXZeCEjknQ+oSWSq2EsKpEr36DD4c901+/qgIULvcDqw99OY/CKnOEVuYXLbtstzH6BAvQpmNK7oJzcY+r8Cc2zydwcgJCgo/pCaugBoFG5eLGAIUk6Pb52+86vcFbew==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(396003)(366004)(136003)(39860400002)(2906002)(76116006)(6916009)(64756008)(6486002)(4326008)(91956017)(316002)(36756003)(66446008)(66556008)(66476007)(6506007)(8936002)(186003)(8676002)(478600001)(966005)(53546011)(3480700007)(6512007)(5660300002)(2616005)(7116003)(66946007)(71200400001)(33656002)(83380400001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: ZTv0AbCbWvSv9vRyo3fDtZ6heE5tEcghzC1fzCSRVwFnm9yK8QTOY3J+lXONQofX465nz4r08JoO5K1k5BdZeRALena1ZVIxb9L+Bw9jOv8PYmXVgXJS5vzkt+X7IeVI6Ieq4PYGj3rbkmwV5/Z0IoXJQ43aTT9tdmkxgfPub2dyg0Rau1dK6MTFpvFgPvyVMTbqRP57MW9wFMU82AalAoFhebnRxR1R32cBRL2NashA8XN3aS3SiD/mgC2G2GPsc3xvS/x2KpdSHe2akb6pye1KMCHHMUziY4hiEtvFDxgOdzK6fmxThzKqqD5Bzsn/2UlyRNthXTfP4qRuT8TcbgmpJEpgn1GBpS8h+d0lRad0PJMJ7kt34IMm4L/RrLcWB3NOPOJ8hC/yY5WKklBUrtA6d5kBFqpLRHiY36LaBARoYFHpj3sU704pMIeQmunpqQwr/AtEtp3M2VDRvP2wS4+/6SqgAOyyAg+8VNSuWJAniuP+DUDksgso5lXzlPeJ2GcLDjcZdd2DptHZmxo9pj97LWZi/QQsRPMHQWClUV7VHYWE1glTVmHgJHCcvw8MWmvgtjUh51/atzVOubKvtBwWc79mZ2htLeJQQ8+9DQ1HcEmGBOVuygqAf/zPiz3d7peHyShExqFnQXAV/JR0HpILJsMef4Ftn/UPXnvnte3288rgc86rUyIfhVgIKBf0
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <3EFAB8CE5E895C41988A49136B680B0F@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b98a70bd-e4db-4b80-5cd9-08d85f83ee7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2020 05:45:51.7598 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iyXP3GxGcSARSjGAcAx/PQnUFwc889iu8SGhpPHDQhtvN8KcELQH6F2m2l8F+sGD13sdtoo9q++wHXX1+YfG+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3415
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-23_03:2020-09-23,
 2020-09-23 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxlogscore=999
 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009230045
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

DQoNCu+7v09uIDkvMjIvMjAsIDU6MTcgUE0sICJFZCBUYW5vdXMiIDxlZEB0YW5vdXMubmV0PiB3
cm90ZToNCg0KICAgIE9uIFR1ZSwgU2VwIDIyLCAyMDIwIGF0IDEyOjE2IFBNIFZpamF5IEtoZW1r
YSA8dmlqYXlraGVta2FAZmIuY29tPiB3cm90ZToNCiAgICA+DQogICAgPiBBZnRlciBhIGJpdCBv
ZiBzdHVkeSBvbiByZWRmaXNoLCBJIGdvdCBzb21lIGJhc2ljIGRlZmluaXRpb24gZm9yIGNoYXNz
aXMgZnJvbSByZWRmaXNoIGRvY3VtZW50ICBhcyBiZWxvdy4NCiAgICA+IGh0dHBzOi8vdXJsZGVm
ZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwcy0zQV9fcmVkZmlzaC5kbXRmLm9yZ19z
Y2hlbWFzX3YxX0NoYXNzaXMudjEtNUYxMy01RjAuanNvbiZkPUR3SUZhUSZjPTVWRDBSVHRObFRo
M3ljZDQxYjNNVXcmcj12OU1VMEtpOXBXblRYQ1d3akhQVmdwbkNSODB2WGtrY3JJYXFVN1VTbDVn
Jm09WlNpNEhzMEVOYi1EMWhxLWJNYUtXdzJSNU5fYmpsTW1KVkxJX1RrOWV5cyZzPVVLdWctcDJ3
dEd1eGhzZUItRHZFQ3VUS09fSTEyTzE4WTNxTHlrZUFVbHMmZT0gDQogICAgPiAgICAgICAgIkNo
YXNzaXMiOiB7DQogICAgPiAgICAgICAgICAgICAiYWRkaXRpb25hbFByb3BlcnRpZXMiOiBmYWxz
ZSwNCiAgICA+ICAgICAgICAgICAgICJkZXNjcmlwdGlvbiI6ICJUaGUgQ2hhc3NpcyBzY2hlbWEg
cmVwcmVzZW50cyB0aGUgcGh5c2ljYWwgY29tcG9uZW50cyBvZiBhIHN5c3RlbS4gIFRoaXMgcmVz
b3VyY2UgcmVwcmVzZW50cyB0aGUgc2hlZXQtbWV0YWwgY29uZmluZWQgc3BhY2VzIGFuZCBsb2dp
Y2FsIHpvbmVzIHN1Y2ggYXMgcmFja3MsIGVuY2xvc3VyZXMsIGNoYXNzaXMgYW5kIGFsbCBvdGhl
ciBjb250YWluZXJzLiAgU3Vic3lzdGVtcywgc3VjaCBhcyBzZW5zb3JzLCB0aGF0IG9wZXJhdGUg
b3V0c2lkZSBvZiBhIHN5c3RlbSdzIGRhdGEgcGxhbmUgYXJlIGxpbmtlZCBlaXRoZXIgZGlyZWN0
bHkgb3IgaW5kaXJlY3RseSB0aHJvdWdoIHRoaXMgcmVzb3VyY2UuICBBIHN1YnN5c3RlbSB0aGF0
IG9wZXJhdGVzIG91dHNpZGUgb2YgYSBzeXN0ZW0ncyBkYXRhIHBsYW5lIGFyZSBub3QgYWNjZXNz
aWJsZSB0byBzb2Z0d2FyZSB0aGF0IHJ1bnMgb24gdGhlIHN5c3RlbS4iLA0KICAgID4gICAgICAg
ICAgICAgImxvbmdEZXNjcmlwdGlvbiI6ICJUaGlzIHJlc291cmNlIHNoYWxsIHJlcHJlc2VudCBh
IGNoYXNzaXMgb3Igb3RoZXIgcGh5c2ljYWwgZW5jbG9zdXJlIGZvciBhIFJlZGZpc2ggaW1wbGVt
ZW50YXRpb24uIiwNCiAgICA+DQogICAgPiBJbiBteSB1bmRlcnN0YW5kaW5nLCBjaGFzc2lzIHJl
c2V0IHNob3VsZCBiZSB0cmVhdGVkIGFzIGNvbXBsZXRlIHBvd2VyIGN5Y2xlIG9mIHdob2xlIGNo
YXNzaXMgYW5kIHdlIGNhbiB1c2UgcmVkZmlzaCBjb21tYW5kICJGb3JjZVJlc3RhcnQgb3IgUG93
ZXJDeWNsZSINCg0KICAgIEknZCBwcm9iYWJseSBndWVzcyB0aGF0IGluIHRoaXMgY2FzZSB3ZSdk
IG1hcCBib3RoIEZvcmNlUmVzdGFydCBhbmQNCiAgICBQb3dlckN5Y2xlIHRvIHRoZSBzYW1lIGFj
dGlvbiwgaWYgd2UncmUganVzdCBwdWxsaW5nIHRoZSBwb3dlciByYWlsLg0KDQogICAgPg0KICAg
ID4gQXMgcGVyIG91ciBpbXBsZW1lbnRhdGlvbiBpbiBibWN3ZWIsIHdlIGhhdmUgaW1wbGVtZW50
ZWQgMiBpbnRlcmZhY2UgKHN5YXRlbSBhbmQgY2hhc3Npcykgd2hlcmUgd2UgZGVhbCB3aXRoIGNo
YXNzaXMgcmVzZXQNCiAgICA+IDEuICBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9ibWN3ZWIv
YmxvYi82ODRiYjRiODlmODhiMzk0YjAwYjE0MGQ3MWMxNjExNDMzOTNmODBiL3JlZGZpc2gtY29y
ZS9saWIvc3lzdGVtcy5ocHAjTDE3NTQNCiAgICA+IEluIHRoaXMgc3lzdGVtIGludGVyZmFjZSBl
dmVyeSByZXNldCB0eXBlIGV4Y2VwdCBGb3JjZU9mZiBpcyBjYWxsaW5nIGFjdGlvbiBmb3IgaG9z
dCBhbmQgZm9yIEZvcmNlT2ZmIGNvbW1hbmQsIGl0IGlzIGNhbGxpbmcgY2hhc3NpcyBwb3dlcm9m
Zi4NCiAgICA+DQogICAgPiAyLiBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9ibWN3ZWIvYmxv
Yi82ODRiYjRiODlmODhiMzk0YjAwYjE0MGQ3MWMxNjExNDMzOTNmODBiL3JlZGZpc2gtY29yZS9s
aWIvY2hhc3Npcy5ocHAjTDU4NQ0KICAgID4gSGVyZSB3ZSBvbmx5IGltcGxlbWVudCAiUG93ZXJD
eWNsZSIgY29tbWFuZC4NCiAgICA+DQogICAgPiBXaHkgZGlkIHdlIGltcGxlbWVudCBjaGFzc2lz
IHJlc2V0IGNvbW1hbmQgYXQgMiBkaWZmZXJlbnQgaW50ZXJmYWNlLCBJIG1pZ2h0IGJlIG1pc3Np
bmcgc29tZXRoaW5nIGhlcmUuDQogICAgPg0KICAgID4gQXMgcGVyIHg4Ni1wb3dlci1jb250cm9s
LCBpbiBib3RoIGFib3ZlIGNhc2VzIGNoYXNzaXMgY29tbWFuZCBwb2ludCB0byBhY3Rpb24gb24g
aG9zdCBvbmx5DQogICAgPiBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy94ODYtcG93ZXItY29u
dHJvbC9ibG9iL2U2M2RlYTA4NzVhNzBmZjUwZjQzMGE0YmRjODRiNjQ2YTU2YjljZTcvcG93ZXIt
Y29udHJvbC14ODYvc3JjL3Bvd2VyX2NvbnRyb2wuY3BwI0wyMzg5DQoNCiAgICBCZWNhdXNlIG1v
c3Qgc3lzdGVtcyBkb24ndCBoYXZlIHRoZSBhYmlsaXR5IHRvIGRvIGEgY29tcGxldGUgQUMgcmVz
ZXQsDQogICAgc28gdG9kYXkgd2UgdGVuZCB0byBtYXAgYSBDaGFzc2lzIHJlc2V0IHRvIGEgaG9z
dCByZXNldCBmb3INCiAgICBjb21wYXRpYmlsaXR5LiAgSSBzdXNwZWN0IHlvdXIgdXNlIGNhc2Ug
aXMgdGhlIGZpcnN0IHN5c3RlbSB0aGF0IHdpbGwNCiAgICBhZGQgdGhlIGFiaWxpdHkgdG8gZG8g
dGhlICJyaWdodCIgdGhpbmcsIGFuZCBhY3R1YWxseSBjeWNsZSBwb3dlciB0bw0KICAgIHRoZSBj
aGFzc2lzLg0KDQogICAgPg0KICAgID4gd2hlcmUgY2FuIHdlIGltcGxlbWVudCBhY3Rpb24gb24g
Y2hhc3Npcy4NCiAgICA+DQogICAgPiBDYW4gSSBhZGQgRm9yY2VSZXN0YXJ0IGZvciBjaGFzc2lz
IGluIHJlZGZpc2ggY2hhc3NpcyBpbnRlcmZhY2UgYXMgY2hhc3NpcyBzbGVkIChjb21wbGV0ZSBw
b3dlciByZW1vdmFsIGFuZCByZXN0b3JlKQ0KICAgID4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5i
bWMvYm1jd2ViL2Jsb2IvNjg0YmI0Yjg5Zjg4YjM5NGIwMGIxNDBkNzFjMTYxMTQzMzkzZjgwYi9y
ZWRmaXNoLWNvcmUvbGliL2NoYXNzaXMuaHBwI0w1ODUNCg0KICAgIFlvdSBjYW4gYWRkIEZvcmNl
UmVzdGFydCwgYnV0IHlvdSBuZWVkIHRvIGltcGxlbWVudCBpdCBpbiBzdWNoIGEgd2F5DQogICAg
dGhhdCBpdCdzIHNlbGVjdGluZyBpdCBwZXItY2hhc3NpcywgZ2l2ZW4gdGhhdCB5b3UnbGwgaGF2
ZSAyIGNoYXNzaXMNCiAgICBpbnN0YW5jZXMsIG9uZSBjYXBhYmxlIG9mIGFuIEFDIHJlc2V0LCBv
bmUgdGhhdCBpc24ndC4gIFRvZGF5LCB0aGUNCiAgICBjb2RlIGRvZXMgdGhlIHdyb25nIHRoaW5n
LCBhbmQgbWFwcyBhbGwgY2hhc3NpcyByZXNldHMgdG8gdGhlDQogICAgL29yZy94eXovb3BlbmJt
Y19wcm9qZWN0L2NoYXNzaXMwIHBhdGgsIGJlY2F1c2UgdGhlcmUgd2FzIG5vDQogICAgYXNzb2Np
YXRpb24gZm9yIHBvd2VyIHN0YXRlIG1hcHBpbmcgYmFjayB0byBhIGNoYXNzaXMgcGF0aC4gIFlv
dSdsbA0KICAgIGxpa2VseSBuZWVkIHRvIGRvIHNvbWUgZW5naW5lZXJpbmcgaW4gdGhpcyByZWdh
cmQsIG9yIGp1c3QgbWFwDQogICAgL29yZy94eXovb3BlbmJtY19wcm9qZWN0L2NoYXNzaXMwIHRv
IHlvdXIgImNoYXNzaXMiIHJlc2V0Lg0KDQpZZXMgSSBoYXZlIDIgY2hhc3NpcyBpbnN0YW5jZSB4
eXovb3BlbmJtY19wcm9qZWN0L2NoYXNzaXMwIGFuZCB4eXovb3BlbmJtY19wcm9qZWN0L2NoYXNz
aXNfc3lzdGVtMC4NCkxhdGVyIG9uZSBpcyB1c2VkIGZvciBBQyByZXNldC4NCg0KICAgID4NCiAg
ICA+IEkgdW5kZXJzdGFuZCB0aGF0IGl0IGlzIG5vdCB2ZXJ5IGNsZWFyIGZyb20gcmVmaXNoIGhv
dyB0byBtYXAgZWFjaCByZXNvdXJjZSBhbmQgY29tbWFuZC4NCiAgICA+DQogICAgPiBQbGVhc2Ug
c3VnZ2VzdCBhIGRpcmVjdGlvbiBoZXJlLg0KICAgID4NCiAgICA+IFJlZ2FyZHMNCiAgICA+IC1W
aWpheQ0KICAgID4NCg0K
