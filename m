Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64259165C17
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2020 11:47:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NWWF5HFLzDqNJ
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2020 21:47:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yandex-team.ru (client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 helo=forwardcorp1p.mail.yandex.net; envelope-from=kitsok@yandex-team.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=yandex-team.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.a=rsa-sha256 header.s=default header.b=mCmT/KV4; 
 dkim-atps=neutral
X-Greylist: delayed 77 seconds by postgrey-1.36 at bilbo;
 Thu, 20 Feb 2020 21:46:50 AEDT
Received: from forwardcorp1p.mail.yandex.net (forwardcorp1p.mail.yandex.net
 [IPv6:2a02:6b8:0:1472:2741:0:8b6:217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NWVf2CGFzDqDy
 for <openbmc@lists.ozlabs.org>; Thu, 20 Feb 2020 21:46:50 +1100 (AEDT)
Received: from mxbackcorp2j.mail.yandex.net (mxbackcorp2j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::119])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 48C5F2E0ACD
 for <openbmc@lists.ozlabs.org>; Thu, 20 Feb 2020 13:45:13 +0300 (MSK)
Received: from localhost (localhost [::1])
 by mxbackcorp2j.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 q8Ub3FfKjX-jDe09VuG; Thu, 20 Feb 2020 13:45:13 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1582195513; bh=lE6Dzx8poDSnt3BaCG5VYLJULygbdi59wvhqlaf0joM=;
 h=Date:Message-Id:Subject:To:From;
 b=mCmT/KV4fBGwVSn4oh4qFwSAC9fi9MUdmYp9mN41FiQN+XgByaiNoHdqFWPKRSEFw
 vPw+stMIaMyNLOvO/iYONkOG3g+oQjCNh3EmzvlgWqN7Gw3E8Iwsc5U4XPuRW4ss6E
 HZfvl4HAiHmrfBHbCCmOpn+vFw1ZgOnF8I9BtjPc=
Authentication-Results: mxbackcorp2j.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000049860
X-Yandex-Avir: 1
Received: from mxbackcorp1j.mail.yandex.net (localhost [::1])
 by mxbackcorp1j.mail.yandex.net with LMTP id uxacFsN3Vd-RiS8s666
 for <kitsok@yandex-team.ru>; Thu, 20 Feb 2020 13:45:02 +0300
Received: by iva4-6d0ca09d92db.qloud-c.yandex.net with HTTP;
 Thu, 20 Feb 2020 13:45:02 +0300
From: Konstantin Klubnichkin <kitsok@yandex-team.ru>
To: openbmc@lists.ozlabs.org
Subject: OpenBMC on AMD
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Thu, 20 Feb 2020 13:45:12 +0300
Message-Id: <2834631582195502@iva4-6d0ca09d92db.qloud-c.yandex.net>
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

<div>Hello all!</div><div> </div><div>I'm curious if there a port of OpenBMC for AMD-based server?</div><div>Particularly I'm looking for implementation of SB-TSI interface that is used to get CPU temperature in the latest AMD CPUs.</div><div> </div><div>Thank you!</div><div>-- </div><div>Best regards,</div><div>Konstantin Klubnichkin,</div><div>lead firmware engineer,</div><div>server hardware R&amp;D group,</div><div>Yandex Moscow office.</div><div>tel: +7-903-510-33-33</div><div> </div>
