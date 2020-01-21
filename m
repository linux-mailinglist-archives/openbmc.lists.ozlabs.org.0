Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C7914481A
	for <lists+openbmc@lfdr.de>; Wed, 22 Jan 2020 00:14:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482PWF03xzzDqQj
	for <lists+openbmc@lfdr.de>; Wed, 22 Jan 2020 10:14:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.195;
 helo=mail-oi1-f195.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482PVY5NRZzDqHq
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jan 2020 10:13:56 +1100 (AEDT)
Received: by mail-oi1-f195.google.com with SMTP id z64so4336742oia.4
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jan 2020 15:13:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Yoe9RCA76HbcFOdQvkXisQfr/vhkA3pWkuRzb90Sz2E=;
 b=ucqppUuG199IAiqzzR0H121shzKzTIKjVl/jJB73qM5dZSs+ITa/NhxWK3tS5/vqIG
 jNfJDMPC4EEb325MRtAQcACH2bEfnNMzPf5qDyA6NLFU3eDP+sIGL2eUM4SwhWqsfTOQ
 tewLEuVpzDEDPfldnnDzHyjwcKVhXmKWbIa27AObN/UndnLx+IltTb13aVWpniDSSlL5
 IA+UAmeD9hvgnh3JbHldFEXgBN/G6VR2daXcmFMXgp9xMD8K1KA+YXlXa+zCH3oUcjVd
 ikfvShy7tHRfvt23PRYgJ+AmA/kOpFCGrzkuWZ5m1qKsDytRu8u6YqWmIOJzZjoF0FZv
 iTVA==
X-Gm-Message-State: APjAAAUL5zPF2lNDOPDN3fEKCJLnOZL76nh8D210/2/OVbLBE35YMPrJ
 ucks1tJXUK/YTUQmXorqkA==
X-Google-Smtp-Source: APXvYqyMUTxp4+ieA6YgbtAvJpjT4mngt+/qpQ1WR/3sJEY3T7+Jz5uSsa6kIeckZ1T36zeCXr4HUg==
X-Received: by 2002:a05:6808:9b4:: with SMTP id
 e20mr4581998oig.37.1579648433821; 
 Tue, 21 Jan 2020 15:13:53 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f3sm13968302otl.38.2020.01.21.15.13.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 15:13:53 -0800 (PST)
Received: (nullmailer pid 18478 invoked by uid 1000);
 Tue, 21 Jan 2020 23:13:52 -0000
Date: Tue, 21 Jan 2020 17:13:52 -0600
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v1 3/4] dt-binding: spi: add NPCM PSPI reset binding
Message-ID: <20200121231352.GA18418@bogus>
References: <20200115162301.235926-1-tmaimon77@gmail.com>
 <20200115162301.235926-4-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200115162301.235926-4-tmaimon77@gmail.com>
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
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, tali.perry1@gmail.com,
 broonie@kernel.org, linux-spi@vger.kernel.org,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 15 Jan 2020 18:23:00 +0200, Tomer Maimon wrote:
> Add NPCM Peripheral SPI reset binding documentation,
> Removing unnecessary aliases use.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../devicetree/bindings/spi/nuvoton,npcm-pspi.txt    | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
