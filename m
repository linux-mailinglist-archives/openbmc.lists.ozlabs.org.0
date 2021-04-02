Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B7C3524A9
	for <lists+openbmc@lfdr.de>; Fri,  2 Apr 2021 02:48:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBLy349jHz3c00
	for <lists+openbmc@lfdr.de>; Fri,  2 Apr 2021 11:48:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=R8mzpnKt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=R8mzpnKt; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBLxK02dHz3002;
 Fri,  2 Apr 2021 11:47:32 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id DBD03198;
 Thu,  1 Apr 2021 17:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1617324447;
 bh=PYdZ582Vtu5uaxo3rYLZYV0ksOW+VIQtUyPSDHJWw9U=;
 h=From:To:Cc:Subject:Date:From;
 b=R8mzpnKtfiG/wHUiNQeVX2pglbX/y08wf2vydxHOQi10L4Vi8OIsV7MeoXl4Zixq2
 zOErFABuz7GOOm0qwYV6z+eZUB5tgd7pFQL6nnb61bPrPPxOw5Yei6/irsSmVovlBf
 FM2KyMsYZ3PQBPf+l7m5bEk43slB7Y4ZWNADcG2s=
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH v3 0/4] aspeed-vuart: generalized DT properties
Date: Thu,  1 Apr 2021 19:47:12 -0500
Message-Id: <20210402004716.15961-1-zev@bewilderbeest.net>
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This series generalizes the aspeed-vuart driver's device tree
properties to cover all the attributes it currently exposes via sysfs.

The aspeed,sirq-polarity-sense property was a bit of a design mistake
in that it ties Aspeed VUART SIRQ polarity to SCU register bits that
aren't really inherently related to it; the first patch in this series
deprecates it (though we hope to eventually remove it).

The rest of the series adds two new properties, aspeed,lpc-address and
aspeed,sirq.  The latter allows describing the SIRQ polarity (along
with the interrupt number) directly, providing a simpler replacement
for aspeed,sirq-polarity-sense.


Changes since v2 [0]:
 - expanded to also handle sirq number and lpc address in addition to
   sirq polarity
 - added default settings if DT properties not specified
 - refactored existing sysfs code slightly, adding range checks
 - cleaned up 'make dt_binding_check' warnings

Changes since v1 [1]:
 - deprecate and retain aspeed,sirq-polarity-sense instead of removing it
 - drop e3c246d4i dts addition from this series

[0] https://lore.kernel.org/openbmc/20210401005702.28271-1-zev@bewilderbeest.net/
[1] https://lore.kernel.org/openbmc/20210330002338.335-1-zev@bewilderbeest.net/

Zev Weiss (4):
  dt-bindings: serial: 8250: deprecate aspeed,sirq-polarity-sense
  drivers/tty/serial/8250: refactor sirq and lpc address setting code
  drivers/tty/serial/8250: add aspeed,lpc-address and aspeed,sirq DT
    properties
  dt-bindings: serial: 8250: add aspeed,lpc-address and aspeed,sirq

 .../devicetree/bindings/serial/8250.yaml      | 28 +++++-
 drivers/tty/serial/8250/8250_aspeed_vuart.c   | 95 +++++++++++++++----
 2 files changed, 103 insertions(+), 20 deletions(-)

-- 
2.31.1

