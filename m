Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2EE30D198
	for <lists+openbmc@lfdr.de>; Wed,  3 Feb 2021 03:33:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVm2B6lHbzDwjR
	for <lists+openbmc@lfdr.de>; Wed,  3 Feb 2021 13:33:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yandex-team.ru (client-ip=5.45.199.163;
 helo=forwardcorp1j.mail.yandex.net; envelope-from=kitsok@yandex-team.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.a=rsa-sha256 header.s=default header.b=X3JBPPzA; 
 dkim-atps=neutral
X-Greylist: delayed 100 seconds by postgrey-1.36 at bilbo;
 Wed, 03 Feb 2021 02:21:53 AEDT
Received: from forwardcorp1j.mail.yandex.net (forwardcorp1j.mail.yandex.net
 [5.45.199.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVT7P0S9QzDq9k
 for <openbmc@lists.ozlabs.org>; Wed,  3 Feb 2021 02:21:52 +1100 (AEDT)
Received: from sas1-ec30c78b6c5b.qloud-c.yandex.net
 (sas1-ec30c78b6c5b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:2704:0:640:ec30:c78b])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 53AAE2E147D;
 Tue,  2 Feb 2021 18:19:46 +0300 (MSK)
Received: from localhost (localhost [::1])
 by sas1-ec30c78b6c5b.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 1rAcP69eCd-Jixmihlc; Tue, 02 Feb 2021 18:19:46 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1612279186; bh=VoaVr4b+PRbYfs+52IFZWovbZ+YsCbB/HzAmPAwS3C8=;
 h=Cc:Subject:Date:References:To:From:Message-Id;
 b=X3JBPPzA9fkPYB9s2BJHAuw8mkJfA6LoqfJiXvfKu2puwQYj9ytOH/kmEfOXCEdtH
 wsO+HaPyqGuBkyhV+yjbLUooJnHihzGaFPSU+gPjpXDBcJTVDn62MshKUioO5XIg87
 /gPYMYb7O/nIzjtjuquP03PsuzkML5KkcbNvFgFo=
Authentication-Results: sas1-ec30c78b6c5b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000049860
X-Yandex-Avir: 1
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net [2a02:6b8:c0c:2f26:0:640:d077:482f])
 by iva4-81f2a0d63507.qloud-c.yandex.net with LMTP id k4vToly07v-jxInDNJ5
 for <kitsok@yandex-team.ru>; Tue, 02 Feb 2021 18:19:34 +0300
Received: by iva4-6d0ca09d92db.qloud-c.yandex.net with HTTP;
 Tue, 02 Feb 2021 18:19:34 +0300
From: Konstantin Klubnichkin <kitsok@yandex-team.ru>
To: Ed Tanous <edtanous@google.com>
References: <TYZPR04MB441643EFC954C795DD1290A886BB0@TYZPR04MB4416.apcprd04.prod.outlook.com>
 <CAH2-KxA20CfM9upvUkB=jhapVNF4AdVROA4wafFxxYftmvwO=w@mail.gmail.com>
 <31441611827264@mail.yandex-team.ru>
 <CAH2-KxDE0J0Q4fmYc5MvP=J+DdziCSecQHjTSJheRm7oosUdpQ@mail.gmail.com>
Subject: Re: [entity-manager] Issue about entity-manager getting stuck
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Tue, 02 Feb 2021 18:19:44 +0300
Message-Id: <16521612278756@mail.yandex-team.ru>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 =?utf-8?B?U2Nyb24gQ2hhbmcgKOW8teS7suW7tik=?= <scron.chang@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PGRpdj5IZWxsbyE8L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj5JJ3ZlIGZvdW5kIGEgQk1DIHdpdGgg
dGhpcyBpc3N1ZSwgc3RpbGwgY2FuJ3QgZmluZCBhbnkgZGlmZmVyZW5jZSBmcm9tICJub3JtYWwi
IEJNQ3MgZXhjZXB0IG9mIG5vIE5UUCBzZXJ2ZXIgYW5kIHRodXMgd3JvbmcgdGltZS48L2Rpdj48
ZGl2Pkl0IGxvb2tzIGxpa2UgdGhpczo8L2Rpdj48ZGl2Pj09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PC9k
aXY+PGRpdj48ZGl2PnNpZyA0NzU0LjU1NDYzOCA2MTA2IDoxLjIgJmx0O25vbmUmZ3Q7IC9vcmcv
ZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9vYm1jXzJkbWFwcGVyXzJldGFyZ2V0IG9yZy5mcmVl
ZGVza3RvcC5EQnVzLlByb3BlcnRpZXMgUHJvcGVydGllc0NoYW5nZWQ8L2Rpdj48ZGl2PnNpZyA0
NzU0LjU1NDg2NSA2MTA3IDoxLjIgJmx0O25vbmUmZ3Q7IC9vcmcvZnJlZWRlc2t0b3Avc3lzdGVt
ZDEvdW5pdC9vYm1jXzJkbWFwcGVyXzJldGFyZ2V0IG9yZy5mcmVlZGVza3RvcC5EQnVzLlByb3Bl
cnRpZXMgUHJvcGVydGllc0NoYW5nZWQ8L2Rpdj48ZGl2PnNpZyA0NzU0LjU1NjcxMSA2MTA4IDox
LjIgJmx0O25vbmUmZ3Q7IC9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9vYm1jXzJkbWFw
cGVyXzJldGFyZ2V0IG9yZy5mcmVlZGVza3RvcC5EQnVzLlByb3BlcnRpZXMgUHJvcGVydGllc0No
YW5nZWQ8L2Rpdj48ZGl2PnNpZyA0NzU0LjU1NzAyNSA2MTA5IDoxLjIgJmx0O25vbmUmZ3Q7IC9v
cmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9vYm1jXzJkbWFwcGVyXzJldGFyZ2V0IG9yZy5m
cmVlZGVza3RvcC5EQnVzLlByb3BlcnRpZXMgUHJvcGVydGllc0NoYW5nZWQ8L2Rpdj48ZGl2PnNp
ZyA0NzU0LjU1NzI2OSA2MTEwIDoxLjIgJmx0O25vbmUmZ3Q7IC9vcmcvZnJlZWRlc2t0b3Avc3lz
dGVtZDEvdW5pdC9vYm1jXzJkbWFwcGVyXzJldGFyZ2V0IG9yZy5mcmVlZGVza3RvcC5EQnVzLlBy
b3BlcnRpZXMgUHJvcGVydGllc0NoYW5nZWQ8L2Rpdj48ZGl2PnNpZyA0NzU0LjU1NzQ5MyA2MTEx
IDoxLjIgJmx0O25vbmUmZ3Q7IC9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9vYm1jXzJk
bWFwcGVyXzJldGFyZ2V0IG9yZy5mcmVlZGVza3RvcC5EQnVzLlByb3BlcnRpZXMgUHJvcGVydGll
c0NoYW5nZWQ8L2Rpdj48ZGl2PnNpZyA0NzU0LjU1OTAzOSA2MTEyIDoxLjIgJmx0O25vbmUmZ3Q7
IC9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9vYm1jXzJkbWFwcGVyXzJldGFyZ2V0IG9y
Zy5mcmVlZGVza3RvcC5EQnVzLlByb3BlcnRpZXMgUHJvcGVydGllc0NoYW5nZWQ8L2Rpdj48ZGl2
PnNpZyA0NzU0LjU1OTMwOCA2MTEzIDoxLjIgJmx0O25vbmUmZ3Q7IC9vcmcvZnJlZWRlc2t0b3Av
c3lzdGVtZDEvdW5pdC9vYm1jXzJkbWFwcGVyXzJldGFyZ2V0IG9yZy5mcmVlZGVza3RvcC5EQnVz
LlByb3BlcnRpZXMgUHJvcGVydGllc0NoYW5nZWQ8L2Rpdj48ZGl2PnNpZyA0NzU0LjU1OTUzNSA2
MTE0IDoxLjIgJmx0O25vbmUmZ3Q7IC9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9vYm1j
XzJkbWFwcGVyXzJldGFyZ2V0IG9yZy5mcmVlZGVza3RvcC5EQnVzLlByb3BlcnRpZXMgUHJvcGVy
dGllc0NoYW5nZWQ8L2Rpdj48ZGl2PnNpZyA0NzU0LjU3MTUyMiA2MTE1IDoxLjIgJmx0O25vbmUm
Z3Q7IC9vcmcvZnJlZWRlc2t0b3Avc3lzdGVtZDEvdW5pdC9vYm1jXzJkbWFwcGVyXzJldGFyZ2V0
IG9yZy5mcmVlZGVza3RvcC5EQnVzLlByb3BlcnRpZXMgUHJvcGVydGllc0NoYW5nZWQ8L2Rpdj48
L2Rpdj48ZGl2PjxkaXY+PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT08L2Rpdj48L2Rpdj48ZGl2PsKgPC9k
aXY+PGRpdj5JJ3ZlIHN0b3BwZWQgZGJ1cy1tb25pdG9yLCB0aGUgc2lnbmFsIGZsb3cgZG9lcyBu
b3Qgc3RvcCBieSBpdHNlbGYuPC9kaXY+PGRpdj5JbiB0aGlzIGNvbmRpdGlvbnMgc3lzdGVtY3Rs
IGRvZXNuJ3Qgd29yay48L2Rpdj48ZGl2PjxkaXY+e3N5c3RlbWR9IC9zYmluL2luaXQgY29uc3Vt
ZXMgJmd0OzgwJSBvZiBDUFUsIC91c3IvYmluL2RidXMtYnJva2VyLWxhdW5jaCBjb25zdW1lcyAy
NTltIG9mIHZpcnR1YWwgbWVtb3J5IChpdCBzZWVtcyB0byBiZSBub3JtYWwgYXMgaXQgYWxzbyBj
b25zdW1lcyBhIGxvdCBvZiBtZW1vcnkgb24gbm9ybWFsIHN5c3RlbXMpLjwvZGl2PjxkaXY+wqA8
L2Rpdj48ZGl2Pkxhc3Qgc2Vjb25kIHVwZGF0ZTogSSd2ZSBqdXN0IHNldCB0aGUgdGltZSBtYW51
YWxseSAoZGF0ZSAtcyAiMjAyMS0wMi0wMiAxODoxODozNCIpIGFuZCBzeXN0ZW0gY29udGludWVk
IHRvIGJvb3QuPC9kaXY+PGRpdj7CoDwvZGl2PjwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PjI4LjAx
LjIwMjEsIDIxOjM5LCAiRWQgVGFub3VzIiAmbHQ7PGEgaHJlZj0ibWFpbHRvOmVkdGFub3VzQGdv
b2dsZS5jb20iIHJlbD0ibm9vcGVuZXIgbm9yZWZlcnJlciI+ZWR0YW5vdXNAZ29vZ2xlLmNvbTwv
YT4mZ3Q7OjwvZGl2PjxibG9ja3F1b3RlPjxwPk9uIFRodSwgSmFuIDI4LCAyMDIxIGF0IDE6NTYg
QU0gS29uc3RhbnRpbiBLbHVibmljaGtpbjxiciAvPiZsdDs8YSBocmVmPSJtYWlsdG86a2l0c29r
QHlhbmRleC10ZWFtLnJ1IiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIiPmtpdHNva0B5YW5kZXgt
dGVhbS5ydTwvYT4mZ3Q7IHdyb3RlOjwvcD48YmxvY2txdW90ZT48YnIgLz7CoEhlbGxvLCBFZCE8
YnIgLz48YnIgLz7CoEknbSBub3Qgc3VyZSBpZiBteSBpc3N1ZSBpcyByZWxldmFudCB0byB3aGF0
IFNjcm9uIGRpc2NvdmVyZWQsIGJ1dCBpdCBtYXkgYmUuPGJyIC8+wqBTb21ldGltZXMgKG5vdCBl
dmVyeSBCTUMgcmVib290KSBkYnVzIGdldCBzdHVjayBkdXJpbmcgc3RhcnR1cC48L2Jsb2NrcXVv
dGU+PHA+PGJyIC8+VGhhdCBzb3VuZHMgc2xpZ2h0bHkgZGlmZmVyZW50LCBidXQgY2VydGFpbmx5
IGNvbmNlcm5pbmcuPGJyIC8+wqA8L3A+PGJsb2NrcXVvdGU+wqBzeXN0ZW1jdGwgb3IgZGJ1cyBk
b24ndCB3b3JrIChmYWlsIGJ5IHRpbWVvdXQpLCBzZXJ2aWNlcyBzdHVjayB0cnlpbmcgdG8gc3Rh
cnQsIGRidXMtYnJva2VyIGNvbnN1bWVzIGEgbG90IG9mIENQVSBhbmQgZGJ1cyBtb25pdG9yIHNo
b3dzIHN0b3JtIG9mICJQcm9wZXJ0eSBDaGFuZ2VkIiBldmVudHMgZnJvbSBhbm9ueW1vdXMgYXBw
bGljYXRpb24uPC9ibG9ja3F1b3RlPjxwPjxiciAvPkNhbiB5b3UgdHJhY2sgZG93biB3aGljaCBh
bm9ueW1vdXMgYXBwbGljYXRpb24gaXQgaXM/PGJyIC8+wqA8L3A+PGJsb2NrcXVvdGU+wqBUaGUg
d29yayBhcm91bmQgSSd2ZSBmb3VuZCBpcyB0byBraWxsIGRidXMtYnJva2VyIGFuZCBkYnVzLWJy
b2tlci1sYXVuY2gsIHRoZW4gSSBjYW4gYXQgbGVhc3QgaXNzdWUgInJlYm9vdCIgd2l0aG91dCAi
LWYiLCB1c3VhbGx5ICg4IHRpbWVzIG91dCBvZiAxMCkgQk1DIHN0YXJ0cyBub3JtYWxseSBuZXh0
IHRpbWUuPC9ibG9ja3F1b3RlPjxwPjxiciAvPlRoaXMgZG9lc24ndCByZWFsbHkgc2VlbSB3b3Jr
YWJsZSBsb25nIHRlcm0uPGJyIC8+wqA8L3A+PGJsb2NrcXVvdGU+wqBVbmZvcnR1bmF0ZWx5IEkg
ZG9uJ3Qga25vdyBob3cgdG8gcmVwcm9kdWNlIHRoZSBpc3N1ZSBmb3Igc3VyZS4gSXQgaGFwcGVu
cyBtb3JlIG9mdGVuIHdoZW4gQk1DIGhhcyBubyBuZXR3b3JrIGFuZCBkb2Vzbid0IGhhdmUgdGlt
ZSBzb3VyY2UgbGlrZSBOVFAgb3IgZGF0ZS90aW1lIHNhdmVkIGluIFJUQy48YnIgLz7CoFNvIEkg
c3VzcGVjdCBjYWxsaW5nIGJ1c2N0bCBpbiBhIGN5Y2xlIGlzIG5vdCB0aGUgb25seSB3YXkgdG8g
Z2V0IHN5c3RlbSBzdHVjay48L2Jsb2NrcXVvdGU+PHA+PGJyIC8+TGV0cyBzZWUgaWYgd2UgY2Fu
IGdldCB0aGlzIGRlYnVnZ2VkLiBJIGtub3cgSSBoYXZlbid0IHNlZW4gYW55dGhpbmc8YnIgLz5z
aW1pbGFyLCBzbyBJJ20gbm90IHN1cmUgSSBjYW4gYmUgbXVjaCBoZWxwIHRvIHlvdSwgYnV0IGdv
b2QgbHVjazxiciAvPmh1bnRpbmcgaXQgZG93bi48YnIgLz7CoDwvcD48YmxvY2txdW90ZT48YnIg
Lz7CoFRoYW5rIHlvdSE8YnIgLz48YnIgLz7CoDI3LjAxLjIwMjEsIDIwOjA4LCAiRWQgVGFub3Vz
IiAmbHQ7PGEgaHJlZj0ibWFpbHRvOmVkdGFub3VzQGdvb2dsZS5jb20iIHJlbD0ibm9vcGVuZXIg
bm9yZWZlcnJlciI+ZWR0YW5vdXNAZ29vZ2xlLmNvbTwvYT4mZ3Q7OjxiciAvPjxiciAvPsKgT24g
VHVlLCBKYW4gMjYsIDIwMjEgYXQgMTA6MzQgUE0gU2Nyb24gQ2hhbmcgKOW8teS7suW7tik8YnIg
Lz7CoCZsdDs8YSBocmVmPSJtYWlsdG86U2Nyb24uQ2hhbmdAcXVhbnRhdHcuY29tIiByZWw9Im5v
b3BlbmVyIG5vcmVmZXJyZXIiPlNjcm9uLkNoYW5nQHF1YW50YXR3LmNvbTwvYT4mZ3Q7IHdyb3Rl
OjxiciAvPjxiciAvPjxiciAvPsKgwqBIaSBhbGwsPGJyIC8+PGJyIC8+wqDCoEkgYW0gdXNpbmcg
b3BlbmJtYy9lbnRpdHktbWFuYWdlciBpbiB0aGlzIHZlcnNpb246ICJmMDk0MTI1Y2QzYmRiYzg3
MzdkYzgwMzVhNmU5YWMyNTJmNmU4ODQwIiBhbmQgSSBmb3VuZCBjYWxsaW5nIERidXMgbWFrZXMg
ZW50aXR5LW1hbmFnZXIgZ2V0IHN0dWNrLjxiciAvPjxiciAvPsKgwqBSZXByb2R1Y2UgdGhpcyBi
eSBmb2xsb3dpbmcgc3RlcHM6PGJyIC8+wqDCoDEuIHN5c3RlbWN0bCBzdG9wIHh5ei5vcGVuYm1j
X3Byb2plY3QuRW50aXR5TWFuYWdlcjxiciAvPsKgwqAyLiBvcGVuIGFub3RoZXIgdGVybWluYWwg
YW5kIGRvIHRoaXMgd2hpbGUtbG9vcDogIndoaWxlIHRydWU7IGRvIGJ1c2N0bCA7IHNsZWVwIDE7
IGRvbmUiPGJyIC8+wqDCoDMuIHN5c3RlbWN0bCBzdGFydCB4eXoub3BlbmJtY19wcm9qZWN0LkVu
dGl0eU1hbmFnZXI8YnIgLz7CoMKgSSB0aGluayB0aGUgcm9vdCBjYXVzZSBpcyB0aGlzIGZ1bmN0
aW9uOiAibmFtZU93bmVyQ2hhbmdlZE1hdGNoLiIgKFBsZWFzZSByZWZlciB0byB0aGlzIGxpbmU6
IDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2VudGl0eS1tYW5hZ2VyL2Jsb2Iv
ZjA5NDEyNWNkM2JkYmM4NzM3ZGM4MDM1YTZlOWFjMjUyZjZlODg0MC9zcmMvRW50aXR5TWFuYWdl
ci5jcHAjTDE4NTkiIHJlbD0ibm9vcGVuZXIgbm9yZWZlcnJlciI+aHR0cHM6Ly9naXRodWIuY29t
L29wZW5ibWMvZW50aXR5LW1hbmFnZXIvYmxvYi9mMDk0MTI1Y2QzYmRiYzg3MzdkYzgwMzVhNmU5
YWMyNTJmNmU4ODQwL3NyYy9FbnRpdHlNYW5hZ2VyLmNwcCNMMTg1OTwvYT4uKTxiciAvPjxiciAv
PjxiciAvPsKgTXkgZmlyc3QgdGhvdWdodCBpczogRG9uJ3QgcnVuIGFuIGVtcHR5IGJ1c2N0bCBp
biBhIGxvb3AgdGhlbiwgYnV0IEknbTxiciAvPsKgZ3Vlc3NpbmcgdGhhdCdzIG5vdCB3aGF0IHlv
dSdyZSByZWFsbHkgdHJ5aW5nIHRvIGRvLiBJZiB3ZSBoYWQgbW9yZTxiciAvPsKgaWRlYXMgYWJv
dXQgd2hhdCB5b3Ugd2VyZSByZWFsbHkgaG9waW5nIHRvIGFjY29tcGxpc2gsIHdlIG1pZ2h0IGhh
dmU8YnIgLz7CoHNvbWUgYmV0dGVyIGFkdmljZSBmb3IgaG93IHRvIHByb2NlZWQuPGJyIC8+PGJy
IC8+wqBUaGUgaW50ZW50IG9mIHRoYXQgY29kZSBpcyB0byByZWNvbmZpZ3VyZSBlbnRpdHktbWFu
YWdlciB3aGVuPGJyIC8+wqBpbnRlcmZhY2VzIGFyZSBjaGFuZ2VkLCBzbyBpZiB5b3UncmUgY29u
c3RhbnRseSBhdHRhY2hpbmcgYW5kPGJyIC8+wqBkZXRhY2hpbmcgdG8gZGJ1cywgZW50aXR5LW1h
bmFnZXIgKGFuZCBvYmplY3QgbWFuYWdlcikgbmV2ZXIgc2VlcyB0aGU8YnIgLz7CoHN5c3RlbSBh
cyAidXAiIGFuZCBrZWVwcyB3YWl0aW5nIGZvciB0aGUgc3lzdGVtIHRvIGZpbmlzaCBzdGFiaWxp
emluZzxiciAvPsKgYmVmb3JlIGl0IHJ1bnMgdGhlIGNvbmZpZyBsb2dpYy48YnIgLz48YnIgLz7C
oEluIHlvdXIgc3BlY2lmaWMgY2FzZSBhYm92ZSwgdGhlIGNvZGUgY291bGQgYmUgYSBsaXR0bGUg
c21hcnRlciwgYW5kPGJyIC8+wqBpZ25vcmUgdW5pcXVlIG5hbWVzIGluIHRoYXQgY2hlY2ssIG9u
bHkgY2FyaW5nIGFib3V0IG5ld2x5LWRlZmluZWQ8YnIgLz7CoHdlbGwga25vd24gbmFtZXMsIGJ1
dCB3aXRob3V0IGtub3dpbmcgeW91ciByZWFsIHVzZSBjYXNlLCBpdCdzIGhhcmQgdG88YnIgLz7C
oGtub3cgaWYgdGhhdCB3b3VsZCBoZWxwLjxiciAvPjxiciAvPjxiciAvPjxiciAvPsKgwqBNYW51
YWxseSBjYWxsaW5nIERidXMgb3IgY2FsbGluZyBEYnVzIGluIGEgc2NyaXB0IG1ha2VzIE5hbWVP
d25lckNoYW5nZWQgc2lnbmFsIGFuZCB0aHVzIHRyaWdnZXJzIHRoZSBmdW5jdGlvbjogInByb3Bl
cnRpZXNDaGFuZ2VkQ2FsbGJhY2siIHJlcGVhdGVkbHkuIE1lYW53aGlsZSwgdGhlIGFzeW5jX3dh
aXQgaW4gcHJvcGVydGllc0NoYW5nZWRDYWxsYmFjayBnZXRzIHJldHVybmVkIGJlY2F1c2Ugb2Yg
dGhlIG9wZXJhdGlvbl9hYm9ydGVkLjxiciAvPjxiciAvPjxiciAvPsKgUGVyc29uYWwgb3Bpbmlv
bjogRG9uJ3QgY2FsbCBidXNjdGwgY29udGludW91c2x5IGluIGEgc2NyaXB0LiBJdCdzPGJyIC8+
wqBpbmVmZmljaWVudCwgYW5kIGNhdXNlcyBwcm9ibGVtcyBsaWtlIHRoaXMuPGJyIC8+PGJyIC8+
PGJyIC8+wqDCoFNvIGhlcmUgaXMgdGhlIGNvbmNsdXNpb246PGJyIC8+wqDCoE1hbnVhbGx5IGNh
bGxpbmcgRGJ1cyBpbiBhIHBlcmlvZCB0aGF0IGlzIGxlc3MgdGhhbiA1IHNlY29uZHMgbGVhZHMg
ZW50aXR5LW1hbmFnZXIga2VlcGluZyB0byB0cmlnZ2VyIG5ldyBhc3luY193YWl0IGFuZCBhYm9y
dCB0aGUgb2xkIG9uZS4gSG93ZXZlciwgdGhlIGFzeW5jX3dhaXQgbmV2ZXIgZ2V0cyBkb25lLjxi
ciAvPjxiciAvPsKgwqBJcyB0aGlzIGEgYnVnIG9mIGVudGl0eS1tYW5hZ2VyLCBvciBJIGdldCBz
b21ldGhpbmcgd3JvbmcuIFBsZWFzZSBoZWxwIG1lIHdpdGggdGhpcy48YnIgLz48YnIgLz48YnIg
Lz7CoElNTywgZW50aXR5LW1hbmFnZXIgaXMgd29ya2luZyBhcyBpbnRlbmRlZCwgYnV0IGxldHMg
dHJ5IHRvIGZpZ3VyZSBvdXQ8YnIgLz7CoHdoYXQgeW91J3JlIHJlYWxseSB0cnlpbmcgdG8gZG8s
IGFuZCBzZWUgaWYgd2UgY2FuIGZpbmQgeW91IGE8YnIgLz7CoHNvbHV0aW9uLjxiciAvPjxiciAv
PjxiciAvPjxiciAvPsKgwqBTY3JvbiBDaGFuZzxiciAvPsKgwqBFLU1haWwgPGEgaHJlZj0ibWFp
bHRvOlNjcm9uLkNoYW5nQHF1YW50YXR3LmNvbSIgcmVsPSJub29wZW5lciBub3JlZmVycmVyIj5T
Y3Jvbi5DaGFuZ0BxdWFudGF0dy5jb208L2E+PGJyIC8+PGJyIC8+PGJyIC8+PGJyIC8+PGJyIC8+
wqAtLTxiciAvPsKgQmVzdCByZWdhcmRzLDxiciAvPsKgS29uc3RhbnRpbiBLbHVibmljaGtpbiw8
YnIgLz7CoGxlYWQgZmlybXdhcmUgZW5naW5lZXIsPGJyIC8+wqBzZXJ2ZXIgaGFyZHdhcmUgUiZh
bXA7RCBncm91cCw8YnIgLz7CoFlhbmRleCBNb3Njb3cgb2ZmaWNlLjxiciAvPsKgdGVsOiArNy05
MDMtNTEwLTMzLTMzPGJyIC8+wqA8L2Jsb2NrcXVvdGU+PC9ibG9ja3F1b3RlPjxkaXY+wqA8L2Rp
dj48ZGl2PsKgPC9kaXY+PGRpdj4tLcKgPC9kaXY+PGRpdj5CZXN0IHJlZ2FyZHMsPC9kaXY+PGRp
dj5Lb25zdGFudGluIEtsdWJuaWNoa2luLDwvZGl2PjxkaXY+bGVhZCBmaXJtd2FyZSBlbmdpbmVl
ciw8L2Rpdj48ZGl2PnNlcnZlciBoYXJkd2FyZSBSJmFtcDtEIGdyb3VwLDwvZGl2PjxkaXY+WWFu
ZGV4IE1vc2NvdyBvZmZpY2UuPC9kaXY+PGRpdj50ZWw6ICs3LTkwMy01MTAtMzMtMzM8L2Rpdj48
ZGl2PsKgPC9kaXY+
