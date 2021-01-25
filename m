Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 461AC302185
	for <lists+openbmc@lfdr.de>; Mon, 25 Jan 2021 05:59:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPHjJ3m1RzDqs3
	for <lists+openbmc@lfdr.de>; Mon, 25 Jan 2021 15:59:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BiHjk3xI; dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPHhQ5p06zDqk7
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jan 2021 15:59:00 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id t25so179618pga.2
 for <openbmc@lists.ozlabs.org>; Sun, 24 Jan 2021 20:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sqHvJqu5LnqcHuPsGtlguTFPjuoyG+LRJktX9kCOZc4=;
 b=BiHjk3xIPmkTzngnf5VgNYRDy6qCbs8R7HtHM0OK17CChFEvngKdJPEZHEp0h/gdRy
 PA4DohN9FFDMLAGSgrRORAkgh3HqcJBzAVkE2E7KSrDcoQLFYdnP/t0JsKPMy7AgsnQ5
 uhFupy1/N9CIiL9fH/6OoBNJOD8vv1LQQDarkgLruamhVT7YPSEZ8vbpVsBRBKX2lQqy
 Zaa1r5Cxx85DGVOAR07C6hudMuGyAjyC9NTfuZTcLFiW+CquNx5NSZi2RYsXeYAhPfRs
 bcpwpP8Y9vejsuPreyGBe2s8q48vSPB2iG+rYn2p74b0Q/v8CKs3mX/+hdfVs3W3RP8m
 FNkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=sqHvJqu5LnqcHuPsGtlguTFPjuoyG+LRJktX9kCOZc4=;
 b=mBvmTQaemYnW89ib8/JLn0W/qQQahPY399QbcQxTZr1H0Z1gN6CZemzs2EuhecCQHv
 Bn6Fel6C1rTqrTgbs1qP9NmWfGPL3sC2fRPKQBBYWXqI8AjY/xZZPSG+XsBXxxoHyrFC
 wqgF3vB5uCNdC0wDwZzvbiltA4g1cm/Z2c4hRp59yDu5ZhBbSPMsI1iN9thrLMAmPBuq
 3TZicgsZLMDRalZQRMz+Exg0vIh14sfekmAW2i5pYzy0fQyAxzLL7hEchWImCdkiDeum
 imRg2U5YzD3KbFm88+B9OMb6BcQygVbrqDrEFivq/RKv6Q7cEAKJW3mDXL6x47r7ek6A
 k4jg==
X-Gm-Message-State: AOAM530Bl93HvO/etOQRJjCZWOyM1Mz27wIk0dRJuaNlCjTQk+YTvGdA
 tyYL8I13pRJ/RUlOp1CvOixoH9X03gY=
X-Google-Smtp-Source: ABdhPJzBO5YTVEBv5e6aDyc+X38bv3/XfRYVTu4z2t3tX6AaoE1mMPnXZx4/HT5jVO2rQ8UNijhFiw==
X-Received: by 2002:a63:5fcf:: with SMTP id t198mr2058726pgb.226.1611550736344; 
 Sun, 24 Jan 2021 20:58:56 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id gx21sm17525048pjb.31.2021.01.24.20.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 20:58:55 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 0/2] FIT verification
Date: Mon, 25 Jan 2021 15:28:44 +1030
Message-Id: <20210125045846.448399-1-joel@jms.id.au>
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

Joel Stanley (2):
  ast2600: Modify SPL SRAM layout
  config: ast2600: Enable FIT signature verification

 configs/ast2600_openbmc_spl_emmc_defconfig | 3 +++
 include/configs/evb_ast2600a1_spl.h        | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.29.2

