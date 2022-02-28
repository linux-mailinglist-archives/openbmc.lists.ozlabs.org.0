Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 194B24C64FB
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 09:43:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6YnL21Hxz30QX
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 19:43:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=mAywKeEg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=mAywKeEg; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6Yn02Cbpz2xrm
 for <openbmc@lists.ozlabs.org>; Mon, 28 Feb 2022 19:43:16 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net
 [174.21.187.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 0371C586;
 Mon, 28 Feb 2022 00:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1646037795;
 bh=/gKdAnnuZbroYlaQ/1maEmfHfcReg/Jk+7dXNcIY3XI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mAywKeEgWYu0uwHi0cjc4DPmv+LNIbBCkFIJy0jsetIuZI9D801pbW0qZqvbbILcD
 zMsIoevXT8Rma8I32SE9WoRTrThcUOLqzHrBe+0pMf2RXiOWVlcwuWRO+8U1QFQNi3
 dWebxy0mruYhg4W2qoCUpDnzg9NvOXW20mpF8AJY=
Date: Mon, 28 Feb 2022 00:43:13 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: linux-i2c@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Peter Rosin <peda@axentia.se>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 0/2] ic2: mux: pca9541: add delayed-release support
Message-ID: <YhyLIRFbs226KTwA@hatter.bewilderbeest.net>
References: <20220201001810.19516-1-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220201001810.19516-1-zev@bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jan 31, 2022 at 04:18:08PM PST, Zev Weiss wrote:
>Hello,
>
>This series adds support for a new pca9541 device-tree property
>("release-delay-us"), which delays releasing ownership of the bus
>after a transaction for a configurable duration, anticipating that
>another transaction may follow shortly.  By avoiding a
>release/reacquisition between transactions, this can provide a
>substantial performance improvement for back-to-back operations -- on
>a Delta AHE-50DC (ASPEED AST1250) system running OpenBMC with dozens
>of LM25066 PMICs on PCA9541-arbitrated busses, a setting of 10000 (10
>ms) reduces the median latency the psusensor daemon's hwmon sysfs file
>reads from 2.28 ms to 0.99 ms (a 57% improvement).
>

Ping...Guenter, any thoughts on this?


Thanks,
Zev

