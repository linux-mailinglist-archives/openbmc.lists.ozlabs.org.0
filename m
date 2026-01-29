Return-Path: <openbmc+bounces-1296-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMhoDut5e2nWEwIAu9opvQ
	(envelope-from <openbmc+bounces-1296-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Thu, 29 Jan 2026 16:16:59 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A11B15AE
	for <lists+openbmc@lfdr.de>; Thu, 29 Jan 2026 16:16:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f22mj2lktz2ydq;
	Fri, 30 Jan 2026 02:16:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769699813;
	cv=none; b=k8nxMkdQH9JvRiVYUP+mk0IzENF+AeEmXV5DX/kTeRFFwTcE/+HehPszTd+mUDWjXZGdYAj0aJFut+5WC6Lh1a0OvSCfwqWqKghSw40WT/CVnSUx8kRY3BgIpUTLSB5L3SbTwrN/LPqbyiK40JFNu6JGaqFG+OwYUAjydkGgAhSv1l08IrFVMZ3ppew7VuO/qohvFqnEt45kWxr6upWuzLjMLuSld+/Iq/NbTf1v44WDFbKHHO4mmLkp1RrGTEEBpsCuF4LuOjsP03njLBYIy7Cj2GIbertVJp9r0HXHEXXCgGtcrlkWudPbzCGC0mybmqYPqBxIfuexGsh0jqlPCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769699813; c=relaxed/relaxed;
	bh=EgmtN7g00lwkN8JUHcOpWKDzOGBTid2ChoeKvuJnR2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oj5DO+jZ33bGaTatCxUR6PZQ+pBzqNRmc/wy/3NZRj/YNiWgDRM5WOY+ON66VCCQm8dWAqsSwgEPQjqcG0nIh/Ngy6n6PzEgcciMAevpT51ry7PXvgl2S8MmMWWJWYg/uULnPG0ZXclgOg57+UKYD8mL4fgYNOlHcVu2+3mFhNQrXtiBWzk8hUUttSp4KTpXfOeD8SbNzwuVUjN5ZAPzWH3ToKeJrWdapcqBGuHwQUBQx12gFmZxrSr6M1Gwx/NGzz9OmzTxDIQN0sAS+lYKr9NtMWrMqFRZgR1A2l6bTCf/lO9Rx2Nc02AhrFoGlWNATVzPfmGn/diJOTUQp137rg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kiS3Pm5I; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kiS3Pm5I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f22mh4F86z2xnh
	for <openbmc@lists.ozlabs.org>; Fri, 30 Jan 2026 02:16:52 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B84E60054
	for <openbmc@lists.ozlabs.org>; Thu, 29 Jan 2026 15:16:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53F22C2BCB1
	for <openbmc@lists.ozlabs.org>; Thu, 29 Jan 2026 15:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769699809;
	bh=O1tloW8gfVEMEcBPVggd9EMmWqLpPlFRfEzQCkil1HA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kiS3Pm5IueYJq5TmZqGrS7X7C+cWyG1KdjBU9oiug7eGGcyzr2O934EguWjN3FDjz
	 gat2aSyrK4fKp5K+S6alGJQvo4aL5TDXGkyr1lEbH+drcNwr3BcQLLDTaNNvLcf0Xi
	 Xww/zptlAVq99/UpW7eL3bzwdZjWV+ansPM7JM9JvgnyVm3cmmydMgusNtXysqT+t5
	 i6bfvNdLW5qgYE0+CTzveGSBq6R2JV+1s8L8e1CvVBVR6xtcoFOP/+ee1u8/s4xTaU
	 DCPzLxwKeW7M0TJja1ZFpyoUC/GEnxOwm9VoOjHuipk19xaZAmreQTZDvMVfbO7DbG
	 FOXOUIoDAUB9w==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b8871718b05so189399366b.2
        for <openbmc@lists.ozlabs.org>; Thu, 29 Jan 2026 07:16:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXb8g7hwrRZs2qmeKBZUiLF0tU9pYL1+eNMl1dqcyL5mHZUKp3hU8nDHBvYOTnU4/DdnGBcwvSY@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxfzgVm7H65++XpPzJX/2VkJjd7d4+Y5uUXkhDmAQSbGU6Ftn4a
	JkdEzOCARBE3WMq0Wq3M06PhsXRNfhOdDiF51apED5jaLGDdPaB1d66ymuknFLZhbXVD6O75un/
	D8xX9PnNUnz9Baync0bFVepoE36s2Kg==
X-Received: by 2002:a17:907:940a:b0:b87:65c5:603a with SMTP id
 a640c23a62f3a-b8dab423ef5mr644045466b.39.1769699807795; Thu, 29 Jan 2026
 07:16:47 -0800 (PST)
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
 <20251211-dev-dt-warnings-all-v1-5-21b18b9ada77@codeconstruct.com.au>
In-Reply-To: <20251211-dev-dt-warnings-all-v1-5-21b18b9ada77@codeconstruct.com.au>
From: Rob Herring <robh@kernel.org>
Date: Thu, 29 Jan 2026 09:16:35 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJxfVaLqzTwm7iEvc4maBzVvpc-i5uD6CZRtiv+V+7+1Q@mail.gmail.com>
X-Gm-Features: AZwV_QgoP-01T8gPVg_GjRssieKZeDUA4_1M3p-JswAzI-a2M9jAVmrm9uPisdk
Message-ID: <CAL_JsqJxfVaLqzTwm7iEvc4maBzVvpc-i5uD6CZRtiv+V+7+1Q@mail.gmail.com>
Subject: Re: [PATCH RFC 05/16] ARM: dts: aspeed: Remove unspecified LPC host
 controller node
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>, linux-hwmon@vger.kernel.org, 
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.70 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1296-lists,openbmc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,openbmc@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andrew@codeconstruct.com.au,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:joel@jms.id.au,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:linux-gpio@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:linux-iio@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,openbmc@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[openbmc,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,mail.gmail.com:mid,codeconstruct.com.au:email]
X-Rspamd-Queue-Id: 22A11B15AE
X-Rspamd-Action: no action

On Thu, Dec 11, 2025 at 2:46=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> For the AST2500 the node was used for pinctrl purposes, and while the
> hardware capability is also present in the AST2400 and AST2600, the
> their pinctrl no relationship to it. Further, there's no corresponding
> binding, remove the node for now to
> eliminate the warnings.

Odd line break.

>
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  arch/arm/boot/dts/aspeed/aspeed-g4.dtsi | 5 -----
>  arch/arm/boot/dts/aspeed/aspeed-g5.dtsi | 6 ------
>  arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 5 -----
>  3 files changed, 16 deletions(-)

Acked-by: Rob Herring (Arm) <robh@kernel.org>

