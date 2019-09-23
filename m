Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 34962BAD77
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 07:27:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cCWN4kVDzDqLX
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 15:27:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="FGte+XEH"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cCVs0w2kzDqN3
 for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2019 15:27:00 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id u40so15674255qth.11
 for <openbmc@lists.ozlabs.org>; Sun, 22 Sep 2019 22:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D82Pn+oiyxZd3Jvz2nrbESa+J6BjYc35YgwCmrcCWQ0=;
 b=FGte+XEHuHWECPurKhz1UrsUKF+3GOsld+HQ0iWl4ammxbSIOo9zgWa4cwks6pDJDO
 Zn/A0xH/fN3GmC8oMx5Sa5WAygnjhDmQu/y3i/2XwTH4dOXOcgHE+UWgJBbpTozkGKKY
 2hOn4FC3OBh2r0MKXJ9RbiTcue44N3sw6FZ3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D82Pn+oiyxZd3Jvz2nrbESa+J6BjYc35YgwCmrcCWQ0=;
 b=jKxZl4F6w/h1cRRTxIcapkvhvyYG1MwG5zQ7dI0nNMoBlWN8JzyBkelOUvaRygpNC7
 eAATSmhjfHlyJxc7/F1qsRGCH5Bu4s0J42LEHdxNH6PP6MaLcyXP6tpB5qBxSrl8e0sM
 f14XvlW+Z9DOWTuIzs/a/Lvs0duyt/iRF7FlNzJuX16Yvapq1xWv+n0TMHCUH3afhAEx
 Zv1cnh/QVIcLTVkllozRPH4JA5u0wGVUMcIxers1Q+bZdKuEFsMcmjzfr1yYXHFEUci7
 Ny1V52U5T2yMjoJqfvg3mEs207RmzWI79sx9QwUlDkI8lC8DoY9yArVEx+gFO1mDUYLA
 Ilnw==
X-Gm-Message-State: APjAAAXR55UV1R5kW3c0SjN33ClfTDE98ZPnzzm1rpb1uTCT9n2PfW8Z
 /fjawz6Rbpu63e2aT+CjOWiEqAUmxhIXOuoPC+g=
X-Google-Smtp-Source: APXvYqxEGxuM/FPa9KclsbGHPt7qbsJQYHAAfWAp+WaIh/kNNBg1eib50oWWQ3AfLip21yJZ0mUZeSHRHsZjk1llj40=
X-Received: by 2002:ac8:2d8b:: with SMTP id p11mr15657158qta.220.1569216417419; 
 Sun, 22 Sep 2019 22:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190922123700.749-1-andrew@aj.id.au>
 <20190922123700.749-3-andrew@aj.id.au>
 <CACPK8Xf_ciMEtayQ78yUo=YhrovRMe65xuwviE+DWXDSuQb5-Q@mail.gmail.com>
 <96f5dc1d-2347-4d9c-8fa2-e938ac952664@www.fastmail.com>
In-Reply-To: <96f5dc1d-2347-4d9c-8fa2-e938ac952664@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 23 Sep 2019 05:26:46 +0000
Message-ID: <CACPK8XcQp-VcOz8N20fwURYK+4j-Nk7_ENqJVpAXu55hQxEkZA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.3 2/6] dt-bindings: net: ftgmac100: Describe
 clock properties
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 23 Sep 2019 at 05:14, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Mon, 23 Sep 2019, at 14:28, Joel Stanley wrote:
> > On Sun, 22 Sep 2019 at 12:36, Andrew Jeffery <andrew@aj.id.au> wrote:
> > >
> > > Critically, the AST2600 requires ungating the RMII RCLK if e.g. NCSI is
> > > in use.
> > >
> > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > > ---
> > >  Documentation/devicetree/bindings/net/ftgmac100.txt | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/net/ftgmac100.txt b/Documentation/devicetree/bindings/net/ftgmac100.txt
> > > index 04cc0191b7dd..c443b0b84be5 100644
> > > --- a/Documentation/devicetree/bindings/net/ftgmac100.txt
> > > +++ b/Documentation/devicetree/bindings/net/ftgmac100.txt
> > > @@ -24,6 +24,12 @@ Optional properties:
> > >  - no-hw-checksum: Used to disable HW checksum support. Here for backward
> > >    compatibility as the driver now should have correct defaults based on
> > >    the SoC.
> > > +- clocks: In accordance with the generic clock bindings. Must describe the MAC
> > > +  IP clock, and optionally an RMII RCLK gate for the AST2600.
> >
> > perhaps: "and optionally a RMII clock if RMII or NC-SI is used"
> >
> > We should implement this for the ast2500 too.
>
> Hmm, I didn't think to check because it has always worked, but I assume that's because u-boot was NCSI enabled and left the clocks ungated.

Yeah spot on. This is something we hit when doing bringup of the
ast2500 NCSI, and we "fixed" it by having u-boot enable the clocks.

>
> Will fix in a v2.

Cheers

>
> Thanks,
>
> Andrew
