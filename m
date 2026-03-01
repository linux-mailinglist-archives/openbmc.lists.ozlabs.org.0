Return-Path: <openbmc+bounces-1417-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONkwNjVvpGl1gwUAu9opvQ
	(envelope-from <openbmc+bounces-1417-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Sun, 01 Mar 2026 17:54:13 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CFB1D0BDC
	for <lists+openbmc@lfdr.de>; Sun, 01 Mar 2026 17:54:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fP7Sb3Nzqz2yFK;
	Mon, 02 Mar 2026 03:54:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=80.12.242.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772384047;
	cv=none; b=bKJuxrbRsBRLqmNYgOXJolSDrxP1zW6+ZAgMgG8aa/7+9G1keM7LPYAdGEl1CGiYcggaQkdJOn1YAvXFTHCKv7FE9Kv5+WZLUR4uCgEJqQdC+0WhHeDkMezCqa6i0uknT/DY5knFvyINESlmMpa6CudeIrtHk7a9Q/gs6UPWCqYg9XiBItnnS5QuYZaEZQ6o6afSVZMroCAuGf+zHF11TK441toIr1+71Isikcc8mY849Soc21nBdSTWpGQmu5RJzgKDZgY8ruheNpO7+IMOhhTmikx7IhBNYmksrCWm8Je2WhHxMwQ3zbqFI4ZK47cZ0gvUqvOMsYNZ87ObwaRUhA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772384047; c=relaxed/relaxed;
	bh=ZDU6YEmeKfV0DZTfQRWPUrC0979+SE4F08nNSXKB+Rw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZGDMyEBHEh2CVyoDnmJDXATqqmtnZJ0e1XjJiP/wTVLOYAyLElno9jhwrIutFcWDUxkv3kfZ1V5MrjwJW7k2b1K5u3LHd/vmyfAl3pdMMORzhLk+zmcZy2A5kCyDt7xe7lvnnAInreJtMTwGO3XV4m1uoquSlnGiasWlZyFWQ2AoonNkKxxds2sVjSubDh1kopjsxI11F7mJw7tsxWqogmVprpIYXFH1dKPh9ABTiF1V8mS3GszjiraNeB2gZTSoVZw4ArBcaw51AzKoc5rtV+zoEUKkVo1IBQSon1T85KjKj3eqVZJivqqjHOwM10RbdNj0ZgWG6dP2Qsmrnxp4gQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=cBXl3qaJ; dkim-atps=neutral; spf=pass (client-ip=80.12.242.15; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org) smtp.mailfrom=wanadoo.fr
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=cBXl3qaJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.15; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org)
X-Greylist: delayed 1906 seconds by postgrey-1.37 at boromir; Mon, 02 Mar 2026 03:54:05 AEDT
Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fP7SY286sz2xqm
	for <openbmc@lists.ozlabs.org>; Mon, 02 Mar 2026 03:54:04 +1100 (AEDT)
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPSA
	id wjXVvgvwZrKIuwjXVvxE5w; Sun, 01 Mar 2026 17:21:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1772382066;
	bh=ZDU6YEmeKfV0DZTfQRWPUrC0979+SE4F08nNSXKB+Rw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=cBXl3qaJB63B45EjFaVLtaEMsSamPxFhByNIgYPTgYFgmSON8X/UUgQNg64hh/H4j
	 IgNLkQj8avGmaSvnjhYtEAHOiCfWoq7pQQF3Q1HWXI5zdupSU42eeZBfCDufBD7yri
	 wVYaDVGx1owXInYbbJVk3Hu5ZhwOVnnRowAqGuTewtkBTtJqvkgDJLFmF+SmBCMYqo
	 8c6W2IETu6BFBEj2s65kc94Aw+hQ5Vv12/6xptjN9vsOFdA/qThREfY7/EXZTzl0xF
	 kYJcUJongu+PD9SyKiWJrixnC1kWZHG7E8umBOUkGkkOmUw5N4s6+0V+5iqid8NvbV
	 NDba2IlekOFnQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 01 Mar 2026 17:21:06 +0100
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Eddie James <eajames@linux.ibm.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa@kernel.org>,
	"Oliver O'Halloran" <oohall@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH] i2c: fsi: Fix a potential leak in fsi_i2c_probe()
Date: Sun,  1 Mar 2026 17:21:01 +0100
Message-ID: <fd805c39f8de51edf303856103d782138a1633c8.1772382022.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.53.0
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
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.70 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[wanadoo.fr,quarantine];
	R_DKIM_ALLOW(-0.20)[wanadoo.fr:s=t20230301];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1417-lists,openbmc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[linux.ibm.com,kernel.org,gmail.com];
	FORGED_SENDER(0.00)[christophe.jaillet@wanadoo.fr,openbmc@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:eajames@linux.ibm.com,m:andi.shyti@kernel.org,m:wsa@kernel.org,m:oohall@gmail.com,m:linux-kernel@vger.kernel.org,m:kernel-janitors@vger.kernel.org,m:christophe.jaillet@wanadoo.fr,m:linux-i2c@vger.kernel.org,m:openbmc@lists.ozlabs.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,wanadoo.fr,lists.ozlabs.org];
	DKIM_TRACE(0.00)[wanadoo.fr:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christophe.jaillet@wanadoo.fr,openbmc@lists.ozlabs.org];
	FREEMAIL_FROM(0.00)[wanadoo.fr];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[openbmc];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 96CFB1D0BDC
X-Rspamd-Action: no action

In the commit in Fixes:, when the code has been updated to use an explicit
for loop, instead of for_each_available_child_of_node(), the assumption
that a reference to a device_node structure would be released at each
iteration has been broken.

Now, an explicit of_node_put() is needed to release the reference.

Fixes: 095561f476ab ("i2c: fsi: Create busses for all ports")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/i2c/busses/i2c-fsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 82c87e04ac6f..b2dc5ae1d0e4 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -729,6 +729,7 @@ static int fsi_i2c_probe(struct fsi_device *fsi_dev)
 		rc = i2c_add_adapter(&port->adapter);
 		if (rc < 0) {
 			dev_err(dev, "Failed to register adapter: %d\n", rc);
+			of_node_put(np);
 			kfree(port);
 			continue;
 		}
-- 
2.53.0


