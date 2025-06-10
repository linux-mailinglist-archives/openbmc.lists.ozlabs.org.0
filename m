Return-Path: <openbmc+bounces-149-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F38AD398A
	for <lists+openbmc@lfdr.de>; Tue, 10 Jun 2025 15:40:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGqgD30Jfz3bpM;
	Tue, 10 Jun 2025 23:40:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::432"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749562840;
	cv=none; b=VavW3Bdi1jyBDJhgLegTT0ujlEoXlnz9ps77lxpk8/uBiN59RXOR98goQWL0be4RMNeiPCkvR1gZapqcwW6N8x0xiULLFvC4ur4VLwnzeS40lctMBBuMzvVitVsV4kDqdXO2hA03KKNLrRSLn/Jax+QPeqiKlVwSzsCgDeJbUg73rBg/r2+9yv3W8HOwt09tl+Ug6aT4Gz9rFz3YZSQJQu4Hnih6yJL+12ImQrrmgz5YvNuswxaOQq6k7UPTLTZiZp3Qmmqpa8fhgydlUn8+L+SCCUpBUH0wQm++6htuHzWXmK1UU1CRRiu2iy1Ak1haoZJYPMJt2PkV8pS8+nKJYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749562840; c=relaxed/relaxed;
	bh=Ijd4XqG0xSS74jqLQ65lr9OAcQeTjdRkvMX7V5aL/RM=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=bK4ZaWcgrx7wDzPcJ9S8gGRUJKJsKlAQ6/c5Md+hYmWst0tY8OqjuBXhalELdeuZ4xV32R3w7F6Y5EgpYJ7VmxP/6sRleFZHX4RJrBG9OZp9n8sszzJ8GIgkqvloSTW8D3Eqr2gtf+Eb+PUt+wS2P3sKa0mIzJNPKBVYXG8Pvs8/xEVQ37Id80Q3qYaWd3rA0j2ZccefQwFXH4BWeQyaMvL2j7oNPRnHLDOwzlWsS2EMAZKaz/UCD/SvKa72EIW0LCI7d0JYuZaZXQPZ/Tf/RHIeryQGhkrc8oWEPR2xrINJ6tRjeRb71uamCMofWP+hs7r2wjl65HwrRen4bwF2eQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eS+qAPwM; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eS+qAPwM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGqgB3sLgz3bpL
	for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 23:40:37 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-747ef5996edso4154838b3a.0
        for <openbmc@lists.ozlabs.org>; Tue, 10 Jun 2025 06:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749562835; x=1750167635; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ijd4XqG0xSS74jqLQ65lr9OAcQeTjdRkvMX7V5aL/RM=;
        b=eS+qAPwMk56ROuz/pcSgSRM0+HplE4gf83X3/9Hg26ZTK0jbImM7YGnBXqsBX8WMC3
         fO6MipubloYKh0vVhjrtq8J/qxLsPFNRWE8C8G2m6HNy5OZUo/j5Yz0Wj/9BVQjEfQXG
         o5oFi5sssJx/Gmkuy5bCmw0/eCGcNRAJBjiOup4k+/yIPO8c0wtDsxmYhyro3X2IlGay
         fpyra7WfT/uAJF65j/jFNdC+1EhFpwcqjNT2BlAazdBVWvus3TyN2+9D7VzrvTKk/MlP
         PTD/kkudA4BvIW+XTeqzLC49hRTKKOlg9EHoUhzQPKVPoCtrl+MgMvpkkhkIxTsVt52P
         iOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749562835; x=1750167635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ijd4XqG0xSS74jqLQ65lr9OAcQeTjdRkvMX7V5aL/RM=;
        b=jm2WFKUCNmfP5ms7LcYx2ve0Sp9i4AkZ+MOs+o0XFHmNG8I7MpN5UylkXoMK9LnJ40
         lrg1Z9mqy8HlqNYp6fjGV0MTmwRB+No5c+yAZYu2aYM9ugX9MNs3LVNtNnIGufENsEiX
         4WMxPuYFMAF6XQNLnZpSrcw8FqM+6F7BTc8fHGqoaAxHMt5gI6E48RMeJ0I4baadboLf
         VU/Qn9/Gb8bNvT98wJHMPI+gQmkILKC4lPHXNscKQSb8EbvGroyOSb5Sfvjnw3NSDrH3
         76cItRo4AROi86krNrnLeEVJoRgW6JRSuxgj/4dFQcZ/gBMt8D2EaWysZ7daN/XMxnsH
         eo1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWqIC0vLTpPr+a8WWPGwK9ttrpK8TG3hwYRiPVdHddWvm1qg/JKsTe0kkn1WLRKNusouWUfEu0C@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx4IP/tNgYz0+jW1jWpWqnbYhvdwoSRp68baGcAj6lHPfpUX1Ee
	ByLDSgxsURDvhADX031rMgxZQMGdyxIN265HFbpIj/INiB4rMcEQK8wP
X-Gm-Gg: ASbGncuV5Z48ly0s6riUTt1Rdi5E9WKCZlHpVP43D4DoeZw9/Nsd0dpzLERpLqLaqq5
	rQMwXtUIO3x5WFYCjDaIojSF4f8cRS1aX/r4rn7sj0lJy0y+BQXWUjBr8EcyNUUW03DWZzwjRYA
	/+VlAFe3YngHD7OvA1TSRRRhsYZauSdzaVhHBZZ4a8IFJR5jp0RWDHp10gQftMxe8dJ7zBmEFtK
	W+/3insmCtyvt6OhNKUfdISKnm0OCCEbEkSrfkm9B2n3ZwmaFvFVPza92g4/2hUvGsZ3fAU4Ffk
	XDEuXVu4CBgn+e/7kFGjuTaKNx22I4CA1DyLLs7qSOFOjopWPeK17kCbiqZ3C1D3P2NqpHsk9vz
	NbF+no8pSOLtGzJYdKDFisZG9gmoBkULDJfqpCYOplkjW
X-Google-Smtp-Source: AGHT+IHxHn3Um0WQZ5R1BR4NR3uCR2bsH81L7wjO3cOoDcpqUpUIPgd85rDBfiEQL11v96MsDBWttQ==
X-Received: by 2002:a05:6a00:21d6:b0:73c:b86:b47f with SMTP id d2e1a72fcca58-74827fd6127mr22228776b3a.4.1749562835117;
        Tue, 10 Jun 2025 06:40:35 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0842c0sm7401955b3a.73.2025.06.10.06.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:40:34 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [dev-6.6 v2 0/5] Align Meta(Facebook) Harma BMC(AST2600)
Date: Tue, 10 Jun 2025 21:38:25 +0800
Message-Id: <20250610133830.2704829-1-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
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

Summary:
Align linux device tree entry related to Meta(Facebook) Harma
specific devices connected to BMC(AST2600) SoC.

Link:
https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/aspee
d/aspeed-bmc-facebook-harma.dts

Peter Yin (5):
  ARM: dts: aspeed: Harma: Add PDB temperature
  ARM: dts: aspeed: Harma: Revise node name
  ARM: dts: aspeed: Harma: Add retimer device
  ARM: dts: aspeed: Harma: Modify GPIO line name
  ARM: dts: aspeed: Harma: revise sgpio line name

 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 76 ++++++++++++-------
 1 file changed, 50 insertions(+), 26 deletions(-)

-- 
2.43.0


