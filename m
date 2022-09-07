Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3365B5A65
	for <lists+openbmc@lfdr.de>; Mon, 12 Sep 2022 14:46:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR5tc4qggz30B1
	for <lists+openbmc@lfdr.de>; Mon, 12 Sep 2022 22:46:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UkhX3bpF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=pkarthikeyan1509@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UkhX3bpF;
	dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MN1y52KqYz2yZ8;
	Wed,  7 Sep 2022 22:38:19 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id q9so13441987pgq.6;
        Wed, 07 Sep 2022 05:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:content-disposition:mime-version:message-id:subject:to
         :from:date:from:to:cc:subject:date;
        bh=8cuwNYIM2dG7qV14HGILvNfaTFOpaJjLv1WCC2bShi8=;
        b=UkhX3bpFkQrjMW+BsNFr1MJu7SAmDhU0caxX+kK4YCJkjBPmqM9WDLQZgpzoPX4CiB
         oZPp868wFyz6ukxUb8HqSYMbWyHQjLwc4SzKJtrTLIAXHMIeAjXi7IN3wZRQcIqmvEFD
         SF7B5MQ7r/aoenPzG91VDTBpW86c7dg2oxQBGLHbTQGnLjTY8IMg0djV1++EJwWaFe4+
         DsXPsXZSaJJhc6JbcgR2cqbQwst5l9kP14WJlTRfRb5XKdr+tzzYl5AGKH+FRIO0oh1k
         eWFRy+XWGR14SD6quBdhJMbR0msPoinGowtKDnuOB9TQG5Hhx+d0kOO4syhP1Fv7viVG
         fnTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:content-disposition:mime-version:message-id:subject:to
         :from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=8cuwNYIM2dG7qV14HGILvNfaTFOpaJjLv1WCC2bShi8=;
        b=tMMM0aOWnV5MAR3BLeIHmJweFxhtuYxbi6rkIk9HMyE/tK70CaY8g0YUU9aScqgdcn
         L6qLHcZQ85kzrhxGGrwy7JaGeTD3BVtdZ3RraF1t9z4fLPFTJh/4Bh/mwlKkCiGymF2r
         uYVpgHjBjlscvvfkshtGVZaPBWdMQ8+LhjJ7ffdCBm+Hm6TTDXRt1POyo/vTzZI5Yw95
         oH4dX5H+k2ybSu6FO97StQkBwwmgUNlBSy+FbRgUr5mkhaNHHdNS1XFpESPgg0jqVjf8
         rarm3wKig3N+3RNCl19QegA+NhYUjAKzm41NfgFfkZM9Ay/ZXj5YQbp/T1+G/tXPCkMy
         DYdg==
X-Gm-Message-State: ACgBeo3pJmgMM5tK7ruZ28ItIyNi0uGpMR9JvLP4Ra2vlLlmWNevSZ87
	yyzho5Om+0DVh9o8+vz7yp4=
X-Google-Smtp-Source: AA6agR5V4+MCEuwU9j7UzU+tBSQs2nsdqQxak8nCNwdUh9g82yM2EIQhKa0rCZSTmGaM0mYVjVUrZQ==
X-Received: by 2002:a63:a501:0:b0:434:ff77:1fda with SMTP id n1-20020a63a501000000b00434ff771fdamr1114702pgf.310.1662554296397;
        Wed, 07 Sep 2022 05:38:16 -0700 (PDT)
Received: from hcl-ThinkPad-T495 ([2401:4900:1ce1:13f0:48c4:2ac5:ccad:657d])
        by smtp.gmail.com with ESMTPSA id jf15-20020a170903268f00b00176ca533ea0sm4476231plb.90.2022.09.07.05.38.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Sep 2022 05:38:16 -0700 (PDT)
Date: Wed, 7 Sep 2022 18:08:10 +0530
From: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH v2] ARM: dts: aspeed: yosemitev2: Enable i2c13 controller
Message-ID: <20220907123810.GA27621@hcl-ThinkPad-T495>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Mon, 12 Sep 2022 22:41:37 +1000
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

---
--- v2-Updated the title
---

---
--- v1 - Initial draft.
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

