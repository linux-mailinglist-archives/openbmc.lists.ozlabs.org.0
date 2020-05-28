Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B081E68B9
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 19:35:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XvxR3zPPzDqbF
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 03:35:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=3417d689fb=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=N9MdHq9u; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=MfotA6A5; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Xvw46LCYzDqZ3;
 Fri, 29 May 2020 03:34:34 +1000 (AEST)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.42/8.16.0.42) with SMTP id 04SHWxMx025679;
 Thu, 28 May 2020 10:34:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=toEwLmq3avNtomTXJETr6uYHmaMUyLkj/CO4OhWjEbw=;
 b=N9MdHq9uhKQ18VFvxtoecTQfvvMvckTkoUL1JO371fkAUvStChb+LDWlChFVqsXazkbd
 xlPEPV+9RqLwsfOJufaZUViCHr0IniIqzundMhDptDWbxq4qBEjAIcoWHlmQwc9Kiibb
 phJW+ov7Udf1uCOQvWmiHXpftErC6X+WUKY= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0001303.ppops.net with ESMTP id 319ybhsrwq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 28 May 2020 10:34:25 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 28 May 2020 10:34:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S7os58yQTM4lzCgJWcfb3dgPzvGp72frtLv85+Iw9E/J9bK/3RydDXpoUTbNKeOZ+HolPNBKvkskzrYrXDKoTkUeae9N/uNxB9y2g0ANoDabqJp4NmMKuldxVlyGxEnimV0734BqJtIIYFxu2HIYFKlOkgFgac31lRGZIxuH+4Fc3DKRiDWbvOXM/dQ9arUAiV2R0I5ChcUaX2Lo6rGqC49JdMpSWell89FLNIz3ZHo9lT+SNNV3/E5LHDcpg8ZOSiCITeQEY5f6bv4VaZo9UkAllmDsxgVwtdv1CPRlC82TZpY0SbqqG6pKmDZBFJXc0ola61azcekj18jXTYF4qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=toEwLmq3avNtomTXJETr6uYHmaMUyLkj/CO4OhWjEbw=;
 b=ebAb7JmLZ4RinNC8UJqFlY8jYWdOp06EBGYbruiWwAYvXVFHa/yBXIsDgaWpvQzESS/yLPreVsQlUQ0OO22FbcWHKnIQUuAQ2H/e6DnoBgcP503ZaetWydw+YC7KXSn63qHszYElDfngKsQk95irTrGHBIqvdlTMxZYlQrvWiIb/my2IJKC9EHIyvyISMRP3kPca6ttYAKU0TILuz81Pwr3bCUczElsYowgoAQLx97d3q6JpnLRpPgLHoBAdE5GgJRGIIBa88kLcpgIzZqNqmSSAbymmzuQlGIVRx+Vh4PJO+l7Q/LFWuQw2E2s9PtF04Sy5iKtxf2WcHZS5717lbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=toEwLmq3avNtomTXJETr6uYHmaMUyLkj/CO4OhWjEbw=;
 b=MfotA6A5Vx0SDgH2rxuaAvoaHVKQkmIIZoJ8dwLU3Y3vQnBFXQJq8nggSWMdWlgwNYd/wxOjC1kHFZIlKyaLuWbrhk0+7dBrJ5PJpSisgtm8hqSg8Zozd77gKEQ1mTUA6ljWmXOktudWQYgC/vUkHTFWq6nHbqzx4yfT1C/1eKY=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB3111.namprd15.prod.outlook.com (2603:10b6:a03:b4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Thu, 28 May
 2020 17:34:23 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::34b8:e690:6dfc:8faf]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::34b8:e690:6dfc:8faf%4]) with mapi id 15.20.3045.018; Thu, 28 May 2020
 17:34:23 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH] hwmon:(adm1275) Enable adm1278 ADM1278_TEMP1_EN
Thread-Topic: [PATCH] hwmon:(adm1275) Enable adm1278 ADM1278_TEMP1_EN
Thread-Index: AQHWNPp8ZPHnrRGnhEiGrbwjJVjjV6i9TSQA
Date: Thu, 28 May 2020 17:34:22 +0000
Message-ID: <76D2694A-C80C-49F8-B51D-8A74341CA4ED@fb.com>
References: <20200528141523.GA8810@cnn>
In-Reply-To: <20200528141523.GA8810@cnn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2601:647:4b00:fd70:18e2:66b5:5e3d:3d1a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc52641d-519f-4a4d-790a-08d8032d5c58
x-ms-traffictypediagnostic: BYAPR15MB3111:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB3111A89278D1188EC4986967DD8E0@BYAPR15MB3111.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 0417A3FFD2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S5/PrxH/OaDjSmtToxIiLs/+20B8MmCCYdJd3RfpWBO9C5b3tK0MRhK9WnAlKo2uSybjLR60/6lIyQp/bW/lN2+hmb8L0qiIDKLDnXLlZEEbqcJhg8nAKDmtJDmViXaUmvUtwPlMRKswLSMnZT9w0CqWiSmtQZKk1ksLpb1ikG3w8UZwm4e3SKxF5cccpuTQzyKoVY57AEvOmfsQwJvQa1IOTxI+Ow55HH7qJywTINIO0G+0m9ykzRbnmZdfDbSUsXQwWHxsSCSrMFzpqCpiF2sZAs7u4Mmx43hGyqIkqOHbOch/u8b84SfHaM0xUMl5W8w+JPa1QVvICI48SoGpDw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(39860400002)(376002)(346002)(396003)(136003)(66556008)(64756008)(71200400001)(76116006)(66476007)(66946007)(66446008)(316002)(33656002)(86362001)(6486002)(36756003)(110136005)(54906003)(2906002)(83380400001)(4326008)(6512007)(8936002)(186003)(8676002)(5660300002)(6506007)(478600001)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 7gceeBwUqjyKlhcwf73k4aLmQMyNDMIx39djNblRRP1ffYrs6OKZdThsGGDW5qhtgqrXCmSaNFFHhm8hbLf3ByY4RDYSjKIiUNevQZMR1BrXSIP2ELmMn0W3j8amj9ZIDHOCDiNjWUBWjTygbU6Z+DxvNJYcWHt32x2Z/eZcFaE0xt4Fv/E5YrmysMZXnYdD3kFdUoKd3Ujum2RhltPBOtCRAh4uBryZDSqnuRFMqAsDkivjCJGByHSGf73QyHRh3hN8QSJJdrkge87uuG+94AjJu4EwDVaeevSw+JQMPlcfFgimPbRD+OQvOTP676nbLoQ5LcBu8irp1S9VnWCXbEVBDTzPJXNGaQ6KoL/IRObuK1KxGfvwYP41s7TRYbA9VmMC9RIumzHla2xhXpKCVEGU170CPeyKTouUT+k2euAe6u6IL7Yy3CoiMsfgVYw7C0VR8fTR9TqiFN6cgE4+FQWmA0g7ViSE0fptIrqWUAs6QemVmzHrz5+t2w/TqzuJ5MWyo4y1IOHLY8c6U4eRtnw4AYRsyKLIcqXJvW2O+KPVC6FWlIFrxT7EiTehiXQM
Content-Type: text/plain; charset="utf-8"
Content-ID: <CDC66D412C84974DB1489753BC3F80EC@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bc52641d-519f-4a4d-790a-08d8032d5c58
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2020 17:34:22.9569 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p1d+oRGCsIdi3egTb071sTu0vWGEM41pk/EqS1LecrQpZZyRoMKbc3v8xtfUoGD3AdPvw939QbawE/zs0CwAkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3111
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-28_04:2020-05-28,
 2020-05-28 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0
 clxscore=1011 priorityscore=1501 cotscore=-2147483648 spamscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=890 adultscore=0 mlxscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005280122
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
Cc: Patrick Williams <patrickw3@fb.com>,
 "manikandan.e@hcl.com" <manikandan.e@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDUvMjgvMjAsIDc6MTUgQU0sICJNYW5pa2FuZGFuIEVsdW1hbGFpIiA8bWFuaWth
bmRhbi5oY2wuZXJzLmVwbEBnbWFpbC5jb20+IHdyb3RlOg0KDQogICAgDQogICAgVGhlIGFkbTEy
NzggdGVtcGVyYXR1cmUgc3lzZnMgYXR0cmlidXRlIG5lZWQgaXQgZm9yIG9uZSBvZiB0aGUgb3Vy
IG9wZW5ibWMgcGxhdGZvcm0gLiANCiAgICBUaGlzIGZ1bmN0aW9uYWxpdHkgaXMgbm90IGVuYWJs
ZWQgYnkgZGVmYXVsdCwgc28gUE1PTl9DT05GSUcgbmVlZHMgdG8gYmUgbW9kaWZpZWQgaW4gb3Jk
ZXIgdG8gZW5hYmxlIGl0Lg0KDQpUaGVyZSBpcyBubyBTaWduZWQtb2ZmLWJ5Lg0KICAgIA0KICAg
IC0tLQ0KICAgICBkcml2ZXJzL2h3bW9uL3BtYnVzL2FkbTEyNzUuYyB8IDE1ICsrKysrKysrKysr
KysrKw0KICAgICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKQ0KICAgIA0KICAgIGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2h3bW9uL3BtYnVzL2FkbTEyNzUuYyBiL2RyaXZlcnMvaHdtb24v
cG1idXMvYWRtMTI3NS5jDQogICAgaW5kZXggNWNhYTM3ZmIuLjQ3YjI5M2QgMTAwNjQ0DQogICAg
LS0tIGEvZHJpdmVycy9od21vbi9wbWJ1cy9hZG0xMjc1LmMNCiAgICArKysgYi9kcml2ZXJzL2h3
bW9uL3BtYnVzL2FkbTEyNzUuYw0KICAgIEBAIC02ODEsNiArNjgxLDIxIEBAIHN0YXRpYyBpbnQg
YWRtMTI3NV9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LA0KICAgICAJCQl9DQogICAg
IAkJfQ0KICAgICANCiAgICArCQljb25maWcgPSBpMmNfc21idXNfcmVhZF9ieXRlX2RhdGEoY2xp
ZW50LCBBRE0xMjc1X1BNT05fQ09ORklHKTsNCiAgICArCQlpZiAoY29uZmlnIDwgMCkNCiAgICAr
CQkJcmV0dXJuIGNvbmZpZzsNCiAgICArDQogICAgKwkJLyogRW5hYmxlIFRFTVAxIGJ5IGRlZnVs
dCAqLw0KICAgICsJCWNvbmZpZyB8PSBBRE0xMjc4X1RFTVAxX0VOOw0KICAgICsJCXJldCA9IGky
Y19zbWJ1c193cml0ZV9ieXRlX2RhdGEoY2xpZW50LA0KICAgICsJCQkJCUFETTEyNzVfUE1PTl9D
T05GSUcsDQogICAgKwkJCQkJY29uZmlnKTsNCiAgICArCQlpZiAocmV0IDwgMCkgew0KICAgICsJ
CWRldl9lcnIoJmNsaWVudC0+ZGV2LA0KICAgICsJCQkiRmFpbGVkIHRvIGVuYWJsZSB0ZW1wZXJh
dHVyZSBjb25maWdcbiIpOw0KICAgICsJCXJldHVybiAtRU5PREVWOw0KICAgICsJCX0NCiAgICAr
DQogICAgIAkJaWYgKGNvbmZpZyAmIEFETTEyNzhfVEVNUDFfRU4pDQoNClRoaXMgY2hlY2sgYmVj
b21lcyBpcnJlbGV2YW50IGFzIHlvdSBhcmUgZW5hYmxpbmcgaXQgYWJvdmUgdGhlbiByYXRoZXIg
dGhhbg0KZW5hYmxpbmcgaXQganVzdCByZW1vdmUgdGhpcyBjaGVjay4NCg0KICAgICAJCQlpbmZv
LT5mdW5jWzBdIHw9DQogICAgIAkJCQlQTUJVU19IQVZFX1RFTVAgfCBQTUJVU19IQVZFX1NUQVRV
U19URU1QOw0KICAgIC0tIA0KICAgIDIuNy40DQogICAgDQogICAgDQoNCg==
