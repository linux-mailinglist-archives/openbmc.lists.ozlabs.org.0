Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2786F27DB7D
	for <lists+openbmc@lfdr.de>; Wed, 30 Sep 2020 00:15:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C1DGC504gzDqW7
	for <lists+openbmc@lfdr.de>; Wed, 30 Sep 2020 08:14:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=754111bd5d=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=CCTiN1OX; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=A15+dGCz; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C1DFB3SkhzDqTF
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2020 08:14:00 +1000 (AEST)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08TM9hT6028948; Tue, 29 Sep 2020 15:13:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=Uj7vAL7sMSrWIRdIxU+u/iiw/qmbd3kl7x3jXZYBb1I=;
 b=CCTiN1OXzSrhng3JRdxhpaazd6ZXrFc76HKE6UWG9lNwpFEJSKTxa6TVdeXtkcH2GPtW
 nMsuyAKYGYebmz29Gi3f95/7Q+7vVOpS7h5846/y6T1E2Flj1colKDeibwEhakG8Oons
 76yhNE21qmj+tVoFjuC2k5cRAKOf3AoEHt8= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 33t35n7t6q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 29 Sep 2020 15:13:56 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.172) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 29 Sep 2020 15:13:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RR+GkqlYz0VQeo3i+AbBOTd4qdy07LWQiZJg/cuXsaSmne8RlXszaoR+lg5hEcDodWpZ93seGbB8ut0hRIFDI+ivR87SWn4bbIf7Hhb52HZFnKxty5paRlqWwDMs3q6+xxm4UeEMHk/68nWAwLO6vOmbQtjAyu9YVuRUaVuys4YfeCoXtMhptrU8gXSuF+vaVE+TmpF/aLG0UlSRMqOcG/U+c/t+DruPZ35GUkZuyrIMUQJw37Ga9aJVZymQNgzbQf1HoghG39pig076rus1G3hXyvfZhUPAmHrE49in7aFWD5yJAnzGeOoRKvFnlK+GE3obXj4bvvAc+ufz0dj1dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uj7vAL7sMSrWIRdIxU+u/iiw/qmbd3kl7x3jXZYBb1I=;
 b=XcQKWmLnz+itAmzGmGgbUlpL/Xl39s2/hSOogvMN8nPk6EKUmXLvmeOlboO9V8S/kLloDmfq/TUXqbpd0s1sLBVI1DPpOmfYu9seCxy/ELSMJWOMXwwAcx3B119SaoYWXX6kOVLXNSOhcYAbj5y1Uc3H6n7wrRs8UFAiqJvyxKmm6DrrHLxhdbnZ1mtlkDz2lC2X5YjRM+LPQL5URtpiqlYH5bBtMtD5BbsGIUzaCIt8YCNNJ25mhGspOqfDfDRpGDWEf4ttnbAYWN43gUoMmD/TCWEcrfrpI18dtHG/o6KhxLUH+K36TTSB0zbQsAKexNnv8x0TgxXAOAXCirOlfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uj7vAL7sMSrWIRdIxU+u/iiw/qmbd3kl7x3jXZYBb1I=;
 b=A15+dGCzCx+bO1KJKyfTjGPq9nUCDNmFkkww0qu3JJx5uVoEpyNPuJIdqOPKLyDsFxK7SoJSBMDZcaMmzhZFbazK7Jo2tUSMRuSSWMwI2qTNVxZkeSJWPGTWRg6iF9J9YUCtniHzP8zu0R06otUe/GP1INuctrvPWBUGwGv2me8=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.23; Tue, 29 Sep
 2020 22:13:52 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4%7]) with mapi id 15.20.3412.029; Tue, 29 Sep 2020
 22:13:52 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Ed Tanous <ed@tanous.net>
Subject: Re: Chassis reset
Thread-Topic: Chassis reset
Thread-Index: AQHWjfT7lWI0BIvUr06gDFlShL1iFqlu7CYA//+pggCAAILigIAFf+wAgADJeID//+ZlAIABVkSAgAAEgACAAA8pgIAADjwAgAAIgoCAAA2tAP//xMkAAA+IeIABFlS8AA==
Date: Tue, 29 Sep 2020 22:13:52 +0000
Message-ID: <3C833FB0-8B23-4F0D-BA4D-60033CA2557F@fb.com>
References: <CACWQX802HpRT20Zj2YFEnVE7XXBOJXx66-8B1E7TEZdCNwPbsQ@mail.gmail.com>
 <9EC0D657-2D58-4544-BA9E-65D3C4148A81@fb.com>
 <CACWQX80SivNLLE3gAUk+Ao=0eHf_ooezumXGmkkkVhVPFyyNSA@mail.gmail.com>
 <C6292DFD-EAF1-4658-85A7-F81941B12D5A@fb.com>
 <CACWQX83GJ9V9--5WGmVjvacYnw2=fr7URhqOcwkSq4C8GpFoiQ@mail.gmail.com>
 <F46D657F-D4DA-49BD-B78D-CDD420768728@fb.com>
 <20200923191051.GR6152@heinlein>
 <CACWQX81tyY1Wo6a8e4hnk3fvinfV-x3ogRK1q1W5cfx28tpfrw@mail.gmail.com>
 <20200923202113.GT6152@heinlein>
 <CACWQX8135vU++ztaVaaKjJyq2C=DdqDti623xGdCeT9fSJDQAA@mail.gmail.com>
 <20200923214237.GV6152@heinlein>
 <CACWQX82uw_PEWouQ0tu=vKL_Wh_G8t-yUiEQ64RJh=0O=vDSAA@mail.gmail.com>
 <4F207AFD-3CE9-4AA3-B520-34C63041EB55@fb.com>
 <CACWQX831_jv3NXBEjX6mCDgne65ynASgAeNNHUpiOUfME53Swg@mail.gmail.com>
In-Reply-To: <CACWQX831_jv3NXBEjX6mCDgne65ynASgAeNNHUpiOUfME53Swg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: tanous.net; dkim=none (message not signed)
 header.d=none;tanous.net; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:53ec]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8fca441c-40d9-4cac-92de-08d864c4f31c
x-ms-traffictypediagnostic: BYAPR15MB2374:
x-microsoft-antispam-prvs: <BYAPR15MB237480923F400F1C201C8DDFDD320@BYAPR15MB2374.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nowp6G5c5QvTGXFeFV+S+bpbuaV/87BvaL07JRqrqsEd2rAuYsy7mUgJNaBFDRPfYCphBi13E4I+6p7kQcJnpBoSKKMgb9piUCUue6q2yaaEkcMJw71i5pZyDOKFObM8vAg8AJVe5z45Sl5rUtrmWlnF5qw5mYJ9ikXZafy07kuYEzAht3qSbi0bj7YMNf0x1Z1asUiNp2pLflon9TZQImPI+GUju3J7ydtR89pFPhCL4vEljjhEyoCUtNrEb6+yUnxkyKK/OuhaUGmIz0/CDpAYdtczmmCSanUEGBKnLTRv12VMFtaLbr1NisSLU3OXD+FadxctvytoxrapazZmYEbkAugxxbMpcIhvKvWUf7zo7JOl24OT17P10Fv4k/ET
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(396003)(39860400002)(376002)(366004)(54906003)(83380400001)(66446008)(64756008)(66556008)(66476007)(36756003)(6486002)(86362001)(71200400001)(5660300002)(8936002)(4326008)(6512007)(7116003)(6506007)(316002)(6916009)(53546011)(33656002)(3480700007)(186003)(478600001)(8676002)(2616005)(76116006)(91956017)(66946007)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: dd+nZFQNEz4PV662CqAu8qaliiisQlfFJ7FkbJdv1N37wb4K1TnWv9uD1XHM9exZjtHhUxgZxkny8WWb2eWcKY9otno85MEg/uEjhJ5ey34KOF3lJVpdYyqhIbgX3WKqpOT1zf8+RMk8zfTDlzKBnzndxzwdRuyV/JSRxlWI1RWMzESQ/ZyIlDuNAfDDawdOmETwdDOgeB1qKgQlJy7hOmGvm3UlmwbbWepfPRuXp8HXXMIHLR1hs9+H8k/B79hqQHhLO+ScpihgV4jQTy+Qo1iraWVBXS/UiG0UEuSdDxeALBAUfgFaa6xUckH7dqlE5FHAN0E2VOAM6sv770sbRI9PojcYKopthSzpA8rf6KL/w9WAYz3XaksH5sPwb/s7YEv30sCI4eIDsv0Z4OlEdkE3KmrE2Bpo9sWyQZoMuN0v56tXo6hw/5RrvPC8JZl9rNw+FlnVsie3oAGm+hGHYObVqEoq7H5439JFzZk2ZvgxDbbSNhgYz/olzxfX0jLwTq8I/M5ukEiPfgkHZNN6jzftOY7373fTFVtfyyxmRzmf02lnnR7d+aKhdz6ZbPurWGhrPFnIu5wnKKK5UzEPh+oO5On13lcXqsloT2b4t57+uVgOvycZhDMVmAZ+lSrzRs4kIfZRXBpRZcATbQJ3yz/B1IJvm8+cJGpUNDYIkqDLbZtFRo+YoSJNgmfq56vg
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <A10574CEA4409846A805ADB8B48A845A@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fca441c-40d9-4cac-92de-08d864c4f31c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2020 22:13:52.6739 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ot+uuhgKbl0Xk3NlN9bApzGF6niS7rDorTc0KlcgwEce2ZSYWGO5Ex/Toj77W0cruwgN2qH+DELtmjT1Q7TwWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2374
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-29_14:2020-09-29,
 2020-09-29 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxlogscore=999
 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009290191
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

DQoNCu+7v09uIDkvMjMvMjAsIDc6MjQgUE0sICJFZCBUYW5vdXMiIDxlZEB0YW5vdXMubmV0PiB3
cm90ZToNCg0KICAgIE9uIFdlZCwgU2VwIDIzLCAyMDIwIGF0IDY6NTkgUE0gVmlqYXkgS2hlbWth
IDx2aWpheWtoZW1rYUBmYi5jb20+IHdyb3RlOg0KICAgID4NCiAgICA+DQogICAgPiAgICAgPg0K
ICAgID4gICAgID4gSSdtIG5vdCB1bmRlcnN0YW5kaW5nIHdoYXQgeW91IG1lYW4gYnkgImNvbWUg
dXAgd2l0aCBhbiBBUEkgdG8gc3RlZXIgdGhlDQogICAgPiAgICAgPiBSZWRmaXNoLi4uIiAgSSB0
aGluayBldmVyeXRoaW5nIGlzIHNwZWNpZmllZCBoZXJlIGF0IGEgZGJ1cyBsZXZlbC4gIFRoZQ0K
ICAgID4gICAgID4gaXNzdWUgaXMgZmlndXJpbmcgb3V0IHRoZSBhcHByb3ByaWF0ZSBSZWRmaXNo
IG1vZGVsIG9mDQogICAgPiAgICAgPiBDaGFzc2lzL0NvbXB1dGVyU3lzdGVtIG9iamVjdHMgKGFs
b25nIHdpdGggdGhlIGluY2x1ZGVkIFJlc291cmNlLlJlc2V0DQogICAgPiAgICAgPiB0eXBlcyku
ICBUbyBhIGNhc3VhbCByZWFkZXIsIHdobyBoYXNuJ3QgYmVlbiBpbnZvbHZlZCBtdWNoIGluIFJl
ZGZpc2gNCiAgICA+ICAgICA+IGltcGxlbWVudGF0aW9uLCB0aGUgY3VycmVudCBtYXBwaW5nIG9m
IHRoZXNlIFJlc2V0VHlwZXMgc2VlbXMgZmFpcmx5DQogICAgPiAgICAgPiBhcmJpdHJhcnkuDQog
ICAgPg0KICAgID4gICAgIFNvbWUgbWlnaHQgYmUgYXJiaXRyYXJ5LCBidXQgbW9zdCBhcmUgZXhw
bGljaXQgYW5kIGNob3NlbiBvbiBwdXJwb3NlLA0KICAgID4gICAgIGVzcGVjaWFsbHkgaW4gdGhl
IGNhc2Ugb2YgdGhlIFN5c3RlbSBzY2hlbWEuICBUaGUgQ2hhc3NpcyBzY2hlbWEgaXMgYQ0KICAg
ID4gICAgIGxpdHRsZSBtb3JlIGxheCwgYXMgaXQncyBtb3JlIG9mIGEgYmFja3dhcmQgY29tcGF0
aWJpbGl0eSB0aGluZyB0b2RheS4NCiAgICA+ICAgICBJIHRoaW5rIHlvdSAoVmlqYXkpIGFyZSB0
aGUgZmlyc3QgcGVyc29uIHRyeWluZyB0byBtb2RlbCBpdA0KICAgID4gICAgICJwcm9wZXJseSIu
DQogICAgPg0KICAgID4gICAgIFdoYXQgSSBtZWFuIGlzIHRoYXQgdGhlIGN1cnJlbnQgUmVkZmlz
aCBkZWZpbml0aW9uIG9mIENoYXNzaXMgcG9pbnRzDQogICAgPiAgICAgdGhlIFBvd2VyQ3ljbGUg
YWN0aW9uIHRvIGNoYXNzaXMwLiAgVGhhdCBQb3dlckN5Y2xlIGFjdGlvbiBub3cgbmVlZHMNCiAg
ICA+ICAgICB0byBwb2ludCBhdCBtdWx0aXBsZSB0aGluZ3MsIGNoYXNzaXMwIGlmIHdlIGRvbid0
IHN1cHBvcnQgQUMgcmVzZXQsIG9yDQogICAgPiAgICAgY2hhc3Npc19zeXN0ZW0wIGlmIHdlIGRv
LiAgVGhhdCBpcyB0aGUgInN0ZWVyaW5nIiBJIHdhcyByZWZlcnJpbmcgdG8uDQogICAgPg0KICAg
ID4gSG93IGFib3V0IHdlIG1hcCBwb3dlckN5Y2xlIHRvIGNoYXNzaXMwIGFuZCBGb3JjZVJlc3Rh
cnQgdG8gY2hhc3Npc19zeXN0ZW0wDQogICAgPg0KICAgID4NCg0KICAgIEkgd291bGQgbm90IGJl
IGluIGZhdm9yIG9mIHRoaXMuICBUZWNobmljYWxseSB5b3UncmUgaW1wbGVtZW50aW5nIGENCiAg
ICBQb3dlckN5Y2xlIGhlcmUgYXMgeW91J3JlIGN5Y2xpbmcgdGhlIHBvd2VyIHN1cHBsaWVzIG9m
ZiB0aGVuIG9uLiAgQQ0KICAgIEZvcmNlUmVzZXQgd291bGQgYmUgaWYgeW91IGFzc2VydGVkIHNv
bWUga2luZCBvZiByZXNldCBwaW4gdG8gdGhlDQogICAgYm9hcmQsIHdoaWxlIGtlZXBpbmcgdGhl
IHBvd2VyIHN1cHBsaWVzIHVwLCB3aGljaCwgd2hpbGUgdmFsaWQsIGlzIG5vdA0KICAgIHdoYXQg
eW91J3JlIGRvaW5nLg0KDQpJIGFtIGFjdHVhbGx5IGFzc2VydGluZyBhIHBpbiBieSBzZW5kaW5n
IGkyYyBjb21tYW5kIHRvIEhTQyAoSG90IHN3YXAgY29udHJvbGxlcikNCldoaWNoIHJlbW92ZXMg
cG93ZXIgYW5kIHJlc3RvcmVzIGJhY2suDQoNCiAgICBBbHNvLCBpdCB3b3VsZCBtZWFuIHRoYXQg
d2UgaGF2ZSBtdWx0aXBsZSBhY3Rpb25zIHRvIG1haW50YWluDQogICAgZXh0ZXJuYWxseSwgYW5k
IHVzZXJzIHdvdWxkIGhhdmUgbm8gZ3VhcmFudGVlcyBhYm91dCB3aGljaCBvbmVzIGFyZQ0KICAg
IHN1cHBvcnRlZC4gIE1hcHBpbmcgUG93ZXJDeWNsZSB0byB0aGUgYmVzdCBzdXBwb3J0ZWQgbWVj
aGFuaXNtIHdlIGhhdmUNCiAgICBzZWVtcyBsaWtlIHRoZSBiZXN0IHRoaW5nIHRvIGRvIGhlcmUu
DQoNClRoZW4gc2hvdWxkIHdlIG1hcCB0aGlzIGNoYXNzaXMgcG93ZXJjeWNsZSB0byBjaGFzc2lz
X3N5c3RlbTAgaW4gdGhlIGNvZGU/IA0KDQo=
