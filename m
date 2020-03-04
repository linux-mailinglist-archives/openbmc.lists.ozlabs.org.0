Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACFB1792E3
	for <lists+openbmc@lfdr.de>; Wed,  4 Mar 2020 15:58:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XcT24J4wzDqYY
	for <lists+openbmc@lfdr.de>; Thu,  5 Mar 2020 01:58:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=126.com
 (client-ip=220.181.15.37; helo=m15-37.126.com;
 envelope-from=guilin1985@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256
 header.s=s110527 header.b=kLMcS5k9; dkim-atps=neutral
Received: from m15-37.126.com (m15-37.126.com [220.181.15.37])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XcS92xllzDqVR
 for <openbmc@lists.ozlabs.org>; Thu,  5 Mar 2020 01:57:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=jhBGZ
 w2sYI4W13WitbgP56LDSz92VftCD2h7BaL7//8=; b=kLMcS5k9kkjZV/1V9dzQj
 MQ4s8Liy1hkkJnXNxUmYoOn7HhQyABeOt9OclFD+RTxZRvwJ6TvjF0TpC5ehn2Xo
 Nft4c5jkySvWftR8mxPHaO2qiMK+l1JQF1YHvbhGKylq+kZeRUMs7C0FRaYv8lKT
 I8UozfcQvuywdbQWPmfgBU=
Received: from guilin1985$126.com ( [218.88.47.219] ) by
 ajax-webmail-wmsvr37 (Coremail) ; Wed, 4 Mar 2020 22:27:05 +0800 (CST)
X-Originating-IP: [218.88.47.219]
Date: Wed, 4 Mar 2020 22:27:05 +0800 (CST)
From: =?GBK?B?sKK58A==?= <guilin1985@126.com>
To: openbmc@lists.ozlabs.org
Subject: OpenBMC's "virtual media"  Is jsnbd not support windows ISO?
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190724(ac680a23)
 Copyright (c) 2002-2020 www.mailtech.cn 126com
Content-Type: multipart/alternative; 
 boundary="----=_Part_126418_18286312.1583332025018"
MIME-Version: 1.0
Message-ID: <d2ea246.8692.170a5f162ba.Coremail.guilin1985@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: JcqowEBp1UK6ul9ekwNZAA--.60119W
X-CM-SenderInfo: xjxlzxrqrzmka6rslhhfrp/1tbi3Brch1pD+S4iuwAAsK
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

------=_Part_126418_18286312.1583332025018
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

ICAgICAgSGkgQWxsLiAgSSBzZWUgdGhlIGZlYXR1cmVzIG9mIE9wZW5CTUMncyAidmlydHVhbCBt
ZWRpYSIgaGFkIGZpbmlzaGVkIGZvciBhIGxvbmcgdGltZS4gIApCdXQgd2hlbiBpIHVzZSBhIGxp
bnV4IElTTyBmaWxlLCBpdCB3b3JrcyBvaywgYW5kIHdoZW4gaSB1c2UgYSB3aW5kb3dzIElTTyAs
aXQgc2FtZXMgdGhlIElTTyBwYXJ0aXRpb24gaXMgbm90IHJlY29nbml6ZWQuCkkgY3JlYXQgYSBu
YmQtc2VydmVyIGluIG15IHVidW50dSBzeXN0ZW0gd2l0aCBhIHdpbmRvd3MgSVNPLCAgYW5kIHRo
ZW4gb3BlbmJtYydzIG5iZC1jbGllbnQgIGNvbm5lY3RlIG5iZC1zZXJ2ZXIgd2VsbC4gCiAgICAg
VGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgdHdvIGlzIG9wZW5ibWMgdXNlIG5iZC1wcm94eSBp
bnN0ZWFkIG9mIG5iZC1zZXJ2ZXIuICBTbywgaXMgY3VycmVudCBqc25iZCBub3Qgc3VwcG9ydCB3
aW5kb3dzIElTTz8=
------=_Part_126418_18286312.1583332025018
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXY+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMzYsIDQxLCA0
Nik7IGZvbnQtZmFtaWx5OiAtYXBwbGUtc3lzdGVtLCBCbGlua01hY1N5c3RlbUZvbnQsICZxdW90
O1NlZ29lIFVJJnF1b3Q7LCBIZWx2ZXRpY2EsIEFyaWFsLCBzYW5zLXNlcmlmLCAmcXVvdDtBcHBs
ZSBDb2xvciBFbW9qaSZxdW90OywgJnF1b3Q7U2Vnb2UgVUkgRW1vamkmcXVvdDs7IGZvbnQtc2l6
ZTogMThweDsiPiZuYnNwOyAmbmJzcDsgJm5ic3A7IEhpIEFsbC4mbmJzcDsgSSBzZWUgdGhlJm5i
c3A7PC9zcGFuPjxmb250IGNvbG9yPSIjMjQyOTJlIiBmYWNlPSItYXBwbGUtc3lzdGVtLCBCbGlu
a01hY1N5c3RlbUZvbnQsIFNlZ29lIFVJLCBIZWx2ZXRpY2EsIEFyaWFsLCBzYW5zLXNlcmlmLCBB
cHBsZSBDb2xvciBFbW9qaSwgU2Vnb2UgVUkgRW1vamkiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6
IDE4cHg7Ij5mZWF0dXJlcyBvZiBPcGVuQk1DJ3MgIjwvc3Bhbj48L2ZvbnQ+PHNwYW4gc3R5bGU9
ImNvbG9yOiByZ2IoMzYsIDQxLCA0Nik7IGZvbnQtZmFtaWx5OiAtYXBwbGUtc3lzdGVtLCBCbGlu
a01hY1N5c3RlbUZvbnQsICZxdW90O1NlZ29lIFVJJnF1b3Q7LCBIZWx2ZXRpY2EsIEFyaWFsLCBz
YW5zLXNlcmlmLCAmcXVvdDtBcHBsZSBDb2xvciBFbW9qaSZxdW90OywgJnF1b3Q7U2Vnb2UgVUkg
RW1vamkmcXVvdDs7IGZvbnQtc2l6ZTogMThweDsiPnZpcnR1YWwgbWVkaWEiIGhhZCBmaW5pc2hl
ZCBmb3IgYSBsb25nIHRpbWU8L3NwYW4+PGZvbnQgY29sb3I9IiMyNDI5MmUiIGZhY2U9Ii1hcHBs
ZS1zeXN0ZW0sIEJsaW5rTWFjU3lzdGVtRm9udCwgU2Vnb2UgVUksIEhlbHZldGljYSwgQXJpYWws
IHNhbnMtc2VyaWYsIEFwcGxlIENvbG9yIEVtb2ppLCBTZWdvZSBVSSBFbW9qaSI+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZTogMThweDsiPi4mbmJzcDs8L3NwYW4+PC9mb250PjxzcGFuIHN0eWxlPSJj
b2xvcjogcmdiKDM2LCA0MSwgNDYpOyBmb250LWZhbWlseTogLWFwcGxlLXN5c3RlbSwgQmxpbmtN
YWNTeXN0ZW1Gb250LCAmcXVvdDtTZWdvZSBVSSZxdW90OywgSGVsdmV0aWNhLCBBcmlhbCwgc2Fu
cy1zZXJpZiwgJnF1b3Q7QXBwbGUgQ29sb3IgRW1vamkmcXVvdDssICZxdW90O1NlZ29lIFVJIEVt
b2ppJnF1b3Q7OyBmb250LXNpemU6IDE4cHg7Ij4mbmJzcDs8L3NwYW4+PC9kaXY+PGRpdj48c3Bh
biBzdHlsZT0iY29sb3I6IHJnYigzNiwgNDEsIDQ2KTsgZm9udC1mYW1pbHk6IC1hcHBsZS1zeXN0
ZW0sIEJsaW5rTWFjU3lzdGVtRm9udCwgJnF1b3Q7U2Vnb2UgVUkmcXVvdDssIEhlbHZldGljYSwg
QXJpYWwsIHNhbnMtc2VyaWYsICZxdW90O0FwcGxlIENvbG9yIEVtb2ppJnF1b3Q7LCAmcXVvdDtT
ZWdvZSBVSSBFbW9qaSZxdW90OzsgZm9udC1zaXplOiAxOHB4OyI+QnV0IHdoZW4gaSB1c2UgYSBs
aW51eCBJU08gZmlsZSwgaXQgd29ya3Mgb2ssIGFuZCB3aGVuIGkgdXNlIGEgd2luZG93cyBJU08g
LGl0IHNhbWVzIHRoZSBJU08gcGFydGl0aW9uIGlzIG5vdCByZWNvZ25pemVkLjwvc3Bhbj48L2Rp
dj48ZGl2Pjxmb250IGNvbG9yPSIjMjQyOTJlIiBmYWNlPSItYXBwbGUtc3lzdGVtLCBCbGlua01h
Y1N5c3RlbUZvbnQsIFNlZ29lIFVJLCBIZWx2ZXRpY2EsIEFyaWFsLCBzYW5zLXNlcmlmLCBBcHBs
ZSBDb2xvciBFbW9qaSwgU2Vnb2UgVUkgRW1vamkiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE4
cHg7Ij5JIGNyZWF0IGEgbmJkLXNlcnZlciBpbiBteSB1YnVudHUgc3lzdGVtIHdpdGggYSB3aW5k
b3dzIElTTywmbmJzcDsgYW5kIHRoZW4gb3BlbmJtYydzIG5iZC1jbGllbnQmbmJzcDsgY29ubmVj
dGUgbmJkLXNlcnZlciB3ZWxsLiZuYnNwOzwvc3Bhbj48L2ZvbnQ+PC9kaXY+PGRpdj48Zm9udCBj
b2xvcj0iIzI0MjkyZSIgZmFjZT0iLWFwcGxlLXN5c3RlbSwgQmxpbmtNYWNTeXN0ZW1Gb250LCBT
ZWdvZSBVSSwgSGVsdmV0aWNhLCBBcmlhbCwgc2Fucy1zZXJpZiwgQXBwbGUgQ29sb3IgRW1vamks
IFNlZ29lIFVJIEVtb2ppIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxOHB4OyI+Jm5ic3A7ICZu
YnNwOyAmbmJzcDtUaGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSB0d28gaXMgb3BlbmJtYyB1c2Ug
bmJkLXByb3h5IGluc3RlYWQgb2YgbmJkLXNlcnZlci4mbmJzcDsgU28sIGlzIGN1cnJlbnQganNu
YmQgbm90IHN1cHBvcnQgd2luZG93cyBJU08/PC9zcGFuPjwvZm9udD48L2Rpdj48L2Rpdj4=
------=_Part_126418_18286312.1583332025018--

