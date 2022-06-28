Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6AE55E5E9
	for <lists+openbmc@lfdr.de>; Tue, 28 Jun 2022 18:21:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXVFy2TXjz3cK6
	for <lists+openbmc@lfdr.de>; Wed, 29 Jun 2022 02:21:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXVFg5fx1z3btt
	for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2022 02:20:55 +1000 (AEST)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4LXVFc39qSz4xYC;
	Wed, 29 Jun 2022 02:20:52 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LXVFW5g0nz4xD5;
	Wed, 29 Jun 2022 02:20:47 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 0/5] spi: aspeed: Add a "ranges" property
Date: Tue, 28 Jun 2022 18:20:39 +0200
Message-Id: <20220628162044.1121337-1-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

Currently, the Linux Aspeed SMC driver computes the decoding ranges of
each CS (AHB memory window on which the flash contents are mapped)
from the size of the detected flash device. It seems that some chips
have issues with the computed ranges and for these, it would be nice
to be able to define custom decoding ranges in the DT.

Here is a little series doing that, including a preliminary fix. Last
patch is a simple test for the AST2500 EVB. Comments welcome.

Thanks,

C. 

Cédric Le Goater (5):
  spi: aspeed: Fix window offset of CE1
  spi: aspeed: Introduce a "windows" device attribute
  spi: dt-bindings: aspeed: Add a ranges property
  spi: aspeed: Handle custom decoding ranges
  ARM: dts: aspeed: ast2500-evb: Add custom decoding ranges (TEST)

 drivers/spi/spi-aspeed-smc.c                  | 108 +++++++++++++++++-
 .../bindings/spi/aspeed,ast2600-fmc.yaml      |   9 ++
 arch/arm/boot/dts/aspeed-ast2500-evb.dts      |   3 +
 3 files changed, 118 insertions(+), 2 deletions(-)

-- 
2.35.3

