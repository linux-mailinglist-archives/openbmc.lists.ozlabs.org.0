Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC23AB2A32
	for <lists+openbmc@lfdr.de>; Sat, 14 Sep 2019 08:48:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46VjkW3KjrzF5t5
	for <lists+openbmc@lfdr.de>; Sat, 14 Sep 2019 16:48:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=163.com
 (client-ip=220.181.13.124; helo=m13-124.163.com;
 envelope-from=xiaoqian1641@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.b="KLNDer3Y"; 
 dkim-atps=neutral
Received: from m13-124.163.com (m13-124.163.com [220.181.13.124])
 by lists.ozlabs.org (Postfix) with ESMTP id 46Vjjl5QMNzF5sQ
 for <openbmc@lists.ozlabs.org>; Sat, 14 Sep 2019 16:47:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=uXv7u
 ufBhYWDOz0yBYCS7S3/XMRRjPvKIY+RqSE7pRs=; b=KLNDer3YXkKFKi3vb7kqt
 c9ZXmBHKqfZOvATsyOXwxKrFTM9bXDN6uZUMmTYlF6QjFeBBAA1f3jIKKenr5B0N
 Ltxu6nOVT9cb8r51UfomUb87brONF3t6/ZrJcnRro1a2GOhoGlwic+lcdBlv4KMU
 A14XA/j0TBCrZ6yKV7Wp3s=
Received: from xiaoqian1641$163.com ( [106.120.127.15] ) by
 ajax-webmail-wmsvr124 (Coremail) ; Sat, 14 Sep 2019 14:47:10 +0800 (CST)
X-Originating-IP: [106.120.127.15]
Date: Sat, 14 Sep 2019 14:47:10 +0800 (CST)
From: =?GBK?B?s6PP/sP3?= <xiaoqian1641@163.com>
To: "William Kennington" <wak@google.com>
Subject: Re:Re: Fw:How to use gtest/gmock in openbmc
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190724(ac680a23)
 Copyright (c) 2002-2019 www.mailtech.cn 163com
In-Reply-To: <CAPnigK=RCCa41ya98pgdmB+A1SK16o4XwbLBWa_g41vzgkm47g@mail.gmail.com>
References: <2d7b6a6d.52d2.16d2372efd5.Coremail.xiaoqian1641@163.com>
 <CAPnigK=RCCa41ya98pgdmB+A1SK16o4XwbLBWa_g41vzgkm47g@mail.gmail.com>
X-CM-CTRLDATA: ZeVDN2Zvb3Rlcl9odG09MjUwNzo1Ng==
Content-Type: multipart/alternative; 
 boundary="----=_Part_47831_1732318759.1568443630106"
MIME-Version: 1.0
Message-ID: <70dba3d7.301b.16d2e86821a.Coremail.xiaoqian1641@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: fMGowADHz9vujHxd8DgpAQ--.6302W
X-CM-SenderInfo: 50ld01pldqiliur6il2tof0z/1tbiLx4wfFUMPT54VwAAsI
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
Cc: OpenBMC Development <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

------=_Part_47831_1732318759.1568443630106
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

SGksIFdpbGxpYW0sCgoKVGhhbmtzIGZvciB5b3VyIHJlcGx5LgpZb3UgbmVlZCB0byBoYXZlIGFs
bCBvZiB0aGUgcmVxdWlzaXRlIHBhY2thZ2VzIGluIHlvdXIgZGV2ZWxvcG1lbnQgZW52aXJvbm1l
bnQsIHRoZW4geW91IGNhbiBydW4KYGBgCm1lc29uIHNldHVwIGJ1aWxkCm1lc29uIHRlc3QgLUMg
YnVpbGQKCmBgYApDb3VsZCB5b3UgdGVsbCBtZSBleGFjdGx5IHdoaWNoIHBhY2thZ2VzIGFyZSBu
ZWVkZWQgo78KCgo+VGhlIGVhc2llc3Qgd2F5IHRvIGRvIHRoaXMgaXMgdG8gdXNlIHRoZSBkb2Nr
ZXIgZW52aXJvbm1lbnQgZnJvbQo+aHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvb3BlbmJtYy1i
dWlsZC1zY3JpcHRzLCBzcGVjaWZpY2FsbHkgdGhlCgo+c2NyaXB0IGBydW4tdW5pdC10ZXN0LWRv
Y2tlci5zaGAKSSByYW4gIi4vcnVuLXVuaXQtdGVzdC1kb2NrZXIuc2giICwgaXQgc2hvd3Mgc29t
ZXRoaW5nIGVycm9ycywgSSB0aGluayBpdCBtYXliZSBuZWVkIHNvbWUgb3B0aW9ucy4KQ291bGQg
eW91IGdpdmUgbWUgYW4gZXhhbXBsZSwgbGlrZSB0ZXN0IHRoZSAic2RidXNwbHVzIj8KCgpKb2hu
eQpUaGFua3MgdmVyeSBtdWNoCgoKCgpBdCAyMDE5LTA5LTEyIDExOjQ1OjI2LCAiV2lsbGlhbSBL
ZW5uaW5ndG9uIiA8d2FrQGdvb2dsZS5jb20+IHdyb3RlOgo+WW91IG5lZWQgdG8gaGF2ZSBhbGwg
b2YgdGhlIHJlcXVpc2l0ZSBwYWNrYWdlcyBpbiB5b3VyIGRldmVsb3BtZW50Cj5lbnZpcm9ubWVu
dCwgdGhlbiB5b3UgY2FuIHJ1bgo+YGBgCj5tZXNvbiBzZXR1cCBidWlsZAo+bWVzb24gdGVzdCAt
QyBidWlsZAo+YGBgCj53aGljaCByZW1pbmRzIG1lLCBpIG5lZWQgdG8gdXBkYXRlIHRoZSBkb2N1
bWVudGF0aW9uIGluIHRoZSByZWFkbWUuLi4KPgo+VGhlIGVhc2llc3Qgd2F5IHRvIGRvIHRoaXMg
aXMgdG8gdXNlIHRoZSBkb2NrZXIgZW52aXJvbm1lbnQgZnJvbQo+aHR0cHM6Ly9naXRodWIuY29t
L29wZW5ibWMvb3BlbmJtYy1idWlsZC1zY3JpcHRzLCBzcGVjaWZpY2FsbHkgdGhlCj5zY3JpcHQg
YHJ1bi11bml0LXRlc3QtZG9ja2VyLnNoYAo+Cj5PbiBXZWQsIFNlcCAxMSwgMjAxOSBhdCA4OjI2
IFBNILOjz/7D9yA8eGlhb3FpYW4xNjQxQDE2My5jb20+IHdyb3RlOgo+Pgo+PiBIaSwgT3BlbkJN
QyBkZXZlbG9wbWVudCBtZW1iZXIsCj4+Cj4+IEknbSBsZWFybmluZyBvcGVuYm1jIHZpYSBnaXRo
dWIuCj4+IEkgd2FudGVkIHRvIHRlc3QgdGhlIGNvZGUgb2YgT3BlbkJNQyB0aHJvdWdoIEd0ZXN0
L0dtb2NrLCBBbmQgSSBGb3VuZCB0aGUgT3BlbkJNQyBzb3VyY2UgY29kZSBhbHJlYWR5IGhhZCB0
aGUgdGVzdCBwYWNrYWdlLGJ1dCBpdCBjYW5ub3QgYmUgY29tcGlsZWQgYWNjb3JkaW5nIHRvIFJF
QURNRS5tZC4KPj4gSSB0aGluayBpdCBtYXkgYmUgbXkgY29tcGlsYXRpb24gbWV0aG9kIGlzIG5v
dCBjb3JyZWN0LCBEbyB5b3UgaGF2ZSBhbnkgZG9jdW1lbnRhdGlvbiBhYm91dCB0aGlzID8KPj4K
Pj4gQ291bGQgeW91IHRlbGwgbWUgSG93IHRvIHRlc3QgInNkZXZlbnRwbHVzIiA/Cj4+Cj4+IFRo
YW5rcyB2ZXJ5IG1vdWNoLgo+PiBKb2hueQo+Pgo+Pgo+Pgo+Pgo+Pgo+Pgo+Pgo+Pgo+Pgo+Pgo+
Pgo+Pgo+Pgo+Pgo+Pgo+Pgo=
------=_Part_47831_1732318759.1568443630106
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXY+SGksJm5ic3A7PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5
OiBhcmlhbDsgd2hpdGUtc3BhY2U6IHByZS13cmFwOyI+V2lsbGlhbSw8L3NwYW4+PC9kaXY+PGRp
dj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6IGFyaWFsOyB3aGl0ZS1zcGFjZTogcHJlLXdyYXA7
Ij48YnI+PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiBhcmlhbDsg
d2hpdGUtc3BhY2U6IHByZS13cmFwOyI+VGhhbmtzIGZvciB5b3VyIHJlcGx5Ljwvc3Bhbj48L2Rp
dj48cHJlPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDAsIDAsIDI1NSk7Ij5Zb3UgbmVlZCB0byBo
YXZlIGFsbCBvZiB0aGUgcmVxdWlzaXRlIHBhY2thZ2VzIGluIHlvdXIgZGV2ZWxvcG1lbnQgZW52
aXJvbm1lbnQsIHRoZW4geW91IGNhbiBydW4KYGBgCm1lc29uIHNldHVwIGJ1aWxkCm1lc29uIHRl
c3QgLUMgYnVpbGQKPC9zcGFuPjxkaXY+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMCwgMCwgMjU1
KTsiPmBgYDwvc3Bhbj48L2Rpdj48ZGl2Pjxmb250IGNvbG9yPSIjMDAwMGZmIj48c3BhbiBzdHls
ZT0iY29sb3I6IHJnYigwLCAwLCAwKTsiPkNvdWxkIHlvdSB0ZWxsIG1lIGV4YWN0bHkgd2hpY2gg
PC9zcGFuPjwvZm9udD48c3BhbiBzdHlsZT0iY29sb3I6IHJnYigwLCAwLCAwKTsiPnBhY2thZ2Vz
IGFyZSBuZWVkZWQgo788L3NwYW4+PC9kaXY+PGRpdj48YnI+PC9kaXY+PC9wcmU+PHByZT4mZ3Q7
VGhlIGVhc2llc3Qgd2F5IHRvIGRvIHRoaXMgaXMgdG8gdXNlIHRoZSBkb2NrZXIgZW52aXJvbm1l
bnQgZnJvbQomZ3Q7aHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvb3BlbmJtYy1idWlsZC1zY3Jp
cHRzLCBzcGVjaWZpY2FsbHkgdGhlCjxkaXY+Jmd0O3NjcmlwdCBgcnVuLXVuaXQtdGVzdC1kb2Nr
ZXIuc2hgPC9kaXY+PGRpdj5JIHJhbiAiLi9ydW4tdW5pdC10ZXN0LWRvY2tlci5zaCIgLCBpdCBz
aG93cyBzb21ldGhpbmcgZXJyb3JzLCBJIHRoaW5rIGl0IG1heWJlIG5lZWQgc29tZSBvcHRpb25z
LjwvZGl2PjxkaXY+Q291bGQgeW91IGdpdmUgbWUgYW4gZXhhbXBsZSwgbGlrZSB0ZXN0IHRoZSAi
c2RidXNwbHVzIj88L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkpvaG55PC9kaXY+PGRpdj5UaGFu
a3MgdmVyeSBtdWNoPC9kaXY+PC9wcmU+PHByZT48ZGl2Pjxicj48L2Rpdj48ZGl2Pjxicj48L2Rp
dj48ZGl2PkF0IDIwMTktMDktMTIgMTE6NDU6MjYsICJXaWxsaWFtIEtlbm5pbmd0b24iICZsdDt3
YWtAZ29vZ2xlLmNvbSZndDsgd3JvdGU6PC9kaXY+Jmd0O1lvdSBuZWVkIHRvIGhhdmUgYWxsIG9m
IHRoZSByZXF1aXNpdGUgcGFja2FnZXMgaW4geW91ciBkZXZlbG9wbWVudAomZ3Q7ZW52aXJvbm1l
bnQsIHRoZW4geW91IGNhbiBydW4KJmd0O2BgYAomZ3Q7bWVzb24gc2V0dXAgYnVpbGQKJmd0O21l
c29uIHRlc3QgLUMgYnVpbGQKJmd0O2BgYAomZ3Q7d2hpY2ggcmVtaW5kcyBtZSwgaSBuZWVkIHRv
IHVwZGF0ZSB0aGUgZG9jdW1lbnRhdGlvbiBpbiB0aGUgcmVhZG1lLi4uCiZndDsKJmd0O1RoZSBl
YXNpZXN0IHdheSB0byBkbyB0aGlzIGlzIHRvIHVzZSB0aGUgZG9ja2VyIGVudmlyb25tZW50IGZy
b20KJmd0O2h0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL29wZW5ibWMtYnVpbGQtc2NyaXB0cywg
c3BlY2lmaWNhbGx5IHRoZQomZ3Q7c2NyaXB0IGBydW4tdW5pdC10ZXN0LWRvY2tlci5zaGAKJmd0
OwomZ3Q7T24gV2VkLCBTZXAgMTEsIDIwMTkgYXQgODoyNiBQTSCzo8/+w/cgJmx0O3hpYW9xaWFu
MTY0MUAxNjMuY29tJmd0OyB3cm90ZToKJmd0OyZndDsKJmd0OyZndDsgSGksIE9wZW5CTUMgZGV2
ZWxvcG1lbnQgbWVtYmVyLAomZ3Q7Jmd0OwomZ3Q7Jmd0OyBJJ20gbGVhcm5pbmcgb3BlbmJtYyB2
aWEgZ2l0aHViLgomZ3Q7Jmd0OyBJIHdhbnRlZCB0byB0ZXN0IHRoZSBjb2RlIG9mIE9wZW5CTUMg
dGhyb3VnaCBHdGVzdC9HbW9jaywgQW5kIEkgRm91bmQgdGhlIE9wZW5CTUMgc291cmNlIGNvZGUg
YWxyZWFkeSBoYWQgdGhlIHRlc3QgcGFja2FnZSxidXQgaXQgY2Fubm90IGJlIGNvbXBpbGVkIGFj
Y29yZGluZyB0byBSRUFETUUubWQuCiZndDsmZ3Q7IEkgdGhpbmsgaXQgbWF5IGJlIG15IGNvbXBp
bGF0aW9uIG1ldGhvZCBpcyBub3QgY29ycmVjdCwgRG8geW91IGhhdmUgYW55IGRvY3VtZW50YXRp
b24gYWJvdXQgdGhpcyA/CiZndDsmZ3Q7CiZndDsmZ3Q7IENvdWxkIHlvdSB0ZWxsIG1lIEhvdyB0
byB0ZXN0ICJzZGV2ZW50cGx1cyIgPwomZ3Q7Jmd0OwomZ3Q7Jmd0OyBUaGFua3MgdmVyeSBtb3Vj
aC4KJmd0OyZndDsgSm9obnkKJmd0OyZndDsKJmd0OyZndDsKJmd0OyZndDsKJmd0OyZndDsKJmd0
OyZndDsKJmd0OyZndDsKJmd0OyZndDsKJmd0OyZndDsKJmd0OyZndDsKJmd0OyZndDsKJmd0OyZn
dDsKJmd0OyZndDsKJmd0OyZndDsKJmd0OyZndDsKJmd0OyZndDsKJmd0OyZndDsKPC9wcmU+PC9k
aXY+PGJyPjxicj48c3BhbiB0aXRsZT0ibmV0ZWFzZWZvb3RlciI+PHA+Jm5ic3A7PC9wPjwvc3Bh
bj4=
------=_Part_47831_1732318759.1568443630106--

