Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A0F424AF2
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 02:10:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPsDG3QKqz30D0
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 11:10:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=gCPWmQkF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=gCPWmQkF; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPsCQ0VDFz2yx9;
 Thu,  7 Oct 2021 11:10:09 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 7055552;
 Wed,  6 Oct 2021 17:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1633565405;
 bh=XNJ+HTYwQ2IQpncUFadRIFOJg2t8M7ncy59/V0Jd3Ys=;
 h=From:To:Cc:Subject:Date:From;
 b=gCPWmQkFOF+uxRlYH8EKU/FK5HMST9HArklIZhSLKVdDTYYhb9Bymp6Hx8f33g8dd
 Jp2uDnMCw0LJeKx1I7VXrb+uSP7UVhulS1bCEkrHnzwQJtjhc2W+B222j3y1aPZZeT
 emW63dSFGBweyF84xuzT9QN10IxpLVkH4i5CG7og=
From: Zev Weiss <zev@bewilderbeest.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 0/9] Dynamic DT device nodes
Date: Wed,  6 Oct 2021 17:09:45 -0700
Message-Id: <20211007000954.30621-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.33.0
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
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Zev Weiss <zev@bewilderbeest.net>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Jeremy Kerr <jk@codeconstruct.com.au>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 linux-aspeed@lists.ozlabs.org, Frank Rowand <frowand.list@gmail.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 devicetree@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Rob Herring <robh+dt@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 Daniel Axtens <dja@axtens.net>, Andy Shevchenko <andy@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

This patch series is in some ways kind of a v2 for the "Dynamic
aspeed-smc flash chips via 'reserved' DT status" series I posted
previously [0], but takes a fairly different approach suggested by Rob
Herring [1] and doesn't actually touch the aspeed-smc driver or
anything in the MTD subsystem, so I haven't marked it as such.

To recap a bit of the context from that series, in OpenBMC there's a
need for certain devices (described by device-tree nodes) to be able
to be attached and detached at runtime (for example the SPI flash for
the host's firmware, which is shared between the BMC and the host but
can only be accessed by one or the other at a time).  To provide that
ability, this series adds support for a new common device-tree
property, a boolean "dynamic" that indicates that the device may come
and go at runtime.  When present on a node, the sysfs file for that
node's "status" property is made writable, allowing userspace to do
things like:

  $ echo okay > /sys/firmware/devicetree/.../status
  $ echo reserved > /sys/firmware/devicetree/.../status

to activate and deactivate a dynamic device.

Because it leans on the OF_DYNAMIC machinery internally, this
functionality will only work on busses that register for OF reconfig
notifications and handle them appropriately (presently platform, i2c,
and spi).  This series does not attempt to solve the "dynamic devices
further down the tree" problem [2]; my hope is that handling for OF
reconfig notifications can be extended to other families of devices
(e.g. individual MTD spi-nor flash chips) in the future.

The central change of the series is patch 6; patches 1-5 are various
small infrastructure bits and plumbing tweaks in preparation for #6;
patches 7-9 are Kconfig, documentation, and an inaugural use of the
new property in the ASRock e3c246d4i BMC device tree.

Note that this series requires the duplicate-declaration removal patch
that was recently merged in Rob's tree [3]; it changes one of the
duplicated declarations and hence will not compile without that patch
(because the declarations no longer match).

[0] https://lore.kernel.org/openbmc/20210929115409.21254-1-zev@bewilderbeest.net/
[1] https://lore.kernel.org/openbmc/CAL_JsqJH+b5oFuSP+KBLBsN5QTA6xASuqXJWXUaDkHhugXPpnQ@mail.gmail.com/
[2] https://lore.kernel.org/openbmc/20210929220038.GS17315@packtop/
[3] https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=6663ae07d995f5fbe2988a19858b2f87e68cf929

Zev Weiss (9):
  sysfs: add sysfs_remove_bin_file_self() function
  sysfs: add growable flag to struct bin_attribute
  lib/string: add sysfs_buf_streq()
  of: add self parameter to __of_sysfs_remove_bin_file()
  of: add self parameter to of_update_property()
  of: add support for 'dynamic' DT property
  of: make OF_DYNAMIC selectable independently of OF_UNITTEST
  dt-bindings: document new 'dynamic' common property
  ARM: dts: aspeed: Add e3c246d4i BIOS flash device

 .../devicetree/bindings/common-properties.txt | 18 ++++
 .../boot/dts/aspeed-bmc-asrock-e3c246d4i.dts  | 23 ++++++
 drivers/of/Kconfig                            |  8 +-
 drivers/of/base.c                             |  7 +-
 drivers/of/dynamic.c                          |  2 +-
 drivers/of/kobj.c                             | 82 +++++++++++++++++--
 drivers/of/of_private.h                       |  6 +-
 fs/sysfs/file.c                               | 15 +++-
 include/linux/of.h                            |  7 +-
 include/linux/string.h                        |  1 +
 include/linux/sysfs.h                         |  2 +
 lib/string.c                                  | 34 ++++++++
 12 files changed, 187 insertions(+), 18 deletions(-)

-- 
2.33.0

