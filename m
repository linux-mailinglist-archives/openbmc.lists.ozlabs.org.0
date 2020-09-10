Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE8E2639EF
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 04:15:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bn2XR1QBRzDqDL
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 12:15:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=Scp8KEq5; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=C8wmE0Ze; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bn2V34jHvzDqc1
 for <openbmc@lists.ozlabs.org>; Thu, 10 Sep 2020 12:12:59 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id A4DA95C00C9;
 Wed,  9 Sep 2020 22:12:56 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 09 Sep 2020 22:12:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=HckUuM4up1+hrv2p57Agpc2r033Xop1
 H6JnAlq3zBCU=; b=Scp8KEq5+XaNWIzu37zalER5/GfPwnWsWzBFti5s9JUxI10
 hQrJCy49sDfEp27lbGO8wcpv7CxmWoBaU9Oy/PCEoi0yUNu0eIURk68sLMLGUzoi
 9N/d5zk3MfRO5hiTpjGPiuSO82b6NX9e2i8C5wdXgDM/8bBAYVLmgd6hruERI2OD
 oCywMdn8R2ZPq6BFgikOMGrcDRieyA60pxZKIf2827kvJGbsSnzwcpSNNAlsKFC0
 /ux0Etc/WqKm/z4GysjIE4ChctSDGX7wxab3z78Kw5pu37Ocs2w7I7mTJRBJU5r4
 MnDix4ecAnCQWRGjB3MrpHU6jGYfJrSTiPEnY8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=HckUuM
 4up1+hrv2p57Agpc2r033Xop1H6JnAlq3zBCU=; b=C8wmE0Zea0bG/Bt8GaSfDu
 Rlwzj6x3tzrTmjKnzI+cbLG/EakziIC7s7Fyy9EWd306zcoqjpoZD9IGy8neGh3i
 r9kRgLkxNAKR86bkhXM9gvprLuxlPNmEzZP0yE4BPGrDr+tNgQRuBE9lt6Xy7p5J
 aUPII/xl6EQb8gHSGJJuMADQXN8xg5bSLwWaRG/VOAVeOVP4vB55TQLXE7siLthd
 UlJljhN8OnrMgZVJKP0ZkQDXiC/akXOyhcBW+omKTcf8lX9eKlI3g0JLqcpjMeYh
 fUOTZ5uOJQLDnnWr2YKC39XHf5pP7nhE8h3m6ePBFURwLlGfyqcXN4fryuwmzimg
 ==
X-ME-Sender: <xms:qItZX5WM5w6enPhs6qvO7yX49dJTnCL-aBeahzS81Dv8uTszTsf-AQ>
 <xme:qItZX5nVNnhkCsXvAugBA0SD5uImoKe61o_Svli1ZXL2hNd1S1OsdUmTWGW4Esr8p
 S315KM5NgD1Kot2JA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehiedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:qItZX1bArAFZacrRP9hUGq0qBEEN4VZOGfnT8zjA7dWYiTebE7Pb3g>
 <xmx:qItZX8WUhhMfF1y2RQQCgwW37xvW-f-x6vv-oFy3QRE3UkKyvI02qw>
 <xmx:qItZXzka1nGTmfJzAxeIYqairg07nR58UnHCw9Vi7TZ3aVAftT8KaQ>
 <xmx:qItZX4zV6pQG4Sw0faCDmFym-y3ZBRXnjDTmS1QAySeVMlHd0YGDag>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id AF09DE00A6; Wed,  9 Sep 2020 22:12:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-259-g88fbbfa-fm-20200903.003-g88fbbfa3
Mime-Version: 1.0
Message-Id: <9eea0291-f225-466a-ba01-df3210bd8ead@www.fastmail.com>
In-Reply-To: <4f2de881-1391-b1b1-18b3-8d3a06653da9@roeck-us.net>
References: <20200909132411.2906159-1-andrew@aj.id.au>
 <4f2de881-1391-b1b1-18b3-8d3a06653da9@roeck-us.net>
Date: Thu, 10 Sep 2020 11:42:34 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Guenter Roeck" <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (pmbus) Expose PEC debugfs attribute
Content-Type: text/plain
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
Cc: openbmc@lists.ozlabs.org, Jean Delvare <jdelvare@suse.com>,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 10 Sep 2020, at 01:01, Guenter Roeck wrote:
> On 9/9/20 6:24 AM, Andrew Jeffery wrote:
> > Enable runtime debug control of whether the PEC byte is exchanged with
> > the PMBus device.
> > 
> > Some manufacturers have asked for the PEC to be disabled as part of
> > debugging driver communication issues with devices.
> > 
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  drivers/hwmon/pmbus/pmbus_core.c | 39 ++++++++++++++++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> > 
> > diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> > index 44535add3a4a..51c8502b35e9 100644
> > --- a/drivers/hwmon/pmbus/pmbus_core.c
> > +++ b/drivers/hwmon/pmbus/pmbus_core.c
> > @@ -2346,6 +2346,42 @@ static int pmbus_debugfs_get_status(void *data, u64 *val)
> >  DEFINE_DEBUGFS_ATTRIBUTE(pmbus_debugfs_ops_status, pmbus_debugfs_get_status,
> >  			 NULL, "0x%04llx\n");
> >  
> > +static int pmbus_debugfs_get_pec(void *data, u64 *val)
> > +{
> > +	struct i2c_client *client = data;
> > +
> > +	*val = !!(client->flags & I2C_CLIENT_PEC);
> > +
> > +	return 0;
> > +}
> > +
> > +static int pmbus_debugfs_set_pec(void *data, u64 val)
> > +{
> > +	int rc;
> > +	struct i2c_client *client = data;
> > +
> > +	if (!val) {
> > +		client->flags &= ~I2C_CLIENT_PEC;
> > +		return 0;
> > +	}
> > +
> > +	if (val != 1)
> > +		return -EINVAL;
> > +
> > +	rc = i2c_smbus_read_byte_data(client, PMBUS_CAPABILITY);
> > +	if (rc < 0)
> > +		return rc;
> > +
> > +	if (!(rc & PB_CAPABILITY_ERROR_CHECK))
> > +		return -ENOTSUPP;
> 
> WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
> 
> > +
> > +	client->flags |= I2C_CLIENT_PEC;
> > +
> > +	return 0;
> > +}
> > +DEFINE_DEBUGFS_ATTRIBUTE(pmbus_debugfs_ops_pec, pmbus_debugfs_get_pec,
> > +			 pmbus_debugfs_set_pec, "0x%1llu\n");
> 
> ERROR: Prefixing 0x with decimal output is defective
> 
> (since the displayed value is a boolean, it is also quite useless).

Indeed. I overlooked running checkpatch, sorry for the noise.

I've sent v2 which checkpatch claims to be clean.

Andrew
