Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB713146C3E
	for <lists+openbmc@lfdr.de>; Thu, 23 Jan 2020 16:03:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483QWw1zqDzDqYY
	for <lists+openbmc@lfdr.de>; Fri, 24 Jan 2020 02:03:40 +1100 (AEDT)
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
 header.a=rsa-sha256 header.s=default header.b=YjCaIqMD; 
 dkim-atps=neutral
X-Greylist: delayed 72 seconds by postgrey-1.36 at bilbo;
 Fri, 24 Jan 2020 02:01:14 AEDT
Received: from forwardcorp1o.mail.yandex.net (forwardcorp1o.mail.yandex.net
 [IPv6:2a02:6b8:0:1a2d::193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483QT6358fzDqXq
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jan 2020 02:01:14 +1100 (AEDT)
Received: from mxbackcorp2j.mail.yandex.net (mxbackcorp2j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::119])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 0E5762E1559
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jan 2020 17:59:41 +0300 (MSK)
Received: from localhost (localhost [::1])
 by mxbackcorp2j.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 BxTHYF30Yr-xeiG0FoR; Thu, 23 Jan 2020 17:59:41 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1579791581; bh=5ex8LSWU+QRXcoEe9sbf6KfLP+iEdww64Shnzavvztg=;
 h=Message-Id:Date:Subject:To:From;
 b=YjCaIqMDi6FINzOJxitgRJrH+bFDhOJb9I6UdYBPPfxDofIUeMPdZDKTaYYGBtFyM
 fuJ0DzR8WLGxSrANomnVQFRPhhgSIy9Vw+toBgJcuFft21xuWatxfBJRvEXOv/PgBz
 sBLTy2b38ofHL7k2CXZn9jsXULOyUF2IckIHO6hE=
Authentication-Results: mxbackcorp2j.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000049860
Received: by vla5-c30c59847b9e.qloud-c.yandex.net with HTTP;
 Thu, 23 Jan 2020 17:59:40 +0300
From: Konstantin Klubnichkin <kitsok@yandex-team.ru>
To: openbmc@lists.ozlabs.org
Subject: ikvm on AST2500
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Thu, 23 Jan 2020 17:59:40 +0300
Message-Id: <236301579791580@vla5-c30c59847b9e.qloud-c.yandex.net>
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

PGRpdj5IZWxsbyBhbGwhPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+SSdtIHRyeWluZyB0byBtYWtl
IGlrdm0gYWxpdmUgb24gQVNUMjUwMCBCTUMgb24gYSBjdXN0b20gbW90aGVyYm9hcmQuPC9kaXY+
PGRpdj5TbyBmYXIgSSB3YXMgYWJsZSB0byBjb21waWxlIGluIHZpZGVvLWVuZ2luZSBhbmQgc2V0
IGl0IHVwIGluIERUUyAodG9nZXRoZXIgd2l0aCBzaGFyZWQgbWVtb3J5KSwgb2JtYy1pa3ZtIGlz
IGFsc28gdGhlcmUuPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+QWZ0ZXIgQk1DIGlzIHVwIHRoZXJl
IGlzIC9kZXYvdmlkZW8wIGRldmljZS48L2Rpdj48ZGl2PlNvIEkndmUgZG9uZSBkZCBpZj0vZGV2
L3ZpZGVvMCBvZj0vdG1wL3ZpZGVvLmpwZWcsIHRlcm1pbmF0ZWQgZGQgYWZ0ZXIgY291cGxlIG9m
IHNlY29uZHMsIHVwbG9hZGVkIHZpZGVvLmpwZWcgYW5kIG9wZW5lZCBpdCB3aXRoIGltYWdlIHZp
ZXdlciAtIGl0J3MgSlBFRyBmaWxlIHdpdGggdGhlIHNjcmVlbiBpbWFnZSBvbiBpdC4gRnJvbSB0
aGlzIEkgY29uY2x1ZGUgdGhhdCBrZXJuZWwgZHJpdmVyIGlzIHdvcmtpbmcsIERUUyBpcyBjb25m
aWd1cmVkIGNvcnJlY3RseSBhbmQgaGFyZHdhcmUgaXMgb3BlcmF0aW9uYWwuPC9kaXY+PGRpdj7C
oDwvZGl2PjxkaXY+QnV0IGlmIEkgc3NoIHRvIEJNQyB3aXRoIC1MIDU5MDA6MTI3LjAuMC4xOjU5
MDAsIGFuZCB0aGVuIHJ1biB2bmN2aWV3ZXIgMTI3LjAuMC4xIEkgc2VlIG9ubHkgYmxhY2sgc2Ny
ZWVuLiBUaGUgcmVzb2x1dGlvbiBpcyBjb3JyZWN0LCBidXQgaXQncyBqdXN0IGJsYWNrLjwvZGl2
PjxkaXY+wqA8L2Rpdj48ZGl2PnZuY3ZpZXdlciByZXBvcnRzOjwvZGl2PjxkaXY+PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PTwvZGl2PjxkaXY+PGRpdj4kIHZu
Y3ZpZXdlciAxMjcuMC4wLjE8L2Rpdj48ZGl2PkNvbm5lY3RlZCB0byBSRkIgc2VydmVyLCB1c2lu
ZyBwcm90b2NvbCB2ZXJzaW9uIDMuODwvZGl2PjxkaXY+Tm8gYXV0aGVudGljYXRpb24gbmVlZGVk
PC9kaXY+PGRpdj5BdXRoZW50aWNhdGlvbiBzdWNjZXNzZnVsPC9kaXY+PGRpdj5EZXNrdG9wIG5h
bWUgIk9wZW5CTUMgSUtWTSI8L2Rpdj48ZGl2PlZOQyBzZXJ2ZXIgZGVmYXVsdCBmb3JtYXQ6PC9k
aXY+PGRpdj4zMiBiaXRzIHBlciBwaXhlbC48L2Rpdj48ZGl2PkxlYXN0IHNpZ25pZmljYW50IGJ5
dGUgZmlyc3QgaW4gZWFjaCBwaXhlbC48L2Rpdj48ZGl2PlRydWUgY29sb3VyOiBtYXggcmVkIDI1
NSBncmVlbiAyNTUgYmx1ZSAyNTUsIHNoaWZ0IHJlZCAwIGdyZWVuIDggYmx1ZSAxNjwvZGl2Pjxk
aXY+VXNpbmcgZGVmYXVsdCBjb2xvcm1hcCB3aGljaCBpcyBUcnVlQ29sb3IuIFBpeGVsIGZvcm1h
dDo8L2Rpdj48ZGl2PjMyIGJpdHMgcGVyIHBpeGVsLjwvZGl2PjxkaXY+TGVhc3Qgc2lnbmlmaWNh
bnQgYnl0ZSBmaXJzdCBpbiBlYWNoIHBpeGVsLjwvZGl2PjxkaXY+VHJ1ZSBjb2xvdXI6IG1heCBy
ZWQgMjU1IGdyZWVuIDI1NSBibHVlIDI1NSwgc2hpZnQgcmVkIDE2IGdyZWVuIDggYmx1ZSAwPC9k
aXY+PGRpdj5TYW1lIG1hY2hpbmU6IHByZWZlcnJpbmcgcmF3IGVuY29kaW5nPC9kaXY+PGRpdj7C
oDwvZGl2PjwvZGl2PjxkaXY+PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PTwvZGl2PjxkaXY+b2JtYy1pa3ZtIGFsc28gcHJldGVuZHMgdG8gd29yazo8L2Rpdj48
ZGl2Pj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT08L2Rpdj48
ZGl2PjxkaXY+SmFuIDAxIDAwOjAyOjI1IHB1cmxleS1tYiBvYm1jLWlrdm1bMjU3XTogMDEvMDEv
MTk3MCAwMDowMjoyNSBHb3QgY29ubmVjdGlvbiBmcm9tIGNsaWVudCAxMjcuMC4wLjE8L2Rpdj48
ZGl2PkphbiAwMSAwMDowMjoyNSBwdXJsZXktbWIgb2JtYy1pa3ZtWzI1N106IDAxLzAxLzE5NzAg
MDA6MDI6MjUgMCBvdGhlciBjbGllbnRzPC9kaXY+PGRpdj5KYW4gMDEgMDA6MDI6MjUgcHVybGV5
LW1iIG9ibWMtaWt2bVsyNTddOiAwMS8wMS8xOTcwIDAwOjAyOjI1IENsaWVudCBQcm90b2NvbCBW
ZXJzaW9uIDMuODwvZGl2PjxkaXY+SmFuIDAxIDAwOjAyOjI1IHB1cmxleS1tYiBvYm1jLWlrdm1b
MjU3XTogMDEvMDEvMTk3MCAwMDowMjoyNSBQcm90b2NvbCB2ZXJzaW9uIHNlbnQgMy44LCB1c2lu
ZyAzLjg8L2Rpdj48ZGl2PkphbiAwMSAwMDowMjoyNSBwdXJsZXktbWIgb2JtYy1pa3ZtWzI1N106
IDAxLzAxLzE5NzAgMDA6MDI6MjUgcmZiUHJvY2Vzc0NsaWVudFNlY3VyaXR5VHlwZTogZXhlY3V0
aW5nIGhhbmRsZXIgZm9yIHR5cGUgMTwvZGl2PjxkaXY+SmFuIDAxIDAwOjAyOjI1IHB1cmxleS1t
YiBvYm1jLWlrdm1bMjU3XTogMDEvMDEvMTk3MCAwMDowMjoyNSByZmJQcm9jZXNzQ2xpZW50U2Vj
dXJpdHlUeXBlOiByZXR1cm5pbmcgc2VjdXJpdHlSZXN1bHQgZm9yIGNsaWVudCByZmIgdmVyc2lv
biAmZ3Q7PSAzLjg8L2Rpdj48ZGl2PkphbiAwMSAwMDowMjoyNSBwdXJsZXktbWIgb2JtYy1pa3Zt
WzI1N106IDAxLzAxLzE5NzAgMDA6MDI6MjUgUGl4ZWwgZm9ybWF0IGZvciBjbGllbnQgMTI3LjAu
MC4xOjwvZGl2PjxkaXY+SmFuIDAxIDAwOjAyOjI1IHB1cmxleS1tYiBvYm1jLWlrdm1bMjU3XTog
MDEvMDEvMTk3MCAwMDowMjoyNSAzMiBicHAsIGRlcHRoIDI0LCBsaXR0bGUgZW5kaWFuPC9kaXY+
PGRpdj5KYW4gMDEgMDA6MDI6MjUgcHVybGV5LW1iIG9ibWMtaWt2bVsyNTddOiAwMS8wMS8xOTcw
IDAwOjAyOjI1IHRydWUgY29sb3VyOiBtYXggciAyNTUgZyAyNTUgYiAyNTUsIHNoaWZ0IHIgMTYg
ZyA4IGIgMDwvZGl2PjxkaXY+SmFuIDAxIDAwOjAyOjI1IHB1cmxleS1tYiBvYm1jLWlrdm1bMjU3
XTogMDEvMDEvMTk3MCAwMDowMjoyNSBVc2luZyBjb21wcmVzc2lvbiBsZXZlbCAxIGZvciBjbGll
bnQgMTI3LjAuMC4xPC9kaXY+PGRpdj5KYW4gMDEgMDA6MDI6MjUgcHVybGV5LW1iIG9ibWMtaWt2
bVsyNTddOiAwMS8wMS8xOTcwIDAwOjAyOjI1IFVzaW5nIGltYWdlIHF1YWxpdHkgbGV2ZWwgNiBm
b3IgY2xpZW50IDEyNy4wLjAuMTwvZGl2PjxkaXY+SmFuIDAxIDAwOjAyOjI1IHB1cmxleS1tYiBv
Ym1jLWlrdm1bMjU3XTogMDEvMDEvMTk3MCAwMDowMjoyNSBVc2luZyBKUEVHIHN1YnNhbXBsaW5n
IDAsIFE3OSBmb3IgY2xpZW50IDEyNy4wLjAuMTwvZGl2PjxkaXY+SmFuIDAxIDAwOjAyOjI1IHB1
cmxleS1tYiBvYm1jLWlrdm1bMjU3XTogMDEvMDEvMTk3MCAwMDowMjoyNSBFbmFibGluZyBYLXN0
eWxlIGN1cnNvciB1cGRhdGVzIGZvciBjbGllbnQgMTI3LjAuMC4xPC9kaXY+PGRpdj5KYW4gMDEg
MDA6MDI6MjUgcHVybGV5LW1iIG9ibWMtaWt2bVsyNTddOiAwMS8wMS8xOTcwIDAwOjAyOjI1IEVu
YWJsaW5nIGZ1bGwtY29sb3IgY3Vyc29yIHVwZGF0ZXMgZm9yIGNsaWVudCAxMjcuMC4wLjE8L2Rp
dj48ZGl2PkphbiAwMSAwMDowMjoyNSBwdXJsZXktbWIgb2JtYy1pa3ZtWzI1N106IDAxLzAxLzE5
NzAgMDA6MDI6MjUgRW5hYmxpbmcgY3Vyc29yIHBvc2l0aW9uIHVwZGF0ZXMgZm9yIGNsaWVudCAx
MjcuMC4wLjE8L2Rpdj48ZGl2PkphbiAwMSAwMDowMjoyNSBwdXJsZXktbWIgb2JtYy1pa3ZtWzI1
N106IDAxLzAxLzE5NzAgMDA6MDI6MjUgRW5hYmxpbmcgTGFzdFJlY3QgcHJvdG9jb2wgZXh0ZW5z
aW9uIGZvciBjbGllbnQgMTI3LjAuMC4xPC9kaXY+PGRpdj5KYW4gMDEgMDA6MDI6MjUgcHVybGV5
LW1iIG9ibWMtaWt2bVsyNTddOiAwMS8wMS8xOTcwIDAwOjAyOjI1IFVzaW5nIHJhdyBlbmNvZGlu
ZyBmb3IgY2xpZW50IDEyNy4wLjAuMTwvZGl2PjxkaXY+SmFuIDAxIDAwOjA0OjU3IHB1cmxleS1t
YiBvYm1jLWlrdm1bMjU3XTogMDEvMDEvMTk3MCAwMDowNDo1NyBDbGllbnQgMTI3LjAuMC4xIGdv
bmU8L2Rpdj48ZGl2PkphbiAwMSAwMDowNDo1NyBwdXJsZXktbWIgb2JtYy1pa3ZtWzI1N106IDAx
LzAxLzE5NzAgMDA6MDQ6NTcgU3RhdGlzdGljcyBldmVudHMgVHJhbnNtaXQvIFJhd0VxdWl2ICgg
c2F2ZWQpPC9kaXY+PGRpdj5KYW4gMDEgMDA6MDQ6NTcgcHVybGV5LW1iIG9ibWMtaWt2bVsyNTdd
OiAwMS8wMS8xOTcwIDAwOjA0OjU3IEZyYW1lYnVmZmVyVXBkYXRlIDogMSB8IDAvIDAgKCAwLjAl
KTwvZGl2PjxkaXY+SmFuIDAxIDAwOjA0OjU3IHB1cmxleS1tYiBvYm1jLWlrdm1bMjU3XTogMDEv
MDEvMTk3MCAwMDowNDo1NyByYXcgOiAxIHwgMTkyMDAxMi8gMTkyMDAxMiAoIDAuMCUpPC9kaXY+
PGRpdj5KYW4gMDEgMDA6MDQ6NTcgcHVybGV5LW1iIG9ibWMtaWt2bVsyNTddOiAwMS8wMS8xOTcw
IDAwOjA0OjU3IFBvaW50ZXJQb3MgOiAxIHwgMTIvIDEyICggMC4wJSk8L2Rpdj48ZGl2PkphbiAw
MSAwMDowNDo1NyBwdXJsZXktbWIgb2JtYy1pa3ZtWzI1N106IDAxLzAxLzE5NzAgMDA6MDQ6NTcg
UmljaEN1cnNvciA6IDEgfCAxNjg0LyAxNjg0ICggMC4wJSk8L2Rpdj48ZGl2PkphbiAwMSAwMDow
NDo1NyBwdXJsZXktbWIgb2JtYy1pa3ZtWzI1N106IDAxLzAxLzE5NzAgMDA6MDQ6NTcgVE9UQUxT
IDogNCB8IDE5MjE3MDgvIDE5MjE3MDggKCAwLjAlKTwvZGl2PjxkaXY+SmFuIDAxIDAwOjA0OjU3
IHB1cmxleS1tYiBvYm1jLWlrdm1bMjU3XTogMDEvMDEvMTk3MCAwMDowNDo1NyBTdGF0aXN0aWNz
IGV2ZW50cyBSZWNlaXZlZC8gUmF3RXF1aXYgKCBzYXZlZCk8L2Rpdj48ZGl2PkphbiAwMSAwMDow
NDo1NyBwdXJsZXktbWIgb2JtYy1pa3ZtWzI1N106IDAxLzAxLzE5NzAgMDA6MDQ6NTcgQ2xpZW50
Q3V0VGV4dCA6IDEgfCAzMC8gMzAgKCAwLjAlKTwvZGl2PjxkaXY+SmFuIDAxIDAwOjA0OjU3IHB1
cmxleS1tYiBvYm1jLWlrdm1bMjU3XTogMDEvMDEvMTk3MCAwMDowNDo1NyBQb2ludGVyRXZlbnQg
OiAzNTcgfCAyMTQyLyAyMTQyICggMC4wJSk8L2Rpdj48ZGl2PkphbiAwMSAwMDowNDo1NyBwdXJs
ZXktbWIgb2JtYy1pa3ZtWzI1N106IDAxLzAxLzE5NzAgMDA6MDQ6NTcgRnJhbWVidWZmZXJVcGRh
dGUgOiAyIHwgMjAvIDIwICggMC4wJSk8L2Rpdj48ZGl2PkphbiAwMSAwMDowNDo1NyBwdXJsZXkt
bWIgb2JtYy1pa3ZtWzI1N106IDAxLzAxLzE5NzAgMDA6MDQ6NTcgU2V0RW5jb2RpbmdzIDogMSB8
IDU2LyA1NiAoIDAuMCUpPC9kaXY+PGRpdj5KYW4gMDEgMDA6MDQ6NTcgcHVybGV5LW1iIG9ibWMt
aWt2bVsyNTddOiAwMS8wMS8xOTcwIDAwOjA0OjU3IFNldFBpeGVsRm9ybWF0IDogMSB8IDIwLyAy
MCAoIDAuMCUpPC9kaXY+PGRpdj5KYW4gMDEgMDA6MDQ6NTcgcHVybGV5LW1iIG9ibWMtaWt2bVsy
NTddOiAwMS8wMS8xOTcwIDAwOjA0OjU3IFRPVEFMUyA6IDM2MiB8IDIyNjgvIDIyNjggKCAwLjAl
KTwvZGl2PjwvZGl2PjxkaXY+PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PTwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PlNvIEkgdGhpbmsgdGhhdCBzb21laG93IGlr
dm0gaXMgbm90IGFibGUgdG8gY29ycmVjdGx5IHJlY29kZSBpbWFnZSBmcm9tIGpwZWcgKGFzIGl0
IHN1cHBsaWVkIGJ5IGhhcmR3YXJlIGFuZCBkcml2ZXIpIGludG8gVk5DIGNvbXBhdGlibGUgZm9y
bWF0LjwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PkNvdWxkIHlvdSBwbGVhc2UgZ2l2ZSBhbiBhZHZp
Y2UgaG93IHRvIGZpeCBpdD88L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj5UaGFuayB5b3UhPC9kaXY+
PGRpdj4tLcKgPC9kaXY+PGRpdj5CZXN0IHJlZ2FyZHMsPC9kaXY+PGRpdj5Lb25zdGFudGluIEts
dWJuaWNoa2luLDwvZGl2PjxkaXY+bGVhZCBmaXJtd2FyZSBlbmdpbmVlciw8L2Rpdj48ZGl2PnNl
cnZlciBoYXJkd2FyZSBSJmFtcDtEIGdyb3VwLDwvZGl2PjxkaXY+WWFuZGV4IE1vc2NvdyBvZmZp
Y2UuPC9kaXY+PGRpdj50ZWw6ICs3LTkwMy01MTAtMzMtMzM8L2Rpdj48ZGl2PsKgPC9kaXY+
