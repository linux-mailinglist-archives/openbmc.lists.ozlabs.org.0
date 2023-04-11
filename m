Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFFD6DD103
	for <lists+openbmc@lfdr.de>; Tue, 11 Apr 2023 06:36:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PwY2x4kHyz3cT4
	for <lists+openbmc@lfdr.de>; Tue, 11 Apr 2023 14:36:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XTFGEbEA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=timlee660101@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XTFGEbEA;
	dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PwV8R4nlbz3c83
	for <openbmc@lists.ozlabs.org>; Tue, 11 Apr 2023 12:26:31 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id d22-20020a17090a111600b0023d1b009f52so9434602pja.2
        for <openbmc@lists.ozlabs.org>; Mon, 10 Apr 2023 19:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681179988;
        h=message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OOrwJ8ghRFISBlNXfV14EO4Es76TzFfzoWxrMgEV19Q=;
        b=XTFGEbEAgE+7btTEk5hkOFQLxp1n7sWb5WAeWP2fGJZZ4wQIaSwCH094P8jp/mXr76
         WNjDk5FKW9Bz6Aqsl8nY8HtCzWOqTEuFAXCUi8xBTQKoWrhVu8pv+6jd/SP5Gm9PS5V6
         VdasMG2Y1YTitM8V4M9kklPLQG/DX7nomTJUFz3pbu+xyeHkXJQ7kAgFzrLyJ9NNqPxy
         Rc0tPoT8F1soTfAN7vvWL7bu5DiZ5e+N0LkgFLPuXatqpDgtwqNMJG8RK4Dl0lVqUBm0
         BiRFhjmBVnsNWoyhSoP4yrEbkQsqksliY30o2nQtgC5L5vn5I9HF0WacSClOh6U622cR
         5OOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681179988;
        h=message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OOrwJ8ghRFISBlNXfV14EO4Es76TzFfzoWxrMgEV19Q=;
        b=kFvpnJrDGjGuPifiFDBoSIi5RBKqiWCYYQ3xosVcGRKuw5Cejh3n1ajMMlem9GJaG1
         /agpL1RpOkFZP1ls1rPE9hUYqvz9DtJ9EhYBQ7HA+WYIrdLUh1SqkN44FjiaR4WeOUiF
         My1VF0Ito2x9eWCGZrJUDFLfLsLo7h+SrWjXy0CZIDFjR+Ky37XlGBp34L21AeBND3Ju
         0T/+91w+6uSkpjt4ymtXruggPcqg9P1xGhvKu7T6aUuVRHVq90X+idwMSYzf5xCXKCPT
         O1KNgoaxoH60FBoKc4NREe6pYLHC6c5GUwTQPzt0nRr1KS8hjL5VsiQW/SzjBtuTRLLM
         yFpA==
X-Gm-Message-State: AAQBX9d1LY61IGVfQ+tD8SfvrVvMMJj8f3bMfX+7XDX4Mc2EOsdd9RdL
	JZzg8TpJXkedN8+iOO9sBKG3sA0XgRZCYw==
X-Google-Smtp-Source: AKy350bHdWswkXHIt4p154ZhsyuYYVzn9J0013fxQlkWaSDv/OioR12yFJAa7VfGssFeL3TF5kWOHQ==
X-Received: by 2002:a17:90b:4a86:b0:23f:b35a:534e with SMTP id lp6-20020a17090b4a8600b0023fb35a534emr16834065pjb.29.1681179988351;
        Mon, 10 Apr 2023 19:26:28 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id t23-20020a17090ad15700b0023acdac248dsm8134384pjw.15.2023.04.10.19.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 19:26:27 -0700 (PDT)
From: Tim Lee <timlee660101@gmail.com>
To: timlee660101@gmail.com,
	chli30@nuvoton.com,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH u-boot v2019.04-aspeed-openbmc] tools: env: use /run to store lockfile
Date: Tue, 11 Apr 2023 10:26:14 +0800
Message-Id: <20230411022614.23046-1-timlee660101@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 11 Apr 2023 14:34:44 +1000
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

According this issue ppp-project/ppp#339.
Eventually, the dt-utils changed lock directory to fix missing /var/lock
directory error then make dt-utils can run normally.

We also have a similar issue with these two utilities fw_printenv and
fw_setenv will failed when the directory /var/lock is non-existent.

We have a custom linux distribution built with yocto (OpenBMC) that
use systemd and it deprecated the /var/lock directory.
More discussion in systemd/systemd#15668.

Thus, we sync with community's solution for uboot/tools/env utilities:
The current location /var/lock is considered legacy (at least by systemd).
Just use /run to store the lockfile and append the usual .lock suffix.

Tested:
Verified /run/lock is now present and fw_printenv can work in OpenBMC.

Signed-off-by: Tim Lee <timlee660101@gmail.com>
---
 tools/env/fw_env_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/env/fw_env_main.c b/tools/env/fw_env_main.c
index 26ba6624cd..4c84b13cfc 100644
--- a/tools/env/fw_env_main.c
+++ b/tools/env/fw_env_main.c
@@ -72,7 +72,7 @@ void usage_printenv(void)
 		" -c, --config         configuration file, default:" CONFIG_FILE "\n"
 #endif
 		" -n, --noheader       do not repeat variable name in output\n"
-		" -l, --lock           lock node, default:/var/lock\n"
+		" -l, --lock           lock node, default:/run\n"
 		"\n");
 }
 
@@ -87,7 +87,7 @@ void usage_env_set(void)
 #ifdef CONFIG_FILE
 		" -c, --config         configuration file, default:" CONFIG_FILE "\n"
 #endif
-		" -l, --lock           lock node, default:/var/lock\n"
+		" -l, --lock           lock node, default:/run\n"
 		" -s, --script         batch mode to minimize writes\n"
 		"\n"
 		"Examples:\n"
@@ -205,7 +205,7 @@ int parse_setenv_args(int argc, char *argv[])
 
 int main(int argc, char *argv[])
 {
-	char *lockname = "/var/lock/" CMD_PRINTENV ".lock";
+	char *lockname = "/run/" CMD_PRINTENV ".lock";
 	int lockfd = -1;
 	int retval = EXIT_SUCCESS;
 	char *_cmdname;
-- 
2.17.1

