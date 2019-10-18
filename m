Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A90DD52D
	for <lists+openbmc@lfdr.de>; Sat, 19 Oct 2019 01:06:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46w1ql5qDczDqNZ
	for <lists+openbmc@lfdr.de>; Sat, 19 Oct 2019 10:06:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=5194d86a56=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="OWCWDdjN"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="cs8kpVt8"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46w1q14BzfzDqG6
 for <openbmc@lists.ozlabs.org>; Sat, 19 Oct 2019 10:05:48 +1100 (AEDT)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9IN37qX002602; Fri, 18 Oct 2019 16:04:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=QZ7efjlRZEuuXhhsrcUaAhIgVlIZYs3gfzeXeWIMCGQ=;
 b=OWCWDdjNASe7QmRayenGg0X6i21TV1olytsndNYcuNydW4ZcS96G3+LU4Kq8AtODXq2v
 z0OwhGVYUB4WZmVCiYwScfJB7M9ABm7mtNbPwwKjVaXyB+GD9cPOiH1A523oqVe3USgB
 LAVIcttqBr+x9sg6WxHP8Jh8i1CDN4dZxLM= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2vqhgjsg5s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 18 Oct 2019 16:04:43 -0700
Received: from prn-hub06.TheFacebook.com (2620:10d:c081:35::130) by
 prn-hub05.TheFacebook.com (2620:10d:c081:35::129) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Fri, 18 Oct 2019 16:04:42 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Fri, 18 Oct 2019 16:04:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PKTJGbIW9jaQU46MBcJrBXUe1Qo/9mHIMw05tG8lVlPCbEmp68V+3kGtTOin6hn/G21s4BF2YaiowobIEmHs/3h2pV4DPAbRsOa5SaD7spldWt6123Pujxixq8E38jdFHzx2Hex0mcsXw+YvDmlG7FUSHPIVUA8lcwITDgA/abq9BUHPt+D9EP+W92G0vsQ7W9XYxXIDx/6kER1gLXB3MZW9d+kaKpjWVywszcrut86SNOxb0ciYenrKt+p4Nf33rMK9qaP9BmZj251jIU+QqOz0t9PCz7JvFcMawGdrmsKchmVyKZ0oGqd9s+ZeSmyqo6EK1MfVavFk+l6WX9Fu2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZ7efjlRZEuuXhhsrcUaAhIgVlIZYs3gfzeXeWIMCGQ=;
 b=gWzH5U9mupQXeRTbCUu+e0O3NboZBIvRu0VaaT/g3B/USCT7i3mpA1Mv5GQIciUQCwFLl2bH73Mie+HTL82cZJP8gmT99ludgIIe4ZC4rgwLKee1UaSkDTUyIq5PIYsWV34eXf8b7TiltrBBqwIB12QdUxhcJzNrpzVaImms0+jfv8+7pgeIBh4FyMH789hTWAz29Zxdve5lPyH+pz4/sitfdLzhvbWAHZNLL3ifSF06Slf0ukSgk3PK4uI9DzSJ+w2XYFjjV1E9iunBvbhdDf4tyu16m9qoMyBLHji6OvzeZP1DldjOMrawSKq+h1RiXYpJn3JNbSnPxP0ToX428Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZ7efjlRZEuuXhhsrcUaAhIgVlIZYs3gfzeXeWIMCGQ=;
 b=cs8kpVt8GfbmDfs3gL9qKtzSgkGRnDN8uSPBtvTVVg9rU88X9+c1AR+e5sSHrDHiCw/3APabPCOY4Jxy5UAsdM+4en91uAMsM4S8hoxu6X76HyNjHPaBSN46jndvU1llDWr+ESPshel7dTmXfUh1x/t/qVlR/QObObDtfSMEFTI=
Received: from BY5PR15MB3636.namprd15.prod.outlook.com (52.133.252.91) by
 BY5PR15MB3730.namprd15.prod.outlook.com (10.255.245.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 18 Oct 2019 23:04:40 +0000
Received: from BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::7887:4f9c:70df:285c]) by BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::7887:4f9c:70df:285c%4]) with mapi id 15.20.2347.024; Fri, 18 Oct 2019
 23:04:40 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: x86-power-control
Thread-Topic: x86-power-control
Thread-Index: AQHVhIgk7/7PtKOKbUeMJf/8spu+0qde/1mA///3sgCAAIQ8gP//kgqAgAGlawD//9+wgA==
Date: Fri, 18 Oct 2019 23:04:40 +0000
Message-ID: <F590F665-9327-4C8D-8C23-C317DA71D7F0@fb.com>
References: <EA590716-271A-4F5C-9B36-80260B7F35B6@fb.com>
 <66afaaab-baee-fc02-371b-2ef4a9f0d1ee@linux.intel.com>
 <37843B68-8D1C-48EB-B4B6-64CBC8F62F77@fb.com>
 <79190494-f452-286b-e304-7a901a3db26c@linux.intel.com>
 <8F55F038-A6E7-46A4-8C27-93C738AFEBDC@fb.com>
 <5d43146c-b8b9-164e-ed54-33df4bae6dce@linux.intel.com>
In-Reply-To: <5d43146c-b8b9-164e-ed54-33df4bae6dce@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::7259]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dde59fd2-22a0-40ca-0dc0-08d7541f8e62
x-ms-traffictypediagnostic: BY5PR15MB3730:
x-microsoft-antispam-prvs: <BY5PR15MB3730D8A0DE413F1F197ECDFADD6C0@BY5PR15MB3730.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01949FE337
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(136003)(366004)(396003)(376002)(39860400002)(189003)(199004)(478600001)(66946007)(6116002)(66556008)(2906002)(6512007)(6436002)(14454004)(25786009)(316002)(76116006)(36756003)(64756008)(91956017)(110136005)(86362001)(66446008)(66476007)(11346002)(8676002)(229853002)(486006)(46003)(81156014)(6486002)(81166006)(33656002)(71200400001)(446003)(476003)(2616005)(5660300002)(186003)(6506007)(14444005)(76176011)(8936002)(256004)(102836004)(71190400001)(6246003)(99286004)(7736002)(2501003)(305945005)(53546011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR15MB3730;
 H:BY5PR15MB3636.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aEYFDISiXanccDydNoe8dXQwi8hNTeG4FuL3rcEjOgou6GAUsn4qK78shOde6YuL9AajaHViXfnbIakDT8/nfuarNoCDFCovfJQ8kBJceCN/YTqYORqEqBDCidvRFUAerwQTGXXqXAHsCtQlgde86wHjf+s6ubO/vDrnYW81TY4/dgP04oeqS21eT5rxEvxEPE+j6q86WdeOXKJI/NjIjhm4BwhLBb6Q+C+ljUZ5cqc72kPgG0uYJJqfnXdhPZ3QDM9yBPe4kX+T2I/wGEZmw/h7Mv8NWb6wfh+VtSNn7N0vpyPIOCz7ExiL+LPxhN8/9wNyHcoNvI8+sNZmeWgaQW9P45Fa126+MHdF2vihb7LVNQ4jpDfWZ6Q6U8fVI5DG3DEzrkqo1DzOsAsNxn+10XCGYJ8T8KX3BmgIRwJqDFc=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <21755281C4CC824FAEF0DAE98C864E82@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: dde59fd2-22a0-40ca-0dc0-08d7541f8e62
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2019 23:04:40.4105 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hy7fKPa3KRu3JJxLOzofvNwtw0xP7kJpbNQJEAY7yH5kwpJX1ZjU+GtL3MH9IyNuyitH8oBlhtnjZ5dwQfeUbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3730
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-18_05:2019-10-18,2019-10-18 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 suspectscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=999 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910180205
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

DQoNCu+7v09uIDEwLzE4LzE5LCAxMTowMiBBTSwgIm9wZW5ibWMgb24gYmVoYWxmIG9mIEJpbGxz
LCBKYXNvbiBNIiA8b3BlbmJtYy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxh
YnMub3JnIG9uIGJlaGFsZiBvZiBqYXNvbi5tLmJpbGxzQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6
DQoNCiAgICANCiAgICANCiAgICBPbiAxMC8xNy8yMDE5IDQ6NTIgUE0sIFZpamF5IEtoZW1rYSB3
cm90ZToNCiAgICA+IA0KICAgID4gDQogICAgPiBPbiAxMC8xNy8xOSwgNDoyNyBQTSwgIm9wZW5i
bWMgb24gYmVoYWxmIG9mIEJpbGxzLCBKYXNvbiBNIiA8b3BlbmJtYy1ib3VuY2VzK3ZpamF5a2hl
bWthPWZiLmNvbUBsaXN0cy5vemxhYnMub3JnIG9uIGJlaGFsZiBvZiBqYXNvbi5tLmJpbGxzQGxp
bnV4LmludGVsLmNvbT4gd3JvdGU6DQogICAgPiANCiAgICA+ICAgICAgDQogICAgPiAgICAgIA0K
ICAgID4gICAgICBPbiAxMC8xNy8yMDE5IDM6MzIgUE0sIFZpamF5IEtoZW1rYSB3cm90ZToNCiAg
ICA+ICAgICAgPg0KICAgID4gICAgICA+IE9uIDEwLzE3LzE5LCA5OjAzIEFNLCAib3BlbmJtYyBv
biBiZWhhbGYgb2YgQmlsbHMsIEphc29uIE0iIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9
ZmIuY29tQGxpc3RzLm96bGFicy5vcmcgb24gYmVoYWxmIG9mIGphc29uLm0uYmlsbHNAbGludXgu
aW50ZWwuY29tPiB3cm90ZToNCiAgICA+ICAgICAgPg0KICAgID4gICAgICA+ICAgICAgSGkgVmlq
YXkNCiAgICA+ICAgICAgPg0KICAgID4gICAgICA+ICAgICAgT24gMTAvMTYvMjAxOSA2OjEzIFBN
LCBWaWpheSBLaGVta2Egd3JvdGU6DQogICAgPiAgICAgID4gICAgICA+IE9uZSBtb3JlIHF1ZXN0
aW9uIG9uIGNvZGUsIEkgc2VlIGZvbGxvd2luZyBjb2RlIHJlcXVpcmVzIHBvd2VyQnV0dG9uTWFz
aw0KICAgID4gICAgICA+ICAgICAgPiB0byBiZSBzZXQgYmVmb3JlIGFxdWlyaW5nIEdQSU8gbGlu
ZS4gUGxlYXNlIGxldCBtZSBrbm93IHdobyBzZXRzIHRoaXMNCiAgICA+ICAgICAgPiAgICAgID4g
cG93ZXJCdXR0b25NYXNrIHRvIHRydWUuIEkga25vdyB0aGlzIGlzIHJlbGF0ZWQgdG8gR1BJTyBw
YXNzdGhyb3VnaCBidXQNCiAgICA+ICAgICAgPiAgICAgID4gc3RpbGwgY291bGRu4oCZdCB1bmRl
cnN0YW5kIHdoZXJlIGluIGNvZGUgaXQgZ2V0cyBzZXQgdW50aWwgc29tZW9uZSBjYWxsDQogICAg
PiAgICAgID4gICAgICA+IHNldC1wcm9wZXJ0eSBvZiBkYnVzLg0KICAgID4gICAgICA+DQogICAg
PiAgICAgID4gICAgICBwb3dlckJ1dHRvbk1hc2sgaXMgYSBncGlvZDo6bGluZSBvYmplY3QgdGhh
dCByZXR1cm5zIHRydWUgaWYgaXQNCiAgICA+ICAgICAgPiAgICAgIHJlZmVyZW5jZXMgYSBHUElP
IGxpbmUgYW5kIGZhbHNlIG90aGVyd2lzZS4NCiAgICA+ICAgICAgPg0KICAgID4gICAgICA+IEkg
dW5kZXJzdG9vZCBjb2RlIGJ1dCBteSBwb2ludCBoZXJlIGlzIHRoZXJlIHdpbGwgbm90IGJlIGFu
eQ0KICAgID4gICAgICA+IGdwaW9kOjpsaW5lIG9iamVjdCBpZiBwb3dlckJ1dHRvbk1hc2sgaXMg
ZGVmaW5lZCBhcyBmYWxzZS4gQW5kDQogICAgPiAgICAgID4gaW5pdGlhbGx5IGl0IGlzIGRlZmlu
ZWQgYXMgZmFsc2UgbWVhbnMgdGVocmUgd2lsbCBub3QgYmUgYW55IGxpbmUNCiAgICA+ICAgICAg
PiBvYmplY3QgY3JlYXRlZCB1bnRpbCBzb21lb25lIHNldHMgaXQgdG8gdHJ1ZS4gQW5kIEkgZG9u
J3Qgc2VlIGl0DQogICAgPiAgICAgID4gYW55IHdheSB0byBzZXQgaXQgdHJ1ZSBvdGhlciB0aGFu
IHNldC1wcm9wZXJ0eSB0aHJvdWdoIGRidXMuDQogICAgPiAgICAgIA0KICAgID4gICAgICBUaGF0
J3MgY29ycmVjdC4gIE1hc2tpbmcgdGhlIHBvd2VyIGJ1dHRvbiBpcyBzb21ldGhpbmcgdGhhdCBp
cyBkb25lIGJ5DQogICAgPiAgICAgIHNvbWUgY29tcG9uZW50IG91dHNpZGUgb2YgcG93ZXItY29u
dHJvbC4NCiAgICA+ICAgICAgDQogICAgPiAgICAgIEZvciBleGFtcGxlLCB3ZSBjdXJyZW50bHkg
dXNlIGl0IHdpdGggdGhlIFNldCBGcm9udCBQYW5lbCBCdXR0b24gRW5hYmxlcw0KICAgID4gICAg
ICBJUE1JIGNvbW1hbmQgdG8gZW5hYmxlL2Rpc2FibGUgdGhlIHBvd2VyIGJ1dHRvbi4gIFNvLCBp
dCBpcyBvbmx5IG1hc2tlZA0KICAgID4gICAgICB3aGVuIHJlcXVlc3RlZC4NCiAgICA+IFNvIHRv
IHVzZSB4LTg2LXBvd2VyLWNvbnRyb2wsIGVpdGhlciB3ZSBuZWVkIHRvIGhhdmUgSVBNSSBjb21t
YW5kIHRvIGVuYWJsZQ0KICAgID4gdGhpcyBvciBzb21lIG90aGVyIGRhZW1vbiBoYXMgdG8gc2V0
IHRoaXMgcHJvcGVydHkuIENhbiB3ZSBoYXZlIHRoaXMgZmVhdHVyZQ0KICAgID4gb3B0aW9uYWwu
IEkgZ3Vlc3MgdGhpcyBpcyBhIHBydCBvZyBHUElPIHBhc3N0aHJvdWdoLg0KICAgIA0KICAgIFll
cywgdGhpcyBpcyBwYXJ0IG9mIEdQSU8gcGFzc3Rocm91Z2guICBXaGVuIHRoZSBHUElPIGlzIHJl
cXVlc3RlZCwgDQogICAgcGFzc3Rocm91Z2ggaXMgZGlzYWJsZWQgaW4gdGhlIHBpbmN0cmwgZHJp
dmVyLiAgU28sIHRvIG1hc2sgdGhlIHBvd2VyIA0KICAgIGJ1dHRvbiAoZGlzYWJsZSBwYXNzdGhy
b3VnaCksIHBvd2VyLWNvbnRyb2wgcmVxdWVzdHMgYW5kIGhvbGRzIHRoZSANCiAgICAiUE9XRVJf
T1VUIiBHUElPIGxpbmUuDQogICAgDQogICAgSXQgc2hvdWxkIGJlaGF2ZSBub3JtYWxseSB3aXRo
b3V0IHRoaXMgcHJvcGVydHkgZXZlciBnZXR0aW5nIHNldC4NCiAgICANCiAgICA+ICAgICAgDQog
ICAgPiAgICAgIFRoZSBhY3R1YWwgIlBPV0VSX09VVCIgbGluZSBmb3IgcG93ZXItY29udHJvbCBp
cyBub3QgcGVybWFuZW50bHkNCiAgICA+ICAgICAgY3JlYXRlZCwgYnV0IGlzIGFzc2VydGVkIHVz
aW5nIHRlbXBvcmFyeSBjYWxscyBsaWtlIHRoaXMgb25lOg0KICAgID4gICAgICBzZXRHUElPT3V0
cHV0Rm9yTXMoIlBPV0VSX09VVCIsIDAsIHBvd2VyUHVsc2VUaW1lTXMpOw0KICAgID4gDQogICAg
PiBUaGlzIGZ1bmN0aW9uIHdpbGwgbm90IHJ1biBwb3dlciBvbi9vZmYgc2VxdWVuY2UgdW50aWwg
YnV0dG9uIG1hc2sgaXMgc2V0LiBJdA0KICAgID4gV2lsbCBvbmx5IHNldCBHUElPIHZhbHVlIHdo
aWNoIGlzIG5vdCBlbm91Z2ggZm9yIHBvd2VyaW5nIG9uL29mZi4NCiAgICANCiAgICBTb21ldGhp
bmcgZWxzZSBpcyBnb2luZyBvbiwgaGVyZS4gIFRoZSBwb3dlckJ1dHRvbk1hc2sgaXMgYSBzZXBh
cmF0ZSANCiAgICBmZWF0dXJlIGZyb20gZHJpdmluZyB0aGUgIlBPV0VSX09VVCIgcGluLiAgSWYg
cG93ZXJCdXR0b25NYXNrIGlzIG5vdCANCiAgICBzZXQsIHRoZW4gdGhlIHBvd2VyIG9uL29mZiBz
aG91bGQgZnVuY3Rpb24gbm9ybWFsbHkuICBUaGVyZSBpcyBhIHNwZWNpYWwgDQogICAgY2FzZSBp
biB0aGUgc2V0R1BJT091dHB1dEZvck1zKCkgY29kZSB0byBoYW5kbGUgd2hlbiAiUE9XRVJfT1VU
IiBpcyANCiAgICBkcml2ZW4gd2hpbGUgcG93ZXJCdXR0b25NYXNrIGlzIHRydWU6DQogICAgDQog
ICAgICAgICAvLyBJZiB0aGUgcmVxdWVzdGVkIEdQSU8gaXMgbWFza2VkLCB1c2UgdGhlIG1hc2sg
bGluZSB0byBzZXQgdGhlIG91dHB1dA0KICAgICAgICAgaWYgKHBvd2VyQnV0dG9uTWFzayAmJiBu
YW1lID09ICJQT1dFUl9PVVQiKQ0KICAgICAgICAgew0KICAgICAgICAgICAgIHJldHVybiBzZXRN
YXNrZWRHUElPT3V0cHV0Rm9yTXMocG93ZXJCdXR0b25NYXNrLCBuYW1lLCB2YWx1ZSwNCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGR1cmF0aW9uTXMpOw0KICAg
ICAgICAgfQ0KICAgICAgICAgLi4uDQogICAgICAgICAvLyBObyBtYXNrIHNldCwgc28gcmVxdWVz
dCBhbmQgc2V0IHRoZSBHUElPIG5vcm1hbGx5DQogICAgDQogICAgU28sICJQT1dFUl9PVVQiIHNo
b3VsZCB3b3JrIGVpdGhlciB3YXksIGJ1dCB0aGUgZGVmYXVsdCBiZWhhdmlvciBpcyB0byANCiAg
ICBmdW5jdGlvbiB3aXRob3V0IHBvd2VyQnV0dG9uTWFzayBzZXQuICBBcmUgeW91IHNlZWluZyBm
YWlsdXJlcyBvbiB5b3VyIA0KICAgIHBsYXRmb3JtIHdoZW4gcG93ZXJCdXR0b25NYXNrIGlzIGZh
bHNlPw0KDQpObywgSXQgaXMgbm90IHdvcmtpbmcgYmVjYXVzZSBpdCBzaW1wbHB5IHNldHMgcG93
ZXJfb3V0IHRvICcwJy4gQnV0IHRvIHBvd2VyIG9uIA0KaXQgc2hvdWxkIGdvdCBkb3duIGFzIDAg
YW5kIGNvbWUgYmFjayB0byAxIGFmdGVyIGEgZGVsYXkuIFdoaWNoIGhhcHBlbnMgb25seSANCmlu
IGNhc2Ugb2YgcG93ZXJCdXR0b25NYXNrIHNldCB0byB0cnVlLiBJIGd1ZXNzIHdlIG1heSBuZWVk
IHRvIGZpeCB0aGlzLg0KICAgIA0KDQo=
