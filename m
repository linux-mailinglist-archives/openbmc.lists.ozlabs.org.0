Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 169911047D7
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2019 02:05:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JLvQ20b3zDqw3
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2019 12:05:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=163.com
 (client-ip=220.181.13.65; helo=m13-65.163.com;
 envelope-from=ouyangxuan10@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.b="Dx9vBKem"; 
 dkim-atps=neutral
Received: from m13-65.163.com (m13-65.163.com [220.181.13.65])
 by lists.ozlabs.org (Postfix) with ESMTP id 47JLtk55c8zDq63
 for <openbmc@lists.ozlabs.org>; Thu, 21 Nov 2019 12:04:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=AKazE
 UrecKi4ASAyRRx9lnx5Fw1RJVdPiU+8DUIw9g4=; b=Dx9vBKemZ8UE523ppXTMn
 06sAXAatIWqsc2E4iSgoMTcCjJFUGvZpM2+slFGwVhqTDNpvcqig0Dreq7gIvg7T
 PzE+9AA41Ym2mdpNZJO7yPpMNQ+BIXLMSMvmDbYLKW7Ryc3gHdVAJK54Loec0d6z
 Em4ae3yInyrUV6RR9WtRjk=
Received: from ouyangxuan10$163.com ( [106.120.127.15] ) by
 ajax-webmail-wmsvr65 (Coremail) ; Thu, 21 Nov 2019 09:02:18 +0800 (CST)
X-Originating-IP: [106.120.127.15]
Date: Thu, 21 Nov 2019 09:02:18 +0800 (CST)
From: www  <ouyangxuan10@163.com>
To: "Vijay Khemka" <vijaykhemka@fb.com>
Subject: Re:Re: Add build date to image
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190724(ac680a23)
 Copyright (c) 2002-2019 www.mailtech.cn 163com
In-Reply-To: <C7E32DAD-2454-4AF6-89C4-630DBC6898D9@fb.com>
References: <275367c1.6307.16e63b2e1cf.Coremail.ouyangxuan10@163.com>
 <adf92df5-06d4-ea38-ad9f-55dde92148b2@linux.ibm.com>
 <136be35a.269c.16e7c360818.Coremail.ouyangxuan10@163.com>
 <17d14e7a-1dc8-3375-a8a6-ea61c60e3bb7@linux.ibm.com>
 <67ca8d1c.28cc.16e8141d457.Coremail.ouyangxuan10@163.com>
 <0592b224-ccbc-30ad-d2aa-5c39f6481989@linux.ibm.com>
 <C7E32DAD-2454-4AF6-89C4-630DBC6898D9@fb.com>
X-CM-CTRLDATA: 8o7Vj2Zvb3Rlcl9odG09MTk4NTo1Ng==
Content-Type: multipart/alternative; 
 boundary="----=_Part_24952_277338773.1574298138023"
MIME-Version: 1.0
Message-ID: <af0b748.18f5.16e8b7b35a8.Coremail.ouyangxuan10@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: QcGowACHO6oa4tVdAAYYAQ--.40673W
X-CM-SenderInfo: prx1t0pj0xt0irq6il2tof0z/1tbiOQJz2lXlqFvhSAACs6
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

------=_Part_24952_277338773.1574298138023
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

RGVhciBKb3NlcGggJiBWaWpheSBLaGVta2EsCgoKTm8gbWF0dGVyIHdoYXQgeW91ciB2ZXJzaW9u
IGlzLCBidWlsZCBkYXRlIG9ubHkgcmVwcmVzZW50cyB0aGUgdGltZSB3aGVuIHRoZSBpbWFnZSB3
YXMgY3JlYXRlZC4KCgp0aGFua3MsCkJ5cm9uCgoKCgoKCkF0IDIwMTktMTEtMjEgMDI6MDg6NDAs
ICJWaWpheSBLaGVta2EiIDx2aWpheWtoZW1rYUBmYi5jb20+IHdyb3RlOgo+Cj4KPu+7v09uIDEx
LzIwLzE5LCA4OjQwIEFNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgSm9zZXBoIFJleW5vbGRzIiA8
b3BlbmJtYy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxhYnMub3JnIG9uIGJl
aGFsZiBvZiBqcmV5QGxpbnV4LmlibS5jb20+IHdyb3RlOgo+Cj4gICAgCj4gICAgT24gMTEvMTgv
MTkgNzoyMyBQTSwgd3d3IHdyb3RlOgo+ICAgID4gRGVhciBKb3NlcGjvvIwKPiAgICA+Cj4gICAg
PiBUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB5b3VyIGhlbHAuIEkganVzdCB3YW50IHRvIHNob3cg
dGhlIGNvbXBpbGUgCj4gICAgPiB0aW1lIG9mIGZpcm13YXJlIHRvIHRoZSB1c2VyLiBJZiAgb25s
eSBzaG93IHRoZSB2ZXJzaW9uLCBpdCBjYW4ndCAKPiAgICA+IGNvcnJlc3BvbmQgdG8gdGhlIHRp
bWUuIFdoZW4gYm90aCBhcmUgZGlzcGxheWVkIGF0IHRoZSBzYW1lIHRpbWUsIHRoZSAKPiAgICA+
IGluZm9ybWF0aW9uIHdpbGwgYmUgY2xlYXJlci4gdGhhbmtzIGFnYWluLgo+ICAgID4KPiAgICAK
PiAgICBCeXJvbiwgdGhhbmtzIGZvciB0aGF0LiAgSSB0aGluayBJIHVuZGVyc3RhbmQgeW91ciB1
c2UgY2FzZS4gSG93ZXZlciwgCj4gICAgZG9lcyB0aGlzIHByYWN0aWNlIGFzc3VtZSB0aGUgYnVp
bGQgZGF0ZSBpcyBjbG9zZSB0byB0aGUgZGF0ZSB3aGVuIHRoZSAKPiAgICBzb2Z0d2FyZSB2ZXJz
aW9uIHdhcyBjcmVhdGVkPwo+ICAgIC0gRm9yIGV4YW1wbGUsIEkgYXNzdW1lIHlvdSdsbCBtZXJn
ZSBhIGdpdCBjb21taXQgdG8gY3JlYXRlIGEgbmV3IAo+ICAgIHNvZnR3YXJlIHZlcnNpb24sIGFu
ZCB0aGVuIGJ1aWxkIGFuIGltYWdlIGJhc2VkIG9uIHRoYXQgY29tbWl0LiAgSW4gdGhpcyAKPiAg
ICB3YXksIHRoZSBidWlsZCBkYXRlIGNvcnJlbGF0ZXMgY2xvc2VseSB3aXRoIHRoZSB2ZXJzaW9u
Lgo+ICAgIC0gSG93ZXZlciwgaWYgeW91IGJ1aWxkIGFuIGltYWdlIGZyb20gYW4gb2xkZXIgY29t
bWl0LCBvciB3YWl0IGEgbG9uZyAKPiAgICB0aW1lIGJlZm9yZSBidWlsZGluZyBhbiBpbWFnZSwg
dGhlIGJ1aWxkIGRhdGUgd2lsbCBub3QgY29ycmVsYXRlIGNsb3NlbHkgCj4gICAgd2l0aCB0aGUg
dmVyc2lvbi4gIFRoaXMgY2FuIGJlIG1pc2xlYWRpbmcgYW5kIGxlYWQgdG8gZXJyb3JzIGluIGhh
bmRsaW5nIAo+ICAgIGltYWdlcy4KPgo+SSBndWVzcyBidWlsZCBkYXRlIHNob3VsZCBiZSB0aGUg
ZGF0ZSB2ZXJzaW9uIHdhcyByZWxlYXNlZCBvciBjcmVhdGVkLgo+ICAgIAo+ICAgIElzIHRoYXQg
YSBjb25jZXJuIGZvciB5b3U/Cj4gICAgCj4gICAgLSBKb3NlcGgKPiAgICAKPiAgICA+IHRoYW5r
cywKPiAgICA+IEJ5cm9uCj4gICAgPgo+ICAgIC4uLnNuaXAuLi4KPiAgICAKPiAgICAKPgo=
------=_Part_24952_277338773.1574298138023
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXY+RGVhciBKb3NlcGggJmFtcDsgVmlqYXkgS2hlbWthLDwv
ZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+Tm8gbWF0dGVyIHdoYXQgeW91ciB2ZXJzaW9uIGlzLCBi
dWlsZCBkYXRlIG9ubHkgcmVwcmVzZW50cyB0aGUgdGltZSB3aGVuIHRoZSBpbWFnZSB3YXMgY3Jl
YXRlZC48L2Rpdj48YnI+PGRpdj50aGFua3MsPC9kaXY+PGRpdj5CeXJvbjwvZGl2Pjxicj48YnI+
PGRpdiBzdHlsZT0icG9zaXRpb246cmVsYXRpdmU7em9vbToxIj48L2Rpdj48ZGl2IGlkPSJkaXZO
ZXRlYXNlTWFpbENhcmQiPjwvZGl2Pjxicj48cHJlPjxicj5BdCAyMDE5LTExLTIxIDAyOjA4OjQw
LCAiVmlqYXkgS2hlbWthIiAmbHQ7dmlqYXlraGVta2FAZmIuY29tJmd0OyB3cm90ZToKJmd0Owom
Z3Q7CiZndDvvu79PbiAxMS8yMC8xOSwgODo0MCBBTSwgIm9wZW5ibWMgb24gYmVoYWxmIG9mIEpv
c2VwaCBSZXlub2xkcyIgJmx0O29wZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlz
dHMub3psYWJzLm9yZyBvbiBiZWhhbGYgb2YganJleUBsaW51eC5pYm0uY29tJmd0OyB3cm90ZToK
Jmd0OwomZ3Q7ICAgIAomZ3Q7ICAgIE9uIDExLzE4LzE5IDc6MjMgUE0sIHd3dyB3cm90ZToKJmd0
OyAgICAmZ3Q7IERlYXIgSm9zZXBo77yMCiZndDsgICAgJmd0OwomZ3Q7ICAgICZndDsgVGhhbmsg
eW91IHZlcnkgbXVjaCBmb3IgeW91ciBoZWxwLiBJIGp1c3Qgd2FudCB0byBzaG93IHRoZSBjb21w
aWxlIAomZ3Q7ICAgICZndDsgdGltZSBvZiBmaXJtd2FyZSB0byB0aGUgdXNlci4gSWYgIG9ubHkg
c2hvdyB0aGUgdmVyc2lvbiwgaXQgY2FuJ3QgCiZndDsgICAgJmd0OyBjb3JyZXNwb25kIHRvIHRo
ZSB0aW1lLiBXaGVuIGJvdGggYXJlIGRpc3BsYXllZCBhdCB0aGUgc2FtZSB0aW1lLCB0aGUgCiZn
dDsgICAgJmd0OyBpbmZvcm1hdGlvbiB3aWxsIGJlIGNsZWFyZXIuIHRoYW5rcyBhZ2Fpbi4KJmd0
OyAgICAmZ3Q7CiZndDsgICAgCiZndDsgICAgQnlyb24sIHRoYW5rcyBmb3IgdGhhdC4gIEkgdGhp
bmsgSSB1bmRlcnN0YW5kIHlvdXIgdXNlIGNhc2UuIEhvd2V2ZXIsIAomZ3Q7ICAgIGRvZXMgdGhp
cyBwcmFjdGljZSBhc3N1bWUgdGhlIGJ1aWxkIGRhdGUgaXMgY2xvc2UgdG8gdGhlIGRhdGUgd2hl
biB0aGUgCiZndDsgICAgc29mdHdhcmUgdmVyc2lvbiB3YXMgY3JlYXRlZD8KJmd0OyAgICAtIEZv
ciBleGFtcGxlLCBJIGFzc3VtZSB5b3UnbGwgbWVyZ2UgYSBnaXQgY29tbWl0IHRvIGNyZWF0ZSBh
IG5ldyAKJmd0OyAgICBzb2Z0d2FyZSB2ZXJzaW9uLCBhbmQgdGhlbiBidWlsZCBhbiBpbWFnZSBi
YXNlZCBvbiB0aGF0IGNvbW1pdC4gIEluIHRoaXMgCiZndDsgICAgd2F5LCB0aGUgYnVpbGQgZGF0
ZSBjb3JyZWxhdGVzIGNsb3NlbHkgd2l0aCB0aGUgdmVyc2lvbi4KJmd0OyAgICAtIEhvd2V2ZXIs
IGlmIHlvdSBidWlsZCBhbiBpbWFnZSBmcm9tIGFuIG9sZGVyIGNvbW1pdCwgb3Igd2FpdCBhIGxv
bmcgCiZndDsgICAgdGltZSBiZWZvcmUgYnVpbGRpbmcgYW4gaW1hZ2UsIHRoZSBidWlsZCBkYXRl
IHdpbGwgbm90IGNvcnJlbGF0ZSBjbG9zZWx5IAomZ3Q7ICAgIHdpdGggdGhlIHZlcnNpb24uICBU
aGlzIGNhbiBiZSBtaXNsZWFkaW5nIGFuZCBsZWFkIHRvIGVycm9ycyBpbiBoYW5kbGluZyAKJmd0
OyAgICBpbWFnZXMuCiZndDsKJmd0O0kgZ3Vlc3MgYnVpbGQgZGF0ZSBzaG91bGQgYmUgdGhlIGRh
dGUgdmVyc2lvbiB3YXMgcmVsZWFzZWQgb3IgY3JlYXRlZC4KJmd0OyAgICAKJmd0OyAgICBJcyB0
aGF0IGEgY29uY2VybiBmb3IgeW91PwomZ3Q7ICAgIAomZ3Q7ICAgIC0gSm9zZXBoCiZndDsgICAg
CiZndDsgICAgJmd0OyB0aGFua3MsCiZndDsgICAgJmd0OyBCeXJvbgomZ3Q7ICAgICZndDsKJmd0
OyAgICAuLi5zbmlwLi4uCiZndDsgICAgCiZndDsgICAgCiZndDsKPC9wcmU+PC9kaXY+PGJyPjxi
cj48c3BhbiB0aXRsZT0ibmV0ZWFzZWZvb3RlciI+PHA+Jm5ic3A7PC9wPjwvc3Bhbj4=
------=_Part_24952_277338773.1574298138023--

