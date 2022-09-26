Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F3C5EB5B8
	for <lists+openbmc@lfdr.de>; Tue, 27 Sep 2022 01:25:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbzQW01Zbz3bfC
	for <lists+openbmc@lfdr.de>; Tue, 27 Sep 2022 09:25:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gV0TgiLv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=pkarthikeyan1509@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gV0TgiLv;
	dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mbj9662zFz2xtt;
	Mon, 26 Sep 2022 22:43:22 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id y11so6167731pjv.4;
        Mon, 26 Sep 2022 05:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:content-disposition:mime-version:message-id:subject:to
         :from:date:from:to:cc:subject:date;
        bh=2AabGUL0Br5YICw1JFuVvftFuTUQ/EAqwxrV1oNwEpg=;
        b=gV0TgiLvVN18Z7oqqL+K30h6ukAQLF3fLgo6VpUwIXswPgKS/dC1zLTpG4w+1dybyP
         5g+EUy4DNPdTupoLPMba/dadlLg6qHQ3JF0WQ0725/3miUrdENZxx8PKQJbMCauPYJHb
         KIyon3s24MK0fciq3al2cC10UM0OcRAEJ3U6Xlzq20V4vQdwOSXzQEd2LEB4dknmScs1
         WPjEZ2PBucah670hSc2FDMcnMWw5/FuZgi6FrBBL+FANhXsegYJO0XrAMsfpWMJNZEYD
         SsiaBhPDC22FGXxc8d2Bcs3GrLfLlEERPVMDfdadu4hOavk0zWe7S/+zZQAEd0z0SJL6
         TwoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:content-disposition:mime-version:message-id:subject:to
         :from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=2AabGUL0Br5YICw1JFuVvftFuTUQ/EAqwxrV1oNwEpg=;
        b=hyGh9dMuKBgN5rPFAqufMDXQJbJgWMhT1NySkq9NwQL5G/VQMQ8znJt86wK9wE4B4D
         lJiXZYA5/hz1MUt3j+Mz9ulAHBUOS41K5ylZasGFqxkrUIsiVHj6SO/VZN4Zfe8mDWp8
         I0/9/W7YF25ue+kl02XOruPz7xcK+F2rZcWnpKoOEVGGH1n+diFNGCKBzpCxIJ7cCkRy
         9pjAgr4I//fzQLQYnWbqy5EMh9qtSf3Mq4e/FOii3jlDerqG0wNuWHLqLM+HGpDoWpy7
         HtpyXA8oKSMs+qVruE72mGLA/QgQ9TDESYki0aZiAdq0/dSDx1bX8TNJlKsatqOgil5K
         M0ig==
X-Gm-Message-State: ACrzQf0NiIWD5JaoICUZl2zttrb+jBL274PbzM7NlpxmfTr3VqczH+xD
	I/SNGagOpVVIXkGQFoPb9DC6OJXKKkI=
X-Google-Smtp-Source: AMsMyM5RdeRGaIsVQucKXp8iHx60CYMSRbrZ3Y8OAN1jkEZLfeiKEvivTVNUW4YV7JdtqiHMDZMggg==
X-Received: by 2002:a17:903:240b:b0:178:a475:6644 with SMTP id e11-20020a170903240b00b00178a4756644mr22150458plo.96.1664196198668;
        Mon, 26 Sep 2022 05:43:18 -0700 (PDT)
Received: from hcl-ThinkPad-T495 ([2401:4900:1ce2:8789:cdbd:fcea:ad98:effa])
        by smtp.gmail.com with ESMTPSA id g8-20020a170902934800b00177f8f234cesm11021877plp.258.2022.09.26.05.43.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Sep 2022 05:43:17 -0700 (PDT)
Date: Mon, 26 Sep 2022 18:13:13 +0530
From: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH v5] ARM: dts: aspeed: Yosemite V2: Enable OCP debug card
Message-ID: <20220926124313.GA8400@hcl-ThinkPad-T495>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 27 Sep 2022 09:22:21 +1000
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

Added IPMB-13 channel for Debug Card communication.
which improves the readability of the machine and makes
it easier to debug the server and it will display some
pieces of information about the server like "system info",
"Critical sensors" and "critical sel".

---
--- v5- Updated commit message
--- v4- Resolved syntax error
--- v3- Updated the title and commit
--- v2- Updated the title
--- v1- Initial draft
---

Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
index 8864e9c312a8..84236df522dc 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
@@ -215,6 +215,17 @@
 	};
 };
 
+&i2c13 {
+	status = "okay";
+	// Debug Card
+	multi-master;
+	ipmb13@10 {
+		compatible = "ipmb-dev";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+		i2c-protocol;
+	};
+};
+
 &pwm_tacho {
 	status = "okay";
 	//FSC
-- 
2.17.1

