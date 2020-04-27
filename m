Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 955431B966B
	for <lists+openbmc@lfdr.de>; Mon, 27 Apr 2020 07:11:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499Xty5GTfzDqQC
	for <lists+openbmc@lfdr.de>; Mon, 27 Apr 2020 15:11:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rFGHp4Mz; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499Xs22QgjzDqQD
 for <openbmc@lists.ozlabs.org>; Mon, 27 Apr 2020 15:09:55 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id t7so616447plr.0
 for <openbmc@lists.ozlabs.org>; Sun, 26 Apr 2020 22:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cawcaRW6zUV0Qezqw6R49bCicmEyD7I4NFdRaKwMYHU=;
 b=rFGHp4MzaGtjvA9eWKVDAnOPrPiizMqW93Zh+svciH17+JnAvTL/lIGzx6sj84nJ/z
 2J+xK8jHcamxmFBK1EV90caPdJrI6ZZ6toHRvpv3BrJK4paqtBVVD9QdQiLEXy9EKSoh
 ur6zNZMV6cGkqtQlXs/v8hmZeuBMq0AegxVXNGy2U67NvurI+rOm3i3Qj3GfmV+BkQLN
 42SBYrpmDs+xt92DgLlK3MnZDGCp6TXGW69TW+PQWs5abcPz+dip20VmUXAUTYepOclg
 3A0JlwoToCZKPFi710BRcC93g2YcaiVmBTbAgMPD8fr05l6qfwun7GetFG64Ggia7Zlq
 GfGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=cawcaRW6zUV0Qezqw6R49bCicmEyD7I4NFdRaKwMYHU=;
 b=pDP8st7qhAcuX2l14nuJD8onw4w4ENhP2fwYT2569RE1qdALgNWl7PxQAyrTWC6LqB
 ZYZzIOC4aWtT9LM3QIBv0Ayf41/inznSwoQEoWbsWbYpa7KHTzbjNsjsK7P/KeAUnSUB
 vyMYWdJHVoz5IRg+Oq9mIyqLhGNeZ8p2CNs1D1hC2eQdW/b8tL+WYKaO96iK9t/hjnll
 nUpwRPvXkUDeZ0L//64V8MbL4eREUeb0Hzq9ltAjDN8gQj1gU0TT9Lp+JUMu5T69hTey
 lCYk3VQNUHFQiL/45ibZiA7I0xoIwBND5sKfijtlfEYaTtQIxd8Nj1u9cc0tG6i+EfFP
 sMDQ==
X-Gm-Message-State: AGi0PuY3+n7hzzkYmPHblQHcfBj547XQthFcqppCTlSBCY4DxMY3uSgr
 KS4om1XxhByo17SybcLFnL4UNPJcae0=
X-Google-Smtp-Source: APiQypIN97JdYlBxUojYg2fURb30BuZIHb+MsKyGtSmaVq1t4XQRZf8jsDSZotgeMIZFJ85UX95LpQ==
X-Received: by 2002:a17:90a:eac5:: with SMTP id
 ev5mr21404923pjb.173.1587964192119; 
 Sun, 26 Apr 2020 22:09:52 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id c2sm11395639pfp.118.2020.04.26.22.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2020 22:09:51 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 0/2] aspeed: DTS specified m-pll
Date: Mon, 27 Apr 2020 14:39:42 +0930
Message-Id: <20200427050944.2177237-1-joel@jms.id.au>
X-Mailer: git-send-email 2.26.1
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

Joel Stanley (2):
  ast2600: ram: Enable device tree based DDR config
  ast2600: tacoma: Run DDR at 1333

 arch/arm/dts/ast2600-tacoma.dts    |  2 +-
 drivers/ram/aspeed/Kconfig         |  7 +++++
 drivers/ram/aspeed/sdram_ast2600.c | 47 ++++++++++++++++++++++++------
 3 files changed, 46 insertions(+), 10 deletions(-)

-- 
2.26.1

