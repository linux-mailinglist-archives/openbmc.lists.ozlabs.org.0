Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1124D10976A
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 02:01:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MQbD74c8zDqdr
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 12:01:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=163.com
 (client-ip=220.181.13.117; helo=m13-117.163.com;
 envelope-from=ouyangxuan10@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.b="S3N7Ntt7"; 
 dkim-atps=neutral
Received: from m13-117.163.com (m13-117.163.com [220.181.13.117])
 by lists.ozlabs.org (Postfix) with ESMTP id 47MQZW2vvtzDqdn
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 12:01:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=6IQCl
 ArJX3IQtuqQl3k48vaRFqpv9DQmKJ/W65kPv/8=; b=S3N7Ntt7rdae6xih63D+b
 0/Vsr9XvBNoRmd21nAWMRBQePSwhqvuXTrlxMF3pI2vy5NnEVT1Okt0+55oXpINz
 hZX3KhgimvRwmJOwosJDUoWxEaIzjlRTqHoMDZqxGr3rtXFbDg6CU85HCDVbb7GX
 VJByvXIVU2fzNRea88H0gg=
Received: from ouyangxuan10$163.com ( [106.120.127.15] ) by
 ajax-webmail-wmsvr117 (Coremail) ; Tue, 26 Nov 2019 09:00:06 +0800 (CST)
X-Originating-IP: [106.120.127.15]
Date: Tue, 26 Nov 2019 09:00:06 +0800 (CST)
From: www  <ouyangxuan10@163.com>
To: "Andrew Jeffery" <andrew@aj.id.au>
Subject: Re:Re: [openbmc-kernel]: How to make pinctrl not affect
 pass-through function?
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190724(ac680a23)
 Copyright (c) 2002-2019 www.mailtech.cn 163com
In-Reply-To: <eed376e8-445f-4a2f-8184-de2c3800f953@www.fastmail.com>
References: <1b4dacbd.8278.16e6e6c2234.Coremail.ouyangxuan10@163.com>
 <a06a7845-cf16-4e37-8674-acd0950d6245@www.fastmail.com>
 <42def251.79a4.16e87d7a3a7.Coremail.ouyangxuan10@163.com>
 <e4d8ad9b-49cf-4942-a64c-0c47a94efa17@www.fastmail.com>
 <348aed94.42d2.16e915b4531.Coremail.ouyangxuan10@163.com>
 <839a25fc-1244-4c96-b3ed-6a2c04445736@www.fastmail.com>
 <5d3da051.585b.16e91e043b7.Coremail.ouyangxuan10@163.com>
 <eed376e8-445f-4a2f-8184-de2c3800f953@www.fastmail.com>
X-CM-CTRLDATA: 6z7GWWZvb3Rlcl9odG09MTU2Nzo1Ng==
Content-Type: multipart/alternative; 
 boundary="----=_Part_31080_710154153.1574730006719"
MIME-Version: 1.0
Message-ID: <1aa6a722.1f0b.16ea53900bf.Coremail.ouyangxuan10@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: dcGowAC3v0sWedxd+nY7AQ--.5698W
X-CM-SenderInfo: prx1t0pj0xt0irq6il2tof0z/1tbitxF52laEBGZbcQACsd
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
Cc: openbmc@lists.ozlabs.org, Ryan Chen <ryan_chen@aspeedtech.com>, "Bills,
 Jason M" <jason.m.bills@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

------=_Part_31080_710154153.1574730006719
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

aGkgQW5kcmV3LAoKClRoaXMgc3VnZ2VzdGlvbiBpcyBteSBwZXJzb25hbCBpbXBlcmZlY3QgaWRl
YS4gSXQncyBhbHNvIHRoZSBlYXNpZXN0IHdheSB0byBkbyBpdC4gSXQgbWF5IG5vdCBtYXRjaCB0
aGUgcmVxdWlyZW1lbnRzIG9mIHRoZSBrZXJuZWwgb3JnYW5pemF0aW9uLCBhbmQgaXQgbWF5IGJl
IG5lY2Vzc2FyeSB0byBmaW5kIGEgbW9yZSBwZXJmZWN0IG1ldGhvZC4KCgp0aGFua3MsCkJ5cm9u
CgoKCgoKCkF0IDIwMTktMTEtMjUgMDY6MTA6MzcsICJBbmRyZXcgSmVmZmVyeSIgPGFuZHJld0Bh
ai5pZC5hdT4gd3JvdGU6Cj4KPgo+T24gRnJpLCAyMiBOb3YgMjAxOSwgYXQgMTc6MjAsIHd3dyB3
cm90ZToKPj4gRGVhciBBbmRyZXcsCj4+IAo+PiBUaGFuayB5b3UuIEkgZ290IGl0Lgo+PiBQYXNz
LXRocm91Z2ggZnVuY3Rpb24gaXMgb25seSBhIHNtYWxsIGFuZCBzcGVjaWFsIHBhcnQgb2YgR1BJ
TyAKPj4gZnVuY3Rpb24uIAo+PiBJZiB0aGUgZW50aXJlIHBpbmN0cmwgYW5kICoqKiovc3lzL2Ns
YXNzL2dwaW8gKioqKiBhcmUgY2hhbmdlZCBkdWUgdG8gCj4+IHRoaXMgZnVuY3Rpb24sIEkgYW0g
bm90IHN1cmUgd2hldGhlciBpdCBpcyBhcHByb3ByaWF0ZS4KPj4gCj4KPkknbSBub3Qgc3VnZ2Vz
dGluZyB5b3UgY2hhbmdlIHBpbmN0cmwgYXQgYWxsLCBzbyBJJ20gbm90IHN1cmUgd2hlcmUgeW91
Cj5nb3QgdGhlIGlkZWEgdGhhdCB3ZSdkIG5lZWQgc29tZXRoaW5nIHNvIGRyYXN0aWMgYXMgY2hh
bmdpbmcgZW50aXJlCj5zdWJzeXN0ZW1zLiBXaGF0IEknbSBwcm9wb3Npbmcgc2hvdWxkIGJvaWwg
ZG93biB0byBhIG5ldwo+Y29uZmlndXJhdGlvbiBvcHRpb24gdG8gcGFzcyB0aHJvdWdoIHRoZSBn
cGlvIHVzZXJzcGFjZSBpbnRlcmZhY2UsCj50aGVuIGFkZGluZyBhcHByb3ByaWF0ZSBzdXBwb3J0
IHRvIHRoZSBHUElPIGRyaXZlci4gV2UgbWlnaHQgbmVlZAo+dG8gdGlua2VyIHdpdGggcGluY3Ry
bCBhIGxpdHRsZSB0byBnZXQgdGhlIGludGVyZmFjZXMgcmlnaHQsIGJ1dCBub3RoaW5nIG1vcmUu
Cj4KPkFuZHJldwo=
------=_Part_31080_710154153.1574730006719
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXY+aGkmbmJzcDs8c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6
IGFyaWFsOyB3aGl0ZS1zcGFjZTogcHJlLXdyYXA7Ij5BbmRyZXcsPC9zcGFuPjwvZGl2PjxkaXY+
PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiBhcmlhbDsgd2hpdGUtc3BhY2U6IHByZS13cmFwOyI+
PGJyPjwvc3Bhbj48L2Rpdj48ZGl2Pjxmb250IGZhY2U9ImFyaWFsIj48c3BhbiBzdHlsZT0id2hp
dGUtc3BhY2U6IHByZS13cmFwOyI+VGhpcyBzdWdnZXN0aW9uIGlzIG15IHBlcnNvbmFsIGltcGVy
ZmVjdCBpZGVhLiBJdCdzIGFsc28gdGhlIGVhc2llc3Qgd2F5IHRvIGRvIGl0LiBJdCBtYXkgbm90
IG1hdGNoIHRoZSByZXF1aXJlbWVudHMgb2YgdGhlIGtlcm5lbCBvcmdhbml6YXRpb24sIGFuZCBp
dCBtYXkgYmUgbmVjZXNzYXJ5IHRvIGZpbmQgYSBtb3JlIHBlcmZlY3QgbWV0aG9kLjwvc3Bhbj48
L2ZvbnQ+PC9kaXY+PGJyPjxkaXY+dGhhbmtzLDwvZGl2PjxkaXY+Qnlyb248L2Rpdj48YnI+PGJy
PjxkaXYgc3R5bGU9InBvc2l0aW9uOnJlbGF0aXZlO3pvb206MSI+PC9kaXY+PGRpdiBpZD0iZGl2
TmV0ZWFzZU1haWxDYXJkIj48L2Rpdj48YnI+PHByZT48YnI+QXQgMjAxOS0xMS0yNSAwNjoxMDoz
NywgIkFuZHJldyBKZWZmZXJ5IiAmbHQ7YW5kcmV3QGFqLmlkLmF1Jmd0OyB3cm90ZToKJmd0Owom
Z3Q7CiZndDtPbiBGcmksIDIyIE5vdiAyMDE5LCBhdCAxNzoyMCwgd3d3IHdyb3RlOgomZ3Q7Jmd0
OyBEZWFyIEFuZHJldywKJmd0OyZndDsgCiZndDsmZ3Q7IFRoYW5rIHlvdS4gSSBnb3QgaXQuCiZn
dDsmZ3Q7IFBhc3MtdGhyb3VnaCBmdW5jdGlvbiBpcyBvbmx5IGEgc21hbGwgYW5kIHNwZWNpYWwg
cGFydCBvZiBHUElPIAomZ3Q7Jmd0OyBmdW5jdGlvbi4gCiZndDsmZ3Q7IElmIHRoZSBlbnRpcmUg
cGluY3RybCBhbmQgKioqKi9zeXMvY2xhc3MvZ3BpbyAqKioqIGFyZSBjaGFuZ2VkIGR1ZSB0byAK
Jmd0OyZndDsgdGhpcyBmdW5jdGlvbiwgSSBhbSBub3Qgc3VyZSB3aGV0aGVyIGl0IGlzIGFwcHJv
cHJpYXRlLgomZ3Q7Jmd0OyAKJmd0OwomZ3Q7SSdtIG5vdCBzdWdnZXN0aW5nIHlvdSBjaGFuZ2Ug
cGluY3RybCBhdCBhbGwsIHNvIEknbSBub3Qgc3VyZSB3aGVyZSB5b3UKJmd0O2dvdCB0aGUgaWRl
YSB0aGF0IHdlJ2QgbmVlZCBzb21ldGhpbmcgc28gZHJhc3RpYyBhcyBjaGFuZ2luZyBlbnRpcmUK
Jmd0O3N1YnN5c3RlbXMuIFdoYXQgSSdtIHByb3Bvc2luZyBzaG91bGQgYm9pbCBkb3duIHRvIGEg
bmV3CiZndDtjb25maWd1cmF0aW9uIG9wdGlvbiB0byBwYXNzIHRocm91Z2ggdGhlIGdwaW8gdXNl
cnNwYWNlIGludGVyZmFjZSwKJmd0O3RoZW4gYWRkaW5nIGFwcHJvcHJpYXRlIHN1cHBvcnQgdG8g
dGhlIEdQSU8gZHJpdmVyLiBXZSBtaWdodCBuZWVkCiZndDt0byB0aW5rZXIgd2l0aCBwaW5jdHJs
IGEgbGl0dGxlIHRvIGdldCB0aGUgaW50ZXJmYWNlcyByaWdodCwgYnV0IG5vdGhpbmcgbW9yZS4K
Jmd0OwomZ3Q7QW5kcmV3CjwvcHJlPjwvZGl2Pjxicj48YnI+PHNwYW4gdGl0bGU9Im5ldGVhc2Vm
b290ZXIiPjxwPiZuYnNwOzwvcD48L3NwYW4+
------=_Part_31080_710154153.1574730006719--

