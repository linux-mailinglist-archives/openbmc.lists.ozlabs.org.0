Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2987C5E75D5
	for <lists+openbmc@lfdr.de>; Fri, 23 Sep 2022 10:31:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYljb0WF5z3c8C
	for <lists+openbmc@lfdr.de>; Fri, 23 Sep 2022 18:31:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Cdlu9ugb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=pkarthikeyan1509@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Cdlu9ugb;
	dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXTPz2kWPz3bdg;
	Wed, 21 Sep 2022 16:43:18 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id t190so4976169pgd.9;
        Tue, 20 Sep 2022 23:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:content-disposition:mime-version:message-id:subject:to
         :from:date:from:to:cc:subject:date;
        bh=4OoemoqY03kwE/AES+O6nYI9GibmetWZKgTywgqbXVk=;
        b=Cdlu9ugblpLjxtMTv8T1E0QgdC92dLmJ9eALZY+V+j70X7VvVQ0h59gr7+k976fRmM
         t5HMxJbhR5kxqW9SYL0EQQrQjBMOuM/wFvm9WmQ5H0NSrGKQJNZY889998ILbRcdnR5U
         SsMqJAB8JPaE23G7J7uHcOeruUH5JdOzZQuRG+o2vgmPVJUJ4v1KvXLasPdtZVDlNPtE
         wjfGhEKc43K7nZajqD6AsyrLLxm3tw5XZBK5em/qj4e0zJLYPoZka2vVWlSut2UWO2mR
         RNHkBHmzwNJt+4nm2QM5SdFmDz2PGUesIE2f5NahLaDQr/NMSFkyc+JqV9q6feZlHup+
         qYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:content-disposition:mime-version:message-id:subject:to
         :from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=4OoemoqY03kwE/AES+O6nYI9GibmetWZKgTywgqbXVk=;
        b=LZbbsB5Sd0qi7OtnY//TmEz5dutgzb7rFkTjytbFTB6r9JO8PJKCsb+k/QiRBGyWno
         PbHVVjJ+VgTLDDVjVRWKfBZdoHakhoHYy6KR1Bxt1tFjba8rJzMcAeBdsSk58pSSm2vF
         Q/GBN6yJA586jg2f+g2BtaeTsmVFNSNtQMz0QJm5MGLMbVtGA/UlEV2YjFWMm1/CHozo
         4Tcdpp/6982UHcTDByW5jDCZc7ee5rRWMS0M9Cgpu87vT0yrUozEa0ocY8fflA4T+Ebm
         GVgCbUZe7eneULQTLbcPXwTlCJO7ZagrMwL28qnxFrgiRc8kS01H4pySDz6mXGqguaUX
         mr/A==
X-Gm-Message-State: ACrzQf3tusYgB6/LM3JpwvjnYFGfhSHhR2W83r4TKbDiw9JLxYID5VUd
	FeWxtLYRBG4oELAyCMZ1pbM=
X-Google-Smtp-Source: AMsMyM5GoiNadp9pZlmdf85gfN7sInYz4kz0i/l9s9SSP9mUaVvqWWPpOlwENy6IRXcjPmMG8qpYhQ==
X-Received: by 2002:a63:8a4a:0:b0:438:6a17:f0bb with SMTP id y71-20020a638a4a000000b004386a17f0bbmr22722052pgd.267.1663742595348;
        Tue, 20 Sep 2022 23:43:15 -0700 (PDT)
Received: from hcl-ThinkPad-T495 ([2401:4900:1ce2:b8f9:48c4:2ac5:ccad:657d])
        by smtp.gmail.com with ESMTPSA id jg11-20020a17090326cb00b001769ee307d8sm1117799plb.59.2022.09.20.23.43.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Sep 2022 23:43:14 -0700 (PDT)
Date: Wed, 21 Sep 2022 12:13:09 +0530
From: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v4] ARM: dts: aspeed: yosemit V2: Enable OCP debug card
Message-ID: <20220921064309.GA18932@hcl-ThinkPad-T495>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Fri, 23 Sep 2022 18:30:55 +1000
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
which improve the readability of the machine and makes
easier to debug the server.  and it will display the some
informations about the server like "system info",
"Critical sensors" and "critical sel".

---
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

