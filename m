Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFA283A5C
	for <lists+openbmc@lfdr.de>; Tue,  6 Aug 2019 22:37:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4635zF32qSzDr6b
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2019 06:37:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=3121eb8562=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="MsyF1wiS"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="YfVmjK6p"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4635yF6H6JzDqWM;
 Wed,  7 Aug 2019 06:36:16 +1000 (AEST)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x76KCce5011103; Tue, 6 Aug 2019 13:36:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=LDXuH0raVHMTDBYZ19uGzRZvCmTl1kH5bdFSFQrIonc=;
 b=MsyF1wiSp8uLVnJALpcwBgjD0dt+YwhUbivh3ZsHkttsLuCrZqbebjBJSw2RsPQNfhqf
 ojyqFRSac76/yXyM3tE1bHu8fxJdahTRzcfpFQjAaj5Xx7WVae1jn/W8yTpO5mN49K4v
 2/YJ09KaFxhkeg/edlfKJiJNCVTK3W7OKSg= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2u7a4y9qsn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 06 Aug 2019 13:36:00 -0700
Received: from ash-exopmbx201.TheFacebook.com (2620:10d:c0a8:83::8) by
 ash-exhub204.TheFacebook.com (2620:10d:c0a8:83::4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 6 Aug 2019 13:35:58 -0700
Received: from ash-exhub204.TheFacebook.com (2620:10d:c0a8:83::4) by
 ash-exopmbx201.TheFacebook.com (2620:10d:c0a8:83::8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 6 Aug 2019 13:35:58 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.100) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 6 Aug 2019 13:35:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a1CIT/pW+bJgj8neEJVhNv+Ml7I0+BRR6ZHYF+5t29TuAiufcFDnG7Wi8h8caVCvQXP07QJznKXUL7YR07gVymFWofZlFRIdo/kKPVFVujJ6woauvYgrhgLN/PicaTwxeLG5Z41ycPxK1ToX91xD96lRukxiQvsSKrM0g9NZL0iCcYxntj0NF/XH4dzvy0KZUPTmuYcuk8KLaPy2+iVXPvedvQ48AE++vjnYvo/0K+NblHcTo68/hEOw2ZZvj9UzqGdqwx+INQxVBczxaRWJS+jB9Apvu40yRb9jsnhz5eMmkgp/gLqRV4QmMGH8mwprSTluwJk/VdM4PSRge7Te7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDXuH0raVHMTDBYZ19uGzRZvCmTl1kH5bdFSFQrIonc=;
 b=OtA8JbhX5hBYYuSD9I1xdeCwjZ2AMoG/7i0OnmYHHl8yxPm3wZGmT1ko0ClcHUS7vP4+w5he2gpx5N6r4kGyPMdUC06iYNSNseNoYd3gN5iaTardWwdgGi8LdXSzjjAlb79bUqyq07rTwdvCoUm+FtMxK37R570zx6n7dlV7qD6H09zLWwkRQKdo4MgqDtVbo7wBT6ENQ3c0A9wgdjtuseEGJmXCuNqTAgAtGFVvOnneXK776ezIj524jvGnbFAx0RWEnZ5/jzBfDZcIfDMntOXKAX62NSQT535XZvSdMDWrjvZwO7lrDFqYZT6jnpsO1v7YEMMxSyYs7VzwY8AT9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=fb.com;dmarc=pass action=none header.from=fb.com;dkim=pass
 header.d=fb.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDXuH0raVHMTDBYZ19uGzRZvCmTl1kH5bdFSFQrIonc=;
 b=YfVmjK6p31PR4/v6vOFm3TzfbMJxiaeoV8Lk6xssi2QzItdOPj39rdCn8SJCX6OWNTqwNiLNsZA9uAoFqW93pxUiVy8aXjEmUCsGG87rPI7BlDvY9e+ICh3eXR8U0SvLs7gcvCIeCYzoxGzgi+6KHNwjZ7QMoRhTP71jTEel374=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1287.namprd15.prod.outlook.com (10.172.181.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.20; Tue, 6 Aug 2019 20:35:43 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::8c93:f913:124:8dd0]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::8c93:f913:124:8dd0%8]) with mapi id 15.20.2136.018; Tue, 6 Aug 2019
 20:35:43 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] dt-bindings: Add pxe1610 as a trivial device
Thread-Topic: [PATCH] dt-bindings: Add pxe1610 as a trivial device
Thread-Index: AQHVQPAx3fyCvJ4gPEWA6m7KAh2pXabYSgMAgAAAqID//7IWgIAPeSsAgAa/44A=
Date: Tue, 6 Aug 2019 20:35:43 +0000
Message-ID: <E47FF678-1B81-4C00-9328-B0452D74E62D@fb.com>
References: <20190723002052.2878847-1-vijaykhemka@fb.com>
 <CAL_Jsq+uAjK6+xzkyOhcH96tZuqv7i6Nz5_nhUQkZ2adt2gutA@mail.gmail.com>
 <CAL_Jsq+Kw0TFW_v54Y2QHcChqpNDYhFyCSO5Cj-be9yLSCq-Pw@mail.gmail.com>
 <F7BAC53E-925E-4FA4-815D-ACB82DF8D240@fb.com>
 <CACPK8XehEoakQxvQhC1cU5tvZaVbLOARtZ4xc6dD8sx9WDiPuA@mail.gmail.com>
In-Reply-To: <CACPK8XehEoakQxvQhC1cU5tvZaVbLOARtZ4xc6dD8sx9WDiPuA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::1:f3bb]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d64a5e45-dd7c-4dda-a8fb-08d71aada76b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CY4PR15MB1287; 
x-ms-traffictypediagnostic: CY4PR15MB1287:
x-microsoft-antispam-prvs: <CY4PR15MB1287E53A7F5209E18720D46CDDD50@CY4PR15MB1287.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0121F24F22
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(346002)(39860400002)(136003)(396003)(366004)(189003)(199004)(36756003)(316002)(5660300002)(102836004)(8936002)(53546011)(76176011)(229853002)(256004)(476003)(6506007)(99286004)(86362001)(25786009)(305945005)(54906003)(2906002)(478600001)(7416002)(14454004)(6436002)(6512007)(46003)(6486002)(64756008)(6246003)(66446008)(4326008)(81156014)(81166006)(446003)(6116002)(66556008)(66476007)(66946007)(6916009)(91956017)(486006)(53936002)(33656002)(4744005)(8676002)(71200400001)(186003)(71190400001)(76116006)(2616005)(11346002)(7736002)(68736007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1287;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SWQioAlyBZyEFTV6cQE7gwmU+sFGgdYIklyLaz7hwaYx6grPGO7Wmofb2PHgpnoX+q+n0xYYRTajjaXkp/I0CCvvbR8RV0taR4iTin5tg3r8WzoqXb/WdnSknEm5Phg9lM4h1EW0zltcZLen/S/zvC8VL63r0TakYSgs+whe8xQsnBxuwpkPGI/sPFJo1hE8TJfDQveOPEn505yiSN52qySJzS4ZZWaBwEfgRkqDFSCS1edU/v2C4mgE9NcsRcp1zz/wuQB1bXtR4bvza1jWmUOFNhQCs5gCDLES8C2o9zGun7MWlMTg4Ez2f4JfTP3Yf3lp4dB5xsrQrxS9dt8yvXs39kXBaAWXmk6qttXVAwbvgn4DYKDn5xjBB4A9vsjnpu+NO/bdOHQewMs/EP9bZwzaEYRCn7MQsXCtnNPayds=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7157F82B2A3E1544A74117E5DB728CBD@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d64a5e45-dd7c-4dda-a8fb-08d71aada76b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2019 20:35:43.5470 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vijaykhemka@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1287
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-06_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908060178
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
 Jeremy Gebben <jgebben@sweptlaser.com>, Rob Herring <robh+dt@kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Sm9lbCwNCkkgaGF2ZSBhZGRlZCBhbGwgMyBpZCBpbiB0aGUgZG9jdW1lbnRhdGlvbiBwYXRjaCBh
bmQgSSBhbSBub3Qgc3VyZSBpZiB0aGF0IHBhdGNoIGhhcyBiZWVuIGFwcGxpZWQgb3Igbm90Lg0K
DQpSZWdhcmRzDQotVmlqYXkNCg0K77u/T24gOC8xLzE5LCAxMTozMSBQTSwgIkpvZWwgU3Rhbmxl
eSIgPGpvZWxAam1zLmlkLmF1PiB3cm90ZToNCg0KICAgIEFkZCBweGUxNjEwIGFzIGEgdHJpdmlh
bCBkZXZpY2UNCiAgICANCiAgICANCiAgICANCiAgICBPbiBUdWUsIDIzIEp1bCAyMDE5IGF0IDE3
OjE0LCBWaWpheSBLaGVta2EgPHZpamF5a2hlbWthQGZiLmNvbT4gd3JvdGU6DQogICAgPg0KICAg
ID4gT24gNy8yMy8xOSwgNzo1MyBBTSwgIlJvYiBIZXJyaW5nIiA8cm9iaCtkdEBrZXJuZWwub3Jn
PiB3cm90ZToNCiAgICA+DQogICAgPiAgICAgT24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgODo1MCBB
TSBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPiB3cm90ZToNCiAgICA+ICAgICA+DQog
ICAgPiAgICAgPiBPbiBNb24sIEp1bCAyMiwgMjAxOSBhdCA2OjQ2IFBNIFZpamF5IEtoZW1rYSA8
dmlqYXlraGVta2FAZmIuY29tPiB3cm90ZToNCiAgICA+ICAgICA+ID4NCiAgICA+ICAgICA+ID4g
VGhlIHB4ZTE2MTAgaXMgYSB2b2x0YWdlIHJlZ3VsYXRvciBmcm9tIEluZmluZW9uLiBJdCBhbHNv
IHN1cHBvcnRzDQogICAgPiAgICAgPiA+IG90aGVyIFZScyBweGUxMTEwIGFuZCBweG0xMzEwIGZy
b20gSW5maW5lb24uDQogICAgPg0KICAgID4gICAgIFdoYXQgaGFwcGVuZWQgdG8gdGhlIG90aGVy
IGNvbXBhdGlibGVzPyBTL3cgZG9lc24ndCBuZWVkIHRvIGtub3cgdGhlDQogICAgPiAgICAgZGlm
ZmVyZW5jZXM/DQogICAgPiBBcyBmYXIgYXMgZHJpdmVyIGlzIGNvbmNlcm5lZCwgaXQgZG9lc24n
dCBuZWVkIHRvIGtub3cgZGlmZmVyZW5jZXMuDQogICAgDQogICAgWW91IGhhdmUgdGhlc2UgdGhy
ZWUgSURzIGluIHRoZSBkcml2ZXI6DQogICAgDQogICAgIHB4bTEzMTANCiAgICAgcHhtMTMxMA0K
ICAgICBweGUxNjEwDQogICAgDQogICAgU28gYWxsIHRocmVlIGNvdWxkIGJlIGxpc3RlZCBpbiB0
aGUgZG9jdW1lbnRhdGlvbj8NCiAgICANCiAgICBSb2IsIGlzIHRoaXMgd2hhdCB5b3Ugd2FudGVk
IFZpamF5IHRvIGRvPw0KICAgIA0KDQo=
