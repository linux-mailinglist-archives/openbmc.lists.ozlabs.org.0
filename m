Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DAF1794D1
	for <lists+openbmc@lfdr.de>; Wed,  4 Mar 2020 17:17:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XfCr0CLDzDqVc
	for <lists+openbmc@lfdr.de>; Thu,  5 Mar 2020 03:17:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.194;
 helo=mail-oi1-f194.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XfBm1TtxzDqRw;
 Thu,  5 Mar 2020 03:16:15 +1100 (AEDT)
Received: by mail-oi1-f194.google.com with SMTP id d62so2606412oia.11;
 Wed, 04 Mar 2020 08:16:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GhAsniKvYUMptrJyDO+p1c/FdpaCICij3vPs9vpAABc=;
 b=kri7NPcRxES9uAKiGgi8JBURmss2a8WmJe9/edZeLDjBNapvwg0l7D4spJWHy1JX1H
 toADDwMWpGuA5Giuo+VVDqpgcJzf7oO2Fp/g336dDIqLuAVe9KmVioVVFk3eCenr5vQm
 s1Eu/DDQwjNaRpMTRJZCBhusZIUY5kKp44dHfrlmCtdGFSLs/aOVwxIWrQlwQEXmKaDQ
 NMSHbG9Vgq7wJH9WsGDVa5b0/5VOSjGdEBwULIpL2VMcHYWt4WrxKSVhJUezxeblfakj
 5yqBhs/K3Wj7HcQP3UKcXbXCGtV1dbtfhKghOxTEytAoU0Il/ed1MZBa6cgWAcUV3V9Z
 qR1A==
X-Gm-Message-State: ANhLgQ18KK7G5+rhxpVRHeURYqNGaa0rlZ8VDemvYfTXVFsxRDweCZh2
 I1egE9/WOu2zQ522np8+Og==
X-Google-Smtp-Source: ADFU+vscMM6br/Xn3C+U6tfhoqQLV4NMo3JZu/sSuSbhBxEB3/oNdCr4+Z6EvzgPb0uWjeursQTGaw==
X-Received: by 2002:aca:4f8e:: with SMTP id d136mr2309174oib.77.1583338572096; 
 Wed, 04 Mar 2020 08:16:12 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s83sm8891708oif.33.2020.03.04.08.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 08:16:11 -0800 (PST)
Received: (nullmailer pid 26946 invoked by uid 1000);
 Wed, 04 Mar 2020 16:16:10 -0000
Date: Wed, 4 Mar 2020 10:16:10 -0600
From: Rob Herring <robh@kernel.org>
To: rentao.bupt@gmail.com
Subject: Re: [PATCH v7 7/7] dt-bindings: usb: add documentation for aspeed
 usb-vhub
Message-ID: <20200304161610.GA26873@bogus>
References: <20200303062336.7361-1-rentao.bupt@gmail.com>
 <20200303062336.7361-8-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200303062336.7361-8-rentao.bupt@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>,
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 linux-usb@vger.kernel.org, taoren@fb.com, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Tao Ren <rentao.bupt@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Colin Ian King <colin.king@canonical.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon,  2 Mar 2020 22:23:36 -0800, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> Add device tree binding documentation for the Aspeed USB 2.0 Virtual HUb
> Controller.
> 
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> ---
>  Changes in v7:
>    - updated to dual license.
>    - removed description for "reg" and "clocks" properties.
>    - Added constraints (minimum/maximum/default) for vendor specific
>      properties.
>  Changes in v6:
>    - added 2 required properties into example and passed "make
>      dt_binding_check".
>  Changes in v5:
>    - updated maintainer to Ben.
>    - refined patch description per Joel's suggestion.
>  No change in v2/v3/v4:
>    - the patch is added to the patch series since v4.
> 
>  .../bindings/usb/aspeed,usb-vhub.yaml         | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
