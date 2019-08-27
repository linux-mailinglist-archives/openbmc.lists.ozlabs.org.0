Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C609F170
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 19:22:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Hwg3022MzDqFt
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2019 03:22:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Iauj4YMD"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HwfF1SzwzDqSv;
 Wed, 28 Aug 2019 03:21:57 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id w10so13048454pgj.7;
 Tue, 27 Aug 2019 10:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zRigP/msiQiDSPdu4zbzx+Q8x/ih7vzlwsY6a8Wz66s=;
 b=Iauj4YMDxlI7eSu/g9BPoFQBxpnhpWIfR4fBeRCtD1F+hz08fDxiccP5oYfoAH7en3
 bTcbEs/SFVl9UkpYreup9INiGKmMuerTPULnaBtTUygkNG0nbaoMSyflf3ERPTRpMLSP
 VVfD+4qV6SHX/L8+KcYbfan27OAC0eVHgWPrr/r0ugUUblmgOSBvN3t+cz0PmxOiN277
 /+gewSrztdybZcF91zFblvsW6WTD/D8pBvNHBm5DD8inJL4925TLHvKitxges+MpkKYc
 rwXDYio+g1DLNHBP7uCu8EKOZZXsGRXU1BcmPBdX4Q+FJZwICl99e6kCKvcIJY5YU3qd
 Rtbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=zRigP/msiQiDSPdu4zbzx+Q8x/ih7vzlwsY6a8Wz66s=;
 b=CywAfCkyprI367npDCg6v6RbVcDdWUKl3aWjJHF9DxhXpAn/x+UW70vyJDBhQ+nO31
 9nsCx4JF9CLO8D2Eo/iSrEdbE0fD6BSmpi/cOxf/mC/la6LOA+Ak2+x9pjgq6hcdZeB9
 SIJhm24DbVbXin91soO1vENVeTaz0ilUm7qdclAUM0bepgjedvHY+6w0TjFd5UvMtXP5
 rTEzy0PdW2LOoOPIK5TdV1mVmiIQeoHcyK60QGGqKCWNUoAZFTxTx5lS2ZKJ1SwiqsDB
 CBw/lJnbiNkiF7OMdzK764znMspo72hn4s6cPZL32Kux4QyrgQJLinTfQE5H5YVKhwM+
 ElSQ==
X-Gm-Message-State: APjAAAVvtj2N9MIkF7/xmKAvmqXkVwGFV2fp89+12obweuS1nA3bfvv+
 t3xL553bSN8gQTNQa8pXsG0=
X-Google-Smtp-Source: APXvYqyKRhppJ/qA2UBq6ZMaVWHjlMRhLmiVaZLdW9FTrJ4pwB3mo84sMTVDrIA1/lMdfAUIYt8F0A==
X-Received: by 2002:a62:4ed1:: with SMTP id
 c200mr27207401pfb.218.1566926513664; 
 Tue, 27 Aug 2019 10:21:53 -0700 (PDT)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net.
 [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id 6sm15692223pfa.7.2019.08.27.10.21.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Aug 2019 10:21:53 -0700 (PDT)
Date: Tue, 27 Aug 2019 10:21:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>
Subject: Re: [PATCH v3 3/4] watchdog/aspeed: add support for dual boot
Message-ID: <20190827172151.GA31588@roeck-us.net>
References: <20190827165426.17037-1-i.mikhaylov@yadro.com>
 <20190827165426.17037-4-i.mikhaylov@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190827165426.17037-4-i.mikhaylov@yadro.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Alexander Amelkin <a.amelkin@yadro.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Aug 27, 2019 at 07:54:25PM +0300, Ivan Mikhaylov wrote:
> Set WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION into WDT_CLEAR_TIMEOUT_STATUS
> to clear out boot code source and re-enable access to the primary SPI flash
> chip while booted via wdt2 from the alternate chip.
> 
> AST2400 datasheet says:
> "In the 2nd flash booting mode, all the address mapping to CS0# would be
> re-directed to CS1#. And CS0# is not accessable under this mode. To access
> CS0#, firmware should clear the 2nd boot mode register in the WDT2 status
> register WDT30.bit[1]."
> 
> Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>

Please run "checkpatch --strict" on this patch and fix the reported problems
(I _did_ ask for proper multi-line aligment before, but there are a couple
of other issues as well).

Thanks,
Guenter
