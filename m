Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2483CCBCB
	for <lists+openbmc@lfdr.de>; Mon, 19 Jul 2021 02:28:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GSjPK1kmpz30B2
	for <lists+openbmc@lfdr.de>; Mon, 19 Jul 2021 10:28:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GSjP116mRz2xfH;
 Mon, 19 Jul 2021 10:28:02 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10049"; a="190564038"
X-IronPort-AV: E=Sophos;i="5.84,250,1620716400"; 
 d="gz'50?scan'50,208,50";a="190564038"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2021 17:26:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,250,1620716400"; 
 d="gz'50?scan'50,208,50";a="430383203"
Received: from lkp-server01.sh.intel.com (HELO a467b34d8c10) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 18 Jul 2021 17:26:54 -0700
Received: from kbuild by a467b34d8c10 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1m5H7V-0000UK-QN; Mon, 19 Jul 2021 00:26:53 +0000
Date: Mon, 19 Jul 2021 08:26:23 +0800
From: kernel test robot <lkp@intel.com>
To: Eddie James <eajames@linux.ibm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] fsi: occ: Add dynamic debug to dump command and
 response
Message-ID: <202107190858.yGDBBH0y-lkp@intel.com>
References: <20210716151850.28973-4-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline
In-Reply-To: <20210716151850.28973-4-eajames@linux.ibm.com>
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
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, kbuild-all@lists.01.org,
 openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>,
 linux@roeck-us.net, linux-fsi@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eddie,

I love your patch! Yet something to improve:

[auto build test ERROR on hwmon/hwmon-next]
[also build test ERROR on linus/master v5.14-rc2 next-20210716]
[cannot apply to linux/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Eddie-James/OCC-fsi-and-hwmon-Set-sequence-number-in-submit-interface/20210718-103535
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
config: csky-randconfig-r014-20210718 (attached as .config)
compiler: csky-linux-gcc (GCC) 10.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/2501575bac95640481d86c6d27cd675055987aa8
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Eddie-James/OCC-fsi-and-hwmon-Set-sequence-number-in-submit-interface/20210718-103535
        git checkout 2501575bac95640481d86c6d27cd675055987aa8
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-10.3.0 make.cross ARCH=csky 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/fsi/fsi-occ.c: In function 'occ_putsram':
>> drivers/fsi/fsi-occ.c:372:3: error: implicit declaration of function 'DEFINE_DYNAMIC_DEBUG_METADATA' [-Werror=implicit-function-declaration]
     372 |   DEFINE_DYNAMIC_DEBUG_METADATA(ddm_occ_cmd, "OCC command");
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/fsi/fsi-occ.c:372:33: error: 'ddm_occ_cmd' undeclared (first use in this function)
     372 |   DEFINE_DYNAMIC_DEBUG_METADATA(ddm_occ_cmd, "OCC command");
         |                                 ^~~~~~~~~~~
   drivers/fsi/fsi-occ.c:372:33: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/fsi/fsi-occ.c:374:7: error: implicit declaration of function 'DYNAMIC_DEBUG_BRANCH' [-Werror=implicit-function-declaration]
     374 |   if (DYNAMIC_DEBUG_BRANCH(ddm_occ_cmd)) {
         |       ^~~~~~~~~~~~~~~~~~~~
   drivers/fsi/fsi-occ.c: In function 'fsi_occ_submit':
>> drivers/fsi/fsi-occ.c:584:33: error: 'ddm_occ_rsp' undeclared (first use in this function)
     584 |   DEFINE_DYNAMIC_DEBUG_METADATA(ddm_occ_rsp,
         |                                 ^~~~~~~~~~~
>> drivers/fsi/fsi-occ.c:586:33: error: 'ddm_occ_full_rsp' undeclared (first use in this function)
     586 |   DEFINE_DYNAMIC_DEBUG_METADATA(ddm_occ_full_rsp,
         |                                 ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/DEFINE_DYNAMIC_DEBUG_METADATA +372 drivers/fsi/fsi-occ.c

   315	
   316	static int occ_putsram(struct occ *occ, const void *data, ssize_t len,
   317			       u8 seq_no, u16 checksum)
   318	{
   319		size_t cmd_len, buf_len, resp_len, resp_data_len;
   320		u32 data_len = ((len + 7) / 8) * 8;	/* must be multiples of 8 B */
   321		__be32 *buf;
   322		u8 *byte_buf;
   323		int idx = 0, rc;
   324	
   325		cmd_len = (occ->version == occ_p10) ? 6 : 5;
   326	
   327		/*
   328		 * We use the same buffer for command and response, make
   329		 * sure it's big enough
   330		 */
   331		resp_len = OCC_SBE_STATUS_WORDS;
   332		cmd_len += data_len >> 2;
   333		buf_len = max(cmd_len, resp_len);
   334		buf = kzalloc(buf_len << 2, GFP_KERNEL);
   335		if (!buf)
   336			return -ENOMEM;
   337	
   338		/*
   339		 * Magic sequence to do SBE putsram command. SBE will transfer
   340		 * data to specified SRAM address.
   341		 */
   342		buf[0] = cpu_to_be32(cmd_len);
   343		buf[1] = cpu_to_be32(SBEFIFO_CMD_PUT_OCC_SRAM);
   344	
   345		switch (occ->version) {
   346		default:
   347		case occ_p9:
   348			buf[2] = cpu_to_be32(1);	/* Normal mode */
   349			buf[3] = cpu_to_be32(OCC_P9_SRAM_CMD_ADDR);
   350			break;
   351		case occ_p10:
   352			idx = 1;
   353			buf[2] = cpu_to_be32(OCC_P10_SRAM_MODE);
   354			buf[3] = 0;
   355			buf[4] = cpu_to_be32(OCC_P10_SRAM_CMD_ADDR);
   356			break;
   357		}
   358	
   359		buf[4 + idx] = cpu_to_be32(data_len);
   360		memcpy(&buf[5 + idx], data, len);
   361	
   362		byte_buf = (u8 *)&buf[5 + idx];
   363		/*
   364		 * Overwrite the first byte with our sequence number and the last two
   365		 * bytes with the checksum.
   366		 */
   367		byte_buf[0] = seq_no;
   368		byte_buf[len - 2] = checksum >> 8;
   369		byte_buf[len - 1] = checksum & 0xff;
   370	
   371		{
 > 372			DEFINE_DYNAMIC_DEBUG_METADATA(ddm_occ_cmd, "OCC command");
   373	
 > 374			if (DYNAMIC_DEBUG_BRANCH(ddm_occ_cmd)) {
   375				char prefix[64];
   376	
   377				snprintf(prefix, sizeof(prefix), "%s %s: cmd ",
   378					 dev_driver_string(occ->dev),
   379					 dev_name(occ->dev));
   380				print_hex_dump(KERN_DEBUG, prefix, DUMP_PREFIX_OFFSET,
   381					       16, 4, byte_buf, len, false);
   382			}
   383		}
   384	
   385		rc = sbefifo_submit(occ->sbefifo, buf, cmd_len, buf, &resp_len);
   386		if (rc)
   387			goto free;
   388	
   389		rc = sbefifo_parse_status(occ->sbefifo, SBEFIFO_CMD_PUT_OCC_SRAM,
   390					  buf, resp_len, &resp_len);
   391		if (rc)
   392			goto free;
   393	
   394		if (resp_len != 1) {
   395			dev_err(occ->dev, "SRAM write response length invalid: %zd\n",
   396				resp_len);
   397			rc = -EBADMSG;
   398		} else {
   399			resp_data_len = be32_to_cpu(buf[0]);
   400			if (resp_data_len != data_len) {
   401				dev_err(occ->dev,
   402					"SRAM write expected %d bytes got %zd\n",
   403					data_len, resp_data_len);
   404				rc = -EBADMSG;
   405			}
   406		}
   407	
   408	free:
   409		/* Convert positive SBEI status */
   410		if (rc > 0) {
   411			dev_err(occ->dev, "SRAM write returned failure status: %08x\n",
   412				rc);
   413			rc = -EBADMSG;
   414		}
   415	
   416		kfree(buf);
   417		return rc;
   418	}
   419	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--vkogqOf2sHV7VnPd
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--vkogqOf2sHV7VnPd--
