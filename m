Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1368A387023
	for <lists+openbmc@lfdr.de>; Tue, 18 May 2021 05:08:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fkgt86bkNz3049
	for <lists+openbmc@lfdr.de>; Tue, 18 May 2021 13:08:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=NxbyH77u;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--davidgow.bounces.google.com
 (client-ip=2607:f8b0:4864:20::84a; helo=mail-qt1-x84a.google.com;
 envelope-from=3rx-dyagkby4nkfsnqygqyyqvo.mywyzoxlwmvscdc.yjvklc.ybq@flex--davidgow.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=NxbyH77u; dkim-atps=neutral
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fh22q5ypsz2ydJ
 for <openbmc@lists.ozlabs.org>; Fri, 14 May 2021 05:36:16 +1000 (AEST)
Received: by mail-qt1-x84a.google.com with SMTP id
 69-20020aed304b0000b02901c6d87aed7fso18586255qte.21
 for <openbmc@lists.ozlabs.org>; Thu, 13 May 2021 12:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=mKHn5nW8hMSnIzbkNUA9bgAI/5jrfrz+RnfoZbF6j1k=;
 b=NxbyH77uCpX5jHPLaIxntl4MMEN72o3nW4IkVxd/s3G+RDesqezz14zIzof8/hNPe5
 bs0sPo+sfbA/DkdAe5qwND2yDe8Q64E5hUI4+AlxryJRLiGkfRkjlkEyaeLS0d71adGe
 EqppPm6oUyDCv9k3uQh/y6lgpmsdCDlIbWeyBJwuntF8gv+cgoXCeMogRGjMI3rhvHiU
 idKnSaGs+vEa/rnr4VhDzukE8dvmoHkR0nl+RncsQ8iu8K1NZakuYD3gCSj7JWp3xwB/
 9z6F4Y/tGgPWGTtRj7Gf2L8/2hhiBm1mowzmxrLDhi1u0Lyaki06ZcxNxWrNj5V5IMuB
 4KtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=mKHn5nW8hMSnIzbkNUA9bgAI/5jrfrz+RnfoZbF6j1k=;
 b=JFZVTFdP/0o+cl+1U2udJ0HLK4bHN8fTMJofKJiogxawzPuKfkkkNHO3oWBY2vcvgF
 DrQN5as9XdTrc/TRvo4os8EqIVG4KVzXYX/g3N/TXZzqRrS8ga88DV0juCY5r8Goh8IV
 iaoPfrMXtdsGRo6Pl/O55wfYaZwaO4HabHGllJKKl6qedpHiOrE0LxKYWTWcbJYRN2+z
 BYFNkNPywEK/ZccqSMpiCOdv7hOwNTEsnhmEEGp+sSaeffOcjdH0c7kMyUKFZd05Mvhr
 Yt0qNFpDbr4A9sNAr5hcbK+/l+l4zc1k8Klw1R53m7dqrL0iDRed9+lvl6h6OISm7mR6
 RaCw==
X-Gm-Message-State: AOAM531uyHFEag43tScqSoOy1abeGcJDw9EFYIfP9xsxSppD4tfHPJvh
 38MsHGIXuJGTj8W8/aqgdrMXE/w+OPBnvQ==
X-Google-Smtp-Source: ABdhPJzOzRUMhMpdqg5s7k2XyPDWGEgOheQSp/nxRF00tQp7xZJniBllI4qoqrF0m6c5fppZqVcMeF2SI9GnNQ==
X-Received: from spirogrip.svl.corp.google.com
 ([2620:15c:2cb:201:5f61:8ca4:879b:809e])
 (user=davidgow job=sendgmr) by 2002:a05:6214:373:: with SMTP id
 t19mr9320953qvu.45.1620934573116; Thu, 13 May 2021 12:36:13 -0700 (PDT)
Date: Thu, 13 May 2021 12:32:00 -0700
In-Reply-To: <20210513193204.816681-1-davidgow@google.com>
Message-Id: <20210513193204.816681-6-davidgow@google.com>
Mime-Version: 1.0
References: <20210513193204.816681-1-davidgow@google.com>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
Subject: [PATCH v2 06/10] mmc: sdhci-of-aspeed: Remove some unnecessary casts
 from KUnit tests
From: David Gow <davidgow@google.com>
To: Brendan Higgins <brendanhiggins@google.com>,
 Daniel Latypov <dlatypov@google.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, Andrew Jeffery <andrew@aj.id.au>, 
 Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 18 May 2021 13:07:48 +1000
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
Cc: David Gow <davidgow@google.com>, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

With KUnit's EXPECT macros no longer typechecking arguments as strictly,
get rid of a number of now unnecessary casts.

Signed-off-by: David Gow <davidgow@google.com>
---
This should be a no-op functionality wise, and while it depends on the
first couple of patches in this series, it's otherwise independent from
the others. I think this makes the test more readable, but if you
particularly dislike it, I'm happy to drop it.

 drivers/mmc/host/sdhci-of-aspeed-test.c | 34 ++++++++++++-------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed-test.c b/drivers/mmc/host/sdhci-of-aspeed-test.c
index bb67d159b7d8..1ed4f86291f2 100644
--- a/drivers/mmc/host/sdhci-of-aspeed-test.c
+++ b/drivers/mmc/host/sdhci-of-aspeed-test.c
@@ -26,23 +26,23 @@ static void aspeed_sdhci_phase_ddr52(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, 15,
 			aspeed_sdhci_phase_to_tap(NULL, rate, 25));
 
-	KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 0,
+	KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 0,
 			aspeed_sdhci_phase_to_tap(NULL, rate, 180));
-	KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 0,
+	KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 0,
 			aspeed_sdhci_phase_to_tap(NULL, rate, 181));
-	KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 1,
+	KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 1,
 			aspeed_sdhci_phase_to_tap(NULL, rate, 182));
-	KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 1,
+	KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 1,
 			aspeed_sdhci_phase_to_tap(NULL, rate, 183));
-	KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 2,
+	KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 2,
 			aspeed_sdhci_phase_to_tap(NULL, rate, 184));
-	KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 3,
+	KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 3,
 			aspeed_sdhci_phase_to_tap(NULL, rate, 185));
-	KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 14,
+	KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 14,
 			aspeed_sdhci_phase_to_tap(NULL, rate, 203));
-	KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
+	KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
 			aspeed_sdhci_phase_to_tap(NULL, rate, 204));
-	KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
+	KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
 			aspeed_sdhci_phase_to_tap(NULL, rate, 205));
 }
 
@@ -67,21 +67,21 @@ static void aspeed_sdhci_phase_hs200(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, 15,
 			aspeed_sdhci_phase_to_tap(NULL, rate, 96));
 
-	KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK,
+	KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK,
 			aspeed_sdhci_phase_to_tap(NULL, rate, 180));
-	KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK,
+	KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK,
 			aspeed_sdhci_phase_to_tap(NULL, rate, 185));
-	KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 1,
+	KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 1,
 			aspeed_sdhci_phase_to_tap(NULL, rate, 186));
-	KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 1,
+	KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 1,
 			aspeed_sdhci_phase_to_tap(NULL, rate, 187));
-	KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 14,
+	KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 14,
 			aspeed_sdhci_phase_to_tap(NULL, rate, 269));
-	KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
+	KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
 			aspeed_sdhci_phase_to_tap(NULL, rate, 270));
-	KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
+	KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
 			aspeed_sdhci_phase_to_tap(NULL, rate, 271));
-	KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
+	KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
 			aspeed_sdhci_phase_to_tap(NULL, rate, 276));
 }
 
-- 
2.31.1.751.gd2f1c929bd-goog

