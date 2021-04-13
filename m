Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5573F35D9B0
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 10:10:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKJFs1qcVz3c0Q
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 18:10:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=AEo6qinq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AEo6qinq; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKJC04zgPz3bpj
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 18:08:28 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id
 ot17-20020a17090b3b51b0290109c9ac3c34so10279298pjb.4
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 01:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zcxRwTfOYx8OsvJgKyUlH6Be0hnm5pKMSxmuZtlRHdc=;
 b=AEo6qinqOvUczOC6xnV72nzoqsB3HK3Ce5dlhtq4vb8QurJU08LREfYUGF9cFy/B3/
 3qxynYU9FL6UbcCkSLjgbzqLTbFXGiiwpbxJ8XV3ZfQCZWAsiFZFeUswfIS6v6cvRy7B
 XJK0W5zerh2CgdMypS8YP2b6WpPpG+hQ847932ePNuwkJ84xXdJ+IMxGMUVW7i9VO5Dr
 5BsD3jPaCoephpKRyYXwBGkSwyfqPXQQ2m7mrLZdOimiv8NdUZS2jRvqa1g0FjxejgfQ
 vsgV5wjjaS0ADfkkZVGxyV42al6ez08B8es1xflwn/R6yxQnQqn3QT4wS8+q9VtoRI0C
 CwGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zcxRwTfOYx8OsvJgKyUlH6Be0hnm5pKMSxmuZtlRHdc=;
 b=PfES8gcCL+ASbNmha+T94Kys+NrKEWLrDBEWeFcNm0fR4apTmDa7kHABRpK57Kou2M
 gugLRpEmLKqcgY3F7Xl/NKVelIhpXgRyZIkdaey1r8qYmOqqVCpXoUJJ61sO5/DP47No
 Pfv1mfLNhnRP/jGOWxc+vlUg3eCRACR9kc9rn/7/+FvCvYXL8WPLXPwmhOi4gpaKcvck
 ObiBR6/wFetKD7815U/rlKLgYXyqLSYrYV1aTOll1f6uGXhwKIZ/piFwiXYfluunEzt5
 o+8al8jyfIV6xoZTVL7jCbKzQiGX3srnzWaBSPbG/G+4LEMvCRsUaLROmI0VbPWdffqa
 rXww==
X-Gm-Message-State: AOAM533SEEZEoph7j8U6P+9hvzSPQVleGxEeiJBLvLfSsi7fIijYpdWD
 SfgRcIi+8mPvPi7g0Qf6xezSmA44jEI=
X-Google-Smtp-Source: ABdhPJwUX8FkbBjfgA8fz2a3um0ykjr+UA7j18rmn08FsMyiyGNW/KiUecUcReDMPa5IVwTUh/8b8g==
X-Received: by 2002:a17:902:ea0d:b029:e6:f01d:9db5 with SMTP id
 s13-20020a170902ea0db02900e6f01d9db5mr30333858plg.60.1618301305908; 
 Tue, 13 Apr 2021 01:08:25 -0700 (PDT)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id nh24sm1443507pjb.38.2021.04.13.01.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 01:08:25 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 06/11] image-fit: use hashing
 infra
Date: Tue, 13 Apr 2021 17:37:50 +0930
Message-Id: <20210413080755.73572-7-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210413080755.73572-1-joel@jms.id.au>
References: <20210413080755.73572-1-joel@jms.id.au>
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 common/image-fit.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/common/image-fit.c b/common/image-fit.c
index e64949dfa73d..b9c3d79b83e1 100644
--- a/common/image-fit.c
+++ b/common/image-fit.c
@@ -1135,9 +1135,22 @@ int fit_set_timestamp(void *fit, int noffset, time_t timestamp)
  *     0, on success
  *    -1, when algo is unsupported
  */
-int calculate_hash(const void *data, int data_len, const char *algo,
+int calculate_hash(const void *data, int data_len, const char *algo_name,
 			uint8_t *value, int *value_len)
 {
+	struct hash_algo *algo;
+
+	if (hash_lookup_algo(algo_name, &algo)) {
+		debug("Unsupported hash alogrithm\n");
+		return -1;
+	}
+
+	algo->hash_func_ws(data, data_len, value, algo->chunk_size);
+	*value_len = algo->digest_size;
+
+	return 0;
+
+#if 0
 	if (IMAGE_ENABLE_CRC32 && strcmp(algo, "crc32") == 0) {
 		*((uint32_t *)value) = crc32_wd(0, data, data_len,
 							CHUNKSZ_CRC32);
@@ -1167,6 +1180,7 @@ int calculate_hash(const void *data, int data_len, const char *algo,
 		return -1;
 	}
 	return 0;
+#endif
 }
 
 static int fit_image_check_hash(const void *fit, int noffset, const void *data,
-- 
2.30.2

