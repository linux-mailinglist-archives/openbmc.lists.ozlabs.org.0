Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 233C895F2B5
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2024 15:18:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wsrpc3Y29z30dx
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2024 23:18:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.187
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724678309;
	cv=none; b=D/U2msejCJSH/wf2vzneWCQEIpC05VHAL5gbHjE7K4KY5pmC8TLY6W0NJBkgtpc0TdLPrmLuozcSROL391qVllwDMYPU1XPlOfqbOwX0zW6KCMadR269h8QQ7KCAFDLwNxh9ufMAh03VdugDzEE2ei+HB9/agX4IH1sP6BFC5EsibMObyusyUxJXqITSXVzdJdLXgZUI6CIS8XUbI4zgGMu2Abl05QZH/GpcsEjEX73xZUqz/zmZKUFJyoIBhyaenjeH+50/TZAcCnVjXjDg6k1CA4NI/7BBmRIFgBrLYkEGUkNVodBa30UKKnXElXfwc7fhSglxkC6I5WzDxEQlFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724678309; c=relaxed/relaxed;
	bh=yoNQdHh6Rz+LF1xtCQ5U+uXfBwjl0TlC1qwSsDQ4PrQ=;
	h=Received:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy; b=lcYdiPFAzYNjwJm4PImQ7fiUXz8vVrEjkLnFVYENZ4fSNQsRXh00ezmWgELOKXJrI12w8aEE1rn8kAlqh6CGhrCcpC0uecWl1wg7cihSk2QUUjBNmkyYHHgtngpN7z8s1+viVPdt+Kqd+guaxPGLDaU9+3JsRFII/mDHhQrwl4NXMqnLvDML3eRkjPuZx6qpt+46GzL9NyOIoyI9quzJ1au3Ip1Z3oSI2p4wj9Vxgfa9tXutGAkavJbZ9jW5AhPhkoN+eTY08lacalZj12q2J5aE/Nrh2GF2U5vYkX+5sMh41zj4icZ3l3IpGVKiVnnixROjuyxrU3zUkK9uMbWL/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WsrpY13lzz2yJL
	for <openbmc@lists.ozlabs.org>; Mon, 26 Aug 2024 23:18:29 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Wsrmz59wWzyQKr;
	Mon, 26 Aug 2024 21:17:07 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 970341800F2;
	Mon, 26 Aug 2024 21:17:53 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 26 Aug
 2024 21:17:53 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <j.neuschaefer@gmx.net>, <broonie@kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next 0/2] spi: wpcm-fiu: Fix uninitialized res
Date: Mon, 26 Aug 2024 21:25:42 +0800
Message-ID: <20240826132544.3463616-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemh500013.china.huawei.com (7.202.181.146)
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
Cc: ruanjinjie@huawei.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Fix uninitialized res in probe function.

Jinjie Ruan (2):
  spi: wpcm-fiu: Fix uninitialized res
  spi: wpcm-fiu: Simplify with dev_err_probe()

 drivers/spi/spi-wpcm-fiu.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

-- 
2.34.1

