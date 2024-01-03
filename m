Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4B282283E
	for <lists+openbmc@lfdr.de>; Wed,  3 Jan 2024 07:05:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OzQWPv/+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T4fMq47wrz3br8
	for <lists+openbmc@lfdr.de>; Wed,  3 Jan 2024 17:05:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OzQWPv/+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=rentao.bupt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T4fMC2P2Jz2ydW;
	Wed,  3 Jan 2024 17:04:53 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-28bc7155755so4071344a91.2;
        Tue, 02 Jan 2024 22:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704261891; x=1704866691; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RADEDc9Gi3yeGmgXekpn/ZMo5Gqri1fLzJEVnaWXUjc=;
        b=OzQWPv/+7qSquoYkIpurVzKceQl0D0wMtGlUuwR1CrT5LZi4ja2qEjeWZ+B1xskL/U
         gUmlOJMYbpV2lXZUfbrpc0vPr94esbLK7q3nXxM8z0JAX+7MGTF8zegg2JFos/w/b2x9
         9Q5RNnWx3pJ8vQ4ApkvqKCgc72p4kM1xvPfy5KU/Uy5XVpgSRbyO/CugUHVC1OC1nwrG
         O6a50RR3N2TRjjDlnAZE9My639BXZ1nUh0W+zPJN9G76pR1FHYtmYJowAxgwloRK5atb
         QXQATFqKzlHKXS1kVo4iFyBKLLasK+1BgpJdKK6xzL2fQkSsTGh0LKrCqaTwGNa+84Jq
         b+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704261891; x=1704866691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RADEDc9Gi3yeGmgXekpn/ZMo5Gqri1fLzJEVnaWXUjc=;
        b=T1CMAWmzq4lv+KWRpDvCWAHspZc6Ub8Hx9P0C5rNnoahaLi7IHt/1gCmr2mSxfXrac
         7bWvVpKPTQ3+upLHMILQBg4W5lfZcgACBkJudhI9pl2375R6tDKKsnW66BZo/u3XyvWv
         yEZ3E98J4+PqqLH6tOV7Y+8LAc/+7ORkd/HbEBekSqSt78CGiy23MIi47Wv2ZxGHv6fd
         EdpleuUo5IdxHrXCUrpQ4oM9bPSm0BrrJCJ2/eJDob8KoLuEc9eju0gSjfrIpnN+sj2f
         Ls17u4jSb48hnyfSu7S/BmX7LILBKI35aSatXrotPoR4kHCVyhn59ZXs4ky5kcus9UI7
         co+A==
X-Gm-Message-State: AOJu0YzXlOyt10Zri28tnh01a2Ia8YCLB0hJ2BqAkTHHiRdOFzVBq2Dx
	/2Y6g3ijeVZ+lCnNjQsqS3M=
X-Google-Smtp-Source: AGHT+IFqHi+Z9RaxmTv01e7Lhq19U4PDLeD1/DLeP/+2Nj+9uvZb6Eflr8CAJzBj7s8A4fjMAeUQ9w==
X-Received: by 2002:a17:90a:4701:b0:28c:b90c:9fb8 with SMTP id h1-20020a17090a470100b0028cb90c9fb8mr2128463pjg.28.1704261890733;
        Tue, 02 Jan 2024 22:04:50 -0800 (PST)
Received: from fedora (c-24-4-59-2.hsd1.ca.comcast.net. [24.4.59.2])
        by smtp.gmail.com with ESMTPSA id x8-20020a17090a46c800b0028caac8d061sm665404pjg.12.2024.01.02.22.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 22:04:50 -0800 (PST)
Date: Tue, 2 Jan 2024 22:04:47 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 5/5] ARM: dts: aspeed: Add Facebook Wedge400 BMC
Message-ID: <ZZT4/w2eVzMhtsPx@fedora>
References: <20200824211948.12852-1-rentao.bupt@gmail.com>
 <20200824211948.12852-6-rentao.bupt@gmail.com>
 <20231220082714.GA17989@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231220082714.GA17989@wunner.de>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, taoren@fb.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Lukas,

On Wed, Dec 20, 2023 at 09:27:14AM +0100, Lukas Wunner wrote:
> On Mon, Aug 24, 2020 at 02:19:48PM -0700, rentao.bupt@gmail.com wrote:
> > Add initial version of device tree for Facebook Wedge400 (AST2500) BMC.
> [...]
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge400.dts
> [...]
> > +		tpmdev@0 {
> > +			compatible = "tcg,tpm_tis-spi";
> 
> What's the chip used on this board?  Going forward, the DT schema for TPMs
> requires the exact chip name in addition to the generic "tcg,tpm_tis-spi".

Most likely it is "infineon,slb9670", but let me double confirm and will
prepare a patch for fix later.

Cheers,

- Tao
