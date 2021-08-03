Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E9A3DF148
	for <lists+openbmc@lfdr.de>; Tue,  3 Aug 2021 17:22:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfJWX2vXYz3bPV
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 01:22:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru header.a=rsa-sha256 header.s=default header.b=vYSrDBiN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yandex-team.ru (client-ip=2a02:6b8:0:1619::183;
 helo=forwardcorp1j.mail.yandex.net; envelope-from=kitsok@yandex-team.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.a=rsa-sha256 header.s=default header.b=vYSrDBiN; 
 dkim-atps=neutral
Received: from forwardcorp1j.mail.yandex.net (forwardcorp1j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfJW96BX0z303L
 for <openbmc@lists.ozlabs.org>; Wed,  4 Aug 2021 01:21:37 +1000 (AEST)
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 401552E17BA
 for <openbmc@lists.ozlabs.org>; Tue,  3 Aug 2021 18:21:26 +0300 (MSK)
Received: from mail.yandex-team.ru (mail.yandex-team.ru
 [2a02:6b8:0:506:4a65:eeff:fe1b:f0b1])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id
 LLLIa30xjW21-LQx84D7H; Tue, 03 Aug 2021 18:21:26 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1628004086; bh=W7lrWTx/mWctqUhD2uWYpSN0TCzjWatvCqbLH6HNXAE=;
 h=Subject:In-Reply-To:Date:References:To:From:Message-Id;
 b=vYSrDBiNlp/dPpWDuv94HF3FPhfMKyhZ4KUoctA4Xi7dW1cV3vpnGWiweJMcTalCR
 DVCDZhIEN3BzBx9gkAWC1StrO6ZKK4V2M8R+15BuUFGS8WEcPRIEBeKZhZ4gL/s7wF
 1swqxh+nyYAF8S+qA3SxQFQSdXVjUa3ovRUfcYVQ=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000049860
X-Yandex-Avir: 1
Received: from sas1-bf93f9015d57.qloud-c.yandex.net
 (sas1-bf93f9015d57.qloud-c.yandex.net [2a02:6b8:c08:8889:0:640:bf93:f901])
 by sas1-6b1512233ef6.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id
 ELLSv200amI1-e91xNpRt
 for <kitsok@yandex-team.ru>; Tue, 03 Aug 2021 18:21:15 +0300
Received: by sas1-bf93f9015d57.qloud-c.yandex.net with HTTP;
 Tue, 03 Aug 2021 18:21:15 +0300
From: Konstantin Klubnichkin <kitsok@yandex-team.ru>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
In-Reply-To: <df77021c-a86b-1a03-9960-acdf6c324600@yadro.com>
References: <60926e52-9d00-2b20-e8ac-7fd515ddac78@yadro.com>
 <CAH2KKeaBMhU3XDADDE0ieqRRhNBiF57-9rUi+Go-SSJCGG-GBA@mail.gmail.com>
 <3c0b0dc3-a31d-dcfb-608b-53436074397b@linux.intel.com>
 <34751627996896@mail.yandex-team.ru>
 <df77021c-a86b-1a03-9960-acdf6c324600@yadro.com>
Subject: Re: Installing Windows Server 2019 from a remotely mounted ISO
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Tue, 03 Aug 2021 18:21:25 +0300
Message-Id: <6631628004052@mail.yandex-team.ru>
Content-Transfer-Encoding: base64
Content-Type: text/html; charset=utf-8
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

PGRpdj4tINCy0YHQtTwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PkhlbGxvIElnb3IsPC9kaXY+PGRp
dj7CoDwvZGl2PjxkaXY+V29ya3MgbGlrZSBhIGNoYXJtIHdpdGggYWxsIElTTyBJIGhhZCBvbiBo
YW5kcywgdGhhbmsgeW91ITwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PjAzLjA4LjIwMjEsIDE2OjUz
LCAiaS5rb25vbmVua28iICZsdDtpLmtvbm9uZW5rb0B5YWRyby5jb20mZ3Q7OjwvZGl2PjxibG9j
a3F1b3RlPjxwPkhlbGxvIEtvbnN0YW50aW4sPGJyIC8+PGJyIC8+SSBoYXZlIHNldmVyYWwgcGF0
Y2hlcyBbMV0gdG8gc29sdmVzIG1vdW50aW5nIERWRC1iYXNlZCBJU09zIHRocm91Z2ggVmlydHVh
bCBNZWRpYS48YnIgLz5UaGUgcHVibGlzaGVkIGNoYW5nZXMgaXMgV0lQIHVudGlsIGhhZCBhcHBy
b3ZlZCBieSB0aGUgTGludXggRm91bmRhdGlvbiBjb21tdW5pdHksPGJyIC8+YnV0IGluIHRoZSBZ
QURSTywgd2UgdXNlIHRoZXNlIGNoYW5nZXMgdG8gc3VwcG9ydCBpbnN0YWxsaW5nIHRoZSBPUyBX
aW5kb3dzIHZpYTxiciAvPlZpcnR1YWwgTWVkaWEuPGJyIC8+PGJyIC8+PGJyIC8+SSBob3BlIHlv
dXIgd2lsbCBmb3VuZCBpdCBoZWxwZnVsIHRoYXQgaW5mb3JtYXRpb24gdG8gc3VwcG9ydCBpbnN0
YWxsaW5nIFdpbmRvd3MtYmFzZWQgT1MuPGJyIC8+PGJyIC8+TGlua3M6PGJyIC8+WzFdIC0gPGEg
aHJlZj0iaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXVzYi9saXN0
Lz9zZXJpZXM9NTA3NTgzIiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIiPmh0dHBzOi8vcGF0Y2h3
b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC11c2IvbGlzdC8/c2VyaWVzPTUwNzU4MzwvYT48
YnIgLz48YnIgLz5PbiAwMy4wOC4yMDIxIDE2OjI2LCBLb25zdGFudGluIEtsdWJuaWNoa2luIHdy
b3RlOjwvcD48YmxvY2txdW90ZT7CoEhlbGxvIE1hY2llaiw8YnIgLz7CoEkndmUgZ290IGEgcXVl
c3Rpb24gcmVnYXJkaW5nIHRoZSBpbnN0cnVjdGlvbi48YnIgLz7CoEl0J3MgYWJvdXQgT3B0aW9u
IDIgKHByZXBhcmluZyBpbWFnZSBvbiBMaW51eCkuPGJyIC8+wqBUaGUgc2VxdWVuY2UgaW4gdGhl
IGluc3RydWN0aW9uIGlzOjxiciAvPsKgMS4gQ3JlYXRlIGVtcHR5IGltYWdlIHVzaW5nIGRkOzxi
ciAvPsKgMi4gQ3JlYXRlIHBhcnRpdGlvbiB0YWJsZSBvbiBpdCB3aXRoIEZBVDMyIHBhcnRpdGlv
bjs8YnIgLz7CoDMuIEZvcm1hdCBpbWFnZSB0byBGQVQzMiBmaWxlc3lzdGVtOzxiciAvPsKgNC4g
UHJlcGFyZSBmaWxlcyBmcm9tIFdpbmRvd3MgRFZEOzxiciAvPsKgNS4gTW91bnQgaW1hZ2UgdG8g
c29tZSBkaXJlY3Rvcnk7PGJyIC8+wqA2LiBDb3B5IGZpbGVzIHRvIHRoYXQgZGlyZWN0b3J5Ozxi
ciAvPsKgNy4gVW5tb3VudCBpbWFnZS48YnIgLz7CoEkgY2FuJ3QgZ2V0IHdoeSB0byBjcmVhdGUg
cGFydGl0aW9uIHRhYmxlIG9uIHRoZSBpbWFnZShzdGVwIDIpIGlmIHRoZSBuZXh0IHN0ZXA8YnIg
Lz7CoChmb3JtYXR0aW5nIGltYWdlIHdpdGggbWtmcy52ZmF0LCBzdGVwIDMpIGRlc3Ryb3lzIGl0
PzxiciAvPsKgQ291bGQgeW91IHBsZWFzZSBjbGFyaWZ5IHRoaXMgcG9pbnQ/PGJyIC8+wqBUaGFu
ayB5b3UhPGJyIC8+wqAyMi4xMC4yMDIwLCAxNDozOSwgIk1hY2llaiBMYXduaWN6YWsiICZsdDs8
YSBocmVmPSJtYWlsdG86bWFjaWVqLmxhd25pY3pha0BsaW51eC5pbnRlbC5jb20iIHJlbD0ibm9v
cGVuZXIgbm9yZWZlcnJlciI+bWFjaWVqLmxhd25pY3pha0BsaW51eC5pbnRlbC5jb208L2E+Jmd0
Ozo8YnIgLz7CoDxiciAvPsKgwqDCoMKgwqBNb3VudGluZyBEVkQtYmFzZWQgSVNPcyBpbiBJbnRl
bC1CTUMgVmlydHVhbCBNZWRpYSBpcyBub3Qgc3VwcG9ydGVkIGJ5PGJyIC8+wqDCoMKgwqDCoHVu
ZGVybHlpbmcgVVNCIE1hc3MgU3RvcmFnZSBnYWRnZXQuIFRvIG1vdW50IHN1Y2ggaXNvIGZpbGVz
IHRoZXkgbmVlZCB0byBiZTxiciAvPsKgwqDCoMKgwqBjb252ZXJ0ZWQgdG8gTUJSL0ZBVDMyIGlt
YWdlLiBBdHRhY2hlZCBpbnN0cnVjdGlvbiBzaG93cyB0d28gd2F5cyBvZjxiciAvPsKgwqDCoMKg
wqBwcmVwYXJpbmcgc3VjaCBpbWFnZS48YnIgLz7CoDxiciAvPsKgwqDCoMKgwqBPbiAxMC8yMS8y
MDIwIDk6MzIgQU0sIFRoYWogd3JvdGU6PGJyIC8+wqA8YnIgLz7CoMKgwqDCoMKgwqDCoMKgwqBI
aSBBbGV4YW5kZXIsIEkgYW0gYWxzbyBmYWNpbmcgdGhlIHNhbWUgaXNzdWUuIERpZCB5b3UgZmlu
ZCBhbnk8YnIgLz7CoMKgwqDCoMKgwqDCoMKgwqB3b3JrYXJvdW5kIGZvciB0aGlzID88YnIgLz7C
oMKgwqDCoMKgwqDCoMKgwqBPbiBNb24sIE1heSAyNSwgMjAyMCBhdCA0OjA0IFBNIEFsZXhhbmRl
ciBBbWVsa2luICZsdDs8YSBocmVmPSJtYWlsdG86YS5hbWVsa2luQHlhZHJvLmNvbSIgcmVsPSJu
b29wZW5lciBub3JlZmVycmVyIj5hLmFtZWxraW5AeWFkcm8uY29tPC9hPjxiciAvPsKgwqDCoMKg
wqDCoMKgwqDCoCZsdDs8YSBocmVmPSJtYWlsdG86YS5hbWVsa2luQHlhZHJvLmNvbSIgcmVsPSJu
b29wZW5lciBub3JlZmVycmVyIj5tYWlsdG86YS5hbWVsa2luQHlhZHJvLmNvbTwvYT4mZ3Q7Jmd0
OyB3cm90ZTo8YnIgLz7CoDxiciAvPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgSGkgYWxsITxi
ciAvPsKgPGJyIC8+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBXZSdyZSB0cnlpbmcgdG8gaW5z
dGFsbCBXaW5kb3dzIFNlcnZlciAyMDE5IGZyb20gYW4gSVNPIGltYWdlIG1vdW50ZWQgYXM8YnIg
Lz7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlbW90ZSBtZWRpYSB2aWEgT3BlbkJNQyBXZWJV
SS48YnIgLz7CoDxiciAvPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgVGhlIFdpbmRvd3MgaW5z
dGFsbGVyIGJvb3RzLCBidXQgdGhlbiBzYXlzIHRoYXQgYSBtZWRpYSBkcml2ZXIgaXM8YnIgLz7C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG1pc3NpbmcuPGJyIC8+wqA8YnIgLz7CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoEFyZSB0aGVyZSBhbnkgaGludHMgb24gaG93IHRvIGFjY29tcGxpc2gg
dGhlIHRhc2s/PGJyIC8+wqA8YnIgLz7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEF0dGFjaGVk
IGlzIHRoZSBzY3JlZW5zaG90IG9mIHRoZSBtZXNzYWdlIHdlIGdldCB3aXRoIFdpbmRvd3MgU2Vy
dmVyPGJyIC8+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAyMDE5LjxiciAvPsKgPGJyIC8+wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBXaXRoIGJlc3QgcmVnYXJkcyw8YnIgLz7CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoEFsZXhhbmRlci48YnIgLz7CoDxiciAvPsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgUC5TLiBXZSdyZSB1c2luZyBJbnRlbC1CTUMgdmVyc2lvbiBvZiBPcGVuQk1DIGZv
ciB0aGUgdGFzaywgYnV0IGl0IGxvb2tzPGJyIC8+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBs
aWtlIHRoZSByZW1vdGUgbWVkaWEgcGFydCBpcyBtb3JlIG9yIGxlc3MgdGhlIHNhbWUuPGJyIC8+
wqA8YnIgLz7CoC0tPGJyIC8+wqBCZXN0IHJlZ2FyZHMsPGJyIC8+wqBLb25zdGFudGluIEtsdWJu
aWNoa2luLDxiciAvPsKgbGVhZCBmaXJtd2FyZSBlbmdpbmVlciw8YnIgLz7CoHNlcnZlciBoYXJk
d2FyZSBSJmFtcDtEIGdyb3VwLDxiciAvPsKgWWFuZGV4IE1vc2NvdyBvZmZpY2UuPGJyIC8+wqB0
ZWw6ICs3LTkwMy01MTAtMzMtMzM8YnIgLz7CoDwvYmxvY2txdW90ZT48cD7CoDwvcD4tLTxiciAv
PkJlc3QgcmVnYXJkcyw8YnIgLz48YnIgLz5JZ29yIEtvbm9uZW5rbzwvYmxvY2txdW90ZT48ZGl2
PsKgPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+LS3CoDwvZGl2PjxkaXY+QmVzdCByZWdhcmRzLDwv
ZGl2PjxkaXY+S29uc3RhbnRpbiBLbHVibmljaGtpbiw8L2Rpdj48ZGl2PmxlYWQgZmlybXdhcmUg
ZW5naW5lZXIsPC9kaXY+PGRpdj5zZXJ2ZXIgaGFyZHdhcmUgUiZhbXA7RCBncm91cCw8L2Rpdj48
ZGl2PllhbmRleCBNb3Njb3cgb2ZmaWNlLjwvZGl2PjxkaXY+dGVsOiArNy05MDMtNTEwLTMzLTMz
PC9kaXY+PGRpdj7CoDwvZGl2Pg==
