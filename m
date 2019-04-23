Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B7C1854A
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 08:18:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45037Q5nnqzDq8g
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 16:18:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=netronome.com
 (client-ip=2607:f8b0:4864:20::743; helo=mail-qk1-x743.google.com;
 envelope-from=jakub.kicinski@netronome.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=netronome.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=netronome-com.20150623.gappssmtp.com
 header.i=@netronome-com.20150623.gappssmtp.com header.b="bQjBs2w8"; 
 dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44pfS03mknzDqBr
 for <openbmc@lists.ozlabs.org>; Wed, 24 Apr 2019 09:15:10 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id l199so45133qke.8
 for <openbmc@lists.ozlabs.org>; Tue, 23 Apr 2019 16:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=mzS8NJXvXhvwkIeuXh0JKOU1NhCCN8QIQnCColypfAo=;
 b=bQjBs2w8b+7lG1hnKi7/rJAfsmtxi5qNS0kAEx3RTh8TTH/IcHN3qQlE5SL5klCktD
 IndIHMYr0hV1TwIusyEwzeoDn8TL7qlcCot6iUzbDv4OVqJdtq9BMrHxZ1dBHaMGmktd
 hZDdVwBwFsCD9btMP1FCvwViNtNK6VxLIsm4RBQNhua3Pfj6NQafb5se9yA7sSSFm/p0
 5tuuVosClhPbEGjraDqaIx6SGpvCvNZJQ0ZwXgd5eoY0jsGDo2kUWxuYSGYM6YCsw+88
 5Pjf8Oo5dagqdcehClrCY6V5waAg04D19VOdNz/kfD06WO5jUx09yoO1pL2eFC49U50/
 Q5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=mzS8NJXvXhvwkIeuXh0JKOU1NhCCN8QIQnCColypfAo=;
 b=nSCWOxA9DTFvdL4iXEGJwRBIa9kJGhKaVLbVkJyfiWCzVqYYeYMILGr5P9Mlpe/VK7
 hZPuO6MfYcs8l+09niE8797kR21xcVEgH//vMJ5E7uPiEzp76He+Hc07DrOA7JdGDK4U
 bP/EdXVsu+xGOO7j9coGbfDenuOaBzxquaSRHMrPy9g5MLTok+CoWTLu/6T/EgsJOBJe
 aDRL1RnIk9FJGWgzkuVw9nCamyA5wrMaMGJtA4szGtmn/aTHEomxU03t18wi+vipISQW
 6J9/y/ZekHrujOo2kDF7+pOFdHg+FMSw4HEea2rkyp8LmPdiMdIPbmPPJyYIutc8Nsbl
 /E7Q==
X-Gm-Message-State: APjAAAWy6DOVFOhz+2i/bImGaHUCcXeQbM+/FhK34YiJY0suhen2nRID
 QmgTsOXsKYcNPtD4HkDFpBlmgw==
X-Google-Smtp-Source: APXvYqwd8K7MCxleHfm654auOFJmB3DXSFRb77QgcFWAYdwoYOpjsU42LX4a5HfCpY8UAdVjv7Vgfg==
X-Received: by 2002:a37:7383:: with SMTP id o125mr22353307qkc.56.1556061306558; 
 Tue, 23 Apr 2019 16:15:06 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
 by smtp.gmail.com with ESMTPSA id q5sm6961125qtb.44.2019.04.23.16.15.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 23 Apr 2019 16:15:06 -0700 (PDT)
Date: Tue, 23 Apr 2019 16:15:02 -0700
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Tao Ren <taoren@fb.com>
Subject: Re: [PATCH net 1/2] net: add eth_addr_inc in etherdevice.h
Message-ID: <20190423161502.5d3e9c36@cakuba.netronome.com>
In-Reply-To: <20190423224138.1295-1-taoren@fb.com>
References: <20190423224138.1295-1-taoren@fb.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 09 May 2019 16:11:00 +1000
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
Cc: Maxim Mikityanskiy <maximmi@mellanox.com>, Andrew Jeffery <andrew@aj.id.au>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 23 Apr 2019 22:41:56 +0000, Tao Ren wrote:
> Add eth_addr_inc function in etherdevice.h to increment MAC address. One
> of the use cases is in ncsi stack, where the host's MAC address needs to
> be incremented to get BMC's MAC address.
> 
> Signed-off-by: Tao Ren <taoren@fb.com>

Please squash this patch with the next one, IMHO they form a single
logical change together.

>  include/linux/etherdevice.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/include/linux/etherdevice.h b/include/linux/etherdevice.h
> index e2f3b21cd72a..d48e3a724c54 100644
> --- a/include/linux/etherdevice.h
> +++ b/include/linux/etherdevice.h
> @@ -448,6 +448,19 @@ static inline void eth_addr_dec(u8 *addr)
>  	u64_to_ether_addr(u, addr);
>  }
>  
> +/**
> + * eth_addr_inc - Increment the given MAC address
> + *
> + * @addr: Pointer to a six-byte array containing Ethernet address to increment

Please see:  Documentation/doc-guide/kernel-doc.rst

Here we need:
 - "()" after function name;
 - no extra line between function name and argument description.

> + */
> +static inline void eth_addr_inc(u8 *addr)
> +{
> +	u64 u = ether_addr_to_u64(addr);
> +
> +	u++;
> +	u64_to_ether_addr(u, addr);
> +}
> +
>  /**
>   * is_etherdev_addr - Tell if given Ethernet address belongs to the device.
>   * @dev: Pointer to a device structure

