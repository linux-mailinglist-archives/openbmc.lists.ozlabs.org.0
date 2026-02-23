Return-Path: <openbmc+bounces-1407-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKmEN5vdnGl/LwQAu9opvQ
	(envelope-from <openbmc+bounces-1407-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Tue, 24 Feb 2026 00:07:07 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 047F817ED1C
	for <lists+openbmc@lfdr.de>; Tue, 24 Feb 2026 00:07:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKc1L5x4nz3c8s;
	Tue, 24 Feb 2026 10:06:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4860:4864:20::33"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771805533;
	cv=none; b=fQXIOKam0DsjJDcvgi1TaQ8ChLyY5qMLo3gKvg0Gr7J6bBiS7vEal8vgN4dncA396iguNmIkm4oyqP6RWQwRwfAB0aAS8m8Qj1TqDBQ4bycdDCXV5xntiuJSBD4NEXcAq1bjBtPXcSfOVljq9zDboEUgULxhOuDhnOMzP0O9LA7oHg4548Z9fyA4aOF9iC0jfW8p9/TGos9tUIMJY9Rmhd7UtmIcz94QOF9l1EN+h3GnKwx0qP1ZX2yWnyiWK+p85R6H1XShNJWMcfBNkdghV+/QOH8JoYI1aXYhvnawCrecUQjhI2riR1r87T0IrJZsrETN8+wVUtCBfGVo6nbWpA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771805533; c=relaxed/relaxed;
	bh=f/cjh3P6a7yxOJcaGA1eGYzRpZFWZsrKDRxEVGR8r7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dYIj2GOho8KNe6yBjJipTUBmbSITCQhZ65TEJqVMMzJAzZQ8XrX6ioTbV7UqSY4Y+QN9dX67W6OszgwJbVB/44arD+2oP38FHhyDpDo+wlCzTx0e6XUJHdtzKznFzHzvc/r09jvxxpBs+AS6U97obC5FLd+e4ejOYeWq/lJhR7laA5A7bQC0OBYXB8XAGnJm+XvYHtBfGPI06ZAVr8XdmWEziInU13SljX9ckyJBHJ9eYoZua2k1yIkDlRC12BGKZsQGB3GUZ3RJRDM5U6iO96yM2I9Uv4EIZ2lFZeUsOw4buWZnfG/dN0EtWwRDKo9/Cj9i+Gifoyayek03BvfZjg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=HOeOB5yP; dkim-atps=neutral; spf=pass (client-ip=2001:4860:4864:20::33; helo=mail-oa1-x33.google.com; envelope-from=dlechner@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=HOeOB5yP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2001:4860:4864:20::33; helo=mail-oa1-x33.google.com; envelope-from=dlechner@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fK1WH2yzFz30T9
	for <openbmc@lists.ozlabs.org>; Mon, 23 Feb 2026 11:12:11 +1100 (AEDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-40ee8b4f925so2556429fac.3
        for <openbmc@lists.ozlabs.org>; Sun, 22 Feb 2026 16:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771805524; x=1772410324; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f/cjh3P6a7yxOJcaGA1eGYzRpZFWZsrKDRxEVGR8r7c=;
        b=HOeOB5yPm1JFrx3/OarVsMm8tbF+K0zF33r8VUALIQtyL+AUnhaiNlCM69WSOHIuBd
         PFK221Eax9Jb/msu2De/G2XA2770D0qgBsAG0OWEPQ52jIq8hfgco9K4FSaORRr42xK3
         sK1LToR8Ti4GjHfirOGiD6/bIW+YQYxDtPcd4y4/cKxnu2+webN+cISxMEReUPrE7hDv
         Ywfj6igIg/0Chu02STMnNC1bKqiogIMxuOWpr728LxIpD5pSFXF5VL1nXc6nZegha3l5
         V6YkhWVYnLAGJzUc1YAUEZe8B6HWYubcAKJK3boHwuSGYB85arhEzRIuedF+ou742UxJ
         Q3LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771805524; x=1772410324;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f/cjh3P6a7yxOJcaGA1eGYzRpZFWZsrKDRxEVGR8r7c=;
        b=u26S2xJ/UoD+LqL9M5PdRne1D3HpH9wczyKprq3IBWqYgYvVtKmP11i+wliYzz7B+1
         dGmOewH0xjOJKilUDchGhwd+b7Rk6vZR7A4tqgGDZg6GcVl04Q5ZEH8o7w59AjodLsCA
         JLFjMEy3Mh/3x3n+l6xKd6+wz+tvu9hcO4obGWXuMtwMYnL3E9YVsgynkVonvNJmmSc2
         kecWTCduWfSZ8L/2fzzp2pocYSzQ0NxfYLFTWmMi03ITuHpi17b8tITIUiZVB9W8DY/e
         1XFZl4PTGkJqDM0YLNskDbk7P3zF4ZYS9JQ57FRuqMUkaLJzHSWzl/dc3s/0UtSqY9ba
         xq3g==
X-Forwarded-Encrypted: i=1; AJvYcCWFY/t04TirSJvABI/ywnEtGFE7yQ0o7pGCAh98Tw/JV2ZBvwmdm8W/tpaYvTqbMIc/XS+xo2qk@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy4QPsMIDIg/EjXvwI7YJ+RIHmW5PS26Pm5j+5jPmYalCv/pfab
	QG9DGBM+R+fTaumJX1D7InF2aO7mhAJj2WtdE+25yfdKqJeFMVS1OOVYUWDC4X9Yahc=
X-Gm-Gg: AZuq6aJcVPX2rVgYy7kt6mRCNIOvzsfMRxHgj2tPyzkx8OhVotXGBiGyZQA3JmM7roe
	6eUhTYBCM+8oJ/5a1YfHGZW6btBAbNOtvHuf1l84675OHD8spN9ZYJP6wkYQAU0Eyx+zL5LA6X0
	Wa4Yn2Cu4BBotqpdgL9nfURRQ2+gs0zcVeGSTPFary6LnKYhP8N+CS3QT9Eyr7bO3fwpengHM8Q
	oUmSjRZ5Jnq4No3anJdTm1Ve+7+SpFKDQbJ19SG460JvnRkv1rdWbPKoss6WykGBiSQchXHylFe
	QMZqdY9szfDPgrlIodBmzilH3BDAq8zeDmsCteik7voBi9vV+UBAZij7j7JPEWKyKolpdQcAZ11
	+quEg148zfvEqdG4sD6rXRpVE3Lr7K87JXnMW2++PwFdiNS8iBjBQkopaDwxieb2b7J60bSowaz
	oDGJjaTRTAQ+N6fwXxEqZMpdcyzIJxEqGvCEU11ccD1z9eMXeLlLib75XrkkUsh1S3yGn3hJo=
X-Received: by 2002:a05:6870:f61b:b0:409:794e:fe9 with SMTP id 586e51a60fabf-4157b1b3fd3mr3557313fac.54.1771805524220;
        Sun, 22 Feb 2026 16:12:04 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:e37:2309:3937:4469? ([2600:8803:e7e4:500:e37:2309:3937:4469])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4157ca3df7fsm6409978fac.0.2026.02.22.16.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Feb 2026 16:12:02 -0800 (PST)
Message-ID: <f5b38942-a584-4e78-a893-de4a219070b2@baylibre.com>
Date: Sun, 22 Feb 2026 18:12:00 -0600
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] pinctrl: rockchip: Simplify locking with
 scoped_guard()
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Emil Renner Berthing <kernel@esmil.dk>, Hal Feng
 <hal.feng@starfivetech.com>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>,
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
 <20260118-pinctrl-cleanup-guard-v2-10-bd36f681bdc0@oss.qualcomm.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260118-pinctrl-cleanup-guard-v2-10-bd36f681bdc0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.20 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andrew@codeconstruct.com.au,m:linusw@kernel.org,m:joel@jms.id.au,m:kernel@esmil.dk,m:hal.feng@starfivetech.com,m:unicorn_wang@outlook.com,m:inochiama@gmail.com,m:Basavaraj.Natikar@amd.com,m:Shyam-sundar.S-k@amd.com,m:brgl@kernel.org,m:Steen.Hegelund@microchip.com,m:daniel.machon@microchip.com,m:UNGLinuxDriver@microchip.com,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:heiko@sntech.de,m:patrice.chotard@foss.st.com,m:linux-aspeed@lists.ozlabs.org,m:openbmc@lists.ozlabs.org,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:sophgo@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,codeconstruct.com.au,kernel.org,jms.id.au,esmil.dk,starfivetech.com,outlook.com,gmail.com,amd.com,microchip.com,nvidia.com,sntech.de,foss.st.com];
	FORGED_SENDER(0.00)[dlechner@baylibre.com,openbmc@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-1407-lists,openbmc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[openbmc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 047F817ED1C
X-Rspamd-Action: no action

On 1/18/26 12:09 PM, Krzysztof Kozlowski wrote:
> Simplify error handling by removing two mutex_unlock() calls with
> scoped_guard().
> 
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/pinctrl/pinctrl-rockchip.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index e44ef262beec..bbe1cf712965 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -3640,17 +3640,16 @@ static int rockchip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,

Filling in some context from the existing code...

	for (i = 0; i < num_configs; i++) {
		param = pinconf_to_config_param(configs[i]);
		arg = pinconf_to_config_argument(configs[i]);

		if (param == PIN_CONFIG_LEVEL || param == PIN_CONFIG_INPUT_ENABLE) {
			/*
			 * Check for gpio driver not being probed yet.

>  			 * The lock makes sure that either gpio-probe has completed
>  			 * or the gpio driver hasn't probed yet.
>  			 */
> -			mutex_lock(&bank->deferred_lock);
> -			if (!gpio || !gpio->direction_output) {
> -				rc = rockchip_pinconf_defer_pin(bank, pin - bank->pin_base, param,
> -								arg);
> -				mutex_unlock(&bank->deferred_lock);
> -				if (rc)
> -					return rc;
> -
> -				break;
> +			scoped_guard(mutex, &bank->deferred_lock) {
> +				if (!gpio || !gpio->direction_output) {
> +					rc = rockchip_pinconf_defer_pin(bank,
> +									pin - bank->pin_base,
> +									param, arg);
> +					if (rc)
> +						return rc;
> +					break;

I think there is an unintentional change here.

scoped_guard() is implemented by a for loop. So the break statement is now
breaking out of the scoped_guard() scope rather than breaking out of the
outer for loop.

> +				}
>  			}
> -			mutex_unlock(&bank->deferred_lock);
>  		}
>  
>  		switch (param) {
> 


