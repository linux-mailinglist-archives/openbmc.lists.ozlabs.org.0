Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3DF3B322F
	for <lists+openbmc@lfdr.de>; Thu, 24 Jun 2021 17:06:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9k474gXKz3bvP
	for <lists+openbmc@lfdr.de>; Fri, 25 Jun 2021 01:06:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail header.b=xik6nd9T;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=protonmail.com (client-ip=185.70.43.16;
 helo=mail-4316.protonmail.ch; envelope-from=joseiciano@protonmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256
 header.s=protonmail header.b=xik6nd9T; 
 dkim-atps=neutral
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9k3q2rkVz300P
 for <openbmc@lists.ozlabs.org>; Fri, 25 Jun 2021 01:06:11 +1000 (AEST)
Date: Thu, 24 Jun 2021 15:06:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1624547165;
 bh=yNGnU7CRY/dE+3DxKvAYNyyxHPWq4oW7i6lCOpF+AVI=;
 h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
 b=xik6nd9TwuAYU5r8Rt5Yxbs2au9fCsDREXn4c15m5Vpd9eNGHfkxSoiaR7gE1xsZ1
 Ifc1spvyze9KwIClb67NtEzj28oSx6cXMkHEpwngDoUPwkuO9FzeqiUCEHLbjT5NeV
 3S0aCwJAxtts/3y3myAgtIeNVmnmS3isw3eiw1Ac=
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: Jose Iciano <joseiciano@protonmail.com>
Subject: Re: OBMC Internship Project: Per-Build Code Coverage
Message-ID: <o_dCUEI70o2tQZXNT07Ppojp5b31BRfQn-oi9s-qhDKXI0hZRtgHM9HboahJWdrZsdKb1bta8yv4BW8Zczuzv-cxU4omFNpNpRDI4kDxTeM=@protonmail.com>
In-Reply-To: <j0Xsa-QSakVpNHNMmS5t8hcNK4621EqlZCTVLrm3qNVd49IKiXNGb-cXp5lWpco_TNksh3sphW1HNZt2UN2W7DJop2-LQxmthxnAkC9fy1E=@protonmail.com>
References: <j0Xsa-QSakVpNHNMmS5t8hcNK4621EqlZCTVLrm3qNVd49IKiXNGb-cXp5lWpco_TNksh3sphW1HNZt2UN2W7DJop2-LQxmthxnAkC9fy1E=@protonmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1_4lawvLqCQmuxx9f1TTLxbwLPkVt0inbZjgTCUk7YzE"
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
 PDS_OTHER_BAD_TLD shortcircuit=no autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Jose Iciano <joseiciano@protonmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.

--b1_4lawvLqCQmuxx9f1TTLxbwLPkVt0inbZjgTCUk7YzE
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SGVsbG8sCgpGb2xsb3dpbmcgdXAgb24gbXkgcHJldmlvdXMgZW1haWwsIEkgZm9yZ290IHRvIG1l
bnRpb24gdGhhdCBJIGFtIGN1cnJlbnRseSBhbiBpbnRlcm4gZG9pbmcgdGhpcyBhcyBwYXJ0IG9m
IG15IHN1bW1lciBwcm9qZWN0LCB3aXRoIGFuIGVuZCB3ZWVrIG9mIEF1Z3VzdCAzMHRoLiBXaXRo
IHRoaXMgaW4gbWluZCwgSSBkbyBoYXZlIGEgbGltaXRlZCBhbW91bnQgb2YgdGltZSB0byB3b3Jr
IHdpdGgsIHNvIEkgd291bGQgYXBwcmVjaWF0ZSBhbnkgaGVscCBtYWludGFpbmVycyBjYW4gcHJv
dmlkZSB0byBnZXQgY29kZSByZXZpZXdlZCBxdWlja2x5LiBUaGFuayB5b3UuCgpKb3NlIEljaWFu
bwoK4oCQ4oCQ4oCQ4oCQ4oCQ4oCQ4oCQIE9yaWdpbmFsIE1lc3NhZ2Ug4oCQ4oCQ4oCQ4oCQ4oCQ
4oCQ4oCQCk9uIFdlZG5lc2RheSwgSnVuZSAyM3JkLCAyMDIxIGF0IDc6MTEgUE0sIEpvc2UgSWNp
YW5vIDxqb3NlaWNpYW5vQHByb3Rvbm1haWwuY29tPiB3cm90ZToKCj4gSGVsbG8sCj4KPiBNeSBu
YW1lIGlzIEpvc2UgSWNpYW5vIGFuZCBJIGN1cnJlbnRseSB3b3JraW5nIG9uIGFuIGltcGxlbWVu
dGF0aW9uIG9mIHBlci1idWlsZCBjb2RlIGNvdmVyYWdlIGZvciBPQk1DIGFzIHBhcnQgYXMgYW4g
aW50ZXJuc2hpcCBwcm9qZWN0LiBUaGUgZHJhZnQgb2YgdGhlIGN1cnJlbnQgc3lzdGVtJ3MgZGVz
Y3JpcHRpb24gd2lsbCBiZSBhdmFpbGFibGUgYXQgdGhlIGVuZCBvZiB0aGUgZW1haWwuIEN1cnJl
bnRseSwgSSBoYXZlIGJlZW4gYWJsZSB0byBkZXZlbG9wIHRoZSByZXF1aXJlZCBmdW5jdGlvbnMg
YW5kIGFtIGdldHRpbmcgdGhlbSBjaGVja2VkIGJ5IGNvZGUgcmV2aWV3cyBvbiBHZXJyaXQuCj4K
PiBEcmFmdCBvZiB0aGUgQ3VycmVudCBTeXN0ZW06IGh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJv
amVjdC54eXovYy9vcGVuYm1jL2RvY3MvKy80NDQwOS8xL2NvZGUtY292ZXJhZ2UubWQKPgo+IE1h
Y2hpbmUgUGVyLUJ1aWxkIENvZGUgQ292ZXJhZ2UKPgo+IFRoZSBmb2xsb3dpbmcgcmVwb3J0IGRl
dGFpbHMgdGhlIGNvZGUgY292ZXJhZ2Ugc3lzdGVtIGltcGxlbWVudGVkIGZvciBPcGVuQk1DIGJ1
aWxkcy4KPgo+IE9wZW5CTUMgY3VycmVudGx5IHJlbGllcyBvbiBhIG1hbnVhbCBzeXN0ZW0gZm9y
IGRldGFpbGluZyBjb2RlIGNvdmVyYWdlIG9mIGFueSByZXBvc2l0b3JpZXMgdXNlZCBmb3IgaW1h
Z2UgYnVpbGRpbmcuIFdpdGggZWFjaCBtYWNoaW5lLCB0aGVyZSBpcyBhIHJlcG8gY29tYmluYXRp
b24gdW5pcXVlIHRvIGl0LiBUaGlzIG1lYW5zIHRoYXQgY3VycmVudGx5LCBpZiBvbmUgd2FudHMg
dG8gdmlldyB0aGUgc3RhdHVzIGFuZCBjaGFuZ2VzIG9mIHRob3NlIHJlcG9zaXRvcmllcywgdGhl
eSB3b3VsZCBoYXZlIHRvIG1hbnVhbGx5IGNsb25lIGl0IGFuZCBydW4gdW5pdCB0ZXN0cyBvbiB0
aGUgY29ycmVjdCB2ZXJzaW9uLiBUaGlzIHN5c3RlbSBhdXRvbWF0ZXMgdGhlIHByb2Nlc3MgYW5k
IGFsbG93cyB0aGUgYWdncmVnYXRpb24gb2YgY29kZSBjb3ZlcmFnZSBmb3IgdGhlIHNlbGVjdGVk
IGJ1aWxkLgo+Cj4gVGhpcyBwcm9jZXNzIGlzIGRvbmUgdGhyb3VnaCBhIG1vZGlmaWVkIHZlcnNp
b24gb2YgT0JNQ+KAmXMgYGdldF91bml0X3Rlc3RfcmVwb3J0LnB5YCBzY3JpcHQsIGFkZGluZyBw
ZXItYnVpbGQgY2FwYWJpbGl0aWVzIGFuZCBpbXByb3ZpbmcgbGNvdiBkYXRhIGdlbmVyYXRpb24u
Cj4KPiBSdW5uaW5nIEZpbGVzCj4KPiBTdGFydCBieSBjcmVhdGluZyBhIHJlcG9zaXRvcnkgZm9y
IENJIGFuZCBDSSBzY3JpcHRzIHRvIGJlIHN0b3JlZC4KPgo+IGBgYAo+IG1rZGlyIGNpX3Rlc3Rf
YXJlYQo+IGNkIGNpX3Rlc3RfYXJlYQo+IGdpdCBjbG9uZSBbaHR0cHM6Ly9naXRodWIuY29tL29w
ZW5ibWMvb3BlbmJtYy1idWlsZC1zY3JpcHRzLmdpdF0oaHR0cHM6Ly9naXRodWIuY29tL29wZW5i
bWMvb3BlbmJtYy1idWlsZC1zY3JpcHRzLmdpdCkKPiBgYGAKPgo+IFRvIHJ1biB3aXRoIHNwZWNp
ZmllZCAsIGltYWdlIGNvbmZpZyBmaWxlcyBoYXZlIHRvIGJlIG1vZGlmaWVkIHRvIGluaGVyaXQg
dGhlIG5ldyBmaWxlLgo+IGBgYAo+ICR7QlVJTERESVJ9L2NvbmYvbG9jYWwuY29uZgo+IGBgYAo+
Cj4gQWRkCj4gYGBgCj4gSU5IRVJJVCArPSDigJxidWlsZGhpc3RvcnnigJ0KPiBCVUlMREhJU1RP
UllfQ09NTUlUID0g4oCcMeKAnQo+IGBgYAo+Cj4gUnVuIHRoZSBmb2xsb3dpbmcgY29tbWFuZCB0
byBydW4gd2l0aG91dCBhIHNwZWNpZmllZCB1cmxfZmlsZSBvciBidWlsZGhpc3RvcnkgcGF0aC4K
Pgo+IGBgYAo+IHB5dGhvbjMgb3BlbmJtYy1idWlsZC1zY3JpcHRzL3NjcmlwdHMvZ2V0X3VuaXRf
dGVzdF9yZXBvcnQgPHRhcmdldF9kaXI+Cj4gYGBgCj4KPiBSdW5uaW5nIHdpdGggYSBidWlsZGhp
c3RvcnkgcGF0aAo+Cj4gYGBgCj4gcHl0aG9uMyBvcGVuYm1jLWJ1aWxkLXNjcmlwdHMvc2NyaXB0
cy9nZXRfdW5pdF90ZXN0X3JlcG9ydCA8dGFyZ2V0X2Rpcj4gLWJ1aWxkX2hpc3RvcnkgPGJ1aWxk
X2hpc3RvcnlfcGF0aD4KPiBgYGAKPgo+IFNvdXJjZSBGaWxlIGFuZCBSZXZpc2lvbiBHZW5lcmF0
aW9uCj4KPiBUaGUgZmlsZSBgY29kZV9jb3ZlcmFnZS5zaGAgZ2VuZXJhdGVzIGEgcmVwb3NpdG9y
aWVzLnR4dCBmaWxlLCB3aGljaCBzdG9yZXMgdGhlIHNyY191cmwgYW5kIHNyY19yZXYgb2YgcmVw
b3NpdG9yaWVzIHVzZWQgZHVyaW5nIGltYWdlIGNyZWF0aW9uLiBUaGUgZm9ybWF0IGlzIHN0b3Jl
ZCBpbiB0aGUgZm9sbG93aW5nIGZvcm1hdDoKPgo+IGBgYAo+IDxzcmNfdXJsPiA8c3JjX3Jldj4K
PiBgYGAKPgo+IFRoZSByZXN1bHRpbmcgZmlsZSBpcyBpbnRlbmRlZCB0byBiZSB1c2VkIGZvciBh
bnkgYXV0b21hdGVkIHRlc3Qgc3VpdGUgcnVubmVyLCBzdWNoIGFzIE9CTUPigJlzIGBnZXRfdW5p
dF90ZXN0X3JlcG9ydC5weWDigJlzIHVybF9maWxlIHBhcmFtZXRlci4KPgo+IEF1dG9tYXRlZCBU
ZXN0IENhc2VzCj4KPiBUZXN0IGNhc2UgaXMgYXV0b21hdGVkIHRocm91Z2ggdGhlIHVzZSBvZiBg
Z2V0X3VuaXRfdGVzdF9yZXBvcnQucHlgLCB3aGljaCB0YWtlcyBjYXJlIG9mIGNsb25pbmcgdGhl
IHNwZWNpZmljIHJlcG9zaXRvcmllcyBhbmQgcnVubmluZyB1bml0IHRlc3RzIG9uIGl0LiBUaGlz
IGZpbGUgd2FzIHByZS1leGlzdGluZyBpbiB0aGUgY29kZWJhc2UsIGJ1dCB3YXMgc2xpZ2h0bHkg
bW9kaWZpZWQgdG8gd29yayB3aXRoIHRoZSBuZXcgZmlsZXMsIGFzIHdlbGwgYXMgaW1wbGVtZW50
aW5nIG9wdGlvbmFsIHNvdXJjZSByZXZpc2lvbi4KPgo+IE9wdGlvbmFsIHBhcmFtZXRlcnMgd2Vy
ZSBtb2RpZmllZCB0byBhbGxvdyBmb3IgbW9yZSB2YXJpYWJsZXMuIFRoZSBleHRyYSBwYXJhbWV0
ZXJzIGFkZGVkIHdlcmUKPgo+IGBgYAo+IC1idWlsZF9oaXN0b3J5IC0gUGF0aCB0byBidWlsZGhp
c3RvcnkgdGhhdCB3YXMgY3JlYXRlZCBkdXJpbmcgaW1hZ2UgZ2VuZXJhdGlvbi4KPiBgYGAKPgo+
IExDT1YgQWdncmVnYXRpb24KPgo+IExDT1YgZGF0YSBpcyBmcmVlbHkgYXZhaWxhYmxlIGFmdGVy
IHJ1bm5pbmcgdGhlIGBnZXRfdW5pdF90ZXN0X3JlcG9ydC5weWAgc2NyaXB0LiBgY29kZV9jb3Zl
cmFnZS5weWAgd29ya3MgYnkgdGFraW5nIGFsbCB0aGUgYXZhaWxhYmxlIGRhdGEgYW5kIGFnZ3Jl
Z2F0aW5nIGl0IGludG8gYW4gZWFzeSB0byBhY2Nlc3MgZmlsZS4gVGhpcyBzaW1wbGlmaWVzIHRo
ZSBwcm9jZXNzIG9mIGxjb3YgYW5hbHlzaXMsIGFzIHRoZSBuZWNlc3NhcnkgZGF0YS9maWxlcyBj
YW4gYmUgZm91bmQgZnJvbSBvbmUgc2ltcGxpZmllZCBmaWxlLgo+Cj4gQ29kZV9jb3ZlcmFnZS5w
eSB3b3JrcyBieSB0YWtpbmcgaW4gdGhlIHBhdGggb2YgZGlyZWN0b3JpZXMgbGVhZGluZyB0byBg
PHJlcG8+L2J1aWxkLzxjb3ZlcmFnZXJlcG9ydF9wYXRoPi9pbmRleC5odG1sLmAgSXQgc2lmdHMg
dGhyb3VnaCBlYWNoIGZpbGUgYW5kIHJlYWRzIHRoZSByZXN1bHRpbmcgbGNvdiBkYXRhIGZyb20g
dGhlIGluZGV4Lmh0bWwgZmlsZS4=

--b1_4lawvLqCQmuxx9f1TTLxbwLPkVt0inbZjgTCUk7YzE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGRpdj48ZGl2PjxkaXY+PGRpdj5IZWxsbyw8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48
ZGl2PkZvbGxvd2luZyB1cCBvbiBteSBwcmV2aW91cyBlbWFpbCwgSSBmb3Jnb3QgdG8gbWVudGlv
biB0aGF0IEkgYW0gY3VycmVudGx5IGFuIGludGVybiBkb2luZyB0aGlzIGFzIHBhcnQgb2YgbXkg
c3VtbWVyIHByb2plY3QsIHdpdGggYW4gZW5kIHdlZWsgb2YgQXVndXN0IDMwdGguIFdpdGggdGhp
cyBpbiBtaW5kLCBJIGRvIGhhdmUgYSBsaW1pdGVkIGFtb3VudCBvZiB0aW1lIHRvIHdvcmsgd2l0
aCwgc28gSSB3b3VsZCBhcHByZWNpYXRlIGFueSBoZWxwIG1haW50YWluZXJzIGNhbiBwcm92aWRl
IHRvIGdldCBjb2RlIHJldmlld2VkIHF1aWNrbHkuIFRoYW5rIHlvdS4mbmJzcDs8YnI+PC9kaXY+
PGRpdj48YnI+PC9kaXY+PGRpdj5Kb3NlIEljaWFubzxicj48L2Rpdj48L2Rpdj48L2Rpdj48ZGl2
Pjxicj48L2Rpdj48L2Rpdj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2
IGNsYXNzPSJwcm90b25tYWlsX3F1b3RlIj4NCiAgICAgICAg4oCQ4oCQ4oCQ4oCQ4oCQ4oCQ4oCQ
IE9yaWdpbmFsIE1lc3NhZ2Ug4oCQ4oCQ4oCQ4oCQ4oCQ4oCQ4oCQPGJyPg0KICAgICAgICBPbiBX
ZWRuZXNkYXksIEp1bmUgMjNyZCwgMjAyMSBhdCA3OjExIFBNLCBKb3NlIEljaWFubyAmbHQ7am9z
ZWljaWFub0Bwcm90b25tYWlsLmNvbSZndDsgd3JvdGU6PGJyPg0KICAgICAgICA8YmxvY2txdW90
ZSBjbGFzcz0icHJvdG9ubWFpbF9xdW90ZSIgdHlwZT0iY2l0ZSI+DQogICAgICAgICAgICA8ZGl2
PkhlbGxvLDxicj48YnI+TXkgbmFtZSBpcyBKb3NlIEljaWFubyBhbmQgSSBjdXJyZW50bHkgd29y
a2luZyBvbiBhbiBpbXBsZW1lbnRhdGlvbiBvZiBwZXItYnVpbGQgY29kZSBjb3ZlcmFnZSBmb3Ig
T0JNQyBhcyBwYXJ0IGFzIGFuIGludGVybnNoaXAgcHJvamVjdC4gVGhlIGRyYWZ0IG9mIHRoZSBj
dXJyZW50IHN5c3RlbSdzIGRlc2NyaXB0aW9uIHdpbGwgYmUgYXZhaWxhYmxlIGF0IHRoZSBlbmQg
b2YgdGhlIGVtYWlsLiBDdXJyZW50bHksIEkgaGF2ZSBiZWVuIGFibGUgdG8gZGV2ZWxvcCB0aGUg
cmVxdWlyZWQgZnVuY3Rpb25zIGFuZCBhbSBnZXR0aW5nIHRoZW0gY2hlY2tlZCBieSBjb2RlIHJl
dmlld3Mgb24gR2Vycml0LiZuYnNwOzxicj48Yj48YnI+RHJhZnQgb2YgdGhlIEN1cnJlbnQgU3lz
dGVtOiZuYnNwOzwvYj48YSBocmVmPSJodHRwczovL2dlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6
L2Mvb3BlbmJtYy9kb2NzLysvNDQ0MDkvMS9jb2RlLWNvdmVyYWdlLm1kIiB0YXJnZXQ9Il9ibGFu
ayIgcmVsPSJub3JlZmVycmVyIG5vZm9sbG93IG5vb3BlbmVyIj5odHRwczovL2dlcnJpdC5vcGVu
Ym1jLXByb2plY3QueHl6L2Mvb3BlbmJtYy9kb2NzLysvNDQ0MDkvMS9jb2RlLWNvdmVyYWdlLm1k
PC9hPjxicj48Yj48YnI+TWFjaGluZSBQZXItQnVpbGQgQ29kZSBDb3ZlcmFnZTwvYj48L2Rpdj48
ZGl2Pjxicj48L2Rpdj48ZGl2PlRoZSBmb2xsb3dpbmcgcmVwb3J0IGRldGFpbHMgdGhlIGNvZGUg
Y292ZXJhZ2Ugc3lzdGVtIGltcGxlbWVudGVkIGZvciBPcGVuQk1DIGJ1aWxkcy48YnI+PC9kaXY+
PGRpdj48YnI+PC9kaXY+PGRpdj5PcGVuQk1DIGN1cnJlbnRseSByZWxpZXMgb24gYSBtYW51YWwg
c3lzdGVtIGZvciBkZXRhaWxpbmcgY29kZSBjb3ZlcmFnZSBvZiBhbnkgcmVwb3NpdG9yaWVzIHVz
ZWQgZm9yIGltYWdlIGJ1aWxkaW5nLiBXaXRoIGVhY2ggbWFjaGluZSwgdGhlcmUgaXMgYSByZXBv
IGNvbWJpbmF0aW9uIHVuaXF1ZSB0byBpdC4gVGhpcyBtZWFucyB0aGF0IGN1cnJlbnRseSwgaWYg
b25lIHdhbnRzIHRvIHZpZXcgdGhlIHN0YXR1cyBhbmQgY2hhbmdlcyBvZiB0aG9zZSByZXBvc2l0
b3JpZXMsIHRoZXkgd291bGQgaGF2ZSB0byBtYW51YWxseSBjbG9uZSBpdCBhbmQgcnVuIHVuaXQg
dGVzdHMgb24gdGhlIGNvcnJlY3QgdmVyc2lvbi4gVGhpcyBzeXN0ZW0gYXV0b21hdGVzIHRoZSBw
cm9jZXNzIGFuZCBhbGxvd3MgdGhlIGFnZ3JlZ2F0aW9uIG9mIGNvZGUgY292ZXJhZ2UgZm9yIHRo
ZSBzZWxlY3RlZCBidWlsZC48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGlzIHByb2Nl
c3MgaXMgZG9uZSB0aHJvdWdoIGEgbW9kaWZpZWQgdmVyc2lvbiBvZiBPQk1D4oCZcyBgZ2V0X3Vu
aXRfdGVzdF9yZXBvcnQucHlgIHNjcmlwdCwgYWRkaW5nIHBlci1idWlsZCBjYXBhYmlsaXRpZXMg
YW5kIGltcHJvdmluZyBsY292IGRhdGEgZ2VuZXJhdGlvbi48YnI+PC9kaXY+PGRpdj48YnI+PC9k
aXY+PGRpdj48Yj5SdW5uaW5nIEZpbGVzPC9iPjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2
PlN0YXJ0IGJ5IGNyZWF0aW5nIGEgcmVwb3NpdG9yeSBmb3IgQ0kgYW5kIENJIHNjcmlwdHMgdG8g
YmUgc3RvcmVkLjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PmBgYDxicj48L2Rpdj48ZGl2
Pm1rZGlyIGNpX3Rlc3RfYXJlYTxicj48L2Rpdj48ZGl2PmNkIGNpX3Rlc3RfYXJlYTxicj48L2Rp
dj48ZGl2PmdpdCBjbG9uZSBbPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvb3Bl
bmJtYy1idWlsZC1zY3JpcHRzLmdpdF0oaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvb3BlbmJt
Yy1idWlsZC1zY3JpcHRzLmdpdCkiIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vcmVmZXJyZXIgbm9m
b2xsb3cgbm9vcGVuZXIiPmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL29wZW5ibWMtYnVpbGQt
c2NyaXB0cy5naXRdKGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL29wZW5ibWMtYnVpbGQtc2Ny
aXB0cy5naXQpPC9hPjxicj48L2Rpdj48ZGl2PmBgYDxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48
ZGl2PlRvIHJ1biB3aXRoIHNwZWNpZmllZCAsIGltYWdlIGNvbmZpZyBmaWxlcyBoYXZlIHRvIGJl
IG1vZGlmaWVkIHRvIGluaGVyaXQgdGhlIG5ldyBmaWxlLjxicj48L2Rpdj48ZGl2PmBgYDxicj48
L2Rpdj48ZGl2PiR7QlVJTERESVJ9L2NvbmYvbG9jYWwuY29uZjxicj48L2Rpdj48ZGl2PmBgYDxi
cj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkFkZDxicj48L2Rpdj48ZGl2PmBgYDxicj48L2Rp
dj48ZGl2PklOSEVSSVQgKz0g4oCcYnVpbGRoaXN0b3J54oCdPGJyPjwvZGl2PjxkaXY+QlVJTERI
SVNUT1JZX0NPTU1JVCA9IOKAnDHigJ08YnI+PC9kaXY+PGRpdj5gYGA8YnI+PC9kaXY+PGRpdj48
YnI+PC9kaXY+PGRpdj5SdW4gdGhlIGZvbGxvd2luZyBjb21tYW5kIHRvIHJ1biB3aXRob3V0IGEg
c3BlY2lmaWVkIHVybF9maWxlIG9yIGJ1aWxkaGlzdG9yeSBwYXRoLjxicj48L2Rpdj48ZGl2Pjxi
cj48L2Rpdj48ZGl2PmBgYDxicj48L2Rpdj48ZGl2PnB5dGhvbjMgb3BlbmJtYy1idWlsZC1zY3Jp
cHRzL3NjcmlwdHMvZ2V0X3VuaXRfdGVzdF9yZXBvcnQgJmx0O3RhcmdldF9kaXImZ3Q7PGJyPjwv
ZGl2PjxkaXY+YGBgPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+UnVubmluZyB3aXRoIGEg
YnVpbGRoaXN0b3J5IHBhdGg8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5gYGA8YnI+PC9k
aXY+PGRpdj5weXRob24zIG9wZW5ibWMtYnVpbGQtc2NyaXB0cy9zY3JpcHRzL2dldF91bml0X3Rl
c3RfcmVwb3J0ICZsdDt0YXJnZXRfZGlyJmd0OyAtYnVpbGRfaGlzdG9yeSAmbHQ7YnVpbGRfaGlz
dG9yeV9wYXRoJmd0Ozxicj48L2Rpdj48ZGl2PmBgYDxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48
ZGl2PjxiPlNvdXJjZSBGaWxlIGFuZCBSZXZpc2lvbiBHZW5lcmF0aW9uPC9iPjxicj48L2Rpdj48
ZGl2Pjxicj48L2Rpdj48ZGl2PlRoZSBmaWxlIGBjb2RlX2NvdmVyYWdlLnNoYCBnZW5lcmF0ZXMg
YSByZXBvc2l0b3JpZXMudHh0IGZpbGUsIHdoaWNoIHN0b3JlcyB0aGUgc3JjX3VybCBhbmQgc3Jj
X3JldiBvZiByZXBvc2l0b3JpZXMgdXNlZCBkdXJpbmcgaW1hZ2UgY3JlYXRpb24uIFRoZSBmb3Jt
YXQgaXMgc3RvcmVkIGluIHRoZSBmb2xsb3dpbmcgZm9ybWF0Ojxicj48L2Rpdj48ZGl2Pjxicj48
L2Rpdj48ZGl2PmBgYDxicj48L2Rpdj48ZGl2PiZsdDtzcmNfdXJsJmd0OyAmbHQ7c3JjX3JldiZn
dDs8YnI+PC9kaXY+PGRpdj5gYGA8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGUgcmVz
dWx0aW5nIGZpbGUgaXMgaW50ZW5kZWQgdG8gYmUgdXNlZCBmb3IgYW55IGF1dG9tYXRlZCB0ZXN0
IHN1aXRlIHJ1bm5lciwgc3VjaCBhcyBPQk1D4oCZcyBgZ2V0X3VuaXRfdGVzdF9yZXBvcnQucHlg
4oCZcyB1cmxfZmlsZSBwYXJhbWV0ZXIuPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PGI+
QXV0b21hdGVkIFRlc3QgQ2FzZXM8L2I+PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+VGVz
dCBjYXNlIGlzIGF1dG9tYXRlZCB0aHJvdWdoIHRoZSB1c2Ugb2YgYGdldF91bml0X3Rlc3RfcmVw
b3J0LnB5YCwgd2hpY2ggdGFrZXMgY2FyZSBvZiBjbG9uaW5nIHRoZSBzcGVjaWZpYyByZXBvc2l0
b3JpZXMgYW5kIHJ1bm5pbmcgdW5pdCB0ZXN0cyBvbiBpdC4gVGhpcyBmaWxlIHdhcyBwcmUtZXhp
c3RpbmcgaW4gdGhlIGNvZGViYXNlLCBidXQgd2FzIHNsaWdodGx5IG1vZGlmaWVkIHRvIHdvcmsg
d2l0aCB0aGUgbmV3IGZpbGVzLCBhcyB3ZWxsIGFzIGltcGxlbWVudGluZyBvcHRpb25hbCBzb3Vy
Y2UgcmV2aXNpb24uPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+T3B0aW9uYWwgcGFyYW1l
dGVycyB3ZXJlIG1vZGlmaWVkIHRvIGFsbG93IGZvciBtb3JlIHZhcmlhYmxlcy4gVGhlIGV4dHJh
IHBhcmFtZXRlcnMgYWRkZWQgd2VyZTxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PmBgYDxi
cj48L2Rpdj48ZGl2Pi1idWlsZF9oaXN0b3J5IC0gUGF0aCB0byBidWlsZGhpc3RvcnkgdGhhdCB3
YXMgY3JlYXRlZCBkdXJpbmcgaW1hZ2UgZ2VuZXJhdGlvbi48YnI+PC9kaXY+PGRpdj5gYGA8YnI+
PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48Yj5MQ09WIEFnZ3JlZ2F0aW9uPC9iPjxicj48L2Rp
dj48ZGl2Pjxicj48L2Rpdj48ZGl2PkxDT1YgZGF0YSBpcyBmcmVlbHkgYXZhaWxhYmxlIGFmdGVy
IHJ1bm5pbmcgdGhlIGBnZXRfdW5pdF90ZXN0X3JlcG9ydC5weWAgc2NyaXB0LiBgY29kZV9jb3Zl
cmFnZS5weWAgd29ya3MgYnkgdGFraW5nIGFsbCB0aGUgYXZhaWxhYmxlIGRhdGEgYW5kIGFnZ3Jl
Z2F0aW5nIGl0IGludG8gYW4gZWFzeSB0byBhY2Nlc3MgZmlsZS4gVGhpcyBzaW1wbGlmaWVzIHRo
ZSBwcm9jZXNzIG9mIGxjb3YgYW5hbHlzaXMsIGFzIHRoZSBuZWNlc3NhcnkgZGF0YS9maWxlcyBj
YW4gYmUgZm91bmQgZnJvbSBvbmUgc2ltcGxpZmllZCBmaWxlLjxicj48L2Rpdj48ZGl2Pjxicj48
L2Rpdj48ZGl2PkNvZGVfY292ZXJhZ2UucHkgd29ya3MgYnkgdGFraW5nIGluIHRoZSBwYXRoIG9m
IGRpcmVjdG9yaWVzIGxlYWRpbmcgdG8gYCZsdDtyZXBvJmd0Oy9idWlsZC8mbHQ7Y292ZXJhZ2Vy
ZXBvcnRfcGF0aCZndDsvaW5kZXguaHRtbC5gIEl0IHNpZnRzIHRocm91Z2ggZWFjaCBmaWxlIGFu
ZCByZWFkcyB0aGUgcmVzdWx0aW5nIGxjb3YgZGF0YSBmcm9tIHRoZSBpbmRleC5odG1sIGZpbGUu
PGJyPjwvZGl2Pg0KICAgICAgICA8L2Jsb2NrcXVvdGU+PGJyPg0KICAgIDwvZGl2Pg==


--b1_4lawvLqCQmuxx9f1TTLxbwLPkVt0inbZjgTCUk7YzE--

