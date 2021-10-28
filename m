Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B3943E368
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 16:20:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg74g55L6z2ywf
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 01:20:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MZZW77BM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::335;
 helo=mail-wm1-x335.google.com; envelope-from=lukas.bulwahn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=MZZW77BM; dkim-atps=neutral
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg74G2jJcz2yY7
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 01:19:57 +1100 (AEDT)
Received: by mail-wm1-x335.google.com with SMTP id 192so4416995wme.3
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 07:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w9dCLGXOlRDJmVPN1HJBPCtrX5Y3dq1CeosXfwTmTIE=;
 b=MZZW77BM7jF65T9itFpM6n7U5dNOUA1+IJ2d8FO0oyqoTXflUpdwut867AadkBdvOf
 MdACiu8DDmGMF+ElH9PG5i8Vech57XSQftI0CPVl/H/Lw/Vm1dOXi+WEMpTh9jUyQiki
 4IGL04gs8riaamW4lCTxL2bq0QDsXJGQKdGw7lKFv4+GZlRw4q7G23uXPqU+6333/Jht
 FAL+5sTiLuJhnGZUX+lOTCNtQeJwivdpuzCv9KhQTKrVTHEgBBCUCzuAh7vcvujktWcX
 FFZ08vnnBqfrGGnGqgBZTDNN5sWGI3Xa1pIT5tRBF+AQbPK+usl8k/O8qrjp212PEG6D
 MhLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w9dCLGXOlRDJmVPN1HJBPCtrX5Y3dq1CeosXfwTmTIE=;
 b=gAe6Pyzy1i/Ul+Bd372NHKdr7q8qsryv1YKUMslmRTdDFAaLvXOt3Fpb0X+ldzSl7n
 s7VEgEaXnOw7WZkq+bNMVmlcgoTEL63cklNNsblWrAe3iFjRutJAmaoGwkBe+pPwIy2z
 MVqybvnG3t/5ZdxxS+H3D879Gb6LJ5CUW+039pIVNhhsw61et6h7eZBnOWFjtrU1rf7I
 zb8Ecc0iE9ISyMaj4sphollLboJB+uWjNqOTIIQyKFlEQnevrH7Zm5Y0+b021bOvMQ7S
 2VGEhKT5U+hgfu2JwU23hWyIoIs+bl+K/yGCvEbyHd/P+YcW5iRkfmH4myyFR/QSFpKt
 91Ew==
X-Gm-Message-State: AOAM530U8Aw+xM3XeGPD3xbiE2f7heVXX84jH/8byjpAWA3H2GXur2ZL
 Hv9nej/SFjkikfgvTa8LhF0=
X-Google-Smtp-Source: ABdhPJzg6/fblA82QiNOpf6te3qmuIz0aMLwxzyCLkqjiM6kfgiHZAu7QfphRHWjzrEyKfVdfQhyfQ==
X-Received: by 2002:a05:600c:2288:: with SMTP id
 8mr13025376wmf.40.1635430790515; 
 Thu, 28 Oct 2021 07:19:50 -0700 (PDT)
Received: from localhost.localdomain (i5C74E249.versanet.de. [92.116.226.73])
 by smtp.gmail.com with ESMTPSA id
 m2sm6284546wml.15.2021.10.28.07.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 07:19:50 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sekhar Nori <nsekhar@ti.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
Subject: [PATCH 00/13] Kconfig symbol clean-up on ./arch/arm{64}
Date: Thu, 28 Oct 2021 16:19:25 +0200
Message-Id: <20211028141938.3530-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.26.2
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear arm maintainers,

The script ./scripts/checkkconfigsymbols.py warns on invalid references to
Kconfig symbols (often: minor typos, name confusions or outdated references).

This is a patch series addressing the issues reported by
./scripts/checkkconfigsymbols.py in the ./arch/arm{64}/ directories, quickly
filtered down with:

  ./scripts/checkkconfigsymbols.py | grep "arch/arm" -B 1 -A 2

without considering kernel configs, i.e., after removing arch/arm{64}/configs
in the working tree. It addresses some issues I considered to be "true positives";
so, issues that should be addressed and cleaned up.

The patches on updating the comments might arguably be considered of lower value
by itself, but as the other patches show, checkkconfigsymbols does detect some
relevant issues in the kernel tree otherwise being unnoticed.
So, it might be worth to clean up the kernel tree to have checkkconfigsymbols
produce a rather short list of issues and then continuously follow and check
what checkkconfigsymbols reports.

Some work from checkkconfigsymbols on arch/arm/ is deferred; the other remaining
issues that checkkconfigsymbols reports are (as far as I understand it now)
"false positives", i.e., the tool misinterprets the actual content) or
"intentional", e.g., they refer to historic configs for the purpose of
documentation (e.g., in changelogs) or are in various kernel configs that are
not continuously updated to match the current set of kernel configs. You can
see below a grouped list of remaining reports.

Each patch in this series can be discussed and applied individually if needed.
They are sent in one patch series, as they all orginate from the investigation
guided by the same tool and hence share similar topics and resolutions.

Please pick this series of minor clean-up patches on ./arch/arm{64}/.
It applies cleanly on next-20211027.

Best regards,

Lukas


Remaining reports from ./scripts/checkkconfigsymbols.py pointing to files in
./arch/arm{64}/ (excluding configs), grouped by the rationale why it is not
addressed in this patch series:


- Reference in historic comment:

  ARM_NR_BANKS
  Referencing files: arch/arm/mach-exynos/exynos.c

  CPU
  Referencing files: arch/arm/lib/backtrace.S, arch/arm/lib/csumpartialcopyuser.S,
    arch/arm/mach-rpc/ecard-loader.S, arch/arm/mach-rpc/io-acorn.S, arch/arm/nwfpe/fpmodule.h

  CPU_ARM92{0,2,5,6}_CPU_IDLE
  Referencing files: arch/arm/mm/proc-arm92{0,2,5,6}.S

  KVM_INDIRECT_VECTORS
  Referencing files: arch/arm64/kvm/hyp/nvhe/host.S


- Use of CONFIG_* environment variable beyond the definition in Kconfig scripts

  AS_DMB_ISHLD
  Referencing files: arch/arm64/include/asm/vdso/compat_barrier.h, arch/arm64/kernel/vdso32/Makefile

  CC_HAS_K_CONSTRAINT
  Referencing files: arch/arm64/Makefile, arch/arm64/include/asm/atomic_ll_sc.h

  SHELL
  Ignore CONFIG_SHELL. Default variable in Kbuild build system.


- Parsing Mistake (Incomplete parsing heuristics) by checkkconfigsymbols.py:

  ASC1, ASC2, SBC, UART
  Referencing files: arch/arm/Kconfig.debug


- Future work to send clean-up patches:

  IRDA{_MODULE}
  Referencing files: arch/arm/mach-pxa/balloon3.c, arch/arm/mach-pxa/palm27x.c,
    arch/arm/mach-pxa/palm27x.h, arch/arm/mach-pxa/palmtc.c, include/linux/atalk.h,
    include/linux/netdevice.h

  PXA_FICP{_MODULE}
  Referencing files: arch/arm/mach-pxa/spitz.c

  DEBUG_LL_SER3
  Referencing files: arch/arm/boot/compressed/head.S

  already discussed in 2014: https://lore.kernel.org/all/1400055127.31197.1.camel@x220/


Lukas Bulwahn (13):
  arm: debug: remove obsolete debug code for DEBUG_ZTE_ZX
  arm: debug: reuse the config DEBUG_OMAP2UART{1,2} for OMAP{3,4,5}
  arm: Kconfig.debug: drop reference to removed ARCH_MSM
  arm: drop an obsolete ifdef with the removed config PCI_HOST_ITE8152
  arm: davinci: remove reference to obsolete BLK_DEV_PALMCHIP_BK3710
  arm: ixp4xx: remove dead configs CPU_IXP43X and CPU_IXP46X
  arm: imx: remove dead left-over from i.MX{27,31,35} removal
  arm: imx: rename DEBUG_IMX21_IMX27_UART to DEBUG_IMX27_UART
  arm: milbeaut: remove select of non-existing PINCTRL_MILBEAUT
  arm: nomadik: drop selecting obsolete CLKSRC_NOMADIK_MTU_SCHED_CLOCK
  arm: npcm: drop selecting non-existing ARM_ERRATA_794072
  arm: socfpga: always select PL310_ERRATA_753970
  arm: pgtable: refer to intended CONFIG_ARM_LPAE in comment

 arch/arm/Kconfig.debug                    | 28 ++++++++++-------------
 arch/arm/include/debug/imx-uart.h         | 18 +++++++--------
 arch/arm/include/debug/pl01x.S            |  7 ------
 arch/arm/kernel/bios32.c                  |  2 --
 arch/arm/mach-davinci/board-dm644x-evm.c  |  3 +--
 arch/arm/mach-davinci/board-dm646x-evm.c  |  3 +--
 arch/arm/mach-davinci/board-neuros-osd2.c |  3 +--
 arch/arm/mach-imx/Kconfig                 | 12 ----------
 arch/arm/mach-imx/Makefile                |  2 --
 arch/arm/mach-ixp4xx/Kconfig              | 13 -----------
 arch/arm/mach-milbeaut/Kconfig            |  1 -
 arch/arm/mach-nomadik/Kconfig             |  1 -
 arch/arm/mach-npcm/Kconfig                |  1 -
 arch/arm/mach-socfpga/Kconfig             |  2 +-
 arch/arm/mm/pgd.c                         |  2 +-
 15 files changed, 26 insertions(+), 72 deletions(-)

-- 
2.26.2

