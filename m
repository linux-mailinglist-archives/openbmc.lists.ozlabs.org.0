Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E3E78D36D
	for <lists+openbmc@lfdr.de>; Wed, 30 Aug 2023 08:55:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbFRV6nhbz3c2y
	for <lists+openbmc@lfdr.de>; Wed, 30 Aug 2023 16:55:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbFR94N7Cz2y1c
	for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2023 16:55:01 +1000 (AEST)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4RbFR861pXz4wy7;
	Wed, 30 Aug 2023 16:55:00 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RbFR504Fnz4wy4;
	Wed, 30 Aug 2023 16:54:56 +1000 (AEST)
Message-ID: <037e85aa-9d0a-f398-25a4-f23991c8942b@kaod.org>
Date: Wed, 30 Aug 2023 08:54:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: =?UTF-8?Q?Re=3a_=5bqemu=5d=3a_How_to_use_qemu_to_emulate_MCTP_Over_?=
 =?UTF-8?Q?SMBus_devices=ef=bc=9f?=
Content-Language: en-US
To: www <ouyangxuan10@163.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Klaus Jensen <its@irrelevant.dk>,
 Jeremy Kerr <jk@codeconstruct.com.au>
References: <673a6186.280a.18a449e0da2.Coremail.ouyangxuan10@163.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <673a6186.280a.18a449e0da2.Coremail.ouyangxuan10@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hello Byron,

On 8/30/23 06:05, www wrote:
> Dear Sir，
> 
> I have a few questions for you to ask.
> 1. According to my data collection, MCTP function should not be implemented in qemu.
> I would like to ask you how to simulate MCTP Over SMBus devices？Or do we have a device program with similar functions for reference?
> (The biggest problem with simulating MCTP Over SMBus devices is that there is a master-slave switch between request and response.
> It requires the device to actively respond to the requestor, that is, the device initiates the reply.)
> 
> 2. Among the BMC functions, the communication between the BMC and the OS is a very important and basic function.
> Is there a way to simulate the communication between BMC and OS to test device drivers and applications?
> If we want to implement this feature, how do we go about it?
> 
> I am looking forward to your reply.
> Byron

Initial support for MCTP over I2C is being discussed here :

   https://lore.kernel.org/qemu-devel/20230823-nmi-i2c-v4-0-2b0f86e5be25@samsung.com/

This is not my domain of expertise. So I am adding a few people who could help.

Thanks,

C.
