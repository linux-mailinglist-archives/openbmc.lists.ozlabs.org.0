Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7269235B914
	for <lists+openbmc@lfdr.de>; Mon, 12 Apr 2021 05:47:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJZSf3F5cz30Bw
	for <lists+openbmc@lfdr.de>; Mon, 12 Apr 2021 13:47:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=S3GeX56E;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=S3GeX56E; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJZSP13HRz300K;
 Mon, 12 Apr 2021 13:47:32 +1000 (AEST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 60AF24DC;
 Sun, 11 Apr 2021 20:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1618199247;
 bh=PchFdXcg+941tH+XkYeqz92HXenAc27JmxDyUQQKTdw=;
 h=From:To:Cc:Subject:Date:From;
 b=S3GeX56EyvZ0kf4dfQG1TfthRJG2RhWY4/aC4WQMzC4QioL2l3CYDLUl2+SD5Uwbx
 rPt/Gipv09iozsgYBpvOJjTBBOSq6bJrm+eCimGEZj0nxq8yccex/RJW5smHH1z8Qk
 AOzdcLdSlymvODJ3uxxYcMYFQnQ/8p1ALVLpdVXk=
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH v6 0/4] serial: 8250_aspeed_vuart: generalized DT properties
Date: Sun, 11 Apr 2021 22:47:08 -0500
Message-Id: <20210412034712.16778-1-zev@bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Zev Weiss <zev@bewilderbeest.net>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>,
 Rob Herring <robh+dt@kernel.org>, linux-serial@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This series generalizes the aspeed-vuart driver's device tree
properties to cover all the attributes it currently exposes via sysfs.

The aspeed,sirq-polarity-sense property was a bit of a design mistake
in that it ties Aspeed VUART SIRQ polarity to SCU register bits that
aren't really inherently related to it; the first patch in this series
deprecates it (though we hope to eventually remove it).

The rest of the series adds two new properties, aspeed,lpc-io-reg and
aspeed,lpc-interrupts.  The latter allows describing the SIRQ polarity
(along with the interrupt number) directly, providing a simpler
replacement for aspeed,sirq-polarity-sense.

Changes since v5 [4]:
 - corrected stale DT property name in commit message
 - factored aspeed_vuart_map_irq_polarity() out of
   aspeed_vuart_probe()
 - fixed commit message subject line prefixes

Changes since v4 [3]:
 - fixed commit reference formatting in commit message

Changes since v3 [2]:
 - renamed properties to match aspeed,ast2400-kcs-bmc

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
[2] https://lore.kernel.org/openbmc/20210402004716.15961-1-zev@bewilderbeest.net/
[3] https://lore.kernel.org/openbmc/20210402182724.20848-1-zev@bewilderbeest.net/
[4] https://lore.kernel.org/openbmc/20210408011637.5361-1-zev@bewilderbeest.net/


Zev Weiss (4):
  dt-bindings: serial: 8250: deprecate aspeed,sirq-polarity-sense
  serial: 8250_aspeed_vuart: refactor sirq and lpc address setting code
  serial: 8250_aspeed_vuart: add aspeed,lpc-io-reg and
    aspeed,lpc-interrupts DT properties
  dt-bindings: serial: 8250: add aspeed,lpc-io-reg and
    aspeed,lpc-interrupts

 .../devicetree/bindings/serial/8250.yaml      |  28 ++++-
 drivers/tty/serial/8250/8250_aspeed_vuart.c   | 102 ++++++++++++++----
 2 files changed, 109 insertions(+), 21 deletions(-)

-- 
2.31.1

