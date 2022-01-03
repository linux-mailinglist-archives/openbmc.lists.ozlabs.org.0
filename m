Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9B44830E4
	for <lists+openbmc@lfdr.de>; Mon,  3 Jan 2022 13:13:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JSF5K5MMzz308J
	for <lists+openbmc@lfdr.de>; Mon,  3 Jan 2022 23:13:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.37.156; helo=8.mo552.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 8743 seconds by postgrey-1.36 at boromir;
 Mon, 03 Jan 2022 23:13:08 AEDT
Received: from 8.mo552.mail-out.ovh.net (8.mo552.mail-out.ovh.net
 [46.105.37.156])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JSF500p3fz2yY0
 for <openbmc@lists.ozlabs.org>; Mon,  3 Jan 2022 23:13:05 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.93])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 0591921284;
 Mon,  3 Jan 2022 09:47:19 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 3 Jan
 2022 10:47:18 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0068baf1245-61fa-44b9-9d80-a92a2f10c7f9,
 71ABFCEAB0EE88409933ED7B68EF8EFCD2601B88) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <1e9d57e3-873a-be84-e702-fcc0c4397602@kaod.org>
Date: Mon, 3 Jan 2022 10:47:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: i3c on Qemu
Content-Language: en-US
To: Patrick Venture <venture@google.com>, Troy Lee <leetroy@gmail.com>, Joe
 Komlodi <komlodi@google.com>
References: <CAO=notyNtux_jNWFsrYex_vkKxt_JEE=ATU-RrL=o7vmsEdEBA@mail.gmail.com>
 <CAN9Jwz0fLF+8_mSS8hSDOcAJVB_78zX3jwORd96ZAkCZNc5VnA@mail.gmail.com>
 <CAO=notzZOjCQdTiAXmve9ce5h-xNTH0L+dBQFTnOxNRkEe+5Yg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAO=notzZOjCQdTiAXmve9ce5h-xNTH0L+dBQFTnOxNRkEe+5Yg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d2e5098d-24c0-4c83-942b-5cc32c71f6c5
X-Ovh-Tracer-Id: 14278099670653045667
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudefuddgtdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekvdfgudevkeefkeeltdejteekvdegffegudetgeettdffjeefheekfeelffdtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehophgvnhgsmhgtsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
Cc: Hao Wu <wuhaotsh@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Patrick,


On 1/2/22 21:17, Patrick Venture wrote:
> Hi Troy,
> 
> 
> 
> On Wed, Dec 22, 2021 at 2:13 AM Troy Lee <leetroy@gmail.com <mailto:leetroy@gmail.com>> wrote:
> 
>     Hi Patrick,
> 
>     On Thu, Dec 9, 2021 at 3:02 AM Patrick Venture <venture@google.com <mailto:venture@google.com>> wrote:
>      >
>      > Hi all;
>      >
>      > With ast2600 and the nuvoton 8xx, we're seeing the introduction of i3c and I was curious if anyone on this list was already working on it for Aspeed or Qemu in general.
>      >
>      > Patrick
> 
>     I have submitted an initial commit for I3C with ast2600.
>     However, this isn't a real I3C model, and it is just good enough to
>     bring Aspeed SDK image up.
> 
>     https://patchwork.kernel.org/project/qemu-devel/list/?series=599257 <https://patchwork.kernel.org/project/qemu-devel/list/?series=599257>
> 
>     Thanks,
>     Troy Lee
> 
> 
> Thanks, I saw that and I think it probably fixes our bootloop issue when i3c is enabled.  My team will be working actively on real i3c support in the coming months as we continue building support for the next Nuvoton SoC and the ast2600.

What kind of devices are you using ?

Thanks,

C.
