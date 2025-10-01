Return-Path: <openbmc+bounces-703-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F20BB01FB
	for <lists+openbmc@lfdr.de>; Wed, 01 Oct 2025 13:21:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ccCD93s1Wz2yrT;
	Wed,  1 Oct 2025 21:21:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::541"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759317673;
	cv=none; b=d48IyoeiJitGrr+MlLyGhn2LsVkvA3ky9QTecCfqnIyCG7DdudpUcVLEwIHLcKQozwUxOwgRFki7EJzvHr5FrSmxPg84Z8s3t8/1MDNbHqPFrMgjuEWPTRyOJ/en11WlzkPkfsksEN4KsmQz/UBLC0nlyoZm2jaOHhFH9N8SRrUkN2gVflSjrMfE2y0V2jXoiZt5KPmqroy2dJhmhFSkrWJm8KOxltFbyoGjAEVixRi2vZD6UsUZaWx64zBcrxa5gwSOzSEcs2U65jv1T2uwfsMxy/IwkTtCzAJDproLBJPgMvmWfrYhvqFFV0BfsBrQGTPMT+V/YZaGW71YfUcSKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759317673; c=relaxed/relaxed;
	bh=1jlvgPmNEsdtV1TV9wVqnjnDfMsc/ga1zSnputfWHW8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=atZY4m/8Tr109dtGtFjTK2/9oiHCI6mJ5Z1fJE5Gia2in/rvwdgHzFosNhlDEI3wOxoh+Y7f1IQDFw3ab9H3Ks8hy89QcDV/pIEAgBXMrllVQK4A/kcFwMNCeR3Rny4bZmy7BmRK+blLqRSDWgb/L+njfbz3KV3Xmzhpy+ukGKUYXGOlEz0RJit48WyM/V8mRcdZhLFMXhuxFH2DGagU4EmM/YyR9jeM/EiC5MyvgMusM+q4L90ozGvkdcpPR9lu4jiTVRLz1lKKi10LnPQDr4xEmnYC0OFY3nXLe7cqKDI3NGFpfGk1WyiOnL8dvSNKiyOOzKgFBUFRuSoxByyGZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iTTH6l/D; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::541; helo=mail-ed1-x541.google.com; envelope-from=eric.yang.wiwynn@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iTTH6l/D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::541; helo=mail-ed1-x541.google.com; envelope-from=eric.yang.wiwynn@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ccCD6726Xz2yN1
	for <openbmc@lists.ozlabs.org>; Wed,  1 Oct 2025 21:21:09 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id 4fb4d7f45d1cf-61feb87fe26so10380993a12.1
        for <openbmc@lists.ozlabs.org>; Wed, 01 Oct 2025 04:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759317664; x=1759922464; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1jlvgPmNEsdtV1TV9wVqnjnDfMsc/ga1zSnputfWHW8=;
        b=iTTH6l/DSmGNrTxmBOUmVAi20A4ihQlFSie3eOMoEI08KcsioNYb5+BjIaGLDx1At0
         u1d91oOaEtbipjscuq7c/mvnq4jyk/wEXkL9Co9595N5NOCG17qVuiLk6q+/OhzKhPDc
         R+5Qi55M/ooETZo1xhWcxvdXp8ML6cBs6DRLNVV5kkENP1A2cNaxGk2yu/D5yYMLteoa
         pxGmQfgDd1Lx34JhTSVI3bTGoG36rmDRAYBuJOnA+7+PVeCojGmj5EPut3I8DmJChfb3
         6byQB/BeCrLBVgv0H3rRroEFJc9jQu2ABJ1yW3fmHhOqPuJb8TSmCgWYd9EU2B96JRzO
         wgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759317664; x=1759922464;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1jlvgPmNEsdtV1TV9wVqnjnDfMsc/ga1zSnputfWHW8=;
        b=xAGRneoKUIqTEx/p7zWG0MGG+HNo3ccc2IgR2CYe4T0+RlKuQeY5JYqjjzxlOVtyng
         w0V4XTtVfJqsoYjtGvie3F8LpnnBi5bon1lFFJIDJtpZO2M9Z4qZW6YUyvZLPnZ2p9oF
         uDAPY3d/TTJEtS+7gvmYDMFz47THdHmGa0U9aYzbxbTgcDaGb+SCQXI5sTu7JKdDNLtt
         90JRCAuTcvX9oL68ssLM/DDwkiceO02kdnMCxT9fjn1IhRP66GhuJmzam8bM1DDrwYrP
         Ng+0QDhFmh89057jiud8QkqidGtmekSbdGl8PVi1fizmq2zwee3L03qOW+CGDqTeLwr9
         uw3g==
X-Gm-Message-State: AOJu0Ywn4EmurN2OxeYBCAvYO71TacoQeuOO1LQRAZ4yQESafvhkyq2D
	lKCLOZ2MhPPT4u93oMq0yV18qLynU47uOcy4N/7a47iNe35OLY51T+cd9ZcKmedWDIX7e8zHuaF
	leqOYRIBZcSRQyXaW1i/NFslRtdvzxV453V6NpLvhvg==
X-Gm-Gg: ASbGncurWZ/PAMAVXpHhiVC2bkaFqnX9PrweejzPHqIDOgZDkY0/wjIpTwK4t2aHrJi
	xuLmoyJMHU+NGijwxJwxw/oHrHXpVWnXJ1SPGeKsTHtANwDePLL1ZqO9ZKCUg+AyXsrMXDEtPCA
	tO+DEyLJHmcOtSGOu+/1Ymw696RoyDfXY0BzcOSoYMucxuhsxnKdbf1cP/zHZMiMWyphpV/RSJT
	ViquTHspP/EcLnO7F50PuIpQMPYzQMHY5vED2w1SkhAFC+MOHea9Ca9zJOyq7Ipeg==
X-Google-Smtp-Source: AGHT+IFx1N/6POXjyLQV4zA0qIGgs0dRY/l4NuqCY0pIEvFGMtCPlaLBR7FI+qNveZxoq3Cpsdwrqn0xYH4gE7DOmUo=
X-Received: by 2002:a05:6402:1ec9:b0:634:6e8a:d810 with SMTP id
 4fb4d7f45d1cf-63678c4cfb3mr3669511a12.17.1759317664225; Wed, 01 Oct 2025
 04:21:04 -0700 (PDT)
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
From: Eric Yang <eric.yang.wiwynn@gmail.com>
Date: Wed, 1 Oct 2025 19:20:52 +0800
X-Gm-Features: AS18NWBqoPpehSUreMG1d1pUmGhqL4Cw1j9I-ZSOLn0MeKnuvyCIHCdoHClJLSA
Message-ID: <CAFme=r=6AbKYkFMUKA1Xwpt_b_4QFVkAb=+d03jHVfYX_5QaXg@mail.gmail.com>
Subject: Resending (plain text): [DISCUSSION] Policy for handling ObjectMapper
 stop: reboot BMC and refuse manual stop
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi all,

Gerrit change for context:
https://gerrit.openbmc.org/c/openbmc/openbmc/+/83946

Problem:
When xyz.openbmc_project.ObjectMapper stops (cleanly or due to
failure), the BMC may continue operating while the mapper is absent or
reinitializing, leading to inconsistent states across services that
rely on D-Bus path resolution.

Examples observed:
- pldmd: GetSubtree may temporarily miss MCTP EIDs, leading to removal
of sensor objects and stopping sensor polling.
- phosphor-state-manager: may fail to retrieve the correct
PowerRestorePolicy during system discovery, preventing host power-on.

Proposal:
Adopt a default policy to:
- Reboot the BMC whenever ObjectMapper stops or hits the start-rate limit.
- Refuse manual stop/restart to avoid operating without the mapper.

This can be expressed via a systemd drop-in:
[Unit]
SuccessAction=reboot
FailureAction=reboot
StartLimitAction=reboot
RefuseManualStop=yes

Questions for the community:
- Placement: Should this live as a default in phosphor-objmgr, or be a
policy in meta-phosphor?
- Stop prevention: Is RefuseManualStop acceptable?
- Safeguards: Any concerns about reboot loops if ObjectMapper cannot start?
- Reboot reason visibility: Should we emit an event log indicating
that the BMC rebooted due to ObjectMapper stopping?

Best Regards,
Eric Yang

