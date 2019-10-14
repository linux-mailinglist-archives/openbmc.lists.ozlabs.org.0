Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EC1D5C99
	for <lists+openbmc@lfdr.de>; Mon, 14 Oct 2019 09:47:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46s9cx2Z8fzDqZq
	for <lists+openbmc@lfdr.de>; Mon, 14 Oct 2019 18:47:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="o4jdNfZ7"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46s9c61HvPzDqW0
 for <openbmc@lists.ozlabs.org>; Mon, 14 Oct 2019 18:46:29 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id 23so9611176pgk.3
 for <openbmc@lists.ozlabs.org>; Mon, 14 Oct 2019 00:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/zvRQOTTu4GAPjtJafYyLE05FUoiFUP3YUw00TmTjHg=;
 b=o4jdNfZ7KMLK9d1Y43MtZYg+p+AvlioJMPjcjS5SFoLgH6nkr6/gzR8ZlzufJRI5J5
 UfjNPVMYs9u8DtW1ewirQJNbKWawTRq02MqrXIJD1Azn6UJDJCZFm1bPeXxzN+oSIGmk
 IDJITNSqKIvuHMXQdZdnotCHpDs0hmeppFxDjhWLcCIF+TJ7HOR3LDQ/pNVMFL/Ve1rG
 Hg+GBtCt5pgbDYB7dHP27s5A42pnJb6PRYunA9Ty5a4KKLfpk0DQ+Xi+WA6Kvz2T9uQn
 xTJpHPUpaFpkTCegeHNVS7gbPT5BRV/GXwSfKYSMj8pvggqXqt4mmQ0EkO5S79FHwEnZ
 IxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=/zvRQOTTu4GAPjtJafYyLE05FUoiFUP3YUw00TmTjHg=;
 b=h6NoJqvEz66DcBxX+tCqCG7BH5Cd0UwoOhCQ8ywbQz/Lo2x8er3DPODCntcQKM+uPE
 3BfisNL/QiMVGz1RU0gH8iNSwYGFihbjkQZvPLasvYgMSM+uSYKk1bunltvbKUihDHIq
 eYE34WBs+oatUBzzBQveEkBrXoHh3WgZXt4XFsn02FxuQk1h8XSZ5duJYTuBibJ23LQQ
 XSa9bZfGxI/ApRRCTmnFdV8k3ZjFXP3L96liJm3HF3wQ5ZDVWllepBIlfQBiKx4P4tjb
 eDsFI6vY3Ml12EEg6fAqP0GCTaA2ms3d45/mPz0n+32B7gr3vTvoXjKLsSOjrhBIJYQZ
 4Big==
X-Gm-Message-State: APjAAAU4SrwS56AvLdfgtv7RJbGZv1KLCyINa7hRssnhNy11XuDk8ryW
 cGVF1L0murL61ndsYbKdtf+2leKpHn4=
X-Google-Smtp-Source: APXvYqx0p9bBnifh9DczGa4l9taTp5K8QEhe82DOS9NbyRmtgVerEAU8VABv3R0LRFZkgmbjdXRBpw==
X-Received: by 2002:a17:90a:28a2:: with SMTP id
 f31mr34099836pjd.125.1571039186092; 
 Mon, 14 Oct 2019 00:46:26 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id z12sm16714146pfj.41.2019.10.14.00.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 00:46:25 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 0/2] Tacoma FSI GPIOs
Date: Mon, 14 Oct 2019 18:16:16 +1030
Message-Id: <20191014074618.15506-1-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This series adds support for configuring the GPIOs for enabling FSI on
Tacoma.

Joel Stanley (2):
  fsi: aspeed: Configure optional GPIOs
  ARM: dts: aspeed: tacoma: Add FSI mux and enable GPIOs

 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts |  3 +++
 drivers/fsi/fsi-master-aspeed.c             | 30 +++++++++++++++++++++
 2 files changed, 33 insertions(+)

-- 
2.23.0

