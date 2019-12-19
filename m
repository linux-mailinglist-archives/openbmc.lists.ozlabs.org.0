Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7C9126D6F
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2019 20:14:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47f1kw5ZckzDqkd
	for <lists+openbmc@lfdr.de>; Fri, 20 Dec 2019 06:14:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47f1jW3JRyzDqHF
 for <openbmc@lists.ozlabs.org>; Fri, 20 Dec 2019 06:12:44 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Dec 2019 11:12:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,333,1571727600"; d="scan'208";a="267307107"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Dec 2019 11:12:39 -0800
Subject: Re: Exposing sensors to IPMI over dbus
To: AKASH G J <akashgj91@gmail.com>, openbmc@lists.ozlabs.org
References: <CAE33tLFu8BVN0s0sf3AT9e9dkBEqhZ2xqMSotpCMwbO0Jia-iA@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <b8f62b3b-e18a-d6a0-f0c2-07e079bb301b@linux.intel.com>
Date: Thu, 19 Dec 2019 11:12:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAE33tLFu8BVN0s0sf3AT9e9dkBEqhZ2xqMSotpCMwbO0Jia-iA@mail.gmail.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 12/19/19 1:12 AM, AKASH G J wrote:
> Hi all,
> I am using OpenBMC firmware for server board having Aspeed AST-2500.
> 
> Followed 
> https://github.com/openbmc/entity-manager/blob/master/docs/my_first_sensors.md 
> for populating sensor value to dbus. Entity manager configuration file 
> is given below.
> {
>      "Exposes": [
>          {
>              "Address": "0x4f",
>              "Bus": 5,
>              "Name": "cpu0_vrd_temp",
>              "Thresholds": [
>                  {
>                      "Direction": "greater than",
>                      "Name": "upper critical",
>                      "Severity": 1,
>                      "Value": 80
>                  }
>              ],
>              "Type": "TMP75"
>          }
>      ],
>      "Name": "Rudra Baseboard",
>      "Probe": "xyz.openbmc_project.FruDevice({'PRODUCT_PRODUCT_NAME': 
> 'RUDRA'})",
>      "Type": "Board",
>      "xyz.openbmc_project.Inventory.Decorator.Asset": {
>          "Manufacturer": "$BOARD_MANUFACTURER",
>          "Model": "$BOARD_PRODUCT_NAME",
>          "PartNumber": "$BOARD_PART_NUMBER",
>          "SerialNumber": "$BOARD_SERIAL_NUMBER"
>      }
> }
> 
> Wrote sample FRU information on eeprom with the following content. Used 
> dd command for writing to eeprom.
> 
> root@s2600wf:/sys/bus/i2c/devices/3-0056# cat eeprom
> Product:
>    MANUFACTURER  "ABC"
>    PART_NUMBER   "12345"
>    PRODUCT_NAME  "SAMPLENAME"
>    SERIAL_NUMBER "12312490840"

This is not a legal IMPI FRU. FRU Device only allows legal fru based on 
the spec: 
https://www.intel.com/content/www/us/en/servers/ipmi/ipmi-platform-mgt-fru-infostorage-def-v1-0-rev-1-3-spec-update.html

For testing purposes using "Probe" : "TRUE" can be used as well.
> 
> The dbus tree not showing /xyz/openbmc_project/FruDevice/SAMPLENAME
> 
> root@s2600wf:~# busctl tree --no-pager xyz.openbmc_project.FruDevice
> `-/xyz
>    `-/xyz/openbmc_project
>      `-/xyz/openbmc_project/FruDevice
> 
> In journalctl log the following messages are printed.
> 
> systemd[1]: Started Hwmon Temp Sensor.
> hwmontempsensor[120]: Error communicating to entity manager
> hwmontempsensor[120]: error communicating to entity manager
> 
> Look like FruDevice daemon is not parsing the contents of eeprom and 
> publish them to dbus.
> 
> Is there any thing missing in configuration? Please help to resolve the 
> problem.
> 
> 
> 
> Thanks,
> 
> Akash
> 
