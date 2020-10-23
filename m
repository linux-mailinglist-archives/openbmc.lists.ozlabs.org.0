Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3141297875
	for <lists+openbmc@lfdr.de>; Fri, 23 Oct 2020 22:53:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHxKG1RZkzDr08
	for <lists+openbmc@lfdr.de>; Sat, 24 Oct 2020 07:53:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=40.107.243.130;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.a=rsa-sha256 header.s=selector2 header.b=A6thqfgv; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2130.outbound.protection.outlook.com [40.107.243.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHxJJ2c6yzDqvY
 for <openbmc@lists.ozlabs.org>; Sat, 24 Oct 2020 07:52:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L0Yt8E0qRH4cWbqE2lzARKal1AWB80AkG9HjEvjTU2WdzSD5gAytnpNx74kmnVfAfx+tLk6GxgqaeiqLv9jzrMU8NZNt6rGe2+hs7NsT0n+VVoXSzlJVeq/gnCP67fu68JIi/cDFu+H8zXHk1T4G98I8b6USg2v8yYAhfF3juGK7WGcW/D0F4eAI6xvdocrVeiQoYwQSt7TmefEbZckAOr+lnwLPDvnEbRCbhGxepCcpArPX2gIRZR23jSTAUCCJ1FhLJpPEOypdUs1+9V/SViFD230+0NsZU1qTPBnpZJJBLEqv4UN12zx6VBniHfLbmjmhWBgO1U5KS7+ZJ6PIzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vO9D8EMF2VjpCl/xYepJmZlOZko5ma5w1wg1gVNoUCo=;
 b=DczJkb7X6IDJrOA1GER7s5HgPjrmkaQQSLUnlJeTZyMzTOm/upUw1b+8AbP2B+OCZxoRBapqgz5S+A7FImeXQmJVciYIRLTaavIR7d5LUFYo/mum8S+CNqhsmGeOBi7T7aQj1wpCkHWvZRlJbNcPBTIO9F824PZP1BTGMOFYfxOZsxDPFtbMDm6lURvaAaNNc8z2oa9Znoh2tPxyVDTt3Ahrv2wXcYmBbp9zzMuh8F39b/Hh9KMq+GGqey7VwNVKoy/izMhUXHA+3PxFthoN1Sh1ueeCgT7frSYa87n9zXJhwSVaictZJRAre/UzucYnGyMCwg1D7c5MylU6sEnZIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vO9D8EMF2VjpCl/xYepJmZlOZko5ma5w1wg1gVNoUCo=;
 b=A6thqfgv6XWPe0ELaAH84IL1P629OMhFRTUFkubhD2KDqib8BG8jypczkYfYUoDBO2L4SGlmI+AYrhuIN2I1XvommPfdYW301VZqz9FmWlJ+XS6x4DinqKO83DRaiMqgNFugiHjZEkFIDHi4m5Gj8FVDogNaSOHRj/IMyZblfFs=
Received: from CH2PR21MB1510.namprd21.prod.outlook.com (2603:10b6:610:8e::7)
 by CH2PR21MB1415.namprd21.prod.outlook.com (2603:10b6:610:5c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.17; Fri, 23 Oct
 2020 20:52:40 +0000
Received: from CH2PR21MB1510.namprd21.prod.outlook.com
 ([fe80::b5ed:58d3:db07:b2db]) by CH2PR21MB1510.namprd21.prod.outlook.com
 ([fe80::b5ed:58d3:db07:b2db%9]) with mapi id 15.20.3499.017; Fri, 23 Oct 2020
 20:52:40 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: Joseph Reynolds <jrey@linux.ibm.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, Nancy Yuen <yuenn@google.com>
Subject: RE: [EXTERNAL] Re: thoughts on livepatch?
Thread-Topic: [EXTERNAL] Re: thoughts on livepatch?
Thread-Index: AQHWqNgoTE24waWZnE+v7z/giojhDamlpn0AgAADOLA=
Date: Fri, 23 Oct 2020 20:52:40 +0000
Message-ID: <CH2PR21MB15107313777F87D1EB7C1FB3C81A0@CH2PR21MB1510.namprd21.prod.outlook.com>
References: <CADfYTpGw9G0ACwhmiZU_v8HoT4nZy8a3wnCGbozM1QiNFaX9og@mail.gmail.com>
 <CADfYTpGQo=N1QV-EgiZ3io6fmv84M4A8gs0oUY2+9_0qVmrM6Q@mail.gmail.com>
 <969cdb64-ce3b-cb32-3f1c-c3304a9c20c6@linux.ibm.com>
In-Reply-To: <969cdb64-ce3b-cb32-3f1c-c3304a9c20c6@linux.ibm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=069502e1-06dd-4547-a4f5-b5c31300ebbb;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2020-10-23T20:47:20Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none
 header.from=microsoft.com;
x-originating-ip: [50.47.133.153]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 97523bca-586e-4e5e-3de2-08d8779594fe
x-ms-traffictypediagnostic: CH2PR21MB1415:
x-microsoft-antispam-prvs: <CH2PR21MB141570BD0A2A61660500883CC81A0@CH2PR21MB1415.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cfz7IW0c1EHVGjM2UDNVtzzffxnOEsnZX7tx5BJAhNbWVsK++tLeqwo2mZsYIFMDAKVt3EOpVUPr+f15aAAao7NG4iue3nb6mXIVmDYgwFZrp4H+mPH5uKxVqoBEOr8M2+z5o6VvKjw2aSRhQ4s7vqJ8RfT79g3L0bM1XHNJSkXqaT4ub5DPZeF8lw8JSBqLRHmgkStZn6xCkbBkeGMtuPsDUsO9+RKGt3vW8+UPzvUabJ96HQUvKw5g0x4VFsAAKTjcGRLDIlztVuKCUuBEJztlkAF6ffLEVI9Sl4bH7Nk7jPc4y7BVr8UkePnbloXHcGnRyxX+Bh+dpIl8jusGzkHsFwFKUu6G/Ik2cZHpI3I0e9W/u0/Oj1IKEEsnt0vPr5xgnVH7WxeJJd0Mdu7OQw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR21MB1510.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(346002)(366004)(396003)(966005)(5660300002)(71200400001)(9686003)(83380400001)(52536014)(82960400001)(82950400001)(66946007)(66476007)(64756008)(66556008)(66446008)(76116006)(8936002)(7696005)(316002)(478600001)(55016002)(10290500003)(8990500004)(110136005)(53546011)(6506007)(2906002)(86362001)(33656002)(186003)(8676002)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 8JpRM22uwc/5/eW2EXSfNfyZ/HYK5TpCVecGRNEPAYF4ZHGpPp/ZMZNkO2DYb2VwnugUAWDx85sbr3p06+22FVumLUv+yYi2teB2FeWNyRzq0SEjphZ/yztuZvxAIoynrEyzuYFVLf2FbwHMBDwV/mFWj4Arnotyj0I9mHAH2Bh3am7iJB0ZrL5+annKqrobay5Vbi+WOsb947UvTXE+SWKMtX0URrTU8ASPuiXPhTz3WDC2qeVCVc3R9z6tUsUT+gtgHU6t3mfI3wjKiWakCB8MCT2lfEtAmBe1peNwkErs0DikwMewaz4fG9WkX1qfaGm39nESHMFwOIzVH2i7Bx2l/Wzub06wi/3k26AzI5HBGF41J4xDBhrvQJy5qf9X2O/blsHJDKa06wVLIYm5sge4sd/QEOTKwbMzhcyFZp1qmoerw2GRmX4qfH/Zc2aa+CegQjUMVnpkzcyPY5nYrFu8UxlYsdnpmM8Z5kCkGAQn594LXzTWSu7zm7XSXihrY1DywCary/ie1h4oqRPC0k/JIEF0Gs//cmVzj1vQnWs1YBmE+v03Mk8IBQYsAVj+tDT7jcL2XhAdKzGDERaXnDJwmaCnKfF3gYJGQSbXSu762uKKaIfqT6zrVcKCGNPC7YD9Af4dP8pRd0HrM0jeVw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR21MB1510.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97523bca-586e-4e5e-3de2-08d8779594fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2020 20:52:40.4735 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bQ14mcimZSBU9IBlzkr7XAUqzxuazDSlGF9qzVq6Lnb2Kh2h5pqY4FAfncxh8HIhtr75zWLITMXQ+KSXwJSSAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR21MB1415
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

RmV3IGNvbmNlcm5zIGFyZSANCi0gIFBlcm11dGF0aW9ucyBhbmQgY29tYmluYXRpb25zIG9mIHBh
dGNoZXMgYW5kIHZhbGlkYXRpb24gY2hhb3MNCi0gIFJ1bnRpbWUgc2VjdXJpdHkgDQotICByZXNv
dXJjZXMgbmVlZGVkKCBDUFUgKyBTdG9yYWdlKSBmb3IgYSBnb29kIHBhY2thZ2UgbWFuYWdlciAh
IA0KDQpMb29raW5nIGZ3ZCB0byB0aGlzIGlmIHRoZXJlIGlzIGEgZ29vZCBtb21lbnR1bSB0byBk
ZXNpZ24gYSBnb29kIGFuZCBzZWN1cmUgcGFja2FnZSBtYW5hZ2VyIGZvciBPcGVuQk1DLiANCg0K
TmVlcmFqDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IG9wZW5ibWMgPG9w
ZW5ibWMtYm91bmNlcytuZWxhZGs9bWljcm9zb2Z0LmNvbUBsaXN0cy5vemxhYnMub3JnPiBPbiBC
ZWhhbGYgT2YgSm9zZXBoIFJleW5vbGRzDQpTZW50OiBGcmlkYXksIE9jdG9iZXIgMjMsIDIwMjAg
MTozNiBQTQ0KVG86IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzsgTmFuY3kgWXVlbiA8eXVlbm5A
Z29vZ2xlLmNvbT4NClN1YmplY3Q6IFtFWFRFUk5BTF0gUmU6IHRob3VnaHRzIG9uIGxpdmVwYXRj
aD8NCg0KT24gMTAvMjIvMjAgODowMCBQTSwgTmFuY3kgWXVlbiB3cm90ZToNCj4gQW5kIEkgd2Fz
IHRyaWdnZXIgaGFwcHkuIE1lYW50IHRvIGluY2x1ZGUuLi4NCj4gVGhpcyBNZXNzYWdlIElzIEZy
b20gYW4gRXh0ZXJuYWwgU2VuZGVyIFRoaXMgbWVzc2FnZSBjYW1lIGZyb20gb3V0c2lkZSANCj4g
eW91ciBvcmdhbml6YXRpb24uDQo+DQo+IEFuZCBJIHdhcyB0cmlnZ2VyIGhhcHB5LsKgIE1lYW50
IHRvIGluY2x1ZGUNCj4gaHR0cHM6Ly9uYW0wNi5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29r
LmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGd3d3Lg0KPiBrZXJuZWwub3JnJTJGZG9jJTJGRG9jdW1l
bnRhdGlvbiUyRmxpdmVwYXRjaCUyRmxpdmVwYXRjaC50eHQmYW1wO2RhdGE9DQo+IDA0JTdDMDEl
N0NuZWxhZGslNDBtaWNyb3NvZnQuY29tJTdDNDdmZTllNTdiMmFjNDFjMDg5NGYwOGQ4Nzc5MzVl
YzQlN0MNCj4gNzJmOTg4YmY4NmYxNDFhZjkxYWIyZDdjZDAxMWRiNDclN0MxJTdDMCU3QzYzNzM5
MDgyMjE0OTQ2NTgxNSU3Q1Vua25vdw0KPiBuJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpB
d01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDDQo+IEpYVkNJNk1uMCUzRCU3
QzEwMDAmYW1wO3NkYXRhPVhjcm5qNSUyQlkxV1dYWkw5bkdwOTBZVEVUdWZUa3JBSmxHZEZveXMN
Cj4gb2REcTQlM0QmYW1wO3Jlc2VydmVkPTANCj4NCj4gT24gVGh1LCBPY3QgMjIsIDIwMjAgYXQg
NTo1OSBQTSBOYW5jeSBZdWVuIDx5dWVubkBnb29nbGUuY29tIA0KPiA8bWFpbHRvOnl1ZW5uQGdv
b2dsZS5jb20+PiB3cm90ZToNCj4NCj4gICAgIEFueW9uZSB0cmllZCBpdCB3aXRoIE9wZW5CTUM/
wqAgQW55IHRob3VnaHRzPw0KPg0KDQpXaGF0IGlzIHRoZSB1c2UgY2FzZT/CoCBJIGFzc3VtZSB0
aGlzIGlzIHRvIHBhdGNoIGFuIE9wZW5CTUMtYmFzZWQgZmlybXdhcmUgaW1hZ2Ugd2l0aG91dCBo
YXZpbmcgdG8gcmVidWlsZCBhbmQgZGlzdHJpYnV0ZSB0aGUgZW50aXJlIGltYWdlLsKgIFdoYXQg
aXMgdGhlIGJlbmVmaXQgb2YgdXNpbmcgbGl2ZXBhdGNoaW5nIGNvbXBhcmVkIHRvIGNyZWF0aW5n
IGEgbmV3IGltYWdlIHRoYXQgaGFzIHRoZSBmaXggaW5jbHVkZWQsIGFuZCByZWJvb3RpbmcgdGhl
IEJNQyB0byBhcHBseSBpdD8NCg0KQmVuZWZpdHM/DQotIFNtYWxsZXIgcGF0Y2ggcmVxdWlyZXMg
bGVzcyBiYW5kd2lkdGggdG8gZGlzdHJpYnV0ZS4NCi0gUG9zc2libGUgaW5jcmVhc2VkIGFiaWxp
dHkgdG8gYXBwbHkgcGF0Y2hlcyBzb29uZXIgKGNvbXBhcmVkIHRvIGluc3RhbGxpbmcgZW50aXJl
IGltYWdlIHRoZW4gcmVib290aW5nIHRoZSBCTUMpLg0KLSBRdWlja2VyIGFwcGx5IHRpbWVzIG1l
YW5zIGxlc3MgQk1DIGRvd250aW1lLg0KDQpXaGF0IGlzIHRoZSBjb3N0Pw0KLSBNb3JlIGNvbXBs
aWNhdGVkIGluZnJhc3RydWN0dXJlIHRvIHRyYWluIHN0YWZmIGFuZCB0byBjcmVhdGUsIHRyYWNr
IHRlc3QsIGRpc3RyaWJ1dGUsIGFuZCBhcHBseSBwYXRjaGVzLg0KLSBZb3UgaGF2ZSB0byB0ZXN0
IHRoZSBwYXRjaGVkIGltYWdlIGFuZCB0ZXN0IHRoZSBpbWFnZSB0aGF0IGhhcyB0aGUgcGVybWFu
ZW50IGZpeC4NCi0gRG9lcyBwYXRjaGluZyB3b3JrIGFuZCBwbGF5IG5pY2VseSB3aXRoIHNlY3Vy
ZSBib290IGFuZCBhdHRlc3RhdGlvbiBzY2hlbWVzPw0KDQpLZXJuZWwgbGl2ZXBhdGNoaW5nIGlz
IHNpbWlsYXIgdG8gaW1tZWRpYXRlIFBURnMgb24gSUJNIGkuwqAgQXMgZGV2ZWxvcGVycywgd2Ug
d2VyZSBlbmNvdXJhZ2VkIHRvIGRldmVsb3AgcGF0Y2hlcyB0aGF0IGNvdWxkIGJlIGFwcGxpZWQg
aW1tZWRpYXRlbHkgKG1lYW5pbmcgbm8gcmVib290IHJlcXVpcmVkKS7CoCBUaGVzZSBzb21ldGlt
ZXMgdG9vayBleHRyYSB0aW1lIHRvIGRldmVsb3AsIGFuZCBpdCB3YXMgbm90IGFsd2F5cyBwb3Nz
aWJsZSB0byBkZXZlbG9wIHN1Y2ggYSBmaXgsIHJlcXVpcmVkIGFkZGl0aW9uYWwgdGVzdGluZywg
YW5kIHNvbWV0aW1lcyBjYXVzZWQgY3VzdG9tZXIgcHJvYmxlbXMuDQoNCk15IDIgY2VudHMgd29y
dGgsDQotIEpvc2VwaA0KDQo+DQo+ICAgICBOYW5jeSBZdWVuDQo+DQo+ICAgICAJDQo+DQo+ICAg
ICDigKINCj4NCj4gICAgIAkNCj4NCj4gICAgIEdvb2dsZSBQbGF0Zm9ybXMNCj4NCj4gICAgIAkN
Cj4NCj4gICAgIOKAog0KPg0KPiAgICAgCQ0KPg0KPiAgICAgeXVlbm5AZ29vZ2xlLmNvbSA8bWFp
bHRvOnl1ZW5uQGdvb2dsZS5jb20+DQo+DQo+ICAgICAJDQo+DQo+ICAgICDigKINCj4NCj4gICAg
IAkNCj4NCj4gICAgIEdvb2dsZSBMTEMNCj4NCj4NCj4NCj4gLS0NCj4NCj4gTmFuY3kgWXVlbg0K
Pg0KPiAJDQo+DQo+IOKAog0KPg0KPiAJDQo+DQo+IEdvb2dsZSBQbGF0Zm9ybXMNCj4NCj4gCQ0K
Pg0KPiDigKINCj4NCj4gCQ0KPg0KPiB5dWVubkBnb29nbGUuY29tIDxtYWlsdG86eXVlbm5AZ29v
Z2xlLmNvbT4NCj4NCj4gCQ0KPg0KPiDigKINCj4NCj4gCQ0KPg0KPiBHb29nbGUgTExDDQo+DQoN
Cg==
