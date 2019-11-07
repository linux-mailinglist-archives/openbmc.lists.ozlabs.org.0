Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA48F2412
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2019 02:12:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477lkW6ZkNzF5sD
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2019 12:12:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.193;
 helo=mail-oi1-f193.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477lj22KNlzF5qw
 for <openbmc@lists.ozlabs.org>; Thu,  7 Nov 2019 12:11:18 +1100 (AEDT)
Received: by mail-oi1-f193.google.com with SMTP id v138so481935oif.6
 for <openbmc@lists.ozlabs.org>; Wed, 06 Nov 2019 17:11:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=icw6S2OVXRtdcU89hq1ruG6UsmLeUp//TCbYMm2btBk=;
 b=CNKMwdQVM9ZWa5P7emWhFvsUxl5kd4+kT8vVPCAYNPPFifp9Vrk2iOcfKOIqvWQYwj
 TL4NgEn8qxpmxxmbqK8OVNqqxa40KezcnymrBpvoI5z1TU+ud4oW9mWFAYyV/W5DGFPF
 r96j/B1IbHiYw4R8fwGpl0NeWMKjCT2lKwX9+Ut+G/kkHE7cMfasXtH3XgPDmAiVmZud
 x/R/vqQYKQW80X+3hTAv9ZVpoBl8xyL0oS21x/xXYfy0ZOqCkqaY717pLb0s/VFZ17mQ
 nNN524lUZ65bUoEMewt11gKA2qPJBaqE0l1vVVgLBchbHRv9UhJ2ONgVQlbkW7YB1YTK
 t5Lg==
X-Gm-Message-State: APjAAAX/jkAHB+2x8ROaXVfnqn6vIDuJhTYRLl5XiAeuK7HoQtmbDem0
 LhJ6t0p0dlWcgJ0oRvO+WA==
X-Google-Smtp-Source: APXvYqxWuabs3rv1PDOsLYIr4ybg0LIvCamfpGN0rR9RPj39X3hmAT+aHnyaQu14PBYsExoD+RRE3Q==
X-Received: by 2002:a05:6808:2d8:: with SMTP id
 a24mr824426oid.127.1573089075340; 
 Wed, 06 Nov 2019 17:11:15 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m25sm233558otj.62.2019.11.06.17.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 17:11:14 -0800 (PST)
Date: Wed, 6 Nov 2019 19:11:14 -0600
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v5 2/3] dt-bindings: reset: Add binding constants for
 NPCM7xx reset controller
Message-ID: <20191107011114.GA19324@bogus>
References: <20191106145331.25740-1-tmaimon77@gmail.com>
 <20191106145331.25740-3-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191106145331.25740-3-tmaimon77@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, benjaminfair@google.com,
 avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, p.zabel@pengutronix.de,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed,  6 Nov 2019 16:53:30 +0200, Tomer Maimon wrote:
> Add device tree binding constants for Nuvoton BMC NPCM7xx
> reset controller.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../dt-bindings/reset/nuvoton,npcm7xx-reset.h | 91 +++++++++++++++++++
>  1 file changed, 91 insertions(+)
>  create mode 100644 include/dt-bindings/reset/nuvoton,npcm7xx-reset.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
