Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A450808048
	for <lists+openbmc@lfdr.de>; Thu,  7 Dec 2023 06:41:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EihVrWtI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sm3721dZLz3ccN
	for <lists+openbmc@lfdr.de>; Thu,  7 Dec 2023 16:41:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EihVrWtI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sm36Q3PB0z2yN8
	for <openbmc@lists.ozlabs.org>; Thu,  7 Dec 2023 16:41:16 +1100 (AEDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40c09f5a7cfso6867565e9.0
        for <openbmc@lists.ozlabs.org>; Wed, 06 Dec 2023 21:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701927672; x=1702532472; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q7rmf1L5KTUW/E5oPwtLwfXb9Vg7b5uQANioC1qAwJQ=;
        b=EihVrWtI41zAviidPH1TMSqK8q7TtexniCvCIOOeYuPo8uEeFQyRM9H8l5h06Y6Zo+
         r7jMR7ncQFOflsMjdMqZblotuxiQccNFY0Rx+Z0Kb9oN5CQixuIl0D61naieC58PT14A
         AoDf+14GvtT3FwZ6ku3+t/6YwlXwEnC/gS77m69CN0gwzDn3YpaLOFxE1kneNnhmbppM
         KhlaHkmccpqwRJCqbaRl5wYZyQnQoG7TMpMZfbyaiw4Olf5fQ1lANFTqdehO1TUjZeBV
         wo7LPcWLZEXVeWRdUOMg7Z5vp9QEb82mCsiiGf3+L59zY6VDsZCGCSj6V5962EH2SmiQ
         BG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701927672; x=1702532472;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q7rmf1L5KTUW/E5oPwtLwfXb9Vg7b5uQANioC1qAwJQ=;
        b=ho4BmIQBCZTEy/eEm4r1Z2QqrrRLMJ4SQgko/Vt7DE1LTqwe9nbdC8/vU5DhkjpS5J
         hF/PBu4RET1ddxLreZly5rNzza9o9+uf081GI1JbEmqfWa5tE/1Z1G0WDzFtbWlsDBGT
         A31DSLJIHFA58BTvQQZdGtkL0RSJajEoL134+X7nKQEmXLO3U4XFqTxA/t7th4uibx/x
         b1vPYpYE3XSqbYmEgZXr/ZuwR2N9DmQR4V6upWAWsOeOkaPlqjW6Z2CjOICrjAYC+rY3
         FK9g54/jGsl201r+xDUfijdLPA2zAAV6Qk1zuCZO4Ot/1TqhL0qrIzNOt0bNrQe8vtJD
         uiCw==
X-Gm-Message-State: AOJu0YxZepg5TO3PzFSrMkHdB30CtF97Bi2Cgyk8nR+8r3HRKZjy+OC6
	TMmS2l+LXCTUoeZbKEMAnBr7Kg==
X-Google-Smtp-Source: AGHT+IFcYPRJ0wHa3HawHgZzyaOQdVMjkxX4/+Q/hkkoscjHk6GLpxarpmJZAW4lnnUanfaDDUCLLg==
X-Received: by 2002:a7b:cb95:0:b0:40b:5e59:ea01 with SMTP id m21-20020a7bcb95000000b0040b5e59ea01mr1260067wmi.160.1701927672414;
        Wed, 06 Dec 2023 21:41:12 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id je16-20020a05600c1f9000b00405442edc69sm702928wmb.14.2023.12.06.21.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 21:41:12 -0800 (PST)
Date: Thu, 7 Dec 2023 08:41:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, baneric926@gmail.com, jdelvare@suse.com,
	linux@roeck-us.net, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	corbet@lwn.net
Subject: Re: [PATCH v1 2/2] hwmon: Driver for Nuvoton NCT736X
Message-ID: <a62c8f0f-db3d-41da-b2a8-a064f0feba32@suswa.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204055650.788388-3-kcfeng0@nuvoton.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, kcfeng0@nuvoton.com, lkp@intel.com, linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, oe-kbuild-all@lists.linux.dev, kwliu@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/baneric926-gmail-com/dt-bindings-hwmon-Add-nct736x-bindings/20231204-135942
base:   linus/master
patch link:    https://lore.kernel.org/r/20231204055650.788388-3-kcfeng0%40nuvoton.com
patch subject: [PATCH v1 2/2] hwmon: Driver for Nuvoton NCT736X
config: m68k-randconfig-r071-20231207 (https://download.01.org/0day-ci/archive/20231207/202312071152.Kfcw1KlD-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231207/202312071152.Kfcw1KlD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312071152.Kfcw1KlD-lkp@intel.com/

smatch warnings:
drivers/hwmon/nct736x.c:367 nct736x_init_chip() error: uninitialized symbol 'gpio0_3'.
drivers/hwmon/nct736x.c:370 nct736x_init_chip() error: uninitialized symbol 'gpio4_7'.
drivers/hwmon/nct736x.c:373 nct736x_init_chip() error: uninitialized symbol 'gpio10_13'.
drivers/hwmon/nct736x.c:376 nct736x_init_chip() error: uninitialized symbol 'gpio14_17'.

vim +/gpio0_3 +367 drivers/hwmon/nct736x.c

16e62bcf3c9b93 Ban Feng 2023-12-04  335  static int nct736x_init_chip(struct i2c_client *client,
16e62bcf3c9b93 Ban Feng 2023-12-04  336  			     u32 pwm_mask, u32 fanin_mask, u32 wdt_cfg)
16e62bcf3c9b93 Ban Feng 2023-12-04  337  {
16e62bcf3c9b93 Ban Feng 2023-12-04  338  	const struct i2c_device_id *id = i2c_match_id(nct736x_id, client);
16e62bcf3c9b93 Ban Feng 2023-12-04  339  	u8 i, gpio0_3, gpio4_7, gpio10_13, gpio14_17;
16e62bcf3c9b93 Ban Feng 2023-12-04  340  	int ret;
16e62bcf3c9b93 Ban Feng 2023-12-04  341  
16e62bcf3c9b93 Ban Feng 2023-12-04  342  	for (i = 0; i < NCT736X_PWM_COUNT; i++) {
16e62bcf3c9b93 Ban Feng 2023-12-04  343  		if (i < 4) {
16e62bcf3c9b93 Ban Feng 2023-12-04  344  			if (pwm_mask & BIT_CHECK(i))
16e62bcf3c9b93 Ban Feng 2023-12-04  345  				gpio0_3 |= PWM_SEL(i);

This doesn't work.  gpio0_3 needs to be initialized to zero before we
can turn on individual bits.

16e62bcf3c9b93 Ban Feng 2023-12-04  346  			if (fanin_mask & BIT_CHECK(i))
16e62bcf3c9b93 Ban Feng 2023-12-04  347  				gpio10_13 |= FANIN_SEL(i);

Etc...

16e62bcf3c9b93 Ban Feng 2023-12-04  348  		} else if (i < 8) {
16e62bcf3c9b93 Ban Feng 2023-12-04  349  			if (pwm_mask & BIT_CHECK(i))
16e62bcf3c9b93 Ban Feng 2023-12-04  350  				gpio4_7 |= PWM_SEL(i);
16e62bcf3c9b93 Ban Feng 2023-12-04  351  			if (fanin_mask & BIT_CHECK(i))
16e62bcf3c9b93 Ban Feng 2023-12-04  352  				gpio14_17 |= FANIN_SEL(i);
16e62bcf3c9b93 Ban Feng 2023-12-04  353  		} else if (i < 12) {
16e62bcf3c9b93 Ban Feng 2023-12-04  354  			if (pwm_mask & BIT_CHECK(i))
16e62bcf3c9b93 Ban Feng 2023-12-04  355  				gpio10_13 |= PWM_SEL(i);
16e62bcf3c9b93 Ban Feng 2023-12-04  356  			if (fanin_mask & BIT_CHECK(i))
16e62bcf3c9b93 Ban Feng 2023-12-04  357  				gpio0_3 |= FANIN_SEL(i);
16e62bcf3c9b93 Ban Feng 2023-12-04  358  		} else {
16e62bcf3c9b93 Ban Feng 2023-12-04  359  			if (pwm_mask & BIT_CHECK(i))
16e62bcf3c9b93 Ban Feng 2023-12-04  360  				gpio14_17 |= PWM_SEL(i);
16e62bcf3c9b93 Ban Feng 2023-12-04  361  			if (fanin_mask & BIT_CHECK(i))
16e62bcf3c9b93 Ban Feng 2023-12-04  362  				gpio4_7 |= FANIN_SEL(i);
16e62bcf3c9b93 Ban Feng 2023-12-04  363  		}
16e62bcf3c9b93 Ban Feng 2023-12-04  364  	}
16e62bcf3c9b93 Ban Feng 2023-12-04  365  
16e62bcf3c9b93 Ban Feng 2023-12-04  366  	/* Pin Function Configuration */
16e62bcf3c9b93 Ban Feng 2023-12-04 @367  	ret = nct736x_write_reg(client, NCT736X_REG_GPIO_0_3, gpio0_3);
                                                                                                      ^^^^^^^

16e62bcf3c9b93 Ban Feng 2023-12-04  368  	if (ret < 0)
16e62bcf3c9b93 Ban Feng 2023-12-04  369  		return ret;
16e62bcf3c9b93 Ban Feng 2023-12-04 @370  	ret = nct736x_write_reg(client, NCT736X_REG_GPIO_4_7, gpio4_7);
16e62bcf3c9b93 Ban Feng 2023-12-04  371  	if (ret < 0)
16e62bcf3c9b93 Ban Feng 2023-12-04  372  		return ret;
16e62bcf3c9b93 Ban Feng 2023-12-04 @373  	ret = nct736x_write_reg(client, NCT736X_REG_GPIO_10_13, gpio10_13);
16e62bcf3c9b93 Ban Feng 2023-12-04  374  	if (ret < 0)
16e62bcf3c9b93 Ban Feng 2023-12-04  375  		return ret;
16e62bcf3c9b93 Ban Feng 2023-12-04 @376  	ret = nct736x_write_reg(client, NCT736X_REG_GPIO_14_17, gpio14_17);
16e62bcf3c9b93 Ban Feng 2023-12-04  377  	if (ret < 0)
16e62bcf3c9b93 Ban Feng 2023-12-04  378  		return ret;
16e62bcf3c9b93 Ban Feng 2023-12-04  379  
16e62bcf3c9b93 Ban Feng 2023-12-04  380  	/* PWM and FANIN Monitoring Enable */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

