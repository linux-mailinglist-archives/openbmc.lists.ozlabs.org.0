Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5A1222E78
	for <lists+openbmc@lfdr.de>; Fri, 17 Jul 2020 00:17:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B77sh0GyjzDqcn
	for <lists+openbmc@lfdr.de>; Fri, 17 Jul 2020 08:17:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=brendanhiggins@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=eHu1cIr7; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B77rs00wZzDqT1
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jul 2020 08:16:44 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id f16so5357498pjt.0
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jul 2020 15:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uyJjNcCyaCd1x5/819IrrY1FHu5p7NCmrwELbf92SAw=;
 b=eHu1cIr74RawyPqX0Cqg3kfkYi/drr3HXHWhaWKTivMGMKCMf3e0XRoQ2En4jdjC4o
 l0QXBXm6ndcTw0e1BnIhRnI9fmTiAZsUsu0D17CFOrD4RGcofnUAKaBCktK0WZ3HIVfj
 xabBG2ZxSqmkP5rHOF+BNiSMHYS5PaLoIfFLIMpffgQpnHBG0JhA3lwQzxqpQJRN1Igr
 Ol5E/Gp0zFDAv77oilMTq1A6jnLxF8MKYnrfILiWK6THw1VBn9dDuu8Xz+SeXubQM64h
 RRBKDl3Y3FuU2gfHgGMY94DzYfV9XveiQNE1WNtju12Jzz60Joi1KZzd8kS0V40voa54
 cnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uyJjNcCyaCd1x5/819IrrY1FHu5p7NCmrwELbf92SAw=;
 b=FTSFn2yHdD0h5KSc7Hc4PzJDIJVSPGE3gRsziWyi4W1oDIGd++dl3n4Zwk23fOofG9
 +nIIbEqbVD/xEWcDueASXs/Zs76Smv/306HRJlHpdSOLSkmCdSQvIr8Q1aXs2pk3Tckp
 uU7NsP2ehgGm6Kv8OvQ5XMtaxRtGWLgt5Nk1xjasj+8wreE5hkplLICnW6o39n3qUozo
 HIgNewjc3B8tsVk5Scs8rpGZDqfKrjAO2y/v7KLQdglkxW/6leaWNEdD2wtmFke47I/S
 0Y2DQaNnqIkQoRNBOwRswRWAJMQxWgfokAGmWZ5WVcRJviV9dZFzqRZQHcePA2EZJ5ZB
 j1gQ==
X-Gm-Message-State: AOAM531dV4eeWLqssQcTJ8HwStgfxPPkj6xzuiAH9BHqnPBKmHyd1agD
 vb4H39onoUIo5/sXIsIAHkyvlb6Zh0W9bwiHpAkOVQ==
X-Google-Smtp-Source: ABdhPJzd3SJxIS4HsCUds4zwHzaxq83M1tXUciur4bETKG0e7fh8+z+LpQ32CtOhhi4oDDmKD7oe/79nInT7mEGSln8=
X-Received: by 2002:a17:90a:cc03:: with SMTP id
 b3mr6368860pju.80.1594937800591; 
 Thu, 16 Jul 2020 15:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200716215242.GA19193@embeddedor>
In-Reply-To: <20200716215242.GA19193@embeddedor>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 16 Jul 2020 15:16:29 -0700
Message-ID: <CAFd5g44yqds4xUp=xVbXTpFZydLobfpyLrVdwZOjrRa4=TOj5Q@mail.gmail.com>
Subject: Re: [PATCH][next] i2c: aspeed: Use fallthrough pseudo-keyword
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jul 16, 2020 at 2:47 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> Replace the existing /* fall through */ comments and its variants with
> the new pseudo-keyword macro fallthrough[1].
>
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through
>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
