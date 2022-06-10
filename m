Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8098854D7F5
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 04:08:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNlv72lk7z3dpF
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 12:08:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=baylibre-com.20210112.gappssmtp.com header.i=@baylibre-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=YvKD/lnZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=narmstrong@baylibre.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20210112.gappssmtp.com header.i=@baylibre-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=YvKD/lnZ;
	dkim-atps=neutral
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKB8m5PrFz2ynh
	for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 16:37:25 +1000 (AEST)
Received: by mail-wm1-x336.google.com with SMTP id l2-20020a05600c4f0200b0039c55c50482so656333wmq.0
        for <openbmc@lists.ozlabs.org>; Thu, 09 Jun 2022 23:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qxlw/2GeYPhBz4i8FzCqobc8aHph2WQJ2uzH+wlAQPM=;
        b=YvKD/lnZFHPf9Bklm5hR2t0kTgFB1/rXSkgOKvxFTago0OfV/XXVBnr65QfdQ0sIbE
         X56d5w92lO93EaOJsDJ8oCNGyjZkcJXPRSg9xTkOKhWDw62K7tpcO84Az2vOBRZU/r3+
         YIHnLV0yk1ox4ibJDxo/xtHUE91KPK5nhGt24yQglgyRLlAN46Y1Z1t0+GvzN7M+MEou
         tOdQLaDCWTLurM3ng8g7elKpPBlMcfWMNnTz6GEuMIGKZgA7WgUpL2gOP6VsKo5/EHPb
         626ZTuTKw9tktPSgibPC7QlWbKT0XcsOV4TdzYgmUmuC1ODYErjWurNuno/msyBC5MwG
         9u4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qxlw/2GeYPhBz4i8FzCqobc8aHph2WQJ2uzH+wlAQPM=;
        b=vGfz+pjug6YLBkqGywzrouecaCDaJMDV+uY+btEYJ+JL0NFi6FzNUTgTrMlkt6+fyp
         ULEqVjydE4U+J+R1Te+NfRvykPo72cxd48prI+S4XtmG8C/1T84fT5HBQZLoA0JxYESz
         epEWsyOU+XiNFu/xPIgxbkbTpdZc5WGQbvqTJf/KmGMsZXjCTVuyyqsS29oiawCUgf9U
         PT9R93Uy+/lXRXthGI+9al2hlj8/Kqq0T/0Y37AkdQv1WpeKyZcuv2jDHmPUpZNYKhrY
         lAvgqcxZrSXB1UwZKejHYQUyynVTMzjcNH/DbfAWx6keYx4typxrvqEcaLuUhzj72bHh
         wd7Q==
X-Gm-Message-State: AOAM531XOzT8pSAHt5fey1w618cvgSu/bBXiQmQyaojkVWU/PhgmMgYP
	ZPkXtzm2V8hGHEqVWX8LUKtpTQ==
X-Google-Smtp-Source: ABdhPJw4Hge4NDaRn0TL71ijVSQhRo1MhCaO3HbTb1tYRGHCORKkku8fnKoEAx9FGxDoG3CaWVnJNw==
X-Received: by 2002:a1c:4e03:0:b0:39c:5bbc:e0d2 with SMTP id g3-20020a1c4e03000000b0039c5bbce0d2mr7034980wmh.184.1654843041123;
        Thu, 09 Jun 2022 23:37:21 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:27b0:82d9:d0c6:702a])
        by smtp.gmail.com with ESMTPSA id 2-20020a05600c228200b0039482d95ab7sm1729030wmf.24.2022.06.09.23.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 23:37:20 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org
Subject: Re: (subset) [PATCH v2 00/48] dt-bindings: input: gpio-keys: rework matching children
Date: Fri, 10 Jun 2022 08:37:18 +0200
Message-Id: <165484301356.1384204.15957178175784526690.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 16 Jun 2022 12:05:36 +1000
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
Cc: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>, linux-aspeed@lists.ozlabs.org, Neil Armstrong <narmstrong@baylibre.com>, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Wei Xu <xuwei5@hisilicon.com>, Alim Akhtar <alim.akhtar@samsung.com>, Li Yang <leoyang.li@nxp.com>, Fabio Estevam <festevam@gmail.com>, Michal Simek <michal.simek@xilinx.com>, Heiko Stuebner <heiko@sntech.de>, Khuong Dinh <khuong@os.amperecomputing.com>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>, Gregory Clement <gregory.clement@bootlin.com>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmai
 l.com>, Russell King <linux@armlinux.org.uk>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team <linux-imx@nxp.com>, linux-arm-msm@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, linux-sunxi@lists.linux.dev, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, devicetree@vger.kernel.org, =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Sascha Hauer <s.hauer@pengutronix.de>, linux-input@vger.kernel.org, openbmc@lists.ozlabs.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.in
 fradead.org, linux-omap@vger.kernel.org, linux-arm-ke

rnel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>, Tero Kristo <kristo@kernel.org>, Andrew Jeffery <andrew@aj.id.au>, Florian Fainelli <f.fainelli@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Ray Jui <rjui@broadcom.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Peter Rosin <peda@axentia.se>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

On Thu, 9 Jun 2022 13:37:21 +0200, Krzysztof Kozlowski wrote:
> Merging
> =======
> 1. dt-bindings: rebased on top of Rob's:
>    https://lore.kernel.org/all/20220608211207.2058487-1-robh@kernel.org/
> 
> 2. DTS patches are independent. They can be picked up directly by sub-arch
>    maintainers, by Arnd or Olof, or eventually by me (if you wish).
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.20/arm64-dt)

[07/48] arm64: dts: amlogic: correct gpio-keys properties
        https://git.kernel.org/amlogic/c/4956be9944d1fb23107f27bad8a2cca0fa167443
[08/48] arm64: dts: amlogic: align gpio-key node names with dtschema
        https://git.kernel.org/amlogic/c/4fd9afd894ebe5831dbd737e6ca7b6de14da7fda

These changes has been applied on the intermediate git tree [1].

The v5.20/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil
