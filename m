Return-Path: <openbmc+bounces-1084-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E97CEFA01
	for <lists+openbmc@lfdr.de>; Sat, 03 Jan 2026 02:31:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djjh12PlYz2xl0;
	Sat, 03 Jan 2026 12:31:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767217136;
	cv=none; b=IkykA8gkMxzWPZfa2lnQSlWqYHWBQc9nVSh8noKvl8jLQGWOXTkfzDtCbk/+wRRMBCt0n6GYxcV5IqEsBZNAUEDUxxugOrgfcnDMESQwbm0r3nNeFIjljNtfOn3R231YrsJVWP255+K+tagzJxg1PsEQSSHuU3mAe7kSnSfLHVDVOI2R1d5A1jbMw+PKmEo0KmDW/Feczy3oRBPNoZDsJiCMQS0R1rI0G+DBFNlnIVM0UafVT+qxP5/ROSu0vCzkylNGskLBR8GoPGY7Iz5lz0BH9cEQtp+ba8uzM1L5JvyewxEL/OLhDTeUI24Vvr+ezuWlRnJqJRvPdLPByV9vVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767217136; c=relaxed/relaxed;
	bh=bNI4moxHzlL6mKNWIZsVYWKbjwRce0cuGLHEF0rQIaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f63YQvMJrJu3R7PcRfMoUqd1n7s3JOn5vFyvwxEUxXwimfDnbmb2cFjOatX7MGRtLbEqQVY/KINhh3r0iFuWb49zAE0ml4hs7J75qrvv7x65Hd3J2A5zEd90o2264YPgAX03pUsCKLUh1CbRCujmfuPMAORPP7ad2ZBrgEKXyUEnAo1Xf4T/zbki7Y79KjtaK65gBlunchEj5fnjLnd+F3pS4UUSe6l2vZs0TUERKsONstyJJTvsHMBilBUcrgRalGMafJOOUSRf53tYsvfmE8sCGE4HKKJdcmDve+ETSJROBKHMZhnof+6hNFx0mGn2fmE3jr9psQknup4hyfY8+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ud1JCDQ6; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ud1JCDQ6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dhNcv6Prvz2x9M
	for <openbmc@lists.ozlabs.org>; Thu, 01 Jan 2026 08:38:55 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 58F69443BF
	for <openbmc@lists.ozlabs.org>; Wed, 31 Dec 2025 21:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39E35C2BC86
	for <openbmc@lists.ozlabs.org>; Wed, 31 Dec 2025 21:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767217104;
	bh=bNI4moxHzlL6mKNWIZsVYWKbjwRce0cuGLHEF0rQIaQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ud1JCDQ6O191m3kYD44vkt1ShFs9vgo4JobjnhWd+evWDfkmkNYuJI5wcSNL4tWrL
	 0Z7WpJ+bn7kwco/mfx1YQUb+Cf2JEoE/aLmZRvF04wFMC+yaiiiu1Wrne8U3CLXW7m
	 rlf4vA2wklUadaJzq65C3YgpX5x29MdV+ltwo/Vd2zN8HofhUcqV8WbtJ0uksC688J
	 ++6tS4KWFBNxOPHIOXyel+T5t0WvUdmHTbHNbqpkG920NCyjtE7n4FDHgl2Y4TBj64
	 W6M7ykqRfovFexXy0AhEWH8mXR/2CkOb0cvGL234hY0g3gpG0VTXQnHhEZE4eY7Nqc
	 84vzL6TQKrNEA==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-78a712cfbc0so101524427b3.1
        for <openbmc@lists.ozlabs.org>; Wed, 31 Dec 2025 13:38:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUnreOiyGSLAW1tmDsN0Vu3kvlmzMM+wUnhw6Xj8TiQNQJoViZuIEW4ZPfnE2HKmbwRszNdpuut@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxTxS6wa2jhKTgONfUQGTFMNTVEv+hFNxqgrhPTmU/9nt0PaHat
	nL/vlCvVCgRiN7QyrUhM4IaJZL3ZAkCvACSxfwOpIb7YzQXuS1LLVGSOCiIAiDQxaSykbrNS0mg
	jdQysRLkLncfvyCfxIuNUojlrzizCmEE=
X-Google-Smtp-Source: AGHT+IHGZ+h0d0MHZDCxvMCHygNM5e2LD8BSbr6KIbsOXsE3Z3p+Mpa0Okg+bD8neauLjOFoWJ8WBhGUbfiIcHde2OA=
X-Received: by 2002:a05:690c:90:b0:78f:a9e9:f784 with SMTP id
 00721157ae682-78fb3f5d4f4mr320728627b3.31.1767217103495; Wed, 31 Dec 2025
 13:38:23 -0800 (PST)
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
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
 <20251211-dev-dt-warnings-all-v1-3-21b18b9ada77@codeconstruct.com.au>
In-Reply-To: <20251211-dev-dt-warnings-all-v1-3-21b18b9ada77@codeconstruct.com.au>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 31 Dec 2025 22:38:12 +0100
X-Gmail-Original-Message-ID: <CAD++jL=TXQyGD5nSdg37KK=OrUJDwi=2pXQciLr+udC9hjCVkw@mail.gmail.com>
X-Gm-Features: AQt7F2oBzR1qfgGQMAe5k9Xw2nDJvErMxOKzOVsHNn8uiB-Wg9Ho6D3OL063WYs
Message-ID: <CAD++jL=TXQyGD5nSdg37KK=OrUJDwi=2pXQciLr+udC9hjCVkw@mail.gmail.com>
Subject: Re: [PATCH RFC 03/16] pinctrl: aspeed: g5: Allow use of LPC node
 instead of LPC host controller
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Dec 11, 2025 at 9:46=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:

> There's currently a wart where the Aspeed LPC host controller has no
> binding specified, but the pinctrl binding depends on referencing its
> node.
>
> Allow specification of a phandle to the parent LPC controller instead.
> Fall back to testing for a compatible parent node if the provided
> phandle doesn't directly resolve to the LPC controller node.
>
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Reviewed-by: Linus Walleij <linusw@kernel.org>

I guess when this is non-RFC I will just apply these two patches.

Yours,
Linus Walleij

