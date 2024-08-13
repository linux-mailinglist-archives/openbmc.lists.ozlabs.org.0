Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C28C94FF34
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2024 09:59:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wwFUN0pz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjkL16xDxz2yNf
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2024 17:59:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wwFUN0pz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjkKT4x6Mz2xDM
	for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2024 17:58:35 +1000 (AEST)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2ef27bfd15bso56500981fa.2
        for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2024 00:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723535910; x=1724140710; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2V3KFwhTBRCQs0TGLrZG9sPYqXcbuU/Y45R5EunYuwA=;
        b=wwFUN0pzrtZKx1v1B/AkkItCu/bMTRW6T15QutGtwufsFaEqD8/xam4UXHpj8ZEq2G
         9h1H5lpZKxuu9OHuZAXLnc8izs4a8LQnXSkZ9eF6YTEV3av6E1DH0bpATOiDUvduwyW6
         zETAXIqQjscgbe9kqTUMLPH3LBm4KTCKtrSj3xUZUEU5X5GN6Z4qT6Kjn89a3wU6LMls
         r2yoTfjccf3o60ZX2gA/U/V4z4kvwkFgEr73/tZUmYIVZxSU7k0iCwA2LfiyZMcDgjTg
         DseRlGgbReh+sDsOIXJFnpAOQOSlb/9bTpSvHTM94JLFtipEjQ0wadxZrXKVkclRAgQ0
         FN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723535910; x=1724140710;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2V3KFwhTBRCQs0TGLrZG9sPYqXcbuU/Y45R5EunYuwA=;
        b=VAg+ZZDDeDJerQrI09P41qn5xFNWPDq5RaCebAZjCsOhAR9dB3K5GlIs5t7GnI3frb
         Rl4QWa9pA4fTXQQ0RyPrRsyWBpEcaDcuy7GmdPRb6mvrDHYSXy2bHba84oM0ZRsBMp/X
         IEjONCYwQpy8bYkI8KCEBLWNOc3QD5DCZc2LYss5CEDvo5HYKRAqZMEDE/oZEKM8Z26R
         vM8+xwV++e1CnIh1PPfqkr9W6mgenvb92jVcpgao3NcK3WmfogrALXBFTv4kKLOh+H9J
         TN0yWNCO5Em1yw0ghRf+ape8BdHRFtgpis3kqqVo8TUakWoz0vB/nHTQI6D5FDgAk4nR
         yLMg==
X-Forwarded-Encrypted: i=1; AJvYcCUw8BUozXv91V0quDSCxB+1UsvtdlK2qCiOHhjkFgc7zIOxMUPa3u+MlmVBIhkzdQjfjE8cEPitfJIvfLKQfIrtTUJNyMfxBMA=
X-Gm-Message-State: AOJu0Yz76DEF/cK0pY1Zd8t/ryigRZcs4qkPpmwCStb21iDtA5EvTemN
	leK+3X2/+Jg4e8BY9EKMOi4zMA+Kb6SP1BbxRm5DVz7p93xzb7/upNZjkCu0i+A=
X-Google-Smtp-Source: AGHT+IF9WYmvKOwlQKiaI4MOt8VdhhGRxPabvxUzgi6ujf//nOdvuQDnJLjNlge/OPVP3D2pzLO+oQ==
X-Received: by 2002:a2e:be0d:0:b0:2f0:198e:cf86 with SMTP id 38308e7fff4ca-2f2b717f3dcmr18292341fa.33.1723535909795;
        Tue, 13 Aug 2024 00:58:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f3fa4653sm47963666b.51.2024.08.13.00.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 00:58:28 -0700 (PDT)
Date: Tue, 13 Aug 2024 10:58:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, warp5tw@gmail.com, tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
	avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
	venture@google.com, yuenn@google.com, benjaminfair@google.com,
	andi.shyti@kernel.org, wsa+renesas@sang-engineering.com,
	rand.sec96@gmail.com, kwliu@nuvoton.com, jjliu0@nuvoton.com,
	kfting@nuvoton.com
Subject: Re: [PATCH v1 5/7] drivers: i2c: use i2c frequency table
Message-ID: <d512d659-0891-4219-bc8c-bf272755e3d2@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807100244.16872-6-kfting@nuvoton.com>
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
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/warp5tw-gmail-com/i2c-npcm-correct-the-read-write-operation-procedure/20240807-182210
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240807100244.16872-6-kfting%40nuvoton.com
patch subject: [PATCH v1 5/7] drivers: i2c: use i2c frequency table
config: arm-randconfig-r073-20240812 (https://download.01.org/0day-ci/archive/20240813/202408130818.FgDP5uNm-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f86594788ce93b696675c94f54016d27a6c21d18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202408130818.FgDP5uNm-lkp@intel.com/

New smatch warnings:
drivers/i2c/busses/i2c-npcm7xx.c:1956 npcm_i2c_init_clk() error: buffer overflow 'smb_timing' 21 <= 21 (assuming for loop doesn't break)
drivers/i2c/busses/i2c-npcm7xx.c:1973 npcm_i2c_init_clk() error: buffer overflow 'smb_timing' 17 <= 21

Old smatch warnings:
drivers/i2c/busses/i2c-npcm7xx.c:752 npcm_i2c_slave_enable() error: buffer overflow 'npcm_i2caddr' 2 <= 9
drivers/i2c/busses/i2c-npcm7xx.c:1960 npcm_i2c_init_clk() error: buffer overflow 'smb_timing' 21 <= 21 (assuming for loop doesn't break)
drivers/i2c/busses/i2c-npcm7xx.c:1974 npcm_i2c_init_clk() error: buffer overflow 'smb_timing' 17 <= 21
drivers/i2c/busses/i2c-npcm7xx.c:1976 npcm_i2c_init_clk() error: buffer overflow 'smb_timing' 17 <= 21
drivers/i2c/busses/i2c-npcm7xx.c:1979 npcm_i2c_init_clk() error: buffer overflow 'smb_timing' 21 <= 21 (assuming for loop doesn't break)

vim +1956 drivers/i2c/busses/i2c-npcm7xx.c

56a1485b102ed1 Tali Perry          2020-05-27  1919  static int npcm_i2c_init_clk(struct npcm_i2c *bus, u32 bus_freq_hz)
56a1485b102ed1 Tali Perry          2020-05-27  1920  {
a946fe9698f261 Tyrone Ting         2024-08-07  1921  	struct  SMB_TIMING_T *smb_timing;
a946fe9698f261 Tyrone Ting         2024-08-07  1922  	u8   scl_table_cnt = 0, table_size = 0;
a946fe9698f261 Tyrone Ting         2024-08-07  1923  
56a1485b102ed1 Tali Perry          2020-05-27  1924  	u8   fast_mode = 0;
56a1485b102ed1 Tali Perry          2020-05-27  1925  	u32  src_clk_khz;
56a1485b102ed1 Tali Perry          2020-05-27  1926  	u32  bus_freq_khz;
56a1485b102ed1 Tali Perry          2020-05-27  1927  
56a1485b102ed1 Tali Perry          2020-05-27  1928  	src_clk_khz = bus->apb_clk / 1000;
56a1485b102ed1 Tali Perry          2020-05-27  1929  	bus_freq_khz = bus_freq_hz / 1000;
56a1485b102ed1 Tali Perry          2020-05-27  1930  	bus->bus_freq = bus_freq_hz;
56a1485b102ed1 Tali Perry          2020-05-27  1931  
a946fe9698f261 Tyrone Ting         2024-08-07  1932  	switch (bus_freq_hz) {
a946fe9698f261 Tyrone Ting         2024-08-07  1933  	case I2C_MAX_STANDARD_MODE_FREQ:
a946fe9698f261 Tyrone Ting         2024-08-07  1934  		smb_timing = SMB_TIMING_100KHZ;
a946fe9698f261 Tyrone Ting         2024-08-07  1935  		table_size = ARRAY_SIZE(SMB_TIMING_100KHZ);
a946fe9698f261 Tyrone Ting         2024-08-07  1936  		break;
a946fe9698f261 Tyrone Ting         2024-08-07  1937  	case I2C_MAX_FAST_MODE_FREQ:
a946fe9698f261 Tyrone Ting         2024-08-07  1938  		smb_timing = SMB_TIMING_400KHZ;
a946fe9698f261 Tyrone Ting         2024-08-07  1939  		table_size = ARRAY_SIZE(SMB_TIMING_400KHZ);
56a1485b102ed1 Tali Perry          2020-05-27  1940  		fast_mode = I2CCTL3_400K_MODE;
a946fe9698f261 Tyrone Ting         2024-08-07  1941  		break;
a946fe9698f261 Tyrone Ting         2024-08-07  1942  	case I2C_MAX_FAST_MODE_PLUS_FREQ:
a946fe9698f261 Tyrone Ting         2024-08-07  1943  		smb_timing = SMB_TIMING_1000KHZ;
a946fe9698f261 Tyrone Ting         2024-08-07  1944  		table_size = ARRAY_SIZE(SMB_TIMING_1000KHZ);
56a1485b102ed1 Tali Perry          2020-05-27  1945  		fast_mode = I2CCTL3_400K_MODE;
a946fe9698f261 Tyrone Ting         2024-08-07  1946  		break;
a946fe9698f261 Tyrone Ting         2024-08-07  1947  	default:
56a1485b102ed1 Tali Perry          2020-05-27  1948  		return -EINVAL;
56a1485b102ed1 Tali Perry          2020-05-27  1949  	}
56a1485b102ed1 Tali Perry          2020-05-27  1950  
a946fe9698f261 Tyrone Ting         2024-08-07  1951  	for (scl_table_cnt = 0 ; scl_table_cnt < table_size ; scl_table_cnt++)
a946fe9698f261 Tyrone Ting         2024-08-07  1952  		if (bus->apb_clk >= smb_timing[scl_table_cnt].core_clk)
a946fe9698f261 Tyrone Ting         2024-08-07  1953  			break;

The minimum smb_timing[scl_table_cnt].core_clk value is 10000000 or 20000000 so
I can't tell just from the context that we are always going to hit this break
statement.

a946fe9698f261 Tyrone Ting         2024-08-07  1954  
56a1485b102ed1 Tali Perry          2020-05-27  1955  	/* write sclfrq value. bits [6:0] are in I2CCTL2 reg */
a946fe9698f261 Tyrone Ting         2024-08-07 @1956  	iowrite8(FIELD_PREP(I2CCTL2_SCLFRQ6_0, smb_timing[scl_table_cnt].sclfrq & 0x7F),
                                                                                               ^^^^^^^^^^^^^^^^^^^^^^^^^

56a1485b102ed1 Tali Perry          2020-05-27  1957  		 bus->reg + NPCM_I2CCTL2);
56a1485b102ed1 Tali Perry          2020-05-27  1958  
56a1485b102ed1 Tali Perry          2020-05-27  1959  	/* bits [8:7] are in I2CCTL3 reg */
a946fe9698f261 Tyrone Ting         2024-08-07  1960  	iowrite8(fast_mode | FIELD_PREP(I2CCTL3_SCLFRQ8_7, (smb_timing[scl_table_cnt].sclfrq >> 7)
a946fe9698f261 Tyrone Ting         2024-08-07  1961  		 & 0x3),
56a1485b102ed1 Tali Perry          2020-05-27  1962  		 bus->reg + NPCM_I2CCTL3);
56a1485b102ed1 Tali Perry          2020-05-27  1963  
56a1485b102ed1 Tali Perry          2020-05-27  1964  	/* Select Bank 0 to access NPCM_I2CCTL4/NPCM_I2CCTL5 */
56a1485b102ed1 Tali Perry          2020-05-27  1965  	npcm_i2c_select_bank(bus, I2C_BANK_0);
56a1485b102ed1 Tali Perry          2020-05-27  1966  
56a1485b102ed1 Tali Perry          2020-05-27  1967  	if (bus_freq_hz >= I2C_MAX_FAST_MODE_FREQ) {
56a1485b102ed1 Tali Perry          2020-05-27  1968  		/*
56a1485b102ed1 Tali Perry          2020-05-27  1969  		 * Set SCL Low/High Time:
56a1485b102ed1 Tali Perry          2020-05-27  1970  		 * k1 = 2 * SCLLT7-0 -> Low Time  = k1 / 2
56a1485b102ed1 Tali Perry          2020-05-27  1971  		 * k2 = 2 * SCLLT7-0 -> High Time = k2 / 2
56a1485b102ed1 Tali Perry          2020-05-27  1972  		 */
a946fe9698f261 Tyrone Ting         2024-08-07 @1973  		iowrite8(smb_timing[scl_table_cnt].scllt, bus->reg + NPCM_I2CSCLLT);
a946fe9698f261 Tyrone Ting         2024-08-07  1974  		iowrite8(smb_timing[scl_table_cnt].sclht, bus->reg + NPCM_I2CSCLHT);
56a1485b102ed1 Tali Perry          2020-05-27  1975  
a946fe9698f261 Tyrone Ting         2024-08-07  1976  		iowrite8(smb_timing[scl_table_cnt].dbcnt, bus->reg + NPCM_I2CCTL5);
56a1485b102ed1 Tali Perry          2020-05-27  1977  	}
56a1485b102ed1 Tali Perry          2020-05-27  1978  
a946fe9698f261 Tyrone Ting         2024-08-07  1979  	iowrite8(smb_timing[scl_table_cnt].hldt, bus->reg + NPCM_I2CCTL4);
56a1485b102ed1 Tali Perry          2020-05-27  1980  
56a1485b102ed1 Tali Perry          2020-05-27  1981  	/* Return to Bank 1, and stay there by default: */
56a1485b102ed1 Tali Perry          2020-05-27  1982  	npcm_i2c_select_bank(bus, I2C_BANK_1);
56a1485b102ed1 Tali Perry          2020-05-27  1983  
56a1485b102ed1 Tali Perry          2020-05-27  1984  	return 0;
56a1485b102ed1 Tali Perry          2020-05-27  1985  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

