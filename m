Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E83498DBE4
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2024 16:36:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJcmr6LvTz3c6C
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2024 00:35:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727879752;
	cv=none; b=eOEmJznQL5Y+GZ4p1lCg40wd4MhNQgnXssoaCBw9ZSKSLXTAtC/AkujpIbf7WDnBLCSsdhTtbLyZI5U7heK88bbpuUDmBJqWq2Qzk/l3FlCOM/SGbEtrnTETkhJsnkkJyv/YgOteN0yuWXujbGy29jQ5j3qpNMZH7Yc9CN3cqXdeBT/4hj5upCYplLvn6O2KWUO8CHmrufkjOiL+IZznzfRkwH9qYaWUki4XGHqdiAQp3lQhjsb89RkAPspzzSC/Bd/U6j9aaZ+Iuhxsc7nbtGcm6wOzEerJc9qmgKaRQ+fQiFE0z5PqEQYtjeRG+Xixoy91GsQM3zRAPgCKExdxrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727879752; c=relaxed/relaxed;
	bh=vzmnonUYYNTjfRnTO717pspGElvMrH83A8Nt//JrkIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mUNgcJKJ9bQ+SMG6qnAvv3iI5Af88RPbRbTf830HL3Sr06EhPTWzVWcQ0oc7GleRXZGwTWGppS5s3uESDx7W5HePNRM8ApsBmWkoxYbWKVQKJ9kh0AN3uzRIBz6GzESJGINDnR0M79dh10q25/qGEO/3IsRXDzucxTrR8VRd8Nb6E2yRvlW17F80g+zod/GbHhtT6k97rsYkYnmVZM+QybRxmJcYgUm6JdfpowLGkJXimv1OwAhOEXn5sQi0YjFGwc7C/hf/LnkQn4usvqtC7SEpxwxFUdVBnrEsGEhNhVxuO9C18EUE7r60E+xa7VJ1T5HN+JXCND7pIR9C2zkAFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eOvVM+2Q; dkim-atps=neutral; spf=none (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eOvVM+2Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJcmj355Dz2yP8
	for <openbmc@lists.ozlabs.org>; Thu,  3 Oct 2024 00:35:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727879750; x=1759415750;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=reX/HEz8p8JLCDKEMNA3o/Kp5RQsQN6emEVJh9u5XcE=;
  b=eOvVM+2QHcsaVdXg2qCl1edCyTgWFujPB1QAWikfnAf8+FCeDwjmxJP1
   0mh1arY4xI610oLOeMhheGH3JNtQTaDvc6lAeoVeyb4nCwblIH24R2N2u
   JV10gfP/DwjJPqSW9NYvmH4+HtSPAqg8zR4A7uYdux687NeWys2L34cGU
   iytVUt6C1JfSQPurGLhaD60ysWAJ6ravTCIbhouoGGNScP/wSTW1bdmt1
   1FNeaaArCbygYfJE3HdNhlvzsanC4V9gIlftx0PSdCbUGZ8+JPUHEASRE
   x/I6LwQK2L95kgdogfmv71xzbBTOr+9m9c5kln8vKj2nHqAmIW3xDFUYW
   w==;
X-CSE-ConnectionGUID: sSFEjqC8SWKMfkEXlP41sA==
X-CSE-MsgGUID: 00jsCKpQR4mmeYgOVdlvNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="38179590"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="38179590"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 07:35:44 -0700
X-CSE-ConnectionGUID: +Yds6v1JQI6HXv66faUHeQ==
X-CSE-MsgGUID: AkbSVDKJSyaGbdwMNNJS3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="74262436"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.154])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 07:35:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sw0S1-0000000FhjB-1sj4;
	Wed, 02 Oct 2024 17:35:37 +0300
Date: Wed, 2 Oct 2024 17:35:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v14 0/3] Add ASPEED AST2600 I2Cv2 controller driver
Message-ID: <Zv1aOedi9xl2mg9b@smile.fi.intel.com>
References: <20241002070213.1165263-1-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002070213.1165263-1-ryan_chen@aspeedtech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-0.1 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: robh@kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, brendan.higgins@linux.dev, joel@jms.id.au, p.zabel@pengutronix.de, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Oct 02, 2024 at 03:02:10PM +0800, Ryan Chen wrote:
> This series add AST2600 i2cv2 new register set driver. The i2cv2 driver
> is new register set that have new clock divider option for more
> flexiable generation. And also have separate i2c master and slave register
> set for control, patch #2 is i2c master driver only, patch #3 is add
> i2c slave mode driver.
> 
> The legacy register layout is mix master/slave register control together.
> The following is add more detail description about new register layout.
> And new feature set add for register.
> 
> -Add new clock divider option for more flexible and accurate clock rate
> generation -Add tCKHighMin timing to guarantee SCL high pulse width.
> -Add support dual pool buffer mode, split 32 bytes pool buffer of each
> device into 2 x 16 bytes for Tx and Rx individually.
> -Increase DMA buffer size to 4096 bytes and support byte alignment.
> -Re-define the base address of BUS1 ~ BUS16 and Pool buffer.
> -Re-define registers for separating master and slave mode control.
> -Support 4 individual DMA buffers for master Tx and Rx, slave Tx and Rx.
> 
> And following is new register set for package transfer sequence.
> -New Master operation mode:
>  S -> Aw -> P
>  S -> Aw -> TxD -> P
>  S -> Ar -> RxD -> P
>  S -> Aw -> RxD -> Sr -> Ar -> TxD -> P
> -Bus SDA lock auto-release capability for new master DMA command mode.
> -Bus auto timeout for new master/slave DMA mode.
> 
> The following is two versus register layout.
> Old:
> {I2CD00}: Function Control Register
> {I2CD04}: Clock and AC Timing Control Register
> {I2CD08}: Clock and AC Timing Control Register
> {I2CD0C}: Interrupt Control Register
> {I2CD10}: Interrupt Status Register
> {I2CD14}: Command/Status Register
> {I2CD18}: Slave Device Address Register
> {I2CD1C}: Pool Buffer Control Register
> {I2CD20}: Transmit/Receive Byte Buffer Register
> {I2CD24}: DMA Mode Buffer Address Register
> {I2CD28}: DMA Transfer Length Register
> {I2CD2C}: Original DMA Mode Buffer Address Setting
> {I2CD30}: Original DMA Transfer Length Setting and Final Status
> 
> New Register mode
> {I2CC00}: Master/Slave Function Control Register
> {I2CC04}: Master/Slave Clock and AC Timing Control Register
> {I2CC08}: Master/Slave Transmit/Receive Byte Buffer Register
> {I2CC0C}: Master/Slave Pool Buffer Control Register
> {I2CM10}: Master Interrupt Control Register
> {I2CM14}: Master Interrupt Status Register
> {I2CM18}: Master Command/Status Register
> {I2CM1C}: Master DMA Buffer Length Register
> {I2CS20}: Slave~ Interrupt Control Register
> {I2CS24}: Slave~ Interrupt Status Register
> {I2CS28}: Slave~ Command/Status Register
> {I2CS2C}: Slave~ DMA Buffer Length Register
> {I2CM30}: Master DMA Mode Tx Buffer Base Address
> {I2CM34}: Master DMA Mode Rx Buffer Base Address
> {I2CS38}: Slave~ DMA Mode Tx Buffer Base Address
> {I2CS3C}: Slave~ DMA Mode Rx Buffer Base Address
> {I2CS40}: Slave Device Address Register
> {I2CM48}: Master DMA Length Status Register
> {I2CS4C}: Slave  DMA Length Status Register
> {I2CC50}: Current DMA Operating Address Status
> {I2CC54}: Current DMA Operating Length  Status
> 
> aspeed,global-regs:
> This global register is needed, global register is setting for
> new clock divide control, and new register set control.
> 
> ASPEED SOC chip is server product, i2c bus may have fingerprint
> connect to another board. And also support hotplug.
> The following is board-specific design example.
> Board A                                         Board B
> -------------------------                       ------------------------
> |i2c bus#1(master/slave)  <===fingerprint ===> i2c bus#x (master/slave)|
> |i2c bus#2(master)-> tmp i2c device |          |                       |
> |i2c bus#3(master)-> adc i2c device |          |                       |
> -------------------------                       ------------------------
> 
> i2c-scl-clk-low-timeout-us:
> For example I2C controller as slave mode, and suddenly disconnected.
> Slave state machine will keep waiting for master clock in for rx/tx
> transmit. So it need timeout setting to enable timeout unlock controller
> state. And in another side. In Master side also need avoid suddenly
> slave miss(un-plug), Master will timeout and release the SDA/SCL.
> 
> aspeed,enable-dma:
> For example The bus#1 have trunk data needed for transfer,
> it can enable bus dma mode transfer, it can reduce cpu utilized.
> Others bus bus#2/3 use defautl buffer mode.

Is it possible to switch to new terminology wherever it's possible?
I.e. master --> controller, slave --> target. See, for example,
f872d28500bd ("i2c: uniphier-f: reword according to newest specification").

-- 
With Best Regards,
Andy Shevchenko


