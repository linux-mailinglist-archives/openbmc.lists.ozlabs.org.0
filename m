Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB3D125D24
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2019 10:00:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dm7C63s6zDqp5
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2019 20:00:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=163.com
 (client-ip=220.181.13.7; helo=m13-7.163.com;
 envelope-from=xiaoqian1641@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.b="Zg+nFDWh"; 
 dkim-atps=neutral
Received: from m13-7.163.com (m13-7.163.com [220.181.13.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 47dm676c66zDqlX
 for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2019 19:59:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=Zgwg1
 i20NQOpL7OTGhJ/183k17ZbwAEWjUdM0bMaCVM=; b=Zg+nFDWhTZkjR1uv6pvTa
 kWjEksN9vvRTKjuYr3ygkQ/2qoI1srkI1dd/gEO4lRw60Q4YTahKlPCMUglmA/5k
 k3wAM03iabyHqgVp/ROT3fW8H3wvto+m0YbV3Nzk3eIqsLvYCBunUPs4mhr0E2vj
 DgjnPik9eEDkn3EYK7RoXw=
Received: from xiaoqian1641$163.com ( [106.120.127.15] ) by
 ajax-webmail-wmsvr7 (Coremail) ; Thu, 19 Dec 2019 16:59:35 +0800 (CST)
X-Originating-IP: [106.120.127.15]
Date: Thu, 19 Dec 2019 16:59:35 +0800 (CST)
From: =?GBK?B?s6PP/sP3?= <xiaoqian1641@163.com>
To: "OpenBMC Development" <openbmc@lists.ozlabs.org>
Subject: ipmid-new.cpp log<level::ERR> entry cannot output
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190724(ac680a23)
 Copyright (c) 2002-2019 www.mailtech.cn 163com
In-Reply-To: <630491b9.b0a5.16eb1614767.Coremail.xiaoqian1641@163.com>
References: <630491b9.b0a5.16eb1614767.Coremail.xiaoqian1641@163.com>
X-CM-CTRLDATA: UsKZjmZvb3Rlcl9odG09NDQ4OjU2
Content-Type: multipart/alternative; 
 boundary="----=_Part_170187_67244901.1576745975282"
MIME-Version: 1.0
Message-ID: <1f0e7d00.afd5.16f1d623df2.Coremail.xiaoqian1641@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: B8GowAC3zBD3O_tdfKGvAQ--.16312W
X-CM-SenderInfo: 50ld01pldqiliur6il2tof0z/xtbB0xeQfFXlpCwcMAAAs8
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

------=_Part_170187_67244901.1576745975282
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

SGksIFRlYW0sCgoKcGhvc3Bob3ItaXBtaS1ob3N0L2lwbWlkLW5ldy5jcHAgaGFzIGxvdCBsb2c8
bGV2ZWw6RVJSPigiU29tZXRoaW5nIG1lc3NhZ2VzIiwgIGVudHJ5KCJDSEFOTkVMPSV1IiwgY2hh
bm5lbCkpCkJ1dCBqb3VybmFsY3RsIGp1c3Qgc2F2ZXMgIlNvbWV0aGluZyBtZXNzYWdlcyIgLCBj
YW5ub3Qgc2F2ZSB0aGUgbWVzc2FnZSBvZiBlbnRyeSgiQ0hBTk5FTD0ldSIsIGNoYW5uZWwpLgoK
CkRvZXMgYW55Ym9keSBrbm93IHRoaXM/CgoKSm9obnk=
------=_Part_170187_67244901.1576745975282
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXY+SGksIFRlYW0sPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRp
dj5waG9zcGhvci1pcG1pLWhvc3QvaXBtaWQtbmV3LmNwcCBoYXMgbG90IGxvZyZsdDtsZXZlbDpF
UlImZ3Q7KCJTb21ldGhpbmcgbWVzc2FnZXMiLCZuYnNwOyBlbnRyeSgiQ0hBTk5FTD0ldSIsIGNo
YW5uZWwpKTwvZGl2PjxkaXY+QnV0Jm5ic3A7am91cm5hbGN0bCBqdXN0IHNhdmVzICJTb21ldGhp
bmcgbWVzc2FnZXMiICwgY2Fubm90IHNhdmUgdGhlIG1lc3NhZ2Ugb2YgZW50cnkoIkNIQU5ORUw9
JXUiLCBjaGFubmVsKS48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkRvZXMgYW55Ym9keSBrbm93
IHRoaXM/PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5Kb2hueTwvZGl2PjwvZGl2Pjxicj48YnI+
PHNwYW4gdGl0bGU9Im5ldGVhc2Vmb290ZXIiPjxwPiZuYnNwOzwvcD48L3NwYW4+
------=_Part_170187_67244901.1576745975282--

