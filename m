Return-Path: <openbmc+bounces-419-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1133FB1CF95
	for <lists+openbmc@lfdr.de>; Thu,  7 Aug 2025 02:01:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4by6kx1H5jz2xck;
	Thu,  7 Aug 2025 10:01:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::429"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754482361;
	cv=none; b=TOX7g/YFY/MriYQ70pD37inwXh0guFyJA07o0fkCpOaDVxA12OpVy5Ue06Ufgd/nxDZN56WlJm3qUCQtTu1N+8aIU1z2fh2kq8xXE/WOa6zQzE34ACQHC2g5B7mfAnJUZW1NqC15Cxa8vZZnhDpSN6SOfwriIJgcGLhvAKQwYLOiH6eTHrLmDFSv/eXgrtienF5mOqi3NifgEiPEWrtLVPD52ESwUZQw3YVbnJYOAsL41gCcYVyo65ockILbaN0jsbcxfTQnULYRZFR/3tmBbQhxGI2Pch6Y/edF3JqQ4bnhaI9IwHX8W/a1DpFEy8yprBHVEFdPpyGhIspLzB3J6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754482361; c=relaxed/relaxed;
	bh=iC1DBIlPv0nesiC0wTb7XDn1WctmeQzn0UL1ioICEDw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lpcYkxBewBdRAih5NGsg3AfHB+DtzOtu5D3hjENukjKxYGMuwzMPpZa/SVTPabQHTSrJGcSjuaClT5wcMjHl8Uwb7LiPSbQ1xCSEriekzB3fbJOBlleHUFu95uUVAGuPTNZ+24G1EuPyoCWpEzoxFioAwZ1FCceBSkczY5O9P25nlo3O/01+6+lkVcmeQMSFccfoAYnoUejZ0xOlk82J0iVwOXZdE57QDy9JcgxtjpDP0r+IovCUHTEuGGLvePXwF0/o+W0c/I0RS9CvbggT8MLBpXt2eMTCEdBOe+JavtP4hAZYEdquD1mdcIAtW7lgJb1Q1slLSvaJ/0IpmKw6rw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JnE4AZWR; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=fredchen.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JnE4AZWR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=fredchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxq1N3DlCz30Vb
	for <openbmc@lists.ozlabs.org>; Wed,  6 Aug 2025 22:12:40 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-76bfd457607so3392847b3a.0
        for <openbmc@lists.ozlabs.org>; Wed, 06 Aug 2025 05:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754482358; x=1755087158; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iC1DBIlPv0nesiC0wTb7XDn1WctmeQzn0UL1ioICEDw=;
        b=JnE4AZWRNmiqai8L8neexWCinYZq2Aw4RNa+Iqb+OvG7TI1q0FZYMzjwPiYOuede9H
         zBJjlcvwxWYQT5SzQLJgOGPN3oQQ/+6vs/AoMPlFVCLYbrfn0yYu/zZ3dHKJdqCy6ADD
         jG1RT1WogKJQFe9YjDKgpxS5tWvKohlpEyTkkMgQvADiov7XaXcQPXuKqMD1d74A5GBf
         O4Z54o2zHb2tPvb7Rty/GQh1H8oTBjQqk/GY/x/TcgC0SX3ccfeUMjaj9G2Bg6fJ52xQ
         ItEKLDTAK8MB8BdmvCwD7FGB+gTM8yAFiRqmTEzMfatE71c7XcLyVhJnB5QC48d0FqPT
         N2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754482358; x=1755087158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iC1DBIlPv0nesiC0wTb7XDn1WctmeQzn0UL1ioICEDw=;
        b=dOQiIrFe9cDvhvdmZHq3h//s/NzpcCs5H3NbclyV8JnYOxvBvU8qHvW3uHn8zRk67T
         FWTnbyzWySS2Tp7KZ+BPALLn1fKXj6KaFxi/es+FHq8ftpaKGKmz9z4Zf1+ZFmuFUOi6
         j3eHYfx0vIWFREpzbDmV5rmI0n2Epv/pgMY0DTSdLPNzLXE2PDqCsoaYh2A5eWrgNVkH
         Ig3GScwriNSobwWsVNKaqq2ZOQZVHWRgiHDGbGtzW/tH0ditIJWXkUhCI1TS76mjPtcN
         fdLgBdDTktDsnch1049XG/KHfaetke7V6wrZRORJd/3ibYdAjs2y9mw2Zoh/fb9nWrAN
         I9Zg==
X-Forwarded-Encrypted: i=1; AJvYcCV8chFCYsQnU5d+BO8nOFwKmDj5viVn1NDx0APl/Dfb8V62f5MC0O7wlBk0ovW2yJy60Tz2JzuX@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyFlL7URIEf5RYqRgqPvoW+M4QeA7YlunJwlLXy2PIffpmaYBo5
	/+4H5kwKhviZwtJMOB0izSWUrwNraePQVJx7TPRFgXnm4QlSJ4+rfqEA
X-Gm-Gg: ASbGncslExGnpu/VjRjiMYCi0VCR4yjbY1kCvLwncbLlkWFlxIRpNpzTRLdDfQlBvYr
	Dy+XCfUU/rPqMz3dBpZIsqvhQFtcOJqOlSyMmyaYYSJri58SnHTz7NUx47jeh6ndgeiT8Z7T60d
	aKkt8AYNonFv5ke7naTMSYne40n/1OYd/qKjO4pN38hzAeVUwDuvfslIZx5kOG5qDHPIilKL4QL
	Z6SyEXG3qEBbglSQHQ+aZmpsWZbJTBkoen43taQc4mzb1kNpJqDUQ83QA0z+F4v8JnTZmZdgIa6
	e1nh3yXmNNCW3YVYOecRb2tfalUOR7hoPxJZZzcDKueAGunqPIlHGXPorpLGhsUr1g0vHtUMC/9
	yAv6DVFiaaPn6a8b2z5Oog3OjbdZwQHfS1qxSqll2GFrfduiBrfxu0n0l5ruZ9JEz3rTTprDulD
	Jv8US5/8lfIY4=
X-Google-Smtp-Source: AGHT+IFjAQ3xUxNzOh+PYEC3ZeFENADlR5jv1tLEU3DEoaGUibS6ucevsdXIOmpZ3llpXEFtOn/G8A==
X-Received: by 2002:a05:6a00:3998:b0:76b:f5c3:2af9 with SMTP id d2e1a72fcca58-76c2aa67279mr3096426b3a.24.1754482357958;
        Wed, 06 Aug 2025 05:12:37 -0700 (PDT)
Received: from fred-System-Product-Name.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce6f474sm15212060b3a.4.2025.08.06.05.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 05:12:37 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 2/2] hwmon: (pmbus/mpq8785) Convert comma to semicolon
Date: Wed,  6 Aug 2025 20:12:32 +0800
Message-ID: <20250806121232.2331329-2-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250806121232.2331329-1-fredchen.openbmc@gmail.com>
References: <20250806121232.2331329-1-fredchen.openbmc@gmail.com>
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

From: Shen Lichuan <shenlichuan@vivo.com>

To ensure code clarity and prevent potential errors, use ';' instead of
',' as a statement separator in the function mpq8785_identify.

Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
Message-ID: <20240919064939.3282-1-shenlichuan@vivo.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
(cherry picked from commit ff140456b5fbf03cbd04277c21d4fcdc5974e97b)
---
 drivers/hwmon/pmbus/mpq8785.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq8785.c
index 4e2549cc8120..3b1d978508f8 100644
--- a/drivers/hwmon/pmbus/mpq8785.c
+++ b/drivers/hwmon/pmbus/mpq8785.c
@@ -22,7 +22,7 @@ static int mpq8785_identify(struct i2c_client *client,
 		break;
 	case 1:
 	case 2:
-		info->format[PSC_VOLTAGE_OUT] = direct,
+		info->format[PSC_VOLTAGE_OUT] = direct;
 		info->m[PSC_VOLTAGE_OUT] = 64;
 		info->b[PSC_VOLTAGE_OUT] = 0;
 		info->R[PSC_VOLTAGE_OUT] = 1;
-- 
2.49.0


