Return-Path: <openbmc+bounces-2-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FD7A93B72
	for <lists+openbmc@lfdr.de>; Fri, 18 Apr 2025 18:56:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZfLWf0lWpz3c4h;
	Sat, 19 Apr 2025 02:56:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744995390;
	cv=none; b=Q7USe5F1vee4cykLTPaY6vSAwGBL132CAlJQE4Z3mj+ZPww1ImNlYMsMm8gq0J2p6bIrAj7b8DwzD8DbGeF7MWPT8p5dSKYexiflsUNGYBbnQpw1olWg6fNmabPnkh1FrZGgBQ3czk3xLtwiRIh4cuSlCHQoRTra4CBLZbc4R/fwUTM6GFBgUoNRWnHijUDfBOLj+brLFna7F4wZLwv4aMmS61TNdqAGGnj99gSc6aof34J4HWNT4xwuSMUVmxJVXcKoxRUq1nIR+/cp5eIZhySi+u5Q16tc5UTXA27XUefLTbJAm01fHeDSsHfJOm840WAtAH/VlNZql7gQinOpAA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744995390; c=relaxed/relaxed;
	bh=edI2SPxJ8N9m2qX+KMhS43E5/2QSd6DyN6Tj+GYLsbc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k3ZKCQ5+VqGTNLQyQv5yLo5tdK7xnoNMnA3j4YTjisTjMPBn5pSjnSSKooerPypUUm3f4cj14lr1DyaZb+zMs4vz9ISkezjE1KtgzwvRJBb0FoqTHcwuzi2WtSsjoUIGGRG+0jK7NA6dpQrnMNpQS5JjN9yH2CsEQDMD1FRzg2sMNmHWGRT16aGqMeIr4nd3N3K5qS+tB6qW1ZChAw1jBI4fnM5/aH/Z3KonOWOFbA6pjRnQoFtqeitwGX8yNSbNQSd/uAsBCYyThgs2v6NwfVgxpVS1Z+gsns2l3MYKOgmezpCdI7mhqfsXWYbVekLXfmkLFhtwl7VfOr6Ipvj0jw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PeSsS7PL; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=nguyenthaithuanalg@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PeSsS7PL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=nguyenthaithuanalg@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZfLWc0zw1z3bxM
	for <openbmc@lists.ozlabs.org>; Sat, 19 Apr 2025 02:56:26 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2241053582dso29660595ad.1
        for <openbmc@lists.ozlabs.org>; Fri, 18 Apr 2025 09:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744995382; x=1745600182; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=edI2SPxJ8N9m2qX+KMhS43E5/2QSd6DyN6Tj+GYLsbc=;
        b=PeSsS7PLFz4GgyPAM+FV515NJKfSe/r3uLTxD/KeMqr9RcoTl6/xpzD8ziFV8tYXv+
         caeWHTPWpVYNlJf8Zrf7x/D6cWJy8hiKdSpQCQcwjeGEehPf1NQ4Oq+TTx7nEzidD232
         ySRSqg79StTn9Y5ZsoNYo4LqGQWQrzNbsyxEfwUP/1h6CjPNpO0RRgegVemxndfMtTZP
         N2r4pXAbrMrc32+uawG8t88GpGssHz+XfEdZ4s6aAhIwHPw6i6hN2+gD4YSlGpKaLCei
         qQXWN4rs41T9SO5AqzSszbd4a321srfSCKegrTOtj1oyEatkj/UR52iie0gL0ELNjCIK
         PVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744995382; x=1745600182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=edI2SPxJ8N9m2qX+KMhS43E5/2QSd6DyN6Tj+GYLsbc=;
        b=RKJN9pJ3ZNck/o744DjIggHQ18XLk24wDZavv4+Y8oYCFB0+abZfrT/fsQ9Q8c6y7y
         nGeLTBorDQ7KHrMJ1gwc4+VeQHOJ7sDoONGBqaaN+tlPTXJ0GXTn0fDajmxAaTb70n1v
         BSdoKzaOg6+KZ0nEyigHVHKKBpenT6Ilp0EzoZLH2psgKQYUbqaodhVmY7rxeIwy/Vr4
         l/VxVb4UhW6nzthdBTIWsxdD0K5fCX/NEfO2K5Y8zTo/sjh1CfyvDVD+HQqyyWjYBFMs
         BGGOQCkusJ8Ssc8tzfc/0UB4yaW/QtJxwcq3gBBvA9uUshdViBheI+OO/x0KdQd4zdid
         Lqmg==
X-Gm-Message-State: AOJu0YxEXx4RyqztJn/X6Me+wwkA64KrlDjb5AC+C5YHB0Ezj3ZAEnTB
	MGkx/2aOLP1xpepcH4tcpw32ORhw6c4aBO1VoZtLG/9WTgFGIiG7qrvSAISi
X-Gm-Gg: ASbGnctZr5kBL85gpEWUW+4GkgvYj9gWcHxVmSqzUxtyHIc+UJTmUDNKLgR/Dr1kJdg
	Hy9tDwh8EyDdG+FFIghLZqyVJt9pu+6dQ485Urw2GP/QmbIxBHrY5XtZOF7aK3E7PQ0K4+LSUGw
	fDizahyTfiwSTpcEbzcNDdp8U4sWwz0UmjhXfCAr9iPymnQCLsAF5cWvCHzEAYOUQPoQOUcU4R5
	XJp7+ogYkiMPQQmngdQSvtdZJ94m0fZ2e4rGu2TQ9DZaqu1tPM+Lmu92FlqBsTexCAfESNXTi/i
	vlzAe7eyvTiKJA60MVv++R2J0KoR18+5dSg3cD99rKw0ngyYJ4rpyNIv+VmFhoubfW2ClUCc/HE
	0svI=
X-Google-Smtp-Source: AGHT+IGPZgtOqvphA8RrOot9M5Ns0wbot7/4fvz9fJHiSB7EUGk+GIooP5ofgRaWbY2V+s/u0DxyjQ==
X-Received: by 2002:a17:902:d58b:b0:220:c86d:d7eb with SMTP id d9443c01a7336-22c5360454cmr54523095ad.36.1744995382335;
        Fri, 18 Apr 2025 09:56:22 -0700 (PDT)
Received: from localhost.localdomain ([2405:4802:90d4:ea0:76d4:35ff:fe85:dd7a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bf6b72sm19146445ad.103.2025.04.18.09.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 09:56:21 -0700 (PDT)
From: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
Subject: [PATCH] libsimplelog-challenge: Add C89-C++20 logger
Date: Fri, 18 Apr 2025 23:55:52 +0700
Message-ID: <20250418165558.47193-1-nguyenthaithuanalg@gmail.com>
X-Mailer: git-send-email 2.47.1
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

1. Cross OS
2. Apply for both threads/processes
3. Simple, stable, powerful for million/billion of records.

Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
---
 .../libsimplelog-challenge_git.bb             | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-phosphor/recipes-phosphor/libsimplelog-challenge/libsimplelog-challenge_git.bb

diff --git a/meta-phosphor/recipes-phosphor/libsimplelog-challenge/libsimplelog-challenge_git.bb b/meta-phosphor/recipes-phosphor/libsimplelog-challenge/libsimplelog-challenge_git.bb
new file mode 100644
index 0000000000..0a4168e551
--- /dev/null
+++ b/meta-phosphor/recipes-phosphor/libsimplelog-challenge/libsimplelog-challenge_git.bb
@@ -0,0 +1,20 @@
+
+SUMMARY = "simplelog-challenge - Simple, STABLE, powerful of logging library in ANSI C/C++. Ready for billion records."
+DESCRIPTION = "Async and Fast C/C++ multi-thread/processes logger with topics. No external dependencies."
+HOMEPAGE = "https://github.com/thuanalg/simplelog-challenge"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22cdd382a6275cb4c2e75c517952ac7c"
+
+SRC_URI = "git://git@github.com/thuanalg/simplelog-challenge.git;branch=main;protocol=https"
+
+PV = "1.0.1+git"
+SRCREV = "a920ed722ac05644c318c6db459a8fce68377d05"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
+EXTRA_OECMAKE += "-DUNIX_LINUX=1"
+
+
-- 
2.47.1


