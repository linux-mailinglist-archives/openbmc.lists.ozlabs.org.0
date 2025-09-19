Return-Path: <openbmc+bounces-673-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0C3B8B3F7
	for <lists+openbmc@lfdr.de>; Fri, 19 Sep 2025 22:53:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cT4V574Hbz2yZ6;
	Sat, 20 Sep 2025 06:53:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758315213;
	cv=none; b=N0hiFBsHFtVD/kT15ldPgSJWpy8/Y5/xs2jvGaaNBfqLi3TuGwqKMiwUnGvj1Or4m1ZaWfoOoAHzQDLim9M3exKY2VYT4jfmt1XTj/GjGUkgOKYY7gC/iZaXDv2ePul/KVyOK/9LEM/9ecBrJJkZO2bOGpIXLMi2ALrQFhV5DXIsfbWer4C7Acxdgh+fp5n9f+OKtObF/M9zACPXkTmN6g5jK2vWXYhp9jibev5o1clHyiNGrHfBcPZf071mwEi2l+AvhRm99SxRu0Shi6OT/a4eEewhYqtZtDzPZr0716OAyqUPU5Ox5XWg5smov+cD7m9uh+ldcJKtlmO60yquNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758315213; c=relaxed/relaxed;
	bh=glOE5dMfucj+qnBmBQgUz3G1w2LwhX5scC5okr2TCTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=flIzoVsIRkzxX1QcGdFjaHHzR8H8yM4RNr4N/WgghZfqkEiwszBLTQ2zlI5nMiVeklxIocipfv+/JiTf05pCKY2EILv3zIjQ0IVb5oq5lvbvtS2xZmC2iBU8Wv1c4Ry0hXIyUevogFemUWupx7sGdfp/pT1oX2WGWXIxTbdMzVMPr/7mkg+idZGNDdP2Du+eHs/uFPMUgKakovFh7M0TUd0YqglEPtEGKdJKnmqyweUvqco+DpOdcR5emrMrNuZ3ouOHtgB2xwYhManFx7RcRZdA4LNYfo57m6LGLLgG30fMZFMVqSxMAK7QL021ZRW6mYLTdh+KLWqP0PaP9wk2Bg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cADIhg/4; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cADIhg/4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cT4V51LZWz2xQ4;
	Sat, 20 Sep 2025 06:53:33 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 141E260145;
	Fri, 19 Sep 2025 20:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97ABEC4CEF0;
	Fri, 19 Sep 2025 20:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758315210;
	bh=E1ZV+UNqR3veyxuHfX6mAzdM+m+4EnKUxmuyWi+TK24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cADIhg/49suBO/uC2IsFh0Z7L+funFZc48pMScM7SuZh2dhesxomGab/EsnPO8bdD
	 BeF+aZ1x7wBm0wJcNgRvxBhY+NZIzza1GoorjrVhGAnu0KMJU8BsAQTn7ZnrZ8cy/v
	 k2nEtYObhwAaQKGRaorlKhok+oho/mDNS94ZwHXxz3NqaOQv76rzs2SThvkFERpMSD
	 agfFoSpllXKFRxQBQ5PmodugBYh6s0bt/MmWq0QpygbEpo+3JczH8bcI0ASmFpVxk8
	 R2li5Bcz9H3VLWwBtpbG2PRrkEbZGjHH0SJa2xd1wasFzPTmaDC+Mvw8qZWv/QYP0y
	 Fwj2Hwaj1icUw==
Date: Fri, 19 Sep 2025 15:53:29 -0500
From: Rob Herring <robh@kernel.org>
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
	"benh@kernel.crashing.org" <benh@kernel.crashing.org>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"naresh.solanki@9elements.com" <naresh.solanki@9elements.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v18 1/3] dt-bindings: i2c: aspeed,i2c.yaml: add
 transfer-mode and global-regs properties and update example
Message-ID: <20250919205329.GA2192084-robh@kernel.org>
References: <20250820051832.3605405-1-ryan_chen@aspeedtech.com>
 <20250820051832.3605405-2-ryan_chen@aspeedtech.com>
 <9d6660f0bf5119cedee824cf764f15838622833a.camel@codeconstruct.com.au>
 <OS8PR06MB7541C0D6696FC754D944D45EF208A@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <03abda47219b8b0b476a3740c7ed2acc4b2b16dc.camel@codeconstruct.com.au>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03abda47219b8b0b476a3740c7ed2acc4b2b16dc.camel@codeconstruct.com.au>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Sep 15, 2025 at 11:41:31AM +0800, Jeremy Kerr wrote:
> Hi Ryan,
> 
> > > OK, but the ast2400 and ast2500 I2C peripherals - which this binding also
> > > describes - do not have that facility. Given the 2600 is a distinct peripheral (as
> > > discussed on the v16 series), this would seem to warrant a distinct binding.
> > > 
> > > Should this be split out into an ast2600-specific binding, to reflect that it is
> > > different hardware? The reference to the global registers and transfer modes
> > > would then be added only to the ast2600-i2c-bus binding.
> > 
> > I agree it would be cleaner to split out a new binding file specifically for AST2600,
> > for example: `aspeed,ast2600-i2c.yaml`
> > But also I think `aspeed,i2cv2.yaml` more better name, that compatible will 
> > support next generation such like AST2700 .....
> 
> The ship may have already sailed on that one, as you already have the
> existing compatible string describing existing hardware.
> 
> I would assume that the compatible string should be fixed for an
> instance of the specific hardware, but the DT maintainers may be able to
> provide some input/precedence on changing an existing binding, if
> necessary.
> 
> If this does get changed, I would expect that you would need a
> corresponding update in the old driver too.
> 
> Or, another option may be to keep the current generation ("v2 core with
> compat registers") as-is (ie., at ast2600-i2c-bus), and introduce a new
> string for the next - where the primary hardware change might be the
> removal of compat registers, but it's still new hardware

About the only place we use version numbers (without regret) is when the 
version can be traced back to the actual verilog. This is typically only 
IP targeted to FPGAs. The reality in SoCs is h/w designers can't help 
themselves to not change things. In reality, there are almost always 
some changes.

Rob

