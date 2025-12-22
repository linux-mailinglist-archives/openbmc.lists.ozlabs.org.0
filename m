Return-Path: <openbmc+bounces-1060-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8916BCD56F7
	for <lists+openbmc@lfdr.de>; Mon, 22 Dec 2025 11:01:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dZYZH0MmRz2xpm;
	Mon, 22 Dec 2025 21:01:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.3.219.148
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766397686;
	cv=none; b=X77sCkR//6i/wTN4Qq4uqUot0+U2YHgFwROolkEVwaACphcNzgqwiaMqjcp29RuzNN0tAODuxMw2rUFDFhhrePLiLKdPI9g6dj3to1OmJ1r4JNFOZntL+N5jDdpuk8TN7ksTA5ijB+3hu2CRGQAKUKgaX0hguAQIiMsfiwsrZ9WT7vgOEgnRTBnoxGcV7YxfMTY4Ud+/AjJhb0QqGz0eQY+nKmMyAuYeRRNU5vgZUoEb6P3bPh8GQaz1uADfRssHbtHEVtAGIpAk0x2yIvbdOZ1WdKXd6u0BxpWtt13l2iTT8iSgiqdGt+2F+HmhLGVE4GcL0ZEDeQPBXcbIcUHMPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766397686; c=relaxed/relaxed;
	bh=OjhnSDU770Ne61oyKOe1W4OXEEZ0ZErbvDrbGA0SXUg=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XhfClDxP7rSbaaUD4ofp2Wt/glUXyF06UezOoFqoDLrv9celi5mPmuQAXjn4bnJqnQglXS1sgWOWAFoqW9CLrNobYONcRgpTPREhez7ei9Sm/6Prat5fMvgoVqDuk2R30KNTTaIWnkaZ8sjOTbSTYUsTaG1+/M3YsRUYzhX/Yslxyr8+HmHow2/ahdug+1LeoMN2ug+AHrO226+5RNZsuMEAkGVol2VKAwSMgRnitlIBZlUg+A1U9x67ArsCki2xDrsUryoQI4jqOY4WUhxuUS712dtRBEhKJ8G+e0IIAKB6pPYCtpg1e146H82quu8lx3T2KrVQti5F+EXsWtqOww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=yadro.com; dkim=pass (2048-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-02 header.b=b/IVXknS; dkim=pass (2048-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-03 header.b=ubyqSMCL; dkim-atps=neutral; spf=pass (client-ip=195.3.219.148; helo=mta-01.yadro.com; envelope-from=a.amelkin@yadro.com; receiver=lists.ozlabs.org) smtp.mailfrom=yadro.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-02 header.b=b/IVXknS;
	dkim=pass (2048-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-03 header.b=ubyqSMCL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yadro.com (client-ip=195.3.219.148; helo=mta-01.yadro.com; envelope-from=a.amelkin@yadro.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 397 seconds by postgrey-1.37 at boromir; Mon, 22 Dec 2025 21:01:21 AEDT
Received: from mta-01.yadro.com (mta-01.yadro.com [195.3.219.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dZYZ90f6Tz2xFn
	for <openbmc@lists.ozlabs.org>; Mon, 22 Dec 2025 21:01:21 +1100 (AEDT)
Received: from mta-01.yadro.com (localhost [127.0.0.1])
	by mta-01.yadro.com (Postfix) with ESMTP id 31F4920005;
	Mon, 22 Dec 2025 12:54:34 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-01.yadro.com 31F4920005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-02;
	t=1766397274; bh=OjhnSDU770Ne61oyKOe1W4OXEEZ0ZErbvDrbGA0SXUg=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=b/IVXknSBN6X70e+dvslJU2EptV4QF8OC9+Crfqe54tzZOZjO+KafuJ9SqGG8nWcV
	 XZdZ1uGIWIZNjBqUkSrCS/Ej7m+CiTtwqbAfbBZyJjesloDm+KdgG0pwpm801lexz1
	 XlbMYMPPmS4epk+IM57lg2jyirzXz+75EXDXMnc9qhWt4yyptMG44t6RDtMMHi+SoE
	 IoSnv94W4iWaLeAV8PVQg6S1Q+NBZfSNZm6ZXV6GtortQlJ7brTITMPwYNP+Hze2lk
	 TwyPbJWKEVsL1nJEfTFPkU7D5iXwlSi7zXxVd17rtA5dHs8nKS345NOrecho62If/Y
	 2j1lD1ULNgzsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1766397274; bh=OjhnSDU770Ne61oyKOe1W4OXEEZ0ZErbvDrbGA0SXUg=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=ubyqSMCLnYIxneIF7iS8itp1bLp3J8zqUIItDciIplJ0QNmZHMzf0luyp7HEKPAGl
	 qc0hjviSyruu4iC5+5jxANFZ3tVW+2Py8dDQTCLnNLmddRGQGpmtCy9aow1A4azgIs
	 pRt21gNuO/zwXXNVtSvmY/GSA0Lep1ZldQc+xyzKuLTt7at0JabOrMvJtVf/zPfE3X
	 T5CNTjVbHO6xIlYWBM34HLbB4JBN07HQcQS+CGPG4nbs+q0QFL3kfdEUrRajoE/Wv3
	 yAsqWXOiJl/ZzNQAnoxoWCW8njZ/MT+mPKtEqheawgdvFgqLcL6cJL/S5uZHwtKVRN
	 cqjXI8aQ9M4TQ==
Received: from RTM-EXCH-01.corp.yadro.com (unknown [10.34.9.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Postfix) with ESMTPS;
	Mon, 22 Dec 2025 12:54:33 +0300 (MSK)
Received: from T-Exch-05.corp.yadro.com (10.34.9.207) by
 RTM-EXCH-01.corp.yadro.com (10.34.9.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 22 Dec 2025 12:54:36 +0300
Received: from T-EXCH-12.corp.yadro.com (10.34.9.214) by
 T-Exch-05.corp.yadro.com (10.34.9.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.9; Mon, 22 Dec 2025 12:54:35 +0300
Received: from T-EXCH-12.corp.yadro.com ([10.34.9.214]) by
 T-EXCH-12.corp.yadro.com ([10.34.9.214]) with mapi id 15.02.1258.012; Mon, 22
 Dec 2025 12:54:35 +0300
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Heyi Guo <guoheyi@linux.alibaba.com>, qiu ding <qdwby2008@outlook.com>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: ipmi issues(ubuntu 22.04 and openbmc v2.12.0)
Thread-Topic: ipmi issues(ubuntu 22.04 and openbmc v2.12.0)
Thread-Index: AQHccl5wyQH8/M9nl0OIpm5p1LscLLUs/YkAgABuGoA=
Date: Mon, 22 Dec 2025 09:54:35 +0000
Message-ID: <cda43f36344d4d979c1c43a3ee0cded0@yadro.com>
References: <TYZPR04MB7269F16D7A68070C1470D3BDAFB7A@TYZPR04MB7269.apcprd04.prod.outlook.com>
 <1e6ee97b-3768-4cb5-8a40-1115069bfa7d@linux.alibaba.com>
In-Reply-To: <1e6ee97b-3768-4cb5-8a40-1115069bfa7d@linux.alibaba.com>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.17.34.51]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-KSMG-AntiPhishing: NotDetected, bases: 2025/12/22 09:24:00
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2025/12/22 07:31:00 #28054914
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-KATA-Status: Not Scanned
X-KSMG-LinksScanning: NotDetected, bases: 2025/12/22 09:24:00
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 5
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

VGhhdCdzIGJlY2F1c2UgSmFtbXkgKDIyLjA0KSBoYXMgaXBtaXRvb2wgMS44LjE4IHdpdGhvdXQg
bW9yZSByZWNlbnQgcGF0Y2hlcy4NCkknZCByZWNvbW1lbnQgdXBncmFkaW5nIHRvIDEuOC4xOSBv
ciBiZXR0ZXIgeWV0IHRvIGJ1aWxkIGFuZCBpbnN0YWxsIHRoZSBsYXRlc3QgdmVyc2lvbiBmcm9t
IGh0dHBzOi8vY29kZWJlcmcub3JnL2lwbWl0b29sL2lwbWl0b29sDQoxLjguMTkgaGFzIGF1dG9t
YXRpYyBkZXRlY3Rpb24gb2Ygc3VwcG9ydGVkIGNpcGhlciB0eXBlLg0KDQpXQlIsIEFsZXhhbmRl
ciBBbWVsa2luLA0KTWFpbnRhaW5lciBvZiBpcG1pdG9vbA0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogSGV5aSBHdW8gPGd1b2hleWlAbGludXguYWxpYmFiYS5jb20+IA0KU2Vu
dDogTW9uZGF5LCBEZWNlbWJlciAyMiwgMjAyNSA5OjE1IEFNDQpUbzogcWl1IGRpbmcgPHFkd2J5
MjAwOEBvdXRsb29rLmNvbT47IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KU3ViamVjdDogUmU6
IGlwbWkgaXNzdWVzKHVidW50dSAyMi4wNCBhbmQgb3BlbmJtYyB2Mi4xMi4wKQ0KDQrQktC90LjQ
vNCw0L3QuNC1ISDQlNCw0L3QvdC+0LUg0L/QuNGB0YzQvNC+INC+0YIg0LLQvdC10YjQvdC10LPQ
viDQsNC00YDQtdGB0LDRgtCwIQ0KDQrQldGB0LvQuCDQv9C40YHRjNC80L4g0LrQsNC20LXRgtGB
0Y8g0L/QvtC00L7Qt9GA0LjRgtC10LvRjNC90YvQvCwg0L/QtdGA0LXRiNC70Lgg0LXQs9C+INC9
0LAgc29jQHlhZHJvLmNvbTxtYWlsdG86c29jQHlhZHJvLmNvbT4NCg0KWW91IGNhbiB0cnkgYWRk
aW5nICItQyAxNyIgdG8gaXBtaXRvb2wuDQoNCkhleWkNCg0KT24gMjAyNS8xMi8yMSAxNzo1MSwg
cWl1IGRpbmcgd3JvdGU6DQo+IEhlbGxvLCBJJ20gdGVzdGluZyB0aGUgSVBNSSBpbnRlcmZhY2Ug
b24gdGhlIGV2Yi1hc3QyNjAwIHNpbXVsYXRvciB3aXRoIFVidW50dSAyMi4wNCBhbmQgT3BlbkJN
QyB2Mi4xMi4wLiBJJ20gZW5jb3VudGVyaW5nIGFuIElQTUkgYXV0aGVudGljYXRpb24gaXNzdWUg
KHRoZSBwb3J0IGlzIDYyMzAgLT4gNjIzLCBhbmQgcG9ydCA2MjMgaXMgbGlzdGVuaW5nIG9uIFVE
UCBieSBkZWZhdWx0KS4gSG93IGNhbiBJIHJlc29sdmUgdGhpcz8gRG9lcyBwaG9zcGhvci1pcG1p
LWhvc3QgdXNlIENNYWtlIG9yIEF1dG90b29scyBmb3IgY29tcGlsYXRpb24gYnkgZGVmYXVsdD8N
Cj4NCj4gQWRkaXRpb246IFdoZW4gY29tcGlsaW5nIHBob3NwaG9yLWlwbWktaG9zdCwgdGhlIGRl
ZmF1bHQgcmVjaXBlIHBhcmFtZXRlcnMgZnJvbSB0aGUgT3BlbkJNQyB2Mi4xMi4wIGJyYW5jaCBh
cmUgdXNlZC4NCj4NCj4gU2ltdWxhdG9yIEVudmlyb25tZW50Og0KPiByb290QGV2Yi1hc3QyNjAw
On4jIHN5c3RlbWN0bCBzdGF0dXMgcGhvc3Bob3ItaXBtaS1ob3N0DQo+ICogcGhvc3Bob3ItaXBt
aS1ob3N0LnNlcnZpY2UgLSBQaG9zcGhvciBJbmJhbmQgSVBNSQ0KPiAgICAgICBMb2FkZWQ6IGxv
YWRlZCAoL2xpYi9zeXN0ZW1kL3N5c3RlbS9waG9zcGhvci1pcG1pLWhvc3Quc2VydmljZTsgZW5h
YmxlZDsgdmVuZG9yIHByZXNldDogZW5hYmxlZCkNCj4gICAgICBEcm9wLUluOiAvbGliL3N5c3Rl
bWQvc3lzdGVtL3Bob3NwaG9yLWlwbWktaG9zdC5zZXJ2aWNlLmQNCj4gICAgICAgICAgICAgICBg
LTEwLW92ZXJyaWRlLmNvbmYNCj4gICAgICAgQWN0aXZlOiBhY3RpdmUgKHJ1bm5pbmcpIHNpbmNl
IFRodSAxOTcwLTAxLTAxIDAxOjIzOjQ2IFVUQzsgNXMgYWdvDQo+ICAgICBNYWluIFBJRDogMzA1
IChpcG1pZCkNCj4gICAgICAgQ0dyb3VwOiAvc3lzdGVtLnNsaWNlL3Bob3NwaG9yLWlwbWktaG9z
dC5zZXJ2aWNlDQo+ICAgICAgICAgICAgICAgYC0gMzA1IGlwbWlkDQo+DQo+IEphbiAwMSAwMToy
MzozNyBldmItYXN0MjYwMCBzeXN0ZW1kWzFdOiBTdGFydGluZyBQaG9zcGhvciBJbmJhbmQgSVBN
SS4uLg0KPiBKYW4gMDEgMDE6MjM6NDMgZXZiLWFzdDI2MDAgaXBtaWRbMzA1XTogSlNPTiBmaWxl
IG5vdCBmb3VuZCBKYW4gMDEgDQo+IDAxOjIzOjQ2IGV2Yi1hc3QyNjAwIHN5c3RlbWRbMV06IFN0
YXJ0ZWQgUGhvc3Bob3IgSW5iYW5kIElQTUkuDQo+IEphbiAwMSAwMToyMzo0NyBldmItYXN0MjYw
MCBpcG1pZFszMDVdOiBMb2FkaW5nIHdoaXRlbGlzdCBmaWx0ZXIgSmFuIA0KPiAwMSAwMToyMzo0
NyBldmItYXN0MjYwMCBpcG1pZFszMDVdOiBTZXQgcmVzdHJpY3RlZE1vZGUgPSBmYWxzZSBKYW4g
MDEgDQo+IDAxOjIzOjQ3IGV2Yi1hc3QyNjAwIGlwbWlkWzMwNV06IE5ldyBpbnRlcmZhY2UgbWFw
cGluZyANCj4gcm9vdEBldmItYXN0MjYwMDp+Iw0KPg0KPiByb290QGV2Yi1hc3QyNjAwOn4jIG5l
dHN0YXQgLWFuIHxncmVwIDo2MjMNCj4gdWRwICAgICAgICAwICAgICAgMCA6Ojo2MjMgICAgICAg
ICAgICAgICAgICA6OjoqDQo+IHJvb3RAZXZiLWFzdDI2MDA6fiMNCj4NCj4gSXNzdWVzOg0KPiAk
IGlwbWl0b29sIC1JIGxhbnBsdXMgLUggMTI3LjAuMC4xIC1wIDYyMzAgLVUgcm9vdCAtUCBvcGVu
Qm1jIC1BIG1kNSANCj4gbWMgaW5mbyBFcnJvciBpbiBvcGVuIHNlc3Npb24gcmVzcG9uc2UgbWVz
c2FnZSA6IGludmFsaWQgDQo+IGF1dGhlbnRpY2F0aW9uIGFsZ29yaXRobQ0KPg0KPiBFcnJvcjog
VW5hYmxlIHRvIGVzdGFibGlzaCBJUE1JIHYyIC8gUk1DUCsgc2Vzc2lvbg0KPg0KPiAkIGlwbWl0
b29sIC1JIGxhbnBsdXMgLUggMTI3LjAuMC4xIC1wIDYyMzAgLVUgcm9vdCAtUCBvcGVuQm1jIC1B
IG5vbmUgDQo+IG1jIGluZm8gRXJyb3IgaW4gb3BlbiBzZXNzaW9uIHJlc3BvbnNlIG1lc3NhZ2Ug
OiBpbnZhbGlkIA0KPiBhdXRoZW50aWNhdGlvbiBhbGdvcml0aG0NCj4NCj4gRXJyb3I6IFVuYWJs
ZSB0byBlc3RhYmxpc2ggSVBNSSB2MiAvIFJNQ1ArIHNlc3Npb24gJCBpcG1pdG9vbCAtSCANCj4g
MTI3LjAuMC4xIC1wIDYyMzAgLVUgcm9vdCAtUCBvcGVuQm1jIC1BIG5vbmUgbWMgaW5mbyBBdXRo
ZW50aWNhdGlvbiANCj4gdHlwZSBOT05FIG5vdCBzdXBwb3J0ZWQNCj4gRXJyb3I6IFVuYWJsZSB0
byBlc3RhYmxpc2ggTEFOIHNlc3Npb24NCj4gRXJyb3I6IFVuYWJsZSB0byBlc3RhYmxpc2ggSVBN
SSB2MS41IC8gUk1DUCBzZXNzaW9uDQoNCg==

