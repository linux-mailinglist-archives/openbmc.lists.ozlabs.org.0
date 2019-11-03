Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 770A3ED1BD
	for <lists+openbmc@lfdr.de>; Sun,  3 Nov 2019 05:45:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 475NfR0LKVzF6ZY
	for <lists+openbmc@lfdr.de>; Sun,  3 Nov 2019 15:45:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="olC2ceUK"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 475Ndb6JdvzF6V7
 for <openbmc@lists.ozlabs.org>; Sun,  3 Nov 2019 15:45:06 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id v19so9882148pfm.3
 for <openbmc@lists.ozlabs.org>; Sat, 02 Nov 2019 21:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GL01rhxmBnK4Gz7D2X/Hg/HT/Hp846VpWEX1h6YqSe0=;
 b=olC2ceUKmmTNr69dJvXYONyXDaPJk2XHpK10lPOt7WyieEVP+1Q7tQ+3Uak1x2Ymte
 vUnHNvhX2dREl9b2tqyeXj3xAtbiwG9w3je6l6XZ586dsnFrHpLcbu/fRCJV6kw+7o3r
 H0GhlBmJs7k/3efKcfyMsCmJ6m4yYnHcszhAh6MOmGqDNcyomvD88mdO6TVXpDHV0v0s
 n3HhY+VvT5Xlc7kQFBUItyKASFx3AN5om9J71HtV3dXqynXRiG7uTl3ORpFGyWVhbd5S
 uu0ENOQdfA4hLi9XEdlNdIA6vDbUmyyhdAnnuatr/riLKc9HZdGSb8Bq838B3zbThY+d
 aA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GL01rhxmBnK4Gz7D2X/Hg/HT/Hp846VpWEX1h6YqSe0=;
 b=HseuIlouFTDzLQWg63yW+M2+vAb1261xfa+Wb3wmTPEpLydGXOiZLq7o35vTpJCqbw
 c+kjHJtvknmMO4/0DQc1pEwlZYkQGcIFWEOLV5JCRfD7o4eE/hH8Tz3s5S5vH7n7YPjw
 QjuYMTqpWfdmZVnuZKbnN+V7SCaIJMcXySTgcJO38r6QxPch5WRfNj/xXr3GHzgDgmYq
 s0WwS1Q4jKOk9hPCkq9B3drsqm0mPMXi+CDdqhkvgQMXAkIVxfGI9ppMuRZXJOl+x4Pd
 oRJOiCTV99zQAQJECh/lqEHEBY8VK2vmPiaqYS3JPVjis/c9I4FZZ9H7UjH76dHUB1DK
 KC2w==
X-Gm-Message-State: APjAAAXxwijoLUoOHyIQXsx+ppHtMjZiPl8QJNAauy4Ve/+r2gyLw7lq
 hsX4Pm8iM43STHHaiihEyVk=
X-Google-Smtp-Source: APXvYqwkqGNo/BCVYzdcEsNB9WDWjv8KKEwvpu5YJChb2Vzl8fu8tcPpSGd3KmwNMBDYm2yroteIuw==
X-Received: by 2002:a63:e84d:: with SMTP id a13mr21142178pgk.226.1572756303000; 
 Sat, 02 Nov 2019 21:45:03 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-24-4-25-55.hsd1.ca.comcast.net.
 [24.4.25.55])
 by smtp.gmail.com with ESMTPSA id d9sm11209422pgc.80.2019.11.02.21.45.01
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 02 Nov 2019 21:45:02 -0700 (PDT)
Date: Sat, 2 Nov 2019 21:44:52 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 2/2] docs: hwmon: Document bel-pfe pmbus driver
Message-ID: <20191103044432.GA3364@taoren-ubuntu-R90MNF91>
References: <20191029182054.32279-1-rentao.bupt@gmail.com>
 <20191029182054.32279-3-rentao.bupt@gmail.com>
 <20191102153115.GA5205@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191102153115.GA5205@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 linux-doc@vger.kernel.org, taoren@fb.com, openbmc@lists.ozlabs.org,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Nov 02, 2019 at 08:31:15AM -0700, Guenter Roeck wrote:
> On Tue, Oct 29, 2019 at 11:20:54AM -0700, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> > 
> > Add documentation for bel-pfe pmbus driver which supports BEL PFE1100 and
> > PFE3000 power supplies.
> > 
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> 
> Applied after adding bel-pfe to index.rst.
> 
> Thanks,
> Guenter

Thank you Guenter. I didn't know index.rst needs to be updated; will
do it for my future doc patches.


Cheers,

Tao

> > ---
> >  No change in v2.
> > 
> >  Documentation/hwmon/bel-pfe.rst | 112 ++++++++++++++++++++++++++++++++
> >  1 file changed, 112 insertions(+)
> >  create mode 100644 Documentation/hwmon/bel-pfe.rst
> > 
> > diff --git a/Documentation/hwmon/bel-pfe.rst b/Documentation/hwmon/bel-pfe.rst
> > new file mode 100644
> > index 000000000000..4b4a7d67854c
> > --- /dev/null
> > +++ b/Documentation/hwmon/bel-pfe.rst
> > @@ -0,0 +1,112 @@
> > +Kernel driver bel-pfe
> > +======================
> > +
> > +Supported chips:
> > +
> > +  * BEL PFE1100
> > +
> > +    Prefixes: 'pfe1100'
> > +
> > +    Addresses scanned: -
> > +
> > +    Datasheet: https://www.belfuse.com/resources/datasheets/powersolutions/ds-bps-pfe1100-12-054xa.pdf
> > +
> > +  * BEL PFE3000
> > +
> > +    Prefixes: 'pfe3000'
> > +
> > +    Addresses scanned: -
> > +
> > +    Datasheet: https://www.belfuse.com/resources/datasheets/powersolutions/ds-bps-pfe3000-series.pdf
> > +
> > +Author: Tao Ren <rentao.bupt@gmail.com>
> > +
> > +
> > +Description
> > +-----------
> > +
> > +This driver supports hardware monitoring for below power supply devices
> > +which support PMBus Protocol:
> > +
> > +  * BEL PFE1100
> > +
> > +    1100 Watt AC to DC power-factor-corrected (PFC) power supply.
> > +    PMBus Communication Manual is not publicly available.
> > +
> > +  * BEL PFE3000
> > +
> > +    3000 Watt AC/DC power-factor-corrected (PFC) and DC-DC power supply.
> > +    PMBus Communication Manual is not publicly available.
> > +
> > +The driver is a client driver to the core PMBus driver. Please see
> > +Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
> > +
> > +
> > +Usage Notes
> > +-----------
> > +
> > +This driver does not auto-detect devices. You will have to instantiate the
> > +devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
> > +details.
> > +
> > +Example: the following will load the driver for an PFE3000 at address 0x20
> > +on I2C bus #1::
> > +
> > +	$ modprobe bel-pfe
> > +	$ echo pfe3000 0x20 > /sys/bus/i2c/devices/i2c-1/new_device
> > +
> > +
> > +Platform data support
> > +---------------------
> > +
> > +The driver supports standard PMBus driver platform data.
> > +
> > +
> > +Sysfs entries
> > +-------------
> > +
> > +======================= =======================================================
> > +curr1_label		"iin"
> > +curr1_input		Measured input current
> > +curr1_max               Input current max value
> > +curr1_max_alarm         Input current max alarm
> > +
> > +curr[2-3]_label		"iout[1-2]"
> > +curr[2-3]_input		Measured output current
> > +curr[2-3]_max           Output current max value
> > +curr[2-3]_max_alarm     Output current max alarm
> > +
> > +fan[1-2]_input          Fan 1 and 2 speed in RPM
> > +fan1_target             Set fan speed reference for both fans
> > +
> > +in1_label		"vin"
> > +in1_input		Measured input voltage
> > +in1_crit		Input voltage critical max value
> > +in1_crit_alarm		Input voltage critical max alarm
> > +in1_lcrit               Input voltage critical min value
> > +in1_lcrit_alarm         Input voltage critical min alarm
> > +in1_max                 Input voltage max value
> > +in1_max_alarm           Input voltage max alarm
> > +
> > +in2_label               "vcap"
> > +in2_input               Hold up capacitor voltage
> > +
> > +in[3-8]_label		"vout[1-3,5-7]"
> > +in[3-8]_input		Measured output voltage
> > +in[3-4]_alarm           vout[1-2] output voltage alarm
> > +
> > +power[1-2]_label	"pin[1-2]"
> > +power[1-2]_input        Measured input power
> > +power[1-2]_alarm	Input power high alarm
> > +
> > +power[3-4]_label	"pout[1-2]"
> > +power[3-4]_input	Measured output power
> > +
> > +temp[1-3]_input		Measured temperature
> > +temp[1-3]_alarm         Temperature alarm
> > +======================= =======================================================
> > +
> > +.. note::
> > +
> > +    - curr3, fan2, vout[2-7], vcap, pin2, pout2 and temp3 attributes only
> > +      exist for PFE3000.
