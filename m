Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A9733EDC
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 08:14:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45J1qK5q3YzDqRC
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 16:14:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::142; helo=mail-it1-x142.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="O/DwmIQP"; 
 dkim-atps=neutral
Received: from mail-it1-x142.google.com (mail-it1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45J1pv0S3FzDqPk
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jun 2019 16:14:28 +1000 (AEST)
Received: by mail-it1-x142.google.com with SMTP id h11so30505537itf.5
 for <openbmc@lists.ozlabs.org>; Mon, 03 Jun 2019 23:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mpV+ZLe1Y/pV6FsmPy/Hsmr8nazSfBYPF/FYxcvhXhw=;
 b=O/DwmIQPBDIPzjwyL9JSCCCs2p/EtplyKCC20zuHO0dm833GLj8N3ewOJQclezpH0R
 ZoN1urGpPwl9NEpwrhFMWXUOfVpemmbQiTLulxzL2A2RhGkzlRY5VJAvjSBpE86o1gkC
 L3LiCOrHQfo1vO4jscFmXGHETwE3WANMjo6J2iAPwi8ggiNCkhLhf6pkkfT47UfP6oy6
 f2R0fBD4IdkEA2sKsrxi1M7czswxyvVYzbAboyWLlQueRdKYxMPlST+/2ERCkEZTDZg6
 VejOlNuPrCZB4c78Nnd5PRao7CP2r6T/KLO1Z81YCoZgogDu1F6ckgfOVMXOYl7yj5PS
 nLaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mpV+ZLe1Y/pV6FsmPy/Hsmr8nazSfBYPF/FYxcvhXhw=;
 b=Rphbhdp8vwwPZTmBXnE31VAqPk2eSw3fjb8zMER0loxZezjqwFJR/Srk1qZ6/SRjuB
 a/0SdRCTlMCqH7ibBLN98heoTd6a1lIjHTtstYdMQ9KOjvFRZH0FXGWYViYAxaukLTfb
 KKeW2lst3MpXTkgf7Vy+oQC8tWhKAa22aOd4CzjH5TLdWWyJBFINHf5GenX9hCjFBLQb
 S4GxnQBhBz8bnMmtLVpK8uE/dAB9+KIOPt1ZgiLvZefAXh0W5mGF+K7++NsqQ2Z45has
 bjWHRxpP4Dhs1mjrJxDYimI5PyL5RrHJ8Iqx7fHEXOYHrrssULwoGw0/63HRqR+BtzKx
 WGOw==
X-Gm-Message-State: APjAAAXgZ1hGo9KyBchj7GMgMcDdebjUWfKBumMR+flkwu1Gpntz4HZ9
 eaT+xu9PabBpmUq0ytYlQEQ9mwZKyNirtHp6SHk=
X-Google-Smtp-Source: APXvYqzS3jwKCwk/umYAxKFFeDfgAPzZpyp0FAipe2DJGulCx+yBszMTdcmCUYb6hHU0qq+n6pwLJkhfLztu8Czenpk=
X-Received: by 2002:a24:2855:: with SMTP id h82mr13134280ith.15.1559628865436; 
 Mon, 03 Jun 2019 23:14:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190603055714.7203-1-oohall@gmail.com>
 <e546c15f-07a9-656a-ce11-4f9a24795d9a@linux.ibm.com>
In-Reply-To: <e546c15f-07a9-656a-ce11-4f9a24795d9a@linux.ibm.com>
From: Oliver <oohall@gmail.com>
Date: Tue, 4 Jun 2019 16:14:13 +1000
Message-ID: <CAOSf1CE5J93rai-VcZJJWkU=N=1=STtV2XqKQh_yLvQpXBKkHw@mail.gmail.com>
Subject: Re: [PATCH] i2c: fsi: Create busses for all ports
To: Eddie James <eajames@linux.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-i2c@vger.kernel.org,
 Eddie James <eajames@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jun 4, 2019 at 12:15 AM Eddie James <eajames@linux.ibm.com> wrote:
>
>
> On 6/3/19 12:57 AM, Oliver O'Halloran wrote:
> > Currently we only create an I2C bus for the ports listed in the
> > device-tree for that master. There's no real reason for this since
> > we can discover the number of ports the master supports by looking
> > at the port_max field of the status register.
> >
> > This patch re-works the bus add logic so that we always create buses
> > for each port, unless the bus is marked as unavailable in the DT. This
> > is useful since it ensures that all the buses provided by the CFAM I2C
> > master are accessible to debug tools.
> >
> > Cc: Eddie James <eajames@linux.vnet.ibm.com>
> > Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> > ---
> >   drivers/i2c/busses/i2c-fsi.c | 30 +++++++++++++++++++++++++-----
> >   1 file changed, 25 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
> > index 1e2be2219a60..59a76c6e31ad 100644
> > --- a/drivers/i2c/busses/i2c-fsi.c
> > +++ b/drivers/i2c/busses/i2c-fsi.c
> > @@ -658,13 +658,27 @@ static const struct i2c_algorithm fsi_i2c_algorithm = {
> >       .functionality = fsi_i2c_functionality,
> >   };
> >

> > +static device_node *fsi_i2c_find_port_of_node(struct device_node *master,
> > +                                           int port)

Turns out I had a pile of compile fixes staged but not committed so
this patch is totally broken. Oops.

> > +{
> > +     struct device_node *np;
> > +
> > +     for_each_child_of_node(fsi, np) {
> > +             rc = of_property_read_u32(np, "reg", &port_no);
> > +             if (!rc && port_no == port)
> > +                     return np;
> > +     }
> > +
> > +     return NULL;
> > +}
> > +
> >   static int fsi_i2c_probe(struct device *dev)
> >   {
> >       struct fsi_i2c_master *i2c;
> >       struct fsi_i2c_port *port;
> >       struct device_node *np;
> > +     u32 port_no, ports, stat;
> >       int rc;
> > -     u32 port_no;
> >
> >       i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
> >       if (!i2c)
> > @@ -678,10 +692,16 @@ static int fsi_i2c_probe(struct device *dev)
> >       if (rc)
> >               return rc;
> >
> > -     /* Add adapter for each i2c port of the master. */
> > -     for_each_available_child_of_node(dev->of_node, np) {
> > -             rc = of_property_read_u32(np, "reg", &port_no);
> > -             if (rc || port_no > USHRT_MAX)
> > +     rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &state);
> > +     if (rc)
> > +             return rc;
> > +
> > +     ports = FIELD_GET(I2C_STAT_MAX_PORT, stat);
> > +     dev_dbg(dev, "I2C master has %d ports\n", ports);
>
>
> Thanks for the patch Oliver. This looks great except some older CFAM
> types don't report the max port number, in which case this would not
> probe up any ports. So we probably need a fallback to dts if the max
> ports is 0.

Hmm, The oldest CFAM spec I could find was v1.2 which is from the p6
era and it includes the MAX_PORT field. When I was checking the spec I
noticed that I mis-interpreted the meaning of MAX_PORT. It's actually
the largest value you can write into the port field of the mode
register rather than the number of ports the master supports. So zero
is a valid value for MAX_PORT that you would see if the master only
has one port.

Do you know if the old masters only had one port? If not, do you know
what version (from the ext status reg) of the master doesn't support
the max_port field?


> Thanks,
>
> Eddie
>
>
> > +
> > +     for (port_no = 0; port_no < ports; port_no++) {
> > +             np = fsi_i2c_find_port_of_node(dev.of_node, port_no);
> > +             if (np && !of_device_is_available(np))
> >                       continue;
> >
> >               port = kzalloc(sizeof(*port), GFP_KERNEL);
