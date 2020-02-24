Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6CC170E4A
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 03:13:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Sbn92m95zDqlf
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 13:13:33 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48R9Fj5cDjzDqMy;
 Tue, 25 Feb 2020 05:14:47 +1100 (AEDT)
Received: by mail-ot1-f67.google.com with SMTP id r27so9556134otc.8;
 Mon, 24 Feb 2020 10:14:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4nmmGful+MegUr8aRgRCB1gCieEuCvrSiIBlqsABDmE=;
 b=jpSwdeGlBVUkPyvxuWzLgrrMIf1r+i6REyRgC0IT/KeBI++SdH9FDm7lXZX26WF53x
 izWiXxL5+MPuIJVGTY2QDBZiWtPkmU/9l30qI7LBdkh2wSpkxogxVYmiQhBaqv1/LAit
 NTzXQvyVIfSTzFv/2Io0w/SF0h0pkIuUnQkK3UDySD2Wut9rOH7ZJBC1uyFMHWQRe9Ew
 4dmzs+Qmm19q/+NZkunaxEo7zHoRf/dFTmouiWL8pF3KAXbpXyD75+SP6peWlhJQdtIE
 Mh4kE/LAHbOROBTgbevXmZYy2J7aGdE4ZNd36okzPShG5qJgD2QFxTmVuX9El0ML8EcF
 uy4w==
X-Gm-Message-State: APjAAAU3ZCLAgOGIL9qakx04OOOzP8uNMbOSsrICXicUZ8J4sUfb3xVd
 NroogxUcUGL6nyN5Dop4Tg==
X-Google-Smtp-Source: APXvYqzSAV62BhNi363gv0daEbhuDKzBdde3JmEZAlbjVYZ9GcAmP/tY+ZpDRe7P2Ti1DpLoIK6ciQ==
X-Received: by 2002:a9d:68d9:: with SMTP id i25mr29162204oto.135.1582568083899; 
 Mon, 24 Feb 2020 10:14:43 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 60sm4761700otu.45.2020.02.24.10.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 10:14:43 -0800 (PST)
Received: (nullmailer pid 24218 invoked by uid 1000);
 Mon, 24 Feb 2020 18:14:41 -0000
Date: Mon, 24 Feb 2020 12:14:41 -0600
From: Rob Herring <robh@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 2/7] docs: dt: fix several broken references due to renames
Message-ID: <20200224181441.GA23262@bogus>
References: <cover.1582361737.git.mchehab+huawei@kernel.org>
 <83c5df4acbbe0fa55a1d58d4c4a435b51cd2a7ad.1582361737.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83c5df4acbbe0fa55a1d58d4c4a435b51cd2a7ad.1582361737.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 27 Feb 2020 13:08:40 +1100
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
Cc: Stuart Yoder <stuyoder@gmail.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Pavel Machek <pavel@ucw.cz>, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Amit Kucheria <amit.kucheria@verdurent.com>, linux-aspeed@lists.ozlabs.org,
 Jonathan Corbet <corbet@lwn.net>, Kevin Hilman <khilman@baylibre.com>,
 openbmc@lists.ozlabs.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Zhang Rui <rui.zhang@intel.com>, Linus Walleij <linus.walleij@linaro.org>,
 devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Jyri Sarha <jsarha@ti.com>, linux-gpio@vger.kernel.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Stephen Boyd <sboyd@kernel.org>,
 Andy Gross <agross@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Dan Murphy <dmurphy@ti.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Feb 22, 2020 at 10:00:02AM +0100, Mauro Carvalho Chehab wrote:
> Several DT references got broken due to txt->yaml conversion.
> 
> Those are auto-fixed by running:
> 
> 	scripts/documentation-file-ref-check --fix
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Dan Murphy <dmurphy@ti.com>
> ---
>  Documentation/devicetree/bindings/arm/arm,scmi.txt        | 2 +-
>  Documentation/devicetree/bindings/arm/arm,scpi.txt        | 2 +-
>  .../devicetree/bindings/arm/bcm/brcm,bcm63138.txt         | 2 +-
>  .../devicetree/bindings/arm/hisilicon/hi3519-sysctrl.txt  | 2 +-
>  .../devicetree/bindings/arm/msm/qcom,idle-state.txt       | 2 +-
>  Documentation/devicetree/bindings/arm/omap/mpu.txt        | 2 +-
>  Documentation/devicetree/bindings/arm/psci.yaml           | 2 +-
>  .../devicetree/bindings/clock/qcom,gcc-apq8064.yaml       | 2 +-
>  .../devicetree/bindings/display/tilcdc/tilcdc.txt         | 2 +-
>  Documentation/devicetree/bindings/leds/common.yaml        | 2 +-
>  .../devicetree/bindings/leds/register-bit-led.txt         | 2 +-
>  .../devicetree/bindings/memory-controllers/ti/emif.txt    | 2 +-
>  Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt   | 2 +-
>  .../bindings/pinctrl/aspeed,ast2400-pinctrl.yaml          | 2 +-
>  .../bindings/pinctrl/aspeed,ast2500-pinctrl.yaml          | 2 +-
>  .../bindings/pinctrl/aspeed,ast2600-pinctrl.yaml          | 2 +-
>  .../devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml  | 2 +-
>  .../devicetree/bindings/reset/st,stm32mp1-rcc.txt         | 2 +-
>  .../devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml  | 2 +-
>  MAINTAINERS                                               | 8 ++++----
>  20 files changed, 23 insertions(+), 23 deletions(-)

Applied.

Rob
