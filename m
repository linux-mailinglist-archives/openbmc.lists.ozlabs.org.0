Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B887D473A3A
	for <lists+openbmc@lfdr.de>; Tue, 14 Dec 2021 02:33:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCgr55j5cz3081
	for <lists+openbmc@lfdr.de>; Tue, 14 Dec 2021 12:33:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=jwZsv7PQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=jwZsv7PQ; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCgqk08yhz2yRf
 for <openbmc@lists.ozlabs.org>; Tue, 14 Dec 2021 12:33:05 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-184-96.tukw.qwest.net
 [174.21.184.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 8905D82;
 Mon, 13 Dec 2021 17:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1639445581;
 bh=GRGzk/UQ0iiMhIQ0mUd1rXAUmuA8+vz6T/Ww7+81w/A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jwZsv7PQU+KsLb0YEGK1/mQ1kY5Kd+/wBRyBSi0pfrZJ1ZWxbB8Zmpi1vquDTnPKT
 sUQnf+NmPd6IuVimiCGVkfHsBXLLN3L2Lp0cAflosTyfpArYIZ66xB9t9xhWEVr5dl
 wPts3E2XhZkkg5FNOtxIKgRkoqctsJ8y1CP2OYu8=
Date: Mon, 13 Dec 2021 17:33:00 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] pinctrl: ast2400: add
 support for TXD3/RXD3 pins
Message-ID: <Ybf0TApJEEaM4FDL@hatter.bewilderbeest.net>
References: <20211213194703.24060-1-zev@bewilderbeest.net>
 <HK0PR06MB338026E6233FBF845BF04F5EF2759@HK0PR06MB3380.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <HK0PR06MB338026E6233FBF845BF04F5EF2759@HK0PR06MB3380.apcprd06.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 ChiaWei Wang <chiawei_wang@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Dec 13, 2021 at 05:22:52PM PST, Ryan Chen wrote:
>Hello,
>	You may need claim for function group for link, not for pin link.
>	Ex.
>	static struct aspeed_sig_desc uart3_link[] = {
>		{ 0x80, BIT(22), 0},
>		{ 0x80, BIT(23), 0},
>	}
>
>	ast2400_groups[] = {
>	{ "UART3", 2, uart3_link },
>Ryan

Hi Ryan,

That possibility occurred to me, but the existing function/group names 
in arch/arm/dts/ast2400.dtsi (lines 1130-1133 and 1375-1378) made me 
think they should be separate.  I'm certainly not an expert on pinctrl 
stuff though...is there some other existing logic or mechanism to link a 
"UART3" to the separate "TXD3" and "RXD3" in the device tree?


Zev

