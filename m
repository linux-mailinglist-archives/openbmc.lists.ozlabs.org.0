Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0564FB16AF
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2019 01:33:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Tw823xkFzF52J
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2019 09:33:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Tw7K16rTzF51q
 for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2019 09:33:15 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Sep 2019 16:33:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; d="scan'208";a="190143579"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga006.jf.intel.com with ESMTP; 12 Sep 2019 16:33:11 -0700
Subject: Re: Need Help with IPMBBridgeD
To: Wilfred Smith <wilfredsmith@fb.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <912CAC67-60E0-4E6B-AB6E-375331089580@fb.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <7d7cf5bb-32c6-b6bb-c17f-88fb5a33c86b@linux.intel.com>
Date: Thu, 12 Sep 2019 16:33:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <912CAC67-60E0-4E6B-AB6E-375331089580@fb.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: "haiyue.wang@intel.com" <haiyue.wang@intel.com>,
 "eduval@amazon.com" <eduval@amazon.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 9/12/19 3:30 PM, Wilfred Smith wrote:
> I’m having great difficulty getting IPMB to work with IPMBBridgeD.
> 
> I have Haiyue’s patch, have enabled slave-mqueue in the .cfg file, have 
> written to enable the option (though ipmbbridged now does that itself).
> 
> I had it working at one point, but after rebooting can’t get back to 
> where I was…
> 
> Error I’m getting:
> 
> 
> Jan 01 01:06:32 tiogapass ipmbbridged[305]: 
> [[0;1;31m[[0;1;39m[[0;1;31mprocessI2cEvent: error getting response from 
> IPMI[[0m
> 

Generally this means phosphor-host-ipmid went out to lunch, but 
ipmbbridged is still working. I'd check to see if ipmid is still 
responsive over dbus.


> 
> Tiogapass.cfg:
> [wilfred@centos-linux-for-openbmc linux-aspeed]$ cat tiogapass.cfg
> CONFIG_SENSORS_TMP421=y
> CONFIG_SENSORS_MAX31785=y
> CONFIG_RTC_DRV_RV8803=y
> CONFIG_TCG_TPM=y
> CONFIG_TCG_TIS_I2C_INFINEON=y
> CONFIG_NCSI_OEM_CMD_GET_MAC=y
> CONFIG_I2C_SLAVE=y
> CONFIG_I2C_SLAVE_MQUEUE_MESSAGE_SIZE=120
> CONFIG_I2C_SLAVE_MQUEUE_QUEUE_SIZE=32
> CONFIG_I2C_SLAVE_MQUEUE=y
> 
> Linux-aspeed_%.bbappend:
> FILESEXTRAPATHS_prepend := "${THISDIR}/linux-aspeed:"
> SRC_URI += "file://tiogapass.cfg"
> SRC_URI += 
> "file://PATCHv7-1-3-dt-bindings-i2c-document-bindings-for-i2c-slave-mqueue.patch"
> SRC_URI += 
> "file://PATCHv7-2-3-i2c-slave-mqueue-add-a-slave-backend-to-receive-and-queue-messages.patch"
> SRC_URI += 
> "file://PATCHv7-3-3-Documentation-ABI-Add-i2c-slave-mqueue-sysfs-documentation.patch”
> 
> I have done echo slave-mqueue 0x1010 > /sys/bus/i2c/devices/i2c-5/new_device
> 
> For my busses of interest (4 and 9)
> 
> /usr/share/ipmbbridge/ipmb-channels.json:
> {
>    "channels": [
>      {
>        "type": "me",
>        "master-path": "/dev/i2c-4",
>        "slave-path": "/sys/bus/i2c/devices/4-1010/slave-mqueue",
>        "bmc-addr": 32,
>        "remote-addr": 44
>      },
>      {
>        "type": "ipmb",
>        "master-path": "/dev/i2c-9",
>        "slave-path": "/sys/bus/i2c/devices/9-1010/slave-mqueue",
>        "bmc-addr": 32,
>        "remote-addr": 96
>      }
>    ]
> }
