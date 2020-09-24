Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 38408276604
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 03:49:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxdHz43fXzDqTC
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 11:49:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=6536d4a058=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=iEk+tG10; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=c8To11w1; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxdH537mqzDqSs
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 11:48:15 +1000 (AEST)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08O1j2bK025952; Wed, 23 Sep 2020 18:48:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=VBjgKkrlY1CJMCe+DdXCYas/QnkhMBhJ0twKdBfay4g=;
 b=iEk+tG10aREd3V4U0Of8sghblHJlS/5vCWGubcNe0BJDoHtlKvHBPAvfC7TramQOidfO
 H/Su0rvtdYZfQNev2USJHABe1gP2OqkayUa6ACW5y4b6a63qiIfOnxCMt9v86lo7JMCI
 qSDZQnemJIhCFOF//9g36P2MpRBUB+RZ42U= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 33qsp4f4pn-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 23 Sep 2020 18:48:13 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.175) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 23 Sep 2020 18:48:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k8eQO7TzvC4a/zzcgDD/LjHHzq3vTJctbvOA5ZAHNh1OURVSkAMkogXQ8vG19VOFZc0/GDvsITLZGZInPf2TNW6iglVor0RMAXrf6TMCdxj6IojIFFLn4WSLxeH8HinkBb/y6ITZUdRiliV+29jp56OJv/nxNJWh53oFG2d9HECmcKkkRq1L+oqdJ1lAhKKMjuSIZWbNQP6XjFJ4iNPPvbqR1fDN09HnDLjz7k6sSKaHJj5IGkIcAR49gDE4t75VmEnapiGV0ltPhmMrWlHxATSAShgXk1Ood/w6iQ+0Kq5av1B6h2zaHaZORvc7wa0L6GZrFAJtForNpgEdcUUv+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBjgKkrlY1CJMCe+DdXCYas/QnkhMBhJ0twKdBfay4g=;
 b=m5BgLccqY87o7i8Wbx4/55dw4DOQy3YmwzFgxm6RzU/BEKAx+dFPnR8osQJx1ZNJev8ODx/8YRWvxNdNvTQt/4e+P3vtiaCWPB+6vamshsZ1JAZ/bcYGvM8c+GQjW9KwweOZhw+11GA94n1LFsXCsqoZdPk+UIryouNv0l4DUXoUbf+8tDaVa14bW/ZMRgRuyVSc5l9eQSH7B/UopYGbGJneZXwRn2ZB3tlklyJJXAfIPHbrEr0lSKSigXi1s+zZagji+BY3YX3mKzu2xuKtoKgChwJobBQH9ZrLZPbnP2ZzYPcVeG8tWWHy6HaToQeLfqK5OyVhKPmbO+yV+z8vDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBjgKkrlY1CJMCe+DdXCYas/QnkhMBhJ0twKdBfay4g=;
 b=c8To11w14TnX/jDn/iNuLRPswWiasVgBfvK6AxMdiEvah5qVvdaKrKSJl5BXCPGq1yUDwf7A93LWNwXqkMZs4aXznSfeOC/qhWjKjeRL/WuFfh7cPiOykpd09uweEDn0Phbu3QhiN7UihsUgrEtA2vJC7oSoiJzv1/j/MXavMwM=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BY5PR15MB3715.namprd15.prod.outlook.com (2603:10b6:a03:1fe::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Thu, 24 Sep
 2020 01:48:11 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4%7]) with mapi id 15.20.3391.027; Thu, 24 Sep 2020
 01:48:11 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Ed Tanous <ed@tanous.net>, Patrick Williams <patrick@stwcx.xyz>
Subject: Re: Chassis reset
Thread-Topic: Chassis reset
Thread-Index: AQHWjfT7lWI0BIvUr06gDFlShL1iFqlu7CYA//+pggCAAILigIAFf+wAgADJeID//+ZlAIABVkSAgAAEgACAAA8pgIAADjwA///XxAA=
Date: Thu, 24 Sep 2020 01:48:11 +0000
Message-ID: <49D79080-22C7-410C-BE33-E184C689E242@fb.com>
References: <46F3C05C-7CEC-42FD-A9B7-8E55AE56FE3F@fb.com>
 <CACWQX802HpRT20Zj2YFEnVE7XXBOJXx66-8B1E7TEZdCNwPbsQ@mail.gmail.com>
 <9EC0D657-2D58-4544-BA9E-65D3C4148A81@fb.com>
 <CACWQX80SivNLLE3gAUk+Ao=0eHf_ooezumXGmkkkVhVPFyyNSA@mail.gmail.com>
 <C6292DFD-EAF1-4658-85A7-F81941B12D5A@fb.com>
 <CACWQX83GJ9V9--5WGmVjvacYnw2=fr7URhqOcwkSq4C8GpFoiQ@mail.gmail.com>
 <F46D657F-D4DA-49BD-B78D-CDD420768728@fb.com>
 <20200923191051.GR6152@heinlein>
 <CACWQX81tyY1Wo6a8e4hnk3fvinfV-x3ogRK1q1W5cfx28tpfrw@mail.gmail.com>
 <20200923202113.GT6152@heinlein>
 <CACWQX8135vU++ztaVaaKjJyq2C=DdqDti623xGdCeT9fSJDQAA@mail.gmail.com>
In-Reply-To: <CACWQX8135vU++ztaVaaKjJyq2C=DdqDti623xGdCeT9fSJDQAA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: tanous.net; dkim=none (message not signed)
 header.d=none;tanous.net; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:ab1c]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f570b48-1917-4f5e-a1c0-08d8602be4e6
x-ms-traffictypediagnostic: BY5PR15MB3715:
x-microsoft-antispam-prvs: <BY5PR15MB371505C56CB15E4EB628A0DCDD390@BY5PR15MB3715.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CxE6M+rkSEZnl8HNL0IbZV4rpFGYKtmgeVUU+3UNNavh1P2TxzUGr/l6pA/ShQQrErhOKTZ8gwZmL56qwM8bzWi6F83zPh+coMgHjG89RF73/5rGf8dnyJ1D7eYWGgOAivkhuGFb/wYBGmbP9r7Upbe1PLHrk6WpzTUIgGA0iJZzYHxGAnfnw0YKgYHZk5bIfvv1ZEi2LRnxurA4U37O1yhjLYG8Tc8AuIq5EqoeUnCwh9cmyH30EuccFXU8owh5U7YRvAfgg2CkBIAHpSNhha0kFXQCvNjF0zYbdlV26/rO1ecahQ0Pnz0fDQEpNQ1ZFkB907rardAzmfrRX7Gc4g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(39860400002)(396003)(346002)(136003)(86362001)(71200400001)(186003)(110136005)(36756003)(7116003)(316002)(33656002)(6512007)(4326008)(6506007)(3480700007)(53546011)(8936002)(8676002)(2906002)(66556008)(76116006)(64756008)(91956017)(6486002)(5660300002)(66946007)(478600001)(2616005)(66446008)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: /IRr+jU0Ca+7X2my12yMWoiSCPqdCVgIYV60OdT153zOmuNWQiK9l7VKyF7Uhxnyq5aTOcccO7z1ArUwKvJONVBJevfzgQzGHZhwVSP67XkX179o29CzbbwWIItAZxlgJqzIhfUNH28UkDrbV6p2RUJ6oikW7axTF7vrsHan7mpWBfXv34psgf/t3iu2JWgjQgIrt7bYkUH8AJavM5MPWe1+8H7ZbzWug9H9qqJTeYROxLFTf6zFJ0E6LjyPlq0fYWfxW0NBtM5HoKZZdReJXZaY8CZKlB3AFBoR8oYBqzYpeyWSlqzVQe7ul56dejV8O7jhrK7FVwVv2DgT/qQtkqmvXB2JfmYyTUt/7Xh9uRtu5XiRBb9R91DZsGMIpKqRSlX8JizuRlhmYN5XkrOpSX2dPa7V4Y8N56LMRH1mF793YBYM+07wiWM9MejvPaftOepTsUiPqmiB+c/Ok2c/J/WLCSWmCtw0U/yewDadQmMsnmS/v0TbgvfT1mXrxBzV30UjB8gI5EcZ2qE6HOlotUAkqvqiRKU9h0i8CY1e+1uR9J345kAMnOqvS1EvH5Dfar6Ao3NugHxTMPJzbZ89K5aO1nU8/Hi1nrHcL5jPISYWz6kcgjaG7fcoX7UGyaQ0k5XWmDgVz29z+xWLH+dPcwMBaTMqGOLy7/RxQLU5JpcZgKbDTvJ4KvCThkODtvP2
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <5FCFD1E07FF4CD4EA77A32D8747DB5A2@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f570b48-1917-4f5e-a1c0-08d8602be4e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2020 01:48:11.1066 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RBCS6EEmh9/KGUtGYsOJ2iyUGFeevrFIXuloBgSP2dF0RYgvJ+qtjOioAlmZ+vHLfyk33DUARtciuk+oDifc9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3715
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-23_19:2020-09-23,
 2020-09-23 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxscore=0 adultscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009240011
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

DQoNCu+7v09uIDkvMjMvMjAsIDI6MTIgUE0sICJFZCBUYW5vdXMiIDxlZEB0YW5vdXMubmV0PiB3
cm90ZToNCg0KICAgIE9uIFdlZCwgU2VwIDIzLCAyMDIwIGF0IDE6MjEgUE0gUGF0cmljayBXaWxs
aWFtcyA8cGF0cmlja0BzdHdjeC54eXo+IHdyb3RlOg0KICAgID4NCiAgICA+IE9uIFdlZCwgU2Vw
IDIzLCAyMDIwIGF0IDEyOjI2OjU4UE0gLTA3MDAsIEVkIFRhbm91cyB3cm90ZToNCiAgICA+ID4g
T24gV2VkLCBTZXAgMjMsIDIwMjAgYXQgMTI6MTAgUE0gUGF0cmljayBXaWxsaWFtcyA8cGF0cmlj
a0BzdHdjeC54eXo+IHdyb3RlOg0KICAgID4gPiA+DQogICAgPiA+ID4gT24gV2VkLCBTZXAgMjMs
IDIwMjAgYXQgMDU6NDU6NTFBTSArMDAwMCwgVmlqYXkgS2hlbWthIHdyb3RlOg0KICAgID4gPiA+
ID4NCiAgICA+ID4gPiA+IFllcyBJIGhhdmUgMiBjaGFzc2lzIGluc3RhbmNlIHh5ei9vcGVuYm1j
X3Byb2plY3QvY2hhc3NpczAgYW5kIHh5ei9vcGVuYm1jX3Byb2plY3QvY2hhc3Npc19zeXN0ZW0w
Lg0KICAgID4gPiA+ID4gTGF0ZXIgb25lIGlzIHVzZWQgZm9yIEFDIHJlc2V0Lg0KICAgID4gPiA+
DQogICAgPiA+ID4gQ2FuIHdlIGRvIGEgcXVlcnkgdG8gc2VlIGlmICdjaGFzc2lzX3N5c3RlbTAn
IGV4aXN0cyBhbmQgdXNlIGl0IGZpcnN0DQogICAgPiA+ID4gYW5kIHRoZW4gJ2NoYXNzaXMwJyBp
ZiBub3Q/DQogICAgPiA+DQogICAgPiA+IEkgZG9uJ3QgdGhpbmsgaXQncyB0aGF0IHNpbXBsZS4g
IFRoZSB3YXkgdGhlIGRidXMgQVBJcyBhcmUgZGVmaW5lZCwNCiAgICA+ID4gb25lIFJlZGZpc2gg
Y2hhc3NpcyBuZWVkcyB0byBjYWxsIHRoZSBjaGFzc2lzMCBwYXRoLCB0aGUgb3RoZXIgbmVlZHMN
CiAgICA+ID4gdG8gY2FsbCB0aGUgY2hhc3Npc19zeXN0ZW0wIHBhdGguICBXZSdkIG5lZWQgYSB3
YXkgdG8ga2V5IG9mZiB3aGljaA0KICAgID4gPiBvbmUgaXMgd2hpY2guICBJIGhhdmVuJ3Qgc2Vl
biBhbnkgZW50aXR5LW1hbmFnZXIgY29uZmlncyBnZXQgY2hlY2tlZA0KICAgID4gPiBpbiBmb3Ig
YSAibXVsdGlub2RlIGNoYXNzaXMiIGVudGl0eSB0eXBlLCBzbyB3aGF0ZXZlciBpbnRlcmZhY2Ug
d2UgdXNlDQogICAgPiA+IHRvIGRlc2NyaWJlIHRoYXQgd2lsbCBwcm9iYWJseSBiZSB3aGF0IHdl
IG5lZWQgdG8ga2V5IG9mZiB0byBtYWtlIHRoYXQNCiAgICA+ID4gcGF0aCBkaXN0aW5jdGlvbi4N
CiAgICA+DQogICAgPiBJbiBSZWRmaXNoIHRoaXMgd291bGQgYmUgdGhlIHN5c3RlbSBwYXRoIHRo
YXQgbWFwcyB0byBjaGFzc2lzX3N5c3RlbTANCiAgICA+IGFuZCBub3QgdGhlIGNoYXNzaXMgcGF0
aC4gIEluIFJlZGZpc2ggdG9kYXksIGNoYXNzaXMgZG9lc24ndCBkbyBhIHdob2xlDQogICAgPiBs
b3QgZXhjZXB0IGFsbG93IHlvdSB0byBwb3dlciBjeWNsZSB0aGUgaG9zdC4gIE1vc3Qgb2YgdGhl
IGNvbnRyb2wgaXMgaW4NCiAgICA+IFN5c3RlbS4NCg0KICAgIFRoZSB3YXkgVmlqYXkgZGVzY3Jp
YmVzIGl0LCBpdCdzIHJlc2V0dGluZyB0aGUgQ2hhc3NpcyAoaWUsIHJlbW92aW5nDQogICAgcG93
ZXIgZnJvbSB0aGUgYm9hcmQgaXRzZWxmKS4gIFRoZSByZWRmaXNoIFN5c3RlbSByZXNvdXJjZSBp
cyBtZWFudCB0bw0KICAgIG1vZGVsIHRoZSBob3N0LCBhbmQgc2hvdWxkbid0IGJlIHJlc2V0dGlu
ZyB0aGUgQk1DLiAgTWF5YmUgSQ0KICAgIG1pc3VuZGVyc3Rvb2QsIGFuZCB0aGlzIGlzIGFjdHVh
bGx5IGp1c3QgYSBob3N0IHJlc2V0Pw0KDQpZZXMgaXQgaXMgcmVtb3ZpbmcgcG93ZXIgZnJvbSB3
aG9sZSBzeXN0ZW0gYW5kIHJlc3RvcmluZyBiYWNrLiBJdCBpbmNsdWRlcw0KRXZlcnl0aGluZyBp
biB0aGUgc3lzdGVtIGxpa2UgaG9zdCwgYm1jIGFuZCBvdGhlciBkZXZpY2VzIG9uIGJvYXJkLiBX
ZSBjYWxsDQpUaGlzIGFzIHNsZWRfY3ljbGUgbGlrZSB5b3UgcHVsbCBvdXQgY2hhc3NpcyBmcm9t
IHJhY2sgYW5kIHB1c2ggaXQgYmFjay4NCg0KICAgID4gIGNoYXNzaXNfc3lzdGVtMCBjb250cm9s
cyB0aGUNCiAgICA+ICcxMnYgKyA1ViBzdGFuZGJ5IHJhaWxzJyBwYXJ0IG9mIHRoZSBzeXN0ZW0u
ICBJbiBteSBvcGluaW9uLCBpdCBzaG91bGQNCiAgICA+IG9ubHkgYmUgcHJlc2VudCB3aGVuIGEg
c3lzdGVtIGFjdHVhbGx5IGFsbG93cyBtYW5pcHVsYXRpb24gb2YgdGhlDQogICAgPiBzdGFuZGJ5
IHBvd2VyLCBidXQgdGhhdCBpc24ndCBob3cgaXQgaXMgY3VycmVudGx5IGltcGxlbWVudGVkLg0K
DQogICAgU3VyZSwgdGhhdCBzZWVtcyBsaWtlIGEgZmluZSB3YXkgdG8gbW9kZWwgaXQsIGJ1dCB0
aGVuIHdlIG5lZWQgdG8gY29tZQ0KICAgIHVwIHdpdGggYW4gQVBJIHRvICJzdGVlciIgdGhlIFJl
ZGZpc2ggQVBJIHRvIHRoZSByaWdodCByZXNvdXJjZSBzbyB3ZQ0KICAgIGRvbid0IGJyZWFrIGJh
Y2t3YXJkIGNvbXBhdGliaWxpdHkgZm9yIHRoZSB0aGluZ3MgdGhhdCB3b3JrIHRvZGF5Lg0KICAg
IFRoYXQgc2VlbXMgaGFyZGVyLCBhbmQgbW9yZSBlcnJvciBwcm9uZSwgYnV0IGNvdWxkIGNlcnRh
aW5seSBiZQ0KICAgIGRlZmluZWQuICBXaGV0aGVyIHRoYXQgc2hvd3MgdXAgYXMgY2hhc3NpczAs
IG9yIHdlIGp1c3QgcmVkaXJlY3QgdG8NCiAgICBob3N0MCBpZiBjaGFzc2lzMCBkb2Vzbid0IGV4
aXN0IHNlZW1zIGZpbmUgdG8gbWUuDQoNCiAgICBJZiBJIGNhbiBjbGFyaWZ5IHdoYXQgeW91J3Jl
IHByb3Bvc2luZy4NCg0KICAgIGhvc3QwIGNvbnRyb2xzIHRoZSBob3N0Lg0KICAgIGNoYXNzaXMw
IGFsc28gY29udHJvbHMgdGhlIGhvc3QuDQogICAgY2hhc3Npc19zeXN0ZW0wIGNvbnRyb2xzIHRo
ZSBjaGFzc2lzIHBvd2VyIHVuaXQuDQoNCkNvbnRyb2xzIHdob2xlIHN5c3RlbQ0KDQoNCg==
