Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8248B1E8C50
	for <lists+openbmc@lfdr.de>; Sat, 30 May 2020 01:48:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Yh8k4lKDzDqnf
	for <lists+openbmc@lfdr.de>; Sat, 30 May 2020 09:48:22 +1000 (AEST)
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
 header.s=facebook header.b=jQR9T6j2; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=I9+sJU1z; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Yh7p17vxzDqlS;
 Sat, 30 May 2020 09:47:27 +1000 (AEST)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04TNd2lF024963; Fri, 29 May 2020 16:47:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=/RYMGJ2Okat5dDtOGmDpmxH6n4WAqD0HlqiSukw323E=;
 b=jQR9T6j2UlpwKW+wjihWwN6AZre19Wfwklg29azRfGG1jkyAM3OjBH0JwHksXrSP6dKK
 v9rRFx6n0UkdPbPMdxAzrFdL6cghpwp3/Se9lhyXLkXiTvpV2RtWTbX648ocwq5KnuAY
 36Iv7Tgqfb9uV64nzRk9YZ/UDG57MBVkFz4= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 31b3yrcyag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 29 May 2020 16:47:18 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.101) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 29 May 2020 16:47:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CcQ/fO9ws1xymHIgvraPd82/SgyYG6rS9e6Mg/MsC4szfZwwrIb0WTgGWqPgp5bVOybsm1zsrsZTTqlVr7zc0R5CCEoQO+rdOGSn+J8Aoi6vkAHz0wHJJa1E4hOW6fSRhVjNwdWOIutThPPqowUVn3FxqN9pOpwJasVOm7Os3u9xxJk4QnoNNgO/2KqrZGojj439WhWcehBqBhqoNTMnA37IeW/kCUMroYyPHzE94A6MxHAURx1q4wpFLedCu92VPHdZyidL6/KJ/IAJTKDKR2noucn19VfobpnAWEPXzX9UqdmPnysuha5H+715aLUh5IEl1kLkbq7hqJdBCnuf0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/RYMGJ2Okat5dDtOGmDpmxH6n4WAqD0HlqiSukw323E=;
 b=dZhs7xKed6JiLRPcB8zA9q1sXUUW2JusPA7GRsUgqd/WLuP+VpiGvH5J7g97VrvBZQd/be/jpt0reXurz6O2V1ZFFOIHyX/gCJFwdPqx3u4i7xVtPB1wW/SJL0fkpbwIh9iyGu4OulF1y6a8FTgt04A69ve/uUW9aqKz4EFhDEIgmY1uCcOg8KLma0QQgZMf9u1sfjH0o3XBjmyg0kALfLE2KNN14e+S42R2fKbieqBDDWNIEcNhaWKXNwS5SrKYW7cyiLNfAmB2T8pTrgal8OYOqkllrfA4EFOIwM9BYnebew5UMBUz71nYW/g6KtDv5PRM50yKKi1j7+J91LbUZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/RYMGJ2Okat5dDtOGmDpmxH6n4WAqD0HlqiSukw323E=;
 b=I9+sJU1zLJLY+zyrlDhWpbUiYnnlKoaTCzGqfP08ZuZDjPC31uTlSD2KXKj2OWz8+nN6suX7FnXZNuvC5M9BSCgXUV6L0mszvLXyRk792OqtEovaf24kOG9NT+y1taE5pl2WXoSsFTE3kxH3r4xC0v/+Vqc2uenVfaCn86euEBs=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2918.namprd15.prod.outlook.com (2603:10b6:a03:fe::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Fri, 29 May
 2020 23:47:13 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::34b8:e690:6dfc:8faf]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::34b8:e690:6dfc:8faf%4]) with mapi id 15.20.3045.018; Fri, 29 May 2020
 23:47:13 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Guenter Roeck <linux@roeck-us.net>, Manikandan Elumalai
 <manikandan.hcl.ers.epl@gmail.com>, "linux-hwmon@vger.kernel.org"
 <linux-hwmon@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH v2] hwmon:(adm1275) Enable adm1278 ADM1278_TEMP1_EN
Thread-Topic: [PATCH v2] hwmon:(adm1275) Enable adm1278 ADM1278_TEMP1_EN
Thread-Index: AQHWNbdFvmcC7XgBI0iZGne+tKUE7Ki+5FUAgACFwID//9wAAA==
Date: Fri, 29 May 2020 23:47:13 +0000
Message-ID: <86D10289-7406-4114-B058-1B2693E3C4E1@fb.com>
References: <20200529124607.GA3469@cnn>
 <6F5BD2D3-997D-4607-BC0C-B36497B51D13@fb.com>
 <41b169b7-83cb-c814-179e-9e62f17f27d8@roeck-us.net>
In-Reply-To: <41b169b7-83cb-c814-179e-9e62f17f27d8@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:9985]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e60a29b1-49a5-4039-ca66-08d8042a9cb7
x-ms-traffictypediagnostic: BYAPR15MB2918:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB2918475FF1CAC8F826B5054ADD8F0@BYAPR15MB2918.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 04180B6720
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6MtBi8VV7hCtvfhkhHnUY1mtb2ng+EeTLlUnfO2/NdP43hd6Z2MeVAExQ2H2aggEOHZ6pE6pGKFxvpvtvun8xzpiF54JaXvnjxcOg4qIGP/CjcoatITK8qadOi+xYcVMc3cChEUiRm/bp5AZiL8xAeRWUavn72MB4g9fsKd8sOQSdQnpGmkDoclpW17T4IFB7o9VJayOfNSFeGgNADHD/c+36QK3KdW5BFKhM7cWEH/uAqmeQvoNZhXqqPP/sLyYVYvJl1x09Rq7hHeKrC+hw7uYk8YZbYmJTDoolucG/H5gvJ4lHdCZ17q34zHuOL0R8sbAv6/DJw2PWaTOw+N9Pw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(346002)(136003)(39860400002)(366004)(396003)(110136005)(4326008)(8676002)(6506007)(2616005)(64756008)(86362001)(66476007)(33656002)(66556008)(53546011)(6486002)(66446008)(66946007)(5660300002)(54906003)(8936002)(186003)(83380400001)(71200400001)(6512007)(478600001)(316002)(36756003)(76116006)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: jZF+xShicQJML+CPRfn5UGzhoxYAhqZe0elOv2jMn6TCLSFk3luXzoUth5ZGaMa2F+L0iSSoqEKQnsnk4SuF8pLZe0Q4LARIqeMbo68CDsrjgWEvkopOEIRy4aJuMrK52Ydv4tozNYlMq5Z16YIlRzeNPV8SdI8O5qKi0sQ7QCJb6WRa+LoiD8Fj9XUPEhQ+Qq07K5mqNchmIwG26eK0O6j23NWjHIiQqH5EbZPkMYA0pjdI0fssioqUr9v5YlRu1m95Yui872khzSyBwFuzuuArrWUjpCoArkfeWD5Ck0EarOMTjuQewz3QKHicFai+c2GOSHu76tbaiX3RWKb4F8KZQ0Iv8cLbI22E5t+J2WablkwufaUnY/npypOICoBL50vOl7mOu8pTX95FfQ3ujUH5jw/FjeNW+CQKqXOIfik9iGGgd2OD2//gALjP6jW3WEbVlz1GOjwtLFH5nIbTs+Fh/nFqYRlr8/64+2zTlj732VaUbBUjZr8Fd7swOFCoc5P6XLDVH4w4a4LiDktVWw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F691F52033581428C9C670C5BA0DC04@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e60a29b1-49a5-4039-ca66-08d8042a9cb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2020 23:47:13.5584 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gntFRY+cHDJXU7irl4Wxc8hADb4SbazYlrW+fC5p+nRvutdbHO4ILRHrQaeuGOhTzgYutIo5LIuFWjorxoP9RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2918
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-29_13:2020-05-28,
 2020-05-29 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0
 adultscore=0 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005290172
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
 Patrick Williams <patrickw3@fb.com>,
 "manikandan.e@hcl.com" <manikandan.e@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDUvMjkvMjAsIDExOjU2IEFNLCAiR3VlbnRlciBSb2VjayIgPGdyb2VjazdAZ21h
aWwuY29tIG9uIGJlaGFsZiBvZiBsaW51eEByb2Vjay11cy5uZXQ+IHdyb3RlOg0KDQogICAgT24g
NS8yOS8yMCAxMDo1NyBBTSwgVmlqYXkgS2hlbWthIHdyb3RlOg0KICAgID4gDQogICAgPiANCiAg
ICA+IE9uIDUvMjkvMjAsIDU6NDcgQU0sICJNYW5pa2FuZGFuIEVsdW1hbGFpIiA8bWFuaWthbmRh
bi5oY2wuZXJzLmVwbEBnbWFpbC5jb20+IHdyb3RlOg0KICAgID4gDQogICAgPiAgICAgVGhlIGFk
bTEyNzggdGVtcGVyYXR1cmUgc3lzZnMgYXR0cmlidXRlIG5lZWQgaXQgZm9yIG9uZSBvZiB0aGUg
b3BlbmJtYyBwbGF0Zm9ybSAuIA0KICAgID4gICAgIFRoaXMgZnVuY3Rpb25hbGl0eSBpcyBub3Qg
ZW5hYmxlZCBieSBkZWZhdWx0LCBzbyBQTU9OX0NPTkZJRyBuZWVkcyB0byBiZSBtb2RpZmllZCBp
biBvcmRlciB0byBlbmFibGUgaXQuDQogICAgPiAgICAgDQogICAgPiAgICAgU2lnbmVkLW9mZi1i
eSAgIDogTWFuaWthbmRhbiBFbHVtYWxhaSA8bWFuaWthbmRhbi5oY2wuZXJzLmVwbEBnbWFpbC5j
b20+DQogICAgPiAgICAgDQogICAgPiAgICAgdjI6DQogICAgPiAgICAgICAgLSBBZGQgU2lnbmVk
LW9mZi1ieS4NCiAgICA+ICAgICAgICAtIFJlbW92ZWQgQURNMTI3OF9URU1QMV9FTiBjaGVjay4N
CiAgICA+ICAgICAtLS0NCiAgICA+ICAgICAgZHJpdmVycy9od21vbi9wbWJ1cy9hZG0xMjc1LmMg
fCAyMSArKysrKysrKysrKysrKysrKy0tLS0NCiAgICA+ICAgICAgMSBmaWxlIGNoYW5nZWQsIDE3
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQogICAgPiAgICAgDQogICAgPiAgICAgZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvaHdtb24vcG1idXMvYWRtMTI3NS5jIGIvZHJpdmVycy9od21vbi9w
bWJ1cy9hZG0xMjc1LmMNCiAgICA+ICAgICBpbmRleCA1Y2FhMzdmYi4uYWI1ZmNlYiAxMDA2NDQN
CiAgICA+ICAgICAtLS0gYS9kcml2ZXJzL2h3bW9uL3BtYnVzL2FkbTEyNzUuYw0KICAgID4gICAg
ICsrKyBiL2RyaXZlcnMvaHdtb24vcG1idXMvYWRtMTI3NS5jDQogICAgPiAgICAgQEAgLTY2Niw3
ICs2NjYsMjMgQEAgc3RhdGljIGludCBhZG0xMjc1X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpj
bGllbnQsDQogICAgPiAgICAgIAkJdGluZGV4ID0gMzsNCiAgICA+ICAgICAgDQogICAgPiAgICAg
IAkJaW5mby0+ZnVuY1swXSB8PSBQTUJVU19IQVZFX1BJTiB8IFBNQlVTX0hBVkVfU1RBVFVTX0lO
UFVUIHwNCiAgICA+ICAgICAtCQkJUE1CVVNfSEFWRV9WT1VUIHwgUE1CVVNfSEFWRV9TVEFUVVNf
Vk9VVDsNCiAgICA+ICAgICArCQkJUE1CVVNfSEFWRV9WT1VUIHwgUE1CVVNfSEFWRV9TVEFUVVNf
Vk9VVCB8DQogICAgPiAgICAgKwkJCVBNQlVTX0hBVkVfVEVNUCB8IFBNQlVTX0hBVkVfU1RBVFVT
X1RFTVA7DQogICAgPiAgICAgKw0KICAgID4gICAgICsJCWNvbmZpZyA9IGkyY19zbWJ1c19yZWFk
X2J5dGVfZGF0YShjbGllbnQsIEFETTEyNzVfUE1PTl9DT05GSUcpOw0KICAgID4gICAgICsJCWlm
IChjb25maWcgPCAwKQ0KICAgID4gICAgICsJCQlyZXR1cm4gY29uZmlnOw0KICAgID4gICAgICsN
CiAgICA+ICAgICArCQkvKiBFbmFibGUgVEVNUDEgYnkgZGVmYXVsdCAqLw0KICAgID4gICAgICsJ
CWNvbmZpZyB8PSBBRE0xMjc4X1RFTVAxX0VOOw0KICAgID4gICAgICsJCXJldCA9IGkyY19zbWJ1
c193cml0ZV9ieXRlX2RhdGEoY2xpZW50LA0KICAgID4gICAgICsJCQkJCUFETTEyNzVfUE1PTl9D
T05GSUcsDQogICAgPiAgICAgKwkJCQkJY29uZmlnKTsNCiAgICA+ICAgICArCQlpZiAocmV0IDwg
MCkgew0KICAgID4gICAgICsJCWRldl9lcnIoJmNsaWVudC0+ZGV2LA0KICAgID4gICAgICsJCQki
RmFpbGVkIHRvIGVuYWJsZSB0ZW1wZXJhdHVyZSBjb25maWdcbiIpOw0KICAgID4gICAgICsJCXJl
dHVybiAtRU5PREVWOw0KICAgID4gICAgICsJCX0NCiAgICA+IFlvdSBkb24ndCBuZWVkIHRoaXMg
YWJvdmUgY29kZSByZW1vdmluZyBjaGVjayBhcyBiZWxvdyBzaG91bGQgYmUgZW5vdWdoICB0bw0K
ICAgID4gcG9wdWxhdGUgc3lzZnMgZW50cnkgeW91IG5lZWQuDQogICAgPiANCg0KICAgIFlvdSBt
ZWFuIHlvdSBhcmUgb25seSBpbnRlcmVzdGVkIGluIGhhdmluZyB0aGUgYXR0cmlidXRlLCBldmVu
IGlmIGl0IGRvZXNuJ3QNCiAgICByZXBvcnQgYW55dGhpbmcgdXNlZnVsIGJlY2F1c2UgbW9uaXRv
cmluZyBpcyBkaXNhYmxlZCBpbiB0aGUgY2hpcCA/DQogICAgU29ycnksIEkgZG9uJ3QgdW5kZXJz
dGFuZC4gQ2FuIHlvdSBlbGFib3JhdGUgPw0KU29ycnkgZm9yIG1pc2ludGVycHJldGF0aW9uLCBO
byBJIGRvbid0IG1lYW4gdGhhdC4gVGhpcyBzaG91bGQgYmUgZmluZS4NCg0KICAgIFRoYW5rcywN
CiAgICBHdWVudGVyDQoNCiAgICA+ICAgICAgCQkvKiBFbmFibGUgVk9VVCBpZiBub3QgZW5hYmxl
ZCAoaXQgaXMgZGlzYWJsZWQgYnkgZGVmYXVsdCkgKi8NCiAgICA+ICAgICAgCQlpZiAoIShjb25m
aWcgJiBBRE0xMjc4X1ZPVVRfRU4pKSB7DQogICAgPiAgICAgQEAgLTY4MSw5ICs2OTcsNiBAQCBz
dGF0aWMgaW50IGFkbTEyNzVfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwNCiAgICA+
ICAgICAgCQkJfQ0KICAgID4gICAgICAJCX0NCiAgICA+ICAgICAgDQogICAgPiAgICAgLQkJaWYg
KGNvbmZpZyAmIEFETTEyNzhfVEVNUDFfRU4pDQogICAgPiAgICAgLQkJCWluZm8tPmZ1bmNbMF0g
fD0NCiAgICA+ICAgICAtCQkJCVBNQlVTX0hBVkVfVEVNUCB8IFBNQlVTX0hBVkVfU1RBVFVTX1RF
TVA7DQogICAgPiAgICAgIAkJaWYgKGNvbmZpZyAmIEFETTEyNzhfVklOX0VOKQ0KICAgID4gICAg
ICAJCQlpbmZvLT5mdW5jWzBdIHw9IFBNQlVTX0hBVkVfVklOOw0KICAgID4gICAgICAJCWJyZWFr
Ow0KICAgID4gICAgIC0tIA0KICAgID4gICAgIDIuNy40DQogICAgPiAgICAgDQogICAgPiAgICAg
DQogICAgPiANCg0KDQo=
