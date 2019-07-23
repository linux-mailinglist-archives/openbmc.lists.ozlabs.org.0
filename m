Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F1006725C8
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 06:15:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45thpr3rs3zDq7d
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 14:15:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=210739c354=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="PFJyStGn"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="AYz6RSwc"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tQ7T6zQ5zDqPK;
 Wed, 24 Jul 2019 03:14:11 +1000 (AEST)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6NHCS3h004784; Tue, 23 Jul 2019 10:13:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=q7m+wdUcy8qrhv771o0GLvTZRQeSRVcmqdnU8ncka78=;
 b=PFJyStGnZU454aQyHSqs1dgNGD9TmpY1HQvXSxeqY3ZwQjdQ2asoUVFeTxpFPZKM7RTr
 rYKZn+13yDpJu5q0zyFYU3zRmNPAUMDi5uNgxxpSjCwTKa4Gcp/GQySfOIgxYjbeUoNc
 oJXKUjB6VtffF4hwtedvcVgoX+jjGedKSPw= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2tx61303xv-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 23 Jul 2019 10:13:52 -0700
Received: from prn-hub05.TheFacebook.com (2620:10d:c081:35::129) by
 prn-hub02.TheFacebook.com (2620:10d:c081:35::126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 23 Jul 2019 10:13:51 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Tue, 23 Jul 2019 10:13:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gXw+rC2OBHEXcDdv7zai66j4ofAxSEMdgK3wVf7kRRwChGKC3rYpVIgaBf7nBaBcyxN7tS2ujVaVN+seXr6r+Qd6V7QTAWbjqDDsoKA3GoHr3yh3MMKjigXKMhxfrqsEGL8crrZ1N8LutrRlVnj0DKbOXtK0isbaAy5RLb77EIrFJ6V6aq/IP6Cro3vPf/s6QgioCBckAzvdHEPNAx2DmsJA8o/KNhHr0N18T8G30/H3aapi/K9zlqT1eiU4pln3VB0+NonbH48Y3bIwhh78bYqLtRvNWN6UvwBohtUi0uNsH1HK/Jzg7lFkahlY4uXLIuIoMvx6o45KtekVo0oXjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7m+wdUcy8qrhv771o0GLvTZRQeSRVcmqdnU8ncka78=;
 b=fBvcobVQJmnJvMj/1/nCusjRX/w+9XZ11ZtmW+ztRX2LOeAAkzkeKAfCf8MXVdFPoTA4h2nUwcJDOHJv63EVxiE9DMnfsWpbT9Mfv3ntTKzlrHJoeERA5EddL81AilSB5MQ03PizKCGm0/VrMHB1OuunP1uYes0B3IgMJBWJiB2yleIHKgElcSRqSj/riGeTnCBipEUon0vIRiDiHQ1+KAgmpeHXjbAUlo9kI7KVXq4UiU4IkmUEn5iiogCAPwyIKPVnniypl+grPYr2EW4Wb4UKp03rLIjm6OHhMXXsXIJ4qz9VNQ8YQR65HEz2nF8yl/2C4QwJgQD1N8dPV5HJ/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=fb.com;dmarc=pass action=none header.from=fb.com;dkim=pass
 header.d=fb.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7m+wdUcy8qrhv771o0GLvTZRQeSRVcmqdnU8ncka78=;
 b=AYz6RSwcPs/IohizWqTSC8f6hXf60ga33AQURk7pGq6/7CYADvv8a0GqZTCtYZq6ckQnaeiMohYYzPZV9x76wIiiQk1OXZnOcTMx10KxLZC8bXvrHhBqgKPb1RzWDs3p64IVK5wAh7QMQHZ2G0oGI5s7QKRQsXv84/lRUehIU7k=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1605.namprd15.prod.outlook.com (10.175.119.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Tue, 23 Jul 2019 17:13:49 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::fce3:df83:1cbf:e65e]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::fce3:df83:1cbf:e65e%12]) with mapi id 15.20.2094.013; Tue, 23 Jul
 2019 17:13:49 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: Add pxe1610 as a trivial device
Thread-Topic: [PATCH] dt-bindings: Add pxe1610 as a trivial device
Thread-Index: AQHVQPAx3fyCvJ4gPEWA6m7KAh2pXabYSgMAgAAAqID//7IWgA==
Date: Tue, 23 Jul 2019 17:13:49 +0000
Message-ID: <F7BAC53E-925E-4FA4-815D-ACB82DF8D240@fb.com>
References: <20190723002052.2878847-1-vijaykhemka@fb.com>
 <CAL_Jsq+uAjK6+xzkyOhcH96tZuqv7i6Nz5_nhUQkZ2adt2gutA@mail.gmail.com>
 <CAL_Jsq+Kw0TFW_v54Y2QHcChqpNDYhFyCSO5Cj-be9yLSCq-Pw@mail.gmail.com>
In-Reply-To: <CAL_Jsq+Kw0TFW_v54Y2QHcChqpNDYhFyCSO5Cj-be9yLSCq-Pw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:380::1:14f7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d908b121-2685-459c-124b-08d70f9120e3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CY4PR15MB1605; 
x-ms-traffictypediagnostic: CY4PR15MB1605:
x-microsoft-antispam-prvs: <CY4PR15MB160580E5AFB2317EDEE72099DDC70@CY4PR15MB1605.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1122;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(39860400002)(366004)(376002)(346002)(396003)(199004)(189003)(316002)(2906002)(4326008)(36756003)(6246003)(305945005)(11346002)(6116002)(486006)(53936002)(6512007)(6436002)(229853002)(99286004)(6486002)(66476007)(5660300002)(66946007)(71200400001)(71190400001)(66556008)(66446008)(64756008)(81156014)(25786009)(76176011)(68736007)(102836004)(186003)(91956017)(54906003)(256004)(76116006)(8676002)(8936002)(81166006)(7416002)(476003)(14454004)(46003)(7736002)(2616005)(53546011)(6506007)(446003)(86362001)(478600001)(33656002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1605;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vgZh5+M/ZEvjha/PCgH15880chTIpipSh4ZrXPeeMOvvecVCPGtbwH77YHqEdo1CCljzMfEZW4LJcpsr8vxWOfZWd6fiiUFEo80NBiNxurJchR0f0HAhRqDjQ1qE9abmK9XSryfV/Df7FRMXByv5I0Wk98wGzsYHqLJxawAKX9Z3PrNG0lf2mY6ZcXcjxbhhruvJPtrjE97NlpymEYUhZLWEYEFXd0Y0zBOmYTGxBJwZe8OF+cmIj6aCfDGHi/5ds04SXLRssf06QuN8b4PxXCLaNN1p09w6/r/XeA4tGhvGu5k3q6tnZsNe4wKrJi/yKixsmu6qUYaWeIosVMRhnB7Pw+v3l3ieTwCfILl1VJeK+xnMK+Hhk+CAQGa3nMde3oVjoj6CUYBM0XoUg2ZEeoPxLo5dJNduCZQdZa2sg5s=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6A4F4E0F5F9CCA4596181D63CAAD2BD0@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d908b121-2685-459c-124b-08d70f9120e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 17:13:49.1112 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vijaykhemka@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1605
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-23_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907230172
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Jiri Kosina <trivial@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Anson Huang <anson.huang@nxp.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Patrick Venture <venture@google.com>,
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jeremy Gebben <jgebben@sweptlaser.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDcvMjMvMTksIDc6NTMgQU0sICJSb2IgSGVycmluZyIgPHJvYmgrZHRAa2VybmVs
Lm9yZz4gd3JvdGU6DQoNCiAgICBPbiBUdWUsIEp1bCAyMywgMjAxOSBhdCA4OjUwIEFNIFJvYiBI
ZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+IHdyb3RlOg0KICAgID4NCiAgICA+IE9uIE1vbiwg
SnVsIDIyLCAyMDE5IGF0IDY6NDYgUE0gVmlqYXkgS2hlbWthIDx2aWpheWtoZW1rYUBmYi5jb20+
IHdyb3RlOg0KICAgID4gPg0KICAgID4gPiBUaGUgcHhlMTYxMCBpcyBhIHZvbHRhZ2UgcmVndWxh
dG9yIGZyb20gSW5maW5lb24uIEl0IGFsc28gc3VwcG9ydHMNCiAgICA+ID4gb3RoZXIgVlJzIHB4
ZTExMTAgYW5kIHB4bTEzMTAgZnJvbSBJbmZpbmVvbi4NCiAgICANCiAgICBXaGF0IGhhcHBlbmVk
IHRvIHRoZSBvdGhlciBjb21wYXRpYmxlcz8gUy93IGRvZXNuJ3QgbmVlZCB0byBrbm93IHRoZQ0K
ICAgIGRpZmZlcmVuY2VzPw0KQXMgZmFyIGFzIGRyaXZlciBpcyBjb25jZXJuZWQsIGl0IGRvZXNu
J3QgbmVlZCB0byBrbm93IGRpZmZlcmVuY2VzLg0KICAgIA0KICAgID4gPg0KICAgID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBWaWpheSBLaGVta2EgPHZpamF5a2hlbWthQGZiLmNvbT4NCiAgICA+ID4gLS0t
DQogICAgPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdHJpdmlhbC1kZXZp
Y2VzLnlhbWwgfCAyICsrDQogICAgPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
DQogICAgPiA+DQogICAgPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvdHJpdmlhbC1kZXZpY2VzLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvdHJpdmlhbC1kZXZpY2VzLnlhbWwNCiAgICA+ID4gaW5kZXggMmU3NDJkMzk5ZTg3
Li4xYmU2NDg4MjhhMzEgMTAwNjQ0DQogICAgPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy90cml2aWFsLWRldmljZXMueWFtbA0KICAgID4gPiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdHJpdmlhbC1kZXZpY2VzLnlhbWwNCiAgICA+ID4g
QEAgLTk5LDYgKzk5LDggQEAgcHJvcGVydGllczoNCiAgICA+ID4gICAgICAgICAgICAgICMgSW5m
aW5lb24gSVIzODA2NCBWb2x0YWdlIFJlZ3VsYXRvcg0KICAgID4gPiAgICAgICAgICAgIC0gaW5m
aW5lb24saXIzODA2NA0KICAgID4gPiAgICAgICAgICAgICAgIyBJbmZpbmVvbiBTTEI5NjM1IChT
b2Z0LSkgSTJDIFRQTSAob2xkIHByb3RvY29sLCBtYXggMTAwa2h6KQ0KICAgID4gPiArICAgICAg
ICAgIC0gaW5maW5lb24scHhlMTYxMA0KICAgID4gPiArICAgICAgICAgICAgIyBJbmZpbmVvbiBQ
WEUxNjEwLCBQWEUxMTEwIGFuZCBQWE0xMzEwIFZvbHRhZ2UgUmVndWxhdG9ycw0KICAgID4NCiAg
ICA+IFRoZSBjb21tZW50IGdvZXMgYWJvdmUgdGhlIGVudHJ5Lg0KICAgID4NCiAgICA+ID4gICAg
ICAgICAgICAtIGluZmluZW9uLHNsYjk2MzV0dA0KICAgID4gPiAgICAgICAgICAgICAgIyBJbmZp
bmVvbiBTTEI5NjQ1IEkyQyBUUE0gKG5ldyBwcm90b2NvbCwgbWF4IDQwMGtoeikNCiAgICA+ID4g
ICAgICAgICAgICAtIGluZmluZW9uLHNsYjk2NDV0dA0KICAgID4gPiAtLQ0KICAgID4gPiAyLjE3
LjENCiAgICA+ID4NCiAgICANCg0K
