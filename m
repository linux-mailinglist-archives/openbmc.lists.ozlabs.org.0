Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE48BF38E
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 14:56:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fFLC3NLdzDqnx
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 22:56:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=qq.com
 (client-ip=183.3.255.70; helo=qq.com; envelope-from=1181052146@qq.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.b="DTray6Iv"; 
 dkim-atps=neutral
Received: from qq.com (smtpbg444.qq.com [183.3.255.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fFJH2YQ5zDqBS
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 22:54:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1569502462; bh=4hP2V0OxyR2VyoKZ9u7+ZCQqo75D9zBQ1CjEqvQUhDs=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=DTray6IvWVYnK3pnZifl9hZ1LWCTad/rkkwP4RQy7cJTALKJYH1St+xUH0vLmX89j
 NtfBh03rb/o7e+VmCfiuM63x7d1Ik0Lln2P5gs5tdQBeLk9S+1H0mJq8NFQeDYQ0gv
 d3ed3aTqTVa5WEPP2F0UttT6ahxof+JvXehQ5Fxo=
X-QQ-FEAT: SDGPAIwMd/LFulM1rDL4/mhxGSKhL3kE2dEMU/afxM30roygt4hYSiAwPqU+F
 8gkxWp0CQwmfZo/WW2Uv5il6d7ROA60x8iaKjYEhysKLXnZBKED6CI7GHfW2srWU8JCzJKW
 Xw8HGIHb4KT7F58HtLRdHj5OnhO1PSSg8iSvdZawb84vmo6bkcPcWQPEiiOg4XEB0hA7m4v
 onU86zJLDneHt+o5SNXnATdzXAg+s56M+Dg/1K8RDw8hyU0pPki23Dg8/slTp8Dvbax/5Og
 r/rBs00pSkM0IkywuhZHvOhoUUl3kLwzCTZg==
X-QQ-SSF: 00000000000000F000000000000000S
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 106.121.158.255
X-QQ-STYLE: 
X-QQ-mid: webmail166t1569502460t109288
From: "=?gb18030?B?xM/SsKXgpeult6WopemltA==?=" <1181052146@qq.com>
To: "=?gb18030?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>
Subject: how can i use ipmitool to interact with openbmc which boot from
 qemu-system-arm
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5D8CB4FC_0BA4C970_162FB9E5"
Content-Transfer-Encoding: 8Bit
Date: Thu, 26 Sep 2019 20:54:20 +0800
X-Priority: 3
Message-ID: <tencent_7C14F1899E03C3479BFA6A169AFF9DFCCC06@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Thu, 26 Sep 2019 20:54:21 +0800 (CST)
Feedback-ID: webmail:qq.com:bgforeign:bgforeign4
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

------=_NextPart_5D8CB4FC_0BA4C970_162FB9E5
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

R3JlZXRpbmdzOg0KaSBoYXZlIGJ1aWxkIGEgb3BlbmJtYyBpbWFnZSwgYW5kIGJvb3Qgd2l0
aCBxZW11Og0KDQoNCiNxZW11LXN5c3RlbS1hcm0gLW0gMjU2IC1NIHBhbG1ldHRvLWJtYyAt
bm9ncmFwaGljIC1kcml2ZSBmaWxlPS9ob21lL29wZW5ibWMvb3BlbmJtYy9idWlsZC90bXAv
ZGVwbG95L2ltYWdlcy9wYWxtZXR0by9vYm1jLXBob3NwaG9yLWltYWdlLXBhbG1ldHRvLTIw
MTkwOTI2MTIzMDU3LnN0YXRpYy5tdGQsZm9ybWF0PXJhdyxpZj1tdGQgLW5ldCBuaWMgLW5l
dCB1c2VyLGhvc3Rmd2Q9OjEyNy4wLjAuMToyMjIyLToyMixob3N0ZndkPToxMjcuMC4wLjE6
MjQ0My06NDQzLGhvc3RuYW1lPXFlbXUNCg0KDQphbmQgd2hlbiBpIHJ1biB0aGUgZm9sbG93
aW5nIGNvbW1hbmQgaW4gbXkgdWJ1bnR1MTguMDQ6DQoNCg0KI2N1cmwgLWMgY2phciAtYiBj
amFyIC1rIC1IICJDb250ZW50LVR5cGU6IGFwcGxpY2F0aW9uL2pzb24iIC1YIFBPU1QgaHR0
cHM6Ly8xMjcuMC4wLjE6MjQ0My9sb2dpbiAtZCAie1wiZGF0YVwiOiBbIFwicm9vdFwiLCBc
IjBwZW5CbWNcIiBdIH0iDQoNCg0KaXQgd29ya3Mgd2VsbCwgYnV0IHdoZW4gaSB0cnkgdG8g
dXNlIGltcGl0b29sOg0KDQoNCiNpcG1pdG9vbCAtSCAxMjcuMC4wLjEgLUkgbGFucGx1cyAt
VSByb290IC1QIDBwZW5CbWMgcG93ZXIgc3RhdHVzDQoNCg0KaSBnb3QgIkVycm9yOiB1bmFi
bGUgdG8gZXN0YWJsaXNoIElQTUkgdjIgLyBSTUNQKyBzZXNzaW9uIi4gaG93IGNhbiBpIGRv
Pw0KDQoNClRoYW5rcyENCkxpdSBIb25nd2Vp

------=_NextPart_5D8CB4FC_0BA4C970_162FB9E5
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

PGRpdj5HcmVldGluZ3M6PC9kaXY+PGRpdj5pIGhhdmUgYnVpbGQgYSBvcGVuYm1jIGltYWdl
LCBhbmQgYm9vdCB3aXRoIHFlbXU6PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48ZGl2PiNx
ZW11LXN5c3RlbS1hcm0gLW0gMjU2IC1NIHBhbG1ldHRvLWJtYyAtbm9ncmFwaGljIC1kcml2
ZSBmaWxlPS9ob21lL29wZW5ibWMvb3BlbmJtYy9idWlsZC90bXAvZGVwbG95L2ltYWdlcy9w
YWxtZXR0by9vYm1jLXBob3NwaG9yLWltYWdlLXBhbG1ldHRvLTIwMTkwOTI2MTIzMDU3LnN0
YXRpYy5tdGQsZm9ybWF0PXJhdyxpZj1tdGQgLW5ldCBuaWMgLW5ldCB1c2VyLGhvc3Rmd2Q9
OjEyNy4wLjAuMToyMjIyLToyMixob3N0ZndkPToxMjcuMC4wLjE6MjQ0My06NDQzLGhvc3Ru
YW1lPXFlbXU8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PmFuZCB3aGVuIGkgcnVuIHRoZSBm
b2xsb3dpbmcgY29tbWFuZCBpbiBteSB1YnVudHUxOC4wNDo8L2Rpdj48ZGl2Pjxicj48L2Rp
dj48ZGl2PjxkaXY+I2N1cmwgLWMgY2phciAtYiBjamFyIC1rIC1IICJDb250ZW50LVR5cGU6
IGFwcGxpY2F0aW9uL2pzb24iIC1YIFBPU1QgaHR0cHM6Ly8xMjcuMC4wLjE6MjQ0My9sb2dp
biAtZCAie1wiZGF0YVwiOiBbIFwicm9vdFwiLCBcIjBwZW5CbWNcIiBdIH0iPC9kaXY+PGRp
dj48YnI+PC9kaXY+PGRpdj5pdCB3b3JrcyB3ZWxsLCBidXQgd2hlbiBpIHRyeSB0byB1c2Ug
aW1waXRvb2w6PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj4jaXBtaXRvb2wgLUggMTI3LjAu
MC4xIC1JIGxhbnBsdXMgLVUgcm9vdCAtUCAwcGVuQm1jIHBvd2VyIHN0YXR1czwvZGl2Pjxk
aXY+PGJyPjwvZGl2PjxkaXY+aSBnb3QgIkVycm9yOiB1bmFibGUgdG8gZXN0YWJsaXNoIElQ
TUkgdjIgLyBSTUNQKyBzZXNzaW9uIi4gaG93IGNhbiBpIGRvPzwvZGl2PjxkaXY+PGJyPjwv
ZGl2PjxkaXY+VGhhbmtzITwvZGl2PjxkaXY+TGl1IEhvbmd3ZWk8L2Rpdj48ZGl2PjwvZGl2
PjwvZGl2PjxkaXY+PC9kaXY+PC9kaXY+

------=_NextPart_5D8CB4FC_0BA4C970_162FB9E5--



