Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 88194B071E
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 05:26:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TPLP6BybzF3Tv
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 13:26:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=163.com
 (client-ip=220.181.13.133; helo=m13-133.163.com;
 envelope-from=xiaoqian1641@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.b="NruOz7Of"; 
 dkim-atps=neutral
X-Greylist: delayed 916 seconds by postgrey-1.36 at bilbo;
 Thu, 12 Sep 2019 13:25:26 AEST
Received: from m13-133.163.com (m13-133.163.com [220.181.13.133])
 by lists.ozlabs.org (Postfix) with ESMTP id 46TPKf68SVzF25c
 for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2019 13:25:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=XSwBt
 kDu9VOrFvsGrbTIFqS4EcVIjt2+13tqZD0GAHQ=; b=NruOz7OfhZl5+tuva4pCq
 hMml9crFbAQwKg0N42C6CuVj+Z/bE+QUDaViqATEzC7beTSL4hjC1t9sEmr+CnR1
 Kg/SNuwxZlPN572983Vr36+Im4PFO3KVKmaV4XNSJRB4xUqYz5t41MAQRa5e8XU3
 CT8P3CaSa/Ua3VPVovQ1Is=
Received: from xiaoqian1641$163.com ( [106.120.127.15] ) by
 ajax-webmail-wmsvr133 (Coremail) ; Thu, 12 Sep 2019 11:09:58 +0800 (CST)
X-Originating-IP: [106.120.127.15]
Date: Thu, 12 Sep 2019 11:09:58 +0800 (CST)
From: =?GBK?B?s6PP/sP3?= <xiaoqian1641@163.com>
To: openbmc@lists.ozlabs.org
Subject: Fw:How to use gtest/gmock in openbmc
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190724(ac680a23)
 Copyright (c) 2002-2019 www.mailtech.cn 163com
X-CM-CTRLDATA: qX/dqGZvb3Rlcl9odG09MTE4MDo1Ng==
Content-Type: multipart/alternative; 
 boundary="----=_Part_80894_334820947.1568257798101"
MIME-Version: 1.0
Message-ID: <2d7b6a6d.52d2.16d2372efd5.Coremail.xiaoqian1641@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: hcGowAAXLwMGt3ld+8MmAQ--.20331W
X-CM-SenderInfo: 50ld01pldqiliur6il2tof0z/1tbiSggufFPAHjnlogAAsj
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

------=_Part_80894_334820947.1568257798101
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

SGksIE9wZW5CTUMgZGV2ZWxvcG1lbnQgbWVtYmVyLAoKCkknbSBsZWFybmluZyBvcGVuYm1jIHZp
YSBnaXRodWIuCkkgd2FudGVkIHRvIHRlc3QgdGhlIGNvZGUgb2YgT3BlbkJNQyB0aHJvdWdoIEd0
ZXN0L0dtb2NrLCBBbmQgSSBGb3VuZCB0aGUgT3BlbkJNQyBzb3VyY2UgY29kZSBhbHJlYWR5IGhh
ZCB0aGUgdGVzdCBwYWNrYWdlLGJ1dCBpdCBjYW5ub3QgYmUgY29tcGlsZWQgYWNjb3JkaW5nIHRv
IFJFQURNRS5tZC4KSSB0aGluayBpdCBtYXkgYmUgbXkgY29tcGlsYXRpb24gbWV0aG9kIGlzIG5v
dCBjb3JyZWN0LCBEbyB5b3UgaGF2ZSBhbnkgZG9jdW1lbnRhdGlvbiBhYm91dCB0aGlzID8KCgpD
b3VsZCB5b3UgdGVsbCBtZSBIb3cgdG8gdGVzdCAic2RldmVudHBsdXMiID8KCgpUaGFua3MgdmVy
eSBtb3VjaC4KSm9obnkKCgoKCgoKIAoKCgoKCiAKCgoKCgog
------=_Part_80894_334820947.1568257798101
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXYgaWQ9ImlzRm9yd2FyZENvbnRlbnQiPjxkaXYgc3R5bGU9
ImxpbmUtaGVpZ2h0OjEuNztjb2xvcjojMDAwMDAwO2ZvbnQtc2l6ZToxNHB4O2ZvbnQtZmFtaWx5
OkFyaWFsIj48ZGl2IGlkPSJpc0ZvcndhcmRDb250ZW50Ij48ZGl2IHN0eWxlPSJsaW5lLWhlaWdo
dDoxLjc7Y29sb3I6IzAwMDAwMDtmb250LXNpemU6MTRweDtmb250LWZhbWlseTpBcmlhbCI+PGRp
diBpZD0iaXNGb3J3YXJkQ29udGVudCI+PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9y
OiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXY+SGksIE9wZW5C
TUMgZGV2ZWxvcG1lbnQgbWVtYmVyLDwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SSdtIGxlYXJu
aW5nIG9wZW5ibWMgdmlhIGdpdGh1Yi48L2Rpdj48ZGl2Pkkgd2FudGVkIHRvIHRlc3QgdGhlIGNv
ZGUgb2YgT3BlbkJNQyB0aHJvdWdoIEd0ZXN0L0dtb2NrLCBBbmQgSSBGb3VuZCB0aGUgT3BlbkJN
QyBzb3VyY2UgY29kZSBhbHJlYWR5IGhhZCB0aGUgdGVzdCBwYWNrYWdlLGJ1dCBpdCBjYW5ub3Qg
YmUgY29tcGlsZWQgYWNjb3JkaW5nIHRvIFJFQURNRS5tZC48L2Rpdj48ZGl2PkkgdGhpbmsgaXQg
bWF5IGJlIG15IGNvbXBpbGF0aW9uIG1ldGhvZCBpcyBub3QgY29ycmVjdCwgRG8geW91IGhhdmUg
YW55IGRvY3VtZW50YXRpb24gYWJvdXQgdGhpcyA/PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5D
b3VsZCB5b3UgdGVsbCBtZSBIb3cgdG8gdGVzdCAic2RldmVudHBsdXMiID88L2Rpdj48ZGl2Pjxi
cj48L2Rpdj48ZGl2PlRoYW5rcyB2ZXJ5IG1vdWNoLjwvZGl2PjxkaXY+Sm9obnk8L2Rpdj48ZGl2
PjxiciBzdHlsZT0iZm9udC1mYW1pbHk6IGFyaWFsOyBmb250LXNpemU6IG1lZGl1bTsiPjwvZGl2
PjwvZGl2Pjxicj48YnI+PHNwYW4gdGl0bGU9Im5ldGVhc2Vmb290ZXIiPjxwPiZuYnNwOzwvcD48
L3NwYW4+PC9kaXY+PC9kaXY+PGJyPjxicj48c3BhbiB0aXRsZT0ibmV0ZWFzZWZvb3RlciI+PHA+
Jm5ic3A7PC9wPjwvc3Bhbj48L2Rpdj48L2Rpdj48YnI+PGJyPjxzcGFuIHRpdGxlPSJuZXRlYXNl
Zm9vdGVyIj48cD4mbmJzcDs8L3A+PC9zcGFuPjwvZGl2PjwvZGl2Pjxicj48YnI+PHNwYW4gdGl0
bGU9Im5ldGVhc2Vmb290ZXIiPjxwPiZuYnNwOzwvcD48L3NwYW4+
------=_Part_80894_334820947.1568257798101--

