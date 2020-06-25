Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B2420A6F8
	for <lists+openbmc@lfdr.de>; Thu, 25 Jun 2020 22:44:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tBpL1WMQzDqmq
	for <lists+openbmc@lfdr.de>; Fri, 26 Jun 2020 06:44:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.143.35; helo=mx0b-002e3701.pphosted.com;
 envelope-from=prvs=0445c3b92f=jean-marie.verdun@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hpe.com
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com
 [148.163.143.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tBnY3NhtzDqWW
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jun 2020 06:43:57 +1000 (AEST)
Received: from pps.filterd (m0148664.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05PKV077005244; Thu, 25 Jun 2020 20:31:53 GMT
Received: from g9t5009.houston.hpe.com (g9t5009.houston.hpe.com [15.241.48.73])
 by mx0b-002e3701.pphosted.com with ESMTP id 31vn91x7rd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jun 2020 20:31:53 +0000
Received: from G4W9121.americas.hpqcorp.net (g4w9121.houston.hp.com
 [16.210.21.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g9t5009.houston.hpe.com (Postfix) with ESMTPS id 7219B6F;
 Thu, 25 Jun 2020 20:31:52 +0000 (UTC)
Received: from G9W8454.americas.hpqcorp.net (2002:10d8:a104::10d8:a104) by
 G4W9121.americas.hpqcorp.net (2002:10d2:1510::10d2:1510) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Thu, 25 Jun 2020 20:31:18 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (15.241.52.13) by
 G9W8454.americas.hpqcorp.net (16.216.161.4) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Thu, 25 Jun 2020 20:31:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BblYm5M6Qs0YkE03jkgSzf0/XVuYS+nysGV/vhZdQ4eQcJxiChfVY5F1okvaIsYcuB5Tb1QE+GUYFzLUk/+4GwYBoe33VxaUgLAFf+hJkbzSyNANvBKzs4l+yvPcxqZbOccg7oziInXYezy/hF/9LpKeJPFRWUjV1IK/BdyVcp7UdKE1GKKEIeFd8B6WfGJY7VUIAWk0qxcDm2oyqOBQb4yITFuI5JdKvyhNnfULvv7ST1JT2vlzTL6QCsFLSigTHJd1YEdUCPtTSHm5cYSYBW7QkYfVyB0QmNZ9S+K+0zB8WqZqj4a1avUaNVDJAUP0A+SgHlGKMdnPmeqgqxDH2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f5C9R++U+Fbnt++t3N5P2AUw49LSCIVgtV9ev2YEjNM=;
 b=RuDAA7CiJQquHWA+qd4EUbrhLJwQ1YyvWUq+dmUlauscCPWD03S3oCEO5qSBg67Ez9in+ZNGYv7dkDQBcWel4ovJnZsmw+1XaWVp/k2qIUwP7TUrIxULgZzFE/MU9iiREt0py4HMA5L87ux6QrCQvvqp/mKEX1YWbU7wntpPMrh3Fwye4ZhJXvMQ1aKIrH7mCMwu5yndo+GuHbWxIQfqVGll9BamLq2XToSffaRwfHPCvYTWX85b1N4QD+MoKwRQEUzpqPO7TuOhcftV59vuKJ9CkJr1AxArdHy0sQR/0V4lMMx/zsCVgNrg03YxfvoLm09wEMspIGpLYQtmujn5kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from AT5PR8401MB0641.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7423::13) by AT5PR8401MB0498.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:741f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Thu, 25 Jun
 2020 20:31:16 +0000
Received: from AT5PR8401MB0641.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::f8f6:4c42:56e7:1387]) by AT5PR8401MB0641.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::f8f6:4c42:56e7:1387%12]) with mapi id 15.20.3131.021; Thu, 25 Jun
 2020 20:31:16 +0000
From: "Verdun, Jean-Marie" <jean-marie.verdun@hpe.com>
To: Andrew Geissler <geissonator@gmail.com>
Subject: Re: Expanding CI to live testing
Thread-Topic: Expanding CI to live testing
Thread-Index: AQHWSmRbu5SvVkFx3kqvJTpquFeoE6jpyQEA//++TgA=
Date: Thu, 25 Jun 2020 20:31:16 +0000
Message-ID: <A4D7F39A-744B-43C9-8FE5-885228EA94E9@hpe.com>
References: <B50DC7EF-D1F7-4D7F-B502-DEA4EA2A6145@hpe.com>
 <3E8DA024-827D-4D4E-A90C-FC5BFE29910A@gmail.com>
In-Reply-To: <3E8DA024-827D-4D4E-A90C-FC5BFE29910A@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.37.20051002
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=hpe.com;
x-originating-ip: [2601:582:4681:bb70:78ab:4187:8cec:f96a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 893f2d8c-563e-4271-bb52-08d81946b639
x-ms-traffictypediagnostic: AT5PR8401MB0498:
x-microsoft-antispam-prvs: <AT5PR8401MB0498069DC67E4DAAA169367AA7920@AT5PR8401MB0498.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0445A82F82
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LYUDGKNgADSKL05Bko6W+iqZk9naTVNytSqliCYn/T31DjWG3K5N8Jc1lkvRg7dglAOwgBGd/iia5uItWAxeOyIjqYr0GNSSfRnLMOXBoNB7s0++fhFpJ1LuKwk28mFCY9QNJQc2w1ZhZG2MljGRPgcz1gwULMA3ZeMv0YwczSab7tMZXWH3TaHQ3QXzQgJESQjccZBW+UAycld0+Hwu2kuuofwunC82HlPHitS6pbVY22ncni8KLbSlB6vgUN6wwghQ1z0+BaRLkODLAT1b8uEEKX6Sz3gS2BxsEqFt25UwddxwkBPQTYP7dSSbda3+YhFH8mYcKa18Uvo88WC52W7WKw1PlRBe/6VUFGiFPfF3vbWoD2RVDVSlzf41SR840F0NLT6ZjhOy/If+4Vn0Sg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AT5PR8401MB0641.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(39860400002)(346002)(136003)(396003)(376002)(6486002)(2616005)(6512007)(8676002)(86362001)(36756003)(53546011)(6506007)(186003)(33656002)(4326008)(8936002)(478600001)(316002)(5660300002)(966005)(66476007)(64756008)(2906002)(71200400001)(6916009)(76116006)(66556008)(66946007)(66446008)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: luCyBKS6vL0/ONYWnf21N6IiH1EJ/VlmCc+6pSZMHntLE6xxw7p8h2Atn7y7PY1AasUq5ZoHtVcRcyVUWUge65lRRSSc5zShsWJm7Fm3d/dsJXWfAimdfXibBrE7iBatlfqS2MkdoMD8fPM4cXucn2aesIXVw3sbVNjSJxQ4HtQkhz0lBFRfZBpWErQyTHiAdi9LfM0yvcJhFNHhwD8RZwKShAWznN/6y8EwgpvrsUKr3bFBYsQlRFSssiEt2xOtncmog88t0reVrfJZFeRrdG+u5DqAmmSgmYtRYxr0NFSGsHcxT47w8WuIY9Qyw/9zDT5wa6wkYjudhDaEUqsPBqOT3IEENRbe8LJKhJjyxCZDdu/ZQiU6sclbbbcGQJcXIF8HMLYzwCoqBWqUun/GHRILb5L3HAtSWF7LAxjoWtWMIxZYjig2//48qFKnsBXK2C/nnLsQByVotPInsMVXn3xNyYKroRIVP8Lj88UEFEf2QHpyG1Go//gFK/CMLPUzA9RVkBgQOwzFSlbVkhP1JMb/hZt7lOAvDPF6Sp0H+qXn3TomMrnNBo9Oza4cpoZ8
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <77830F83D933D6498A88A714F0FF6516@NAMPRD84.PROD.OUTLOOK.COM>
X-MS-Exchange-CrossTenant-Network-Message-Id: 893f2d8c-563e-4271-bb52-08d81946b639
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2020 20:31:16.6987 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 02zVbkxSDCVMoY4T5a0/1cZRJknCHn3Obph6WePDW26/BQEEvwEKEGbYFQe2FRlogqNSrKPoAGhtgHDidh63vJQGg3p5MnMe9XZvE6qOPwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AT5PR8401MB0498
X-OriginatorOrg: hpe.com
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 2 URL's were un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-25_16:2020-06-25,
 2020-06-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0
 malwarescore=0 adultscore=0 clxscore=1011 cotscore=-2147483648 mlxscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006250120
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

SGkgQW5kcmV3LA0KDQpUaGFua3MgZm9yIHlvdXIgZmVlZGJhY2suIEkgbGlrZSB5b3VyIGFwcHJv
YWNoLCBhbmQgd2lsbCByZXZpZXcgaXQgY2FyZWZ1bGx5LiBNaWdodCBoYXZlIGEgdG9uIG9mIHF1
ZXN0aW9ucyBvciBub3QgKHdobyBrbm93cyksIGJ1dCBJIGhhdGUgdG8gcmUtaW52ZW50IHRoZSB3
aGVlbCB3aGVuIHNvbWV0aGluZyB3b3JrcyBvbiB0aGUgYXV0b21hdGlvbiBzaWRlLg0KDQpEbyB5
b3Ugb2ZmZXIgcHVibGljIGFjY2VzcyB0byBkZWJ1ZyBzeXN0ZW0gb24gdGhlIElCTSBwbGF0Zm9y
bSAobWlnaHQgYmUgZnVuIHRvIGhhdmUgYSBsb29rIHRvIGl0IG9uIGEgcmVhbCBtYWNoaW5lLCBp
dCBtYWtlcyBwcm9iYWJseSAyMCB5ZWFycyB0aGF0IEkgZGlkbid0IGhhZCB0aGUgb3Bwb3J0dW5p
dHkgdG8gdXNlIGEgUG93ZXIgY2hpcCkgPw0KDQpIYXZlIGEgZ3JlYXQgZGF5LA0KDQp2ZWptYXJp
ZQ0KDQrvu79PbiA2LzI1LzIwLCA0OjI2IFBNLCAiQW5kcmV3IEdlaXNzbGVyIiA8Z2Vpc3NvbmF0
b3JAZ21haWwuY29tPiB3cm90ZToNCg0KDQoNCiAgICA+IE9uIEp1biAyNCwgMjAyMCwgYXQgMzox
NiBQTSwgVmVyZHVuLCBKZWFuLU1hcmllIDxqZWFuLW1hcmllLnZlcmR1bkBocGUuY29tPiB3cm90
ZToNCiAgICA+IA0KICAgID4gSGksDQogICAgPiAgDQogICAgPiBBcyBzb21lIG9mIHlvdSBhcmUg
YXdhcmUgSSBhbSB3b3JraW5nIG9uIGEgQ29udGludW91cyBJbnRlZ3JhdGlvbiBzeXN0ZW0gd2hp
Y2ggYWxsb3cgZGV2ZWxvcGVyIHRvIHRlc3QgdGhlaXIgYnVpbGQgb24gYSByZWFsIGhhcmR3YXJl
LiBJIGJ1aWx0IGEgcHJvb2Ygb2YgY29uY2VwdCBiZWZvcmUgd2UgaGFkIHRvIGxvY2tkb3duIG91
ciBIb3VzdG9uIENhbXB1cy4gVGhlIGdvb2QgbmV3cyBpcyB0aGF0IGl0IHN0YXJ0cyB0byB3b3Jr
LCBhbmQgSSBhbSB1c2luZyBpdCBleHRlbnNpdmVseSB0byB3b3JrIG9uIGxpbnV4Ym9vdCAoaXQg
aXMgYXZhaWxhYmxlIGhlcmU6IGh0dHBzOi8vb3NmY2kudGVjaCApLiBTbyB3aGF0IGNhbiBJIGRv
ID8NCg0KICAgIEhpIEplYW4tTWFyaWUsIHdlbGNvbWUgdG8gT3BlbkJNQy4gTXkgbmFtZSBpcyBB
bmRyZXcgYW5kIEnigJltIGludm9sdmVkIHdpdGggYSBsb3Qgb2Ygb3VyIE9wZW5CTUMgQ0kgZWZm
b3J0cy4NCg0KICAgID4gIA0KICAgID4gTXkgc2Vjb25kYXJ5IGdvYWwgaXMgdG8gYXV0b21hdGl6
ZSBsaXZlIHRlc3Rpbmcgb24gcmVhbCBoYXJkd2FyZSBhbmQgcHJvYmFibHkgaW50ZXJmYWNlIHRo
ZSBDVFJMIHBvb2wgdG8gYSBSb2JvdCBzZXJ2ZXIgKCBodHRwczovL3JvYm90ZnJhbWV3b3JrLm9y
Zy8gKS4gVGhpcyBwYXJ0IHN0aWxsIG5lZWQgdG8gYmUgZGV2ZWxvcGVkLCBhbmQgdGhlIGN1cnJl
bnQgQVBJIGhhcyB0aGUgYmFzaWMgY29kaW5nIHRvIHN1cHBvcnQgaXQsIGJ1dCBzZXJpb3VzbHkg
bmVlZCByZW5hbWluZywgYW5kIGNvbnZlbnRpb24gYnVpbGQgdXAuDQoNCiAgICBUaGVyZSBhcmUg
dHdvIHR5cGVzIG9mIENJIGluIE9wZW5CTUMsIHJlcG9zaXRvcnkgQ0ksIHdoZXJlIHdlIGJ1aWxk
IGFuZCBjb21waWxlIGFuIGluZGl2aWR1YWwgc29mdHdhcmUgYmFzZWQgcmVwb3NpdG9yeSBhbmQg
cnVuIGl04oCZcyB1bml0IHRlc3RzLiBUaGlzIGFsbCBoYXBwZW5zIHdpdGhpbiBhIGRvY2tlciBj
b250YWluZXIgYW5kIGRvZXMgYSB2YXJpZXR5IG9mIG90aGVyIHRlc3RzIGxpa2UgY29kZSBmb3Jt
YXR0aW5nIGFuZCB2YWxncmluZCB0eXBlIGNoZWNrcy4NCg0KICAgIFRoZSBzZWNvbmQgdHlwZSBv
ZiBDSSBpcyB3aGVyZSB3ZSBkbyB0aGUgZnVsbCBiaXRiYWtlIGFuZCBidWlsZCBhIHJlYWwgaW1h
Z2UgdGhhdCBjYW4gYmUgdmVyaWZpZWQgd2l0aGluIFFFTVUgYW5kIG9uIHJlYWwgaGFyZHdhcmUu
IFRoaXMgQ0kgaGFwcGVucyBvbmNlIGEgY2hhbmdlIGhhcyBiZWVuIG1lcmdlZCBpbnRvIGEgc29m
dHdhcmUgcmVwb3NpdG9yeS4gIFRoaXMgQ0kgaXMgYWxzbyBhbGwgZHJpdmVuIGZyb20gd2l0aGlu
IGRvY2tlciBjb250YWluZXJzLiBPdXIgcHVibGljIE9wZW5CTUMgamVua2lucyBidWlsZHMgYSB2
YXJpZXR5IG9mIHN5c3RlbSBjb25maWd1cmF0aW9ucy4gVGhlIHN5c3RlbXMgYnVpbHQgaW4gQ0kg
YXJlIGNob3NlbiBiYXNlZCBvbiBnZXR0aW5nIHRoZSBtb3N0IGNvdmVyYWdlIG9mIG9wZW5ibWMg
Y29kZS4gT25jZSBIUEUgaGFzIGEgc3lzdGVtIGluIHVwc3RyZWFtLCB3ZSBjb3VsZCBkaXNjdXNz
IGFkZGluZyBpdCBpbnRvIG91ciBwdWJsaWMgQ0kuDQoNCiAgICBodHRwczovL2dpdGh1Yi5jb20v
b3BlbmJtYy9vcGVuYm1jL3dpa2kvT3BlbkJNQy1JbmZyYXN0cnVjdHVyZS1Xb3JrZ3JvdXAjaW5m
cmFzdHJ1Y3R1cmUtc2NyaXB0cyBoYXMgYSBzb21ld2hhdCBkYXRlZCBidXQgc3RpbGwgcmVsZXZh
bnQgb3ZlcnZpZXcgb2YgdGhlIHNjcmlwdHMgd2UgdXNlIGZvciBDSSB3aXRoaW4gb3BlbmJtYy4N
Cg0KICAgID4gIA0KICAgID4gTXkgY3VycmVudCBjaGFsbGVuZ2Ugd2l0aCBPcGVuQk1DIGlzIHJl
bGF0ZWQgdG8gYnVpbGQgdGltZSBhbmQgbm90IGNvbXBldGUgd2l0aCB0aGUgZXhpc3RpbmcgaW5m
cmFzdHVjdHVyZSBidXQgbW9yZSBiZWluZyBpbnRlZ3JhdGVkIHRvIGl0LiBJIHRyaWVkIHRvIHVu
ZGVyc3RhbmQgaG93IHdlIHRlc3QgbmV3IHB1bGwgcmVxdWVzdCBhbmQgaXQgbG9va3MgbGlrZSB0
aGF0IHdlIGFyZSB1c2luZyBKZW5raW5zLiBJIGhhdmUgbm8gZXhwZXJpZW5jZSB3aXRoIGl0LCBi
dXQgdGhhdCBpcyBmaW5lIChJIHVzZWQgdHJhdmlzY2kgYW5kIEFwcHZleW9yY2kpLg0KDQogICAg
WWVzLCBpdOKAmXMgYmV0dGVyIHRvIGp1c3QgZ2V0IHRoZSBzeXN0ZW0geW91IG5lZWQgYWRkZWQg
dG8gdGhlIG9wZW5ibWMgdXBzdHJlYW0gQ0kuICBUaGUgd2F5IHdlIGRvIGhhcmR3YXJlIENJIHdp
dGhpbiBJQk0gaXMgdGhlIGZvbGxvd2luZzoNCg0KICAgIC0gV2UgaGF2ZSBvdXIgb3duIEplbmtp
bnMgcnVubmluZyB3aXRoaW4gb3VyIGxhYi4NCiAgICAtIFRoaXMgamVua2lucyBtb25pdG9ycyBm
b3IgdGhlIHVwc3RyZWFtIGplbmtpbnMgdG8gbWFyayBhIGdlcnJpdCBjb21taXQgYXMgVmVyaWZp
ZWQgKGkuZSBpdOKAmXMgcGFzc2VkIGFsbCB1cHN0cmVhbSBDSSkNCiAgICAtIE9uY2UgdGhpcyBv
Y2N1cnMsIHRoZSBkb3duc3RyZWFtIGplbmtpbnMgcnVucyBzb21lIGxvZ2ljIHRvIGZpbmQgdGhl
IGZsYXNoIGltYWdlIGl0IG5lZWRzIGZyb20gdGhlIHVwc3RyZWFtIGplbmtpbnMNCiAgICAtIEl0
IHRoZW4gdXNlcyB0aGUgb3BlbmJtYyByb2JvdCB0ZXN0IGZyYW1ld29yayBzdWl0ZSAoaHR0cHM6
Ly9naXRodWIuY29tL29wZW5ibWMvb3BlbmJtYy10ZXN0LWF1dG9tYXRpb24pIHRvIGZsYXNoIHRo
ZSBpbWFnZSBhbmQgcnVuIGEgc2V0IG9mIHRlc3QgY2FzZXMgb24gb25lIG9mIG91ciBzZXJ2ZXJz
DQogICAgLSBVcG9uIGNvbXBsZXRpb24gb2YgdGhlIGRvd25zdHJlYW0gaGFyZHdhcmUgQ0ksIHRo
ZSBkb3duc3RyZWFtIGplbmtpbnMgd2lsbCBhZGQgYSBjb21tZW50IHRvIHRoZSBnZXJyaXQgcmV2
aWV3IG9uIHdoZXRoZXIgaXQgcGFzc2VkIG9yIGZhaWxlZCANCg0KICAgID4gU28gSSBkbyBoYXZl
IGEgY291cGxlIG9mIHF1ZXN0aW9uczoNCiAgICA+ICANCiAgICA+IAnigKIgRG9lcyB0aGUgSmVu
a2lucyBidWlsZCBjb3VsZCBiZSBtYWRlIGludG8gYSBEb2NrZXIgaW1hZ2Uga25vd2luZyB0aGF0
IG15IGNvbXBpbGUgbm9kZSBydW5zIHVuZGVyIFVidW50dSAoSSBiZWxpZXZlIDE4LjA0KQ0KICAg
ID4gCeKAoiBDb3VsZCB3ZSBmaW5kIGEgd2F5IHdoZW4gb3VyIEplbmtpbnMgY2x1c3RlciBidWls
ZCBpcyBkb25lIHRvIGV4dHJhY3QgdGhlIGJ1aWxkIHJlc3VsdCwgYXV0b21hdGl6ZSB0aGUgdHJh
bnNmZXIgb2YgaXQgdG8gcGVyaGFwcyBhbiBvYmplY3Qgc3RvcmFnZSBwb29sIHdpdGggYSB1bmlx
dWUgVVVJRCBpZGVudGlmaWVyLiBUaGUgY2hhbGxlbmdlIHdpbGwgYmUgdG8gcmV0cmlldmUgdGhh
dCBVVUlEIGludG8gdGhlIGdlcnJpdCBwYWdlLCBvciB0aGUgSmVua2lucyBsb2cuDQogICAgPiAJ
4oCiIElmIHRoZSBidWlsZCBpcyBzdWNjZXNzZnVsLCB0aGUgZW5kIHVzZXIgY291bGQgdXNlIHRo
YXQgdW5pcXVlIFVVSUQgdG8gdGVzdCBvbiBhIGxpdmUgc3lzdGVtLiBUaGUgb3NmY2kgc3lzdGVt
IHdpbGwgdGhlbiBleHRyYWN0IGZyb20gdGhlIG9iamVjdCBzdG9yYWdlIGJhY2tlbmQgdGhlIGJ1
aWxkIHJlc3VsdHMgYW5kIGJvb3RzdHJhcCBpdCBvbiB0aGUgZmlyc3QgQ1RSTCBub2RlIGF2YWls
YWJsZS4NCiAgICA+IAnigKIgVGhlbiBhbiBpbnRlcmFjdGl2ZSBzZXNzaW9uIGNvdWxkIHN0YXJ0
LCBvciB0aGUgcm9ib3QgZnJhbWV3b3JrIHN5c3RlbSBjb3VsZCBoYXZlIGEgbG9vayB0byB0aGUg
cmVzdWx0cyBhbmQgZmVlZGJhY2sgamVua2lucywgb3IgdGhlIGVuZCB1c2VyIA0KDQogICAgSSB0
aGluayBpdCB3b3VsZCBiZSBncmVhdCBpZiB3ZSBjb3VsZCBoYXZlIHlvdXIgaW5mcmFzdHJ1Y3R1
cmUgZm9sbG93IGEgc2ltaWxhciBkZXNpZ24gYXMgbGFpZCBvdXQgYWJvdmUuIEhhdmUgaXQgbW9u
aXRvciBnZXJyaXQgZm9yIHRoZSBWZXJpZnkgdGFncyBhbmQgdGhlbiBraWNrIG9mZiB2YWxpZGF0
aW5nIHRoZSBpbWFnZShzKSBvbiB5b3VyIGNvbGxlY3Rpb24gb2YgaGFyZHdhcmUgYW5kIHJlcG9y
dCBzdGF0dXMgYmFjayB2aWEgYSBjb21tZW50IHRvIHRoZSBnZXJyaXQgcmV2aWV3Lg0KDQogICAg
PiB2ZWptYXJpZQ0KDQoNCg==
