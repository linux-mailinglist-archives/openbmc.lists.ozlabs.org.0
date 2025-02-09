Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D48A2DA94
	for <lists+openbmc@lfdr.de>; Sun,  9 Feb 2025 04:31:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YrCtM0lYWz3cVk
	for <lists+openbmc@lfdr.de>; Sun,  9 Feb 2025 14:31:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=43.251.60.7
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739071896;
	cv=none; b=a1T5uFTMraW4PaGiFlliEM6xjhA05XHqGfsViGp/02h+Dxxpd90xSyuRLj+ONDrkRrO50K9owtYSpcs+Fz09VnGXakW6luU+YVZem3sQQ4e5v8cP2hVn1po6tL/QLIhlzSdI+LgYLowhA6VI4mOTz8NR/55EiYndEK5k4rOPmjO+7nANowGvhICNcVbVMYSXKHHwwBnGpbrdUfgHZcJz9FxEGT3KbhO2+gyBNFee2JYP38xMuuZV4kJDe79kIyBHKn7926uFj60ftKX++6ZIUbLBKIPfVqf+JHAtuGI2BKrL8b9iRr2e8JACwnSotjQcfD021hyY0DsHKtiZJREE0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739071896; c=relaxed/relaxed;
	bh=T47Fu9vGjhTGInyq/kFMjIGvLjWV7QWwcDImR8hoT6g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=E0EJNpIKD5il2iF4QiZKYwBDrC3Z8OQVa8AEc4pDE4Svlvsa140m9SufVLfO4p26tI5ZFShZLUMSTO//vL9btSk8ArY9qPJwbvZawxj9huW+dX8kQJfGuZwYzZaszkXVf9tYGU8TIw2t0SUHdnNNNE7u9VB38JVHq6sZ159mBvSyb8G67ytqw5inZe4Qd/4+WGmCwcRJGZckiATRALmL5qxTFWofpYF2oh8OvaTPA18ygNSRdxvHWxp9aSBKRbJD7JVqX156Dr0YL08lQWeqkKjIa2FnU5HBb3I305OsubPPpirMO7rWdGbbVqJd8S5JIaKj2bWncFbMLqkar6SOCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=asrockrack.com; dkim=pass (2048-bit key; unprotected) header.d=asrockrack.com header.i=@asrockrack.com header.a=rsa-sha256 header.s=asrockrack header.b=mDOw2NuF; dkim-atps=neutral; spf=pass (client-ip=43.251.60.7; helo=ms.pegatroncorp.com; envelope-from=prvs=12852f0ed=jeff9_chan@asrockrack.com; receiver=lists.ozlabs.org) smtp.mailfrom=asrockrack.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=asrockrack.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=asrockrack.com header.i=@asrockrack.com header.a=rsa-sha256 header.s=asrockrack header.b=mDOw2NuF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=asrockrack.com (client-ip=43.251.60.7; helo=ms.pegatroncorp.com; envelope-from=prvs=12852f0ed=jeff9_chan@asrockrack.com; receiver=lists.ozlabs.org)
Received: from ms.pegatroncorp.com (ms5.pegatroncorp.com [43.251.60.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YrCtG3thpz2xrv
	for <openbmc@lists.ozlabs.org>; Sun,  9 Feb 2025 14:31:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=asrockrack.com; i=@asrockrack.com; q=dns/txt;
  s=asrockrack; t=1739071895; x=1770607895;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=T47Fu9vGjhTGInyq/kFMjIGvLjWV7QWwcDImR8hoT6g=;
  b=mDOw2NuFByShB1iPw0r0ulHPiJpByORnEtIPy/eWIsZbeIAnhM46g2Uk
   H28U/o9S3kDOV/tRTGjMalcB+fbCImPiTGt7JiN8UtaaP9Nq9kqjocXQC
   95OMGBXGBVpPvVtHBs3pYMaD3p31xCCqdxKOV1dh2SAGz7K2EbVXR/3df
   dijEalVeIC7YUXgwAadiaega1+nC6rXhqqMGy8EkXZLz6aHIEhrjcXMvR
   jHhlYE05caGrcT+2MLf3K/j8tp10UYboGadLwxN1cEmaA1/XyDp/6rbYe
   nxSEL8KyQNiJFARpn58kVJp9MR41Uc/2ZZNNebsgQg+6l5qek7l++2084
   Q==;
Authentication-Results: ms.pegatroncorp.com; spf=SoftFail smtp.mailfrom=Jeff9_Chan@asrockrack.com; spf=None smtp.helo=postmaster@PTW-MSE-DB02.pegatroncorp.com
Received-SPF: SoftFail (ms.pegatroncorp.com: domain of
  Jeff9_Chan@asrockrack.com is inclined to not designate
  172.18.192.77 as permitted sender) identity=mailfrom;
  client-ip=172.18.192.77; receiver=ms.pegatroncorp.com;
  envelope-from="Jeff9_Chan@asrockrack.com";
  x-sender="Jeff9_Chan@asrockrack.com"; x-conformance=spf_only;
  x-record-type="v=spf1"; x-record-text="v=spf1
  include:sendersrv.com ip4:58.240.231.120/30 ip4:124.9.5.0/26
  ip4:43.251.60.0/22 ip4:192.72.126.0/24 ip4:58.211.157.0/30
  ip4:221.224.25.136/30 ip4:210.80.80.195 ~all"
Received-SPF: None (ms.pegatroncorp.com: no sender authenticity
  information available from domain of
  postmaster@PTW-MSE-DB02.pegatroncorp.com) identity=helo;
  client-ip=172.18.192.77; receiver=ms.pegatroncorp.com;
  envelope-from="Jeff9_Chan@asrockrack.com";
  x-sender="postmaster@PTW-MSE-DB02.pegatroncorp.com";
  x-conformance=spf_only
Received: from unknown (HELO PTW-MSE-DB02.pegatroncorp.com) ([172.18.192.77])
  by ms.pegatroncorp.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 11:31:29 +0800
Received: from ASR-EX-MBSC02.asrock.corpnet (ASR-EX-MBSC02.asrock.corpnet [172.18.50.39])
	by PTW-MSE-DB02.pegatroncorp.com with ESMTP id 5193VPLN079997;
	Sun, 9 Feb 2025 11:31:25 +0800 (+08)
	(envelope-from Jeff9_Chan@asrockrack.com)
Received: from ASR-EX-MBS01.asrock.corpnet (172.18.50.33) by
 ASR-EX-MBSC02.asrock.corpnet (172.18.50.39) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 9 Feb 2025 11:31:25 +0800
Received: from ASR-EX-MBS02.asrock.corpnet (172.18.50.35) by
 ASR-EX-MBS01.asrock.corpnet (172.18.50.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 9 Feb 2025 11:31:24 +0800
Received: from ASR-EX-MBS02.asrock.corpnet ([fe80::c978:ac77:f37f:d797]) by
 ASR-EX-MBS02.asrock.corpnet ([fe80::c978:ac77:f37f:d797%5]) with mapi id
 15.01.2507.039; Sun, 9 Feb 2025 11:31:24 +0800
From: =?utf-8?B?SmVmZjkgQ2hhbijpmbPmnb7lhIlfQVNSb2NrUmFjayk=?=
	<Jeff9_Chan@asrockrack.com>
To: "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
        Jian Zhang
	<zhangjian.3032@bytedance.com>
Subject: RE: [External] dbus-sensors issue
Thread-Topic: [External] dbus-sensors issue
Thread-Index: Adt5VBwWzy8o0Jc4R0iQgqnjFEvZaP//f8AAgABWhoD//TiXkA==
Date: Sun, 9 Feb 2025 03:31:24 +0000
Message-ID: <29b757bc5c2a4d8998aca9d40fe65b40@asrockrack.com>
References: <3e85a9834ada4944a629c50cd6389630@asrockrack.com>
 <51dd8bf76aa056fbc966e48132cac2607d2326ca.a3a848b5.1084.42df.ae2f.330bbfd1cd95@bytedance.com>
 <Z6Y9CSIl8PhvV8KZ@heinlein>
In-Reply-To: <Z6Y9CSIl8PhvV8KZ@heinlein>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.194.46.159]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: PTW-MSE-DB02.pegatroncorp.com 5193VPLN079997
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

VGhhbmtzIGEgbG90IQ0KDQpiZXN0IHJlZ2FyZHMNCg0KSmVmZiBDaGFuDQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBwYXRyaWNrQHN0d2N4Lnh5eiA8cGF0cmlja0BzdHdjeC54
eXo+IA0KU2VudDogU2F0dXJkYXksIEZlYnJ1YXJ5IDgsIDIwMjUgMTowNCBBTQ0KVG86IEppYW4g
WmhhbmcgPHpoYW5namlhbi4zMDMyQGJ5dGVkYW5jZS5jb20+DQpDYzogSmVmZjkgQ2hhbijpmbPm
nb7lhIlfQVNSb2NrUmFjaykgPEplZmY5X0NoYW5AYXNyb2NrcmFjay5jb20+OyBvcGVuYm1jQGxp
c3RzLm96bGFicy5vcmcNClN1YmplY3Q6IFJlOiBbRXh0ZXJuYWxdIGRidXMtc2Vuc29ycyBpc3N1
ZQ0KDQpPbiBGcmksIEZlYiAwNywgMjAyNSBhdCAwNzo1NDoyOFBNICswODAwLCBKaWFuIFpoYW5n
IHdyb3RlOg0KPiBTZWU6DQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMzA3MTYx
OTUwMDcuNzMxOTA5NjcwQGxpbnV4Zm91bmRhdGlvbi4NCj4gb3JnLw0KPiBodHRwczovL2J1Z3pp
bGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIxNzY5OQ0KPiBGb3Igc2VydmljZXMgdXRp
bGl6aW5nIGlvX3VyaW5nLCB3aGVuIHdhaXRpbmcgZm9yIEkvTywgQ1BVIHRpbWUgaXMgY291bnRl
ZCBhcyBJL08gcmF0aGVyIHRoYW4gaWRsZSB0aW1lLg0KDQpZZXAuICBTbyB0byBiZSBjbGVhciwg
dGhpcyBpcyBqdXN0IGFuIGFjY291bnRpbmcgZGlmZmVyZW5jZS4gIEl0IGhhcyBubyByZWFsIG1l
YXN1cmVtZW50IG9mIGEgcGVyZm9ybWFuY2UgZGlmZmVyZW5jZS4gICJpb193YWl0IiBpcyBlZmZl
Y3RpdmVseSAiaWRsZSIgbm93Lg0KDQpGb3Igc2ltaWxhciByZWFzb25zLCBwaG9zcGhvci1oZWFs
dGgtbW9uaXRvciBkb2Vzbid0IGNvbnNpZGVyICdpb3dhaXQnDQpwYXJ0IG9mIHRoZSBDUFUgdXRp
bGl6YXRpb24gZm9yIGRldGVybWluaW5nIGlmIHRoZSBDUFUgaGFzIGJlZW4gdG9vIGJ1c3kgZm9y
IHRvbyBsb25nOg0KDQpodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9waG9zcGhvci1oZWFsdGgt
bW9uaXRvci9ibG9iL2JhMjlkYmRkMDRhOTZhNDZlMTk3MjY0MWMyMGJmNWE4ZTkzMGVkOGYvaGVh
bHRoX21ldHJpY19jb2xsZWN0aW9uLmNwcCNMNzMNCg0KPiANCj4gSmlhbi4NCj4gPiBGcm9tOiAi
SmVmZjkgQ2hhbijpmbPmnb7lhIlfQVNSb2NrUmFjaykiPEplZmY5X0NoYW5AYXNyb2NrcmFjay5j
b20+DQo+ID4gRGF0ZTrCoCBGcmksIEZlYiA3LCAyMDI1LCAxOTo0Mg0KPiA+IFN1YmplY3Q6wqAg
W0V4dGVybmFsXSBkYnVzLXNlbnNvcnMgaXNzdWUNCj4gPiBUbzogIm9wZW5ibWNAbGlzdHMub3ps
YWJzLm9yZyI8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0KPiA+IEhpIGFsbCwNCj4gPiBJdCBh
cHBlYXJzIHRoYXQgSU8gd2FpdCBpcyB2ZXJ5IGhpZ2ggYWxsIHRoZSB0aW1lLiBUaGlzIGNhbiBi
ZSANCj4gPiB2aWV3ZWQgYnkgcnVubmluZyBgdG9wYC4gSXQgd2FzIHRyYWNlZCBkb3duIHRvIGRi
dXMtc2Vuc29ycyBzeXN0ZW1kIA0KPiA+IHVuaXRzLiBXaGVuIHRoZSB1bml0cyBhcmUgcnVubmlu
ZywgSU8NCj4gwqB3YWl0IGlzID45MCUuIFRoaXMgY2FuIGltcGFjdCBzeXN0ZW0gcGVyZm9ybWFu
Y2UgYW5kIGFsc28gaW1wYWN0cyBDUFUgdXRpbGl6YXRpb24gdGVsZW1ldHJ5LCBzaW5jZSB0aGUg
aWRsZSB0YXNrIG5ldmVyIHJ1bnMsIHdoaWNoIG5vcm1hbGx5IG1lYW5zIENQVSBpcyBiZWluZyBj
b21wbGV0ZWx5IHV0aWxpemVkLg0KPiA+IMKgDQo+ID4gTXkgcGxhdGZvcm0gdXNlcyBiZWxvdyBz
ZXJ2aWNlcywgc3RvcCB0aGVtIHdpbGwgZnJlZSB0aGUgSU8gdXNhZ2UsIGFueSBpZGVhPw0KPiA+
IMKgDQo+ID4geHl6Lm9wZW5ibWNfcHJvamVjdC5od21vbnRlbXBzZW5zb3Iuc2VydmljZQ0KPiA+
IHh5ei5vcGVuYm1jX3Byb2plY3QuZmFuc2Vuc29yLnNlcnZpY2UNCj4gPiB4eXoub3BlbmJtY19w
cm9qZWN0LmFkY3NlbnNvci5zZXJ2aWNlDQo+ID4geHl6Lm9wZW5ibWNfcHJvamVjdC5wc3VzZW5z
b3Iuc2VydmljZQ0KPiA+IMKgDQo+ID4gwqANCj4gPiBiZXN0IHJlZ2FyZHMNCj4gPiDCoA0KPiA+
IEplZmYgQ2hhbg0KDQotLQ0KUGF0cmljayBXaWxsaWFtcw0K
