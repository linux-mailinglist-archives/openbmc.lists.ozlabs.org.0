Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16260A6E6D1
	for <lists+openbmc@lfdr.de>; Mon, 24 Mar 2025 23:50:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZM7X52mCjz3gHp
	for <lists+openbmc@lfdr.de>; Tue, 25 Mar 2025 09:49:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742849955;
	cv=none; b=fC9PnnPmsIa/E9BXM8exix04l7Mne88VXfJiSH94mrA8xnwHcY/pErm07PED0n8o5Raq9yBxT5GUhF5stVaoj43JTTfS0qM29iD62NAsmJZIEJkC+Tm1NJk5zzXphZBR7MDd1o2aLsjStkv6okjr1GICwn4G0Emvwk+gGyL5iKneDlA2Q4jYnWtVdqZdOcx8oFWQaLtglJDQgu/oonsfNbw0fPbHC8pAHR2ASRAseytMwuxmwPhDEpT9Ux3GwnrPjp6/t016syaDOLUTzVBuceS9Ui/l/Orl1bNbHA3kLkCapb44ravre4r0STk8KRZ8DRj6w8L5yRex0x3qFyShYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742849955; c=relaxed/relaxed;
	bh=002VYXfVkW5llc3Dj8Pb1vA7Q/1HSuDmTY1op4WgSSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n0s0z61PFA3sEXHYwUkFJAyi98DfaoR+B1rzO0Z0IkiPaZQcWMCecZSReKQvaUHaDSjSlDc1Ewx/7Z58tF+uXnGBlHrIbF3vWSADenHOeRrty2FxNEqE/3rPyQvkUCn5jt6gMy4a7zBObj0pi2v5JCtPG+dT1nkQz7eUOxJ9KBJn1oIaJjzLSJRzOvJUSDtKfqmVPMPNbaEDWjqPXdxiej9Km74hrdkLGMmHu2mf5cTIrt8BbM4jIpbUNvElzMt/PyAi2wqhGz59a9J6McqoD/To/xLzEQiXPDimRcVody1Kaw/ed/SkmCArooBp98JMPQri2xwzGz+Bq6FFqShr8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VxQ1I26o; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=mohammed.0.elbadry@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VxQ1I26o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=mohammed.0.elbadry@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZM55G6h5Hz2ynR
	for <openbmc@lists.ozlabs.org>; Tue, 25 Mar 2025 07:59:14 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22401f4d35aso101354675ad.2
        for <openbmc@lists.ozlabs.org>; Mon, 24 Mar 2025 13:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742849952; x=1743454752; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=002VYXfVkW5llc3Dj8Pb1vA7Q/1HSuDmTY1op4WgSSw=;
        b=VxQ1I26obTqAz7m1lCUtLJwRdCnVEiUncmCOUXHg9k+9Op17EitFwDybsV2rr2wcx3
         zZ/GVDGY+grGIOa29x6h/+Zmg+HmXHrWSIK4bDzYJFNjPpMKDZd5Bf4ruwr5bYUUm5Dz
         n/4xr4V+guLPq2+kaHGizvnBSvTzJae0QIZqhy2OpcD4QKBw71gG2WBnrxcZsPEsBqJp
         pb1DC8cgICxrni9dIgFopCAugZaRT8q3Q2WO+UJjf3QNMN+Xx/52xfGwGGakFEPcQArz
         KHmz5TFsLUupmw8sFtOCUnrGEc9cQs0sTRL9pYR9ale3mo1X3k6c83OV2vbZI71cRjVt
         YWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742849952; x=1743454752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=002VYXfVkW5llc3Dj8Pb1vA7Q/1HSuDmTY1op4WgSSw=;
        b=nVTcCqiGo8uUC/6cyVTMnyTPkzPYEAzYJD6+kI3914mwmO3DEMkqb56YnsOlcHlMup
         XP2nkTbXHnz5uojvRPiyzMoTzspdmScQDfuFsgjA8pQL7aDtXzxPKVDYa71Ks+gL5gjO
         ZbwG7c1j3qJdCV7WSOBJq2WK8ISJ0I9wPG1AWnH+elgMfZvFvsMlbzrTaSan+PH2Rtbk
         EdbYVT1OMG8lLYuFmqVzSyDomEG+pf1iQuAv4ZG77z9YK2HhFdvx19+uN79rSr1BhwEQ
         z9mhrDBoaf0Me8orumW13DxTzaLcQBR7XfCZiScYnSzCoYESmhWULr+b4Dde+gnHaVta
         zPqw==
X-Forwarded-Encrypted: i=1; AJvYcCVqkMkePKUrPntGx2c8FC4FI3ke5gSXIXKd7MsVwd/QvSJIK3esT2g3olt7umiwJTHJDbnmmG5u@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyC13gLLwHniuFbQLSPmKufYe1RCIHqQ3FIJ02jXn4BkslSwUoM
	gOKzDO8J+XMap+GVOq8jMy6wVWs2ndrUj/AEUe++Ai0JH7Gqw0rD
X-Gm-Gg: ASbGncuYXhCe8vAZ3JPL18GcSw6o2czfgsxlFm0LDjNe60/QcHKcO6W9J7viDioISZN
	SJnw+uuyqdiaBg156wBT8pwpOaXj+Lw474RTui6lWyEswdFS/cmWArTrgPQ0k94/SYVWKCSdmDc
	qpxzCs36tE50qrMu6jq41uKxYLOUd4kGt5FE3DA0jQRoHvYRF1CfVsc10xsM2gnEudcq1GbAbVd
	5X+JT2d1kgs7uXGAObExYhGEKBWDy+gHQKamfmkpjSXmU4NDO2+CiNFySIoQxPo7YbFmRcdEmB+
	BYO7iTeSpQslxIXs/XJ0d9EHcakFE8UR35px/Y0+nSSJ8LTSD8MvclbLrYazifk2cAVmLi7n6wA
	oVWI0N5Rx+5xQv75bH/mt1BQlD7ej+iKJns3E6JJvKw==
X-Google-Smtp-Source: AGHT+IE/dFczWKVDfiwOTzNgF3uoibJmZJvpWRK1MoiTaUj4WDZC/8QOwCx9QQK2w2qtr1oI3lzDtw==
X-Received: by 2002:a05:6a21:68e:b0:1f3:32c1:cc5d with SMTP id adf61e73a8af0-1fe42f77d7bmr25182031637.21.1742849952415;
        Mon, 24 Mar 2025 13:59:12 -0700 (PDT)
Received: from elbadrym.c.googlers.com.com (34.125.168.34.bc.googleusercontent.com. [34.168.125.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2a4e8d7sm6537479a12.72.2025.03.24.13.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 13:59:12 -0700 (PDT)
From: mohammed.0.elbadry@gmail.com
To: 
Subject: [PATCH v2 0/1] i2c: npcm: Add clock toggle recovery
Date: Mon, 24 Mar 2025 20:58:58 +0000
Message-ID: <20250324205901.1274708-1-mohammed.0.elbadry@gmail.com>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
In-Reply-To: <20250324203233.1266772-2-mohammed.0.elbadry@gmail.com>
References: <20250324203233.1266772-2-mohammed.0.elbadry@gmail.com>
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
  i2c: npcm: Add clock toggle recovery

 drivers/i2c/busses/i2c-npcm7xx.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

-- 
2.34.1

