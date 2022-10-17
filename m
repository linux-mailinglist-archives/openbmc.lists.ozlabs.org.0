Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72746600A3E
	for <lists+openbmc@lfdr.de>; Mon, 17 Oct 2022 11:17:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MrWbN1tFFz3drK
	for <lists+openbmc@lfdr.de>; Mon, 17 Oct 2022 20:17:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MrWZt6gp1z2xb4;
	Mon, 17 Oct 2022 20:16:38 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4MrWZr12rvz4xGl;
	Mon, 17 Oct 2022 20:16:36 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MrWZh54s8z4wgv;
	Mon, 17 Oct 2022 20:16:28 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-spi@vger.kernel.org
Subject: [PATCH linux v2 0/3] spi: aspeed: Add a "ranges" property
Date: Mon, 17 Oct 2022 11:16:21 +0200
Message-Id: <20221017091624.130227-1-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, linux-arm-kernel@lists.infradead.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

Currently, the Linux Aspeed SMC driver computes the decoding ranges of
each CS (AHB memory window on which the flash contents are mapped)
from the size of the detected flash device. It seems that some chips
have issues with the computed ranges and for these, it would be nice
to be able to define custom decoding ranges in the DT.

Here is a little series doing that. 

Thanks,

C. 

Changes in v2 :

 - Tested by Naresh Solanki
 - sent preliminary fix independently
   https://patchwork.kernel.org/project/linux-arm-kernel/patch/20221016155722.3520802-1-clg@kaod.org/
 - changed the sysfs file exposing the register values to debugfs.
 - refresh on 6.1-rc1

Cédric Le Goater (3):
  spi: dt-bindings: aspeed: Add a ranges property
  spi: aspeed: Handle custom decoding ranges
  spi: aspeed: Introduce a "ranges" debugfs file

 drivers/spi/spi-aspeed-smc.c                  | 131 +++++++++++++++++-
 .../bindings/spi/aspeed,ast2600-fmc.yaml      |   9 ++
 2 files changed, 138 insertions(+), 2 deletions(-)

-- 
2.37.3

