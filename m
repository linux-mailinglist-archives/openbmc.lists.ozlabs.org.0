Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CC427617C
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 21:56:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxTTT2DhPzDqVJ
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 05:56:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=65350707bb=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=aLfW9MCN; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=SOSRxDGi; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxTSg33mdzDqCk
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 05:56:01 +1000 (AEST)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08NJogmj031215; Wed, 23 Sep 2020 12:55:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=vLEveWoW5s0Qfc2qiRUEdkreNiDNVzRFfoH1LSF3ndk=;
 b=aLfW9MCNlmeHv9sEsU23b5OnkyE/Vi7tlFGhefubYBtkjsolvSx7qz7ODjUDdOtS2NT4
 q2MhF+FA/ZtUQTH68xbgwlBzERZLqwHld2jWYVodiyWlt5bRvoWov4uYAoiXWdHRmFOv
 vSL18vIV4nk3mul19uLjmYUY1yCV7TiRrSA= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 33qsp6nq93-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 23 Sep 2020 12:55:58 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.103) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 23 Sep 2020 12:55:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X8kJ8YnafrRWI8j4vwII/AOMmMeZymMpyTOEZzVfsdq8UIjrjInKdQYdkX+JAbuSmFrculHgkzWLEnXHWReYhRVks48PdnOpdmalVCsVKoRb8gVh7RhHOP+DkJ4SVS+W1Owa3ol4DHdIsaz2AYoOs1RbfS/SetLSldOdarwq9KSLKaaORtBdpQFgeH2Q0H5kA3AQocHN3W9xso8d3smi80ns0+t0jhuiYRWw+fBCAyii/7cY3bvH40QRMp/gtE4yzujFUaQHd7wcMhJDLL5aBBqvqD+AXleYw0WSax9g6WQ1IpbVV+wQMtTNn7qa8nC8MQi81kkv8BgfoER31YuWfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLEveWoW5s0Qfc2qiRUEdkreNiDNVzRFfoH1LSF3ndk=;
 b=JIpIXUG4HG/x1UDJBluZK3/buu3PUjq0gmtr3S8h3zMs/9TNTBhSTByhDGlASIC+Nv0BIfre/ux2iUeLAYQ9wtHe+3B+E2P9xuhe0Da4fgWzLlMWrqVraMS+6lbHCav4XAvAHITgR003I0pHt0K1qQ1PEiagsB8Zg4CfTZ6ft8Or2hxKxLyfD7IkHhzJY1y+wVMANVFWh50alwNroDSHuEaV5DT0ILyKFwsWYN+cpese3i4l60AvV9ARi9ekoWS1bXe8P+8EC1jsha6WUNmtFGP0awk4Poozslbi9cigMdNEuo1VhfJghl07kU0bmff48X+iRe2nMDCV1xd+eKJ5Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLEveWoW5s0Qfc2qiRUEdkreNiDNVzRFfoH1LSF3ndk=;
 b=SOSRxDGiwLWO+FhfDt8ZQwHRffhLwDTU6600QE1nEmi24ZWcHW7xFc1cM2b84hEn2LsTHjzZGWqMycgRXcw07j8v1MZbIYJ49400NsuIwzya8yrZOHAvJVay3lyfEsaXsXYhwY/NOwx5SjjuRcNNi2gVFaByZarWNf97tVLTgRQ=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2246.namprd15.prod.outlook.com (2603:10b6:a02:8d::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Wed, 23 Sep
 2020 19:55:55 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4%7]) with mapi id 15.20.3391.027; Wed, 23 Sep 2020
 19:55:55 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Ed Tanous <ed@tanous.net>, Patrick Williams <patrick@stwcx.xyz>
Subject: Re: Chassis reset
Thread-Topic: Chassis reset
Thread-Index: AQHWjfT7lWI0BIvUr06gDFlShL1iFqlu7CYA//+pggCAAILigIAFf+wAgADJeID//+ZlAIABVkSAgAAEgAD//5K9AA==
Date: Wed, 23 Sep 2020 19:55:54 +0000
Message-ID: <DFDB5C9F-9C02-4A7C-81C7-FDB0170E34F7@fb.com>
References: <46F3C05C-7CEC-42FD-A9B7-8E55AE56FE3F@fb.com>
 <CACWQX802HpRT20Zj2YFEnVE7XXBOJXx66-8B1E7TEZdCNwPbsQ@mail.gmail.com>
 <9EC0D657-2D58-4544-BA9E-65D3C4148A81@fb.com>
 <CACWQX80SivNLLE3gAUk+Ao=0eHf_ooezumXGmkkkVhVPFyyNSA@mail.gmail.com>
 <C6292DFD-EAF1-4658-85A7-F81941B12D5A@fb.com>
 <CACWQX83GJ9V9--5WGmVjvacYnw2=fr7URhqOcwkSq4C8GpFoiQ@mail.gmail.com>
 <F46D657F-D4DA-49BD-B78D-CDD420768728@fb.com>
 <20200923191051.GR6152@heinlein>
 <CACWQX81tyY1Wo6a8e4hnk3fvinfV-x3ogRK1q1W5cfx28tpfrw@mail.gmail.com>
In-Reply-To: <CACWQX81tyY1Wo6a8e4hnk3fvinfV-x3ogRK1q1W5cfx28tpfrw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: tanous.net; dkim=none (message not signed)
 header.d=none;tanous.net; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:4282]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac0f90c2-f4c5-4a84-4037-08d85ffaaeb5
x-ms-traffictypediagnostic: BYAPR15MB2246:
x-microsoft-antispam-prvs: <BYAPR15MB22464E17595B41EB4899323ADD380@BYAPR15MB2246.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K2zCmt68q0Af8SsoZAlf4m09YS+p4Bydg5+igwZ48FhCKzleh5AWjny/fP+5GZI1KRg6YRoWCPqEX2V2Ik/P5tzwkBhzFN5XgAuJci88aPE+8Db55mIIVKTS19Xwe2pxlYl/Cwy+FLNK85uXhuE1iDH7/NmSXvHp1Sr3uP4d673IXpZgVLfH7W+57SGC2LytGsxs+1UlGwOld6xic7C8rUIQG2nXct+Tyr0vjBIY3YPh7F1SuVjoJnXikrOBLAUsGZYJMdDvi0pi7QHy3HgWDZfuRzr53ApyTF+iFTdrM59wCpX0hgsFoGyyYSKMkRAojpspP68qCG7oaKFNYJ8Vow==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(366004)(346002)(39860400002)(396003)(91956017)(6506007)(4326008)(76116006)(8936002)(83380400001)(110136005)(66946007)(5660300002)(3480700007)(6512007)(33656002)(186003)(71200400001)(53546011)(478600001)(2906002)(8676002)(316002)(7116003)(2616005)(6486002)(66446008)(66476007)(86362001)(66556008)(36756003)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: ZDbu2HcMdaZxs8x+loMw7/sgiZ/kzmxIKF3pI1MpwFFBK3bYRDluE5QpBAqqGhdoUU4elwrIAIjtbKi+wFjriKExvVOjsW9oTWZKzAmhiTiAu0UTWuC1acmCZIgJ6NIyLI0OesBomSEzpiSmjpe/kZLs9QJGBSP0e+roYso/Pr4FNh+/bpY+TdEVHwkIu4fukqHAyyjSrTq/ZraOCQwbVMhlFypEQrZGUJNsZDmRQBbw4j/imUEE90DhFuV3enHLmsYL1bpA+KQ5IPx/idUmLwm5/bJbCbQx2Zx9R3ZzkREsquniTWPjolaZKLwguyMpi1BvYu4QxalZfpxQ4QmB/tF4E6RGCtVFJRS3eK3sqZ/pZ496CDCbRgrA1pq4wqm4cRnKcpplskgrRU4OIP0fx6hHrdHFC4udAcLS/isw1Zqsz8BwJ4x5rBW2YVGIMOxR2jUpy3ueKxB3Mx7pn8mFCHGVAHsRzxdDM8sWL+EtrysBum21hi6pxksEq4qhtj1E1RW2ZxUsMu4RyqvuJlELG0Sz3IQ+4FFCknWpVWrXNgEel2o3q/QmnpA4u2u1R3rrzmU8UJIBUH30WUeUQNc/bzmKOCOFNGtpWaft1WzVHb3wN0HG187OCckICqQBbt2PwiATLuhebFsZTOXHOsuJav9u+Ep9D5qcsQFTO1eqfyJmg0EZRicnDL80CDVmxXHJ
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <D841B2485060E040984E720100624EE8@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac0f90c2-f4c5-4a84-4037-08d85ffaaeb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2020 19:55:54.9072 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UJY9WyG1uYLZ27/OrvSV6dj6QBe3kxFyQ8CTF/cV94sl0PgJcKcwuDNMQjcGggXKZ/6Krnkrc6spi4H49qWk/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2246
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-23_16:2020-09-23,
 2020-09-23 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 adultscore=0 mlxscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009230148
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

DQoNCu+7v09uIDkvMjMvMjAsIDEyOjI3IFBNLCAiRWQgVGFub3VzIiA8ZWRAdGFub3VzLm5ldD4g
d3JvdGU6DQoNCiAgICBPbiBXZWQsIFNlcCAyMywgMjAyMCBhdCAxMjoxMCBQTSBQYXRyaWNrIFdp
bGxpYW1zIDxwYXRyaWNrQHN0d2N4Lnh5ej4gd3JvdGU6DQogICAgPg0KICAgID4gT24gV2VkLCBT
ZXAgMjMsIDIwMjAgYXQgMDU6NDU6NTFBTSArMDAwMCwgVmlqYXkgS2hlbWthIHdyb3RlOg0KICAg
ID4gPg0KICAgID4gPiBZZXMgSSBoYXZlIDIgY2hhc3NpcyBpbnN0YW5jZSB4eXovb3BlbmJtY19w
cm9qZWN0L2NoYXNzaXMwIGFuZCB4eXovb3BlbmJtY19wcm9qZWN0L2NoYXNzaXNfc3lzdGVtMC4N
CiAgICA+ID4gTGF0ZXIgb25lIGlzIHVzZWQgZm9yIEFDIHJlc2V0Lg0KICAgID4NCiAgICA+IENh
biB3ZSBkbyBhIHF1ZXJ5IHRvIHNlZSBpZiAnY2hhc3Npc19zeXN0ZW0wJyBleGlzdHMgYW5kIHVz
ZSBpdCBmaXJzdA0KICAgID4gYW5kIHRoZW4gJ2NoYXNzaXMwJyBpZiBub3Q/DQoNCiAgICBJIGRv
bid0IHRoaW5rIGl0J3MgdGhhdCBzaW1wbGUuICBUaGUgd2F5IHRoZSBkYnVzIEFQSXMgYXJlIGRl
ZmluZWQsDQogICAgb25lIFJlZGZpc2ggY2hhc3NpcyBuZWVkcyB0byBjYWxsIHRoZSBjaGFzc2lz
MCBwYXRoLCB0aGUgb3RoZXIgbmVlZHMNCiAgICB0byBjYWxsIHRoZSBjaGFzc2lzX3N5c3RlbTAg
cGF0aC4gIFdlJ2QgbmVlZCBhIHdheSB0byBrZXkgb2ZmIHdoaWNoDQogICAgb25lIGlzIHdoaWNo
LiAgSSBoYXZlbid0IHNlZW4gYW55IGVudGl0eS1tYW5hZ2VyIGNvbmZpZ3MgZ2V0IGNoZWNrZWQN
CiAgICBpbiBmb3IgYSAibXVsdGlub2RlIGNoYXNzaXMiIGVudGl0eSB0eXBlLCBzbyB3aGF0ZXZl
ciBpbnRlcmZhY2Ugd2UgdXNlDQogICAgdG8gZGVzY3JpYmUgdGhhdCB3aWxsIHByb2JhYmx5IGJl
IHdoYXQgd2UgbmVlZCB0byBrZXkgb2ZmIHRvIG1ha2UgdGhhdA0KICAgIHBhdGggZGlzdGluY3Rp
b24uDQoNCiAgICA+DQogICAgPiBJIHRoaW5rIHdlIG5lZWQgdG8gZG8gc29tZSBlbmhhbmNlbWVu
dCB0byB4ODYtcG93ZXItY29udHJvbCB0aG91Z2ggYWxzbw0KICAgID4gdG8gb25seSBjcmVhdGUg
dGhpcyAnY2hhc3Npc19zeXN0ZW0wJyBvYmplY3QgaWYgY29uZmlndXJlZC4gIEkgYmVsaWV2ZQ0K
ICAgID4gdGhlIGN1cnJlbnQgY29kZSBjaGFuZ2UgeW91IGRpZCBkb2VzIGl0IGFsd2F5cywgZXZl
biBpZiB0aGUNCiAgICA+IHN5c3RlbWQtdGFyZ2V0IGlzIGVtcHR5Lg0KDQogICAgSSBrZWVwIGdl
dHRpbmcgdGhlIGZlZWxpbmcgdGhhdCB4eXovb3BlbmJtY19wcm9qZWN0L2NoYXNzaXNfc3lzdGVt
MCBpcw0KICAgIGp1c3Qgb3ZlcmxvYWRpbmcgd2hhdCAveHl6L29wZW5ibWNfcHJvamVjdC9jaGFz
c2lzMCBpcyBpbnRlbmRlZCB0byBkbywNCiAgICB4ODYtcG93ZXItY29udHJvbCBqdXN0IGhhZCB0
aGF0IGFscmVhZHkgZGVmaW5lZCwgc28gd2Ugd2VudCBhbm90aGVyDQogICAgZGlyZWN0aW9uLiAg
SSB3b25kZXIgaWYgd2UganVzdCBuZWVkIHRvIG1ha2UgdGhlICJDYW4gSSBkbyBhIHJlYWwgQUMN
CiAgICByZXNldCIgY29uZmlndXJhYmxlLCBhbmQgaGF2ZSBpdCBjaGFuZ2UgdGhlIGJlaGF2aW9y
IG9mDQogICAgL3h5ei9vcGVuYm1jX3Byb2plY3QvY2hhc3NpczAgaW4gdGhhdCBjYXNlLg0KDQpX
aGVuIEkgd2FzIGRvaW5nIHRoaXMgcGF0Y2gsIEkgcHJvcG9zZWQgdGhlIHNhbWUgdG8ga2VlcCBj
aGFzc2lzMCBvbmx5IGFuZA0KdGFrZSBhcHByb3ByaWF0ZSBhY3Rpb25zIG9uIGRpZmZlcmVudCBj
b21tYW5kcy4gQnV0IGl0IHdhcyBkZWNpZGVkIHRvIGhhdmUNCmEgc2VwYXJhdGUgaW50ZXJmYWNl
IGZvciBjb21wbGV0ZSBjaGFzc2lzIGFmdGVyIHNldmVyYWwgcm91bmRzIG9mIGRpc2N1c3Npb24u
DQpUaGF0J3Mgd2h5IEkgYWRkZWQgdGhpcyBhbmQgYWxzbyB1cGRhdGVkIHBob3NwaG9yLWRidXMt
aW50ZXJmYWNlIFJFQURNRQ0KZmlsZS4gQGFuZHJldyBhbnkgY29tbWVudHMgaGVyZS4NCg0KICAg
IEFsc28sIEknbGwgcmVpdGVyYXRlIHRoYXQgYSBjaGFzc2lzIHJlc2V0IHJlYWxseSBzaG91bGQg
YmUgZ29pbmcgaW4gYQ0KICAgIHNlcGFyYXRlIHJlcG8vYXBwbGljYXRpb24gZnJvbSB4ODYtcG93
ZXItY29udHJvbC4gIHg4Ni1wb3dlci1jb250cm9sDQogICAgc2hvdWxkIGJlIGZvY3VzZWQgb24g
bWFuYWdpbmcgdGhlIGhvc3QuDQoNCkkgYWdyZWUuDQoNCiAgICA+DQogICAgPiAtLQ0KICAgID4g
UGF0cmljayBXaWxsaWFtcw0KDQo=
