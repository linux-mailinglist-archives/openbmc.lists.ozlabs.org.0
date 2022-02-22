Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C5F4BF0D7
	for <lists+openbmc@lfdr.de>; Tue, 22 Feb 2022 05:16:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2m83684wz3bVy
	for <lists+openbmc@lfdr.de>; Tue, 22 Feb 2022 15:16:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ervmXxEH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ervmXxEH; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2m7j4pYlz2xrG
 for <openbmc@lists.ozlabs.org>; Tue, 22 Feb 2022 15:16:16 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id
 ci24-20020a17090afc9800b001bc3071f921so1119786pjb.5
 for <openbmc@lists.ozlabs.org>; Mon, 21 Feb 2022 20:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ut1vIkQDMis2BRekryzzIqdRNkbNBKAe0TOZAEo0tGA=;
 b=ervmXxEHqWkiK3K265AJue1ovjYqfjb3u/TdRnV7nyF6O2DSg1htDPJWjJECYowrbC
 +SOvXa10Fa/IngyDYe9IwJzlHB9LDw7UK02kPO6OfTidPR6/HfzOw8ueJ1DgUnoh2ycu
 9iuIhek6Y+Ny/T4XJhPS0XoQSaCG7IuKig7qaqVIAxjwHUXv/HXKFwsX2ZLa5j/4S3SZ
 MzF2IU5By7RzyZM8kglsaHGvdO/wsTTMMWvbD7fyEw4zctxN6iKPj/xvp4ZD+SEp8Alf
 BwDz3PuHm301q7jxKOh0WuMRTmLLUARJHus9YrcoeXPzWiq4tSupfdFB7+nOuk0ZfHB0
 KUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ut1vIkQDMis2BRekryzzIqdRNkbNBKAe0TOZAEo0tGA=;
 b=mWO2JhmHzGjjnWR91xe9gv4TrddxPI35PGLoOaJ60twD2vCzphR5SmXC38k+G7uUH5
 xFAGcSaYBO80R8rFVvquBaVB1Phr1WZWDcAmKR9tziojz3Mad3vGNiES5UqQec0cOAIk
 ROVITYOPLn7JK68nFZE/BdUnZH7ft3iYtYrWtlj28UMZJhUt9B8X6kE35PMqD9GAA5+b
 w0Juvoi31HYbllkGOh540Ohx0bB+9WnZsVfJGM67EaXX+pI8GnHCQvJ7H3z13ycLwbBm
 3nuEH+OA88isoSQDC3JMzJxtQdC4X0hqRVdSf7/0PVwHvJokC1hxQpu2XhfKXiHou+DO
 nA6w==
X-Gm-Message-State: AOAM530/LH/DCqe165vHKZKRvUy+LKIWH+65gpe0GIixZCGImrsdCNQu
 Xg6YrXlNNXRyCRXkw0qoQbtiqcinaki7uQ==
X-Google-Smtp-Source: ABdhPJwI2GnbiyWp6C5BjyUIaCXWWlcDUSyD90vY19z9rNLdFA/VfP9jhND8t58eMJ9NfA7ZW1TFQg==
X-Received: by 2002:a17:903:228b:b0:14e:d9ac:8281 with SMTP id
 b11-20020a170903228b00b0014ed9ac8281mr22073761plh.112.1645503373155; 
 Mon, 21 Feb 2022 20:16:13 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id p1sm14457281pfo.212.2022.02.21.20.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 20:16:12 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 Eddie James <eajames@linux.ibm.com>, Andrew Geissler <geisonator@yahoo.com>
Subject: [PATCH 0/2] ARM: dts: aspeed: Add p10bmc rtc gpio battery gpio names
Date: Tue, 22 Feb 2022 14:45:57 +1030
Message-Id: <20220222041559.68651-1-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is the upstreaming of these changes. The version in GHE used the
old name, so I have sent a change to our fork of entity manager to fix
this up.

Joel Stanley (2):
  ARM: dts: aspeed: rainer: Add RTC battery gpio name
  ARM: dts: aspeed: everest: Add RTC battery gpio name

 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 4 +---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

-- 
2.34.1

