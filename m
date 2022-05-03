Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED65517EE1
	for <lists+openbmc@lfdr.de>; Tue,  3 May 2022 09:27:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kss460f6zz3bck
	for <lists+openbmc@lfdr.de>; Tue,  3 May 2022 17:27:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=188.165.58.48; helo=6.mo548.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 600 seconds by postgrey-1.36 at boromir;
 Tue, 03 May 2022 17:27:20 AEST
Received: from 6.mo548.mail-out.ovh.net (6.mo548.mail-out.ovh.net
 [188.165.58.48])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kss3r5fGxz2xBF
 for <openbmc@lists.ozlabs.org>; Tue,  3 May 2022 17:27:17 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.97])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id A39072013F;
 Tue,  3 May 2022 07:08:21 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Tue, 3 May 2022
 09:08:21 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G00639ce4f6f-e73a-463f-a254-00dadcdb17a4,
 F6B89E566DA044E9E2FB2CFEBB669705F2CEA7ED) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <4bb4745c-1e40-f42f-8929-aae5a3f03cbf@kaod.org>
Date: Tue, 3 May 2022 09:08:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v6 00/11] spi: spi-mem: Convert Aspeed SMC driver to
 spi-mem
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
References: <20220503060634.122722-1-clg@kaod.org>
 <CACPK8Xcoz6WzyHWV9pSibjGJFs-mBGuPheASsysKMTVv68YhLQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8Xcoz6WzyHWV9pSibjGJFs-mBGuPheASsysKMTVv68YhLQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 74259bd6-c9d1-4754-8197-0612312c0882
X-Ovh-Tracer-Id: 15340667707878837213
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeigdduudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepueevledvjeetgeetfeeiveeftefffedvvdeikeetveelfeeglefgueetvdefvdefnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehquhhitggpjhgrvghhhihoohesqhhuihgtihhntgdrtghomh
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

>> Tested on:
>>
>>   * OpenPOWER Palmetto (AST2400)
>>   * Facebook Wedge 100 BMC (AST2400) by Tao Ren <rentao.bupt@gmail.com>
>>   * Evaluation board (AST2500)
>>   * Inspur FP5280G2 BMC (AST2500) by John Wang <wangzq.jn@gmail.com>
>>   * Facebook Backpack CMM BMC (AST2500) by Tao Ren <rentao.bupt@gmail.com>
>>   * OpenPOWER Witherspoon (AST2500)
>>   * Evaluation board (AST2600 A0 and A3)
>>   * Rainier board (AST2600)
> 
> This is now the driver used in the dev-5.15 openbmc kernel tree. Thank
> you for all of your hard work Cédric.

We could also activate Quad IO support in the OpenBMC tree because
it includes the pinctrl fixes from Jae. That's what I use  :

   https://github.com/legoater/linux/commit/7c9cdf5d53ababb1908c2ad727bac861c2c2aac9

Cheers,

C.
