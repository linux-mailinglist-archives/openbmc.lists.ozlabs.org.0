Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D061E322B
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 00:14:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WpDJ10gbzDqNf
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 08:14:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=63.128.21.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=patrick_voelker@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=X9jMMu1n; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=X9jMMu1n; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49WpCS52XGzDqN1
 for <openbmc@lists.ozlabs.org>; Wed, 27 May 2020 08:14:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1590531247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RM3WUgFEfE+SyWdTa7XOyt+RtpU4tDqGMPwxW596LPs=;
 b=X9jMMu1nYJ5L8HKDmjsWbQBM5a2vDo7FKDbqWw9iMC6Qobzu+/bNirZz+UWD1lkECc2T/v
 pYLyMWAB2fw8kxHMOwBVXIKsPuLbPFihfxR9rDkta6V3e2OiHcSzYxlZAHaEnDgT7cOrc/
 Xvq0KB/UPk/m2xtvdt/ZhCQRKB05REQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1590531247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RM3WUgFEfE+SyWdTa7XOyt+RtpU4tDqGMPwxW596LPs=;
 b=X9jMMu1nYJ5L8HKDmjsWbQBM5a2vDo7FKDbqWw9iMC6Qobzu+/bNirZz+UWD1lkECc2T/v
 pYLyMWAB2fw8kxHMOwBVXIKsPuLbPFihfxR9rDkta6V3e2OiHcSzYxlZAHaEnDgT7cOrc/
 Xvq0KB/UPk/m2xtvdt/ZhCQRKB05REQ=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-ui2mjQq0NYa43isFv0uFsQ-1; Tue, 26 May 2020 18:14:05 -0400
X-MC-Unique: ui2mjQq0NYa43isFv0uFsQ-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Tue, 26 May 2020 15:14:03 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Tue, 26 May 2020 15:14:03 -0700
From: Patrick Voelker <Patrick_Voelker@phoenix.com>
To: Patrick Venture <venture@google.com>
Subject: RE: phosphor-ipmi-flash state recovery
Thread-Topic: phosphor-ipmi-flash state recovery
Thread-Index: AdYwe01TRgfLKJ7fSOiPeZ5iSAOYbQARdBsAAA2tk5AAuzfZgAAOh29g
Date: Tue, 26 May 2020 22:14:02 +0000
Message-ID: <71a53f7f4b0a4024ae5021d7a380a9da@SCL-EXCHMB-13.phoenix.com>
References: <bbd0955547ff46728528fd14d52fb04d@SCL-EXCHMB-13.phoenix.com>
 <CAPnigKn3TOKhMTimsigFGmA0axAR9VrrrFhYuRNVFuxnkq1XVQ@mail.gmail.com>
 <81002ab230724519b523f4cff7c49b3d@SCL-EXCHMB-13.phoenix.com>
 <CAO=notxZsnDFbwK2K-ck9d-Udi-Crb+hWpu8NF4iESWkeRwJyw@mail.gmail.com>
In-Reply-To: <CAO=notxZsnDFbwK2K-ck9d-Udi-Crb+hWpu8NF4iESWkeRwJyw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [50.39.166.255]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: phoenix.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
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
Cc: "OpenBMC \(openbmc@lists.ozlabs.org\)" <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>, William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCj4gPiBJbnRlcm5hbGx5LCBpdCBsb29rcyBsaWtlIEkgbmVlZCB0byBnZXQgdG8gYWJvcnRQ
cm9jZXNzKCkgYnV0IHRvIGRvIHRoYXQgSSBuZWVkDQo+IHRvIGNsb3NlIHRoZSBjdXJyZW50IHNl
c3Npb24gYnV0IEkgZG9u4oCZdCBoYXZlIGEgd2F5IHRvIG9idGFpbiB0aGUgc2Vzc2lvbklEDQo+
IGFmdGVyIHRoZSBmYWN0LiAgQWxzbyB0aGUgc3RhbGUgc2Vzc2lvbiBkb2VzbuKAmXQgc2VlbSB0
byBleHBpcmUgKGFzIG1lbnRpb25lZA0KPiBpbiB0aGUgcmVhZG1lLm1kKSBhbmQgSSBjYW7igJl0
IGZpbmQgdGhlIHN1cHBvcnQgZm9yIHRoYXQgaW4gdGhlIGNvZGUuDQo+IA0KPiBodHRwczovL2dp
dGh1Yi5jb20vb3BlbmJtYy9waG9zcGhvci1pcG1pLQ0KPiBmbGFzaC9ibG9iL21hc3Rlci9ibWMv
ZmlybXdhcmVfaGFuZGxlci5jcHAjTDk1DQo+IA0KPiBZb3Ugc2hvdWxkIGJlIGFibGUgdG8ganVz
dCBkZWxldGUgYW55IG9mIHRoZSBibG9iIElkIHBhdGhzLCBzdWNoIGFzDQo+IHRoZSBhY3RpdmUg
YmxvYiBwYXRoLCBhbmQgdGhhdCBzaG91bGQgdHJpZ2dlciB3aGF0IHlvdSB3YW50Lg0KDQpBcyBj
b2RlZCwgdGhhdCBvbmx5IHdvcmtzIHRvIGFib3J0IHdoZW4gaW4gaW4gdGhlIHZlcmlmaWNhdGlv
blBlbmRpbmcgYW5kIHVwZGF0ZVBlbmRpbmcgc3RhdGVzLiAgVGhhdCB3b24ndCB3b3JrIGlmIGl0
J3Mgc3R1Y2sgaW4gdGhlIG1pZGRsZSBvZiBhbiBhYm9ydGVkIHRyYW5zZmVyIHdpdGggYSBzZXNz
aW9uIHRoYXQncyBzdGlsbCBvcGVuLg0K

