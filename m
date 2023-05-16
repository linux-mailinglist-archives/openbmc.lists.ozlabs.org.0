Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 823C4705C0C
	for <lists+openbmc@lfdr.de>; Wed, 17 May 2023 02:39:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLZ4f2RlVz3fLf
	for <lists+openbmc@lfdr.de>; Wed, 17 May 2023 10:39:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=drut-io.20221208.gappssmtp.com header.i=@drut-io.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=ixcIHoXt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=drut.io (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=sidhartha@drut.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=drut-io.20221208.gappssmtp.com header.i=@drut-io.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=ixcIHoXt;
	dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLC763hByz3bTf
	for <openbmc@lists.ozlabs.org>; Tue, 16 May 2023 20:25:36 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-64ab2a37812so4383867b3a.1
        for <openbmc@lists.ozlabs.org>; Tue, 16 May 2023 03:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=drut-io.20221208.gappssmtp.com; s=20221208; t=1684232733; x=1686824733;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DC6gL4A336Rrj+81Wn4CSqITramG+K7uwC7L5/oB9cc=;
        b=ixcIHoXtldCR6jpgtamg65RPYkd+HrupAa19ulvZwZHOBlFyOrZk6tbLaAzFjOPTvN
         YfSF7hEaLEcP0DeqwKGMVT/MrLLyB+B37/kISM/P7+VCgzP4PRG1wUQWQ0fWbq6ndFn1
         3h62sj5It7UzkjhlxgRbAdJsxpXvSMpZHSmMVet2Pl1grNqBBZDsz7TduT981rLyMlXn
         wtWoLi6m/+q3VdBdgB8y8FUI4SgKKHFk4shTYdIiwGY0yK5cE0lhPKD1TYS+5e/f/i/G
         x9vfrLnBCmBQStdjvTiP+IxIBqjy7YL/soAU+4OtloytGpTzOAcexWGnsR4oCpf8fEJY
         nq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684232733; x=1686824733;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DC6gL4A336Rrj+81Wn4CSqITramG+K7uwC7L5/oB9cc=;
        b=jB0CCVqojjSfE1W4koQ447DbjadcccUMCOgkQpRKq4SlbREq8j0ZQKyMTAKhcAIn3S
         VytEJKYdLD2HyJRiHSU0tmGuDp63sBVrgVPJ1nCqbJawBHbn5ja4WZC/a1GBVeygdbHE
         /8UH9f7KiIPlEURWC9FW9wfSM/D/3PAmLGuYprxSZbnMKIkLCOvO+5zt+z0TeGgOdJ86
         KKH7jFgQb6TXfP8gznbtqq3xHmBT1CcCJA1scmo/50u2fF19dGRI03rPSmmzQhl+Ey+f
         TkouHJOdOQyKdZ4DVFg77jDyu8qg4Omed5oMPO4IjHWXWDZuv6tRTvh5NH35WxyeQv6f
         wDqA==
X-Gm-Message-State: AC+VfDzLxWD2CpLYANPWaYOJZJX9Toe68aGLjHYQmwWkSh1Ucs58XP8r
	VbSoTkb+sUY/Qu4whdQtH4bgiVa7/ZfFDiECRVEsyGNMgtth3K/ix4Qv
X-Google-Smtp-Source: ACHHUZ4NlEkLp+1cXODZAZxLlKBXnRkPgktWQJyLoVH0GrFW+MyhJ5R9nV1ckS5qeDEMlg7yNRHTIgdEdPn4VKDUjEA=
X-Received: by 2002:a17:90a:5d13:b0:252:7372:460c with SMTP id
 s19-20020a17090a5d1300b002527372460cmr22744551pji.4.1684232732991; Tue, 16
 May 2023 03:25:32 -0700 (PDT)
MIME-Version: 1.0
From: Sidhartha Reddy Kaliki <sidhartha@drut.io>
Date: Tue, 16 May 2023 15:55:21 +0530
Message-ID: <CADfM=uvE+DdOAVU-WZmNgiAPom0isN9OFUeky0pPqPbtFmvyRw@mail.gmail.com>
Subject: How to communicate 2 guest machines over serial in qemu?
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 17 May 2023 10:39:17 +1000
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
Cc: qemu-devel@nongnu.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

We have 2 independent devices running openbmc software on each of
them. These devices can communicate with each other over a serial line
using SLIP protocol. Now we would like to emulate the same using qemu.

Do we have any provision to communicate 2 guest machines over a serial
interface using SLIP protocol?

We have tried a few options which are not helpful to solve our purpose.
It will be really helpful if you can provide us some guidance on this.

Thanks
