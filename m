Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD872539E0
	for <lists+openbmc@lfdr.de>; Wed, 26 Aug 2020 23:39:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcK5J1LNXzDqRk
	for <lists+openbmc@lfdr.de>; Thu, 27 Aug 2020 07:39:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=63.128.21.170;
 helo=us-smtp-delivery-170.mimecast.com; envelope-from=neil_bradley@phoenix.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=n6TWaDtP; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=n6TWaDtP; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcK4T6B2hzDqNj
 for <openbmc@lists.ozlabs.org>; Thu, 27 Aug 2020 07:39:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1598477940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=//9BNWtEg3xVN4zMENMcw0Za4talOAXzMVZcpigdo+8=;
 b=n6TWaDtPUltNbL5rvKhXXt3CnNromsLYXBazjJFyjIFPIVJiIYhmCvpqbIHG8YTBEsKB/K
 3InA9wclsMGh4rRjugq5qPvR5p2Y6AL86nt7Nlf+OoFkK7Wxeq05KdtFiIe6F5ORIAwxDs
 UA0CVRPztccAk0XAh/td4hLv4pHBeaE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1598477940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=//9BNWtEg3xVN4zMENMcw0Za4talOAXzMVZcpigdo+8=;
 b=n6TWaDtPUltNbL5rvKhXXt3CnNromsLYXBazjJFyjIFPIVJiIYhmCvpqbIHG8YTBEsKB/K
 3InA9wclsMGh4rRjugq5qPvR5p2Y6AL86nt7Nlf+OoFkK7Wxeq05KdtFiIe6F5ORIAwxDs
 UA0CVRPztccAk0XAh/td4hLv4pHBeaE=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-AkQ6C3TQMsCGhi5aG6-PzQ-1; Wed, 26 Aug 2020 17:38:58 -0400
X-MC-Unique: AkQ6C3TQMsCGhi5aG6-PzQ-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Wed, 26 Aug 2020 14:38:56 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Wed, 26 Aug 2020 14:38:56 -0700
From: Neil Bradley <Neil_Bradley@phoenix.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: RE: Tioga Pass OpenBMC 2.8
Thread-Topic: Tioga Pass OpenBMC 2.8
Thread-Index: AdZ4G9/pZ44Ttxs7TiCWRTJU7JTTHQCA72kAAA7UvEAAALC0EP//pIUA//+ESKCAAIvbAP//dNRwgAJnpID//mpVgA==
Date: Wed, 26 Aug 2020 21:38:55 +0000
Message-ID: <75b5584cca72489f95c2d22c129a754f@SCL-EXCHMB-13.phoenix.com>
References: <c27c916296c14b7a973ce10ce462a574@SCL-EXCHMB-13.phoenix.com>
 <5F804DFD-B91D-4293-A410-62ED737423A7@fb.com>
 <6bc3d9da57d44f55ad66179e74a51bd1@SCL-EXCHMB-13.phoenix.com>
 <a5e34d90e0c34849a672189f8adf9cd7@SCL-EXCHMB-13.phoenix.com>
 <AA3AD0B7-CC74-4B6C-927D-101A3E721004@fb.com>
 <b62681c4a4c148b58cdd9ff1e614d400@SCL-EXCHMB-13.phoenix.com>
 <22D145E2-1328-428F-9AAF-54E138797994@fb.com>
 <f11b61fdc4c240aea245f01b2318c616@SCL-EXCHMB-13.phoenix.com>
 <20200825142533.GI3532@heinlein>
In-Reply-To: <20200825142533.GI3532@heinlein>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.122.68.196]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=neil_bradley@phoenix.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: phoenix.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Content-Language: en-US
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Bruce Mitchell <Bruce_Mitchell@phoenix.com>, Amithash Prasad <amithash@fb.com>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

VGhhbmsgeW91IFBhdHJpY2shIFllcywgaW5kZWVkIG9uIFRpb2dhIFBhc3MgdGhlIFJHTUlJIChz
ZWNvbmQgaW50ZXJmYWNlKSBnb2VzIHRvIHRoZSBpMjEwLiBPZGQgdGhhdCBpdCdkIGdldCBhZGRl
ZCBidXQgbm8gb25lIHVzZXMgaXQ/IEFueXdheSwgYXBwcmVjaWF0ZSB0aGUgaGludC4gSSdsbCBk
aWcgaW4gYW5kIHNlZSBpZiB3ZSBjYW4gZ2V0IGl0IGluaXRpYWxpemVkIGluIHRoZSBkZXZpY2Ug
dHJlZSBzb21laG93LiBUaGUgb3RoZXIgbXlzdGVyeSBpcyB3aHkgdGhlIHNlY29uZCBpbnRlcmZh
Y2Ugb24gdGhlIG1lenphbmluZSBjYXJkIGlzbid0IHdvcmtpbmcuLi4NCg0KLS0+TmVpbA0KDQot
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogb3BlbmJtYyA8b3BlbmJtYy1ib3VuY2Vz
K25laWxfYnJhZGxleT1waG9lbml4LmNvbUBsaXN0cy5vemxhYnMub3JnPiBPbiBCZWhhbGYgT2Yg
UGF0cmljayBXaWxsaWFtcw0KU2VudDogVHVlc2RheSwgQXVndXN0IDI1LCAyMDIwIDc6MjYgQU0N
ClRvOiBOZWlsIEJyYWRsZXkgPE5laWxfQnJhZGxleUBwaG9lbml4LmNvbT4NCkNjOiBBbWl0aGFz
aCBQcmFzYWQgPGFtaXRoYXNoQGZiLmNvbT47IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzsgVmlq
YXkgS2hlbWthIDx2aWpheWtoZW1rYUBmYi5jb20+OyBCcnVjZSBNaXRjaGVsbCA8QnJ1Y2VfTWl0
Y2hlbGxAcGhvZW5peC5jb20+DQpTdWJqZWN0OiBSZTogVGlvZ2EgUGFzcyBPcGVuQk1DIDIuOA0K
DQpIZWxsbyBOZWlsLA0KDQpPbiBUdWUsIEF1ZyAyNSwgMjAyMCBhdCAwMTozNToxMkFNICswMDAw
LCBOZWlsIEJyYWRsZXkgd3JvdGU6DQo+IFRoYW5rcyBWaWpheSEgVGFrZSBhIGxvb2sgYXQgdGhl
IGF0dGFjaGVkIHBpY3R1cmUuIEl0IG9jY3VycyB0byBtZSB0aGF0IHRoZSBSSi00NSBqYWNrIG9u
IHRoZSBsZWZ0IHNpZGUgd2l0aCB0aGUgcHVycGxlIGNhYmxlIHBsdWdnZWQgaW4gbWF5IG5vdCBh
Y3R1YWxseSBiZSBhIG5ldHdvcmsgY29ubmVjdG9yICh3ZSBnb3QgdGhlc2UgbWFjaGluZXMgbGFz
dCBUaHVyc2RheSBhbmQgYXJlIGp1c3QgZ2V0dGluZyBhY3F1YWludGVkIHdpdGggdGhlbSksIHNv
IHBsZWFzZSBmb3JnaXZlIG15IGlnbm9yYW5jZSBpbiBjYXNlIHRoaXMgaXNu4oCZdCB3aGF0IGl0
4oCZcyBzdXBwb3NlZCB0byBiZS4g8J+YiSBUaGUgd29ya2luZyBldGhlcm5ldCBwb3J0IGlzIHRo
ZSBsZWZ0bW9zdCBTRlArIGNvbm5lY3RvciBvbiB0aGUgbWV6emFuaW5lIGNhcmQgKGJlbG93IHRo
ZSBzdGlja2VyKSwgYW5kIHRoZSByaWdodG1vc3QgU0ZQKyBjb25uZWN0b3IgZG9lc27igJl0IHBy
b3ZpZGUgYSBsZWFjaC4gTXkgYXNzdW1wdGlvbiwgd2hpY2ggbWF5IGJlIGluY29ycmVjdCwgaXMg
dGhlIGxlZnRtb3N0IGV0aGVybmV0IGphY2sgaXMgUkdNSUkyIGFuZCB0aGUgTklDcyBvbiB0aGUg
bWV6emFuaW5lIGlzIFJHTUlJMSAoYXQgbGVhc3QgYWNjb3JkaW5nIHRvIHRoZSBzY2hlbWF0aWMg
d2hpY2ggc2hvd3MgaXQgYXMgYW4gT0NQIGNvbm5lY3Rpb24pLg0KDQpGcm9tDQpodHRwczovL3d3
dy5vcGVuY29tcHV0ZS5vcmcvZG9jdW1lbnRzL2ZhY2Vib29rLXNlcnZlci1pbnRlbC1tb3RoZXJi
b2FyZC12NDAtc3BlYzoNCg0KMTAuNC4yIE1hbmFnZW1lbnQgTmV0d29yaw0KVGhlIG1vdGhlcmJv
YXJkIGhhcyB0aHJlZSBvcHRpb25zIG9mIG1hbmFnZW1lbnQgbmV0d29yayBpbnRlcmZhY2VzIGZv
ciB0aGUgQk1DIGNvbm5lY3Rpb24uIFRoZSBtYW5hZ2VtZW50IG5ldHdvcmsgc2hhcmVzIHRoZSBk
YXRhIG5ldHdvcmvigJlzIHBoeXNpY2FsIGludGVyZmFjZS4gVGhlIG1hbmFnZW1lbnQgY29ubmVj
dGlvbiBzaG91bGQgYmUgaW5kZXBlbmRlbnQgZnJvbSBkYXRhIHRyYWZmaWMgYW5kIE9TL2RyaXZl
ciBjb25kaXRpb24uDQrvgrcgU0ZQKyBzaGFyZWQtTklDIGZyb20gTWV6emFuaW5lIDEwRyBOSUMg
b3IgUENJZSBOSUMsIGRyaXZlbiBieSBCTUMgdGhyb3VnaCBSTUlJL05DLVNJIG9yIEkyQy4gSTJD
IGJlaW5nIGRlZmF1bHQg74K3IFNHTUlJL0tYIHNoYXJlZC1OSUMgY29ubmVjdGVkIHRvIG1pZHBs
YW5lIGludGVyZmFjZSBmcm9tIEludGVswq4gSTIxMC1BUywgZHJpdmVuIGJ5IEJNQyB0aHJvdWdo
IFJNSUkvTkNTSSDvgrcgMTAvMTAwLzEwMDAgTURJIHNoYXJlZC1OSUMgY29ubmVjdGVkIHRvIFJK
NDUgZnJvbSBJbnRlbMKuIEkyMTAtQVQoY28tbGF5b3V0IHdpdGggSW50ZWzCriBJMjEwLUFTKSwg
ZHJpdmVuIGJ5IEJNQyB0aHJvdWdoIFJNSUkvTkNTSSANCg0KDQotLS0NCg0KU28gaXQgc2VlbXMg
bGlrZSB0aGF0IGlzIGFub3RoZXIgUk1JSS9OQ1NJIGF0dGFjaGVkIG5ldHdvcmsgaW50ZXJmYWNl
Lg0KV2UgYWx3YXlzIHVzZSB0aGUgIlNQRisgc2hhcmVkLU5JQyAoMTBHKSIgdGhvdWdoIGluIG91
ciBsYWIuICBJIGRvbid0IGtub3cgdGhhdCB3ZSd2ZSBldmVyIGF0dGVtcHRlZCB0byBnZXQgdGhl
IEludGVsIGNoaXAgd29ya2luZy4gIFRoZXJlIGlzIHByb2JhYmx5IHNvbWUgZGV2aWNlIHRyZWUg
Y29udGVudCwgYXQgbGVhc3QsIG1pc3NpbmcgZm9yIGVuYWJsaW5nIHRoYXQuDQoNCi0tDQpQYXRy
aWNrIFdpbGxpYW1zDQo=

