Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D57E865971D
	for <lists+openbmc@lfdr.de>; Fri, 30 Dec 2022 11:07:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nk1Ct58kcz3cDF
	for <lists+openbmc@lfdr.de>; Fri, 30 Dec 2022 21:07:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nk1CW6Bggz2ynD
	for <openbmc@lists.ozlabs.org>; Fri, 30 Dec 2022 21:07:32 +1100 (AEDT)
Received: from [192.168.0.2] (ip5f5aefab.dynamic.kabel-deutschland.de [95.90.239.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id BE11060027FC5;
	Fri, 30 Dec 2022 11:07:25 +0100 (CET)
Message-ID: <cd958688-1db3-b419-7295-6c03a06f61d2@molgen.mpg.de>
Date: Fri, 30 Dec 2022 11:07:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] ARM: dts: aspeed: Add
 Ufispace NCPLite platform BMC
To: Jordan Chang <jordan.chang@ufispace.com>
References: <20221230024521.77064-1-jordan.chang@ufispace.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20221230024521.77064-1-jordan.chang@ufispace.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: jay.tc.lin@ufispace.com, eason.ys.huang@ufispace.com, openbmc@lists.ozlabs.org, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Jordan,


Thank you for the patch.

Am 30.12.22 um 03:45 schrieb Jordan Chang:
> Add initial device tree of Ufispace NCPLite platform which
> used AST2600-based BMC.

use*s*

Please extend the commit message to explain the #if 0 preprocessor 
statements.

> Signed-off-by: Jordan Chang <jordan.chang@ufispace.com>
> ---
>   arch/arm/dts/Makefile            |   1 +
>   arch/arm/dts/ast2600-ncplite.dts | 215 +++++++++++++++++++++++++++++++
>   2 files changed, 216 insertions(+)
>   create mode 100644 arch/arm/dts/ast2600-ncplite.dts

[…]


Kind regards,

Paul
