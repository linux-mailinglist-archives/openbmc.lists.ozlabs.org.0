Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CACDD123B83
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 01:26:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cwm045N4zDqSL
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 11:26:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47cHb23WtjzDq63
 for <openbmc@lists.ozlabs.org>; Tue, 17 Dec 2019 10:31:08 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Dec 2019 15:31:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,323,1571727600"; d="scan'208";a="205279892"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.147])
 ([10.7.153.147])
 by orsmga007.jf.intel.com with ESMTP; 16 Dec 2019 15:31:03 -0800
Subject: Re: [PATCH v11 14/14] hwmon: Add PECI dimmtemp driver
To: Guenter Roeck <linux@roeck-us.net>
References: <20191211194624.2872-1-jae.hyun.yoo@linux.intel.com>
 <20191211194624.2872-15-jae.hyun.yoo@linux.intel.com>
 <d75aaad9-ae07-feeb-966a-899ecfe9d4b3@roeck-us.net>
 <5ed9f292-e024-ffda-a1a8-870ba0f05c58@linux.intel.com>
 <20191216212120.GA12089@roeck-us.net>
 <c6ccb0ff-c0b4-86b2-1768-ba63713034a4@linux.intel.com>
 <20191216232720.GA17398@roeck-us.net>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <465ac2d4-c508-0e6d-93e8-e8d5c36b05d7@linux.intel.com>
Date: Mon, 16 Dec 2019 15:31:03 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191216232720.GA17398@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 18 Dec 2019 11:17:37 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>,
 Randy Dunlap <rdunlap@infradead.org>, Tomer Maimon <tmaimon77@gmail.com>,
 devicetree@vger.kernel.org, Frederic Barrat <fbarrat@linux.vnet.ibm.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Jason M Biils <jason.m.bills@linux.intel.com>,
 Eric Sandeen <sandeen@redhat.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Jonathan Corbet <corbet@lwn.net>, openbmc@lists.ozlabs.org,
 linux-doc@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
 "Bryant G . Ly" <bryantly@linux.vnet.ibm.com>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 David Kershner <david.kershner@unisys.com>, Wu Hao <hao.wu@intel.com>,
 linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Arnd Bergmann <arnd@arndb.de>, Philippe Ombredanne <pombredanne@nexb.com>,
 Johan Hovold <johan@kernel.org>, Tomohiro Kusumi <kusumi.tomohiro@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Stef van Os <stef.van.os@prodrive-technologies.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sagar Dharia <sdharia@codeaurora.org>, linux-arm-kernel@lists.infradead.org,
 Alan Cox <alan@linux.intel.com>, Juergen Gross <jgross@suse.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Darrick J . Wong" <darrick.wong@oracle.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 12/16/2019 3:27 PM, Guenter Roeck wrote:
> On Mon, Dec 16, 2019 at 02:17:34PM -0800, Jae Hyun Yoo wrote:
>> [...]
>>
>>>>>> +static int get_dimm_temp(struct peci_dimmtemp *priv, int dimm_no)
>>>>>> +{
>>>>>> +    int dimm_order = dimm_no % priv->gen_info->dimm_idx_max;
>>>>>> +    int chan_rank = dimm_no / priv->gen_info->dimm_idx_max;
>>>>>> +    struct peci_rd_pci_cfg_local_msg rp_msg;
>>>>>> +    u8  cfg_data[4];
>>>>>> +    int ret;
>>>>>> +
>>>>>> +    if (!peci_sensor_need_update(&priv->temp[dimm_no]))
>>>>>> +        return 0;
>>>>>> +
>>>>>> +    ret = read_ddr_dimm_temp_config(priv, chan_rank, cfg_data);
>>>>>> +    if (ret)
>>>>>> +        return ret;
>>>>>> +
>>>>>> +    priv->temp[dimm_no].value = cfg_data[dimm_order] * 1000;
>>>>>> +
>>>>>> +    switch (priv->gen_info->model) {
>>>>>> +    case INTEL_FAM6_SKYLAKE_X:
>>>>>> +        rp_msg.addr = priv->mgr->client->addr;
>>>>>> +        rp_msg.bus = 2;
>>>>>> +        /*
>>>>>> +         * Device 10, Function 2: IMC 0 channel 0 -> rank 0
>>>>>> +         * Device 10, Function 6: IMC 0 channel 1 -> rank 1
>>>>>> +         * Device 11, Function 2: IMC 0 channel 2 -> rank 2
>>>>>> +         * Device 12, Function 2: IMC 1 channel 0 -> rank 3
>>>>>> +         * Device 12, Function 6: IMC 1 channel 1 -> rank 4
>>>>>> +         * Device 13, Function 2: IMC 1 channel 2 -> rank 5
>>>>>> +         */
>>>>>> +        rp_msg.device = 10 + chan_rank / 3 * 2 +
>>>>>> +                 (chan_rank % 3 == 2 ? 1 : 0);
>>>>>> +        rp_msg.function = chan_rank % 3 == 1 ? 6 : 2;
>>>>>> +        rp_msg.reg = 0x120 + dimm_order * 4;
>>>>>> +        rp_msg.rx_len = 4;
>>>>>> +
>>>>>> +        ret = peci_command(priv->mgr->client->adapter,
>>>>>> +                   PECI_CMD_RD_PCI_CFG_LOCAL, &rp_msg);
>>>>>> +        if (rp_msg.cc != PECI_DEV_CC_SUCCESS)
>>>>>> +            ret = -EAGAIN;
>>>>>> +        if (ret)
>>>>>> +            return ret;
>>>>>> +
>>>>>> +        priv->temp_max[dimm_no] = rp_msg.pci_config[1] * 1000;
>>>>>> +        priv->temp_crit[dimm_no] = rp_msg.pci_config[2] * 1000;
>>>>>> +        break;
>>>>>> +    case INTEL_FAM6_SKYLAKE_XD:
>>>>>> +        rp_msg.addr = priv->mgr->client->addr;
>>>>>> +        rp_msg.bus = 2;
>>>>>> +        /*
>>>>>> +         * Device 10, Function 2: IMC 0 channel 0 -> rank 0
>>>>>> +         * Device 10, Function 6: IMC 0 channel 1 -> rank 1
>>>>>> +         * Device 12, Function 2: IMC 1 channel 0 -> rank 2
>>>>>> +         * Device 12, Function 6: IMC 1 channel 1 -> rank 3
>>>>>> +         */
>>>>>> +        rp_msg.device = 10 + chan_rank / 2 * 2;
>>>>>> +        rp_msg.function = (chan_rank % 2) ? 6 : 2;
>>>>>> +        rp_msg.reg = 0x120 + dimm_order * 4;
>>>>>> +        rp_msg.rx_len = 4;
>>>>>> +
>>>>>> +        ret = peci_command(priv->mgr->client->adapter,
>>>>>> +                   PECI_CMD_RD_PCI_CFG_LOCAL, &rp_msg);
>>>>>> +        if (rp_msg.cc != PECI_DEV_CC_SUCCESS)
>>>>>> +            ret = -EAGAIN;
>>>>>> +        if (ret)
>>>>>> +            return ret;
>>>>>> +
>>>>>> +        priv->temp_max[dimm_no] = rp_msg.pci_config[1] * 1000;
>>>>>> +        priv->temp_crit[dimm_no] = rp_msg.pci_config[2] * 1000;
>>>>>> +        break;
>>>>>> +    case INTEL_FAM6_HASWELL_X:
>>>>>> +    case INTEL_FAM6_BROADWELL_X:
>>>>>> +        rp_msg.addr = priv->mgr->client->addr;
>>>>>> +        rp_msg.bus = 1;
>>>>>> +        /*
>>>>>> +         * Device 20, Function 0: IMC 0 channel 0 -> rank 0
>>>>>> +         * Device 20, Function 1: IMC 0 channel 1 -> rank 1
>>>>>> +         * Device 21, Function 0: IMC 0 channel 2 -> rank 2
>>>>>> +         * Device 21, Function 1: IMC 0 channel 3 -> rank 3
>>>>>> +         * Device 23, Function 0: IMC 1 channel 0 -> rank 4
>>>>>> +         * Device 23, Function 1: IMC 1 channel 1 -> rank 5
>>>>>> +         * Device 24, Function 0: IMC 1 channel 2 -> rank 6
>>>>>> +         * Device 24, Function 1: IMC 1 channel 3 -> rank 7
>>>>>> +         */
>>>>>> +        rp_msg.device = 20 + chan_rank / 2 + chan_rank / 4;
>>>>>> +        rp_msg.function = chan_rank % 2;
>>>>>> +        rp_msg.reg = 0x120 + dimm_order * 4;
>>>>>> +        rp_msg.rx_len = 4;
>>>>>> +
>>>>>> +        ret = peci_command(priv->mgr->client->adapter,
>>>>>> +                   PECI_CMD_RD_PCI_CFG_LOCAL, &rp_msg);
>>>>>> +        if (rp_msg.cc != PECI_DEV_CC_SUCCESS)
>>>>>> +            ret = -EAGAIN;
>>>>>> +        if (ret)
>>>>>> +            return ret;
>>>>>> +
>>>>>> +        priv->temp_max[dimm_no] = rp_msg.pci_config[1] * 1000;
>>>>>> +        priv->temp_crit[dimm_no] = rp_msg.pci_config[2] * 1000;
>>>>>> +        break;
>>>>>> +    default:
>>>>>> +        return -EOPNOTSUPP;
>>>>>
>>>>> It looks like the sensors are created even on unsupported platforms,
>>>>> which would generate error messages whenever someone tries to read
>>>>> the attributes.
>>>>>
>>>>> There should be some code early on checking this, and the driver
>>>>> should not even instantiate if the CPU model is not supported.
>>>>
>>>> Actually, this 'default' case will not be happened because this driver
>>>> will be registered only when the CPU model is supported. The CPU model
>>>> checking code is in 'intel-peci-client.c' which is [11/14] of this
>>>> patch set.
>>>>
>>>
>>> That again assumes that both drivers will be modified in sync in the future.
>>> We can not make that assumption.
>>
>> As you said, both drivers must be modified in sync in the future because
>> each Intel CPU family uses different way of reading DIMM temperature.
>> In case if supported CPU checking code updated without making sync with
>> it, this driver will return the error.
>>
> 
> ... and in that situation the driver should not instantiate in the
> first place. Its probe function should return -ENODEV.

Got the point. I'll add the checking code even in this driver module
too.

Thanks a lot!

-Jae
