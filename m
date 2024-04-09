Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A4089D537
	for <lists+openbmc@lfdr.de>; Tue,  9 Apr 2024 11:15:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jcH87VPY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDL0C5c91z3dSp
	for <lists+openbmc@lfdr.de>; Tue,  9 Apr 2024 19:15:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jcH87VPY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2a; helo=mail-oa1-x2a.google.com; envelope-from=jim.t90615@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDKzd3xQbz30fh
	for <openbmc@lists.ozlabs.org>; Tue,  9 Apr 2024 19:14:52 +1000 (AEST)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-222a9eae9a7so2764876fac.3
        for <openbmc@lists.ozlabs.org>; Tue, 09 Apr 2024 02:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712654087; x=1713258887; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pl7DTbYlcD6/uMqaXD1kQvMMRCQ5Tqm1qNlMm77S728=;
        b=jcH87VPYwjIOzLqP7mWWPtiXRZlP7kIZGxx2WF+9RaafqekbbZGdffv1srTrId3tu3
         HN7psLtJzm9LQxdl4djFPFNwGd/5weCZFOPjf1XdI8UhkJRXEQfwsKflMeH+MNIIWCyi
         WPqvOmJZUvyNEdiIJ7i2VuToae5UpRxul3MX1KMqKwCAdh6JVroMp6U3B4hOCDA0keOc
         TgJXuZFgO8C8CuNBGVMW5a00lAjMFEqRCfZV8F0wdlkIEDnLk1owyhVot6HIGdCKLhn5
         hEAxILfpAE7puMdJxIeTB0vwbSadYVybqIy3QhbQUB0mSJ1oCJzXhQbIVorxtjmGWCoH
         ezJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712654087; x=1713258887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pl7DTbYlcD6/uMqaXD1kQvMMRCQ5Tqm1qNlMm77S728=;
        b=JOnPQ+E8uWWXrbPCt2FGFGcgzudoM8JD2iFSDAlLS0RE+JXrbqM92Lzz5OVtUINFZg
         drLn3J+dE1i5SudMFbtFm6ZXW8nxgxYCchp5YMyXNIkx6iWhlu7ptgSM1dGKQc6m+2o8
         JJna4YkrZuf6dqsr6GQzgvH2R+Q5O3MlAa8I4OHbzrPbri25moyStrOzzN4ubA8GC0nT
         h0dnlhK3S6PCx6npGFoki6VRw7XfOIPjhpSA9QLvzRXocWPDKWVNRyFvJXX5Ax3X25Z+
         qjF70FVnceJS29sCxeXNNjOHbKtR2QQiYH7X/IPNJv2PMDJhodqNU4n6Phgvj6KbNftK
         XNVQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7V/fqslreD7typN+rE6s9kc4CyH7/mkyIm9RQr6wiRvfNyXCvTehlj+OEWhwVqMnW2iE2oIE4nJoF4gAFgPt4vmkS8B0HEeM=
X-Gm-Message-State: AOJu0YzKCAW2sMqJquELN/6s/+6zoOKiQKb+mimGL6IpL+cAEqlp2AMc
	GgwCRpbPDg21Cqb9qnKhmpoknhEw5GcqqdgHtYSU+AO9n9ttHRyu
X-Google-Smtp-Source: AGHT+IGBkMDq1rmbyxjfwhXgPWfcyyKypUF11tjVYwfZfvE4K9h+fujOJEcIa05fC3DHcinAGRlS3w==
X-Received: by 2002:a05:6870:72c8:b0:22e:af38:47ee with SMTP id o8-20020a05687072c800b0022eaf3847eemr11892364oak.58.1712654086854;
        Tue, 09 Apr 2024 02:14:46 -0700 (PDT)
Received: from localhost.localdomain ([116.89.141.171])
        by smtp.gmail.com with ESMTPSA id o9-20020a056a00214900b006ead1509847sm7802100pfk.216.2024.04.09.02.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 02:14:46 -0700 (PDT)
From: Jim Liu <jim.t90615@gmail.com>
X-Google-Original-From: Jim Liu <JJLIU0@nuvoton.com>
To: JJLIU0@nuvoton.com,
	KWLIU@nuvoton.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	jim.t90615@gmail.com
Subject: [PATCH v1] gpio: nuvoton: Fix sgpio irq handle error
Date: Tue,  9 Apr 2024 17:14:19 +0800
Message-Id: <20240409091419.1356615-1-JJLIU0@nuvoton.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Remove irq_find_mapping and use generic_handle_domain_irq

Signed-off-by: Jim Liu <JJLIU0@nuvoton.com>
---
 drivers/gpio/gpio-npcm-sgpio.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-npcm-sgpio.c b/drivers/gpio/gpio-npcm-sgpio.c
index d31788b43abc..136838c25756 100644
--- a/drivers/gpio/gpio-npcm-sgpio.c
+++ b/drivers/gpio/gpio-npcm-sgpio.c
@@ -443,11 +443,9 @@ static void npcm_sgpio_irq_handler(struct irq_desc *desc)
 		const struct npcm_sgpio_bank *bank = &npcm_sgpio_banks[i];
 
 		reg = ioread8(bank_reg(gpio, bank, EVENT_STS));
-		for_each_set_bit(j, &reg, 8) {
-			girq = irq_find_mapping(gc->irq.domain,
-						i * 8 + gpio->nout_sgpio + j);
-			generic_handle_domain_irq(gc->irq.domain, girq);
-		}
+		for_each_set_bit(j, &reg, 8)
+			generic_handle_domain_irq(gc->irq.domain,
+						  i * 8 + gpio->nout_sgpio + j);
 	}
 
 	chained_irq_exit(ic, desc);
-- 
2.25.1

