Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C01A64F12
	for <lists+openbmc@lfdr.de>; Thu, 11 Jul 2019 01:08:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kZcH53fqzDqT7
	for <lists+openbmc@lfdr.de>; Thu, 11 Jul 2019 09:08:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=zd-tech.com.cn
 (client-ip=220.181.97.177; helo=m97177.mail.qiye.163.com;
 envelope-from=yangliu1@zd-tech.com.cn; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=zd-tech.com.cn
X-Greylist: delayed 329 seconds by postgrey-1.36 at bilbo;
 Tue, 09 Jul 2019 18:02:20 AEST
Received: from m97177.mail.qiye.163.com (m97177.mail.qiye.163.com
 [220.181.97.177])
 by lists.ozlabs.org (Postfix) with ESMTP id 45jZY82TSVzDqRh
 for <openbmc@lists.ozlabs.org>; Tue,  9 Jul 2019 18:02:17 +1000 (AEST)
Received: from yangliu1$zd-tech.com.cn ( [218.247.145.2] ) by
 ajax-webmail-wmsvr17 (Coremail) ; Tue, 9 Jul 2019 15:56:31 +0800 (CST)
X-Originating-IP: [218.247.145.2]
Date: Tue, 9 Jul 2019 15:56:31 +0800 (CST)
From: =?GBK?B?wfXR9A==?= <yangliu1@zd-tech.com.cn>
To: openbmc@lists.ozlabs.org
Subject: How to set BMC NCSI use two ports in the same IP address?
X-Priority: 3
X-Mailer: Coremail Webmail Server Version SP_ntes V3.5 build
 20190614(cb3344cf) Copyright (c) 2002-2019 www.mailtech.cn 163-hosting
Content-Type: multipart/alternative; 
 boundary="----=_Part_108216_882585963.1562658991417"
MIME-Version: 1.0
Message-ID: <35a93598.9f8b.16bd5bbed3a.Coremail.yangliu1@zd-tech.com.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: seCowADH4tqvSCRdHSHWAA--.16344W
X-CM-SenderInfo: p1dqwzdlxrq63gnwvu3kof0zgofq/1tbiPAXscVyqDrs4+wABsl
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Approved-At: Thu, 11 Jul 2019 09:08:06 +1000
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
Cc: subscribed@noreply.github.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

------=_Part_108216_882585963.1562658991417
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

SGkgQWxsLAogICAgIEkgYW0gd29ya2luZyBvbiB0aGUgMi42IHJlbGVhc2UgaW4gb3BlbmJtYy4g
SSBoYXZlIGEgcXVlc3Rpb24gYWJvdXQgTkNTSSBuZXR3b3JrLgogICAgVGhlIE5DU0kgaXMgd29y
a2luZyBpbiBCQ00gbmljLCB3aG9zZSB2ZXJzaW9uIGlzIEJSQ00gMTBHIDJQIDU3NDE2IE9DUCBN
ZXp6LgpUaGVyZSBhcmUgY3VycmVudGx5IHR3byBwb3J0cyBvbiB0aGlzIG5ldHdvcmsgY2FyZCwg
b25lIG9mIHdoaWNoIGlzIGF2YWlsYWJsZSBhbmQgdGhlIG90aGVyIAppcyBub3Qgd2hlbiBibWMg
IGlzIHJ1bm5pbmcuIFRoZSBVLWJvb3QgSSB1c2UgMjAxNi4wNy5iYiBhbmQgIHRoZSBrZXJuZWwg
aXMgNC4xOC4xNi4gVGhlIGR0cyAKaW5jbHVkZSBtYWMwIGNvbmZpZ3VyZSwgd2hpY2ggaXMgdXNl
IG5jc2kuCiAgICAgSSBuZWVkIGJvdGggcG9ydHMgYXZhaWxhYmxlIGFuZCB1c2luZyB0aGUgc2Ft
ZSBJUCwgYnV0IEkgZG9uJ3Qga25vdyBIb3cgdG8gZG8gaXQ/CgoKUmVnYXJkcywKWWFuZw==
------=_Part_108216_882585963.1562658991417
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXYgc3R5bGU9ImxpbmUtaGVpZ2h0OiAxLjc7Ij48ZGl2IHN0
eWxlPSJjb2xvcjogcmdiKDAsIDAsIDApOyBmb250LWZhbWlseTogQXJpYWw7IGZvbnQtc2l6ZTog
MTRweDsiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE4cHg7Ij5IaSBBbGwsPC9zcGFuPjwvZGl2
PjxkaXYgc3R5bGU9ImNvbG9yOiByZ2IoMCwgMCwgMCk7IGZvbnQtZmFtaWx5OiBBcmlhbDsgZm9u
dC1zaXplOiAxNHB4OyI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMThweDsiPiZuYnNwOyAmbmJz
cDsgJm5ic3A7SSBhbSB3b3JraW5nIG9uIHRoZSAyLjYgcmVsZWFzZSBpbiBvcGVuYm1jLiBJIGhh
dmUgYSBxdWVzdGlvbiBhYm91dCBOQ1NJIG5ldHdvcmsuPC9zcGFuPjwvZGl2PjxkaXYgc3R5bGU9
ImNvbG9yOiByZ2IoMCwgMCwgMCk7IGZvbnQtZmFtaWx5OiBBcmlhbDsgZm9udC1zaXplOiAxNHB4
OyI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMThweDsiPiZuYnNwOyAmbmJzcDsgVGhlIE5DU0kg
aXMgd29ya2luZyBpbiBCQ00gbmljLCB3aG9zZSB2ZXJzaW9uIGlzIEJSQ00gMTBHIDJQIDU3NDE2
IE9DUCBNZXp6Ljwvc3Bhbj48L2Rpdj48ZGl2IHN0eWxlPSJjb2xvcjogcmdiKDAsIDAsIDApOyBm
b250LWZhbWlseTogQXJpYWw7IGZvbnQtc2l6ZTogMTRweDsiPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6IDE4cHg7Ij5UaGVyZSBhcmUgY3VycmVudGx5IHR3byBwb3J0cyBvbiB0aGlzIG5ldHdvcmsg
Y2FyZCwgb25lIG9mIHdoaWNoIGlzIGF2YWlsYWJsZSBhbmQgdGhlIG90aGVyJm5ic3A7PC9zcGFu
PjwvZGl2PjxkaXYgc3R5bGU9IiI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMCwgMCwgMCk7IGZv
bnQtZmFtaWx5OiBBcmlhbDsgZm9udC1zaXplOiAxOHB4OyI+aXMgbm90IHdoZW4gYm1jJm5ic3A7
IGlzIHJ1bm5pbmcuIFRoZSBVLWJvb3QgSSB1c2UmbmJzcDs8L3NwYW4+PHNwYW4gc3R5bGU9ImZv
bnQtc2l6ZTogMThweDsiPjIwMTYuMDcuYmIgYW5kJm5ic3A7IHRoZSBrZXJuZWwgaXMmbmJzcDs0
LjE4LjE2LiBUaGUgZHRzJm5ic3A7PC9zcGFuPjwvZGl2PjxkaXYgc3R5bGU9IiI+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZTogMThweDsiPmluY2x1ZGUgbWFjMCBjb25maWd1cmUsIHdoaWNoIGlzIHVz
ZSBuY3NpLjwvc3Bhbj48L2Rpdj48ZGl2IHN0eWxlPSJjb2xvcjogcmdiKDAsIDAsIDApOyBmb250
LWZhbWlseTogQXJpYWw7IGZvbnQtc2l6ZTogMTRweDsiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6
IDE4cHg7Ij4mbmJzcDsgJm5ic3A7ICZuYnNwO0kgbmVlZCBib3RoIHBvcnRzIGF2YWlsYWJsZSBh
bmQgdXNpbmcgdGhlIHNhbWUgSVAsIGJ1dCBJIGRvbid0IGtub3cgSG93IHRvIGRvIGl0Pzwvc3Bh
bj48L2Rpdj48ZGl2IHN0eWxlPSJjb2xvcjogcmdiKDAsIDAsIDApOyBmb250LWZhbWlseTogQXJp
YWw7IGZvbnQtc2l6ZTogMTRweDsiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE4cHg7Ij48YnI+
PC9zcGFuPjwvZGl2PjxkaXYgc3R5bGU9ImNvbG9yOiByZ2IoMCwgMCwgMCk7IGZvbnQtZmFtaWx5
OiBBcmlhbDsgZm9udC1zaXplOiAxNHB4OyI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMThweDsi
PlJlZ2FyZHMsPC9zcGFuPjwvZGl2PjxkaXYgc3R5bGU9ImNvbG9yOiByZ2IoMCwgMCwgMCk7IGZv
bnQtZmFtaWx5OiBBcmlhbDsgZm9udC1zaXplOiAxNHB4OyI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6
ZTogMThweDsiPllhbmc8L3NwYW4+PC9kaXY+PC9kaXY+PC9kaXY+
------=_Part_108216_882585963.1562658991417--

