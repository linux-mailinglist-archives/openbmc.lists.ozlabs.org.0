Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AFFF150B
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 12:26:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477PPk0CRczF5t9
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 22:26:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33;
 helo=metis.ext.pengutronix.de; envelope-from=p.zabel@pengutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=pengutronix.de
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477PNf1SqlzF5sm
 for <openbmc@lists.ozlabs.org>; Wed,  6 Nov 2019 22:25:52 +1100 (AEDT)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1iSJRW-0001jd-TJ; Wed, 06 Nov 2019 12:25:42 +0100
Message-ID: <aaada00902c84b9f375555ee98946631b7de3280.camel@pengutronix.de>
Subject: Re: [PATCH v4 3/3] reset: npcm: add NPCM reset controller driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 06 Nov 2019 12:25:42 +0100
In-Reply-To: <CAP6Zq1iYKKkcEKt-WW3sDRJ1ktWgQug9SQc2AF473fWnooUxeQ@mail.gmail.com>
References: <20191106095832.236766-1-tmaimon77@gmail.com>
 <20191106095832.236766-4-tmaimon77@gmail.com>
 <89250d485d05d4d671203ae615ebcf514b4d6705.camel@pengutronix.de>
 <CAP6Zq1iYKKkcEKt-WW3sDRJ1ktWgQug9SQc2AF473fWnooUxeQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: openbmc@lists.ozlabs.org
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tomer,

On Wed, 2019-11-06 at 13:14 +0200, Tomer Maimon wrote:
[...]
> On Wed, 6 Nov 2019 at 12:39, Philipp Zabel <p.zabel@pengutronix.de> wrote:
[...]
> > Is this npcm750 specific? If so, you could call it npcm750_usb_reset and
> > only call it if the compatible matches.
> 
> No, we will need it also in future BMC's

Ok, thank you for clarifying.

> > 
> > +{
> > > +     struct device_node *np = pdev->dev.of_node;
> > > +     u32 mdlr, iprst1, iprst2, iprst3;
> > > +     struct regmap *gcr_regmap = NULL;
> > > +     u32 ipsrst1_bits = 0;
> > > +     u32 ipsrst2_bits = NPCM_IPSRST2_USB_HOST;
> > > +     u32 ipsrst3_bits = 0;
> > > +
> > > +     if (of_device_is_compatible(np, "nuvoton,npcm750-reset")) {
> > 
> > Better use of_match_device(). Also see above, I think this check could
> > be done in probe() already?
> > 
> I will use  of_match_device. because the nuvoton,npcm750-reset used only at
> npcm_usb_reset and in the next BMC version we will need to get other
> reset device I prefer to leave it the  npcm_usb_reset function, is it O.K?

Yes, that is fine. I would store the GCR lookup compatible string in a
per-device const struct that is accessible through of_device_id->data.

> > > +             gcr_regmap =
> > syscon_regmap_lookup_by_compatible("nuvoton,npcm750-gcr");
> > > +             if (IS_ERR(gcr_regmap)) {
> > > +                     dev_err(&pdev->dev, "Failed to find
> > nuvoton,npcm750-gcr\n");
> > > +                     return PTR_ERR(gcr_regmap);
> > > +             }
> > > +     }
> > > +     if (!gcr_regmap)
> > > +             return -ENXIO;

^ This code could then be the same for all platforms.

regards
Philipp

