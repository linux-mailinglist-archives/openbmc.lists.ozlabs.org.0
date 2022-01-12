Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D456248BF41
	for <lists+openbmc@lfdr.de>; Wed, 12 Jan 2022 08:50:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYfqn54xHz306f
	for <lists+openbmc@lfdr.de>; Wed, 12 Jan 2022 18:50:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=k+0pazls;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=163.com
 (client-ip=220.181.13.65; helo=m1365.mail.163.com;
 envelope-from=ouyangxuan10@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=k+0pazls; dkim-atps=neutral
Received: from m1365.mail.163.com (m1365.mail.163.com [220.181.13.65])
 by lists.ozlabs.org (Postfix) with ESMTP id 4JYfqG2MPMz2xXC
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jan 2022 18:49:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=8OKah
 uYabf9q7NxArUfIEidyBgIKwh2O0OtvCb8dhYQ=; b=k+0pazls9Zw38IGCcOVsR
 T8ybUf1BkqlCc7W8ap4IEe1pyXiRGtPPxRpOYWdI6MiQgkeJzBxBIF8GKN4CxECV
 PsxQDisYZgPEwSl+2rCuIhylNPnO6gVRzlP00pWmQVCnjsKywzPPzpoTM24rdVKM
 D1P5pWi6ztpOqigyRyiWp4=
Received: from ouyangxuan10$163.com ( [106.120.127.5] ) by
 ajax-webmail-wmsvr65 (Coremail) ; Wed, 12 Jan 2022 15:49:32 +0800 (CST)
X-Originating-IP: [106.120.127.5]
Date: Wed, 12 Jan 2022 15:49:32 +0800 (CST)
From: www  <ouyangxuan10@163.com>
To: "Matt Spinler" <mspinler@linux.ibm.com>
Subject: Re:Re: [obmc]: sometime, the method of GetObject in phosphor-objmgr
 cannot get path or object
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210622(1d4788a8)
 Copyright (c) 2002-2022 www.mailtech.cn 163com
In-Reply-To: <c60f01b8-a200-3dd5-56dc-9a327e1e4bc0@linux.ibm.com>
References: <63f93b08.79d.17dea0b1142.Coremail.ouyangxuan10@163.com>
 <c60f01b8-a200-3dd5-56dc-9a327e1e4bc0@linux.ibm.com>
X-CM-CTRLDATA: HHmwNWZvb3Rlcl9odG09MTYxMjo1Ng==
Content-Type: multipart/alternative; 
 boundary="----=_Part_36967_1598608865.1641973772844"
MIME-Version: 1.0
Message-ID: <1411c0c0.2793.17e4d43722c.Coremail.ouyangxuan10@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: QcGowAC3DRIPiN5h4hcLAA--.34330W
X-CM-SenderInfo: prx1t0pj0xt0irq6il2tof0z/1tbi-AyG2mB0I7qlpwAAsj
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
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

------=_Part_36967_1598608865.1641973772844
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

CgoKQWNjb3JkaW5nIHRvIG15IHRlc3QsIG1heWJlIGEgc2VydmljZSBpcyBidXN5LCBtYXBwZXIg
Y2FuJ3QgaW50cm9zcGVjdCB0aGUgb2JqZWN0cyBhbmQgaW50ZXJmYWNlcyBvZiB0aGlzIHNlcnZp
Y2UuCgoKCgp0aGFua3MsCkJ5cm9uCgoKCgoKCgoKQXQgMjAyMi0wMS0wNSAwMzoyODo1NSwgIk1h
dHQgU3BpbmxlciIgPG1zcGlubGVyQGxpbnV4LmlibS5jb20+IHdyb3RlOgo+Cj4KPk9uIDEyLzIz
LzIwMjEgNzoyNSBQTSwgd3d3IHdyb3RlOgo+PiBEZWFyIEFsbCwgU29tZXRpbWVzIHRoZSBHZXRP
YmplY3QgbWV0aG9kIGluIHBob3NwaG9yLW9iam1nciBmYWlscyB0byAKPj4gb2J0YWluIHBhdGgg
b3Igb2JqZWN0LiBEb2VzIGFueW9uZSBrbm93IHdoeT8gSG93IHRvIHNvbHZlIGl0PyBTZXJ2aWNl
cyAKPj4gYW5kIG9iamVjdHMgZXhpc3QuIHRoYW5rc++8jCBCeXJvbiDigI0g4oCNIOKAjSDigI0g
4oCNIOKAjSDigI0g4oCNIOKAjSDigI0g4oCNIOKAjSDigI0g4oCNIOKAjSDigI0g4oCNIOKAjSDi
gI0gCj4+IOKAjSDigI0g4oCNIOKAjSDigI0g4oCNIOKAjSDigI0g4oCNIOKAjSDigI0g4oCNIOKA
jSDigI0g4oCNIOKAjSDigI0g4oCNIOKAjSDigI0g4oCNIOKAjSDigI0g4oCNIOKAjSDigI0g4oCN
IOKAjSDigI0g4oCNIOKAjSDigI0g4oCNIOKAjSDigI0gCj4+IOKAjSDigI0g4oCNIOKAjSDigI0g
4oCNIOKAjSDigI0g4oCNIOKAjSDigI0g4oCNIAo+PiBEZWFyIEFsbCwKPj4KPj4gU29tZXRpbWVz
IHRoZSBHZXRPYmplY3QgbWV0aG9kIGluIHBob3NwaG9yLW9iam1nciBmYWlscyB0byBvYnRhaW4g
cGF0aCAKPj4gb3Igb2JqZWN0LiBEb2VzIGFueW9uZSBrbm93IHdoeT8gSG93IHRvIHNvbHZlIGl0
Pwo+Pgo+PiBTZXJ2aWNlcyBhbmQgb2JqZWN0cyBleGlzdC4KPj4KPgo+SSd2ZSBuZXZlciBoZWFy
ZCBvZiBhbnkgc29ydCBvZiBtYXBwZXIgcHJvYmxlbXMgbGlrZSB0aGlzLiAgSG93IG9mdGVuIAo+
ZG9lcyBpdCBoYXBwZW4/Cj4KPklmIHlvdSB3ZXJlIHRvIHJlc3RhcnQgdGhhdCBzZXJ2aWNlLCB3
b3VsZCB0aGUgbWFwcGVyIHRoZW4gc2VlIGl0PyBDYW4gCj55b3UgdGVsbCBmcm9tIHRoZSBqb3Vy
bmFsIGlmIHRoYXQgc2VydmljZSBzdGFydHMgYmVmb3JlIG9yIGFmdGVyIHRoZSAKPm1hcHBlciBz
ZXJ2aWNlIChub3QgdGhhdCBpdCBzaG91bGQgbWF0dGVyIG9mIGNvdXJzZSk/Cj4KPgo+PiB0aGFu
a3PvvIwKPj4gQnlyb24KPj4KPj4KPj4KPj4K
------=_Part_36967_1598608865.1641973772844
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxwIHN0eWxlPSJtYXJnaW46IDA7Ij48YnI+PC9wPjxwIHN0eWxl
PSJtYXJnaW46IDA7Ij5BY2NvcmRpbmcgdG8gbXkgdGVzdCwgbWF5YmUgYSBzZXJ2aWNlIGlzIGJ1
c3ksIG1hcHBlciBjYW4ndCBpbnRyb3NwZWN0IHRoZSBvYmplY3RzIGFuZCBpbnRlcmZhY2VzIG9m
IHRoaXMgc2VydmljZS48L3A+PHAgc3R5bGU9Im1hcmdpbjogMDsiPjxicj48L3A+PGRpdiBzdHls
ZT0ibWFyZ2luOiAwOyI+dGhhbmtzLDwvZGl2PjxkaXYgc3R5bGU9Im1hcmdpbjogMDsiPkJ5cm9u
PC9kaXY+PHAgc3R5bGU9Im1hcmdpbjogMDsiPjxicj48L3A+PGRpdiBzdHlsZT0icG9zaXRpb246
cmVsYXRpdmU7em9vbToxIj48L2Rpdj48ZGl2IGlkPSJkaXZOZXRlYXNlTWFpbENhcmQiPjwvZGl2
PjxwIHN0eWxlPSJtYXJnaW46IDA7Ij48YnI+PC9wPjxwcmU+PGJyPkF0IDIwMjItMDEtMDUgMDM6
Mjg6NTUsICJNYXR0IFNwaW5sZXIiICZsdDttc3BpbmxlckBsaW51eC5pYm0uY29tJmd0OyB3cm90
ZToKJmd0OwomZ3Q7CiZndDtPbiAxMi8yMy8yMDIxIDc6MjUgUE0sIHd3dyB3cm90ZToKJmd0OyZn
dDsgRGVhciBBbGwsIFNvbWV0aW1lcyB0aGUgR2V0T2JqZWN0IG1ldGhvZCBpbiBwaG9zcGhvci1v
YmptZ3IgZmFpbHMgdG8gCiZndDsmZ3Q7IG9idGFpbiBwYXRoIG9yIG9iamVjdC4gRG9lcyBhbnlv
bmUga25vdyB3aHk/IEhvdyB0byBzb2x2ZSBpdD8gU2VydmljZXMgCiZndDsmZ3Q7IGFuZCBvYmpl
Y3RzIGV4aXN0LiB0aGFua3PvvIwgQnlyb24g4oCNIOKAjSDigI0g4oCNIOKAjSDigI0g4oCNIOKA
jSDigI0g4oCNIOKAjSDigI0g4oCNIOKAjSDigI0g4oCNIOKAjSDigI0g4oCNIAomZ3Q7Jmd0OyDi
gI0g4oCNIOKAjSDigI0g4oCNIOKAjSDigI0g4oCNIOKAjSDigI0g4oCNIOKAjSDigI0g4oCNIOKA
jSDigI0g4oCNIOKAjSDigI0g4oCNIOKAjSDigI0g4oCNIOKAjSDigI0g4oCNIOKAjSDigI0g4oCN
IOKAjSDigI0g4oCNIOKAjSDigI0g4oCNIAomZ3Q7Jmd0OyDigI0g4oCNIOKAjSDigI0g4oCNIOKA
jSDigI0g4oCNIOKAjSDigI0g4oCNIOKAjSAKJmd0OyZndDsgRGVhciBBbGwsCiZndDsmZ3Q7CiZn
dDsmZ3Q7IFNvbWV0aW1lcyB0aGUgR2V0T2JqZWN0IG1ldGhvZCBpbiBwaG9zcGhvci1vYmptZ3Ig
ZmFpbHMgdG8gb2J0YWluIHBhdGggCiZndDsmZ3Q7IG9yIG9iamVjdC4mbmJzcDtEb2VzIGFueW9u
ZSBrbm93IHdoeT8gSG93IHRvIHNvbHZlIGl0PwomZ3Q7Jmd0OwomZ3Q7Jmd0OyBTZXJ2aWNlcyBh
bmQgb2JqZWN0cyBleGlzdC4KJmd0OyZndDsKJmd0OwomZ3Q7SSd2ZSBuZXZlciBoZWFyZCBvZiBh
bnkgc29ydCBvZiBtYXBwZXIgcHJvYmxlbXMgbGlrZSB0aGlzLiZuYnNwOyBIb3cgb2Z0ZW4gCiZn
dDtkb2VzIGl0IGhhcHBlbj8KJmd0OwomZ3Q7SWYgeW91IHdlcmUgdG8gcmVzdGFydCB0aGF0IHNl
cnZpY2UsIHdvdWxkIHRoZSBtYXBwZXIgdGhlbiBzZWUgaXQ/IENhbiAKJmd0O3lvdSB0ZWxsIGZy
b20gdGhlIGpvdXJuYWwgaWYgdGhhdCBzZXJ2aWNlIHN0YXJ0cyBiZWZvcmUgb3IgYWZ0ZXIgdGhl
IAomZ3Q7bWFwcGVyIHNlcnZpY2UgKG5vdCB0aGF0IGl0IHNob3VsZCBtYXR0ZXIgb2YgY291cnNl
KT8KJmd0OwomZ3Q7CiZndDsmZ3Q7IHRoYW5rc++8jAomZ3Q7Jmd0OyBCeXJvbgomZ3Q7Jmd0Owom
Z3Q7Jmd0OwomZ3Q7Jmd0OwomZ3Q7Jmd0Owo8L3ByZT48L2Rpdj48YnI+PGJyPjxzcGFuIHRpdGxl
PSJuZXRlYXNlZm9vdGVyIj48cD4mbmJzcDs8L3A+PC9zcGFuPg==
------=_Part_36967_1598608865.1641973772844--

