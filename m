Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6331E8616
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 19:58:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YXPK3vd0zDqZL
	for <lists+openbmc@lfdr.de>; Sat, 30 May 2020 03:58:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=34184152d5=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=be6x0OPE; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=h5cZWd92; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YXMg4KhnzDqXK;
 Sat, 30 May 2020 03:57:14 +1000 (AEST)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04THmsZO023589; Fri, 29 May 2020 10:57:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=nDGFZqrsMLB3ESjeIC+dQ8ZZtGkF5tmKL2DpAJiSzsY=;
 b=be6x0OPEiFjBh7oiMbxuehgrs1x6k+6EbJEJ5Xvr55HCvTSPmjnvEPNPcVK7s/BG9CTg
 7Ff6mmekNI0pAMkjWNf5LwJtENGw2OLm+x18ewqUbpFapaUjC1A0bHPMpsRhbFR0bE39
 sQuVUKxXLHKjLRiGswEKKMpB60SLhJWq6Vw= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 31b3yra173-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 29 May 2020 10:57:05 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.102) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 29 May 2020 10:57:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X0m6Qj1b8CkZ9RA24+YNpEqFhTJkgsQvja8JU/r3o86Hpi0pWQYwT1dEkls3Wjp02SWY/B9WfxnvLdG36HNAjo6OkXDvJSH/jLCC9sCFNOIpzfZco736+T07LrZIjKw3Rce+sOnFyiQraDfXlh7u+VjkcXpL+KsHn54sJO15gH7bW24fnRbIXyZTQfHs5VGXviVtiKHWL4CapqMsFEU0e7BVr442KEvbIXObiDfy27BhCdMjjT8XTAl/J2fpSh0ACTHwoUYG5uD98zzZiot6MoqK0fcOEMdqoGlRuCnhS7OtJVVLFZ7I9cBaTRtzEG44LpDI4R5C03fe0xd0Aehl1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDGFZqrsMLB3ESjeIC+dQ8ZZtGkF5tmKL2DpAJiSzsY=;
 b=Zxo6ZhkZ3N0m3lftztCCfWqQUzT9sz5bRnRVR1dWoDzUMkQ2ZOscW9N+PAxprdQwcGdPJH8PHiRUzRtwvaezJyIOrI6KUYsSUpON9fDGrtKBl8+sLHyGMw6hcAHhMOjL4NwcMihxKawqwJJZ9cIgWZxfk/w5UZiyuZy7DI5z0bQruIH5dDGlvhe1lg9T7nBSI3vQsFJkxCyUZEz4IwIFm05Ux0c3i/mcuAgwEz7NvFtawUAHcHZCvl87sK/8tZ9sujsCrabaSLEa1hJywX9djJntRDvexWfo346QWXhGBM3aqYt3scNNI4Np2/nD3viUnyEV7M4Qy39Gwpx4SKUBBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDGFZqrsMLB3ESjeIC+dQ8ZZtGkF5tmKL2DpAJiSzsY=;
 b=h5cZWd92mDZSMrSZ7jtoAuNDkej1+zbQWv8/G3hiAONOtoysHqdMI6rjYJOFzYb0xMcIDIp8nxAe6dJBE4a26KHMrIoJL7KEdUrv7pXK49mqoj1Qs7ohYAA+s+8YOlyDEwciFzcXtXCZaVNWR8on7A8aUNVKNpqGwinYTt5ZAKA=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB3048.namprd15.prod.outlook.com (2603:10b6:a03:fc::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Fri, 29 May
 2020 17:57:03 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::34b8:e690:6dfc:8faf]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::34b8:e690:6dfc:8faf%4]) with mapi id 15.20.3045.018; Fri, 29 May 2020
 17:57:03 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH v2] hwmon:(adm1275) Enable adm1278 ADM1278_TEMP1_EN 
Thread-Topic: [PATCH v2] hwmon:(adm1275) Enable adm1278 ADM1278_TEMP1_EN 
Thread-Index: AQHWNbdFvmcC7XgBI0iZGne+tKUE7Ki+5FUA
Date: Fri, 29 May 2020 17:57:03 +0000
Message-ID: <6F5BD2D3-997D-4607-BC0C-B36497B51D13@fb.com>
References: <20200529124607.GA3469@cnn>
In-Reply-To: <20200529124607.GA3469@cnn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2601:647:4b00:fd70:18e2:66b5:5e3d:3d1a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75e3de07-774a-4d31-4235-08d803f9b1aa
x-ms-traffictypediagnostic: BYAPR15MB3048:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB3048CD9B53BAB351207FF14DDD8F0@BYAPR15MB3048.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 04180B6720
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Yw+b1MTh6cUGJDQWn7vi2FYsdYtVX+xMJm+Ndwnl0VJw5aPzU1W/klUaqWeF1mrSkTEH8s/XCbXSczncwYBiP0zhmwrbxzd0x6eDbX4CDf6UkePaG77qIGrG5ft7kWPxBTbQKBCeysVr5hBOn2KLKDIC5XwUIBH4hMN4QhLJuoxYmHgtVdt/4eBOm4Hz+3wtapn9grBRNEnx7mZOdkyN6pYrlH/GBAq19e4AUlUhnXZGIw3/z4JLlvvxbbycbWzXkMUoaUOlhVsqeI5QbJD/Ib6z9nAkPuFC2ddar17fs4s0SzK2i3+3pwbBOmoSSqKQQJnI3rg00Tvj76h1Wdr4LA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(39860400002)(136003)(376002)(346002)(366004)(478600001)(36756003)(71200400001)(2616005)(8936002)(4326008)(6506007)(6512007)(5660300002)(186003)(8676002)(83380400001)(6486002)(2906002)(54906003)(33656002)(316002)(86362001)(66476007)(66556008)(66446008)(4743002)(76116006)(66946007)(110136005)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: xrSAlQnxZZDRAdvrAX5F+ksy1VQk4xI94G7NaCaI+9Pg+BCcX3sqek+pgPcBR0v4lXkAza/XesuXMtyo8Hc51qhbuoc9rxO6RjlWNJS4ObFOX5imS87fYFj6nKmFTCkr5IiQVDP/K4Mvkhu7DEPfkf9QvpCI39a+P45rzZJf0ZwdzFL/Y0fUxwdbCeqzADlc8o1BgMl737wzI5MIyPcf2W28+IINj0kpvBs5mSMn7fjiuWCUoEwmm18IFbxDOxYEHFGglsIv5rvn3C4OIJJ26rL9H5mumLm2b0xkq2W9vY0c2y1cNflMuAiDJ4NaMpWSgF1KzPcOEOWebwjKH99+UzGA56tUB6uF5lHSERzHruOnWqQjl4197QLywYYxKJdh08gM9xX7xq+DyF9dZc1a2lx9W3U09i0/8/gQ4vuFtdrFcmia1EpDorJ6rRq49Nf4AJknWsy3Z5ePS+kVqTAE8fB1ezM1gIy7/VpdxLcysfmT4zirZS2kg4g9EupXjl2cwaMn5CI5iwIYrnDJnl125WfrZCIouIIEI1404KGXrsuhNiOtwdqiwTIYFvGMijHz
Content-Type: text/plain; charset="utf-8"
Content-ID: <A5BAD156FDBD5043A9D1F66D19E5892E@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e3de07-774a-4d31-4235-08d803f9b1aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2020 17:57:03.4381 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OAZU2RiGLZrgj7UUmwkcxfa4ZGzfKYCqMjsu4+4kB22CaadtZq9xYHm2fuiHSDzRjb/AZAMWj9ZnhTUi4+0G0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3048
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-29_09:2020-05-28,
 2020-05-29 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 clxscore=1011
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0
 adultscore=0 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005290135
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
Cc: "saipsdasari@fb.com" <saipsdasari@fb.com>,
 Patrick Williams <patrickw3@fb.com>, "linux@roeck-us.net" <linux@roeck-us.net>,
 "manikandan.e@hcl.com" <manikandan.e@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDUvMjkvMjAsIDU6NDcgQU0sICJNYW5pa2FuZGFuIEVsdW1hbGFpIiA8bWFuaWth
bmRhbi5oY2wuZXJzLmVwbEBnbWFpbC5jb20+IHdyb3RlOg0KDQogICAgVGhlIGFkbTEyNzggdGVt
cGVyYXR1cmUgc3lzZnMgYXR0cmlidXRlIG5lZWQgaXQgZm9yIG9uZSBvZiB0aGUgb3BlbmJtYyBw
bGF0Zm9ybSAuIA0KICAgIFRoaXMgZnVuY3Rpb25hbGl0eSBpcyBub3QgZW5hYmxlZCBieSBkZWZh
dWx0LCBzbyBQTU9OX0NPTkZJRyBuZWVkcyB0byBiZSBtb2RpZmllZCBpbiBvcmRlciB0byBlbmFi
bGUgaXQuDQogICAgDQogICAgU2lnbmVkLW9mZi1ieSAgIDogTWFuaWthbmRhbiBFbHVtYWxhaSA8
bWFuaWthbmRhbi5oY2wuZXJzLmVwbEBnbWFpbC5jb20+DQogICAgDQogICAgdjI6DQogICAgICAg
LSBBZGQgU2lnbmVkLW9mZi1ieS4NCiAgICAgICAtIFJlbW92ZWQgQURNMTI3OF9URU1QMV9FTiBj
aGVjay4NCiAgICAtLS0NCiAgICAgZHJpdmVycy9od21vbi9wbWJ1cy9hZG0xMjc1LmMgfCAyMSAr
KysrKysrKysrKysrKysrKy0tLS0NCiAgICAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pDQogICAgDQogICAgZGlmZiAtLWdpdCBhL2RyaXZlcnMvaHdtb24v
cG1idXMvYWRtMTI3NS5jIGIvZHJpdmVycy9od21vbi9wbWJ1cy9hZG0xMjc1LmMNCiAgICBpbmRl
eCA1Y2FhMzdmYi4uYWI1ZmNlYiAxMDA2NDQNCiAgICAtLS0gYS9kcml2ZXJzL2h3bW9uL3BtYnVz
L2FkbTEyNzUuYw0KICAgICsrKyBiL2RyaXZlcnMvaHdtb24vcG1idXMvYWRtMTI3NS5jDQogICAg
QEAgLTY2Niw3ICs2NjYsMjMgQEAgc3RhdGljIGludCBhZG0xMjc1X3Byb2JlKHN0cnVjdCBpMmNf
Y2xpZW50ICpjbGllbnQsDQogICAgIAkJdGluZGV4ID0gMzsNCiAgICAgDQogICAgIAkJaW5mby0+
ZnVuY1swXSB8PSBQTUJVU19IQVZFX1BJTiB8IFBNQlVTX0hBVkVfU1RBVFVTX0lOUFVUIHwNCiAg
ICAtCQkJUE1CVVNfSEFWRV9WT1VUIHwgUE1CVVNfSEFWRV9TVEFUVVNfVk9VVDsNCiAgICArCQkJ
UE1CVVNfSEFWRV9WT1VUIHwgUE1CVVNfSEFWRV9TVEFUVVNfVk9VVCB8DQogICAgKwkJCVBNQlVT
X0hBVkVfVEVNUCB8IFBNQlVTX0hBVkVfU1RBVFVTX1RFTVA7DQogICAgKw0KICAgICsJCWNvbmZp
ZyA9IGkyY19zbWJ1c19yZWFkX2J5dGVfZGF0YShjbGllbnQsIEFETTEyNzVfUE1PTl9DT05GSUcp
Ow0KICAgICsJCWlmIChjb25maWcgPCAwKQ0KICAgICsJCQlyZXR1cm4gY29uZmlnOw0KICAgICsN
CiAgICArCQkvKiBFbmFibGUgVEVNUDEgYnkgZGVmYXVsdCAqLw0KICAgICsJCWNvbmZpZyB8PSBB
RE0xMjc4X1RFTVAxX0VOOw0KICAgICsJCXJldCA9IGkyY19zbWJ1c193cml0ZV9ieXRlX2RhdGEo
Y2xpZW50LA0KICAgICsJCQkJCUFETTEyNzVfUE1PTl9DT05GSUcsDQogICAgKwkJCQkJY29uZmln
KTsNCiAgICArCQlpZiAocmV0IDwgMCkgew0KICAgICsJCWRldl9lcnIoJmNsaWVudC0+ZGV2LA0K
ICAgICsJCQkiRmFpbGVkIHRvIGVuYWJsZSB0ZW1wZXJhdHVyZSBjb25maWdcbiIpOw0KICAgICsJ
CXJldHVybiAtRU5PREVWOw0KICAgICsJCX0NCllvdSBkb24ndCBuZWVkIHRoaXMgYWJvdmUgY29k
ZSByZW1vdmluZyBjaGVjayBhcyBiZWxvdyBzaG91bGQgYmUgZW5vdWdoICB0bw0KcG9wdWxhdGUg
c3lzZnMgZW50cnkgeW91IG5lZWQuDQoNCiAgICAgCQkvKiBFbmFibGUgVk9VVCBpZiBub3QgZW5h
YmxlZCAoaXQgaXMgZGlzYWJsZWQgYnkgZGVmYXVsdCkgKi8NCiAgICAgCQlpZiAoIShjb25maWcg
JiBBRE0xMjc4X1ZPVVRfRU4pKSB7DQogICAgQEAgLTY4MSw5ICs2OTcsNiBAQCBzdGF0aWMgaW50
IGFkbTEyNzVfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwNCiAgICAgCQkJfQ0KICAg
ICAJCX0NCiAgICAgDQogICAgLQkJaWYgKGNvbmZpZyAmIEFETTEyNzhfVEVNUDFfRU4pDQogICAg
LQkJCWluZm8tPmZ1bmNbMF0gfD0NCiAgICAtCQkJCVBNQlVTX0hBVkVfVEVNUCB8IFBNQlVTX0hB
VkVfU1RBVFVTX1RFTVA7DQogICAgIAkJaWYgKGNvbmZpZyAmIEFETTEyNzhfVklOX0VOKQ0KICAg
ICAJCQlpbmZvLT5mdW5jWzBdIHw9IFBNQlVTX0hBVkVfVklOOw0KICAgICAJCWJyZWFrOw0KICAg
IC0tIA0KICAgIDIuNy40DQogICAgDQogICAgDQoNCg==
