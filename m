Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2377545E0A
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 10:01:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKD1l56Vgz3bnn
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 18:01:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Xjy2JtYQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Xjy2JtYQ;
	dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKD1P1TSgz30D0
	for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 18:01:12 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id q12-20020a17090a304c00b001e2d4fb0eb4so1537886pjl.4
        for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 01:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rwuVgR5AtpCdwpBcVzIcNkuwqtCWAmQ6yFI87LG99Uk=;
        b=Xjy2JtYQijy80+yzlBKEf8j1Q8v6uYWrn2ocX0yk1D+y+ECaTviCx/Nu2yphz2KZeQ
         wj3FpAs+iPtRnL5/b33tAkPtCGl59uqWtCBlYwj/MSa14W0mlMqAN8+z5LOaCr7Fx5LN
         6SpYiTcwZ4yFrWJVqUyMTO6zj48KWLMii7AGfvbc6aNMLf/kkdHQHg5BSrePYP7KPDiv
         TLdi7m+5vZ4HKwOy0A7AY/TtoMh9ln5dxznOOfytVd2skGd34vMsdgRHDZhwQcsXA/Uh
         aoBRhVCtXBUEsHqnPva6s27bakfLDEPNi172S68ij4/Z6cbMSzuvuWQFS0gTRl8YZU8a
         7CnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=rwuVgR5AtpCdwpBcVzIcNkuwqtCWAmQ6yFI87LG99Uk=;
        b=iBTzYshypt7u2K9ET/BjGhmzyzMV1ogGHPjh72Q0DsqJGKern6vObj1SwXbmk4jAq0
         zjaAZq92fMatUiHkE9Y1zFDlDHENKyKwcaQgTXWoT2qWMkpyPWV8lJ+9Et3E0eF/3Q+p
         FKjyy9jDKgGEK6nVB2s0g2rGHGrtDFDDm124+NDD9DL4VQ+euZHRdloFo3vl74Tqhtsj
         HOfkS93+AYp1NUQQb0R1DMqe9K1fAxdkc0+VnCQPEB92ZmV9O0afY/fB6b86VYztrb88
         1+KkRsZRbvBVtaoZjPeG3fYJL8jJwwqv6zzpZCArnFzXMz53H7thrD0i9d39eE4tZGaO
         YqGg==
X-Gm-Message-State: AOAM530WBI6stprz8PeqqlJxrWl+tfLJ9STJVV6BWUulcpfaBQaJUTVa
	DQ3qaaSeWcRPTTg5QZrbe5Tzd8MwdwI=
X-Google-Smtp-Source: ABdhPJzuSvD/n3nEVtaUuywebOSauUc1u3DCgA/pnEk4tJj2WaCo3/BFl6UsI1OKkQvMzPdT8mc6Cw==
X-Received: by 2002:a17:90b:4a0a:b0:1e8:5078:b574 with SMTP id kk10-20020a17090b4a0a00b001e85078b574mr7451861pjb.149.1654848070182;
        Fri, 10 Jun 2022 01:01:10 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id k16-20020aa79d10000000b0050dc7628162sm18830661pfp.60.2022.06.10.01.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 01:01:09 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 0/4] Better NCSI support
Date: Fri, 10 Jun 2022 17:30:55 +0930
Message-Id: <20220610080059.2333501-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
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
Cc: BMC-SW@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This fixes the NCSI support so it can be configured in u-boot without
breaking non-ncsi systems.

With that working it turns on NCSI in all of the defconfigs.

Cédric Le Goater (1):
  net: phy: ncsi: Add phy_interface_is_ncsi() helper

Joel Stanley (3):
  phy: Only create NCSI PHY when it's present
  ftgmac100: Simplify NCSI detection
  config: aspeed: Enable NCSI support

 include/phy.h                            |  2 ++
 drivers/net/ftgmac100.c                  | 17 +++++------------
 drivers/net/phy/phy.c                    | 10 +++++++++-
 net/net.c                                |  2 +-
 configs/ast2600-pfr_defconfig            |  1 +
 configs/ast2600_openbmc_defconfig        |  1 +
 configs/evb-ast2400_defconfig            |  1 +
 configs/evb-ast2500-spl_defconfig        |  1 +
 configs/evb-ast2500_defconfig            |  1 +
 configs/evb-ast2600-cot_defconfig        |  1 +
 configs/evb-ast2600_defconfig            |  1 +
 configs/evb-ast2600a0-cot_defconfig      |  1 +
 configs/evb-ast2600a0-spl_defconfig      |  1 +
 configs/evb-ast2600a0_defconfig          |  1 +
 configs/evb-ast2600a1-cot_defconfig      |  1 +
 configs/evb-ast2600a1-ecc_defconfig      |  1 +
 configs/evb-ast2600a1-emmc-cot_defconfig |  1 +
 configs/evb-ast2600a1-emmc_defconfig     |  1 +
 configs/evb-ast2600a1-spl-ecc_defconfig  |  1 +
 configs/evb-ast2600a1-spl_defconfig      |  1 +
 configs/evb-ast2600a1_defconfig          |  1 +
 21 files changed, 34 insertions(+), 14 deletions(-)

-- 
2.35.1

