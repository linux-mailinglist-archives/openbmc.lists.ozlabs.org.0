Return-Path: <openbmc+bounces-1109-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEC4D03970
	for <lists+openbmc@lfdr.de>; Thu, 08 Jan 2026 15:57:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dn7LC2yLpz2yGl;
	Fri, 09 Jan 2026 01:57:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767884259;
	cv=none; b=lBGodigxdXySeMDy6mpoh4/wsum2SVHQIcLjYrSYvg5/Lguzb/eQSXm8MkuntgXjaPRebnH2XU1w2yrUPL0kwHvw7yrBLSVbLaZeAN5umRO6ll4oUbwh+AAFXJglzJoKeb1RfVyz9/8SBH7MY3BjJt4+YQiC2wJAOucjSmaEZdl4JAFZlyUDr+3UoKWhFqQH3iIp8AgWnjjN7ZR4sFvtaJ6M85UkrnxqywqzZfjHaqJudgULktvQB20w3VEqZRRC8ZSHcWy07eJiTdfQnvP2mrOAmIAq7cbmH6uL+N4pXeFB21x/7NlzJIYDhYoMZBe3PgXw0wgf2rlYJ9Xz7pq8/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767884259; c=relaxed/relaxed;
	bh=DnQ/yW9Yt6BJKqL+B/dE/IYvWBhrwB2z1MZrYDFRvIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ewgZs5HtfiywbYH2/vZ4wnb94dz42iJgvsA5h6CTYcl8MxWOR7YX+Lz8F1yz/9qbU318uiRwFbd9rVWAWLJFdHStWHWxA8kUvrQS4WewsNuq/g/jnF6BCx0FZAbLOjwksZMkmZ8sNabUFMat0SaYpxposbZ27fcJN8LPbq0vnRT2QRXJWdC+Eln9Hbw5gIHHZ50swXN7okmJ9OR+JpYYMdgnpV2ZmmGnuFeuXFvPjoOe2kB3v9wLJqLe9lGQIZ6Ct28FyhzwqkKCnIfu/LvFhKUEQPFcUleIXKKhWVcb+J7os0yMyJ7KisGvxCJvD04c9m6wQD8YifGxHQJVvPvomw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QGtUZC4o; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QGtUZC4o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dn7LB4KB5z2yGL
	for <openbmc@lists.ozlabs.org>; Fri, 09 Jan 2026 01:57:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B5890418F8
	for <openbmc@lists.ozlabs.org>; Thu,  8 Jan 2026 14:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 939F8C16AAE
	for <openbmc@lists.ozlabs.org>; Thu,  8 Jan 2026 14:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767884226;
	bh=DnQ/yW9Yt6BJKqL+B/dE/IYvWBhrwB2z1MZrYDFRvIs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QGtUZC4onf+ad/oH3z0uSgHtyk1DXv5bPyVDzFLRhglGKICHU9I+tK/hoh1X8JgPK
	 kxp+y8IDlShg4DYkrdJisJxHRY62zll0q2Nd9cJvnqcmr2ihkfEn/Im4iVukOcqQ9Z
	 WI3VJoyVsljfAnBRsMwp5UpwLRbapbINExoMQTuh8z5e1IzBdtHCCgsqaDshpiKoe2
	 7OAaosQp5y62feE8OLUxhaAb/118D3Wg2b3qLSoxw6iEJQnJxPSJtbVtZg8mECs4+2
	 T4qP/VZSaQTC7GXv+wRPIxPmvHLv/EiyvWnFpzeRLWBHZ6RZN35zLRdNT+iBgXgIfx
	 CpKjHU/BKaI9A==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-64b83949fdaso5349891a12.2
        for <openbmc@lists.ozlabs.org>; Thu, 08 Jan 2026 06:57:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWzhBwEfEupj+hFqvjTadJj3qaj5dzsnDLZOrIsjiHGtWLzmBOCACjDo401aPnV6butR655xGjD@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx9Lk0WAo7Rf1qlDRZU3ypm4dkL9+kfHza50VqtTqkQZ3MDf1C7
	yUplfD9vWivFZrIFFw5uzGEdw/zNWYb/Zh0P6lHBPtNTI6U3HbQSdLqdL5wm0CiZgP/IXxWCN3K
	P6WFAp83Llkt1hN5hRD9wm+I83ke7Iw==
X-Google-Smtp-Source: AGHT+IH8tmcrpioHdEXlv//9XeZHVgTYmZpW8KTSYGrex2JjF0CGxtJ9povY/7UWSwzu79Ov8qEz1Af+LJLHJruaSk0=
X-Received: by 2002:a05:6402:2755:b0:64e:f6e1:e517 with SMTP id
 4fb4d7f45d1cf-65097e90f77mr5912597a12.32.1767884225209; Thu, 08 Jan 2026
 06:57:05 -0800 (PST)
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
References: <20260105193232.3167128-1-robh@kernel.org> <176786448160.1407469.7623777355686519631.b4-ty@codeconstruct.com.au>
In-Reply-To: <176786448160.1407469.7623777355686519631.b4-ty@codeconstruct.com.au>
From: Rob Herring <robh@kernel.org>
Date: Thu, 8 Jan 2026 08:56:53 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL2ZS_D-ZUGRmJ6=dhuAAfoTUoC3CNsP4_FBat160dCVw@mail.gmail.com>
X-Gm-Features: AQt7F2oPT26RPKH9Ri2pcGhrpmWXdmje7bB16GvsWdhqPFVUb3V7ELNmqUtbXXM
Message-ID: <CAL_JsqL2ZS_D-ZUGRmJ6=dhuAAfoTUoC3CNsP4_FBat160dCVw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: nuvoton: Add missing "device_type" property
 on memory node
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, openbmc@lists.ozlabs.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 8, 2026 at 3:28=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Mon, 05 Jan 2026 13:32:31 -0600, Rob Herring (Arm) wrote:
> > "device_type" is required for memory nodes, but is missing on Nuvoton
> > npcm845-evb.
> >
> >
>
> Thanks, I've applied this to the BMC tree.

I didn't realize Nuvoton and Aspeed are 1 tree now. Should MAINTAINERS
be updated?

Rob

