Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4E1199C63
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 19:02:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sFxd4Tc8zDqQQ
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 04:02:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=135935d244=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=AcZcMreb; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=TofyWn1l; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sFrv5FZczDqB3
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 03:58:22 +1100 (AEDT)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02VGklib021540; Tue, 31 Mar 2020 09:58:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=JuRL+dyqfWWsz0NEoMK3YKAaQgzM0Wl9+Jt17NvJjCw=;
 b=AcZcMrebfrNnbGJtqVD8Aduiu2clc6YR3Y9FXsQxTiwT6M7k4NPxXnG7Jzuz5un7GQ9q
 zIGRKOwRU6BXJJfxsOEqzBo+aRMoI/vg2HTn9lKQyP2ML4ueLOkZN3HVVxkVlo5hxXLq
 HOF4LqW+CFsliUNMrUIY1AjCBMIqUY6yQTM= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 303d0j252s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 31 Mar 2020 09:58:19 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.102) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Tue, 31 Mar 2020 09:58:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=STfIlM3rweyaRaz2SEPZhww0XUOSbPqq+K69xvuX3/p3BwOVAKo3MYP/wuJ5hmyV7GB7+wNwIZlvuS+QU6Ae8GBB0sfhnn6/sBKKusNGZgJQ1kUZ70HvmArOCVp9i3qes/47Pb4YAueDIjFPUFRyyVZwE5MHhuMVjrjuSo1t3fhf70rTkVt+uShyN9IVj1s84SPvGqL7XCdSCByu7BCAH+hMlWe85J9t+P7BmwsL8NgtGHrmccgJqxStR4+F6Y2zftAG8J5UWYSi4TtDNubydoIS5JDt+OdePHzcW6nxzDYvE1QoGGuYXLvBSi4BRw1tsuaeuWZMR6vwnR0HFsAgww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JuRL+dyqfWWsz0NEoMK3YKAaQgzM0Wl9+Jt17NvJjCw=;
 b=ZBwNQYEyHmL+bWf6guC5+7ogS9Kc9AlGKoFCra9yzazvcqW9P75UgGEcLul3vsHoWcHrgDE24bPtKlPZnmoqoy3jg214rFUTADKghozd0Khj+rQrNFUWIpdq7NRF7SnVo96ucWQcotdlDdnW78KD/0BJQWJiyj7sp+ryMjoeq/pWpTTdAnb94+tIzZT+fkY591tn+ksis+9CDCVlEwluVZmUKZtPiSo/M8i+eaU3Tc0s5s8p/PUC63igCZpIWpZXsZU05Degjd2wJebROFTA343M1jd95PBQBh25yy2aHcvED2+k3Pc+DNHK8djWX9+qSX2kAc3nkfWrG/bYdFHAEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JuRL+dyqfWWsz0NEoMK3YKAaQgzM0Wl9+Jt17NvJjCw=;
 b=TofyWn1lGUKs3rg9htZNRYlZ4sDMkJKTBi3d8BDDxNYwHI+gcBMbFp1cgc81Ht4p9zKPZOWdxXhlsmk82EO86jDT3lSljmRVK9sKDtzalVCFpVWxrfqPw5gVmKTxZtUfkpGrUMrH3n54/tmvlzNlQDHDtPZsRnZ8rxOUCNLzcU4=
Received: from MW3PR15MB3947.namprd15.prod.outlook.com (2603:10b6:303:49::9)
 by MW3PR15MB3818.namprd15.prod.outlook.com (2603:10b6:303:47::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19; Tue, 31 Mar
 2020 16:58:17 +0000
Received: from MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936]) by MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936%4]) with mapi id 15.20.2856.019; Tue, 31 Mar 2020
 16:58:17 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: =?utf-8?B?U3BlbmNlciBLdSAo5Y+k5LiW55GcKQ==?= <Spencer.Ku@quantatw.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Question of Lost Dbus
Thread-Topic: Question of Lost Dbus
Thread-Index: AQHWBybAQdbbZR2aQUC0ULTFHgv2tqhid34A
Date: Tue, 31 Mar 2020 16:58:17 +0000
Message-ID: <9A81C050-75DA-4D2A-9476-0FB940C87193@fb.com>
References: <5d8c24246ba2413a99eff60aca2a9f71@quantatw.com>
In-Reply-To: <5d8c24246ba2413a99eff60aca2a9f71@quantatw.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:51f6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b0b3ac0-4ee1-4651-a2f6-08d7d594b5d4
x-ms-traffictypediagnostic: MW3PR15MB3818:
x-microsoft-antispam-prvs: <MW3PR15MB38189B185D0392EF460DDD80DDC80@MW3PR15MB3818.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR15MB3947.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(396003)(346002)(366004)(39860400002)(136003)(376002)(71200400001)(2906002)(6506007)(8676002)(81166006)(36756003)(2616005)(110136005)(5660300002)(33656002)(316002)(81156014)(66446008)(186003)(478600001)(53546011)(76116006)(66946007)(66476007)(66556008)(3480700007)(6512007)(6486002)(86362001)(8936002)(64756008);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /aksSCTTwzrHMYYPLaP5JNdTh/+iLAmiX8aIL38TbiwzQ+PvvVPDB9FJEnjdWF7FQXgomLCkC0lmPy14KKWEKnfUyJxuLXGVlcJxQnGNTvY+cRn3P122utbwDzp2yjKbzdPV/vIbENaW4dXfGhyx5iMTZqIQlvMKuP9sO69fCDlNrMD9atue2R+hWY1mvmeu7eOS7HDibUTpVHV7WUBonhfg7PfS1Mi1pVY8970lJT0uDHOJjSxKknCSX4cRO1DUdG/SHeXyJZ/2Im69fupMhvJQL/9RZLX4U9pllVgfSRjwYTHbEK3n8sEPU8xieqHsAG3CrYdScF2nfoW6CorVJI/l1x2SQAxw0TEYyj5c/0BpJZzL3FE1ww94RVJ6ZCR0ZHl2zfu45seShzsiW3J++g46LUxFZjUI3CUidmDaAk0J5NB1SPMvyyjovAYfLc9Q
x-ms-exchange-antispam-messagedata: xn0Shfk7KCEKUy4SGi3nWIgkAgfevsW2pSMUHBaaj2lek/R7RKS4KTvhbhqdAcvAp3mLXGwQmBfSXknVDtB/OCr2EMOxhuMmrP9xHMKkcrdoFuXMEjjgjFW34jRVM5JsexI2xcXwBkoTaoRpEEDP5RCctpaUgzQ+ZqZ+5mtdFqtiHXbLKwy52Lzx6e02ln5/
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_9A81C05075DA4D2A94760FB940C87193fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b0b3ac0-4ee1-4651-a2f6-08d7d594b5d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 16:58:17.6262 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LWC1MyJZ0dyUhoC5IZ3rRX0rX02R7d/izQlYGIk1U7OcTWwYMF4s1VdLi7yyIcw/qCIm2n6vTvSftCbkIi2AtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3818
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxlogscore=999
 priorityscore=1501 clxscore=1011 lowpriorityscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003310147
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

--_000_9A81C05075DA4D2A94760FB940C87193fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U3BlbmNlciwNCllvdSBtaWdodCBuZWVkIHRvIGRlZmluZSB5b3VyIGNoYW5uZWwgY29uZmlnIGZp
bGUgaW4gcGhvc3Bob3ItaXBtaS1jb25maWcgYW5kIGFkZCBjaGFubmVsIGZvciBuZXR3b3JrLg0K
DQpSZWdhcmRzDQotVmlqYXkNCg0KRnJvbTogb3BlbmJtYyA8b3BlbmJtYy1ib3VuY2VzK3ZpamF5
a2hlbWthPWZiLmNvbUBsaXN0cy5vemxhYnMub3JnPiBvbiBiZWhhbGYgb2YgIlNwZW5jZXIgS3Ug
KOWPpOS4lueRnCkiIDxTcGVuY2VyLkt1QHF1YW50YXR3LmNvbT4NCkRhdGU6IE1vbmRheSwgTWFy
Y2ggMzAsIDIwMjAgYXQgMTE6NDUgUE0NClRvOiAib3BlbmJtY0BsaXN0cy5vemxhYnMub3JnIiA8
b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0KU3ViamVjdDogUXVlc3Rpb24gb2YgTG9zdCBEYnVz
DQoNCg0KSGkgRXZlcnlvbmUsDQoNCkkgaGF2ZSBzb21lIHByb2JsZW0gYWJvdXQgdGhhdCB3aGVu
IGkgdXNpbmcgc29tZSBpcG1pIGNvbW1hbmRzLCBpdCB3aWxsIHJldHVybiAiVW5zcGVjaWZpZWQg
ZXJyb3IiLA0KDQphbmQgYWZ0ZXIgSSB0cmFjaW5nIGNvZGUgaW4gcGhvc2hwb3ItaXBtaS1ob3N0
IHBhY2thZ2UsIEkgZmluZCB0aGF0IHRoZXJlIGFyZSBzb21lIER1YnMgZG9lc24ndCBjcmVhdGUg
aW4gb3VyIG9wZW5ibWMgc3lzdGVtLg0KDQpNb3N0IG9mIHRoZW0gYXJlIG5ldHdvcmsgcmVsYXRp
b25hbCBEYnVzLCBhbmQgaGVyZSBpcyB0aGUgRGJ1cyBsaXN0IHdoaWNoIGRvIG5vdCBjcmVhdGUg
aW4gb3VyIHN5c3RlbToNCg0KDQoNCk5ldHdvdGs6DQp4eXoub3BlbmJtY19wcm9qZWN0Lk5ldHdv
cmsuU3lzdGVtQ29uZmlndXJhdGlvbg0KeHl6Lm9wZW5ibWNfcHJvamVjdC5OZXR3b3JrLkV0aGVy
bmV0SW50ZXJmYWNlDQp4eXoub3BlbmJtY19wcm9qZWN0Lk5ldHdvcmsuSVANCnh5ei5vcGVuYm1j
X3Byb2plY3QuTmV0d29yay5JUC5DcmVhdGUNCnh5ei5vcGVuYm1jX3Byb2plY3QuTmV0d29yay5N
QUNBZGRyZXNzDQp4eXoub3BlbmJtY19wcm9qZWN0Lk5ldHdvcmsuTmVpZ2hib3INCnh5ei5vcGVu
Ym1jX3Byb2plY3QuTmV0d29yay5OZWlnaGJvci5DcmVhdGVTdGF0aWMNCnh5ei5vcGVuYm1jX3By
b2plY3QuTmV0d29yay5WTEFODQp4eXoub3BlbmJtY19wcm9qZWN0Lk5ldHdvcmsuVkxBTi5DcmVh
dGUNCg0KDQpBQ1BJOg0KDQp4eXoub3BlbmJtY19wcm9qZWN0LkNvbnRyb2wuUG93ZXIuQUNQSVBv
d2VyU3RhdGUNCg0KDQoNCkNoYXNzaXMgQ2FwYWJpbGl0aWVzOg0KDQp4eXoub3BlbmJtY19wcm9q
ZWN0LkNvbnRyb2wuQ2hhc3Npc0NhcGFiaWxpdGllcw0KDQoNCg0KDQoNCkFuZCBoZXJlIGFyZSBv
bmx5IHR3byBuZXR3b3JrIHJlbGF0aW9uYWwgRGJ1cyBpbiBvdXIgc3lzdGVtOg0KU2VydmljZSB4
eXoub3BlbmJtY19wcm9qZWN0Lk5ldHdvcms6DQrilJTilIAveHl6DQogIOKUlOKUgC94eXovb3Bl
bmJtY19wcm9qZWN0DQogICAg4pSU4pSAL3h5ei9vcGVuYm1jX3Byb2plY3QvbmV0d29yaw0KICAg
ICAg4pSc4pSAL3h5ei9vcGVuYm1jX3Byb2plY3QvbmV0d29yay9jb25maWcNCiAgICAgIOKUgiDi
lJTilIAveHl6L29wZW5ibWNfcHJvamVjdC9uZXR3b3JrL2NvbmZpZy9kaGNwDQogICAgICDilJzi
lIAveHl6L29wZW5ibWNfcHJvamVjdC9uZXR3b3JrL2V0aDANCiAgICAgIOKUgiDilJzilIAveHl6
L29wZW5ibWNfcHJvamVjdC9uZXR3b3JrL2V0aDAvaXB2NA0KICAgICAg4pSCIOKUgiDilJTilIAv
eHl6L29wZW5ibWNfcHJvamVjdC9uZXR3b3JrL2V0aDAvaXB2NC84ZTFiZmEyZg0KICAgICAg4pSC
IOKUlOKUgC94eXovb3BlbmJtY19wcm9qZWN0L25ldHdvcmsvZXRoMC9pcHY2DQogICAgICDilIIg
ICDilJTilIAveHl6L29wZW5ibWNfcHJvamVjdC9uZXR3b3JrL2V0aDAvaXB2Ni9iYzQxZWVmNg0K
ICAgICAg4pSc4pSAL3h5ei9vcGVuYm1jX3Byb2plY3QvbmV0d29yay9ldGgxDQogICAgICDilIIg
4pSc4pSAL3h5ei9vcGVuYm1jX3Byb2plY3QvbmV0d29yay9ldGgxL2lwdjQNCiAgICAgIOKUgiDi
lIIg4pSU4pSAL3h5ei9vcGVuYm1jX3Byb2plY3QvbmV0d29yay9ldGgxL2lwdjQvMWM0YTE4N2YN
CiAgICAgIOKUgiDilJTilIAveHl6L29wZW5ibWNfcHJvamVjdC9uZXR3b3JrL2V0aDEvaXB2Ng0K
ICAgICAg4pSCICAg4pSU4pSAL3h5ei9vcGVuYm1jX3Byb2plY3QvbmV0d29yay9ldGgxL2lwdjYv
NzNhMmE1ZDANCiAgICAgIOKUnOKUgC94eXovb3BlbmJtY19wcm9qZWN0L25ldHdvcmsvc2l0MA0K
ICAgICAg4pSU4pSAL3h5ei9vcGVuYm1jX3Byb2plY3QvbmV0d29yay91c2IwDQogICAgICAgIOKU
lOKUgC94eXovb3BlbmJtY19wcm9qZWN0L25ldHdvcmsvdXNiMC9pcHY0DQogICAgICAgICAg4pSU
4pSAL3h5ei9vcGVuYm1jX3Byb2plY3QvbmV0d29yay91c2IwL2lwdjQvY2FjYTBkMWQNCg0KU2Vy
dmljZSB4eXoub3BlbmJtY19wcm9qZWN0Lk5ldHdvcmsuU05NUDoNCuKUlOKUgC94eXoNCiAg4pSU
4pSAL3h5ei9vcGVuYm1jX3Byb2plY3QNCiAgICDilJTilIAveHl6L29wZW5ibWNfcHJvamVjdC9u
ZXR3b3JrDQogICAgICDilJTilIAveHl6L29wZW5ibWNfcHJvamVjdC9uZXR3b3JrL3NubXANCiAg
ICAgICAg4pSU4pSAL3h5ei9vcGVuYm1jX3Byb2plY3QvbmV0d29yay9zbm1wL21hbmFnZXINCg0K
DQpBcmUgdGhlcmUgc29tZSBwYWNrYWdlcyBpIGxvc2luZyB0byBhZGQgaW50byBvdXIgc3lzdGVt
Pw0KDQpGZWVsIGZyZWUgdG8gZ2l2ZSB5b3VyIGNvbW1lbnRzLCB0aGFuayB5b3UuDQoNCg0KDQpT
aW5jZXJlbHksDQoNClNwZW5jZXIgS3UNCg0KDQo=

--_000_9A81C05075DA4D2A94760FB940C87193fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <B06BA979E54EAB42941F6DC658CDBED6@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiTVMgR290aGljIjsNCglwYW5vc2UtMToyIDExIDYgOSA3IDIgNSA4
IDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OiJDYW1icmlhIE1hdGgiOw0KCXBhbm9z
ZS0xOjIgNCA1IDMgNSA0IDYgMyAyIDQ7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWlseTpDYWxp
YnJpOw0KCXBhbm9zZS0xOjIgMTUgNSAyIDIgMiA0IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9u
dC1mYW1pbHk6IlxATVMgR290aGljIjsNCglwYW5vc2UtMToyIDExIDYgOSA3IDIgNSA4IDIgNDt9
DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3JtYWwsIGxpLk1zb05vcm1hbCwgZGl2
Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCW1hcmdpbi1ib3R0b206LjAwMDFwdDsNCglmb250
LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCnNwYW4u
RW1haWxTdHlsZTE5DQoJe21zby1zdHlsZS10eXBlOnBlcnNvbmFsLXJlcGx5Ow0KCWZvbnQtZmFt
aWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0KLk1zb0NocERl
ZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7DQoJZm9udC1zaXplOjEwLjBwdDt9
DQpAcGFnZSBXb3JkU2VjdGlvbjENCgl7c2l6ZTo4LjVpbiAxMS4waW47DQoJbWFyZ2luOjEuMGlu
IDEuMGluIDEuMGluIDEuMGluO30NCmRpdi5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2VjdGlv
bjE7fQ0KLS0+PC9zdHlsZT4NCjwvaGVhZD4NCjxib2R5IGxhbmc9IkVOLVVTIiBsaW5rPSIjMDU2
M0MxIiB2bGluaz0iIzk1NEY3MiI+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+U3BlbmNlciw8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPllvdSBtaWdodCBuZWVkIHRvIGRlZmluZSB5b3VyIGNoYW5uZWwgY29uZmlnIGZpbGUgaW4g
cGhvc3Bob3ItaXBtaS1jb25maWcgYW5kIGFkZCBjaGFubmVsIGZvciBuZXR3b3JrLjxvOnA+PC9v
OnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj5SZWdhcmRzPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj4tVmlqYXk8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5i
c3A7PC9vOnA+PC9wPg0KPGRpdiBzdHlsZT0iYm9yZGVyOm5vbmU7Ym9yZGVyLXRvcDpzb2xpZCAj
QjVDNERGIDEuMHB0O3BhZGRpbmc6My4wcHQgMGluIDBpbiAwaW4iPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+PGI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPkZyb206
IDwvc3Bhbj48L2I+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPm9w
ZW5ibWMgJmx0O29wZW5ibWMtYm91bmNlcyYjNDM7dmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96
bGFicy5vcmcmZ3Q7IG9uIGJlaGFsZiBvZiAmcXVvdDtTcGVuY2VyIEt1ICg8L3NwYW4+PHNwYW4g
c3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7TVMgR290aGljJnF1b3Q7
O2NvbG9yOmJsYWNrIj7lj6TkuJbnkZw8L3NwYW4+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4w
cHQ7Y29sb3I6YmxhY2siPikmcXVvdDsNCiAmbHQ7U3BlbmNlci5LdUBxdWFudGF0dy5jb20mZ3Q7
PGJyPg0KPGI+RGF0ZTogPC9iPk1vbmRheSwgTWFyY2ggMzAsIDIwMjAgYXQgMTE6NDUgUE08YnI+
DQo8Yj5UbzogPC9iPiZxdW90O29wZW5ibWNAbGlzdHMub3psYWJzLm9yZyZxdW90OyAmbHQ7b3Bl
bmJtY0BsaXN0cy5vemxhYnMub3JnJmd0Ozxicj4NCjxiPlN1YmplY3Q6IDwvYj5RdWVzdGlvbiBv
ZiBMb3N0IERidXM8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdiBpZD0iZGl2
dGFnZGVmYXVsdHdyYXBwZXIiPg0KPHA+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29s
b3I6YmxhY2siPkhpIEV2ZXJ5b25lLDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwPjxzcGFuIHN0
eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj5JIGhhdmUgc29tZSBwcm9ibGVtIGFi
b3V0IHRoYXQgd2hlbiBpIHVzaW5nJm5ic3A7c29tZSBpcG1pIGNvbW1hbmRzLCBpdCZuYnNwO3dp
bGwmbmJzcDtyZXR1cm4gJnF1b3Q7VW5zcGVjaWZpZWQgZXJyb3ImcXVvdDssPG86cD48L286cD48
L3NwYW4+PC9wPg0KPHA+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2si
PmFuZCBhZnRlciBJIHRyYWNpbmcgY29kZSBpbiZuYnNwO3Bob3NocG9yLWlwbWktaG9zdCBwYWNr
YWdlLCBJIGZpbmQgdGhhdCB0aGVyZSBhcmUgc29tZSBEdWJzIGRvZXNuJ3QgY3JlYXRlIGluIG91
ciBvcGVuYm1jIHN5c3RlbS48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cD48c3BhbiBzdHlsZT0i
Zm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+TW9zdCBvZiB0aGVtIGFyZSBuZXR3b3JrIHJl
bGF0aW9uYWwgRGJ1cywgYW5kJm5ic3A7aGVyZSBpcyB0aGUgRGJ1cyBsaXN0IHdoaWNoIGRvIG5v
dCBjcmVhdGUgaW4gb3VyIHN5c3RlbTo8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cD48c3BhbiBz
dHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+PG86cD4mbmJzcDs8L286cD48L3Nw
YW4+PC9wPg0KPHA+PGI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2si
Pk5ldHdvdGs6PC9zcGFuPjwvYj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpi
bGFjayI+PG86cD48L286cD48L3NwYW4+PC9wPg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj54eXoub3BlbmJtY19w
cm9qZWN0Lk5ldHdvcmsuU3lzdGVtQ29uZmlndXJhdGlvbjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4N
CjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6MTIuMHB0O2NvbG9yOmJsYWNrIj54eXoub3BlbmJtY19wcm9qZWN0Lk5ldHdvcmsuRXRoZXJu
ZXRJbnRlcmZhY2U8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+
eHl6Lm9wZW5ibWNfcHJvamVjdC5OZXR3b3JrLklQPG86cD48L286cD48L3NwYW4+PC9wPg0KPC9k
aXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTox
Mi4wcHQ7Y29sb3I6YmxhY2siPnh5ei5vcGVuYm1jX3Byb2plY3QuTmV0d29yay5JUC5DcmVhdGU8
bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+eHl6Lm9wZW5ibWNf
cHJvamVjdC5OZXR3b3JrLk1BQ0FkZHJlc3M8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4N
CjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBw
dDtjb2xvcjpibGFjayI+eHl6Lm9wZW5ibWNfcHJvamVjdC5OZXR3b3JrLk5laWdoYm9yPG86cD48
L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPnh5ei5vcGVuYm1jX3Byb2pl
Y3QuTmV0d29yay5OZWlnaGJvci5DcmVhdGVTdGF0aWM8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8
L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXpl
OjEyLjBwdDtjb2xvcjpibGFjayI+eHl6Lm9wZW5ibWNfcHJvamVjdC5OZXR3b3JrLlZMQU48bzpw
PjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48
c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+eHl6Lm9wZW5ibWNfcHJv
amVjdC5OZXR3b3JrLlZMQU4uQ3JlYXRlPG86cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpi
bGFjayI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHA+PGI+PHNwYW4gc3R5bGU9ImZv
bnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPkFDUEk6PC9zcGFuPjwvYj48c3BhbiBzdHlsZT0i
Zm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+PG86cD48L286cD48L3NwYW4+PC9wPg0KPHA+
PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPnh5ei5vcGVuYm1jX3By
b2plY3QuQ29udHJvbC5Qb3dlci5BQ1BJUG93ZXJTdGF0ZTxvOnA+PC9vOnA+PC9zcGFuPjwvcD4N
CjxwPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj48bzpwPiZuYnNw
OzwvbzpwPjwvc3Bhbj48L3A+DQo8cD48Yj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtj
b2xvcjpibGFjayI+Q2hhc3NpcyBDYXBhYmlsaXRpZXM6PC9zcGFuPjwvYj48c3BhbiBzdHlsZT0i
Zm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+PG86cD48L286cD48L3NwYW4+PC9wPg0KPHA+
PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPnh5ei5vcGVuYm1jX3By
b2plY3QuQ29udHJvbC5DaGFzc2lzQ2FwYWJpbGl0aWVzPG86cD48L286cD48L3NwYW4+PC9wPg0K
PHA+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPjxvOnA+Jm5ic3A7
PC9vOnA+PC9zcGFuPjwvcD4NCjxwPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9y
OmJsYWNrIj48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cD48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+QW5kIGhlcmUgYXJlJm5ic3A7b25seSB0d28gbmV0
d29yayByZWxhdGlvbmFsIERidXMgaW4gb3VyIHN5c3RlbTo8bzpwPjwvbzpwPjwvc3Bhbj48L3A+
DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PGI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTox
Mi4wcHQ7Y29sb3I6YmxhY2siPlNlcnZpY2UgeHl6Lm9wZW5ibWNfcHJvamVjdC5OZXR3b3JrOjwv
c3Bhbj48L2I+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPjxvOnA+
PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxz
cGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj7ilJTilIAveHl6PG86cD48
L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPiZuYnNwOyDilJTilIAveHl6
L29wZW5ibWNfcHJvamVjdDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJs
YWNrIj4mbmJzcDsgJm5ic3A7IOKUlOKUgC94eXovb3BlbmJtY19wcm9qZWN0L25ldHdvcms8bzpw
PjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48
c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+Jm5ic3A7ICZuYnNwOyAm
bmJzcDsgPC9zcGFuPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2ZvbnQtZmFtaWx5OiZx
dW90O01TIEdvdGhpYyZxdW90Oztjb2xvcjpibGFjayI+4pScPC9zcGFuPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj7ilIAveHl6L29wZW5ibWNfcHJvamVjdC9uZXR3
b3JrL2NvbmZpZzxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNz
PSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj4m
bmJzcDsgJm5ic3A7ICZuYnNwOyDilIIg4pSU4pSAL3h5ei9vcGVuYm1jX3Byb2plY3QvbmV0d29y
ay9jb25maWcvZGhjcDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNr
Ij4mbmJzcDsgJm5ic3A7ICZuYnNwOyA8L3NwYW4+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4w
cHQ7Zm9udC1mYW1pbHk6JnF1b3Q7TVMgR290aGljJnF1b3Q7O2NvbG9yOmJsYWNrIj7ilJw8L3Nw
YW4+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPuKUgC94eXovb3Bl
bmJtY19wcm9qZWN0L25ldHdvcmsvZXRoMDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0K
PGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0
O2NvbG9yOmJsYWNrIj4mbmJzcDsgJm5ic3A7ICZuYnNwOyDilIIgPC9zcGFuPjxzcGFuIHN0eWxl
PSJmb250LXNpemU6MTIuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O01TIEdvdGhpYyZxdW90Oztjb2xv
cjpibGFjayI+4pScPC9zcGFuPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJs
YWNrIj7ilIAveHl6L29wZW5ibWNfcHJvamVjdC9uZXR3b3JrL2V0aDAvaXB2NDxvOnA+PC9vOnA+
PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0
eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj4mbmJzcDsgJm5ic3A7ICZuYnNwOyDi
lIIg4pSCIOKUlOKUgC94eXovb3BlbmJtY19wcm9qZWN0L25ldHdvcmsvZXRoMC9pcHY0LzhlMWJm
YTJmPG86cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPiZuYnNwOyAm
bmJzcDsgJm5ic3A7IOKUgiDilJTilIAveHl6L29wZW5ibWNfcHJvamVjdC9uZXR3b3JrL2V0aDAv
aXB2NjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj4mbmJzcDsg
Jm5ic3A7ICZuYnNwOyDilIImbmJzcDsgJm5ic3A74pSU4pSAL3h5ei9vcGVuYm1jX3Byb2plY3Qv
bmV0d29yay9ldGgwL2lwdjYvYmM0MWVlZjY8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4N
CjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBw
dDtjb2xvcjpibGFjayI+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgPC9zcGFuPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6MTIuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O01TIEdvdGhpYyZxdW90Oztjb2xvcjpi
bGFjayI+4pScPC9zcGFuPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNr
Ij7ilIAveHl6L29wZW5ibWNfcHJvamVjdC9uZXR3b3JrL2V0aDE8bzpwPjwvbzpwPjwvc3Bhbj48
L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+Jm5ic3A7ICZuYnNwOyAmbmJzcDsg4pSCIDwvc3Bh
bj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtmb250LWZhbWlseTomcXVvdDtNUyBHb3Ro
aWMmcXVvdDs7Y29sb3I6YmxhY2siPuKUnDwvc3Bhbj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEy
LjBwdDtjb2xvcjpibGFjayI+4pSAL3h5ei9vcGVuYm1jX3Byb2plY3QvbmV0d29yay9ldGgxL2lw
djQ8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+Jm5ic3A7ICZu
YnNwOyAmbmJzcDsg4pSCIOKUgiDilJTilIAveHl6L29wZW5ibWNfcHJvamVjdC9uZXR3b3JrL2V0
aDEvaXB2NC8xYzRhMTg3ZjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJs
YWNrIj4mbmJzcDsgJm5ic3A7ICZuYnNwOyDilIIg4pSU4pSAL3h5ei9vcGVuYm1jX3Byb2plY3Qv
bmV0d29yay9ldGgxL2lwdjY8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpi
bGFjayI+Jm5ic3A7ICZuYnNwOyAmbmJzcDsg4pSCJm5ic3A7ICZuYnNwO+KUlOKUgC94eXovb3Bl
bmJtY19wcm9qZWN0L25ldHdvcmsvZXRoMS9pcHY2LzczYTJhNWQwPG86cD48L286cD48L3NwYW4+
PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZv
bnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPiZuYnNwOyAmbmJzcDsgJm5ic3A7IDwvc3Bhbj48
c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtmb250LWZhbWlseTomcXVvdDtNUyBHb3RoaWMm
cXVvdDs7Y29sb3I6YmxhY2siPuKUnDwvc3Bhbj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBw
dDtjb2xvcjpibGFjayI+4pSAL3h5ei9vcGVuYm1jX3Byb2plY3QvbmV0d29yay9zaXQwPG86cD48
L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPiZuYnNwOyAmbmJzcDsgJm5i
c3A7IOKUlOKUgC94eXovb3BlbmJtY19wcm9qZWN0L25ldHdvcmsvdXNiMDxvOnA+PC9vOnA+PC9z
cGFuPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxl
PSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj4mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsg4pSU4pSAL3h5ei9vcGVuYm1jX3Byb2plY3QvbmV0d29yay91c2IwL2lwdjQ8bzpwPjwvbzpw
Pjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBz
dHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+Jm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyDilJTilIAveHl6L29wZW5ibWNfcHJvamVjdC9uZXR3b3JrL3VzYjAvaXB2
NC9jYWNhMGQxZDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNz
PSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj48
bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8ZGl2Pg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+PGI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6Ymxh
Y2siPlNlcnZpY2UgeHl6Lm9wZW5ibWNfcHJvamVjdC5OZXR3b3JrLlNOTVA6PC9zcGFuPjwvYj48
c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+PG86cD48L286cD48L3Nw
YW4+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9
ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPuKUlOKUgC94eXo8bzpwPjwvbzpwPjwvc3Bh
bj48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0i
Zm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+Jm5ic3A7IOKUlOKUgC94eXovb3BlbmJtY19w
cm9qZWN0PG86cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPiZuYnNw
OyAmbmJzcDsg4pSU4pSAL3h5ei9vcGVuYm1jX3Byb2plY3QvbmV0d29yazxvOnA+PC9vOnA+PC9z
cGFuPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxl
PSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj4mbmJzcDsgJm5ic3A7ICZuYnNwOyDilJTi
lIAveHl6L29wZW5ibWNfcHJvamVjdC9uZXR3b3JrL3NubXA8bzpwPjwvbzpwPjwvc3Bhbj48L3A+
DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1z
aXplOjEyLjBwdDtjb2xvcjpibGFjayI+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IOKUlOKU
gC94eXovb3BlbmJtY19wcm9qZWN0L25ldHdvcmsvc25tcC9tYW5hZ2VyPG86cD48L286cD48L3Nw
YW4+PC9wPg0KPC9kaXY+DQo8L2Rpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxl
PSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48
L3A+DQo8cD48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+QXJlIHRo
ZXJlIHNvbWUgcGFja2FnZXMgaSBsb3NpbmcgdG8gYWRkIGludG8gb3VyIHN5c3RlbT88bzpwPjwv
bzpwPjwvc3Bhbj48L3A+DQo8cD48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpi
bGFjayI+RmVlbCBmcmVlIHRvIGdpdmUgeW91ciBjb21tZW50cywmbmJzcDt0aGFuayB5b3UuPG86
cD48L286cD48L3NwYW4+PC9wPg0KPHA+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29s
b3I6YmxhY2siPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj5TaW5jZXJlbHksPG86cD48L286cD48L3NwYW4+
PC9wPg0KPHA+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPlNwZW5j
ZXIgS3U8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cD48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEy
LjBwdDtjb2xvcjpibGFjayI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8
L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_9A81C05075DA4D2A94760FB940C87193fbcom_--
