Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 472D046486A
	for <lists+openbmc@lfdr.de>; Wed,  1 Dec 2021 08:29:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3rMJ0Z1Dz3bgl
	for <lists+openbmc@lfdr.de>; Wed,  1 Dec 2021 18:29:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pW1e1atC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=pW1e1atC; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3rLs5B2Hz2yPD
 for <openbmc@lists.ozlabs.org>; Wed,  1 Dec 2021 18:29:23 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id o14so16996987plg.5
 for <openbmc@lists.ozlabs.org>; Tue, 30 Nov 2021 23:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=34CQrpmObFWgYWG5f2qri0mSsV2E0kD3uAVNw6BDqHQ=;
 b=pW1e1atCcxz9t1vXRi5evKKKpGBg0v3+T63VK75k1RlczsnhiC65dWQoJRomhwR0UO
 eCTw425CD4zvMBDwFORqxowYtzVB5smpvxO9QVRhz+P/ODSdhvPBRhcQeBBxLta6Ei31
 c+ZiLt5ZOP1p97Lx6rjkFl8sqTopDgUnFQhtNckAa0XH+AsrUbk4fmV+ohsn8ucl1/qz
 MG4bzTw73SC/Gp+U6iuJR7/y6CmKEmDAwq2QCXLn3ls1ImliSs17GhiO1IXhftyM+0f8
 yC5ig/ox79ESxEXvR1oiOgrrP2xlyFXXvp71tWgMOwnBv4RGlwkdwrBsqv/oTzZ2VYeZ
 mx6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=34CQrpmObFWgYWG5f2qri0mSsV2E0kD3uAVNw6BDqHQ=;
 b=YF/D59d38/xfdjPdtcpJ5W6QAY3CbbN2q5cbILx5+30X8Ocxqqq+g9pZ54hQiloRev
 pRIU2NVfrXksfPRMHHHJBtBOgckxhA9SyOEQ9Sil5qBaR0zIGYM2AOWqLXL7AVYi4aJF
 yHezZ8FxulsHW5e+yeByYPYD5B0sbHxvh1eGkZMXP7+Ct7+X/Ffc8kUbno0oOQ2+aQGX
 LaEZ1pT2JR2LF4fc8k9UPxTiv6dMzRJ2qjQ8lfnEWPWV9d72V3sKfJlTXSNvFJjpkMvt
 Jg4580BOhdzjaTgFSGCslDTjaNQZgL02TlVOx6q/nPQO67dGKPR2VP25EeZHeF5dT1qL
 Pi8Q==
X-Gm-Message-State: AOAM533GbJIQNU4gc5f3KdblVsemDpODHm4vBUpBrd3xDGnzqyoC+A0i
 0OJTmhfINZ0sThYcQcivTZFCxIgt1MrlDw==
X-Google-Smtp-Source: ABdhPJyPyb5A+8RZ+Tax2bAYWkmMtMth2QaizTkRY/9CrizxLBWYcdGuFNG1FqbavZf7KxVWbo+XRA==
X-Received: by 2002:a17:90a:be0c:: with SMTP id
 a12mr5430527pjs.204.1638343761375; 
 Tue, 30 Nov 2021 23:29:21 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.19])
 by smtp.gmail.com with ESMTPSA id u22sm25438241pfk.148.2021.11.30.23.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 23:29:20 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: linux-gpio@vger.kernel.org
Subject: [libgpiod PATCH] gpioget: Add --line-name to lookup GPIO line
Date: Wed,  1 Dec 2021 17:59:02 +1030
Message-Id: <20211201072902.127542-1-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
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
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Systems provide line names to make using GPIOs easier for userspace. Use
this feature to make the tools user friendly by adding the ability to
show the state of a named line.

 $ gpioget --line-name power-chassis-good
 1

 $ gpioget -L pcieslot-power
 0

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
While users do have the ability to chain together gpioinfo and gpioget,
this is less discoverable for people new to the tools, and harder to
explain to eg. technicians, and requires more typing.

Please consider this enhancement. If you are happy with it I can send
a patch for gpioset too.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 tools/gpioget.c | 86 ++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 64 insertions(+), 22 deletions(-)

diff --git a/tools/gpioget.c b/tools/gpioget.c
index 51cecb6a18a9..cd27320b7f2b 100644
--- a/tools/gpioget.c
+++ b/tools/gpioget.c
@@ -6,6 +6,7 @@
 #include <limits.h>
 #include <stdio.h>
 #include <string.h>
+#include <errno.h>
 
 #include "tools-common.h"
 
@@ -18,7 +19,7 @@ static const struct option longopts[] = {
 	{ GETOPT_NULL_LONGOPT },
 };
 
-static const char *const shortopts = "+hvlnB:";
+static const char *const shortopts = "+hvlnB:L:";
 
 static void print_help(void)
 {
@@ -34,6 +35,7 @@ static void print_help(void)
 	printf("  -n, --dir-as-is:\tdon't force-reconfigure line direction\n");
 	printf("  -B, --bias=[as-is|disable|pull-down|pull-up] (defaults to 'as-is'):\n");
 	printf("		set the line bias\n");
+	printf("  -L, --line-name:\tUse this GPIO line (instead of chip name and offset)\n");
 	printf("\n");
 	print_bias_help();
 }
@@ -47,6 +49,7 @@ int main(int argc, char **argv)
 	struct gpiod_line_bulk *lines;
 	struct gpiod_chip *chip;
 	char *device, *end;
+	char *name = NULL;
 
 	for (;;) {
 		optc = getopt_long(argc, argv, shortopts, longopts, &opti);
@@ -69,8 +72,13 @@ int main(int argc, char **argv)
 		case 'B':
 			flags |= bias_flags(optarg);
 			break;
+		case 'L':
+			name = optarg;
+			num_lines = 1;
+			break;
 		case '?':
 			die("try %s --help", get_progname());
+			break;
 		default:
 			abort();
 		}
@@ -79,30 +87,64 @@ int main(int argc, char **argv)
 	argc -= optind;
 	argv += optind;
 
-	if (argc < 1)
-		die("gpiochip must be specified");
-
-	if (argc < 2)
-		die("at least one GPIO line offset must be specified");
-
-	device = argv[0];
-	num_lines = argc - 1;
-
-	values = malloc(sizeof(*values) * num_lines);
-	offsets = malloc(sizeof(*offsets) * num_lines);
-	if (!values || !offsets)
-		die("out of memory");
+	if (name) {
+		struct dirent **entries;
+		unsigned int num_chips;
+		int offset, n;
+
+		n = scandir("/dev/", &entries, chip_dir_filter, alphasort);
+		if (n < 0)
+			die_perror("unable to scan /dev");
+		num_chips = n;
+
+		values = malloc(sizeof(*values) * 1);
+		offsets = malloc(sizeof(*offsets) * 1);
+		if (!values || !offsets)
+			die("out of memory");
+
+		for (i = 0; i < num_chips; i++) {
+			device = entries[i]->d_name;
+			chip = chip_open_by_name(device);
+			if (!chip) {
+				if (errno == EACCES)
+					continue;
+
+				die_perror("unable to open %s", device);
+			}
+			offset = gpiod_chip_find_line(chip, name);
+			if (offset >= 0) {
+				offsets[0] = offset;
+				break;
+			}
+		}
+		if (i == num_chips)
+			die("unable to find line '%s'", name);
+	} else {
+		if (argc < 1)
+			die("gpiochip must be specified");
+
+		if (argc < 2)
+			die("at least one GPIO line offset must be specified");
+
+		device = argv[0];
+		num_lines = argc - 1;
+
+		values = malloc(sizeof(*values) * num_lines);
+		offsets = malloc(sizeof(*offsets) * num_lines);
+		if (!values || !offsets)
+			die("out of memory");
+
+		for (i = 0; i < num_lines; i++) {
+			offsets[i] = strtoul(argv[i + 1], &end, 10);
+			if (*end != '\0' || offsets[i] > INT_MAX)
+				die("invalid GPIO offset: %s", argv[i + 1]);
+		}
 
-	for (i = 0; i < num_lines; i++) {
-		offsets[i] = strtoul(argv[i + 1], &end, 10);
-		if (*end != '\0' || offsets[i] > INT_MAX)
-			die("invalid GPIO offset: %s", argv[i + 1]);
+		chip = chip_open_lookup(device);
+		if (!chip)
+			die_perror("unable to open %s", device);
 	}
 
-	chip = chip_open_lookup(device);
-	if (!chip)
-		die_perror("unable to open %s", device);
-
 	lines = gpiod_chip_get_lines(chip, offsets, num_lines);
 	if (!lines)
 		die_perror("unable to retrieve GPIO lines from chip");
-- 
2.33.0

