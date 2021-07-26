Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DEF3D5BD8
	for <lists+openbmc@lfdr.de>; Mon, 26 Jul 2021 16:38:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYMx60HMDz309r
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 00:38:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru header.a=rsa-sha256 header.s=default header.b=FOQa1Wt2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yandex-team.ru (client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 helo=forwardcorp1p.mail.yandex.net; envelope-from=kitsok@yandex-team.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.a=rsa-sha256 header.s=default header.b=FOQa1Wt2; 
 dkim-atps=neutral
X-Greylist: delayed 80 seconds by postgrey-1.36 at boromir;
 Tue, 27 Jul 2021 00:38:20 AEST
Received: from forwardcorp1p.mail.yandex.net (forwardcorp1p.mail.yandex.net
 [IPv6:2a02:6b8:0:1472:2741:0:8b6:217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYMwr5Gvrz304G
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jul 2021 00:38:20 +1000 (AEST)
Received: from sas1-6b1512233ef6.qloud-c.yandex.net
 (sas1-6b1512233ef6.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:44af:0:640:6b15:1223])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 348852E0C04
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jul 2021 17:36:52 +0300 (MSK)
Received: from mail.yandex-team.ru (mail.yandex-team.ru
 [2a02:6b8:0:51e:4cbd:d4b5:e19e:2d62])
 by sas1-6b1512233ef6.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id
 kafxM20x0Sw1-aqx0bHbR; Mon, 26 Jul 2021 17:36:52 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1627310212; bh=HW6dLRovj9OPEIRn07a13z5wgyZg3U4hLhdhbhs7BBg=;
 h=Subject:In-Reply-To:Date:References:To:From:Message-Id;
 b=FOQa1Wt2K5+on/rgXveS+Y/MYNstH5VX8L6vHfBrxeiFTqFYX5sOXid9HRsmwRyP1
 XVIK+fns64sgs/6dsdKKQCB/L6LrEMqUxIArHq5okGGFYSSgOdZvAzYewVxuxYGLgc
 ArkXVu1gDmX1tsC1N6f8zirxUU0gYH7YLk7jCShY=
Authentication-Results: sas1-6b1512233ef6.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000049860
X-Yandex-Avir: 1
Received: from vla1-36b7415cbc1b.qloud-c.yandex.net
 (vla1-36b7415cbc1b.qloud-c.yandex.net [2a02:6b8:c0d:3192:0:640:36b7:415c])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id
 Xafbm30xgW21-9v7p4bLz
 for <kitsok@yandex-team.ru>; Mon, 26 Jul 2021 17:36:42 +0300
Received: by vla1-36b7415cbc1b.qloud-c.yandex.net with HTTP;
 Mon, 26 Jul 2021 17:36:41 +0300
From: Konstantin Klubnichkin <kitsok@yandex-team.ru>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
In-Reply-To: <CAE33tLHvjuwFwCsSdohvYPHgs-f-8sDWMsNdAhzgQbs3=o7_tQ@mail.gmail.com>
References: <CAE33tLEsCJtr9VPYj57ZcOe5iWD6282WmrMTr-Hp96Y3rkBzAA@mail.gmail.com>
 <000001d5bc87$f6fe3780$e4faa680$@linux.intel.com>
 <CAE33tLHvjuwFwCsSdohvYPHgs-f-8sDWMsNdAhzgQbs3=o7_tQ@mail.gmail.com>
Subject: Re: Serial Over Lan (SOL) no login prompt on Linux IRQ mode
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Mon, 26 Jul 2021 17:36:51 +0300
Message-Id: <429111627309901@mail.yandex-team.ru>
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

PGRpdj4tINCy0YHQtTwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PkhlbGxvIGFsbCE8L2Rpdj48ZGl2
PsKgPC9kaXY+PGRpdj5JJ3ZlIGFsc28gZmFjZWQgdGhpcyBwcm9ibGVtOiBsb29rcyBsaWtlIElS
USBmcm9tIFZVQVJUIGlzIG5vdCBwYXNzZWQgdG8gaG9zdC48L2Rpdj48ZGl2PkkndmUgYWxzbyB0
cmllZCBTT0wgY29uZmlndXJhdGlvbiB3aXRoIFVBUlQxJmx0Oy0mZ3Q7VUFSVDQgaW4tQVNUMjUw
MCByb3V0aW5nLCBidXQgaXQgZG9lc24ndCB3b3JrIGVpdGhlciwgYW5kIGxvb2tzIGxpa2UgaXQn
cyBzaW1pbGFyIElSUSBpc3N1ZS48L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj5JJ20gZGlnZ2luZyBp
bnRvIEFTVDI1MDAgZGF0YXNoZWV0IGZvciBsYXN0IGNvdXBsZSBvZiBkYXlzIGJ1dCBjYW4ndCBm
aW5kIHdoYXQgbWF5IGNhdXNlIHRoaXMgYmVoYXZpb3IuPC9kaXY+PGRpdj5JZiBzb21lb25lIGZv
dW5kIGhvdyB0byBmaXggdGhpcyAtIHBsZWFzZSBnaXZlIGEgaGludC48L2Rpdj48ZGl2PsKgPC9k
aXY+PGRpdj5UaGFuayB5b3UhPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+MzAuMTIuMjAxOSwgMDg6
MzQsICJBS0FTSCBHIEoiICZsdDtha2FzaGdqOTFAZ21haWwuY29tJmd0Ozo8L2Rpdj48YmxvY2tx
dW90ZT48ZGl2PkkgdHJpZWQgd2l0aCB0aGUgY29uZmlndXJhdGlvbsKgPGRpdj7CoDwvZGl2Pjxk
aXY+PHA+Y2F0IC9ldGMvb2JtYy1jb25zb2xlLmNvbmY8L3A+PHA+YmF1ZCA9IDExNTIwMDwvcD48
cD5sb2NhbC10dHkgPSB0dHlTNDwvcD48cD5sb2NhbC10dHktYmF1ZCA9IDExNTIwMDwvcD48cD7C
oDwvcD48cD5TdGlsbMKgPHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OidhcmlhbCcgLCBzYW5zLXNl
cmlmIj53ZSBhcmUgbm90IGdldHRpbmcgQ2VudE9TIGxvZ2luIHByb21wdCBvbiBTT0wgaW4gSVJR
IG1vZGUuPC9zcGFuPjwvcD48cD7CoDwvcD48cD48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6J2Fy
aWFsJyAsIHNhbnMtc2VyaWYiPldoZXRoZXIgYW55dGhpbmcgaXMgcmVxdWlyZWQgdG8gYmUgZG9u
ZSBpbiBPcGVuQk1DIGZpcm13YXJlL0JJT1MgdG8gZW5hYmxlIGlycSBtb2RlIGZvciBTT0w8L3Nw
YW4+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5Oid0aW1lcycgLCBzZXJpZiI+wqA/PC9zcGFuPsKg
PC9wPjxwPsKgPC9wPjxwPlRoYW5rcyw8L3A+PHA+wqA8L3A+PHA+QWthc2jCoDwvcD48L2Rpdj48
L2Rpdj7CoDxkaXY+PGRpdj5PbiBGcmksIERlYyAyNywgMjAxOSBhdCAxOjAzIFBNIFlvbmcgTGkg
Jmx0OzxhIGhyZWY9Im1haWx0bzp5b25nLmIubGlAbGludXguaW50ZWwuY29tIiByZWw9Im5vb3Bl
bmVyIG5vcmVmZXJyZXIiPnlvbmcuYi5saUBsaW51eC5pbnRlbC5jb208L2E+Jmd0OyB3cm90ZTo8
L2Rpdj48YmxvY2txdW90ZSBzdHlsZT0iYm9yZGVyLWxlZnQtY29sb3I6cmdiKCAyMDQgLCAyMDQg
LCAyMDQgKTtib3JkZXItbGVmdC1zdHlsZTpzb2xpZDtib3JkZXItbGVmdC13aWR0aDoxcHg7bWFy
Z2luOjBweCAwcHggMHB4IDAuOGV4O3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgbGFuZz0iRU4tVVMi
PjxkaXY+PHA+SEkgQWthc2gsPC9wPjxwPsKgPC9wPjxwPkp1c3QgRllJLCB3ZSBhcmUgdXNpbmcg
dGhlIGJlbG93IGNvbmYgZmlsZS4gWW91IGNhbiBmaW5kIG90aGVyIHJlbGF0ZWQgZmlsZXMgZnJv
bSA8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vSW50ZWwtQk1DL29wZW5ibWMvYmxvYi9pbnRl
bC9tZXRhLW9wZW5ibWMtbW9kcy9tZXRhLWFzdDI1MDAvcmVjaXBlcy1waG9zcGhvci9jb25zb2xl
L29ibWMtY29uc29sZS9vYm1jLWNvbnNvbGUuY29uZiIgcmVsPSJub29wZW5lciBub3JlZmVycmVy
IiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL0ludGVsLUJNQy9vcGVuYm1jL2Js
b2IvaW50ZWwvbWV0YS1vcGVuYm1jLW1vZHMvbWV0YS1hc3QyNTAwL3JlY2lwZXMtcGhvc3Bob3Iv
Y29uc29sZS9vYm1jLWNvbnNvbGUvb2JtYy1jb25zb2xlLmNvbmY8L2E+PC9wPjxwPsKgPC9wPjxw
PmNhdCAvZXRjL29ibWMtY29uc29sZS5jb25mPC9wPjxwPmJhdWQgPSAxMTUyMDA8L3A+PHA+bG9j
YWwtdHR5ID0gdHR5UzM8L3A+PHA+bG9jYWwtdHR5LWJhdWQgPSAxMTUyMDA8L3A+PHA+wqA8L3A+
PHA+VGhhbmtzLDwvcD48cD5Zb25nPC9wPjxwPjxzdHJvbmc+RnJvbTo8L3N0cm9uZz4gb3BlbmJt
YyAmbHQ7b3BlbmJtYy1ib3VuY2VzKzxhIGhyZWY9Imh0dHA6Ly95b25nLmIubGkvIiByZWw9Im5v
b3BlbmVyIG5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj55b25nLmIubGk8L2E+PTxhIGhyZWY9
Im1haWx0bzpsaW51eC5pbnRlbC5jb21AbGlzdHMub3psYWJzLm9yZyIgcmVsPSJub29wZW5lciBu
b3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+bGludXguaW50ZWwuY29tQGxpc3RzLm96bGFicy5v
cmc8L2E+Jmd0OyA8c3Ryb25nPk9uIEJlaGFsZiBPZiA8L3N0cm9uZz5BS0FTSCBHIEo8YnIgLz48
c3Ryb25nPlNlbnQ6PC9zdHJvbmc+IEZyaWRheSwgRGVjZW1iZXIgMjcsIDIwMTkgMjo1NCBQTTxi
ciAvPjxzdHJvbmc+VG86PC9zdHJvbmc+IDxhIGhyZWY9Im1haWx0bzpvcGVuYm1jQGxpc3RzLm96
bGFicy5vcmciIHJlbD0ibm9vcGVuZXIgbm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPm9wZW5i
bWNAbGlzdHMub3psYWJzLm9yZzwvYT48YnIgLz48c3Ryb25nPlN1YmplY3Q6PC9zdHJvbmc+IFNl
cmlhbCBPdmVyIExhbiAoU09MKSBubyBsb2dpbiBwcm9tcHQgb24gTGludXggSVJRIG1vZGU8L3A+
PHA+wqA8L3A+PGRpdj48ZGl2PjxwPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTonYXJpYWwnICwg
c2Fucy1zZXJpZjtmb250LXNpemU6MTBwdCI+SGkgYWxsLDwvc3Bhbj48L3A+PC9kaXY+PGRpdj48
cD7CoDwvcD48L2Rpdj48ZGl2PjxwPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTonYXJpYWwnICwg
c2Fucy1zZXJpZjtmb250LXNpemU6MTBwdCI+V2UgYXJlIHVzaW5nIEJNQyBBc3BlZWQgQVNULTI1
MDAgaW4gb3VyIG1vdGhlcmJvYXJkIHdpdGggT3BlbkJNQyBmaXJtd2FyZS4gJ29ibWMtY29uc29s
ZScgaXMgdXNlZCB0byBnZXQgaG9zdCBtZXNzYWdlcyBvdmVyIEJNQy4gb2JtYy1jb25zb2xlLmNv
bmYgbG9va3MgbGlrZTxiciAvPjxiciAvPjxlbT48c3BhbiBzdHlsZT0iY29sb3I6Ymx1ZSI+bHBj
LWFkZHJlc3MgPSAweDNmODxiciAvPnNpcnEgPSA0PGJyIC8+bG9jYWwtdHR5ID0gdHR5UzQ8YnIg
Lz5sb2NhbC10dHktYmF1ZCA9IDExNTIwMDwvc3Bhbj48L2VtPjwvc3Bhbj48L3A+PC9kaXY+PGRp
dj48cD7CoDwvcD48L2Rpdj48ZGl2PjxwPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTonYXJpYWwn
ICwgc2Fucy1zZXJpZjtmb250LXNpemU6MTBwdCI+QklPUyBzZXJpYWwgcmVkaXJlY3Rpb24gaXMg
ZW5hYmxlZCBvdmVyIENPTSBwb3J0IDAgKDxlbT4weDNmOCwgc2lycT00LCBiYXVkcmF0ZT0xMTUy
MDA8L2VtPikgZm9yIHN1cGVyLUlPLjwvc3Bhbj48L3A+PC9kaXY+PGRpdj48cD7CoDwvcD48L2Rp
dj48ZGl2PjxkaXY+PHA+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OidhcmlhbCcgLCBzYW5zLXNl
cmlmO2ZvbnQtc2l6ZToxMHB0Ij53ZSBzZXQgPGVtPi9kZXYvdHR5UzA8L2VtPiBpbiBDZW50T1Mg
dG8gd29yayBpbiBwb2xsaW5nIG1vZGUgYnkgbWFraW5nIGl0cyA8ZW0+aXJxPTA8L2VtPiB1c2lu
ZyB0aGUgZm9sbG93aW5nIGNvbW1hbmQgPC9zcGFuPjwvcD48L2Rpdj48ZGl2PjxwPsKgPC9wPjwv
ZGl2PjxwIHN0eWxlPSJtYXJnaW4tYm90dG9tOjEycHQiPjxzcGFuIHN0eWxlPSJjb2xvcjpibHVl
O2ZvbnQtZmFtaWx5OidhcmlhbCcgLCBzYW5zLXNlcmlmO2ZvbnQtc2l6ZToxMHB0Ij4kIHNldHNl
cmlhbCAvZGV2L3R0eVMwIHVhcnQgMTY1NTBhIGlycSAwIDwvc3Bhbj48YnIgLz48YnIgLz48c3Bh
biBzdHlsZT0iZm9udC1mYW1pbHk6J2FyaWFsJyAsIHNhbnMtc2VyaWY7Zm9udC1zaXplOjEwcHQi
Pk5vdyB3ZSBhcmUgZ2V0dGluZyBDZW50T1MgbG9naW4gcHJvbXB0IG9uIFNPTC4gPC9zcGFuPjwv
cD48ZGl2PjxwPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTonYXJpYWwnICwgc2Fucy1zZXJpZjtm
b250LXNpemU6MTBwdCI+V2hlbiB3ZSBjaGFuZ2UgL2Rldi90dHlTMCBiYWNrIHRvIGludGVycnVw
dCBtb2RlIHdpdGggaXJxPTQsIHdlIGFyZSBub3QgZ2V0dGluZyBsb2dpbiBwcm9tcHQgb24gU09M
Ljwvc3Bhbj48L3A+PC9kaXY+PGRpdj48cD7CoDwvcD48L2Rpdj48ZGl2PjxwPjxzcGFuIHN0eWxl
PSJmb250LWZhbWlseTonYXJpYWwnICwgc2Fucy1zZXJpZjtmb250LXNpemU6MTBwdCI+V2hldGhl
ciBhbnl0aGluZyBpcyByZXF1aXJlZCB0byBiZSBkb25lIGluIE9wZW5CTUMgZmlybXdhcmUvQklP
UyB0byBlbmFibGUgaXJxIG1vZGUgZm9yIFNPTDwvc3Bhbj48c3BhbiBzdHlsZT0iZm9udC1mYW1p
bHk6J3RpbWVzIG5ldyByb21hbicgLCBzZXJpZjtmb250LXNpemU6MTBwdCI+ID88L3NwYW4+PC9w
PjwvZGl2PjxkaXY+PHA+wqA8L3A+PC9kaXY+PGRpdj48cD7CoDwvcD48L2Rpdj48ZGl2PjxwPsKg
PC9wPjwvZGl2PjxkaXY+PHA+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OidhcmlhbCcgLCBzYW5z
LXNlcmlmO2ZvbnQtc2l6ZToxMHB0Ij5UaGFua3MsPC9zcGFuPjwvcD48L2Rpdj48ZGl2PjxwPsKg
PC9wPjwvZGl2PjxkaXY+PHA+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OidhcmlhbCcgLCBzYW5z
LXNlcmlmO2ZvbnQtc2l6ZToxMHB0Ij5Ba2FzaDwvc3Bhbj48L3A+PC9kaXY+PC9kaXY+PC9kaXY+
PC9kaXY+PC9kaXY+PC9ibG9ja3F1b3RlPjwvZGl2PjwvYmxvY2txdW90ZT48ZGl2PsKgPC9kaXY+
PGRpdj7CoDwvZGl2PjxkaXY+LS3CoDwvZGl2PjxkaXY+QmVzdCByZWdhcmRzLDwvZGl2PjxkaXY+
S29uc3RhbnRpbiBLbHVibmljaGtpbiw8L2Rpdj48ZGl2PmxlYWQgZmlybXdhcmUgZW5naW5lZXIs
PC9kaXY+PGRpdj5zZXJ2ZXIgaGFyZHdhcmUgUiZhbXA7RCBncm91cCw8L2Rpdj48ZGl2PllhbmRl
eCBNb3Njb3cgb2ZmaWNlLjwvZGl2PjxkaXY+dGVsOiArNy05MDMtNTEwLTMzLTMzPC9kaXY+PGRp
dj7CoDwvZGl2Pg==
