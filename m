Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8509BF917
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2024 23:18:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkKMQ2DYQz3d2x
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2024 09:17:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730896383;
	cv=none; b=SGnxGt3AUg5VSPOCpOUQu3ZhWSQvO/c0W1ylZwBLagdH5gOs+iSuwM3U57iUromxdnGUkvZ0iDrSK7ffVPN7OyyVRaGJmGglfof2XqdBpL9nmLKQAkgfT56ydME0Yp0WU/KViYjrEe86D53gBO95LWTm4/qwOml4tncx1zzPa1KB5haaQ+R3WodaBTUHouPrwAZqW16l1cSgZ8nVL0TmmiLHZbQCetmjWWD4k8OGh95mjPlWWKspeY/b4QkYvmsGKuNSdYY9jyupmYjVj+0rqMIiKCaLxClDt1wkRdt3qpcrUSgqby59a5zbLBoXKA3CuEJyOPDTgkxKJVgk6aI3fA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730896383; c=relaxed/relaxed;
	bh=PA0L3NM+BnglaQ0CVxNKAjR6lD5vkany98rVJqBUHf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HXidXvvQ0UsYC/l1P07KIbkuWsMdA8eJujJbmO1sPwPhq+zgJEN4mSbwhDXwNryVV5HowczWaLme/kejzTN4pz3Usas915GMZv7iYmzAi+IvEUKYST44OVb3RauzPIHmDxaJh4rfaLqVYT4KVfxvi8abwiXCDqar8064I1WSuI5vm0M5ciSElNg11UduMK8SOnborhCQYF6eYERMCxKYs80we9ZCrOVawCVa6TXjo5wK3PVjyusdb0lsMG5ORWt5iCUqKKAt2O8dKlx62iohduN5gJL+/JYRd8Wm+U4REMAG/4O2hP5cdlwtsZsAvHdpxKtdCuqwY5gAh36yXS1gHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HOO2JeVk; dkim-atps=neutral; spf=pass (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HOO2JeVk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xk4Nr2jtHz2yGM
	for <openbmc@lists.ozlabs.org>; Wed,  6 Nov 2024 23:32:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730896380; x=1762432380;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pAaxQ9Gjz6nuJzTKxrooqmYKq2ChzragGuK0hhgnAHs=;
  b=HOO2JeVkdIuhRRgzqYC2M4TF0egSx17Abn6MMSb+qu0uT2Lzj80AmMay
   X8lOszH0IU1qp0VohTrwGd/usvbNVVs27IfslW1imnYX1eDBl94Om9NNL
   zeGu8uu51YlBbjgrlxFWFWt942AXfN+T6v9rbnc1DEgU0fRXhpIIrO/3V
   Rvz67jB4LV/ZXLB+AJglk4tnxwIVZ47w/mmk16ZkDz8W4kA947VgodDWk
   7d3URcCP90qhhuT8qffm0hB9Atb1YF1Xe5Qbm6c6HyCpKyjJ5cxMKfCQs
   R6HxJn96Du1ZA0cO6iwoKOZ+kJ6dAJJQVbkaIvEEtS9fram2y9OvfHDJw
   w==;
X-CSE-ConnectionGUID: OMeFdlMXTAONbqGega2AFQ==
X-CSE-MsgGUID: pPS0Yj2ORxuBA3NyS0Lzxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30796858"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="30796858"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 04:32:54 -0800
X-CSE-ConnectionGUID: K2WuBYXxT2Oz0PvRjM0onQ==
X-CSE-MsgGUID: OehlV23PTxyEfmktAHBvXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="122042036"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Nov 2024 04:31:34 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8fC7-000neY-2J;
	Wed, 06 Nov 2024 12:31:31 +0000
Date: Wed, 6 Nov 2024 20:30:54 +0800
From: kernel test robot <lkp@intel.com>
To: Eason Yang <j2anfernee@gmail.com>, avifishman70@gmail.com,
	tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
	yuenn@google.com, benjaminfair@google.com, jic23@kernel.org,
	lars@metafoo.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nuno.sa@analog.com, dlechner@baylibre.com,
	javier.carrasco.cruz@gmail.com, andy@kernel.org,
	marcelo.schmitt@analog.com, olivier.moysan@foss.st.com,
	mitrutzceclan@gmail.com, matteomartelli3@gmail.com,
	alisadariana@gmail.com, joao.goncalves@toradex.com,
	marius.cristea@microchip.com, mike.looijmans@topic.nl,
	chanh@os.amperecomputing.com, KWLIU@nuvoton.com,
	yhyang2@nuvoton.com
Subject: Re: [PATCH v1 2/2] iio: adc: add Nuvoton NCT720x ADC driver
Message-ID: <202411062051.TLRkJSSL-lkp@intel.com>
References: <20241106023916.440767-3-j2anfernee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106023916.440767-3-j2anfernee@gmail.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 07 Nov 2024 09:17:12 +1100
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
Cc: devicetree@vger.kernel.org, linux-iio@vger.kernel.org, openbmc@lists.ozlabs.org, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Eason,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on linus/master v6.12-rc6 next-20241106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eason-Yang/dt-bindings-iio-adc-Add-binding-for-Nuvoton-NCT720x-ADCs/20241106-104046
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20241106023916.440767-3-j2anfernee%40gmail.com
patch subject: [PATCH v1 2/2] iio: adc: add Nuvoton NCT720x ADC driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241106/202411062051.TLRkJSSL-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411062051.TLRkJSSL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411062051.TLRkJSSL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iio/adc/nct720x.c:9:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iio/adc/nct720x.c:526:16: warning: cast to smaller integer type 'enum nct720x_chips' from 'const void *' [-Wvoid-pointer-to-enum-cast]
     526 |                 chip->type = (enum nct720x_chips)device_get_match_data(&client->dev);
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 warnings generated.


vim +526 drivers/iio/adc/nct720x.c

   511	
   512	static int nct720x_probe(struct i2c_client *client)
   513	{
   514		const struct i2c_device_id *id = i2c_client_get_device_id(client);
   515		struct nct720x_chip_info *chip;
   516		struct iio_dev *indio_dev;
   517		int ret;
   518		u32 tmp;
   519	
   520		indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*chip));
   521		if (!indio_dev)
   522			return -ENOMEM;
   523		chip = iio_priv(indio_dev);
   524	
   525		if (client->dev.of_node)
 > 526			chip->type = (enum nct720x_chips)device_get_match_data(&client->dev);
   527		else
   528			chip->type = i2c_match_id(nct720x_id, client)->driver_data;
   529	
   530		chip->vin_max = (chip->type == nct7201) ? NCT7201_VIN_MAX : NCT7202_VIN_MAX;
   531	
   532		ret = of_property_read_u32(client->dev.of_node, "read-vin-data-size", &tmp);
   533		if (ret < 0) {
   534			pr_err("read-vin-data-size property not found\n");
   535			return ret;
   536		}
   537	
   538		if (tmp == 8) {
   539			chip->use_read_byte_vin = true;
   540		} else if (tmp == 16) {
   541			chip->use_read_byte_vin = false;
   542		} else {
   543			pr_err("invalid read-vin-data-size (%d)\n", tmp);
   544			return -EINVAL;
   545		}
   546	
   547		mutex_init(&chip->access_lock);
   548	
   549		/* this is only used for device removal purposes */
   550		i2c_set_clientdata(client, indio_dev);
   551	
   552		chip->client = client;
   553	
   554		ret = nct720x_init_chip(chip);
   555		if (ret < 0)
   556			return ret;
   557	
   558		indio_dev->name = id->name;
   559		indio_dev->channels = nct720x_channels;
   560		indio_dev->num_channels = ARRAY_SIZE(nct720x_channels);
   561		indio_dev->info = &nct720x_info;
   562		indio_dev->modes = INDIO_DIRECT_MODE;
   563	
   564		iio_device_register(indio_dev);
   565	
   566		return 0;
   567	}
   568	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
