Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E04FA3EE0B0
	for <lists+openbmc@lfdr.de>; Tue, 17 Aug 2021 02:04:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpWVT5HHfz2yLQ
	for <lists+openbmc@lfdr.de>; Tue, 17 Aug 2021 10:04:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=H/LgA0e0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=H/LgA0e0; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpWV26bb0z2xZS;
 Tue, 17 Aug 2021 10:04:10 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id e15so22598288plh.8;
 Mon, 16 Aug 2021 17:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8OcYoQrjOQIm/iOfn/qGg5WXk6OnAW5qFwcrs/rMErI=;
 b=H/LgA0e0aRuTUYHHg7c8649E/r5biZOpoBg7KtUO38aR75LQrqKye4P6cMEfwu1L7W
 SBx12BW7i+wEh9nBFnKidZ2L3P1aKg7lWLx8Bj0H8InXsT2eCkjIpyrCXiUeehllATnV
 pTmPzGF7O9Y8nNyeoan4jkhMCmJI8Ld60Dxdc2LBRmaxonfZjkz1EM+gHGfbbwzu+nbC
 eBt7HfmcSqtsWnPjC8XebqAigfK/YsYZDA+22jz1RmFyCVT1s4s0x/cMVib3WZCupllg
 hCBAvki+G4wr4ttmBMf1CllKVXOmRDE1x2yYK6Xi1cwOhzCxgd96e1YAljeFBr7qzYwu
 wLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8OcYoQrjOQIm/iOfn/qGg5WXk6OnAW5qFwcrs/rMErI=;
 b=rFRaD9TVKmDW+ipzufrBVVIrXmoakwKb5AI1vx9nqVeUxPAD5iUJJg7tYZ7y5G10PO
 4hUord5rMO/h7y00BtKf+MNXWshDROu3x435DgFWeSpYz0k2BsXxDYd6EvSWZtHd7RYk
 rrkTWSkl7zCrnBp8r7OVLThWpEWqDmn+mqHrhBZZG/1zcD20zHWBXB7PtHAoSB3rjsh3
 A0YBqsqoAA+OovnGHzEAZ7Fr5BRRj8ZPkcRVhOCgcka3uJAiA3rCoge4RgpGO5carhV5
 3EoNIddGeW1d9OCHhtrS66jeYT8UKiBdTjhlqL97v5fAWGCzEDiMmMAliAepWGIcTagW
 VKtQ==
X-Gm-Message-State: AOAM533DPEdYGoA2QydZfSGCYhCB3Ajj9YZ7avv6W6cyrJBd1ihLbHQ+
 GmuIVSLeDeBISqxBaGzFf5Y=
X-Google-Smtp-Source: ABdhPJwtLYKDhsKinpch6hw0rT/vGFaK/Jdkg0IXrY1PiIgMwHhRyJEkvRLLKb+Bsf7366YwpdXaRA==
X-Received: by 2002:a62:6242:0:b029:3c6:5a66:c8f2 with SMTP id
 w63-20020a6262420000b02903c65a66c8f2mr667349pfb.59.1629158647726; 
 Mon, 16 Aug 2021 17:04:07 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-92-48-112.hsd1.ca.comcast.net.
 [73.92.48.112])
 by smtp.gmail.com with ESMTPSA id u190sm282154pfb.95.2021.08.16.17.04.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Aug 2021 17:04:07 -0700 (PDT)
Date: Mon, 16 Aug 2021 17:04:04 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] ARM: dts: aspeed: minipack: Update flash partition table
Message-ID: <20210817000403.GB7547@taoren-ubuntu-R90MNF91>
References: <20210720002704.7390-1-rentao.bupt@gmail.com>
 <20210813062435.GA24497@taoren-ubuntu-R90MNF91>
 <CACPK8XcAqU3KASespqS3dPterpzyqD4wYH=qOS8Ok2yUrB_F+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8XcAqU3KASespqS3dPterpzyqD4wYH=qOS8Ok2yUrB_F+Q@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Tao Ren <taoren@fb.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Aug 16, 2021 at 02:11:40AM +0000, Joel Stanley wrote:
> On Fri, 13 Aug 2021 at 06:24, Tao Ren <rentao.bupt@gmail.com> wrote:
> >
> > Hi Joel,
> >
> > Looks like the patch is not included in "dt-for-v5.15". Any comments? Or
> > should I send v2 if the email was not delivered?
> 
> I had missed it. It's now applied for 5.15.
> 
> Cheers,
> 
> Joel

Thank you Joel.

Cheers,

Tao
