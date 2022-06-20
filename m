Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 369F6554001
	for <lists+openbmc@lfdr.de>; Wed, 22 Jun 2022 03:24:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSQf5137Kz3btp
	for <lists+openbmc@lfdr.de>; Wed, 22 Jun 2022 11:24:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=GVS4vpsg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amazon.com (client-ip=72.21.196.25; helo=smtp-fw-2101.amazon.com; envelope-from=prvs=1638f6106=andraprs@amazon.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=GVS4vpsg;
	dkim-atps=neutral
Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LRPT25qMBz303H;
	Mon, 20 Jun 2022 19:28:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1655717287; x=1687253287;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=BcnzPCl+w6LzQQ4CxVrsHze1QzVlSp7IFQFI+hTRtqQ=;
  b=GVS4vpsgMD2qyqA9njMF/osnaGDHrU/gxaJe/2DK0vCLa0Z3LJlGtmMI
   uyIxfgTdx4/VbTLdMLCKVuWS0+0/f9mXKIZl5UVidIgpTbEv18M9rlIIx
   Y2bu6qcPH/yeXq0NQdeUUyiMFLBUF23NYM9KkD6Pbe1zxWmncyLFfQInc
   c=;
X-IronPort-AV: E=Sophos;i="5.92,306,1650931200"; 
   d="scan'208";a="209430580"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-pdx-2b-c275e159.us-west-2.amazon.com) ([10.43.8.2])
  by smtp-border-fw-2101.iad2.amazon.com with ESMTP; 20 Jun 2022 09:26:49 +0000
Received: from EX13D16EUB003.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
	by email-inbound-relay-pdx-2b-c275e159.us-west-2.amazon.com (Postfix) with ESMTPS id 50FBF81570;
	Mon, 20 Jun 2022 09:26:48 +0000 (UTC)
Received: from [192.168.24.192] (10.43.162.51) by EX13D16EUB003.ant.amazon.com
 (10.43.166.99) with Microsoft SMTP Server (TLS) id 15.0.1497.36; Mon, 20 Jun
 2022 09:26:39 +0000
Message-ID: <d6f031fa-f287-75e6-dee0-b94bd22bd32d@amazon.com>
Date: Mon, 20 Jun 2022 12:26:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 4/5] nitro_enclaves: test: Use kunit_test_suite() macro
Content-Language: en-US
To: David Gow <davidgow@google.com>, Brendan Higgins
	<brendanhiggins@google.com>, Luis Chamberlain <mcgrof@kernel.org>, Jeremy
 Kerr <jk@codeconstruct.com.au>, Daniel Latypov <dlatypov@google.com>, Shuah
 Khan <skhan@linuxfoundation.org>, Andrew Jeffery <andrew@aj.id.au>, Mika
 Westerberg <mika.westerberg@linux.intel.com>, Longpeng <longpeng2@huawei.com>
References: <20220618090310.1174932-1-davidgow@google.com>
 <20220618090310.1174932-5-davidgow@google.com>
From: "Paraschiv, Andra-Irina" <andraprs@amazon.com>
In-Reply-To: <20220618090310.1174932-5-davidgow@google.com>
X-Originating-IP: [10.43.162.51]
X-ClientProxiedBy: EX13D41UWB004.ant.amazon.com (10.43.161.135) To
 EX13D16EUB003.ant.amazon.com (10.43.166.99)
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64
X-Mailman-Approved-At: Wed, 22 Jun 2022 11:24:09 +1000
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
Cc: linux-aspeed@lists.ozlabs.org, =?UTF-8?Q?Ma=c3=adra_Canal?= <maira.canal@usp.br>, openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Matt Johnston <matt@codeconstruct.com.au>, linux-modules@vger.kernel.org, kunit-dev@googlegroups.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

CgpPbiAxOC4wNi4yMDIyIDEyOjAzLCBEYXZpZCBHb3cgd3JvdGU6Cj4gCj4gVGhlIGt1bml0X3Rl
c3Rfc3VpdGUoKSBtYWNybyBwcmV2aW91c2x5IGNvbmZsaWN0ZWQgd2l0aCBtb2R1bGVfaW5pdCwK
PiBtYWtpbmcgaXQgdW5zdWl0YWJsZSBmb3IgdXNlIGluIHRoZSBuaXRyb19lbmNsYXZlcyB0ZXN0
LiBOb3cgdGhhdCBpdCdzCj4gZml4ZWQsIHdlIGNhbiB1c2UgaXQgaW5zdGVhZCBvZiBhIGN1c3Rv
bSBjYWxsIGludG8gaW50ZXJuYWwgS1VuaXQKPiBmdW5jdGlvbnMgdG8gcnVuIHRoZSB0ZXN0Lgo+
IAo+IEFzIGEgc2lkZS1lZmZlY3QsIHRoaXMgbWVhbnMgdGhhdCB0aGUgdGVzdCByZXN1bHRzIGFy
ZSBwcm9wZXJseSBpbmNsdWRlZAo+IHdpdGggb3RoZXIgc3VpdGVzIHdoZW4gYnVpbHQtaW4uIFRv
IGNlbGVicmF0ZSwgZW5hYmxlIHRoZSB0ZXN0IGJ5Cj4gZGVmYXVsdCB3aGVuIEtVTklUX0FMTF9U
RVNUUyBpcyBzZXQgKGFuZCBOSVRST19FTkNMQVZFUyBlbmFibGVkKS4KPiAKPiBUaGUgbml0cm9f
ZW5jbGF2ZSB0ZXN0cyBjYW4gbm93IGJlIHJ1biB2aWEga3VuaXRfdG9vbCB3aXRoOgo+ICAgICAg
ICAgIC4vdG9vbHMvdGVzdGluZy9rdW5pdC9rdW5pdC5weSBydW4gLS1hcmNoPXg4Nl82NCBcCj4g
ICAgICAgICAgLS1rY29uZmlnX2FkZCBDT05GSUdfUENJPXkgLS1rY29uZmlnX2FkZCBDT05GSUdf
U01QPXkgXAo+ICAgICAgICAgIC0ta2NvbmZpZ19hZGQgQ09ORklHX0hPVFBMVUdfQ1BVPXkgXAo+
ICAgICAgICAgIC0ta2NvbmZpZ19hZGQgQ09ORklHX1ZJUlRfRFJJVkVSUz15IFwKPiAgICAgICAg
ICAtLWtjb25maWdfYWRkIENPTkZJR19OSVRST19FTkNMQVZFUz15IFwKPiAgICAgICAgICAnbmVf
bWlzY19kZXZfdGVzdCcKPiAKPiAoVGhpcyBpcyBhIHByZXR0eSBsb25nIGNvbW1hbmQsIHNvIGl0
IG1heSBiZSB3b3J0aCBhZGRpbmcgYSAua3VuaXRjb25maWcKPiBmaWxlIGF0IHNvbWUgcG9pbnQs
IGluc3RlYWQuKQo+IAo+IFNpZ25lZC1vZmYtYnk6IERhdmlkIEdvdyA8ZGF2aWRnb3dAZ29vZ2xl
LmNvbT4KClRoYW5rIHlvdSwgRGF2aWQsIGZvciB0aGUgS1VuaXQgdXBkYXRlIGFuZCBmb3IgdGhp
cyBwYXRjaC4KCj4gLS0tCj4gICBkcml2ZXJzL3RodW5kZXJib2x0L0tjb25maWcgICAgICAgICAg
ICAgICAgICAgfCAgNSArKy0tCj4gICBkcml2ZXJzL3ZpcnQvbml0cm9fZW5jbGF2ZXMvS2NvbmZp
ZyAgICAgICAgICAgfCAgNSArKy0tCj4gICBkcml2ZXJzL3ZpcnQvbml0cm9fZW5jbGF2ZXMvbmVf
bWlzY19kZXYuYyAgICAgfCAyNyAtLS0tLS0tLS0tLS0tLS0tLS0tCj4gICAuLi4vdmlydC9uaXRy
b19lbmNsYXZlcy9uZV9taXNjX2Rldl90ZXN0LmMgICAgfCAgNSArLS0tCj4gICA0IGZpbGVzIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMzUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvdGh1bmRlcmJvbHQvS2NvbmZpZyBiL2RyaXZlcnMvdGh1bmRlcmJvbHQvS2NvbmZp
Zwo+IGluZGV4IDRiZmVjOGEyODA2NC4uMmEwNjNkMzQ0Yjk0IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvdGh1bmRlcmJvbHQvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvdGh1bmRlcmJvbHQvS2NvbmZp
Zwo+IEBAIC0yOCw4ICsyOCw5IEBAIGNvbmZpZyBVU0I0X0RFQlVHRlNfV1JJVEUKPiAgICAgICAg
ICAgIHRoaXMgZm9yIHByb2R1Y3Rpb24gc3lzdGVtcyBvciBkaXN0cm8ga2VybmVscy4KPiAKPiAg
IGNvbmZpZyBVU0I0X0tVTklUX1RFU1QKPiAtICAgICAgIGJvb2wgIktVbml0IHRlc3RzIgo+IC0g
ICAgICAgZGVwZW5kcyBvbiBLVU5JVD15Cj4gKyAgICAgICBib29sICJLVW5pdCB0ZXN0cyIgaWYg
IUtVTklUX0FMTF9URVNUUwo+ICsgICAgICAgZGVwZW5kcyBvbiBLVU5JVAo+ICsgICAgICAgZGVm
YXVsdCBLVU5JVF9BTExfVEVTVFMKPiAKPiAgIGNvbmZpZyBVU0I0X0RNQV9URVNUCj4gICAgICAg
ICAgdHJpc3RhdGUgIkRNQSB0cmFmZmljIHRlc3QgZHJpdmVyIgoKVGhpcyBuZWVkcyB0byBiZSBp
bmNsdWRlZCBpbiB0aGUgcHJldmlvdXMgcGF0Y2ggaW5zdGVhZCAocGF0Y2ggMy81LCBmb3IgCnRo
dW5kZXJib2x0KS4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlydC9uaXRyb19lbmNsYXZlcy9L
Y29uZmlnIGIvZHJpdmVycy92aXJ0L25pdHJvX2VuY2xhdmVzL0tjb25maWcKPiBpbmRleCAyZDNk
OTgxNTgxMjEuLmNlOTFhZGQ4MTQwMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZpcnQvbml0cm9f
ZW5jbGF2ZXMvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvdmlydC9uaXRyb19lbmNsYXZlcy9LY29u
ZmlnCj4gQEAgLTE2LDggKzE2LDkgQEAgY29uZmlnIE5JVFJPX0VOQ0xBVkVTCj4gICAgICAgICAg
ICBUaGUgbW9kdWxlIHdpbGwgYmUgY2FsbGVkIG5pdHJvX2VuY2xhdmVzLgo+IAo+ICAgY29uZmln
IE5JVFJPX0VOQ0xBVkVTX01JU0NfREVWX1RFU1QKPiAtICAgICAgIGJvb2wgIlRlc3RzIGZvciB0
aGUgbWlzYyBkZXZpY2UgZnVuY3Rpb25hbGl0eSBvZiB0aGUgTml0cm8gRW5jbGF2ZXMiCj4gLSAg
ICAgICBkZXBlbmRzIG9uIE5JVFJPX0VOQ0xBVkVTICYmIEtVTklUPXkKPiArICAgICAgIGJvb2wg
IlRlc3RzIGZvciB0aGUgbWlzYyBkZXZpY2UgZnVuY3Rpb25hbGl0eSBvZiB0aGUgTml0cm8gRW5j
bGF2ZXMiIGlmICFLVU5JVF9BTExfVEVTVFMKPiArICAgICAgIGRlcGVuZHMgb24gTklUUk9fRU5D
TEFWRVMgJiYgS1VOSVQKPiArICAgICAgIGRlZmF1bHQgS1VOSVRfQUxMX1RFU1RTCj4gICAgICAg
ICAgaGVscAo+ICAgICAgICAgICAgRW5hYmxlIEtVbml0IHRlc3RzIGZvciB0aGUgbWlzYyBkZXZp
Y2UgZnVuY3Rpb25hbGl0eSBvZiB0aGUgTml0cm8KPiAgICAgICAgICAgIEVuY2xhdmVzLiBTZWxl
Y3QgdGhpcyBvcHRpb24gb25seSBpZiB5b3Ugd2lsbCBib290IHRoZSBrZXJuZWwgZm9yCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdmlydC9uaXRyb19lbmNsYXZlcy9uZV9taXNjX2Rldi5jIGIvZHJp
dmVycy92aXJ0L25pdHJvX2VuY2xhdmVzL25lX21pc2NfZGV2LmMKPiBpbmRleCAyMGM4ODFiNmE0
YjYuLjI0MWI5NGY2MmU1NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZpcnQvbml0cm9fZW5jbGF2
ZXMvbmVfbWlzY19kZXYuYwo+ICsrKyBiL2RyaXZlcnMvdmlydC9uaXRyb19lbmNsYXZlcy9uZV9t
aXNjX2Rldi5jCj4gQEAgLTE3NTksMzUgKzE3NTksMTAgQEAgc3RhdGljIGxvbmcgbmVfaW9jdGwo
c3RydWN0IGZpbGUgKmZpbGUsIHVuc2lnbmVkIGludCBjbWQsIHVuc2lnbmVkIGxvbmcgYXJnKQo+
IAo+ICAgI2lmIGRlZmluZWQoQ09ORklHX05JVFJPX0VOQ0xBVkVTX01JU0NfREVWX1RFU1QpCj4g
ICAjaW5jbHVkZSAibmVfbWlzY19kZXZfdGVzdC5jIgo+IC0KPiAtc3RhdGljIGlubGluZSBpbnQg
bmVfbWlzY19kZXZfdGVzdF9pbml0KHZvaWQpCj4gLXsKPiAtICAgICAgIHJldHVybiBfX2t1bml0
X3Rlc3Rfc3VpdGVzX2luaXQobmVfbWlzY19kZXZfdGVzdF9zdWl0ZXMpOwo+IC19Cj4gLQo+IC1z
dGF0aWMgaW5saW5lIHZvaWQgbmVfbWlzY19kZXZfdGVzdF9leGl0KHZvaWQpCj4gLXsKPiAtICAg
ICAgIF9fa3VuaXRfdGVzdF9zdWl0ZXNfZXhpdChuZV9taXNjX2Rldl90ZXN0X3N1aXRlcyk7Cj4g
LX0KPiAtI2Vsc2UKPiAtc3RhdGljIGlubGluZSBpbnQgbmVfbWlzY19kZXZfdGVzdF9pbml0KHZv
aWQpCj4gLXsKPiAtICAgICAgIHJldHVybiAwOwo+IC19Cj4gLQo+IC1zdGF0aWMgaW5saW5lIHZv
aWQgbmVfbWlzY19kZXZfdGVzdF9leGl0KHZvaWQpCj4gLXsKPiAtfQo+ICAgI2VuZGlmCj4gCj4g
ICBzdGF0aWMgaW50IF9faW5pdCBuZV9pbml0KHZvaWQpCj4gICB7Cj4gLSAgICAgICBpbnQgcmMg
PSAwOwo+IC0KPiAtICAgICAgIHJjID0gbmVfbWlzY19kZXZfdGVzdF9pbml0KCk7Cj4gLSAgICAg
ICBpZiAocmMgPCAwKQo+IC0gICAgICAgICAgICAgICByZXR1cm4gcmM7Cj4gLQo+ICAgICAgICAg
IG11dGV4X2luaXQoJm5lX2NwdV9wb29sLm11dGV4KTsKPiAKPiAgICAgICAgICByZXR1cm4gcGNp
X3JlZ2lzdGVyX2RyaXZlcigmbmVfcGNpX2RyaXZlcik7Cj4gQEAgLTE3OTgsOCArMTc3Myw2IEBA
IHN0YXRpYyB2b2lkIF9fZXhpdCBuZV9leGl0KHZvaWQpCj4gICAgICAgICAgcGNpX3VucmVnaXN0
ZXJfZHJpdmVyKCZuZV9wY2lfZHJpdmVyKTsKPiAKPiAgICAgICAgICBuZV90ZWFyZG93bl9jcHVf
cG9vbCgpOwo+IC0KPiAtICAgICAgIG5lX21pc2NfZGV2X3Rlc3RfZXhpdCgpOwo+ICAgfQo+IAo+
ICAgbW9kdWxlX2luaXQobmVfaW5pdCk7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlydC9uaXRy
b19lbmNsYXZlcy9uZV9taXNjX2Rldl90ZXN0LmMgYi9kcml2ZXJzL3ZpcnQvbml0cm9fZW5jbGF2
ZXMvbmVfbWlzY19kZXZfdGVzdC5jCj4gaW5kZXggMjY1Nzk3YmVkMGVhLi43NGRmNDNiOTI1YmUg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aXJ0L25pdHJvX2VuY2xhdmVzL25lX21pc2NfZGV2X3Rl
c3QuYwo+ICsrKyBiL2RyaXZlcnMvdmlydC9uaXRyb19lbmNsYXZlcy9uZV9taXNjX2Rldl90ZXN0
LmMKPiBAQCAtMTUxLDcgKzE1MSw0IEBAIHN0YXRpYyBzdHJ1Y3Qga3VuaXRfc3VpdGUgbmVfbWlz
Y19kZXZfdGVzdF9zdWl0ZSA9IHsKPiAgICAgICAgICAudGVzdF9jYXNlcyA9IG5lX21pc2NfZGV2
X3Rlc3RfY2FzZXMsCj4gICB9Owo+IAo+IC1zdGF0aWMgc3RydWN0IGt1bml0X3N1aXRlICpuZV9t
aXNjX2Rldl90ZXN0X3N1aXRlc1tdID0gewo+IC0gICAgICAgJm5lX21pc2NfZGV2X3Rlc3Rfc3Vp
dGUsCj4gLSAgICAgICBOVUxMCj4gLX07Cj4gK2t1bml0X3Rlc3Rfc3VpdGUobmVfbWlzY19kZXZf
dGVzdF9zdWl0ZSk7Cj4gLS0KPiAyLjM2LjEuNDc2LmcwYzRkYWEyMDZkLWdvb2cKPiAKCk90aGVy
IHRoYW4gdGhhdCwgbG9va3MgZ29vZCB0byBtZS4KClRoYW5rIHlvdS4KCkFuZHJhCgoKCkFtYXpv
biBEZXZlbG9wbWVudCBDZW50ZXIgKFJvbWFuaWEpIFMuUi5MLiByZWdpc3RlcmVkIG9mZmljZTog
MjdBIFNmLiBMYXphciBTdHJlZXQsIFVCQzUsIGZsb29yIDIsIElhc2ksIElhc2kgQ291bnR5LCA3
MDAwNDUsIFJvbWFuaWEuIFJlZ2lzdGVyZWQgaW4gUm9tYW5pYS4gUmVnaXN0cmF0aW9uIG51bWJl
ciBKMjIvMjYyMS8yMDA1Lgo=

