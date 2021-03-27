Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CD034B833
	for <lists+openbmc@lfdr.de>; Sat, 27 Mar 2021 17:39:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F74Lz5jRzz303J
	for <lists+openbmc@lfdr.de>; Sun, 28 Mar 2021 03:39:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.41; helo=mail-ot1-f41.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F74Lp1pFjz30GB
 for <openbmc@lists.ozlabs.org>; Sun, 28 Mar 2021 03:39:45 +1100 (AEDT)
Received: by mail-ot1-f41.google.com with SMTP id
 k14-20020a9d7dce0000b02901b866632f29so8235794otn.1
 for <openbmc@lists.ozlabs.org>; Sat, 27 Mar 2021 09:39:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=slhgr6hw24BbRJVfvz1417ZaHRih1z35mJAzQg49R8Q=;
 b=mM2/lT4P+SvTInJYrMhBezfT8n00o/YKb6+Ufcq2q5y2wUeJmySrGKic57tUVEgH/f
 SADIisFLy9zUSy3v4XOT3jLyZMoT7W3jiAkdHRZIVVd0Vx4BxTUI85CogVnVA1eQEhec
 8PR/M0q6bqn+i+nK97wqdPgXHfS/btxyo26qmGO9aD5XBzKccoAVa/M2+230SqXyud3u
 iGdIZr3AbOktc5fYpwmJlEWt1J/Frt0PL5OROVIecstcacEK5zwxNtHtDNSXM07LxXpI
 VkMtGXPemU+oMN2ktZhjd69SVcijX6ApalgpCvCErhYxvXz9cJfM9q1SoXlO0L8eglre
 R8wg==
X-Gm-Message-State: AOAM532KTRyeaviNc7aPIaf+cz7lEMbVxsFnNkBZLpscjaqvJX85v5RS
 Uss5PG4Y9eH7qaYknM0sPQ==
X-Google-Smtp-Source: ABdhPJxQjloklyUslrbUHzJCVse7QmDNkKO884rNpGP+vLsKmHJnuNbHWCAqy30qFKU/CySEHFNduw==
X-Received: by 2002:a9d:3b0a:: with SMTP id z10mr16282117otb.326.1616863183754; 
 Sat, 27 Mar 2021 09:39:43 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.140])
 by smtp.gmail.com with ESMTPSA id m126sm2484503oig.31.2021.03.27.09.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Mar 2021 09:39:43 -0700 (PDT)
Received: (nullmailer pid 215898 invoked by uid 1000);
 Sat, 27 Mar 2021 16:39:37 -0000
Date: Sat, 27 Mar 2021 10:39:37 -0600
From: Rob Herring <robh@kernel.org>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH 06/14] dt-bindings: watchdog: npcm: Add nuvoton,wpcm450-wdt
Message-ID: <20210327163937.GA215847@robh.at.kernel.org>
References: <20210320181610.680870-1-j.neuschaefer@gmx.net>
 <20210320181610.680870-7-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210320181610.680870-7-j.neuschaefer@gmx.net>
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
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, 20 Mar 2021 19:16:02 +0100, Jonathan Neuschäfer wrote:
> Add a compatible string for the WPCM450 SoC, which has the same watchdog
> timer.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
>  .../devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt          | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
