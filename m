Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B41BD1F53DF
	for <lists+openbmc@lfdr.de>; Wed, 10 Jun 2020 13:53:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hlkZ5HxLzDqPW
	for <lists+openbmc@lfdr.de>; Wed, 10 Jun 2020 21:53:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hljY4rLwzDq9b;
 Wed, 10 Jun 2020 21:52:42 +1000 (AEST)
IronPort-SDR: Emn5VVWJjqzp+t9B5SzrI0l+yeKD9D5MAhaXiEbrXCPol51eyyevOPnfEPpXNWB1tvPxtu9jAN
 7z42Krazg/7Q==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2020 04:52:38 -0700
IronPort-SDR: m07W9s8qi7gvX8ahY2DvKs3GNKRMngZE5v+IouKTmuhwh6AkV2un67vmwjLhaP2IBw3an43ns5
 FvD+eRLXMZcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,495,1583222400"; 
 d="gz'50?scan'50,208,50";a="314483165"
Received: from lkp-server01.sh.intel.com (HELO 19cb45ee048e) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 10 Jun 2020 04:52:34 -0700
Received: from kbuild by 19cb45ee048e with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jizHW-0000Ay-4L; Wed, 10 Jun 2020 11:52:34 +0000
Date: Wed, 10 Jun 2020 19:52:30 +0800
From: kernel test robot <lkp@intel.com>
To: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] hwmon:(adm1275) Enable adm1278 ADM1278_TEMP1_EN
Message-ID: <202006101902.n2cLXU4U%lkp@intel.com>
References: <20200610082611.GA14266@cnn>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="BXVAT5kNtrzKuDFl"
Content-Disposition: inline
In-Reply-To: <20200610082611.GA14266@cnn>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: kbuild-all@lists.01.org, manikandan.e@hcl.com,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, vijaykhemka@fb.com,
 saipsdasari@fb.com, patrickw3@fb.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Manikandan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on hwmon/hwmon-next]
[also build test WARNING on v5.7 next-20200609]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Manikandan-Elumalai/hwmon-adm1275-Enable-adm1278-ADM1278_TEMP1_EN/20200610-162820
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
config: alpha-randconfig-r035-20200608 (attached as .config)
compiler: alpha-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=alpha 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

drivers/hwmon/pmbus/adm1275.c: In function 'adm1275_probe':
>> drivers/hwmon/pmbus/adm1275.c:684:14: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
684 |   if (config & (ADM1278_VOUT_EN | ADM1278_TEMP1_EN) != ADM1278_VOUT_EN | ADM1278_TEMP1_EN) {
|              ^
>> drivers/hwmon/pmbus/adm1275.c:684:14: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
684 |   if (config & (ADM1278_VOUT_EN | ADM1278_TEMP1_EN) != ADM1278_VOUT_EN | ADM1278_TEMP1_EN) {

vim +684 drivers/hwmon/pmbus/adm1275.c

   464	
   465	static int adm1275_probe(struct i2c_client *client,
   466				 const struct i2c_device_id *id)
   467	{
   468		u8 block_buffer[I2C_SMBUS_BLOCK_MAX + 1];
   469		int config, device_config;
   470		int ret;
   471		struct pmbus_driver_info *info;
   472		struct adm1275_data *data;
   473		const struct i2c_device_id *mid;
   474		const struct coefficients *coefficients;
   475		int vindex = -1, voindex = -1, cindex = -1, pindex = -1;
   476		int tindex = -1;
   477		u32 shunt;
   478	
   479		if (!i2c_check_functionality(client->adapter,
   480					     I2C_FUNC_SMBUS_READ_BYTE_DATA
   481					     | I2C_FUNC_SMBUS_BLOCK_DATA))
   482			return -ENODEV;
   483	
   484		ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, block_buffer);
   485		if (ret < 0) {
   486			dev_err(&client->dev, "Failed to read Manufacturer ID\n");
   487			return ret;
   488		}
   489		if (ret != 3 || strncmp(block_buffer, "ADI", 3)) {
   490			dev_err(&client->dev, "Unsupported Manufacturer ID\n");
   491			return -ENODEV;
   492		}
   493	
   494		ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, block_buffer);
   495		if (ret < 0) {
   496			dev_err(&client->dev, "Failed to read Manufacturer Model\n");
   497			return ret;
   498		}
   499		for (mid = adm1275_id; mid->name[0]; mid++) {
   500			if (!strncasecmp(mid->name, block_buffer, strlen(mid->name)))
   501				break;
   502		}
   503		if (!mid->name[0]) {
   504			dev_err(&client->dev, "Unsupported device\n");
   505			return -ENODEV;
   506		}
   507	
   508		if (id->driver_data != mid->driver_data)
   509			dev_notice(&client->dev,
   510				   "Device mismatch: Configured %s, detected %s\n",
   511				   id->name, mid->name);
   512	
   513		config = i2c_smbus_read_byte_data(client, ADM1275_PMON_CONFIG);
   514		if (config < 0)
   515			return config;
   516	
   517		device_config = i2c_smbus_read_byte_data(client, ADM1275_DEVICE_CONFIG);
   518		if (device_config < 0)
   519			return device_config;
   520	
   521		data = devm_kzalloc(&client->dev, sizeof(struct adm1275_data),
   522				    GFP_KERNEL);
   523		if (!data)
   524			return -ENOMEM;
   525	
   526		if (of_property_read_u32(client->dev.of_node,
   527					 "shunt-resistor-micro-ohms", &shunt))
   528			shunt = 1000; /* 1 mOhm if not set via DT */
   529	
   530		if (shunt == 0)
   531			return -EINVAL;
   532	
   533		data->id = mid->driver_data;
   534	
   535		info = &data->info;
   536	
   537		info->pages = 1;
   538		info->format[PSC_VOLTAGE_IN] = direct;
   539		info->format[PSC_VOLTAGE_OUT] = direct;
   540		info->format[PSC_CURRENT_OUT] = direct;
   541		info->format[PSC_POWER] = direct;
   542		info->format[PSC_TEMPERATURE] = direct;
   543		info->func[0] = PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
   544				PMBUS_HAVE_SAMPLES;
   545	
   546		info->read_word_data = adm1275_read_word_data;
   547		info->read_byte_data = adm1275_read_byte_data;
   548		info->write_word_data = adm1275_write_word_data;
   549	
   550		switch (data->id) {
   551		case adm1075:
   552			if (device_config & ADM1275_IOUT_WARN2_SELECT)
   553				data->have_oc_fault = true;
   554			else
   555				data->have_uc_fault = true;
   556			data->have_pin_max = true;
   557			data->have_vaux_status = true;
   558	
   559			coefficients = adm1075_coefficients;
   560			vindex = 0;
   561			switch (config & ADM1075_IRANGE_MASK) {
   562			case ADM1075_IRANGE_25:
   563				cindex = 1;
   564				pindex = 3;
   565				break;
   566			case ADM1075_IRANGE_50:
   567				cindex = 2;
   568				pindex = 4;
   569				break;
   570			default:
   571				dev_err(&client->dev, "Invalid input current range");
   572				break;
   573			}
   574	
   575			info->func[0] |= PMBUS_HAVE_VIN | PMBUS_HAVE_PIN
   576			  | PMBUS_HAVE_STATUS_INPUT;
   577			if (config & ADM1275_VIN_VOUT_SELECT)
   578				info->func[0] |=
   579				  PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
   580			break;
   581		case adm1272:
   582			data->have_vout = true;
   583			data->have_pin_max = true;
   584			data->have_temp_max = true;
   585			data->have_power_sampling = true;
   586	
   587			coefficients = adm1272_coefficients;
   588			vindex = (config & ADM1275_VRANGE) ? 1 : 0;
   589			cindex = (config & ADM1272_IRANGE) ? 3 : 2;
   590			/* pindex depends on the combination of the above */
   591			switch (config & (ADM1275_VRANGE | ADM1272_IRANGE)) {
   592			case 0:
   593			default:
   594				pindex = 4;
   595				break;
   596			case ADM1275_VRANGE:
   597				pindex = 5;
   598				break;
   599			case ADM1272_IRANGE:
   600				pindex = 6;
   601				break;
   602			case ADM1275_VRANGE | ADM1272_IRANGE:
   603				pindex = 7;
   604				break;
   605			}
   606			tindex = 8;
   607	
   608			info->func[0] |= PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
   609				PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
   610	
   611			/* Enable VOUT if not enabled (it is disabled by default) */
   612			if (!(config & ADM1278_VOUT_EN)) {
   613				config |= ADM1278_VOUT_EN;
   614				ret = i2c_smbus_write_byte_data(client,
   615								ADM1275_PMON_CONFIG,
   616								config);
   617				if (ret < 0) {
   618					dev_err(&client->dev,
   619						"Failed to enable VOUT monitoring\n");
   620					return -ENODEV;
   621				}
   622			}
   623	
   624			if (config & ADM1278_TEMP1_EN)
   625				info->func[0] |=
   626					PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
   627			if (config & ADM1278_VIN_EN)
   628				info->func[0] |= PMBUS_HAVE_VIN;
   629			break;
   630		case adm1275:
   631			if (device_config & ADM1275_IOUT_WARN2_SELECT)
   632				data->have_oc_fault = true;
   633			else
   634				data->have_uc_fault = true;
   635			data->have_vout = true;
   636	
   637			coefficients = adm1275_coefficients;
   638			vindex = (config & ADM1275_VRANGE) ? 0 : 1;
   639			cindex = 2;
   640	
   641			if (config & ADM1275_VIN_VOUT_SELECT)
   642				info->func[0] |=
   643				  PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
   644			else
   645				info->func[0] |=
   646				  PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT;
   647			break;
   648		case adm1276:
   649			if (device_config & ADM1275_IOUT_WARN2_SELECT)
   650				data->have_oc_fault = true;
   651			else
   652				data->have_uc_fault = true;
   653			data->have_vout = true;
   654			data->have_pin_max = true;
   655	
   656			coefficients = adm1276_coefficients;
   657			vindex = (config & ADM1275_VRANGE) ? 0 : 1;
   658			cindex = 2;
   659			pindex = (config & ADM1275_VRANGE) ? 3 : 4;
   660	
   661			info->func[0] |= PMBUS_HAVE_VIN | PMBUS_HAVE_PIN
   662			  | PMBUS_HAVE_STATUS_INPUT;
   663			if (config & ADM1275_VIN_VOUT_SELECT)
   664				info->func[0] |=
   665				  PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
   666			break;
   667		case adm1278:
   668			data->have_vout = true;
   669			data->have_pin_max = true;
   670			data->have_temp_max = true;
   671			data->have_power_sampling = true;
   672	
   673			coefficients = adm1278_coefficients;
   674			vindex = 0;
   675			cindex = 1;
   676			pindex = 2;
   677			tindex = 3;
   678	
   679			info->func[0] |= PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
   680				PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
   681				PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
   682	
   683			/* Enable VOUT & TEMP1 if not enabled (disabled by default) */
 > 684			if (config & (ADM1278_VOUT_EN | ADM1278_TEMP1_EN) != ADM1278_VOUT_EN | ADM1278_TEMP1_EN) {
   685				config |= ADM1278_VOUT_EN | ADM1278_TEMP1_EN;
   686				ret = i2c_smbus_write_byte_data(client,
   687								ADM1275_PMON_CONFIG,
   688								config);
   689				if (ret < 0) {
   690					dev_err(&client->dev,
   691						"Failed to enable VOUT monitoring\n");
   692					return -ENODEV;
   693				}
   694			}
   695	
   696			if (config & ADM1278_VIN_EN)
   697				info->func[0] |= PMBUS_HAVE_VIN;
   698			break;
   699		case adm1293:
   700		case adm1294:
   701			data->have_iout_min = true;
   702			data->have_pin_min = true;
   703			data->have_pin_max = true;
   704			data->have_mfr_vaux_status = true;
   705			data->have_power_sampling = true;
   706	
   707			coefficients = adm1293_coefficients;
   708	
   709			voindex = 0;
   710			switch (config & ADM1293_VIN_SEL_MASK) {
   711			case ADM1293_VIN_SEL_012:	/* 1.2V */
   712				vindex = 0;
   713				break;
   714			case ADM1293_VIN_SEL_074:	/* 7.4V */
   715				vindex = 1;
   716				break;
   717			case ADM1293_VIN_SEL_210:	/* 21V */
   718				vindex = 2;
   719				break;
   720			default:			/* disabled */
   721				break;
   722			}
   723	
   724			switch (config & ADM1293_IRANGE_MASK) {
   725			case ADM1293_IRANGE_25:
   726				cindex = 3;
   727				break;
   728			case ADM1293_IRANGE_50:
   729				cindex = 4;
   730				break;
   731			case ADM1293_IRANGE_100:
   732				cindex = 5;
   733				break;
   734			case ADM1293_IRANGE_200:
   735				cindex = 6;
   736				break;
   737			}
   738	
   739			if (vindex >= 0)
   740				pindex = 7 + vindex * 4 + (cindex - 3);
   741	
   742			if (config & ADM1293_VAUX_EN)
   743				info->func[0] |=
   744					PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
   745	
   746			info->func[0] |= PMBUS_HAVE_PIN |
   747				PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT;
   748	
   749			break;
   750		default:
   751			dev_err(&client->dev, "Unsupported device\n");
   752			return -ENODEV;
   753		}
   754	
   755		if (voindex < 0)
   756			voindex = vindex;
   757		if (vindex >= 0) {
   758			info->m[PSC_VOLTAGE_IN] = coefficients[vindex].m;
   759			info->b[PSC_VOLTAGE_IN] = coefficients[vindex].b;
   760			info->R[PSC_VOLTAGE_IN] = coefficients[vindex].R;
   761		}
   762		if (voindex >= 0) {
   763			info->m[PSC_VOLTAGE_OUT] = coefficients[voindex].m;
   764			info->b[PSC_VOLTAGE_OUT] = coefficients[voindex].b;
   765			info->R[PSC_VOLTAGE_OUT] = coefficients[voindex].R;
   766		}
   767		if (cindex >= 0) {
   768			/* Scale current with sense resistor value */
   769			info->m[PSC_CURRENT_OUT] =
   770				coefficients[cindex].m * shunt / 1000;
   771			info->b[PSC_CURRENT_OUT] = coefficients[cindex].b;
   772			info->R[PSC_CURRENT_OUT] = coefficients[cindex].R;
   773		}
   774		if (pindex >= 0) {
   775			info->m[PSC_POWER] =
   776				coefficients[pindex].m * shunt / 1000;
   777			info->b[PSC_POWER] = coefficients[pindex].b;
   778			info->R[PSC_POWER] = coefficients[pindex].R;
   779		}
   780		if (tindex >= 0) {
   781			info->m[PSC_TEMPERATURE] = coefficients[tindex].m;
   782			info->b[PSC_TEMPERATURE] = coefficients[tindex].b;
   783			info->R[PSC_TEMPERATURE] = coefficients[tindex].R;
   784		}
   785	
   786		return pmbus_do_probe(client, id, info);
   787	}
   788	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--BXVAT5kNtrzKuDFl
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
6xIAyrBlTEisX1o7uFlte/sP2Ccx9K+gAQA=

--BXVAT5kNtrzKuDFl--
