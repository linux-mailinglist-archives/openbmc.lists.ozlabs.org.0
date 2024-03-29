Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8932F891F8C
	for <lists+openbmc@lfdr.de>; Fri, 29 Mar 2024 16:06:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=kp9Of4ua;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5kJY23Lhz3vZt
	for <lists+openbmc@lfdr.de>; Sat, 30 Mar 2024 02:06:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=kp9Of4ua;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::240; helo=mslow1.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V5kHz0Q9rz3cJW
	for <openbmc@lists.ozlabs.org>; Sat, 30 Mar 2024 02:06:06 +1100 (AEDT)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id B5D54C4E77
	for <openbmc@lists.ozlabs.org>; Fri, 29 Mar 2024 15:00:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8D0862000A;
	Fri, 29 Mar 2024 14:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711724399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=70fRv3S4p3jpgudcra18IGGuls9BjP38bw0X/xcQ+NA=;
	b=kp9Of4ua4u/9pk8ZAh/3eSrKka9lgVebaaN0lgwTubZf6P1Jc1N5s4Vu4CaKkluvxX31bA
	fsrYruiE7+DinPEMGXI6yEdlxOxitgajqxVV//PHUJy5WzWLkI6yJAthSuGSAee/jMHhkd
	Igv6DvlCCC1FWMA1I9002aVtjOi65Kfp5xg8EwfhlSneE1A8DdeFZcsGDURfXhfUxuSEjp
	81+W7mV0eL7xn0ps+oWkat04PHFryW7T3UNeFvbCHxOq8F/CS5tkg2m7BOIweVUJrA6ve0
	d7+2W0IElFAH2AK42lUrinMTP0SnVMRxnmszQZlGFhwjSfQhi9l7RBl3owXgsA==
Date: Fri, 29 Mar 2024 15:59:58 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
	venture@google.com, yuenn@google.com, benjaminfair@google.com,
	KWLIU@nuvoton.com, mylin1@nuvoton.com,
	Mia Lin <mimi05633@gmail.com>
Subject: Re: [PATCH v1 0/1] rtc: nuvoton: Modify part number value
Message-ID: <171172436465.1832232.12409120687199982859.b4-ty@bootlin.com>
References: <20240311013405.3398823-1-mimi05633@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240311013405.3398823-1-mimi05633@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
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
Cc: linux-rtc@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 11 Mar 2024 09:34:04 +0800, Mia Lin wrote:
> Changes since version 1:
>   rtc: nuvoton: Modify part number value to match datasheet definition.
> 
> Mia Lin (1):
>   rtc: nuvoton: Modify part number value
> 
> drivers/rtc/rtc-nct3018y.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> [...]

Applied, thanks!

[1/1] rtc: nuvoton: Modify part number value
      https://git.kernel.org/abelloni/c/8b59a11fb8e6

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
