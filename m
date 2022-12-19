Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6534D650B54
	for <lists+openbmc@lfdr.de>; Mon, 19 Dec 2022 13:20:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NbJh01Wg0z3c66
	for <lists+openbmc@lfdr.de>; Mon, 19 Dec 2022 23:20:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=O1gbRQt3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e32; helo=mail-vs1-xe32.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=O1gbRQt3;
	dkim-atps=neutral
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NbJgP6zT7z2xJN
	for <openbmc@lists.ozlabs.org>; Mon, 19 Dec 2022 23:20:01 +1100 (AEDT)
Received: by mail-vs1-xe32.google.com with SMTP id q128so8430195vsa.13
        for <openbmc@lists.ozlabs.org>; Mon, 19 Dec 2022 04:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UtXTFZHf3aVGJpHVGI6rIuUunhrX9hgMZRutlbE5Png=;
        b=O1gbRQt3cPsc+vLtAct02ZrycIj1Nd6vmA6YUL4xt2OI7fQ6sMP4wUicxiKz8snkDL
         5pMW7lb5xOIIUNb2Xwj6eKJNIYBw9E6dyBFyp5dNCc5DFamMR2ILIyNSBCT7L5NCUyrl
         pRvDkudWDbevlDu4SfqsZgg8QElQ5hAPa87Tanx8FjpKAn2mosmd92enxvZZQ71pkgbx
         EpBDMFzHAWs5yGWYeK5hZlLIZJHR9PQ4IlDPW55mIEB3qgcx/E12n71Uy07W/Oym5Q45
         8hHZdznKLfBS47IRp0hfuMnpxPe+ZdmBnzqGHzbFDqf7sxTJSQ6e29zTA1pXL2MnObsV
         apsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UtXTFZHf3aVGJpHVGI6rIuUunhrX9hgMZRutlbE5Png=;
        b=VpG/ZrqEZcNY/uNH3xRYOYS8OTYngfliy6mCPgcfgs0KeRv8qGwn96+YiPwq7Ol2hx
         kAbFTNbkaV12cOaZij0RA4P3vNGCbc5+LM+gFH0LndeJBu1rzvqqGq4JgMFiPJ+qrrCO
         nNzUVWkPj9G/3TiP9aZ8DIPegr9H8IYwtNOd8sNbGfAGJawizbL4BwcolTHJ+xMcKUmO
         NYsbaq3cKZuVVIVjd/LNXrEApNGM2T5IPvg35l5KqF5p0u/Fu1310BPolfRwnVQ6BgS3
         ipYPoWugahasVYP8ObftbK0pAR/sSUFF3h1ya49OF1mJQ2CbmQPcxxc0yGQzcXBNyk6P
         4XAw==
X-Gm-Message-State: ANoB5pkcPvntnHk/+UlUogTeBnZz8I5+pUsDVudcOcYhWC+5K9m/GSVr
	QTysmCCMe+flIXphNRezPfIlRUprB6FeAyPm0/c=
X-Google-Smtp-Source: AA0mqf5DhLkwiNMBaDlDxDf+qy1MFvHuI3nDyO7ibi4lc+8FjHFGoGf5BhxiNBACf0Z4zFYwrJCELfs0+n1tzPaL3+Q=
X-Received: by 2002:a05:6102:3a6f:b0:3b1:3231:ac9e with SMTP id
 bf15-20020a0561023a6f00b003b13231ac9emr14893922vsb.50.1671452398212; Mon, 19
 Dec 2022 04:19:58 -0800 (PST)
MIME-Version: 1.0
References: <20221216073141.3289309-1-milkfafa@gmail.com> <20221216073141.3289309-2-milkfafa@gmail.com>
 <b861f167-c22b-7152-c273-47dfab54fe74@linaro.org>
In-Reply-To: <b861f167-c22b-7152-c273-47dfab54fe74@linaro.org>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Mon, 19 Dec 2022 20:19:47 +0800
Message-ID: <CADnNmFob+WsQFr+1EffGjP5ZVgKRutHyYoNLQkL85xNyraRAFA@mail.gmail.com>
Subject: Re: [PATCH v16 1/3] Arm: dts: nuvoton: Add node for NPCM memory controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, tony.luck@intel.com, rric@kernel.org, benjaminfair@google.com, KWLIU@nuvoton.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, tmaimon77@gmail.com, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, bp@alien8.de, ctcchien@nuvoton.com, james.morse@arm.com, YSCHU@nuvoton.com, mchehab@kernel.org, kflin@nuvoton.com, linux-edac@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

> Use subject prefixes matching the subsystem (git log --oneline -- ...).
>
> It's "ARM:"

Will correct the subject prefixes in next patch. Thanks for the review.

Regards,
Marvin
