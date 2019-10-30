Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E38FDE9675
	for <lists+openbmc@lfdr.de>; Wed, 30 Oct 2019 07:39:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472zLv4gKNzF3jt
	for <lists+openbmc@lfdr.de>; Wed, 30 Oct 2019 17:39:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BJa2kOMS"; 
 dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472zCk4GRxzF3Wg
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 17:32:50 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id c8so793071pgb.2
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 23:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6VMN1IKFIx3jGF5YftqewoqP/mwOTbnG816XtZGc/+I=;
 b=BJa2kOMSkTWIGc8Q9ZwkmxukFTYwejOUgnuRN1etQuRVvP+A3sK809TwJp5a+j3j3t
 zodaD55iSaG2DmMfAVjS0imlgaViWfIjRYBtn1ulUwFsDZS8XvLBOZbnClPlAxA+hs+a
 bfNg0bZPBsDRa+ViU/B8VtCDc5gEfWN6EFIPpZ9e3YelasnJcD4Jlib31taFZ0toWvKV
 KNFZzvJ9PzpV9rPPSsOimH/nyGQNywjty+eY7EIXo6ucQTSx0lvMRYBa8RtNgbkO5sD7
 R9xfTo3eoLp90JGbQAt0yyet3i5QmXtHWnDR9h9eYa7HUzWTDkVTeYEas0fnCoZH6jbb
 4yLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6VMN1IKFIx3jGF5YftqewoqP/mwOTbnG816XtZGc/+I=;
 b=FOp5V9MbldaKtEQFYG/z3YyqhXv3HyXx3wWSjCAIAOJ9A9BTTEFk6vquoDYsLPYa1v
 54skajxhM4f0dfuxKPAsjNzV6p9YKPCF3DOaEITmEnAGxCu6XgqZBCyPEp4XZOmbqbJG
 YokUKf5H+aRcMeE6VISA0fruNAUHsFrlj68KAKXWn+pGxsq5Flf3kGO3XJ3ZORtThy+P
 4lM/OA64zmOMBhvCwL9NID0ZHTOYeKHzCqoM4mTuFg36dewBW4VkATcbqoju6GbbeYU6
 f6Nj/MyeJoG5t06+FWTzzgZEluq49xCkcLi36m5dosghTPNxrrSQ2S4i26pDQ4v9KTFE
 B4UQ==
X-Gm-Message-State: APjAAAUv3wggUBbOTWW2EFKAGnndlEFYtBCUGnen4H0gKeB6F3xTLXTL
 OOqnQKWGQPY/frhfHXHuwek=
X-Google-Smtp-Source: APXvYqxgY5phlRgfaIqm6k/UQ08/May4IvAwckUIYi7X/OU9yh6KmEiAr/xidXk128ivJ3JuYdZ9+w==
X-Received: by 2002:a63:ae02:: with SMTP id q2mr10223332pgf.210.1572417168080; 
 Tue, 29 Oct 2019 23:32:48 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id i102sm1028018pje.17.2019.10.29.23.32.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 23:32:47 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Jeremy Kerr <jk@ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH u-boot aspeed-dev-v2019.04 5/7] dts: ast2600-evb: Enable FSI
 masters
Date: Wed, 30 Oct 2019 17:02:23 +1030
Message-Id: <20191030063225.11319-6-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191030063225.11319-1-joel@jms.id.au>
References: <20191030063225.11319-1-joel@jms.id.au>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/dts/ast2600-evb.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/dts/ast2600-evb.dts b/arch/arm/dts/ast2600-evb.dts
index f8206c3ef0aa..1732424b0357 100644
--- a/arch/arm/dts/ast2600-evb.dts
+++ b/arch/arm/dts/ast2600-evb.dts
@@ -252,3 +252,11 @@
 	status = "okay";
 };
 #endif
+
+&fsim0 {
+	status = "okay";
+};
+
+&fsim1 {
+	status = "okay";
+};
-- 
2.23.0

