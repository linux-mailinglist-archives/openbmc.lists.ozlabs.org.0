Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A4BEC80F
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 18:41:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474Tyr4CrszF4P7
	for <lists+openbmc@lfdr.de>; Sat,  2 Nov 2019 04:41:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ge/UTzPg"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474Txp5FGZzF7F6;
 Sat,  2 Nov 2019 04:40:59 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id j22so6917861pgh.3;
 Fri, 01 Nov 2019 10:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nFNT0LPVheWA4KBpnwRedDxe323lH3c78BcmwLbJ700=;
 b=ge/UTzPgmx562dBN7M+gJnaLpgdt7tTLMJj965/UtlsjHMookPjfZEeSyuW6yaBJ/t
 aziJDTH8+9YwXmzr0Xx5hpG5e9caR15dZKiaMPAf4PyasAzBv0vx87Vf02OLwoM8qUbQ
 6lPYg2bQvvDGYW2hQQo3KXH6Ha7iuEaqv3kZymF1Pya4y1sjKq/0iDVomDCBsrW3lD8g
 ojwug482SwJTWzYJ62hWzrQPU1DwHsebPq4qsbWjVIH8HEXoJSGpXC7EiUAYFoakcosh
 BvXhyG9EnJgXnPi+dYOf2m1VxgGQ8+bZg54SqXSHvHom7gowiYfuCyJdZaeqoOS04AsO
 TbAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nFNT0LPVheWA4KBpnwRedDxe323lH3c78BcmwLbJ700=;
 b=HFOZAPOBqHdL1G9TQo2JAEzyMN1z9jho2M8c+ocola2dU7N1N3lqN/3Uw8IZWkRQUJ
 mcUicX3hTSiPl9pzVcvrvEsAoKs/gDutApJZe3lmtlCmWI1jDtHh83t/now79YC+OBuB
 k65Lz4jah3US0fv06NqIn0GZ6DiuxUBpvnWvrAS9CZxPwnhsV77si8yFWSriuvOS3wqp
 qoKPiOdTkKwQCQIBiPRukLd2LMqPoE7w/+wxGYeyOFJC909soYNFtu6jE5j0ofwAiAhA
 QzyXGLC7fCHoF2/z7psGyH4on2ITB8J/yGwKfO/deMTY+JR+srFeSGwKHCfzlMzW1Pl5
 ON+A==
X-Gm-Message-State: APjAAAWP4fccRUdRobjnkPh42ElrVoHUJDGWd2IHMdizxWwyNWVwe8nC
 AIr/oejJt6Xf91EDxKEKl/o=
X-Google-Smtp-Source: APXvYqxEMn19nRiQYdcMHXDUyl1sN5kC5K5u0Di4ZM95TyefIw5grebLlrUdxgtbp3mv1L0GC8D08g==
X-Received: by 2002:a65:5388:: with SMTP id x8mr8040065pgq.398.1572630055931; 
 Fri, 01 Nov 2019 10:40:55 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 ([2620:10d:c090:200::3:155b])
 by smtp.gmail.com with ESMTPSA id b18sm7009793pfi.157.2019.11.01.10.40.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 01 Nov 2019 10:40:55 -0700 (PDT)
Date: Fri, 1 Nov 2019 10:40:45 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 0/4] ARM: dts: aspeed: add dtsi for Facebook AST2500
 Network BMCs
Message-ID: <20191101174044.GA13557@taoren-ubuntu-R90MNF91>
References: <20191021194820.293556-1-taoren@fb.com>
 <CACPK8XcNxs5T=ZC_mRnvkOF_kqS1AvP=9PvMB6w9Fgn_XbtZQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8XcNxs5T=ZC_mRnvkOF_kqS1AvP=9PvMB6w9Fgn_XbtZQw@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Tao Ren <taoren@fb.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Nov 01, 2019 at 10:08:35AM +0000, Joel Stanley wrote:
> Hi Tao,
> 
> On Mon, 21 Oct 2019 at 19:49, Tao Ren <taoren@fb.com> wrote:
> >
> > The patch series adds "facebook-netbmc-ast2500-common.dtsi" which defines
> > devices that are common cross all Facebook AST2500 Network BMC platforms.
> > The major purpose is to minimize duplicated device entries among Facebook
> > Network BMC dts files.
> >
> > Patch #1 (of 4) adds "facebook-netbmc-ast2500-common.dtsi" file, and the
> > remaining 3 patches update CMM, Minipack and Yamp device tree to consume
> > the new dtsi file.
> 
> The patches look okay to me. I modified the file name to match the
> convention used by other device trees in the arm directory, where it
> includes the SOC name first.
> 
> I also reworded the commit messages a little.
> 
> They have been merged into the aspeed tree for submission to 5.5.
> 
> Thanks!
> 
> Joel

Got it. Thanks a lot for doing this, Joel.

Cheers,

Tao

> >
> > Tao Ren (4):
> >   ARM: dts: aspeed: add dtsi for Facebook AST2500 Network BMCs
> >   ARM: dts: aspeed: cmm: include dtsi for common network BMC devices
> >   ARM: dts: aspeed: minipack: include dtsi for common network BMC
> >     devices
> >   ARM: dts: aspeed: yamp: include dtsi for common network BMC devices
> >
> >  arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts | 66 ++++---------
> >  .../boot/dts/aspeed-bmc-facebook-minipack.dts | 59 ++++--------
> >  .../arm/boot/dts/aspeed-bmc-facebook-yamp.dts | 62 +-----------
> >  .../dts/facebook-netbmc-ast2500-common.dtsi   | 96 +++++++++++++++++++
> >  4 files changed, 136 insertions(+), 147 deletions(-)
> >  create mode 100644 arch/arm/boot/dts/facebook-netbmc-ast2500-common.dtsi
> >
> > --
> > 2.17.1
> >
