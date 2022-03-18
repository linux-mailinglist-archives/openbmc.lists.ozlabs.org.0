Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 468254E1F33
	for <lists+openbmc@lfdr.de>; Mon, 21 Mar 2022 03:58:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMK7M0zckz30G6
	for <lists+openbmc@lfdr.de>; Mon, 21 Mar 2022 13:58:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=R3B03hXd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::d30;
 helo=mail-io1-xd30.google.com; envelope-from=skhan@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=google header.b=R3B03hXd; 
 dkim-atps=neutral
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKxFt2F40z2xsb
 for <openbmc@lists.ozlabs.org>; Sat, 19 Mar 2022 07:59:13 +1100 (AEDT)
Received: by mail-io1-xd30.google.com with SMTP id r2so10643996iod.9
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2022 13:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oNAPpR+5qx5bHO8wJ1SIgWig3LUKuwuqLo641jvFAak=;
 b=R3B03hXdzmRL4FMHavxss76+tb9Q0Hy78NbdGoHIgmWRsuIfciGr2JWywHMf/Kpkhf
 QniqntLtfhiE8E3Wo0oxTFcS1KWerJtG5tNgnrk3j2xUiX43wMMg+/mjp1wKd5A4aRIu
 ErIGjgvdava6sQlmLmDCO8Qr2P9RfzXvczFjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oNAPpR+5qx5bHO8wJ1SIgWig3LUKuwuqLo641jvFAak=;
 b=DFN+EvJMDnVfvHRPckngaFXf3YxiVgNW1WN8Na4Sd46ZjltmFq7vDjpuHgp/cByaW+
 Vwdk2wcakGvfzIUviwvC4SvM6lSU48p3HxY5NAI99VQZEOTm4wxlCd5b38uPcxdTLyMK
 7CMlRaFpMK8nlC9QSIp/P4yLV8uipXiQV0GjDoBGMpqruW64hu+UwtmyCsFcIdMi6UgH
 EvbABW8D0q5kmP0RYeIyE9+azzKrpyJPwu2IKQBtdUPjku6q4Kxso5um7uLOPIGsgkiS
 cFUVabJiOavWEWYAy8/h0ywP545a4R4h+FJqqDGA4iZyriAG7bNO9MddSyWi8olK3v8W
 Zyjg==
X-Gm-Message-State: AOAM532O5Vq8B7YD5+ixzK1HkkAmJ0O81nhFJOtRUeXaONYVRJvLc8Jm
 MLmlxCLgGt7ggTvAQpXLdPppOg==
X-Google-Smtp-Source: ABdhPJw+g6qtXnLujFKVRv55AGvVhZcbGPndogV4eznqetPdpLwXYueCN6beIFsP8OoV/l235xaSaw==
X-Received: by 2002:a5d:9542:0:b0:648:f92b:7bc6 with SMTP id
 a2-20020a5d9542000000b00648f92b7bc6mr5223132ios.73.1647637149068; 
 Fri, 18 Mar 2022 13:59:09 -0700 (PDT)
Received: from [192.168.1.128] ([71.205.29.0])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a056602328e00b006494aa126c2sm3528385ioz.11.2022.03.18.13.59.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 13:59:08 -0700 (PDT)
Subject: Re: [PATCH 64/64] media: Kconfig: cleanup VIDEO_DEV dependencies
To: Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cover.1647242578.git.mchehab@kernel.org>
 <decd26e90adc5c16470e4f738810f22fe6478b27.1647242579.git.mchehab@kernel.org>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <9e02d88a-3344-8d91-c652-72cb989506de@linuxfoundation.org>
Date: Fri, 18 Mar 2022 14:59:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <decd26e90adc5c16470e4f738810f22fe6478b27.1647242579.git.mchehab@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 21 Mar 2022 13:55:41 +1100
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
Cc: Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jaroslav Kysela <perex@perex.cz>,
 Hans Verkuil <hverkuil@xs4all.nl>, Pavel Machek <pavel@ucw.cz>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>, Joe Hung <joe_hung@ilitek.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jacob Chen <jacob-chen@iotwrt.com>, NXP Linux Team <linux-imx@nxp.com>,
 Steve Longerbeam <slongerbeam@gmail.com>, Jeff LaBundy <jeff@labundy.com>,
 linux-sunxi@lists.linux.dev, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Scott Branden <sbranden@broadcom.com>,
 Heungjun Kim <riverful.kim@samsung.com>, Randy Dunlap <rdunlap@infradead.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Ming Qian <ming.qian@nxp.com>, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-samsung-soc@vger.kernel.org, Houlong Wei <houlong.wei@mediatek.com>,
 linux-amlogic@lists.infradead.org, Mike Isely <isely@pobox.com>,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Zhou Peng <eagle.zhou@nxp.com>, linux-renesas-soc@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Sean Young <sean@mess.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, linux-tegra@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Fabio Estevam <festevam@gmail.com>,
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-staging@lists.linux.dev,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Shijie Qin <shijie.qin@nxp.com>,
 bcm-kernel-feedback-list@broadcom.com, Joel Stanley <joel@jms.id.au>,
 linux-input@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
 mjpeg-users@lists.sourceforge.net, Vincent Knecht <vincent.knecht@mailoo.org>,
 Felipe Balbi <balbi@kernel.org>,
 Martina Krasteva <martinax.krasteva@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Shawn Guo <shawnguo@kernel.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Todor Tomov <todor.too@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>, Olivier Lorin <o.lorin@laposte.net>,
 Marek Vasut <marex@denx.de>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Rick Chang <rick.chang@mediatek.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, openbmc@lists.ozlabs.org,
 Yong Zhi <yong.zhi@intel.com>, Shawn Tu <shawnx.tu@intel.com>,
 linux-mediatek@lists.infradead.org, Yong Deng <yong.deng@magewell.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, Takashi Iwai <tiwai@suse.com>,
 Robert Foss <robert.foss@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/14/22 1:55 AM, Mauro Carvalho Chehab wrote:
> media Kconfig has two entries associated to V4L API:
> VIDEO_DEV and VIDEO_V4L2.
> 
> On Kernel 2.6.x, there were two V4L APIs, each one with its own flag.
> VIDEO_DEV were meant to:
> 	1) enable Video4Linux and make its Kconfig options to appear;
> 	2) it makes the Kernel build the V4L core.
> 
> while VIDEO_V4L2 where used to distinguish between drivers that
> implement the newer API and drivers that implemented the former one.
> 
> With time, such meaning changed, specially after the removal of
> all V4L version 1 drivers.
> 
> At the current implementation, VIDEO_DEV only does (1): it enables
> the media options related to V4L, that now has:
> 
> 	menu "Video4Linux options"
> 		visible if VIDEO_DEV
> 
> 	source "drivers/media/v4l2-core/Kconfig"
> 	endmenu
> 
> but it doesn't affect anymore the V4L core drivers.
> 
> The rationale is that the V4L2 core has a "soft" dependency
> at the I2C bus, and now requires to select a number of other
> Kconfig options:
> 
> 	config VIDEO_V4L2
> 		tristate
> 		depends on (I2C || I2C=n) && VIDEO_DEV
> 		select RATIONAL
> 		select VIDEOBUF2_V4L2 if VIDEOBUF2_CORE
> 		default (I2C || I2C=n) && VIDEO_DEV
> 
> In the past, merging them would be tricky, but it seems that it is now
> possible to merge those symbols, in order to simplify V4L dependencies.
> 
> Let's keep VIDEO_DEV, as this one is used on some make *defconfig
> configurations.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 

>   drivers/media/test-drivers/vicodec/Kconfig    |   2 +-
>   drivers/media/test-drivers/vimc/Kconfig       |   2 +-
>   drivers/media/test-drivers/vivid/Kconfig      |   2 +-
>

For vimc change: (trimmed the recipient list to send response)

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah



