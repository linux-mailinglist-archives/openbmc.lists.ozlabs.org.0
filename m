Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D3654E77B
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 18:43:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LP7Jr6pvKz3brV
	for <lists+openbmc@lfdr.de>; Fri, 17 Jun 2022 02:43:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kaod.org (client-ip=178.33.105.233; helo=2.mo552.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 2.mo552.mail-out.ovh.net (2.mo552.mail-out.ovh.net [178.33.105.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LP7JX1vwxz2yLg
	for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2022 02:42:49 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.59])
	by mo552.mail-out.ovh.net (Postfix) with ESMTPS id C7DE42578E;
	Thu, 16 Jun 2022 16:07:00 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 16 Jun
 2022 18:06:59 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-106R006ec0ca7cc-94c7-4ade-905a-0d882ca1ae9d,
                    ECCD5AFB15110256CA35D0D8D41CD21D4D402C71) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.2.66.235
Message-ID: <16885c05-91da-5ddc-75a8-c0263c725caf@kaod.org>
Date: Thu, 16 Jun 2022 18:06:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] ftgmac100: Remove
 unnecessary cache flush
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, <openbmc@lists.ozlabs.org>
References: <20220616071059.2741449-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220616071059.2741449-1-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e831162b-887c-46b4-a33b-f277251ea097
X-Ovh-Tracer-Id: 6135028594295278490
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddvfedgleduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnsghmtgeslhhishhtshdrohiilhgrsghsrdhorhhgpdfovfetjfhoshhtpehmohehhedv
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

On 6/16/22 09:10, Joel Stanley wrote:
> On AST2400 (ARM9) platforms this would warn when the d-cache is enabled:
> 
>   CACHE: Misaligned operation at range [4d79f8e8, 4d79f928]
> 
> The flushing is not required, as we perform a flush of the entire
> descriptor after setting txdes0.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   drivers/net/ftgmac100.c | 7 -------
>   1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/net/ftgmac100.c b/drivers/net/ftgmac100.c
> index 92170f52434e..11404c45eb5f 100644
> --- a/drivers/net/ftgmac100.c
> +++ b/drivers/net/ftgmac100.c
> @@ -473,8 +473,6 @@ static int ftgmac100_send(struct udevice *dev, void *packet, int length)
>   	ulong des_start = (ulong)curr_des;
>   	ulong des_end = des_start +
>   		roundup(sizeof(*curr_des), ARCH_DMA_MINALIGN);
> -	ulong data_start;
> -	ulong data_end;
>   	int rc;
>   
>   	invalidate_dcache_range(des_start, des_end);
> @@ -490,11 +488,6 @@ static int ftgmac100_send(struct udevice *dev, void *packet, int length)
>   
>   	curr_des->txdes3 = (unsigned int)packet;
>   
> -	/* Flush data to be sent */
> -	data_start = curr_des->txdes3;
> -	data_end = data_start + roundup(length, ARCH_DMA_MINALIGN);
> -	flush_dcache_range(data_start, data_end);
> -
>   	/* Only one segment on TXBUF */
>   	curr_des->txdes0 &= priv->txdes0_edotr_mask;
>   	curr_des->txdes0 |= FTGMAC100_TXDES0_FTS |

