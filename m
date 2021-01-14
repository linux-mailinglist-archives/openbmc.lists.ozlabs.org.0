Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C69D2F55CB
	for <lists+openbmc@lfdr.de>; Thu, 14 Jan 2021 02:31:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGRbZ0KJ5zDsG2
	for <lists+openbmc@lfdr.de>; Thu, 14 Jan 2021 12:31:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=troy_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGRY85Zw7zDsFV
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2021 12:28:59 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 10E1MC3D014330;
 Thu, 14 Jan 2021 09:22:12 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 14 Jan
 2021 09:27:13 +0800
Date: Thu, 14 Jan 2021 01:27:10 +0000
From: Troy Lee <troy_lee@aspeedtech.com>
To: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 4/4] hwmon: Support Aspeed AST2600 PWM/Fan tachometer
Message-ID: <20210114012710.GA2151879@aspeedtech.com>
References: <20210113070850.1184506-5-troy_lee@aspeedtech.com>
 <202101131734.BEMXz6Wq-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <202101131734.BEMXz6Wq-lkp@intel.com>
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 10E1MC3D014330
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
Cc: "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Kernel test robot,
The 01/13/2021 17:48, kernel test robot wrote:
> Hi Troy,
> 
> Thank you for the patch! Perhaps something to improve:
> 
> [auto build test WARNING on hwmon/hwmon-next]
> [also build test WARNING on joel-aspeed/for-next v5.11-rc3 next-20210113]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Troy-Lee/hwmon-aspeed2600-pwm-tacho-Add-driver-support/20210113-151325
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
> config: sparc-randconfig-r021-20210113 (attached as .config)
> compiler: sparc-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/19a51124badf28349d26657b611da77d5dfba2f1
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Troy-Lee/hwmon-aspeed2600-pwm-tacho-Add-driver-support/20210113-151325
>         git checkout 19a51124badf28349d26657b611da77d5dfba2f1
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=sparc 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/hwmon/aspeed2600-pwm-tacho.c:581:5: warning: no previous prototype for 'aspeed_pwm_tacho_read' [-Wmissing-prototypes]
>      581 | int aspeed_pwm_tacho_read(struct device *dev, enum hwmon_sensor_types type,
>          |     ^~~~~~~~~~~~~~~~~~~~~
> >> drivers/hwmon/aspeed2600-pwm-tacho.c:615:5: warning: no previous prototype for 'aspeed_pwm_tacho_write' [-Wmissing-prototypes]
>      615 | int aspeed_pwm_tacho_write(struct device *dev, enum hwmon_sensor_types type,
>          |     ^~~~~~~~~~~~~~~~~~~~~~
Good catch, I'll fix it in v3 patch set.

> 
> 
> vim +/aspeed_pwm_tacho_read +581 drivers/hwmon/aspeed2600-pwm-tacho.c
> 
>    580	
>  > 581	int aspeed_pwm_tacho_read(struct device *dev, enum hwmon_sensor_types type,
>    582				u32 attr, int channel, long *val)
>    583	{
>    584		struct aspeed_pwm_tachometer_data *priv = dev_get_drvdata(dev);
>    585		long rpm;
>    586	
>    587		switch (type) {
>    588		case hwmon_pwm:
>    589			switch (attr) {
>    590			case hwmon_pwm_input:
>    591				*val = priv->pwm_channel[channel].falling;
>    592				break;
>    593			default:
>    594				return -EOPNOTSUPP;
>    595			}
>    596			break;
>    597		case hwmon_fan:
>    598			switch (attr) {
>    599			case hwmon_fan_input:
>    600				rpm = aspeed_get_fan_tach_ch_rpm(dev, priv, channel);
>    601				if (rpm < 0)
>    602					return rpm;
>    603				*val = rpm;
>    604				break;
>    605			default:
>    606				return -EOPNOTSUPP;
>    607			}
>    608			break;
>    609		default:
>    610			return -EOPNOTSUPP;
>    611		}
>    612		return 0;
>    613	}
>    614	
>  > 615	int aspeed_pwm_tacho_write(struct device *dev, enum hwmon_sensor_types type,
>    616				u32 attr, int channel, long val)
>    617	{
>    618		switch (type) {
>    619		case hwmon_pwm:
>    620			switch (attr) {
>    621			case hwmon_pwm_input:
>    622				return set_pwm(dev, channel, val);
>    623			default:
>    624				return -EOPNOTSUPP;
>    625			}
>    626			break;
>    627		default:
>    628			return -EOPNOTSUPP;
>    629		}
>    630		return -EOPNOTSUPP;
>    631	}
>    632	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

Thanks,
Troy Lee
