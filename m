Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A975B5A56
	for <lists+openbmc@lfdr.de>; Mon, 12 Sep 2022 14:44:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR5rX1S60z3bbQ
	for <lists+openbmc@lfdr.de>; Mon, 12 Sep 2022 22:44:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PUaKs0lZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=pkarthikeyan1509@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PUaKs0lZ;
	dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMD021f1hz2xrX;
	Tue,  6 Sep 2022 15:07:12 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id 78so9594447pgb.13;
        Mon, 05 Sep 2022 22:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:content-disposition:mime-version:message-id:subject:to
         :from:date:from:to:cc:subject:date;
        bh=2s5V0OSPV4c3Wob277hCZSosTMutmUFFm9eFJDWUu8k=;
        b=PUaKs0lZtIMiU3TMf4n7P4YG6zVaixwdK0lxWjWI5rcShF/PvSGP6LM3/GMI1tzILb
         ZVbvk21WIVunG71LtyO8v915o1PGjdR7N4VrCSu1lS2CQ3sSbRI2LVpRS0R6yyhZYHxr
         z09P1fGZQ9IFKRx/NNGWj0d6r2CsaEC7DWUrpT5nfHRguEXptMgdAs4Hi7eAtQbEhQyV
         cF4uQn6lvs9lUQqvoxc/9jKN6XtJ8lZrU24ww5TiBlPtd61YQlm4fhMlsRrcGkC7Tf4Y
         fc1/qOmhEowr/dCFIj0jdmSWIuurUWddtfRgSAB50yMcuVpgLrVDWd6uKg8ZbwOb9Z1m
         7DLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:content-disposition:mime-version:message-id:subject:to
         :from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=2s5V0OSPV4c3Wob277hCZSosTMutmUFFm9eFJDWUu8k=;
        b=CQw5aT001ituHoWf/HAZwek8eFek1tZoY6ihp9kXbKNNA7Bk4Y6Xq7/Tm+kXyUgqve
         VPxQqgZ/Ao4BoHlnCdmAYOy4ZOoemlLSXGI7qFzHGMNGf3j4QpwY2Eu5VkR1COlYq+ie
         BVP2onJrRBX+Myy8SlnI1ou+hH0wwmtQ7b8IxvjeSIi253QrAwxXvfZeOncMHubylPmB
         3gaYNfbx73Mfr8G6Xs1fU2DHZ/v55GFi4SbgTwn9cQ4FUaNJE6SHu9WyUlM1sOqfzlLE
         jnGwo1DXFlbo0F5knrKMsLCi6pv93I6ylxG+W2y9lO3TerwMe+aYKrpfDQ5ADcJ5rD8Q
         OggQ==
X-Gm-Message-State: ACgBeo2ok3/tb/NW7xm1/VdvXefjI699et3ygrFlmn/mubHHVQpU6Lln
	BGviAOVdXtyiVgB4uvTBoAw=
X-Google-Smtp-Source: AA6agR7ov8MpKvZvdt8mhftR6/1couiKhsu/FxmGcxp4j5xT/l5iSzKNHLkuusV1rJqifzgKdqPKfA==
X-Received: by 2002:a63:804a:0:b0:42b:8b81:72b8 with SMTP id j71-20020a63804a000000b0042b8b8172b8mr42100231pgd.218.1662440827872;
        Mon, 05 Sep 2022 22:07:07 -0700 (PDT)
Received: from hcl-ThinkPad-T495 ([2401:4900:1ce1:13f0:48c4:2ac5:ccad:657d])
        by smtp.gmail.com with ESMTPSA id m3-20020a170902f64300b0016c9e5f291bsm8586423plg.111.2022.09.05.22.07.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Sep 2022 22:07:07 -0700 (PDT)
Date: Tue, 6 Sep 2022 10:37:02 +0530
From: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH v1] Update for Facebook yosemite V2 BMC.
Message-ID: <20220906050702.GA10565@hcl-ThinkPad-T495>
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

