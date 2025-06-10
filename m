Return-Path: <openbmc+bounces-160-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E086AD4932
	for <lists+openbmc@lfdr.de>; Wed, 11 Jun 2025 05:06:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bH9Xk6sYpz30LS;
	Wed, 11 Jun 2025 13:06:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749551019;
	cv=none; b=jC4wKiXRzqxPTwdg6q/Q42Zn/o+MWy+NeqqM7sWpoghczgjHcph8tlSsVFMnf+vc43I4NhaOXVdqB3On7ZVyj466wnuItDmFNRtTzyKHjLJW1ulCUbK2jFGcMVfppC4IwafqGD5c6i1ootDqBT/ANT/gV65URvIloXneGHOJbzHFDF5bnMbxxPKFKrqUHGGxEFeynI9qWuCvHe/cksfvmLbDB2pXh9NBabjSJ1+5ZRIBgYLvQlG8xXSYY6oE65oUVq29xyDX20vTg7HXBVr3oL+W4DDA5C0dKoa2pMmWouViF69rny5qmAMKqk0NQlyQ0ph9Bko5YmHAKVzrZqy75g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749551019; c=relaxed/relaxed;
	bh=DUutOcR+/9wvxjwgfe9svQOQhm2Z69OugSaCtM/vUtg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oEgchzZoN/l98BMCnvNqXFcwh/5iRBMKkGybW2IR4A2YdQiaR6ouWGFaUiFl1zWthOhTXX/l/9tQzKVf9st+X0hZ6551Rm1O2jCTPCOWCE41GmBCPfZcrtCAb9gJACS6ywPpRkajJRdLBaQk+NLaL3DwJyEHsgp/MeoXN1rl41Cy2eMD6ysC26+aywEuVQRLm5OS1ux65XMLnIGL95ImOwzJkIIm7RGRgn9qxuXx1kcSzLkn++XiJvyidkiv5OQYXeSMiuknH0HXyheSgDAsYLEhi58S414vGE76Lc3qOGeFsxKHU6QVe7ugeh/HvJZdZHisHt7iEhahss/Ilbd0eQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass (client-ip=114.242.206.163; helo=mail.loongson.cn; envelope-from=zhoubinbin@loongson.cn; receiver=lists.ozlabs.org) smtp.mailfrom=loongson.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=loongson.cn (client-ip=114.242.206.163; helo=mail.loongson.cn; envelope-from=zhoubinbin@loongson.cn; receiver=lists.ozlabs.org)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGlHs2WWFz2xd3;
	Tue, 10 Jun 2025 20:23:35 +1000 (AEST)
Received: from loongson.cn (unknown [223.64.69.3])
	by gateway (Coremail) with SMTP id _____8DxQK8yB0hoQpgSAQ--.10995S3;
	Tue, 10 Jun 2025 18:21:38 +0800 (CST)
Received: from [127.0.0.1] (unknown [223.64.69.3])
	by front1 (Coremail) with SMTP id qMiowMDxOcQoB0hoWTcUAQ--.17S2;
	Tue, 10 Jun 2025 18:21:34 +0800 (CST)
Message-ID: <6ab83033-1349-4d5e-8d1f-8a13d851abf4@loongson.cn>
Date: Tue, 10 Jun 2025 18:21:27 +0800
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/35] mmc: sdhci: Use devm_mmc_alloc_host() helper
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen
 <chenhuacai@loongson.cn>, Ulf Hansson <ulf.hansson@linaro.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Huacai Chen
 <chenhuacai@kernel.org>, linux-mmc@vger.kernel.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Takao Orito <orito.takao@socionext.com>, Ben Dooks <ben-linux@fluff.org>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Kamal Dasu <kamal.dasu@broadcom.com>, Al Cooper <alcooperx@gmail.com>,
 Haibo Chen <haibo.chen@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 imx@lists.linux.dev, Avi Fishman <avifishman70@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org,
 Michal Simek <michal.simek@amd.com>, Joel Stanley <joel@jms.id.au>,
 linux-aspeed@lists.ozlabs.org, Aubin Constans
 <aubin.constans@microchip.com>, Eugen Hristev <eugen.hristev@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Yixun Lan <dlan@gentoo.org>,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 Hu Ziji <huziji@marvell.com>
References: <cover.1749127796.git.zhoubinbin@loongson.cn>
 <dcfce3ddf980563c590f82c1b4e8840c29497887.1749127796.git.zhoubinbin@loongson.cn>
 <t5caqkvguurw2dwzn7wkbjo5ryv3jp3eppjzhdwgx6q6vro2q2@onqqr6v3whdo>
From: Binbin Zhou <zhoubinbin@loongson.cn>
In-Reply-To: <t5caqkvguurw2dwzn7wkbjo5ryv3jp3eppjzhdwgx6q6vro2q2@onqqr6v3whdo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowMDxOcQoB0hoWTcUAQ--.17S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7WFWxKr47tF1xXryUXw13Awc_yoW8uw1rpa
	15Za48Cr4UWF45KrZrA3WjkFyvqw40qrWUK34fXw1rZF4jyryqqFZxCFWjvFn8Cr1UKa4I
	vF4kWF15CFy8AabCm3ZEXasCq-sJn29KB7ZKAUJUUUUt529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2kKe7AKxVWUtVW8ZwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
	XwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	kF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4U
	MxCIbckI1I0E14v26r1q6r43MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI
	0_JrI_JrWlx4CE17CEb7AF67AKxVWrXVW8Jr1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
	67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2
	IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jCMKZUUUUU=
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Thierry:

On 2025/6/10 17:42, Thierry Reding wrote:
> On Sat, Jun 07, 2025 at 03:33:34PM +0800, Binbin Zhou wrote:
>> Use new function devm_mmc_alloc_host() to simplify the code.
>>
>> Although sdhci_free_host() is no longer needed, to avoid drivers that still
>> use this function from failing to compile, sdhci_free_host() is temporarily
>> set to empty. Finally, it will be removed when there are no more callers.
>>
>> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
>> ---
>>   drivers/mmc/host/sdhci.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
>> index 32fa0b2bb912..ee5a5ae4db31 100644
>> --- a/drivers/mmc/host/sdhci.c
>> +++ b/drivers/mmc/host/sdhci.c
>> @@ -4076,7 +4076,7 @@ struct sdhci_host *sdhci_alloc_host(struct device *dev,
>>   
>>   	WARN_ON(dev == NULL);
>>   
>> -	mmc = mmc_alloc_host(sizeof(struct sdhci_host) + priv_size, dev);
>> +	mmc = devm_mmc_alloc_host(dev, sizeof(struct sdhci_host) + priv_size);
>>   	if (!mmc)
>>   		return ERR_PTR(-ENOMEM);
>>   
>> @@ -5002,7 +5002,6 @@ EXPORT_SYMBOL_GPL(sdhci_remove_host);
>>   
>>   void sdhci_free_host(struct sdhci_host *host)
>>   {
>> -	mmc_free_host(host->mmc);
>>   }
> Is there any point in keeping the sdhci_free_host() function around now?
> I only see patches 1 and 31, so not sure if anything happens in between.

To minimize email delivery failures, I handle each driver patch by 
sending it to the relevant person, while sending patches 0 and 1 to 
everyone.

Keeping sdhci_free_host() as suggested by Adrian[1] is to minimize 
disruption to the compilation process. We first set sdhci_free_host() to 
empty, and once all callers have been cleaned up, we will remove it[2].

Of course, perhaps I should also CC the final patch[2] to everyone, 
which would make the entire process clearer.

[1]: 
https://lore.kernel.org/all/78ffbae6-1c75-46ac-a5d7-bbc07bca1fd0@intel.com/

[2]: 
https://lore.kernel.org/all/8adcfef00fd4bc40f33f5fd42d2e5e73d72e68e4.1749127796.git.zhoubinbin@loongson.cn/


Thanks.
Binbin

>
> Thierry


