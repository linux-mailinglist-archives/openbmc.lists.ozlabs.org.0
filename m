Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 120D98269A2
	for <lists+openbmc@lfdr.de>; Mon,  8 Jan 2024 09:40:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T7nZH58LLz3bhr
	for <lists+openbmc@lfdr.de>; Mon,  8 Jan 2024 19:40:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=h08.hostsharing.net (client-ip=2a01:4f8:150:2161:1:b009:f23e:0; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [IPv6:2a01:4f8:150:2161:1:b009:f23e:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T4qF858wWz3cZx
	for <openbmc@lists.ozlabs.org>; Wed,  3 Jan 2024 23:45:16 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id A05C4100DA1A2;
	Wed,  3 Jan 2024 13:45:02 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 3FEC5294C4E; Wed,  3 Jan 2024 13:45:02 +0100 (CET)
Date: Wed, 3 Jan 2024 13:45:02 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Tao Ren <rentao.bupt@gmail.com>
Subject: Re: [PATCH v2 3/6] ARM: dts: aspeed: Common dtsi for Facebook
 AST2600 Network BMCs
Message-ID: <20240103124502.GB23899@wunner.de>
References: <20210805222818.8391-1-rentao.bupt@gmail.com>
 <20210805222818.8391-4-rentao.bupt@gmail.com>
 <20231220081402.GA3831@wunner.de>
 <ZZSmMJ//l972Qbxu@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZZSmMJ//l972Qbxu@fedora>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 08 Jan 2024 19:40:08 +1100
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, taoren@fb.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jan 02, 2024 at 04:11:28PM -0800, Tao Ren wrote:
> On Wed, Dec 20, 2023 at 09:14:02AM +0100, Lukas Wunner wrote:
> > On Thu, Aug 05, 2021 at 03:28:15PM -0700, rentao.bupt@gmail.com wrote:
> > > This common descirption is included by all Facebook AST2600 Network BMC
> > > platforms to minimize duplicated device entries across Facebook Network
> > > BMC device trees.
> > [...]
> > > --- /dev/null
> > > +++ b/arch/arm/boot/dts/ast2600-facebook-netbmc-common.dtsi
> > [...]
> > > +		tpmdev@0 {
> > > +			compatible = "tcg,tpm_tis-spi";
> > 
> > What's the chip used on this board?  Going forward, the DT schema for TPMs
> > requires the exact chip name in addition to the generic "tcg,tpm_tis-spi".
> 
> Sorry about the late response. It's "infineon,slb9670", and I will
> submit a patch for fix it soon.

Thank you Tao and Patrick for the replies.  I've prepared two commits
to fix all violations of the TPM schema on this branch:

  https://github.com/l1k/linux/commits/tpm-dt3

The commits are named:

  e95bdbc arm64: dts: Fix TPM schema violations
  63e5dfd ARM: dts: Fix TPM schema violations

I've now amended the ARM commit to use "infineon,slb9670" for:

  arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
  arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
  arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi

I intend to submit the two commits once the TPM schema is applied
either to Jarkko's or Rob's tree:

  https://lore.kernel.org/all/20231220160422.GA282877-robh@kernel.org/

Thanks,

Lukas
