Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B618A724
	for <lists+openbmc@lfdr.de>; Mon, 12 Aug 2019 21:33:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466mHM5W4kzDqcc
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 05:33:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AIa90ZoH"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466mGm5cDCzDqYb
 for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2019 05:33:20 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id 196so3029605pfz.8
 for <openbmc@lists.ozlabs.org>; Mon, 12 Aug 2019 12:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lY5DGsJDc3Y+tZVDLUfZi0aZQ3PPwhIlfg0HaMz3r80=;
 b=AIa90ZoHoru2I9VNWKV4LI3OnccJG+8PO2earwb8sJ1A3wQX6fxRIoDZCylil+EBwN
 J+oaotTViWZOzUMaJKPAuqtTme4p/2ZbJPlqP43AuxmKmMlyiM+47KBPwdp7kcla5skW
 WP+GE+hLXpOt8FTJvImqMrnpBBEWwuXuLEIO7y4KYYU3vsvuQRXC5NdmXEPDZ44PyCxt
 i9A04iNEoqjKfBBfFZIGGaGWUMUm6YAV3T+pdi5y9FFvjpRAHCuNbuM/diDBodUoB3mK
 s+j7/9Otk7s00RjJJINSZh54p00zMCfUOPnNP7CeadBVeJH/vGTAbU8ogtgzQnjRGBSq
 4dIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=lY5DGsJDc3Y+tZVDLUfZi0aZQ3PPwhIlfg0HaMz3r80=;
 b=th4BjwtlOjZrGaw/lB59+pnIlvgUD1Ozp+rKAo1qZXFZzuldEkwi+50AA5/1d0xQJ4
 JNjRvOhE2yh9AZcDTTZevnLML1TwmS8ayBJwfS0iNwuVylFUQ7HHNK9BFtXaCcd3Y+qO
 nBckApOxT5/Hl3xwgdV0yl388hvW22RaXwAhOMMldEzsGwsmKXl3oleGv9KA2igqL7+j
 tZhXRWM1ocjmSyseyp5FUtakFC5cT5dAgGZRhfiQD3TiRwxfEbuGA8mB043SWrLDLeK3
 hx0Mbbjr3ZFp2Ht/tFW0i5cBNf78piWZaeyqH3JH1UoBoapDvM3wC1yDp2iogkzpjisP
 w2LA==
X-Gm-Message-State: APjAAAVGycd8r2rw5FRE5PZPvOZIQeDhUpU9JPm1dAq8VJ1PIg8fXHM7
 qcL7eD4GMjOY+jKk3XARj3o=
X-Google-Smtp-Source: APXvYqzxKWyH2qgTEFviQYl7Wab07MS3tFufvlF5TQB9I4OQAemdGgUgffTip/CtEultfSEqFSrcaQ==
X-Received: by 2002:a17:90a:b947:: with SMTP id f7mr788530pjw.63.1565638398324; 
 Mon, 12 Aug 2019 12:33:18 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id k36sm107627092pgl.42.2019.08.12.12.33.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Aug 2019 12:33:17 -0700 (PDT)
Date: Mon, 12 Aug 2019 12:33:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: John Wang <wangzqbj@inspur.com>
Subject: Re: [PATCH v3 2/2] hwmon: pmbus: Add Inspur Power System power
 supply driver
Message-ID: <20190812193315.GA25520@roeck-us.net>
References: <20190812025309.15702-1-wangzqbj@inspur.com>
 <6cf699d9-6efb-f701-d5ab-6f624e515ab8@roeck-us.net>
 <CAHkHK0_wts97mEjSOpZrKU8bTWKzh0+HBxTg0fSmdkFBsrWjFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHkHK0_wts97mEjSOpZrKU8bTWKzh0+HBxTg0fSmdkFBsrWjFA@mail.gmail.com>
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
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, linux-doc@vger.kernel.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, corbet@lwn.net,
 linux-kernel@vger.kernel.org, duanzhijia01@inspur.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Aug 12, 2019 at 12:48:34PM +0800, John Wang wrote:
> 
> So I should
> 
> 1. Add SENSOR_INSPUR_IPSPS to the end of the file
> 2. Add SENSOR_INSPUR_IPSPS in alphabetical order, without additional tab
> 3. other suggestions
> 
I would suggest 2). Just use a space before += instead of a tab.

Guenter
