Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F333306878
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 01:17:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR1JZ4rWzzDr6D
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 11:17:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=phCPeNw7; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR1Fz4SqyzDqQ3
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 11:15:33 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id cq1so2627438pjb.4
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 16:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=joo05b0MJU6/FdKRC0O+I7O3H/Ns16BrGyR11RJG5dU=;
 b=phCPeNw70aCowu9SmnRCupe13m/oT/4p/pzPgetFtotOSc1vjC9hZNpK6DEqgHR7Ko
 Qzl0rgc9EXatcoVXk34J/tV6t/OZeMWcdZndJ4ibmRE2fEucDI086ho23F/f1ZZp68a6
 6RzD10KNWep+WcuDn9WE+Vle3tQtyxdA9WU4qdbzM2GYTCxkfXwvOaAr4GUbfwuuWxbL
 Oc5Sj3D2wL8vOYMTNW6RoyKFaSctJLUQ/FJBWYI7ieZwIwPnY7qzQmu6jrWc4xpli+h+
 VGOVs+uuPxfSEUTcaIuaEvcN92ipp/IbtgQmguVoVqlJfAmSUQHdlXWvzvySuJW4imda
 QfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=joo05b0MJU6/FdKRC0O+I7O3H/Ns16BrGyR11RJG5dU=;
 b=rksonX649dMWAByoedy62y+ISXsUtBR23bKK8fIDBYXqmqHxjUO98Xmv0hRL+jAW1T
 U/pCXz3N1XYbiZZkdFXBHIpqZf00WryU101NAZash6glWQ5IIWPjhlfr0DoyVYPnScpm
 QrI4nQluwqryR+6XwsT8XXDcV8yRhhkwjWs5HSl/BsXfwMZVz32PiqCXylx3Inzu9+zo
 3q9GJa+ZlJngihOT56GtpRZrrLQFZnQv9EQPkB+zARnVNIO6k0e/9yYxcZ8DYCbgA0ga
 dAFxVfA0lJwpkhxLjCY7bgLVE0CruDa7jRAnF6LP0p++iBnrC8sTCd7+jXaayQFVLVht
 wkFg==
X-Gm-Message-State: AOAM533G/KFoe3QtNLJJGcvJt6yJL+5TdOMnC1pze6QCw93u7CRlTFoA
 qY/M9c6JpTlgPQmNlqfyZOM=
X-Google-Smtp-Source: ABdhPJwECiTEV4fAFoqxFg4+eIQfG15lu2niOQY0oGuYyzVQRGOOP2sUd1sbJp5AVXGtXqCWGioKiA==
X-Received: by 2002:a17:902:ba88:b029:df:fa69:1351 with SMTP id
 k8-20020a170902ba88b02900dffa691351mr7657875pls.74.1611792929491; 
 Wed, 27 Jan 2021 16:15:29 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id x19sm3529239pff.192.2021.01.27.16.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 16:15:28 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
 Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v3 0/4] FIT verification
Date: Thu, 28 Jan 2021 10:45:16 +1030
Message-Id: <20210128001521.266883-1-joel@jms.id.au>
X-Mailer: git-send-email 2.29.2
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

As part of our effort to enable secure boot in openbmc, this turns on
FIT verification in the SPL and u-boot.

It adjusts the SRAM layout to accommodate the extra code size, moving
the heap to the non-parity checked 24KB of SRAM.

It also modifies the way the SPL is built, including disabling features.

v3 Reorders the patches to put the size reduction changes first, and
then enables signature verification to ensure the build can be bisected.

The ymodem disable patch is dropped, as we fit cleanly under the 64KB
boundary with the feature enabled.

The general cleanup patch is dropped, except for the DOS_PARTITION
change which was added to the SPL cleanup patch. These cleanups will be
posted separately at a later date.

           Size   Delta
 HEAD     44054
 patch 1  43442    -612
 patch 2  42337   -1105
 patch 3  42337       0
 patch 4  63378  +21041

Joel Stanley (4):
  ast2600: Allow selection of SPL boot devices
  config: ast2600: Reduce SPL image size
  ast2600: Modify SPL SRAM layout
  config: ast2600: Enable FIT signature verification

 arch/arm/mach-aspeed/ast2600/Kconfig       | 12 ++++++++++++
 arch/arm/mach-aspeed/ast2600/spl_boot.c    |  9 +++++++++
 configs/ast2600_openbmc_spl_emmc_defconfig |  9 ++++++++-
 include/configs/evb_ast2600a1_spl.h        |  4 ++--
 4 files changed, 31 insertions(+), 3 deletions(-)

-- 
2.29.2

