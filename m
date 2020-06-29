Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8432820DD1D
	for <lists+openbmc@lfdr.de>; Mon, 29 Jun 2020 23:25:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wgWh4Z2zzDqfZ
	for <lists+openbmc@lfdr.de>; Tue, 30 Jun 2020 07:25:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=4449e0f4bb=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=KLjb0lra; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=Kwe4zpW1; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wg415BvSzDqf6
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jun 2020 07:05:04 +1000 (AEST)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05TKDcsX015403; Mon, 29 Jun 2020 13:20:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=GsXHA5HbCP9b6bypiZ9484xD+llSWKk6ShgR50Ietec=;
 b=KLjb0lraSsec6qZrINDZwcFLNCsLLaYa+QM8f2knXQ+98+p/VC+dTIyc3QFVsacgNf4f
 N8RogsRjGo0ubaYIxG+hmhd6YNsy/Jh5Rqk54w2oXKQWFAOVtOQCGTPNFjaM+0DAxoVj
 fVy8+M8j9rEw4haxN6anfOdqzS71hRjIKRU= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 31xp3rebwn-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 29 Jun 2020 13:20:48 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 29 Jun 2020 13:20:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UfFdKH26RBA7UHTwL4vslMJ1OF2VOW9Uhaqwju1aUVNtbn2aBK8GNEu22ONXfJGEDOXKNb4494V8ofC6K+ueTNo+449+RUpPu96aTQ060182ynQtFXYmVaIUF6ecA2zkit7cDhuBzeui+srYsSTSMkrUcsNVTg0D49xI4/1kdJLvV5YC7tmPxnAUCBljv6UrjauGMl9UwqS6SKt3KX2g+hx9pME6wNFseKX+GCDBdE7qMcxyQUuhs/M28gIGxNkW/oH4os60xWDYf2qP1sJsAKIkj7S8hcu4Z55tb3JVIrRe/IEZnP2u/kHkj3RkLWNSACmvzSf4tBFIKYqgob40gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GsXHA5HbCP9b6bypiZ9484xD+llSWKk6ShgR50Ietec=;
 b=DYTTVIJUAX0inW5H9vsCd4je+xfT0BYPpX/ZKwE6f73aAHhXBiueasugTkEV0IPnGeEBCqCvvMLl5WGZRIWZONXzpnD7GrhwwSfcfYj++Aa5qcm7orWr/CRWc9BwTB3esrinMDrQQSFpiAxK/2OLV0hHNGWI/ygU/5Rk+wTLfIY4PO29Vb8xt9M77qgy0fPqiLYaRGp0eZcI7hwiQWob9dMGw2XOpDH2I+xMbRJ3ZPFVahark4dhuusTeVR6GjUOW//ylnERgMQ0f5EptHHnrUzXB6Kper7DynTULvAKBFaCj7Z3nNNM1s1xBncVPWH/7cCf3K9H2UiXL7C/vqCG4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GsXHA5HbCP9b6bypiZ9484xD+llSWKk6ShgR50Ietec=;
 b=Kwe4zpW1O6OdMpi1IRX3RvpJaPEQcqx2XPbSqNAdVWUBYkW8fqnuxIZVd8iI/K2hV0IjaawUZN6yHRYLP2FltiFOzHr7dINAU1eWPYQXGDFzda0iiosQojNjHhKANErj0NcE7yOAbRH0PTuOmp7AnIZqHB8BNLFI/ynK77baEUo=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2950.namprd15.prod.outlook.com (2603:10b6:a03:f6::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.26; Mon, 29 Jun
 2020 20:20:44 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::34b8:e690:6dfc:8faf]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::34b8:e690:6dfc:8faf%4]) with mapi id 15.20.3131.026; Mon, 29 Jun 2020
 20:20:44 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "Khetan, Sharad" <sharad.khetan@intel.com>, krtaylor
 <kurt.r.taylor@gmail.com>,
 "Matuszczak, Piotr" <piotr.matuszczak@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC health statistics
Thread-Topic: OpenBMC health statistics
Thread-Index: AdZOLPWDDv1xqlasSdaTVfH5fJhasAAEUDIAAAHHnRD//6WEgA==
Date: Mon, 29 Jun 2020 20:20:44 +0000
Message-ID: <79C50A42-5BBB-40C0-8578-6659CA3DE1E1@fb.com>
References: <f4e49a09aca2431e921866d1b6cbbe6c@intel.com>
 <0a8a5506-0305-12aa-91c5-6c61d359a808@gmail.com>
 <MWHPR11MB13899C8D065A07EE2A2F31BCF16E0@MWHPR11MB1389.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB13899C8D065A07EE2A2F31BCF16E0@MWHPR11MB1389.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:3e91]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 003a75a8-70de-498c-2981-08d81c69e6eb
x-ms-traffictypediagnostic: BYAPR15MB2950:
x-microsoft-antispam-prvs: <BYAPR15MB29501276A24A07D816A12B26DD6E0@BYAPR15MB2950.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 044968D9E1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: khJBU9Y0A4mvJ4ikIPstcr0sFMQl/YeRd5ugG8LwlC252I/1GHzUNn6rw000mc+t+wZ75P+f9asQ97LwYak8q9E//pWCiWYa3fZfwELZ+2BJAuS76w8ioJD62fkhuwXT0gXw1tJ0yftjRNCbL83ey45xJhXzXA0PhafVGWZJl+kedd6XJHZ+hZ1w8+rfeMJk+YxMPfV/UvxP6/RK5VD6iOLzwk3Ub1uD1n07zpBkI2l1T0uSqJCpupA8cOIjiHeG39eW7txraH0reeItP0aQiI1vRY/KxLs5eGlJ8aZRYtcTBAsIpC4pKebxlkl4z0kAByD6vWtA6LUecNKXqwNKvw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(366004)(136003)(346002)(396003)(376002)(186003)(36756003)(8936002)(7116003)(3480700007)(316002)(478600001)(33656002)(2906002)(110136005)(64756008)(2616005)(66446008)(6486002)(8676002)(86362001)(6512007)(5660300002)(71200400001)(6506007)(83380400001)(66556008)(66476007)(76116006)(66946007)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: XWP1bcBKhvdATyENqiHiaUGyyLVjc+tEg+S5bQv/N/s0wzNHZJ+xMk5cYifHFCZUcu2oZ+jGfWMellT+dO4pYlZjkXmRJM9Q4PQ5IwX0uTTr2uZ3QrFHSRUehIWPqBoKOcA/aIHDuxu+WAOZLzHcRKxA3OdpT+s98FViPiAwUqFmBgNvNvOVswJ7xWuZYtXRkLl98YVYEiw95k53jMZwUWFpMSJ0ae5dycyf7HoCi1DePxqd5PEkXOrol+LRgqIFlQe0QWvwwfXlvT9BkWRtOOEdAYGWCisJ7nfAqSi5tQv6m4khgvT2iN62SjAU+5HeTsUBIHDOhf+35sz4eSe+zDl87Nb0WYpnNIJ0kxK/XwkzvbQjPF5P2/sQC8MPQ7icePkyj3JfZ67uSSBQGEnDmX/CGvfK1bREB/K+JG6N2ZTjylVXGArgz/9w6+KR46jm+9+Zg3IjFXQLSD5pGquMbJTKG6XDTzuMBVDyanNBK/KdqZNwbJVQuEk0X/ogROAsfBWOMwtlA7T5Z6gTVdE02A==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <3E00B437CB9F1947AA80C972D1017F9E@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 003a75a8-70de-498c-2981-08d81c69e6eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2020 20:20:44.3030 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JszzpBAiBz9bJd77mp9ZgatyqV26jh0g6qcY6c6pWP0x3CE9TIysWzUZn6D23Hygm1Ha6K4wFRhGMCFeZpNMPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2950
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-06-29_21:2020-06-29,
 2020-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxlogscore=999
 adultscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1011
 cotscore=-2147483648 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006290128
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

V2UgY2FuIGhhdmUgYSBmb2xkZXIgImhvdyB0byIgdW5kZXIgZ3VpZGVsaW5lcyBhbmQgdGhpcyBk
b2N1bWVudCBzaG91bGQgZml0IHRoZXJlLg0KDQpSZWdhcmRzDQotVmlqYXkNCg0K77u/T24gNi8y
OS8yMCwgMTE6NTEgQU0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBLaGV0YW4sIFNoYXJhZCIgPG9w
ZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMub3psYWJzLm9yZyBvbiBiZWhh
bGYgb2Ygc2hhcmFkLmtoZXRhbkBpbnRlbC5jb20+IHdyb3RlOg0KDQogICAgSSBhZ3JlZS4gQmFz
ZWQgb24gZGVzY3JpcHRpb24gaXQgYXBwZWFycyB0aGUgYmVzdCBmaXQgaXMgZG9jcy9kZXZlbG9w
bWVudCwgYXMgZGV2ZWxvcGVycyB3aWxsIG5lZWQgdG8gcHJvdmlkZSByaWdodCBob29rcy4NCg0K
ICAgIElmIGl0cyByZWFsbHkgZW5kLXVzZXIgZm9jdXNlZCwgdGhlbiBpdCBjYW4gcGVyaGFwcyBn
byBpbiB1c2VyZ3VpZGUgLSB3aGljaCBuZWVkcyBhIGxvdCBtb3JlIGRvY3VtZW50YXRpb24g8J+Y
iiBmb3IgdXNlcnMuDQoNCiAgICBUaGFua3MsDQogICAgLVNoYXJhZA0KDQogICAgLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCiAgICBGcm9tOiBvcGVuYm1jIDxvcGVuYm1jLWJvdW5jZXMrc2hh
cmFkLmtoZXRhbj1pbnRlbC5jb21AbGlzdHMub3psYWJzLm9yZz4gT24gQmVoYWxmIE9mIGtydGF5
bG9yDQogICAgU2VudDogTW9uZGF5LCBKdW5lIDI5LCAyMDIwIDEwOjU0IEFNDQogICAgVG86IE1h
dHVzemN6YWssIFBpb3RyIDxwaW90ci5tYXR1c3pjemFrQGludGVsLmNvbT47IG9wZW5ibWNAbGlz
dHMub3psYWJzLm9yZw0KICAgIFN1YmplY3Q6IFJlOiBPcGVuQk1DIGhlYWx0aCBzdGF0aXN0aWNz
DQoNCiAgICBPbiA2LzI5LzIwIDEwOjU0IEFNLCBNYXR1c3pjemFrLCBQaW90ciB3cm90ZToNCiAg
ICA+IEhlbGxvLA0KICAgID4gDQogICAgPiBJIHdvdWxkIGxpa2UgdG8gdXBsb2FkIHRoZSBPcGVu
Qk1DIGhlYWx0aCBzdGF0aXN0aWNzIGRlc2lnbiBndWlkZSBmb3IgcGVvcGxlIHRoYXQgd291bGQg
bGlrZSB0byBpbnRlZ3JhdGUgdGhlIE9wZW5CTUMgdG8gdGhlaXIgcGxhdGZvcm1zLiBJIHdvdWxk
IG5vdCBsaWtlIHRvIHB1dCBpdCBpbnRvIC9kb2NzL2Rlc2lnbnMsIHNpbmNlIHRoaXMgaXMgbm90
IGV4YWN0bHkgZGVzaWduIGhvdyBpdCB3aWxsIGJlIGltcGxlbWVudGVkLiBUaGlzIGRvY3VtZW50
IHdhcyBtZWFudCB0byBndWlkZSB0aGUgT3BlbkJNQyB1c2VycyBob3cgdGhleSBjYW4gaW1wbGVt
ZW50IEJNQyBoZWFsdGggc3RhdGlzdGljcyB0aGVtc2VsdmVzLg0KDQogICAgSSBkb24ndCBzZWUg
YSBwcm9ibGVtIHdpdGggYSBndWlkZWxpbmVzL2Jlc3QgcHJhY3RpY2VzIHR5cGUgZ3VpZGUgbGl2
aW5nIGluIGRvY3MsIGJ1dCBwcm9iIG5vdCBpbiBkZXNpZ25zLiBNYXliZSBpbiBhcmNoaXRlY3R1
cmUgb3IgdXNlcmd1aWRlIG9yIGRldmVsb3BtZW50PyBLaW5kIG9mIGhhcmQgdG8gc2F5IHdpdGhv
dXQgc2VlaW5nIGl0LiBZb3UgY291bGQgYWxzbyBhbHdheXMgYWRkIGl0IHRvIHRoZSB3aWtpLg0K
DQogICAgS3VydCBUYXlsb3IgKGtydGF5bG9yKQ0KDQogICAgPiANCiAgICA+IFRoZSBxdWVzdGlv
biBpcywgd2hlcmUgd291bGQgYmUgdGhlIGJlc3QgcGxhY2UgdG8gdXBsb2FkIHN1Y2ggZG9jdW1l
bnQ/DQogICAgPiANCiAgICA+IFBpb3RyIE1hdHVzemN6YWsNCiAgICA+IC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
ICAgID4gSW50ZWwgVGVjaG5vbG9neSBQb2xhbmQgc3AuIHogby5vLg0KICAgID4gdWwuIFNsb3dh
Y2tpZWdvIDE3MywgODAtMjk4IEdkYW5zaw0KICAgID4gS1JTIDEwMTg4Mg0KICAgID4gTklQIDk1
Ny0wNy01Mi0zMTYNCiAgICA+IA0KDQoNCg==
