Return-Path: <openbmc+bounces-978-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 589E8CAE60C
	for <lists+openbmc@lfdr.de>; Tue, 09 Dec 2025 00:07:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dQHg82j3Tz2xqf;
	Tue, 09 Dec 2025 10:07:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.137
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765224705;
	cv=none; b=CPMuENBa6sSXwBMAvG/C2m5BmnWgLErXEEmfcqB4p3Zez+YCz0FX9UhKvjCrWKX37nfHyKY9KqkelrsK4zpIxQbyAoiYJ7yX/5gtDSZ9MklctD8wbC9RVRNUjzBt+7cy8ct+72F543sctQ2ZqP6ohucUsNu/g3gbOtOZuBmpjhIyXG6kULJBu0hx7tEyGh5KT6VU8SizmgQb7+V59CAW1jS9AbWszbaXnaY+qvWV0dzx3FRd2EwPTdN3ZPVxVq68PB8Lee1HfB225GOy3bKy4eDZD52Hlx5SFO7WEou6uJKhvnmydxK9zcO4cjksWJ5teWsMby9xWZKlK4Yb7w9cGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765224705; c=relaxed/relaxed;
	bh=geGVe3G5SBgEZ59+oVuK/Iwq85pb8lTkLlayLey8xSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oZFDeXXBkVT2D1vOl7X3Cbgsrp9kQZMeOyLLmvdO+AFyPvb2dKwivbtVLoKA3zIX+jU7fmEXxSrO6ok7i5lkBYi1JiKVM9iqz0Hn0GstarR2XDjmydkuzsptGuOyWJ62Qi4EE2bR/C8ZXQsJIuY/C05oyXhp/ARaqvW23a7KURzWf5eqeVKtlBBlsVXF46PmoikAE7aLoESxiwDh3wzFMVYNlBCtYqjlswkaoWOrZyKjjvWoIUpOd5tNLbAMYj0Qj2OvSg3Za0iGheCdqU/1ta8wNkhwYFb/iCMGuaJ2gpRaNoEDRUPz9A5q8fNfHf1Dghp6j2uR8/5OkVxsc7oLjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=jannau.net; dkim=pass (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm3 header.b=RCw4MYw+; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=voCV257E; dkim-atps=neutral; spf=pass (client-ip=103.168.172.137; helo=flow-a2-smtp.messagingengine.com; envelope-from=j@jannau.net; receiver=lists.ozlabs.org) smtp.mailfrom=jannau.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm3 header.b=RCw4MYw+;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=voCV257E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=jannau.net (client-ip=103.168.172.137; helo=flow-a2-smtp.messagingengine.com; envelope-from=j@jannau.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 338 seconds by postgrey-1.37 at boromir; Tue, 09 Dec 2025 07:11:42 AEDT
Received: from flow-a2-smtp.messagingengine.com (flow-a2-smtp.messagingengine.com [103.168.172.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dQCmt1Mrvz2yCL
	for <openbmc@lists.ozlabs.org>; Tue, 09 Dec 2025 07:11:41 +1100 (AEDT)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailflow.phl.internal (Postfix) with ESMTP id 15BE51380418;
	Mon,  8 Dec 2025 15:06:00 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 08 Dec 2025 15:06:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1765224360; x=1765231560; bh=geGVe3G5SB
	gEZ59+oVuK/Iwq85pb8lTkLlayLey8xSA=; b=RCw4MYw+7ZLDHkj305wxxjCRSX
	rMrdbrBgi9f25g/3it320zvhMNV1ZQKoK4HMoVtdSMCSQxa3T1NtQGZK2ji7FaB+
	4EAMXj2Z/18fg18HLzgIp1Xd2gaRaVf6aOd9tq+17uy6+b25gxNy3mnV9680Kb9/
	5tqHVF1j8ty4YqRtlzJwDQD/AFabZMuWlqsu+ivO0qERdUZBTsbfvToLgDReiU2c
	Lh/Eba71Uo99rQNJKXg+dWVZlsvVZ4EEWaxpUn0pfDgHeJqy1Ci7jT91cm3WjvPy
	sTJxo0O0i2VTRszFsHu9XlHbQZYuMm/iGITipFRODxC1B8IcWm5/KrQbrMbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1765224360; x=1765231560; bh=geGVe3G5SBgEZ59+oVuK/Iwq85pb8lTkLla
	yLey8xSA=; b=voCV257E8ExI8LRf6UdVA7F02TYLxADA60npChdBR6Y21xs0tRA
	C1uw+AV9CLSaNfK6RAUV6AE1RZBKQaSh2/pgZThaQt1P282do/o12nWenujxz3Pg
	/tdhnCFD0X7RQQSdVppzFajbBlqF0NSSuk+kHONsZxH3CEBuJYx+4gBEMsH+gyIP
	razXamAr0cLJLucn4Z8U6ZvWzmg4VLNRkI8fW7bkvNN/o41lmXQ/g0VAlsbl0p+c
	9kOr6shetIpWgA2fAxvQUSRm6uEgMj9wjThm4m3EyfuK4xRaW/GPDonriBPihui9
	NKID6dEU3zuG8C0j+xnEP0PQag6LUCS0h3A==
X-ME-Sender: <xms:pi83aTQUBBxxcwI8Ju7BapuF7LwulYjYQpKe7sWAR0r_uWtzDdDwRg>
    <xme:pi83aebVHsxrKMEuQywvzdXSDZHpM9MK2UiluZkdXAVmh0J0nNZu6U6gfkZg9j0Ga
    Ut53OsW7mEjA55oME3b-thugVKSe0_5Tbewl2mI88XfPPTSUxekmw>
X-ME-Received: <xmr:pi83acQeu23D1kI1rLhQ4wr0x5rXNlW92yKuzfJ9DXbmbyD1PnQo3LIx3zAyL52iJBsHs4oNCdPXZZnY0nx-sHu7J1Hs6kJCHtU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeehlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeflrghnnhgvucfi
    rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepgfduue
    ffleefkeegueektdehkeejtedtffdtudejhfdvheetgfeigfeltdeufeejnecuffhomhgr
    ihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohepvdei
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehprghulhhksehshihsqdgsrghsvg
    drihhopdhrtghpthhtoheprhguuhhnlhgrphesihhnfhhrrgguvggrugdrohhrghdprhgt
    phhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopegrnhguhidrshhhvghvtghhvghnkhhosehgmhgrihhlrdgtohhmpdhrtghp
    thhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopegrnhgurhgvfidrjhhonh
    gvsheslhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhomhgrphesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehophgvnhgsmhgtsehlihhsthhsrdhoii
    hlrggsshdrohhrghdprhgtphhtthhopehlihhnuhigqdhsohhunhgusehvghgvrhdrkhgv
    rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:pi83aZ4RCJmeDa-VR1cQPG2ul73JR-gGDUFjKdpu-22mFdL9oWUOfw>
    <xmx:pi83aXrSwaSszaHmCrk55lMdmsGtmyEQHQ1s-QpJy4Rt1_cXfEHipg>
    <xmx:pi83aUR5DbLatVwQOF8-uRLn9TImi_QeLc8Ti5pE_VqfQwUHqh1VcA>
    <xmx:pi83aTtoeQfXbJumEOlxloGR9zkRk3a07od05eZIJLIDpzutEw-WGg>
    <xmx:qC83aQtVE-oT3QFyD3EhDToVHKkkvo2HfKm_z0WZaMfBkC3mxyGDZ6m_>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Dec 2025 15:05:57 -0500 (EST)
Date: Mon, 8 Dec 2025 21:05:55 +0100
From: Janne Grunau <j@jannau.net>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, andrew.jones@linux.dev,
	linux-omap@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	linux-mips@vger.kernel.org, asahi@lists.linux.dev,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	chrome-platform@lists.linux.dev,
	Paul Cercueil <paul@crapouillou.net>,
	linux-stm32@st-md-mailman.stormreply.com,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-gpio@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	linux-sh@vger.kernel.org, x86@kernel.org,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: Kconfig dangling references (BZ 216748)
Message-ID: <20251208200555.GA333481@robin.jannau.net>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
 <aTcVXrUXVsyjaT22@shepard>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aTcVXrUXVsyjaT22@shepard>
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Dec 08, 2025 at 07:13:50PM +0100, Paul Kocialkowski wrote:
> Hi Randy,
> 
> On Sun 07 Dec 25, 18:04, Randy Dunlap wrote:
> > from  https://bugzilla.kernel.org/show_bug.cgi?id=216748
> > 
> > The bugzilla entry includes a Perl script and a shell script.
> > This is the edited result of running them (I removed some entries that were noise).
> 
> [...]
> 
> > DRM_KMS_DMA_HELPER ---
> > drivers/gpu/drm/adp/Kconfig:9:	select DRM_KMS_DMA_HELPER
> > drivers/gpu/drm/logicvc/Kconfig:7:	select DRM_KMS_DMA_HELPER
> 
> For these two, the symbol was removed in commit
> 09717af7d13d63df141ae6e71686289989d17efd

That commit removed DRM_KMS_CMA_HELPER. Later commit 6bcfe8eaeef0
("drm/fb: rename FB CMA helpers to FB DMA helpers") renamed
DRM_KMS_CMA_HELPER erroneously to DRM_KMS_DMA_HELPER.

> but these two drivers either were
> missed by the batch rename or were introduced a bit later.

In the case of drivers/gpu/drm/adp/Kconfig it was missed much later
during review (but iirc went through the same rename out of tree).

> Since the symbol selected DRM_GEM_CMA_HELPER (which is still needed by the
> drivers), it should be replaced with DRM_GEM_CMA_HELPER.

That symbol doesn't exist anymore either. It's now DRM_GEM_DMA_HELPER
which is already present in both files.

So the "select DRM_KMS_DMA_HELPER" lines can be removed from both files.

Janne

