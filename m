Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16743148526
	for <lists+openbmc@lfdr.de>; Fri, 24 Jan 2020 13:29:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483z3S1KY1zDqbw
	for <lists+openbmc@lfdr.de>; Fri, 24 Jan 2020 23:29:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yandex-team.ru (client-ip=95.108.205.193;
 helo=forwardcorp1o.mail.yandex.net; envelope-from=kitsok@yandex-team.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=yandex-team.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.a=rsa-sha256 header.s=default header.b=sA2ujl0J; 
 dkim-atps=neutral
X-Greylist: delayed 75930 seconds by postgrey-1.36 at bilbo;
 Fri, 24 Jan 2020 23:05:21 AEDT
Received: from forwardcorp1o.mail.yandex.net (forwardcorp1o.mail.yandex.net
 [95.108.205.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483yWj3wHwzDqdZ
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jan 2020 23:05:17 +1100 (AEDT)
Received: from mxbackcorp1o.mail.yandex.net (mxbackcorp1o.mail.yandex.net
 [IPv6:2a02:6b8:0:1a2d::301])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id A4A422E1555;
 Fri, 24 Jan 2020 15:05:10 +0300 (MSK)
Received: from localhost (localhost [::1])
 by mxbackcorp1o.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 BjBuLYN9tE-5AYWNkfr; Fri, 24 Jan 2020 15:05:10 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1579867510; bh=7ziCZkbyPl5AFmd2nxVE8esr67LtNOEbewcW9gcBFyI=;
 h=References:Date:Message-Id:Subject:In-Reply-To:To:From;
 b=sA2ujl0Julov1SuM8E0hzrOaoiUMbfpgqiWqNVEnZydgtpQGCLPrEalJPDBgPdg+P
 dLVIHc3TzHMusC+PeQvbpGN9Syy2XW5TZxw6gCghm2mWhu7ThQrzdeUABKvDhfSUVF
 szXzmHiQfU6gzH3XBx1gt10eN2nNRflHHxvfQVBQ=
Authentication-Results: mxbackcorp1o.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000049860
Received: by iva4-6d0ca09d92db.qloud-c.yandex.net with HTTP;
 Fri, 24 Jan 2020 15:05:10 +0300
From: Konstantin Klubnichkin <kitsok@yandex-team.ru>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
In-Reply-To: <278601579850868@vla1-bfecef18a7a0.qloud-c.yandex.net>
References: <236301579791580@vla5-c30c59847b9e.qloud-c.yandex.net>
 <81118db3-4259-254f-9e91-0f26e6d84c0d@linux.intel.com>
 <278601579850868@vla1-bfecef18a7a0.qloud-c.yandex.net>
Subject: Re: ikvm on AST2500
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Fri, 24 Jan 2020 15:05:10 +0300
Message-Id: <554421579867510@iva4-6d0ca09d92db.qloud-c.yandex.net>
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

PGRpdj5Pa2F5LCBJJ3ZlIGdvdCBLVk0gaW4gd2ViIGludGVyZmFjZSBhZnRlciBmb2xsb3dpbmcg
cGF0Y2g6PC9kaXY+PGRpdj49PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT08L2Rpdj48ZGl2PjxkaXY+RnJvbSBjNGZlYzNj
Nzc2NzgzMThhNTRiYjcyMTYzM2RkODJkMjZhYzgwMjE3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MTwvZGl2PjxkaXY+RnJvbTogS29uc3RhbnRpbiBLbHVibmljaGtpbiAmbHQ7a2l0c29rQHlhbmRl
eC10ZWFtLnJ1Jmd0OzwvZGl2PjxkaXY+RGF0ZTogRnJpLCAyNCBKYW4gMjAyMCAxMjoxNTozOSAr
MDMwMDwvZGl2PjxkaXY+U3ViamVjdDogW1BBVENIIDEvMV0gQ29ubmVjdCB0byAxMjcuMC4wLjEg
aW5zdGVhZCBvZiA6OjE8L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj4tLS08L2Rpdj48ZGl2PmluY2x1
ZGUva3ZtX3dlYnNvY2tldC5ocHAgfCAyICstPC9kaXY+PGRpdj4xIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSk8L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj5kaWZmIC0t
Z2l0IGEvaW5jbHVkZS9rdm1fd2Vic29ja2V0LmhwcCBiL2luY2x1ZGUva3ZtX3dlYnNvY2tldC5o
cHA8L2Rpdj48ZGl2PmluZGV4IDMwNmM2ODQuLmVkN2M4Y2YgMTAwNjQ0PC9kaXY+PGRpdj4tLS0g
YS9pbmNsdWRlL2t2bV93ZWJzb2NrZXQuaHBwPC9kaXY+PGRpdj4rKysgYi9pbmNsdWRlL2t2bV93
ZWJzb2NrZXQuaHBwPC9kaXY+PGRpdj5AQCAtMjEsNyArMjEsNyBAQCBjbGFzcyBLdm1TZXNzaW9u
PC9kaXY+PGRpdj5jb25uKGNvbm4pLCBob3N0U29ja2V0KGNvbm4uZ2V0X2lvX2NvbnRleHQoKSks
IGRvaW5nV3JpdGUoZmFsc2UpPC9kaXY+PGRpdj57PCEtLSAtLT48L2Rpdj48ZGl2PmJvb3N0Ojph
c2lvOjppcDo6dGNwOjplbmRwb2ludCBlbmRwb2ludCg8L2Rpdj48ZGl2Pi0gYm9vc3Q6OmFzaW86
OmlwOjptYWtlX2FkZHJlc3MoIjo6MSIpLCA1OTAwKTs8L2Rpdj48ZGl2PisgYm9vc3Q6OmFzaW86
OmlwOjptYWtlX2FkZHJlc3MoIjEyNy4wLjAuMSIpLCA1OTAwKTs8L2Rpdj48ZGl2Pmhvc3RTb2Nr
ZXQuYXN5bmNfY29ubmVjdCg8L2Rpdj48ZGl2PmVuZHBvaW50LCBbdGhpcywgJmFtcDtjb25uXShj
b25zdCBib29zdDo6c3lzdGVtOjplcnJvcl9jb2RlJmFtcDsgZWMpIHs8IS0tIC0tPjwvZGl2Pjxk
aXY+aWYgKGVjKTwvZGl2PjxkaXY+LS08L2Rpdj48ZGl2PjEuOS4xPC9kaXY+PC9kaXY+PGRpdj49
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT08L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj5BY2NvcmRpbmcgdG8gbmV0c3RhdCAt
YW5wLCBvYm1jLWlrdm0gcmVhbGx5IGRvZXNuJ3QgbGlzdGVuIG9uIElQdjYgYWRkcmVzczo8L2Rp
dj48ZGl2PnRjcCA3IDAgMTI3LjAuMC4xOjU5MDAgMC4wLjAuMDoqIExJU1RFTiAyNzIvb2JtYy1p
a3ZtPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+QnV0IHN0aWxsIHRoZXJlIGlzIGEgYmxhY2sgc2Ny
ZWVuLjwvZGl2PjxkaXY+V2lsbCB0cnkgdG8gZGVidWcgb2JtYy1pa3ZtPC9kaXY+PGRpdj7CoDwv
ZGl2PjxkaXY+VGhhbmsgeW91ITwvZGl2PjxkaXY+MjQuMDEuMjAyMCwgMTA6MjgsICJLb25zdGFu
dGluIEtsdWJuaWNoa2luIiAmbHQ7a2l0c29rQHlhbmRleC10ZWFtLnJ1Jmd0Ozo8L2Rpdj48Ymxv
Y2txdW90ZT48ZGl2PkhlbGxvLCBKYWUhPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+Tm8gbHVjayB3
aXRoIFRpZ2h0Vk5DLjwvZGl2PjxkaXY+SSd2ZSBzdGFydGVkIHRjcGR1bXAgLWkgbG8gcG9ydCA1
OTAwIG9uIG15IFBDIGFuZCBmb3VuZCB0aGF0IHRoZXJlIGFyZSBzb21lIHBhY2tldHMgZHVyaW5n
IGZpcnN0IFZOQyB3aW5kb3cgZHJhdywgYnV0IHRoZW4gdGhlcmUgaXMgbm8gdHJhZmZpYyBldmVu
IHdoZW4gdGhlIGltYWdlIGlzIGNoYW5naW5nIG9uIHRoZSBob3N0cycgc2NyZWVuLjwvZGl2Pjxk
aXY+wqA8L2Rpdj48ZGl2PmJtY3dlYiBzaG93cyBub3RoaW5nIGF0IGFsbCBvbiBLVk0gcGFnZSwg
d2lsbCB0cnkgdG8gdW5kZXJzdGFuZCB3aHkuPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+VGhhbmsg
eW91ITwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PjIzLjAxLjIwMjAsIDIwOjIyLCAiSmFlIEh5dW4g
WW9vIiAmbHQ7PGEgaHJlZj0ibWFpbHRvOmphZS5oeXVuLnlvb0BsaW51eC5pbnRlbC5jb20iPmph
ZS5oeXVuLnlvb0BsaW51eC5pbnRlbC5jb208L2E+Jmd0Ozo8L2Rpdj48YmxvY2txdW90ZT48cD5I
ZWxsbyBLb25zdGFudGluLDwvcD48cD5QbGVhc2UgZ2l2ZSBpdCBhIHRyeSBhZ2FpbiB1c2luZyBU
aWdodFZOQyB2aWV3ZXIuIGlrdm0gdXNlcyB0aGUgVGlnaHQ8YnIgLz5lbmNvZGluZyBzbyB2aWV3
ZXIgc2hvdWxkIHN1cHBvcnQgdGhlIGZvcm1hdC4gT3IsIHlvdSBjYW4gdXNlIGJtY3dlYjxiciAv
Pmluc3RlYWQuPGJyIC8+PGJyIC8+Q2hlZXJzLDxiciAvPjxiciAvPkphZTxiciAvPjxiciAvPsKg
PC9wPjxibG9ja3F1b3RlPsKgVGhhbmsgeW91ITxiciAvPsKgLS08YnIgLz7CoEJlc3QgcmVnYXJk
cyw8YnIgLz7CoEtvbnN0YW50aW4gS2x1Ym5pY2hraW4sPGJyIC8+wqBsZWFkIGZpcm13YXJlIGVu
Z2luZWVyLDxiciAvPsKgc2VydmVyIGhhcmR3YXJlIFImYW1wO0QgZ3JvdXAsPGJyIC8+wqBZYW5k
ZXggTW9zY293IG9mZmljZS48YnIgLz7CoHRlbDogKzctOTAzLTUxMC0zMy0zMzwvYmxvY2txdW90
ZT48L2Jsb2NrcXVvdGU+PGRpdj7CoDwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2Pi0twqA8L2Rpdj48
ZGl2PkJlc3QgcmVnYXJkcyw8L2Rpdj48ZGl2PktvbnN0YW50aW4gS2x1Ym5pY2hraW4sPC9kaXY+
PGRpdj5sZWFkIGZpcm13YXJlIGVuZ2luZWVyLDwvZGl2PjxkaXY+c2VydmVyIGhhcmR3YXJlIFIm
YW1wO0QgZ3JvdXAsPC9kaXY+PGRpdj5ZYW5kZXggTW9zY293IG9mZmljZS48L2Rpdj48ZGl2PnRl
bDogKzctOTAzLTUxMC0zMy0zMzwvZGl2PjxkaXY+wqA8L2Rpdj48L2Jsb2NrcXVvdGU+PGRpdj7C
oDwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2Pi0twqA8L2Rpdj48ZGl2PkJlc3QgcmVnYXJkcyw8L2Rp
dj48ZGl2PktvbnN0YW50aW4gS2x1Ym5pY2hraW4sPC9kaXY+PGRpdj5sZWFkIGZpcm13YXJlIGVu
Z2luZWVyLDwvZGl2PjxkaXY+c2VydmVyIGhhcmR3YXJlIFImYW1wO0QgZ3JvdXAsPC9kaXY+PGRp
dj5ZYW5kZXggTW9zY293IG9mZmljZS48L2Rpdj48ZGl2PnRlbDogKzctOTAzLTUxMC0zMy0zMzwv
ZGl2PjxkaXY+wqA8L2Rpdj4=
