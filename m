Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AEF34A6E3
	for <lists+openbmc@lfdr.de>; Fri, 26 Mar 2021 13:10:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6LQ56Tz0z3btn
	for <lists+openbmc@lfdr.de>; Fri, 26 Mar 2021 23:10:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=robin.murphy@arm.com; receiver=<UNKNOWN>)
X-Greylist: delayed 395 seconds by postgrey-1.36 at boromir;
 Fri, 26 Mar 2021 23:09:55 AEDT
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4F6LPv1FTfz2yR3;
 Fri, 26 Mar 2021 23:09:53 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7444A143D;
 Fri, 26 Mar 2021 05:03:14 -0700 (PDT)
Received: from [10.57.27.121] (unknown [10.57.27.121])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0E5C3F7D7;
 Fri, 26 Mar 2021 05:03:11 -0700 (PDT)
Subject: Re: [PATCH] usb: gadget: aspeed: set port_dev dma mask
To: rentao.bupt@gmail.com, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 kernel test robot <lkp@intel.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Sasha Levin <sashal@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Thomas Tai <thomas.tai@oracle.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Christoph Hellwig <hch@lst.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, Tao Ren <taoren@fb.com>
References: <20210326070214.6719-1-rentao.bupt@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <10920f34-289c-feac-79b6-71bff2aea67d@arm.com>
Date: Fri, 26 Mar 2021 12:03:03 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210326070214.6719-1-rentao.bupt@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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

On 2021-03-26 07:02, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> Set aspeed-usb vhub port_dev's dma mask to pass the dma_mask test in
> "dma_map_page_attrs" function, and the dma_mask test was added in
> 'commit f959dcd6ddfd ("dma-direct: Fix potential NULL pointer
> dereference")'.
> 
> Below is the backtrace without the patch:
> [<80106550>] show_stack+0x20/0x24
> [<80106868>] dump_stack+0x28/0x30
> [<80823540>] __warn+0xfc/0x110
> [<8011ac30>] warn_slowpath_fmt+0xb0/0xc0
> [<8011ad44>] dma_map_page_attrs+0x24c/0x314
> [<8016a27c>] usb_gadget_map_request_by_dev+0x100/0x1e4
> [<805cedd8>] usb_gadget_map_request+0x1c/0x20
> [<805cefbc>] ast_vhub_epn_queue+0xa0/0x1d8
> [<7f02f710>] usb_ep_queue+0x48/0xc4
> [<805cd3e8>] ecm_do_notify+0xf8/0x248
> [<7f145920>] ecm_set_alt+0xc8/0x1d0
> [<7f145c34>] composite_setup+0x680/0x1d30
> [<7f00deb8>] ast_vhub_ep0_handle_setup+0xa4/0x1bc
> [<7f02ee94>] ast_vhub_dev_irq+0x58/0x84
> [<7f0309e0>] ast_vhub_irq+0xb0/0x1c8
> [<7f02e118>] __handle_irq_event_percpu+0x50/0x19c
> [<8015e5bc>] handle_irq_event_percpu+0x38/0x8c
> [<8015e758>] handle_irq_event+0x38/0x4c
> 
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> ---
>   drivers/usb/gadget/udc/aspeed-vhub/dev.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/dev.c b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
> index d268306a7bfe..9eb3904a6ff9 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/dev.c
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
> @@ -569,6 +569,7 @@ int ast_vhub_init_dev(struct ast_vhub *vhub, unsigned int idx)
>   	device_initialize(d->port_dev);
>   	d->port_dev->release = ast_vhub_dev_release;
>   	d->port_dev->parent = parent;
> +	d->port_dev->dma_mask = parent->dma_mask;

This might happen to work out, but is far from correct. Just wait until 
you try it on a platform where the USB controller is behind an IOMMU...

It looks like something is more fundamentally wrong here - the device 
passed to DMA API calls must be the actual hardware device performing 
the DMA, which in USB-land I believe means the controller's sysdev.

Robin.

>   	dev_set_name(d->port_dev, "%s:p%d", dev_name(parent), idx + 1);
>   	rc = device_add(d->port_dev);
>   	if (rc)
> 
