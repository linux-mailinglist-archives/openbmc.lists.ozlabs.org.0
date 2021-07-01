Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5743B906C
	for <lists+openbmc@lfdr.de>; Thu,  1 Jul 2021 12:17:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFvKx1zfDz3083
	for <lists+openbmc@lfdr.de>; Thu,  1 Jul 2021 20:17:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=mnpKf4z5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=126.com
 (client-ip=220.181.15.40; helo=m1540.mail.126.com;
 envelope-from=gj1104487038@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256
 header.s=s110527 header.b=mnpKf4z5; dkim-atps=neutral
X-Greylist: delayed 1861 seconds by postgrey-1.36 at boromir;
 Thu, 01 Jul 2021 20:17:39 AEST
Received: from m1540.mail.126.com (m1540.mail.126.com [220.181.15.40])
 by lists.ozlabs.org (Postfix) with ESMTP id 4GFvKb6y1lz2yxV
 for <openbmc@lists.ozlabs.org>; Thu,  1 Jul 2021 20:17:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=aJzdZ
 8xLHDDYo826GNHTs3ekMeZwrVWdruub1RLA9GI=; b=mnpKf4z5FJYt28hbIpOVJ
 sLQR/Ykmq/5p6NP+8bPsAieg2Q/r0Pxw3OJU0wmohCjuRE7hYgbuXxafcVbKOZER
 cMgjqUmZpJkxwbo3gmrf6zbc64rHhVF+l1/IznJCuk7xHJ8+4lQqhMUalNz8tlaq
 Vr7vq5UkOm5XtS4WIpaYjA=
Received: from gj1104487038$126.com ( [60.208.111.194] ) by
 ajax-webmail-wmsvr40 (Coremail) ; Thu, 1 Jul 2021 17:46:10 +0800 (CST)
X-Originating-IP: [60.208.111.194]
Date: Thu, 1 Jul 2021 17:46:10 +0800 (CST)
From: JillGuo  <gj1104487038@126.com>
To: openbmc@lists.ozlabs.org, spinler@us.ibm.com, bradleyb@fuzziesquirrel.com
Subject: power supply monitor
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2021 www.mailtech.cn 126com
X-CM-CTRLDATA: POW2gGZvb3Rlcl9odG09MjU5Nzo1Ng==
Content-Type: multipart/alternative; 
 boundary="----=_Part_66876_1438602273.1625132770479"
MIME-Version: 1.0
Message-ID: <434583c0.47b5.17a617624b0.Coremail.gj1104487038@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: KMqowABH0gnjjt1gn0xRAQ--.36999W
X-CM-SenderInfo: ljmriiiuuyliity6ij2wof0z/1tbiFwPCDFpEBos3sgAAsM
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

------=_Part_66876_1438602273.1625132770479
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

SSByZWNlbnRseSBhZGFwdGVkICBwb3dlciBzdXBwbHkgbW9uaXRvcmluZywgYW5kIG15IHN5c3Rl
bSBpcyBJbnRlbCBwbGF0Zm9ybS4gSSBmb3VuZCBTVEFUVVNfV09SRCBhbmQgb3RoZXIgaW5mb3Jt
YXRpb24gY2FuIGJlIG9idGFpbmVkIGJ5IHBvd2VyLXN1cHBseSBvZiBwaG9zcGhvci1wb3dlciAo
aHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3ItcG93ZXIvdHJlZS9tYXN0ZXIvcG93
ZXItc3VwcGx5KS4gSG93ZXZlciwgSW50ZWwgcGxhdGZvcm0gZG9lc24ndCB1c2UgcGhvc3Bob3It
aW52ZW50b3J5LW1hbmFnZXIuIEkgd2FudCB0byBrbm93IGlmIHBvd2VyLXN1cHBseSBpcyBhcHBs
aWNhYmxlIHRvIGVudGl0eS1tYW5hZ2VyLiBJZiBpdCBpcyBhcHBsaWNhYmxlLCB3aGF0IHNob3Vs
ZCBiZSBkb25lPwoKCkkgYW0gYWxzbyBjb25mdXNlZCB0aGF0IHBob3NwaG9yLWludmVudG9yeS1t
YW5hZ2VyIChodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9waG9zcGhvci1pbnZlbnRvcnktbWFu
YWdlcikgYW5kIGVudGl0eS1tYW5hZ2VyIChodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9lbnRp
dHktbWFuYWdlcikgaGF2ZSB0aGUgc2FtZSBwYXRoIC94eXovb3BlbmJtY19wcm9qZWN0L2ludmVu
dG9yeS4gV2hldGhlciBpdCBjYW4gZXhpc3QgaW4gYW4gaW1hZ2UgYXQgdGhlIHNhbWUgdGltZSwg
YW5kIHdoZXRoZXIgdGhlcmUgd2lsbCBiZSBjb25mbGljdC4KCgoKQWxsIHN1Z2dlc3Rpb25zIGFy
ZSB3ZWxjb21lLCB0aGFua3MuCgpKaWxsIEd1bwoKMjAyMS83LzEKCgo=
------=_Part_66876_1438602273.1625132770479
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXYgc3R5bGU9ImxpbmUtaGVpZ2h0OjEuNztjb2xvcjojMDAw
MDAwO2ZvbnQtc2l6ZToxNHB4O2ZvbnQtZmFtaWx5OkFyaWFsIj48ZGl2IHN0eWxlPSJtYXJnaW46
MDsiPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTogJnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7
OyBmb250LXNpemU6IDIwcHg7IGxpbmUtaGVpZ2h0OiAyZW07Ij5JPC9zcGFuPjxzcGFuIHN0eWxl
PSJmb250LWZhbWlseTogJnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7OyBmb250LXNpemU6IDIw
cHg7IGxpbmUtaGVpZ2h0OiAyZW07IiBjbGFzcz0iIj4gcmVjZW50bHkgYWQ8L3NwYW4+PHNwYW4g
c3R5bGU9ImZvbnQtZmFtaWx5OiAmcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDs7IGZvbnQtc2l6
ZTogMjBweDsgbGluZS1oZWlnaHQ6IDJlbTsiPmFwdGVkJm5ic3A7IHBvd2VyIHN1cHBseSBtb25p
dG9yaW5nLCBhbmQgbXkgc3lzdGVtIGlzIEludGVsIHBsYXRmb3JtLiBJIGZvdW5kIFNUQVRVU19X
T1JEIGFuZCBvdGhlciBpbmZvcm1hdGlvbiBjYW4gYmUgb2J0YWluZWQgYnkgcG93ZXItc3VwcGx5
IG9mIHBob3NwaG9yLXBvd2VyICg8L3NwYW4+PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL29w
ZW5ibWMvcGhvc3Bob3ItcG93ZXIvdHJlZS9tYXN0ZXIvcG93ZXItc3VwcGx5Ij48Zm9udCBmYWNl
PSJUaW1lcyBOZXcgUm9tYW4iPjxzcGFuIHN0eWxlPSJmb250LXNpemU6IDIwcHg7IGxpbmUtaGVp
Z2h0OiAyZW07Ij5odHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9waG9zcGhvci1wb3dlci90cmVl
L21hc3Rlci9wb3dlci1zdXBwbHk8L3NwYW4+PC9mb250PjwvYT48c3BhbiBzdHlsZT0iZm9udC1m
YW1pbHk6ICZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90OzsgZm9udC1zaXplOiAyMHB4OyBsaW5l
LWhlaWdodDogMmVtOyI+KS4gSG93ZXZlciwgSW50ZWwgcGxhdGZvcm0gZG9lc24ndCB1c2UgcGhv
c3Bob3ItaW52ZW50b3J5LW1hbmFnZXIuIEkgd2FudCB0byBrbm93IGlmIHBvd2VyLXN1cHBseSBp
cyBhcHBsaWNhYmxlIHRvIGVudGl0eS1tYW5hZ2VyLiBJZiBpdCBpcyBhcHBsaWNhYmxlLCB3aGF0
IHNob3VsZCBiZSBkb25lPzwvc3Bhbj48L2Rpdj48ZGl2IHN0eWxlPSJtYXJnaW46MDsiPjxzcGFu
IHN0eWxlPSJmb250LWZhbWlseTogJnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7OyBmb250LXNp
emU6IDIwcHg7IGxpbmUtaGVpZ2h0OiAyZW07Ij48YnI+PC9zcGFuPjwvZGl2PjxkaXYgc3R5bGU9
Im1hcmdpbjowOyI+PHNwYW4gc3R5bGU9ImxpbmUtaGVpZ2h0OiAyZW07Ij48c3BhbiBzdHlsZT0i
bGluZS1oZWlnaHQ6IDEuNWVtOyBmb250LWZhbWlseTogJnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1
b3Q7OyBmb250LXNpemU6IDIwcHg7Ij5JIGFtIGFsc28gY29uZnVzZWQgdGhhdCBwaG9zcGhvci1p
bnZlbnRvcnktbWFuYWdlciAoPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhv
c3Bob3ItaW52ZW50b3J5LW1hbmFnZXIiPmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bob3Nw
aG9yLWludmVudG9yeS1tYW5hZ2VyPC9hPikgYW5kIGVudGl0eS1tYW5hZ2VyICg8YSBocmVmPSJo
dHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9lbnRpdHktbWFuYWdlciI+aHR0cHM6Ly9naXRodWIu
Y29tL29wZW5ibWMvZW50aXR5LW1hbmFnZXI8L2E+KSBoYXZlIHRoZSBzYW1lIHBhdGggL3h5ei9v
cGVuYm1jX3Byb2plY3QvaW52ZW50b3J5LiZuYnNwOzwvc3Bhbj48c3BhbiBzdHlsZT0ibGluZS1o
ZWlnaHQ6IDEuNWVtOyBmb250LWZhbWlseTogJnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7OyBm
b250LXNpemU6IDIwcHg7Ij5XaGV0aGVyIGl0IGNhbiBleGlzdCBpbiBhbiBpbWFnZSBhdCB0aGUg
c2FtZSB0aW1lLCBhbmQgd2hldGhlciB0aGVyZSB3aWxsIGJlIGNvbmZsaWN0Ljwvc3Bhbj48L3Nw
YW4+PC9kaXY+PGRpdiBzdHlsZT0ibWFyZ2luOjA7Ij48YnI+PC9kaXY+PHAgc3R5bGU9Im1hcmdp
bjowOyI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiAmcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVv
dDs7IGZvbnQtc2l6ZTogMjBweDsgbGluZS1oZWlnaHQ6IDJlbTsiPkFsbCBzdWdnZXN0aW9ucyBh
cmUgd2VsY29tZSwgdGhhbmtzLjwvc3Bhbj48L3A+PHAgc3R5bGU9Im1hcmdpbjowOyI+PHNwYW4g
c3R5bGU9ImZvbnQtZmFtaWx5OiAmcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDs7IGZvbnQtc2l6
ZTogMjBweDsgbGluZS1oZWlnaHQ6IDJlbTsiPkppbGwgR3VvPC9zcGFuPjwvcD48cCBzdHlsZT0i
bWFyZ2luOjA7Ij48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6ICZxdW90O1RpbWVzIE5ldyBSb21h
biZxdW90OzsgZm9udC1zaXplOiAyMHB4OyBsaW5lLWhlaWdodDogMmVtOyI+MjAyMS83LzE8L3Nw
YW4+PC9wPjxwIHN0eWxlPSJtYXJnaW46MDsiPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTogJnF1
b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7OyBmb250LXNpemU6IDIwcHg7IGxpbmUtaGVpZ2h0OiAy
ZW07Ij48YnI+PC9zcGFuPjwvcD48L2Rpdj48L2Rpdj48YnI+PGJyPjxzcGFuIHRpdGxlPSJuZXRl
YXNlZm9vdGVyIj48cD4mbmJzcDs8L3A+PC9zcGFuPg==
------=_Part_66876_1438602273.1625132770479--

