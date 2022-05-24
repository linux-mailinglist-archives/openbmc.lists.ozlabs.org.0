Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AEF5322F3
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 08:16:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6kVN0PmRz3046
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 16:16:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.54.81;
 helo=smtpout3.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from smtpout3.mo529.mail-out.ovh.net
 (smtpout3.mo529.mail-out.ovh.net [46.105.54.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6kV25nKpz2yp5
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 16:16:07 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.42])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 9706E1032B33A;
 Tue, 24 May 2022 08:16:01 +0200 (CEST)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 24 May
 2022 08:16:01 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002e7f341ee-6769-4781-a4ba-707574f05ebc,
 C5CD0474532894D1742A794F0F2627684C668774) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <a437566a-8371-2288-d5f5-121f5048a5ef@kaod.org>
Date: Tue, 24 May 2022 08:16:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Aspeed SPI driver upstreaming
Content-Language: en-US
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, Patrick Williams
 <patrick@stwcx.xyz>
References: <20200106232722.GB1233@patrickw3-mbp.dhcp.thefacebook.com>
 <31ec66fe-9ff9-b28b-3b83-a6c0a7959f30@kaod.org>
 <20200109164317.GE1233@patrickw3-mbp.dhcp.thefacebook.com>
 <20220516181824.ntp33kv75subztsa@cheese>
 <YogD2/rKlWGUrBjH@heinlein.stwcx.org.github.beta.tailscale.net>
 <20220524001007.k7ujvebqis6qftgh@cheese>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220524001007.k7ujvebqis6qftgh@cheese>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: af56ee29-9f41-418b-8760-5eb0269fa3cb
X-Ovh-Tracer-Id: 8656199960330406694
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrjedvgddutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhkeekkeevudduhfefffekvdfhieeuleefgfegvedvleefjeeukedtueelteetueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhoiihlrggsshdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghu
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
Cc: taoren@fb.com, openbmc@lists.ozlabs.org,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

On 5/24/22 02:10, Brad Bishop wrote:
> Thanks for the reply Patrick.
> 
> On Fri, May 20, 2022 at 04:10:51PM -0500, Patrick Williams wrote:
>> I don't know the details here.  There was some dispute between the MTD
>> maintainers and work that others were doing in this area that has made
>> it difficult for us to get additional patches in until someone refactors
>> the Aspeed driver how upstream wants.  (last I was aware)
> 
> Right, this work has just recently been done: https://lore.kernel.org/lkml/20220503060634.122722-1-clg@kaod.org/ (thanks Cedric, IBM, and anyone else that helped!)


The u-boot SPI flash driver is also going upstream :

   http://patchwork.ozlabs.org/project/uboot/list/?series=301700

and having some Tested-by would help.

Thanks,

C.

> 
>> I am not using the aspeed-spi driver in these conditions.  After
>> initially setting this up we did some testing with the TPM driver and
>> realized that it wasn't working.  It turns out that the Aspeed hardware
>> is incapable of bi-directional transactions (bytes going out MOSI and in
>> MISO at the same time), which is required by the TCG TPM protocol.
>> We've ended up having to use the GPIO-SPI bitbang driver for talking
>> with SPI-based TPMs.
> 
> Good to know!  Thanks for the information,
> 
> Brad

