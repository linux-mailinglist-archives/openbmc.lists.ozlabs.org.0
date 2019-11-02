Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC428ECF76
	for <lists+openbmc@lfdr.de>; Sat,  2 Nov 2019 16:19:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4752lr5kVkzF6LN
	for <lists+openbmc@lfdr.de>; Sun,  3 Nov 2019 02:19:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BI41sgD5"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4752kh56RPzF5jR
 for <openbmc@lists.ozlabs.org>; Sun,  3 Nov 2019 02:18:20 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id z4so2974684pfn.12
 for <openbmc@lists.ozlabs.org>; Sat, 02 Nov 2019 08:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Pf5kJVwgXcfe9B9zOMWVoZc4vlsqhIagn6FLoLNF6Po=;
 b=BI41sgD57Ac3b+Gi7Lyki8iyOmCzJCvu7I41CNmSx3UybDNDpuzql2KwYP8uWeBolL
 whzfoNYn6nYgsURJfFbNtz8s+Z0edUflbZqmB4EiY+bWoFXhniMyeCYqvNumgjtYGXL7
 0ENOKmx8tKNPogs1KhLMeV3sKuo4CMJ03GpU/SGaRTJBq5aIUZzjsuNEobDcBqlBJ4q+
 Ti7dxCvFa1isBZMjLa1IZ6BK/JNt1d3/CZZxZMXWQO4w6w/xjqDbI8U8K7Lug4wUcjiA
 jqoaiWTpPYbKCDEn+eS+S8peOK8VwDHV7GGeZ3MgCAFdV9K1BcDOnXZ0xYN+hSaxRsVG
 vOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=Pf5kJVwgXcfe9B9zOMWVoZc4vlsqhIagn6FLoLNF6Po=;
 b=GUZdFVQh51DGRdjl6AbvCxZW8h/UfOpzdCFNuN8jJ7wQXyOKG35uhN4NUn1VhHg3Zd
 nbPUo9WkUoEJ7tVWgpM/AozKdUlmqniOYUgAxvLtoDQrRMrBf5sQo5+Mk10vOQX9zuXW
 ftQCXab5jstEezEg75ZdhENg29oazyNDvTfOZNbXZCqPWzyo8IOyJRkugbTC5KlDlz0I
 GE/Gu6V4WHaLssLwMC4q4HE9A95qVFtV9EOexqqO37NUG1yCRmfaNT60nV8t+Ii7X+uy
 CibKtbo6LFGQoPkk4VcCDlDMQiNARwufIpJvZxamros+7oZj3Lp5W37Z2CJnm2Ar7kD3
 R6qg==
X-Gm-Message-State: APjAAAV5AGEv9evAkWtVNsZdq8GuX91q75/PANFb9PagH26lPR9Zhxcf
 C1Trq0p9UlI9zmiXIMh3p5M=
X-Google-Smtp-Source: APXvYqy3MReZbMUoAx7amLghNCcnNvBxw7vDoLCm92p+yy86PO7CwM9Mr5He1JcdcJc/jF5o8BUkBw==
X-Received: by 2002:aa7:8e0a:: with SMTP id c10mr20346790pfr.166.1572707896585; 
 Sat, 02 Nov 2019 08:18:16 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id r19sm9583872pgj.43.2019.11.02.08.18.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 02 Nov 2019 08:18:16 -0700 (PDT)
Date: Sat, 2 Nov 2019 08:18:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: rentao.bupt@gmail.com
Subject: Re: [PATCH v2 1/2] hwmon: (pmbus) add driver for BEL PFE1100 and
 PFE3000
Message-ID: <20191102151815.GA21822@roeck-us.net>
References: <20191029182054.32279-1-rentao.bupt@gmail.com>
 <20191029182054.32279-2-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191029182054.32279-2-rentao.bupt@gmail.com>
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
 linux-doc@vger.kernel.org, taoren@fb.com, openbmc@lists.ozlabs.org,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Oct 29, 2019 at 11:20:53AM -0700, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> Add "bel-pfe" pmbus driver to support hardware monitoring for BEL PFE1100
> and PFE3000 power supplies.
> 
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>

Applied.

Thanks,
Guenter
