Return-Path: <openbmc+bounces-568-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 696B5B4123C
	for <lists+openbmc@lfdr.de>; Wed,  3 Sep 2025 04:14:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGmQT2FW4z30BW;
	Wed,  3 Sep 2025 12:14:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756865681;
	cv=none; b=gPxQt+oq2kF0IQ8oD9GjxoLICSdLf0hLIrl4WkUOAXGVjak2a6QRizAUlGxW5eSSBZIV4Y+EhD4VmxOQd1O7KwHnmjPyufFhjXfNm9OYYC6CrwjTdUe9VzDJhxKnuaAN+ZSC7gb2Sak5gm3Gm8eJ2yz9W/0IjJIBpfevKuB0j690mJCnczBf8um8gr/J5ZSxV8tUglHtMMjqRW4Vim7p5vYv0Okwx+rqWUdMH1j2FPGjNk8rZL1YNI87nbtjwBtyC05lVaRu3a5CJs3l7cFEu9CPTbBkiL7DI11Ft2NdATp4gTLK38Sjvpfxhd4Q0xA6LorWyGijycmVZwrV7zIrHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756865681; c=relaxed/relaxed;
	bh=Oq/uYbHX5tvNrFv3S3IE/iyWmkYMcaYFIsJUt3p8ODU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ql4R5fX29qJ5gJLqcpWulFP7dg8KZuhhQEH9fOeYIoWeKaGzTMJ06B2/YLbbBhvnYVNde5A6Z5BAZBH1W0jKsuHqMYzf/V7IbNzmntXwX0YFWxVZr5L9/34PHIrQIIlTs7KLDrAqPpcjgf/zB+OrXAIs8skVljRu1Nma+TZX8IEU9NjlTUs71Fp4S6K/iU1pFVvmOS0pFsLk9utMEUsrLo3rAVMDkAW2umiEu2aZw3Q/07x6qvuOhmKAwRnxtlMhqCvOFSrlDWhcB0UNO7TURMcyoRgknzk4m5Eq7omIdug3u69IQQFPPhAqleSCHtURvE3FowPoQYsIIwuKy4OyJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Cb/niFgU; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Cb/niFgU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGmQR5tbGz306d
	for <openbmc@lists.ozlabs.org>; Wed,  3 Sep 2025 12:14:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1756865678;
	bh=Oq/uYbHX5tvNrFv3S3IE/iyWmkYMcaYFIsJUt3p8ODU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Cb/niFgUuKQxnpCP2s1jl0I7QYR9dlrbTan92uxYBH81l53KeiXsMLeLFNtsLEbkW
	 SJHr7a4o7E0ISHDQnZZ3XZQzwu7OFWpCQrh+XgUPXeSPgcMrlhslXFK+cJ15viSC0t
	 7O4af4yZvTxRalkTqaqJOurQlPLpAEZoOHP140kYuy1MLWTX8xJD52q+M55QP7bnAy
	 run4RIQS/VUy4bBSFf4vI99F9Y5TkpNh3uEdrA61eDq1Boz4OOc3eYNu6Lt8EMWJ0/
	 pOnFDAlKBtFCh6ShECt/wWrLXBpnZiDjzmd0vBNSMT/4to0d/JDhgTuIevj4F3844m
	 NWokXQ9exAwfg==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id AA2C069374;
	Wed,  3 Sep 2025 10:14:36 +0800 (AWST)
Message-ID: <3213e3a2b9845e23734eda3b8850e683ed5ef7b1.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.12 v1 1/6] soc: aspeed: Add XDMA Engine
 Driver
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ninad Palsule <ninad@linux.ibm.com>, openbmc@lists.ozlabs.org, 
	joel@jms.id.au, eajames@linux.ibm.com
Cc: Andrew Jeffery <andrew@aj.id.au>
Date: Wed, 03 Sep 2025 11:44:35 +0930
In-Reply-To: <20250902183155.2988560-2-ninad@linux.ibm.com>
References: <20250902183155.2988560-1-ninad@linux.ibm.com>
	 <20250902183155.2988560-2-ninad@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 2025-09-02 at 13:31 -0500, Ninad Palsule wrote:
> From: Eddie James <eajames@linux.ibm.com>
>=20
> The XDMA engine embedded in the AST2500 and AST2600 SOCs performs PCI
> DMA operations between the SOC (acting as a BMC) and a host processor
> in a server.
>=20
> This commit adds a driver to control the XDMA engine and adds functions
> to initialize the hardware and memory and start DMA operations.
>=20
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Link: https://lore.kernel.org/r/1588697905-23444-3-git-send-email-eajames=
@linux.ibm.com
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 2 +
> =C2=A0drivers/soc/aspeed/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 10 +
> =C2=A0drivers/soc/aspeed/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 1 +
> =C2=A0drivers/soc/aspeed/aspeed-xdma.c | 961 ++++++++++++++++++++++++++++=
+++
> =C2=A0include/uapi/linux/aspeed-xdma.h |=C2=A0 38 ++
> =C2=A05 files changed, 1012 insertions(+)
> =C2=A0create mode 100644 drivers/soc/aspeed/aspeed-xdma.c
> =C2=A0create mode 100644 include/uapi/linux/aspeed-xdma.h

Applying this to dev-6.12 and building it for aspeed_g5_defconfig
produces:

   ../drivers/soc/aspeed/aspeed-xdma.c: In function =E2=80=98aspeed_xdma_pr=
obe=E2=80=99:                                                              =
                           =20
   ../drivers/soc/aspeed/aspeed-xdma.c:844:1: warning: label =E2=80=98err_m=
isc=E2=80=99 defined but not used [-Wunused-label]
     844 | err_misc:             =20
         | ^~~~~~~~                                                        =
      =20
   ../drivers/soc/aspeed/aspeed-xdma.c: In function =E2=80=98aspeed_xdma_re=
move=E2=80=99:                                                             =
                           =20
   ../drivers/soc/aspeed/aspeed-xdma.c:885:9: error: implicit declaration o=
f function =E2=80=98misc_deregister=E2=80=99; did you mean =E2=80=98bus_unr=
egister=E2=80=99? [-Werror=3Dimplicit-function-declaration]
     885 |         misc_deregister(&ctx->misc);                            =
      =20
         |         ^~~~~~~~~~~~~~~                                         =
      =20
         |         bus_unregister                                          =
      =20
   ../drivers/soc/aspeed/aspeed-xdma.c:885:29: error: =E2=80=98struct aspee=
d_xdma=E2=80=99 has no member named =E2=80=98misc=E2=80=99                 =
                                           =20
     885 |         misc_deregister(&ctx->misc);          =20
         |                             ^~
   ../drivers/soc/aspeed/aspeed-xdma.c: At top level:                      =
                                                                           =
           =20
   ../drivers/soc/aspeed/aspeed-xdma.c:423:12: warning: =E2=80=98aspeed_xdm=
a_start=E2=80=99 defined but not used [-Wunused-function]                  =
                           =20
     423 | static int aspeed_xdma_start(struct aspeed_xdma *ctx, unsigned i=
nt num_cmds,                                                               =
           =20
         |            ^~~~~~~~~~~~~~~~~                                    =
      =20
   cc1: some warnings being treated as errors                              =
      =20
   make[6]: *** [../scripts/Makefile.build:229: drivers/soc/aspeed/aspeed-x=
dma.o] Error 1                                                             =
           =20
   make[5]: *** [../scripts/Makefile.build:478: drivers/soc/aspeed] Error 2=
      =20
   make[4]: *** [../scripts/Makefile.build:478: drivers/soc] Error 2       =
      =20
   make[4]: *** Waiting for unfinished jobs....  =20

Can you please fix these?

Also, during application, checkpatch complained:

     =E2=9C=93 [PATCH v1 1/6] soc: aspeed: Add XDMA Engine Driver          =
              =20
       + Link: https://patch.msgid.link/20250902183155.2988560-2-ninad@linu=
x.ibm.com                                                                  =
                                                                           =
                                                                           =
                     =20
       + Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>       =
      =20
       =E2=97=8F checkpatch.pl: 164: WARNING: please write a help paragraph=
 that fully describes the config symbol
       =E2=97=8F checkpatch.pl: 228: WARNING: please, no space before tabs =
              =20
       =E2=97=8F checkpatch.pl: 563: WARNING: quoted string split across li=
nes           =20
       =E2=97=8F checkpatch.pl: 834: WARNING: struct kobj_type should norma=
lly be const                                                               =
                   =20
       =E2=97=8F checkpatch.pl: 959: WARNING: Possible unnecessary 'out of =
memory' message=20
       =E2=97=8F checkpatch.pl: 1152: WARNING: Prefer "GPL" over "GPL v2" -=
 see commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v=
2" bogosity")

Can you please address these as well when posting v2?

Thanks,

Andrew

