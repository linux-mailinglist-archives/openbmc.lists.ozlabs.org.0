Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4D94A7EAA
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 05:28:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jq5J34ZMvz3bbL
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 15:28:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aN0raUAZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=aN0raUAZ; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jq5BP2L8Dz3cDS
 for <openbmc@lists.ozlabs.org>; Thu,  3 Feb 2022 15:23:09 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id
 z14-20020a17090ab10e00b001b6175d4040so8900915pjq.0
 for <openbmc@lists.ozlabs.org>; Wed, 02 Feb 2022 20:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N0qE6gevIlt5TZkcv2OZGPBrY66lgxFvcf9i3jBRUkY=;
 b=aN0raUAZo+oeseYZz27rcN64NYcG+L6yp0uoPK4vMhQN+eJ355BogSpIO1mzEF4Ni6
 rDoY9TzMDTHLS73j3m+crNB9tMQVopJnFSEDmsBL4JJ+aZyu+cwxRYu01HEulZlu4PDz
 ICk96aSGhfNCtpw1BMMRoyoarHASsrtoU3bk0CM04rGFtd8EA5IN2T94NE7EI2eII9OT
 Ka0WiF4LEzJqYEnkbdKDwHSGbKFxNCUNUC9vgui3D3LlxJLHAo8/Hsu2m6XU3GIFnPcY
 O6YsKntlgniJmMyy/Rzk/FyzOs51nRdrBOR8UmMuQtlQUrfuVCGcPq/34vPPLzKRuG2w
 +M3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=N0qE6gevIlt5TZkcv2OZGPBrY66lgxFvcf9i3jBRUkY=;
 b=NIj7zk+MLDhBPACIsEYldYPDg4AUz6aZtioT5T/pT+K/QQ1KBmMegTFrUs4YbRUxXS
 e53Zosmu7Vvm4dbJKFAGR0FiOSH7dvpVKgFaHBKei5lB+oi18wIe/hby8W1PnPKH1Gne
 6iwOqil0qepbE5F83v0S0vZK1pX0QNAHgn1zJyw2poFS3gNP4jcUQXwaiwA45UswALTc
 S8EmyeL+zgeJnczwwdV8SHboHo+Oh8HKtLWbz6AFoSR+BHdvn9ashVW/AYZowcaOOTeI
 HepUliGLXt1ZGO8rXwAOLtxo4m2QweX+Nhq0mdbN3QoDqTxZ6GAzi6/KqABouEOEOrHm
 Onjw==
X-Gm-Message-State: AOAM5327cc2DwEIb09+Wo256a8VH//RoomAADpH2AXmfDgvV9rdgliCF
 8uPFaAkj86AKyrE3OCLDr6Y=
X-Google-Smtp-Source: ABdhPJz3EqLpyIF+ZZogMi9RyQMN7PEAmqnQjL4QV3g8bvqn3J7HCotzT0qVMpLUmhHcFI+qU/EVcA==
X-Received: by 2002:a17:903:124e:: with SMTP id
 u14mr34604544plh.57.1643862187258; 
 Wed, 02 Feb 2022 20:23:07 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id mp22sm7814137pjb.28.2022.02.02.20.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 20:23:06 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org
Subject: [libgpiod PATCH 7/7] gpio-tools-test: Add gpioget --by-name tests
Date: Thu,  3 Feb 2022 14:51:34 +1030
Message-Id: <20220203042134.68425-8-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203042134.68425-1-joel@jms.id.au>
References: <20220203042134.68425-1-joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 tools/gpio-tools-test.bats | 73 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
index a90c695fbc0f..068ade357a35 100755
--- a/tools/gpio-tools-test.bats
+++ b/tools/gpio-tools-test.bats
@@ -391,6 +391,79 @@ teardown() {
 	output_regex_match ".*invalid bias.*"
 }
 
+@test "gpioget: invalid line name (from different gpiochip) " {
+	gpio_mockup_probe named-lines 8 8 8
+
+	run_tool gpioget --by-name \
+				gpio-mockup-A-0 \
+				gpio-mockup-A-2 \
+				gpio-mockup-B-3
+
+	test "$status" -eq "1"
+	output_regex_match ".*does not contain line 'gpio-mockup-B-3'.*"
+}
+
+@test "gpioget: invalid line name (non existant line on a chip) " {
+	gpio_mockup_probe named-lines 8 8 8
+
+	run_tool gpioget --by-name \
+				gpio-mockup-A-0 \
+				missing
+
+	test "$status" -eq "1"
+	output_regex_match ".*does not contain line 'missing'.*"
+}
+
+@test "gpioget: invalid line name (non existant line, no chip) " {
+	gpio_mockup_probe named-lines 8 8 8
+
+	run_tool gpioget --by-name missing
+
+	test "$status" -eq "1"
+	output_regex_match ".*unable to find gpiochip.*"
+}
+
+@test "gpioget: read some lines by name" {
+	gpio_mockup_probe named-lines 8 8 8
+
+	gpio_mockup_set_pull 1 1 1
+	gpio_mockup_set_pull 1 4 1
+	gpio_mockup_set_pull 1 6 1
+
+	run_tool gpioget --by-name \
+				gpio-mockup-B-0 \
+				gpio-mockup-B-1 \
+				gpio-mockup-B-4 \
+				gpio-mockup-B-6
+
+	test "$status" -eq "0"
+	test "$output" = "0 1 1 1"
+}
+
+@test "gpioget: no arguments (by name)" {
+	run_tool gpioget --by-name
+
+	test "$status" -eq "1"
+	output_regex_match ".*at least one line name must be specified"
+}
+
+@test "gpioget: read some lines by name using short option" {
+	gpio_mockup_probe named-lines 8 8 8
+
+	gpio_mockup_set_pull 1 1 1
+	gpio_mockup_set_pull 1 4 1
+	gpio_mockup_set_pull 1 6 1
+
+	run_tool gpioget -N \
+				gpio-mockup-B-0 \
+				gpio-mockup-B-1 \
+				gpio-mockup-B-4 \
+				gpio-mockup-B-6
+
+	test "$status" -eq "0"
+	test "$output" = "0 1 1 1"
+}
+
 #
 # gpioset test cases
 #
-- 
2.34.1

