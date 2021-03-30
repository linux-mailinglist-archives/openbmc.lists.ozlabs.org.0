Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AD534F45C
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 00:37:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F947l42Bfz3bvW
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 09:37:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=NZNwnAF3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=163.com
 (client-ip=220.181.13.102; helo=m13102.mail.163.com;
 envelope-from=echo_dufan@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=NZNwnAF3; dkim-atps=neutral
X-Greylist: delayed 919 seconds by postgrey-1.36 at boromir;
 Tue, 30 Mar 2021 14:14:51 AEDT
Received: from m13102.mail.163.com (m13102.mail.163.com [220.181.13.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8ZLg2C8zz2yy7
 for <openbmc@lists.ozlabs.org>; Tue, 30 Mar 2021 14:14:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=17obp
 heO8QmlI0/Xj9hIfB5Kom5yIedRaoVkudgsl8M=; b=NZNwnAF3E5hMAC32T0ecE
 ngViidhHo3eOanQbXTh8t3WGoKkUy5ZkLIqlQwepYtb5xo8GEEY+UfXIG6vZ3q/+
 dFVlZwF7FMChLijf2F4Mj+svz0jRK1oFtw7ReVzLBDryCDZxR5McoVVD+ctL7MTu
 wzc9T/2m6T4uvY2V2GFSWI=
Received: from echo_dufan$163.com ( [117.136.8.27] ) by
 ajax-webmail-wmsvr102 (Coremail) ; Tue, 30 Mar 2021 10:59:09 +0800 (CST)
X-Originating-IP: [117.136.8.27]
Date: Tue, 30 Mar 2021 10:59:09 +0800 (CST)
From: =?GBK?B?tsW3qw==?= <echo_dufan@163.com>
To: openbmc@lists.ozlabs.org
Subject: software id
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2021 www.mailtech.cn 163com
X-CM-CTRLDATA: a89rY2Zvb3Rlcl9odG09MzY5OjU2
Content-Type: multipart/alternative; 
 boundary="----=_Part_39378_1120702382.1617073149257"
MIME-Version: 1.0
Message-ID: <3c26e323.2a92.17881121549.Coremail.echo_dufan@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZsGowAAnLfn9k2JgWusIAQ--.64881W
X-CM-SenderInfo: 5hfk0spgxit0i6rwjhhfrp/1tbiTxpgfVsGYFKvCwACsB
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Approved-At: Wed, 31 Mar 2021 09:36:07 +1100
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

------=_Part_39378_1120702382.1617073149257
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

aGkKSSB3YW50IHRvIGtub3cgaG93IHRvIGNoYW5nZSBzb2Z0d2FyZSBJRCBmb3IgdXBkYXRpbmcg
Ym1jIGltYWdlPwpsb2cgc2hvd3MgdGhhdCB0d28gaW1hZ2VzIGhhdmUgdGhlIHNhbWUgdmVyc2lv
biBJRCAsIEkga25vdyBpdCBjb250YWlucyBpbiBtYW5pZmVzdCBmaWxlICxidXQgaG93IHRvIGNo
YW5nZSB0aGUgdmVyc2lvbiBpZCBieSBteXNlbGY/Pw==
------=_Part_39378_1120702382.1617073149257
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXYgc3R5bGU9Im1hcmdpbjowOyI+aGk8L2Rpdj48ZGl2IHN0
eWxlPSJtYXJnaW46MDsiPkkgd2FudCB0byBrbm93IGhvdyB0byBjaGFuZ2Ugc29mdHdhcmUgSUQg
Zm9yIHVwZGF0aW5nIGJtYyBpbWFnZT88L2Rpdj48ZGl2IHN0eWxlPSJtYXJnaW46MDsiPmxvZyBz
aG93cyB0aGF0IHR3byBpbWFnZXMgaGF2ZSB0aGUgc2FtZSB2ZXJzaW9uIElEICwgSSBrbm93IGl0
IGNvbnRhaW5zIGluIG1hbmlmZXN0IGZpbGUgLGJ1dCBob3cgdG8gY2hhbmdlIHRoZSB2ZXJzaW9u
IGlkIGJ5IG15c2VsZj8/PC9kaXY+PC9kaXY+PGJyPjxicj48c3BhbiB0aXRsZT0ibmV0ZWFzZWZv
b3RlciI+PHA+Jm5ic3A7PC9wPjwvc3Bhbj4=
------=_Part_39378_1120702382.1617073149257--

