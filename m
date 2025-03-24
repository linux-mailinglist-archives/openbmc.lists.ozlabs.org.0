Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84336A6E6CD
	for <lists+openbmc@lfdr.de>; Mon, 24 Mar 2025 23:49:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZM7Ws0XThz302c
	for <lists+openbmc@lfdr.de>; Tue, 25 Mar 2025 09:48:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742848361;
	cv=none; b=a328a6PwyyBNJnRIB+TOV3HRHSAQ3yaEH1znvep2TSrqVGo8mPA+6fLR+lZNtmxzYpI32sMKQ5gewqb29FxLLgmqMSvo79mNIrM7NBkdnXp7s9w+0XZrfGV2pHWjiJB52qTlkJ5D3KgQbLfINU78n2vfhH6DP6xDb3S5+Ulto+NhzDZMMNXFuYqQu+XQAIcU0eo3cNYZjvXT+5VkSpyMe7LwKX7NDLPhl0fXv2SllbNG2F434XpFV0WD45WLBBZO9rnVAbx61vDMkoMmLO53m4yEancgz5n+r3ZykUNFK7rsevTuPXYO/vONGqnpMBSh/Ve6nJBDbYxB0A1eNowbYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742848361; c=relaxed/relaxed;
	bh=c4Ttsoo8OWelVr1FIAW5txkAjwug6YJv1rO6LqO2moA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dW5pBKA5dvrta4SKoV2Sv7howUzz6BrzSHSNEWvXlzuBPl7SdY/j8ifZDMjytesYVc9V7EEqvnpM1MXanMiXL2asw5oEMcp4SyZO4uA00wwwRbBBo3VoCaSyA5aiijHH4i74KjfUCnCaG+Ys8CbYvaiFsTicKyFFkYWNV5XnufGd9L+G2G19uPVarnznqpGO58L8ixVpb1b4H1N1hFqzAb421oH/iS4AvXmOCO3KyY5q60MKuV6Zruyw0bChE9FkoTT75t6rH9Ofq/69DOYVHM9LPp0VYjef/TP/Id9FBqXE//GH5dXSE5jCs3vJ7rp3ldlt13XsLnhhai2OAT0r5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kfZcaBLi; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=mohammed.0.elbadry@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kfZcaBLi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=mohammed.0.elbadry@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZM4Vd0Nwdz2ydv
	for <openbmc@lists.ozlabs.org>; Tue, 25 Mar 2025 07:32:40 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-227914acd20so46412635ad.1
        for <openbmc@lists.ozlabs.org>; Mon, 24 Mar 2025 13:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742848359; x=1743453159; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4Ttsoo8OWelVr1FIAW5txkAjwug6YJv1rO6LqO2moA=;
        b=kfZcaBLimgzgKZywIJV3hxJZPHIC/5ZihJ6KHiU7bfwBxejfkzmHB7rsJz71/cZW1R
         eEdcZ5x2rahn0+XZl3mKzQURA7B1e4GsuWj4JH2Ozu8MAbeZlwL0oaHKHP6pzSdA+u9w
         Sr0pVlF4GLf6x1iJHJ/56wmfYGQvqcNU3/7EZOpKHca30g/PlDIaE9oNMC8oYMMlGF5w
         cmr93Iq4ujqS839TxC+0+ftHP0S4g+B2e0j/V8CHWmIaKx2hvAUF8zCeHhmh5k/rqqI0
         vILvrS/3HqipnNYlVlgq+zJBQNOFEoZ3I2D+wI8VgLzt7+E/fONOHhBbliC4vksRpPFb
         /Dqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742848359; x=1743453159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c4Ttsoo8OWelVr1FIAW5txkAjwug6YJv1rO6LqO2moA=;
        b=a/mp7Mn/0OFtYlsHUtU6Hp+Z+3ekrxthVjUdRt4L1q3jFxHgvt0LFnpgh9k/IFGOWU
         sE9KmTa+QI6F6Ftv1G3yYhFwrd6ZS4cwJgn6HFrN42D1k3iTvxaH4vyrsoruJa3N+wr8
         ULD3keskFGHU0JcUBKVoxEn3f2za2BVshkHKGRIpSC3iFck6RA5zwseLji39aaxZCUbV
         C2JetrLpAgHnQ223QfeqUexRnB699rVd/bWOfpEFXIUTbT9xKA2rIBVK2X6de6I+G05I
         8Peq/V0yrvwnbTami0HTLQkDenUL1OC+1yNCiz10llCyHPBiCsTtfpaGXwBlF+TC4VFF
         L25A==
X-Forwarded-Encrypted: i=1; AJvYcCVack0/C7lhSG5iNrkElzt1pHiDZKzVGZLndWP1cDKl4FZtA0uZZN2UiONfTMyBZrrxGOoaApWD@lists.ozlabs.org
X-Gm-Message-State: AOJu0YygaFAmunNa+fsdK+aQc7YjjqnFHCbboNLKhoBUl0z2UfNyH2Bq
	LXkTOzIP2mkuPG4C4YExDIruwL0P6FK/yDyxaFJrRjM0nWg+pA9CJUmNDpoMRGg=
X-Gm-Gg: ASbGncuL77MAOG7Jd0hz6brj2OFXHtHK9ywUhQYMNB/GB/juuhHB9qjVc7ielGDRsnu
	QuEK+CWIGK+TCm2Hm2EY50mpgO5tW3JZczVnM5mxqTBz3C496jTBFd49PxqKirImJ/NFgU4V2tp
	Smv85qN1YH1VUN7XMLLNi+ebNpCpgrZyLj1FO7FfKz3AJhLFXN1zFP1LiLcxycqdLLzOFBfBiWe
	DxTsUAK/CjU1XowSL3ypEeAgcCP/QIgwwAkFPijhKSuBzCb1DIcccdAYahUYtf6+LrNCBww9eRl
	klw64PIzn7BW2wqYaUx3bnUNlBUOCGR+gXmUlQjEtFstTfnXAiP0sCunt+ZYxPJs17SRvFauaDn
	sQKzFXu7Zz6B7pglpddU6wf4FY1tnV5vxKlnkD9bgIP+2iQC1GMjc
X-Google-Smtp-Source: AGHT+IHgGPWF0ym+Tv4mM1Xv5CI6iXbrMz5Man/ozAwwl2nQXmJ4AX5iIxyiUBChusXdPmM6oqZJQw==
X-Received: by 2002:a05:6a20:3d83:b0:1f5:8cf7:de4b with SMTP id adf61e73a8af0-1fe4291df24mr23305567637.16.1742848358937;
        Mon, 24 Mar 2025 13:32:38 -0700 (PDT)
Received: from elbadrym.c.googlers.com.com (34.125.168.34.bc.googleusercontent.com. [34.168.125.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2a23c31sm7593981a12.54.2025.03.24.13.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 13:32:38 -0700 (PDT)
From: mohammed.0.elbadry@gmail.com
To: 
Subject: [PATCH v1 0/1] i2c: npcm: Add clock toggle in case of stuck bus during init
Date: Mon, 24 Mar 2025 20:32:02 +0000
Message-ID: <20250324203233.1266772-1-mohammed.0.elbadry@gmail.com>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
In-Reply-To: <mohammed.0.elbadry@gmail.com>
References: <mohammed.0.elbadry@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 25 Mar 2025 09:48:45 +1100
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, Mohammed Elbadry <mohammed.0.elbadry@gmail.com>, linux-i2c@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tali Perry <tali.perry1@gmail.com>

Hi,

During init of the bus, the module checks that the bus is idle.
If one of the lines are stuck try to toggle them first.

Fixes: 76487532f797 (i2c: npcm: Add slave enable/disable function)
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>
---

Tali Perry (1):
  i2c: npcm: Add clock toggle in case of stuck bus during init in
    npcm_i2c_init_module

 drivers/i2c/busses/i2c-npcm7xx.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

-- 
2.34.1

