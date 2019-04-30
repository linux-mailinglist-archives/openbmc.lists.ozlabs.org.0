Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F0BEE68
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 03:31:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tPBw5lSRzDqNd
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 11:31:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=qq.com
 (client-ip=184.105.206.84; helo=smtpproxy19.qq.com;
 envelope-from=1450335857@qq.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.b="eg6uJySe"; 
 dkim-atps=neutral
Received: from smtpproxy19.qq.com (smtpproxy19.qq.com [184.105.206.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tP9r62kGzDqNJ
 for <openbmc@lists.ozlabs.org>; Tue, 30 Apr 2019 11:30:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1556587844; bh=kwsLXE+ndKXgVKx6VSDF55QJaTuc9kUv9dEVpA3NOvQ=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=eg6uJySeh2JvhP7q5+pXsrrE1TLwTGbsG7JPxPUvNq0niOIV0fPosJo7cZMSg4WAT
 zAH3g5vKWw5Fzim3MnDFKJrHZOkD6joNmPgo5so56K6VijwyJxsFUV5yigITpXnpzw
 0XfRDBjT2i2ja7oaDUita8kGi28tNQZDfv2DGGSY=
X-QQ-SSF: 00000000000000F000000000000000H
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 218.247.157.87
X-QQ-STYLE: 
X-QQ-mid: webenglish1t1556587843t15215
From: "=?ISO-8859-1?B?eGl1emhp?=" <1450335857@qq.com>
To: "=?ISO-8859-1?B?amFlLmh5dW4ueW9v?=" <jae.hyun.yoo@linux.intel.com>,
 "=?ISO-8859-1?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>,
 "=?ISO-8859-1?B?ZWQ=?=" <ed@tanous.net>,
 "=?ISO-8859-1?B?RWRkaWUgSmFtZXM=?=" <eajames@linux.vnet.ibm.com>
Subject: Re: ikvm refresh failed on host screen 1680x1050 resolution
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5CC7A543_0CC96768_551B7365"
Content-Transfer-Encoding: 8Bit
Date: Tue, 30 Apr 2019 09:30:43 +0800
X-Priority: 3
Message-ID: <tencent_5FB0BF811DCC8BEA504F5A8F@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Tue, 30 Apr 2019 09:30:44 +0800 (CST)
Feedback-ID: webenglish:qq.com:bgforeign:bgforeign2
X-QQ-Bgrelay: 1
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

This is a multi-part message in MIME format.

------=_NextPart_5CC7A543_0CC96768_551B7365
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGkgSmFlLA0KICAgIERpZCB5b3UgcmVwcm9kdWNlIHRoZSByZXNvbHV0aW9uIGlzc3VlPyBD
ZW50T1M3IG9yIFJlZEhhdDcgaGFzIHRoaXMgcmVzb2x1dGlvbi4NCiAgQmV0cywNClhpdXpo
aQ0KSGkgSmFlLA0KICAgTXkgaG9zdCBPUyBpcyBSZWRIYXQ3LiANCkJvdGggIlJlZnJlc2gi
IGJ1dHRvbiBvbiBpa3ZtIHdlYiBQYWdlIGFuZCAiVmlldy0tUmVsb2FkIFRoaXMgUGFnZSIg
b3IgcmVsb2FkIGJ1dHRvbiBvbiBjaHJvbWUgYnJvd3NlciBtZW51IHdvcmtzLg0KWGl1emhp
DQoNCg0KLS0tLS0tLS0tLS0tLS0tLS0tIE9yaWdpbmFsIC0tLS0tLS0tLS0tLS0tLS0tLQ0K
RnJvbTogICJqYWUuaHl1bi55b28iOzxqYWUuaHl1bi55b29AbGludXguaW50ZWwuY29tPjsN
CkRhdGU6ICBBcHIgNSwgMjAxOQ0KVG86ICAieGl1emhpIjwxNDUwMzM1ODU3QHFxLmNvbT47
ICJvcGVuYm1jIjxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+OyAiZWQiPGVkQHRhbm91cy5u
ZXQ+OyAiRWRkaWUgSmFtZXMiPGVhamFtZXNAbGludXgudm5ldC5pYm0uY29tPjsgDQoNClN1
YmplY3Q6ICBSZTogaWt2bSByZWZyZXNoIGZhaWxlZCBvbiBob3N0IHNjcmVlbiAxNjgweDEw
NTAgcmVzb2x1dGlvbg0KDQoNCg0KT24gNC8zLzIwMTkgMTA6MjEgUE0sIHhpdXpoaSB3cm90
ZToNCj4gSGkgSmFlLCBFZCwNCj4gICAgICBUaGUgaWt2bSBzY3JlZW4gY2Fubid0IHJlZnJl
c2ggb24gaWt2bSB3ZWJ1aSBzY3JlZW4gd2hlbiBzZXR0aW5nIA0KPiB0aGUgaG9zdCBzY3Jl
ZW4gcmVzb2x1dGlvbiB0byAxNjgwKjEwNTAgLiBJIG11c3QgY2xpY2sgdGhlICJSZWZyZXNo
IiANCj4gYnV0dG9uIHRvIGdldCB0aGUgbmV3IGhvc3Qgc2NyZWVuLiAgT3RoZXIgcmVzb2x1
dGlvbnMgd29ya3MgdmVyeSB3ZWxsLg0KPiAgICBQbGVhc2UgY2hlY2sgaXQuDQoNCkhpIFhp
dXpoaSwNCg0KSSBjYW4ndCBzZWUgdGhlIHJlc29sdXRpb24gb3B0aW9uIGluIFVidW50dSAx
OC4wMy4gV2hhdCBob3N0IE9TIGRpZCB5b3UNCnVzZSBmb3IgdGhlIHRlc3Q/IExldCBtZSBj
bGFyaWZ5IG9uZSBtb3JlLiBEbyB5b3UgbWVhbiB0aGUgIlJlZnJlc2giDQpidXR0b24gaW4g
S1ZNIHdlYiBwYWdlLCBvciByZWxvYWQgYnV0dG9uIG9mIHRoZSB3ZWIgYnJvd3Nlcj8NCg0K
VGhhbmtzLA0KSmFlDQoNCj4gQmVzdCwNCj4geGl1emhp

------=_NextPart_5CC7A543_0CC96768_551B7365
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

PGRpdj5IaSBKYWUsPC9kaXY+PGRpdj4mbmJzcDsgJm5ic3A7IERpZCB5b3UgcmVwcm9kdWNl
IHRoZSByZXNvbHV0aW9uIGlzc3VlPyBDZW50T1M3IG9yIFJlZEhhdDcgaGFzIHRoaXMgcmVz
b2x1dGlvbi48L2Rpdj48ZGl2PiZuYnNwOyBCZXRzLDwvZGl2PjxkaXY+WGl1emhpPC9kaXY+
PGRpdj5IaSBKYWUsPC9kaXY+PGRpdj4mbmJzcDsgJm5ic3A7TXkgaG9zdCBPUyBpcyBSZWRI
YXQ3LiA8L2Rpdj48ZGl2PkJvdGggIlJlZnJlc2giIGJ1dHRvbiBvbiBpa3ZtIHdlYiBQYWdl
IGFuZCAiVmlldy0tUmVsb2FkIFRoaXMgUGFnZSIgb3IgcmVsb2FkIGJ1dHRvbiBvbiBjaHJv
bWUgYnJvd3NlciBtZW51IHdvcmtzLjwvZGl2PjxkaXY+PGRpdj5YaXV6aGk8L2Rpdj48ZGl2
Pjxicj48L2Rpdj48ZGl2IHN0eWxlPSJmb250LXNpemU6IDEycHg7Zm9udC1mYW1pbHk6IEFy
aWFsIE5hcnJvdztwYWRkaW5nOjJweCAwIDJweCAwOyI+LS0tLS0tLS0tLS0tLS0tLS0tIE9y
aWdpbmFsIC0tLS0tLS0tLS0tLS0tLS0tLTwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtc2l6ZTog
MTJweDtiYWNrZ3JvdW5kOiNlZmVmZWY7cGFkZGluZzo4cHg7Ij48ZGl2PjxiPkZyb206IDwv
Yj4mbmJzcDsiamFlLmh5dW4ueW9vIjsmbHQ7amFlLmh5dW4ueW9vQGxpbnV4LmludGVsLmNv
bSZndDs7PC9kaXY+PGRpdj48Yj5EYXRlOiA8L2I+Jm5ic3A7QXByIDUsIDIwMTk8L2Rpdj48
ZGl2PjxiPlRvOiA8L2I+Jm5ic3A7InhpdXpoaSImbHQ7MTQ1MDMzNTg1N0BxcS5jb20mZ3Q7
OyAib3BlbmJtYyImbHQ7b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnJmd0OzsgImVkIiZsdDtl
ZEB0YW5vdXMubmV0Jmd0OzsgIkVkZGllIEphbWVzIiZsdDtlYWphbWVzQGxpbnV4LnZuZXQu
aWJtLmNvbSZndDs7IDx3YnI+PC9kaXY+PGRpdj48L2Rpdj48ZGl2PjxiPlN1YmplY3Q6IDwv
Yj4mbmJzcDtSZTogaWt2bSByZWZyZXNoIGZhaWxlZCBvbiBob3N0IHNjcmVlbiAxNjgweDEw
NTAgcmVzb2x1dGlvbjwvZGl2PjwvZGl2PjxkaXY+PGJyPjwvZGl2Pk9uIDQvMy8yMDE5IDEw
OjIxIFBNLCB4aXV6aGkgd3JvdGU6PGJyPiZndDsgSGkgSmFlLCBFZCw8YnI+Jmd0OyZuYnNw
OyAmbmJzcDsgJm5ic3A7IFRoZSBpa3ZtIHNjcmVlbiBjYW5uJ3QgcmVmcmVzaCBvbiBpa3Zt
IHdlYnVpIHNjcmVlbiB3aGVuIHNldHRpbmcgPGJyPiZndDsgdGhlIGhvc3Qgc2NyZWVuIHJl
c29sdXRpb24gdG8gMTY4MCoxMDUwIC4gSSBtdXN0IGNsaWNrIHRoZSAiUmVmcmVzaCIgPGJy
PiZndDsgYnV0dG9uIHRvIGdldCB0aGUgbmV3IGhvc3Qgc2NyZWVuLiZuYnNwOyBPdGhlciBy
ZXNvbHV0aW9ucyB3b3JrcyB2ZXJ5IHdlbGwuPGJyPiZndDsmbmJzcDsgJm5ic3A7IFBsZWFz
ZSBjaGVjayBpdC48YnI+PGJyPkhpIFhpdXpoaSw8YnI+PGJyPkkgY2FuJ3Qgc2VlIHRoZSBy
ZXNvbHV0aW9uIG9wdGlvbiBpbiBVYnVudHUgMTguMDMuIFdoYXQgaG9zdCBPUyBkaWQgeW91
PGJyPnVzZSBmb3IgdGhlIHRlc3Q/IExldCBtZSBjbGFyaWZ5IG9uZSBtb3JlLiBEbyB5b3Ug
bWVhbiB0aGUgIlJlZnJlc2giPGJyPmJ1dHRvbiBpbiBLVk0gd2ViIHBhZ2UsIG9yIHJlbG9h
ZCBidXR0b24gb2YgdGhlIHdlYiBicm93c2VyPzxicj48YnI+VGhhbmtzLDxicj5KYWU8YnI+
PGJyPiZndDsgQmVzdCw8YnI+Jmd0OyB4aXV6aGk8YnI+PC9kaXY+

------=_NextPart_5CC7A543_0CC96768_551B7365--



