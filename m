Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 67ADCECF80
	for <lists+openbmc@lfdr.de>; Sat,  2 Nov 2019 16:32:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47532p3WhyzF4XV
	for <lists+openbmc@lfdr.de>; Sun,  3 Nov 2019 02:32:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ljIIfMR9"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47531k4fcNzDqV4
 for <openbmc@lists.ozlabs.org>; Sun,  3 Nov 2019 02:31:20 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id j30so4835533pgn.5
 for <openbmc@lists.ozlabs.org>; Sat, 02 Nov 2019 08:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6SMiS6mgXXdUrJczi5rxbHURmOIbfDYKt9jnZjMxdUM=;
 b=ljIIfMR9UU1LQGDy+T0m4/GOZpNG+pfMu1Z466VWG+4CGbgpsK1cIn1oKgpqamJ7hA
 Sb+GqdxMDT1TiHbcIOs7LFeFwWEmg1Xvbe5EsESRa8AykJ8+QFr6mi1OrUGg9FZuQlGB
 w0EZQNBd+r3yyxWvBDXuJUlkMBoKqfioosy4w93MmigoAwG00fRYB9/MrMV51cyGX5FV
 qlK/zyfTQHmu7fPtzwTOwwEiUV50nXfBXLFYDKyJgj8CdsEyjTA9y4fY+RHjSyJz8kzE
 4lbdv3hBoDM0nkr/k4RwfKRHd5UVrbRA1ytAAp4BIvtSLSG24UMaaXQU3klhJ57OuWCP
 2ErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=6SMiS6mgXXdUrJczi5rxbHURmOIbfDYKt9jnZjMxdUM=;
 b=YWLemBbnp1DZLnEvgXlcOpsEytMH3Zcz+mcnka+w20QhlI4dx29GuE8Hh42yqPexnv
 bdlNULTLY9hPYFuQLjPYMjxLAV6DaEiush7OLsUbqandR6iW9Mi/nZUTEQZqVpAK0HmB
 a917S+ogaPlYWeaa6WfVu7Yy7yDVFxhgPtXs9GUEgc+2I50VDHJrp3y+1858aGkrm5/8
 Q7SZEACB42m/ZtjHgDVrkCu5cDqeBqnCh9tjD7BOwf1QSPmoT10cYzmY7dneXbJ6nYRv
 7t758pgBKoPfsBl8fWMTGtfMGaUVtAka2Bed8T22LbVo/NqG6V6feq+wC6k1Qf734Qq5
 0Y9w==
X-Gm-Message-State: APjAAAW7M1+qBA21JJ0T2mcyUzqTsZd0BjzD8HU23xnDVr8L1zfNmasH
 mhdEb67a4HgIFwAIIw4q9KVyLa46
X-Google-Smtp-Source: APXvYqzzUiL8O/6XsZumWEGTrVbVXgZ9kPtXzC3z+zvYJ4g4uGthum08g9EKlHQCIKkYCILeDTZiYw==
X-Received: by 2002:a62:ce85:: with SMTP id y127mr18172312pfg.24.1572708676949; 
 Sat, 02 Nov 2019 08:31:16 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id k24sm9753324pgl.6.2019.11.02.08.31.16
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 02 Nov 2019 08:31:16 -0700 (PDT)
Date: Sat, 2 Nov 2019 08:31:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: rentao.bupt@gmail.com
Subject: Re: [PATCH v2 2/2] docs: hwmon: Document bel-pfe pmbus driver
Message-ID: <20191102153115.GA5205@roeck-us.net>
References: <20191029182054.32279-1-rentao.bupt@gmail.com>
 <20191029182054.32279-3-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191029182054.32279-3-rentao.bupt@gmail.com>
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

On Tue, Oct 29, 2019 at 11:20:54AM -0700, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> Add documentation for bel-pfe pmbus driver which supports BEL PFE1100 and
> PFE3000 power supplies.
> 
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>

Applied after adding bel-pfe to index.rst.

Thanks,
Guenter

> ---
>  No change in v2.
> 
>  Documentation/hwmon/bel-pfe.rst | 112 ++++++++++++++++++++++++++++++++
>  1 file changed, 112 insertions(+)
>  create mode 100644 Documentation/hwmon/bel-pfe.rst
> 
> diff --git a/Documentation/hwmon/bel-pfe.rst b/Documentation/hwmon/bel-pfe.rst
> new file mode 100644
> index 000000000000..4b4a7d67854c
> --- /dev/null
> +++ b/Documentation/hwmon/bel-pfe.rst
> @@ -0,0 +1,112 @@
> +Kernel driver bel-pfe
> +======================
> +
> +Supported chips:
> +
> +  * BEL PFE1100
> +
> +    Prefixes: 'pfe1100'
> +
> +    Addresses scanned: -
> +
> +    Datasheet: https://www.belfuse.com/resources/datasheets/powersolutions/ds-bps-pfe1100-12-054xa.pdf
> +
> +  * BEL PFE3000
> +
> +    Prefixes: 'pfe3000'
> +
> +    Addresses scanned: -
> +
> +    Datasheet: https://www.belfuse.com/resources/datasheets/powersolutions/ds-bps-pfe3000-series.pdf
> +
> +Author: Tao Ren <rentao.bupt@gmail.com>
> +
> +
> +Description
> +-----------
> +
> +This driver supports hardware monitoring for below power supply devices
> +which support PMBus Protocol:
> +
> +  * BEL PFE1100
> +
> +    1100 Watt AC to DC power-factor-corrected (PFC) power supply.
> +    PMBus Communication Manual is not publicly available.
> +
> +  * BEL PFE3000
> +
> +    3000 Watt AC/DC power-factor-corrected (PFC) and DC-DC power supply.
> +    PMBus Communication Manual is not publicly available.
> +
> +The driver is a client driver to the core PMBus driver. Please see
> +Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
> +
> +
> +Usage Notes
> +-----------
> +
> +This driver does not auto-detect devices. You will have to instantiate the
> +devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
> +details.
> +
> +Example: the following will load the driver for an PFE3000 at address 0x20
> +on I2C bus #1::
> +
> +	$ modprobe bel-pfe
> +	$ echo pfe3000 0x20 > /sys/bus/i2c/devices/i2c-1/new_device
> +
> +
> +Platform data support
> +---------------------
> +
> +The driver supports standard PMBus driver platform data.
> +
> +
> +Sysfs entries
> +-------------
> +
> +======================= =======================================================
> +curr1_label		"iin"
> +curr1_input		Measured input current
> +curr1_max               Input current max value
> +curr1_max_alarm         Input current max alarm
> +
> +curr[2-3]_label		"iout[1-2]"
> +curr[2-3]_input		Measured output current
> +curr[2-3]_max           Output current max value
> +curr[2-3]_max_alarm     Output current max alarm
> +
> +fan[1-2]_input          Fan 1 and 2 speed in RPM
> +fan1_target             Set fan speed reference for both fans
> +
> +in1_label		"vin"
> +in1_input		Measured input voltage
> +in1_crit		Input voltage critical max value
> +in1_crit_alarm		Input voltage critical max alarm
> +in1_lcrit               Input voltage critical min value
> +in1_lcrit_alarm         Input voltage critical min alarm
> +in1_max                 Input voltage max value
> +in1_max_alarm           Input voltage max alarm
> +
> +in2_label               "vcap"
> +in2_input               Hold up capacitor voltage
> +
> +in[3-8]_label		"vout[1-3,5-7]"
> +in[3-8]_input		Measured output voltage
> +in[3-4]_alarm           vout[1-2] output voltage alarm
> +
> +power[1-2]_label	"pin[1-2]"
> +power[1-2]_input        Measured input power
> +power[1-2]_alarm	Input power high alarm
> +
> +power[3-4]_label	"pout[1-2]"
> +power[3-4]_input	Measured output power
> +
> +temp[1-3]_input		Measured temperature
> +temp[1-3]_alarm         Temperature alarm
> +======================= =======================================================
> +
> +.. note::
> +
> +    - curr3, fan2, vout[2-7], vcap, pin2, pout2 and temp3 attributes only
> +      exist for PFE3000.
