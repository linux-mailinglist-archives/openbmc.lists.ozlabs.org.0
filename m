Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66050A41239
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2025 00:20:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1KZT4sxrz3gCm
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2025 10:19:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740228614;
	cv=none; b=VxJ+qO7VGkdTCOA6dp0bBz9pcRBFyjNYgEjg52NZQ2NaafO16lSrXXjSO3uhwxuFNKNQHWRQDpzTkVzUwwuBAfKPfFEZnP0d8FmfONEoH8WIZttJ6ERp8+hHoDD2QxiDeGqy9Jf++Gwy7t+TM7D7M57tmTX3t1r/ahTyq+kulmP+kpUwq3GKK19Cwq1hVEpOt29cdlzzxd3zhgCQgsOjf2uyirK82lYR4jhzbfrpZpQRxCJLslR2A7wxY6Q5RaQ37RHQ94JavUwGVhiQ/NCCpfyrf/PYTELkuVtvdqw/e9ezrRghCMtIQyMT2p6l9olnlpy0Y1krVkn2dsJfggnRmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740228614; c=relaxed/relaxed;
	bh=63OS4abyOkMAe/BTrxq0fnfu4Vv0/u3AEYAM6x8mVRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGoNrMHdU6qJ36k+8TPwB4cOudgL+s0H3rR8tmC6ZZL+zU+yYhfYGbpgv53vFJsFt25xMDDMq5lH8GLvVUTm+yewgrewfPVbYNT9u0XBbbA5dBFX87CikQ+Hgcf4TP9HKua8DdoTjQVQsKz5mjKRRHMdAb1ZU12mqD6e92Oho04wNIoM8K2IV5GDMxKwkuTa5q+xJQPHmzEIdM0anTl/zbpWrkG5NzB/kKMqD7ne+5Bmf/QV25B6rif2Ur+dZVt4T0TsHI4P2ERyjTpKCwMK90RoOPOnkoyNYSFeNd6FJU0mCFRxZ29WadkSGvBZ/zGd/ADXQvfOL5h3ZsEL+pVREg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jD8NTBIO; dkim-atps=neutral; spf=pass (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jD8NTBIO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 62 seconds by postgrey-1.37 at boromir; Sat, 22 Feb 2025 23:50:12 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z0Rfr3wkQz2y8W
	for <openbmc@lists.ozlabs.org>; Sat, 22 Feb 2025 23:50:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740228613; x=1771764613;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=798NgMCLrORlrXdOiB4bVXReEEKYsrbFICshl3jALIE=;
  b=jD8NTBIOB1ojrE5nMX0IvzLz7IgEpgex995PyIMH48fhimMwiQBrgF+1
   8rF4tTSkYelnIROGBmQi6H0isGEN/jO0H6SSSqa+OKh/nDQ2kVI8oQZAK
   x2ufwn4omi/T7l7KgmjaQ5mEaP1/S7mr8O0rJ0vTdPdTfY2ySX1rEpfvx
   JsL6CwziGEsKFqXfIQAwKjkdGQOcmYTyRmlUaXyiS5oB0vsrf/gwchzVJ
   ub2SVoQLiXVuEHusbrV9rVryGFChGjtFIGNkAPtRIszCAl1fdbj4mFl0U
   L5lGW7pkyFbjDzpoMyBwj/xR7bhWTC396R/+/ExVMv8QgA0nKsL38aZzR
   Q==;
X-CSE-ConnectionGUID: odmH1cZGSKC1DPS5SOR2vw==
X-CSE-MsgGUID: 14hQLtAUSLad2d28FsBMTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="51254647"
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="51254647"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 04:49:04 -0800
X-CSE-ConnectionGUID: S9BkAu39TJ2OLOmqvM+e3w==
X-CSE-MsgGUID: 0SAy3QrSTqy9USmdsmE6Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="116138775"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 22 Feb 2025 04:48:57 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlowB-0006ZP-06;
	Sat, 22 Feb 2025 12:48:55 +0000
Date: Sat, 22 Feb 2025 20:48:15 +0800
From: kernel test robot <lkp@intel.com>
To: Eason Yang <j2anfernee@gmail.com>, avifishman70@gmail.com,
	tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
	yuenn@google.com, benjaminfair@google.com, jic23@kernel.org,
	lars@metafoo.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nuno.sa@analog.com, dlechner@baylibre.com,
	javier.carrasco.cruz@gmail.com, andriy.shevchenko@linux.intel.com,
	gstols@baylibre.com, olivier.moysan@foss.st.com,
	mitrutzceclan@gmail.com, tgamblin@baylibre.com,
	matteomartelli3@gmail.com, marcelo.schmitt@analog.com,
	alisadariana@gmail.com, joao.goncalves@toradex.com,
	thomas.bonnefille@bootlin.com, ramona.nechita@analog.com,
	herve.codina@bootlin.com, chanh@os.amperecomputing.com,
	KWLIU@nuvoton.com, yhyang2@nuvoton.com
Subject: Re: [PATCH v4 2/2] iio: adc: add support for Nuvoton NCT7201
Message-ID: <202502222047.beX8h1H7-lkp@intel.com>
References: <20250221090918.1487689-3-j2anfernee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221090918.1487689-3-j2anfernee@gmail.com>
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 24 Feb 2025 10:18:50 +1100
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
Cc: openbmc@lists.ozlabs.org, oe-kbuild-all@lists.linux.dev
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Eason,

kernel test robot noticed the following build errors:

[auto build test ERROR on jic23-iio/togreg]
[also build test ERROR on linus/master v6.14-rc3 next-20250221]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eason-Yang/dt-bindings-iio-adc-add-NCT7201-ADCs/20250221-171244
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20250221090918.1487689-3-j2anfernee%40gmail.com
patch subject: [PATCH v4 2/2] iio: adc: add support for Nuvoton NCT7201
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250222/202502222047.beX8h1H7-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502222047.beX8h1H7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502222047.beX8h1H7-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iio/adc/nct7201.c: In function 'nct7201_read_raw':
>> drivers/iio/adc/nct7201.c:212:24: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     212 |                 *val = FIELD_GET(NCT7201_REG_VIN_MASK, volt);
         |                        ^~~~~~~~~
   drivers/iio/adc/nct7201.c: In function 'nct7201_write_event_value':
>> drivers/iio/adc/nct7201.c:278:30: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     278 |                              FIELD_PREP(NCT7201_REG_VIN_MASK, val));
         |                              ^~~~~~~~~~


vim +/FIELD_GET +212 drivers/iio/adc/nct7201.c

   192	
   193	static int nct7201_read_raw(struct iio_dev *indio_dev,
   194				    struct iio_chan_spec const *chan,
   195				    int *val, int *val2, long mask)
   196	{
   197		u16 volt;
   198		unsigned int value;
   199		int err;
   200		struct nct7201_chip_info *chip = iio_priv(indio_dev);
   201	
   202		if (chan->type != IIO_VOLTAGE)
   203			return -EOPNOTSUPP;
   204	
   205		guard(mutex)(&chip->access_lock);
   206		switch (mask) {
   207		case IIO_CHAN_INFO_RAW:
   208			err = regmap_read(chip->regmap16, NCT7201_REG_VIN(chan->address), &value);
   209			if (err < 0)
   210				return err;
   211			volt = value;
 > 212			*val = FIELD_GET(NCT7201_REG_VIN_MASK, volt);
   213			return IIO_VAL_INT;
   214		case IIO_CHAN_INFO_SCALE:
   215			/* From the datasheet, we have to multiply by 0.0004995 */
   216			*val = 0;
   217			*val2 = 499500;
   218			return IIO_VAL_INT_PLUS_NANO;
   219		default:
   220			return -EINVAL;
   221		}
   222	}
   223	
   224	static int nct7201_read_event_value(struct iio_dev *indio_dev,
   225					    const struct iio_chan_spec *chan,
   226					    enum iio_event_type type,
   227					    enum iio_event_direction dir,
   228					    enum iio_event_info info,
   229					    int *val, int *val2)
   230	{
   231		struct nct7201_chip_info *chip = iio_priv(indio_dev);
   232		u16 volt;
   233		unsigned int value;
   234		int err;
   235	
   236		if (chan->type != IIO_VOLTAGE)
   237			return -EOPNOTSUPP;
   238	
   239		if (info != IIO_EV_INFO_VALUE)
   240			return -EINVAL;
   241	
   242		if (dir == IIO_EV_DIR_FALLING) {
   243			err = regmap_read(chip->regmap16, NCT7201_REG_VIN_LOW_LIMIT(chan->address),
   244					  &value);
   245			if (err < 0)
   246				return err;
   247			volt = value;
   248		} else {
   249			err = regmap_read(chip->regmap16, NCT7201_REG_VIN_HIGH_LIMIT(chan->address),
   250					  &value);
   251			if (err < 0)
   252				return err;
   253			volt = value;
   254		}
   255	
   256		*val = FIELD_GET(NCT7201_REG_VIN_MASK, volt);
   257	
   258		return IIO_VAL_INT;
   259	}
   260	
   261	static int nct7201_write_event_value(struct iio_dev *indio_dev,
   262					     const struct iio_chan_spec *chan,
   263					     enum iio_event_type type,
   264					     enum iio_event_direction dir,
   265					     enum iio_event_info info,
   266					     int val, int val2)
   267	{
   268		struct nct7201_chip_info *chip = iio_priv(indio_dev);
   269	
   270		if (chan->type != IIO_VOLTAGE)
   271			return -EOPNOTSUPP;
   272	
   273		if (info != IIO_EV_INFO_VALUE)
   274			return -EOPNOTSUPP;
   275	
   276		if (dir == IIO_EV_DIR_FALLING)
   277			regmap_write(chip->regmap16, NCT7201_REG_VIN_LOW_LIMIT(chan->address),
 > 278				     FIELD_PREP(NCT7201_REG_VIN_MASK, val));
   279		else
   280			regmap_write(chip->regmap16, NCT7201_REG_VIN_HIGH_LIMIT(chan->address),
   281				     FIELD_PREP(NCT7201_REG_VIN_MASK, val));
   282	
   283		return 0;
   284	}
   285	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
