Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6E849B1CD
	for <lists+openbmc@lfdr.de>; Tue, 25 Jan 2022 11:43:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jjk3T5Vfmz3bY6
	for <lists+openbmc@lfdr.de>; Tue, 25 Jan 2022 21:43:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org;
 envelope-from=srs0=pq9m=sj=xs4all.nl=hverkuil@kernel.org; receiver=<UNKNOWN>)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jjk3B1zgXz301v;
 Tue, 25 Jan 2022 21:43:18 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EDB986165E;
 Tue, 25 Jan 2022 10:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AADEBC340E0;
 Tue, 25 Jan 2022 10:43:11 +0000 (UTC)
Message-ID: <c3202b1f-ff8f-8108-e8a3-8710c8c74d10@xs4all.nl>
Date: Tue, 25 Jan 2022 11:43:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 0/2] Fix incorrect resolution detected
Content-Language: en-US
To: Jammy Huang <jammy_huang@aspeedtech.com>, eajames@linux.ibm.com,
 mchehab@kernel.org, joel@jms.id.au, andrew@aj.id.au,
 linux-media@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20220118100729.7651-1-jammy_huang@aspeedtech.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220118100729.7651-1-jammy_huang@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jammy,

On 18/01/2022 11:07, Jammy Huang wrote:
> This series fixes incorrect resolution detected.
> We found this problem happened occasionally in the switch between bios
> and bootloader.

Can you rebase this on top of:

https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=for-v5.18f

This series doesn't apply cleanly.

Regards,

	Hans

> 
> Changes in v4:
>  - Correct the subject of patch
> 
> Changes in v3:
>  - In v2, we tried to increase the min-required-count of stable signal
>    to avoid incorrect transient state in timing detection. But it is
>    not working for all conditions.
>    Thus, we go another way in v3. Use regs, which can represent the
>    signal status, to decide if we needs to do detection again.
>  
> Changes in v2:
>  - Separate the patch into two patches
> 
> Jammy Huang (2):
>   media: aspeed: Add macro for the fields of the mode-detect registers
>   media: aspeed: Fix unstable timing detection
> 
>  drivers/media/platform/aspeed-video.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 

