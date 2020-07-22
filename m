Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3B6229920
	for <lists+openbmc@lfdr.de>; Wed, 22 Jul 2020 15:20:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBbgR5JtpzDr6y
	for <lists+openbmc@lfdr.de>; Wed, 22 Jul 2020 23:20:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=4472ae89e1=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=BpJDj+n6; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=P428yZ1f; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBbf60vGpzDr3h
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jul 2020 23:19:19 +1000 (AEST)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06MDEGkN017250; Wed, 22 Jul 2020 06:19:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=HrjkrJWSsVMUWjb9WTFM1IT1R7nmAhGhJf9B020F8pU=;
 b=BpJDj+n6WNs61LR9GBcnvHu3Iw7iQf+Y3AFS/tUHga9110Tv2Hnqgggtlq7oY2XiqXFZ
 NbdcqQtsxC5eZofadTPlqbxqxxDvB6qvKtUwLAJFt4DEQhxZ2VXmzDER0Wzn5VEIk+SB
 CYRZUcOKCYfH7XF0wJCCktAAl7GucyEU4do= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 32embc0hq9-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 22 Jul 2020 06:19:14 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.103) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 22 Jul 2020 06:19:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGeZKs+pyX1dKp+jQcRPcLbEHI3pIHLxa4XzPpJstrAyf6kwq6maYc14PirwH0MU82sU+I5prcXXrTAjstIMA/y/hPGZfMZHQrJc1vjsUDiY7L3NjUHWmdf6d2eMuSWRWto4qgq89Cvy/yTY7v/yIUgKF7O9PyD0huehdmWhYmR/sD8P8PtQ/9FUimHYD6otPooHAOm969qHhp1BDTITKxJbhnI6WYHS6tgmzeqDqnYJNgwJv3kN7YHynLCBsC0C8Luge911EtUZcyECh/OXxHjIBH0NmHurgC/QjqIsLOQQ68UKwZIgYqIm7oHzIUlGNcjCpdQJBtkOUXas1R7opg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HrjkrJWSsVMUWjb9WTFM1IT1R7nmAhGhJf9B020F8pU=;
 b=Ya0Pr0Yy37zlolg1TlZ71MWQWQVs9irNGaCmctmYD/nRK2q/ort3MXpb7rUjtmRQyM5SIcHhxNTj9uywxiCxfoacWG0y9UUPV/zDB+iL85MYzzNt98hm0vFwfLsQKGwP0ssMettcQ2atpALunHZrK2YZx1hhVN9ytc60wQKCrYkRHmUhJHL054OIqcVhCfFwdHVPqowmCXXk67UOCgIUs1KiJp8O/lTNwcNBD6lxCOaq5RoU/gMDHBo27kHxnNWUQXzqTSeyi8JhtCrECzsvtudNQ5MdZFHmfyBj7Q4fyqHQtQ5Pm3q6CoHazs24lKJNkhPeYfZ1YZNqTZ2HDyGrBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HrjkrJWSsVMUWjb9WTFM1IT1R7nmAhGhJf9B020F8pU=;
 b=P428yZ1f/lW9SV3LKVj4wm/96OaSXV9m5o13+9JPsW3kZESb1pGi6luU6qeQ+6xJuhk7JgdOo1EDp2EdUfnDnLtEKvz0dPgowDnGdgRo7hn+euhN249B3i1DQj9qsr4pUEAGf0TZRcxQiAZ1abPmky7ACinQb+q4aQJXOmTSPNE=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB3206.namprd15.prod.outlook.com (2603:10b6:a03:10d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Wed, 22 Jul
 2020 13:19:11 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::2908:ebc2:73a5:45b3]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::2908:ebc2:73a5:45b3%5]) with mapi id 15.20.3195.026; Wed, 22 Jul 2020
 13:19:11 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Patrick Williams <patrick@stwcx.xyz>, Nancy Yuen <yuenn@google.com>
Subject: Re: What do you want in a package manager?
Thread-Topic: What do you want in a package manager?
Thread-Index: AQHWXzTBFYxmSoIEXkC2zUGr1J/dHqkSJZmAgAD8AwA=
Date: Wed, 22 Jul 2020 13:19:10 +0000
Message-ID: <644A20F0-3AA5-4C74-BA7D-28942DC46B4A@fb.com>
References: <CADfYTpGaahSo5oJ5n-Y2TZ=NoF0uh=BcPHkxuDqY4zuek7qrjQ@mail.gmail.com>
 <20200721151711.GK3922@heinlein>
In-Reply-To: <20200721151711.GK3922@heinlein>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: stwcx.xyz; dkim=none (message not signed)
 header.d=none;stwcx.xyz; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2601:647:4b00:fd70:18e2:66b5:5e3d:3d1a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4299052c-0465-4ae7-af2e-08d82e41d26e
x-ms-traffictypediagnostic: BYAPR15MB3206:
x-microsoft-antispam-prvs: <BYAPR15MB3206EADBC580ED6E2C013B96DD790@BYAPR15MB3206.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iY25spFruFhVbDvG5RSIhu7qXlRl0qRLseVTjqGoPvxM4qkZM2buWp9xrR8ke4t880LQoXOEbw+I3o+YBOUg8LWMLQUb5Urjg9zECJ7NWHvvJVZ5rKjykwpH4FCWpe7lgcFeFUft9AkOrf5uhLvXrq0Ggukk456viKw3Hk/1S1MoWTIHzwsjAE5lcVl9TnUmjOy1HA7Papj2QoisOcb7R7nCpDWZ2huFW4wvzJzwv0GBCTEzX9JqsjivdZ9GV9zS7txu2TyJXAlZwxDwedOmlC5E9MuAQ4EH/Z4WbNV7eKBnu4r2PlUGFUWy+s+AgkDJaVBC4rncLIzDXzeBg5tlXAId4YIOVQI/sBJsEt4mysF8jPjgq6yb4bTMcuTxICsmM9vmKsnAHCRHLP1W3I/bY4fFTFvqexX5d21PZXIgnRbAernpSA2yYkEl30Iu/1OSkjvT9WA4380IyJS+3nQgxw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(346002)(366004)(396003)(39860400002)(136003)(66446008)(2616005)(66556008)(966005)(71200400001)(66946007)(66476007)(6506007)(186003)(8936002)(478600001)(6486002)(6512007)(76116006)(36756003)(86362001)(4326008)(64756008)(316002)(110136005)(33656002)(5660300002)(2906002)(83380400001)(8676002)(40963001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: JExLSwT5wqhN3JMkjgNeeBVrdKb5jBNRUZHQJ/1Vo+lvnivjZpz270rvJru1SPZOjKXPqG6P9PsLvf9cYrYRP7yivd1Tqb+qkbFK+uq5PldbFTmavmDdJcNroxC3dt1zLlB+Oti0isf7IInC3srZGkQ+uZ+9XbLXrJgvw1cpVqfxDuStHsY3lr1lDYiG8xRvB+jmBkanIBxbk4xAUqnOmCqrg/cKtE28m4Il7u+tM81Ma5T5bXB57ImNSY5OH5CsHdQX49MIwquoH6I98fy6y4mu9A2m3HEqQrjXpmOfTFx3onsCR0t7LvIXP81bq4PYpOz11EZttPQ4FkkROw27p++j6x+BTyUE4XiBPnOgGaFjRwuDrUyTT3tb6WANob/wjhYhMCQmj2Q3ak4ydtkKBgbub/lGBY7ilfOm47AsvAUc/bZkkNcRjoXsF6tD4wgymv/MJqdNO+FkGEKEx5mifA7aiZ0mAut6g1BhUeMJejlkwP1hjuz27bX8+qxAzqErT39hL4sGoON62pt4d9TpGVW4zFXgugJfPLFJpy9ZE2eC53VJGZ0OLCy1sxi2chX8
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD4DFAEC6FAFBC41BE76A0ABCFDF4AC7@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4299052c-0465-4ae7-af2e-08d82e41d26e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2020 13:19:10.9287 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XgkSSEkQZ/kdZEDDy4mPBVXW8Yugidox+1A7KCsSebiP2+AShEEh3KdW25Gjx/mZcOMCwFAqeDATYvrq9lLUPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3206
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-22_05:2020-07-22,
 2020-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 bulkscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 mlxscore=0 suspectscore=0
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007220097
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

DQoNCu+7v09uIDcvMjEvMjAsIDg6MjMgQU0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBQYXRyaWNr
IFdpbGxpYW1zIiA8b3BlbmJtYy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxh
YnMub3JnIG9uIGJlaGFsZiBvZiBwYXRyaWNrQHN0d2N4Lnh5ej4gd3JvdGU6DQoNCiAgICBPbiBU
dWUsIEp1bCAyMSwgMjAyMCBhdCAxMjo1NzowMEFNIC0wNzAwLCBOYW5jeSBZdWVuIHdyb3RlOg0K
ICAgID4gSSdtIGxvb2tpbmcgaW50byBwYWNrYWdlIG1hbmFnZW1lbnQgZm9yIEJNQ3MgaW4gb3Vy
IGZsZWV0LiAgSSdtIHdvbmRlcmluZw0KICAgID4gd2hvIGVsc2UgaXMgaW50ZXJlc3RlZCBpbiB0
aGlzLCBkb2VzIGl0IG1ha2Ugc2Vuc2UgZm9yIE9wZW5CTUMuICBXaGF0IGtpbmQNCiAgICA+IG9m
IGZlYXR1cmVzIGFyZSBpbXBvcnRhbnQ/ICBXaGF0IGtpbmQgb2YgcGFja2FnZSBmb3JtYXQgKHJw
bSwgZGViLA0KICAgID4gc29tZXRoaW5nIGVsc2UpPw0KDQogICAgV2UndmUgc2ltaWxhcmx5IHN0
YXJ0ZWQgcGxheWluZyB3aXRoIHBhY2thZ2UgbWFuYWdlbWVudCBhdCBGYWNlYm9vay4NCiAgICBP
bmUgb2YgdGhlIHJlYXNvbnMgZm9yIHVzIGRvaW5nIGl0IGlzIHRoYXQgd2Ugc3RpbGwgaGF2ZSBQ
eXRob24NCiAgICBpbnN0YWxsZWQgaW4gdGhlIGltYWdlIGFuZCBhcmUgcnVubmluZyBvdXQgb2Yg
c3BhY2UsIHNvIHdlJ3JlIG1vdmluZw0KICAgIHNvbWUgb2YgdGhlIGRlYnVnIHRvb2xzIGludG8g
cGFja2FnZXMgdGhhdCBjYW4gYmUgc2lkZS1sb2FkZWQgYXMgbmVlZGVkLg0KICAgIFdlJ3ZlIGFs
c28gaW1wbGVtZW50ZWQgJ3B0ZXN0Jywgd2hpY2ggYWxsb3dzIHlvdSB0byBjcmVhdGUgcGFja2Fn
ZXMNCiAgICBjb250YWluaW5nIHlvdXIgdW5pdCB0ZXN0cyBhbmQgcnVuIHRoZW0gb24gYSByZWFs
IG1hY2hpbmUuDQoNCiAgICBXZSBmb3VuZCB0aGF0IHdlIGhhZCB0byBzd2l0Y2ggdG8gaXBrZyBp
bnN0ZWFkIG9mIHJwbSBiZWNhdXNlIHRoZSBleHRyYQ0KICAgIHRoaW5ncyBycG0gbmVlZGVkIHdl
cmUgdG9vIGJpZyB0byBmaXQuICBJIHJlY2FsbCBpdCB3YXMgb24gdGhlIG9yZGVyIG9mDQogICAg
NU1CIG9mIGNvbnRlbnQgbmVlZGVkIHRvIG1ha2UgcnBtIHdvcmsgYW5kIGlwa2cgd2FzIGFsbW9z
dCBmcmVlLiBbMV0NCg0KICAgIE9uZSBpc3N1ZSB5b3UnbGwgd2FudCB0byBiZSBhd2FyZSBvZiwg
dGhhdCBtYW55IG9mIG91ciByZWNpcGVzIGhhdmUsIGlzDQogICAgdGhhdCB0aGV5IG9mdGVuIGFy
ZSBtaXNzaW5nOg0KDQogICAgICAgIFBBQ0tBR0VfQVJDSCA9ICIke01BQ0hJTkVfQVJDSH0iDQoN
CiAgICBUaGlzIGNhdXNlcyB0aGUgcGFja2FnZSB0byBiZSBzcGVjaWZpZWQgYXMgcmVsZXZhbnQg
Zm9yIGEgZ2VuZXJpYyBBUk0NCiAgICBzeXN0ZW0sIG1hdGNoaW5nIHRoZSBhcmNoaXRlY3R1cmUg
cmV2aXNpb24gb2YgeW91ciB1bmRlcmx5aW5nIEFTVDJ4eHgNCiAgICBjaGlwLCByYXRoZXIgdGhh
biB5b3VyIHBhcnRpY3VsYXIgbWFjaGluZS4gIEFueSBwYWNrYWdlIHdoaWNoIGNhbiBiZQ0KICAg
IGN1c3RvbWl6ZWQgZm9yIGEgcGFydGljdWxhciBtYWNoaW5lIChzdWNoIGFzIGJ5IG1hY2hpbmUt
c3BlY2lmaWMgY29tcGlsZQ0KICAgIGZsYWdzLCBvciBZQU1ML0pTT04gZmlsZXMpIHNob3VsZCBo
YXZlIHRoZSBhYm92ZSB2YXJpYWJsZSBzZXQgc28gdGhhdCBhDQogICAgcGFja2FnZSBjb21waWxl
ZCBmb3IgV2l0aGVyc3Bvb24gY2Fubm90IGJlIGluc3RhbGxlZCBvbnRvIGEgWmFpdXMuDQoNCiAg
ICBJZiB5b3UgbG9vayB1bmRlciB5b3VyIFlvY3RvIGJ1aWxkIHRyZWUgdW5kZXIgYHRtcC93b3Jr
YCB5b3UnbGwgc2VlDQogICAgYGFybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpYCBhbmQN
CiAgICBgd2l0aGVyc3Bvb24tb3BlbmJtYy1saW51eC1nbnVlYWJpYC4gIEkgc3VzcGVjdCBhdCBs
ZWFzdCBtb3N0IG9mIHRoZQ0KICAgIHBob3NwaG9yLSogcGFja2FnZXMgdW5kZXIgdGhlIGFybTEx
NzZqenMgc3ViZGlyZWN0b3J5IGFyZSBsaWtlbHkgY2FuZGlkYXRlcw0KICAgIGZvciBoYXZpbmcg
dGhpcyBQQUNLQUdFX0FSQ0ggZml4ZWQuICBXZSBtaWdodCB3YW50IHRvIHNpbXBseSBhZGQgaXQg
dG8NCiAgICBhbnkgJy5iYmFwcGVuZCcgd2UgZG8gaW4gYSBtYWNoaW5lIGxheWVyLg0KWWVzIHRo
aXMgaXMgdHJ1ZSwgYWxtb3N0IGV2ZXJ5IHBhY2thZ2UgZ29lcyBpbiB0aGlzIGV4Y2VwdCBrZXJu
ZWwuIFdlIHNob3VsZA0KaGF2ZSBhIGZpeCBmb3IgdGhpcy4NCg0KICAgIDEuIGh0dHBzOi8vZ2l0
aHViLmNvbS9mYWNlYm9vay9vcGVuYm1jL2NvbW1pdC80MzQzMGQzOGRmZDBlNTU1N2Y5Njk0MDU0
NzU5NGUwMTM3M2Y4NjNlDQoNCiAgICAtLSANCiAgICBQYXRyaWNrIFdpbGxpYW1zDQoNCg==
