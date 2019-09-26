Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AC5BEBCE
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 08:04:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46f4BZ6STGzDqnK
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 16:04:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.56.132; helo=17.mo5.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 60897 seconds by postgrey-1.36 at bilbo;
 Thu, 26 Sep 2019 16:03:47 AEST
Received: from 17.mo5.mail-out.ovh.net (17.mo5.mail-out.ovh.net
 [46.105.56.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46f49v41m8zDqjX
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 16:03:44 +1000 (AEST)
Received: from player787.ha.ovh.net (unknown [10.108.42.88])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id CF9B824FC86
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 07:55:12 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player787.ha.ovh.net (Postfix) with ESMTPSA id 21833A574304;
 Thu, 26 Sep 2019 05:55:08 +0000 (UTC)
Subject: Re: [PATCH linux dev-5.3 03/13] ARM: dts: aspeed: rainier: Enable MAC0
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <20190925124239.27897-1-clg@kaod.org>
 <20190925124239.27897-4-clg@kaod.org>
 <b7987fa8-c8a3-4927-88bc-5ee6774127b5@www.fastmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <2687bd74-920e-79f0-f93b-5073471abe45@kaod.org>
Date: Thu, 26 Sep 2019 07:55:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <b7987fa8-c8a3-4927-88bc-5ee6774127b5@www.fastmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5962765907044240134
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrfeefgddutdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 26/09/2019 03:19, Andrew Jeffery wrote:
> 
> 
> On Wed, 25 Sep 2019, at 22:12, Cédric Le Goater wrote:
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  arch/arm/boot/dts/aspeed-bmc-opp-rainier.dts | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-rainier.dts 
>> b/arch/arm/boot/dts/aspeed-bmc-opp-rainier.dts
>> index 5e5bc78bdce4..713dc64064ad 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-rainier.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-rainier.dts
>> @@ -475,3 +475,10 @@
>>  		spi-max-frequency = <100000000>;
>>  	};
>>  };
>> +
>> +&mac0 {
>> +	status = "okay";
>> +
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_rmii1_default>;
> 
> This looks like a shortcut to aid development under qemu?
> 

yes. I think Brad sent a new DTS update. We can drop this patch.

C.
