Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2601ED677
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 21:04:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cdcS3hv8zDqfS
	for <lists+openbmc@lfdr.de>; Thu,  4 Jun 2020 05:04:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=342338cb4b=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=IWGeZcNw; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=RijYomQ5; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cdbX55gvzDqdf
 for <openbmc@lists.ozlabs.org>; Thu,  4 Jun 2020 05:03:10 +1000 (AEST)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 053Ix5jh011299; Wed, 3 Jun 2020 12:03:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=lpFddEka8KE+PEcCZoYSl5RU+MdAVUteyswPjCfbBiA=;
 b=IWGeZcNwZqN1tncC8na7u+N6oy2RueJgn2T8CnXtt539pyGyMU0koO8hYzSPLsOtyNB2
 1wOxo6qVVMthvSEIjj/ngLJ4S0XfSjb/H10GQ9BQJ7BctGlSad2HgkH9VcxuUbtc4fyq
 UcxtEh7aEaPrQBTxddRDOFUW9oYQz7eVmTg= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 31ef2292tq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 03 Jun 2020 12:03:00 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.230) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 3 Jun 2020 12:02:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bIB63ZucimWmjX2AbvrwwnNgIiGQvyA6rDBda0wblHNdLJfOFK/BqPcMjNI9e/Og+sDJCk/9Dxofpqi9DGlTQj8vSMphcBBz8L0lW2URTmMHxcn82tt+fxrZIzEy4I5Rydwgg41qpSungRALGcH4C/VW0oY78SUwrB8/6NsKaE2/wcMxnODuetstzMOFI7NCyEeInF6+IJofiebGsik/YtFBV6R2e++4mEHTFyNRh3rJSpH2n+EDxBogPxGwF3QJhhmd9VbZqNUksYXGERr84YU3VZ6TVLkozmH7/q+vwUEvnHTI7DHSO1I7VEfhoNI2++ozHePnM8wHWkDuAzcTEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpFddEka8KE+PEcCZoYSl5RU+MdAVUteyswPjCfbBiA=;
 b=h88F+pb31rbbikshwzDtvrA9yMAeGMXvfIThbLmWQ3zchh2jjo82QmK/GBMLXKXeMoM6GKxD4vCPBETe2EA6pGYsUUMjeEeCv+Yhly5oTtPZ8Fb09oK4EQR9Qa0Zbhv/VTSSyN2qACrBwHivpJtbVQGhZlfDcJO0Kau0x7lEw2CbuE/FQoaHi7PoCL49c901u6OqW4+Q+ONrwtC9DFtzE4N6I4IlJyF2V8O/322I8Q949QgS1S/prniTRtMEF14JY+Y6PPZapQX8UUURjGjHs7/Oh+o6JXKuh8Lrvf/DcDG01TJo8MlkqKR25ZjkYf8LkE434kIpnblArHfU/dUjNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpFddEka8KE+PEcCZoYSl5RU+MdAVUteyswPjCfbBiA=;
 b=RijYomQ5vR7TTrrDxoFDUFXTNJaIP2+yq5p1lwkeAkfs3pQchrtFZ3iH6YbpYClZz+/TN1BS/HgA1fsWRI0s8+Aer5JReCO8MwgmrVCjWxq044IteK3p+eMMCpkJ2w7XDcdUO6o3EKZgejTtv4y+DTKCQ+vfE6g3E+wuAVTzYgU=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB3096.namprd15.prod.outlook.com (2603:10b6:a03:b0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Wed, 3 Jun
 2020 19:02:58 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::34b8:e690:6dfc:8faf]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::34b8:e690:6dfc:8faf%4]) with mapi id 15.20.3045.022; Wed, 3 Jun 2020
 19:02:58 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Vernon Mauery <vernon.mauery@linux.intel.com>, Patrick Williams
 <patrick@stwcx.xyz>
Subject: Re: OpenBMC Logging and Error Handling Dos and Don'ts
Thread-Topic: OpenBMC Logging and Error Handling Dos and Don'ts
Thread-Index: AQHWOFSzDGfYEn6TpEmOWsEiyQ/8FajErDGAgAAragCAARysgIAAEN8AgADIB4A=
Date: Wed, 3 Jun 2020 19:02:58 +0000
Message-ID: <2673E963-830B-410C-BE4D-18807CDF93F4@fb.com>
References: <4c4aa12b1ffde80ebbf49ad78b6046889f4226c0.camel@fuzziesquirrel.com>
 <CAGm54UGorGfE-0FKj_+o3faU6sO-DW5jRoqPxFzx0VKwuD6Juw@mail.gmail.com>
 <CAPnigKku77Tc60TAAb_yTJaWNePYWM204BF8erJS7CjhxrAPRA@mail.gmail.com>
 <20200602230639.GK17541@heinlein> <20200603000702.GC7478@mauery.jf.intel.com>
In-Reply-To: <20200603000702.GC7478@mauery.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2601:647:4b00:fd70:18e2:66b5:5e3d:3d1a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e36aac6-88fc-4d96-44e8-08d807f0bae9
x-ms-traffictypediagnostic: BYAPR15MB3096:
x-microsoft-antispam-prvs: <BYAPR15MB30968E02975368C0594FAD84DD880@BYAPR15MB3096.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 04238CD941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JDvAfMGNAQ9doXd9PYYu3cquEDY1AdBwxH8msr3E4O5AZRCYQ6JStl5kgtKSi/SD9TAtc8WNkVHbvIw/mi1ZQHFBbI8PrmpRXDLwKIrbmQHlX53gcZloDAgjpgizxDtJYSJybeMaxEGPJnZ1HI9aHU0sbFMUfOrU2qoeHy/Cef23TrtYYqhvA54jIUkvTO4BwNKp/VDBtw4T0+Q6IYdqNyH8lQpBupPIc8jId0V0scOvUUd00azrjMlLQigXE42PwgdWIDYKRu9quevAzocGyllMNIAHDkYSu2g5PEwgoDL36egnZpdE/BX08is9/uVKM5hvUcpgjifvRHmmLpF7Wfwp7uEd+aqYMwDldFODK1Oyke9QD32jSdo12lRK7gS425iViP0UATdVK/UfqoVi9LsibHXFSLWOidVvfv0KX+TyoG/ar6yaUveVsAIyo2n4ZpLOrTARSHo1tSbllQ8Cxw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(396003)(376002)(136003)(366004)(39860400002)(346002)(478600001)(6512007)(966005)(33656002)(71200400001)(4326008)(2616005)(2906002)(83380400001)(6486002)(8676002)(186003)(5660300002)(76116006)(64756008)(53546011)(66446008)(110136005)(66946007)(66556008)(8936002)(86362001)(316002)(36756003)(54906003)(66476007)(6506007)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: BWFOzV9eY8vBgT16RW/tdXkec2hlXkgrQg2ABqVhO2uqF9BaJYquY0oeUBX+yHTPWjDTzhTlvkVpiet0v+2udmEpNiM4USr1tGhSn2lH9g7JA7WqLpYGP7O2QmpkNBDFygZDpdMkGurC0QXznUKvOvxz2GxYkEAkVrmkGO4c9Tit3PtVYWq4edAa/UvjWsCgMClLcNzGH6/f5eC8+eQsQvjpxMgD8U0XMLfbci9CbwCUk/3Zq9n05bel7GIuZ59kVSTN6I+dtJ6IUNyOHxqTUugm6Tkdn/ydywvYllESQ8TCmPxoUul7vvCZCVZoDNBX1QXHwLU/zEXCrP0ZuNn9M0zu3bQUz4xncfERgne1HbXfS0xXyeDVo6YMo9EDhQaWrGaHPwky2GN1XaSPrX6rvPRh0aJt0iZ1YQ90uUa7NGorjxN9cxdMjdtj4BxNmQ1ksaJnXEuU7zcOAM2D+aihGn02mAuS9vGo+OjttkQTxH7MjZeT2uIUziT020FRXiiuEObUQUg0bMVxP0HR4AC4DGuFU86P1GX9K02oUhY5cg2NWTg8hKdljAppb5Sswyab
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <3CA1C60C90ACC540A5C1C32275FA2A62@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e36aac6-88fc-4d96-44e8-08d807f0bae9
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2020 19:02:58.0981 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P7FptLmoonpO3eQR4uEKNwE/gfOkY6cmmnVhJ83WTETuxf09SogWrFzOSGdmtza5n+KqOVcMlU3BTYB6uAaTGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3096
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-03_13:2020-06-02,
 2020-06-03 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 lowpriorityscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 cotscore=-2147483648
 adultscore=0 priorityscore=1501 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006030147
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
Cc: openbmc <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 =?utf-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>,
 William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDYvMi8yMCwgNTowOCBQTSwgIm9wZW5ibWMgb24gYmVoYWxmIG9mIFZlcm5vbiBN
YXVlcnkiIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFicy5v
cmcgb24gYmVoYWxmIG9mIHZlcm5vbi5tYXVlcnlAbGludXguaW50ZWwuY29tPiB3cm90ZToNCg0K
ICAgIE9uIDAyLUp1bi0yMDIwIDA2OjA2IFBNLCBQYXRyaWNrIFdpbGxpYW1zIHdyb3RlOg0KICAg
ID5PbiBNb24sIEp1biAwMSwgMjAyMCBhdCAxMTowNzo0NlBNIC0wNzAwLCBXaWxsaWFtIEtlbm5p
bmd0b24gd3JvdGU6DQogICAgPj4gSWYgeW91IHVzZSB0aGUgZm10IGxpYnJhcnkgaXQgd291bGQg
b25seSByZXF1aXJlIG9uZSBleHRyYSB0ZW1wb3Jhcnkgc3RyaW5nDQogICAgPj4gdG8gYmUgY29u
c3RydWN0ZWQgYW5kIGl0IHdvcmtzIHRyaXZpYWxseSB3aXRoIHNvbWV0aGluZyBsaWtlIHBob3Nw
aG9yDQogICAgPj4gbG9nZ2luZy4NCiAgICA+Pg0KICAgID4+IGxvZzxsZXZlbDo6SU5GTz4oZm10
Ojpmb3JtYXQoIk15IGVycm9yOiB7fSIsIGZpbGVuYW1lKSk7DQogICAgPj4NCiAgICA+PiBJdCBh
bHNvIGhhcyB0aGUgYWR2YW50YWdlIG9mIHVuZGVyc3RhbmRpbmcgYmFzaWMgYysrIHR5cGVzIGxp
a2UNCiAgICA+PiBzdGQ6OnN0cmluZ3MgYW5kIHN0ZDo6c3RyaW5nX3ZpZXdzLg0KICAgID4+DQog
ICAgPj4gT24gTW9uLCBKdW4gMSwgMjAyMCBhdCA4OjMzIFBNIOmDgembtyA8eXVsZWkuc2hAYnl0
ZWRhbmNlLmNvbT4gd3JvdGU6DQogICAgPj4NCiAgICA+PiA+IEkgaGF2ZSBhIGJpdCBjb25jZXJu
IGFib3V0IHRoaXMuIFRoZSBleGlzdGluZyBwaG9zcGhvci1sb2dnaW5nIEFQSQ0KICAgID4+ID4g
ZG9lcyBub3Qgc3VwcG9ydCB0aGlzIHdlbGwuDQogICAgPj4gPiBTcGVjaWZpY2FsbHksIGl0IGRv
ZXMgbm90IHN1cHBvcnQgdGhlICJwcmludGYiIHdheSB0byBnZW5lcmF0ZSBhDQogICAgPj4gPiBz
dHJpbmcgd2l0aCB0aGUgdmFyaWFibGVzIHRvIGxvZy4NCiAgICA+PiA+IFNvIHByZXZpb3VzbHkg
d2UgdHlwaWNhbGx5IHB1dCB0aGUgdmFyaWFibGVzIGluIGVudHJpZXMuDQogICAgPj4gPiBJIGRv
IGFncmVlIHRoYXQgbG9nZ2luZyB0aGUgdmFyaWFibGVzIGluIHRoZSBNRVNTQUdFIGZpZWxkIGlz
IG11Y2ggYmV0dGVyLg0KICAgID4+ID4gQnV0IHRvIGVuY291cmFnZSBzdWNoIGxvZ2dpbmcsIHRo
ZSBsb2dnaW5nIEFQSSBzaG91bGQgYmUgZW5oYW5jZWQgdG8NCiAgICA+PiA+IHN1cHBvcnQgdGhl
ICJwcmludGYiIHdheS4NCiAgICA+PiA+IEUuZy4NCiAgICA+PiA+ICAgICBsb2c8bGV2ZWw6OklO
Rk8+KCJTb21ldGhpbmcgaXMgd3Jvbmc6ICVzOiVkIiwgeHgsIHh4eCk7DQogICAgPj4gPiBpcyBt
dWNoIGJldHRlciB0aGFuOg0KICAgID4+ID4gICAgIHN0ZDo6c3RyaW5nIHRvX2xvZyA9IHh4eDsg
Ly8gZ2VuZXJhdGUgdGhlIG1lc3NhZ2UgbWFudWFsbHkNCiAgICA+PiA+ICAgICBsb2c8bGV2ZWw6
OklORk8+KHRvX2xvZyk7DQogICAgPj4gPg0KICAgID4+ID4gT3RoZXJ3aXNlLCBpdCdzIHJlYWxs
eSBub3QgY29udmVuaWVudCB0byB3cml0ZSBzdWNoIGxvZ2dpbmcgY29kZS4NCiAgICA+PiA+DQog
ICAgPg0KICAgID5TZXBhcmF0ZSBmcm9tIHRoaXMgcHJvcG9zYWwgZnJvbSBCcmFkLCBJJ2QgbGlr
ZSB0byB3b3JrIG9uIGENCiAgICA+bmV4dC1nZW5lcmF0aW9uIG9mIHBob3NwaG9yLWxvZ2dpbmcu
ICBXaGVuIHdlIG9yaWdpbmFsbHkgaW1wbGVtZW50ZWQNCiAgICA+cGhvc3Bob3ItbG9nZ2luZyB3
ZSB3ZXJlIGFsbCBwcmV0dHkgbmV3IHRvIEMrKzE0LiAgSSB0aGluayB0aGVyZSBjYW4gYmUNCiAg
ICA+c29tZSBncmVhdCBpbXByb3ZlbWVudCBpbiB0aGUgc3ludGF4IG9mIHBob3NwaG9yLWxvZ2dp
bmcgbm93IHRoYXQgd2UNCiAgICA+aGF2ZSBDKysxNyAoYW5kIG1vcmUgZXhwZXJpZW5jZSkuDQog
ICAgPg0KICAgID5UaGUgYmlnZ2VzdCBjaGFuZ2UgSSdkIGxpa2UgdG8gZG8gaXMgaW4gdGhlIHdh
eSB0aGUgc3RydWN0dXJlZCBlbnRyaWVzDQogICAgPmFyZSBkZWZpbmVkLCBidXQgSSB0aGluayB3
ZSBjYW4gaW1wcm92ZSB0aGUgdmVyYm9zaXR5IG9mIHN5bnRheCBpbg0KICAgID5tYWtpbmcgYSBs
b2cgaW4gZ2VuZXJhbC4NCg0KICAgIE9uZSBtb3JlIGNoYW5nZSBJIHdvdWxkIGxpa2UgdG8gc2Vl
IGlzIGEgd2F5IHRvIGFjdHVhbGx5IGhhdmUgdGhlIHJlYWwgDQogICAgZmlsZW5hbWUgYW5kIGxp
bmUgbnVtYmVyIHNob3cgdXAgaW4gdGhlIHN5c3RlbWQgbG9nLiBSaWdodCBub3cgdGhlIA0KICAg
IGZpbGVuYW1lIGFuZCBsaW5lIG51bWJlciBhcmUgYWx3YXlzIHRoZSBsb2dnZXIgY29kZToNCiAg
ICAgICAgQ09ERV9MSU5FPTc2DQogICAgICAgIENPREVfRlVOQz1oZWxwZXJfbG9nDQogICAgICAg
IENPREVfRklMRT0uLi4vdXNyL2luY2x1ZGUvcGhvc3Bob3ItbG9nZ2luZy9sb2cuaHBwDQoNCkl0
IHdpbGwgYmUgZ29vZCBpZiB3ZSBjYW4gaGF2ZSBkZWJ1ZyBhcyBhIGxldmVsIGFuZCBzb21laG93
IHdlIGNhbiBzZWUNCm1lc3NhZ2VzIGZyb20gZGVidWcgYnkgZW5hYmxpbmcgb3IgZGlzYWJsaW5n
Lg0KDQogICAgSXQgbG9va3MgbGlrZSBDKysyMCBoYXMgYSBzaGlueSBuZXcgaGVscGVyIGZvciB0
aGlzOiBzb3VyY2VfbG9jYXRpb24NCiAgICBodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5j
b20vdjIvdXJsP3U9aHR0cHMtM0FfX2VuLmNwcHJlZmVyZW5jZS5jb21fd19jcHBfZXhwZXJpbWVu
dGFsX3NvdXJjZS01RmxvY2F0aW9uJmQ9RHdJRmFRJmM9NVZEMFJUdE5sVGgzeWNkNDFiM01VdyZy
PXY5TVUwS2k5cFduVFhDV3dqSFBWZ3BuQ1I4MHZYa2tjcklhcVU3VVNsNWcmbT1xRmJ1N0ZkRlFT
SFZNeTRadk10SERINVJ6WVFucU1VUV9UMGg0cUwwWGQwJnM9UVJzYlF2YjRMS0FFb2E4QUlURnlQ
Rmhjb0NTVkh0RkxNT1U2NlVvZFBuTSZlPSANCg0KICAgIC0tVmVybm9uDQoNCiAgICA+U29tZSBl
eGFtcGxlIHN5bnRheDoNCiAgICA+DQogICAgPi8vIEN1cnJlbnQgc3ludGF4IChhbmQgSSdtIGJl
aW5nIGVzcGVjaWFsbHkgdmVyYm9zZSBvbiB0aGUgbmFtZXNwYWNlcykuDQogICAgPnBob3NwaG9y
Ojpsb2dnaW5nOjpsb2c8cGhvc3Bob3I6OmxvZ2dpbmc6OmxldmVsOjpFUlI+KCJTb21lIG1lc3Nh
Z2UiLA0KICAgID4gICAgcGhvc3Bob3I6OmxvZ2dpbmc6OmVudHJ5KCJFWEFNUExFPSVzIiksIGV4
YW1wbGVfc3RyKTsNCiAgICA+DQogICAgPi8vIFBvdGVudGlhbCBzeW50YXgNCiAgICA+bGc6OmVy
cm9yKCJTb21lIG1lc3NhZ2UiLCAiRVhBTVBMRSJfcywgZXhhbXBsZV9zdHIpOw0KICAgID4NCiAg
ICA+SW4gYSBjb2RlLXJldmlldyBJIHdhcyBvbiwgd2UgaGFkIHNvbWUgZGlzY3Vzc2lvbnMgYWJv
dXQgaG93IGRpZmZpY3VsdA0KICAgID5pdCBpcyB0byBjcmVhdGUgZGF0YSB0aGF0IGlzbid0IGlu
IHRoZSAiLW8gdmVyYm9zZSIgYW5kIEkgdGhpbmsgV2lsbGlhbQ0KICAgID5hbmQgTGVpIGFyZSBi
b3RoIHJlZmVycmluZyB0byB0aGF0IGFzIHdlbGwuICBJIGFtIGNvbmNlcm5lZCB0aGF0IGENCiAg
ICA+Z2VuZXJpYyBmb3JtYXQgbGVhZHMgdXMgbW9yZSB0byB1bnN0cnVjdHVyZWQgbG9nZ2luZywg
d2hpY2ggcGVyc29uYWxseSBJDQogICAgPmRvbid0IGxpa2UuICBNeSBzdWdnZXN0aW9uIGlzIHRo
YXQgd2UgaGF2ZSBzb21lIGVhc3kgc3ludGF4IHRvIGluZGljYXRlDQogICAgPiJhbHNvIHB1dCB0
aGlzIHN0cnVjdHVyZWQgZGF0YSBpbnRvIHRoZSByYXcgbWVzc2FnZSIgc28gdGhhdCBteSBleGFt
cGxlDQogICAgPmFib3ZlIHRoZSBtZXNzYWdlIGJlY29tZXMgIlNvbWUgbWVzc2FnZS4gRVhBTVBM
RT0ndGhlIHN0cmluZyciLg0KICAgID4NCiAgICA+SSdkIGJlIGludGVyZXN0ZWQgdG8gaGVhciB3
aGF0ICJuZXh0IGdlbmVyYXRpb24gbG9nZ2luZyIgb3RoZXJzIGhhdmUgaW4NCiAgICA+bWluZC4N
CiAgICA+DQogICAgPi0tIA0KICAgID5QYXRyaWNrIFdpbGxpYW1zDQoNCg0KDQo=
