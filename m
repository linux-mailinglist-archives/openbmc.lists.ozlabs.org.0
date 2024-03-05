Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B96078711B8
	for <lists+openbmc@lfdr.de>; Tue,  5 Mar 2024 01:29:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=W45G8TcZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tpbz83TVNz3brZ
	for <lists+openbmc@lfdr.de>; Tue,  5 Mar 2024 11:29:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=W45G8TcZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=lists.ozlabs.org)
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpbyZ3nXtz30YR
	for <openbmc@lists.ozlabs.org>; Tue,  5 Mar 2024 11:28:38 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:712b:6300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 786CDA10;
	Mon,  4 Mar 2024 16:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1709598516;
	bh=2TEBh842bpWvFeRLWwrtU0iI8xSYsMvKaXd0LecDU1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W45G8TcZszuC8qmMK8TMBEFeobo6f/cn6fAeyayR/F2xP5dUnQb8BNvAjNlWt9BXp
	 Y0k7qe+VsbsvmhTAbb/dScBgFgG7XNNkedui+G07APUategnJaJcprV/mH/FXdCvQa
	 0VnP3DOd4x0Qg1l01xtjJSUI6CDL1j/5EejqKRak=
Date: Mon, 4 Mar 2024 16:28:35 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: baneric926@gmail.com
Subject: Re: [PATCH v4 3/3] hwmon: Driver for Nuvoton NCT7363Y
Message-ID: <cffada5e-0f7a-415f-9c4b-7c46fac5cd3a@hatter.bewilderbeest.net>
References: <20240227005606.1107203-1-kcfeng0@nuvoton.com>
 <20240227005606.1107203-4-kcfeng0@nuvoton.com>
 <a90ed00c-f836-4fb6-8191-9974937e3eb7@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <a90ed00c-f836-4fb6-8191-9974937e3eb7@hatter.bewilderbeest.net>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, jdelvare@suse.com, corbet@lwn.net, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, naresh.solanki@9elements.com, billy_tsai@aspeedtech.com, kcfeng0@nuvoton.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, kwliu@nuvoton.com, linux@roeck-us.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Mar 02, 2024 at 12:19:07AM PST, Zev Weiss wrote:
>On Mon, Feb 26, 2024 at 04:56:06PM PST, baneric926@gmail.com wrote:

<snip>

>
>>+
>>+	fanin_cnt = of_property_count_u8_elems(child, "tach-ch");
>>+	if (fanin_cnt < 1)
>
>fanin_cnt < 1 || fanin_cnt >= NCT7363_PWM_COUNT
>

Er, off by one -- just '>' rather than '>=' there I realize now.


Zev

