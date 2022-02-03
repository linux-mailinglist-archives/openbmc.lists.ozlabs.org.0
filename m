Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0FC4A7EA6
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 05:25:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jq5Ds0Vlsz3cBr
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 15:25:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FadtJ/iF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=FadtJ/iF; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jq5B82JQlz3bZX
 for <openbmc@lists.ozlabs.org>; Thu,  3 Feb 2022 15:22:56 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id
 h20-20020a17090adb9400b001b518bf99ffso8866359pjv.1
 for <openbmc@lists.ozlabs.org>; Wed, 02 Feb 2022 20:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5PVlIDuR32Yssny9V5o6RCbIPPLetL5jRcPV3axjBDM=;
 b=FadtJ/iFl9d1vXIsllvJHcQ+98hjYr/bfpo6nTZ7eZtoKfljaum6vBsyQAl/sgraaZ
 6kzgx7Y1tN2gCRdM7x9yaqb8etk8fKN+g56y01l9hf5pGW6czQ3T4bPmWDprqPxl0vqg
 Z37aH4Nm5L6Iy4cOUClrl8NFp8RzsaCAeiQUTHqPqtdXF/esXUADKYDbBzeYiQwXHj5b
 vBICaihYReDmX0cJ3c5IW5bJUFS8dzDXSqYZ/TVYNxFRGXFpP8QLox6uaoDPsTo9qtBm
 44uPxuL88TJVqxWFE/yP6T4F3zb6gvpgANWI4Wy8eAIXQDPtHgh0zsqNaIRVuFDYKkbR
 QQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5PVlIDuR32Yssny9V5o6RCbIPPLetL5jRcPV3axjBDM=;
 b=QcFZ3JzULGqckKrRuh69E5Xn/CmCsbemfZ7ST3dA9WwxkSXyD2VlsR4GgI4BC/6ksT
 9Zg30zq9xkQr4FGsaFmZrejLk9EGXMzVqr2N38Nj7w87Yg0MHP2LPFMwQNQAFlDEdaBx
 o8KWv+XY+OJ0fL6BC/a6o/tQpGSUp/K6a/bnZm19VPa6mjWRIalOcSGAYwdey5umI0RB
 l2w0aZFPKgW9qGsFsBxAqBvPQa1tjYCYwtQIvAw1G0wrE0yqD9Fi9CFWDQbFN1jm9qSe
 kushqAcOYYLbV49t++oWTq2HZ9X59/3wi2wWBrQICY8z/yMrWzc9zufZQwQVG64/lV/f
 QsTg==
X-Gm-Message-State: AOAM533ua88q/qfcqnv4iXnZcLeA0ItFgVCGnijtJNKU9q6PHwHuVYI0
 71/oUMfjQPvoJ41QCeb28GrkZNTdC6A=
X-Google-Smtp-Source: ABdhPJzDyzOntRgxfZGjzfpNTZ4f1rNfATMaJydTkCGP7iQ/Vwud2/C3WFRnBoKj99iiR9Ih3/bXSA==
X-Received: by 2002:a17:90b:3803:: with SMTP id
 mq3mr11608899pjb.95.1643862174155; 
 Wed, 02 Feb 2022 20:22:54 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id mp22sm7814137pjb.28.2022.02.02.20.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 20:22:53 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org
Subject: [libgpiod PATCH 3/7] tools: Add value support to line name lookup
Date: Thu,  3 Feb 2022 14:51:30 +1030
Message-Id: <20220203042134.68425-4-joel@jms.id.au>
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

Add support for pasring the values as well as the name in
line_names_to_offsets.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 tools/tools-common.c | 51 ++++++++++++++++++++++++++++++++++++++++++--
 tools/tools-common.h |  4 +++-
 2 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/tools/tools-common.c b/tools/tools-common.c
index 958933ed6d51..586577566790 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -204,15 +204,57 @@ struct gpiod_chip *chip_by_line_name(const char *name)
 	return NULL;
 }
 
+char *split_line(const char *line_pair)
+{
+	char *name_end;
+	size_t name_len;
+	char *line_name;
+
+	name_end = strchr(line_pair, '=');
+	if (!name_end)
+		die("invalid name/value '%s'", line_pair);
+
+	name_len = name_end - line_pair;
+
+	if (name_len > 32)
+		die("line name exceeds maximum length");
+
+	line_name = calloc(1, name_len + 1);
+	strncpy(line_name, line_pair, name_len);
+
+	return line_name;
+}
+
 int line_names_to_offsets(struct gpiod_chip *chip, char **lines,
-			  unsigned int *offsets, int num_lines)
+			  unsigned int *offsets,
+			  int *values,
+			  int num_lines)
 {
 	int i;
 
 	for (i = 0; i < num_lines; i++) {
-		const char *line_name = lines[i];
+		char *line_name;
+		int value;
 		int offset;
 
+		if (values) {
+			const char *line_pair = lines[i];
+			char *name_end;
+			int rv;
+
+			line_name = split_line(line_pair);
+			name_end = strchr(line_pair, '=');
+
+			rv = sscanf(name_end, "=%d", &value);
+			if (rv != 1)
+				die("invalid offset<->value mapping: %s", line_pair);
+
+			if (value != 0 && value != 1)
+				die("value must be 0 or 1: %s", line_pair);
+		} else {
+			line_name = lines[i];
+		}
+
 		offset = gpiod_chip_find_line(chip, line_name);
 
 		if (offset < 0) {
@@ -222,6 +264,11 @@ int line_names_to_offsets(struct gpiod_chip *chip, char **lines,
 		}
 
 		offsets[i] = offset;
+
+		if (values) {
+			values[i] = value;
+			free(line_name);
+		}
 	}
 
 	return 0;
diff --git a/tools/tools-common.h b/tools/tools-common.h
index 7affea436a60..723999011733 100644
--- a/tools/tools-common.h
+++ b/tools/tools-common.h
@@ -33,6 +33,8 @@ struct gpiod_chip *chip_open_by_name(const char *name);
 struct gpiod_chip *chip_open_lookup(const char *device);
 struct gpiod_chip *chip_by_line_name(const char *name);
 int line_names_to_offsets(struct gpiod_chip *chip, char **lines,
-			  unsigned int *offsets, int num_lines);
+			  unsigned int *offsets, int *values,
+			  int num_lines);
+char *split_line(const char *line_pair);
 
 #endif /* __GPIOD_TOOLS_COMMON_H__ */
-- 
2.34.1

