Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5954A7EA9
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 05:27:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jq5HM3VGdz3bck
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 15:27:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ji2Crxf2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ji2Crxf2; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jq5BK6yjGz3cFX
 for <openbmc@lists.ozlabs.org>; Thu,  3 Feb 2022 15:23:05 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id o64so1309859pjo.2
 for <openbmc@lists.ozlabs.org>; Wed, 02 Feb 2022 20:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EbHkElAxdxg7UeMWDYrSHAO+RpshB1hCDYOyLTuzLF8=;
 b=ji2Crxf29WymASA7SKUltPrwgBoYTSuYTAADN3qxQn8ZN6ViOuU7W2bz9XZsK3sbPw
 r4xd1UQ/LeW5qYjA/x1jjRyuOvSnvH++Zl2Y9aSySWLunUYvR2qqMuBkgg8B1l6gBLLI
 dpvjGeY7QffRc1aEqW81pH15562o5MxrQ1TCCjFbJG08kpvpc1aafjS53xir4En+zy+t
 vCXQoRxQeBkgQ7M2h75qYxNRMTymJigHLBr+8sr5F8vnQi7qMQnzBSuRf1JNDH/3bKW+
 pNi7XdUQB6ayo72gxw+NLMKP4Ei3cCUT9JXBP/Dt1hWpFM63W6O+YekDe+nCJPRVio0S
 +MMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EbHkElAxdxg7UeMWDYrSHAO+RpshB1hCDYOyLTuzLF8=;
 b=uozW1Y8uzVBST3zqIDJ34q+D5XFkgCHwr4VWkme2eTrUIv9ZS9XEaksJi052tjBCrH
 YB70hKjspXSjwWYdzbuJVVDIDSVQDqaWnwDUor/OfNF8eGm0w0vYijllUzMo3bGpn0UM
 C1u5OKv6VZjWRplxWBlspBibFfPGi8TlbcbxoBV3s+K3pSAcmNLtNf+V70nOXlc4Gy0C
 zS3M9uSKLTkzNii071+wpPwe3zoO9/4ENUJYYG4zZFwwkaEvhV1GLDUveF8IRnYbK0yt
 m0UPH/nPeXXffKAiuT4/VPXBfK6Y2IM8U77GrXPEviyvwM9ZtBkeuZrfVtfxNLbm+5eb
 wtyg==
X-Gm-Message-State: AOAM533+WbtZrKxCU/WxpjM8TedfhPgJ3Prj6xk85dGhORh6QIF3YZwS
 4nlZRyBFKjWSq9kfwjvAY3koCQp9/vM=
X-Google-Smtp-Source: ABdhPJzOoDrfzluWROAW59ZI8pGI551htVXlaz9j3xa9P2KCEJiIh5pFGwtavtaFXrECAUfozSkuoA==
X-Received: by 2002:a17:903:18d:: with SMTP id
 z13mr33767848plg.113.1643862183946; 
 Wed, 02 Feb 2022 20:23:03 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id mp22sm7814137pjb.28.2022.02.02.20.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 20:23:03 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org
Subject: [libgpiod PATCH 6/7] gpio-tools-test: Add gpioset --by-name tests
Date: Thu,  3 Feb 2022 14:51:33 +1030
Message-Id: <20220203042134.68425-7-joel@jms.id.au>
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
 tools/gpio-tools-test.bats | 111 +++++++++++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
index a5b97e1f98ee..a90c695fbc0f 100755
--- a/tools/gpio-tools-test.bats
+++ b/tools/gpio-tools-test.bats
@@ -670,6 +670,117 @@ teardown() {
 	output_regex_match ".*unable to request lines.*"
 }
 
+@test "gpioset: invalid value (by name)" {
+	gpio_mockup_probe named-lines 8 8 8
+
+	run_tool gpioset --by-name gpio-mockup-A-0=foobar
+
+	test "$status" -eq "1"
+	output_regex_match ".*invalid offset<->value mapping: gpio-mockup-A-0=foobar.*"
+}
+
+@test "gpioset: invalid line syntax by name, missing =" {
+	gpio_mockup_probe named-lines 8 8 8
+
+	run_tool gpioset --by-name gpio-mockup-A-0foobar
+
+	test "$status" -eq "1"
+	output_regex_match ".*invalid name/value 'gpio-mockup-A-0foobar'*"
+}
+
+@test "gpioset: invalid line syntax by name, leading =" {
+	gpio_mockup_probe named-lines 8 8 8
+
+	run_tool gpioset --by-name =gpio-mockup-A-0foobar
+
+	test "$status" -eq "1"
+	output_regex_match ".*unable to find '' on a gpiochip*"
+}
+
+@test "gpioset: missing value (by name)" {
+	gpio_mockup_probe named-lines 8 8 8
+
+	run_tool gpioset --by-name gpio-mockup-A-0=
+
+	test "$status" -eq "1"
+	output_regex_match ".*invalid offset<->value mapping: gpio-mockup-A-0=*"
+}
+
+@test "gpioset: invalid line name (from different gpiochip) " {
+	gpio_mockup_probe named-lines 8 8 8
+
+	run_tool gpioset --by-name \
+				gpio-mockup-A-0=1 \
+				gpio-mockup-A-2=0 \
+				gpio-mockup-B-3=1
+
+	test "$status" -eq "1"
+	output_regex_match ".*does not contain line 'gpio-mockup-B-3'.*"
+}
+
+@test "gpiogst: invalid line name (non existant line on a chip) " {
+	gpio_mockup_probe named-lines 8 8 8
+
+	run_tool gpioset --by-name \
+				gpio-mockup-A-0=1 \
+				missing=0
+
+	test "$status" -eq "1"
+	output_regex_match ".*does not contain line 'missing'.*"
+}
+
+@test "gpioset: invalid line name (non existant line, no chip) " {
+	gpio_mockup_probe named-lines 8 8 8
+
+	run_tool gpioset --by-name missing=1
+
+	test "$status" -eq "1"
+	output_regex_match ".*unable to find 'missing' on a gpiochip*"
+}
+
+@test "gpioset: set lines by name and wait for SIGTERM" {
+	gpio_mockup_probe named-lines 2 2 8
+
+	coproc_run_tool gpioset --mode=signal --by-name \
+						gpio-mockup-C-3=1 \
+						gpio-mockup-C-6=1 \
+						gpio-mockup-C-7=0
+
+	gpio_mockup_check_value 2 3 1
+	gpio_mockup_check_value 2 6 1
+	gpio_mockup_check_value 2 7 0
+
+	coproc_tool_kill
+	coproc_tool_wait
+
+	test "$status" -eq "0"
+}
+
+@test "gpioset: set lines by name using short option and wait for SIGTERM" {
+	gpio_mockup_probe named-lines 2 2 8
+
+	coproc_run_tool gpioset --mode=signal -N \
+						gpio-mockup-C-3=1 \
+						gpio-mockup-C-6=1 \
+						gpio-mockup-C-7=0
+
+	gpio_mockup_check_value 2 3 1
+	gpio_mockup_check_value 2 6 1
+	gpio_mockup_check_value 2 7 0
+
+	coproc_tool_kill
+	coproc_tool_wait
+
+	test "$status" -eq "0"
+}
+
+@test "gpioset: no arguments (by name)" {
+	run_tool gpioset --by-name
+
+	test "$status" -eq "1"
+	output_regex_match ".*at least one line name must be specified"
+}
+
 #
 # gpiomon test cases
 #
-- 
2.34.1

