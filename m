Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E4B9CD646
	for <lists+openbmc@lfdr.de>; Fri, 15 Nov 2024 05:43:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XqPY82xjbz3c2h
	for <lists+openbmc@lfdr.de>; Fri, 15 Nov 2024 15:43:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1149"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731645817;
	cv=none; b=Ht+Bxh6yIoZynPkHAX39i5edaOmuhXDo8miwWSFP2lyzmHQoDZmKF7q/ffC0jh1dDVALej9IWMmWK+M6bVv5Jlqjx5MRf7mC0XO1UYJVOSeH9g570v7xFGntqVHb6e4xzwrm+JgBiL2icSChC8M2SSZ4Ehode1ntXIyombdiOjhcLW3J09PXKUhG3JiyZjUqQ0KR1JpUCeYPZej9NqEUSQJrzOtwnpRKzk7cXBuj5ORA6qdposq89G4THYBCUQQX4WRmMR4NieSYTxPMymOwO2CUuCzRx8ttp/qAu0AaXgHxtV0dGD45x1GCeuy9SyrJMFDcL92npojJqjE+vvm1dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731645817; c=relaxed/relaxed;
	bh=SWTmFeTgm2VLDhjQCMJox51wxvKAPwETC9oW5QsHWQ8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=JDWtjx7hB6jJxDkw7C2Ui79yH3PsVw7EL93aujHpddudwPg74tycnRTrM14PtaoCHIMofdbeVxq/UxXm1GNhBSfqTwRkLr2ZYLbe2lfEi58V8Br4prlf0iLvgYWxVDkweeEYtGRomAojl74HV7NXW8IJ+8uRrWLKkE0+AvVhKE29ibVz6msEyN4XpjawiL57cQSbq76/ubRJy63HpHcerwsXV9+/5hgkJssOmCipRLObxJLywSgFC30qJSVkBmVUCVLxo3fePEmNsuyQhGxyEyBvUNwix3bTqyqGW2FL0v2idCpsv9CRH7cmvFAMSY7KI6lUPJSEnBXgP0Jo+lxFug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=b019XWdP; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3cte2zw4kbzeoeraqnauvttvaftbbtyr.pbzbcraozpyvfgf.bmynof.bet@flex--brendanhiggins.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--brendanhiggins.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=b019XWdP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--brendanhiggins.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3cte2zw4kbzeoeraqnauvttvaftbbtyr.pbzbcraozpyvfgf.bmynof.bet@flex--brendanhiggins.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XqPY361P9z2x9N
	for <openbmc@lists.ozlabs.org>; Fri, 15 Nov 2024 15:43:34 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e59dc7df64so15453947b3.1
        for <openbmc@lists.ozlabs.org>; Thu, 14 Nov 2024 20:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731645810; x=1732250610; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SWTmFeTgm2VLDhjQCMJox51wxvKAPwETC9oW5QsHWQ8=;
        b=b019XWdPFar1k8dpVDUt+8OT6hBJIXpSx+y6t8Z1WijNE8KDFxfjPTIUXK5Y/jE7Ne
         2ABLQiGbSLNUQbQLlyQC35f3LWowFsvQSlUppr0cZw2NFTOVlPuPw7nWdnWZEkAtxPOM
         9LOR13VOe8syXQnTNTXi86s+5gTpAe+3tO5LZw1jbMDPpaqbTBxVSbdD8wkVWN+BHPKY
         LVT70YqRydsHj69vPknKd+KyJyJsv5NY2rhorYuGvIGrWCEUICeCpipg0w1RwhGaZ/gd
         9xRNZxCk+RmfigO9/bn73wIvEsIB5XsMmnRb13u19ycYaKPh0ydv3PYvJoMy01M/7pl0
         yMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731645810; x=1732250610;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SWTmFeTgm2VLDhjQCMJox51wxvKAPwETC9oW5QsHWQ8=;
        b=Lih8zfaus78I87MNJ3yWIykTX3WdpIoaPV48b85ydjOudTWqYHlmEh3E4ORHax9rHa
         yT4NYn8enGJecf80ErsoBAYeHmKqupJsewKfGD/9Hz9QUG4yOxYpWkroAbrE9INlIvjk
         tY+Uf92k3uN/Gj6GXvxpSetfsCWvcXQiwzQzHGyzZyoVf1v+m5cJ9J6qSS5WaPXxetvW
         W3nuAuGD1A5bKaO9lH8l9P0GjuTbU6iu/O2X836xy1dOHdRhzdBfye7sKG+jCSoscp8/
         dqMcyynA+Ni0yHqp7FjhpgWdlV5tiHdXfnOhMF+slYG9zLbz9gDDtsd47/gN7TWF+tLy
         J6gA==
X-Forwarded-Encrypted: i=1; AJvYcCXqksITQStD4vUJaaX43nhTG8bJR51LQRZ8QS+S2hbTaxQMUP32pVuRVtZJxcMh6Pw1fZBLVd14@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyHeNR8R9o/UtNYma30vssDQJOxNbOVzvj7zZaTxB+uzaoRxYdE
	04CZImw2S8Fo6SDJmzVid2rE5vqjfDVBQbh2j2bC6jkJueQY6Yuvs18NGQaX01X3MkzO0fE3kh1
	2Sbews+bt3KRsO11SXrfl5QenYjfYI6srZA==
X-Google-Smtp-Source: AGHT+IEJ4NE2/XuDDDNAEKvda+FMnKUt6iMnc1swX3o47JMptB20Xn++7Qkq+lJu0qkPYYpm82OXCWt2SDYG5Lf2Rsq/yA==
X-Received: from brendan-cloud.c.googlers.com ([fda3:e722:ac3:cc00:141:be02:ac12:7acb])
 (user=brendanhiggins job=sendgmr) by 2002:a05:690c:fca:b0:6ec:b10d:5745 with
 SMTP id 00721157ae682-6ee55017265mr1428467b3.3.1731645810171; Thu, 14 Nov
 2024 20:43:30 -0800 (PST)
Date: Fri, 15 Nov 2024 04:43:03 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241115044303.50877-1-brendanhiggins@google.com>
Subject: [RFC v1] MAINTAINERS: transfer i2c-aspeed maintainership from Brendan
 to Ryan
From: Brendan Higgins <brendanhiggins@google.com>
To: tommy_huang@aspeedtech.com, benh@kernel.crashing.org, joel@jms.id.au, 
	andi.shyti@kernel.org, andrew@codeconstruct.com.au, wsa@kernel.org, 
	ryan_chen@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: BMC-SW@aspeedtech.com, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org, brendan.higgins@linux.dev, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Remove Brendan Higgins <brendanhiggins@google.com> from i2c-aspeed entry
and replace with Ryan Chen <ryan_chen@aspeedtech.com>.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
I am leaving Google and am going through and cleaning up my @google.com
address in the relevant places. I was just going to remove myself from
the ASPEED I2C DRIVER since I haven't been paying attention to it, but
then I saw Ryan is adding a file for the I2C functions on 2600, which
made my think: Should I replace myself with Ryan as the maintainer?

I see that I am the only person actually listed as the maintainer at the
moment, and I don't want to leave this in an unmaintained state. What
does everyone think? Are we cool with Ryan as the new maintainer?
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b878ddc99f94e..e7fba34947f5f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2195,7 +2195,7 @@ F:	drivers/mmc/host/usdhi6rol0.c
 F:	drivers/pinctrl/pinctrl-artpec*
 
 ARM/ASPEED I2C DRIVER
-M:	Brendan Higgins <brendanhiggins@google.com>
+M:	Ryan Chen <ryan_chen@aspeedtech.com>
 R:	Benjamin Herrenschmidt <benh@kernel.crashing.org>
 R:	Joel Stanley <joel@jms.id.au>
 L:	linux-i2c@vger.kernel.org

base-commit: cfaaa7d010d1fc58f9717fcc8591201e741d2d49
-- 
2.47.0.338.g60cca15819-goog

