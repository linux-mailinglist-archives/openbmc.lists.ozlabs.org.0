Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 752778225D9
	for <lists+openbmc@lfdr.de>; Wed,  3 Jan 2024 01:12:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=j5A6emsP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T4VXM1MH8z3bpG
	for <lists+openbmc@lfdr.de>; Wed,  3 Jan 2024 11:12:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=j5A6emsP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c33; helo=mail-oo1-xc33.google.com; envelope-from=rentao.bupt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T4VWZ1D25z2xSl;
	Wed,  3 Jan 2024 11:11:37 +1100 (AEDT)
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-59502aa878aso2257028eaf.1;
        Tue, 02 Jan 2024 16:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704240692; x=1704845492; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vPhCoFUOrRe68PAKBuJ0XCZdiktRxtpdmXF3NphnPpo=;
        b=j5A6emsPGrhJWDRIDaDTiG0OMEB39T9ySb4fxZbAdldOHSIup11pZfBMWDy4/7gzTc
         FugkpbU5xJ9x234izBKfcxLSwicFhCt3NfJT2GnaOARLTUn1sdWoyylmDKYmNZjNtAFr
         VURJCqsj+I1KDX+KRPPE5NHXXo9GkzVipwbGxeXv/0CfhEGLNEOurEXopC4vqt/1J5bS
         ykO0ROByf94CbwURBBRTFAKql2bozbf4BmmXpUcRtIy0AwyDkvqVNfRX8muYbMMsqMmq
         VEoHJsrW68q9XXHHUPH4yVzyNCoZBelpUvSYYdpf7NUMGDOB3DlEU4n0jljYJDkBa5qa
         4y5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704240692; x=1704845492;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vPhCoFUOrRe68PAKBuJ0XCZdiktRxtpdmXF3NphnPpo=;
        b=k7dN7l7svIb5vpVERrEGUf/a+HrbMuOgdWTuXDP5NjXh2rrazj0PyZCQO4wyogZVxB
         t5kjjgIWvAUoUFMP+cGexjmsVB4880yhLZYC5nwwrqiBSmkzD8CobfsbetT7f69sC91w
         4DUOihsKY/kp0/FJEtpij3XVndSZ88ffby35wL5LbW4KDlnIHj51WiqUtV5dmqc42OS1
         wqHwB4znE8tbGNlG0Ep57IlbpeLHJbKaYTstD5P/nUj9P63/ekzor5h3isAp1P5Fiky3
         1a36N7yXGgJTZuoGzuBne4b3JzWm2hR500kkJmIh9PWriyAtlPoHji98cuRL2U/jD+mF
         ZgBA==
X-Gm-Message-State: AOJu0YwN8kjLZu/Rs3pLL9ZAspNy1aw8NvUPMJh/w774U11YIFDUuNeO
	2hkYxvk2UAr1UZa69w6U2AY=
X-Google-Smtp-Source: AGHT+IGhE/yALeHSypQiLTPZ6IwELmr85Vhh6yAAxpExlueWQuwRyjPkDph8C0Z8fA5XSFJdnFLr4Q==
X-Received: by 2002:a05:6358:718b:b0:175:2cec:a767 with SMTP id t11-20020a056358718b00b001752ceca767mr4225579rwt.36.1704240692039;
        Tue, 02 Jan 2024 16:11:32 -0800 (PST)
Received: from fedora (c-24-4-59-2.hsd1.ca.comcast.net. [24.4.59.2])
        by smtp.gmail.com with ESMTPSA id qc8-20020a17090b288800b0028b1fce7c01sm195551pjb.37.2024.01.02.16.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 16:11:31 -0800 (PST)
Date: Tue, 2 Jan 2024 16:11:28 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v2 3/6] ARM: dts: aspeed: Common dtsi for Facebook
 AST2600 Network BMCs
Message-ID: <ZZSmMJ//l972Qbxu@fedora>
References: <20210805222818.8391-1-rentao.bupt@gmail.com>
 <20210805222818.8391-4-rentao.bupt@gmail.com>
 <20231220081402.GA3831@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231220081402.GA3831@wunner.de>
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

On Wed, Dec 20, 2023 at 09:14:02AM +0100, Lukas Wunner wrote:
> On Thu, Aug 05, 2021 at 03:28:15PM -0700, rentao.bupt@gmail.com wrote:
> > This common descirption is included by all Facebook AST2600 Network BMC
> > platforms to minimize duplicated device entries across Facebook Network
> > BMC device trees.
> [...]
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/ast2600-facebook-netbmc-common.dtsi
> [...]
> > +		tpmdev@0 {
> > +			compatible = "tcg,tpm_tis-spi";
> 
> What's the chip used on this board?  Going forward, the DT schema for TPMs
> requires the exact chip name in addition to the generic "tcg,tpm_tis-spi".

Sorry about the late response. It's "infineon,slb9670", and I will
submit a patch for fix it soon.


Cheers,

- Tao
