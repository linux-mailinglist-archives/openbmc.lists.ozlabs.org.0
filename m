Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE3198C60
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2019 09:22:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DbbD582pzDrMG
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2019 17:22:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DbZZ0nTPzDqv2
 for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2019 17:22:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="q2EdP0CG"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46DbZV5D8Xz9s3Z;
 Thu, 22 Aug 2019 17:22:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1566458531; bh=kWBzrs1xRgmCtxLwpW/DjWlFTDVpKGg0sfOxuwC+f4U=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=q2EdP0CGCvSIHG/6cynhVBbcSCOELvUD1TvpitjzoEJWOImzaCGOfwh+9z4Rf9Tbu
 WPOIUq4SlP41DKkYJI6maNcEPuNQ4Su9Da6fZV1bl4xr/Dyv6h7alT6OeMkW7h50M6
 qhBGpB9fyWXeI3dPdpUGEABFCNFQSgjD7Mr/aRl/1v+q5fwtbmqC3uqfvVjrD+VCqS
 UC/HyCJVg9G4s0rpoW0bvxOxW0iDdyJmdfLAYYaNQlligLsNifzFmB3bvzRMucOJ5I
 ISKcvdyS/4bbFqA8/zQDG7EUOfzqSPgXLq0WNrDdy0DXos/n9jeiU9fGMLB18YXrAN
 apaakg+kMTI+Q==
Message-ID: <83dc0bcada88b5cc6762a4bbf98d34649790e0bb.camel@ozlabs.org>
Subject: Re: [PATCH linux dev-5.2] fsi: Add ast2600 master driver
From: Jeremy Kerr <jk@ozlabs.org>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Date: Thu, 22 Aug 2019 15:22:08 +0800
In-Reply-To: <20190822043925.1091-1-joel@jms.id.au>
References: <20190822043925.1091-1-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,

> The ast2600 BMC has a pair of FSI masters in it, behind an AHB to OPB
> bridge.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> This driver is enough to expose FSI functionality to the FSI core that
> is equivalent to the GPIO master. It has some rough edges that need to
> be worked on before it is sent upstream, and lacks support for ipoll,
> interrupts and DMA operations.

Neat!

I'm happy for this to go into the development tree pretty-much as-is,
but we may want to do a few cleanups before going upstream. I've put
few comments inline, but most of those can wait for that upstreaming.

Except maybe the locking (mentioned below), we should sort that out
sooner rather than later.

> +config FSI_MASTER_ASPEED
> +	tristate "FSI ASPEED master"
> +	help
> +	 This option enables a FSI master that is present behind an OPB
> bridge
> +	 in the AST2600.
> +

Are we OK with using "ASPEED" as the identifier here? Given it's a
vendor name, rather than a specific part or design...

</bikeshed>

> +/* TODO: these are copied from the hub master. Put them in a common
> header */

Yeah, I can see a bunch of potential overlap between this and the hub
master, particularly on finicky things like error recovery. However, it
might be best to do a refactor once we have the inner workings of the
OPB master sorted out, and probably after we've got a better idea oq
the DMA implementation.

> It has only been tested with OPB0 on the first master in the ast2600.

I don't expect there to be much difference for OPB1, right?

> +/* half world */
> +#define  STATUS_HW_ACK	BIT(0)
> +/* full word */
> +#define  STATUS_FW_ACK	BIT(1)

Can we match these to the XFER_SIZE definitions (both in value and
name)?

> +static u32 opb_write(void __iomem *base, uint32_t addr, uint32_t val,
> +		     size_t size)
> +{
> +	u32 reg, ret, status;
> +
> +	/* TODO: implement other sizes, see 0x18 */
> +	WARN_ON(size != 4);
> +
> +	writel(0x1, base + OPB0_SELECT);
> +	writel(CMD_WRITE, base + OPB0_RW);
> +	writel(XFER_WORD, base + OPB0_XFER_SIZE);
> +	writel(addr, base + OPB0_FSI_ADDR);
> +	writel(val, base + OPB0_FSI_DATA_W);
> +	writel(0x1, base + OPB_IRQ_CLEAR);
> +	writel(0x1, base + OPB_TRIGGER);

We'll likely need locking here to serialise access to the OPB state,
especially if/when we add OPB1 support. The GPIO master does it at the
master ops level, which should work here too.

> +
> +	ret = readl_poll_timeout(base + OPB_IRQ_STATUS, reg,
> +				(reg & OPB0_XFER_ACK_EN) != 0,
> +				1, 10000);

I know the 10000 was kind of arbitrary, but we might want to match it in
opb_read.

Any thoughts about making this interrupt-driven?

> +
> +	status = readl(base + OPB0_STATUS);
> +
> +	trace_fsi_master_aspeed_opb_write(base, addr, val, size,
> +			status, reg);
> +
> +	/* Return error when poll timed out */
> +	if (ret)
> +		return ret;
> +
> +	/* Command failed, master will reset */

s/master/caller/ maybe? What do you mean here? It might be worth
mentioning that this return value matches the conditional in
check_errors()


> +static int aspeed_master_read(struct fsi_master *master, int link,
> +			uint8_t id, uint32_t addr, void *val, size_t size)
> +{
> +	struct fsi_master_aspeed *aspeed = to_fsi_master_aspeed(master);
> +	int ret;
> +	u32 data;
> +
> +	if (id != 0)
> +		return -EINVAL;

This will preclude 23-bit addressing mode (see fsi_slave_calc_addr()),
is that OK?

> +	addr += link * FSI_HUB_LINK_SIZE;

Will we ever need to support multiple links?

> +static int aspeed_master_term(struct fsi_master *master, int link, uint8_t id)
> +{
> +	struct fsi_master_aspeed *aspeed = to_fsi_master_aspeed(master);
> +	uint32_t addr;
> +	__be32 cmd;
> +	int rc;
> +
> +	addr = 0x4;
> +	cmd = cpu_to_be32(0xecc00000);
> +
> +	dev_dbg(aspeed->dev, "sending term to link %d slave %d\n", link, id);
> +
> +	rc = aspeed_master_write(master, link, id, addr, &cmd, 4);
> +
> +	dev_dbg(aspeed->dev, "term done (%d)\n", rc);
> +
> +	return rc;
> +}
> +
> +static int aspeed_master_break(struct fsi_master *master, int link)
> +{
> +	struct fsi_master_aspeed *aspeed = to_fsi_master_aspeed(master);
> +	uint32_t addr;
> +	__be32 cmd;
> +	int rc;
> +
> +	addr = 0x0;
> +	cmd = cpu_to_be32(0xc0de0000);
> +
> +	dev_dbg(aspeed->dev, "sending break to link %d\n", link);
> +
> +	rc = aspeed_master_write(master, link, 0, addr, &cmd, 4);
> +
> +	dev_dbg(aspeed->dev, "break done (%d)\n", rc);
> +
> +	return rc;
> +}

So I did some digging to figure out by we needed address 0x4 rather than
0x0 there, and it turns out that's only required for hub masters
(apparently, using address 0 caused the *upstream* link of the hub to
consider it a break).

So, I think we can use both 0x0 here, as we're guaranteed to be the
top-level master - or until we consolidate this code with the hub
master. But maybe we should make it consistent across TERM and BREAK?
Does TERM work at both addresses?

> +	/* TODO(joel): The hub had this cleanup. Should we be claiming a range?
> +	 * fsi_slave_release_range(fsi_dev->slave, FSI_HUB_LINK_OFFSET,
> +	 *		FSI_HUB_LINK_SIZE * links);
> +	 */

No, we don't need to claim a range, as we're not using any of an
upstream CFAM's address space.

> +TRACE_EVENT(fsi_master_aspeed_opb_read,
> +	TP_PROTO(void __iomem *base, uint32_t addr, size_t size, uint32_t result, uint32_t status, uint32_t irq_status),
> +	TP_ARGS(base, addr, size, result, status, irq_status),
> +	TP_STRUCT__entry(
> +		__field(void *,    base)
> +		__field(uint32_t,  addr)
> +		__field(size_t,    size)
> +		__field(uint32_t,  result)
> +		__field(uint32_t,  status)
> +		__field(uint32_t,  irq_status)
> +		),

Did we end up using the status register at all, or just the irq_status?

Cheers,


Jeremy

