Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C52F1BD8F6
	for <lists+openbmc@lfdr.de>; Wed, 29 Apr 2020 12:02:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BvF34XvCzDr10
	for <lists+openbmc@lfdr.de>; Wed, 29 Apr 2020 20:01:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yandex-team.ru (client-ip=77.88.29.217;
 helo=forwardcorp1p.mail.yandex.net; envelope-from=kitsok@yandex-team.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=yandex-team.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.a=rsa-sha256 header.s=default header.b=hwAT3q7x; 
 dkim-atps=neutral
X-Greylist: delayed 95 seconds by postgrey-1.36 at bilbo;
 Wed, 29 Apr 2020 20:01:20 AEST
Received: from forwardcorp1p.mail.yandex.net (forwardcorp1p.mail.yandex.net
 [77.88.29.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BvDJ0pCDzDqLT
 for <openbmc@lists.ozlabs.org>; Wed, 29 Apr 2020 20:01:20 +1000 (AEST)
Received: from mxbackcorp1g.mail.yandex.net (mxbackcorp1g.mail.yandex.net
 [IPv6:2a02:6b8:0:1402::301])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 48D252E154A
 for <openbmc@lists.ozlabs.org>; Wed, 29 Apr 2020 12:59:29 +0300 (MSK)
Received: from localhost (localhost [::1])
 by mxbackcorp1g.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 xuvCsjG7cg-xTAK3Bn4; Wed, 29 Apr 2020 12:59:29 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1588154369; bh=EGnOCsHl9pJ3vjeWLpAUFZADvsynnZzmm8c9yHayjVY=;
 h=Date:Message-Id:Subject:To:From;
 b=hwAT3q7xcLCpNoEOTV6dtsEeXjw0ZeDLIxdxqHUI2w1Lh4Y/eTDp1EutPvlywpssM
 eWFBuU3rbdcLPyDDlPnf6n3x+muk+v6Li//XALsC9UztkJaXUhsZL28+Bnckvml7Ei
 KHzzZAsbOIgYFEj0MT3NLo55W4V3wtne9F5Ipz+E=
Authentication-Results: mxbackcorp1g.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000049860
X-Yandex-Avir: 1
Received: from mxbackcorp2j.mail.yandex.net (localhost [::1])
 by mxbackcorp2j.mail.yandex.net with LMTP id PrniA2nlA8-qxNrvA5q
 for <kitsok@yandex-team.ru>; Wed, 29 Apr 2020 12:59:19 +0300
Received: by vla1-bfecef18a7a0.qloud-c.yandex.net with HTTP;
 Wed, 29 Apr 2020 12:59:19 +0300
From: Konstantin Klubnichkin <kitsok@yandex-team.ru>
To: openbmc@lists.ozlabs.org
Subject: Polling OpenBMC using IPMB
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Wed, 29 Apr 2020 12:59:29 +0300
Message-Id: <8521588154162@mail.yandex-team.ru>
Content-Transfer-Encoding: 8bit
Content-Type: text/html; charset=utf-8
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

<div> </div><div> </div><div><div>Hello all!</div><div> </div><div>I've got a Purley motherboard with one of the I2C buses going out from AST2500 to external controller.</div><div>It gets BMC data (sensors, MAC address, etc) by polling it with IPMB.</div><div> </div><div>I'm trying to find out how to implement it in OpenBMC.</div><div>Is it ipmbbridge service used for this?</div><div> </div><div>Thank you!</div></div><div>-- </div><div>Best regards,</div><div>Konstantin Klubnichkin,</div><div>lead firmware engineer,</div><div>server hardware R&amp;D group,</div><div>Yandex Moscow office.</div><div>tel: +7-903-510-33-33</div><div> </div>
