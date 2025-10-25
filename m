Return-Path: <openbmc+bounces-803-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E357C08F12
	for <lists+openbmc@lfdr.de>; Sat, 25 Oct 2025 12:30:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctwyg6c2yz303B;
	Sat, 25 Oct 2025 21:30:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761388235;
	cv=none; b=e7lJhRz0q+FuJQAR8mmrAhrMFdk87VvuJaroXBhGDNsihg8G/9JT5KwR4U7LwXbBxPMFBCWniHtJDUXuZVNt9j3GRzPoIifBO1NgsNbV1nmGgSMq116H2s/pA/MDYTdKvEIJFbUMV1nKJbH9SLTTdA2PeTmsj2qPg+1ri2ImMzZEci2ccWbMtH9j8JkrN7H1OWlHstAl+ds6yQanzM4II9WYziPe/DXrTTpdg+OyLLXHRCHOmw5ERKcAm5LFyg75uYjap72j9FwwS5/Y3g4V5B++efcSz7AoZ+kHvcBUYORDgCfdDigwaRzvYm5V22aJD5RjEXXlKbyz8gypxaeHXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761388235; c=relaxed/relaxed;
	bh=4fFI/H5g6lmrQ/7F7A/P+82CzoIPBumA1OFIbe97XJs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jxoNaDhBnnjF2FCXUBQxMir2TIe6CFrXiLDKnCS+REw43rmcCykRQ03boJcUmGIvo61pFlAQY6rc0rBC8r5pOuyUhQwG6O51UNzAEhvxmtxQsIXVGsy0V8Mf0t7LVVByo1aJxwKXqw0JmEZTPjkeyQQkR1frbn4t/lfPWqjw5ysO6hkz0hNuD6vL8wBBKvoq7ALkMr3LhoKkfawUft7+8o0JUsF4P4WDsMVrBYTzzwf+dQdsxlvMYMIP22zyQjyEdJxE09x3U1ccOsJxjr9yMq+sAli/+kW781SHb/9F8BAWMhVPwFQyWUCh7cLAZQGL6ZtgTdk/RjvhoIQCiXQp7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=N/DJfIo+; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=N/DJfIo+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctwyf0Yngz2yFT
	for <openbmc@lists.ozlabs.org>; Sat, 25 Oct 2025 21:30:32 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-290a3a4c7ecso32747675ad.0
        for <openbmc@lists.ozlabs.org>; Sat, 25 Oct 2025 03:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761388230; x=1761993030; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4fFI/H5g6lmrQ/7F7A/P+82CzoIPBumA1OFIbe97XJs=;
        b=N/DJfIo+JzZyHktqHERvlUon+Kof2sv2sTgRB59RDPo6/1AjMPvDKHlj3JgSBOfAT6
         CtdrnnkDZtdYW0Oqcf85xeYj8/ySlUMYvMzPk/APmagU3Abp9Wj7mP3C95PacbgUbCuY
         zxHo3Ws3uDdTADeFQ8bE28VXNXIdLL/NQJD6l1NGYJeLzzD74rP/67lA50COiM0KxTFr
         JxyZeC/7ukFLZGtMMp6ifsrKUqU4VdcqaSqt/FEIHz4OgmBV2F4yNryCPWgrGM1Ec77F
         fnaPdvnA09d/4GaFOuPGRGffnr1mzgPTOIOmcnCjrP1VrQOz1v9OWsgleKbMwLNIHEam
         Yhlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761388230; x=1761993030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4fFI/H5g6lmrQ/7F7A/P+82CzoIPBumA1OFIbe97XJs=;
        b=B6VQgEc811uCD0l6623JzKVMl4bO2Zm455YohgGgxLHV7t1xJz6kEj62sk0t5J1KGF
         mYPoChV0gXtrq86hFc+vHPS1Bk+x9hQKdSXoc/zHECFgLrXbahj8pQyyoqsgi1Wiq7mR
         3bam2bsv8/57DT3UnVNKvVC++RerCfsL1a+mKia3MJ83M9vG60WFIp4OrPavZNrqJf4m
         Ohvs+mDmN2bUEwubCL7ZNe8GK+potk70f49v2Wdd4pKh0Jgbf4GqxpIhj1+PUfVUM1CH
         2PLtaryURFg7KaglxZL3c/TR4BJFdGrK+sO6L906H0GRasvtyjhrj1G7JbIqyN32thb6
         8c2g==
X-Forwarded-Encrypted: i=1; AJvYcCXQrUHreU3TXM031TsIrpURIWEhYAYP1XD3cpcHkXxaJ1KjCmmZ70b2vbnYk8GfajgYWuPP5iK5@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxzQ3xY0/y2prgP6RbgQiDLIZ2Un+rZ56qnGrM5FMokWMX/MtVg
	vGZ+5aBFv8GT1xm164cNVyRvTOcaTkq37LHtH8Q+JBubjBe99xAStboS
X-Gm-Gg: ASbGnctexkaVUnrJKt2cMbOWdgklVoD0qCSCy+9h2oUEez4EXK37Qnox5FKERw55sYb
	9VOSSvGjQUhzFkmj4ZUaSl/o9QD5DQaBSQt4qFqET9OQalNPXZDYAmn/cywRrOlxYeajbaSzAWP
	0rP1mPPwTyPH+WlybL+Dpiz/yATnbXr+N+7qcE+U/8sba/sepzSRQ6NixpPqWkz8RhNgOG/PHkE
	EY6AV2znT0kfFcB3YJ6HPP72GiWeE3IFZ/MMQc6C3oeAVJgAaWhklaH1CSZEpYVGT9OMyv0pOVh
	gvEHQaqxamhGU3DTWrgpbvo/q9FHC4GERvJpy1yNmNTsbhmZ47gOyT+PMIcoE1UPWkXGyKm9Nyc
	7PCj90YEMCsjP9/50gXJpDHX5TZY5S1Jpc3r5OB4KvZQ3Dap0CSjzBU1McVQWIILXFtmXvWEq4w
	8YKkzq0zDO4MWRD7tigm3loNwNI27vCqVuNq940yC1Z5GVKgO7mL9OHLR9cKuqQR8X2APvNEus0
	nYd
X-Google-Smtp-Source: AGHT+IFHiHjXAq55TguABckDkft8yDmiG1B3JcvebkyZqzBdeuFD1j0pcAlbHGgn2cJ352RxNzex5Q==
X-Received: by 2002:a17:902:cec7:b0:290:c09f:a48b with SMTP id d9443c01a7336-290c9ca3225mr427973075ad.16.1761388229919;
        Sat, 25 Oct 2025 03:30:29 -0700 (PDT)
Received: from cosmo-ubuntu-2404.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414069348sm1891140b3a.49.2025.10.25.03.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 03:30:29 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Cc: cosmo.chou@quantatw.com,
	Cosmo Chou <chou.cosmo@gmail.com>
Subject: [PATCH linux dev-6.12] usb: typec: tcpm: Use configured PD revision for negotiation
Date: Sat, 25 Oct 2025 18:28:22 +0800
Message-ID: <20251025102822.346173-1-chou.cosmo@gmail.com>
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
---
 drivers/usb/typec/tcpm/tcpm.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 3669ffb01905..199a023b68e6 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -311,6 +311,10 @@ struct pd_data {
 	unsigned int operating_snk_mw;
 };
 
+#define PD_CAP_REV10	0x1
+#define PD_CAP_REV20	0x2
+#define PD_CAP_REV30	0x3
+
 struct pd_revision_info {
 	u8 rev_major;
 	u8 rev_minor;
@@ -4680,6 +4684,25 @@ static void tcpm_set_initial_svdm_version(struct tcpm_port *port)
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
+	port->negotiated_rev_prime = port->negotiated_rev;
+}
+
 static void run_state_machine(struct tcpm_port *port)
 {
 	int ret;
@@ -4797,8 +4820,7 @@ static void run_state_machine(struct tcpm_port *port)
 		typec_set_pwr_opmode(port->typec_port, opmode);
 		port->pwr_opmode = TYPEC_PWR_MODE_USB;
 		port->caps_count = 0;
-		port->negotiated_rev = PD_MAX_REV;
-		port->negotiated_rev_prime = PD_MAX_REV;
+		tcpm_set_initial_negotiated_rev(port);
 		port->message_id = 0;
 		port->message_id_prime = 0;
 		port->rx_msgid = -1;
@@ -5054,8 +5076,7 @@ static void run_state_machine(struct tcpm_port *port)
 					      port->cc2 : port->cc1);
 		typec_set_pwr_opmode(port->typec_port, opmode);
 		port->pwr_opmode = TYPEC_PWR_MODE_USB;
-		port->negotiated_rev = PD_MAX_REV;
-		port->negotiated_rev_prime = PD_MAX_REV;
+		tcpm_set_initial_negotiated_rev(port);
 		port->message_id = 0;
 		port->message_id_prime = 0;
 		port->rx_msgid = -1;
-- 
2.43.0


