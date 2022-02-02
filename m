Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D42B4A7929
	for <lists+openbmc@lfdr.de>; Wed,  2 Feb 2022 21:02:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jpt4C2TCWz3bcX
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 07:02:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cCJqmNxF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cCJqmNxF; dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jpt3Q1QK5z3bbH
 for <openbmc@lists.ozlabs.org>; Thu,  3 Feb 2022 07:01:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643832082; x=1675368082;
 h=message-id:date:mime-version:to:from:subject:
 content-transfer-encoding;
 bh=y9i/F4pVo5tVHDVs5+8tSspQ6rR1ys0nKbIEy4ukM1g=;
 b=cCJqmNxF+2N9cSkHWW1jvBgKoJWCwMYzuh74PZaeXn9dx0P+BfQn+GvF
 a2EAtO1LOfiVx26Ew6p0dKjq87aUgqBcqOD3pQinCq3G3V8/31iqa3D9f
 ZT6TvLOpLg9pqkpB+SiWdQgYulYVvYvq+9qU2yaxinjmtljjUZVF8UUcA
 ZpyiRZabXIOPgap8idzaeOAvX8AqXuyINhsX5g99VCsJ6Swb24NlpQucQ
 xKWxl6T3ztdF5siPNewMyRpm8G52OGlM26ZIkwpILO0WdZFAtchNaBXlT
 r1x5H6eCmrb42+VBmylX5XRKcYIGu7qVRVqNPozSRvpYvXGpmDPT0nows w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="311314405"
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; d="scan'208";a="311314405"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 12:00:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; d="scan'208";a="620278042"
Received: from linux.intel.com ([10.54.29.200])
 by FMSMGA003.fm.intel.com with ESMTP; 02 Feb 2022 12:00:19 -0800
Received: from [10.212.254.232] (jmbills-MOBL.amr.corp.intel.com
 [10.212.254.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id D2FC0580AF6
 for <openbmc@lists.ozlabs.org>; Wed,  2 Feb 2022 12:00:18 -0800 (PST)
Message-ID: <19a9fcd1-f697-e029-7c9e-67ff529c05f8@linux.intel.com>
Date: Wed, 2 Feb 2022 13:00:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Subject: [PATCH 2/2] pinctrl: aspeed: Allow monitoring of power control input
 GPIOs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

The pass-through input GPIOs cannot be monitored because when
requested, pass-through is disabled which causes a change on the
pass-through output.

The SIO GPIOs cannot be monitored because when requested, the
request is rejected based on the value of the ACPI strap.

This change removes the register check condition from the pass-
through and desired SIO GPIOs so they can be requested and
monitored from power control.

Tested:
For pass-through, I used gpioset to hold a request on the input
GPIOs and confirmed that pass-through remained enabled.

For SIO, I used gpioget to confirm that I can successfully request
and read the GPIO value.

Signed-off-by: Jason M. Bills <jason.m.bills@linux.intel.com>
---
  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 10 +++++-----
  drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 10 +++++-----
  2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c 
b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 6ab3473cbba6..69a05a03dd63 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -279,7 +279,7 @@ FUNC_GROUP_DECL(SD2, F19, E21, F20, D20, D21, E20, 
G18, C21);

  #define B20 32
  SIG_EXPR_LIST_DECL_SINGLE(B20, NCTS3, NCTS3, SIG_DESC_SET(SCU80, 16));
-SIG_EXPR_DECL_SINGLE(GPIE0IN, GPIE0, GPIE0_DESC);
+SIG_EXPR_DECL_SINGLE(GPIE0IN, GPIE0);
  SIG_EXPR_DECL_SINGLE(GPIE0IN, GPIE, GPIE_DESC);
  SIG_EXPR_LIST_DECL_DUAL(B20, GPIE0IN, GPIE0, GPIE);
  PIN_DECL_2(B20, GPIOE0, NCTS3, GPIE0IN);
@@ -299,7 +299,7 @@ FUNC_GROUP_DECL(GPIE0, B20, C20);

  #define F18 34
  SIG_EXPR_LIST_DECL_SINGLE(F18, NDSR3, NDSR3, SIG_DESC_SET(SCU80, 18));
-SIG_EXPR_DECL_SINGLE(GPIE2IN, GPIE2, GPIE2_DESC);
+SIG_EXPR_DECL_SINGLE(GPIE2IN, GPIE2);
  SIG_EXPR_DECL_SINGLE(GPIE2IN, GPIE, GPIE_DESC);
  SIG_EXPR_LIST_DECL_DUAL(F18, GPIE2IN, GPIE2, GPIE);
  PIN_DECL_2(F18, GPIOE2, NDSR3, GPIE2IN);
@@ -1412,7 +1412,7 @@ FUNC_GROUP_DECL(ADC15, H4);

  #define R22 192
  SIG_EXPR_DECL_SINGLE(SIOS3, SIOS3, SIG_DESC_SET(SCUA4, 8));
-SIG_EXPR_DECL_SINGLE(SIOS3, ACPI, ACPI_DESC);
+SIG_EXPR_DECL_SINGLE(SIOS3, ACPI);
  SIG_EXPR_LIST_DECL_DUAL(R22, SIOS3, SIOS3, ACPI);
  SIG_EXPR_LIST_DECL_SINGLE(R22, DASHR22, DASHR22, SIG_DESC_SET(SCU94, 10));
  PIN_DECL_2(R22, GPIOY0, SIOS3, DASHR22);
@@ -1420,7 +1420,7 @@ FUNC_GROUP_DECL(SIOS3, R22);

  #define R21 193
  SIG_EXPR_DECL_SINGLE(SIOS5, SIOS5, SIG_DESC_SET(SCUA4, 9));
-SIG_EXPR_DECL_SINGLE(SIOS5, ACPI, ACPI_DESC);
+SIG_EXPR_DECL_SINGLE(SIOS5, ACPI);
  SIG_EXPR_LIST_DECL_DUAL(R21, SIOS5, SIOS5, ACPI);
  SIG_EXPR_LIST_DECL_SINGLE(R21, DASHR21, DASHR21, SIG_DESC_SET(SCU94, 10));
  PIN_DECL_2(R21, GPIOY1, SIOS5, DASHR21);
@@ -1436,7 +1436,7 @@ FUNC_GROUP_DECL(SIOPWREQ, P22);

  #define P21 195
  SIG_EXPR_DECL_SINGLE(SIOONCTRL, SIOONCTRL, SIG_DESC_SET(SCUA4, 11));
-SIG_EXPR_DECL_SINGLE(SIOONCTRL, ACPI, ACPI_DESC);
+SIG_EXPR_DECL_SINGLE(SIOONCTRL, ACPI);
  SIG_EXPR_LIST_DECL_DUAL(P21, SIOONCTRL, SIOONCTRL, ACPI);
  SIG_EXPR_LIST_DECL_SINGLE(P21, DASHP21, DASHP21, SIG_DESC_SET(SCU94, 11));
  PIN_DECL_2(P21, GPIOY3, SIOONCTRL, DASHP21);
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c 
b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index ffc72168ef7b..458b84b223c4 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -776,7 +776,7 @@ SSSF_PIN_DECL(AC23, GPIOO7, PWM7, 
SIG_DESC_SET(SCU41C, 23));

  #define AB22 120
  SIG_EXPR_LIST_DECL_SEMG(AB22, PWM8, PWM8G1, PWM8, SIG_DESC_SET(SCU41C, 
24));
-SIG_EXPR_LIST_DECL_SESG(AB22, THRUIN0, THRU0, SIG_DESC_SET(SCU4BC, 24));
+SIG_EXPR_LIST_DECL_SESG(AB22, THRUIN0, THRU0);
  PIN_DECL_2(AB22, GPIOP0, PWM8, THRUIN0);
  GROUP_DECL(PWM8G1, AB22);
  FUNC_DECL_2(PWM8, PWM8G0, PWM8G1);
@@ -793,7 +793,7 @@ FUNC_DECL_2(PWM9, PWM9G0, PWM9G1);

  #define AA23 122
  SIG_EXPR_LIST_DECL_SEMG(AA23, PWM10, PWM10G1, PWM10, 
SIG_DESC_SET(SCU41C, 26));
-SIG_EXPR_LIST_DECL_SESG(AA23, THRUIN1, THRU1, SIG_DESC_SET(SCU4BC, 26));
+SIG_EXPR_LIST_DECL_SESG(AA23, THRUIN1, THRU1);
  PIN_DECL_2(AA23, GPIOP2, PWM10, THRUIN1);
  GROUP_DECL(PWM10G1, AA23);
  FUNC_DECL_2(PWM10, PWM10G0, PWM10G1);
@@ -1086,16 +1086,16 @@ FUNC_GROUP_DECL(GPIU7, AC17);
  FUNC_GROUP_DECL(ADC15, AC17);

  #define AB15 168
-SSSF_PIN_DECL(AB15, GPIOV0, SIOS3, SIG_DESC_SET(SCU434, 8));
+SSSF_PIN_DECL(AB15, GPIOV0, SIOS3);

  #define AF14 169
-SSSF_PIN_DECL(AF14, GPIOV1, SIOS5, SIG_DESC_SET(SCU434, 9));
+SSSF_PIN_DECL(AF14, GPIOV1, SIOS5);

  #define AD14 170
  SSSF_PIN_DECL(AD14, GPIOV2, SIOPWREQ, SIG_DESC_SET(SCU434, 10));

  #define AC15 171
-SSSF_PIN_DECL(AC15, GPIOV3, SIOONCTRL, SIG_DESC_SET(SCU434, 11));
+SSSF_PIN_DECL(AC15, GPIOV3, SIOONCTRL);

  #define AE15 172
  SSSF_PIN_DECL(AE15, GPIOV4, SIOPWRGD, SIG_DESC_SET(SCU434, 12));
-- 
2.25.1

