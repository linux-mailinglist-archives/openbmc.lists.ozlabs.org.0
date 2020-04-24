Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C26471B7732
	for <lists+openbmc@lfdr.de>; Fri, 24 Apr 2020 15:42:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497wMR1D9wzDqVD
	for <lists+openbmc@lfdr.de>; Fri, 24 Apr 2020 23:42:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=qq.com
 (client-ip=183.3.255.74; helo=qq.com; envelope-from=1181052146@qq.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=gyzREUld; dkim-atps=neutral
X-Greylist: delayed 69 seconds by postgrey-1.36 at bilbo;
 Fri, 24 Apr 2020 23:40:53 AEST
Received: from qq.com (smtpbg446.qq.com [183.3.255.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497wKx0xw3zDqRG
 for <openbmc@lists.ozlabs.org>; Fri, 24 Apr 2020 23:40:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1587735540; bh=aeiaVCkT4Rf2dovUt6LKlLg3gtX166scOnX34KRWoJo=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=gyzREUldV206S4tzvmekRt6T0EjgT8BVBrZulcRwIfZZNjamKe9/JlPAPLFAPC06i
 Cb2PxYDWir+1pDLdSdkBvz4OGZebv7JmKsy1al955sLtd0vdSSuRXkprYNcsesNExm
 JgvfhNFvubdoLa2k5rm4qq/S7Xl8lXORp63w8sqU=
X-QQ-FEAT: tWO7pnkscGyR0NFcDVvJfJGEZoCJISyoXgBmBZFgj39cwvTX6OpVSCWpTTtj/
 Sl/XZlL6Vlx+g7IGOfbqGyMR2UTrPvio3L2la5JxkyRx+KdBxpIsOU1FMP/RPeJX08piDji
 sgHgcQLgCAmHfhf6Mb94Mi7tYgYkbtJbYgHDVCTD3zHRPpXr/Z0GboYh/UX72dyfn/tY4XW
 Pu0FAJr/KdU2hV4JdAIi40xCjk6KoC+65160h1dgjahwmmVCkhYIN3AghjLQT3ZzMol9Fzt
 nuDw==
X-QQ-SSF: 00000000000000F000000000000000S
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 211.75.18.137
X-QQ-STYLE: 
X-QQ-mid: webmail700t1587735538t749195
From: "=?gb18030?B?xM/SsKXgpeult6WopemltA==?=" <1181052146@qq.com>
To: "=?gb18030?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>
Subject: How can host access BMC's SPI Flash via LPC and 
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5EA2EBF2_0F90D208_2638593F"
Content-Transfer-Encoding: 8Bit
Date: Fri, 24 Apr 2020 21:38:58 +0800
X-Priority: 3
Message-ID: <tencent_C2D40783BA4056967F833CD914EF09940306@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Fri, 24 Apr 2020 21:39:00 +0800 (CST)
Feedback-ID: webmail:qq.com:bgforeign:bgforeign11
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

------=_NextPart_5EA2EBF2_0F90D208_2638593F
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64



------=_NextPart_5EA2EBF2_0F90D208_2638593F
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNo
YXJzZXQ9R0IxODAzMCI+PGRpdj48YnI+PC9kaXY+

------=_NextPart_5EA2EBF2_0F90D208_2638593F--



