Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79590350B69
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 02:57:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9lCc3cdgz2yRT
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 11:57:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=HLlSpUNJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=HLlSpUNJ; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9lCL248Sz2yQr;
 Thu,  1 Apr 2021 11:57:33 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 9A5FB18F;
 Wed, 31 Mar 2021 17:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1617238652;
 bh=zQ7dyCLRGoMHs6Z0SXf2aeU6m0dmbYN41Vv7fdqBw0Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HLlSpUNJp6r34QbrAtGTIHJcmJydk+CziV6zzI0Y+qsMD/4h5R5fDB26RHqgJ4RQ0
 UaSfv6lgln0UzkzXb1Ay19bfWbfqI/cfP8tqi0tnTs76ky0R4uHI7AqDKnAcQgL5Pc
 4WZkqmmluwT7C4o8ZAB1RkAKQseqOZuRswLgJBi4=
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH v2 0/3] simplify Aspeed VUART SIRQ polarity DT config
Date: Wed, 31 Mar 2021 19:56:59 -0500
Message-Id: <20210401005702.28271-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <YGOuhjD19SmjmQou@hatter.bewilderbeest.net>
References: <YGOuhjD19SmjmQou@hatter.bewilderbeest.net>
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

The aspeed,sirq-polarity-sense property was a bit of a design mistake
in that it ties Aspeed VUART SIRQ polarity to SCU register bits that
aren't really inherently related to it.

This patch series deprecates that property (though we hope to
eventually remove it) and adds a simple boolean property
(aspeed,sirq-active-high) to use instead.


Changes since v1:
 - deprecate and retain aspeed,sirq-polarity-sense instead of removing it
 - drop e3c246d4i dts addition from this series


Zev Weiss (3):
  dt-bindings: serial: 8250: deprecate aspeed,sirq-polarity-sense
  drivers/tty/serial/8250: add DT property for aspeed vuart sirq
    polarity
  dt-bindings: serial: 8250: add aspeed,sirq-active-high

 Documentation/devicetree/bindings/serial/8250.yaml | 14 +++++++++++---
 drivers/tty/serial/8250/8250_aspeed_vuart.c        |  3 +++
 2 files changed, 14 insertions(+), 3 deletions(-)

-- 
2.31.1

