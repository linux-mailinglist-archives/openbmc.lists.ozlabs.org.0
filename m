Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 164EE1E2A76
	for <lists+openbmc@lfdr.de>; Tue, 26 May 2020 20:57:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Wjrj3Q7YzDqDT
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 04:57:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=24151d482d=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=b2blv2XB; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=O78va9kH; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Wjpy1czhzDqCD
 for <openbmc@lists.ozlabs.org>; Wed, 27 May 2020 04:56:08 +1000 (AEST)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04QIow56012483; Tue, 26 May 2020 11:56:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=TZbrjP6W4MQ0RpcObhdb3lWZMxYXVLVxkiVy0DOTnAU=;
 b=b2blv2XB8F16QQcyv/fscngQ1w8bREhwEktZTzg9Tjcc8alCcFgo+mnp1mQwhDK+qf3k
 UqPd5+Ns0TbR/Vm51YO4j6GPYN1KDx1jmgmpU9OjcKgkElK5xArfX7CTdxjjCVa6eFxF
 Q2fSjJNL6fBVeXewSyeqNKzFg2e5t7r1AxY= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 317m3pvwws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 26 May 2020 11:56:03 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 26 May 2020 11:56:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jzQivIkooW+3E8IApziroNLz339Q5exvkaMlialhzGuQQECwjyMlbzMZ6yujuWUDrhPdCpCh79OI8TYufnchha+986xirXu2cE5Nvu2HD6iSr5VZubQ6oLX1pLt1P3Qcp/2WInpTE8g8djFhUCUU+PB2t+fouNbq79hxUXNl/RE8JguJygy4Ecgemp8yrx0Jm7LwvFhZ7Y3T1qbGTWHwrA/QNh0fYREbimw1IRVTGWWe/jRvjW3fyFkGcc3daXKGIl6eZg/7KZQUm3U9E7GqVp+b7R+0YrSKlFxG7D4D4IhrxSH4mwgvQVsT7d8uy3WnrMBfBZSdqifggUTq0teDww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZbrjP6W4MQ0RpcObhdb3lWZMxYXVLVxkiVy0DOTnAU=;
 b=CREKjDSdvLh42UZvHvHbsY5XFOKCYwXqMaBbpetADV/WmjgtHKBhx6PaHyCSuxCCnPFiPxLKTFBGt13630ap+gyElRIlzxX50HwEINwcYs9U1JbPoE215WW16tZ0fymnpNdSa5DQM7FE914wifLH6R0VPw1AFYzNL7COcv6M1GJZJ+yVcvEDL01/kZj2uKoqHgj93Z50QHYHjRyOtjwawyZX6nCCv2bkWqb/j0IP/phav1K1DFj4c0F1eanlhVhgzhl3ksueBnSho20OUlOziRWBg7fruhdGKqAY+XsVohNGmp3lNk9fQB1yAPTW0uFprJmknvqJDZ/R/Bgi63v2ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZbrjP6W4MQ0RpcObhdb3lWZMxYXVLVxkiVy0DOTnAU=;
 b=O78va9kHhEFJ03yMqeo3L1GcOsiiEa+zlV16eN/FZ0ZvXATOIiiPFHeedTay4kPpPq8+AmUTPrpDMScFGFFA7Q6daCByJT02SfWVaWXLEyWw4ZtgnAUOeYfZ00MrLTlnfdTc2jj+f6EDldJSjOkZklQaVkD1+91SErIYflJCc2Q=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2823.namprd15.prod.outlook.com (2603:10b6:a03:15a::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Tue, 26 May
 2020 18:56:01 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::34b8:e690:6dfc:8faf]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::34b8:e690:6dfc:8faf%4]) with mapi id 15.20.3021.029; Tue, 26 May 2020
 18:56:01 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Sui Chen <suichen6@gmail.com>, Andrew Jeffery <andrew@aj.id.au>
Subject: Re: An IPMI Request Visualization Tool
Thread-Topic: An IPMI Request Visualization Tool
Thread-Index: AQHWKXd7FHtZZKcEtUSw8M9GCTj8UKinnECAgAcMt4CABCIugIAHiyyA
Date: Tue, 26 May 2020 18:56:01 +0000
Message-ID: <755BC611-CED3-4F6E-8BCA-8150CB970CC7@fb.com>
References: <CAFaEeaFTP9v1xZefxzoU9E6h7SpjfbxVrnnSRCmJfJ3QjWRqhA@mail.gmail.com>
 <20200514135723.GE1166713@heinlein>
 <3d6db63b-f670-4e01-94c3-425f93d89708@www.fastmail.com>
 <CAFaEeaGs0GSiPp9mGVrSMB1brG19ttroPcK-x-p+BN3SnHrU4g@mail.gmail.com>
In-Reply-To: <CAFaEeaGs0GSiPp9mGVrSMB1brG19ttroPcK-x-p+BN3SnHrU4g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2601:647:4b00:fd70:18e2:66b5:5e3d:3d1a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 68695fb4-36fe-49fb-aec2-08d801a66f74
x-ms-traffictypediagnostic: BYAPR15MB2823:
x-microsoft-antispam-prvs: <BYAPR15MB28231E95D957909008F4C84BDDB00@BYAPR15MB2823.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 041517DFAB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a7TjnpnESNMARA0WmvVV8PQpzH2NRuWRi0JhnWK9MKYG6SyRSBXLHn4SI/3o2JlptM2vVa2edSR0OdFS6m30B2V5kUABqG+HQ2PW4aAh5wmG/E65KVblbMb9lT4y8BGYkRxP7EwBlw1+66W+Op1KU0zIlIqiRtlvhcY9rKGIH7ObjN/xA08Fg2PK/PCvLOvBTCc7fb+g63X2RobRd9YIkstH6JzUIMkamNICc5AUT029tUatfG2M2UbelIlp/VtTPo5zfgBiZu9R4LDoJD5ZNyNenLNDMYQ3aMK3DX36CrQfKf+5oMZ0YWpqd6sI+30qDS6S8wt6iVaM4+31aZ5QI4FZq5R4TuYL/BdZjUtVjk+XR8lfo5yyYYzDup5kXwaSbj46z6LuDze5sbpOVIRnQA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(136003)(346002)(39860400002)(376002)(396003)(316002)(966005)(478600001)(110136005)(8676002)(5660300002)(86362001)(6512007)(2906002)(2616005)(66574014)(6486002)(36756003)(66556008)(66946007)(66446008)(66476007)(64756008)(76116006)(8936002)(33656002)(186003)(4326008)(53546011)(71200400001)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: vA5wNsozxCiUxRotaGe51KULb7aTNRHiXbdo2uQkQwHFFY5w/e8I/hvqK2iO1Y91SGGWi4B9u0/y12Hk2Hu5q55lEhZrxFP5kWPoL6WBL64O6KQx0iEt/257ra4vq9dcF/VxWmzvQOX7O1shagfviFlpXXuM3e7kCSa7doQqbYbHVi//tmzSjtfZSqaXfYTAv2cCjL72jqe2rGB/i5bZsWxw33uYxILKo21I0OE6ki2GZ2eszf//JF/KPBRs5MKOlhoLwwLQQBaBHj5u0KTMYsk35iLoJHQ9rm5mgM6oybidyWQyKErShPP55JULr1dz6Gjw7/Dy9GpmSgQGajSDjHSEOzJqAgWIBypQgDfyOzQIpqtXs0QIZU1NGcBDD+DK7mHPrO4MPkm1gNkH1ocxxvb/ZIFT2ubg+O+JeWojhk8pyTre6m1f40npeTJtjfCVW4o5uZSlmk6ET8XStSyTgjC/L4qm89Yl8GSXD8byqjHHoGeyWRtcPqPnFs5kTHxu0H77ye5i5n8faW+ud6IwP18M5M/rDAamrv6yi+DtlCpGZ9hJojdKjpwJ3h/IB1Te
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <00839B680CDDAC41835A654F4C3674A2@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 68695fb4-36fe-49fb-aec2-08d801a66f74
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2020 18:56:01.7862 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zRSoPmcuEz6/qh6A6GjIVbxdEmQ8uxBXjF0CnuQN/d2KA6DdH2vTkItR+55d1ih/pRqD3iPKHzP7YaXLxbWPcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2823
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-26_02:2020-05-26,
 2020-05-26 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 clxscore=1015 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 suspectscore=0 impostorscore=0 cotscore=-2147483648
 bulkscore=0 spamscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005260146
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

DQoNCu+7v09uIDUvMjEvMjAsIDk6NDUgQU0sICJvcGVuYm1jIG9uIGJlaGFsZiBvZiBTdWkgQ2hl
biIgPG9wZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMub3psYWJzLm9yZyBv
biBiZWhhbGYgb2Ygc3VpY2hlbjZAZ21haWwuY29tPiB3cm90ZToNCg0KICAgIEhlbGxvIEFuZHJl
dyBhbmQgUGF0cmljaywNCiAgICANCiAgICBUaGFua3MgZm9yIHlvdXIgaW50ZXJlc3QhIEknbSBh
bHNvIHVzaW5nIGRidXMtcGNhcCB0byB0cmFjayBjZXJ0YWluDQogICAgaXNzdWVzIG9uIHRoZSBC
TUMgcmVjZW50bHksIGFuZCB3b3VsZCBsaWtlIHRvIGFkZCBzdXBwb3J0IGZvciBhbGwgREJ1cw0K
ICAgIG1lc3NhZ2VzIHRvIHRoZSB2aXN1YWxpemF0aW9uIHRvb2wsIG1ha2luZyBpdCBzb21ld2hh
dCByZXNlbWJsZSBhIEdVSQ0KICAgIHZlcnNpb24gb2YgZGJ1cy1wY2FwLg0KICAgIFRoZSBnb2Fs
IHdvdWxkIGJlIHRvIGJlIGFibGUgdG8gdXNlIHRoaXMgdG9vbCB0byBpbnZlc3RpZ2F0ZSBib3Ro
IERCdXMNCiAgICBhbmQgSVBNSS4gVGhlIHdheSBJIHBsYW4gdG8gdXNlIGl0IHdvdWxkIGJlIG1v
cmUgc2ltaWxhciB0byBob3cgSSB1c2UNCiAgICBHUFVWaWV3IChmdWxsLXN5c3RlbSB0aW1lbGlu
ZSByYXRoZXIgdGhhbiBpbnNwZWN0aW5nIGluZGl2aWR1YWwNCiAgICBwYWNrZXRzKQ0KICAgIA0K
ICAgIElmIHlvdSBhc2sgaG93IHRoaXMgdXNlciBpbnRlcmZhY2UgbWlnaHQgZGlmZmVyIGZyb20g
dGhlIGFscmVhZHkNCiAgICBleGlzdGluZyBkYnVzIHZpc3VhbGl6ZXJzIHN1Y2ggYXMgYnVzdGxl
LCBteSBhbnN3ZXIgd291bGQgYmU6IGl0IHdpbGwNCiAgICBwcmVzZW50IGluZm9ybWF0aW9uIGlu
IGEgd2F5IHRoYXQncyBtb3JlIHJlbGV2YW50IHRvIHRoZSBCTUMsIHB1dHRpbmcNCiAgICBhIGJp
dCBtb3JlIGZvY3VzIG9uIEJNQy1zcGVjaWZpYyBEQnVzIG1lc3NhZ2VzLCBzdWNoIGFzIEhXTW9u
IGFuZA0KICAgIFJlZEZpc2ggREJ1cyBtZXNzYWdlcywgdG8gcHJlc2VudCBpbmZvcm1hdGlvbiBp
biBhIGhpZ2ggc2lnbmFsLW5vaXNlDQogICAgcmF0aW8gd2F5Lg0KICAgIA0KICAgIElmIHRoaXMg
bWFrZXMgc2Vuc2UgdG8geW91LCBjYW4gSSBrbm93IHdoYXQgbWlnaHQgYmUgYSBiZXR0ZXIgd2F5
IHRvIHByb2NlZWQ6DQogICAgMSkgQ3JlYXRlIGEgY2hhbmdlIGluIG9wZW5ibWMtdG9vbHM/IG9y
LA0KICAgIDIpIENyZWF0ZSBhIG5ldyByZXBvc2l0b3J5IHVuZGVyIG9wZW5ibWM/IG9yDQogICAg
MykgQ3JlYXRlIGEgcGVyc29uYWwvb3JnYW5pemF0aW9uLW1hbmFnZWQgcmVwb3NpdG9yeSBhbmQg
Y3JlYXRlIGEgcHVsbCByZXF1ZXN0Pw0KDQpZb3Ugc2hvdWxkIGJlIGFibGUgdG8gYWRkIGl0IHVu
ZGVyIG9wZW5ibWMtdG9vbHMgZGlyZWN0bHkgcmF0aGVyIHRoYW4gY3JlYXRpbmcgDQphIG5ldyBy
ZXBvIG9yIGNyZWF0aW5nIHBlcnNvbmFsIGRpcmVjdG9yeS4NCiAgICANCiAgICBUaGFua3MsDQog
ICAgU3VpDQogICAgDQogICAgDQogICAgT24gTW9uLCBNYXkgMTgsIDIwMjAgYXQgNjozOCBQTSBB
bmRyZXcgSmVmZmVyeSA8YW5kcmV3QGFqLmlkLmF1PiB3cm90ZToNCiAgICA+DQogICAgPg0KICAg
ID4NCiAgICA+IE9uIFRodSwgMTQgTWF5IDIwMjAsIGF0IDIzOjI3LCBQYXRyaWNrIFdpbGxpYW1z
IHdyb3RlOg0KICAgID4gPiBPbiBXZWQsIE1heSAxMywgMjAyMCBhdCAwMzozODo0N1BNIC0wNzAw
LCBTdWkgQ2hlbiB3cm90ZToNCiAgICA+ID4gPiBXZSdyZSB3b3JraW5nIG9uIGEgR1VJIHRvb2wg
dGhhdCBhbGxvd3MgdGhlIHVzZXIgdG8gY2FwdHVyZSBhbmQgdmlzdWFsaXplDQogICAgPiA+ID4g
Qk1DIElQTUkgcmVxdWVzdHMuDQogICAgPiA+ID4NCiAgICA+ID4gPiBUaGUgdG9vbCBhY2NlcHRz
IDIga2luZHMgb2YgaW5wdXRzOg0KICAgID4gPiA+ICAxKSBMb2FkIGEgREJ1cyB0cmFmZmljIGR1
bXAgZmlsZSBnZW5lcmF0ZWQgYnkgZGJ1cy1tb25pdG9yIG9uIHRoZSBCTUMNCiAgICA+ID4gPiAg
MikgQ2FwdHVyZSBJUE1JIHJlcXVlc3RzIG9uIHRoZSBCTUMgLS0gdGhlIHRvb2wgY29ubmVjdHMg
dG8gdGhlIEJNQw0KICAgID4gPiA+IGNvbnNvbGUgYnkgbGF1bmNoaW5nIGEgcHJvZ3JhbSBvZiB0
aGUgdGhlIHVzZXIncyBjaG9pY2UgKGV4YW1wbGU6IHNzaCBvcg0KICAgID4gPiA+IHRlbG5ldCks
IHRoZW4gc3RhcnRzICJkYnVzLW1vbml0b3IiIG9uIHRoZSBCTUMgYW5kIGNoZWNrcyBpdHMgb3V0
cHV0cyBmb3IgREJ1cw0KICAgID4gPiA+IGNhbGxzIG9uIHRoZSBJUE1JIGRhZW1vbiBhbmQgdGhl
biBkcmF3cyB0aGUgSVBNSSByZXF1ZXN0cyBvbiB0aGUgY2FudmFzDQogICAgPiA+ID4gYWNjb3Jk
aW5nbHkuDQogICAgPiA+DQogICAgPiA+ID4gQSBzY3JlZW5zaG90IGlzIGF0dGFjaGVkIHRvIGls
bHVzdHJhdGUgd2hhdCBpdCBkb2VzOg0KICAgID4gPiA+IFtpbWFnZTogc2NybnNob3RfY29tcHJl
c3NlZC5wbmddDQogICAgPiA+DQogICAgPiA+IE5lYXQuICBJIHdvbmRlciBpZiB3ZSBjYW4gdXNl
IHRoaXMgdG8gYW5hbHlzZSBkYnVzIG1lc3NhZ2VzIHdpdGggaGlnaA0KICAgID4gPiBhbW91bnRz
IG9mIGxhdGVuY3kgKGVzcGVjaWFsbHkgb25jZSB0aGF0IGFyZSBpbmZyZXF1ZW50bHkgbGF0ZW50
KSBpbg0KICAgID4gPiBvcmRlciB0byBiZXR0ZXIgdGFyZ2V0IHdoaWNoIHByb2Nlc3NlcyB3ZSBz
aG91bGQgbW92ZSB0b3dhcmRzIGFzeW5jDQogICAgPiA+IGNhbGxzLg0KICAgID4NCiAgICA+IEZv
ciB3aGF0IGl0J3Mgd29ydGggSSBoYXZlIGEgc2NyaXB0IGZvciBwYXJzaW5nIEQtQnVzIHBjYXBz
Og0KICAgID4NCiAgICA+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL29wZW5ibWMtdG9vbHMv
dHJlZS9tYXN0ZXIvYW1ib2FyL29ibWMtc2NyaXB0cy9kYnVzLXBjYXANCiAgICA+DQogICAgPiBJ
dCdzIGhlbHBlZCBtZSB0cmFja2VkIGRvd24gdW5leHBlY3RlZCBsYXRlbmNpZXMgYW5kIG90aGVy
IHdlaXJkDQogICAgPiBiZWhhdmlvdXJzIGluIHRoZSBwYXN0Lg0KICAgID4NCiAgICA+IEkndmUg
anVzdCBwdXNoZWQgYSBjaGFuZ2UgYWRkaW5nIGEgUkVBRE1FIHRvIGludHJvZHVjZSB0aGUgY2Fw
YWJpbGl0aWVzDQogICAgPiBhbmQgcHJvdmlkZSBleGFtcGxlcyBvZiB1c2FnZSBhbmQgb3V0cHV0
Og0KICAgID4NCiAgICA+IGh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/
dT1odHRwcy0zQV9fZ2Vycml0Lm9wZW5ibWMtMkRwcm9qZWN0Lnh5el9jX29wZW5ibWNfb3BlbmJt
Yy0yRHRvb2xzXy0yQl8zMjU4MyZkPUR3SUJhUSZjPTVWRDBSVHRObFRoM3ljZDQxYjNNVXcmcj12
OU1VMEtpOXBXblRYQ1d3akhQVmdwbkNSODB2WGtrY3JJYXFVN1VTbDVnJm09eXZKbGFMczNPamRo
Wld0Z3FPejVqLTNvTEc2aXpMeWJTLTQ4UE5mdi1CbyZzPUxJdWlkVVVaYVRWLUs0VXV1NzlyMkM1
YTR4ZmZ3ZEVkLTRaai1vSmppQW8mZT0gDQogICAgPg0KICAgID4gQ2hlZXJzLA0KICAgID4NCiAg
ICA+IEFuZHJldw0KICAgIA0KDQo=
