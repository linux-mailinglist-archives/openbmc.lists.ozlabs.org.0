Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C4222BC0A
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 04:36:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCYHY4qsczDqYM
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 12:36:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KxCcGmsX; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCY9K6QlxzDrgb
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jul 2020 12:31:17 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id d4so4384449pgk.4
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jul 2020 19:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oV89y7toCU1yWvhFU+lccXM1w+Xzm7tvpw6pP0k/IQ8=;
 b=KxCcGmsXG5Wh/3X/5rHtTYYybi5aRIWXzwcsnK6d9ylulh+I6vSBqjgK62g6aRdaaa
 j63zRi98XxbViedyOR1Ik/2Xcr0KeXKfbWjiwcvCc3TkjatxP+FUjoFQDa4dSnUYKdUM
 Yxw3V3UHkxVzqut83skEVzDln5LJHkNDBZj6ZlVBtI+v02zRoJjBmnt0Wjn5gvQi0/FG
 Vb7FPpw5hDgIPkjBY9YjpQCAemu5Zm74dF5Lpx3AkOohkPchPGNY+1KZSNwVmLwF7TFc
 Iun1eVnXDVS7biUec+FUOeYlU8Dx9PgzEzt5Sw/uh8Ami67mc79/p+R+g7hCgVmjLUCm
 u8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oV89y7toCU1yWvhFU+lccXM1w+Xzm7tvpw6pP0k/IQ8=;
 b=rTnCFu4seairsLbS8pNXfK3pMvwgLYY9lHpQb1xD826ch0O/INp6X88pA2ONDn8zyi
 udbqBNR77TMWo6mNur7a6ITHTHofQ2sRJrl5J5pK1JnedUQ4bc22tY+AZExscfnY9lzE
 /glwu2HHdY1N8nLj3RpInR14ot4wEuwpabBsBy6VUgMEj21fu+z/COmyKy0mI4PE5Z/J
 FYY3ZwYtQRcpNAt2cjV7LJBS3dUhRjFaOxWxKhK6d2C2klP5rgw0po1XhNwkugdGjXb/
 5mYVbfOMwBp5x2xVvgbuhVSpEUB0ttl9bXEAcSlufN271dfr5ehLWYqqpVg3hy52ZoQo
 CVXw==
X-Gm-Message-State: AOAM533kwPEQ11gpU0kmpU0V4Xp1mJUpgjOPvGrnOyJ0ttX+ImC9XjAY
 IuyeizqSvVD16dc/Bh6Rsv4KQsl/b/U=
X-Google-Smtp-Source: ABdhPJyJYt1ziLBnf+Xnf24UFFyCJjw7jCWFWUkdB5j8TBfED7Cnp5P2zXIKz9iSg8w+SIvNYMHgRg==
X-Received: by 2002:a63:6d48:: with SMTP id i69mr6752893pgc.354.1595557874918; 
 Thu, 23 Jul 2020 19:31:14 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id w9sm3880239pfq.178.2020.07.23.19.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 19:31:13 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.4 3/3] ARM: dts: aspeed: tacoma: Add CFAM reset
 GPIO
Date: Fri, 24 Jul 2020 12:00:36 +0930
Message-Id: <20200724023036.354310-4-joel@jms.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200724023036.354310-1-joel@jms.id.au>
References: <20200724023036.354310-1-joel@jms.id.au>
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

The GPIO on Q0 is used for resetting the CFAM of the processor that the
ASPEED master is connected to.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index 96a45014b7e5..59f30c6c22d1 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -185,6 +185,7 @@
 
 	fsi-routing-gpios = <&gpio0 ASPEED_GPIO(Q, 7) GPIO_ACTIVE_HIGH>;
 	fsi-mux-gpios = <&gpio0 ASPEED_GPIO(B, 0) GPIO_ACTIVE_HIGH>;
+	cfam-reset-gpios = <&gpio0 ASPEED_GPIO(Q, 0) GPIO_ACTIVE_LOW>;
 
 	cfam@0,0 {
 		reg = <0 0>;
-- 
2.27.0

