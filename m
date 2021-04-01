Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B35B3351718
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 19:09:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB8n85MYnz30JD
	for <lists+openbmc@lfdr.de>; Fri,  2 Apr 2021 04:09:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.181;
 helo=mail-oi1-f181.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB8mz04PKz2yhK;
 Fri,  2 Apr 2021 04:09:38 +1100 (AEDT)
Received: by mail-oi1-f181.google.com with SMTP id i81so2463231oif.6;
 Thu, 01 Apr 2021 10:09:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+aXNjJuVUumi5TRfsImw8Zt0yNPvfmonu1KMDych7KE=;
 b=I2yvJiVFXY0NyBjkWaUVJzCt2z6OfCJRT6AleAcgYU2HkQF4JUbKjbI1uM4OyI7+Ee
 6HLw+aUcgnGYLYe8i064T4VMcptsuUCWBB0M2HeVTL2wbRz6szqBpPlrZF1TidqduYg2
 RUZMqhyeG3pKcQwKYS2fNtfqPU/dbjXcaWIEt0B11kzSfJsiMccMUZfy3e3tFv6LjwUC
 Jz+C5Scs5EaaOqtd0AgKt50jXAVX9rX3nVx9QdqY+rVII5HvpZd3m9Cwny29y5uHydHJ
 E+5IeeRed6Z48P7AWirifHIf7g31HUg46zcQGZrOY8fhPkbScqJFLQd+RL6EdHdMDJYf
 SlLA==
X-Gm-Message-State: AOAM532oxfhCw+wuk/ufQHFXIDsHe2JwY4SkhtxQjL9Mo8rJTJtuapem
 AQowp15ubrXaWOxnR7wJ1g==
X-Google-Smtp-Source: ABdhPJx8VdMpHnlAiOBeHsNkwA82OIfkMjQjd799V7gJHykNelnxJL3Z4wK3Gyo/lsR35Rm1qdYsig==
X-Received: by 2002:a05:6808:146:: with SMTP id
 h6mr6901775oie.118.1617296975408; 
 Thu, 01 Apr 2021 10:09:35 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id g21sm1219961ooa.15.2021.04.01.10.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 10:09:34 -0700 (PDT)
Received: (nullmailer pid 623796 invoked by uid 1000);
 Thu, 01 Apr 2021 17:09:33 -0000
Date: Thu, 1 Apr 2021 12:09:33 -0500
From: Rob Herring <robh@kernel.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v2 3/3] bindings: ipmi: Add binding for Aspeed SSIF BMC
 driver
Message-ID: <20210401170933.GA622142@robh.at.kernel.org>
References: <20210330141029.20412-1-quan@os.amperecomputing.com>
 <20210330141029.20412-4-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210330141029.20412-4-quan@os.amperecomputing.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Corey Minyard <minyard@acm.org>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>,
 Wolfram Sang <wsa@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 openipmi-developer@lists.sourceforge.net,
 Open Source Submission <patches@amperecomputing.com>,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Mar 30, 2021 at 09:10:29PM +0700, Quan Nguyen wrote:
> Add device tree binding document for the Aspeed SSIF BMC driver.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
>  .../bindings/ipmi/aspeed-ssif-bmc.txt          | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.txt

Same comment as you ignored on v1.
