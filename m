Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98664174443
	for <lists+openbmc@lfdr.de>; Sat, 29 Feb 2020 02:44:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Tq356DlbzDrMv
	for <lists+openbmc@lfdr.de>; Sat, 29 Feb 2020 12:44:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=163.com
 (client-ip=220.181.13.84; helo=m13-84.163.com;
 envelope-from=ouyangxuan10@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=oW2lCu/a; dkim-atps=neutral
Received: from m13-84.163.com (m13-84.163.com [220.181.13.84])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Tq2K388fzDrM9
 for <openbmc@lists.ozlabs.org>; Sat, 29 Feb 2020 12:44:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=5L/D7
 JqPLWmLxI9D1/vipxDxc9RX1uFRTZZ5eUr6eMQ=; b=oW2lCu/aRIC9sv3n0awhR
 9YfmrfNvynB4wVcyI/EcE+I4jrPnyzFkzrH+u9Vf/2xF+2SwLvh3SFXJDOpySkp6
 nrEONlzbRraJ26vFdjqMy7Vq/mr3CuQ6xa8eEoXE0DtsoAfWVl44rn5vgm/AvAUp
 UPbAmf6xa8JCEuC4yOA2ic=
Received: from ouyangxuan10$163.com ( [222.128.178.231] ) by
 ajax-webmail-wmsvr84 (Coremail) ; Sat, 29 Feb 2020 09:43:54 +0800 (CST)
X-Originating-IP: [222.128.178.231]
Date: Sat, 29 Feb 2020 09:43:54 +0800 (CST)
From: www  <ouyangxuan10@163.com>
To: "Vijay Khemka" <vijaykhemka@fb.com>
Subject: Re:Re: [OpenBMC]: How to get the update progress when flashing BMC
 firmware?
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190724(ac680a23)
 Copyright (c) 2002-2020 www.mailtech.cn 163com
In-Reply-To: <9B1332BB-7D2B-4BB9-9EE0-1EC1D5FD1E8A@fb.com>
References: <2042ec12.4c6e.1708abdbe56.Coremail.ouyangxuan10@163.com>
 <9B1332BB-7D2B-4BB9-9EE0-1EC1D5FD1E8A@fb.com>
X-CM-CTRLDATA: aw9VEGZvb3Rlcl9odG09Mjc1Njo1Ng==
Content-Type: multipart/alternative; 
 boundary="----=_Part_13139_1192797724.1582940634144"
MIME-Version: 1.0
Message-ID: <d366164.d52.1708e9d3c20.Coremail.ouyangxuan10@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: VMGowABnhY3awVleCEeFAQ--.5308W
X-CM-SenderInfo: prx1t0pj0xt0irq6il2tof0z/1tbiWRLX2lWBpXKrxQACsp
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

------=_Part_13139_1192797724.1582940634144
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

eWVzLCBJIGp1c3Qgd2FudCB0byB0ZWxsIHRoZSB1c2VyIHRoZSBwcm9ncmVzcyBvZiB0aGUgdXBk
YXRlIGFuZCB3aGV0aGVyIHRoZSB1cGRhdGUgaXMgY29tcGxldGUuCgoKdGhhbmtzLApCeXJvbgoK
CgoKCgoKCgpBdCAyMDIwLTAyLTI5IDAxOjMwOjAxLCAiVmlqYXkgS2hlbWthIiA8dmlqYXlraGVt
a2FAZmIuY29tPiB3cm90ZToKCkkgZG9uoa90IHRoaW5rIHRoZXJlIGlzIG11Y2ggdG8gc2hvdyBh
cyBwcm9ncmVzcyB3aGVuIGJtYyB1cGdyYWRlIGhhcHBlbnMuIEJlY2F1c2UgYWN0dWFsIGZsYXNo
IHdyaXRlIGhhcHBlbnMgZHVyaW5nIHJlYm9vdCBhbmQgdGhhdCB0aW1lIGV2ZXJ5IG90aGVyIHBy
b2Nlc3Mgd291bGQgYmUgZG93biBJIGd1ZXNzLgoKIAoKRnJvbTogb3BlbmJtYyA8b3BlbmJtYy1i
b3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxhYnMub3JnPiBvbiBiZWhhbGYgb2Yg
d3d3IDxvdXlhbmd4dWFuMTBAMTYzLmNvbT4KRGF0ZTogVGh1cnNkYXksIEZlYnJ1YXJ5IDI3LCAy
MDIwIGF0IDExOjU3IFBNClRvOiAib3BlbmJtY0BsaXN0cy5vemxhYnMub3JnIiA8b3BlbmJtY0Bs
aXN0cy5vemxhYnMub3JnPgpTdWJqZWN0OiBbT3BlbkJNQ106IEhvdyB0byBnZXQgdGhlIHVwZGF0
ZSBwcm9ncmVzcyB3aGVuIGZsYXNoaW5nIEJNQyBmaXJtd2FyZT8KCiAKCmhpo6wKCiAKCkhvdyB0
byBnZXQgdGhlIHVwZGF0ZSBwcm9ncmVzcyB3aGVuIEJNQyBpcyBmbGFzaGluZy4gSXQgY2FuIGJl
IGRpc3BsYXllZCBvbiB3ZWJ1aS4KCiAKCnRoYW5rcywKCkJ5cm9uCgoKCgoKCiA=
------=_Part_13139_1192797724.1582940634144
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXY+eWVzLCZuYnNwO0kganVzdCB3YW50IHRvIHRlbGwgdGhl
IHVzZXIgdGhlIHByb2dyZXNzIG9mIHRoZSB1cGRhdGUgYW5kIHdoZXRoZXIgdGhlIHVwZGF0ZSBp
cyBjb21wbGV0ZS48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PnRoYW5rcyw8L2Rpdj48ZGl2PkJ5
cm9uPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRp
diBzdHlsZT0icG9zaXRpb246cmVsYXRpdmU7em9vbToxIj48L2Rpdj48ZGl2IGlkPSJkaXZOZXRl
YXNlTWFpbENhcmQiPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxwPkF0IDIwMjAtMDItMjkgMDE6MzA6
MDEsICJWaWpheSBLaGVta2EiICZsdDt2aWpheWtoZW1rYUBmYi5jb20mZ3Q7IHdyb3RlOjwvcD48
YmxvY2txdW90ZSBpZD0iaXNSZXBseUNvbnRlbnQiIHN0eWxlPSJQQURESU5HLUxFRlQ6IDFleDsg
TUFSR0lOOiAwcHggMHB4IDBweCAwLjhleDsgQk9SREVSLUxFRlQ6ICNjY2MgMXB4IHNvbGlkIj4K
CgoKPHN0eWxlPjwvc3R5bGU+CgoKPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+SSBkb26hr3QgdGhpbmsgdGhlcmUgaXMgbXVjaCB0byBzaG93IGFzIHByb2dy
ZXNzIHdoZW4gYm1jIHVwZ3JhZGUgaGFwcGVucy4gQmVjYXVzZSBhY3R1YWwgZmxhc2ggd3JpdGUg
aGFwcGVucyBkdXJpbmcgcmVib290IGFuZCB0aGF0IHRpbWUgZXZlcnkgb3RoZXIgcHJvY2VzcyB3
b3VsZCBiZSBkb3duIEkgZ3Vlc3MuPG86cD48L286cD48L3A+CjxwIGNsYXNzPSJNc29Ob3JtYWwi
PjxvOnA+Jm5ic3A7PC9vOnA+PC9wPgo8ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItdG9w
OnNvbGlkICNCNUM0REYgMS4wcHQ7cGFkZGluZzozLjBwdCAwaW4gMGluIDBpbiI+CjxwIGNsYXNz
PSJNc29Ob3JtYWwiPjxiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNr
Ij5Gcm9tOiA8L3NwYW4+PC9iPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJs
YWNrIj5vcGVuYm1jICZsdDtvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3Rz
Lm96bGFicy5vcmcmZ3Q7IG9uIGJlaGFsZiBvZiB3d3cgJmx0O291eWFuZ3h1YW4xMEAxNjMuY29t
Jmd0Ozxicj4KPGI+RGF0ZTogPC9iPlRodXJzZGF5LCBGZWJydWFyeSAyNywgMjAyMCBhdCAxMTo1
NyBQTTxicj4KPGI+VG86IDwvYj4ib3BlbmJtY0BsaXN0cy5vemxhYnMub3JnIiAmbHQ7b3BlbmJt
Y0BsaXN0cy5vemxhYnMub3JnJmd0Ozxicj4KPGI+U3ViamVjdDogPC9iPltPcGVuQk1DXTogSG93
IHRvIGdldCB0aGUgdXBkYXRlIHByb2dyZXNzIHdoZW4gZmxhc2hpbmcgQk1DIGZpcm13YXJlPzxv
OnA+PC9vOnA+PC9zcGFuPjwvcD4KPC9kaXY+CjxkaXY+CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxv
OnA+Jm5ic3A7PC9vOnA+PC9wPgo8L2Rpdj4KPGRpdj4KPGRpdj4KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMC41cHQ7Zm9udC1mYW1pbHk6JnF1b3Q7QXJpYWwm
cXVvdDssc2Fucy1zZXJpZjtjb2xvcjpibGFjayI+aGk8L3NwYW4+PHNwYW4gc3R5bGU9ImZvbnQt
c2l6ZToxMC41cHQ7Zm9udC1mYW1pbHk6JnF1b3Q7TVMgR290aGljJnF1b3Q7O2NvbG9yOmJsYWNr
Ij6jrDwvc3Bhbj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEwLjVwdDtmb250LWZhbWlseTomcXVv
dDtBcmlhbCZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOmJsYWNrIj48bzpwPjwvbzpwPjwvc3Bhbj48
L3A+CjwvZGl2Pgo8ZGl2Pgo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1z
aXplOjEwLjVwdDtmb250LWZhbWlseTomcXVvdDtBcmlhbCZxdW90OyxzYW5zLXNlcmlmO2NvbG9y
OmJsYWNrIj48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+CjwvZGl2Pgo8ZGl2Pgo8cCBjbGFz
cz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEwLjVwdDtmb250LWZhbWlseTom
cXVvdDtBcmlhbCZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOmJsYWNrIj5Ib3cgdG8gZ2V0IHRoZSB1
cGRhdGUgcHJvZ3Jlc3Mgd2hlbiBCTUMgaXMgZmxhc2hpbmcuIEl0IGNhbiBiZSBkaXNwbGF5ZWQg
b24gd2VidWkuPG86cD48L286cD48L3NwYW4+PC9wPgo8L2Rpdj4KPGRpdj4KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMC41cHQ7Zm9udC1mYW1pbHk6JnF1b3Q7
QXJpYWwmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjpibGFjayI+PG86cD4mbmJzcDs8L286cD48L3Nw
YW4+PC9wPgo8L2Rpdj4KPGRpdj4KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZv
bnQtc2l6ZToxMC41cHQ7Zm9udC1mYW1pbHk6JnF1b3Q7QXJpYWwmcXVvdDssc2Fucy1zZXJpZjtj
b2xvcjpibGFjayI+dGhhbmtzLDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4KPC9kaXY+CjxkaXY+Cjxw
IGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTAuNXB0O2ZvbnQtZmFt
aWx5OiZxdW90O0FyaWFsJnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6YmxhY2siPkJ5cm9uPG86cD48
L286cD48L3NwYW4+PC9wPgo8L2Rpdj4KPC9kaXY+CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxicj4K
PGJyPgo8YnI+CjxvOnA+PC9vOnA+PC9wPgo8cD4mbmJzcDs8bzpwPjwvbzpwPjwvcD4KPC9kaXY+
CgoKPC9ibG9ja3F1b3RlPjwvZGl2Pjxicj48YnI+PHNwYW4gdGl0bGU9Im5ldGVhc2Vmb290ZXIi
PjxwPiZuYnNwOzwvcD48L3NwYW4+
------=_Part_13139_1192797724.1582940634144--

