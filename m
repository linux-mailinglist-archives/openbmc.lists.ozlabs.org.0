Return-Path: <openbmc+bounces-1265-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJIMHOpMcWkahAAAu9opvQ
	(envelope-from <openbmc+bounces-1265-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Wed, 21 Jan 2026 23:02:18 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C12A5E6EE
	for <lists+openbmc@lfdr.de>; Wed, 21 Jan 2026 23:02:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxJ7p57Jrz2yFl;
	Thu, 22 Jan 2026 09:01:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768567868;
	cv=none; b=ES9GVVVneC1wnfyxSHzWJ6z++MyLUp8USAyUrK4gPx34K9EtUeNPxTs4musIbJW3xVLsAyisZFdUsbP95vzMMQ0q8B35kNcy+PReQ5FLvJ44c2UZOoBNA/SmICchnvVYtPfGkLYDp4zQlXL4hyPJADr83tIM6+XpfmPDkyfEcAAqNj7lMGXLZwxSaQv/c7BaVtPw2NnNsvyGxJkT7klqhhGnPY6kzzQUakeIIlD/DPUZY+VdRbJenV3TfuGU1WJRD9WGte/5oM8CyGOKmRNOSWP/WCloK869EpNcBNscbZXkxJcjIrx9JmnTIi4/GlLGWBXB/XgW9W/pZahExLbi+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768567868; c=relaxed/relaxed;
	bh=zTkxHu8mh7w4aqi9Nu456ezpUXh108CX0ltHIeT0yH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jmg2G3hTPMTr0q4PxcISWHuWs180m0SEoPu+2UpRidtkfz5wrQrGrIpKsCUf26N6jrfIdhqRfc7Wi/y8nHQmXmvRvUMOMLFcVP63/H3rC2CN2cBHlBQTyZj5skX8kq8+7EJszzerkeJmG9UsbLC7zXBPNskWxl7ub4BCjgDuW59eEZQ/lTl/l4z11ZP3eAPSgK9a7idHpBZF1k4K45ycDGLkHIeFy59Uadu/3qg7L9zu/9OHi0H4OaHsKaTx0pKw/uW+/45/tpZDvzxJfOu/z0f3I6PP/phtAmhFSLflROmwM/RHIk53UtbAtc4xs/w+JOQZ0FwGCIu5q/ELqLSglA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kF/+dBNp; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kF/+dBNp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dt08V3b1gz2xSN
	for <openbmc@lists.ozlabs.org>; Fri, 16 Jan 2026 23:51:05 +1100 (AEDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-432dc56951eso1293782f8f.0
        for <openbmc@lists.ozlabs.org>; Fri, 16 Jan 2026 04:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768567862; x=1769172662; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zTkxHu8mh7w4aqi9Nu456ezpUXh108CX0ltHIeT0yH8=;
        b=kF/+dBNpqBdTzgiUzJzwfRDDubDv8uQDKX2vvRK1TJQI7ZbQkXAQheMOaM6ZgidZ3C
         J9RlXg40fFX6xeuwqas4FDM2qIssiad8a4BTbWgChSjP0CYgGKUGAs3ZjtLsSAkHz1Kb
         xzww3Mb+j6uH5JqUFQZMRKN+zlmtjZgi1enCn3iXz/VqpcFm9x+Gg6frl8SWd/XJImhV
         ulljeDYHqPXdNUy+4bwF3l/ETnikPyFrIjU3rGVrAU42vnZ4wLoHigpDh3/yRvHEWHkA
         DTp9zRNkh3ps1bykxE6H0/ZIc3nNz2tiwpTRmBa/S4ASHr8kQ4TCQHztjS6HHgkb4sDR
         EEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768567862; x=1769172662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTkxHu8mh7w4aqi9Nu456ezpUXh108CX0ltHIeT0yH8=;
        b=MAM3ETaSeZWktg7BdWtgJUn8CXqkCuxJvfARdL4n/v/oWr95mtGU7/Xfe5Lsj9XsvN
         /VVzYYsPzXWRxSMmMvZ/bnRmsBAD1b75i9uAiLjJc1AFAoqipLnTGZkllGgDZxthMr1g
         /S+pwvdTwU28vvasOE97DY47Ir+mYHGBgRppGjAmkRxsbNVVnuiPVqJxJdYsSXsRPxr0
         DOJb0AR7lj0IFPyZFA/Sb2We2IlyDT+i18KI9KN/SZ8xknjkTPWTFUF1qKTuoPPv4YoQ
         eGl/q3BbJN7sL5Q/hZ6tQ7KVnQJarRgKpO099BEySBMtuTPEmlyrCd6PyGUBQNMN1Rcj
         TtZA==
X-Forwarded-Encrypted: i=1; AJvYcCWypg6QgaCc6GNIA5SnIyOBWIhnL99osn2x4Esl4HAGfvQCXTeQjf4Q8WnP7YbgImEn/n02jJu2@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzeghCZd8B0wu0aRtyUGf3mArByOTWPnRTBQ5z52SCAY+58NWnE
	SmJEB70GgG4e8mysKJy2ImQxrbfjsxcEWB147+N/gtmeH63JtSaEwOU2
X-Gm-Gg: AY/fxX7pcQxskjHf/SEJyNEpXnaYNWDKde/igE/yZ8AWMeo+K6n4I+5CmV79z0ks99x
	ITzamjGeuAy6RuRTxCUcIkmsXuX5Cgg1AyQ55sn3y4Yv35Uk9/s63OMEl04qZik8/+vEObRCLhE
	HsG+L5PlynRCYWoiTwMKcHJG0oG/W8yjOf2BqPl9KOapEsg6CFXjwLs6/5yycIcdWVBvCr3C77l
	wXi6FWX87f9Lix88A8hqTyljBImhf0zr8JYY0ShAsMl13hE7Exjd0rEgBY5SUAz7dpgtHpfCu/r
	WUAC1zR48qixZPGseAaPq/9r+7ESTDFP3etdjkiQ4408QtTHitoS9TCfr23Fay54FdUX0jeX17U
	8XE0rezd4pTunDIQZiF57P2uhl0ihr4i6dR9+BxZSo3BXUaNIH4aauaDcFcAYXhkp1P57M6/zwg
	aChXT75HMUh5K96VWMDr+B6k6o5t9iocmWGNBw5Zj/g0ZHv5PwFPA5GuHGiE5HdA+eMdePg+Vdd
	Q==
X-Received: by 2002:a05:6000:2004:b0:433:2f55:7cab with SMTP id ffacd0b85a97d-43569bbafd6mr3570766f8f.37.1768567861918;
        Fri, 16 Jan 2026 04:51:01 -0800 (PST)
Received: from orome (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997eb0bsm5012584f8f.34.2026.01.16.04.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 04:51:00 -0800 (PST)
Date: Fri, 16 Jan 2026 13:50:58 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 08/11] pinctrl: tegra-xusb: Return void in padctl
 enable/disable functions
Message-ID: <aWo0LESc5bIs1kHi@orome>
References: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
 <20260114-pinctrl-cleanup-guard-v1-8-a14572685cd3@oss.qualcomm.com>
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
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bhhiv6s43avuu3l7"
Content-Disposition: inline
In-Reply-To: <20260114-pinctrl-cleanup-guard-v1-8-a14572685cd3@oss.qualcomm.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-2.80 / 15.00];
	SIGNED_PGP(-2.00)[];
	DATE_IN_PAST(1.00)[129];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.19)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andrew@codeconstruct.com.au,m:linusw@kernel.org,m:joel@jms.id.au,m:kernel@esmil.dk,m:hal.feng@starfivetech.com,m:unicorn_wang@outlook.com,m:inochiama@gmail.com,m:Basavaraj.Natikar@amd.com,m:Shyam-sundar.S-k@amd.com,m:brgl@kernel.org,m:Steen.Hegelund@microchip.com,m:daniel.machon@microchip.com,m:UNGLinuxDriver@microchip.com,m:jonathanh@nvidia.com,m:heiko@sntech.de,m:patrice.chotard@foss.st.com,m:linux-aspeed@lists.ozlabs.org,m:openbmc@lists.ozlabs.org,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:sophgo@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:linux-rockchip@lists.infradead.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[thierryreding@gmail.com,openbmc@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-1265-lists,openbmc=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierryreding@gmail.com,openbmc@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[codeconstruct.com.au,kernel.org,jms.id.au,esmil.dk,starfivetech.com,outlook.com,gmail.com,amd.com,microchip.com,nvidia.com,sntech.de,foss.st.com,lists.ozlabs.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	TAGGED_RCPT(0.00)[openbmc];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,qualcomm.com:email]
X-Rspamd-Queue-Id: 7C12A5E6EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--bhhiv6s43avuu3l7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 08/11] pinctrl: tegra-xusb: Return void in padctl
 enable/disable functions
MIME-Version: 1.0

On Wed, Jan 14, 2026 at 04:30:09PM +0100, Krzysztof Kozlowski wrote:
> Make the padctl functions a bit simpler by returning void instead of
> always '0'.  The callers - phy init/exit - still need to return 0, but
> these are smaller function without if/branching.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--bhhiv6s43avuu3l7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmlqNDIACgkQ3SOs138+
s6HKVA//WbWB3AVvEbOYpT8fr129RiWvQ5lRtQceA8fb/1Ep4k0qX0M5cVujq72g
OFie2IcJyCzuci1ZmKEf7fTaR/cjlzExIrXvmox2TLmtKm5kBAFTu2UcHzvAbRcs
VbasfUeQ/Wi7dlT6+I6JeNLYaXbstuH2RQV3NQ2BC3zPUsJk27p7DARdqBLUSNTJ
7jX2sBu0xKu5n0hrBhesTMi/zBLMI3pZvqmMlhGzTU01GSlmPz72GMI5J6YmeeF0
Midhy4ZCbs40l7nJPghjxdtQoKLhUPG6z+NzTyp9Hfelr7q/cYZ1avlAGkJ/39fI
ugJEOfjl0ed/HMarlvwrRPSTjF6f2BUKH1Ub2xGxErbhGaGvOsKGJizbjsK0CGzl
jdVsdFUF/wmzPeX27RIel8DxTdTYnhpUyZoylg7l9thjdhYGceKGJHeHb1DaOOZ+
OhsSUZlejccTbalvk7OeBxtnujGfE56nEXsSByA0C6kaDRxPZmsH9WWtp4mwIzXg
rvw2hOERLedWoFTjFynl0+3hazgw2hh21iH/uE+uOEiVwHNhPiEXeb+lJMGQbH/9
Bm2mL/1gvDYA3KxeFZbTTyNwEiGkZyPFLvwZ4hpapk8AvhFdEu/60sMZWsTRlSgx
H7CJIWp6MSs4e2ErCXbhjjucu3eJo1lFTm/bGVBosixPjjSZ720=
=VB+5
-----END PGP SIGNATURE-----

--bhhiv6s43avuu3l7--

