Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CB292539D
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2024 08:26:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=gYYHplY3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDVCZ3gb4z3cZr
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2024 16:26:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=gYYHplY3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDVC409N7z30W2
	for <openbmc@lists.ozlabs.org>; Wed,  3 Jul 2024 16:25:35 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-145-155.adl-adc-lon-bras33.tpg.internode.on.net [118.210.145.155])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C5A9120135;
	Wed,  3 Jul 2024 14:25:33 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1719987935;
	bh=HYoeEYtKBCI/e6RVKehcP/K0PXPlrHSdqDjpIs6Wubg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=gYYHplY3emxJYGlP+zd5/947+58Ys0hXMaFMfWUj9C7kdPcUvTl8clLnBi7A8qbaw
	 3EYraxgUbQl1A2CvS0G1hlnrI6ZhupoiXGgl61m3YDFnOdO53j443HU4d8AnDEhYwE
	 yG4jo6jk0lzNiDXTLidrvAUqCDGU3AuTxoYfKBgL4HdaOX6amYYCkvRJ4lKOIvmejp
	 ydUZeXrsK+LhUkUCzWVJiMSjWozzkn4a/ej91psF07pmjAAIC6HVND3/prCBkAI+Rx
	 /0ZmD/PCabK+JBp5X8OIE963bV5AEmPli5djjWomWHhTU990fAk/iLXDZQTcodklW8
	 wdU964P1fNRPw==
Message-ID: <102bf57ba6144ebed65e62d0818eb21dfdf1f24f.camel@codeconstruct.com.au>
Subject: Re: [linux dev-6.6 v1 4/6] arm64: dts: modify clock property in
 modules node
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>, openbmc@lists.ozlabs.org
Date: Wed, 03 Jul 2024 15:55:31 +0930
In-Reply-To: <20240701071048.751863-5-tmaimon77@gmail.com>
References: <20240701071048.751863-1-tmaimon77@gmail.com>
	 <20240701071048.751863-5-tmaimon77@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2024-07-01 at 10:10 +0300, Tomer Maimon wrote:
> Modify clock property handler in UART, CPU, PECI modules to reset
> controller.

Sooo... I'm not sure how much of a hack this is, as it's not clear to
me that the devicetree spec allows multiple labels on a node, but `dtc`
seems to accept it.

You can reduce this patch to a short diff with:

-               rstc: reset-controller@f0801000 {
+               clk: rstc: reset-controller@f0801000 {

and leave the rest of the phandles in-tact.

Again, something to investigate for yourself and maybe see how it flies
upstream...

Andrew
