Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4836F6141E6
	for <lists+openbmc@lfdr.de>; Tue,  1 Nov 2022 00:38:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1V3C1GZbz2y84
	for <lists+openbmc@lfdr.de>; Tue,  1 Nov 2022 10:38:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=CmWtz2Lk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=CmWtz2Lk;
	dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1V1f39dSz2xl6
	for <openbmc@lists.ozlabs.org>; Tue,  1 Nov 2022 10:37:25 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (97-113-250-99.tukw.qwest.net [97.113.250.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 9FFE41A6;
	Mon, 31 Oct 2022 16:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1667259441;
	bh=GLGVMdoDtbXFLdR5gzwkTxprtOlfY6bO49NgltdEOWU=;
	h=From:To:Cc:Subject:Date:From;
	b=CmWtz2Lk/qhETggmfAmjtxDSQO+qfOCyCLtG4uqyWok43srnVxM6XaJCPsWLgLvRk
	 ktAsSp2/Mqo6y4Eyhvm3YVzTzkyHK/KuyDoOBskoxzjVns6TG73O5CkTFAU8urzWWN
	 jmNiDOceza1QEnS4Ykk3oQmUMozhSFBxZjNZXNkY=
From: Zev Weiss <zev@bewilderbeest.net>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/3] regulator: Add DT support for regulator-output connectors
Date: Mon, 31 Oct 2022 16:37:01 -0700
Message-Id: <20221031233704.22575-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.38.1
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
Cc: Zev Weiss <zev@bewilderbeest.net>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Naresh Solanki <naresh.solanki@9elements.com>, Laxman Dewangan <ldewangan@nvidia.com>, Patrick Rudolph <patrick.rudolph@9elements.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

This is v2 of my recent series adding support for userspace-controlled
regulator-supplied power outputs [2].  This is an important feature
for some kinds of BMC (baseboard management controller) systems where
the BMC provides an operator with manual control of a set of DC power
outputs.

As in a broadly similar patchset that was recently almost merged [0],
this takes the approach of providing support by extending the existing
userspace-consumer regulator driver.  A couple questions about the
userspace-consumer driver came up along the way, however.

First, how (if at all) is it currently being used?  It appears the
last in-tree use of it was removed a bit over two years ago in commit
9d3239147d6d ("ARM: pxa: remove Compulab pxa2xx boards").  Aside from
just adding DT support I've made a couple small tweaks to the driver
in patch 3 that I hope are compatible with any current usage, but
without any extant examples to look at it's kind of hard to say.

Second, how critical is its support for controlling multiple
regulators?  (i.e. its use of regulator_bulk_data and friends instead
of a single struct regulator.)  As far as I can see every in-tree use
of it that's ever existed has used num_supplies = 1.  If it's not
important to retain, patch 1 of this series could be supplanted by one
that instead simplifies the driver slightly by removing that
functionality.

The DT binding added in patch 2 is essentially identical to one I
posted in a previous patchset that had an R-B from Rob [1], but has
had some minor rewording and been moved from the extcon subsystem to
the regulator subsystem.

Changes since v1 [2]:
 - removed 'regulator-leave-on' DT property
 - added .is_visible method to hide sysfs 'name' property when it's
   NULL


Thanks,
Zev

[0] https://lore.kernel.org/all/20220707081826.953449-4-Naresh.Solanki@9elements.com/
[1] https://lore.kernel.org/linux-kernel/20220505232557.10936-2-zev@bewilderbeest.net/
[2] https://lore.kernel.org/openbmc/20220925220319.12572-1-zev@bewilderbeest.net/

Zev Weiss (3):
  regulator: devres: Add devm_regulator_bulk_get_exclusive()
  dt-bindings: regulator: Add regulator-output binding
  regulator: userspace-consumer: Handle regulator-output DT nodes

 .../bindings/regulator/regulator-output.yaml  | 39 +++++++++++
 drivers/regulator/core.c                      | 42 +++++++-----
 drivers/regulator/devres.c                    | 66 ++++++++++++++-----
 drivers/regulator/internal.h                  |  2 +
 drivers/regulator/userspace-consumer.c        | 60 +++++++++++++++--
 include/linux/regulator/consumer.h            |  2 +
 include/linux/regulator/userspace-consumer.h  |  1 +
 7 files changed, 169 insertions(+), 43 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/regulator-output.yaml

-- 
2.38.1

