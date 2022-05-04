Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD2751979B
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 08:51:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtSCv01rlz3bdN
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 16:51:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=hZUIcqjn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=hZUIcqjn; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtSCS2fskz2xnM
 for <openbmc@lists.ozlabs.org>; Wed,  4 May 2022 16:51:00 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-163-222.tukw.qwest.net
 [174.21.163.222])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 9CB18169;
 Tue,  3 May 2022 23:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1651647057;
 bh=u1be6Hsy9QkoZoQsBwtNHnw+57iMhXxgiUyN9o/iLGk=;
 h=From:To:Cc:Subject:Date:From;
 b=hZUIcqjnEATs2o08eIaqBvgjwRtC90gHuN6pS3KxQax0Udv7Reuh5Mf6lIirwPSoZ
 6jtYdDcA0BoGGHgNa914YenMHmE8QgFFAVBBG/vEF4b9F+WJP177UBbq8VFThWoUvS
 QnXR9mMn/9fGYHALpPYdtBfPNEYgZngnmDHzX/1M=
From: Zev Weiss <zev@bewilderbeest.net>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 0/6] regulator: core: Add support for external outputs
Date: Tue,  3 May 2022 23:50:35 -0700
Message-Id: <20220504065041.6718-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.36.0
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
Cc: devicetree@vger.kernel.org, Zev Weiss <zev@bewilderbeest.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

This patch series is a new approach at implementing some functionality
I previously attempted as a separate driver in drivers/misc [0], but I
think (as suggested by Greg in that thread) ultimately makes more
sense being built into the regulator subsystem.

The hardware arrangement essentially amounts to a regulator whose
output doesn't supply any devices within the system, but instead
simply feeds a "dumb" external output -- picture a typical power
distribution unit (PDU), but with DC outputs instead of AC.  (The
specific system I'm targeting at the moment is the Delta AHE-50DC
Open19 power shelf [1], for which I'm working on a port of OpenBMC.)

Supporting this doesn't require much in the way of new functionality,
just some plumbing so that userspace (typically a human operator
manually switching outlets on and off) can access the necessary bits
of the regulator subsystem, and some DT bindings to describe this sort
of setup.

The DT bindings changes (patches 1 and 2) consist of a boolean
regulator property to mark it as supplying an external output, and a
reg-external-output binding to act as a downstream device representing
that output.  The redundancy between the two maybe isn't entirely
ideal, but it was the cleanest approach I've been able to come up with
so far in terms of working with the regulator subsystem; I'm certainly
open to suggestions for better ways of going about this.

Within the regulator core, patch 3 exposes the REGULATOR_ERROR_* flags
(for regulators that define a get_error_flags() operation) to
userspace as a set of read-only sysfs attributes, so that operators
can diagnose the cause of faults that may occur, such as current or
thermal limits being exceeded.

Patch 4 adds support for the regulator-external-output property with a
couple of small functional tweaks, making the 'state' sysfs attribute
writable and skipping the auto-disabling in regulator_late_cleanup().
Patch 5 adds a special-purpose regulator_get_type (EXTERNAL_GET), and
patch 6 adds a tiny driver acting as a placeholder for an external
output, using EXTERNAL_GET.

Review/feedback appreciated!


Thanks,
Zev

[0] https://lore.kernel.org/openbmc/20220308011811.10353-1-zev@bewilderbeest.net/
[1] https://www.open19.org/marketplace/delta-16kw-power-shelf/

Zev Weiss (6):
  dt-bindings: regulator: Add regulator-external-output property
  dt-bindings: regulator: Add reg-external-output
  regulator: core: Add error flags to sysfs attributes
  regulator: core: Add external-output support
  regulator: core: Add external get type
  regulator: core: Add external-consumer driver

 .../ABI/testing/sysfs-class-regulator         |  85 ++++++++++++
 .../regulator/reg-external-output.yaml        |  37 +++++
 .../bindings/regulator/regulator.yaml         |   6 +
 drivers/regulator/Kconfig                     |   9 ++
 drivers/regulator/core.c                      | 130 ++++++++++++++++--
 drivers/regulator/devres.c                    |   7 +
 drivers/regulator/internal.h                  |   3 +
 drivers/regulator/of_regulator.c              |   2 +
 include/linux/regulator/machine.h             |   1 +
 9 files changed, 272 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/reg-external-output.yaml

-- 
2.36.0

