Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 211E525E274
	for <lists+openbmc@lfdr.de>; Fri,  4 Sep 2020 22:14:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BjpmG0fY8zDqrq
	for <lists+openbmc@lfdr.de>; Sat,  5 Sep 2020 06:14:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=216.205.24.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=bruce_mitchell@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=Pe+WF0qm; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=Pe+WF0qm; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [216.205.24.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bjpkr0YHxzDqg9
 for <openbmc@lists.ozlabs.org>; Sat,  5 Sep 2020 06:12:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1599250369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1AQwyeAap46nScgjnNXGkZ7UHYsnY866CEq6dOoV+Zs=;
 b=Pe+WF0qm9y2OOhQx19m4iabxPUb+pnPiLn8M3+3ZSz2qbjCgmeeFRckn2vybcOiF9vLFIf
 6mwuU6nwNhNcwF21vPY3yiD2ZqtjBykK6j36Jdum8R4+Sorxiebv9XnsFQqfl7/Icft2jt
 WAI9A8Tk/bR/GjlrfMopkMVQ7o6SoGo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1599250369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1AQwyeAap46nScgjnNXGkZ7UHYsnY866CEq6dOoV+Zs=;
 b=Pe+WF0qm9y2OOhQx19m4iabxPUb+pnPiLn8M3+3ZSz2qbjCgmeeFRckn2vybcOiF9vLFIf
 6mwuU6nwNhNcwF21vPY3yiD2ZqtjBykK6j36Jdum8R4+Sorxiebv9XnsFQqfl7/Icft2jt
 WAI9A8Tk/bR/GjlrfMopkMVQ7o6SoGo=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-uODMWXD9MqKFLSszbwIYhw-1; Fri, 04 Sep 2020 16:12:45 -0400
X-MC-Unique: uODMWXD9MqKFLSszbwIYhw-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Fri, 4 Sep 2020 13:12:43 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Fri, 4 Sep 2020 13:12:43 -0700
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: Ed Tanous <ed@tanous.net>, raviteja bailapudi <raviteja28031990@gmail.com>
Subject: RE: Recent architecture breakages to bmcweb
Thread-Topic: Recent architecture breakages to bmcweb
Thread-Index: AQHWaOVOq93rFznBWEOgYdG9K0s5pKlM76MAgAdAW4CAAbHGgIAANT8AgAFltACAADHegIAA3jgAgAASvICAAH4QcA==
Date: Fri, 4 Sep 2020 20:12:43 +0000
Message-ID: <1d7779a4d87545a8940188d617491e49@SCL-EXCHMB-13.phoenix.com>
References: <CACWQX82sSvONiMq53s39P42Sky5C+GsvLGyN42xvKUYSGHjyrQ@mail.gmail.com>
 <CACWQX82=j3QiYotB1ynOor=HkuMEmyDxa=aNr7_uGwkfuFXJaA@mail.gmail.com>
 <CAM4DKZm7PxT2=OaFQonP0yBTDjcNjssvw46QbDNG30qUKydeqw@mail.gmail.com>
 <CAM4DKZkE6JTP0jMF0j90KQxkBVxtDXP2TP=e45cQGRP-AqvGfQ@mail.gmail.com>
 <CACWQX836e0w2kP0R3+MSUzyHU_KcipHHv_21NsZdudVeteJaYA@mail.gmail.com>
 <CAM4DKZmZV2gNaFQG1+OaAhDGo+V_TVSeuEqvo7FV0ow9Dp8E1g@mail.gmail.com>
 <CACWQX81ruudwVi+ubJX_V3aAocx0TqC4Wc3_G=Hw6FgbX_5Pcg@mail.gmail.com>
 <CAM4DKZkBpEAJVvCQi7Ga6_+azyPOzfhofQxocDjssn-2ANUFqg@mail.gmail.com>
 <CACWQX83=8wQv_z2KV6=wQOGevBC1yrPpaOO0UqVicw6XsA_CTw@mail.gmail.com>
In-Reply-To: <CACWQX83=8wQv_z2KV6=wQOGevBC1yrPpaOO0UqVicw6XsA_CTw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [98.246.252.115]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=bruce_mitchell@phoenix.com
X-Mimecast-Spam-Score: 0.003
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SSBhZ3JlZSB3aXRoIEVkOyBJIHRvbyBhZ2FpbnN0IGJyZWFraW5nIHRoZSBIVFRQIFJGQyBpbiBi
bWN3ZWIsIHdlIHNob3VsZCBhdm9pZCBpdCBpbiBhbGwgY2FzZXMuDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmJtYyBbbWFpbHRvOm9wZW5ibWMtDQo+IGJvdW5j
ZXMrYnJ1Y2VfbWl0Y2hlbGw9cGhvZW5peC5jb21AbGlzdHMub3psYWJzLm9yZ10gT24gQmVoYWxm
IE9mIEVkDQo+IFRhbm91cw0KPiBTZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDMsIDIwMjAgMjI6
NDENCj4gVG86IHJhdml0ZWphIGJhaWxhcHVkaQ0KPiBDYzogT3BlbkJNQyBNYWlsbGlzdA0KPiBT
dWJqZWN0OiBSZTogUmVjZW50IGFyY2hpdGVjdHVyZSBicmVha2FnZXMgdG8gYm1jd2ViDQo+IA0K
PiBPbiBUaHUsIFNlcCAzLCAyMDIwIGF0IDk6MzQgUE0gcmF2aXRlamEgYmFpbGFwdWRpDQo+IDxy
YXZpdGVqYTI4MDMxOTkwQGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4NCj4gPg0KPiA+IEhpIEVkLA0K
PiA+DQo+ID4+DQo+ID4+DQo+ID4+ID4gRXhhY3RseSwgd2UgdGhvdWdodCB0byBpbXBsZW1lbnQg
NCBjYWxsYWJsZXMgaW4gbmV3IHJ1bGUgY2xhc3MNCj4gc2ltaWxhciB0byAgd2Vic29ja2V0DQo+
ID4+ID4gICAgT25PcGVuKCksT25NZXNzYWdlKCksT25DbG9zZSgpLE9uRXJyb3IoKSAuICBXZSBj
YW4gdXNlIG5hbWVzDQo+IGFzIHN1Z2dlc3RlZC4NCj4gPj4NCj4gPj4gVGhpcyBpcyBhIG9uZSB3
YXkgZHluYW1pYyBsb2FkZXIsIHRoZXJlJ3Mgbm8gc3VjaCB0aGluZyBhcyBhbiBodHRwDQo+ID4+
IHNlcnZlciBzZW5kaW5nIGEgbWVzc2FnZSB3aGlsZSBhIHJlc3BvbnNlIGlzIGluIHByb2dyZXNz
LCBzbw0KPiBPbk1lc3NhZ2UNCj4gPj4gaXNuJ3QgcmVxdWlyZWQuDQo+ID4+DQo+ID4+ID4NCj4g
Pj4gPiBEdW1wIGR1bXAgb2ZmbG9hZCBoYXBwZW5zIHVzaW5nIE5CRCBwcm90b2NvbCwgaXQncyBs
aWtlIE5CRCBvdmVyDQo+IGh0dHAuDQo+ID4+ID4gSW4gdGhpcyAgc3RyZWFtaW5nIHVzZS1jYXNl
LCBkYXRhIHdpbGwgYmUgYmlkaXJlY3Rpb25hbCBhcyB0aGVyZSB3aWxsIGJlDQo+IG5iZCBhY2tu
b3dsZWRnZW1lbnQNCj4gPj4gPiBmb3IgZWFjaCBuYmQgcGFja2V0IHRyYW5zZmVycmVkIHRvIGNs
aWVudC4gc28gdGhvdWdodCB0byB1c2UNCj4gIlN0cmVhbVNvY2tldCIgbmFtZS4NCj4gPj4NCj4g
Pj4NCj4gPj4gSFRUUCAod2l0aCB0aGUgZXhjZXB0aW9uIG9mIHdlYnNvY2tldHMpIGlzIG5vdCBi
aWRpcmVjdGlvbmFsLiAgSXQncw0KPiA+PiByZXF1ZXN0LT5yZXNwb25zZS4gIFBsZWFzZSBkbyBu
b3QgYnJlYWsgdGhlIEhUVFAgcHJvdG9jb2wgaW4gdGhpcw0KPiA+PiBjYXNlLiAgSWYgYWNrbm93
bGVkZ2VtZW50IGlzIG5lZWRlZCwgdGhhdCB3b3VsZCBiZSBhIHNlcGFyYXRlIFVSTA0KPiA+PiBy
b3V0ZSwgc28geW91IGNhbiB0cmFjayB0aGUgc3RhdGUgaW4gdGhlIGJhY2tlbmQsIG9yIHlvdSBj
YW4gdXNlDQo+ID4+IHdlYnNvY2tldHMsIHdoaWNoIGdpdmUgYSBiaWRpcmVjdGlvbmFsIHNvY2tl
dCBBUEkuDQo+ID4+IEkgd2lsbCB0cnkgdG8gZ28gdGhyb3VnaCB0aGUgY29kZSBhbmQgdW5kZXJz
dGFuZCB5b3VyIHVzZSBjYXNlLCBidXQgaXQNCj4gPj4gc291bmRzIGEgbGl0dGxlIG9kZCB0byBt
ZS4gIEdpdmVuIHdlIGFscmVhZHkgaGF2ZSBhIHdlYnNvY2tldCBiYXNlZA0KPiA+PiBuYmQsIHdh
cyB0aGF0IG5vdCBhIGdvb2QgZml0IHRvIHlvdXIgdXNlIGNhc2U/DQo+ID4+DQo+ID4NCj4gPiBJ
IGRvIHVuZGVyc3RhbmQgdGhhdCBIVFRQIGlzIG5vdCBiaWRpcmVjdGlvbmFsIGFuZCB3b3JrcyB3
aXRoIHJlcXVlc3QtDQo+IHJlc3BvbnNlIG1vZGVsLg0KPiA+IGJ1dCAgc2VlbXMgIEhUVFAvMiBz
dXBwb3J0cyBiaWRpcmVjdGlvbmFsIHN0cmVhbQ0KPiA+IGh0dHBzOi8vdG9vbHMuaWV0Zi5vcmcv
aHRtbC9yZmM3NTQwDQo+ID4gc3RyZWFtOiAgQSBiaWRpcmVjdGlvbmFsIGZsb3cgb2YgZnJhbWVz
IHdpdGhpbiB0aGUgSFRUUC8yIGNvbm5lY3Rpb24uDQo+IA0KPiBUcnVlLiAgSWYgeW91J3JlIGxv
b2tpbmcgdG8gaW1wbGVtZW50IEhUVFAvMiBpbiBibWN3ZWIsIHRoYXQncyBhDQo+IHJlYWxseSBi
aWcgY29udmVyc2F0aW9uLCB3aXRoIGEgbG90IG9mIGltcGxpY2F0aW9ucy4gIFRoZSBiZXN0IHBs
YWNlDQo+IHRvIHN0YXJ0IHdvdWxkIHByb2JhYmx5IGJlIGEgZGVzaWduIGRvYy4NCj4gDQo+ID4N
Cj4gPg0KPiA+Pg0KPiA+PiA+DQo+ID4+ID4NCj4gPj4gPj4gPiAgICAgMikgQ3JlYXRlIGFub3Ro
ZXIgcmVkZmlzaCBub2RlIGNsYXNzKGFzIHRoZSBleGlzdGluZyBub2RlIGNsYXNzDQo+IGlzIGZv
ciBkeW5hbWljIHJvdXRlKQ0KPiA+PiA+Pg0KPiA+PiA+PiB3aGljaCB3b3VsZCBjYWxsIGFwcC5y
b3V0ZSB3aXRoIHRoZSBzdHJlYW1Tb2NrZXQgdHJhaXQuRG8geW91DQo+IGhhdmUgYW55IHByZWZl
cmVuY2UgaGVyZT9oYW5kbGVVcGdyYWRlKCkgb2Ygcm91dGVyIGNsYXNzIGdldHMgaW52b2tlZA0K
PiBpbiB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnMgLQ0KPiA+PiA+Pg0KPiA+PiA+PiBUaGUgUmVk
ZmlzaCBOb2RlIGNsYXNzIGlzIHNwZWNpZmljYWxseSBmb3IgcmVxdWVzdC0+cmVzcG9uc2UgdHlw
ZQ0KPiA+PiA+PiBvcGVyYXRpb25zLCBhbmQgaW4gdGhlIGxvbmcgcnVuLCBJJ2QgcmVhbGx5IGxp
a2UgdG8gc2VlIGl0IGp1c3QgZ28NCj4gPj4gPj4gYXdheS4gIFRvZGF5LCBpdCBkb2Vzbid0IGRv
IGFueXRoaW5nIG1vcmUgdGhhbiB0aGUgdW5kZXJseWluZw0KPiByb3V0ZXINCj4gPj4gPj4gYWxy
ZWFkeSBkb2VzLCBhbmQgaXMgbWlzc2luZyBhIG51bWJlciBvZiB0aGluZ3MsIGxpa2UgdHlwZXNh
ZmUNCj4gPj4gPj4gcGFyYW1ldGVyIHBhcnNpbmcsIGFzIHdlbGwgYXMgY29weS1sZXNzIHBhcmFt
ZXRlcnMuICBJZiBpdCB3ZXJlIG1lLCBJDQo+ID4+ID4+IHdvdWxkIHNpbXBseSBtb2RlbCB5b3Vy
IGR5bmFtaWMgcmVzcG9uc2VzIGFyb3VuZA0KPiBCTUNXRUJfUk9VVEUNCj4gPj4gPj4NCj4gPj4g
Pj4NCj4gPj4gPj4NCj4gPj4gPj4gPiAgICAgYSlyZXF1ZXN0IGNvbnRhaW5zIGh0dHAgaGVhZGVy
KHVwZ3JhZGU6d2Vic29ja2V0KQ0KPiA+PiA+PiA+ICAgICBiKXJlcXVlc3QgY29udGFpbnMgaHR0
cCBoZWFkZXIgKGFjY2VwdDogdGV4dC9ldmVudC1zdHJlYW0pIC0tLT4NCj4geWV0IHRvIGJlIHVw
c3RyZWFtZWRJbiBvdXIgdXNlIGNhc2UgZm9yIGR1bXAgc3RyZWFtLCB3ZSBkbyBub3QgbmVlZCB0
bw0KPiB0YWtlIHRoaXMgZGVjaXNpb24gYnkgbG9va2luZyBhdCB0aGUgcmVxdWVzdCBoZWFkZXIg
YXMgdGhlIFVSTCBpcyBhbHJlYWR5DQo+IHJlZ2lzdGVyZWQgd2l0aCB0aGVpciBhc3NvY2lhdGVk
IHJ1bGUoU3RyZWFtU29ja2V0UnVsZSkgY2xhc3MuV2hlbiB3ZQ0KPiBzZWFyY2ggaW4gdGhlIHRy
aWUgZm9yIGEgc3BlY2lmaWMgVVJMLCB3ZSB3aWxsIGdldCB0aGUgYXNzb2NpYXRlZCBydWxlIGNs
YXNzDQo+IG9iamVjdCwgd2hpY2ggaW4gb3VyIGNhc2Ugd291bGQgYmUgU3RyZWFtU29ja2V0UnVs
ZSBhbmQgdGhlIGhhbmRsZQ0KPiBmdW5jdGlvbiBvZiB0aGlzIGNsYXNzIHNob3VsZCBtYWtlIHN1
cmUgdGhhdCBzb2NrZXQgaXMgbm90IGNsb3NlZC4NCj4gPj4gPj4gPiBJcyBteSB1bmRlcnN0YW5k
aW5nIGNvcnJlY3QgdW5kZXJzdGFuZGluZyBvciBkbyB5b3UgaGF2ZSBtb3JlDQo+IHN1Z2dlc3Rp
b24gb24gdGhpcz9UaGVyZSBpcyBhbiBhY3RpdmUgZGlzY3Vzc2lvbiBnb2luZyBvbiBpbiB0aGUg
Zm9sbG93aW5nDQo+IGNvbW1pdCBmb3IgdGhlIHNhbWUuDQo+ID4+ID4+ID4gaHR0cHM6Ly9nZXJy
aXQub3BlbmJtYy1wcm9qZWN0Lnh5ei9jL29wZW5ibWMvYm1jd2ViLysvMzYwMzgNCj4gPj4gPj4N
Cj4gPj4gPj4gSSB0aGluayB5b3UndmUgZGVzY3JpYmVkIHdoYXQgYm1jd2ViIGRvZXMgdG9kYXku
ICBJbiB0aGlzIGNhc2UsIHdlDQo+ID4+ID4+IG1pZ2h0IHdhbnQgdG8ganVzdCBwcm9tb3RlIGFu
ICJpc1VwZ3JhZGUiIG1ldGhvZCBmcm9tIHRoZSBhcHAsDQo+IHRoYXQgd2UNCj4gPj4gPj4gY2Fu
IHVzZSB0byBkZXRlcm1pbmUgaWYgYSBnaXZlbiByb3V0ZSBpcyBkeW5hbWljIG9yIG5vdCwgYW5k
IGNhbGwgaW50bw0KPiA+PiA+PiB0aGUgY29ycmVjdCAiaGFuZGxlU3RyZWFtIiBvcGVyYXRvci4g
IEtlZXAgaW4gbWluZCB0aGF0IGF0IHNvbWUNCj4gcG9pbnQNCj4gPj4gPj4geW91IG5lZWQgdG8g
dHJhbnNmZXIgY29udHJvbCBiYWNrIHRvIGh0dHBDb25uZWN0aW9uIHRvIGhhbmRsZQ0KPiA+PiA+
PiBrZWVwYWxpdmUgcHJvcGVybHkuDQo+ID4+ID4NCj4gPj4gPg0KPiA+PiA+Pg0KPiA+PiA+PiBU
aGlua2luZyBhYm91dCBrZWVwYWxpdmUgbW9yZSBnYXZlIG1lIGFub3RoZXIgdGhvdWdodDogVGhp
cyBpc24ndA0KPiA+PiA+PiByZWFsbHkgYW4gInVwZ3JhZGUiIGluIHRoZSBub3JtYWwgc2Vuc2Uu
ICBXaGF0IGlmIHdlIGp1c3QgYWRkZWQgYQ0KPiA+PiA+PiAid3JpdGUiIG1ldGhvZCB0byB0aGUg
UmVzcG9uc2Ugb2JqZWN0IHRoYXQgaW1tZWRpYXRlbHkgd3JvdGUgdGhlDQo+ID4+ID4+IHBheWxv
YWQgdG8gdGhlIGR5bmFtaWMgYm9keSBhbmQgc2VudCBpdD8gIHdyaXRlKCkgY291bGQgcmV0dXJu
IGFuDQo+ID4+ID4+IGVycm9yIGNvZGUgaW4gdGhlIGNhc2VzIHdoZXJlIHRoZSBjbGllbnQgaGFz
IGRpc2Nvbm5lY3RlZCwgYW5kIHdlDQo+ID4+ID4+IG5ldmVyIGhhdmUgdG8gdHJhbnNmZXIgb3du
ZXJzaGlwIG9yIGtub3dsZWRnZSBvZiB0aGUgc29ja2V0LCBhbmQNCj4gdGhlDQo+ID4+ID4+IGtl
ZXBhbGl2ZSBhbmQgZW5kKCkgbWVjaGFuaXNtcyB3b3VsZCBjb250aW51ZSB0byB3b3JrIGxpa2UN
Cj4gbm9ybWFsLg0KPiA+PiA+PiBIdHRwQ29ubmVjdGlvbiB3b3VsZCBoYXZlIHRvIGdldCBzb21l
IGtub3dsZWRnZSBhYm91dCB3aGV0aGVyDQo+IHRoaXMNCj4gPj4gPj4gcmVxdWVzdCB3YXMgZHlu
YW1pYyBvciBub3QsIGJ1dCB0aGF0IHNlZW1zIHByZXR0eSBkb2FibGUsIGFuZA0KPiBjb3VsZA0K
PiA+PiA+PiBqdXN0IGJlIGJhc2VkIG9uIHRoZSBmaXJzdCBjYWxsIHRvIHdyaXRlLiAgQWxzbywg
dGhpcyBrZWVwcyBhbGwgdGhlDQo+ID4+ID4+IGtlZXBhbGl2ZSBjb2RlIHRoZSBzYW1lLCB3aGlj
aCBJIHRoaW5rIGlzIGdvb2QuDQo+ID4+ID4+DQo+ID4+ID4gVGhhdCdzIGV4YWN0bHkgd2h5IHdl
IHRob3VnaHQgdG8gdXNlIGhhbmRsZSgpIG1ldGhvZCwgYnV0IHRoZXJlIGlzIGENCj4gZ2FwIGhv
dyB0byB0cmFuc2ZlciBvd25lcnNoaXANCj4gPj4gPiBvZiBzb2NrZXQgZnJvbSBjb25uZWN0aW9u
IGNsYXNzIHRvIHJ1bGUgY2xhc3MuDQo+ID4+ID4NCj4gPj4gPiBJbiB0aGUgZXhpc3RpbmcgaW1w
bGVtZW50YXRpb24gd2hlcmUgd2UgdHJhbnNmZXJyZWQgb3duZXJzaGlwIG9mDQo+IHNvY2tldCBm
cm9tIGNvbm5lY3Rpb24gY2xhc3MgdG8gcnVsZSBjbGFzcw0KPiA+PiA+IGJhc2VkIG9uICBodHRw
IGhlYWRlciBmaWVsZCAidXBncmFkZTo6d2Vic29ja2V0Ig0KPiA+PiA+DQo+ID4+ID4gIEFzIEkg
ZXhwbGFpbmVkIGFib3ZlLCB3ZSBuZWVkIGJpLWRpcmVjdGlvbmFsIGNvbW11bmljYXRpb24sDQo+
IHdoZXJlIGJtYyBzZW5kcyBjZXJ0YWluIHBheWxvYWQgYW5kIG5iZCBvbiBjbGllbnQtc2lkZQ0K
PiA+PiA+IGFja25vd2xlZGdlcyByZWNlaXZlZCBwYXlsb2FkLg0KPiA+PiA+DQo+ID4+ID4gU28g
d2UgbmVlZCB3ZWJzb2NrZXQgd2F5IG9mIGltcGxlbWVudGF0aW9uLCB3aGVyZSB3ZSBuZWVkIHRv
DQo+IGtlZXAgcmVhZGluZyBhbmQgd3JpdGluZyBjb25zdGFudGx5IG9uIHRoZSBzYW1lIHNvY2tl
dC4NCj4gPj4NCj4gPj4gV2h5IG5vdCBqdXN0IHVzZSB3ZWJzb2NrZXRzPyAgVGhhdCdzIHdoYXQg
dGhleSdyZSBkZXNpZ25lZCB0byBkby4NCj4gPj4NCj4gPg0KPiA+IFdlIGNhbid0IHVzZSB3ZWJz
b2NrZXRzLCBCZWNhdXNlIGhvdyBkb2VzIHRoZSBjbGllbnQga25vd3MgdGhhdCB0aGV5DQo+IG5l
ZWQgdG8gbWFrZSB0aGUgd2Vic29ja2V0IHJlcXVlc3QgcmF0aGVyIHRoYW4gSFRUUC4NCj4gPiBE
dW1wIG9mZmxvYWQgdXJsIGlzIGdpdmVuIGFzIHVybCwgd2UgZG9uJ3Qgc3BlY2lmeSB0aGUgcHJv
dG9jb2wgaW4gdGhlIHVybC4NCj4gDQo+IEFzIGEgY291bnRlciwgaW4gdGhlIG1vZGVsIGFib3Zl
LCBob3cgZG9lcyB0aGUgY2xpZW50IGtub3cgaXQgbmVlZHMgdG8NCj4gc3BlYWsgTkJEPyAgSG93
IGRvZXMgYW55IGNsaWVudCBrbm93IGl0IG5lZWRzIHRvIGRvIGFueSBwcm90b2NvbA0KPiBjb21t
dW5pY2F0aW9uPyAgSXQgaGFzIHRvIGhhdmUgc29tZSBwcmlvciBrbm93bGVkZ2Ugb2Ygc29tZSBw
b3J0LA0KPiBob3N0LCBhbmQgdXJsLCBpbiBxdWVzdGlvbi4gIElmIHlvdSB3YW50IGEgaHlwZXJt
ZWRpYSBBUEksIHlvdSB3b3VsZA0KPiBwcm92aWRlIGEgc3RhcnRlciByZXNvdXJjZSB3aXRoIGEg
bGluayB0aGF0IHN0YXJ0cyB3aXRoIHdzczovLy4NCj4gQWx0ZXJuYXRpdmVseSwgeW91IGNvdWxk
IGp1c3QgZG8gd2hhdCBhbGwgdGhlIG90aGVyIHdlYnNvY2tldHMNCj4gaGFuZGxlcnMgZG8sIGFu
ZCBqdXN0IGhhdmUgdGhlIGNsaWVudCBoYXZlIHByaW9yIGtub3dsZWRnZSB0aGF0IHRoYXQNCj4g
VVJMIGxlYWRzIHRvIGEgd2Vic29ja2V0LCBhbmQgb3BlbiBpdCBhcHByb3ByaWF0ZWx5Lg0KPiAN
Cj4gPg0KPiA+Pg0KPiA+PiA+IFdoYXQgSSBhbSB1bmFibGUgdG8gY29ubmVjdCBpcyBob3cgdG8g
dHJhbnNmZXIgb3duZXJzaGlwIG9mIHNvY2tldA0KPiBjb25uZWN0aW9uIHRvIG5ldyBydWxlIGNs
YXNzLCBhcyBpbiB0aGlzIGNhc2UNCj4gPj4gPiB3ZSBjYW4ndCB0YWtlIHRoZSBkZWNpc2lvbiBi
YXNlZCBvbiAgcmVxdWVzdCBoZWFkZXIvY29udGVudC4gY2FuDQo+IHlvdSBwcm92aWRlIHlvdXIg
c3VnZ2VzdGlvbiAgcGxlYXNlPw0KPiA+Pg0KPiA+PiBJIHRoaW5rIEkga25vdyBob3cgdG8gZG8g
aXQsIGJ1dCBsZXQncyBtYWtlIHN1cmUgaXQncyB0aGUgcmlnaHQgdGhpbmcNCj4gPj4gdG8gZG8g
YmVmb3JlIHdlIGNvbW1pdCB0byB0aGF0Lg0KPiA+DQo+ID4NCj4gPiBvay4gY2FuIHlvdSBwbGVh
c2UgZXhwbGFpbiB5b3VyIHRob3VnaHRzIGhlcmU/DQo+IA0KPiBJZiB5b3Ugd2FudCBiaWRpcmVj
dGlvbmFsIGNvbW11bmljYXRpb24sIHlvdSBzaG91bGQgdXNlIHdlYnNvY2tldHMuDQo+IElmIHlv
dSB3YW50IG9uZSB3YXkgc3RyZWFtaW5nIGNvbW11bmljYXRpb24sIHlvdSBzaG91bGQgdXNlIHJl
Z3VsYXINCj4gSFRUUCAoZm9yICJmYXN0IiBkYXRhKSwgU1NFIChGb3IgcmFyZSBldmVudCBkYXRh
KSwgb3IgTG9uZyBwb2xsaW5nIChpZg0KPiB5b3Ugd2FudCB0byBpbXBsZW1lbnQgc29tZXRoaW5n
IHJlbGF0aXZlbHkgd2VsbCBzdXBwb3J0ZWQpLiAgV2l0aCB0aGF0DQo+IHNhaWQsIGZvciB3aGF0
IGl0IGxvb2tzIGxpa2UgeW91J3JlIHRyeWluZyB0byBkbywgSSBzdXNwZWN0IHlvdSBkb24ndA0K
PiByZWFsbHkgbmVlZCBiaWRpcmVjdGlvbmFsIGNvbW11bmljYXRpb24gZm9yIGEgZmlsZSBkb3du
bG9hZC4gIFdpdGgNCj4gdGhhdCBzYWlkLCBJIGRvbid0IGtub3cgeW91ciBoeXBlcnZpc29yLCBz
byBJIGNvdWxkIGJlIHdyb25nLg0KPiANCj4gVG8gYmUgY2xlYXIsIEknbSBhZ2FpbnN0IGJyZWFr
aW5nIHRoZSBIVFRQIFJGQyBpbiBibWN3ZWIsIHdlIHNob3VsZA0KPiBhdm9pZCBpdCBpbiBhbGwg
Y2FzZXMuDQo+IA0KPiAtRWQNCj4gDQo+ID4+DQo+ID4+ID4NCj4gPj4gPiBXaGF0IGRvIHlvdSBt
ZWFuIGJ5IGR5bmFtaWMgcmVxdWVzdCBhbmQgZHluYW1pYyByZXNwb25zZT8NCj4gPj4NCj4gPj4g
SXQncyBhIGNvbmNlcHQgd2l0aGluIEJlYXN0LCBmb3IgYSBib2R5IHRoYXQgaXMgc3RyZWFtaW5n
IHRoZSBvdXRwdXQuDQo+ID4+DQo+ID4+ID4gQXMgcGVyIG15IHVuZGVyc3RhbmRpbmcsIGR5bmFt
aWMgcmVzcG9uc2UgaXMgYmFzZWQgb24gaHR0cA0KPiByZXF1ZXN0IGNvbnRlbnQsIG9uZSBvZiB0
aGUgaGVhZGVyIGZpZWxkICJhY2NlcHQiDQo+ID4+ID4gd2hlcmUgY2xpZW50IHNwZWNpZmllcyBk
YXRhIGZvcm1hdCBhbmQgZGVwZW5kaW5nIG9uIHRoaXMgZm9ybWF0LA0KPiByZXNwb25zZSBnZXRz
IGdlbmVyYXRlZC4gSXMgaXQgYSBkeW5hbWljIHJlc3BvbnNlPw0KPiA+PiA+IGlmIGl0J3MgdHJ1
ZSwgaG93IGlzIGl0IGFwcGxpY2FibGUgaGVyZT8NCj4gPj4NCj4gPj4gTm8sIGR5bmFtaWMgcmVx
dWVzdHMgYW5kIGR5bmFtaWMgcmVzcG9uc2VzIGFyZSB3aGVyZSB0aGUgaHR0cA0KPiA+PiBmcmFt
ZXdvcmsgZG9lc24ndCB3YWl0IGZvciB0aGUgcmVxdWVzdCB0byBiZSBkb25lIHNlbmRpbmcgYmVm
b3JlDQo+ID4+IHJlYWRpbmcgaXQgaW4uICBJdCdzIGdlbmVyYWxseSB1c2VkIGZvciBsYXJnZSBy
ZXF1ZXN0cyB5b3UgZG9uJ3Qgd2FudA0KPiA+PiB0byBidWZmZXIgYmVmb3JlIHNlbmRpbmcuDQo+
ID4+DQo+ID4+DQo+IGh0dHBzOi8vd3d3LmJvb3N0Lm9yZy9kb2MvbGlicy8xXzc0XzAvbGlicy9i
ZWFzdC9kb2MvaHRtbC9iZWFzdC9yZWYvDQo+IGJvb3N0X19iZWFzdF9faHR0cF9fYmFzaWNfZHlu
YW1pY19ib2R5Lmh0bWwNCj4gPj4NCj4gPj4NCj4gPj4NCj4gPj4gPg0KPiA+PiA+IFJlc3BvbnNl
IG9iamVjdCB3cml0aW5nIHBheWxvYWQgdG8gZHluYW1pYyBib2R5IG1heSBub3Qgd29yayBpbg0K
PiB0aGlzIGNhc2UuDQo+ID4+ID4gUmVzcG9uc2Ugb2JqZWN0IGRvZXMgbm90ICBob2xkICBzb2Nr
ZXQsIG9ubHkgY29ubmVjdGlvbiBjbGFzcyB3aGljaA0KPiBpcyBoYXZpbmcgc29ja2V0LCBleGNl
cHQgaGFuZGxlVXBncmFkZSBjYXNlDQo+ID4+ID4gd2hlcmUgd2UgdHJhbnNmZXIgc29ja2V0IG93
bmVyc2hpcCB0byBjb25uZWN0aW9uIHRvIHJ1bGUgY2xhc3MNCj4gd2hpY2ggY3JlYXRlcyBhbm90
aGVyIGNvbm5lY3Rpb24NCj4gPj4NCj4gPj4gVGhhdCdzIHdoYXQgSSdtIHNheWluZywgZG9uJ3Qg
dHJhbnNmZXIgdGhlIG93bmVyc2hpcCBhdCBhbGwsIGp1c3QNCj4gPj4gY3JlYXRlIGEgcmVzcG9u
c2UgQVBJIHRoYXQgYWxsb3dzIHlvdSB0byBzZW5kIGRhdGEgdG8gc29ja2V0IGRpcmVjdGx5Lg0K
PiA+Pg0KPiA+PiA+DQo+ID4+ID4gVGhhbmtzDQo+ID4+ID4gLVJhdml0ZWphDQo+ID4+ID4NCj4g
Pj4gPj4NCj4gPj4gPj4NCj4gPj4gPj4NCj4gPj4gPj4gPj4gT24gRnJpLCAyOCBBdWcsIDIwMjAs
IDEyOjQyIGFtIEVkIFRhbm91cywgPGVkQHRhbm91cy5uZXQ+DQo+IHdyb3RlOg0KPiA+PiA+PiA+
Pj4NCj4gPj4gPj4gPj4+IE9uIFN1biwgQXVnIDIsIDIwMjAgYXQgODo1MyBBTSBFZCBUYW5vdXMg
PGVkQHRhbm91cy5uZXQ+DQo+IHdyb3RlOg0KPiA+PiA+PiA+Pj4gPg0KPiA+PiA+PiA+Pj4gPiBJ
J20gbG9va2luZyBhdCBhIGNvdXBsZSByZWNlbnQgY2hhbmdlcyB0byBibWN3ZWIsIGFuZCBJJ20N
Cj4gZmluZGluZyBhDQo+ID4+ID4+ID4+PiA+IHNpZ25pZmljYW50IGFyY2hpdGVjdHVyZSBwcm9i
bGVtIGhhcyBiZWVuIGluamVjdGVkLiAgTmFtZWx5LA0KPiBpdCdzDQo+ID4+ID4+ID4+PiA+IHRo
ZXNlIGlubm9jdW91cyBsb29raW5nIDQgbGluZXMgaGVyZSwgd2hpY2ggaW5qZWN0cyB0aGUgc29j
a2V0DQo+IGFkYXB0b3INCj4gPj4gPj4gPj4+ID4gaW50byB0aGUgcmVxdWVzdCBvYmplY3QgZm9y
IHVzZSBsYXRlci4NCj4gPj4gPj4gPj4+ID4NCj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMv
Ym1jd2ViL2Jsb2IvMzBjNThkNTgxNjA2YjQ0ODQ3NTdlNmUNCj4gZTkxMzNjMjQ4ZGUxNTE0YTYv
aHR0cC9odHRwX3JlcXVlc3QuaCNMMTgNCj4gPj4gPj4gPj4+ID4NCj4gPj4gPj4gPj4+ID4gVGhl
IHByb2JsZW0gd2l0aCB0aGlzIGFwcHJvYWNoIGhhcyBhIGZldyByb290czoNCj4gPj4gPj4gPj4+
ID4gMS4gVGhlIFJlcXVlc3QgY2xhc3MgaXMgbWVhbnQgdG8gbW9kZWwgYSBzaW5nbGUgcmVxdWVz
dCwgc2luZ2xlDQo+ID4+ID4+ID4+PiA+IHJlc3BvbnNlIG1vZGVsLiAgQWRkaW5nIHRoZSBzdHJl
YW0gc2VtYW50aWNzIGJyZWFrcyB0aGlzIGluDQo+IHByZXR0eQ0KPiA+PiA+PiA+Pj4gPiBzaWdu
aWZpY2FudCB3YXlzLCBhbmQgZm9yY2VzIGEgaGFyZCBkZXBlbmRlbmN5IGJldHdlZW4gdGhlDQo+
IHN0cmVhbWluZw0KPiA+PiA+PiA+Pj4gPiBhZGFwdGVyIGFuZCB0aGUgUmVxdWVzdCwgd2hpY2gg
d2FzIG5vdCB0aGUgaW50ZW50LiAgV2UgaGF2ZQ0KPiA+PiA+PiA+Pj4gPiBhYnN0cmFjdGlvbnMg
Zm9yICJzdHJlYW1pbmciIHJlcXVlc3RzLCBidXQgdGhhdCB3YXMgc2VlbWluZ2x5DQo+IG5vdA0K
PiA+PiA+PiA+Pj4gPiB1c2VkLg0KPiA+PiA+PiA+Pj4gPg0KPiA+PiA+PiA+Pj4gPiAyLiBJbiB0
aGUgY29kZSB0aGF0IGV4aXN0ZWQgYmVmb3JlIHRoaXMsIEFkYXB0b3Igd2FzIGENCj4gdGVtcGxh
dGUgb24NCj4gPj4gPj4gPj4+ID4gcHVycG9zZS4gIEl0IGlzIGRlc2lnbmVkIHRvIGltcGxlbWVu
dCB0aGUgc3RkOjpuZXR3b3JraW5nDQo+ID4+ID4+ID4+PiA+IEFzeW5jUmVhZFN0cmVhbSBhbmQg
QXN5bmNXcml0ZVN0cmVhbSBjb25jZXB0cy4gIFRoaXMgaXMNCj4gZGVzaWduZWQgdG8NCj4gPj4g
Pj4gPj4+ID4gYWxsb3cgaW5qZWN0aW9uIG9mIFVuaXQgVGVzdHMgYXQgc29tZSBwb2ludCwgYXMg
SSd2ZSB0YWxrZWQNCj4gYWJvdXQNCj4gPj4gPj4gPj4+ID4gYmVmb3JlLiAgSGFyZGNvZGluZyBp
dCBpbiByZXF1ZXN0IHRvIDIgZm9yY2VkIHN0cmVhbSB0eXBlcywNCj4gYmFzZWQgb24NCj4gPj4g
Pj4gPj4+ID4gdGhlIGNvbXBpbGVyIGZsYWcgaXMgaW5jb3JyZWN0IHBlciBhc2lvIHN0YW5kYXJk
cywgYW5kIHJlbW92ZXMNCj4gdGhlDQo+ID4+ID4+ID4+PiA+IGFiaWxpdHkgdG8gaW5qZWN0IGFy
Yml0cmFyeSBhZGFwdGVycywgbGlrZSB0ZXN0IGFkYXB0b3JzLiAgQWxzbywNCj4gdGhlDQo+ID4+
ID4+ID4+PiA+IGZsYWcgdXNlZCBpcyBpbmNvcnJlY3QsIGFzIGl0J3MgcG9zc2libGUgdG8gaW5q
ZWN0IGEgbm9uLXNzbCBzb2NrZXQNCj4gPj4gPj4gPj4+ID4gZXZlbiBpZiBTU0wgaXMgZW5hYmxl
ZC4NCj4gPj4gPj4gPj4+ID4NCj4gPj4gPj4gPj4+ID4gMy4gVGhlcmUgaXMgYWxyZWFkeSBhIHBy
ZWNlZGVudCBhbmQgcGF0dGVybiBmb3Igc3RyZWFtaW5nDQo+IGludGVyZmFjZXMNCj4gPj4gPj4g
Pj4+ID4gaW4gYm1jd2ViIHRoYXQgd2UgYWRvcHRlZCBmcm9tIENyb3cuICBJZiB5b3UgbG9vayBh
dCB0aGUNCj4gV2Vic29ja2V0DQo+ID4+ID4+ID4+PiA+IHJlcXVlc3QgcmVzcG9uc2UgdHlwZSwg
aXQgaW1wbGVtZW50cyBhIHdheSB0byByZXF1ZXN0IGENCj4gcm91dGUgdGhhdA0KPiA+PiA+PiA+
Pj4gPiBzdHJlYW1zIGR5bmFtaWNhbGx5LiAgRnJ1c3RyYXRpbmdseSwgcGFydCBvZiB3aGF0IHRo
aXMgd2FzIHVzZWQNCj4gZm9yDQo+ID4+ID4+ID4+PiA+IHdhcyBTU0UsIHdoaWNoIEkgaGFkIGFs
cmVhZHkgd3JpdHRlbiBhIHBhdGNoIGZvciB0aGF0IGRpZG4ndA0KPiBoYXZlIGFueQ0KPiA+PiA+
PiA+Pj4gPiBvZiB0aGUgYWJvdmUgaXNzdWVzLCBhbmQgb25seSBoYWRuJ3QgbWVyZ2VkIGl0IGJl
Y2F1c2Ugd2UNCj4gZGlkbid0IGhhdmUNCj4gPj4gPj4gPj4+ID4gYW55IFNTRSByb3V0ZXMgeWV0
LCBhbmQgZGlkbid0IHdhbnQgdG8gY2hlY2sgaW4gZGVhZCBjb2RlLg0KPiA+PiA+PiA+Pj4gPiBo
dHRwczovL2dlcnJpdC5vcGVuYm1jLQ0KPiBwcm9qZWN0Lnh5ei9jL29wZW5ibWMvYm1jd2ViLysv
MTM5NDgNCj4gPj4gPj4gPj4+ID4NCj4gPj4gPj4gPj4+ID4gNC4gSXQgb3BlbnMgdGhlIHBvc3Np
YmlsaXR5IGZvciBsaWZldGltZSBhbmQgcG9zc2libGUgKGF0IHRoZQ0KPiB2ZXJ5DQo+ID4+ID4+
ID4+PiA+IGxlYXN0IGhhcmRlciB0byBhdWRpdCkgc2VjdXJpdHkgaXNzdWVzLCBhcyBub3cgdGhl
ICJodHRwIHNlcnZlciINCj4gPj4gPj4gPj4+ID4gY29tcG9uZW50IGlzIG5vIGxvbmdlciB0aGUg
b25seSB0aGluZyB0aGF0IGNhbiBvd24gc29ja2V0cy4NCj4gPj4gPj4gPj4+ID4gUHJldmlvdXNs
eSwgdGhlIHNlcnZlciBvd25lZCB0aGUgc29ja2V0cyB1bnRpbCBoYW5kZWQgb2ZmLA0KPiB0aGVu
IHRoZXJlDQo+ID4+ID4+ID4+PiA+IHdhcyBubyBzaGFyZWQgb3duZXJzaGlwIGJldHdlZW4gdGhl
IHdlYnNvY2tldCBjbGFzcywgYW5kDQo+IHRoZQ0KPiA+PiA+PiA+Pj4gPiBDb25uZWN0aW9uIGNs
YXNzLiAgVGhlIENvbm5lY3Rpb24gY2xhc3MgY291bGQgYmUgY29tcGxldGVseQ0KPiBkZXN0cm95
ZWQNCj4gPj4gPj4gPj4+ID4gKGFuZCBtZW1vcnkgZnJlZWQpIHdoaWxlIHRoZSB3ZWJzb2NrZXQg
d2FzIHN0aWxsIGNvbm5lY3RlZA0KPiBhbmQNCj4gPj4gPj4gPj4+ID4gcnVubmluZy4NCj4gPj4g
Pj4gPj4+ID4NCj4gPj4gPj4gPj4+ID4gTW92aW5nIHRvIGFub3RoZXIgdHJhY2ssIHlvdSBtYXkg
YXNrLCBob3cgZGlkIEkgY29tZSBhY3Jvc3MNCj4gdGhpcyBhbmQNCj4gPj4gPj4gPj4+ID4gd2h5
IGRvZXMgaXQgbWF0dGVyPyAgSSdtIHRyeWluZyB0byBhZGQgMiBuZXcgZmVhdHVyZXMgdG8NCj4g
Ym1jd2ViLiAgVGhlDQo+ID4+ID4+ID4+PiA+IGZpcnN0IGFsbG93cyBvcGVuaW5nIG11bHRpcGxl
IHNvY2tldHMsIGFuZCBkeW5hbWljYWxseQ0KPiBkZXRlY3RpbmcgVExTDQo+ID4+ID4+ID4+PiA+
IHN0cmVhbXMgb24gdGhlbS4gIFRoaXMgYWxsb3dzIGJtY3dlYiB0byBoYW5kbGUgYm90aCBIVFRQ
Uw0KPiByZWRpcmVjdHMgaW4NCj4gPj4gPj4gPj4+ID4gYmFuZCwgYW5kIGhhbmRsZSB0aGUgY2Fz
ZSB3aGVyZSB1c2VycyB0eXBlIGluIHNvbWV0aGluZw0KPiBlcnJvbmVvdXMsDQo+ID4+ID4+ID4+
PiA+IGxpa2UgImh0dHA6Ly9teWJtYzo0NDMiIGFuZCBjb25uZWN0IHRvIGFuIFNTTCBzb2NrZXQg
d2l0aCBhDQo+IG5vbi1zc2wNCj4gPj4gPj4gPj4+ID4gcHJvdG9jb2wuICBJbiB0aG9zZSBjYXNl
cywgd2UgY2FuIHNpbXBseSBkbyB0aGUgcmlnaHQgdGhpbmcuICBJdA0KPiBhbHNvDQo+ID4+ID4+
ID4+PiA+IGFsbG93cyBibWN3ZWIgdG8gaG9zdCBvbiBtdWx0aXBsZSBwb3J0cywgd2hpY2ggbWln
aHQgYmUNCj4gaW50ZXJlc3RpbmcNCj4gPj4gPj4gPj4+ID4gZm9yIGFnZ3JlZ2F0b3IgdHlwZXMu
ICBNb3JlIGltcG9ydGFudGx5LCBpdCBjbGVhbnMgdXAgc29tZSBvZg0KPiB0aGUNCj4gPj4gPj4g
Pj4+ID4gQWRhcHRvciBhYnN0cmFjdGlvbiB0byBtYWtlIHdheSBmb3IgdW5pdCB0ZXN0aW5nLCBh
bmQgYmVpbmcNCj4gYWJsZSB0bw0KPiA+PiA+PiA+Pj4gPiBpbmplY3QgYSAidGVzdCIgc29ja2V0
LCB0aGF0IHdlIGNhbiBjb250cm9sIHRoZSBzZW1hbnRpY3Mgb2YuDQo+IEknbQ0KPiA+PiA+PiA+
Pj4gPiBob3BpbmcgZXZlbnR1YWxseSB0byBiZSBhYmxlIHRvIG1vY2sgZGJ1cywgYW5kIG1vY2sg
dGhlIFRDUA0KPiBzb2NrZXQsDQo+ID4+ID4+ID4+PiA+IGFuZCBydW4gYSBmdWxsIFJlZGZpc2gg
dmFsaWRhdG9yIHJ1biBpbiBhIHVuaXQgdGVzdC4gIEkgdGhpbmsgdGhhdA0KPiA+PiA+PiA+Pj4g
PiB3b3VsZCBzYXZlIGEgbG90IG9mIHRpbWUgb3ZlcmFsbCBmb3IgYm90aCBjb21taXR0ZXJzIGFu
ZA0KPiBjb25zdW1lcnMuDQo+ID4+ID4+ID4+PiA+DQo+ID4+ID4+ID4+PiA+IFRoZSBmaXJzdCBv
ZiB0aGVzZSBwYXRjaGVzIGlzIHBvc3RlZCBoZXJlLCBhbmQgc2ltcGx5DQo+IGNvbW1lbnRzIG91
dCB0aGUNCj4gPj4gPj4gPj4+ID4gYWJvdmUgcHJvYmxlbXMgZm9yIG5vdy4NCj4gPj4gPj4gPj4+
ID4gaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy0NCj4gcHJvamVjdC54eXovYy9vcGVuYm1jL2JtY3dl
Yi8rLzM1MjY1DQo+ID4+ID4+ID4+PiA+DQo+ID4+ID4+ID4+PiA+IElmIEkgbG9vayB0aHJvdWdo
IHRoZSBjb21taXQgbG9ncywgaXQgbG9va3MgbGlrZSBSYXZpIGFuZCBBcHB1DQo+IGJ1aWx0DQo+
ID4+ID4+ID4+PiA+IHRoZSB0d28gc21hbGwgc3Vic3lzdGVtcyB0aGF0IHJlbHkgb24gdGhlIGFi
b3ZlIGFic3RyYWN0aW9uLA0KPiBvbmUgZm9yDQo+ID4+ID4+ID4+PiA+IFNTRSwgYW5kIG9uZSBm
b3Igc29tZSBOQkQgc3RyZWFtZXIuDQo+ID4+ID4+ID4+PiA+IFdoYXQgZG8geW91IHR3byB0aGlu
ayBhYm91dCB0aGUgYWJvdmU/ICBXYXMgaXQgc29tZXRoaW5nDQo+IHlvdQ0KPiA+PiA+PiA+Pj4g
PiBjb25zaWRlcmVkIHdoZW4geW91IHdyb3RlIHlvdXIgcGF0Y2hlcz8gIFdvdWxkIHlvdQ0KPiBj
b25zaWRlciBmaXhpbmcNCj4gPj4gPj4gPj4+ID4gdGhlbT8NCj4gPj4gPj4gPj4+ID4NCj4gPj4g
Pj4gPj4+ID4gICBNeSByZWNvbW1lbmRhdGlvbiB3b3VsZCBiZSB0byBtb3ZlIGJvdGggb2YgdGhv
c2UgdHdvDQo+IG92ZXIgdG8NCj4gPj4gPj4gPj4+ID4gc29tZXRoaW5nIHNpbWlsYXIgdG8gdGhl
IHdlYnNvY2tldCBhYnN0cmFjdGlvbiB3ZSBoYXZlLCB3aXRoLA0KPiBvbg0KPiA+PiA+PiA+Pj4g
PiBjb25uZWN0LCBvbiBkYXRhLCBhbmQgb24gY2xvc2UgaGFuZGxlcnMuICBUaGlzIG1lYW5zIHRo
YXQNCj4gaGFuZGxlcnMgbm8NCj4gPj4gPj4gPj4+ID4gbG9uZ2VyIHRha2UgYSBoYXJkIGRlcGVu
ZGVuY3kgb24gdGhlIHRyYW5zcG9ydCwgd2hpY2ggd2lsbA0KPiBoZWxwIGZvcg0KPiA+PiA+PiA+
Pj4gPiBib3RoIHVuaXQgdGVzdGluZywgYW5kIGlmIHdlIGV2ZXIgd2FudCB0byBzdXBwb3J0IHJl
ZGZpc2gNCj4gZGV2aWNlDQo+ID4+ID4+ID4+PiA+IGVuYWJsZW1lbnQgKHdoaWNoIHJlbGllcyBv
biBhbiBpMmMgYmFzZWQgdHJhbnNwb3J0KS4gVGhlIFNTRQ0KPiBvbmUgY2FuDQo+ID4+ID4+ID4+
PiA+IHByb2JhYmx5IGJlIHVzZWQgbW9yZSBvciBsZXNzIGFzLWlzIGZyb20gbXkgb2xkIHBhdGNo
LiAgVGhlDQo+IE5CRCBvbmUNCj4gPj4gPj4gPj4+ID4gbWlnaHQgbmVlZCBhICJEeW5hbWljIGJv
ZHkiIHR5cGUsIHdoaWNoIGJlYXN0IGFscmVhZHkgaGFzDQo+IGFuDQo+ID4+ID4+ID4+PiA+IGFi
c3RyYWN0aW9uIGZvciB0aGF0IHNlZW1zIHRvIGhhdmUgYmVlbiBkaXNjb3VudGVkLg0KPiA+PiA+
PiA+Pj4gPg0KPiA+PiA+PiA+Pj4gPiBXaGF0IGRvIHlvdSBndXlzIHRoaW5rPw0KPiA+PiA+PiA+
Pj4gPg0KPiA+PiA+PiA+Pj4gPiAtRWQNCj4gPj4gPj4gPj4+DQo+ID4+ID4+ID4+Pg0KPiA+PiA+
PiA+Pj4gSXQncyBiZWVuIDMgd2Vla3MgYW5kIEkgaGF2ZW4ndCBnb3R0ZW4gYW55IHJlcGxpZXMg
dG8gdGhpcyBwcmV0dHkNCj4gPj4gPj4gPj4+IG1ham9yIGFyY2hpdGVjdHVyZSBicmVhay4gIEl0
IGFsc28gbG9va3MgbGlrZSBpdCBjYW4gYWxzbyBjYXVzZSBhDQo+ID4+ID4+ID4+PiBtZW1vcnkg
bGVhayBpbiBIdHRwQ29ubmVjdGlvbiBoZXJlIChmb3VuZCBieSBjb2RlIGluc3BlY3Rpb24NCj4g
aGVyZSkuDQo+ID4+ID4+ID4+Pg0KPiBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9ibWN3ZWIv
YmxvYi9lYmQ0NTkwNjBlYTRmNDI3NjE0MDJkZA0KPiA1NGFjZDA5NjJjMzYxMzZjMi9odHRwL2h0
dHBfY29ubmVjdGlvbi5oI0wzNTENCj4gPj4gPj4gPj4+DQo+ID4+ID4+ID4+PiBJJ3ZlIHB1c2hl
ZCBhIHJldmVydCB0byByZW1vdmUgdGhlIGZlYXR1cmVzIGluIHF1ZXN0aW9uLiAgSQ0KPiB3b3Vs
ZCBsb3ZlDQo+ID4+ID4+ID4+PiBzb21lIGNvbW1lbnRzIGZyb20gdGhlIGRldmVsb3BlcnMgdGhh
dCBjYXVzZWQgdGhlc2UNCj4gYnJlYWthZ2VzLCBzbyBJDQo+ID4+ID4+ID4+PiBjYW4gbWFrZSBz
dXJlIEknbSBkb2luZyB0aGUgcmlnaHQgdGhpbmcgaGVyZSwgYW5kIEknbSBub3QNCj4gY29tcGxl
dGVseQ0KPiA+PiA+PiA+Pj4gb2ZmIGJhc2UgKG9yIHRoYXQgeW91IGludGVuZCB0byBmaXggdGhl
bSwgYW5kIHRoaXMgcGF0Y2ggaXMNCj4gPj4gPj4gPj4+IHVubmVjZXNzYXJ5KS4NCj4gPj4gPj4g
Pj4+IGh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMtDQo+IHByb2plY3QueHl6L2Mvb3BlbmJtYy9ibWN3
ZWIvKy8zNjAzOA0KPiA+PiA+PiA+Pj4NCj4gPj4gPj4gPj4+IFRoYW5rcywNCj4gPj4gPj4gPj4+
DQo+ID4+ID4+ID4+PiAtRWQNCg0K

