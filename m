Return-Path: <openbmc+bounces-648-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 526E9B7F000
	for <lists+openbmc@lfdr.de>; Wed, 17 Sep 2025 15:10:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRSnz0lHSz3cYH;
	Wed, 17 Sep 2025 16:01:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758088903;
	cv=none; b=BGqqTU51zR63GvodjjAplzUfgwhttzKzD3UQFIoBzPUBHLEZh2O7kKylMjmqBr95OQl0gyZhm7f9ETYLyGnEGFrOz6AHf+01/pnhBGhqnncY624QF/mf+lU1TiDt7AtJhIn2UXAjfrN5bw/fQQo7rzfOfiIBGn8ETcrHJd3YTG9RfyQ91+7HpII2p6gDrv8igzRV7S8kyIicOm5zxntX9C55clzZ1/H8VACSrSir6hOCydxsVUlIF8KHO3n/PdAjmzrYRF6+WbPtZmO7taJRI1aYt/6z/ifXzWjWlaLSImgUjI6QfLG56N1G1IG1lHKYqjdTBN62Bw4YaSmdMXfqwA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758088903; c=relaxed/relaxed;
	bh=YDR60bgaMBfktejfH48erR/wtC4dW49gYjnd+yyzalQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ReDhQ2UWsN0tgrjo9ld/TTA8gZpAyDmPsDZqziKH3cW7q3CbHWpWWoxBYI94GzE5RFBEJ9aMdyL3xEmPnQDlPGl8zW5ts2BF7NpzG0nioKnYl/Bu8oq8yOVg+9GGeDlFuGAu0oImlBzN+IVbLWxmuJOGw3Zuz62pMKUCqDVS8GVg2cHgcb8C+GQVGtt9FR5kEbO/6/UNW+pvW/zWzWgHkPxmpYc36LmiTtkd8xpHes5lcN67vfCBf3+ghB5h623FRYo3JhMxepy11b5RP36b9YQRzdUcNcD8EmIZOx8A89KUZgfZ9YHhlVcFgXR4gB0sJbbcXZ8bltGWJkFAlovJpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SoAQTuAe; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SoAQTuAe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cRSny0jpVz3c7q
	for <openbmc@lists.ozlabs.org>; Wed, 17 Sep 2025 16:01:41 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b4d1e7d5036so4150168a12.1
        for <openbmc@lists.ozlabs.org>; Tue, 16 Sep 2025 23:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758088898; x=1758693698; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YDR60bgaMBfktejfH48erR/wtC4dW49gYjnd+yyzalQ=;
        b=SoAQTuAeGlAmVyO7TAzcv0eNUzt+56x/OsXWNDxEy925UPwDCX6yM8dJcvbbyveBBu
         p5F+VbkUkN5u9rg8BkjOZLiIT+ZsBo5UT7kqe0CEBT167THwyzP70Hbh2dH4w7h6DHP1
         fx2eGKsvtPEeQIy13Yl5E1IvMGlRV6P2xCKPrVHcsFi7tjseWAFJRIHN/3a5GOf2tnWO
         8jAfbQXUBpAlFL6mYC1bzSg2bxhvCwcvEAhOZzjR5bfu7uLKujYVCwTIQC/EAR2lGNh5
         y2jDTJj+xZ1p8EyvP8yl60lXZ0VRkvVfGKup9qyNbdntqT7QsaBVBlMaaRDRwrfN9G+d
         iHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758088898; x=1758693698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YDR60bgaMBfktejfH48erR/wtC4dW49gYjnd+yyzalQ=;
        b=wOCOWaBLaDUE77g4kuKznyZZuKcNjHKrGqPrg8yKDab1xfxQVTIjIzeAFA+8EQFijp
         k+xvCSBp4hGNfku9Q4WSPRG69k79ssTJBKszbUqb1AmcOhxSD1wgiGwHu7TFIm4OyWwf
         90+m5UxbQhuvCCRVMhvV86Xwpk9F7TgRmTRwPZN04qiIthAySK6dEWBSWbh/kUXRvGoh
         z+OPXnDYvpQXJ9eKGIrd7G9ZlBndBNlsozq87p4N/ohcXP3sGV354kVUneGdOxjcqhme
         Dr4RttG805Ag06KpX8b54CgmFH9OUwRcJeiFros6QFyhfwBwm+nMn4O4+E6eraVlvqUO
         jUGg==
X-Forwarded-Encrypted: i=1; AJvYcCVdf26tRWZw6vtwQ1N6QXYq15kVRMa6o1jiA6FxSA5uAuOWiRu8Es2rXEJem5cwG5OvDjnpQLTU@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz9IGUFOREe8lyzygCyZbfvLAY9ED4Rvl8inI4m+/W4/XmuNerz
	yTB5Vgm2EWMwcNqwv/Empz0EyVv0bzlo7LeVg2bxpamQ2TjtpVGYLfR2QB2RLg==
X-Gm-Gg: ASbGncu9hdzUzy3bbbBpRtr0qxl8kXQWhpLJ+BzZZ01Myq/cMZqQVmFVgyiOHQVRs8t
	3rVcb0oMTDn2z3YvUt0DVQrGGllx4BiivJm1lE5ivSKfBFgOYGkbQtoggW2FYdS3yOHbgNxK8Kg
	ApCWDl2PKDegICYRuS00F6IfXCTq13xNW+SuUXR4dGFbRmZwMmQw0LK8tUGuORG1emPDAU58EU2
	g8ZZSEt3ZDtjhRyfiKFvR1duy6myIqI14MuuPANEy/bT8kt/JsmuX99/Nx30d+0dS+991gr+VmM
	xk5n6epJY0/mfv83PrEIvtspyDyrn84sT+MZCYivbUGX0s7UfAjCbcjlj9Yx1K7aZRRkjAowSVX
	W2qwniKxsdfgQUvwgdUfCGuNw0DUD6xJGKkb/M6HsfWhiQ3llTt7735dwT+0WE2oqHheJpOQIKN
	MAdTB0qeltc/wudOmUHmc0b0Fwfg==
X-Google-Smtp-Source: AGHT+IGzr1dMz6VghM1SXFbE8+CpxjkC4SuQIA/YpH3nL03bmWEvmJMyCPhXMCKakC9fYEM2fKlQ6g==
X-Received: by 2002:a17:902:d48c:b0:261:6d61:f28d with SMTP id d9443c01a7336-26813dff308mr12439965ad.50.1758088897324;
        Tue, 16 Sep 2025 23:01:37 -0700 (PDT)
Received: from eric-eric0420.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2645b8a6357sm92235525ad.130.2025.09.16.23.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 23:01:36 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Cc: peteryin.openbmc@gmail.com
Subject: [linux,dev-6.12,v1 0/9] hwmon: ina238 backports
Date: Wed, 17 Sep 2025 14:01:25 +0800
Message-ID: <20250917060134.2383005-1-peteryin.openbmc@gmail.com>
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

From: Peter Yin <peter.yin@quantatw.com>

  hwmon: (ina238) Correctly clamp temperature
  hwmon: (ina238) Correctly clamp shunt voltage limit
  hwmon: (ina238) Correctly clamp power limits
  hwmon: (ina238) Report energy in microjoules
  hwmon: (ina238) Fix inconsistent whitespace
  hwmon: (ina238) Add support for INA228
  hwmon: (ina238) Add ina238_config to save configurations for different
  hwmon: (ina238) Add support for SQ52206
  hwmon: (ina238) Modify the calculation formula to adapt to different

  from 024e5cf24327184bb363b6e330550394982b93f8
  to c2623573178bab32990695fb729e9b69710ed66d
  
Chris Packham (1):
  hwmon: (ina238) Correctly clamp temperature

Guenter Roeck (2):
  hwmon: (ina238) Correctly clamp shunt voltage limit
  hwmon: (ina238) Correctly clamp power limits

Jonas Rebmann (3):
  hwmon: (ina238) Report energy in microjoules
  hwmon: (ina238) Fix inconsistent whitespace
  hwmon: (ina238) Add support for INA228

Wenliang Yan (3):
  hwmon: (ina238) Add ina238_config to save configurations for different
    chips
  hwmon: (ina238) Add support for SQ52206
  hwmon: (ina238) Modify the calculation formula to adapt to different
    chips

 Documentation/hwmon/ina238.rst |  15 ++
 drivers/hwmon/ina238.c         | 323 +++++++++++++++++++++++++++++----
 2 files changed, 298 insertions(+), 40 deletions(-)

-- 
2.43.0


