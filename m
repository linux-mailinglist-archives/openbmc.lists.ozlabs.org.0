Return-Path: <openbmc+bounces-207-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2FBAD9908
	for <lists+openbmc@lfdr.de>; Sat, 14 Jun 2025 02:21:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJxlF1FByz2xS2;
	Sat, 14 Jun 2025 10:21:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749860489;
	cv=none; b=b+DP7lwUomRdmb5/zYjB1FaIF65MvPdrhwgxbjrh8NQ4jBc6oopjvBqL2yE1OKCXJjJ9ArBruA2q3OuhYO1sajtbBmLLpBxtQKuvTXX31jdwgI3GRM7PO8CsKgCj7TOl14vMl150RYZVu1SdbIO2i0+Vy+SaMBUzDPTsA1YLLr4eGxErX3qgVMzihUjWu8cgPGBsNB+3+qYXbDva+CUCSZppyQoQ9cOQGz6RkYWtdQc2RPxvuVjch7iGp0jVRwDPEPGXSTAgg8cT4T/Oiaty5patHEGS6S2j4GXvhT1rlFFvDwiGcjJiTnTEHUmt3uLVLcNP9CMryNbCTtB2C73DDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749860489; c=relaxed/relaxed;
	bh=4KpE7mqX01OQ4tTEGKDRySNN18UfM8sK7vL7/fO0KAg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T/AfQWJ/EBZO1oxZUmvjHAoEKKYT+FUBzowakn6DeyJuvkKVMWiY3EWg2MA038sm7kN39nTvMXwWAEOF40pA1bTCGGwn+BcApS5VvQZ48u0N+FmxT9vwf3CWvm+Wurd2Fy/1/7QVNqc2qIdCX0rJoW/EcHrIoWWt1Zwp+vdNZAgDvJT2CK+yR9I6O5X4FJ4qESLspV+k0fFgDU9hlMiNdyVEyfg3bNo+4DICEAfHFU8cBpxnAMz/cRU96jKtSPw70pkcQvphkhQUC+E2lWBY67mnadoVbEHh2rkDNWLth8CZGtl9UYj85Lyv0J3W3DKC7ZDtUg80eQmVxRX8re6g/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=G6EEaul2; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=G6EEaul2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJxl75dTGz2xHp
	for <openbmc@lists.ozlabs.org>; Sat, 14 Jun 2025 10:21:22 +1000 (AEST)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b2c2c762a89so2235167a12.0
        for <openbmc@lists.ozlabs.org>; Fri, 13 Jun 2025 17:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749860480; x=1750465280; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4KpE7mqX01OQ4tTEGKDRySNN18UfM8sK7vL7/fO0KAg=;
        b=G6EEaul2+X73KOHf8JWkibIdcEFXa6Ina2tqeZIehGh1J18f90gOaGTaF22rNeFlJ4
         JApaFUplzfh/+OZp0voAA/Fpa9IRxfqrJKPnsEznLQx3fi6z61UdRsrzytRWCqP4PYp1
         BINbjmWR+0A0rnITq+/p1nn4S0WIfVY6Biu7kPi0bQ+T/eypQV1bQ13CjMe66F0xP3Ta
         5gy3DMbBojXt4xVwPsoAHj2ja0Q+X+H/sHLPC3dqEzEf/hsPxteyxzopOclaHR/N0JzQ
         4lDzGMW4DBhb+ntjT5lrdmRe+OP6hiegJjy4C5Xjjg/CUvKOXC/X2ICtk9ZDSJM3n9ei
         nJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749860480; x=1750465280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4KpE7mqX01OQ4tTEGKDRySNN18UfM8sK7vL7/fO0KAg=;
        b=WGEmCFK8LZaeKNzk3p9qPJbDhUGG7ok8UDc1CbE5GnwikJE3UcBGPROaoyGyRfk14J
         xjYzzMkhX2xCRYOqXXdVzUANDTiC9ATijPQZCv2TKb9VMEfyYdk4C8AwoQYQqFBVEnut
         yA6lp+XHACkfR7Ia3fs+rhJCAUR++52zUj2hqYbprDFuSd96tEtCEym/3O0q0ZfwEv3Z
         ScTZ4tlhvzMmzMV66FvHbnBUzDF4qJJOw4NvWgDWaTwYoO8+bKIeb93fskP4H/X8NBkf
         iJ9PcUTrULOAtVIKAOnLWPj8aA9E0jUVuPLoOdhMGj7WyfGq4hOay6s2ntiVWikEpdQZ
         yxGw==
X-Forwarded-Encrypted: i=1; AJvYcCVOzZs/+70gR4U6sS/ae3eA3IqX1hUUqNEXFJQhGNwUy04sCCePEFTT5tzjDj/l6uGE7ag8ov6n@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzBR7A8QV2fT24pN7SjfiSA9RSqrkAIzl5a8mkbnjB4OwBf10Aa
	xOV57hqpub+QzKbe9Ye6F2IN8nQlRJGyshiH5B8pT3mRg/Hl5PGF5R1G+r469qWV
X-Gm-Gg: ASbGnct+1ulBFstU1t2A/nLmYcc6uwkU2NzeMU+G0gEppGfT6fdQhtdQij8DJOschSB
	zCgfrT3jYZ7hQaLpRdhlgqtrf8GB4O9g/rq6iaK0/bnQ2+sFUh25FZdKpX6RyNtCrKN/RKJSkYL
	NEZCKc8KXTjWfb9dTWIhabB05nDzd8qRPWaq6F11a5RPXewXIS3BPDTA478fqmq784Ozi9+TnoU
	YXA418s2bB/ife6THQqcXfM4wxhrH0dDJwzQP1whM3z9Urp85sWyKP7seMFLmQ8Prb+pX2KhpXM
	arJIUjBtsFgekU+l8LK0bLehfOeD5XgCiZrFjy06ztwlmu0Vd1HkSByCzS4gxwQvEihDb5ctMCz
	ymzooxME9uwCnb4dcVOnchj8CfUwnBDjxbJPewW+GdHEVd75nEOW4u4jwFQGwCdPRy9+dHwRNKw
	==
X-Google-Smtp-Source: AGHT+IGp4/z/BwS4nM8dhRJXQnccY9Uhx+qdXJXD+is5olC2SGI6UEyGfu5vrUYi4iW9IHbYsvLhzA==
X-Received: by 2002:a05:6a20:7343:b0:21c:faa4:9ab8 with SMTP id adf61e73a8af0-21fbd4c7e63mr1693850637.10.1749860480156;
        Fri, 13 Jun 2025 17:21:20 -0700 (PDT)
Received: from cosmo-ubuntu-2404.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74890005f55sm2345646b3a.56.2025.06.13.17.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 17:21:19 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Cc: chou.cosmo@gmail.com,
	cosmo.chou@quantatw.com
Subject: [PATCH linux dev-6.6] usb: typec: tcpm: Use configured PD revision for negotiation
Date: Sat, 14 Jun 2025 08:21:09 +0800
Message-ID: <20250614002109.444901-1-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Initialize negotiated_rev and negotiated_rev_prime based on the port's
configured PD revision (rev_major) rather than always defaulting to
PD_MAX_REV. This ensures ports start PD communication using their
appropriate revision level.

This allows proper communication with devices that require specific
PD revision levels, especially for the hardware designed for PD 1.0
or 2.0 specifications.

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
Link: https://lore.kernel.org/r/20250513130834.1612602-1-chou.cosmo@gmail.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
[Cosmo: Resolved merge conflicts for backport:
  - Removed references to negotiated_rev_prime (not present in 6.6)]
Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 08a0844f3055..4261a6caf5ce 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -296,6 +296,10 @@ struct pd_pps_data {
 	bool active;
 };
 
+#define PD_CAP_REV10	0x1
+#define PD_CAP_REV20	0x2
+#define PD_CAP_REV30	0x3
+
 struct pd_revision_info {
 	u8 rev_major;
 	u8 rev_minor;
@@ -3925,6 +3929,24 @@ static void tcpm_set_initial_svdm_version(struct tcpm_port *port)
 	}
 }
 
+static void tcpm_set_initial_negotiated_rev(struct tcpm_port *port)
+{
+	switch (port->pd_rev.rev_major) {
+	case PD_CAP_REV10:
+		port->negotiated_rev = PD_REV10;
+		break;
+	case PD_CAP_REV20:
+		port->negotiated_rev = PD_REV20;
+		break;
+	case PD_CAP_REV30:
+		port->negotiated_rev = PD_REV30;
+		break;
+	default:
+		port->negotiated_rev = PD_MAX_REV;
+		break;
+	}
+}
+
 static void run_state_machine(struct tcpm_port *port)
 {
 	int ret;
@@ -4042,7 +4064,7 @@ static void run_state_machine(struct tcpm_port *port)
 		typec_set_pwr_opmode(port->typec_port, opmode);
 		port->pwr_opmode = TYPEC_PWR_MODE_USB;
 		port->caps_count = 0;
-		port->negotiated_rev = PD_MAX_REV;
+		tcpm_set_initial_negotiated_rev(port);
 		port->message_id = 0;
 		port->rx_msgid = -1;
 		port->explicit_contract = false;
@@ -4283,7 +4305,7 @@ static void run_state_machine(struct tcpm_port *port)
 					      port->cc2 : port->cc1);
 		typec_set_pwr_opmode(port->typec_port, opmode);
 		port->pwr_opmode = TYPEC_PWR_MODE_USB;
-		port->negotiated_rev = PD_MAX_REV;
+		tcpm_set_initial_negotiated_rev(port);
 		port->message_id = 0;
 		port->rx_msgid = -1;
 		port->explicit_contract = false;
-- 
2.43.0


