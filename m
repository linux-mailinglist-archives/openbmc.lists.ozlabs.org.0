Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC373689E9
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 02:33:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRFdH39vxz2xgF
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 10:33:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=JJpxqJ6B;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::730;
 helo=mail-qk1-x730.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=JJpxqJ6B; dkim-atps=neutral
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRFd35rG3z2xZ9
 for <openbmc@lists.ozlabs.org>; Fri, 23 Apr 2021 10:33:09 +1000 (AEST)
Received: by mail-qk1-x730.google.com with SMTP id 66so8660018qkf.2
 for <openbmc@lists.ozlabs.org>; Thu, 22 Apr 2021 17:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lmDknRlOO74SQtt2g61pXxn92ZfVOum1BvhNomJ0V+c=;
 b=JJpxqJ6BeyXpTjRpchU3Z8J1V1mbrmy9gTGFue6hxjgzYnWRsP26NxY6TaYPbxbOON
 f1SHp73mT1WMolKsbjB6+Pfy46lLi4GwCbwEIQenpGLwsNZhzQKeyJhzzpGtPnXTDDKZ
 WtDQ7owaRpamup4rrlc4bsDXpotxACizJPixg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lmDknRlOO74SQtt2g61pXxn92ZfVOum1BvhNomJ0V+c=;
 b=PzaAR7Rna/w/Steo4AEccp846cXJXY4DxA1MHthaOzpEeNxq2P4azkJGGNTRfIy+7P
 UQWrQ7xNwznD/LeVEBi1Z18ws5a5JfFBs2wON/WvyJvPGGGAIES3nDalLe3h5fQqKW4V
 YkFdkji5ezNlElP5SL4S0TxmDth/ZAvZNyAuqE7MdcynLOmcWFyZot08fCbQG25lGaRW
 qJXBIihli8u8clu708EMK9IFfqdETAXtCeNG/6F81RkSpLA8DgkCWbHz7LyhDdgtWgly
 d/j3SHN1ivaEKbvLxKUOQn6EeHII/EXrfF1VXOMU15irf3gUEYi+zrm/n33SZIr9YUfw
 OPOQ==
X-Gm-Message-State: AOAM530YI3VcZpUhyy1KiDk6aHw/BAlk4Ahd1ZwouO7fVKq0cUNhxF3d
 GM0K28Jd82r24t1/cg+l+IIoz1NBqvBaXO5XT9bA/Q9yw+c=
X-Google-Smtp-Source: ABdhPJx4KpNWL3XTelEH9Jy7D6cQDQUNcRSqcteweyiq7JtaFUvy4SLXxbFvfNgRIpC3QIrPVF9cTVt2qeCCDrVoJu8=
X-Received: by 2002:a37:d202:: with SMTP id f2mr1442240qkj.273.1619137985550; 
 Thu, 22 Apr 2021 17:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210420064648.994075-1-joel@jms.id.au>
 <551fbd94-c454-0284-0d8f-3297082c35a4@linux.vnet.ibm.com>
In-Reply-To: <551fbd94-c454-0284-0d8f-3297082c35a4@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 23 Apr 2021 00:32:53 +0000
Message-ID: <CACPK8XeqHysaOVxPLDUSB89MpSGg25x_S3LhAy3h71GVj0kT6g@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2 00/10] Use HACE to
 accelerate sha512
To: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 22 Apr 2021 at 20:46, Klaus Heinrich Kiwi
<klaus@linux.vnet.ibm.com> wrote:
>
>
>
> On 4/20/2021 3:46 AM, Joel Stanley wrote:
> > Joel Stanley (10):
> >    configs/ast2600: Make early malloc pool larger
> >    crypto: Add driver for Aspeed HACE
> >    ast2600: Enable HACE probing in SPL
> >    ast2600: Add HACE to device tree
> >    ast2600: spl: Remove SECBOOT BL2 kconfig option
> >    ast2600: spl: Add ASPEED_LOADERS option
> >    ast2600: spl: Support common boot loader features
> >    config: ast2600: Configure common MMC SPL loader
> >    configs: ast2600: Enable FIT SHA512 support
> >    config: ast2600: Disable SPL raw image support
>
> Looks like you forgot to include 'clk: aspeed: Add HACE yclk to ast2600'

That patch was already applied to the u-boot tree.

I've since applied this series to the top of v2019.04-aspeed-openbmc.

> It fails pretty instantly even in Qemu without it.
>
>
> Additionally, looks like the spl binary size grew significantly to 59696
> bytes (around 10KB larger than before). The final SPL size when added to
> the Device-tree blob with the 4096bits public key is 65058 bytes, which
> is just a tad over the maximum limit we have of 65024 bytes.

That's a surprise. Were you able to work out where the size increase came from?

Here's the size I see with HEAD:

44a8c618c1215e0faac0f335f0afd56ed4240e76 49986

I'm using arm-linux-gnueabi-gcc (Debian 10.2.1-6) 10.2.1 20210110.

Cheers,

Joel
