Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BFF35515A
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 12:57:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FF4H84lRYz30Bp
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 20:57:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=NS6dtPAv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::430;
 helo=mail-wr1-x430.google.com;
 envelope-from=richard.purdie@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=google header.b=NS6dtPAv; 
 dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FF4Gx3Tfvz2xZs
 for <openbmc@lists.ozlabs.org>; Tue,  6 Apr 2021 20:57:10 +1000 (AEST)
Received: by mail-wr1-x430.google.com with SMTP id i18so10266618wrm.5
 for <openbmc@lists.ozlabs.org>; Tue, 06 Apr 2021 03:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=S8VaE8lFhHiJwEdzyqCsXNvSf/JgRSLWHM7g0kuG+yQ=;
 b=NS6dtPAvd9sUbTfVqthHw7Adr6C0nT+WngfzbzmPK3Ord/iyyR4buW+PaLApBycSVf
 /o6+wMOmDX1YlSgbehJ+iXPP1xvCc22O3hDxDEUInj1bs/iTLV58V+VKfJjtKiEqjEMM
 z/4skyxFljrAT2Ev3n/+bDbHuPdtVhdorI99s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=S8VaE8lFhHiJwEdzyqCsXNvSf/JgRSLWHM7g0kuG+yQ=;
 b=iiNw7mTCXlBIbiIHL1BYTvZLIUuRIIC5/mkJfqAwFxeiuKSqm14eLH0weIxabg+iSo
 dwq/EFCPbTdZotPdCc82Yw09/xVIwMprBPocItDk8jq9m0F+Z8LaRdzpnhT6Um9FU9A3
 NHatwEHKowCGqmSCUOBZ2yGte0qrDjnRG9MsmtQ8RW91QZBJuJYlpER+42YDoVjMzx/t
 JxAls6PDG9he1xLM8VCtw7B4qONhhAPcE3bAqQ0o6IZLlBMFEAnPQigZ3kplcS3SygZ6
 DUcdSmqrB++tBvkalcadYyQr5PauzJ6z8zQd5yCdlmUthkNd062DvxdCgh7O3paq5jqR
 qWBw==
X-Gm-Message-State: AOAM530iB3Too6u2sZHCu+nkio1GFxYPNjOE73SnIvA0UqJg/EfJFSFm
 PRllwQvxmTVH04A6sYYm4ZaalEsDHrQK8A==
X-Google-Smtp-Source: ABdhPJxi4eqSlyj1EJ4WqLWrbE9S5lgajb198eVGRN9dtOBgLqjRMukrwJ5qPaItU29ec/1hdM4bzA==
X-Received: by 2002:a05:6000:1184:: with SMTP id
 g4mr8108910wrx.13.1617706625685; 
 Tue, 06 Apr 2021 03:57:05 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7a9e:d3b:5548:6469?
 ([2001:8b0:aba:5f3c:7a9e:d3b:5548:6469])
 by smtp.gmail.com with ESMTPSA id z15sm668672wrw.38.2021.04.06.03.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 03:57:05 -0700 (PDT)
Message-ID: <f303476a66be3cc3beea01d3a71e2db1ef1d44c4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 0/4] u-boot: Support for SPL verified boot
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>, 
 openembedded-core@lists.openembedded.org
Date: Tue, 06 Apr 2021 11:57:04 +0100
In-Reply-To: <20210326201410.13906-1-klaus@linux.vnet.ibm.com>
References: <20210326201410.13906-1-klaus@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: andrew@aj.id.au, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 2021-03-26 at 17:14 -0300, Klaus Heinrich Kiwi wrote:
> This patch series aims at extending U-Boot's verified boot support to
> also include SPL.
> 
> Presently, setting UBOOT_SIGN_ENABLE instructs the classes uboot-sign
> and kernel-fitimage to create and sign a Linux Kernel fitImage. This
> proposal introduces the variables UBOOT_FITIMAGE_ENABLE and
> SPL_SIGN_ENABLE that will, respectively, create and sign a U-Boot
> (proper) fitImage that the SPL can load (and verify if enabled)
> 
> In order to accomplish this, the first patch moves some of necessary
> infrastructure (variables, functions) used to sign the Kernel
> fitImage to more common locations, and then essentially duplicates the
> method currently used to sign the Kernel fitImage to also sign the
> U-Boot fitImage.
> 
> If the variable UBOOT_FITIMAGE_ENABLE = "1", the uboot-sign class will
> copy the SPL files (nodtb image and dtb file) from the u-boot recipe to
> the staging area, so that the Kernel recipe can then create the U-Boot
> fitImage.
> 
> In case SPL_SIGN_ENABLE = "1", the U-Boot fitImage will be signed using
> the key provided by SPL_SIGN_KEYNAME / SPL_SIGN_KEYDIR, or will
> auto-generate keys based on UBOOT_FIT_HASH_ALG, UBOOT_FIT_SIGN_ALG and
> UBOOT_FIT_SIGN_NUMBITS if UBOOT_FIT_GENERATE_KEYS is "1".
> 
> After the operations above, the Kernel recipe will deploy the (signed)
> U-Boot fitImage, the ITS script used to create it, as well as the SPL
> concatenated with the DTB containing the pubkey to the images directory.
> 
> The reason why the U-Boot fitImage is created by the Kernel is in order
> to make sure that, when UBOOT_SIGN_ENABLE is set (and the Kernel
> fitImage is signed), the U-Boot fitImage being created/signed contains
> the pubkey used by the Kernel recipe to sign the Kernel fitImage.
> 
> I added oe-selftest testcases and also tested this on upstream OpenBMC
> with AST2600 BMC devices.
> 
> Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>

I've merged this, I wanted to say a big thanks for writing some test cases
for these code paths. It should start to help a lot in this area in the
future. I'm going to be asking that future fixes in this area add/improve 
test cases to cover issues too.

Cheers,

Richard

