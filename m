Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEB6A2B6B8
	for <lists+openbmc@lfdr.de>; Fri,  7 Feb 2025 00:48:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ypv21327Tz3bdH
	for <lists+openbmc@lfdr.de>; Fri,  7 Feb 2025 10:48:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738885718;
	cv=none; b=YuQdIDeCGla5Ike0TgB1PtgL2aU5c4HJ9R4Hnhw3leecPLSOhWWO7LKb5V43G7CtEHZM6CFreKijC+vCyPQNMBZm7Kk4imt8KbXKQIyEsjzzAqYIgbwwTu5+zsIlB7rtiv+PbhyQqzPrTjRWDKrIQ2HsgXpdWg4wh0T8h+eS5dSx0JzgrHLtDEalicnE75A85xp9qh1QzCsWU0B2OsWkLyTniR/AfJbLL75PLS8N+b+TprUbMor9yElfZ344hpf4ml7Cju4pSe2Xbn9odlE2YZqtyAafYygDS3zA3slfOQsUJWHqUHeZYdgeELkT6/MymvEr/2rd0pQRsiF5T1L4Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738885718; c=relaxed/relaxed;
	bh=55yXgormICt1STeAJtH0+SxMpKazdX3WK42TpJe/cgQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=idAqWYlU5XkGUqKjJ3J4pDak1ZaCNRJfkBORwwNDlGZeJLnSqbuHAYNuZSHpIWFibEb9Js7LienmfBrF7099FMmm8GxvfqvvRzneop/WWiYPOKOYGOVSJerm7n5KeecZrSQoUciC8ohjHKC7zBlnC9U2h2PY+3UxsvAsoM5VusDpLyR5zJJd9PdHtWKqEqTgZSgVFOC1fN3zQyW3oX4CeRRxryF1w7QBguqR/PHIse0z3cCS+5qsGbW92qramWVbWLtQ31clj2TeelDez9V2k11SL+bMcb4flcczj8/BBqXyj4YWyu/b0JfvF7OHzEDthE2A2D678ZFVG2HWt5ExAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=afVgT+4+; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=afVgT+4+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ypv1w60Zmz30Gf
	for <openbmc@lists.ozlabs.org>; Fri,  7 Feb 2025 10:48:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1738885713;
	bh=55yXgormICt1STeAJtH0+SxMpKazdX3WK42TpJe/cgQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=afVgT+4+pgyKo0XLPWREuk4x5qEBAuGjtxG5YlL0Heo/G9+Zbx3BPuj/bj4McTOHa
	 kJ3lezAN/aN3U4/tJUtWpRN3m+0FgdxpNmFjkfGlO3HHNEvrabJC14OzhYU3ewoD7o
	 njjM8zFPe4YAQPAzpkFDpwDysr9v+b8/WSX1FuNDrigH8dyIYflA93kN0V5/yoL3dy
	 K2/36d+XYYxjB5+Y+CSz9HHRwrhX78n7wVms2zhjg08Mcm6OTWDRvlgTodtPqowVIy
	 Y1o/y61YAsde1UAghmcmtcBGmxe4TegOOjO0uB30yCue9Y0vOcHmzeJauWMUb4kAWH
	 hKVRQV0HmK+fw==
Received: from [192.168.68.112] (ppp118-210-167-20.adl-adc-lon-bras34.tpg.internode.on.net [118.210.167.20])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2EF0574A98;
	Fri,  7 Feb 2025 07:48:31 +0800 (AWST)
Message-ID: <9f0447151e6574d74e7fa9cbbb50d8e970059273.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.6] A backport request for SY24655 driver in
 INA2XX driver for Linux kernel 6.6.
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rush Chen <rush_chen@wiwynn.com>, openbmc@lists.ozlabs.org,
 andrew@aj.id.au,  Guenter Roeck <linux@roeck-us.net>, Jean Delvare
 <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>
Date: Fri, 07 Feb 2025 10:18:29 +1030
In-Reply-To: <20250206030747.268165-1-rush_chen@wiwynn.com>
References: <20250206030747.268165-1-rush_chen@wiwynn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rush,

On Thu, 2025-02-06 at 11:07 +0800, Rush Chen wrote:
> From: Rush Chen <Rush_Chen@wiwynn.com>
>=20
> Summary:
> The driver SY24655 has been supported by INA2XX driver,
> since Linux kernel version 6.13.
>=20
> Issue a backport request to Linux kernel 6.6.
>=20
> Signed-off-by: Rush Chen <Rush_Chen@wiwynn.com>

From the way you've structured the subject prefix I expect you are
asking for this to be applied to OpenBMC's kernel fork (openbmc/linux).

If that's the case, this patch has no business bothering upstream
maintainers (Guenter, Jean, Jonathan) or the upstream mailing lists
(linux-hwmon@, linux-kernel@, linux-doc@). The only people this should
be sent to are myself and Joel, and the only list it should be sent to
is openbmc@.

If you send a backport patch for openbmc/linux and are using `git send-
email` to do so, then in nearly all cases you should use the `--
suppress-cc=3Dall` option to make sure upstream maintainers and lists are
_not_ automatically copied on the mail.

However, if you wish this change to be back-ported to an _upstream_
stable tree (e.g. the v6.6 series), please _first_ familiarise yourself
with the stable tree rules, satisfy yourself that the change meets all
the requirements and constraints, and only then follow one of the
documented processes:

https://docs.kernel.org/process/stable-kernel-rules.html#stable-kernel-rule=
s

If you have any questions do follow up with myself, Joel and the
OpenBMC mailing list, but make sure to exclude the upstream maintainers
and lists for now.

Thanks,

Andrew
