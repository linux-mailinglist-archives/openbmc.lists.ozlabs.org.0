Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEE953B072
	for <lists+openbmc@lfdr.de>; Thu,  2 Jun 2022 02:33:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LD6SG2srLz3bml
	for <lists+openbmc@lfdr.de>; Thu,  2 Jun 2022 10:33:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QPOHKu2J;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::231; helo=mail-oi1-x231.google.com; envelope-from=tcminyard@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QPOHKu2J;
	dkim-atps=neutral
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LD6Rm2rWzz3bYS;
	Thu,  2 Jun 2022 10:32:50 +1000 (AEST)
Received: by mail-oi1-x231.google.com with SMTP id k11so4709091oia.12;
        Wed, 01 Jun 2022 17:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=sh16xGe/echtR67o8EYAV8ZtQjoNwgsJwYaCJqxIORY=;
        b=QPOHKu2JZdnGBtC7fmTtjOSE9oopRqCnfZOiDgt6Xq8NaeFj5LEpiNC4MBvSny6XAZ
         tP23yYoSibaO17BC+tN/4ndFzeu3y9sAlpFxVrvR46zGNkrmktR82tsnRYao912mVlgu
         sFnMmIo/6tg4Mf1sU3/boIWlqZvWGKl6F7TtFJWoKmbeKgyEm9YDB5EQd+wNDBuGyvTX
         E9bkmD/dKERVdm2JsF9okxmr6y9B2DO2czXcmSta8JmSRNupjJh1aMt94eWuHQdZiOYP
         kpQk2+ruD30huk1PRYNfV17WxAzjzkzOE8Zn/WugahtBCADPO8Sj5PlPfroNmHZkNiyY
         469Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition:in-reply-to;
        bh=sh16xGe/echtR67o8EYAV8ZtQjoNwgsJwYaCJqxIORY=;
        b=NnOeMnmC7/hBSXSZZv8YpctLUk7NfheLPMzgH5MPOApEo596FPYWJbfGD5UfWKxBwf
         0UXYtTYRQq6mur8gYQUa5MSflM9NjjrdlA3GvYXRgUYnKmVPTO/9ry8gc+xztMRGlSBV
         sOcx1Tq9RGe22hUrpS8EHuJLLFxM5zwxgbrxyVcFQIOwXc6rQqF+k90jdIcUaeP3b5B7
         3e3JqbjHA1JWlveHVtpdo2E6VwoJZs3+/Vg44xtdQFXjRsusCe+wFuR7+OFcj6CAsbgW
         C7SZxNodoNoTyvBTWkjE+0l3upyYfq2VBAi7uCvIJgP4Lontj5sorIJdZNHk2s7wKfwO
         Ib0A==
X-Gm-Message-State: AOAM531dBhMxKaXTvfAeBY/LDaKMCsWX9kXIV3qvfGtQRkbBr5qUsE/R
	thTjZqUnkXwB8NeGGRIutw==
X-Google-Smtp-Source: ABdhPJzvSVAppomg02HmNv/mcRsuQs1poeKeWSDg8cjkuwsPJmAtobRPluwWod2pXyfwLfpU1Gm0fQ==
X-Received: by 2002:a05:6808:2196:b0:32b:492a:3b4d with SMTP id be22-20020a056808219600b0032b492a3b4dmr1200787oib.255.1654129966739;
        Wed, 01 Jun 2022 17:32:46 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id 12-20020aca120c000000b00325cda1ffa5sm1542462ois.36.2022.06.01.17.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 17:32:46 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:cca5:4cab:9a61:6930])
	by serve.minyard.net (Postfix) with ESMTPSA id 423751800BB;
	Thu,  2 Jun 2022 00:32:45 +0000 (UTC)
Date: Wed, 1 Jun 2022 19:32:44 -0500
From: Corey Minyard <minyard@acm.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [Openipmi-developer] [PATCH v7 1/3] ipmi: ssif_bmc: Add SSIF BMC
 driver
Message-ID: <20220602003244.GK3767252@minyard.net>
References: <20220422040803.2524940-1-quan@os.amperecomputing.com>
 <20220422040803.2524940-2-quan@os.amperecomputing.com>
 <20220423015119.GE426325@minyard.net>
 <ec7b86ec-827f-da64-8fd2-eae09f802694@os.amperecomputing.com>
 <20220504120631.GE3767252@minyard.net>
 <ba084735-0781-7ca2-4d04-a70a4115729a@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba084735-0781-7ca2-4d04-a70a4115729a@os.amperecomputing.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org, openipmi-developer@lists.sourceforge.net, Open Source Submission <patches@amperecomputing.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jun 01, 2022 at 03:23:11PM +0700, Quan Nguyen wrote:
> On 04/05/2022 19:06, Corey Minyard wrote:
> > On Wed, May 04, 2022 at 01:45:03PM +0700, Quan Nguyen via Openipmi-developer wrote:
> > > > 
> > > > I seem to remember mentioning this before, but there is no reason to
> > > > pack the structures below.
> > > > 
> > > 
> > > The packed structure is because we want to pick the len directly from user
> > > space without worry about the padding byte.
> > > 
> > > As we plan not to use the .h file in next version, I still would like to use
> > > packed structure internally inside ssif_bmc.c file.
> > 
> > Packed doesn't matter for the userspace API.  If you look at other
> > structures in the userspace API, they are not packed, either.  The
> > compiler will do the right thing on both ends.
> > 
> > > 
> > > > And second, the following is a userspace API structures, so it needs to
> > > > be in its own file in include/uapi/linux, along with any supporting
> > > > things that users will need to use.  And your userspace code should be
> > > > using that file.
> > > > 
> > > 
> > > Meantime, I'd like not to use .h as I see there is no demand for sharing the
> > > data structure between kernel and user space yet. But we may do it in the
> > > future.
> > 
> > If you have a userspace API, it needs to be in include/uapi/linux.
> > You may not be the only user of this code.  In fact, you probably won't
> > be.  You need to have a .h with the structures in it, you don't want the
> > same structure in two places if you can help it.
> > 
> 
> Dear Corey,
> 
> Is it OK to push the structure definition into the
> include/uapi/linux/ipmi_bmc.h ?
> 
> Or should it need to be in separate new header file in uapi/linux ?

I think a different file, like ipmi_ssif_bmc, to match the file and
operation.  Unless you need the things in ipmi_bmc.h, which I don't
think is the case.

-corey

> 
> Thank you,
> - Quan
> 
> 
