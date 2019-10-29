Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E22E7ED1
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 04:17:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472Gwv2rZgzF0f5
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 14:17:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472GwF2zr4zDqSr
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 14:17:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="oxDUzn6E"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 472GwD10hsz9sPK;
 Tue, 29 Oct 2019 14:17:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1572319020; bh=WG6EWFaO0iqBqkVqtH3rlTTxYZNqwXTbb9JAmFgzI2o=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=oxDUzn6EdojWK4zYrmQDlUVWrsKvkQOKazNVblkV2eG5Ba8LML2hby5oOu2BiSprh
 cBjSWTuO8DwxNRdVODgcBsuoRzoW91JW0s3L4Vc287ik5jdvUQQxPE80as0V6A7LmS
 IZ/Bs0na23okZtiiV8DBmMStTTDPR6+lMNppIOiLaEvOwMyAiBYYbseEvNf99Pqkoz
 4UqqNN8YlI16yWJCRnuDFXFUSjGKEjgFDcpod+khGzpTbm3BhRdaSqe/r/q99jA8Q4
 VoDFbhR4f5jrb7eaLpYPoi4/NLOMD4Tn2Vczp1+8+zJRf4kAEcCYgCRNKQsNytnMnY
 alhTO3BJ331nw==
Message-ID: <1673c225b25d37ab3bdc2bf2b8fb67abb0f77f60.camel@ozlabs.org>
Subject: Re: [PATCH linux dev-5.3 7/7] fsi: aspeed: Special case repeated
 full word reads
From: Jeremy Kerr <jk@ozlabs.org>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Date: Tue, 29 Oct 2019 11:16:56 +0800
In-Reply-To: <20191025010351.30298-8-joel@jms.id.au>
References: <20191025010351.30298-1-joel@jms.id.au>
 <20191025010351.30298-8-joel@jms.id.au>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,

> The driver can skip doing some of the AHB2OPB setup if the operation is
> of the same type. Experiment with this for full word reads, which could
> be extended to writes if it shows an improvement.

I would have taken a slightly different approach here - to do the "last
value" caching at the OPB register set level, rather than working at the
FSI-operation level. ie, keep a copy of the AHB registers that control
OPB transactions, then only set them when they differ from the intended
writes.

That would give us something like this for opb_read():

    if (aspeed->opb0_select != 0x1) {
	aspeed->opb0_select = 0x1;
	writel(aspeed->opb0_select, base + OPB0_SELECT);
    }

    if (aspeed->opb0_rw != CMD_READ) {
	aspeed->opb0_rw = CMD_READ;
	writel(aspeed->opb0_rw, base + OPB0_RW);
    }

    if (aspeed->opb0_xfer_size != XFER_WORD) {
	aspeed->opb0_xfer_size = XFER_WORD;
	writel(aspeed->opb0_xfer_size, base + OPB0_XFER_SIZE);
    }

    if (aspeed->opb0_addr != addr) {
	aspeed->opb0_addr = addr;
	writel(aspeed->opb0_addr, base + OPB0_FSI_ADDR
    }

    writel(0x1, base + OPB_IRQ_CLEAR);
    writel(0x1, base + OPB_TRIGGER);

[which we could simplify with a helper function for the caching...]

However, if the aim is to just stage this to just the fullword reads for
now, this looks fine for me.

Cheers,


Jeremy

