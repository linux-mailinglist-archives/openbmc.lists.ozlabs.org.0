Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 158B18DFA6
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2019 23:14:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4682Q84hf1zDqyg
	for <lists+openbmc@lfdr.de>; Thu, 15 Aug 2019 07:14:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=3129636cf0=wilfredsmith@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="N2SrVaEF"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="GUnq+/9u"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4682PN6DN8zDqkm
 for <openbmc@lists.ozlabs.org>; Thu, 15 Aug 2019 07:13:24 +1000 (AEST)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7EL9M0G004023; Wed, 14 Aug 2019 14:13:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=WQ2GHERHP1V+zX3N5AIUjd90q5+V4oCfRtKfSvHK4UQ=;
 b=N2SrVaEFEhW2c9/CH+iq8WR0I0C304tbv7XUIfw4VZodjLWOLJDXlx1JpTsHGlGCPGBG
 UgyYUc1h2iEIOdoySkzzb21MvMcc3+pqEZBrouZuisqIFp9crMP+B0jDLKYvWngTMolc
 evYNORF5mq6kSi0vamZuXCJkGaVUF4mYJYI= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2ucqp80jrd-18
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 14 Aug 2019 14:13:15 -0700
Received: from prn-hub03.TheFacebook.com (2620:10d:c081:35::127) by
 prn-hub01.TheFacebook.com (2620:10d:c081:35::125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Wed, 14 Aug 2019 13:48:11 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Wed, 14 Aug 2019 13:48:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KzM/N0SjdJW/ZMJMJaW5XiqKeD4+6LVhvPv2kx0SV783jSLiyfi/IVz4p/28jw/TyEk1it+Z8q3FI9ogV4j26CjWDJvi3zo4eTUrC/70EqJIFQEw4xnUdp+rjEGaGr5iBF/r+jruHTO6Q268y60O+pkeu8qaET7+cmJz/+6k3SWJQRSLaOdAixeqyLkOIwlXwTCVRyskz7antHwtgs/9qZOBg7oIb1+rTi5PJI3lsuG35hgvgLtDZAFXXIVWEXTWO+c/UseJZjVC2hOQ2b7VavUdmwJ0MQz8szovQaBOt5qra+u4Gqp9NM9zP4uVSIsojsJAbMpM/L/0YEjRvn9o3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQ2GHERHP1V+zX3N5AIUjd90q5+V4oCfRtKfSvHK4UQ=;
 b=nwD88U+oC2MdZB4JyepF/PhDDDHPkPXzcVWbBQ1UK7zclspf5XfONvbBqUKh605S0tslYNQHENIAbpT+DeVqCaDPG6Hi0YO9anv5Hl/aAFW44tAzXEeew0h6JX1McrosLs7DeXxMnfV6nSMG5FR+BO9A9Md+SEYnR0PnP89TbxRAQME2d2jGdKlcXo4ulVOr6QbsGWDLuMMfjRTWztYkkyfJ0381AyniDsUywwVu98F1u0ASQokCs9Tkg6EivbmEU3RkGjJ3TgwVlbqtgVHgfcsyIHRNm7GpG0AbOtRN0wasyLDKQrT63hBJpmwf/Uw/6urlw3euc2wxSh9XCfmyoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQ2GHERHP1V+zX3N5AIUjd90q5+V4oCfRtKfSvHK4UQ=;
 b=GUnq+/9u7zASoQoTFhfFGYy2p+KcGbYSU0WMj69BNSMld4VbBP8f78UvRyeIuxM1fslQF/TRvkDx298ZBcdsEhx4caUNU0L4ULKBhjHfrmUf9nStTV2wbBQY/RXG3196QYUipSaBoNiSsXYiddPIe8GMHCYLLQjMmxskzmuTuHw=
Received: from MN2PR15MB3680.namprd15.prod.outlook.com (52.132.173.209) by
 MN2PR15MB2878.namprd15.prod.outlook.com (20.178.251.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Wed, 14 Aug 2019 20:48:09 +0000
Received: from MN2PR15MB3680.namprd15.prod.outlook.com
 ([fe80::b9ff:f089:c837:4a20]) by MN2PR15MB3680.namprd15.prod.outlook.com
 ([fe80::b9ff:f089:c837:4a20%5]) with mapi id 15.20.2157.022; Wed, 14 Aug 2019
 20:48:09 +0000
From: Wilfred Smith <wilfredsmith@fb.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: Policy on Tools Posting
Thread-Topic: Policy on Tools Posting
Thread-Index: AQHVUXIgQSRlsTKwM0GgAlElzpdXaqb4g1cAgAKc6gA=
Date: Wed, 14 Aug 2019 20:48:09 +0000
Message-ID: <1BC46BE3-51F7-442A-8269-6528E1B8D996@fb.com>
References: <6BC2AA78-97AF-4D38-A876-F9E50BADE98E@fb.com>
 <13f8bb86-eb14-4f8c-b03f-3912aa601fe8@www.fastmail.com>
In-Reply-To: <13f8bb86-eb14-4f8c-b03f-3912aa601fe8@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::7c14]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f94ac2e6-b221-43d2-63fc-08d720f8b783
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR15MB2878; 
x-ms-traffictypediagnostic: MN2PR15MB2878:
x-microsoft-antispam-prvs: <MN2PR15MB28788599B42EBE27F6AC0F68BDAD0@MN2PR15MB2878.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(396003)(366004)(346002)(376002)(136003)(189003)(199004)(6116002)(7736002)(305945005)(8676002)(486006)(2616005)(476003)(81166006)(5660300002)(86362001)(14454004)(8936002)(91956017)(99286004)(81156014)(76116006)(478600001)(446003)(11346002)(66556008)(66446008)(64756008)(66946007)(66476007)(25786009)(36756003)(256004)(186003)(4326008)(102836004)(6506007)(3480700005)(46003)(14444005)(76176011)(5024004)(33656002)(71190400001)(53936002)(6246003)(6916009)(2906002)(6512007)(316002)(6486002)(229853002)(6436002)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR15MB2878;
 H:MN2PR15MB3680.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tOrpFgx4VO5FdCVSo189xBFlGh7OiRC2e12wyhOPKTNfzDg49OfLviQ+G/VSLWA+f+bJiNNgWhe0r3kiKvzBRlyYKncJzcFDWiUv8kbdZy+i1WemFwXHT+TpTYUNVuvKTAMEegq2hPLGWG4GX8lLJ0ha8YKfvXjuLllQATXU3zJrfzsF6wl4L6Acn9EBBciTn3jXQv8BY1i+1yEab4wIPbGUy44Aia57STqbLHTTshrZvSjWaiDP8xMubpDDHlBVuNtHWcDGMOfWddKXW/Iu0M6yS/AFElfUQQ237F1kTBWW/4rQUiodkcK44ZX1VDjgrwJY245JrX8NGz+T2d92tJG0JDkM+aZtfq8qDWD/g4T+NMHH/sxX5orx1QcYti3wJyVuVCDdX9udpIiMAbv93OStEOvdPyIb6BuvNYZW7fg=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <78A0D4C3704024419F3F6B0BC779B4FA@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f94ac2e6-b221-43d2-63fc-08d720f8b783
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 20:48:09.7504 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: shLG+sLffdFxg7hKNbKx0GurY/8TPewr1E1pk6LLE+GzpezDZio0vLhxRlWO90ksutkOJpQyALu6UW3rSAWE9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR15MB2878
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-14_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908140192
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

PiANCj4gQXJlIHRoZXJlIGRlc2NyaXB0aW9ucyBhbmQgZXhhbXBsZSB1c2FnZSBkb2N1bWVudGVk
IGFueXdoZXJlPyBUaGF0DQo+IHdvdWxkIHByb2JhYmx5IGhlbHAgdXMgc29ydCBvdXQgd2hhdCB0
aGUgcG9zc2liaWxpdGllcyBhcmUuDQoNCg0KDQpUaGUgbWFpbGluZyBsaXN0IHN0cmlwcyBhdHRh
Y2htZW50cyBhbmQgaW1hZ2VzLCBzbyBoZXJl4oCZcyB0ZXh0IGZyb20gdGhlIGRvY3VtZW50IEni
gJl2ZSBiZWVuIGJ1aWxkaW5nIGZvciB0aGVtLiBJ4oCZbSBzdGlsbCB3b3JraW5nIG9uIHNlbnNv
ci11dGlsLiANCg0KT25jZSB5b3XigJl2ZSBtdWxsZWQgaXQgb3ZlciwgcGxlYXNlIGxldCBtZSBr
bm93IHdoZXJlIEkgc2hvdWxkIHB1dCB0aGVzZS4NCg0KRldJVywgSSB0aGluayB0aGVyZSB3aWxs
IGJlIGEgZmV3IG1vcmUgb2YgdGhlc2UgaW4gdGhlIG5lYXIgZnV0dXJlLiBUaGV54oCZcmUgZGVz
aWduZWQgdG8gYmUgYSBzaW5nbGUtZXhlY3V0YWJsZSAobGlrZSBCdXN5Ym94KSBzdWNoIHRoYXQg
TlYgc3RvcmFnZSBpcyBtaW5pbWl6ZWQuIFRoZXJlIGFyZSBidWlsZCBvcHRpb25zIGZvciBCWmlw
4oCZZWQgb25saW5lIGhlbHAgcHJvc2UgYW5kIGJhc2ggY29tcGxldGlvbi4NCg0KVGhhbmtzLA0K
DQpXaWxmcmVkDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQ0KT3ZlcnZpZXc6IGZydWlkLXV0aWwNCg0KW2ltZ10NCg0KZnJ1aWQtdXRpbCBpcyBhIEZhY2Vi
b29rLW9yaWdpbmF0ZWQgdXRpbGl0eSBmb3IgT3BlbkJNQy4gSXQgcnVucyBvbiB0aGUgc2VydmVy
4oCZcyBCTUMgYW5kIGFsbG93cyBkaXNwbGF5IG9mIHRoZSBGUlUgaW5mb3JtYXRpb24gZm9yIHRo
ZSBjb21wb25lbnRzIG9mIHRoZSBjb250YWluaW5nIHNlcnZlci4gVGhlIEZSVSBpbmZvcm1hdGlv
biBpcyB0eXBpY2FsbHkgc3RvcmVkIGluIGEgbm9uLXZvbGF0aWxlIG1lbW9yeSAoaS5lLiBFRVBS
T00sIE5PUi9OQU5EIGZsYXNoLCBTUEkpIHBhcnQgd2l0aGluIHRoZSBjb21wb25lbnQuDQoNClRo
aXMgdXRpbGl0eSBleGNsdXNpdmVseSByZWFkcyBpbmZvcm1hdGlvbiB0aGF0IGhhcyBiZWVuIG1h
ZGUgYXZhaWxhYmxlIHRocm91Z2ggdGhlIEJNQ+KAmXMgRC1CdXMgc2VydmljZSBuYW1lZCDigJx4
eXoub3BlbmJtY19wcm9qZWN0LkZydURldmljZeKAnS4gVGhlIEZydURldmljZSBzZXJ2aWNlIG1h
eSBleHBvc2UgbXVsdGlwbGUgb2JqZWN0cywgZWFjaCByZXByZXNlbnRpbmcgYSBzZXJ2ZXIgY29t
cG9uZW50LiBFYWNoIG9mIHRob3NlIHNlcnZlciBjb21wb25lbnQgb2JqZWN0cyBleHBvc2VzIHNv
bWUgbnVtYmVyIG9mIHByb3BlcnRpZXMgYXMga2V5LXZhbHVlIHBhaXJzLiBGb3IgZXhhbXBsZSwg
YSDigJxtb3RoZXJib2FyZOKAnSBjb21wb25lbnTigJ0gbWF5IGhhdmUgaXRzIENQVSB0eXBlIGFz
IGEgRlJVIHByb3BlcnR5Lg0KDQpUaGUgcHJldmlvdXMgdmVyc2lvbiBvZiB0aGlzIHV0aWxpdHkg
YWxsb3dlZCB0aGUgZGlzcGxheSBvZiB0aGUgcHJvcGVydGllcyBmb3IgYSBjb21wb25lbnQgd2hl
biBpdHMgbmFtZSB3YXMgc3BlY2lmaWVkLiBVbmZvcnR1bmF0ZWx5LCB0aG9zZSBuYW1lcyBkbyBu
b3QgYWx3YXlzIG1hcCBkaXJlY3RseSB0byB0aGUgbmFtZSBvZiBhIHNlcnZlciBjb21wb25lbnQg
b2JqZWN0LiBGb3IgZXhhbXBsZSwgdGhlIG9iamVjdCBuYW1lIGZvciB0aGUgbW90aGVyYm9hcmQg
bWF5IGJlIOKAnFRpb2dhX1Bhc3NfU2luZ2xlX1NpZGXigJ0uIEEgbWFwcGluZyBmaWxlIG1heSBi
ZSBzcGVjaWZpZWQsIGFsbG93aW5nIHRoZSBsZWdhY3kga2V5d29yZHMgdG8gYmUgbWFwcGVkIHRv
IG9uZSBvciBtb3JlIG9iamVjdCBuYW1lcyBiYXNlZCBvbiBhIHJlZ3VsYXIgZXhwcmVzc2lvbi4g
DQoNClRoZSB1dGlsaXR5IGFsc28gYWxsb3dzIHByb2JpbmcgZm9yIHRoZSBwcmVzZW5jZSBvZiBj
b21wb25lbnQgb2JqZWN0IG5hbWVzIGFuZCBwcm9wZXJ0eSBrZXkgbmFtZXMgd2l0aCBzdHJpbmcg
Y29tcGFyaXNvbnMgYWNjb21wbGlzaGVkIGJ5IG5vcm1hbCBzaGVsbCBmZWF0dXJlcy4NCg0KVXNh
Z2UNCg0KZnJ1aWQtdXRpbCBb4oCUdmVyc2lvbl0gfCBb4oCUbWFwRmlsZSBwYXRoVG9NYXBGaWxl
XSBb4oCUcGVybF0gWyBb4oCUY29tcG9uZW50IF0gY29tcG9uZW50ZXhwcl0gW+KAlHByb3BlcnR5
IHByb3BlcnR5ZXhwcl0NCiANCg0KRXhpdCBjb2Rlcw0KDQpbaW1nXQ0KDQoNCk1hcCBGaWxlIEZv
cm1hdA0KDQpUaGUgbWFwcGluZyBmaWxlIGlzIGEgVVRGLTggdGV4dCBmaWxlIGNvbnRhaW5pbmcg
b25lIG9yIG1vcmUgbWFwcGluZyBsaW5lcywgZWFjaCB0ZXJtaW5hdGVkIGJ5IGEgQyBzdGFuZGFy
ZCBuZXdsaW5lIHNlcXVlbmNlIChlLmcuIENSTEYpLg0KDQpFYWNoIG1hcHBpbmcgbGluZSBjb25z
aXN0cyBvZiBhIGtleXdvcmQsIGZvbGxvd2VkIGJ5IG9wdGlvbmFsIHdoaXRlc3BhY2UsIGFuIGVx
dWFscyBzaWduICjigJg94oCYKSxvcHRpb25hbCB3aGl0ZXNwYWNlIGFuZCBhIHJlZ3VsYXIgZXhw
cmVzc2lvbiB0aGF0IG1hdGNoZXMgdGhlIGRlc2lyZWQgY29tcG9uZW50IG9iamVjdCBuYW1lcy4g
DQoNCklmIGFueSBsaW5lIGJlZ2lucyB3aXRoIGEg4oCYI+KAmSBpbiBjb2x1bW4gMSwgaXQgd2ls
bCBiZSBpZ25vcmVkIGFuZCB0cmVhdGVkIGFzIGEgY29tbWVudCBsaW5lDQoNCkV4YW1wbGUgT3V0
cHV0DQoNClRvIHRoZSBleHRlbnQgcmVhc29uYWJsZSBhbmQgcG9zc2libGUsIG91dHB1dCBtYXRj
aGVzIHRoYXQgb2YgdGhlIG9yaWdpbmFsIGZydWlkLXV0aWwgdXRpbGl0eS4gTm8gYXR0ZW1wdCBp
cyBtYWRlIHRvIGdlbmVyYXRlIEZSVSBwcm9wZXJ0aWVzIHRoYXQgYXJlIHVuYXZhaWxhYmxlIHRo
cm91Z2ggdGhlIEZSVURldmljZSBzZXJ2aWNlLg0KDQpmcnVpZC11dGlsIA0KDQpGUlUgSW5mb3Jt
YXRpb24JCQkJCSAgICA6IFRpb2dhX1Bhc3NfU2luZ2xlX1NpZGUNCuKAlOKAlOKAlOKAlOKAlOKA
lOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlAkJCQkJICAgIDog4oCU4oCU4oCU4oCU4oCU4oCU
4oCU4oCU4oCUDQpBZGRyZXNzCQkJCSAgIAkJICAgIDogODQNCkJvYXJkX0luZm9fQU0xCQkJCQkg
ICAgOiAwMi0wMDAyNDMNCkJvYXJkX0luZm9fQU0yCQkJCQkgICAgOiBMQkctMUcNCkJvYXJkX0xh
bmd1YWdlX0NvZGUJCQkJICAgIDogMA0KQm9hcmRfTWFudWZhY3R1cmVyCQkJCSAgICA6IFdpc3Ry
bw0KQm9hcmRfTWFudWZhY3R1cmVfRGF0ZSAgICAgICAgICAJCQk6IEZyaSBBdWcgMjUgMTk6MTc6
MDAgMjAxNw0KQm9hcmRfUGFydF9OdW1iZXIgICAgICAgICAgICAgICAJCQk6IEI4MS4wMFgxMC4w
MTA5DQpCb2FyZF9Qcm9kdWN0X05hbWUJCQkJCQk6IFRpb2dhIFBhc3MgU2luZ2xlIFNpZGUNCkJv
YXJkX1NlcmlhbF9OdW1iZXIJCQkJCQk6IFdUSDE3MzQwMzhaU0ENCkJ1cwkJCQkJCQkJCQk6IDYN
CkNoYXNzaXNfSW5mb19BTTEJCQkJCQkJOiBNN01YNTQ2NzAwMDI2DQpDaGFzc2lzX0luZm9fQU0y
CQkJCQkJCTogXzcxQzlONTcwMDc3NA0KQ2hhc3Npc19QYXJ0X051bWJlcgkJCQkJCTogQjgxLjAw
WDAxLjAxMDQNCkNoYXNzaXNfU2VyaWFsX051bWJlcgkJCQkJCTogV1RGMTczNzBEMk1BMQ0KQ2hh
c3Npc19UeXBlCQkJCQkJCQk6IDIzDQpDb21tb25fRm9ybWF0X1ZlcnNpb24JCQkJCQk6IDENClBy
b2R1Y3RfQXNzZXRfVGFnCQkJCQkJOiAzNzE4NDUyDQpQcm9kdWN0X0luZm9fQU0xCQkJCQkJCTog
MDEtMDAyNTcyDQpQcm9kdWN0X0luZm9fQU0yCQkJCQkJCTogMTUwNTU0Njg1Nw0KUHJvZHVjdF9M
YW5ndWFnZV9Db2RlCQkJCQkJOiAwDQpQcm9kdWN0X01hbnVmYWN0dXJlcgkJCQkJCTogV2l3eW5u
DQpQcm9kdWN0X1BhcnRfTnVtYmVyCQkJCQkJOiBCODEuMDBYMDEuMDEwNA0KUHJvZHVjdF9Qcm9k
dWN0X05hbWUJCQkJCQk6IFR5cGU2IFRpb2dhIFBhc3MgU2luZ2xlIFNpZGUNClByb2R1Y3RfU2Vy
aWFsX051bWJlcgkJCQkJCTogV1RGMTczNzBEMk1BMQ0KUHJvZHVjdF9WZXJzaW9uCQkJCQkJCTog
UFZUDQoNCkZ1bmN0aW9uIENhbGwNCk90aGVyIHV0aWxpdGllcyBidWlsdCBvbiB0aGlzIHBsYXRm
b3JtIG1heSBhY2Nlc3MgdGhpcyBmdW5jdGlvbmFsaXR5IGJ5IHdheSBvZiBhIEMgZnVuY3Rpb24g
Y2FsbC4gVGhlIHJlc3VsdHMgb2YgdGhlIHF1ZXJ5IGFyZSB3cml0dGVuIHRvIHN0ZG91dCBhbmQg
YXJlIGlkZW50aWNhbCB0byB0aGUgY29tbWFuZCBsaW5lIHJlc3VsdHMuDQoNCmV4aXRDb2RlIDwt
IGZydWlkVXRpbCggc3RkOjpzdHJpbmcmIGNvbXBvbmVudEV4cHIsIHN0ZDo6c3RyaW5nJiBwcm9w
ZXJ0eUV4cHIsIHN0ZDo6c3RyaW5nJiBtYXBQYXRoLCBib29sIGJQZXJsUmVnRXggPSBmYWxzZSAp
OyANCg0KT3ZlcnZpZXc6IGlwbWItdXRpbA0KDQpJcG1iLXV0aWwgYWxsb3dzIGFuIElQTUIgKElQ
TUkgYnJpZGdlZCkgY29tbWFuZCB0byBiZSBzZW50IHRvIGEgdGFyZ2V0IHdpdGggdGhlIHJlc3Bv
bnNlIHdyaXR0ZW4gdG8gc3Rkb3V0LiANCltpbWddDQpVc2FnZQ0KDQpJcG1iLXV0aWwgYnVzIGFk
ZHJlc3MgbmV0Zm4gY21kSUQgW2IxIOKApiBibl0gW+KAlHJldHJpZXMgPSBuIF0gWyDigJR0aW1l
b3V0ID0gbXMgXQ0KSXBtYi11dGlsIGJ1cyBhZGRyZXNzIOKAlGZpbGUgY21kUGF0aCBb4oCUcmV0
cmllcyA9IG4gXSBbIOKAlHRpbWVvdXQgPSBtcyBdDQoNCndoZXJlOg0KCWJ1cyBhbmQgYWRkcmVz
cyBzcGVjaWZ5IHRoZSBkZXN0aW5hdGlvbiBmb3IgdGhlIG1lc3NhZ2UNCgluZXRmbiBzcGVjaWZp
ZXMgdGhlIG5ldCBmdW5jdGlvbiBpbiBoZXggKGUuZy4gMTggZm9yIE5ldEZuIDA2L0xVTiAwMCkN
CgljbWRJRCBzcGVjaWZpZXMgdGhlIGNvbW1hbmQgdG8gYmUgc2VudCAoZS5nLiAwMSBmb3IgR0VU
IERFVklDRSBJRCkNCglyZXRyaWVzIHNwZWNpZmllcyB0aGUgbnVtYmVyIG9mIHRpbWVzIHRoZSBj
b21tYW5kIHdpbGwgYmUgcmV0cmllZCwgZGVmYXVsdCBpcyA1DQoJdGltZW91dCBpcyB0aGUgbWF4
aW11bSBkZWxheSBmb3IgYSByZXNwb25zZSBpbiBtaWxsaXNlY29uZHMgKGRlZmF1bHQgaXMgMyBz
ZWNvbmRzKQ0KCWIx4oCmYm4gYXJlIGJ5dGUgYXJndW1lbnRzIGZvciB0aGUgY29tbWFuZCwgc3Bl
Y2lmaWVkIGFzIDIgaGV4IGRpZ2l0cyBwZXIgYnl0ZSB3aXRoIHdoaXRlc3BhY2UgYmV0d2VlbiBi
eXRlcw0KDQpDb21tYW5kIEZpbGUgRm9ybWF0DQpbaW1nXQ0KSWYgYSBjbWRQYXRoIGlzIHNwZWNp
ZmllZCwgZWFjaCBsaW5lIG9mIHRoZSBjb21tYW5kIGZpbGUgY29udGFpbnMgDQoJbmV0Zm4gY21k
SUQgW2Ix4oCmYm5dDQoNCndoZXJlOg0KCW5ldGZuIHNwZWNpZmllcyB0aGUgbmV0IGZ1bmN0aW9u
IGluIGhleCAoZS5nLiAxOCBmb3IgTmV0Rm4gMDYvTFVOIDAwKQ0KCWNtZElEIHNwZWNpZmllcyB0
aGUgY29tbWFuZCB0byBiZSBzZW50IChlLmcuIDAxIGZvciBHRVQgREVWSUNFIElEKQ0KCWIx4oCm
Ym4gYXJlIGJ5dGUgYXJndW1lbnRzIGZvciB0aGUgY29tbWFuZCwgc3BlY2lmaWVkIGFzIDIgaGV4
IGRpZ2l0cyBwZXIgYnl0ZSB3aXRoIHdoaXRlc3BhY2UgYmV0d2VlbiBieXRlcw0KDQpFeGl0IENv
ZGVzDQoNCltpbWddDQoNCg0KRnVuY3Rpb24gQ2FsbA0KDQpPdGhlciB1dGlsaXRpZXMgYnVpbHQg
b24gdGhpcyBwbGF0Zm9ybSBtYXkgYWNjZXNzIHRoaXMgZnVuY3Rpb25hbGl0eSBieSB3YXkgb2Yg
YSBDIGZ1bmN0aW9uIGNhbGwuIFRoZSByZXN1bHRzIG9mIHRoZSBxdWVyeSBhcmUgd3JpdHRlbiB0
byBzdGRvdXQgYW5kIGFyZSBpZGVudGljYWwgdG8gdGhlIGNvbW1hbmQgbGluZSByZXN1bHRzLg0K
DQpleGl0Q29kZSA8LSBpcG1iVXRpbCggQnl0ZSBidXMsIEJ5dGUgYWRkcmVzcywgQnl0ZSBjbWRJ
RCwgc3RkOjp2ZWN0b3I8Qnl0ZT4gYWJ5QXJncywgdW5zaWduZWQgaW50IHJldHJ5Q291bnQgPSA1
LCB1bnNpZ25lZCBsb25nIHRpbWVvdXRJbk1zID0gMzAwMCApOw0KDQpleGl0Q29kZSA8LSBpcG1i
VXRpbCggQnl0ZSBidXMsIEJ5dGUgYWRkcmVzcyxzdGQ6OnN0cmluZyYgYUNtZFBhdGgsIHVuc2ln
bmVkIGludCByZXRyeUNvdW50ID0gNSwgdW5zaWduZWQgbG9uZyB0aW1lb3V0SW5NcyA9IDMwMDAg
KTsNCg0KRXhhbXBsZSBPdXRwdXQNCg0KDQpbaW1nXQ0KDQpPSyAwMyAwMiAwMSAwNSAxMA0KDQoN
Cg0K
