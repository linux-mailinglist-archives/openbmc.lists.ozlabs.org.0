Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2966658C858
	for <lists+openbmc@lfdr.de>; Mon,  8 Aug 2022 14:27:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1b7J3418z30DP
	for <lists+openbmc@lfdr.de>; Mon,  8 Aug 2022 22:27:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=X6XEAuWx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::35; helo=mail-oa1-x35.google.com; envelope-from=tcminyard@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=X6XEAuWx;
	dkim-atps=neutral
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1b6x1lksz2xGx
	for <openbmc@lists.ozlabs.org>; Mon,  8 Aug 2022 22:27:03 +1000 (AEST)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-10d845dcf92so10278645fac.12
        for <openbmc@lists.ozlabs.org>; Mon, 08 Aug 2022 05:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:from:to:cc;
        bh=lsnBErhuU0r6TlMRuprIA+8yllP/XwwhzP1dc85oLRo=;
        b=X6XEAuWxtEVncbUVnM4LteJBd0Dc1i8ZXlHAd1Db9JERJMXK+jn6zh8haWzEIuTpvJ
         e/9/5EnD48wz+guGpkQRTgeoenkEyewYZArRr/c7jrvN1dcARmCLjrh4q/3i65j5ecMl
         4t8TF1kiziTLb8j/fmXYCP0A0hcZz8qBPzuMYdGGJbkOEXhCMXTmyH6nxZMv9x8qFdMX
         9pKfdk1mcDa4qdfycOqjp/NJrRbF5ydbVaDE/8lS6PRBApv3xypLwonIMevUMHieOeWF
         VVO7h5QdmzvdUbKZ4sSxTO5wr3dsgYJA5TDsNHXuRO3PkcuFs/xSFxLw93tZLRvY0W2e
         M9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
         :to:cc;
        bh=lsnBErhuU0r6TlMRuprIA+8yllP/XwwhzP1dc85oLRo=;
        b=XXLWTSjLcnh00uYTQKd20zRbL7VJizz+Gj2CF74oQjUJREvqD7Vmf4xhxR8wNnZB3V
         ZaqXij9LP15dD1hSOOYAnRxKiFsq7bEc6++NRsS3uQg0HBHiP0bTpjaZIJ7J6BkoWSbB
         0NA7+bOvVXTguQKfg4udZBTQ7B1kB6BaTruGssyFGFUkLAxWc27SqtehYhqi9yFhNzet
         dNQQdWalzayubaMC25qZG5MiVSRDyjVXHr3bjwAtayhjQgzT3RUHxjJHwCJCNR/j/GqG
         LqCz/pc+F/6tCWJptbMOlVCDjo7RV1Bt+QW5cElB6xymQbEDMGakBp7nUepfafho8hVw
         uv2Q==
X-Gm-Message-State: ACgBeo2+1S9kzk7QUghT4iyES+DyJuddEUnoSoRvoNKMo02boqsW3/+q
	cvoDEVCnQt8VeAnS9WGlig==
X-Google-Smtp-Source: AA6agR50jq+nfiCg6C40xQ7OLmWG0uCJ0WEwg5bSHfc4fFU87YwMbz6vkTdnumtoDH5wUQXXhydsnA==
X-Received: by 2002:a05:6870:c596:b0:101:6409:ae62 with SMTP id ba22-20020a056870c59600b001016409ae62mr11777265oab.112.1659961615326;
        Mon, 08 Aug 2022 05:26:55 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id p84-20020acaf157000000b00342df642fd3sm916967oih.48.2022.08.08.05.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 05:26:54 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:3153:e085:df0f:abc2])
	by serve.minyard.net (Postfix) with ESMTPSA id A861A1800FA;
	Mon,  8 Aug 2022 12:26:53 +0000 (UTC)
Date: Mon, 8 Aug 2022 07:26:52 -0500
From: Corey Minyard <minyard@acm.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3] dt-binding: ipmi: add fallback to npcm845 compatible
Message-ID: <20220808122652.GO3834@minyard.net>
References: <20220808075452.115907-1-tmaimon77@gmail.com>
 <da83671e-08b9-2d68-e5d3-d9b09c105bb4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da83671e-08b9-2d68-e5d3-d9b09c105bb4@linaro.org>
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
Reply-To: minyard@acm.org
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openipmi-developer@lists.sourceforge.net, jic23@kernel.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Aug 08, 2022 at 11:11:16AM +0300, Krzysztof Kozlowski wrote:
> On 08/08/2022 09:54, Tomer Maimon wrote:
> > Add to npcm845 KCS compatible string a fallback to npcm750 KCS compatible
> > string becuase NPCM845 and NPCM750 BMCs are using identical KCS modules.
> > 
> > Fixes: 84261749e58a ("dt-bindings: ipmi: Add npcm845 compatible")
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> 
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Ok, I think I understand how this is supposed to work.  It's not
altogether clear from the device tree documentation.  It says in
Documentation/devicetree/bindings/writing-bindings.rst:

- DO make 'compatible' properties specific. DON'T use wildcards in compatible
  strings. DO use fallback compatibles when devices are the same as or a subset
  of prior implementations. DO add new compatibles in case there are new
  features or bugs.

AFAICT, there are no new features or bugs, just a new SOC with the same
device.  In general usage I have seen, you would just use the same
compatible.  However, if I understand this, that last sentence should say:

  DO add new compatibles in case there is a new version of hardware with
  the possibility of new features and/or bugs.

Also, the term "specific" is, ironically, vague.  Specific to what?

It would be nice to have something added to "Typical cases and caveats"
that says:

- If you are writing a binding for a new device that is the same as, or
  a superset of another existing device, add a new specific compatible
  for the new device followed by a compatible for the existing device.
  That way, if the device has new bugs or new specific features are
  added, you can add workarounds without modifying the device tree.

Anyway, I have added this to my tree with your ack.

-corey

> 
> 
> Best regards,
> Krzysztof
