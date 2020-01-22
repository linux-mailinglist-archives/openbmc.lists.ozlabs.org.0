Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA601459C8
	for <lists+openbmc@lfdr.de>; Wed, 22 Jan 2020 17:24:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482rN83985zDqSY
	for <lists+openbmc@lfdr.de>; Thu, 23 Jan 2020 03:24:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.67; helo=mail-ot1-f67.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482rMP41CWzDqHL
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jan 2020 03:24:16 +1100 (AEDT)
Received: by mail-ot1-f67.google.com with SMTP id i15so6808905oto.2
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jan 2020 08:24:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SBSuorVlBPJZlT0IMnm/ezCQKABZUi84K977zkiUy4Q=;
 b=NAIUPg7wmwCvqSSmeiSYKVLlzmk0IU5YBCHv8ahlPTjQJfwZUXI0trS58Yk8WQE+hg
 pju0BLJ4iVYfdQYbrfkJWujLSE6hmk4oXtZtdphVadcfM2SX4XZ6og1n6obwM17DGjR+
 NJLvwvGiwiEnfNW6CikzA8uPDO0tGS6j0y+8H4Ech+TjbZJh31bfU/GV+AyO9CqlPgn1
 8dnq2LbxOzFroJnylJPUSZQk2PK9F3D79YR1sozzqHeZlCmDNWs0rsuq8j8wjMy6xMs3
 lP7UXS3kwu8TIRbx7q1gpOjHxYsvbvqUqMEQk0NpAMi5xOyvw1wC8X5GgzPJ3yxCRSdv
 xrtw==
X-Gm-Message-State: APjAAAWwCKjs8deiMId4q+Vwmqmb+X3D8lO2gaX0O7lC3CvFTEKGkjfr
 l07p3F9sP2a4r304l8W4IA==
X-Google-Smtp-Source: APXvYqw17VzUmX0qRYVT5h/d0qjRAnAfVEstQIvab3ApXczGOHJMy7ssOSpdqRBH6QMPhi2wqFsc3Q==
X-Received: by 2002:a9d:7342:: with SMTP id l2mr7999588otk.98.1579710254147;
 Wed, 22 Jan 2020 08:24:14 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m19sm14777791otn.47.2020.01.22.08.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 08:24:13 -0800 (PST)
Received: (nullmailer pid 9959 invoked by uid 1000);
 Wed, 22 Jan 2020 16:24:12 -0000
Date: Wed, 22 Jan 2020 10:24:12 -0600
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v1 1/2] dt-binding: iio: add NPCM ADC reset support
Message-ID: <20200122162412.GA9924@bogus>
References: <20200119110032.124745-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200119110032.124745-1-tmaimon77@gmail.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de,
 benjaminfair@google.com, avifishman70@gmail.com, venture@google.com,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org,
 pmeerw@pmeerw.net, knaack.h@gmx.de, jic23@kernel.org,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, 19 Jan 2020 13:00:31 +0200, Tomer Maimon wrote:
> Add NPCM ADC reset binding documentation.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
