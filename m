Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6872A8221
	for <lists+openbmc@lfdr.de>; Thu,  5 Nov 2020 16:23:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRnNp3qf0zDqKJ
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 02:23:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yandex-team.ru (client-ip=5.45.199.163;
 helo=forwardcorp1j.mail.yandex.net; envelope-from=kitsok@yandex-team.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=yandex-team.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.a=rsa-sha256 header.s=default header.b=OxyoxNlV; 
 dkim-atps=neutral
Received: from forwardcorp1j.mail.yandex.net (forwardcorp1j.mail.yandex.net
 [5.45.199.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRmzT71t2zDqwj
 for <openbmc@lists.ozlabs.org>; Fri,  6 Nov 2020 02:05:19 +1100 (AEDT)
Received: from sas1-5717c3cea310.qloud-c.yandex.net
 (sas1-5717c3cea310.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:3616:0:640:5717:c3ce])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 60CB72E1595
 for <openbmc@lists.ozlabs.org>; Thu,  5 Nov 2020 18:05:11 +0300 (MSK)
Received: from localhost (localhost [::1])
 by sas1-5717c3cea310.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 6xVDZZf8V9-5BwWbUEA; Thu, 05 Nov 2020 18:05:11 +0300
To: undisclosed-recipients:;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1604588711; bh=XpFRbXEOOi9Y3e2pipoO0Ph5KOK8e/elr6lJ1IfLe4I=;
 h=Cc:Subject:Date:References:In-Reply-To:From:Message-Id;
 b=OxyoxNlVWiTXvEy4dy2VBwgGGfuVDyw1UBFXJ/3Ivzkej+laCYUmmZbQHgVhbeaT6
 6iqnazX0MPpXo9BzzQV4PSwTw+TagX55JKb5HXu71wCRY5T/DySKPyRhwMQuH5+dnU
 VIoDU5BWaz0gAz8l+vAJoNJvw/1wTO113QxCdt0c=
Authentication-Results: sas1-5717c3cea310.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000049860
X-Yandex-Avir: 1
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net [2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by sas1-c3eab8bf7b15.qloud-c.yandex.net with LMTP id YdCRzAqBcK-R0S4poUV
 for <kitsok@yandex-team.ru>; Thu, 05 Nov 2020 18:05:01 +0300
Received: by vla5-c30c59847b9e.qloud-c.yandex.net with HTTP;
 Thu, 05 Nov 2020 18:05:00 +0300
From: Konstantin Klubnichkin <kitsok@yandex-team.ru>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
In-Reply-To: <CAD+gp9Dm_u=z=SqdsJb1OTCx26xA5h=26URUpOMe+Scq23H4cQ@mail.gmail.com>
References: <CAD+gp9B6Y8-hCP+hzT3Bh8xkg-mcFj_EnQ-FDz6Ax_tqAtJnnw@mail.gmail.com>
 <405411604558303@mail.yandex-team.ru>
 <CAD+gp9Dm_u=z=SqdsJb1OTCx26xA5h=26URUpOMe+Scq23H4cQ@mail.gmail.com>
Subject: Re: Error:"Failed to find the pwm0_gpio40 line"
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Thu, 05 Nov 2020 18:05:10 +0300
Message-Id: <192131604587705@mail.yandex-team.ru>
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

PGRpdj4tINCy0YHQtTwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PkhlbGxvLCBLaGFkZXIhPC9kaXY+
PGRpdj7CoDwvZGl2PjxkaXY+WW91J3ZlIG1pc3VuZGVyc3Rvb2QgdGhlIHJvbGUgb2YgeDg2LXBv
d2VyLWNvbnRyb2wuIEJhc2ljYWxseSBpdCBpcyBmb3IgcG93ZXIgY29udHJvbCBvbmx5LCBpdCBs
aXN0ZW5zIG9uIERCdXMgZm9yIGNvbW1hbmRzIGxpa2UgIlBvd2VyIG9uIGhvc3QiLCAiUG93ZXIg
b2ZmIGhvc3QiIGFuZCBjb250cm9scyB0aGUgY29ycmVzcG9uZGluZyBHUElPIGxpbmVzIHRodXMg
dHVybmluZyBwb3dlciBzdXBwbHkgZm9yIGhvc3QgYW5kICJwcmVzc2luZyIgcmVzZXQgYnV0dG9u
IChyZXNldCBsaW5lIHRvIENQVSBvciBQQ0gpLjwvZGl2PjxkaXY+QWxzbyBpdCBtb25pdG9ycyBw
aHlzaWNhbCBidXR0b25zIGxpa2UgcG93ZXIgYnV0dG9ucyBhbmQgZmVlZHMgaXRzZWxmIChhbmQg
YWxsIG90aGVyIHJlY2VpdmVycyBvZiB0aGlzIHN0YXR1cykgd2l0aCBjb3JyZXNwb25kaW5nIHJl
cXVlc3RzLjwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PlRoZSAiaW52ZW50b3J5IiBkYXRhIGluIENo
YXNzaXMgYnJhbmNoIG9mIFJlZEZpc2ggQVBJIGlzIHBvcHVsYXRlZCBmcm9tIGRpZmZlcmVudCBz
ZXJ2aWNlcy48L2Rpdj48ZGl2PkZpcnN0IG9mIGFsbCBpdCdzIEVudGl0eSBtYW5hZ2VyIHdpdGgg
aXRzJyBKU09OIGNvbmZpZ3VyYXRpb24gZmlsZSAtIHNlbnNvcnMgZGF0YSBhcHBlYXJzIHRoZXJl
IGZyb20gdGhpcyBzZXJ2aWNlIGFuZCBmcm9tIHNlbnNvciBwb2xsaW5nIHNlcnZpY2VzIGl0c2Vs
ZiAodGFrZSBhIGxvb2sgYXQgZGJ1cy1zZW5zb3JzIHBhY2thZ2UpLjwvZGl2PjxkaXY+U29tZSBk
YXRhIGxpa2UgQ1BVIGFuZCBtZW1vcnkgZGV2aWNlcyAoRElNTSkgaW5mb3JtYXRpb24gY29tZXMg
ZnJvbSBzbWJpb3MtbWRydjIgdGhhdCBpbiB0dXJuIHJlYWRzIGRhdGEgZnJvbSBTTUJJT1MgdGFi
bGVzICh0aGF0IGluIHR1cm4gY29waWVkIGJ5IEJJT1MgZHVyaW5nIFBPU1Qgc3RhZ2UgdG8gVkdB
IGFkYXB0ZXIgbWVtb3J5IHNoYXJlZCBiZXR3ZWVuIEJNQyBhbmQgaG9zdCkuPC9kaXY+PGRpdj5D
aGFzc2lzIHNlcmlhbCwgcGFydCBudW1iZXJzIGFuZCBzbyBvbiBhcmUgZmV0Y2hlZCBmcm9tIEZS
VSBFRVBST00gZGV2aWNlIHRoYXQgaXMgcHJvY2Vzc2VkIGJ5IGZydS1kZXZpY2UgY29tcG9uZW50
ICh4eXoub3BlbmJtY19wcm9qZWN0LkZydURldmljZSBzeXN0ZW1kIHNlcnZpY2UpLjwvZGl2Pjxk
aXY+wqA8L2Rpdj48ZGl2PkkgcHJvcG9zZSB0byBzdGFydCBmcm9tIGZpbGxpbmcgRlJVIGRldmlj
ZSAoRUVQUk9NIGRldmljZSB0aGF0IGlzIGZvdW5kIGF1dG9tYXRpY2FsbHkgYnkgZnJ1LWRldmlj
ZSkgd2l0aCB2YWxpZCBkYXRhLCBmb3JtYXQgaXMgZGVzY3JpYmVkIGluIHN0YW5kYXJkLCBqdXN0
IHNlYXJjaCBmb3IgdGhpcy48L2Rpdj48ZGl2PlRoZW4gbWFrZSBzaW1wbGUgSlNPTiBmaWxlIGZv
ciBFbnRpdHkgbWFuYWdlciAodGhlcmUgaXMgYSBtYW51YWwgaGVyZTogaHR0cHM6Ly9naXRodWIu
Y29tL29wZW5ibWMvZW50aXR5LW1hbmFnZXIvYmxvYi9tYXN0ZXIvZG9jcy9teV9maXJzdF9zZW5z
b3JzLm1kKSw8YnIgLz5UaGVuIGRpZyBpbnRvIFNNQklPUyAtIGl0IHdpbGwgdGFrZSBzb21lIGVm
Zm9ydHMgdG8gaW1wbGVtZW50IEtDUyBpbnRlcmZhY2UgYmV0d2VlbiBCTUMgYW5kIGhvc3QgKGtj
c2JyaWRnZWQgaXMgZG9pbmcgdGhpcyBqb2IpLjwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PkRvbid0
IGhlc2l0YXRlIHRvIGFzaywgT3BlbkJNQyBsb29rcyBjb21wbGV4IGF0IHRoZSBiZWdpbm5pbmcg
YnV0IGFjdHVhbGx5IGl0J3MgcXVpdGUgc2ltcGxlIG9uY2UgeW91J3ZlIHVuZGVyc3Rvb2QgdGhl
IHJvbGVzIG9mIGRpZmZlcmVudCBwYXJ0cyBhbmQgdGhlaXIgY29tbXVuaWNhdGlvbnMuPC9kaXY+
PGRpdj7CoDwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PjA1LjExLjIwMjAsIDE1OjMwLCAia2hhZGVy
IGJhc2hhIHNoYWlrIiAmbHQ7c2hhaWtraGFkZXJiYXNoYTYwMUBnbWFpbC5jb20mZ3Q7OjwvZGl2
PjxibG9ja3F1b3RlPjxkaXY+VGhhbmtzIGFsb3QgS29uc3RhbnRpbiBmb3IgdGhlIGluZm9ybWF0
aW9uLjxkaXY+wqA8L2Rpdj48ZGl2PjxkaXY+V2Ugd2FudGVkIHRvIHZlcmlmeSBpZiB0aGUgQ2hh
c3NpcyBpbmZvIGlzIHBvcHVsYXRlZCBwcm9wZXJseSwgKHJlZGZpc2gvdjEvQ2hhc3NpcykuV2Ug
bmVlZCB0byBnZXQgdGhlIENoYXNzaXMgaW5mbyBhbmQgd2UgYXJlIHVzaW5nIGN1cmwgY29tbWFu
ZCBvbiBwYXRoLCAvcmVkZmlkaC92MS9DaGFzc2lzLkJ1dCBubyBpbmZvcm1hdGlvbiBpcyBiZWlu
ZyBwb3B1bGF0ZWQuwqA8L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj5JcyB0aGVyZSBhbnkgd2F5IHRv
IHZlcmlmeSBjaGFzc2lzIGluZm9ybWF0aW9uID88L2Rpdj48L2Rpdj48ZGl2PsKgPC9kaXY+PGRp
dj5XZSBoYXZlIHVzZWQgdGhlIHg4Ni1wb3dlci1jb250cm9sIHRvIHBvcHVsYXRlIHRoZSAvcmVk
ZmlzaC92MS9jaGFzc2lzLCBidXQgd2Ugbm8gbHVjayB3aXRoIHRoaXMgdG9vLiBXZSBkaWQgbm90
IHNlZSBhbnkgZGF0YSB0aHJvdWdoIHRoaXMgLjwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PkFueSBz
dWdnZXN0aW9ucyBvciBpbnB1dCBvbiB0aGlzIHdvdWxkIGJlIGFwcHJlY2lhdGVkLjwvZGl2Pjxk
aXY+wqA8L2Rpdj48ZGl2PlRoYW5rcyAmYW1wO8KgUmVnYXJkcyw8L2Rpdj48ZGl2PktoYWRlciBC
IFNoYWlrPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+wqA8L2Rpdj48L2Rpdj7CoDxkaXY+PGRpdj5P
biBUaHUsIDUgTm92IDIwMjAgYXQgMTI6MTQsIEtvbnN0YW50aW4gS2x1Ym5pY2hraW4gJmx0O2tp
dHNva0B5YW5kZXgtdGVhbS5ydSZndDsgd3JvdGU6PC9kaXY+PGJsb2NrcXVvdGU+PGRpdj4tINCy
0YHQtTwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PkhlbGxvITwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2
PlRoaXMgZXJyb3IgbWVhbnMgR1BJTyBsaWJyYXJ5IHVuYWJsZSB0byBmaW5kIGxpbmUgd2l0aCB0
aGlzIG5hbWUuPC9kaXY+PGRpdj5UbyBjaGVjayB5b3UgY2FuPC9kaXY+PGRpdj5jYXQgL3N5cy9r
ZXJuZWwvZGVidWcvZ3BpbyB8IGdyZXAgcHdtMF9ncGlvNDA8L2Rpdj48ZGl2Pm9yPC9kaXY+PGRp
dj5ncGlvaW5mbyB8IGdyZXAgcHdtMF9ncGlvNDA8L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj5UaGUg
bW9zdCBwcm9iYWJseSBjYXVzZSBpcyBtaXNzaW5nIGxpbmUgbmFtZSBpbiBEVFMuPC9kaXY+PGRp
dj5UaGVyZSBtdXN0IGJlIHNvbWV0aGluZyBsaWtlIHRoaXM6PC9kaXY+PGRpdj48ZGl2PiZhbXA7
Z3BpbyB7PCEtLSAtLT48L2Rpdj48ZGl2PnN0YXR1cyA9ICJva2F5Ijs8L2Rpdj48ZGl2PnBpbmN0
cmwtbmFtZXMgPSAicGFzcy10aHJvdWdoIjs8L2Rpdj48ZGl2PnBpbmN0cmwtMCA9ICZsdDsmYW1w
O3BpbmN0cmxfZ3BpZDBfZGVmYXVsdDwvZGl2PjxkaXY+JmFtcDtwaW5jdHJsX2dwaWQyX2RlZmF1
bHQmZ3Q7OzwvZGl2PjxkaXY+Z3Bpby1saW5lLW5hbWVzID08L2Rpdj48ZGl2Pi8qIEEwLUE3ICov
ICJBMCIsICJBMSIsICJBMiIsICJBMyIsICJBNCIsICJBNSIsICJBNiIsICJBNyIsPC9kaXY+PGRp
dj4vKiBCMC1CNyAqLyAiQjAiLCAiQjEiLCAiQjIiLCAiUE9TVF9DT01QTEVURSIsICJCNCIsICJC
NSIsICJQU19QV1JPSyIsICJCNyIsPC9kaXY+PGRpdj4uLi4uLi4uLi4uLi4uLi4uPC9kaXY+PGRp
dj59OzwvZGl2PjwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PkkgZG9uJ3QgaGF2ZSBQSSBvbiBoYW5k
cyBzbyBteSBleGFtcGxlIGlzIGZvciBBU1QyNTAwIFNvQywgYnV0IGFzIGZhciBhcyBJIHJlbWVt
YmVyIHRoZXJlIGFyZSBtYW55IGd1aWRlcyBob3cgdG8gcGF0Y2ggRFRTIGZvciBSYXNwYmVycnku
PC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+MDUuMTEuMjAyMCwgMDk6MDMsICJraGFkZXIgYmFzaGEg
c2hhaWsiICZsdDtzaGFpa2toYWRlcmJhc2hhNjAxQGdtYWlsLmNvbSZndDs6PC9kaXY+PGJsb2Nr
cXVvdGU+PGRpdj5IacKgVGVhbSw8ZGl2PsKgPC9kaXY+PGRpdj48ZGl2PndlIGFyZSB0cnlpbmcg
dG8gY29udHJvbCBvdXIgYm9hcmQgd2l0aCBSUEkgYm1jLndlIGFyZSB0cnlpbmcgdG8gY29udHJv
bCBwb3dlciBvbiwgb2ZmIGFuZCByZXNldMKgPC9kaXY+PC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+
PGRpdj53ZSBjb21waWxlZCB4ODYtcG93ZXItY29udHJvbCB3aXRoIG9wZW5ibWMgYW5kIGNyZWF0
ZSBhIHBhdGNoIGZvciB0aGUgc2FuZSB3aXRoIHRoZSBHUElPIG5hbWUgInB3bTBfZ3BpbzQwIi4g
YW5kIHdoZW4gd2UgYXJlIHRyeSB0byB1c2UgdGhpcy48L2Rpdj48ZGl2PndlIGFyZSBmYWNpbmcg
dGhlIGJlbG93IGVycm9yLjwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PjxkaXY+PGRpdj5yb290QGFr
a3k6fiMgc3lzdGVtY3RsIHN0YXR1cyB4eXoub3BlbmJtY19wcm9qZWN0LkNoYXNzaXMuQ29udHJv
bC5Qb3dlci5zZXJ2aWNlPGJyIC8+4pePIHh5ei5vcGVuYm1jX3Byb2plY3QuQ2hhc3Npcy5Db250
cm9sLlBvd2VyLnNlcnZpY2UgLSBQb3dlciBDb250cm9sPGJyIC8+TG9hZGVkOiBsb2FkZWQgKC9s
aWIvc3lzdGVtZC9zeXN0ZW0veHl6Lm9wZW5ibWNfcHJvamVjdC5DaGFzc2lzLkNvbnRyb2wuUG93
ZXIuc2VydmljZTsgZW5hYmxlZDsgdmVuZG9yIHByZXNldDogZW5hYmxlZCk8YnIgLz5BY3RpdmU6
IGZhaWxlZCAoUmVzdWx0OiBleGl0LWNvZGUpIHNpbmNlIFRodSAxOTcwLTAxLTAxIDAwOjAwOjEz
IFVUQzsgMzNzIGFnbzxiciAvPlByb2Nlc3M6IDMxMCBFeGVjU3RhcnQ9L3Vzci9iaW4vcG93ZXIt
Y29udHJvbCAoY29kZT1leGl0ZWQsIHN0YXR1cz0yNTUvRVhDRVBUSU9OKTxiciAvPk1haW4gUElE
OiAzMTAgKGNvZGU9ZXhpdGVkLCBzdGF0dXM9MjU1L0VYQ0VQVElPTik8L2Rpdj48ZGl2PjxkaXY+
wqA8L2Rpdj48ZGl2PjxkaXY+SmFuIDAxIDAwOjAwOjEzIGFra3kgc3lzdGVtZFsxXTogeHl6Lm9w
ZW5ibWNfcHJvamVjdC5DaGFzc2lzLkNvbnRyb2wuUG93ZXIuc2VydmljZTogU2NoZWR1bGVkIHJl
c3RhcnQgam9iLCByZXN0YXJ0IGNvdW50ZXIgaXMgYXQgMi48YnIgLz5KYW4gMDEgMDA6MDA6MTMg
YWtreSBzeXN0ZW1kWzFdOiBTdG9wcGVkIFBvd2VyIENvbnRyb2wuPGJyIC8+SmFuIDAxIDAwOjAw
OjEzIGFra3kgc3lzdGVtZFsxXTogeHl6Lm9wZW5ibWNfcHJvamVjdC5DaGFzc2lzLkNvbnRyb2wu
UG93ZXIuc2VydmljZTogU3RhcnQgcmVxdWVzdCByZXBlYXRlZCB0b28gcXVpY2tseS48YnIgLz5K
YW4gMDEgMDA6MDA6MTMgYWtreSBzeXN0ZW1kWzFdOiB4eXoub3BlbmJtY19wcm9qZWN0LkNoYXNz
aXMuQ29udHJvbC5Qb3dlci5zZXJ2aWNlOiBGYWlsZWQgd2l0aCByZXN1bHQgJ2V4aXQtY29kZScu
PGJyIC8+SmFuIDAxIDAwOjAwOjEzIGFra3kgc3lzdGVtZFsxXTogRmFpbGVkIHRvIHN0YXJ0IFBv
d2VyIENvbnRyb2wuPGJyIC8+cm9vdEBha2t5On4jIC91c3IvYmluL3Bvd2VyLWNvbnRyb2wgLWg8
YnIgLz5TdGFydCBDaGFzc2lzIHBvd2VyIGNvbnRyb2wgc2VydmljZS4uLjxiciAvPkZhaWxlZCB0
byBmaW5kIHRoZSBwd20wX2dwaW80MCBsaW5lPC9kaXY+PC9kaXY+PC9kaXY+PGRpdj7CoDwvZGl2
PjxkaXY+Q291bGQgc29tZW9uZSBoZWxwIG1lIGhvdyB0byBmaXggdGhpcyBvciBzb21lIHBvaW50
ZXJzIHJlZ2FyZGluZyB0aGlzIGVycm9yLjwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PkFsc28gaXMg
cGh5c2NpYWzCoGNvbm5lY3Rpb24gYmV0d2VlbiB0aGUgYm1jIGFuZCB0aGUgc2VydmVyIGlzIG5l
ZWRlZCBvciB3ZSBjYW4gdGVzdCB0aGlzIHRocm91Z2ggc29tZW90aGVywqB3YXkuPC9kaXY+PGRp
dj7CoDwvZGl2PjxkaXY+VGhhbmtzICZhbXA7IFJlZ2FyZHMsPC9kaXY+PGRpdj5LaGFkZXIgQiBT
aGFpazwvZGl2PjxkaXY+wqA8L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Jsb2NrcXVv
dGU+PGRpdj7CoDwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2Pi0twqA8L2Rpdj48ZGl2PkJlc3QgcmVn
YXJkcyw8L2Rpdj48ZGl2PktvbnN0YW50aW4gS2x1Ym5pY2hraW4sPC9kaXY+PGRpdj5sZWFkIGZp
cm13YXJlIGVuZ2luZWVyLDwvZGl2PjxkaXY+c2VydmVyIGhhcmR3YXJlIFImYW1wO0QgZ3JvdXAs
PC9kaXY+PGRpdj5ZYW5kZXggTW9zY293IG9mZmljZS48L2Rpdj48ZGl2PnRlbDogKzctOTAzLTUx
MC0zMy0zMzwvZGl2PjxkaXY+wqA8L2Rpdj48L2Jsb2NrcXVvdGU+PC9kaXY+PC9ibG9ja3F1b3Rl
PjxkaXY+wqA8L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj48ZGl2Pi0twqA8L2Rpdj48ZGl2PkJlc3Qg
cmVnYXJkcyw8L2Rpdj48ZGl2PktvbnN0YW50aW4gS2x1Ym5pY2hraW4sPC9kaXY+PGRpdj5sZWFk
IGZpcm13YXJlIGVuZ2luZWVyLDwvZGl2PjxkaXY+c2VydmVyIGhhcmR3YXJlIFImYW1wO0QgZ3Jv
dXAsPC9kaXY+PGRpdj5ZYW5kZXggTW9zY293IG9mZmljZS48L2Rpdj48ZGl2PnRlbDogKzctOTAz
LTUxMC0zMy0zMzwvZGl2PjwvZGl2PjxkaXY+wqA8L2Rpdj4=
