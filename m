Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A1354281D2F
	for <lists+openbmc@lfdr.de>; Fri,  2 Oct 2020 22:55:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C32Lx52cDzDqRY
	for <lists+openbmc@lfdr.de>; Sat,  3 Oct 2020 06:55:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=754452c4f9=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=qTNKEOsX; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=GnBb+6bC; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C32L33wn4zDqHk
 for <openbmc@lists.ozlabs.org>; Sat,  3 Oct 2020 06:54:29 +1000 (AEST)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 092KsKiB016495; Fri, 2 Oct 2020 13:54:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=B5VQtgxLK33CH5znI7Bi4ne50UaQGCiwoJiBvd9uJSo=;
 b=qTNKEOsX2iVPi4gOpsKABRr7jZkMFLasRCHm0RPwPZ4QGJ21XPuc1Ijwbs6MVn0Z2JyR
 G1lP9Dm7ZtnbrJMq5+Gx1G7ABcTGQSFfXPYaK0J9DsSeN5HuxEzy+iQVp1q1nhdoAIlU
 mcb4IJmx2sYoK8sel3s6y2SnsvbjXzMsLSA= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 33x6gu9s1k-17
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 02 Oct 2020 13:54:24 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.175) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 2 Oct 2020 13:54:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AaABIU/xgqlShLfh/fpdvqeboq1aceOPmYPWEug88/QgZlTNmEFz9wFZyqTCScEW4i9LJgXMHxIBGe+rIXgbPn9nptLPJAS3Sz0itCNy2WUAyT5YBmtuXhT9cNERi2aO1jkNTu5hP3QrGrG09O1igM2YHcxURGFG1NzUHqLWoeqCh7p1RrSQ9Njc1Vh4ftGnFzwsU7+TF9qi6tc2ldWsOzw7ybfeRdbuZfFZq7wQL3b5BATGsyyg0iDqm1rBQSrJLnzQyOjlm7fohn3otIxxIF4eLk1ykTfUBgc1KGab4szPnKoHQtlxsFXkH8l1XQWLrgC6VSdQ6xpL5aGcCLNvYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5VQtgxLK33CH5znI7Bi4ne50UaQGCiwoJiBvd9uJSo=;
 b=ZLhiBwOnMjlswhKVJrr0L6skCmbTXqMvCGP/PgNLR6uoInnbN2uPQX1cEH8YgrV/L53CDMBLjr6oL1fa4612cXS+T61vAMauzoEKd0tPFHMf+9onxFbX4qxHiUAt0poM26EcLsI469JDPNbVHk56J7desWQl0956G+53I5EKTV15PDEqQ9pfI+PC1TQpGcYPLqcRtq3Lyd80wwkWIf4lsr4HY+D31sdu4W20q792auMdvQLs6pbPZIy8Po2UjsnWKUOZ7cFtZ1d1JHQLFLo9so1x4p4uhEy4A00mq2XQnigI3VuBFjp+WWGy9ENRSwYNptGuNOyn/nygag8dgLQgJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5VQtgxLK33CH5znI7Bi4ne50UaQGCiwoJiBvd9uJSo=;
 b=GnBb+6bCfP+8T/tVlZ26a54oWVrsTqPHmBfuRzCBDwenLvEy32PebDrCUWly/lJPiJIEM0JA0oml4k2QygkgdC9WjhQQT/ege3tLc3O4rcsyEgRv52HzCgLlyLwmGdYBnKOPdD1xwX7z9qkqKNpx5YbKvLPmg/dJZx8iuIjlFqY=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2823.namprd15.prod.outlook.com (2603:10b6:a03:15a::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.28; Fri, 2 Oct
 2020 20:54:15 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4%7]) with mapi id 15.20.3412.029; Fri, 2 Oct 2020
 20:54:15 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Sui Chen <suichen@google.com>
Subject: Re: Request to create repository google-ipmi-bmc-health
Thread-Topic: Request to create repository google-ipmi-bmc-health
Thread-Index: AQHWlz6Q/XqpUMkh00OhuoNUmWav8qmCp84AgADnEgCAAMmpAA==
Date: Fri, 2 Oct 2020 20:54:14 +0000
Message-ID: <EF663847-4E98-4AC2-8A8C-E37B853C131F@fb.com>
References: <CAJOps0sd-YFr5P+_N0i78pd9akBJS6DP99wugKvUDOGpXw2pcA@mail.gmail.com>
 <D355FA68-E163-4DA8-861E-7E9DB68F5EEB@fb.com>
 <CAJOps0uX9K25NgXpi3M45F=pvvW5Am+9R=wYTLN0SZ2vPUcX-A@mail.gmail.com>
In-Reply-To: <CAJOps0uX9K25NgXpi3M45F=pvvW5Am+9R=wYTLN0SZ2vPUcX-A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:80d8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 255bd51a-239b-4549-b7d5-08d867155293
x-ms-traffictypediagnostic: BYAPR15MB2823:
x-microsoft-antispam-prvs: <BYAPR15MB28238ED3D6E63D0D0C2088FBDD310@BYAPR15MB2823.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EsenCqpalOyn1L5x1roG+MxPdMJkIhczfiswNHBn7nWypTxDZeMr4G301dR4gIq+/6tiU/EARchmzRYXWPuE1YBT45Rnqwl+GHJDwamtmOo3lBAauN0SuQ/mvDFDVFFlqBMqT/1rTFNfMORAKSaTV093lXplAWjZVOCzRAy6OZsJEdFqIj4kmFztDX4i7akpond8b/0AfmGowJJudOgHut8OuhGYcPxpOl9afnFJY7Dqz4Bc6+QfIuqd2K0G1+C/4X+Bs2cRmItL3872FnTmooQMcGe/d5LWa/tuGPL7aKNiE49Gdb7B6d0QPqzA90zwg0EA6gGLi72X4NYCgfhUN0E+y6L7m8UwPdbTPynwlRjLRGDnia3E/I9+BvW3EaMGqvgDDCDFuya5MnV0MjYYerL8xrC5ih37iH2U1c50ZnQ7NhxNPYEpEOA9EsNDo+F0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(39860400002)(366004)(346002)(136003)(8936002)(8676002)(71200400001)(2616005)(2906002)(6512007)(36756003)(186003)(66476007)(478600001)(33656002)(86362001)(6486002)(316002)(6916009)(83380400001)(53546011)(66446008)(4326008)(5660300002)(66556008)(64756008)(6506007)(76116006)(966005)(66946007)(91956017);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: bsmLK86Y2H6pdcrc2DpnYs0AVds0wLWniRMNYvag8kbjGo9HOd7r/GhfK1HX3tui7jracJsmQbRu13u961BZXhi5DY7OhZ7M1aN9+B/iMLOGj+1+yd4wKPRkpX+4sdzw+7RkyYvg+G9i911CIOmaVnS3+3Rr+141kbHYip2fpRDeVP8VkbtcwicuVN1XAAP1xM4v7y2ZsnZUdUbL5NFjhgBjS2ONAi40j+42a9ATqHJ0w25y++EmSIe4TiNJzdahXzWYByOs4PRaGp1kaE5CG7c0q9xaFvSR3m8gnpK/GbpSF0Lx/Q11Kjja5sEFGNjemTrrOR9PuZ2++bNqD8LsziJ2FVpAlmMBG1UPt6pGm/3LjVxrqyfX7wEmzlVmMb0QV7qp08R8r3TZ5QkZQb9MpAKq446em3ePNFjEGe/eDyot7XFkNXHQbr/TcsqbxsamcErk34JZcfRvgloX3cGv0B+VRAU1jQk9mA0Pux+aFOOEhVy4InTb4ptnfcNoUdzIUKx98nPewtfTzLlfLsh40VZu+kJgO5SawmB4/Q7+Fks6XYmXTpwymMzpe2K1wsbt6o730Mne9UdT6/yIVd8xojCoM7slhtJ9BJ+/s7rAVHGpevKgYUprzAk2eLcBTc4vFcZojqrkOsR+UA5uN7hHZ74yj1Aa9fuO/hHqOCjarXwJRHF396JOp9NWgVqsHKTk
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <405D518F269ECC49BC68C2F3DA80357F@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 255bd51a-239b-4549-b7d5-08d867155293
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2020 20:54:14.9632 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bKz+9/kh/4WPtUti2JMXp+O2ao8QMBpEwQ7tR6SPyVp0fAHwmSvSFT9A8LVLKQBFWfHbiWSDVd9BPV0QM7sDIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2823
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-02_14:2020-10-02,
 2020-10-02 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2010020154
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

SGkgU3VpLA0KDQrvu79PbiAxMC8xLzIwLCA2OjUyIFBNLCAiU3VpIENoZW4iIDxzdWljaGVuQGdv
b2dsZS5jb20+IHdyb3RlOg0KDQogICAgSGkgVmlqYXksDQoNCiAgICBXZSBjYW4gdXNlIHdoYXRl
dmVyIG1lYW5zIHRoYXQgZ2V0cyBoZWFsdGggbW9uaXRvcmluZyBkb25lLg0KICAgIEkgaGF2ZSB0
aGUgZm9sbG93aW5nIHF1ZXN0aW9ucyBvbiBob3cgdG8gbWVyZ2UgdGhlIHByb3Bvc2VkIElQTUkN
CiAgICBCbG9iLWJhc2VkIGltcGxlbWVudGF0aW9uLCBnb29nbGUtaXBtaS1ibWMtaGVhbHRoIChy
ZWZlcnJlZCB0byBhcw0KICAgICJJUE1JIGhlYWx0aCBibG9iIikgd2l0aCBwaG9zcGhvci1oZWFs
dGgtbW9uaXRvci4gVGhlIGludGVudCBvZiBoYXZpbmcNCiAgICBhIHNlcGFyYXRlICJnb29nbGUt
aXBtaS1ibWMtaGVhbHRoIiB3YXMgdG8gYXZvaWQgdGhlc2UgcXVlc3Rpb25zOg0KDQogICAgMSkg
VGhlIElQTUkgaGVhbHRoIGJsb2IgaXMgYSBsaWJyYXJ5LCBub3QgYSBkYWVtb24sIHNvIGFmdGVy
IHRoZSBJUE1JDQogICAgaGVhbHRoIGJsb2IgaXMgYWRkZWQsIHBob3NwaG9yLWhlYWx0aC1tb25p
dG9yIHdpbGwgaGF2ZSBib3RoIGEgbGlicmFyeQ0KICAgIGFuZCBhIGRhZW1vbi4gVGhlIHVzZXIg
bmVlZHMgdG8gaGF2ZSBhIHdheSB0byBjb25maWd1cmUgaXQuIFdoYXQgaXMNCiAgICB0aGUgcmVj
b21tZW5kZWQgd2F5IG9mIGRvaW5nIHRoaXMgY29uZmlndXJhdGlvbj8NCg0KWWVzIHRoZSBzYW1l
IHJlcG8gY2FuIGdlbmVyYXRlIGxpYnJhcnkgYXMgd2VsbCBhcyBkYWVtb24uIEN1cnJlbnRseSBp
dCBpcw0KY29uZmlndXJpbmcgMiBtZXRyaWNzIGNwdSBhbmQgbWVtb3J5LCB3ZSBjYW4gYWRkIGFu
b3RoZXIgZW50cnkgbGlrZQ0KSVBNSSBibG9iIGFuZCBpZiBpdCBpcyB0aGVyZSB0aGVuIG9ubHkg
aXQgd2lsbCBidWlsZCBpcG1pIGJsb2JzLg0KDQogICAgMikgV2UgYXJlIHNlbmRpbmcgYSBwcm90
b2NvbCBidWZmZXIgdGhyb3VnaCB0aGUgSVBNSSBpbnRlcmZhY2UgdG8gdGhlDQogICAgQk1DLCBh
bmQgdGhlIHByb3RvY29sIGJ1ZmZlciBtYXkgYmUgb25seSB1c2VkIGZvciB0aGUgSVBNSSBwYXRo
IGFuZA0KICAgIG5vdCBhbnl3aGVyZSBlbHNlLiBXb3VsZCB0aGVyZSBiZSBhbnkgY29uY2VybnMg
b24gdGhlIHVzYWdlIG9mIGENCiAgICBwcm90b2NvbCBidWZmZXIgaGVyZT8NCg0KSWYgSSB1bmRl
cnN0YW5kIGNvcnJlY3RseSwgcHJvdG9jb2wgYnVmZmVyIHdpbGwgYmUgdXNlZCBieSBkYWVtb24g
d2hvDQpJcyByZXNwb25kaW5nIHRvIHRoZSBJUE1JIHJlcXVlc3QgYW5kIGNvbm5lY3RpbmcgdG8g
dGhpcyBkYWVtb24gdmlhDQpsaWJyYXJ5IGNhbGwsIHRoZW4gaXQgaXMgY29tcGxldGVseSByZXN0
cmljdGVkIGZvciB0aGUgdXNlIG9mIHByb3RvY29sIGJ1ZmZlci4NCklmIHlvdSBhcmUgcGFzc2lu
ZyBwcm90b2NvbCBidWZmZXIgdG8gdGhpcyBkYWVtb24gdGhlbiB3ZSBoYXZlIHRvIGRlZmluZQ0K
c29tZSBwb2xpY3kgaGVyZS4gDQoNCiAgICBPdGhlciB0aGFuIHRoZXNlIHR3byB0aGluZ3MgSSB0
aGluayBhZGRpbmcgbmV3IG1ldHJpY3MgdG8NCiAgICBwaG9zcGhvci1oZWFsdGgtbW9uaXRvciBz
aG91bGQgYmUgbWFuYWdlYWJsZS4gSSBjYW4gc3RhcnQgYnkgdHJ5aW5nIHRvDQogICAgYWRkIHRo
ZSBJUE1JIGJsb2IgaGFuZGxlciB0byBwaG9zcGhvci1oZWFsdGgtbW9uaXRvcjsgbXkgZmlyc3Qg
YXR0ZW1wdA0KICAgIG1pZ2h0IG5vdCBsb29rIHZlcnkgZWxlZ2FudCwgYnV0IGlmIHdlIGZpbmQg
YW5zd2VycyB0byB0aGUgdHdvDQogICAgcXVlc3Rpb25zIGFib3ZlLCB0aGUgbWVyZ2VkIHJlc3Vs
dCB3aWxsIGxvb2sgYSBsb3QgYmV0dGVyLiBIb3BlZnVsbHkNCiAgICB3ZSBjYW4gZmluZCBhIHNv
bHV0aW9uIHRoYXQgd29ya3Mgd2VsbCBmb3IgZXZlcnlvbmUuDQoNCkkgYW0gbG9va2luZyBmb3J3
YXJkIHRvIHlvdXIgcGF0Y2hlcw0KDQogICAgVGhhbmtzLA0KICAgIFN1aQ0KDQogICAgT24gVGh1
LCBPY3QgMSwgMjAyMCBhdCAxMjowNiBQTSBWaWpheSBLaGVta2EgPHZpamF5a2hlbWthQGZiLmNv
bT4gd3JvdGU6DQogICAgPg0KICAgID4gSGkgU3VpLA0KICAgID4NCiAgICA+IE9uIDkvMzAvMjAs
IDg6MzAgQU0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBTdWkgQ2hlbiIgPG9wZW5ibWMtYm91bmNl
cyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMub3psYWJzLm9yZyBvbiBiZWhhbGYgb2Ygc3VpY2hl
bkBnb29nbGUuY29tPiB3cm90ZToNCiAgICA+DQogICAgPiAgICAgSGVsbG8gT3BlbkJNQyBjb21t
dW5pdHksDQogICAgPg0KICAgID4gICAgIFdlIGFyZSB3b3JraW5nIG9uIGFuIElQTUkgYmxvYi1i
YXNlZCBpbXBsZW1lbnRhdGlvbiBvZiBCTUMgaGVhbHRoDQogICAgPiAgICAgbW9uaXRvcmluZy4g
V2UgY3VycmVudGx5IGhhdmUgYW4gaW50ZXJuYWwgd29ya2luZyBwcm90b3R5cGUgdmVyc2lvbg0K
ICAgID4gICAgIGFuZCB3b3VsZCBsaWtlIHRvIHVwbG9hZCBpdCB0byB0aGlzIG5ld2x5IHByb3Bv
c2VkIHJlcG9zaXRvcnksDQogICAgPiAgICAgb3BlbmJtYy9nb29nbGUtaXBtaS1ibWMtaGVhbHRo
IC4NCiAgICA+DQogICAgPiBJbiBteSBvcGluaW9uLCB3ZSBjYW4gZW5oYW5jZSBleGlzdGluZyBo
ZWFsdGgtbW9uaXRvciBhbmQgYWRkIHlvdXIgZmVhdHVyZXMuDQogICAgPg0KICAgID4gICAgIFdl
IGFyZSBhd2FyZSBvZiBleGlzdGluZyBCTUMgaGVhbHRoIG1vbml0b3JpbmcgZGVzaWducyBzdWNo
IGFzOg0KICAgID4gICAgIDEuIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bob3NwaG9yLWhl
YWx0aC1tb25pdG9yIGFuZCBpdHMNCiAgICA+ICAgICBkb2N1bWVudGF0aW9uIGh0dHBzOi8vdXJs
ZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwcy0zQV9fZ2Vycml0Lm9wZW5ibWMt
MkRwcm9qZWN0Lnh5el9jX29wZW5ibWNfZG9jc18tMkJfMzE5NTcmZD1Ed0lCYVEmYz01VkQwUlR0
TmxUaDN5Y2Q0MWIzTVV3JnI9djlNVTBLaTlwV25UWENXd2pIUFZncG5DUjgwdlhra2NySWFxVTdV
U2w1ZyZtPVotX1JzdWUxWkhCRF9UZ1B3N0VESWM4ZGg4RThvOGRsVWU4YUtyN0k1VkEmcz1IVEtF
TTh0Y0lnd3p3TDRPUVZQMUtjdmU2WmZuaFNUb2hkd1BtSXJqd2U0JmU9DQogICAgPiAgICAgMi4g
aHR0cHM6Ly91cmxkZWZlbnNlLnByb29mcG9pbnQuY29tL3YyL3VybD91PWh0dHBzLTNBX19nZXJy
aXQub3BlbmJtYy0yRHByb2plY3QueHl6X2Nfb3BlbmJtY19kb2NzXy0yQl8zNDc2NiZkPUR3SUJh
USZjPTVWRDBSVHRObFRoM3ljZDQxYjNNVXcmcj12OU1VMEtpOXBXblRYQ1d3akhQVmdwbkNSODB2
WGtrY3JJYXFVN1VTbDVnJm09Wi1fUnN1ZTFaSEJEX1RnUHc3RURJYzhkaDhFOG84ZGxVZThhS3I3
STVWQSZzPUVjeFNyVTFQQzZBa2Z5MUZSMHdvLTVUQ19Rdk1sZDlTRFQ3cEpBaDVRY00mZT0NCiAg
ICA+DQogICAgPiAgICAgTWFpbiBkaWZmZXJlbmNlcyBiZXR3ZWVuIHRoaXMgaW1wbGVtZW50YXRp
b24gYW5kIGV4aXN0aW5nIG9uZXMgYXJlOg0KICAgID4gICAgIC0gZ29vZ2xlLWlwbWktYm1jLWhl
YWx0aCBpcyBpbXBsZW1lbnRlZCB3aXRoIHRoZSBJUE1JIGJsb2IgaGFuZGxlcg0KICAgID4gICAg
IGZyYW1ld29yayBhbmQgZXhpc3RzIGFzIGFuIElQTUkgYmxvYiBoYW5kbGVyLCB3aGlsZQ0KICAg
ID4gICAgIHBob3NwaG9yLWhlYWx0aC1tb25pdG9yIHJ1bnMgYXMgYSBkYWVtb24gYW5kIGV4cG9z
ZXMgQk1DIGhlYWx0aA0KICAgID4gICAgIG1ldHJpY3Mgb24gREJ1cyBpbiB0aGUgc2FtZSBtYW5u
ZXIgc2Vuc29ycyBhcmUgZXhwb3NlZC4NCiAgICA+DQogICAgPiBJcyB0aGlzIGdvaW5nIHRvIGJl
IGEgbGlicmFyeSBvciBkYWVtb24sIFNhbWUgaGVhbHRoLW1vbml0b3IgZGFlbW9uIGNhbg0KICAg
ID4gQmUgZW5oYW5jZWQgdG8gYWRkIHRoZXNlIGZ1bmN0aW9uYWxpdGllcy4NCiAgICA+DQogICAg
PiAgICAgLSBUaGlzIGltcGxlbWVudGF0aW9uIGRvZXMgbm90IGNoZWNrIGhlYWx0aCBtZXRyaWMg
dmFsdWVzIGFnYWluc3QNCiAgICA+ICAgICB0aHJlc2hvbGRzIG9yIHBlcmZvcm0gYWN0aW9ucyB3
aGVuIHRocmVzaG9sZHMgYXJlIGNyb3NzZWQuDQogICAgPg0KICAgID4gSWYgeW91IGRvbid0IGRl
ZmluZSB0aHJlc2hvbGQgaW4gY29uZmlndXJhdGlvbiBmaWxlLCBoZWFsdGgtbW9uaXRvciB3aWxs
DQogICAgPiBhbHNvIG5vdCBtb25pdG9yIG1ldHJpY3MgZGVmaW5lZC4NCiAgICA+DQogICAgPiAg
ICAgLSBUaGlzIGltcGxlbWVudGF0aW9uIGN1cnJlbnRseSByZXBvcnRzIHVwdGltZSwgbWVtb3J5
IHVzYWdlLCBmcmVlDQogICAgPiAgICAgZGlzayBzcGFjZSwgQ1BVIHRpbWUgY29uc3VtZWQgYnkg
cHJvY2Vzc2VzLCBhbmQgZmlsZSBkZXNjcmlwdG9yIHN0YXRzLg0KICAgID4NCiAgICA+IFNhbWUg
Y2FuIGJlIGFkZGVkIGFzIGV4dHJhIG1ldHJpY3MuIFRoYXQgd2FzIHRoZSBnb2FsIG9mIHRoaXMg
cmVwbyBhcyB0bw0KICAgID4gc3RhcnQgd2l0aCBiYXNpYyBtZXRyaWNzIGFuZCBhZGQgbW9yZSBh
cyByZXF1aXJlZC4NCiAgICA+DQogICAgPiAgICAgLSBUaGlzIGltcGxlbWVudGF0aW9uIGRvZXMg
bm90IHJlYWQgYSBjb25maWd1cmF0aW9uIGZpbGUgeWV0LiBJdA0KICAgID4gICAgIGFsd2F5cyBy
ZWFkcyB0aGUgaGFyZC1jb2RlZCBzZXQgb2YgaGVhbHRoIG1ldHJpY3MgbGlzdGVkIGFib3ZlLg0K
ICAgID4NCiAgICA+IFdlIGNhbiBlbmFibGUgb3IgZGlzYWJsZSBjZXJ0YWluIG1ldHJpY3MgdGhy
b3VnaCB0aGlzIGNvbmZpZ3VyYXRpb24gZmlsZS4NCiAgICA+DQogICAgPiAgICAgLSBUaGlzIGlt
cGxlbWVudGF0aW9uIGRvZXMgbm90IHBvc3QtcHJvY2VzcyBzZW5zb3IgcmVhZGluZ3Mgc3VjaCBh
cw0KICAgID4gICAgIGNvbXB1dGUgdGhlIGF2ZXJhZ2UgQ1BVIHVzYWdlIG92ZXIgYSBjZXJ0YWlu
IHRpbWUgd2luZG93Lg0KICAgID4NCiAgICA+IFdpbmRvdyBzaXplIDEgY2FuIGdpdmUgbGF0ZXN0
IGRhdGEgcmF0aGVyIHRoYW4gYXZlcmFnZWQgZGF0YS4NCiAgICA+DQogICAgPiAgICAgQXMgc3Vj
aCwgdGhpcyBpbXBsZW1lbnRhdGlvbiBkaWZmZXJzIGVub3VnaCBmcm9tIGV4aXN0aW5nIG9uZXMg
c3VjaA0KICAgID4gICAgIHRoYXQgd2UgYmVsaWV2ZSB3ZSBoYXZlIGVub3VnaCByZWFzb25zIHRv
IGhhdmUgYSBzZXBhcmF0ZSByZXBvc2l0b3J5DQogICAgPiAgICAgZm9yIGl0Lg0KICAgID4NCiAg
ICA+IEkgd2lsbCBzdHJvbmdseSBwcmVmZXIgdG8gYWRkIGFsbCBvZiB0aGUgZmVhdHVyZXMgaW4g
dGhlIGV4aXN0aW5nIHJlcG8uDQogICAgPg0KICAgID4gICAgIFRoYW5rcyENCiAgICA+DQoNCg==
