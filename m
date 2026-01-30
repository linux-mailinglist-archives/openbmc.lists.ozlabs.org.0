Return-Path: <openbmc+bounces-1302-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eInFATIVfGn4KQIAu9opvQ
	(envelope-from <openbmc+bounces-1302-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Fri, 30 Jan 2026 03:19:30 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B808B65D9
	for <lists+openbmc@lfdr.de>; Fri, 30 Jan 2026 03:19:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2KT84J76z2xl0;
	Fri, 30 Jan 2026 13:19:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769739564;
	cv=none; b=JT2+o3Wfr45o6IAsMjUXNOOKairbzy+cFY2jKbK1j2TCHLy5DK2OS/HyyOJ3gUWKBRcj1nToH4YzncfRhKdIJnpP08wQ+jwWW7DwJH2CxeC3nmGC5K3YfctOHtjQPRE6RIwf//rEE11iuxlMV+sB5TCSVo4HA+Gtg0JP7U+GwGmOgkdiNuHUgOkL4yAG7dKROYBc5xZgbfVFK1AQYTIpriYxZttfC4hySL4LV4Ldw3wyyNmalZ7eEw1wY0RUbmfy7rvUrbBzcjyUcj0VVqrVcNn8q7VnALzeFu5FiDQJCa3tZYFRQWE8f/afE3lzmYuE+m2U8R3b9G6DWJ0rcCWBIg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769739564; c=relaxed/relaxed;
	bh=ODF3pkf3MPuGaUsYyV7diAAf1LvjdBQFXn2ZphaGvPA=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=VijmsAiloQVmRQetlxgKRyx9vVMSGMiseznyPHWn8EkoRmziRSU8jDpc8TlsxnrMA5zs+AqYOAu2EdGgzqve7CL2TfBmLJ7N5GuAiO+WaukccvlrV4Bl7BBfjwoiMpAUHs3MXsH7vJYQOt/Ryylo7hTXfVUrxPTt7tvU473GtV+bv2ptSFqagTPMmyfPTSUdBt/WqWKP47Yab9aGUt/TW1jUoiD6CLC8l8SSqdKcXJuoArXGaXgyOiCEXRPhnYMNqBw83RlYGOWw1wyU7wn51zUoHftObYImXZn4HVctiZTE1PQN07jm66jbQgjHSvFsMcvgdZyUBK6iyZwWEdo4Dw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jesfBjzm; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jesfBjzm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2KT747N8z2xS7
	for <openbmc@lists.ozlabs.org>; Fri, 30 Jan 2026 13:19:22 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c626bd75628so568156a12.3
        for <openbmc@lists.ozlabs.org>; Thu, 29 Jan 2026 18:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769739559; x=1770344359; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ODF3pkf3MPuGaUsYyV7diAAf1LvjdBQFXn2ZphaGvPA=;
        b=jesfBjzmqLhW9r2zKbciwb0gUpqfd5pE9vt565pnmKzdrhr2lzmEmhb9rg+/Mkt2Vz
         ai+KHvl7qu1U7RTXsBkyasVzqTroOWRf7p79Vy0tiok/zRK5TtKcop0+lyty79/unCL5
         Tu4xNd6fJw9T3OZk8Nr/2ylEVTQNoPIXUdjwsP+BhORqWMp5hqOsP3sKJncB9aWMSRy8
         xDv4b+gtIIguNZhtUqGAjb6Bfu9IOEx10xSso2CXr8Y02BAvRbRw4IzhE7GEwjpdSSfs
         8DSq/eou8s7oq5DIlcE0nuD3WkjBPA/12dnBlXjTVSd4JGEMdVmY6Hc3vom+Pm8ITxHY
         MysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769739559; x=1770344359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ODF3pkf3MPuGaUsYyV7diAAf1LvjdBQFXn2ZphaGvPA=;
        b=m3thlQFZ5jhzMxKM3/CVwW9RB15AWGYcrQgbM8ymoMVPbTnKxk41Z1m4dptQi9Ju+7
         ZdtJk2Am3/1Lcq1A221U0lbhrPzOblJrVzjYkO5RVsJVugtlyvIOrEdVfty4MNOLDEmQ
         D8t81v5kUOMiCk8oMKixbwUYPC0yYT+CW0cgX0G5bfnObwsuOxi+liEtpghkEE28fYwu
         QVcvaWx4h9MU0dPwgeTSzILhabPFgRVtGCCdYpqAewsHADmWgVP9mdJJbnSbgCTy4TZq
         Z84ipdDowwF8I+HEy/Pl1qVdoSVInKDkgpueA8STgyvYVo1uPgdzCj2R1Am9xJez8hLH
         yg4A==
X-Gm-Message-State: AOJu0YxnfxX6QWbDfhWLk/SOR6MUGyDzK5NXcMn4oSXtuoAJUh47ez1V
	fSBZ7GhC5aeZD2BZuN705AchYs18hlEoP6+WETEtTVXOg6erTh7XEXI6R+ABKg==
X-Gm-Gg: AZuq6aLo///9iyaq1vDqitfPT9tZZCOAoC/w3m3SiPGEPsATgguNRepJNiJpIVLL9fP
	IDSn9U25gPOyj3+Lu7nMJKzyoJUEcnEvaTimJ3Oww6DHj+bXI7atbUbWcqXbeYKpqCnb1X1pDiU
	WQi+VgAPsZ3dmnrlc837QPTnfS8bRW81otVM7m2QmtjvdqJoQpKtB0DuHdXEOynlu+LE5R+4gQT
	k9daY1EmxlkqPU49692XNLH7NZg0NvjuvastRMDPafzfdag0P84CXbGmS44QGzgmw7YceZ+NR7/
	g8CVlucm0XJ/79OnxRhVFnzIvuCFEA+C+svdbf6PXyOXRasmPkLmtJOX0PbtlfNuX/jQE9IpPVe
	Lm2sX+PllqCMY/9YBJH8C4G7L5LsRbdUTNmyX2ZbXd1TRh3ZpvCHVtFw/VTaT1dfpAoM+v8XkXM
	XU8SCJaiZaSPRPi04mhucOz/XD5khmbjcLH+Afa6ZLueEBBJdt+7lJng5cRGjZnwc=
X-Received: by 2002:a17:90a:d40f:b0:340:bb64:c5e with SMTP id 98e67ed59e1d1-3543b32dc40mr1375394a91.14.1769739558594;
        Thu, 29 Jan 2026 18:19:18 -0800 (PST)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642afbeaf3sm6018082a12.33.2026.01.29.18.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 18:19:18 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Subject: [PATCH linux dev-6.18 0/2] hwmon: Add support for MPS mp5926 chip
Date: Fri, 30 Jan 2026 10:16:59 +0800
Message-Id: <20260130021701.2357288-1-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.70 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1302-lists,openbmc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FROM_NEQ_ENVFROM(0.00)[potinlaipt@gmail.com,openbmc@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[openbmc];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 0B808B65D9
X-Rspamd-Action: no action

Backport mp5926 driver support to kernel 6.18.

Yuxi Wang (2):
  dt-bindings: hwmon: Add mps mp5926 driver bindings
  hwmon: add mp5926 driver

 .../devicetree/bindings/trivial-devices.yaml  |   2 +
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/mp5926.rst                |  92 +++++++++
 MAINTAINERS                                   |   7 +
 drivers/hwmon/pmbus/Kconfig                   |   9 +
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/mp5926.c                  | 183 ++++++++++++++++++
 7 files changed, 295 insertions(+)
 create mode 100644 Documentation/hwmon/mp5926.rst
 create mode 100644 drivers/hwmon/pmbus/mp5926.c

-- 
2.31.1


