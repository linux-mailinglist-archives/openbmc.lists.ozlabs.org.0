Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C5FB55D3
	for <lists+openbmc@lfdr.de>; Tue, 17 Sep 2019 21:00:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XsrH4ppFzF3p5
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 05:00:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.66; helo=mail-ot1-f66.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XsqN6ZY3zF3fb;
 Wed, 18 Sep 2019 04:59:44 +1000 (AEST)
Received: by mail-ot1-f66.google.com with SMTP id z26so4082409oto.1;
 Tue, 17 Sep 2019 11:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OGt11jcTV4+nEwNY8mFGWxFr7o7axon1ADE+8rl/MVY=;
 b=WMf/9CwVcX+/tJhHBqbUxtrkV3/6lH7h/jeSguiRK9LJ/cjkQyCV9cBtBvZVDnQvva
 MJEzNjiBqmJhZiSJyyRD9VSoLnoduwFg5zV+Su0Gw3bbIEuREOHFS9WYIn8/y8o6X9aK
 eEAvRTJ8WaOrz8JzJHt7x8m9Wl3DrCvq8KMaIA808wbISZ5G5JfNLXI+a8pEclqdTkT8
 FmCq7cT4d3ub1a9ZgTfNACI5SkqQx4hmQELpVnZJd6Ub1CES5fTtk9lJFIn3CBiSfti/
 7zHZdINTfF+JphBg5GbpyBagt60FbozyJpTRLVKjhycAtfKjFiXwfyI9KRgZ3hVudOmP
 eJ4A==
X-Gm-Message-State: APjAAAX/bScbuvodijItQN3Zrwj1Nm+u5pV3d9Z+P/LiATLUBpcdPuAI
 lBArwgngm8/v08Zb24IuJA==
X-Google-Smtp-Source: APXvYqzRk2LhCglVMO/W5uafIlAuiwWW96jddRxz2JFxKqZkzHLQP9MO0dW7aSqfvaH7/hTZGTVnmg==
X-Received: by 2002:a9d:30c8:: with SMTP id r8mr316477otg.158.1568746781626;
 Tue, 17 Sep 2019 11:59:41 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 109sm963555otc.52.2019.09.17.11.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 11:59:41 -0700 (PDT)
Date: Tue, 17 Sep 2019 13:59:40 -0500
From: Rob Herring <robh@kernel.org>
To: Oskar Senft <osk@google.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: serial: 8250: Add
 aspeed,sirq-polarity-sense.
Message-ID: <20190917185940.GA4964@bogus>
References: <20190905144130.220713-1-osk@google.com>
 <20190905144130.220713-2-osk@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190905144130.220713-2-osk@google.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au,
 gregkh@linuxfoundation.org, openbmc@lists.ozlabs.org, robh+dt@kernel.org,
 linux-serial@vger.kernel.org, Oskar Senft <osk@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu,  5 Sep 2019 10:41:29 -0400, Oskar Senft wrote:
> Add documentation for 8250_aspeed_vuart's aspeed,sirq-polarity-sense
> property that enables to auto-configure the VUART's SIRQ polarity.
> 
> Signed-off-by: Oskar Senft <osk@google.com>
> ---
>  Documentation/devicetree/bindings/serial/8250.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
