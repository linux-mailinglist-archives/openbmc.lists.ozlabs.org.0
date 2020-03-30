Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCD2197244
	for <lists+openbmc@lfdr.de>; Mon, 30 Mar 2020 03:53:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rFqL41JhzDqYd
	for <lists+openbmc@lfdr.de>; Mon, 30 Mar 2020 12:53:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SBOTLavj; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rFnQ2Gx9zDqWx
 for <openbmc@lists.ozlabs.org>; Mon, 30 Mar 2020 12:51:53 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id nu11so6658585pjb.1
 for <openbmc@lists.ozlabs.org>; Sun, 29 Mar 2020 18:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jeytgYItM2C/l078FQmlIPREHzN0TKG5g3vwoHLyJ/E=;
 b=SBOTLavjt33vlD3pcha+qIhiyRli1QM8/fGwDM768sCJrwAzPxWtZEoP6F98pduhAB
 MYb8COjnPvSR3DEK63L87NTtVFnxHDVNgQVu6/ObtN8OP0rgZ8hTM0olCUoYDey7IivO
 Ie+J+/LvYN984TYFcarPkCyJVbBbFo7JDadxPNf5zv6syE55/k/KIH6co6STxHDxiTQ5
 Tn3kPcZ/jEuX5mAhIHfFTY0BS9oLfHptqPQo8hka+YI/eqV+FQuiNvRcirdUIqE7CzXo
 001dvSUrB1JFfvFNP/0MrYOGlLNGxwautDJ0CG3HxoCTEuJvOVDRw1e6uoIr5cEVL2/+
 Oc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=jeytgYItM2C/l078FQmlIPREHzN0TKG5g3vwoHLyJ/E=;
 b=NLqt0cQUOSpXfpb5dJy70fkLk9YmBepyNif5Cs1Qkf79mUPvzqHvhfkPb2uYz2KIVk
 mkkGXsSamJWIDml7Iikaadf/n7ChAs5UHZUnGkal1zRTFkRuGYy5n9rfEnreRWHlgfFo
 JA4jalach0OmBtyL2Tdg0+e4hqs4lRH3tg3SY8bi0CeZZ4Hs4Yt+3dEzS0CxIgv6NIDx
 FyJ8DuhEQNPKAiMr+2eQTisKTbr3MFYoTRpp/EZsAZC4kVtNLivIDf6sc7XrWl5kh2t7
 DQrkrDljG1Cjz8iaiSLZnddk5ytWeQYtKieM+iSpjTS5UZ45qjfyrWAoFQCZ1Z943LmM
 sByw==
X-Gm-Message-State: ANhLgQ3/aSFmAxLLGCYRRavQ8vlM46gZq6BUbSAXAxKYxC5kdupAyx5s
 eitkifLClzjN7x5Qd8c92Qk=
X-Google-Smtp-Source: ADFU+vv+NR1Mhcgo9OOaqjQ6Osf5jGQYbSmOGg6wVxSNzIbNypVHxK0M01reYJcBI3SYrk0PGpTuvQ==
X-Received: by 2002:a17:90b:82:: with SMTP id
 bb2mr12801270pjb.25.1585533110257; 
 Sun, 29 Mar 2020 18:51:50 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id y17sm8897327pfl.104.2020.03.29.18.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 18:51:49 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4 v2 0/2] fsi: aspeed: Support fsi pin muxing
Date: Mon, 30 Mar 2020 12:21:40 +1030
Message-Id: <20200330015142.132779-1-joel@jms.id.au>
X-Mailer: git-send-email 2.25.1
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

This adds support for configuring the PCB pinout (not the ASPEED pads)
used for FSI depending on the state of a GPIO.

v2 fixes issues seen when testing on hardware and reworks the gpio
handling

Joel Stanley (2):
  ARM: dts: aspeed: tacoma: Add GPIOs for FSI
  fsi: aspeed: Support cabled FSI

 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts |  9 ++--
 drivers/fsi/fsi-master-aspeed.c             | 47 +++++++++++++++++++++
 2 files changed, 50 insertions(+), 6 deletions(-)

-- 
2.25.1

