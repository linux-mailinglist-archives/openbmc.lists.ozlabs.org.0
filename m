Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0714CA4CDC
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 02:41:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MB922Gc6zDqc3
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 10:41:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--maennich.bounces.google.com
 (client-ip=2607:f8b0:4864:20::e4a; helo=mail-vs1-xe4a.google.com;
 envelope-from=33dbdxqgkb6mpdhqqlfkjrrjoh.frprshqepfolvwv.rcodev.ruj@flex--maennich.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="aFsPSold"; 
 dkim-atps=neutral
Received: from mail-vs1-xe4a.google.com (mail-vs1-xe4a.google.com
 [IPv6:2607:f8b0:4864:20::e4a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46D5fw1fKGzDqC0
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 21:54:08 +1000 (AEST)
Received: by mail-vs1-xe4a.google.com with SMTP id t76so620113vst.16
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 04:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=dbeW0AhXXR+v+YpCW2kANc+N3K5c0SZUYgqqbrZZvE4=;
 b=aFsPSoldM0Bd3aP9qJf30Ez9RAxoobocKtreV6qZLpZt8GkW7vl5cqWuJrbWh976Yb
 O6PJiYAMkAVxNpXHI4U394FvT0flIvSg+jsiI7gtohdkD4B6wlBMzDmUcAHTPDgXSYn0
 XNELYY9SOwcG2+YLsILGLD72LxV62fTC3S2cEs6KtuTBjsa3i6n6N5uxjKvV0MwRSz6V
 RA6jA3/uX5YE3XaHxektIv6xLOwNvbtx5jCPbkW6UZFn0RUB/19f1mkieVvh9lJfx/uh
 GTw8bLjusCSmCyuEUFWe99eIkgh0CfPTuSyKXKPwxKWjvT7+jE7jXHWOaEgwgtxCUe1d
 8rlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=dbeW0AhXXR+v+YpCW2kANc+N3K5c0SZUYgqqbrZZvE4=;
 b=CCrFQjmjGBeHCyZLz+rmDB35j+0/KN8+jGUO6xTYk//7JnlAXaxeMUVMsb7cpBVoMw
 dd3RbeICsXQaqR+TqyL7EgQqw+4aiLq4mE82MR7GmGpjZ3TofJvU2JEzWBTXFDi0WqGi
 6BzpHBvqikAFCZkSCUMCRpih/0L2eEEkIwCX9P+IVMJw4iBNkIYZ1vywaYQzziHAYxiF
 WIhRLu7oBv/RCN3tYT4x8UH6fXRHjI+BGOpghgMV192FgQX8ciJUgQYoA5LMgY2PR3tJ
 Rflu52tlCINC7v7J+FV2ZLAl+7kSVgaxhPHwSirlRGg7LFZ//GvEr2i2jVwofjYHUiI7
 hi/w==
X-Gm-Message-State: APjAAAUG524Zvba2PognOpBweqg3uR6VCDZmOsi1XrGRl4JTyXYsnOh0
 AcjI2X6uwd9uGBLEG8tf44wkQn1ZUlkJJQ==
X-Google-Smtp-Source: APXvYqzEhKafXMjJoeTZyC7zvtkDGEgBz64AYQQy+0Uw+lMBm7os5APWm8dgDVK460ybb2au7ed1CCFcEK0k1Q==
X-Received: by 2002:a1f:3887:: with SMTP id f129mr12005868vka.15.1566388444681; 
 Wed, 21 Aug 2019 04:54:04 -0700 (PDT)
Date: Wed, 21 Aug 2019 12:49:15 +0100
In-Reply-To: <20190813121733.52480-1-maennich@google.com>
Message-Id: <20190821114955.12788-1-maennich@google.com>
Mime-Version: 1.0
References: <20190813121733.52480-1-maennich@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v3 00/11] Symbol Namespaces
From: Matthias Maennich <maennich@google.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 02 Sep 2019 10:34:52 +1000
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
Cc: kstewart@linuxfoundation.org, oneukum@suse.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-aspeed@lists.ozlabs.org,
 usb-storage@lists.one-eyed-alien.net, Toru Komatsu <k0ma@utam0k.jp>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 David Howells <dhowells@redhat.com>, yamada.masahiro@socionext.com,
 Will Deacon <will@kernel.org>, patches@opensource.cirrus.com,
 Michael Ellerman <mpe@ellerman.id.au>, hpa@zytor.com, joel@joelfernandes.org,
 bcm-kernel-feedback-list@broadcom.com, sam@ravnborg.org, cocci@systeme.lip6.fr,
 linux-arch@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Benjamin Fair <benjaminfair@google.com>, linux-scsi@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, openbmc@lists.ozlabs.org, x86@kernel.org,
 lucas.de.marchi@gmail.com, mingo@redhat.com, geert@linux-m68k.org,
 NXP Linux Team <linux-imx@nxp.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Patrick Venture <venture@google.com>, stern@rowland.harvard.edu,
 kernel-team@android.com, Dan Williams <dan.j.williams@intel.com>,
 Ingo Molnar <mingo@kernel.org>, linux-rtc@vger.kernel.org,
 Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>, sspatil@google.com,
 linux-watchdog@vger.kernel.org, arnd@arndb.de, linux-kbuild@vger.kernel.org,
 Jani Nikula <jani.nikula@intel.com>, linux-arm-msm@vger.kernel.org,
 jeyu@kernel.org, maennich@google.com, Julia Lawall <julia.lawall@lip6.fr>,
 linux-m68k@lists.linux-m68k.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, tglx@linutronix.de, maco@android.com,
 linux-arm-kernel@lists.infradead.org, Adrian Reber <adrian@lisas.de>,
 linux-hwmon@vger.kernel.org, michal.lkml@markovi.net,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 Alexey Gladkov <gladkov.alexey@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Nicolas Pitre <nico@fluxnic.net>,
 Patrick Bellasi <patrick.bellasi@arm.com>, Richard Guy Briggs <rgb@redhat.com>,
 maco@google.com, Pengutronix Kernel Team <kernel@pengutronix.de>,
 pombredanne@nexb.com, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

As of Linux 5.3-rc5, there are 31205 [1] exported symbols in the kernel.
That is a growth of roughly 1000 symbols since 4.17 (30206 [2]).  There
seems to be some consensus amongst kernel devs that the export surface
is too large, and hard to reason about.

Generally, these symbols fall in one of these categories:
1) Symbols actually meant for drivers
2) Symbols that are only exported because functionality is split over
   multiple modules, yet they really shouldn't be used by modules outside
   of their own subsystem
3) Symbols really only meant for in-tree use

When module developers try to upstream their code, it regularly turns
out that they are using exported symbols that they really shouldn't be
using. This problem is even bigger for drivers that are currently
out-of-tree, which may be using many symbols that they shouldn't be
using, and that break when those symbols are removed or modified.

This patch allows subsystem maintainers to partition their exported
symbols into separate namespaces, and module authors to import such
namespaces only when needed.

This allows subsystem maintainers to more easily limit availability of
these namespaced symbols to other parts of the kernel. It can also be
used to partition the set of exported symbols for documentation
purposes; for example, a set of symbols that is really only used for
debugging could be in a "SUBSYSTEM_DEBUG" namespace.

I continued the work mainly done by Martijn Coenen.

Changes in v2:
- Rather than adding and evaluating separate sections __knsimport_NS,
  use modinfo tags to declare the namespaces a module introduces.
  Adjust modpost and the module loader accordingly.
- Also add support for reading multiple modinfo values for the same tag
  to allow list-like access to modinfo tags.
- The macros in export.h have been cleaned up to avoid redundancy in the
  macro parameters (ns, nspost, nspost2).
- The introduction of relative references in the ksymtab entries caused
  a rework of the macros to accommodate that configuration as well.
- Alignment of kernel_symbol in the ksymtab needed to be fixed to allow
  growing the kernel_symbol struct.
- Modpost does now also append the namespace suffix to the symbol
  entries in Module.symvers.
- The configuration option MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS allows
  relaxing the enforcement of properly declared namespace imports at
  module loading time.
- Symbols can be collectively exported into a namespace by defining
  DEFAULT_SYMBOL_NAMESPACE in the corresponding Makefile.
- The requirement for a very recent coccinelle spatch has been lifted by
  simplifying the script.
- nsdeps does now ensures MODULE_IMPORT_NS statements are sorted when
  patching the module source files.
- Some minor bugs have been addressed in nsdeps to allow it to work with
  modules that have more than one source file.
- The RFC for the usb-storage symbols has been simplified by using
  DEFAULT_SYMBOL_NAMESPACE=USB_STORAGE rather than explicitly exporting
  each and every symbol into that new namespace.

Changes in v3:
- Reword the documentation for the
  MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS option for clarification.
- Fix printed required version of spatch in coccinelle script.
- Adopt kbuild changes for modpost: .mod files are no longer generated
  in .tmp_versions. Similarely, generate the .ns_deps files in the tree
  along with the .mod files. Also, nsdeps now uses modules.order as
  source for the list modules to consider.
- Add an RFC patch to introduce the namespace WATCHDOG_CORE for symbols
  exported in watchdog_core.c.

This patch series was developed against Linus' master (15d90b242290).

[1] git grep "^EXPORT_SYMBOL\w*(" v5.3-rc5 | wc -l
[2] git grep "^EXPORT_SYMBOL\w*(" v4.17    | wc -l


Matthias Maennich (11):
  module: support reading multiple values per modinfo tag
  export: explicitly align struct kernel_symbol
  module: add support for symbol namespaces.
  modpost: add support for symbol namespaces
  module: add config option MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS
  export: allow definition default namespaces in Makefiles or sources
  modpost: add support for generating namespace dependencies
  scripts: Coccinelle script for namespace dependencies.
  usb-storage: remove single-use define for debugging
  RFC: usb-storage: export symbols in USB_STORAGE namespace
  RFC: watchdog: export core symbols in WATCHDOG_CORE namespace

 .gitignore                                  |   1 +
 MAINTAINERS                                 |   5 +
 Makefile                                    |  14 +-
 arch/m68k/include/asm/export.h              |   1 -
 drivers/hwmon/ftsteutates.c                 |   1 +
 drivers/hwmon/sch56xx-common.c              |   1 +
 drivers/rtc/rtc-abx80x.c                    |   1 +
 drivers/usb/storage/Makefile                |   2 +
 drivers/usb/storage/alauda.c                |   1 +
 drivers/usb/storage/cypress_atacb.c         |   1 +
 drivers/usb/storage/datafab.c               |   1 +
 drivers/usb/storage/debug.h                 |   2 -
 drivers/usb/storage/ene_ub6250.c            |   1 +
 drivers/usb/storage/freecom.c               |   1 +
 drivers/usb/storage/isd200.c                |   1 +
 drivers/usb/storage/jumpshot.c              |   1 +
 drivers/usb/storage/karma.c                 |   1 +
 drivers/usb/storage/onetouch.c              |   1 +
 drivers/usb/storage/realtek_cr.c            |   1 +
 drivers/usb/storage/scsiglue.c              |   2 +-
 drivers/usb/storage/sddr09.c                |   1 +
 drivers/usb/storage/sddr55.c                |   1 +
 drivers/usb/storage/shuttle_usbat.c         |   1 +
 drivers/usb/storage/uas.c                   |   1 +
 drivers/watchdog/armada_37xx_wdt.c          |   1 +
 drivers/watchdog/asm9260_wdt.c              |   1 +
 drivers/watchdog/aspeed_wdt.c               |   1 +
 drivers/watchdog/at91sam9_wdt.c             |   1 +
 drivers/watchdog/atlas7_wdt.c               |   1 +
 drivers/watchdog/bcm2835_wdt.c              |   1 +
 drivers/watchdog/bcm47xx_wdt.c              |   1 +
 drivers/watchdog/bcm7038_wdt.c              |   1 +
 drivers/watchdog/bcm_kona_wdt.c             |   1 +
 drivers/watchdog/bd70528_wdt.c              |   1 +
 drivers/watchdog/cadence_wdt.c              |   1 +
 drivers/watchdog/da9052_wdt.c               |   1 +
 drivers/watchdog/da9055_wdt.c               |   1 +
 drivers/watchdog/da9062_wdt.c               |   1 +
 drivers/watchdog/da9063_wdt.c               |   1 +
 drivers/watchdog/davinci_wdt.c              |   1 +
 drivers/watchdog/digicolor_wdt.c            |   1 +
 drivers/watchdog/dw_wdt.c                   |   1 +
 drivers/watchdog/ebc-c384_wdt.c             |   1 +
 drivers/watchdog/ep93xx_wdt.c               |   1 +
 drivers/watchdog/ftwdt010_wdt.c             |   1 +
 drivers/watchdog/gpio_wdt.c                 |   1 +
 drivers/watchdog/hpwdt.c                    |   1 +
 drivers/watchdog/i6300esb.c                 |   1 +
 drivers/watchdog/iTCO_wdt.c                 |   1 +
 drivers/watchdog/ie6xx_wdt.c                |   1 +
 drivers/watchdog/imgpdc_wdt.c               |   1 +
 drivers/watchdog/imx2_wdt.c                 |   1 +
 drivers/watchdog/intel-mid_wdt.c            |   1 +
 drivers/watchdog/it87_wdt.c                 |   1 +
 drivers/watchdog/kempld_wdt.c               |   1 +
 drivers/watchdog/lpc18xx_wdt.c              |   1 +
 drivers/watchdog/max63xx_wdt.c              |   1 +
 drivers/watchdog/max77620_wdt.c             |   1 +
 drivers/watchdog/mei_wdt.c                  |   1 +
 drivers/watchdog/mena21_wdt.c               |   1 +
 drivers/watchdog/menf21bmc_wdt.c            |   1 +
 drivers/watchdog/menz69_wdt.c               |   1 +
 drivers/watchdog/meson_gxbb_wdt.c           |   1 +
 drivers/watchdog/meson_wdt.c                |   1 +
 drivers/watchdog/mlx_wdt.c                  |   1 +
 drivers/watchdog/moxart_wdt.c               |   1 +
 drivers/watchdog/mtk_wdt.c                  |   1 +
 drivers/watchdog/ni903x_wdt.c               |   1 +
 drivers/watchdog/nic7018_wdt.c              |   1 +
 drivers/watchdog/npcm_wdt.c                 |   1 +
 drivers/watchdog/of_xilinx_wdt.c            |   1 +
 drivers/watchdog/omap_wdt.c                 |   1 +
 drivers/watchdog/pm8916_wdt.c               |   1 +
 drivers/watchdog/qcom-wdt.c                 |   1 +
 drivers/watchdog/rave-sp-wdt.c              |   1 +
 drivers/watchdog/renesas_wdt.c              |   1 +
 drivers/watchdog/retu_wdt.c                 |   1 +
 drivers/watchdog/rn5t618_wdt.c              |   1 +
 drivers/watchdog/rza_wdt.c                  |   1 +
 drivers/watchdog/s3c2410_wdt.c              |   1 +
 drivers/watchdog/sama5d4_wdt.c              |   1 +
 drivers/watchdog/sirfsoc_wdt.c              |   1 +
 drivers/watchdog/softdog.c                  |   1 +
 drivers/watchdog/sp5100_tco.c               |   1 +
 drivers/watchdog/sprd_wdt.c                 |   1 +
 drivers/watchdog/st_lpc_wdt.c               |   1 +
 drivers/watchdog/stmp3xxx_rtc_wdt.c         |   1 +
 drivers/watchdog/stpmic1_wdt.c              |   1 +
 drivers/watchdog/sunxi_wdt.c                |   1 +
 drivers/watchdog/tangox_wdt.c               |   1 +
 drivers/watchdog/tegra_wdt.c                |   1 +
 drivers/watchdog/tqmx86_wdt.c               |   1 +
 drivers/watchdog/ts4800_wdt.c               |   1 +
 drivers/watchdog/ts72xx_wdt.c               |   1 +
 drivers/watchdog/twl4030_wdt.c              |   1 +
 drivers/watchdog/uniphier_wdt.c             |   1 +
 drivers/watchdog/via_wdt.c                  |   1 +
 drivers/watchdog/w83627hf_wdt.c             |   1 +
 drivers/watchdog/watchdog_core.c            |  10 +-
 drivers/watchdog/wdat_wdt.c                 |   1 +
 drivers/watchdog/wm831x_wdt.c               |   1 +
 drivers/watchdog/wm8350_wdt.c               |   1 +
 drivers/watchdog/xen_wdt.c                  |   1 +
 drivers/watchdog/ziirave_wdt.c              |   1 +
 include/asm-generic/export.h                |  14 +-
 include/linux/export.h                      |  92 +++++++++++--
 include/linux/module.h                      |   2 +
 init/Kconfig                                |  13 ++
 kernel/module.c                             |  67 +++++++++-
 scripts/Makefile.modpost                    |   4 +-
 scripts/coccinelle/misc/add_namespace.cocci |  23 ++++
 scripts/mod/modpost.c                       | 137 ++++++++++++++++++--
 scripts/mod/modpost.h                       |   9 ++
 scripts/nsdeps                              |  56 ++++++++
 114 files changed, 504 insertions(+), 46 deletions(-)
 create mode 100644 scripts/coccinelle/misc/add_namespace.cocci
 create mode 100644 scripts/nsdeps

-- 
2.23.0.rc1.153.gdeed80330f-goog

