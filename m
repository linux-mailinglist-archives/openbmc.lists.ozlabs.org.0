Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2A04AA2DE
	for <lists+openbmc@lfdr.de>; Fri,  4 Feb 2022 23:09:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jr8nj2dWZz3bVd
	for <lists+openbmc@lfdr.de>; Sat,  5 Feb 2022 09:08:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.52; helo=mail-oo1-f52.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jr8nH3zfYz30LQ;
 Sat,  5 Feb 2022 09:08:33 +1100 (AEDT)
Received: by mail-oo1-f52.google.com with SMTP id
 p4-20020a4a8e84000000b002e598a51d60so6209949ook.2; 
 Fri, 04 Feb 2022 14:08:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JQ7WYZ4Zqg4HCtyNEPmfKDttwiehHxrZDO82/S7zZVE=;
 b=XJrgMAFuIPMLqPK1S6e1AfAGPtQb3EA81HvNWUJsXXmbnSfPw3/I29L4odl9qqzino
 8KPVG5RcYaeWA5arkZ7/jyAUbqmouCyHsH4EeFq1XawUhWq5/7lTbYvIzO0rXnWMaKGw
 fXIGdz0qec4+Gfr5Og0iWWL+PDpsrbscdRj8xuTGNhsm+FHYvmwQoCxq+h1bfCSWNoBF
 Npxbfi2TFZISo0895FLpipOzDDYFlHaM7FFyCgio+s1BnWDkw1poIv9MF+EUc5la6Q6R
 eus5P6390Yz+cPFfhF9/BLgXX32apyU3nUX6H5sCWa++DYbCFRotQi1spmOIwRdW5Rqp
 8Siw==
X-Gm-Message-State: AOAM532eS159Ent4zsDduYHzHoJpOKdc6rrzyR0qLDo8iIY95coE4Cym
 z6bY1fWjQIFbSMJTC0X4SA==
X-Google-Smtp-Source: ABdhPJzCR5b4do+sC8vu/Kn5Ig8ZQCwMphWuSpBEn7uPBasp5qvvVQX+Sgl9UoFUkOwZhnxHZ1k+PQ==
X-Received: by 2002:a4a:ca98:: with SMTP id x24mr322821ooq.43.1644012509912;
 Fri, 04 Feb 2022 14:08:29 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id cv13sm1005610oab.7.2022.02.04.14.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 14:08:29 -0800 (PST)
Received: (nullmailer pid 3267244 invoked by uid 1000);
 Fri, 04 Feb 2022 22:08:27 -0000
Date: Fri, 4 Feb 2022 16:08:27 -0600
From: Rob Herring <robh@kernel.org>
To: Iwona Winiarska <iwona.winiarska@intel.com>
Subject: Re: [PATCH v7 02/13] dt-bindings: Add bindings for peci-aspeed
Message-ID: <Yf2j2+QbO9kg0E1E@robh.at.kernel.org>
References: <20220202144838.163875-1-iwona.winiarska@intel.com>
 <20220202144838.163875-3-iwona.winiarska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220202144838.163875-3-iwona.winiarska@intel.com>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Dave Hansen <dave.hansen@intel.com>, Zev Weiss <zweiss@equinix.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 openbmc@lists.ozlabs.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 Billy Tsai <billy_tsai@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Olof Johansson <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 02 Feb 2022 15:48:27 +0100, Iwona Winiarska wrote:
> Add device tree bindings for the peci-aspeed controller driver.
> 
> Co-developed-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> ---
>  .../devicetree/bindings/peci/peci-aspeed.yaml | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/peci/peci-aspeed.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
