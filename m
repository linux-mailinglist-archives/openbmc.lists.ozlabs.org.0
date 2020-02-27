Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD3F172418
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 17:56:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SzMq2tPhzDr6D
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 03:56:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.66; helo=mail-ot1-f66.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SzLP4wvQzDr6B;
 Fri, 28 Feb 2020 03:55:09 +1100 (AEDT)
Received: by mail-ot1-f66.google.com with SMTP id h9so3531277otj.11;
 Thu, 27 Feb 2020 08:55:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/jM1fH5xptzMBpP8MrWjvM0f+YCk8pWFrR+DV7+cjhQ=;
 b=rgv4uE7xqQYUprxQvr0BPMJwz4QhzQyAuHx4UI0dtKvc7bLPOqo4Ztnf/7CrCqB0Yi
 5maLwf7qexhZ5zL1Ckd1srP6pcBHT2RoKM1DAT8Vty90NorwjFiIfb1Qvt3Pib/hy7ga
 STp/e/ANUhTrLoWYu17ok6BW6nLO5+UbM18gncbbIIdgK5eatSVfvDxrKYbsB44a3qp3
 p2Ripz1nQRUE88+6PClo8OtbVQ2u3eWH5cA+bOvmX85Dalat3iSHZjSVfa7MNG2D8lwB
 ev6uSN5NHThMtfo13w6ZrV2+nNajyE1lVgbjiQzlUQSMUItHE0/p3vgotjp0byLwXP2t
 9aEw==
X-Gm-Message-State: APjAAAU86h7hLklS4XHqzLyy3iZc05wJNHaeZCVMKibFPjw9r9BjZ4U+
 X5/28xRqNlmejhFX+io0Vg==
X-Google-Smtp-Source: APXvYqxUUYsXBRlfK0ElzZkJeLYyKOPBFssLLcfLZAR3mlJo/cftCdxWtn252vKiBhlDns37QVqKcg==
X-Received: by 2002:a05:6830:20c2:: with SMTP id
 z2mr527059otq.228.1582822506104; 
 Thu, 27 Feb 2020 08:55:06 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k17sm2154899oic.45.2020.02.27.08.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 08:55:05 -0800 (PST)
Received: (nullmailer pid 19462 invoked by uid 1000);
 Thu, 27 Feb 2020 16:55:04 -0000
Date: Thu, 27 Feb 2020 10:55:04 -0600
From: Rob Herring <robh@kernel.org>
To: rentao.bupt@gmail.com
Subject: Re: [PATCH v4 7/7] dt-bindings: usb: add documentation for aspeed
 usb-vhub
Message-ID: <20200227165504.GA26955@bogus>
References: <20200226230346.672-1-rentao.bupt@gmail.com>
 <20200226230346.672-8-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200226230346.672-8-rentao.bupt@gmail.com>
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

On Wed, 26 Feb 2020 15:03:46 -0800, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> Add device tree binding documentation for aspeed usb-vhub driver.
> 
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> ---
>  No change in v2/v3/v4:
>    - the patch is added to the patch series since v4.
> 
>  .../bindings/usb/aspeed,usb-vhub.yaml         | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.example.dt.yaml: usb-vhub@1e6a0000: 'aspeed,vhub-downstream-ports' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.example.dt.yaml: usb-vhub@1e6a0000: 'aspeed,vhub-generic-endpoints' is a required property

See https://patchwork.ozlabs.org/patch/1245388
Please check and re-submit.
