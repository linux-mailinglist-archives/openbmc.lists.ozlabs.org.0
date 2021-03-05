Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 457E832E049
	for <lists+openbmc@lfdr.de>; Fri,  5 Mar 2021 04:46:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsDDR2FTQz3cks
	for <lists+openbmc@lfdr.de>; Fri,  5 Mar 2021 14:46:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phytium.com.cn (client-ip=206.189.21.223;
 helo=zg8tmja2lje4os4yms4ymjma.icoremail.net;
 envelope-from=wangmin@phytium.com.cn; receiver=<UNKNOWN>)
X-Greylist: delayed 65447 seconds by postgrey-1.36 at boromir;
 Fri, 05 Mar 2021 14:46:06 AEDT
Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net
 (zg8tmja2lje4os4yms4ymjma.icoremail.net [206.189.21.223])
 by lists.ozlabs.org (Postfix) with SMTP id 4DsDDG15SRz30Ht
 for <openbmc@lists.ozlabs.org>; Fri,  5 Mar 2021 14:45:51 +1100 (AEDT)
Received: from LAPTOPS6JR0A6O (unknown [106.19.188.254])
 by c1app12 (Coremail) with SMTP id DAINCgD3DNJfqUFgBSa+BA--.56278S2;
 Fri, 05 Mar 2021 11:45:36 +0800 (CST)
From: <wangmin@phytium.com.cn>
To: "'Joel Stanley'" <joel@jms.id.au>
References: <!&!AAAAAAAAAAAuAAAAAAAAAO4CP8j4rjtAsuu29GjYeJQBAMO2jhD3dRHOtM0AqgC7tuYAAAAAAA4AABAAAAAmHSaeuedKS6yz7kuXUVsVAQAAAAA=@phytium.com.cn>
 <CACPK8XdL2JDQj_jiTDtfue_8sfrnrYQNje1JAti6LFPe8OvMcQ@mail.gmail.com>
In-Reply-To: <CACPK8XdL2JDQj_jiTDtfue_8sfrnrYQNje1JAti6LFPe8OvMcQ@mail.gmail.com>
Subject: [OpenBMC]: Porting OpenBMC to a aarch64 SoC
Date: Fri, 5 Mar 2021 11:45:35 +0800
Message-ID: <!&!AAAAAAAAAAAuAAAAAAAAAO4CP8j4rjtAsuu29GjYeJQBAMO2jhD3dRHOtM0AqgC7tuYAAAAAAA4AABAAAADDNGy2yn4WSZxZLduaJQMNAQAAAAA=@phytium.com.cn>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQF5Dsw/6UuH24DcYDHouqIBoAjvLQFLOfgoqyZe+gA=
Content-Language: zh-cn
X-CM-TRANSID: DAINCgD3DNJfqUFgBSa+BA--.56278S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY47k0a2IF6F4UM7kC6x804xWl14x267AK
 xVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
 A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j
 6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr
 1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY
 62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7V
 C2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4kE
 6xkIj40Ew7xC0wCY02Avz4vE14v_Gr4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
 v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
 1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
 AIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0D
 MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvf
 C2KfnxnUUI43ZEXa7IU0YiiDUUUUU==
X-Originating-IP: [106.19.188.254]
X-CM-SenderInfo: 5zdqwzdlq61x51wl3zoofrzhdfq/
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
Cc: 'OpenBMC Maillist' <openbmc@lists.ozlabs.org>,
 =?UTF-8?B?J+WImOWLh+m5jyc=?= <liuyongpeng@phytium.com.cn>,
 shuyiqi@phytium.com.cn
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,

I am sorry for my mistake, thank your correction. I had signed up to the
OpenBMC members list.

> I've moderated this one post through., but you will need to sign up to
the list for future posting.

I have a binary u-boot for the specific aarch64 SOC. However, I don't =
know how
to compile the u-boot together with kernel, initramfs into one image =
file. Are there
some manuals for compiling u-boot with kernel and intramfs?
=20
> You are trying to build u-boot for the ASPEED platform. This will not =
work.

Gratefully thanks.


