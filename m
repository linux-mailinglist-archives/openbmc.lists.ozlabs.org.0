Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAD5A4CE57
	for <lists+openbmc@lfdr.de>; Mon,  3 Mar 2025 23:34:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6DBl1rNDz3cdD
	for <lists+openbmc@lfdr.de>; Tue,  4 Mar 2025 09:34:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741023776;
	cv=none; b=RA8tW2uU9dGxIpm+N6MGJV1Aq68RXQBfWfb+MTeu/V0UCKo0I4Smf5x7pVurvZCItjDjD+qjpS/9OPS6OLXD1sICWsZs7rAo/YVnlnbnj9cbPYSo+LpWQBBnzU4OTtRf2luJnXEkTPlOF9NbbaEfxiL7wKBoO9R8tHiilIaUzKNtA1CfdEbWbtldGf1fZhHzO8w7DapCTbMqufuYWJfo0lV1vb2aCFXvY0o8E9kpt8VbtUoVR04Dsag8tukPln3wUrpg6V0aWx+okg+Gt1sjykRO70odlfFNpfA7+g+N49tVgerGKJ9kDp8EkLe3PZR6elN1F178K4Nzyu8UAprPjg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741023776; c=relaxed/relaxed;
	bh=ylT2F2bQFbqh+w10uOgnxOb0qjDf8fOToCNdsGF6d/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F4iBtDEehz7Ln3+RjZoOf9alCKEMfkOwBlMS1G2gNQ1H60MhopOHVDqViEPHHhQVbwhe37JJNjdmgTOuf5BwfGuRW1nTYOa5TWjNiIKfgFa+IxcqbV6/sAop0kiK9Y9zz6jZiuUD0tJ1K0WXTcwAIKzNX0UY5+wUcIdIY8IPGsfQbWxP+ApajcoFKcpKr0P0tQNDPhe9M2Jocew0k7enIPtlp5EDU4AYQHdLSzsi2HAjsP2Mc+v6eKyA18JIYL7c3W2jZgpzbGvgxoziUPGWnmyVSf8/7s06ATnVprJhs9Qj4cyM/dpx5wxlTlgy87J/m/C353NVpzHB0+FnSEh5Iw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ObPnC0qu; dkim-atps=neutral; spf=pass (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ObPnC0qu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Tue, 04 Mar 2025 04:42:54 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z65kQ3wPTz2xgp
	for <openbmc@lists.ozlabs.org>; Tue,  4 Mar 2025 04:42:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741023774; x=1772559774;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=afGinfUwlGd9kB/M/zPUgOUnTWedTZevaW2r2iqNX28=;
  b=ObPnC0qu9OAGLPI/AEIonLVtsVtjaS829VaMde2oFV9SeItARePOk1PD
   tGDe6l3FuxyWgwiNLLEHBB+XddBsK2JmBVkYaj7XcxCpurAz3yGo8EPCZ
   GatxWsRtnY+d5SBZg9JEBmPXw2IX3LzIOdPGQk+RE8YcZ1YCnZpZJ6x9K
   05mB+sYO20B9HAl6bRTjOLKvweVUOzm1VfpG63RZ/zrEw3yfvvecPhCMk
   a27YV9EMNM21TBboIB0O1BXsKQkT3QZKJW8HTgqqFZShlNir8GEJzJEzR
   KWhV07NtzbxgONvFb4DNO16xVdTxxc8we2InwEx2uSvhyIM3Pp3B8vRFc
   w==;
X-CSE-ConnectionGUID: Hob9w/GBSlq9wZdLkkqwMQ==
X-CSE-MsgGUID: 2RDbtq/qT0ySTAZChfMQgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="29499200"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="29499200"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 09:41:36 -0800
X-CSE-ConnectionGUID: qcvfrF7PT7ynZ3tmoXN2Hw==
X-CSE-MsgGUID: t7ZDnc1NQjaIUBEwubB/tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="123052577"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 03 Mar 2025 09:41:28 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tp9nB-000ImI-1c;
	Mon, 03 Mar 2025 17:41:25 +0000
Date: Tue, 4 Mar 2025 01:41:01 +0800
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
Message-ID: <202503040154.I5tA9gE9-lkp@intel.com>
References: <20250221090918.1487689-3-j2anfernee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221090918.1487689-3-j2anfernee@gmail.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 04 Mar 2025 09:34:20 +1100
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
Cc: openbmc@lists.ozlabs.org, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Eason,

kernel test robot noticed the following build errors:

[auto build test ERROR on jic23-iio/togreg]
[also build test ERROR on linus/master v6.14-rc5 next-20250303]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eason-Yang/dt-bindings-iio-adc-add-NCT7201-ADCs/20250221-171244
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20250221090918.1487689-3-j2anfernee%40gmail.com
patch subject: [PATCH v4 2/2] iio: adc: add support for Nuvoton NCT7201
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250304/202503040154.I5tA9gE9-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250304/202503040154.I5tA9gE9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503040154.I5tA9gE9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iio/adc/nct7201.c:212:10: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     212 |                 *val = FIELD_GET(NCT7201_REG_VIN_MASK, volt);
         |                        ^
   drivers/iio/adc/nct7201.c:256:9: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     256 |         *val = FIELD_GET(NCT7201_REG_VIN_MASK, volt);
         |                ^
>> drivers/iio/adc/nct7201.c:278:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     278 |                              FIELD_PREP(NCT7201_REG_VIN_MASK, val));
         |                              ^
   3 errors generated.


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
