Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E304D5541
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 00:22:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KF4qB1HJCz30KP
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 10:22:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.46; helo=mail-oo1-f46.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KF4pw4tW6z2yXP
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2022 10:22:31 +1100 (AEDT)
Received: by mail-oo1-f46.google.com with SMTP id
 j7-20020a4ad6c7000000b0031c690e4123so8624749oot.11
 for <openbmc@lists.ozlabs.org>; Thu, 10 Mar 2022 15:22:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QxaQQz9lOMso9LFniZ3e9gms+zpAX5bMoBiGaq2NQ80=;
 b=Ct5NPYsl2XFe9dXXN147ljmcKq0vqJrj6ZHhxdNBmn3crzW2vyDgUEaA3l/VvN2N2z
 i8fD7iPWBVrhuVQHKSYjkN6eq9g+9TMgK/9xyYUb8Sbbt4P3aMxfrKlCfs7D1JEWt/F9
 4mvhiyNNh3gxREsIsLibM0W7lZuHzaSY2RTVb7LOzQytHHImd9nDA2dlvfkfqAhDd4sE
 YdcjHlpFevF9l0Idy5fI6XhuDvS3xo6JYQInWk0gy0CfewYRRwNlTyConRssUWp0FBax
 fJXUmdMWBd2HIYvwJmw9SSZxucvNVi5laq4CtVZ+eVrywsUhypOh8B0vbpV6uIzNlUMq
 XNBg==
X-Gm-Message-State: AOAM530s0gL2iqDiU7iYPcw4UPOCWSY+fkb/3+q1EihyKYXpLSfIvHAH
 FU8NtkeUnO47TqIzn7Q4ow==
X-Google-Smtp-Source: ABdhPJwFNsTJVQACKTaShwctSIDZiz2m99HjBzfGEBRTiXcYlYBa4o1rP9aU6sHuo0rtftWCEpnoWw==
X-Received: by 2002:a05:6870:a2c6:b0:da:b3f:2b2a with SMTP id
 w6-20020a056870a2c600b000da0b3f2b2amr9626676oak.201.1646954549150; 
 Thu, 10 Mar 2022 15:22:29 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 n6-20020a9d6f06000000b005b266e43c92sm2567768otq.73.2022.03.10.15.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 15:22:28 -0800 (PST)
Received: (nullmailer pid 2287090 invoked by uid 1000);
 Thu, 10 Mar 2022 23:22:27 -0000
Date: Thu, 10 Mar 2022 17:22:27 -0600
From: Rob Herring <robh@kernel.org>
To: trix@redhat.com
Subject: Re: [PATCH] dt-bindings: clk: cleanup comments
Message-ID: <YiqIMxCBFY8Aq5p4@robh.at.kernel.org>
References: <20220309222302.1114561-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220309222302.1114561-1-trix@redhat.com>
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
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com, paulburton@kernel.org,
 avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 alexandre.torgue@foss.st.com, robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 krzk+dt@kernel.org, tali.perry1@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 09 Mar 2022 14:23:02 -0800, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> For spdx, first line /* */ for *.h, change tab to space
> 
> Replacements
> devider to divider
> Comunications to Communications
> periphrals to peripherals
> supportted to supported
> wich to which
> Documentatoin to Documentation
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  include/dt-bindings/clock/alphascale,asm9260.h    | 2 +-
>  include/dt-bindings/clock/axis,artpec6-clkctrl.h  | 2 +-
>  include/dt-bindings/clock/boston-clock.h          | 3 +--
>  include/dt-bindings/clock/marvell,mmp2.h          | 4 ++--
>  include/dt-bindings/clock/marvell,pxa168.h        | 4 ++--
>  include/dt-bindings/clock/marvell,pxa910.h        | 4 ++--
>  include/dt-bindings/clock/nuvoton,npcm7xx-clock.h | 2 +-
>  include/dt-bindings/clock/stm32fx-clock.h         | 4 ++--
>  include/dt-bindings/clock/stratix10-clock.h       | 2 +-
>  9 files changed, 13 insertions(+), 14 deletions(-)
> 

Applied, thanks!
