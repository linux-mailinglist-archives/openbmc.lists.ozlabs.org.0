Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFF8311C44
	for <lists+openbmc@lfdr.de>; Sat,  6 Feb 2021 09:50:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DXmFN4hKkzDwmZ
	for <lists+openbmc@lfdr.de>; Sat,  6 Feb 2021 19:50:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=163.com
 (client-ip=220.181.13.65; helo=m1365.mail.163.com;
 envelope-from=ouyangxuan10@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=eCJZFSV+; dkim-atps=neutral
X-Greylist: delayed 918 seconds by postgrey-1.36 at bilbo;
 Sat, 06 Feb 2021 19:49:19 AEDT
Received: from m1365.mail.163.com (m1365.mail.163.com [220.181.13.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DXmDb3wpzzDvr8
 for <openbmc@lists.ozlabs.org>; Sat,  6 Feb 2021 19:49:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=R18oN
 kDLquR9Ztc9AHagca+l63GtY38tPvA3J39aU0o=; b=eCJZFSV+iyC+cpXiD/m/B
 26gLr9DibU1QDQ6otfB85r0avk0njHlwLHwDSsSyi/Q7wl640D8GvCVh4TYqKKU3
 lWdj55i4sVU6VFcATnCyx4OeaQKjBoexuQFHE0CSI/YunFk9FkVMjXrlLTR54qlz
 iCSmzPlkFiaC2wcVr0gJxo=
Received: from ouyangxuan10$163.com ( [106.120.127.15] ) by
 ajax-webmail-wmsvr65 (Coremail) ; Sat, 6 Feb 2021 16:33:47 +0800 (CST)
X-Originating-IP: [106.120.127.15]
Date: Sat, 6 Feb 2021 16:33:47 +0800 (CST)
From: www <ouyangxuan10@163.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Does openbmc implement NC-SI over MCTP over SMBus to obtain
 information?
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2021 www.mailtech.cn 163com
X-CM-CTRLDATA: SijJE2Zvb3Rlcl9odG09MzYzOjU2
Content-Type: multipart/alternative; 
 boundary="----=_Part_13911_1032738031.1612600427316"
MIME-Version: 1.0
Message-ID: <380419ba.ece.1777679c335.Coremail.ouyangxuan10@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: QcGowAB3fQVrVB5gg6R_AA--.37341W
X-CM-SenderInfo: prx1t0pj0xt0irq6il2tof0z/xtbBQQsx2l++I-ZC-QAAsq
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

------=_Part_13911_1032738031.1612600427316
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

RGVhciBhbGwsCgoKRG9lcyBvcGVuYm1jIGltcGxlbWVudCBOQy1TSSBvdmVyIE1DVFAgb3ZlciBT
TUJ1cyB0byBvYnRhaW4gaW5mb3JtYXRpb24/IAoKCnRoYW5rcywKQnlyb24=
------=_Part_13911_1032738031.1612600427316
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXYgc3R5bGU9Im1hcmdpbjowOyI+RGVhciBhbGwsPC9kaXY+
PGRpdiBzdHlsZT0ibWFyZ2luOjA7Ij48YnI+PC9kaXY+PGRpdiBzdHlsZT0ibWFyZ2luOjA7Ij5E
b2VzIG9wZW5ibWMgaW1wbGVtZW50IE5DLVNJIG92ZXIgTUNUUCBvdmVyIFNNQnVzIHRvIG9idGFp
biBpbmZvcm1hdGlvbj8mbmJzcDs8L2Rpdj48ZGl2IHN0eWxlPSJtYXJnaW46MDsiPjxicj48L2Rp
dj48ZGl2IHN0eWxlPSJtYXJnaW46MDsiPnRoYW5rcyw8L2Rpdj48ZGl2IHN0eWxlPSJtYXJnaW46
MDsiPkJ5cm9uPC9kaXY+PC9kaXY+PGJyPjxicj48c3BhbiB0aXRsZT0ibmV0ZWFzZWZvb3RlciI+
PHA+Jm5ic3A7PC9wPjwvc3Bhbj4=
------=_Part_13911_1032738031.1612600427316--

