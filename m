Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C60823430
	for <lists+openbmc@lfdr.de>; Wed,  3 Jan 2024 19:17:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mA+qEwiH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T4ycJ106tz3cPR
	for <lists+openbmc@lfdr.de>; Thu,  4 Jan 2024 05:17:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mA+qEwiH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=rentao.bupt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T4ybf5G9Cz30hF;
	Thu,  4 Jan 2024 05:16:44 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1d409bcb0e7so38294315ad.1;
        Wed, 03 Jan 2024 10:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704305801; x=1704910601; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uumraeqLsr2lYf5i74U7JAgU/UNRCFo3U3jeL0oqQzo=;
        b=mA+qEwiHtojYns/wa0+F+JoAHNNGighP+SqicmgyC2r2hwhxhwz/Uk4u/QAvUNLt7d
         I7K+2E5XNFqqZgYLDCdWS2wWbSXiCxkOEO7FAjWtVnZSE1SMcAnVeac7pOtJ2Dv/dSZH
         cwede6I7h82Q+/y7RW8qcPoxHoQCOoNHSLSHWDkTAzLuSFnBxCCvECM7oNXPiIWpt0kb
         in/I7x+UTpiFfsoFnqV81jmdwdsETphn9vdKZCIOmf++w7RPQzp4kT0JPVXNLHm28dra
         7+KpWk/3RDqXIWdS2LBaqfCXQfJPBVNY+O1AR84JQDYJfOR6Tycc8fbvYyx+zfROzcl5
         xjwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704305801; x=1704910601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uumraeqLsr2lYf5i74U7JAgU/UNRCFo3U3jeL0oqQzo=;
        b=wdxlhjlyOtY2MF+hXqPtMOS73+tTwKLOdTe0HZE7/P7++HeO6/26SCNBhs9Kn4/oF4
         yd2GCSdHdnGLsLXogqTxoXctyc/UB0Jfr1NcSlOgSn0FJDzwwwO54/v8vD2fVmorzn2/
         BgtxyEGrroxjuYOhoeiWstUwnSTjerfTZfOksDVNHZhFx+2cElHnpRwZonP8G1app5oq
         3n4DvNIRDJwrQq63h7n9/uA6CapRwtWfIx7N1wxZnKSPuZ8Og8GlBjHpqclWiMCN7guS
         SytZec/grvbZBint8XkrVaC1mcxwYxzJa2VV9RhY11TIBL2s44nHI6uwNQpMusf3JLF8
         d4hg==
X-Gm-Message-State: AOJu0Yy6Ac4rco5335w13wifJByhKQQ3fNCuc3p3aEL2IGaUb3AJEq7D
	HEPCptrGAcvvjIFD5HFPBAQ=
X-Google-Smtp-Source: AGHT+IFbrNrWh744ukhvuIJvNBRk8q07YX7qKiTp8NDJFFroVwlad6rHVCsw6FswhMTHaFTSu5rf5g==
X-Received: by 2002:a17:903:645:b0:1d3:68ee:d958 with SMTP id kh5-20020a170903064500b001d368eed958mr8544492plb.107.1704305800708;
        Wed, 03 Jan 2024 10:16:40 -0800 (PST)
Received: from fedora (c-24-4-59-2.hsd1.ca.comcast.net. [24.4.59.2])
        by smtp.gmail.com with ESMTPSA id o24-20020a170902779800b001d46b2ec6a5sm15809732pll.192.2024.01.03.10.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 10:16:40 -0800 (PST)
Date: Wed, 3 Jan 2024 10:16:37 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v2 3/6] ARM: dts: aspeed: Common dtsi for Facebook
 AST2600 Network BMCs
Message-ID: <ZZWkhaiDFOGvcPQy@fedora>
References: <20210805222818.8391-1-rentao.bupt@gmail.com>
 <20210805222818.8391-4-rentao.bupt@gmail.com>
 <20231220081402.GA3831@wunner.de>
 <ZZSmMJ//l972Qbxu@fedora>
 <20240103124502.GB23899@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240103124502.GB23899@wunner.de>
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

On Wed, Jan 03, 2024 at 01:45:02PM +0100, Lukas Wunner wrote:
> On Tue, Jan 02, 2024 at 04:11:28PM -0800, Tao Ren wrote:
> > On Wed, Dec 20, 2023 at 09:14:02AM +0100, Lukas Wunner wrote:
> > > On Thu, Aug 05, 2021 at 03:28:15PM -0700, rentao.bupt@gmail.com wrote:
> > > > This common descirption is included by all Facebook AST2600 Network BMC
> > > > platforms to minimize duplicated device entries across Facebook Network
> > > > BMC device trees.
> > > [...]
> > > > --- /dev/null
> > > > +++ b/arch/arm/boot/dts/ast2600-facebook-netbmc-common.dtsi
> > > [...]
> > > > +		tpmdev@0 {
> > > > +			compatible = "tcg,tpm_tis-spi";
> > > 
> > > What's the chip used on this board?  Going forward, the DT schema for TPMs
> > > requires the exact chip name in addition to the generic "tcg,tpm_tis-spi".
> > 
> > Sorry about the late response. It's "infineon,slb9670", and I will
> > submit a patch for fix it soon.
> 
> Thank you Tao and Patrick for the replies.  I've prepared two commits
> to fix all violations of the TPM schema on this branch:
> 
>   https://github.com/l1k/linux/commits/tpm-dt3
> 
> The commits are named:
> 
>   e95bdbc arm64: dts: Fix TPM schema violations
>   63e5dfd ARM: dts: Fix TPM schema violations
> 
> I've now amended the ARM commit to use "infineon,slb9670" for:
> 
>   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
>   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
>   arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi
> 
> I intend to submit the two commits once the TPM schema is applied
> either to Jarkko's or Rob's tree:
> 
>   https://lore.kernel.org/all/20231220160422.GA282877-robh@kernel.org/
> 
> Thanks,
> 
> Lukas

I've confirmed it's "infineon,slb9670" for both wedge400 and
ast2600-facebook-netbmc-common.

Pleasr free to add to "63e5dfd (ARM: dts: Fix TPM schema violations)":

Reviewed-by: Tao Ren <rentao.bupt@gmail.com>


Cheers,

- Tao
