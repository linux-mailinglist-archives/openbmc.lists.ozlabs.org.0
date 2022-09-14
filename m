Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F9F5B9200
	for <lists+openbmc@lfdr.de>; Thu, 15 Sep 2022 03:07:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSfFX4fQ0z303m
	for <lists+openbmc@lfdr.de>; Thu, 15 Sep 2022 11:07:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ad0SES9Q;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=pkarthikeyan1509@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ad0SES9Q;
	dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSFxK2FClz2xbd;
	Wed, 14 Sep 2022 19:52:19 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id 9so3287789pfz.12;
        Wed, 14 Sep 2022 02:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:content-disposition:mime-version:message-id:subject:to
         :from:date:from:to:cc:subject:date;
        bh=7bbRGJ2JS/s/WCHseBjrCcrVfObmPjMEWiCrZVOXNHA=;
        b=ad0SES9QMv9oQTBQOhrORY0IQflgogJWDILvrSosXQZe3EzZVoPzAZ6axkmeVCj7wn
         LDtO8rlV+mVCYaG2DZDSBny5c6ESei9KEwMl7cT2co0qaU5nCKSVdph/EY0A3x8H0h8z
         hUZqtkaMZy+oWxbXfwY3UzhiqX/1R6TwWBzNOOkNcJcxte1lpLdgrQW10UtuyB9D1d/s
         QbNoGgP0Gbm9g4xqQPioM4TevBIdM3AgaPNd4xTKhnrZrYkiykIA/u//l4CJgNM7MqS8
         l1jdmAQKPXh+CLWlsTX9TqogW3dIVEty5nyFVUdCuHPiqa1AiFjQ/GMHIPmt1o/JglJe
         PXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:content-disposition:mime-version:message-id:subject:to
         :from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=7bbRGJ2JS/s/WCHseBjrCcrVfObmPjMEWiCrZVOXNHA=;
        b=Pv7SXWJ/gXcVyMnU7i8qqasjbxMzNxZ9PNI3M+V7MaTxfXgLms0UIB6Ecp6cQi7p1Y
         1yPsc1ZSWXKox5Cm3gA7zLOQooe0DuVhRNUY615WGvF7OJlRGVAoMUxlHZ+dZeg6glv7
         yqi2nMOeMOn+xXfs/W7Jhg2OuxmWB5b+GWe0kkqfT8KvSuSDEledDwGGyYPVuMt7jBwE
         +PKVfR2w5FyXtRDthyYtpOUWNck7D79aBWI9jUonCxKiXz94Ii2nFPwfp0S/p4r5Q6Oy
         0/Jo2jU7aSbJVTp61vildZnyw5dJqINKk8OjeeQoQZ6110p5keyz3b0Ls8XZkWYd3MGL
         OKJQ==
X-Gm-Message-State: ACgBeo0CxC8hcrh5KiNzhSQJPPwKOZ1ACPkaRixoGDhanXisoBJYDe+I
	/tI9l32uLDY2m6RjvJ/p2w4=
X-Google-Smtp-Source: AA6agR4Dq2DOK4PqqkuhxpraN39JXWKIhFvyaN51qATXjuLEw7vwHMJaJBSoOp+UY3I06hA/M5O+Pw==
X-Received: by 2002:a05:6a00:2789:b0:548:1278:3e2a with SMTP id bd9-20020a056a00278900b0054812783e2amr1351055pfb.24.1663149134378;
        Wed, 14 Sep 2022 02:52:14 -0700 (PDT)
Received: from hcl-ThinkPad-T495 ([2401:4900:1ce2:dc94:48c4:2ac5:ccad:657d])
        by smtp.gmail.com with ESMTPSA id w63-20020a626242000000b0053dec787698sm9947437pfb.175.2022.09.14.02.52.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Sep 2022 02:52:13 -0700 (PDT)
Date: Wed, 14 Sep 2022 15:22:07 +0530
From: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH v3] ARM: dts: aspeed: yosemit V2: Enable OCP debug card
Message-ID: <20220914095207.GA24690@hcl-ThinkPad-T495>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 15 Sep 2022 11:04:43 +1000
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
--- v3- 2- Updated the title and commit
---

---
--- v2- Updated the title
---

---
--- v1- Initial draft
---

Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
index 8864e9c312a8..df29072b3d1b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
@@ -215,6 +215,17 @@
 	};
 };
 
+&i2c13 {
+	status = "okay";
+	// Debug Card
+	multi-master;
+	ipmb13 at 10 {
+		compatible = "ipmb-dev";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+		i2c-protocol;
+};
+};
+
 &pwm_tacho {
 	status = "okay";
 	//FSC
-- 
2.17.1

