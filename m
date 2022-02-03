Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D32F4A7EA5
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 05:24:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jq5DB0Xl0z3bWj
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 15:24:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NXeNBpuY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=NXeNBpuY; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jq5B50W7Jz3bcB
 for <openbmc@lists.ozlabs.org>; Thu,  3 Feb 2022 15:22:52 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d1so1115673plh.10
 for <openbmc@lists.ozlabs.org>; Wed, 02 Feb 2022 20:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SnBAgxMF4MgLnVIaS9TWikI68gd/15PA6woV2819bEg=;
 b=NXeNBpuY04a8npxta5oEQmVE5smwM8KltFF6I5MAvm2qP2jA7mwH1Gb15SNX/W3+A8
 czroPPf8HU9oUnK63ir0BFzuwoHArOebq+P0ow02ooMft6h2SL4OA9R9JC7sIM/OKFGn
 aMxpq4/hla5w8old/tZAY80Na7mdwQH+pxErTd/LraQZnTyJKLrORL83e7snhtavrFF5
 em0ZgvqAuE7oaamVPZ1L4kVUhs2tPd9AdwYLm6BLwZVJRJ/OVG8clDPyHeQK90ea7GCX
 zbyvKFMLps1AwtUjeDjK36GvqJxOufhv4bocOqUnOAlhd9eJVYj1RCmcgpF+tiBpWjDt
 jJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SnBAgxMF4MgLnVIaS9TWikI68gd/15PA6woV2819bEg=;
 b=ZcW6tb+yW/OBKyykvH0YZkpCXnbptHcgAyKrQAr5fNdIhZ9o1vqU/iSWNofolgdamT
 JtqrR22cMT8HnAxENpVNkqkG45HJPz1OWNCX7NfAT0R5ypvCuya0VA4mEXliNuXknzSI
 zO5f0MHrtfhnijQkGNlxU/iGu2hy+eFGEB+CZbE7ftprnEbK8A06EzMySH3m3g2mm2nm
 zwI0hiY0F7Hrt7cs/S8l0NfZ3KPqH9FirYkQvVwpXZ5kX+5O+wpuWCgc6EPM5o2wiByo
 0Svv4aHJfOhspgE4yvvDogleiicqzaDHCyXxNBlcGhdp74/gCddOYk+HlJ8lA3v+QGvf
 RfEg==
X-Gm-Message-State: AOAM533OoKPDZlaOGt6MfSr8tINEc9URH4tnvlJMSIbkDacFptf7/sb4
 72NaXmIPXvXbktmHt2a6bb8=
X-Google-Smtp-Source: ABdhPJxBUONJKszju+J0cZEdM//IG/OI20cjBPN1UeWhb2xMSAkZxBNCBdYvYpWI+K3DiX7532Bmaw==
X-Received: by 2002:a17:90a:f485:: with SMTP id
 bx5mr11813812pjb.46.1643862170963; 
 Wed, 02 Feb 2022 20:22:50 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id mp22sm7814137pjb.28.2022.02.02.20.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 20:22:50 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org
Subject: [libgpiod PATCH 2/7] tools: Add line name to offset lookup helper
Date: Thu,  3 Feb 2022 14:51:29 +1030
Message-Id: <20220203042134.68425-3-joel@jms.id.au>
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

line_names_to_offsets to be used by tools that support --by-name.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 tools/tools-common.c | 22 ++++++++++++++++++++++
 tools/tools-common.h |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/tools/tools-common.c b/tools/tools-common.c
index c83e68a2c1e4..958933ed6d51 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -204,3 +204,25 @@ struct gpiod_chip *chip_by_line_name(const char *name)
 	return NULL;
 }
 
+int line_names_to_offsets(struct gpiod_chip *chip, char **lines,
+			  unsigned int *offsets, int num_lines)
+{
+	int i;
+
+	for (i = 0; i < num_lines; i++) {
+		const char *line_name = lines[i];
+		int offset;
+
+		offset = gpiod_chip_find_line(chip, line_name);
+
+		if (offset < 0) {
+			die("chip '%s' does not contain line '%s'",
+					gpiod_chip_get_name(chip),
+					line_name);
+		}
+
+		offsets[i] = offset;
+	}
+
+	return 0;
+}
diff --git a/tools/tools-common.h b/tools/tools-common.h
index 5ed37dc05885..7affea436a60 100644
--- a/tools/tools-common.h
+++ b/tools/tools-common.h
@@ -32,5 +32,7 @@ int chip_dir_filter(const struct dirent *entry);
 struct gpiod_chip *chip_open_by_name(const char *name);
 struct gpiod_chip *chip_open_lookup(const char *device);
 struct gpiod_chip *chip_by_line_name(const char *name);
+int line_names_to_offsets(struct gpiod_chip *chip, char **lines,
+			  unsigned int *offsets, int num_lines);
 
 #endif /* __GPIOD_TOOLS_COMMON_H__ */
-- 
2.34.1

