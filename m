Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 552A8167773
	for <lists+openbmc@lfdr.de>; Fri, 21 Feb 2020 09:43:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48P4jf2bDKzDqnF
	for <lists+openbmc@lfdr.de>; Fri, 21 Feb 2020 19:43:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yandex-team.ru (client-ip=2a02:6b8:0:1a2d::193;
 helo=forwardcorp1o.mail.yandex.net; envelope-from=kitsok@yandex-team.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=yandex-team.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.a=rsa-sha256 header.s=default header.b=vieBBFxm; 
 dkim-atps=neutral
Received: from forwardcorp1o.mail.yandex.net (forwardcorp1o.mail.yandex.net
 [IPv6:2a02:6b8:0:1a2d::193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48P4hQ5MHVzDqlB
 for <openbmc@lists.ozlabs.org>; Fri, 21 Feb 2020 19:42:09 +1100 (AEDT)
Received: from mxbackcorp2j.mail.yandex.net (mxbackcorp2j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::119])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 4DF742E15AE
 for <openbmc@lists.ozlabs.org>; Fri, 21 Feb 2020 11:42:00 +0300 (MSK)
Received: from localhost (localhost [::1])
 by mxbackcorp2j.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 f7aunHjGrV-g0eKbI66; Fri, 21 Feb 2020 11:42:00 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1582274520; bh=XJpsRSnA7W6QOtBLX4q9aO2AD1INON11J6//t5dVNVA=;
 h=Date:Message-Id:Subject:To:From;
 b=vieBBFxmeRUyZYUnhitFfWOC4uU8cgJqMPh8CgiOa8A76c/1oitVD6HSK1tCubCxC
 iGx4c1lSZ4cBLPcVxfg+H7yNKwR3cFNa/zu8x31d1V1mI/6ADEKvtEUi8Sj9n6A+3g
 RR82Ggcqbip6UUBmQBz3FWuGA3ly1Y6tdoeEKgms=
Authentication-Results: mxbackcorp2j.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000049860
X-Yandex-Avir: 1
Received: from mxbackcorp1o.mail.yandex.net (localhost [::1])
 by mxbackcorp1o.mail.yandex.net with LMTP id aEiphONq7c-5WXtaC2e
 for <kitsok@yandex-team.ru>; Fri, 21 Feb 2020 11:41:50 +0300
Received: by sas1-1199a7868807.qloud-c.yandex.net with HTTP;
 Fri, 21 Feb 2020 11:41:50 +0300
From: Konstantin Klubnichkin <kitsok@yandex-team.ru>
To: openbmc@lists.ozlabs.org
Subject: AST2500 I2C problem
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Fri, 21 Feb 2020 11:42:00 +0300
Message-Id: <1699551582274510@sas1-1199a7868807.qloud-c.yandex.net>
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

PGRpdj5IZWxsbywgY29sbGVndWVzITwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PkkndmUgZmFjZWQg
YSBwcm9ibGVtIHRoYXQgZG9uJ3Qga25vdyBob3cgdG8gc29sdmUgd2l0aG91dCB0cmlja3MgbGlr
ZSBvdmVybGF5IERUUy48L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj5JIGhhdmUgUENBOTU1NSBkZXZp
Y2Ugb24gSTJDLTExIGJ1cywgaXQncyBkZXNjcmliZWQgaW4gRFRTIGFzIGZvbGxvd3M6PC9kaXY+
PGRpdj49PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PTwvZGl2PjxkaXY+PGRpdj4mYW1wO2kyYzExIHs8IS0tIC0tPjwvZGl2Pjxk
aXY+wqAgwqAgwqAgwqAgwqAgwqAgYnVzLWZyZXF1ZW5jeSA9ICZsdDsxMDAwMDAmZ3Q7OzwvZGl2
PjxkaXY+wqAgwqAgwqAgwqAgwqAgwqAgbXVsdGktbWFzdGVyOzwvZGl2PjxkaXY+wqAgwqAgwqAg
wqAgwqAgwqAgI3JldHJpZXMgPSAmbHQ7NSZndDs7PC9kaXY+PGRpdj7CoCDCoCDCoCDCoCDCoCDC
oCBhc3BlZWQsZG1hLWJ1Zi1zaXplID0gJmx0OzQwOTUmZ3Q7OzwvZGl2PjxkaXY+wqAgwqAgwqAg
wqAgwqAgwqAgYXNwZWVkLGh3LXRpbWVvdXQtbXMgPSAmbHQ7MzAwJmd0Ozs8L2Rpdj48ZGl2PsKg
IMKgIMKgIMKgIMKgIMKgIHN0YXR1cyA9ICJva2F5Ijs8L2Rpdj48ZGl2PjxkaXY+wqAgwqAgwqAg
wqAgwqAgwqAgZ3Bpb19leHA6IHBjYTk1NTVAMjAgezwhLS0gLS0+PC9kaXY+PGRpdj7CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAibnhwLHBjYTk1
NTUiOzwvZGl2PjxkaXY+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBy
ZWcgPSAmbHQ7MHgyMCZndDs7PC9kaXY+PGRpdj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCNncGlvLWNlbGxzID0gJmx0OzImZ3Q7OzwvZGl2PjxkaXY+wqAgwqAgwqAg
wqAgwqAgwqAgwqB9OzwvZGl2PjxkaXY+fTs8L2Rpdj48L2Rpdj49PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PTwvZGl2PjxkaXY+
wqA8L2Rpdj48ZGl2PlRoZSBwcm9ibGVtIGlzIC0gdGhlIGRldmljZSBwcm9iaW5nIG9yZGVyIGlz
IGJyb2tlbiBzb21laG93LCBzbyBQQ0E5NTU1IGNhbid0IGJlIHByb2JlZCBzdWNjZXNzZnVsbHkg
ZHVyaW5nIGJvb3QgdGltZTo8L2Rpdj48ZGl2Pj09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PC9kaXY+PGRpdj48ZGl2PlsgMS45
ODEzMjFdIGkyYyAvZGV2IGVudHJpZXMgZHJpdmVyPC9kaXY+PGRpdj5bIDEuOTg3MTEyXSBhc3Bl
ZWQtaTJjLWJ1cyAxZTc4YTA0MC5pMmMtYnVzOiBpMmMgYnVzIDAgcmVnaXN0ZXJlZCAoZG1hIG1v
ZGUpLCBpcnEgMzU8L2Rpdj48ZGl2PlsgMS45OTY4NDddIGFzcGVlZC1pMmMtYnVzIDFlNzhhMDgw
LmkyYy1idXM6IGkyYyBidXMgMSByZWdpc3RlcmVkIChkbWEgbW9kZSksIGlycSAzNjwvZGl2Pjxk
aXY+WyAyLjAwNjc0M10gYXNwZWVkLWkyYy1idXMgMWU3OGEwYzAuaTJjLWJ1czogaTJjIGJ1cyAy
IHJlZ2lzdGVyZWQgKGRtYSBtb2RlKSwgaXJxIDM3PC9kaXY+PGRpdj5bIDIuMDE2Njg5XSBhc3Bl
ZWQtaTJjLWJ1cyAxZTc4YTEwMC5pMmMtYnVzOiBpMmMgYnVzIDMgcmVnaXN0ZXJlZCAoZG1hIG1v
ZGUpLCBpcnEgMzg8L2Rpdj48ZGl2PlsgMi4wMjczMDhdIGFzcGVlZC1pMmMtYnVzIDFlNzhhMTQw
LmkyYy1idXM6IGkyYyBidXMgNCByZWdpc3RlcmVkIChkbWEgbW9kZSksIGlycSAzOTwvZGl2Pjxk
aXY+WyAyLjAzNzE5N10gYXNwZWVkLWkyYy1idXMgMWU3OGExODAuaTJjLWJ1czogaTJjIGJ1cyA1
IHJlZ2lzdGVyZWQgKGRtYSBtb2RlKSwgaXJxIDQwPC9kaXY+PGRpdj5bIDIuMDQ3NDU3XSBhc3Bl
ZWQtaTJjLWJ1cyAxZTc4YTFjMC5pMmMtYnVzOiBpMmMgYnVzIDYgcmVnaXN0ZXJlZCAoZG1hIG1v
ZGUpLCBpcnEgNDE8L2Rpdj48ZGl2PlsgMi4wNTc0MDldIGFzcGVlZC1pMmMtYnVzIDFlNzhhMzAw
LmkyYy1idXM6IGkyYyBidXMgNyByZWdpc3RlcmVkIChkbWEgbW9kZSksIGlycSA0MjwvZGl2Pjxk
aXY+WyAyLjA2NzI1MV0gYXNwZWVkLWkyYy1idXMgMWU3OGEzNDAuaTJjLWJ1czogaTJjIGJ1cyA4
IHJlZ2lzdGVyZWQgKGRtYSBtb2RlKSwgaXJxIDQzPC9kaXY+PGRpdj5bIDMuMTI4Njc5XSBwY2E5
NTN4IDExLTAwMjA6IGZhaWxlZCB3cml0aW5nIHJlZ2lzdGVyPC9kaXY+PGRpdj5bIDMuMTMzODYw
XSBwY2E5NTN4OiBwcm9iZSBvZiAxMS0wMDIwIGZhaWxlZCB3aXRoIGVycm9yIC0xMTA8L2Rpdj48
ZGl2PlsgMy4xMzk4MDFdIGFzcGVlZC1pMmMtYnVzIDFlNzhhNDAwLmkyYy1idXM6IGkyYyBidXMg
MTEgcmVnaXN0ZXJlZCAoZG1hIG1vZGUpLCBpcnEgNDQ8L2Rpdj48ZGl2PlsgMy4xNDk3OTVdIGFz
cGVlZC1pMmMtYnVzIDFlNzhhNDQwLmkyYy1idXM6IGkyYyBidXMgMTIgcmVnaXN0ZXJlZCAoZG1h
IG1vZGUpLCBpcnEgNDU8L2Rpdj48L2Rpdj48ZGl2Pj09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PC9kaXY+PGRpdj7CoDwvZGl2
PjxkaXY+SSB1bmRlcnN0YW5kIHRoYXQgdGltZXN0YW1wIGluIGRtZXNnIGlzIG5vdCBhYnNvbHV0
ZWx5IGFjY3VyYXRlLCBidXQgbG9va3MgbGlrZSB0aGUgZGV2aWNlIGlzIHJlYWxseSBwcm9iZWQg
YmVmb3JlIGJ1cyBpcyByZWFkeS48L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj5JZiBJIGV4Y2x1ZGUg
UENBOTU1NSBmcm9tIERUUyBhbmQgaW5zdGFudGlhdGUgaXQgbWFudWFsbHkgKGVjaG8gcGNhOTU1
NSAweDIwICZndDsgL3N5cy9idXMvaTJjL2RldmljZXMvaTJjLTExL25ld19kZXZpY2UpLCBpdCB3
b3JrcyBmaW5lLjwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PldoYXQgYW0gSSBtaXNzaW5nPzwvZGl2
PjxkaXY+wqA8L2Rpdj48ZGl2PlRoYW5rIHlvdSE8L2Rpdj48ZGl2Pi0twqA8L2Rpdj48ZGl2PkJl
c3QgcmVnYXJkcyw8L2Rpdj48ZGl2PktvbnN0YW50aW4gS2x1Ym5pY2hraW4sPC9kaXY+PGRpdj5s
ZWFkIGZpcm13YXJlIGVuZ2luZWVyLDwvZGl2PjxkaXY+c2VydmVyIGhhcmR3YXJlIFImYW1wO0Qg
Z3JvdXAsPC9kaXY+PGRpdj5ZYW5kZXggTW9zY293IG9mZmljZS48L2Rpdj48ZGl2PnRlbDogKzct
OTAzLTUxMC0zMy0zMzwvZGl2PjxkaXY+wqA8L2Rpdj4=
