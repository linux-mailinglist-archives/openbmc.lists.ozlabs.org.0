Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D040A6C00B
	for <lists+openbmc@lfdr.de>; Fri, 21 Mar 2025 17:37:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZK7Ps6gKlz3fqX
	for <lists+openbmc@lfdr.de>; Sat, 22 Mar 2025 03:36:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742574999;
	cv=none; b=KI/9xoo1LVAeqwJSzvMLCYG7ocIQiwwoUjxCi1Iu/fRIm7XAN69YUZgtxm9aGxF+8ogwKqNikzuHPFmh8JrG7OCZUMzTMfXbHG3mpOsU2LkUUqVpz2cKB1kuGEL2njs8Y5nhPkbNvnbR6a57ftzLZ/vlGq/jAgTVNCkyroxusRpDAFIKD0s01RxyQVrf4nLcIG+6eCqZCWzU2S6OrGVHNlGbpqoLtGCwnpLceJAkYuUBCcHoObd6X+aIcmBY2VTS0V8mlTrOioWYtjF95IurCCPy1alD/UGDKZr2bKbZJbM0zcqXqFXesufCIT0l+/UfMS8Fa8U1HM1kRKJVPU9BIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742574999; c=relaxed/relaxed;
	bh=BIa7ziTcm+ScnKVuzLb1vH2l+WPIEbFiu4cxIBCxw5A=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=b9IrdOLhHEpsMPyLop6c0E2UfY4rOQHWRffZXnWWdW/HiWVo+uDprBcNLSZyGqReWmj2ztoNw5nRbuIu7t5s4ouT5tTKPikXFrkD4dpq6sPiV6+W/3BmsD2ZtdA8UmX1o8fmX1ijh2XcIB7l6qv1De4ROGqAS4u7BslQ/BSni0IHXf5oPFWTuvCoqaQ2yP9Q5yBNJyDecYemu9BhiGaYWetbj/KV3TXvN1HtGogeJDAEsGH3C+UvdRHsNS2fpBcYhG/IvGJdkSt6d8eezaxxHjb1SGrg1Hn8AooWRYxQr1SLQDx++4Bxul8oQLlp4DiQnXetULo2fKPz/qEsUkzq8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=RHGtXYRX; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=RHGtXYRX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZK7Pf1yhLz2yft
	for <openbmc@lists.ozlabs.org>; Sat, 22 Mar 2025 03:36:38 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id A20258287B1A
	for <openbmc@lists.ozlabs.org>; Fri, 21 Mar 2025 11:29:42 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 4R9MFG_fUwXB for <openbmc@lists.ozlabs.org>;
	Fri, 21 Mar 2025 11:29:41 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id C926A8287CB8
	for <openbmc@lists.ozlabs.org>; Fri, 21 Mar 2025 11:29:41 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com C926A8287CB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1742574581; bh=BIa7ziTcm+ScnKVuzLb1vH2l+WPIEbFiu4cxIBCxw5A=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=RHGtXYRXM49xdjfQohcm7OJLsju4qGJJCa1k5J+vNmTnATPa3CWOwVOlcVY4S1DFT
	 m/wO+jSJfCVHifkR6Hbu6OGevMnzoiX33VhUcFwHH/B4t8uEBiuRmNSYMo9PADJUcQ
	 nN6JdMYDQLpnu5KR+u8lyLKtvs94lUPOHYiEBOzo=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Uqhwsolk7M_K for <openbmc@lists.ozlabs.org>;
	Fri, 21 Mar 2025 11:29:41 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id A200B8287B1A
	for <openbmc@lists.ozlabs.org>; Fri, 21 Mar 2025 11:29:41 -0500 (CDT)
Date: Fri, 21 Mar 2025 11:29:41 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc <openbmc@lists.ozlabs.org>
Message-ID: <10646965.19586515.1742574581480.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH 1/4] ftgmac100: Allow target board to override MAC address
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC134 (Linux)/8.5.0_GA_3042)
Thread-Index: tz2lTKVt19HZh2wYUFt13y/f3K0y6w==
Thread-Topic: ftgmac100: Allow target board to override MAC address
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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

 read function

Upstream-Status: Pending
Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 drivers/net/ftgmac100.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/net/ftgmac100.c b/drivers/net/ftgmac100.c
index 5595f48bbfa..e5373053e58 100644
--- a/drivers/net/ftgmac100.c
+++ b/drivers/net/ftgmac100.c
@@ -257,6 +257,11 @@ static void ftgmac100_reset(struct ftgmac100_data *priv)
 		;
 }
 
+int __weak ftgmac100_target_fetch_mac(unsigned char *enetaddr)
+{
+	return -1;
+}
+
 /*
  * Set MAC address
  */
@@ -642,6 +647,20 @@ static int ftgmac100_remove(struct udevice *dev)
 	return 0;
 }
 
+static int ftgmac100_read_rom_mac(struct udevice *dev)
+{
+	struct eth_pdata *pdata = dev_get_platdata(dev);
+	int ret;
+
+	if (!pdata)
+		return -ENOSYS;
+
+	/* Attempt to read the MAC using a target specific access method */
+	ret = ftgmac100_target_fetch_mac(pdata->enetaddr);
+
+	return ret;
+}
+
 static const struct eth_ops ftgmac100_ops = {
 	.start	= ftgmac100_start,
 	.send	= ftgmac100_send,
@@ -649,6 +668,7 @@ static const struct eth_ops ftgmac100_ops = {
 	.stop	= ftgmac100_stop,
 	.free_pkt = ftgmac100_free_pkt,
 	.write_hwaddr = ftgmac100_write_hwaddr,
+	.read_rom_hwaddr    = ftgmac100_read_rom_mac,
 };
 
 static const struct udevice_id ftgmac100_ids[] = {
-- 
2.39.5
