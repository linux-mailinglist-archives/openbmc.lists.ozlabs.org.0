Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C40F67E7758
	for <lists+openbmc@lfdr.de>; Fri, 10 Nov 2023 03:21:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=PUA4ciQN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRMyr556lz3cV5
	for <lists+openbmc@lfdr.de>; Fri, 10 Nov 2023 13:21:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=PUA4ciQN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SRMyF6BgQz2yNX
	for <openbmc@lists.ozlabs.org>; Fri, 10 Nov 2023 13:21:23 +1100 (AEDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9e1021dbd28so263140766b.3
        for <openbmc@lists.ozlabs.org>; Thu, 09 Nov 2023 18:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1699582878; x=1700187678; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9piFMIH5WthJ/4tiK4cdL/OcEUASZcCztNZnammjiU=;
        b=PUA4ciQNK5mTWO1qnV0FqU3dG452ms/TttiGvPVZzHjtOVAyR4r7GFvpTgZFromMNQ
         eNu9q0tLAduuy8ZcELqNHlPzNT8Mp+2/+mOESrYQmuUJDQx3+I04mPK89H16jaVuNUBu
         7OEujVeT/8s1e5wnFGMUwKdOio0ciBWiyrSK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699582878; x=1700187678;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z9piFMIH5WthJ/4tiK4cdL/OcEUASZcCztNZnammjiU=;
        b=K/4qyD3Sa30wazO11As8LCJtiAUGOcv94db2yljoNdD0eBFVqZF8YMfBywW6STxghh
         VR3kp6wloL3bcvTbCP0K+c6QRYxFIGimKOFa3FJxXFwHZZAfPysYf1226xUJEmyWRG40
         3Mi8N/+vIepEVAdPWAjcELzOq5FHvJy41xVqh/Rmj5jytSzjACGTb3cLb4bUdwRs6kkI
         09dkqBRGGeDXyPQIcwCa5ZveH/Z2Kj1oxWsGS/7W56ltAirNjAIAH65YRVvVzXp5j1En
         aWhm5ikL9KCHpPXFPTNA68BN998i8L5JBVnLgx268r7J6ARacith+bX4eJrsREfp6i5S
         9k7A==
X-Gm-Message-State: AOJu0Yx1AUX1GkL6FyK9nS4TI3kW0M+sBE/P9TsRG+uCmAjuJYdqMJtV
	xyiKYk8BpQYUoy25VrpVfdiwLhjCdGN1YF9iZnLi42V0
X-Google-Smtp-Source: AGHT+IF8gNPpQ8ssNEWCx4kVgUTnSNL55IjcTlUuoKUi7VP5UJAeKZZ43Gecp8uiPTLrgCdraFEMlKMsvr8y7Zrb5XE=
X-Received: by 2002:a17:907:1c85:b0:9c6:8190:359f with SMTP id
 nb5-20020a1709071c8500b009c68190359fmr5528772ejc.33.1699582878086; Thu, 09
 Nov 2023 18:21:18 -0800 (PST)
MIME-Version: 1.0
References: <20231110001634.6638-4-zev@bewilderbeest.net>
In-Reply-To: <20231110001634.6638-4-zev@bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 10 Nov 2023 12:51:05 +1030
Message-ID: <CACPK8Xda5iwTFoJSHjLxi1yafXrMdLn1TFEy1tBgawy5GUcnwg@mail.gmail.com>
Subject: Re: [PATCH linux dev-6.5 0/2] watchdog: aspeed: Add aspeed,reset-mask property
To: Zev Weiss <zev@bewilderbeest.net>
Content-Type: text/plain; charset="UTF-8"
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 10 Nov 2023 at 10:46, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> Hello,
>
> This series is a backport of a couple patches (now merged upstream,
> review discussion here: [1]) adding support for controlling what
> Aspeed SOC peripherals get resets by the watchdog timer.

Thanks Zev, good work as always. These have been merged.

Cheers,

Joel
