Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D18787A6C4
	for <lists+openbmc@lfdr.de>; Wed, 13 Mar 2024 12:09:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tvnpb6pvjz3vfW
	for <lists+openbmc@lfdr.de>; Wed, 13 Mar 2024 22:09:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org)
Received: from mx3.molgen.mpg.de (unknown [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TvnpB5Gzlz3dVR;
	Wed, 13 Mar 2024 22:09:12 +1100 (AEDT)
Received: from [141.14.220.34] (g34.guest.molgen.mpg.de [141.14.220.34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 40E6161E5FE04;
	Wed, 13 Mar 2024 12:08:02 +0100 (CET)
Message-ID: <6f2af609-e3fc-426b-a7ee-b83b859af09f@molgen.mpg.de>
Date: Wed, 13 Mar 2024 12:08:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pinctrl: pinctrl-aspeed-g6: Fix register offset for
 pinconf of GPIOR-T
Content-Language: en-US
To: Billy Tsai <billy_tsai@aspeedtech.com>
References: <20240313092809.2596644-1-billy_tsai@aspeedtech.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20240313092809.2596644-1-billy_tsai@aspeedtech.com>
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
Cc: BMC-SW@aspeedtech.com, johnny_huang@aspeedtech.com, linux-aspeed@lists.ozlabs.org, linus.walleij@linaro.org, Ricky_CX_Wu@wiwynn.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Billy,


Thank you very much for sending version 2.


Am 13.03.24 um 10:28 schrieb Billy Tsai:
> The register offset to disable the internal pull-down of GPIOR~T is 0x630
> instead of 0x620, as specified in the Ast2600 datasheet v15
> The datasheet can download from the official Aspeed website.

(No need for another iteration for this, but “can be downloaded”.)

> Fixes: 15711ba6ff19 ("pinctrl: aspeed-g6: Add AST2600 pinconf support")
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>   drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 34 +++++++++++-----------
>   1 file changed, 17 insertions(+), 17 deletions(-)

[…]

Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul
