Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9923CF6004
	for <lists+openbmc@lfdr.de>; Sat,  9 Nov 2019 16:25:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 479LYS3gc3zF6Lc
	for <lists+openbmc@lfdr.de>; Sun, 10 Nov 2019 02:25:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=126.com
 (client-ip=220.181.15.1; helo=m15-1.126.com; envelope-from=guilin1985@126.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=126.com header.i=@126.com header.b="e9iRBrO/"; 
 dkim-atps=neutral
Received: from m15-1.126.com (m15-1.126.com [220.181.15.1])
 by lists.ozlabs.org (Postfix) with ESMTP id 479LXM70wrzF69D
 for <openbmc@lists.ozlabs.org>; Sun, 10 Nov 2019 02:24:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=8Qz1Z
 yzRe4uZ75LhV8Ux3enX6soU0q0HdUJ8xwwVw+M=; b=e9iRBrO/woV3PZto7UW7P
 49EguNLSWuooAbZ7+KNVHctZljvbWjZMF5hGWuRgoSGWEFPt2kQlhxg7EvWm6IuK
 zC68UDJNd9+G3yxuOYq9ntvEIZQhyeJXKZkszyIkzVlSrgCpXu5eSTTysEjPOEOT
 7q+ZeGhbtruithE4dS1j6A=
Received: from guilin1985$126.com ( [222.212.90.226] ) by
 ajax-webmail-wmsvr1 (Coremail) ; Sat, 9 Nov 2019 23:24:00 +0800 (CST)
X-Originating-IP: [222.212.90.226]
Date: Sat, 9 Nov 2019 23:24:00 +0800 (CST)
From: =?GBK?B?sKK58A==?= <guilin1985@126.com>
To: openbmc@lists.ozlabs.org
Subject: BMC jtag programming CPLD
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190724(ac680a23)
 Copyright (c) 2002-2019 www.mailtech.cn 126com
X-CM-CTRLDATA: b7EpeGZvb3Rlcl9odG09MTYxNDo1Ng==
Content-Type: multipart/alternative; 
 boundary="----=_Part_20226_1661686227.1573313040979"
MIME-Version: 1.0
Message-ID: <40f2364e.1589.16e50c3d254.Coremail.guilin1985@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AcqowAB3LDQS2sZd0S9MAA--.30209W
X-CM-SenderInfo: xjxlzxrqrzmka6rslhhfrp/1tbi9BBoh1pD9ER2PAABsp
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

------=_Part_20226_1661686227.1573313040979
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

SGkgYWxsOgpNeSBCTUMgaXMgYXNwZWVkIDI0MDAgU29jIGFuZCBteSBDUExEIGlzIEFsdGVyYSBN
QVggMTBNMDQuIE5vdyBJIGRvbid0IGtub3cgaG93IHRvIHVzZSBCTUMganRhZyBmb3IgcHJvZ3Jh
bW1pbmcgbXkgQ1BMRC4KIEhhcyBhbnlvbmUgZWxzZSB1c2VkIGJtYyBqdGFnIGNvbnRyb2xlciBm
b3IgcHJvZ3JhbW1pbmcgY3BsZCA/ClRoYW5rcyBhIGxvdC4KCg==
------=_Part_20226_1661686227.1573313040979
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXY+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoNjgsIDc3LCA4
Nik7IGZvbnQtZmFtaWx5OiBTRk1vbm8tUmVndWxhciwgQ29uc29sYXMsICZxdW90O0xpYmVyYXRp
b24gTW9ubyZxdW90OywgTWVubG8sIG1vbm9zcGFjZTsgZm9udC1zaXplOiAxM3B4OyB3aGl0ZS1z
cGFjZTogcHJlLXdyYXA7Ij4gICAgIEhpIGFsbDogPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4gc3R5
bGU9ImNvbG9yOiByZ2IoNjgsIDc3LCA4Nik7IGZvbnQtZmFtaWx5OiBTRk1vbm8tUmVndWxhciwg
Q29uc29sYXMsICZxdW90O0xpYmVyYXRpb24gTW9ubyZxdW90OywgTWVubG8sIG1vbm9zcGFjZTsg
Zm9udC1zaXplOiAxM3B4OyB3aGl0ZS1zcGFjZTogcHJlLXdyYXA7Ij4gICAgICAgICAgICBNeSBC
TUMgaXMgYXNwZWVkIDI0MDAgU29jIGFuZCBteSBDUExEIGlzIEFsdGVyYSBNQVggMTBNMDQuIE5v
dyBJIDwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6IHJnYig2OCwgNzcsIDg2KTsgZm9udC1mYW1p
bHk6IFNGTW9uby1SZWd1bGFyLCBDb25zb2xhcywgJnF1b3Q7TGliZXJhdGlvbiBNb25vJnF1b3Q7
LCBNZW5sbywgbW9ub3NwYWNlOyBmb250LXNpemU6IDEzcHg7IHdoaXRlLXNwYWNlOiBwcmUtd3Jh
cDsiPmRvbid0IGtub3cgaG93IHRvIHVzZSBCTUMganRhZyBmb3IgcHJvZ3JhbW1pbmcgbXkgQ1BM
RDwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6IHJnYig2OCwgNzcsIDg2KTsgZm9udC1mYW1pbHk6
IFNGTW9uby1SZWd1bGFyLCBDb25zb2xhcywgJnF1b3Q7TGliZXJhdGlvbiBNb25vJnF1b3Q7LCBN
ZW5sbywgbW9ub3NwYWNlOyBmb250LXNpemU6IDEzcHg7IHdoaXRlLXNwYWNlOiBwcmUtd3JhcDsi
Pi4gPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoNjgsIDc3LCA4Nik7
IGZvbnQtZmFtaWx5OiBTRk1vbm8tUmVndWxhciwgQ29uc29sYXMsICZxdW90O0xpYmVyYXRpb24g
TW9ubyZxdW90OywgTWVubG8sIG1vbm9zcGFjZTsgZm9udC1zaXplOiAxM3B4OyB3aGl0ZS1zcGFj
ZTogcHJlLXdyYXA7IiBjbGFzcz0iIj4mbmJzcDtIYXMgYW55b25lIGVsc2UgdXNlZCBibWMganRh
ZyBjb250cm9sZXImbmJzcDtmb3ImbmJzcDtwcm9ncmFtbWluZyBjcGxkID88L3NwYW4+PC9kaXY+
PGRpdj48c3BhbiBzdHlsZT0iY29sb3I6IHJnYig2OCwgNzcsIDg2KTsgZm9udC1mYW1pbHk6IFNG
TW9uby1SZWd1bGFyLCBDb25zb2xhcywgJnF1b3Q7TGliZXJhdGlvbiBNb25vJnF1b3Q7LCBNZW5s
bywgbW9ub3NwYWNlOyBmb250LXNpemU6IDEzcHg7IHdoaXRlLXNwYWNlOiBwcmUtd3JhcDsiIGNs
YXNzPSIiPiAgICAgICAgICAgIFRoYW5rcyBhIGxvdC48L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBz
dHlsZT0iY29sb3I6IHJnYig2OCwgNzcsIDg2KTsgZm9udC1mYW1pbHk6IFNGTW9uby1SZWd1bGFy
LCBDb25zb2xhcywgJnF1b3Q7TGliZXJhdGlvbiBNb25vJnF1b3Q7LCBNZW5sbywgbW9ub3NwYWNl
OyBmb250LXNpemU6IDEzcHg7IHdoaXRlLXNwYWNlOiBwcmUtd3JhcDsiIGNsYXNzPSIiPjxicj48
L3NwYW4+PC9kaXY+PC9kaXY+PGJyPjxicj48c3BhbiB0aXRsZT0ibmV0ZWFzZWZvb3RlciI+PHA+
Jm5ic3A7PC9wPjwvc3Bhbj4=
------=_Part_20226_1661686227.1573313040979--

