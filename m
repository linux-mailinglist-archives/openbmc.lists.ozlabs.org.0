Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 357FA14863D
	for <lists+openbmc@lfdr.de>; Fri, 24 Jan 2020 14:35:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4840Ws4WfLzDqgd
	for <lists+openbmc@lfdr.de>; Sat, 25 Jan 2020 00:35:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yandex-team.ru (client-ip=2a02:6b8:0:1619::183;
 helo=forwardcorp1j.mail.yandex.net; envelope-from=kitsok@yandex-team.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=yandex-team.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.a=rsa-sha256 header.s=default header.b=orXAByW+; 
 dkim-atps=neutral
Received: from forwardcorp1j.mail.yandex.net (forwardcorp1j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4840VM3zKvzDqbx
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jan 2020 00:34:14 +1100 (AEDT)
Received: from mxbackcorp1o.mail.yandex.net (mxbackcorp1o.mail.yandex.net
 [IPv6:2a02:6b8:0:1a2d::301])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 0A8C52E0AFA;
 Fri, 24 Jan 2020 16:34:06 +0300 (MSK)
Received: from localhost (localhost [::1])
 by mxbackcorp1o.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 K6714HPuBQ-Y5YaMjsU; Fri, 24 Jan 2020 16:34:05 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1579872845; bh=huy3410EjNfTJXJs7MngV1nBg9tVrdqq0jXmf0it8DA=;
 h=References:Date:Message-Id:Subject:In-Reply-To:To:From;
 b=orXAByW+RiBklwGwiGVmf4JCUjIYX2eJHN8skAhnHLMFBMZgd6mjCds0r4hpHRcoM
 SJ0n9hS8DJ5KfYS3DCnN2CHMBlHJtNxyQ2p9AUiAHu3JwnTeYeRcTzBHIW972BGcmc
 Yoezi/ptlpkH7oWfja8dvwHPnpJ55QDJCIBRMeAo=
Authentication-Results: mxbackcorp1o.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000049860
Received: by myt4-457577cc370d.qloud-c.yandex.net with HTTP;
 Fri, 24 Jan 2020 16:34:05 +0300
From: Konstantin Klubnichkin <kitsok@yandex-team.ru>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
In-Reply-To: <554421579867510@iva4-6d0ca09d92db.qloud-c.yandex.net>
References: <236301579791580@vla5-c30c59847b9e.qloud-c.yandex.net>
 <81118db3-4259-254f-9e91-0f26e6d84c0d@linux.intel.com>
 <278601579850868@vla1-bfecef18a7a0.qloud-c.yandex.net>
 <554421579867510@iva4-6d0ca09d92db.qloud-c.yandex.net>
Subject: Re: ikvm on AST2500
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Fri, 24 Jan 2020 16:34:05 +0300
Message-Id: <2311579872845@myt4-457577cc370d.qloud-c.yandex.net>
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

PGRpdj5Tb3JyeSBmb3Igc3BhbW1pbmcsIGJ1dCBtYXkgYmUgbXkgZXhwZXJpZW5jZSB3aWxsIGhl
bHAgc29tZWJvZHkuPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+SSd2ZSBmaW5hbGx5IGdvdCBhbiBp
bWFnZSBib3RoIGluIHZuY3ZpZXdlciBhbmQgd2ViIGludGVyZmFjZSBhZnRlciBzdGFydGluZyBp
a3ZtIHdpdGhvdXQgLXAgYW5kIC1rIHBhcmFtZXRlcnMuPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+
MjQuMDEuMjAyMCwgMTU6MjksICJLb25zdGFudGluIEtsdWJuaWNoa2luIiAmbHQ7a2l0c29rQHlh
bmRleC10ZWFtLnJ1Jmd0Ozo8L2Rpdj48YmxvY2txdW90ZT48ZGl2Pk9rYXksIEkndmUgZ290IEtW
TSBpbiB3ZWIgaW50ZXJmYWNlIGFmdGVyIGZvbGxvd2luZyBwYXRjaDo8L2Rpdj48ZGl2Pj09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PTwvZGl2PjxkaXY+PGRpdj5Gcm9tIGM0ZmVjM2M3NzY3ODMxOGE1NGJiNzIxNjMzZGQ4
MmQyNmFjODAyMTcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxPC9kaXY+PGRpdj5Gcm9tOiBLb25z
dGFudGluIEtsdWJuaWNoa2luICZsdDs8YSBocmVmPSJtYWlsdG86a2l0c29rQHlhbmRleC10ZWFt
LnJ1Ij5raXRzb2tAeWFuZGV4LXRlYW0ucnU8L2E+Jmd0OzwvZGl2PjxkaXY+RGF0ZTogRnJpLCAy
NCBKYW4gMjAyMCAxMjoxNTozOSArMDMwMDwvZGl2PjxkaXY+U3ViamVjdDogW1BBVENIIDEvMV0g
Q29ubmVjdCB0byAxMjcuMC4wLjEgaW5zdGVhZCBvZiA6OjE8L2Rpdj48ZGl2PsKgPC9kaXY+PGRp
dj4tLS08L2Rpdj48ZGl2PmluY2x1ZGUva3ZtX3dlYnNvY2tldC5ocHAgfCAyICstPC9kaXY+PGRp
dj4xIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSk8L2Rpdj48ZGl2
PsKgPC9kaXY+PGRpdj5kaWZmIC0tZ2l0IGEvaW5jbHVkZS9rdm1fd2Vic29ja2V0LmhwcCBiL2lu
Y2x1ZGUva3ZtX3dlYnNvY2tldC5ocHA8L2Rpdj48ZGl2PmluZGV4IDMwNmM2ODQuLmVkN2M4Y2Yg
MTAwNjQ0PC9kaXY+PGRpdj4tLS0gYS9pbmNsdWRlL2t2bV93ZWJzb2NrZXQuaHBwPC9kaXY+PGRp
dj4rKysgYi9pbmNsdWRlL2t2bV93ZWJzb2NrZXQuaHBwPC9kaXY+PGRpdj5AQCAtMjEsNyArMjEs
NyBAQCBjbGFzcyBLdm1TZXNzaW9uPC9kaXY+PGRpdj5jb25uKGNvbm4pLCBob3N0U29ja2V0KGNv
bm4uZ2V0X2lvX2NvbnRleHQoKSksIGRvaW5nV3JpdGUoZmFsc2UpPC9kaXY+PGRpdj57PCEtLSAt
LT48L2Rpdj48ZGl2PmJvb3N0Ojphc2lvOjppcDo6dGNwOjplbmRwb2ludCBlbmRwb2ludCg8L2Rp
dj48ZGl2Pi0gYm9vc3Q6OmFzaW86OmlwOjptYWtlX2FkZHJlc3MoIjo6MSIpLCA1OTAwKTs8L2Rp
dj48ZGl2PisgYm9vc3Q6OmFzaW86OmlwOjptYWtlX2FkZHJlc3MoIjEyNy4wLjAuMSIpLCA1OTAw
KTs8L2Rpdj48ZGl2Pmhvc3RTb2NrZXQuYXN5bmNfY29ubmVjdCg8L2Rpdj48ZGl2PmVuZHBvaW50
LCBbdGhpcywgJmFtcDtjb25uXShjb25zdCBib29zdDo6c3lzdGVtOjplcnJvcl9jb2RlJmFtcDsg
ZWMpIHs8IS0tIC0tPjwvZGl2PjxkaXY+aWYgKGVjKTwvZGl2PjxkaXY+LS08L2Rpdj48ZGl2PjEu
OS4xPC9kaXY+PC9kaXY+PGRpdj49PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT08L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj5B
Y2NvcmRpbmcgdG8gbmV0c3RhdCAtYW5wLCBvYm1jLWlrdm0gcmVhbGx5IGRvZXNuJ3QgbGlzdGVu
IG9uIElQdjYgYWRkcmVzczo8L2Rpdj48ZGl2PnRjcCA3IDAgMTI3LjAuMC4xOjU5MDAgMC4wLjAu
MDoqIExJU1RFTiAyNzIvb2JtYy1pa3ZtPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+QnV0IHN0aWxs
IHRoZXJlIGlzIGEgYmxhY2sgc2NyZWVuLjwvZGl2PjxkaXY+V2lsbCB0cnkgdG8gZGVidWcgb2Jt
Yy1pa3ZtPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+VGhhbmsgeW91ITwvZGl2PjxkaXY+MjQuMDEu
MjAyMCwgMTA6MjgsICJLb25zdGFudGluIEtsdWJuaWNoa2luIiAmbHQ7PGEgaHJlZj0ibWFpbHRv
OmtpdHNva0B5YW5kZXgtdGVhbS5ydSI+a2l0c29rQHlhbmRleC10ZWFtLnJ1PC9hPiZndDs6PC9k
aXY+PGJsb2NrcXVvdGU+PGRpdj5IZWxsbywgSmFlITwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2Pk5v
IGx1Y2sgd2l0aCBUaWdodFZOQy48L2Rpdj48ZGl2PkkndmUgc3RhcnRlZCB0Y3BkdW1wIC1pIGxv
IHBvcnQgNTkwMCBvbiBteSBQQyBhbmQgZm91bmQgdGhhdCB0aGVyZSBhcmUgc29tZSBwYWNrZXRz
IGR1cmluZyBmaXJzdCBWTkMgd2luZG93IGRyYXcsIGJ1dCB0aGVuIHRoZXJlIGlzIG5vIHRyYWZm
aWMgZXZlbiB3aGVuIHRoZSBpbWFnZSBpcyBjaGFuZ2luZyBvbiB0aGUgaG9zdHMnIHNjcmVlbi48
L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj5ibWN3ZWIgc2hvd3Mgbm90aGluZyBhdCBhbGwgb24gS1ZN
IHBhZ2UsIHdpbGwgdHJ5IHRvIHVuZGVyc3RhbmQgd2h5LjwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2
PlRoYW5rIHlvdSE8L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj4yMy4wMS4yMDIwLCAyMDoyMiwgIkph
ZSBIeXVuIFlvbyIgJmx0OzxhIGhyZWY9Im1haWx0bzpqYWUuaHl1bi55b29AbGludXguaW50ZWwu
Y29tIj5qYWUuaHl1bi55b29AbGludXguaW50ZWwuY29tPC9hPiZndDs6PC9kaXY+PGJsb2NrcXVv
dGU+PHA+SGVsbG8gS29uc3RhbnRpbiw8L3A+PHA+UGxlYXNlIGdpdmUgaXQgYSB0cnkgYWdhaW4g
dXNpbmcgVGlnaHRWTkMgdmlld2VyLiBpa3ZtIHVzZXMgdGhlIFRpZ2h0PGJyIC8+ZW5jb2Rpbmcg
c28gdmlld2VyIHNob3VsZCBzdXBwb3J0IHRoZSBmb3JtYXQuIE9yLCB5b3UgY2FuIHVzZSBibWN3
ZWI8YnIgLz5pbnN0ZWFkLjxiciAvPjxiciAvPkNoZWVycyw8YnIgLz48YnIgLz5KYWU8YnIgLz48
YnIgLz7CoDwvcD48YmxvY2txdW90ZT7CoFRoYW5rIHlvdSE8YnIgLz7CoC0tPGJyIC8+wqBCZXN0
IHJlZ2FyZHMsPGJyIC8+wqBLb25zdGFudGluIEtsdWJuaWNoa2luLDxiciAvPsKgbGVhZCBmaXJt
d2FyZSBlbmdpbmVlciw8YnIgLz7CoHNlcnZlciBoYXJkd2FyZSBSJmFtcDtEIGdyb3VwLDxiciAv
PsKgWWFuZGV4IE1vc2NvdyBvZmZpY2UuPGJyIC8+wqB0ZWw6ICs3LTkwMy01MTAtMzMtMzM8L2Js
b2NrcXVvdGU+PC9ibG9ja3F1b3RlPjxkaXY+wqA8L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj4tLcKg
PC9kaXY+PGRpdj5CZXN0IHJlZ2FyZHMsPC9kaXY+PGRpdj5Lb25zdGFudGluIEtsdWJuaWNoa2lu
LDwvZGl2PjxkaXY+bGVhZCBmaXJtd2FyZSBlbmdpbmVlciw8L2Rpdj48ZGl2PnNlcnZlciBoYXJk
d2FyZSBSJmFtcDtEIGdyb3VwLDwvZGl2PjxkaXY+WWFuZGV4IE1vc2NvdyBvZmZpY2UuPC9kaXY+
PGRpdj50ZWw6ICs3LTkwMy01MTAtMzMtMzM8L2Rpdj48ZGl2PsKgPC9kaXY+PC9ibG9ja3F1b3Rl
PjxkaXY+wqA8L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj4tLcKgPC9kaXY+PGRpdj5CZXN0IHJlZ2Fy
ZHMsPC9kaXY+PGRpdj5Lb25zdGFudGluIEtsdWJuaWNoa2luLDwvZGl2PjxkaXY+bGVhZCBmaXJt
d2FyZSBlbmdpbmVlciw8L2Rpdj48ZGl2PnNlcnZlciBoYXJkd2FyZSBSJmFtcDtEIGdyb3VwLDwv
ZGl2PjxkaXY+WWFuZGV4IE1vc2NvdyBvZmZpY2UuPC9kaXY+PGRpdj50ZWw6ICs3LTkwMy01MTAt
MzMtMzM8L2Rpdj48ZGl2PsKgPC9kaXY+PC9ibG9ja3F1b3RlPjxkaXY+wqA8L2Rpdj48ZGl2PsKg
PC9kaXY+PGRpdj4tLcKgPC9kaXY+PGRpdj5CZXN0IHJlZ2FyZHMsPC9kaXY+PGRpdj5Lb25zdGFu
dGluIEtsdWJuaWNoa2luLDwvZGl2PjxkaXY+bGVhZCBmaXJtd2FyZSBlbmdpbmVlciw8L2Rpdj48
ZGl2PnNlcnZlciBoYXJkd2FyZSBSJmFtcDtEIGdyb3VwLDwvZGl2PjxkaXY+WWFuZGV4IE1vc2Nv
dyBvZmZpY2UuPC9kaXY+PGRpdj50ZWw6ICs3LTkwMy01MTAtMzMtMzM8L2Rpdj48ZGl2PsKgPC9k
aXY+
