Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B723B89D9E7
	for <lists+openbmc@lfdr.de>; Tue,  9 Apr 2024 15:12:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KKB1/isW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDRFx45S6z3dd4
	for <lists+openbmc@lfdr.de>; Tue,  9 Apr 2024 23:12:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KKB1/isW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDRFN4HTWz3dKY
	for <openbmc@lists.ozlabs.org>; Tue,  9 Apr 2024 23:12:06 +1000 (AEST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a51969e780eso681303566b.3
        for <openbmc@lists.ozlabs.org>; Tue, 09 Apr 2024 06:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712668323; x=1713273123; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JWFiERgbDrqglVNz0ES2yAG+uCVNz/oGLkAHA4DEL/M=;
        b=KKB1/isWXHNEQvhu2VJs/uWYyGQ6R/LewU4MKevzW503lvtCeUj5LlhzR+qe1GBbB7
         8NCmYPJIvT/9drIOwwf2rnosEDsdgmZTmagUG5G3TqOa/USrUr1sKvIolARMCi/6A/Bf
         jlkBRIui6Rjytj3/gVeC3razIJQt/GAeu9OUT09cOAzGGm/ISFq2O2ZyYOJxBF3ghk9a
         J/XRXbss/CbQOCN95I4lvbdANx9atMbICtv16+cZIGm2/kJxP4klWrjV5qDFnnLBQA9n
         9EsSlOVBKdWQLDlAqobipLBPGr3CiqrXINAhJ2Drr36ETYZ9OFwbI7W/IO7H2gc1WZlm
         q1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712668323; x=1713273123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWFiERgbDrqglVNz0ES2yAG+uCVNz/oGLkAHA4DEL/M=;
        b=JSVnrvt2x4uJj2kpJipbUHGEY7PkztPDmbddPL4AHKVRlvZYefXwU97sOlOJEuTlSx
         JI0Zsx1rFj+3MVMtY5hcwlGFaBjyybdGMHWmyrw8qehWUFvQyqTyJ0i1AAWURB4QLpNS
         +iKp+w+lMx5XrOVdn5jTaMaxF00uGobMNQLlaOHV2LqVBxQYUphzz94iOjKCvCCKStAb
         VpHAh03NM03/KhNHgsFAncr4zDGuFTyYPMwvaAyAwvqiRCPGxgxRZSfH0F6OobMidprE
         07oSElDfSozrBEwseoQY4tbw5VcyYSonvzBy0I2P6AC2BRFu7ssrMAnWO6CBSdTU5zmC
         HGAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVH7Tv+bsNZctvCSJELo6j+t7Yl9ldQ+brtEVltkicwPeEDCxT/TN9MsPyBnQeBBeTJqGlLCOTk+Vm9DfYEwWyjjbdLv5gXrXs=
X-Gm-Message-State: AOJu0YxS3iA9AFhmfXUEolykB/qeOcfti2IjepyWPzWS9qAVc/5Gx+7a
	jdPVb0419Qmys8axzsm5Q4TyldquvSeA/0AgGNVk6CCwBj+AuvFbEMdbxOcAC34=
X-Google-Smtp-Source: AGHT+IHM11iunOezkbwlJ6llpbCd73typJc8ayn4aA7J2ThVxI6qP9TuoQTlv/MFoLDDWPt/JHPQDw==
X-Received: by 2002:a17:906:340f:b0:a51:d235:74cf with SMTP id c15-20020a170906340f00b00a51d23574cfmr4645187ejb.38.1712668322828;
        Tue, 09 Apr 2024 06:12:02 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id hg13-20020a1709072ccd00b00a4660b63502sm5774271ejc.12.2024.04.09.06.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 06:12:02 -0700 (PDT)
Date: Tue, 9 Apr 2024 16:11:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jim Liu <jim.t90615@gmail.com>
Subject: Re: [PATCH v1] gpio: nuvoton: Fix sgpio irq handle error
Message-ID: <b36fd94d-d5c7-40b6-bccf-d5c1f66c6373@moroto.mountain>
References: <20240409091419.1356615-1-JJLIU0@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240409091419.1356615-1-JJLIU0@nuvoton.com>
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
Cc: KWLIU@nuvoton.com, linus.walleij@linaro.org, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, brgl@bgdev.pl
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Apr 09, 2024 at 05:14:19PM +0800, Jim Liu wrote:
> Remove irq_find_mapping and use generic_handle_domain_irq
> 

The subject says that it's a fix, but the commit message doesn't tell
us what the problem is.  And there is no fixes tag.

> Signed-off-by: Jim Liu <JJLIU0@nuvoton.com>

regards,
dan carpenter

