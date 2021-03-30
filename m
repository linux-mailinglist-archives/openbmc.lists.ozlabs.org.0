Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C1A34F1B5
	for <lists+openbmc@lfdr.de>; Tue, 30 Mar 2021 21:38:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F909j08PWz3bsh
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 06:38:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=RxSEomzz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::230;
 helo=mail-oi1-x230.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RxSEomzz; dkim-atps=neutral
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F909R4hbfz3bqB
 for <openbmc@lists.ozlabs.org>; Wed, 31 Mar 2021 06:38:17 +1100 (AEDT)
Received: by mail-oi1-x230.google.com with SMTP id c16so17633779oib.3
 for <openbmc@lists.ozlabs.org>; Tue, 30 Mar 2021 12:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xI3kli3hS2fPyhDQvDMlAZ1DPbV3ke0jXU3XxGK6Iv0=;
 b=RxSEomzzNVufOedcbWjk9wGu6u/ZW28ITrTPqkZjm5KifOBlzu8GaTsCv+jhx2CLwl
 FlChfR7smLmVMwMr+wEqKHZkNTWcmieN0k4M+QEKlw6CvglIU9q7wD1TS8Rgt3VSP25+
 FSnTMKpxoZnEIYnDDyGyLWQ3ARtcIvtZztgQv6TAMMJ1FuC+IL5hWei1w0K27HBz8Xpw
 C7YTxIyHAF3d/wXikFXJ+RawHCITkwX9nquErtqIenu8EKM2vs8ibmsPMQaloICQTuAK
 JR2CI5DeaBI1YD2B+tWc1uqKwQcFrO3/TrkkiTjT4Kt7WvMOjpUwjtJZ2ygFrXCha29w
 qulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=xI3kli3hS2fPyhDQvDMlAZ1DPbV3ke0jXU3XxGK6Iv0=;
 b=R/dFS7SMIAEz3geQLmwktKQCivNxpnUh2xJMp68Z85o0vN4JaT6z4xDtSrevh7jyGq
 7iw34AmEPpxkiBhBd6tZ21qQrQua28IlxdzUpOzSO6vXFbIvMpJaZ4ms5EVJ9iti0Rh0
 9hR0DJ8a9J1q1esKS8Ld5YAkUZwR4AzPESdj1VmwROCXXyiz7OlxpW64agf3rrmZMFCl
 SdPnhIVzhmsIK5QU8TBj3urtwLEtp1R+nlWiQOSdkegzCypkmPFyZYLvRqVAof6egFCP
 ftSmUCdNvR3mTun8c/NhJ+6P8O7joliz8QvSbgzZ0Ou9sTw/Ysd5HwLCqqazGcNT4Z9N
 rSRw==
X-Gm-Message-State: AOAM530DLYKjX39arcGsNJVpNC8+O+OubjDHr2ESKZOe/rrXA5aNA7dW
 c+WWCgqcA+wHVdGjj4I11k4=
X-Google-Smtp-Source: ABdhPJyAf0AtIWDRIdBNifFO42dpVXVRAIUztA0dKGsmOxAz3+0OVv43Me3QLKjxHEYgkLXKqk+F7w==
X-Received: by 2002:a05:6808:3d9:: with SMTP id
 o25mr4540965oie.4.1617133092545; 
 Tue, 30 Mar 2021 12:38:12 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id v195sm4331370oia.38.2021.03.30.12.38.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 30 Mar 2021 12:38:11 -0700 (PDT)
Date: Tue, 30 Mar 2021 12:38:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Mark Brown <broonie@kernel.org>
Subject: Re: Enabling pmbus power control
Message-ID: <20210330193810.GA235990@roeck-us.net>
References: <YGLepYLvtlO6Ikzs@hatter.bewilderbeest.net>
 <5105ada1-643a-8e58-a52d-d3c8dbef86b9@roeck-us.net>
 <20210330112254.GB4976@sirena.org.uk>
 <YGNdoYq5lyERVGLO@hatter.bewilderbeest.net>
 <20210330174221.GJ4976@sirena.org.uk>
 <YGNmaNzWOYrJROvX@hatter.bewilderbeest.net>
 <20210330180200.GK4976@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210330180200.GK4976@sirena.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Zev Weiss <zev@bewilderbeest.net>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Mar 30, 2021 at 07:02:00PM +0100, Mark Brown wrote:
> On Tue, Mar 30, 2021 at 12:56:56PM -0500, Zev Weiss wrote:
> 
> > Okay, to expand a bit on the description in my initial message -- we've
> > got a single chassis with multiple server boards and a single manager board
> > that handles, among other things, power control for the servers.
> > The manager board has one LM25066 for each attached server, which acts as
> > the "power switch" for that server.  There thus really isn't any driver to
> > speak of for the downstream device.
> 
> This sounds like you need a driver representing those server boards (or
> the slots they plug into perhaps) that represents everything about those
> boards to userspace, including power switching.  I don't see why you
> wouldn't have a driver for that - it's a thing that physically exists
> and clearly has some software control, and you'd presumably also expect
> to represent some labelling about the slot as well.

Absolutely agree.

Thanks,
Guenter
