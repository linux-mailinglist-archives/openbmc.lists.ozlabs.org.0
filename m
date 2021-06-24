Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A54263B3094
	for <lists+openbmc@lfdr.de>; Thu, 24 Jun 2021 15:56:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9hW0400cz3bwT
	for <lists+openbmc@lfdr.de>; Thu, 24 Jun 2021 23:56:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=87.98.180.222; helo=9.mo52.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 7795 seconds by postgrey-1.36 at boromir;
 Thu, 24 Jun 2021 23:56:00 AEST
Received: from 9.mo52.mail-out.ovh.net (9.mo52.mail-out.ovh.net
 [87.98.180.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9hVm4XyLz306m
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jun 2021 23:55:58 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.206])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 3E93B282D5D;
 Thu, 24 Jun 2021 13:27:53 +0200 (CEST)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.10; Thu, 24 Jun
 2021 13:27:51 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0015701c4ec-efba-48bf-9e58-9cc8bceda126,
 87FFF127F4D1A87BA4F612A9540B9FF07284728A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 92.184.105.147
Subject: Re: [openbmc-qemu]: How does the aspeed-i2c driver in QEMU work?
To: www <ouyangxuan10@163.com>
References: <21591ab0.353f.17a3d1a85d2.Coremail.ouyangxuan10@163.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <96b19661-e1fb-b5e4-5bcb-2cc3f5fe46b6@kaod.org>
Date: Thu, 24 Jun 2021 13:27:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <21591ab0.353f.17a3d1a85d2.Coremail.ouyangxuan10@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 1aec1ee4-7445-4804-abf9-e99b00ee585d
X-Ovh-Tracer-Id: 7797982757809458074
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfeeghedggeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepohhuhigrnhhggihurghnuddtseduieefrdgtohhm
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Byron,

Please copy the openbmc mailing list or better the qemu-devel list for such
questions. 
 
On 6/24/21 10:19 AM, www wrote:
> hi Cédric Le Goater，
> 
> I see that you added the aspeed-i2c driver in QEMU. I have some questions about the running of QEMU：
> 
> When there is a function in BMC image that uses I2C to read information from EEPROM, I2C driver in image will set aspeed I2C register, send data to EEPROM and read information from EEPROM(Also read and write aspeeed I2C register). How does QEMU cooperate at this time?
> 
> There is an smbus_slave.c, aspeed_i2c.c. and smbus_eeprom.c in QEMU, how do they cooperate?

aspeed_i2c is the I2C controller model, it defines a set of busses for the 
Aspeed SoC. I2C devices are plugged into these busses in the *i2c_init()
routine of each machine (See file aspeed.c). A couple of these machines
(sonorapass, witherspoon ) have EEPROMS. Take a look at these. The I2C
protocol is modeled under the hw/i2c/core.c file, it links the devices
to the controller.

Cheers,

C.
