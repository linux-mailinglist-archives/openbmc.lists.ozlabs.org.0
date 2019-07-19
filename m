Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 372E56E14A
	for <lists+openbmc@lfdr.de>; Fri, 19 Jul 2019 08:57:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qhdK25SYzDqpG
	for <lists+openbmc@lfdr.de>; Fri, 19 Jul 2019 16:57:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=zankapfel.net
 (client-ip=2a03:4000:6:113f:0:1ce:1ce:babe; helo=zankapfel.net;
 envelope-from=phil@zankapfel.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=zankapfel.net
X-Greylist: delayed 327 seconds by postgrey-1.36 at bilbo;
 Fri, 19 Jul 2019 16:56:35 AEST
Received: from zankapfel.net (zankapfel.net
 [IPv6:2a03:4000:6:113f:0:1ce:1ce:babe])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qhcg3WHxzDqgW
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jul 2019 16:56:35 +1000 (AEST)
Received: by zankapfel.net (Postfix, from userid 1000)
 id 302B511635D; Fri, 19 Jul 2019 08:50:57 +0200 (CEST)
Date: Fri, 19 Jul 2019 08:50:57 +0200
From: Phil Eichinger <phil@zankapfel.net>
To: openbmc@lists.ozlabs.org
Subject: Using fru-device with 16 Bit EEPROM
Message-ID: <20190719065057.nqqmecxbalvoszlo@zankapfel.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
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
Reply-To: Phil Eichinger <phil@zankapfel.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi *,

I was wondering if anyone is using fru-device from entity-manager with
EEPROMs that have 16 Bit addressing.
Initially I got an off-by-one error, I dumped the read header bytes and
they looked like they came from address 0x01.
I dug in a little deeper and I think there is an issue with the read
function - read_block_data() - for 16 Bit addressing.
I haven't verified it on a scope but I think the i2c_smbus API yields an
I2C transmission for every API call?

My EEPROM (Microchip 24C128) requires for random reads a 2 Byte write
with the higher address byte first - current implementation has it
vice-versa and split over 2 transactions.
From then on I can use the continuous read with auto address increment.

Is the current implementation written for a different EEPROM requiring
reading this way or is it just broken? In case of the latter I can send
a patch.

Why is there basically a user space driver for reading/writing EEPROMs
instead of using the interface in sysfs (ie.
/sys/devices/platform/ahb/ahb:apb/ahb:apb:bus@1e78a000/1e78a100.i2c-bus/i2c-3/3-0050/eeprom)?

Cheers,

Phil
-- 
