Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB45577E08
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 10:56:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmbR33GBMz3c69
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 18:55:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=l6z2Yq5H;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=l6z2Yq5H;
	dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmbQd6p3bz2xKw
	for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 18:55:37 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id z1so8432658plb.1
        for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 01:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P/CnAcVGR6QgeBzxsMF+OJyQWoQLNSbauK86SVVwQfw=;
        b=l6z2Yq5H5TjhuGYJxDFkKP2c0UxXs9yZ8WZoqCuZ5aBc3RKoFry8JIpY63WpIUz51t
         kVGUwvIs+Wl0GtlfmH/taNA3jYnqJ2Au/c13kI/KABxQDWG65pY0jKIP8WVzXOIl09MV
         5Dlggy8ksO0FH39cIeHjlHr3ecGw2PC46UU0mSYs4uRjp8FfpgzOndMnSUhZmLM5nRVn
         w0qWVcTarybapiQwnPVmJ0X3qJtERN+iAUEqYEqMZMtgnEWFXqkLns1+70dY4ed3LFYs
         b/NUNi0HQZvYQhCzP9DHDSgm3Azm396KKf1gxjo5TuxjADjhwwn2OxeFBkaFjXHDzP8T
         ZiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=P/CnAcVGR6QgeBzxsMF+OJyQWoQLNSbauK86SVVwQfw=;
        b=f6VMEJDrEksxsmuiRNyc58nhnQeGpQxsJRHmDgB30HCHpO+5PjWD47QqD9OnBC4G1I
         v5gzD2WBhMaCMVbKdxZajd30YHK4pDgHAFbNKHWvs+OwJbNN2DRg4QBt8zuJ4/z3dNT/
         O6hnwJRbXyak739M9raJrZDBHHd2u0GSDumYO8QKiOdtTUHU+EKwufXj58a2rsM+gxOr
         a8hhtfhwX6aGac2EUXmr443+FR6B67YFe5+iuYxKdbFTvHC/d4aVzc2RCvpH3KAQxhPM
         TtY26cUK0+eTDrMwtH/QR1hSxXFXocSAQx9TEui0FeVr0rjaog+e7mAfW1hr09/TKe9D
         2gYA==
X-Gm-Message-State: AJIora9HaUUlYK/VLkKU5kh0j2GuyJ/yudsjTITP8FbiQ+D2TVsS8hk3
	U4UkuOuAEbkEW/w51F/DITn7Hr2pPT8=
X-Google-Smtp-Source: AGRyM1tULBuZdUzEDHXKFpqRHOkSKGUSmyPekqs0cYqITbVGh7rXKCC8k2FImA4/f23X1E2v0uu+BQ==
X-Received: by 2002:a17:902:d642:b0:16b:d5b7:1117 with SMTP id y2-20020a170902d64200b0016bd5b71117mr26132223plh.167.1658134533708;
        Mon, 18 Jul 2022 01:55:33 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id r11-20020a170903410b00b0016c5306917fsm8750575pld.53.2022.07.18.01.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 01:55:32 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 0/2] I2C Fixes
Date: Mon, 18 Jul 2022 18:25:21 +0930
Message-Id: <20220718085523.1140566-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
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
Cc: Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This series restores the "old" mode I2C driver for the AST2600. The new
mode driver can still be enabled if desired.

This series applies to the v0.4.11 SDK tree.

Enabling the new mode driver in u-boot will break operation under Linux,
where the new driver is not yet supported. Jamin has a series on the
list that needs review before it can be merged:

 https://lore.kernel.org/linux-i2c/20210617094424.27123-1-jamin_lin@aspeedtech.com/

Qemu 7.1 supports the new mode, so I encourage anyone who wishes to use
the new mode under Linux to help review.

Joel Stanley (2):
  ARM: dts: ast2600: Undo I2C hacks
  i2c/aspeed: Use new mode only when driver is enabled

 drivers/i2c/aspeed_i2c_global.c |  3 ++-
 drivers/i2c/ast2600_i2c.c       |  2 +-
 arch/arm/dts/ast2600.dtsi       | 32 ++++++++++++++++----------------
 3 files changed, 19 insertions(+), 18 deletions(-)

-- 
2.35.1

