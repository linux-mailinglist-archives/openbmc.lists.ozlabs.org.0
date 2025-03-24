Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2B0A6E6CA
	for <lists+openbmc@lfdr.de>; Mon, 24 Mar 2025 23:49:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZM7Wn1P0Rz2yrR
	for <lists+openbmc@lfdr.de>; Tue, 25 Mar 2025 09:48:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742848210;
	cv=none; b=cGOC34Ip84HFfEfCMc+tV7rsA5ha1jqVuPWCTUoTMSfo+MRwvkybtI5UK5XN4SbYug9oBFaPOavSwMPwq8lH3Edd01a38zj2dAeiFuST7tyk+eG4nO3r2Q77t5rmOZu4eWm7GxO1y0lZZXdpHIDtb8uq8RllLGVRCcl88waMxOw/186lvYjjXMvWqNpj/Q95Wst9gFV+psmEipDa58x4OpRbENZRaEra1DG7Gtz2Kw39ruQMaeWokxqV+BVzkszRAXSkq0XC20rbWiiVu+jWpDIUFi/49tclxHPoO3RmQkNXEGbu2o/CJkFQQpgWOll3u8IAtPWd42eNp5QVHhgBgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742848210; c=relaxed/relaxed;
	bh=xRcFQxxl9+AzhZySlV5tIixacXs3JWBmTbDcF3YmTTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z7MsR8pf9uUjSwwZIeqkpOrsjhkSHdoPcOBretRQLl8m06slpcXuKu0tjr5XXyQruo6I8tn6GWt3HrHRvVpd8d8Rl1VxTonbcNtfS7L1cdD9JssQabn9j1tmUUQryE1OIN4Zgvlc+g6d2D/UbWTripGuZO92mV24hW3RCzNO3yCD3V17scpLcl2KI5rBNA8lYvtwub41LZen59kabodL9zp7rynwsziqoSWHgdIgQpCM9Q18l349n4Vn/Czz2MEvm3Id5A1oNqZ3M1G/aiR+m/P1OWXNyLYwOgoQNLP3E6DPWSFMTWwjfkH3d6kNlmMadHkRCOfABdxpbnA3pJLh2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eP87uXq/; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=mohammed.0.elbadry@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eP87uXq/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=mohammed.0.elbadry@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZM4Rj3DgSz2ydv
	for <openbmc@lists.ozlabs.org>; Tue, 25 Mar 2025 07:30:08 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-225df540edcso113880955ad.0
        for <openbmc@lists.ozlabs.org>; Mon, 24 Mar 2025 13:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742848206; x=1743453006; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRcFQxxl9+AzhZySlV5tIixacXs3JWBmTbDcF3YmTTc=;
        b=eP87uXq/PYEqH+I6eVHQMgxKy6yYfQQqi5HOL62hUrbAqinl3Q+kfb8J5JcX3YR05z
         ZVbFw3nD/WaQnChOLurtQV9FjCiQFghgVpI0zR2HhCCZLdJn2SZ5tOj5ZEZs8qyILpO0
         4FmX79l9M9VRPjl8aS0/CNrBJbH0BadqLHSkfHjN/fSg4PyYcvSOLiTmI81dUoxPgqd/
         aTaicSuWX5XMOTbIq1osBSSNxhEHN2ibtYafj1DD87UNCldOVTy7Bqg86B42JDqdYOTh
         LxmkY1EDe8/xTCmscgW3C4Pk8TG5M58Mj0WauLCpG//dQhXeBkgUTdPDbWvEJ0yAT56F
         IjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742848206; x=1743453006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRcFQxxl9+AzhZySlV5tIixacXs3JWBmTbDcF3YmTTc=;
        b=RDRnysm/baHLMtCuLVQ5v4k/9rZNnb11j8iQi1xD9o+0fbN/A2gkeh1Dm+ub8ceJxm
         fRYcVp/JX3/rdc5PZ/DqmczySMM6UeL0HQ5T+Cagza9MHeCB8h66vzVkl48GNA6E+r5N
         /URCCY8K0sH/CTTginO4BYUkVRUxlB3PIgE2YmGFsqNaD8uBswBpYUzbD+4rhifLlwwZ
         0Ur3JLnF6LHaH4zqy6wafND6Z7Krg/PBV6KpcJF7KvuxJ8dKWXrktY8Ji07CxxhzJmMm
         e6zOATMOjb9fCXV3gGP8dQs8oYxf7veeSuYG6aBM3Sj8c9Nomxgy+ljf6wm4E7DNJKkf
         BzEw==
X-Forwarded-Encrypted: i=1; AJvYcCVhDSBFTJx0iA4KVqeZf/casM4ftriOEzNIAyOJUne6LdgSx/69g6i2ktp6uWxQXrOvWozdqxT5@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxngNhpTdJmlxFqMTSmOaybSywNCncmZFBhXWGh+T09eoRApbk8
	AbV+wyonI27VJodUbvlrTHx+L5R7XyUa9G2m7axl4hUkBaI5NWBR
X-Gm-Gg: ASbGncvNJnrU4IQv+yZIoDuSlYa+5MIQPvPkhK305PQAazm8poNwLpDk33l5j+UAJWM
	M7U2hIRA5Oa+gvQzUVYJqItacF9BckaMT1h5LrK2K1gROT1n8pPILpCmgXhCW1fYNAcGZIcBks4
	XnFL6Bt+1xRhKUNoGSaxM79Wzg6q5RS7F/Fa6iCnzoX9TU3G4Y9Dzs0UeHT4UsepyXOJazai1wj
	A4uPm6mFo1RMyarv4zntEiM5js4j6cVcQGc5Z/+y98ux2s8ktQ5MZRrhBzqSrWq8qtuuc9/K1qN
	j+bFj/X7LxuwMLiT3n7uiJDfsSwlD+uanqqfDhqc25hUp/ntWXzbLzP+rqK5iWEJDrrUV/sSdF1
	Bsut1e21Rxr7/SL/FjC2gFKyh/pcu2zmbx4A3aMM8Vw==
X-Google-Smtp-Source: AGHT+IEZwK8be9b2VlvRv6JaIxJpgDZ1FlvCx3tp6BCAIFtG22i8iMZ6KxxUOscvHsIlGWgX4GnsuA==
X-Received: by 2002:a05:6a20:2448:b0:1ee:d19c:45f9 with SMTP id adf61e73a8af0-1fe429608d5mr21930991637.19.1742848206370;
        Mon, 24 Mar 2025 13:30:06 -0700 (PDT)
Received: from elbadrym.c.googlers.com.com (34.125.168.34.bc.googleusercontent.com. [34.168.125.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390611d212sm8771886b3a.95.2025.03.24.13.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 13:30:06 -0700 (PDT)
From: mohammed.0.elbadry@gmail.com
To: 
Subject: [PATCH v1 0/1] i2c: npcm: Add clock toggle in case of stuck bus during init
Date: Mon, 24 Mar 2025 20:30:01 +0000
Message-ID: <20250324203005.1266044-1-mohammed.0.elbadry@gmail.com>
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, Mohammed Elbadry <mohammed.0.elbadry@google.com>, linux-i2c@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tali Perry <tali.perry1@gmail.com>

Hi,

During init of the bus, the module checks that the bus is idle.
If one of the lines are stuck try to toggle them first.

Fixes: 76487532f797 (i2c: npcm: Add slave enable/disable function)
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Mohammed Elbadry <mohammed.0.elbadry@google.com>
---

Tali Perry (1):
  i2c: npcm: Add clock toggle in case of stuck bus during init in
    npcm_i2c_init_module

 drivers/i2c/busses/i2c-npcm7xx.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

-- 
2.34.1

