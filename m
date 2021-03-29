Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA05134C3B4
	for <lists+openbmc@lfdr.de>; Mon, 29 Mar 2021 08:17:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F82SG6W1Wz30BX
	for <lists+openbmc@lfdr.de>; Mon, 29 Mar 2021 17:17:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F82S42W4fz2yyP;
 Mon, 29 Mar 2021 17:17:39 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 80D5868B05; Mon, 29 Mar 2021 08:17:35 +0200 (CEST)
Date: Mon, 29 Mar 2021 08:17:35 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tao Ren <rentao.bupt@gmail.com>
Subject: Re: [PATCH] usb: gadget: aspeed: set port_dev dma mask
Message-ID: <20210329061735.GA27510@lst.de>
References: <20210326070214.6719-1-rentao.bupt@gmail.com>
 <10920f34-289c-feac-79b6-71bff2aea67d@arm.com>
 <20210326120526.GA14169@lst.de>
 <20210327221759.GA2997@taoren-ubuntu-R90MNF91>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210327221759.GA2997@taoren-ubuntu-R90MNF91>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: Sasha Levin <sashal@kernel.org>, Felipe Balbi <balbi@kernel.org>,
 linux-usb@vger.kernel.org, Ryan Chen <ryan_chen@aspeedtech.com>,
 kernel test robot <lkp@intel.com>, linux-aspeed@lists.ozlabs.org,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Thomas Tai <thomas.tai@oracle.com>,
 Tao Ren <taoren@fb.com>, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Mar 27, 2021 at 03:17:59PM -0700, Tao Ren wrote:
> On Fri, Mar 26, 2021 at 01:05:26PM +0100, Christoph Hellwig wrote:
> > On Fri, Mar 26, 2021 at 12:03:03PM +0000, Robin Murphy wrote:
> > > This might happen to work out, but is far from correct. Just wait until you 
> > > try it on a platform where the USB controller is behind an IOMMU...
> > >
> > > It looks like something is more fundamentally wrong here - the device 
> > > passed to DMA API calls must be the actual hardware device performing the 
> > > DMA, which in USB-land I believe means the controller's sysdev.
> > 
> > The shiny new usb_intf_get_dma_device API provides the device to use.
> 
> Thanks Robin and Christoph for the feedback.
> 
> If I understand correctly, usb_intf_get_dma_device API is mainly for usb
> host drivers? I just found usb_gadget_map_request_by_dev API: does it
> make sense to replace usb_gadget_map_request with
> usb_gadget_map_request_by_dev so we can pass the actual DMA-capable
> hardware device (aspeed-vhub platform device) to the API?

Oh, right you're dealing with a gadget side driver.  Not sure about
the API there, I'll let the relevant maintainers chime in.
