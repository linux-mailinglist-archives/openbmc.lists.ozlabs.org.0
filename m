Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57677242602
	for <lists+openbmc@lfdr.de>; Wed, 12 Aug 2020 09:23:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRLm62wLWzDqVc
	for <lists+openbmc@lfdr.de>; Wed, 12 Aug 2020 17:23:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=79.137.123.220;
 helo=smtpout1.mo804.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 448 seconds by postgrey-1.36 at bilbo;
 Wed, 12 Aug 2020 17:23:02 AEST
Received: from smtpout1.mo804.mail-out.ovh.net
 (smtpout1.mo804.mail-out.ovh.net [79.137.123.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRLlB4Pk8zDqRr
 for <openbmc@lists.ozlabs.org>; Wed, 12 Aug 2020 17:23:02 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.141])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 56D185655547;
 Wed, 12 Aug 2020 09:15:24 +0200 (CEST)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Wed, 12 Aug
 2020 09:15:23 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003b2bc4f94-943d-4393-87c5-0c8035b4c01c,
 80543648EB1ACD187FE9A0A2CDDB60F737496A55) smtp.auth=clg@kaod.org
Subject: Re: [PATCH linux dev-5.8] mtd: spi-nor: sfdp: Revert "default to
 addr_width of 3 for configurable widths"
To: Joel Stanley <joel@jms.id.au>, <openbmc@lists.ozlabs.org>
References: <20200812035847.2352277-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5735dbed-c339-ee03-d273-f1a130b21344@kaod.org>
Date: Wed, 12 Aug 2020 09:15:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200812035847.2352277-1-joel@jms.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2505abc0-9f3b-4423-9349-326334bf6b81
X-Ovh-Tracer-Id: 10884074402996259738
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrledugdduudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgedvieejfedvhfduhfffueevheeludffhfdvkeehleegtddttdfhieegveeghfffnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghu
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

On 8/12/20 5:58 AM, Joel Stanley wrote:
> This reverts commit f9acd7fa80be6ee14aecdc54429f2a48e56224e8 which
> breaks mounting of UBI volumes with the aspeed-smc driver:
> 
>  ubi0: default fastmap pool size: 25
>  ubi0: default fastmap WL pool size: 12
>  ubi0: attaching mtd3
>  ubi0: scanning is finished
>  ubi0 error: ubi_read_volume_table: the layout volume was not found
>  ubi0 error: ubi_attach_mtd_dev: failed to attach mtd3, error -22
> 
> Found by bisecting between v5.7 and v5.8.
> 
> Fixes: f9acd7fa80be ("mtd: spi-nor: sfdp: default to addr_width of 3 for configurable widths")
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> This identifies why we are seeing SPI NOR failures on v5.8. There is
> potentially a fix that needs to be made in the aspeed-smc driver instead
> of reverting the core spi-nor change.


May be we should introduce a 'post_bfpt_fixups' handler for the mx66l1g45g
instead.

C.


> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/mtd/spi-nor/sfdp.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 55c0c508464b..9db07182e9c8 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -456,7 +456,6 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  	/* Number of address bytes. */
>  	switch (bfpt.dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) {
>  	case BFPT_DWORD1_ADDRESS_BYTES_3_ONLY:
> -	case BFPT_DWORD1_ADDRESS_BYTES_3_OR_4:
>  		nor->addr_width = 3;
>  		break;
>  
> 

