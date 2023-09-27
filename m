Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E79627B1CD2
	for <lists+openbmc@lfdr.de>; Thu, 28 Sep 2023 14:46:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IR5alq4R;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxCrt5JQpz3cB7
	for <lists+openbmc@lfdr.de>; Thu, 28 Sep 2023 22:46:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IR5alq4R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwVM43VYBz2yVd
	for <openbmc@lists.ozlabs.org>; Wed, 27 Sep 2023 18:36:14 +1000 (AEST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-405361bb93bso103224205e9.3
        for <openbmc@lists.ozlabs.org>; Wed, 27 Sep 2023 01:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695803767; x=1696408567; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RP4NFLi1nTGuMaBbBhxBM0a+Xsqfu8L1EJzzk4FIXJw=;
        b=IR5alq4RJb/0Sr9VmiFKD6f5L2E/DUpz2QHsMz72JMfxU+gJJF5Hh4PHgLisPfCj6t
         a5eYyE+v+eC28E1JbRTWyNZI+gDsF/57h1DWWTB7Ynn+C5rWIo+AlxF+/H3wv4M4XOCf
         /ZN5XCFbiJ4FRmAutymBTz7pOOiDCbKZz+BcDfEkptLZW2wurGaDj+A1OTmgxT3GcdWp
         oTZvWnw1NCa07Mnn5CYBTuwhlJRR1Wo93NckuBNGWS/KxF4mxE9XAwbWCoP9ToMSU2+y
         OmzmKGWCS4U1VRVLdGbxHzhJK0tZlDAqfkGMpm97kL58RICHxvbg8VPddx9I2j0JtESU
         061w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695803767; x=1696408567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RP4NFLi1nTGuMaBbBhxBM0a+Xsqfu8L1EJzzk4FIXJw=;
        b=dTOd29w+PTc7/XQ/IZrhIbd/dHR/8mJPkCq6nVXwpO+iCYuhAOpdImzzphRl8AJKVa
         792UAzHJFKI4JtXlwxD17J+GCgJgDT7uERA120ga473oq52QORguXk9Was/XzqSJ4No/
         AHIUpU/gCrU47HUGLPlNAX1Li1gu70+OCYgDxPUfXIV+AeYXnZQ7hTSNourXFKY8/cn6
         KfgjRQnt18iX4caUsYLDZDjFVtCaADoMUhVwOzb+2sftgZeJG0BX4vRm4tFDgTLcWIbR
         /IvYI02edUugvhnWGb5FGmLLAoOsHyaEJQLtoOYjiWCd+Hhms99/MwcVqwNxwI84T4tJ
         arcA==
X-Gm-Message-State: AOJu0YzAZoJl2+nsH8J0aK6sRq5bjvIuyXfyLxw8N/SRyWZeOKi1Qbjp
	JHgLN4rXWzCJXFThMPXagRzGjA==
X-Google-Smtp-Source: AGHT+IE+mnly4WGbql9i2+vMbD8YM5WK4IFFUoPHInOBqXn9QewjEQFn7gUvIdsmbUU2zlTnGqS0LA==
X-Received: by 2002:a05:600c:ac1:b0:403:272:4414 with SMTP id c1-20020a05600c0ac100b0040302724414mr1509992wmr.0.1695803766941;
        Wed, 27 Sep 2023 01:36:06 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o7-20020a1c7507000000b004051f8d6207sm17182075wmc.6.2023.09.27.01.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 01:36:06 -0700 (PDT)
Date: Wed, 27 Sep 2023 11:36:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [bug report] media: nuvoton: Add driver for NPCM video capture
 and encoding engine
Message-ID: <88c78401-a3bf-4996-a703-c2869d3d7d23@kadam.mountain>
References: <f794bf89-584b-41ff-a021-ab973cae89f8@moroto.mountain>
 <ad3feca0-94da-4b81-b52b-6a893bd07e5c@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad3feca0-94da-4b81-b52b-6a893bd07e5c@xs4all.nl>
X-Mailman-Approved-At: Thu, 28 Sep 2023 22:44:44 +1000
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
Cc: openbmc@lists.ozlabs.org, milkfafa@gmail.com, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 27, 2023 at 10:04:01AM +0200, Hans Verkuil wrote:
> Hi Dan,
> 
> On 26/09/2023 16:23, Dan Carpenter wrote:
> > Hello Marvin Lin,
> > 
> > The patch 70721089985c: "media: nuvoton: Add driver for NPCM video
> > capture and encoding engine" from Sep 22, 2023 (linux-next), leads to
> > the following Smatch static checker warning:
> > 
> > 	drivers/media/platform/nuvoton/npcm-video.c:1004 npcm_video_raw()
> > 	warn: sleeping in atomic context
> 
> Hmm, why didn't my smatch run see this? Does this check require something
> special? Does it rely on having run build_kernel_data.sh?

Yep.  It relies on build_kernel_data.sh.  Otherwise it that code is all
released.

regards,
dan carpenter

