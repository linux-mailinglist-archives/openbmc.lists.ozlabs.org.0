Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EA23E9BF8
	for <lists+openbmc@lfdr.de>; Thu, 12 Aug 2021 03:38:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlTpZ5g1Jz2yxk
	for <lists+openbmc@lfdr.de>; Thu, 12 Aug 2021 11:37:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.214.173;
 helo=mail-pl1-f173.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlHvy2vrVz2xtk;
 Thu, 12 Aug 2021 04:11:58 +1000 (AEST)
Received: by mail-pl1-f173.google.com with SMTP id q2so3709891plr.11;
 Wed, 11 Aug 2021 11:11:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tbuRYB4uyFYBA1QXdZzfZOeTruC0CprKZZMaGFDPs34=;
 b=qkSF6PEEFgvWfR/Yjnae0H1V7fDbWqZjZExh/G/IDmWL1RKipUKlJQDxO+x80WlLAc
 ZPZxh0wbULLDKGIGEh5+hDqOEunk2tf1N2SduwN/qjSLJCWECnaMjnHlgYIlzgTy0ZO2
 w6n2eiqd8pNYesYoaMCTqtMctAmYqWeIXGZYdMu+w3hHtIByH85+T9h1ti9oV4kKfnRj
 DkoeUBlPoh2NN2psP0aY4D6CpWzBlK6ko1zgKAF6T1ts4Wu08mvzH9TAeln03QqFIago
 aZ5bMvnepdz16U1VoKgOBMiBpol6YyJLt8v5U0YKCaRoitY2ikvbetpf3MnzoKstqNvo
 FcJQ==
X-Gm-Message-State: AOAM530WgoCMnoK+moTLnnr2PRgENbZFfF4riU30WMsSeE6ICgjwxdxS
 LEoEh6jVaiwrzY5vxdjYQw==
X-Google-Smtp-Source: ABdhPJx9VQykQ/6lrhYIHShi0cEVtld5ix0mGjvSn4jKASC9Y8ePHOmDGI6rN8ZRav52N3T1ZBpkAw==
X-Received: by 2002:aa7:9828:0:b029:3bd:dc3d:de5f with SMTP id
 q8-20020aa798280000b02903bddc3dde5fmr62738pfl.47.1628705516576; 
 Wed, 11 Aug 2021 11:11:56 -0700 (PDT)
Received: from robh.at.kernel.org ([208.184.162.215])
 by smtp.gmail.com with ESMTPSA id 23sm73377pgk.89.2021.08.11.11.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 11:11:55 -0700 (PDT)
Received: (nullmailer pid 16794 invoked by uid 1000);
 Wed, 11 Aug 2021 18:11:48 -0000
Date: Wed, 11 Aug 2021 12:11:48 -0600
From: Rob Herring <robh@kernel.org>
To: Iwona Winiarska <iwona.winiarska@intel.com>
Subject: Re: [PATCH v2 04/15] dt-bindings: Add bindings for peci-aspeed
Message-ID: <YRQS5IigFxo5DVCH@robh.at.kernel.org>
References: <20210803113134.2262882-1-iwona.winiarska@intel.com>
 <20210803113134.2262882-5-iwona.winiarska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210803113134.2262882-5-iwona.winiarska@intel.com>
X-Mailman-Approved-At: Thu, 12 Aug 2021 11:37:21 +1000
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
 Dan Williams <dan.j.williams@intel.com>, Zev Weiss <zweiss@equinix.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 openbmc@lists.ozlabs.org, x86@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Yazen Ghannam <yazen.ghannam@amd.com>, Olof Johansson <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 03 Aug 2021 13:31:23 +0200, Iwona Winiarska wrote:
> Add device tree bindings for the peci-aspeed controller driver.
> 
> Co-developed-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
> ---
>  .../devicetree/bindings/peci/peci-aspeed.yaml | 109 ++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/peci/peci-aspeed.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
