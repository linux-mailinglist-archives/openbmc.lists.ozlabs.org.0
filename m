Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD873779E0
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 03:43:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FdkMt3Wx2z2yyG
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 11:43:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=eOIizJlG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=eOIizJlG; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FdkMY4rlkz2yXc;
 Mon, 10 May 2021 11:42:48 +1000 (AEST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 5129C2A8;
 Sun,  9 May 2021 18:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1620610963;
 bh=fTY1Or3lLvDzUlgv4eo2/CcR45q88eZ2rtCXzIFSd8c=;
 h=From:To:Cc:Subject:Date:From;
 b=eOIizJlGxOiK02IBxlm/VQd7RbnvQcvMuC/WiRQQUwOfZbc13rQ9/U6sGkRPqmSOy
 3EPBMu5Btyrw/hIjXYzwfhCY1MFgztvs1AgUUtS0bB+GVwzSBhJEx1a/yUWR5SQQ0S
 BWG1wXtbCgnWgAu9rxDEmqPsgcUAXFeNuqrBVEus=
From: Zev Weiss <zev@bewilderbeest.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 0/3] serial: 8250_aspeed_vuart: fix duplicate
 __release_region() on unbind
Date: Sun,  9 May 2021 20:42:28 -0500
Message-Id: <20210510014231.647-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-aspeed@lists.ozlabs.org, Zev Weiss <zev@bewilderbeest.net>,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

This series addresses a bug reported by Andrew Jeffery [0] wherein the
aspeed-vuart driver triggers a "Trying to free nonexistent resource"
warning from __release_region() when unbound from a device.  The first
two patches provide some preparatory refactoring and cleanups; the
actual fix is in the final patch.

Joel, note that this series has a dependency on the "generalized DT
properties" series [1] (specifically the second patch), which has been
merged upstream but is not yet in the OpenBMC dev-5.10 tree.

[0] https://github.com/openbmc/linux/issues/203
[1] https://lore.kernel.org/openbmc/20210412034712.16778-1-zev@bewilderbeest.net/

Zev Weiss (3):
  serial: 8250_aspeed_vuart: factor out aspeed_vuart_{read,write}b()
    helper functions
  serial: 8250_aspeed_vuart: initialize vuart->port in
    aspeed_vuart_probe()
  serial: 8250_aspeed_vuart: use UPF_IOREMAP to set up register mapping

 drivers/tty/serial/8250/8250_aspeed_vuart.c | 50 +++++++++++----------
 1 file changed, 27 insertions(+), 23 deletions(-)

-- 
2.31.1

